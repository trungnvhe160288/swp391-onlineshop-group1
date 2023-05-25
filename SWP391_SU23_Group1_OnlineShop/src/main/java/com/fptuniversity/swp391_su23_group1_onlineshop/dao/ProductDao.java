
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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.fptuniversity.swp391_su23_group1_onlineshop.model.Product;
import com.fptuniversity.swp391_su23_group1_onlineshop.util.ConnectionDB;

public class ProductDao {

    public static ArrayList<Product> getAllProducts() {
        ArrayList<Product> productList = new ArrayList<>();

        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "SELECT id, name, thumbnail_url, description, price, percent_discount, quantity, "
                        + "category_id, total_rating, created_at, deleted_at FROM products";
                try ( Statement st = cn.createStatement();  ResultSet rs = st.executeQuery(sqlQuery)) {

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String thumbnailUrl = rs.getString("thumbnail_url");
                        String description = rs.getString("description");
                        float price = rs.getFloat("price");
                        float percentDiscount = rs.getFloat("percent_discount");
                        int quantity = rs.getInt("quantity");
                        int categoryId = rs.getInt("category_id");
                        float totalRating = rs.getFloat("total_rating");
                        Date createdAt = rs.getDate("created_at");
                        Date deletedAt = rs.getDate("deleted_at");

                        Product product = new Product(id, name, thumbnailUrl, description, price, percentDiscount,
                                quantity, categoryId, totalRating, createdAt, deletedAt);
                        productList.add(product);
                    }

                }
            }

            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return productList;
    }

    public static ArrayList<Product> filterProducts(String productName, Float minPrice, Float maxPrice, Integer categoryId, Integer colorId, Float rating) {
        ArrayList<Product> filteredList = new ArrayList<>();

        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                StringBuilder sqlQuery = new StringBuilder("SELECT DISTINCT p.id, p.name, p.thumbnail_url, p.description, p.price, p.percent_discount, p.quantity, ")
                        .append(" p.category_id, p.total_rating, p.created_at, p.deleted_at FROM products p ");

                if (colorId != null) {
                    sqlQuery.append("JOIN product_color pc ON p.id = pc.product_id ");
                }
                sqlQuery.append("WHERE 1=1");
                // Add filters based on input parameters
                if (productName != null && !productName.isEmpty()) {
                    sqlQuery.append(" AND p.name LIKE '%").append(productName).append("%'");
                }
                if (minPrice != null) {
                    sqlQuery.append(" AND p.price >= ").append(minPrice);
                }
                if (maxPrice != null) {
                    sqlQuery.append(" AND p.price <= ").append(maxPrice);
                }
                if (categoryId != null) {
                    sqlQuery.append(" AND p.category_id = ").append(categoryId);
                }
                if (colorId != null) {
                    sqlQuery.append(" AND pc.color_id = ").append(colorId);
                }
                if (rating != null) {
                    sqlQuery.append(" AND pc.total_rating = ").append(rating);
                }
                try ( Statement st = cn.createStatement();  ResultSet rs = st.executeQuery(sqlQuery.toString())) {
                    while (rs.next()) {
                        // Retrieve product details from result set and create Product objects
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String thumbnailUrl = rs.getString("thumbnail_url");
                        String description = rs.getString("description");
                        float price = rs.getFloat("price");
                        float percentDiscount = rs.getFloat("percent_discount");
                        int quantity = rs.getInt("quantity");

                        int fetchedCategoryId = rs.getInt("category_id");
                        float totalRating = rs.getFloat("total_rating");
                        Date createdAt = rs.getDate("created_at");
                        Date deletedAt = rs.getDate("deleted_at");

                        Product product = new Product(id, name, thumbnailUrl, description, price, percentDiscount,
                                quantity, fetchedCategoryId, totalRating, createdAt, deletedAt);
                        filteredList.add(product);
                    }
                }
            }

            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return filteredList;
    }

    public static Product getProductById(int id) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "SELECT id, name, thumbnail_url, description, price, percent_discount, quantity,category_id, total_rating, created_at, deleted_at FROM products WHERE id = ?";
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    ps.setInt(1, id);
                    try ( ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            String name = rs.getString("name");
                            String thumbnailUrl = rs.getString("thumbnail_url");
                            String description = rs.getString("description");
                            float price = rs.getFloat("price");
                            float percentDiscount = rs.getFloat("percent_discount");
                            int quantity = rs.getInt("quantity");
                            int categoryId = rs.getInt("category_id");
                            float totalRating = rs.getFloat("total_rating");
                            Date createdAt = rs.getDate("created_at");
                            Date deletedAt = rs.getDate("deleted_at");

                            return new Product(id, name, thumbnailUrl, description, price, percentDiscount,
                                    quantity, categoryId, totalRating, createdAt, deletedAt);

                        }
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static boolean addProduct(Product product) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "INSERT INTO products (name, thumbnail_url, description, price, percent_discount, "
                        + "quantity, category_id, total_rating, created_at, deleted_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                int rowsAffected;
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    ps.setString(1, product.getName());
                    ps.setString(2, product.getThumbnailUrl());
                    ps.setString(3, product.getDescription());
                    ps.setFloat(4, product.getPrice());
                    ps.setFloat(5, product.getPercentDiscount());
                    ps.setInt(6, product.getQuantity());
                    ps.setInt(7, product.getCategoryId());
                    ps.setFloat(8, product.getTotalRating());
                    ps.setDate(9, Date.valueOf(LocalDate.now()));
                    ps.setDate(10, null);
                    rowsAffected = ps.executeUpdate();
                }
                cn.close();

                return rowsAffected > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public static boolean updateProduct(Product product) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "UPDATE products SET name=?, thumbnail_url=?, description=?, price=?, "
                        + "percent_discount=?, quantity=?, category_id=?, total_rating=?, created_at=?, deleted_at=? "
                        + "WHERE id=?";
                int rowsAffected;
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    ps.setString(1, product.getName());
                    ps.setString(2, product.getThumbnailUrl());
                    ps.setString(3, product.getDescription());
                    ps.setFloat(4, product.getPrice());
                    ps.setFloat(5, product.getPercentDiscount());
                    ps.setInt(6, product.getQuantity());
                    ps.setInt(7, product.getCategoryId());
                    ps.setFloat(8, product.getTotalRating());
                    ps.setDate(9, product.getCreatedAt());
                    ps.setDate(10, product.getDeletedAt());
                    ps.setInt(11, product.getId());
                    rowsAffected = ps.executeUpdate();
                }
                cn.close();

                return rowsAffected > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public static boolean deleteProduct(int productId) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "DELETE FROM products WHERE id=?";
                int rowsAffected;
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    ps.setInt(1, productId);
                    rowsAffected = ps.executeUpdate();
                }
                cn.close();

                return rowsAffected > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
}
