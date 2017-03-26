!#/bin/bash

set -x

ROOT=$(cd `dirname $0`/.. && pwd)
HOST_FILE=$ROOT/conf/host_file
SEG_FILE=$ROOT/conf/seg_hosts
MASTER_FILE=$ROOT/conf/master_hosts
USER_NAME=`whoami`
## 免密登陆
function no_passwd_login(){
        source $ROOT/hawq/greenplum_path.sh
        hawq ssh-exkeys -f $HOST_FILE
}
## 创建数据存储路径
function save_data_path(){
        source $ROOT/hawq/greenplum_path.sh
        hawq ssh -f $MASTER_FILE -e mkdir -p $ROOT/data/master
        hawq ssh -f $MASTER_FILE -e chown -R $USER_NAME $ROOT/data/master
        hawq ssh -f $SEG_FILE -e mkdir -p $ROOT/data/segment
        hawq ssh -f $SEG_FILE -e chown -R $USER_NAME $ROOT/data/segment
        hawq ssh -f $HOST_FILE -e mkdir -p $ROOT/data_tmp
}

## 修改配置文件
function change_file(){
	source $ROOT/hawq/greenplum_path.sh
	cp $ROOT/conf/hawq-site.xml $ROOT/conf/hdfs-client.xml $ROOT/hawq/etc/
	cp $SEG_FILE $ROOT/hawq/etc/
	mv $ROOT/hawq/etc/seg_hosts $ROOT/hawq/etc/slaves
}

## 分发hawq到各个节点
function sent_hawq(){
	source $ROOT/hawq/greenplum_path.sh
	for HOST in `cat $HOST_FILE | awk '{print $1}'`
	do
		scp -r $ROOT/hawq $USER_NAME@$HOST:$ROOT
	done
	hawq ssh -f $HOST_FILE -e "ls -l $GPHOME"
}
## 初始化集群
function setup_cluster(){
	hdfs dfs -mkdir /hawq_default
	hdfs dfs -chown $USER_NAME /hawq_default
	source $ROOT/hawq/greenplum_path.sh
	hawq init cluster
}
no_passwd_login
save_data_path
change_file
sent_hawq
setup_cluster
