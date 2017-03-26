!#/bin/bash

set -x 
USER_NAME=$1
ROOT=$(cd `dirname $0`/.. && pwd)
HOST_FILE=$ROOT/conf/host_file
SOURCE_FILE=$ROOT/source/hawq.tar.gz
USER_PATH=/home/$USER_NAME
SSH="ssh -o StrictHostKeyChecking=no"
SCP="scp -o StrictHostKeyChecking=no"
if [ "x$1" == "x" ]
then
	echo "Usage < a new user name>"
	exit 1
fi

## 读取配置文件中的所有host主机名，对于每个主机建立一个新的用户名

function create_username(){
	for HOST in `cat $HOST_FILE | awk '{print $1}'`
	do 
		$SSH $HOST useradd $USER_NAME ##用户存在怎么处理
		$SSH $HOST passwd $USER_NAME 
	done
}
##修改系统的内核变量
function edit_os(){
	for HOST in `cat $HOST_FILE | awk '{print $1}'`
        do
		$SSH $HOST << EOF  
			 cat $USER_PATH/conf/sysctl.conf >> /etc/sysctl.conf  
			 sysctl -p
			 cat $USER_PATH/conf/limits.conf >> /etc/security/limits.conf
EOF
        done

}
##按装必须的依赖,以下是对外网环境的操作，对于内网环境，请配置yum源
function add_rely(){
	for HOST in `cat $HOST_FILE | awk '{print $1}'`
        do
		$SSH $HOST yum install wget -y
        	$SSH $HOST wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
        	$SSH $HOST yum clean all
        	$SSH $HOST yum makecache
		$SSH $HOST wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
        	$SSH $HOST yum makecache
	 	$SSH $HOST yum install -y man passwd sudo tar which git mlocate links make bzip2 net-tools 
                           autoconf automake libtool m4 gcc gcc-c++ gdb bison flex gperf maven indent 
                           libuuid-devel krb5-devel libgsasl-devel expat-devel libxml2-devel 
                           perl-ExtUtils-Embed pam-devel python-devel libcurl-devel snappy-devel 
                           thrift-devel libyaml-devel libevent-devel bzip2-devel openssl-devel 
                           openldap-devel protobuf-devel readline-devel net-snmp-devel apr-devel 
                           libesmtp-devel xerces-c-devel python-pip json-c-devel libhdfs3-devel 
                           apache-ivy openssh-clients openssh-server perl-JSON 
 	done

}
## copy 相关文件到用户目录
function copy_file2user(){
	`cp $SOURCE_FILE $USER_PATH`
	tar_file=$USER_PATH/hawq.tar.gz
	tar zxvf $tar_file -C $USER_PATH
	## 更改一个文件的内容
	line="GPHOME=/home/$USER_NAME/hawq"
	line_num=1
	sed -i "$line_num s/lww/$USER_NAME/g" $USER_PATH/hawq/greenplum_path.sh
	chown -R $USER_NAME $USER_PATH/hawq
	chgrp -R $USER_NAME $USER_PATH/hawq
	bin_file=$ROOT/bin
	conf_file=$ROOT/conf
	cp -r $bin_file $USER_PATH
	chown -R $USER_NAME:$USER_NAME $USER_PATH/bin
	for HOST in `cat $HOST_FILE | awk '{print $1}'`
	do
		$SCP -r $conf_file $USER_NAME@$HOST:$USER_PATH
	        $SSH $HOST chown -R $USER_NAME:$USER_NAME $USER_PATH/conf
	done
}
create_username
copy_file2user
edit_os
add_rely
