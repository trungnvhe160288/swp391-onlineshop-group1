/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

public class Product {

    private int id;
    private String name;
    private String thumbnail_url;
    private String description;
    private double price;
    private float percent_discount;
    private int quantity;
    private Date createAt;
    private Date updateAt;

    private Category category;
    private List<Image> image;
    private List<Color> color;
    private List<Size> size;

    public Product() {
    }

    public Product(int id, String name, String thumbnail_url, String description, double price, float percent_discount, int quantity, Date createAt, Date updateAt, Category category, List<Image> image, List<Color> color, List<Size> size) {
        this.id = id;
        this.name = name;
        this.thumbnail_url = thumbnail_url;
        this.description = description;
        this.price = price;
        this.percent_discount = percent_discount;
        this.quantity = quantity;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.category = category;
        this.image = image;
        this.color = color;
        this.size = size;
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

    public String getThumbnail_url() {
        return thumbnail_url;
    }

    public void setThumbnail_url(String thumbnail_url) {
        this.thumbnail_url = thumbnail_url;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public float getPercent_discount() {
        return percent_discount;
    }

    public void setPercent_discount(float percent_discount) {
        this.percent_discount = percent_discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Image> getImage() {
        return image;
    }

    public void setImage(List<Image> image) {
        this.image = image;
    }

    public List<Color> getColor() {
        return color;
    }

    public void setColor(List<Color> color) {
        this.color = color;
    }

    public List<Size> getSize() {
        return size;
    }

    public void setSize(List<Size> size) {
        this.size = size;
    }

    
    public String getPriceFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(this.price);
    }

    public double getLastPrice() {
        return this.price - this.price * this.percent_discount;
    }

    public String getLastPriceFormat() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(this.price - this.price * this.percent_discount);
    }

    public String getDiscountPercent() {
        DecimalFormat f = new DecimalFormat("###.#%");
        return f.format(percent_discount);
    }

}
