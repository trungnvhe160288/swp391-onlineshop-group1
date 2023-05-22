/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.model;

/**
 *
 * @author Baoli
 */
public class Category {
    private String shirt;
    private String pant;
    private String shoe;
    private String hat;
    private String bag;

    public Category() {
    }

    public Category(String shirt, String pant, String shoe, String hat, String bag) {
        this.shirt = shirt;
        this.pant = pant;
        this.shoe = shoe;
        this.hat = hat;
        this.bag = bag;
    }    
    
    public String getShirt() {
        return shirt;
    }

    public void setShirt(String shirt) {
        this.shirt = shirt;
    }

    public String getPant() {
        return pant;
    }

    public void setPant(String pant) {
        this.pant = pant;
    }

    public String getShoe() {
        return shoe;
    }

    public void setShoe(String shoe) {
        this.shoe = shoe;
    }

    public String getHat() {
        return hat;
    }

    public void setHat(String hat) {
        this.hat = hat;
    }

    public String getBag() {
        return bag;
    }

    public void setBag(String bag) {
        this.bag = bag;
    }

    @Override
    public String toString() {
        return "Category{" + "shirt=" + shirt + ", pant=" + pant + ", shoe=" + shoe + ", hat=" + hat + ", bag=" + bag + '}';
    }    
    
}
