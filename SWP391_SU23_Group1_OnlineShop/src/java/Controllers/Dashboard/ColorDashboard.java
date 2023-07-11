/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Dashboard;

import Ultils.Common;
import DAL.DAO;
import Models.Color;
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
 * @author linh
 */
@WebServlet(name = "ColorDashboard", urlPatterns = {"/dashboard/color"})
public class ColorDashboard extends HttpServlet {

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
        DAO dao = new DAO();
        switch (action) {
            case "listing":
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "detail":
                String id_raw = request.getParameter("id");
                int id = Common.parseInt(id_raw);
                Color color = dao.getColorById(id);
                request.setAttribute("color", color);
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "add":
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
                updateColor(request, response);
                break;
            case "add":
                add(request, response);
                response.sendRedirect(request.getContextPath() + "/dashboard/color/listing.ad");
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "404");
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
        }
    }

    private void updateColor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Common.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String bgr_hex = request.getParameter("bgr_hex");
        String text_hex = request.getParameter("text_hex");

        DAO dao = new DAO();
        Color color = dao.getColorById(id);
        HttpSession session = request.getSession();

        if (dao.checkNameColorExist(name) && !name.equals(color.getName())) {
            session.setAttribute("message", "Color Name Was Exist !");
            SupportMessage.sendToastToDashboard(session, 0, "Update Color", "Failed !");

        } else {
            color.setName(name);
            color.setBgr_hex(bgr_hex);
            color.setText_hex(text_hex);
            color.setUpdateAt(Common.getCurrentDate());
            boolean status = dao.updateColor(color);
            if (status) {
                SupportMessage.sendToastToDashboard(session, 1, "Update Color", "Successful !");
            } else {
                SupportMessage.sendToastToDashboard(session, 0, "Update Color", "Failed !");
            }
        }
        response.sendRedirect(request.getContextPath() + "/dashboard/color/detail.ad?id=" + id);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String bgr_hex = request.getParameter("bgr_hex");
        String text_hex = request.getParameter("text_hex");

        DAO dao = new DAO();
        HttpSession session = request.getSession();

        if (dao.checkNameColorExist(name)) {
            session.setAttribute("message", "Color Name Was Exist !");
            SupportMessage.sendToastToDashboard(session, 0, "Add Color", "Failed !");

        } else {
            Color color = new Color(-1, name, bgr_hex, text_hex, Common.getCurrentDate(), Common.getCurrentDate());
            boolean status = dao.addColor(color);

            if (status) {
                SupportMessage.sendToastToDashboard(session, 1, "Add Color", "Successful !");
            } else {
                SupportMessage.sendToastToDashboard(session, 0, "Add Color", "Failed !");
            }
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
