/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.fptuniversity.swp391_su23_group1_onlineshop.util.ConnectionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

/**
 *
 * @author hoang
 */
public class ProductDAO extends ConnectionDB {

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
    
}