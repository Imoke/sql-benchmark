INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'start', 'insert', 'hawq_gpfdist4_10yi_3',current_timestamp);
insert into hawq_gpfdist4_10yi select * from hawq_gpfdist4_10yi_ext3;
INSERT INTO gpfdist_audit VALUES(nextval('gpfdist_audit_seq'), 'end', 'insert', 'hawq_gpfdist4_10yi_3', current_timestamp);

