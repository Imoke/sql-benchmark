package com.lww.common;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;


public class Util {

    public static Properties getProperties(String name) throws IOException {
        if (!name.endsWith(".properties"))
            name = name + ".properties";
        Properties p = new Properties();
        p.load(ClassLoader.getSystemResourceAsStream(name));
        return p;
    }

    public static Connection getConn() throws IOException, ClassNotFoundException, SQLException {
        Properties p = getProperties("db");
        Class.forName(p.getProperty("driver"));
        return DriverManager.getConnection(p.getProperty("dbconnect"), p.getProperty("username"), p.getProperty("password"));
    }
}
