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
    private String email;
    private String pass;
    private String username;
    private int age;
    private Date birt;

    public User() {
    }

    public User(String email, String pass, String username, int age, Date birt) {
        this.email = email;
        this.pass = pass;
        this.username = username;
        this.age = age;
        this.birt = birt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getBirt() {
        return birt;
    }

    public void setBirt(Date birt) {
        this.birt = birt;
    }

    @Override
    public String toString() {
        return "User{" + "email=" + email + ", pass=" + pass + ", username=" + username + ", age=" + age + ", birt=" + birt + '}';
    }
    
}
