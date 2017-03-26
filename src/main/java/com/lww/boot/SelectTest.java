package com.lww.boot;

import com.lww.common.Query;
import com.lww.common.QuerySet;
import com.lww.common.Util;
import com.lww.thread.SelectThread;

import java.io.IOException;
import java.util.Properties;


public class SelectTest {

    public static void main(String[] args) throws IOException, ClassNotFoundException {
        Properties p = Util.getProperties("select");

        int threadStart = Integer.parseInt(p.getProperty("thread.id.start"));
        int threadCount = Integer.parseInt(p.getProperty("thread.id.count"));
        int repeat = Integer.parseInt(p.getProperty("thread.repeat"));

        QuerySet querySet = new QuerySet(p, "query");

        for (Query q : querySet.getQueries())
            System.err.println(String.format("%s : %s", q.id, q.sql));

        for(int i = 0; i < threadCount; i++)
            new SelectThread(threadStart + i, querySet, repeat).start();
    }
}
