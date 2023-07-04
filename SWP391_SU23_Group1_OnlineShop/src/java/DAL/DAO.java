/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Color;
import Models.Image;
import Models.Role;
import Models.Size;
import Ultils.Common;
import Ultils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO extends DBContext {

    //get all color
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
    //getAllRole
    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[createAt]\n"
                    + "      ,[updateAt]\n"
                    + "  FROM [dbo].[Role]";

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Role role = new Role(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
                list.add(role);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    //getSizeByID
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
                    + "  FROM [dbo].[Role]\n"
                    + "  WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Role role = new Role(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
                return role;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean updateColor(Color c) {

        try {

            String sql = "UPDATE [dbo].[colors]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[bgr_hex] = ?\n"
                    + "      ,[text_hex] = ?\n"
                    + "      ,[update_at] = ?\n"
                    + " WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getBgr_hex());
            ps.setString(3, c.getText_hex());
            ps.setDate(4, c.getUpdateAt());
            ps.setInt(5, c.getId());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean updateSize(Size s) {

        try {

            String sql = "UPDATE [dbo].[sizes]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[update_at] = ?\n"
                    + " WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setDate(2, s.getUpdateAt());
            ps.setInt(3, s.getId());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean updateRole(Role r) {

        try {

            String sql = "UPDATE [dbo].[Role]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[updateAt] = ?\n"
                    + " WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, r.getName());
            ps.setDate(2, r.getUpdateAt());
            ps.setInt(3, r.getId());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean checkNameColorExist(String name) {
        try {

            String sql = "SELECT [name] FROM [dbo].[colors] WHERE [name] = ?";

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

    public boolean checkNameSizeExist(String name) {
        try {

            String sql = "SELECT [name] FROM [dbo].[sizes] WHERE [name] = ?";

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

    public boolean checkNameRoleExist(String name) {
        try {

            String sql = "SELECT [name] FROM [dbo].[Role] WHERE [name] = ?";

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

    public boolean addColor(Color c) {
        try {

            String sql = "INSERT INTO [dbo].[colors] ([name],[bgr_hex],[text_hex],[created_at],[update_at])\n"
                    + "VALUES	(?, ?, ?, ?, ?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getBgr_hex());
            ps.setString(3, c.getText_hex());
            ps.setDate(4, c.getCreateAt());
            ps.setDate(5, c.getUpdateAt());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean addSize(Size s) {
        try {

            String sql = "INSERT INTO [dbo].[sizes] ([name], [created_at], [update_at])\n"
                    + "VALUES	(?, ?, ?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setDate(2, s.getCreateAt());
            ps.setDate(3, s.getUpdateAt());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean addRole(Role r) {
        try {

            String sql = "INSERT INTO [dbo].[Role] ([name], [createAt], [updateAt])\n"
                    + "VALUES	(?, ?, ?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, r.getName());
            ps.setDate(2, r.getCreateAt());
            ps.setDate(3, r.getUpdateAt());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public int getLastImageId() {
        try {

            String sql = "SELECT TOP(1) [id] FROM [dbo].[product_image] ORDER BY ID DESC";

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return -1;
    }

    public List<Image> getAllImages() {
        List<Image> list = new ArrayList<>();

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[image_url]\n"
                    + "      ,[product_id]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[product_image]";

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Image i = new Image(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4), rs.getDate(5), rs.getBoolean(6));
                list.add(i);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean updateStatus(int id, boolean status) {
        try {

            String sql = "UPDATE [dbo].[product_image]\n"
                    + "   SET [update_at] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, Common.getCurrentDate());
            ps.setBoolean(2, status);
            ps.setInt(3, id);

            ps.executeUpdate();

            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;

        }
    }

    public Image getImageById(int id) {
        try {

            String sql = "SELECT [id]\n"
                    + "      ,[image_url]\n"
                    + "      ,[product_id]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[product_image]\n"
                    + " WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Image i = new Image(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4), rs.getDate(5), rs.getBoolean(6));
                return i;
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return null;
    }

    public boolean updateImage(Image image) {
        try {

            String sql = "UPDATE [dbo].[product_image]\n"
                    + "   SET [update_at] = ?\n"
                    + "      ,[image_url] = ?\n"
                    + " WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, image.getUpdateAt());
            ps.setString(2, image.getUrl());
            ps.setInt(3, image.getId());

            ps.executeUpdate();

            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;

        }

    }

    public boolean addImage(Image image) {
        try {

            String sql = "INSERT INTO [dbo].[product_image]\n"
                    + "           ([image_url]\n"
                    + "           ,[product_id]\n"
                    + "           ,[created_at]\n"
                    + "           ,[update_at]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, image.getUrl());
            ps.setInt(2, image.getProduct_id());
            ps.setDate(3, image.getCreateAt());
            ps.setDate(4, image.getUpdateAt());
            ps.setBoolean(5, image.isStatus());

            ps.executeUpdate();

            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;

        }
    }
}
