/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Category;
import Ultils.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DBContext {

    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "  FROM [dbo].[categories]";

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category category = new Category(rs.getInt("id"), rs.getString("name"), rs.getDate("created_at"), rs.getDate("update_at"));

                list.add(category);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Category> getTopX(int x) {
        List<Category> list = new ArrayList<>();

        try {

            String sql = "SELECT TOP(?) [id]\n"
                    + "      ,[name]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "  FROM [dbo].[categories]";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, x);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category category = new Category(rs.getInt("id"), rs.getString("name"), rs.getDate("created_at"), rs.getDate("update_at"));

                list.add(category);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
