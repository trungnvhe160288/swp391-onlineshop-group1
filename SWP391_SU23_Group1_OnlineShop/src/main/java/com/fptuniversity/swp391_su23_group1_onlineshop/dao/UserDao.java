package com.fptuniversity.swp391_su23_group1_onlineshop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.fptuniversity.swp391_su23_group1_onlineshop.model.User;
import com.fptuniversity.swp391_su23_group1_onlineshop.util.ConnectionDB;

public class UserDao {

    public static User getInfoUserByEmail(String emailCheck) {
        User user = null;

        try ( Connection cn = ConnectionDB.makeConnection()) {

            if (cn != null) {
                String sqlQuery = "SELECT id, email,avatar,password,fullname,username,phone,user_role,address,created_at,deleted_at \n"
                        + "FROM users \n"
                        + "WHERE status=1 AND email = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sqlQuery);
                pst.setString(1, emailCheck);
                ResultSet rs = pst.executeQuery();
                // step 3 :
                if (!rs.next()) {
                    return null;
                } else {
                    int id = rs.getInt("id");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String avatar = rs.getString("avatar");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    String username = rs.getString("username");
                    String address = rs.getString("address");
                    String userRole = rs.getString("user_role");
                    Date createdAt = rs.getDate("created_at");
                    Date deletedAt = rs.getDate("deleted_at");
                    user = new User(id, avatar, email, password, fullname, username, address, phone, userRole, createdAt, deletedAt);
                }
            }
            cn.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public static User getInfoUserById(int userId) {
        User user = null;

        try ( Connection cn = ConnectionDB.makeConnection()) {

            if (cn != null) {
                String sqlQuery = "SELECT id, email,avatar,password,fullname,username,phone,user_role,address,created_at,deleted_at \n"
                        + "FROM users \n"
                        + "WHERE id = ?";
                PreparedStatement pst = cn.prepareStatement(sqlQuery);
                pst.setInt(1, userId);
                ResultSet rs = pst.executeQuery();
                // step 3 :
                if (!rs.next()) {
                    return null;
                } else {
                    int id = rs.getInt("id");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String avatar = rs.getString("avatar");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    String username = rs.getString("username");
                    String address = rs.getString("address");
                    String userRole = rs.getString("user_role");
                    Date createdAt = rs.getDate("created_at");
                    Date deletedAt = rs.getDate("deleted_at");
                    user = new User(id, avatar, email, password, fullname, username, address, phone, userRole, createdAt, deletedAt);
                }
            }
            cn.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public static User getInfoUserByUsername(String usernameCheck) {
        User user = null;

        try ( Connection cn = ConnectionDB.makeConnection()) {

            if (cn != null) {
                String sqlQuery = "SELECT id, email,avatar,password,fullname,username,phone,user_role,address,created_at,deleted_at \n"
                        + "FROM users \n"
                        + "WHERE username = ?";
                PreparedStatement pst = cn.prepareStatement(sqlQuery);
                pst.setString(1, usernameCheck);
                ResultSet rs = pst.executeQuery();
                // step 3 :
                if (!rs.next()) {
                    return null;
                } else {
                    int id = rs.getInt("id");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String avatar = rs.getString("avatar");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    String username = rs.getString("username");
                    String address = rs.getString("address");
                    String userRole = rs.getString("user_role");
                    Date createdAt = rs.getDate("created_at");
                    Date deletedAt = rs.getDate("deleted_at");
                    user = new User(id, avatar, email, password, fullname, username, address, phone, userRole, createdAt, deletedAt);
                }
            }
            cn.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public static User userLoginByUsernameAndPassowrd(String inputUsername, String inputPassword) throws SQLException {
        User user = null;
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "SELECT id, avatar, email, password, fullname, username, address, phone,user_role, created_at, deleted_at \n"
                        + "FROM users \n"
                        + "WHERE username=? AND password=? \n";
                PreparedStatement pst = cn.prepareStatement(sqlQuery);
                pst.setString(1, inputUsername);
                pst.setString(2, inputPassword);
                ResultSet rs = pst.executeQuery();
                // step 3 :
                if (!rs.next()) {
                    return null;
                } else {
                    int id = rs.getInt("id");
                    String email = rs.getString("email");
                    String avatar = rs.getString("avatar");
                    String fullname = rs.getString("fullname");
                    String password = rs.getString("password");
                    String phone = rs.getString("phone");
                    String username = rs.getString("username");
                    String address = rs.getString("address");
                    String userRole = rs.getString("user_role");
                    Date createdAt = rs.getDate("created_at");
                    Date deletedAt = rs.getDate("deleted_at");
                    user = new User(id, avatar, email, password, fullname, username, address, phone, userRole, createdAt, deletedAt);

                }
            }
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public static User userLoginWithTokenRememberMe(String token) throws SQLException {
        User user = null;
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "SELECT users.id AS id, avatar, email, password, fullname, username, address, phone,user_role,users.created_at AS created_at,users.deleted_at AS deleted_at \n"
                        + "FROM user_tokens \n"
                        + "LEFT JOIN users ON user_tokens.user_id = users.id\n"
                        + "WHERE token = ?";
                PreparedStatement pst = cn.prepareStatement(sqlQuery);
                pst.setString(1, token);
                ResultSet rs = pst.executeQuery();
                // step 3 :
                if (!rs.next()) {
                    return null;
                } else {
                    int id = rs.getInt("id");
                    String email = rs.getString("email");
                    String avatar = rs.getString("avatar");
                    String fullname = rs.getString("fullname");
                    String password = rs.getString("password");
                    String phone = rs.getString("phone");
                    String username = rs.getString("username");
                    String address = rs.getString("address");
                    String userRole = rs.getString("user_role");
                    Date createdAt = rs.getDate("created_at");
                    Date deletedAt = rs.getDate("deleted_at");
                    user = new User(id, avatar, email, password, fullname, username, address, phone, userRole, createdAt, deletedAt);

                }
            }
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public static ArrayList<User> getAllUsers() {
        ArrayList<User> userList = new ArrayList<>();

        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "SELECT id, avatar, email, password, fullname, username, address, phone,user_role, created_at, deleted_at \n"
                        + "FROM users \n";
                try ( Statement st = cn.createStatement();  ResultSet rs = st.executeQuery(sqlQuery)) {

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String avatar = rs.getString("avatar");
                        String email = rs.getString("email");
                        String password = rs.getString("password");
                        String fullname = rs.getString("fullname");
                        String username = rs.getString("username");
                        String address = rs.getString("address");
                        String phone = rs.getString("phone");
                        String userRole = rs.getString("user_role");
                        Date createdAt = rs.getDate("created_at");
                        Date deletedAt = rs.getDate("deleted_at");

                        User user = new User(id, avatar, email, password, fullname, username, address, phone, userRole, createdAt, deletedAt);
                        userList.add(user);
                    }

                }
            }

            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return userList;
    }

    public static boolean addUser(User user) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "INSERT INTO users (avatar, email, password, fullname, username, address, phone,user_role, created_at) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                int rowsAffected;
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    ps.setString(1, user.getAvatar());
                    ps.setString(2, user.getEmail());
                    ps.setString(3, user.getPassword());
                    ps.setString(4, user.getFullname());
                    ps.setString(5, user.getUsername());
                    ps.setString(6, user.getAddress());
                    ps.setString(7, user.getPhone());
                    ps.setString(8, user.getUserRole());
                    ps.setDate(9, Date.valueOf(LocalDate.now()));
                    rowsAffected = ps.executeUpdate();
                }
                cn.close();

                return rowsAffected > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public static boolean updateUser(User user) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "UPDATE users SET avatar=?, email=?, password=?, fullname=?, username=?, "
                        + "address=?, phone=?,user_role=? , created_at=?, deleted_at=? WHERE id=?";
                int rowsAffected;
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    ps.setString(1, user.getAvatar());
                    ps.setString(2, user.getEmail());
                    ps.setString(3, user.getPassword());
                    ps.setString(4, user.getFullname());
                    ps.setString(5, user.getUsername());
                    ps.setString(6, user.getAddress());
                    ps.setString(7, user.getPhone());
                    ps.setString(8, user.getUserRole());
                    ps.setDate(9, user.getCreatedAt());
                    ps.setDate(10, user.getDeletedAt());
                    ps.setInt(11, user.getId());
                    rowsAffected = ps.executeUpdate();
                }
                cn.close();

                return rowsAffected > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public static boolean updateInfoUser(User user) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "UPDATE users SET email=?, fullname=?,  "
                        + "address=?, phone=? WHERE id=?";
                int rowsAffected;
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    System.out.println("fullname " + user.getFullname());
                    System.out.println("email " + user.getEmail());
                    System.out.println("address " + user.getAddress());
                    System.out.println("phone " + user.getPhone());
                    System.out.println("id " + user.getId());
                    ps.setString(1, user.getEmail());
                    ps.setString(2, user.getFullname());
                    ps.setString(3, user.getAddress());
                    ps.setString(4, user.getPhone());
                    ps.setInt(5, user.getId());
                    rowsAffected = ps.executeUpdate();
                }
                cn.close();

                return rowsAffected > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public static boolean createTokenByUsername(String token, String username) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            User user = UserDao.getInfoUserByUsername(username);
            if (cn != null && user != null) {

                String sqlQuery = "INSERT INTO user_tokens (user_id, token, created_at) "
                        + "VALUES (?, ?, ?)";

                int rowsAffected;
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    ps.setInt(1, user.getId());
                    ps.setString(2, token);
                    ps.setDate(3, Date.valueOf(LocalDate.now()));
                    rowsAffected = ps.executeUpdate();
                }
                cn.close();

                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static boolean deleteUser(int userId) {
        try ( Connection cn = ConnectionDB.makeConnection()) {
            if (cn != null) {
                String sqlQuery = "DELETE FROM users WHERE id=?";
                int rowsAffected;
                try ( PreparedStatement ps = cn.prepareStatement(sqlQuery)) {
                    ps.setInt(1, userId);
                    rowsAffected = ps.executeUpdate();
                }
                cn.close();

                return rowsAffected > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
}
