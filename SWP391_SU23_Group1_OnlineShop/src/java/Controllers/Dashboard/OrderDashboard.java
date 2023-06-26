/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Dashboard;

import DAL.CartDAO;
import Ultils.Common;
import DAL.SliderDAO;
import Models.Order;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "OrderDashboard", urlPatterns = {"/dashboard/order"})
public class OrderDashboard extends HttpServlet {

    

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
        CartDAO cd = new CartDAO();
        switch (action) {
            case "listing":
                request.setAttribute("data", cd.getAll());
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "detail":
                String xID = request.getParameter("id");
                int id = Common.parseInt(xID);

                Order order = cd.getOrderByID(id);
                request.setAttribute("order", order);
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;

            case "updateStatus":
                String id_raw = request.getParameter("id");
                int o_id = Common.parseInt(id_raw);
                
                String status_raw = request.getParameter("status");
                int status = Common.parseInt(status_raw);

                cd.updateStatus(o_id, status);
                response.sendRedirect(request.getContextPath() + "/dashboard/order/detail.ad?id=" + o_id);
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
        SliderDAO sd = new SliderDAO();
        switch (action) {
            case "listing":
                request.setAttribute("slider", sd.getAll());
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "add":
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "detail":

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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
