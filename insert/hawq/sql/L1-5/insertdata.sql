
--L1-1
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist1hawq_gpfdist1_1000w_a1',current_timestamp);
insert into hawq_gpfdist1_1000w_a select * from hawq_gpfdist1_1000w_a_ext1;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist1hawq_gpfdist1_1000w_a1', current_timestamp);

----L1-2

INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist1hawq_gpfdist1_1000w_a2',current_timestamp);
insert into hawq_gpfdist1_1000w_a select * from hawq_gpfdist1_1000w_a_ext2;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist1hawq_gpfdist1_1000w_a2', current_timestamp);

----L1-3

INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist1hawq_gpfdist1_1000w_a3',current_timestamp);
insert into hawq_gpfdist1_1000w_a select * from hawq_gpfdist1_1000w_a_ext3;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist1hawq_gpfdist1_1000w_a3', current_timestamp);

----L1-4
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist1hawq_gpfdist1_1000w_a4',current_timestamp);
insert into hawq_gpfdist1_1000w_a select * from hawq_gpfdist1_1000w_a_ext4;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist1hawq_gpfdist1_1000w_a4', current_timestamp);

----L1-5
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist1hawq_gpfdist1_1000w_a5',current_timestamp);
insert into hawq_gpfdist1_1000w_a select * from hawq_gpfdist1_1000w_a_ext5;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist1hawq_gpfdist1_1000w_a5', current_timestamp);


--L2
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist1_1000w_b',current_timestamp);
insert into hawq_gpfdist1_1000w_b select * from hawq_gpfdist1_1000w_b_ext;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist1_1000w_b', current_timestamp);


--L3
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist1_1yi',current_timestamp);
insert into hawq_gpfdist1_1yi select * from hawq_gpfdist1_1yi_ext;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist1_1yi', current_timestamp);

--L4
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist1_10yi',current_timestamp);
insert into hawq_gpfdist1_10yi select * from hawq_gpfdist1_10yi_ext;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist1_10yi', current_timestamp);

--L5
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist1_30yi',current_timestamp);
insert into hawq_gpfdist1_30yi select * from hawq_gpfdist1_30yi_ext;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist1_30yi', current_timestamp);

