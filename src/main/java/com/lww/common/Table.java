package com.lww.common;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Table {
    public final String name;
    public final List<Column> columns;

    public Table(String name, String columns) {
        this.name = name;
        this.columns = new ArrayList<>();
        for (String col : columns.split(","))
            this.columns.add(Column.of(col));
    }

    public String insertQuery() {
        List<String> ks = new ArrayList<>();
        List<String> vs = new ArrayList<>();
        for (Column col : columns) {
            ks.add(col.name);
            vs.add("?");
        }
        return "INSERT INTO " + name + "(" + String.join(",", ks) + ") VALUES(" + String.join(",", vs) + ")";
    }

    public void setInsertData(PreparedStatement pstmt, Long pk) throws SQLException {
        for (int i = 0; i < columns.size(); ++i)
            pstmt.setObject(i + 1, columns.get(i).getValue(pk));
            pstmt.addBatch();
    }

}
