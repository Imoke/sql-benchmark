package com.lww.thread;





import com.lww.common.Query;
import com.lww.common.QuerySet;
import com.lww.common.Util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SelectThread extends Thread {

    private int id;
    private QuerySet querySet;
    private int repeat;

    public SelectThread(int id, QuerySet querySet, int repeat) {
        this.id = id;
        this.querySet = querySet;
        this.repeat = repeat;
    }

    @Override
    public void run() {
        try {
            Connection conn = Util.getConn();
            for (int i = 0; i < repeat; ++i) {
                long fts = System.currentTimeMillis();
                for (Query q : querySet.getQueries()) {
                    long ts = System.currentTimeMillis();
                    PreparedStatement pstmt = conn.prepareStatement(q.sql);
                    ResultSet rs = pstmt.executeQuery();
                    while (rs.next()) ;
                    pstmt.close();
                    long nt = System.currentTimeMillis();
                    System.out.println(String.format("TD%d|RD%d|QY%s|CT%d", id, i, q.id, nt - ts));
                }
                long fnt = System.currentTimeMillis();
                System.out.println(String.format("TD%d|RD%d|TT%d", id, i, fnt - fts));
            }
            conn.close();
        } catch (Throwable e) {
            System.out.println(String.format("Thread #%d failed", id));
            e.printStackTrace();
        }
    }
}
