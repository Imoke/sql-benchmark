# HAWQ的自动化安装脚本
> author liuwang
## 1.使用前提
 - HAWQ建立在HDFS基础上，所以确保安装的节点有HDFS。
 - 使用时把编译好的HAWQ 包 hawq.tar.gz 放到`{$home}/source`路径下。
## 2.使用步骤
 - 确定要创建的用户（比如 `aaa`），然后修改`{$home}/conf`下的`hawq-site.xml`中与用户路径相关的配置。一共有四处，
分别对应的配置项为 `hawq_master_directory`,`hawq_segment_directory`,`hawq_master_temp_directory`,
`hawq_segment_temp_directory`,把值中的`lww`改为`aaa`即可。
 - 修改集群配置。在`{$home}/conf/host_file`中配置集群所有节点的主机名。在`{$home}/conf/master_hosts`中配置HAWQ
主节点的host。在`{$home}/conf/seg_hosts`中配置HAWQ segment节点的host。
 - 在root用户下启动脚本。`{$home}/bin/hawq_install.sh aaa`
 - 执行完上面的步骤后 `su aaa`用户,执行`{$home}/bin/user_host_setup.sh`。直到集群初始化成功。
## 3.集群测试
 - 在 `aaa` 用户的`{$home}/hawq`路径下执行`source greenplum_path.sh` 加载环境变量
 - 执行如下测试命令
```
psql -d postgres
create table t ( i int );
insert into t values(1);
insert into t select generate_series(1,10000);
select count(*) from t;
```

## 4.其他
```
根据需求对 {$home}/data/master/pg_hba.conf进行修改。这是一个关于权限和安全的文件 
```