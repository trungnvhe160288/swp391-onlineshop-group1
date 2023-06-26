package Controllers.Dashboard;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DAL.CategoryDAO;
import Ultils.Common;
import DAL.DAO;
import DAL.ProductDAO;
import Models.Category;
import Models.Color;
import Models.Image;
import Models.Product;
import Models.Size;
import Ultils.SupportMessage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author trung
 */
@WebServlet(urlPatterns = {"/dashboard/product"})
public class ProductDashboard extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (String) request.getAttribute("action");
        ProductDAO pd = new ProductDAO();

        switch (action) {
            case "listing":
                request.setAttribute("data", pd.getAll());
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "add":
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "detail":
                request.setAttribute("data", pd.getProductByID(Common.parseInt(request.getParameter("id"))));
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "404");
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (String) request.getAttribute("action");
        switch (action) {
            case "listing":
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "add":
                add(request, response);
                response.sendRedirect(request.getContextPath() + "/dashboard/product/listing.ad");
                break;
            case "detail":
                String id = request.getParameter("id");
                update(request, response);
                response.sendRedirect(request.getContextPath() + "/dashboard/product/detail.ad?id=" + id);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "404");
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse respons) throws IOException, ServletException {
        ProductDAO pd = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();

        String id_raw = request.getParameter("id");
        int id = Common.parseInt(id_raw);

        String name = request.getParameter("productName");
        String price_raw = request.getParameter("price");
        String percent_discount_raw = request.getParameter("percent_discount");
        String quantity_raw = request.getParameter("quantity");
        String actived = request.getParameter("actived");
        String description = request.getParameter("description");
        String[] colors = request.getParameterValues("color");
        String[] sizes = request.getParameterValues("size");
        String category_id = request.getParameter("category");
        int categoryid = Common.parseInt(category_id);
        double price = Common.parseDouble(price_raw);
        float percent_discount = Common.parseFloat(percent_discount_raw);
        int quantity = Common.parseInt(quantity_raw);

        Category c = cd.getCategoryByID(categoryid);
        Product p = pd.getProductByID(id);

        String thumbnail_image = "/images/product/" + c.getName().toLowerCase() + "/product_thumbnail_" + p.getId() + ".jpg";
        String uploadPath = "/images/product/" + c.getName().toLowerCase();
        List<Image> image = upload(request, uploadPath, p.getId());
        List<Color> color = getColor(colors);
        List<Size> size = getSize(sizes);

        p.setActive(actived.equalsIgnoreCase("true"));
        p.setName(name);
        p.setPrice(price);
        p.setPercent_discount(percent_discount);
        p.setQuantity(quantity);
        p.setDescription(description);
        p.setColor(color);
        p.setSize(size);
        p.setUpdateAt(Common.getCurrentDate());
        p.setCategory(c);

        System.out.println(image);

        if (image != null && !image.isEmpty()) {
            p.setThumbnail_url(thumbnail_image);
            p.setImage(image);
        }

        boolean status = pd.update(p);

        if (status) {
            SupportMessage.sendToastToDashboard(request.getSession(), 1, "ADD Product", "Successful !");
        } else {
            SupportMessage.sendToastToDashboard(request.getSession(), 0, "ADD Product", "Failed !");
        }

    }

    private void add(HttpServletRequest request, HttpServletResponse respons) throws IOException, ServletException {
        ProductDAO pd = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();

        int id = pd.getLastID() + 1;

        String name = request.getParameter("productName");
        String price = request.getParameter("price");
        String percent_discount = request.getParameter("percent_discount");
        String quantity = request.getParameter("quantity");
        String actived = request.getParameter("actived");
        String description = request.getParameter("description");
        String[] colors = request.getParameterValues("color");
        String[] sizes = request.getParameterValues("size");
        String category_id = request.getParameter("category");

        Category category = cd.getCategoryByID(Common.parseInt(category_id));
        List<Color> color = getColor(colors);
        List<Size> size = getSize(sizes);

        String thumbnail_image = "/images/product/" + category.getName().toLowerCase() + "/product_thumbnail_" + id + ".jpg";
        String uploadPath = "/images/product/" + category.getName().toLowerCase();
        List<Image> image = upload(request, uploadPath, id);

        Product p = new Product(id, name, thumbnail_image, description, Common.parseDouble(price), Common.parseFloat(percent_discount),
                Common.parseInt(quantity), Common.getCurrentDate(), Common.getCurrentDate(), actived.equalsIgnoreCase("true"),
                category, image, color, size);

        boolean status = pd.add(p);

        if (status) {
            SupportMessage.sendToastToDashboard(request.getSession(), 1, "ADD Product", "Successful !");
        } else {
            SupportMessage.sendToastToDashboard(request.getSession(), 0, "ADD Product", "Failed !");
        }

    }

    private List<Size> getSize(String[] sid) {
        List<Size> list = new ArrayList<>();

        for (String item : sid) {
            list.add(new Size(Common.parseInt(item), "", Common.getCurrentDate(), Common.getCurrentDate()));
        }
        return list;
    }

    private List<Color> getColor(String[] cid) {
        List<Color> list = new ArrayList<>();

        for (String item : cid) {
            list.add(new Color(Common.parseInt(item), "", "", "", Common.getCurrentDate(), Common.getCurrentDate()));
        }
        return list;
    }

    private List<Image> upload(HttpServletRequest request, String uploadPath, int id) throws IOException, ServletException {
        List<Image> image = new ArrayList<>();

        int i = -1;
        for (Part part : request.getParts()) {

            String submited = part.getSubmittedFileName();

            if (submited != null) {
                i++;
                if (i == 0) {
                    String thumbnail_image = "product_thumbnail_" + id + ".jpg";
                    part.write("D:/SU23/Java/Group1_Online_Shop/web" + uploadPath + "/" + thumbnail_image);
                    System.out.println("selected: " + submited);
                } else {
                    String url = uploadPath + "/" + "product_image_" + id + "_" + i + ".jpg";
                    part.write("D:/SU23/Java/Group1_Online_Shop/web" + url);
                    image.add(new Image(-1, url, id, Common.getCurrentDate(), Common.getCurrentDate()));
                }
            }
        }

        return image;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
