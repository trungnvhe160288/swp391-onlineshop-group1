/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.dao;

import com.fptuniversity.swp391_su23_group1_onlineshop.model.Feedback;
import com.fptuniversity.swp391_su23_group1_onlineshop.util.ConnectionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author dotra
 */
public class FeedbackDao {

    public static ArrayList<Feedback> getFeedbackByProductId(int productId) {
        ArrayList<Feedback> feedbackList = new ArrayList<>();

        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                StringBuilder sqlQuery = new StringBuilder("SELECT f.id, f.content, f.rating, f.created_at,f.deleted_at,f.order_detail_id, u.fullname, u.username, u.avatar\n"
                        + "FROM feedback f\n"
                        + "JOIN order_detail od ON f.order_detail_id = od.id\n"
                        + "JOIN orders o ON od.order_id = o.id\n"
                        + "JOIN users u ON o.user_id = u.id");

                sqlQuery.append(" WHERE od.product_id = ").append(productId);
                System.out.println("sqlQuery.toString() ===> " + sqlQuery.toString());
                try ( PreparedStatement statement = cn.prepareStatement(sqlQuery.toString());  ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Feedback feedback = new Feedback();
                        feedback.setId(resultSet.getInt("id"));
                        feedback.setContent(resultSet.getString("content"));
                        feedback.setRating(resultSet.getInt("rating"));
                        feedback.setCreatedAt(resultSet.getDate("created_at"));
                        feedback.setDeletedAt(resultSet.getDate("deleted_at"));
                        feedback.setAuthorName(resultSet.getString("fullname"));
                        feedbackList.add(feedback);
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return feedbackList;
    }
}
