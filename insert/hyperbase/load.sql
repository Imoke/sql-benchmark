-------------------------------创建表----------------------------------
/*CREATE TABLE hyperbase_test
(
 key bigint,
ff1 double ,
ff2 double ,
sf1 string,
if1 int,
if2 int,
if3 int,
if4 int,
if5 int,
if6 int
) STORED AS HYPERDRIVE;*/

CREATE TABLE hyperbase_1000h
(
key bigint,
ff1 double ,
ff2 double ,
sf1 string,
if1 int,
if2 int,
if3 int,
if4 int,
if5 int,
if6 int
)STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ('hbase.columns.mapping'=':key,f:ff1,f:ff2,f:sf1,f:if1,f:if2,f:if3,f:if4,f:if5,f:if6');
---------------------------插入数据到表中-------------------------------
  insert into hyperbase_test(key,ff1,ff2,sf1,if1,if2,if3,if4,if5,if6) values(2,1.0,1.0,'er',1,1,1,1,1,1)

---------------创建索引--------------------------
CREATE GLOBAL INDEX hyperbase_1000w_if1_index ON hyperbase_1000w(
ff1(20),
ff2(20),
sf1(10),
if1(5)
)

在hbase shell中生成全局索引: rebuild_global_index 'test1.hyperbase_1000w', 'hyperbase_1000w_if1_index';

select USE_INDEX(hyperbase_1000w_alias USING hyperbase_1000w_if1_index)
from hyperbase_1000w hyperbase_1000w_alias
where