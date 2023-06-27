/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;
import java.util.List;

//Order
public class Order {

    private int id;
    private int uid;
    private int status;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String note;
    private Date createAt;
    private Date updateAt;

    private List<OrderLine> orderLine;

    public Order() {
    }
    //Order
    public Order(int id, int uid, int status, String fullName, String email, String phone, String address, String note, Date createAt, Date updateAt, List<OrderLine> orderLine) {
        this.id = id;
        this.uid = uid;
        this.status = status;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.orderLine = orderLine;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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

    public List<OrderLine> getOrderLine() {
        return orderLine;
    }

    public void setOrderLine(List<OrderLine> orderLine) {
        this.orderLine = orderLine;
    }
    
    public double getTotalPrice(){
        double total = 0;
        for (OrderLine item : orderLine) {
            total += item.getTotalPrice();
        }

        return total;
    }

}
