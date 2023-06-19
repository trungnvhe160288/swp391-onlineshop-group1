package Models;

import java.sql.Date;

public class OTP {
    private int id;
    private String code;
    private String type;
    private String email;
    private Date createAt;
    private boolean active;

    public OTP() {
    }

    public OTP(int id, String code, String type, String email, Date createAt, boolean active) {
        this.id = id;
        this.code = code;
        this.type = type;
        this.email = email;
        this.createAt = createAt;
        this.active = active;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
    
    
}
