/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Dashboard;

import Ultils.Common;
import DAL.DAO;
import Models.Color;
import Models.Size;
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
@WebServlet(name = "SizeDashboard", urlPatterns = {"/dashboard/size"})
public class SizeDashboard extends HttpServlet {

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
            case "detail":
                String id_raw = request.getParameter("id");
                int id = Common.parseInt(id_raw);
                request.setAttribute("size", new DAO().getSizeByID(id));
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
                String id = request.getParameter("id");
                update(request, response);
                response.sendRedirect(request.getContextPath() + "/dashboard/size/detail.ad?id=" + id);
                break;
            case "add":
                add(request, response);
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

    private void update(HttpServletRequest request, HttpServletResponse response) {
        String id_raw = request.getParameter("id");
        int id = Common.parseInt(id_raw);
        String name = request.getParameter("name");

        DAO dao = new DAO();
        //getSizeByID
        Size size = dao.getSizeByID(id);
        HttpSession session = request.getSession();

        if (dao.checkNameSizeExist(name) && !size.getName().equalsIgnoreCase(name)) {
            session.setAttribute("message", "Size Name Was Exist !");
            SupportMessage.sendToastToDashboard(session, 0, "Update Size", "Failed !");
        } else {
            size.setName(name);
            size.setUpdateAt(Common.getCurrentDate());

            boolean status = dao.updateSize(size);

            if (status) {
                SupportMessage.sendToastToDashboard(session, 1, "Update Size", "Successful !");
            } else {
                SupportMessage.sendToastToDashboard(session, 0, "Update Size", "Failed !");
            }
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");

        DAO dao = new DAO();
        HttpSession session = request.getSession();

        if (!dao.checkNameSizeExist(name)) {
            Size size = new Size(-1, name, Common.getCurrentDate(), Common.getCurrentDate());

            boolean status = dao.addSize(size);

            if (status) {
                SupportMessage.sendToastToDashboard(session, 1, "Add Size", "Successful !");
            } else {
                SupportMessage.sendToastToDashboard(session, 0, "Add Size", "Failed !");
            }
            response.sendRedirect(request.getContextPath() + "/dashboard/size/listing.ad");

        } else {
            request.setAttribute("name", name);
            request.setAttribute("message", "Size Name Was Exist !");
            SupportMessage.sendToastToDashboard(session, 0, "Add Size", "Failed !");
            request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
        }

    }

}
