drop table gpfdist_audit;
drop SEQUENCE gpfdist_audit_seq;
create SEQUENCE gpfdist_audit_seq INCREMENT BY 1 MINVALUE 1 NO MAXVALUE START WITH 1;

create table gpfdist_audit(
    id bigint,
    state text,
    mode text,
    tablename text,
    updatetime timestamp
) distributed by (id);

