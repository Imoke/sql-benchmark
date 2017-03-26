
--L2
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist4_1000w_b',current_timestamp);
insert into hawq_gpfdist4_1000w_b select * from hawq_gpfdist4_1000w_b_ext;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist4_1000w_b', current_timestamp);


--L3
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist4_1yi',current_timestamp);
insert into hawq_gpfdist4_1yi select * from hawq_gpfdist4_1yi_ext;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist4_1yi', current_timestamp);

--L4
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist4_10yi',current_timestamp);
insert into hawq_gpfdist4_10yi select * from hawq_gpfdist4_10yi_ext;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist4_10yi', current_timestamp);

--L5
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist4_30yi',current_timestamp);
insert into hawq_gpfdist4_30yi select * from hawq_gpfdist4_30yi_ext;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist4_30yi', current_timestamp);

