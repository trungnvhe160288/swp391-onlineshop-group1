/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.model;

public class Color {

    private int id;
    private String name;
    private String bgrHex;
    private String textHex;

    public Color() {
    }

    public Color(int id, String name, String bgrHex, String textHex) {
        this.id = id;
        this.name = name;
        this.bgrHex = bgrHex;
        this.textHex = textHex;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBgrHex() {
        return bgrHex;
    }

    public void setBgrHex(String bgrHex) {
        this.bgrHex = bgrHex;
    }

    public String getTextHex() {
        return textHex;
    }

    public void setTextHex(String textHex) {
        this.textHex = textHex;
    }

}
