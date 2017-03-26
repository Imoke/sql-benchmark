--L1
drop external table hawq_gpfdist4_1000w_p4_ext1;
create external table hawq_gpfdist4_1000w_p4_ext1
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.101:8081/w250w_1.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;



drop external table hawq_gpfdist4_1000w_p4_ext2;
create external table hawq_gpfdist4_1000w_p4_ext2
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.102:8081/w250w_2.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;


drop external table hawq_gpfdist4_1000w_p4_ext3;
create external table hawq_gpfdist4_1000w_p4_ext3
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.103:8081/w250w_3.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;


drop external table hawq_gpfdist4_1000w_p4_ext4;
create external table hawq_gpfdist4_1000w_p4_ext4
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.104:8081/w250w_4.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;

