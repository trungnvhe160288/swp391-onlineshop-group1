/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import com.fptuniversity.swp391_su23_group1_onlineshop.util.ConnectionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import model.Product;

/**
 *
 * @author hoang
 */
public class ProductDAO extends ConnectionDB implements IDAO<Product> {

    private final DecimalFormat df = new DecimalFormat("#.00");
    private final String SQL_INSERT = "INSERT INTO dbo.Product\n"
            + "(\n"
            + "    productName,\n"
            + "    image,\n"
            + "    price,\n"
            + "    description,\n"
            + "    supplier,\n"
            + "    categoryID\n"
            + ")\n"
            + "VALUES\n"
            + "(?, ?, ?, ?, ?, ?)";

    private final String SQL_UPDATE = "UPDATE dbo.Product SET productName = ?, image = ?, price = ?, description = ?, supplier = ?, categoryID = ? WHERE productID = ?";
    private final String SQL_DELETE = "DELETE FROM dbo.Product WHERE productID = ?";

    @Override
    public List<Product> parse(String sql) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Product get(int id) {
        Product p = new Product();
        String sql = "SELECT * FROM dbo.Product WHERE productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setImage(rs.getString("image"));
                float price = rs.getFloat("price");
                price = Float.parseFloat(df.format(price));
                p.setPrice(price);
                p.setDescription(rs.getString("description"));
                p.setSupplier(rs.getString("supplier"));
                p.setCategory(new CategoryDAO().get(rs.getInt("categoryID")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return p;
    }

    @Override
    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getFloat("price"));
                p.setDescription(rs.getString("description"));
                p.setSupplier(rs.getString("supplier"));
                p.setCategory(new CategoryDAO().get(rs.getInt("categoryID")));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public void create(Product t) {
        try {
            PreparedStatement st = connection.prepareStatement(SQL_INSERT);
            st.setString(1, t.getProductName());
            st.setString(2, t.getImage());
            st.setFloat(3, t.getPrice());
            st.setString(4, t.getDescription());
            st.setString(5, t.getSupplier());
            st.setInt(6, t.getCategory().getCategoryID());
            ResultSet rs = st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Product t) {
        try {
            PreparedStatement st = connection.prepareStatement(SQL_UPDATE);
            st.setString(1, t.getProductName());
            st.setString(2, t.getImage());
            st.setFloat(3, t.getPrice());
            st.setString(4, t.getDescription());
            st.setString(5, t.getSupplier());
            st.setInt(6, t.getCategory().getCategoryID());
            st.setInt(7, t.getProductID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void delete(Product t) {
        try {
            PreparedStatement st = connection.prepareStatement(SQL_DELETE);
            st.setInt(1, t.getProductID());
            ResultSet rs = st.executeQuery();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

//    public List<Product> getCheap(int categoryID) {
//        List<Product> cheap = new ArrayList<>();
//        String sql = "SELECT TOP 4 * FROM product WHERE productID IN (SELECT DISTINCT productID FROM dbo.storage) AND categoryID = " + categoryID + " ORDER BY price ASC";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Product p = new Product();
//                p.setProductID(rs.getInt("productID"));
//                p.setProductName(rs.getString("productName"));
//                p.setDescription(rs.getString("description"));
//                p.setImage(rs.getString("image"));
//                float price = rs.getFloat("price");
//                price = Float.parseFloat(df.format(price));
//                p.setPrice(price);
//                p.setSupplier(rs.getString("supplier"));
//                p.setCategory(new CategoryDAO().get(rs.getInt("categoryID")));
//                cheap.add(p);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return cheap;
//    }
    public List<Product> getCheap(int categoryID) {
    List<Product> cheap = new ArrayList<>();
    String sql = "SELECT TOP 4 * FROM product WHERE productID IN (SELECT DISTINCT productID FROM dbo.storage) AND categoryID = ? ORDER BY price ASC";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, categoryID);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Product p = new Product();
            p.setProductID(rs.getInt("productID"));
            p.setProductName(rs.getString("productName"));
            p.setDescription(rs.getString("description"));
            p.setImage(rs.getString("image"));
            float price = rs.getFloat("price");
            price = Float.parseFloat(df.format(price));
            p.setPrice(price);
            p.setSupplier(rs.getString("supplier"));
            p.setCategory(new CategoryDAO().get(rs.getInt("categoryID")));
            cheap.add(p);
        }
        if (cheap.isEmpty()) { //Kiểm tra xem có sản phẩm nào không
            System.out.println("Không có sản phẩm giá rẻ nào hiện có.");
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return cheap;
}
    public List<Product> getProductByName(String productName) {
        productName = productName.replaceAll(" ", "%");
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Product WHERE productID IN (SELECT DISTINCT productID FROM dbo.storage) and productName like '%" + productName + "%' ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, productName);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getFloat("price"));
                p.setDescription(rs.getString("description"));
                p.setSupplier(rs.getString("supplier"));
                p.setCategory(new CategoryDAO().get(rs.getInt("categoryID")));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByPage(List<Product> list, int start, int end) {
        List<Product> t = new ArrayList<>();
        for (int i = start; i < end; i++) {
            t.add(list.get(i));
        }
        return t;
    }

    public List<Integer> getNumLeft(int productID) {
        List<Integer> numLeft = new ArrayList<>();
        String sql = "SELECT num_left FROM dbo.storage\n"
                + "WHERE productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                numLeft.add(rs.getInt("num_left"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numLeft;
    }

    public List<String> getSize(int productID) {
        List<String> t = new ArrayList<>();
        String sql = "SELECT size FROM dbo.storage\n"
                + "WHERE productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                t.add(rs.getString("size"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return t;
    }

    public List<Product> getProductByCategory(int categoryID) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Product WHERE productID IN (SELECT DISTINCT productID FROM dbo.storage) and 1=1 ";
        if (categoryID != 0) {
            sql = sql.concat("and categoryID = " + categoryID + " ");
        }
        sql = sql.concat("order by categoryID desc, productID");
        try {
            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getFloat("price"));
                p.setDescription(rs.getString("description"));
                p.setSupplier(rs.getString("supplier"));
                p.setCategory(new CategoryDAO().get(rs.getInt("categoryID")));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println(sql);
        return list;
    }
    public static void main(String[] args) {
        List<Product> list = new ProductDAO().getProductByCategory(1);
        for (Product product : list) {
            System.out.println(product);
        }
    }
}
