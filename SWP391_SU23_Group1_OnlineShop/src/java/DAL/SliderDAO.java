/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Slider;
import Ultils.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//Slider
public class SliderDAO extends DBContext {
    //getAllSlider
    public List<Slider> getAll() {
        List<Slider> list = new ArrayList<>();

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[url]\n"
                    + "      ,[title]\n"
                    + "      ,[subTitle]\n"
                    + "      ,[createAt]\n"
                    + "      ,[updateAt]\n"
                    + "      ,[isActive]\n"
                    + "  FROM [dbo].[Slider]";

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Slider slider = new Slider(rs.getInt("id"), rs.getString("url"), rs.getString("title"), rs.getString("subTitle"),
                        rs.getDate("createAt"), rs.getDate("updateAt"), rs.getBoolean("isActive"));
                list.add(slider);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Slider getSliderById(int id) {

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[url]\n"
                    + "      ,[title]\n"
                    + "      ,[subTitle]\n"
                    + "      ,[createAt]\n"
                    + "      ,[updateAt]\n"
                    + "      ,[isActive]\n"
                    + "  FROM [dbo].[Slider]\n"
                    + "  WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Slider(rs.getInt("id"), rs.getString("url"), rs.getString("title"), rs.getString("subTitle"),
                        rs.getDate("createAt"), rs.getDate("updateAt"), rs.getBoolean("isActive"));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean update(Slider slider) {
        try {

            String sql = "UPDATE [dbo].[Slider]\n"
                    + "   SET [url] = ?\n"
                    + "      ,[title] = ?\n"
                    + "      ,[subTitle] = ?\n"
                    + "      ,[updateAt] = ?\n"
                    + "      ,[isActive] = ?\n"
                    + " WHERE id = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, slider.getUrl());
            st.setString(2, slider.getTitle());
            st.setString(3, slider.getSubTitle());
            st.setDate(4, slider.getUpdateAt());
            st.setBoolean(5, slider.isActive());
            st.setInt(6, slider.getId());

            st.executeUpdate();

            return true;

        } catch (SQLException e) {
            System.out.println(e);
            return false;

        }
    }

    public boolean add(Slider slider) {
        try {

            String sql = "INSERT INTO [dbo].[Slider] ([url], [title], [subTitle], [createAt], [updateAt], [isActive])\n"
                    + "VALUES	(?, ?, ?, ?, ?, ?)";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, slider.getUrl());
            st.setString(2, slider.getTitle());
            st.setString(3, slider.getSubTitle());
            st.setDate(4, slider.getCreateAt());
            st.setDate(5, slider.getUpdateAt());
            st.setBoolean(6, slider.isActive());

            st.executeUpdate();

            return true;

        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public Slider getLastSlider() {
        try {

            String sql = "SELECT TOP(1) [id]\n"
                    + "      ,[url]\n"
                    + "      ,[title]\n"
                    + "      ,[subTitle]\n"
                    + "      ,[createAt]\n"
                    + "      ,[updateAt]\n"
                    + "      ,[isActive]\n"
                    + "  FROM [dbo].[Slider]\n"
                    + "  ORDER BY id DESC";

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Slider(rs.getInt("id"), rs.getString("url"), rs.getString("title"), rs.getString("subTitle"),
                        rs.getDate("createAt"), rs.getDate("updateAt"), rs.getBoolean("isActive"));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
