/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Dashboard;

import DAL.CategoryDAO;
import Ultils.Common;
import Models.Category;
import Ultils.SupportMessage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author trung
 */
@WebServlet(name = "CategoryDashboard", urlPatterns = {"/dashboard/category"})
public class CategoryDashboard extends HttpServlet {

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
            case "add":
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "detail":
                String id_raw = request.getParameter("id");
                int id = Common.parseInt(id_raw);

                CategoryDAO cd = new CategoryDAO();
                Category c = cd.getCategoryByID(id);

                request.setAttribute("data", c);
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
            case "detail":
                String id_raw = request.getParameter("id");
                int id = Common.parseInt(id_raw);
                update(request, response);
                response.sendRedirect(request.getContextPath() + "/dashboard/category/detail.ad?id=" + id);
                break;
            case "add":
                add(request, response);
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "404");
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CategoryDAO cd = new CategoryDAO();

        String name = request.getParameter("name");
        String id_raw = request.getParameter("id");
        int id = Common.parseInt(id_raw);

        Category c = cd.getCategoryByID(id);

        if (c != null) {
            if (cd.checkExits(name) && !c.getName().equals(name)) {
                request.setAttribute("message", "Category Name was Exists");
                request.setAttribute("name", name);
                SupportMessage.sendToastToDashboard(session, 0, "Update Failed!", "Category Name was Exists !");
            } else {
                c.setName(name);
                c.setUpdateAt(Common.getCurrentDate());
                cd.update(c);
                SupportMessage.sendToastToDashboard(session, 1, "Update Sucees!", "Update Category Successful !");
            }
        }

    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");

        CategoryDAO cd = new CategoryDAO();

        if (cd.checkExits(name)) {
            request.setAttribute("message", "Category Name was Exists");
            request.setAttribute("name", name);
            SupportMessage.sendToastToDashboard(session, 0, "Add Failed!", "Category Name was Exists");
        } else {
            cd.add(name);
            SupportMessage.sendToastToDashboard(session, 1, "Add Sucees!", "Add Category Successful !");

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
