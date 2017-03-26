--L1
--L1-1
drop external table hawq_gpfdist1_1000w_a_ext1;
create external table hawq_gpfdist1_1000w_a_ext1
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int) 
 location('gpfdist://192.168.20.105:8081/w200w1.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;
--L1-2
drop external table hawq_gpfdist1_1000w_a_ext2;
create external table hawq_gpfdist1_1000w_a_ext2
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.105:8081/w200w2.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;
--L1-3
drop external table hawq_gpfdist1_1000w_a_ext3;
create external table hawq_gpfdist1_1000w_a_ext3
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.105:8081/w200w3.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;
--L1-4
drop external table hawq_gpfdist1_1000w_a_ext4;
create external table hawq_gpfdist1_1000w_a_ext4
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.105:8081/w200w4.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;
--L1-5
drop external table hawq_gpfdist1_1000w_a_ext5;
create external table hawq_gpfdist1_1000w_a_ext5
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.105:8081/w200w5.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;

--L2
drop external table hawq_gpfdist1_1000w_b_ext;
create external table hawq_gpfdist1_1000w_b_ext
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.105:8081/w1000w.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;
--L3
drop external table hawq_gpfdist1_1yi_ext;
create external table hawq_gpfdist1_1yi_ext
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.105:8081/w1yi.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;
--L4
drop external table hawq_gpfdist1_10yi_ext;
create external table hawq_gpfdist1_10yi_ext
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.105:8081/w10yi.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;
--L5
drop external table hawq_gpfdist1_30yi_ext;
create external table hawq_gpfdist1_30yi_ext
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.105:8081/w30yi.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;



