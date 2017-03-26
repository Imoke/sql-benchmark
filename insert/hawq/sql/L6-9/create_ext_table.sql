
--L6
drop external table hawq_gpfdist4_1000w_b_ext;
create external table hawq_gpfdist4_1000w_b_ext
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.105:8081/w250w.txt','gpfdist://192.168.20.104:8081/w250w.txt','gpfdist://192.168.20.103:8081/w250w.txt','gpfdist://192.168.20.102:8081/w250w.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;
--L7
drop external table hawq_gpfdist4_1yi_ext;
create external table hawq_gpfdist4_1yi_ext
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.105:8081/w2500w.txt','gpfdist://192.168.20.104:8081/w2500w.txt','gpfdist://192.168.20.103:8081/w2500w.txt','gpfdist://192.168.20.102:8081/w2500w.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;
--L8
drop external table hawq_gpfdist4_10yi_ext;
create external table hawq_gpfdist4_10yi_ext
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.105:8081/w25000w.txt','gpfdist://192.168.20.104:8081/w25000w.txt','gpfdist://192.168.20.103:8081/w25000w.txt','gpfdist://192.168.20.102:8081/w25000w.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;
--L9
drop external table hawq_gpfdist4_30yi_ext;
create external table hawq_gpfdist4_30yi_ext
 (pk bigint,ff1 double precision,ff2 double precision,sf1 text,if1 int,if2 int,if3 int,if4 int,if5 int,if6 int)
 location('gpfdist://192.168.20.105:8081/w75000w.txt','gpfdist://192.168.20.104:8081/w75000w.txt','gpfdist://192.168.20.103:8081/w75000w.txt','gpfdist://192.168.20.102:8081/w75000w.txt')
 format 'TEXT' (DELIMITER as '|' null as ''ESCAPE as 'OFF')
 ENCODING 'GB18030' LOG ERRORS INTO testfileload__err SEGMENT REJECT LIMIT 10;

