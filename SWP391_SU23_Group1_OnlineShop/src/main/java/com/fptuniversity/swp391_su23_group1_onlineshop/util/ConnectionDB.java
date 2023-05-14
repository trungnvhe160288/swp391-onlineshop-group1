/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.fptuniversity.swp391_su23_group1_onlineshop.util.Config;

/**
 *
 * @author trung
 */
public class ConnectionDB {
    protected Connection connection;

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://" + Config.SERVER + ":" + Config.PORT_NUMBER 
                    + ";databaseName=" + Config.DB_NAME,
                    Config.DB_USERNAME, Config.DB_PASSWORD);
            System.out.println("Connect databse successfully");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
