-----------------------------
-----------------------------
-----------------------------
----分区表------------------
-----------------------------
-----------------------------

drop table if exists hawq_gpfdist4_1yi_p4;
CREATE TABLE hawq_gpfdist4_1yi_p4
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
) with (appendonly=true, orientation=parquet)
PARTITION BY RANGE (pk)
( START (0) INCLUSIVE
  END (100000000000) EXCLUSIVE
  EVERY (25000000000),
  DEFAULT PARTITION outpk
);

