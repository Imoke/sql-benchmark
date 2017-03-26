package com.lww.boot;




import com.lww.common.Table;
import com.lww.common.Util;
import com.lww.thread.InsertThread;

import java.io.IOException;
import java.util.Properties;


public class InsertTest {

    public static void main(String[] args) throws ClassNotFoundException, IOException {
        Properties p = Util.getProperties("insert");

        Table table = new Table(p.getProperty("table.name"), p.getProperty("table.columns"));

        int threadStart = Integer.parseInt(p.getProperty("thread.id.start"));
        int threadCount = Integer.parseInt(p.getProperty("thread.id.count"));
        int recordStart = Integer.parseInt(p.getProperty("thread.record.start"));
        int recordCount = Integer.parseInt(p.getProperty("thread.record.count"));
        int interval = Integer.parseInt(p.getProperty("thread.report.interval"));

        for(int i = 0; i < threadCount; i++)
            new InsertThread(threadStart + i, table, recordStart, recordCount, interval).start();
    }
}
