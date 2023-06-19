/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Cart;
import Models.Category;
import Models.Color;
import Models.Image;
import Models.Item;
import Models.Order;
import Models.OrderLine;
import Models.Product;
import Models.Size;
import Models.User;
import Ultils.Common;
import Ultils.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO extends DBContext {

    public void createOrder(Cart cart, User user, String fullName, String email, String phone, String address, String note) {
        try {

            String sql = "INSERT INTO [dbo].[orders]\n"
                    + " ([user_id], [status], [fullname], [email], [phone], [address], [note], [created_at], [update_at])\n"
                    + "VALUES\n"
                    + "		(? ,? ,? ,? ,? ,? ,? ,? ,?)";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user.getId());
            st.setInt(2, 0);
            st.setString(3, fullName);
            st.setString(4, email);
            st.setString(5, phone);
            st.setString(6, address);
            st.setString(7, note);
            st.setDate(8, Common.getCurrentDate());
            st.setDate(9, Common.getCurrentDate());

            st.executeUpdate();

            String sql1 = "SELECT [id]\n"
                    + "  FROM [dbo].[orders]\n"
                    + "  ORDER BY id DESC";

            PreparedStatement st1 = connection.prepareStatement(sql1);

            ResultSet rs1 = st1.executeQuery();

            if (rs1.next()) {
                int orderID = rs1.getInt(1);

                for (Item item : cart.getItems()) {
                    String query = "INSERT INTO [dbo].[order_detail]\n"
                            + " ([order_id], [product_id], [quantity], [total_price], [colorID], [sizeID])\n"
                            + "VALUES\n"
                            + "		(?, ?, ?, ?, ?, ?)";

                    PreparedStatement st2 = connection.prepareStatement(query);
                    st2.setInt(1, orderID);
                    st2.setInt(2, item.getProduct().getId());
                    st2.setInt(3, item.getQuantity());
                    st2.setDouble(4, item.getTotalPrice());
                    st2.setInt(5, item.getColorID());
                    st2.setInt(6, item.getSizeID());

                    st2.executeUpdate();
                }
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //getMyOrder
    public List<Order> getMyOrder(User u) {
        List<Order> list = new ArrayList<>();

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[user_id]\n"
                    + "      ,[status]\n"
                    + "      ,[fullname]\n"
                    + "      ,[email]\n"
                    + "      ,[phone]\n"
                    + "      ,[address]\n"
                    + "      ,[note]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "  FROM [dbo].[orders]\n"
                    + "  WHERE user_id = ?\n"
                    + "  ORDER BY created_at DESC";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getId());

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int orderID = rs.getInt("id");
                List<OrderLine> orderLine = new ArrayList<>();

                String sql1 = "SELECT [id]\n"
                        + "      ,[order_id]\n"
                        + "      ,[product_id]\n"
                        + "      ,[quantity]\n"
                        + "      ,[total_price]\n"
                        + "      ,[colorID]\n"
                        + "      ,[sizeID]\n"
                        + "  FROM [dbo].[order_detail]\n"
                        + "  WHERE order_id = ?";

                PreparedStatement st1 = connection.prepareStatement(sql1);
                st1.setInt(1, orderID);

                ResultSet rs1 = st1.executeQuery();

                while (rs1.next()) {
                    Product product = getProductByID(rs1.getInt("product_id"));

                    OrderLine ol = new OrderLine(rs1.getInt("id"), orderID, rs1.getInt("quantity"), rs1.getDouble("total_price"),
                            rs1.getInt("colorID"), rs1.getInt("sizeID"), product);

                    orderLine.add(ol);
                }

                Order order = new Order(orderID, rs.getInt("user_id"), rs.getInt("status"), rs.getString("fullname"),
                        rs.getString("email"), rs.getString("phone"), rs.getString("address"), rs.getString("note"),
                        rs.getDate("created_at"), rs.getDate("update_at"), orderLine);

                list.add(order);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Order getOrderByID(int id) {

        try {

            String sql = "SELECT [id]\n"
                    + "      ,[user_id]\n"
                    + "      ,[status]\n"
                    + "      ,[fullname]\n"
                    + "      ,[email]\n"
                    + "      ,[phone]\n"
                    + "      ,[address]\n"
                    + "      ,[note]\n"
                    + "      ,[created_at]\n"
                    + "      ,[update_at]\n"
                    + "  FROM [dbo].[orders]\n"
                    + "  WHERE id = ?\n"
                    + "  ORDER BY created_at DESC";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                List<OrderLine> orderLine = new ArrayList<>();
                int orderID = rs.getInt("id");

                String sql1 = "SELECT [id]\n"
                        + "      ,[order_id]\n"
                        + "      ,[product_id]\n"
                        + "      ,[quantity]\n"
                        + "      ,[total_price]\n"
                        + "      ,[colorID]\n"
                        + "      ,[sizeID]\n"
                        + "  FROM [dbo].[order_detail]\n"
                        + "  WHERE order_id = ?";

                PreparedStatement st1 = connection.prepareStatement(sql1);
                st1.setInt(1, orderID);

                ResultSet rs1 = st1.executeQuery();

                while (rs1.next()) {

                    Product product = getProductByID(rs1.getInt("product_id"));

                    OrderLine ol = new OrderLine(rs1.getInt("id"), orderID, rs1.getInt("quantity"), rs1.getDouble("total_price"),
                            rs1.getInt("colorID"), rs1.getInt("sizeID"), product);
                    orderLine.add(ol);
                }

                Order order = new Order(orderID, rs.getInt("user_id"), rs.getInt("status"), rs.getString("fullname"),
                        rs.getString("email"), rs.getString("phone"), rs.getString("address"), rs.getString("note"),
                        rs.getDate("created_at"), rs.getDate("update_at"), orderLine);

                return order;

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    private Product getProductByID(int id) {

        try {

            String sql = "SELECT p.[id]\n"
                    + "      ,p.[name]\n"
                    + "      ,p.[thumbnail_url]\n"
                    + "      ,p.[description]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[percent_discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[category_id]\n"
                    + "      ,p.[total_rating]\n"
                    + "      ,p.[created_at]\n"
                    + "      ,p.[deleted_at] as 'updateAt'\n"
                    + "      ,c.[name]\n"
                    + "      ,c.[created_at] as 'cCreateAt'\n"
                    + "      ,c.[deleted_at] as 'cUpdateAt'\n"
                    + "  FROM [dbo].[products] p  inner join [dbo].categories c\n"
                    + "  ON p.category_id = c.id\n"
                    + "  WHERE p.id = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                List<Image> image = new ArrayList<>();
                List<Color> color = new ArrayList<>();
                List<Size> size = new ArrayList<>();

                int pid = rs.getInt("id");

                Category category = new Category(rs.getInt("category_id"), rs.getString("name"), rs.getDate("cCreateAt"),
                        rs.getDate("cUpdateAt"));

                String sql1 = "SELECT [id]\n"
                        + "      ,[image_url]\n"
                        + "      ,[product_id]\n"
                        + "      ,[created_at]\n"
                        + "      ,[deleted_at]\n"
                        + "  FROM [dbo].[product_image]\n"
                        + "  WHERE [product_id] = ?";
                PreparedStatement st1 = connection.prepareStatement(sql1);
                st1.setInt(1, pid);

                ResultSet rs1 = st1.executeQuery();
                while (rs1.next()) {
                    image.add(new Image(rs1.getInt("id"), rs1.getString("image_url"), pid,
                            rs1.getDate("created_at"), rs1.getDate("deleted_at")));
                }

                String sql2 = "SELECT c.[id]\n"
                        + "      ,c.[name]\n"
                        + "      ,c.[bgr_hex]\n"
                        + "      ,c.[text_hex]\n"
                        + "      ,c.[created_at]\n"
                        + "      ,c.[deleted_at] as 'updateAt'\n"
                        + "  FROM [dbo].[colors] c inner join [dbo].[product_color] pc\n"
                        + "  on c.id = pc.color_id\n"
                        + "  WHERE pc.product_id = ?";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setInt(1, pid);

                ResultSet rs2 = st2.executeQuery();
                while (rs2.next()) {
                    color.add(new Color(rs2.getInt("id"), rs2.getString("name"), rs2.getString("bgr_hex"),
                            rs2.getString("text_hex"), rs2.getDate("created_at"), rs2.getDate("updateAt")));
                }

                String sql3 = "SELECT s.[id]\n"
                        + "      ,s.[name]\n"
                        + "      ,s.[created_at]\n"
                        + "      ,s.[deleted_at] as 'updateAt'\n"
                        + "  FROM [dbo].[sizes] s inner join [dbo].[product_size] ps\n"
                        + "  ON s.id = ps.size_id\n"
                        + "  WHERE ps.[product_id] = ?";
                PreparedStatement st3 = connection.prepareStatement(sql3);
                st3.setInt(1, pid);

                ResultSet rs3 = st3.executeQuery();
                while (rs3.next()) {
                    size.add(new Size(rs3.getInt("id"), rs3.getString("name"), rs3.getDate("created_at"), rs3.getDate("updateAt")));
                }

                Product product = new Product(pid, rs.getString("name"), rs.getString("thumbnail_url"),
                        rs.getString("description"), rs.getDouble("price"), rs.getFloat("percent_discount"), rs.getInt("quantity"),
                        rs.getDate("created_at"), rs.getDate("updateAt"),
                        category, image, color, size);
                return product;
            }

        } catch (SQLException e) {
            System.err.println("ProductDAO -> getAll(): " + e);
        }
        return null;
    }
}
