package com.lww.common;


public class Query {
    public final String id;
    public final String sql;

    public Query(String id, String sql) {
        this.id = id;
        this.sql = sql;
    }
}
