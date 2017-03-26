

--L1
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist4_10yi_1',current_timestamp);
insert into hawq_gpfdist4_10yi select * from hawq_gpfdist4_10yi_ext1;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist4_10yi_1', current_timestamp);

