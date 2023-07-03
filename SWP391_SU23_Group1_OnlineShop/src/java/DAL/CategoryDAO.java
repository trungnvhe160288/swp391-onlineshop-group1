/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Category;
import Ultils.Common;
import Ultils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//Getall
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

    public Category getCategoryByID(int id) {

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "  FROM [dbo].[categories]\n"
                    + "  WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Category(rs.getInt("id"), rs.getString("name"), rs.getDate("created_at"), rs.getDate("update_at"));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
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

    public boolean checkExits(String name) {

        try {

            String sql = "SELECT [id] FROM [dbo].[categories] WHERE name = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void add(String name) {
        try {

            String sql = "INSERT INTO [dbo].[categories] ([name], [created_at], [update_at])\n"
                    + "VALUES (?, ?, ?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDate(2, Common.getCurrentDate());
            ps.setDate(3, Common.getCurrentDate());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Category c) {
        try {

            String sql = "UPDATE [dbo].[categories]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[update_at] = ?\n"
                    + " WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setDate(2, Common.getCurrentDate());
            ps.setInt(3, c.getId());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
