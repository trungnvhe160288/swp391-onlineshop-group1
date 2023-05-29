/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.fptuniversity.swp391_su23_group1_onlineshop.config.Config;

/**
 *
 * @author trung
 */
public class ConnectionDB {

    public static Connection makeConnection() throws SQLException {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://" + Config.SERVER + ":" + Config.PORT_NUMBER
                    + "; databaseName=" + Config.DB_NAME;
            conn = DriverManager.getConnection(url, Config.DB_USERNAME, Config.DB_PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
