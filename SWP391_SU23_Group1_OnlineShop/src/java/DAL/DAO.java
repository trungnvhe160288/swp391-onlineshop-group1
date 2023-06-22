/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Color;
import Models.Role;
import Models.Size;
import Ultils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO extends DBContext {

    public List<Color> getAllColor() {
        List<Color> list = new ArrayList<>();

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[bgr_hex]\n"
                    + "      ,[text_hex]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "  FROM [dbo].[colors]";

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Color color = new Color(rs.getInt("id"), rs.getString("name"), rs.getString("bgr_hex"), rs.getString("text_hex"),
                        rs.getDate("created_at"), rs.getDate("update_at"));
                list.add(color);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //getAllSize
    public List<Size> getAllSize() {
        List<Size> list = new ArrayList<>();

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "  FROM [dbo].[sizes]";

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Size size = new Size(rs.getInt("id"), rs.getString("name"), rs.getDate("created_at"), rs.getDate("update_at"));
                list.add(size);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[createAt]\n"
                    + "      ,[updateAt]\n"
                    + "      ,[isActive]\n"
                    + "  FROM [dbo].[Role]";

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Role role = new Role(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4), rs.getBoolean(5));
                list.add(role);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Size getSizeByID(int id) {

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "  FROM [dbo].[sizes]\n"
                    + "  WHERE id = ? ";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Size size = new Size(rs.getInt("id"), rs.getString("name"), rs.getDate("created_at"), rs.getDate("update_at"));
                return size;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Color getColorById(int id) {

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[bgr_hex]\n"
                    + "      ,[text_hex]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "  FROM [dbo].[colors]\n"
                    + "  WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Color color = new Color(rs.getInt("id"), rs.getString("name"), rs.getString("bgr_hex"), rs.getString("text_hex"),
                        rs.getDate("created_at"), rs.getDate("update_at"));
                return color;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Role getRoleById(int id) {
        

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[createAt]\n"
                    + "      ,[updateAt]\n"
                    + "      ,[isActive]\n"
                    + "  FROM [dbo].[Role]\n"
                    + "  WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Role role = new Role(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4), rs.getBoolean(5));
                return role;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
