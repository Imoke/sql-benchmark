package com.lww.thread;





import com.lww.common.Table;
import com.lww.common.Util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;


public class InsertThread extends Thread {

    private int id;

    private Table table;
    private long start;
    private long count;
    private long interval;

    public InsertThread(int id, Table table, long start, long count, long interval) {
        this.id = id;
        this.table = table;
        this.start = start;
        this.count = count;
        this.interval = interval;
    }

    @Override
    public void run(){
        try {
            Connection conn = Util.getConn();
            conn.setAutoCommit(true); //关闭数据库的自动提交
            PreparedStatement pstmt = conn.prepareStatement(table.insertQuery());

            long ts = System.currentTimeMillis();
            long sts = ts;
            for (int i = 0; i < count; ++i) {
                table.setInsertData(pstmt, (start + i) * 1000 + id);
                //pstmt.executeUpdate();
                //pstmt.addBatch();
                if ((i + 1) % interval == 0) {
                    pstmt.executeBatch();
                    long nt = System.currentTimeMillis();
                    System.out.println(String.format("TD%d|RD%d|CT%d|TT%d", id, i / interval, nt - ts, nt - sts));
                    ts = nt;
                }
            }
            conn.commit();
            pstmt.close();
            conn.close();
        } catch (Throwable e) {
            System.out.println(String.format("Thread #%d failed", id));
            e.printStackTrace();
        }
    }

}
