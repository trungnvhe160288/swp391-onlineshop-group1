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
                Slider slider = new Slider(rs.getInt("id"), rs.getString("url"), rs.getString("title"), rs.getString("subTitle")
                        , rs.getDate("createAt"), rs.getDate("updateAt"), rs.getBoolean("isActive"));
                list.add(slider);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
