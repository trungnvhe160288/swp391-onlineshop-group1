/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Blog;
import Ultils.Common;
import Ultils.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BlogDAO extends DBContext {

    public List<Blog> getPublishedBlog() {
        List<Blog> list = new ArrayList<>();

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[thumbnail_url]\n"
                    + "      ,[user_id]\n"
                    + "      ,[title]\n"
                    + "      ,[description]\n"
                    + "      ,[content]\n"
                    + "      ,[created_at]\n"
                    + "      ,[updateAt]\n"
                    + "      ,[isPublished]\n"
                    + "  FROM [dbo].[posts]\n"
                    + "  WHERE isPublished = 1";

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Blog blog = new Blog(rs.getInt("id"), rs.getString("thumbnail_url"), rs.getInt("user_id"), rs.getString("title"),
                        rs.getString("description"), rs.getString("content"), rs.getDate("created_at"), rs.getDate("updateAt"),
                        rs.getBoolean("isPublished"));

                list.add(blog);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getBlogByKey(String key) {
        List<Blog> list = new ArrayList<>();

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[thumbnail_url]\n"
                    + "      ,[user_id]\n"
                    + "      ,[title]\n"
                    + "      ,[description]\n"
                    + "      ,[content]\n"
                    + "      ,[created_at]\n"
                    + "      ,[updateAt]\n"
                    + "      ,[isPublished]\n"
                    + "  FROM [dbo].[posts]\n"
                    + "  WHERE isPublished = 1 ";
            
            if(!key.isEmpty()){
                sql += " AND title like '%" + key + "%' or description like'%" + key + "%' or content like '%" + key + "%'";
            }

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Blog blog = new Blog(rs.getInt("id"), rs.getString("thumbnail_url"), rs.getInt("user_id"), rs.getString("title"),
                        rs.getString("description"), rs.getString("content"), rs.getDate("created_at"), rs.getDate("updateAt"),
                        rs.getBoolean("isPublished"));

                list.add(blog);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getSize() {
        return getPublishedBlog().size();
    }

    public List<Blog> getRecentBlog() {
        List<Blog> list = getPublishedBlog();

        List<Blog> result = new ArrayList<>();

        int start = Common.getRandomNumber(0, list.size() - 4);
        int end = Common.getRandomNumber(start + 4, list.size() - 4);

        for (int i = start; i < end; i++) {
            result.add(list.get(i));
        }

        return result;
    }

    public Blog getBlogByID(int id) {

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[thumbnail_url]\n"
                    + "      ,[user_id]\n"
                    + "      ,[title]\n"
                    + "      ,[description]\n"
                    + "      ,[content]\n"
                    + "      ,[created_at]\n"
                    + "      ,[updateAt]\n"
                    + "      ,[isPublished]\n"
                    + "  FROM [dbo].[posts]\n"
                    + "  WHERE id= ? AND isPublished = 1";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Blog blog = new Blog(rs.getInt("id"), rs.getString("thumbnail_url"), rs.getInt("user_id"), rs.getString("title"),
                        rs.getString("description"), rs.getString("content"), rs.getDate("created_at"), rs.getDate("updateAt"),
                        rs.getBoolean("isPublished"));

                return blog;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Blog> getListByPage(List<Blog> list, int start, int end) {
        List<Blog> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
}
