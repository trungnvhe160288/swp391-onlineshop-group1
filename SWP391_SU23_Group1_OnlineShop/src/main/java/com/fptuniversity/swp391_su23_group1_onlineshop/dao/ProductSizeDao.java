/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.dao;

import com.fptuniversity.swp391_su23_group1_onlineshop.model.Size;
import com.fptuniversity.swp391_su23_group1_onlineshop.util.ConnectionDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ProductSizeDao {

    public static ArrayList<Size> getAllProductSizeByProductId(int productId) {
        ArrayList<Size> sizeList = new ArrayList<>();

        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "SELECT sizes.id as id, name  FROM product_size \n"
                        + "LEFT JOIN sizes ON sizes.id = product_size.size_id\n"
                        + "WHERE sizes.deleted_at IS NULL AND product_size.product_id = " + productId;
                try ( Statement st = cn.createStatement();  ResultSet rs = st.executeQuery(sqlQuery)) {

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        Size size = new Size(id, name);
                        sizeList.add(size);
                    }

                }
            }

            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return sizeList;
    }
}
