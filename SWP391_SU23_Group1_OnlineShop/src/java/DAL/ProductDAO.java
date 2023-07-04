package DAL;

import Models.Category;
import Models.Color;
import Models.Image;
import Models.Product;
import Models.Size;
import Ultils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBContext {

    //getAll
    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();

        try {

            String sql = "SELECT p.[id]\n"
                    + "      ,p.[name]\n"
                    + "      ,p.[thumbnail_url]\n"
                    + "      ,p.[description]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[percent_discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[category_id]\n"
                    + "      ,p.[created_at]\n"
                    + "      ,p.[isActive]\n"
                    + "      ,p.[update_at] as 'updateAt'\n"
                    + "      ,c.[name] as 'categoryName'\n"
                    + "      ,c.[created_at] as 'cCreateAt'\n"
                    + "      ,c.[update_at] as 'cUpdateAt'\n"
                    + "  FROM [dbo].[products] p  inner join [dbo].categories c\n"
                    + "  ON p.category_id = c.id";

            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                List<Image> image = new ArrayList<>();
                List<Color> color = new ArrayList<>();
                List<Size> size = new ArrayList<>();

                int pid = rs.getInt("id");

                Category category = new Category(rs.getInt("category_id"), rs.getString("categoryName"), rs.getDate("cCreateAt"),
                        rs.getDate("cUpdateAt"));

                String sql1 = "SELECT [id]\n"
                        + "      ,[image_url]\n"
                        + "      ,[product_id]\n"
                        + "      ,[created_at]\n"
                        + "      ,[update_at]\n"
                        + "      ,[status]\n"
                        + "  FROM [dbo].[product_image]\n"
                        + "  WHERE [product_id] = ? and status = 1";
                PreparedStatement st1 = connection.prepareStatement(sql1);
                st1.setInt(1, pid);

                ResultSet rs1 = st1.executeQuery();
                while (rs1.next()) {
                    image.add(new Image(rs1.getInt("id"), rs1.getString("image_url"), pid,
                            rs1.getDate("created_at"), rs1.getDate("update_at"), rs1.getBoolean("status")));
                }

                String sql2 = "SELECT c.[id]\n"
                        + "      ,c.[name]\n"
                        + "      ,c.[bgr_hex]\n"
                        + "      ,c.[text_hex]\n"
                        + "      ,c.[created_at]\n"
                        + "      ,c.[update_at] as 'updateAt'\n"
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
                        + "      ,s.[update_at] as 'updateAt'\n"
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
                        rs.getDate("created_at"), rs.getDate("updateAt"), rs.getBoolean("isActive"),
                        category, image, color, size);

                list.add(product);

            }

        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public List<Product> getProductByKey(String key) {
        List<Product> list = new ArrayList<>();

        try {

            String sql = "SELECT p.[id]\n"
                    + "      ,p.[name]\n"
                    + "      ,p.[thumbnail_url]\n"
                    + "      ,p.[description]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[percent_discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[category_id]\n"
                    + "      ,p.[isActive]\n"
                    + "      ,p.[created_at]\n"
                    + "      ,p.[update_at] as 'updateAt'\n"
                    + "      ,c.[name] as 'categoryName'\n"
                    + "      ,c.[created_at] as 'cCreateAt'\n"
                    + "      ,c.[update_at] as 'cUpdateAt'\n"
                    + "  FROM [dbo].[products] p  inner join [dbo].categories c\n"
                    + "  ON p.category_id = c.id\n"
                    + "  WHERE p.[name] like ? or p.[price] like ? or c.[name] like ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            st.setString(2, "%" + key + "%");
            st.setString(3, "%" + key + "%");

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                List<Image> image = new ArrayList<>();
                List<Color> color = new ArrayList<>();
                List<Size> size = new ArrayList<>();

                int pid = rs.getInt("id");

                Category category = new Category(rs.getInt("category_id"), rs.getString("categoryName"), rs.getDate("cCreateAt"),
                        rs.getDate("cUpdateAt"));

                String sql1 = "SELECT [id]\n"
                        + "      ,[image_url]\n"
                        + "      ,[product_id]\n"
                        + "      ,[created_at]\n"
                        + "      ,[update_at]\n"
                        + "      ,[status]\n"
                        + "  FROM [dbo].[product_image]\n"
                        + "  WHERE [product_id] = ? and status = 1";
                PreparedStatement st1 = connection.prepareStatement(sql1);
                st1.setInt(1, pid);

                ResultSet rs1 = st1.executeQuery();
                while (rs1.next()) {
                    image.add(new Image(rs1.getInt("id"), rs1.getString("image_url"), pid,
                            rs1.getDate("created_at"), rs1.getDate("update_at"), rs1.getBoolean("status")));
                }

                String sql2 = "SELECT c.[id]\n"
                        + "      ,c.[name]\n"
                        + "      ,c.[bgr_hex]\n"
                        + "      ,c.[text_hex]\n"
                        + "      ,c.[created_at]\n"
                        + "      ,c.[update_at] as 'updateAt'\n"
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
                        + "      ,s.[update_at] as 'updateAt'\n"
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
                        rs.getDate("created_at"), rs.getDate("updateAt"), rs.getBoolean("isActive"),
                        category, image, color, size);

                list.add(product);

            }

        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    //get product by id
    public Product getProductByID(int id) {

        try {

            String sql = "SELECT p.[id]\n"
                    + "      ,p.[name]\n"
                    + "      ,p.[thumbnail_url]\n"
                    + "      ,p.[description]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[percent_discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[category_id]\n"
                    + "      ,p.[isActive]\n"
                    + "      ,p.[created_at]\n"
                    + "      ,p.[update_at] as 'updateAt'\n"
                    + "      ,c.[name] as 'categoryName'\n"
                    + "      ,c.[created_at] as 'cCreateAt'\n"
                    + "      ,c.[update_at] as 'cUpdateAt'\n"
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

                Category category = new Category(rs.getInt("category_id"), rs.getString("categoryName"), rs.getDate("cCreateAt"),
                        rs.getDate("cUpdateAt"));

                String sql1 = "SELECT [id]\n"
                        + "      ,[image_url]\n"
                        + "      ,[product_id]\n"
                        + "      ,[created_at]\n"
                        + "      ,[update_at]\n"
                        + "      ,[status]\n"
                        + "  FROM [dbo].[product_image]\n"
                        + "  WHERE [product_id] = ? and status = 1";
                PreparedStatement st1 = connection.prepareStatement(sql1);
                st1.setInt(1, pid);

                ResultSet rs1 = st1.executeQuery();
                while (rs1.next()) {
                    image.add(new Image(rs1.getInt("id"), rs1.getString("image_url"), pid,
                            rs1.getDate("created_at"), rs1.getDate("update_at"), rs1.getBoolean("status")));
                }

                String sql2 = "SELECT c.[id]\n"
                        + "      ,c.[name]\n"
                        + "      ,c.[bgr_hex]\n"
                        + "      ,c.[text_hex]\n"
                        + "      ,c.[created_at]\n"
                        + "      ,c.[update_at] as 'updateAt'\n"
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
                        + "      ,s.[update_at] as 'updateAt'\n"
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
                        rs.getDate("created_at"), rs.getDate("updateAt"), rs.getBoolean("isActive"),
                        category, image, color, size);

                return product;

            }

        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    //getListPage
    public List<Product> getListByPage(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public double getMaxPrice() {
        try {

            String sql = "SELECT MAX([price]) FROM [dbo].[products]";

            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> getProductByPrice(int min, int max) {
        List<Product> list = new ArrayList<>();

        try {

            String sql = "SELECT p.[id]\n"
                    + "      ,p.[name]\n"
                    + "      ,p.[thumbnail_url]\n"
                    + "      ,p.[description]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[percent_discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[category_id]\n"
                    + "      ,p.[isActive]\n"
                    + "      ,p.[created_at]\n"
                    + "      ,p.[update_at] as 'updateAt'\n"
                    + "      ,c.[name] as 'categoryName'\n"
                    + "      ,c.[created_at] as 'cCreateAt'\n"
                    + "      ,c.[update_at] as 'cUpdateAt'\n"
                    + "  FROM [dbo].[products] p  inner join [dbo].categories c\n"
                    + "  ON p.category_id = c.id\n"
                    + "  WHERE p.[price] BETWEEN ? AND ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, min);
            st.setInt(2, max);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                List<Image> image = new ArrayList<>();
                List<Color> color = new ArrayList<>();
                List<Size> size = new ArrayList<>();

                int pid = rs.getInt("id");

                Category category = new Category(rs.getInt("category_id"), rs.getString("categoryName"), rs.getDate("cCreateAt"),
                        rs.getDate("cUpdateAt"));

                String sql1 = "SELECT [id]\n"
                        + "      ,[image_url]\n"
                        + "      ,[product_id]\n"
                        + "      ,[created_at]\n"
                        + "      ,[update_at]\n"
                        + "      ,[status]\n"
                        + "  FROM [dbo].[product_image]\n"
                        + "  WHERE [product_id] = ? and status = 1";
                PreparedStatement st1 = connection.prepareStatement(sql1);
                st1.setInt(1, pid);

                ResultSet rs1 = st1.executeQuery();
                while (rs1.next()) {
                    image.add(new Image(rs1.getInt("id"), rs1.getString("image_url"), pid,
                            rs1.getDate("created_at"), rs1.getDate("update_at"), rs1.getBoolean("status")));
                }

                String sql2 = "SELECT c.[id]\n"
                        + "      ,c.[name]\n"
                        + "      ,c.[bgr_hex]\n"
                        + "      ,c.[text_hex]\n"
                        + "      ,c.[created_at]\n"
                        + "      ,c.[update_at] as 'updateAt'\n"
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
                        + "      ,s.[update_at] as 'updateAt'\n"
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
                        rs.getDate("created_at"), rs.getDate("updateAt"), rs.getBoolean("isActive"),
                        category, image, color, size);

                list.add(product);

            }

        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public List<Product> getProductByCategoryIDAnTopX(int x, int id) {
        List<Product> list = new ArrayList<>();

        try {

            String sql = "SELECT TOP(?) p.[id]\n"
                    + "      ,p.[name]\n"
                    + "      ,p.[thumbnail_url]\n"
                    + "      ,p.[description]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[percent_discount]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[category_id]\n"
                    + "      ,p.[isActive]\n"
                    + "      ,p.[created_at]\n"
                    + "      ,p.[update_at] as 'updateAt'\n"
                    + "      ,c.[name] as 'categoryName'\n"
                    + "      ,c.[created_at] as 'cCreateAt'\n"
                    + "      ,c.[update_at] as 'cUpdateAt'\n"
                    + "  FROM [dbo].[products] p  inner join [dbo].categories c\n"
                    + "  ON p.category_id = c.id\n"
                    + "  WHERE p.[category_id] = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, x);
            st.setInt(2, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                List<Image> image = new ArrayList<>();
                List<Color> color = new ArrayList<>();
                List<Size> size = new ArrayList<>();

                int pid = rs.getInt("id");

                Category category = new Category(rs.getInt("category_id"), rs.getString("categoryName"), rs.getDate("cCreateAt"),
                        rs.getDate("cUpdateAt"));

                String sql1 = "SELECT [id]\n"
                        + "      ,[image_url]\n"
                        + "      ,[product_id]\n"
                        + "      ,[created_at]\n"
                        + "      ,[update_at]\n"
                        + "      ,[status]\n"
                        + "  FROM [dbo].[product_image]\n"
                        + "  WHERE [product_id] = ? and status = 1";
                PreparedStatement st1 = connection.prepareStatement(sql1);
                st1.setInt(1, pid);

                ResultSet rs1 = st1.executeQuery();
                while (rs1.next()) {
                    image.add(new Image(rs1.getInt("id"), rs1.getString("image_url"), pid,
                            rs1.getDate("created_at"), rs1.getDate("update_at"), rs1.getBoolean("status")));
                }

                String sql2 = "SELECT c.[id]\n"
                        + "      ,c.[name]\n"
                        + "      ,c.[bgr_hex]\n"
                        + "      ,c.[text_hex]\n"
                        + "      ,c.[created_at]\n"
                        + "      ,c.[update_at] as 'updateAt'\n"
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
                        + "      ,s.[update_at] as 'updateAt'\n"
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
                        rs.getDate("created_at"), rs.getDate("updateAt"), rs.getBoolean("isActive"),
                        category, image, color, size);

                list.add(product);

            }

        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public List<Product> getProductPopularTopX(int x) {
        List<Product> list = new ArrayList<>();

        try {

            String sql = "SELECT TOP(?) p.[id]\n"
                    + "       ,p.[name]\n"
                    + "       ,p.[thumbnail_url]\n"
                    + "       ,p.[description]\n"
                    + "       ,p.[price]\n"
                    + "       ,p.[percent_discount]\n"
                    + "       ,p.[quantity]\n"
                    + "       ,p.[category_id]\n"
                    + "      ,p.[isActive]\n"
                    + "       ,p.[created_at]\n"
                    + "       ,p.[update_at] as 'updateAt'\n"
                    + "       ,c.[name] as 'categoryName'\n"
                    + "       ,c.[created_at] as 'cCreateAt'\n"
                    + "       ,c.[update_at] as 'cUpdateAt'\n"
                    + "FROM [dbo].[products] p  inner join [dbo].categories c\n"
                    + "ON p.category_id = c.id\n"
                    + ", (SELECT od.pid, COUNT(od.pid) as 'totalSold' FROM (SELECT [product_id] as 'pid' FROM [dbo].[order_detail]) as od GROUP BY od.pid) as sold\n"
                    + "WHERE p.id IN (sold.pid)\n"
                    + "ORDER BY sold.totalSold DESC";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, x);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                List<Image> image = new ArrayList<>();
                List<Color> color = new ArrayList<>();
                List<Size> size = new ArrayList<>();

                int pid = rs.getInt("id");

                Category category = new Category(rs.getInt("category_id"), rs.getString("categoryName"), rs.getDate("cCreateAt"),
                        rs.getDate("cUpdateAt"));

                String sql1 = "SELECT [id]\n"
                        + "      ,[image_url]\n"
                        + "      ,[product_id]\n"
                        + "      ,[created_at]\n"
                        + "      ,[update_at]\n"
                        + "      ,[status]\n"
                        + "  FROM [dbo].[product_image]\n"
                        + "  WHERE [product_id] = ? and status = 1";
                PreparedStatement st1 = connection.prepareStatement(sql1);
                st1.setInt(1, pid);

                ResultSet rs1 = st1.executeQuery();
                while (rs1.next()) {
                    image.add(new Image(rs1.getInt("id"), rs1.getString("image_url"), pid,
                            rs1.getDate("created_at"), rs1.getDate("update_at"), rs1.getBoolean("status")));
                }

                String sql2 = "SELECT c.[id]\n"
                        + "      ,c.[name]\n"
                        + "      ,c.[bgr_hex]\n"
                        + "      ,c.[text_hex]\n"
                        + "      ,c.[created_at]\n"
                        + "      ,c.[update_at] as 'updateAt'\n"
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
                        + "      ,s.[update_at] as 'updateAt'\n"
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
                        rs.getDate("created_at"), rs.getDate("updateAt"), rs.getBoolean("isActive"),
                        category, image, color, size);

                list.add(product);

            }

        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public int getCountSoldByID(int id) {
        try {

            String sql = "SELECT COUNT(*) as 'CountSold' FROM [dbo].[order_detail] WHERE product_id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public int getLastID() {
        try {

            String sql = "SELECT TOP(1) id FROM [dbo].[products] ORDER BY id DESC";

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public boolean add(Product p) {
        try {

            String sql = "INSERT INTO [dbo].[products]\n"
                    + "([name] , [thumbnail_url], [description], [price], [percent_discount], [quantity]\n"
                    + ", [category_id], [created_at], [update_at], [isActive])\n"
                    + "VALUES	(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setString(2, p.getThumbnail_url());
            st.setString(3, p.getDescription());
            st.setDouble(4, p.getPrice());
            st.setFloat(5, p.getPercent_discount());
            st.setInt(6, p.getQuantity());
            st.setInt(7, p.getCategory().getId());
            st.setDate(8, p.getCreateAt());
            st.setDate(9, p.getUpdateAt());
            st.setBoolean(10, p.isActive());

            st.executeUpdate();

            if (p.getColor() != null && !p.getColor().isEmpty()) {
                for (Color item : p.getColor()) {
                    String sql_color = "INSERT INTO [dbo].[product_color] ([color_id],[product_id],[created_at],[update_at])\n"
                            + "VALUES	(?, ?, ?, ?)";

                    PreparedStatement st_color = connection.prepareStatement(sql_color);
                    st_color.setInt(1, item.getId());
                    st_color.setInt(2, p.getId());
                    st_color.setDate(3, item.getCreateAt());
                    st_color.setDate(4, item.getUpdateAt());

                    st_color.executeUpdate();
                }
            }

            if (p.getSize() != null && !p.getSize().isEmpty()) {
                for (Size item : p.getSize()) {
                    String sql_size = "INSERT INTO [dbo].[product_size]([size_id],[product_id],[created_at],[update_at])\n"
                            + "VALUES	(?, ?, ?, ?)";
                    PreparedStatement st_size = connection.prepareStatement(sql_size);
                    st_size.setInt(1, item.getId());
                    st_size.setInt(2, p.getId());
                    st_size.setDate(3, item.getCreateAt());
                    st_size.setDate(4, item.getUpdateAt());

                    st_size.executeUpdate();
                }
            }

            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }

    }

    public boolean update(Product p) {
        try {

            String sql = "UPDATE [dbo].[products]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[thumbnail_url] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[percent_discount] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[category_id] = ?\n"
                    + "      ,[update_at] = ?\n"
                    + "      ,[isActive] = ?\n"
                    + " WHERE id = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setString(2, p.getThumbnail_url());
            st.setString(3, p.getDescription());
            st.setDouble(4, p.getPrice());
            st.setFloat(5, p.getPercent_discount());
            st.setInt(6, p.getQuantity());
            st.setInt(7, p.getCategory().getId());
            st.setDate(8, p.getUpdateAt());
            st.setBoolean(9, p.isActive());
            st.setInt(10, p.getId());

            st.executeUpdate();

            if (p.getImage() != null && !p.getImage().isEmpty()) {

                for (Image item : p.getImage()) {
                    String sql_image = "INSERT INTO [dbo].[product_image] ([image_url], [product_id], [created_at], [update_at])\n"
                            + "VALUES(?, ?, ?, ?)";

                    PreparedStatement st_image = connection.prepareStatement(sql_image);
                    st_image.setString(1, item.getUrl());
                    st_image.setInt(2, p.getId());
                    st_image.setDate(3, item.getCreateAt());
                    st_image.setDate(4, item.getUpdateAt());

                    st_image.executeUpdate();
                }
            }

            if (p.getColor() != null && !p.getColor().isEmpty()) {
                for (Color item : p.getColor()) {
                    String sql_color = "UPDATE [dbo].[product_color]\n"
                            + "   SET [color_id] = ?\n"
                            + "      ,[update_at] = ?\n"
                            + " WHERE id = ?";

                    PreparedStatement st_color = connection.prepareStatement(sql_color);
                    st_color.setInt(1, item.getId());
                    st_color.setDate(2, item.getUpdateAt());
                    st_color.setInt(3, p.getId());

                    st_color.executeUpdate();
                }
            }

            if (p.getSize() != null && !p.getSize().isEmpty()) {
                for (Size item : p.getSize()) {
                    String sql_size = "UPDATE [dbo].[product_size]\n"
                            + "   SET [size_id] = ?\n"
                            + "      ,[update_at] = ?\n"
                            + " WHERE id = ?";
                    PreparedStatement st_size = connection.prepareStatement(sql_size);
                    st_size.setInt(1, item.getId());
                    st_size.setDate(2, item.getUpdateAt());
                    st_size.setInt(3, p.getId());

                    st_size.executeUpdate();
                }
            }

            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

}
