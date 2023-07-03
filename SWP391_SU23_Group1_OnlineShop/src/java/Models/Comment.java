/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Models;

import java.sql.Date;

public class Comment {
    private int id;
    private String content;
    private String name;
    private String email;
    private int rate;
    private Date createDate;
    private Date updateDate;
    private boolean published;
    private int uid;
    private int pid;

    public Comment() {
    }

    public Comment(int id, String content, String name, String email, int rate, Date createDate, Date updateDate, boolean published, int uid, int pid) {
        this.id = id;
        this.content = content;
        this.name = name;
        this.email = email;
        this.rate = rate;
        this.createDate = createDate;
        this.updateDate = updateDate;
        this.published = published;
        this.uid = uid;
        this.pid = pid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public boolean isPublished() {
        return published;
    }

    public void setPublished(boolean published) {
        this.published = published;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
    
    
}
