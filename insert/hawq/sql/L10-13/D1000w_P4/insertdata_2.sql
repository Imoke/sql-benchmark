INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist4_1000w_p4_2',current_timestamp);
insert into hawq_gpfdist4_1000w_p4 select * from hawq_gpfdist4_1000w_p4_ext2;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist4_1000w_p4_2', current_timestamp);

