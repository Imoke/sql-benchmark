
--L1 无索引，每次插入200万,5次
drop table hawq_gpfdist1_1000w_a;
CREATE TABLE hawq_gpfdist1_1000w_a
(
 pk bigint,
ff1 double precision,
ff2 double precision,
sf1 text,
if1 int,
if2 int,
if3 int,
if4 int,
if5 int,
if6 int
) with (appendonly=true, orientation=parquet, compresstype=gzip, compresslevel=8);

--L2 无索引，每次插入1000万,1次
drop table hawq_gpfdist1_1000w_b;
CREATE TABLE hawq_gpfdist1_1000w_b
(
 pk bigint,
ff1 double precision,
ff2 double precision,
sf1 text,
if1 int,
if2 int,
if3 int,
if4 int,
if5 int,
if6 int
) with (appendonly=true, orientation=parquet, compresstype=gzip, compresslevel=8);

--L3 无索引，每次插入1亿
drop table hawq_gpfdist1_1yi;
CREATE TABLE hawq_gpfdist1_1yi
(
 pk bigint,
ff1 double precision,
ff2 double precision,
sf1 text,
if1 int,
if2 int,
if3 int,
if4 int,
if5 int,
if6 int
) with (appendonly=true, orientation=parquet, compresstype=gzip, compresslevel=8);


--L4 无索引，每次插入10亿
drop table hawq_gpfdist1_10yi;
CREATE TABLE hawq_gpfdist1_10yi
(
 pk bigint,
ff1 double precision,
ff2 double precision,
sf1 text,
if1 int,
if2 int,
if3 int,
if4 int,
if5 int,
if6 int
) with (appendonly=true, orientation=parquet, compresstype=gzip, compresslevel=8);

--L5 无索引，每次插入30亿
drop table hawq_gpfdist1_30yi;
CREATE TABLE hawq_gpfdist1_30yi
(
 pk bigint,
ff1 double precision,
ff2 double precision,
sf1 text,
if1 int,
if2 int,
if3 int,
if4 int,
if5 int,
if6 int
) with (appendonly=true, orientation=parquet, compresstype=gzip, compresslevel=8);

