/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.dao;

import com.fptuniversity.swp391_su23_group1_onlineshop.model.Color;
import com.fptuniversity.swp391_su23_group1_onlineshop.util.ConnectionDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ProductColorDao {

    public static ArrayList<Color> getAllProductColorByProductId(int productId) {
        ArrayList<Color> colorList = new ArrayList<>();

        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "SELECT colors.id as id, name , bgr_hex,text_hex FROM product_color \n"
                        + "LEFT JOIN colors ON colors.id = product_color.color_id\n"
                        + "WHERE colors.deleted_at IS NULL AND product_color.product_id = " + productId;
                try ( Statement st = cn.createStatement();  ResultSet rs = st.executeQuery(sqlQuery)) {

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String bgrHex = rs.getString("bgr_hex");
                        String textHex = rs.getString("text_hex");
                        Color color = new Color(id, name, bgrHex, textHex);
                        colorList.add(color);
                    }

                }
            }

            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return colorList;
    }
}
