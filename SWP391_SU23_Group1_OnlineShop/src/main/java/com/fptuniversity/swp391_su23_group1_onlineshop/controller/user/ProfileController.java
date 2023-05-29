/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.controller.user;

/**
 *
 * @author Lenovo
 */
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfileController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch user profile information from the database
        String userName = "";
        String fullName = "";
        String phone = "";
        String address = "";
        String email = "";
        
        try {
            
            // Connect DB
            String dbURL = "jdbc:mysql://localhost:3306/your_database_name";
            String dbUser = "your_username";
            String dbPassword = "your_password";
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Prepare and execute SQL query
            String sql = "SELECT userName, fullName, phone, address, email FROM users WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, 1); // Assuming user ID is 1
            
            ResultSet resultSet = statement.executeQuery();

            // Extract user details 
            if (resultSet.next()) {
                userName = resultSet.getString("userName");
                fullName = resultSet.getString("fullName");
                phone = resultSet.getString("phone");
                address = resultSet.getString("address");
                email = resultSet.getString("email");
            }

            // Close connection
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Set user profile attributes and forward to the userProfile.jsp view
        request.setAttribute("userName", userName);
        request.setAttribute("fullName", fullName);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.setAttribute("email", email);
        
        request.getRequestDispatcher("/userProfile.jsp").forward(request, response);
    }
}