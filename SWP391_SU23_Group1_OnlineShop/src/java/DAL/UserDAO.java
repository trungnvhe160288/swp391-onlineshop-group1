package DAL;

import Models.OTP;
import Models.Role;
import Models.User;
import Ultils.Common;
import Ultils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO extends DBContext {

    public User login(String userName, String password) {
        try {

            String sql = "SELECT u.[id]\n"
                    + "      ,[email]\n"
                    + "      ,[password]\n"
                    + "      ,[fullname]\n"
                    + "      ,[avatar]\n"
                    + "      ,[phone]\n"
                    + "      ,[address]\n"
                    + "      ,[status]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "      ,[rid]\n"
                    + "	     ,r.[name]\n"
                    + "      ,r.[createAt] as 'roleCA'\n"
                    + "      ,r.[updateAt] as 'roleUA'\n"
                    + "      ,r.[isActive]\n"
                    + "  FROM [dbo].[users] u inner join [dbo].[role] r\n"
                    + "  ON u.rid = r.id\n"
                    + "  WHERE email = ? and password = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, Common.convertPassToMD5(password));

            ResultSet rs = st.executeQuery();

            if (rs.next()) {

                Role role = new Role(rs.getInt("rid"), rs.getString("name"), rs.getDate("roleCA"), rs.getDate("roleUA"),
                        rs.getBoolean("isActive"));

                User user = new User(rs.getInt("id"), rs.getString("email"), rs.getString("password"), rs.getString("fullname"),
                        rs.getString("avatar"), rs.getString("phone"), rs.getString("address"), rs.getInt("status"),
                        rs.getDate("created_at"), rs.getDate("update_at"), role);

                return user;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void register(User u) {
        try {

            String sql = "INSERT INTO [dbo].[users] \n"
                    + "([email], [password], [fullname], [avatar], [phone], [address], [status], [created_at], [update_at], [rid])\n"
                    + "VALUES	(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, u.getEmail());
            st.setString(2, Common.convertPassToMD5(u.getPassword()));
            st.setString(3, u.getFullName());
            st.setString(4, u.getAvatar());
            st.setString(5, u.getPhone());
            st.setString(6, u.getAddress());
            st.setInt(7, u.getStatus());
            st.setDate(8, u.getCreateAt());
            st.setDate(9, u.getUpdateAt());
            st.setInt(10, 2); // set role (user = 2)

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //checkEmailExits
    public boolean checkEmailExits(String email) {
        System.out.println(email);
        try {

            String sql = "SELECT [email] FROM [dbo].[users] where email = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean verifyAccount(String email) {
        try {

            String sql = "UPDATE [dbo].[Users]\n"
                    + "   SET [status] = 1\n"
                    + " WHERE [email] = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);

            st.executeUpdate();

            return true;

        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public boolean saveOTP(String code, String type, String email) {
        try {

            String sql = "INSERT INTO [dbo].[OTP] ([code] ,[type] ,[email] ,[createAt] ,[isActive])\n"
                    + "VALUES	(? ,? ,? ,? ,?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            ps.setString(2, type);
            ps.setString(3, email);
            ps.setDate(4, Common.getCurrentDate());
            ps.setBoolean(5, true);

            ps.executeUpdate();

            return true;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void deActiveCodeLast(int id) {
        try {

            String sql = "UPDATE [dbo].[OTP] SET [isActive] = 0\n"
                    + " WHERE id = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public OTP getLastOTPByEmail(String email) {
        try {

            String sql = "SELECT TOP(1) [id]\n"
                    + "      ,[code]\n"
                    + "      ,[type]\n"
                    + "      ,[email]\n"
                    + "      ,[createAt]\n"
                    + "      ,[isActive]\n"
                    + "  FROM [dbo].[OTP]\n"
                    + "  WHERE email = ?\n"
                    + "  ORDER BY id DESC";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                OTP otp = new OTP(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getBoolean(6));

                return otp;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getAccountByEmail(String email) {
        try {

            String sql = "SELECT u.[id]\n"
                    + "      ,[email]\n"
                    + "      ,[password]\n"
                    + "      ,[fullname]\n"
                    + "      ,[avatar]\n"
                    + "      ,[phone]\n"
                    + "      ,[address]\n"
                    + "      ,[status]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "      ,[rid]\n"
                    + "	     ,r.[name]\n"
                    + "      ,r.[createAt] as 'roleCA'\n"
                    + "      ,r.[updateAt] as 'roleUA'\n"
                    + "      ,r.[isActive]\n"
                    + "  FROM [dbo].[users] u inner join [dbo].[role] r\n"
                    + "  ON u.rid = r.id\n"
                    + "  WHERE email = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {

                Role role = new Role(rs.getInt("rid"), rs.getString("name"), rs.getDate("roleCA"), rs.getDate("roleUA"),
                        rs.getBoolean("isActive"));

                User user = new User(rs.getInt("id"), rs.getString("email"), rs.getString("password"), rs.getString("fullname"),
                        rs.getString("avatar"), rs.getString("phone"), rs.getString("address"), rs.getInt("status"),
                        rs.getDate("created_at"), rs.getDate("update_at"), role);

                return user;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void changePass(User u) {
        System.out.println(u.getPassword());
        try {

            String sql = "UPDATE [dbo].[users] SET [password] = ? WHERE email = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Common.convertPassToMD5(u.getPassword()));
            ps.setString(2, u.getEmail());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
