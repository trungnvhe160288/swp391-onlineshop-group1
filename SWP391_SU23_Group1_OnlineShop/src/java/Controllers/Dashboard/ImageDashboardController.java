/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Dashboard;

import Ultils.Common;
import DAL.DAO;
import DAL.ProductDAO;
import Models.Image;
import Ultils.SupportImage;
import Ultils.SupportMessage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author quang
 */
@WebServlet(name = "ImageDashboardController", urlPatterns = {"/dashboard/image"})
public class ImageDashboardController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ImageDashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImageDashboardController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        switch (action) {
            case "listing":
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "image":
                int id = Common.parseInt(request.getParameter("id"));
                request.setAttribute("data", new DAO().getImageById(id));
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "add":

                request.setAttribute("products", new ProductDAO().getAll());
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "updateStatus":
                updateStatus(request, response);
                break;

            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "404");
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
        }
    }

    private void updateStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Common.parseInt(request.getParameter("id"));
        String status_raw = request.getParameter("status");

        if (status_raw != null && !status_raw.isEmpty() && id != 0) {
            DAO dao = new DAO();

            boolean status = dao.updateStatus(id, status_raw.equalsIgnoreCase("true"));

            if (status) {
                SupportMessage.sendToastToDashboard(request.getSession(), 1, "Update Status", "Successful !");
            } else {
                SupportMessage.sendToastToDashboard(request.getSession(), 0, "Update Status", "Failed !");
            }
        }

        response.sendRedirect(request.getContextPath() + "/dashboard/image/listing.ad");
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
        DAO dao = new DAO();

        switch (action) {
            case "updateImage":
                int id = Common.parseInt(request.getParameter("id"));
                Image image = dao.getImageById(id);

                String uploadPath = "/images/product/";
                String name = "product_image_" + image.getProduct_id() + "_" + id;
                String url = SupportImage.uploadImage(request, response, uploadPath, name);

                if (url != null && !url.isEmpty()) {
                    image.setUrl(uploadPath + url);
                    image.setUpdateAt(Common.getCurrentDate());

                    boolean status = dao.updateImage(image);

                    if (status) {
                        SupportMessage.sendToastToDashboard(request.getSession(), 1, "Update Image", "Successful !");
                    } else {
                        SupportMessage.sendToastToDashboard(request.getSession(), 0, "Update Image", "Failed !");
                    }
                }

                response.sendRedirect(request.getContextPath() + "/dashboard/image/image.ad?id=" + id);
                break;
            case "add":
                String pid_raw = request.getParameter("pid");
                int pid = Common.parseInt(pid_raw);

                int new_id = dao.getLastImageId() + 1;

                String add_uploadPath = "/images/product/";
                String add_name = "product_image_" + pid + "_" + new_id;
                String add_url = SupportImage.uploadImage(request, response, add_uploadPath, add_name);

                if (add_url != null && !add_url.isEmpty()) {
                    String image_url = add_uploadPath + add_url;
                    Image add_image = new Image(new_id, image_url, pid, Common.getCurrentDate(), Common.getCurrentDate(), true);

                    boolean status = dao.addImage(add_image);

                    if (status) {
                        SupportMessage.sendToastToDashboard(request.getSession(), 1, "Add Image", "Successful !");
                        response.sendRedirect(request.getContextPath() + "/dashboard/image/image.ad?id=" + new_id);
                    } else {
                        SupportMessage.sendToastToDashboard(request.getSession(), 0, "Add Image", "Failed !");
                        request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);

                    }
                }

                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "404");
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
        }
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
