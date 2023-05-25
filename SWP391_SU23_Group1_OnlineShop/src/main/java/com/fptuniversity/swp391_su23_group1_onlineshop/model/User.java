/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.model;

import java.util.Date;

/**
 *
 * @author Baoli
 */
public class User {
    private int id;
    private String avatar;
    private String email;
    private String password;
    private String fullname;
    private String username;
    private String address;
    private String phone;
    private String userRole;
    private java.sql.Date createdAt;
    private java.sql.Date deletedAt;

    public User() {
    }

    public User(int id, String avatar, String email, String password, String fullname, String username, String address, String phone, String userRole, java.sql.Date createdAt, java.sql.Date deletedAt) {
        this.id = id;
        this.avatar = avatar;
        this.email = email;
        this.password = password;
        this.fullname = fullname;
        this.username = username;
        this.address = address;
        this.phone = phone;
        this.userRole = userRole;
        this.createdAt = createdAt;
        this.deletedAt = deletedAt;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public java.sql.Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(java.sql.Date createdAt) {
        this.createdAt = createdAt;
    }

    public java.sql.Date getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(java.sql.Date deletedAt) {
        this.deletedAt = deletedAt;
    }
}
