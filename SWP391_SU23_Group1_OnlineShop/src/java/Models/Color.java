/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Models;

import java.sql.Date;

public class Color {
    private int id;
    private String name;
    private String bgr_hex;
    private String text_hex;
    private Date createAt;
    private Date updateAt;

    public Color() {
    }

    public Color(int id, String name, String bgr_hex, String text_hex, Date createAt, Date updateAt) {
        this.id = id;
        this.name = name;
        this.bgr_hex = bgr_hex;
        this.text_hex = text_hex;
        this.createAt = createAt;
        this.updateAt = updateAt;
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

    public String getBgr_hex() {
        return bgr_hex;
    }

    public void setBgr_hex(String bgr_hex) {
        this.bgr_hex = bgr_hex;
    }

    public String getText_hex() {
        return text_hex;
    }

    public void setText_hex(String text_hex) {
        this.text_hex = text_hex;
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
    
}
