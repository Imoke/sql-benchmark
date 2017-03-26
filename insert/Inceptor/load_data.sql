--测试inceptor 的插入数据性能，使用的是location的方式，把HDFS上的数据通过建立
--外表，然后通过外部表插入数据库表的形式完成。
--需要先在HDFS上创建目录/data,并且加入数据。

--beeline -u "jdbc:hive2://192.168.20.100:10000/test1"
--------------------建立外表------------------------------
CREATE EXTERNAL TABLE incepter_test1000w_ext
(
 pk bigint,
ff1 double ,
ff2 double ,
sf1 string,
if1 int,
if2 int,
if3 int,
if4 int,
if5 int,
if6 int
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
 STORED AS TEXTFILE LOCATION '/data/1000w/';

------------------创建内部表--------------------------------
CREATE TABLE incepter_test1000w
STORED AS orc
AS
SELECT * FROM incepter_test1000w_ext;

---------------索引表---------------
CREATE INDEX incepter_1yi_index ON TABLE incepter_1yi(pk)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler'
WITH deferred REBUILD
IN TABLE incepter_1yi_index_table;

----查看索引------------
show index on incepter_1yi;
------ 加载索引数据
alter index incepter_1yi_index on incepter_1yi rebuild;
-----删除索引
DROP INDEX ncepter_1yi_index on incepter_1yi;

------------------分区表--------------------
CREATE EXTERNAL TABLE incepter_1yi_part
(
 pk bigint,
ff1 double ,
ff2 double ,
sf1 string,
if1 int,
if2 int,
if3 int,
if4 int,
if5 int,
if6 int
) PARTITIONED BY RANGE (pkp bigint)(
PARTITION p1_250_80 VALUES LESS THAN (25000000000),
PARTITION p2_500_80 VALUES LESS THAN (50000000000),
PARTITION p3_700_80 VALUES LESS THAN (75000000000),
PARTITION p3_before_max VALUES LESS THAN (MAXVALUE)
);

insert overwrite table incepter_1yi_part partition(pkp) select * ,pk from incepter_1yi;

CREATE EXTERNAL TABLE incepter_10yi_part
(
 pk bigint,
ff1 double ,
ff2 double ,
sf1 string,
if1 int,
if2 int,
if3 int,
if4 int,
if5 int,
if6 int
) PARTITIONED BY RANGE (pkp bigint)(
PARTITION p1_100_80 VALUES LESS THAN (100000000000),
PARTITION p1_200_80 VALUES LESS THAN (200000000000),
PARTITION p1_300_80 VALUES LESS THAN (300000000000),
PARTITION p1_400_80 VALUES LESS THAN (400000000000),
PARTITION p1_500_80 VALUES LESS THAN (500000000000),
PARTITION p1_600_80 VALUES LESS THAN (600000000000),
PARTITION p1_700_80 VALUES LESS THAN (700000000000),
PARTITION p1_800_80 VALUES LESS THAN (800000000000),
PARTITION p2_900_80 VALUES LESS THAN (900000000000),
PARTITION p3_before_max VALUES LESS THAN (MAXVALUE)
);

insert overwrite table incepter_10yi_part partition(pkp) select * ,pk from incepter_10yi;

-------------holodesk------------------------------------
CREATE TABLE holodesk_1000w
(
 pk bigint,
ff1 double ,
ff2 double ,
sf1 string,
if1 int,
if2 int,
if3 int,
if4 int,
if5 int,
if6 int
) STORED AS HOLODESK;

CREATE TABLE holodesk_1000w STORED AS HOLODESK AS SELECT * FROM incepter_1000w;