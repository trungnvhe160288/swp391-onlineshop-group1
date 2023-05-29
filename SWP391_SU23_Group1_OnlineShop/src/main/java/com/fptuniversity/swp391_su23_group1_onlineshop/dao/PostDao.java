/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.fptuniversity.swp391_su23_group1_onlineshop.model.Post;
import com.fptuniversity.swp391_su23_group1_onlineshop.util.ConnectionDB;

/**
 *
 * @author dotra
 */
public class PostDao {

    public static ArrayList<Post> getAllPosts(int page, int size, String orderBy, String orderType) {
        ArrayList<Post> postList = new ArrayList<>();
        int offset = size * (page - 1);
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                StringBuilder sqlQuery = new StringBuilder("SELECT id, thumbnail_url, user_id, title, sort_description, content, created_at, deleted_at FROM posts ");

                sqlQuery.append(" ORDER BY ");
                if (orderBy != null && !orderBy.isEmpty()) {
                    sqlQuery.append(orderBy).append(" ").append(orderType).append(" , ");
                }
                sqlQuery.append(" id ASC ");
                sqlQuery.append(" OFFSET ").append(offset).append(" ROWS \nFETCH NEXT ").append(size).append(" ROWS ONLY");
                try ( Statement st = cn.createStatement();  ResultSet rs = st.executeQuery(sqlQuery.toString())) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String thumbnailUrl = rs.getString("thumbnail_url");
                        int userId = rs.getInt("user_id");
                        String title = rs.getString("title");
                        String shortDescription = rs.getString("sort_description");
                        String content = rs.getString("content");
                        Date createdAt = rs.getDate("created_at");
                        Date deletedAt = rs.getDate("deleted_at");

                        Post post = new Post(id, thumbnailUrl, userId, title, shortDescription, content, createdAt, deletedAt);
                        postList.add(post);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return postList;
    }

    public static ArrayList<Post> filterPosts(String key, int page, int size, String orderBy, String orderType) {
        ArrayList<Post> postList = new ArrayList<>();
        int offset = size * (page - 1);
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                StringBuilder sqlQuery = new StringBuilder("SELECT id, thumbnail_url, user_id, title, sort_description, content, created_at, deleted_at FROM posts ");
                sqlQuery.append("WHERE 1=1");

                if (key != null && !key.isEmpty()) {
                    sqlQuery.append(" AND title LIKE '%").append(key).append("%' ");
                }
                sqlQuery.append(" ORDER BY ");
                if (orderBy != null && !orderBy.isEmpty()) {
                    sqlQuery.append(orderBy).append(" ").append(orderType).append(" , ");
                }
                sqlQuery.append(" id ASC ");
                sqlQuery.append(" OFFSET ").append(offset).append(" ROWS \nFETCH NEXT ").append(size).append(" ROWS ONLY");
                try ( Statement st = cn.createStatement();  ResultSet rs = st.executeQuery(sqlQuery.toString())) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String thumbnailUrl = rs.getString("thumbnail_url");
                        int userId = rs.getInt("user_id");
                        String title = rs.getString("title");
                        String shortDescription = rs.getString("sort_description");
                        String content = rs.getString("content");
                        Date createdAt = rs.getDate("created_at");
                        Date deletedAt = rs.getDate("deleted_at");

                        Post post = new Post(id, thumbnailUrl, userId, title, shortDescription, content, createdAt, deletedAt);
                        postList.add(post);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return postList;
    }

    public static int countFilterPosts(String key) {

        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "SELECT COUNT(*) AS count\n"
                        + "FROM posts";
                if (key != null && !key.isEmpty()) {
                    sqlQuery += " WHERE title LIKE '%" + key + "%' ";
                }
                try ( Statement st = cn.createStatement();  ResultSet rs = st.executeQuery(sqlQuery)) {
                    while (rs.next()) {
                        return rs.getInt("count");
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }

    public static int countAllPosts() {

        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "SELECT COUNT(*) AS count\n"
                        + "FROM posts";

                try ( Statement st = cn.createStatement();  ResultSet rs = st.executeQuery(sqlQuery)) {
                    while (rs.next()) {
                        return rs.getInt("count");
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }

    public static Post getPostById(int id) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "SELECT id, thumbnail_url, user_id, title, sort_description, content, created_at, deleted_at FROM posts WHERE id = ?";
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    ps.setInt(1, id);
                    try ( ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            String thumbnailUrl = rs.getString("thumbnail_url");
                            int userId = rs.getInt("user_id");
                            String title = rs.getString("title");
                            String shortDescription = rs.getString("sort_description");
                            String content = rs.getString("content");
                            Date createdAt = rs.getDate("created_at");
                            Date deletedAt = rs.getDate("deleted_at");

                            return new Post(id, thumbnailUrl, userId, title, shortDescription, content, createdAt, deletedAt);
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static void addPost(Post post) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "INSERT INTO posts (thumbnail_url, user_id, title, sort_description, content, created_at) VALUES (?, ?, ?, ?, ?, ?)";
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    ps.setString(1, post.getThumbnailUrl());
                    ps.setInt(2, post.getUserId());
                    ps.setString(3, post.getTitle());
                    ps.setString(4, post.getShortDescription());
                    ps.setString(5, post.getContent());
                    ps.setDate(6, new java.sql.Date(post.getCreatedAt().getTime()));

                    ps.executeUpdate();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void updatePost(Post post) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "UPDATE posts SET thumbnail_url = ?, user_id = ?, title = ?, sort_description = ?, content = ?, created_at = ? WHERE id = ?";
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    ps.setString(1, post.getThumbnailUrl());
                    ps.setInt(2, post.getUserId());
                    ps.setString(3, post.getTitle());
                    ps.setString(4, post.getShortDescription());
                    ps.setString(5, post.getContent());
                    ps.setDate(6, new java.sql.Date(post.getCreatedAt().getTime()));
                    ps.setInt(7, post.getId());

                    ps.executeUpdate();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void deletePost(int id) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "DELETE FROM posts WHERE id = ?";
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    ps.setInt(1, id);

                    ps.executeUpdate();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
