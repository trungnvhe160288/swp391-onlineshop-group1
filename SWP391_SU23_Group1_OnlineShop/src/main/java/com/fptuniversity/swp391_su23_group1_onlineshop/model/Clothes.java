/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.model;

/**
 *
 * @author Lenovo
 */
public class Clothes {
    private String name;
    private String brand;
    private double price;
    private String size;

    // Constructor
    public Clothes(String name, String brand, double price, String size) {
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.size = size;
    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    // Other methods
    public void displayInfo() {
        System.out.println("Name: " + name);
        System.out.println("Brand: " + brand);
        System.out.println("Price: " + price);
        System.out.println("Size: " + size);
    }
}