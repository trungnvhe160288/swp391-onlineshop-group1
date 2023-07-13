/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Ultils.DBContext;
import Models.Comment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO extends DBContext {

    public boolean checkBuyer(int uid, int pid) {
        try {

            String sql = "SELECT o.[id]\n"
                    + "FROM [dbo].[orders] o inner join [dbo].[order_detail] od\n"
                    + "on o.id = od.order_id\n"
                    + "WHERE [user_id] = ? and o.status = 1 and od.product_id = ?";

            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, uid);
            st.setInt(2, pid);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public List<Comment> getCommentByProductId(int pid) {
        List<Comment> list = new ArrayList<>();

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[content]\n"
                    + "      ,[name]\n"
                    + "      ,[email]\n"
                    + "      ,[rate]\n"
                    + "      ,[createDate]\n"
                    + "      ,[updateDate]\n"
                    + "      ,[isPublished]\n"
                    + "      ,[uid]\n"
                    + "      ,[pid]\n"
                    + "  FROM [dbo].[Comment]\n"
                    + "  WHERE pid = ?";

            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, pid);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Comment c = new Comment(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getInt(5), rs.getDate(6), rs.getDate(7), rs.getBoolean(8), rs.getInt(9), rs.getInt(10));
                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalCommentByMonthAndYear(int month, int year) {

        try {

            String sql = "SELECT COUNT(*)\n"
                    + "  FROM [dbo].[Comment]\n"
                    + "  where MONTH([createDate]) = ? AND YEAR([createDate]) = ?";

            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, month);
            st.setInt(2, year);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public boolean add(Comment c) {

        try {

            String sql = "INSERT INTO [dbo].[Comment]\n"
                    + "           ([content]\n"
                    + "           ,[name]\n"
                    + "           ,[email]\n"
                    + "           ,[rate]\n"
                    + "           ,[createDate]\n"
                    + "           ,[updateDate]\n"
                    + "           ,[isPublished]\n"
                    + "           ,[uid]\n"
                    + "           ,[pid])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, c.getContent());
            st.setString(2, c.getName());
            st.setString(3, c.getEmail());
            st.setInt(4, c.getRate());
            st.setDate(5, c.getCreateDate());
            st.setDate(6, c.getUpdateDate());
            st.setBoolean(7, c.isPublished());
            st.setInt(8, c.getUid());
            st.setInt(9, c.getPid());

            st.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println(e);
            return false;

        }
    }
}
