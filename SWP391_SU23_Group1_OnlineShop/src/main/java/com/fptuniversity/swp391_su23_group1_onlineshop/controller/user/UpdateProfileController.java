/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.controller.user;

import com.fptuniversity.swp391_su23_group1_onlineshop.dao.UserDao;
import com.fptuniversity.swp391_su23_group1_onlineshop.model.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author dotra
 */
@WebServlet(name = "UpdateProfileController", urlPatterns = {"/updateProfile"})
public class UpdateProfileController extends HttpServlet {

    private static final String HOME_PAGE = "home";
    private static final String PROFILE_PAGE_JSP = "userProfile.jsp";
    private static final String PROFILE_PAGE = "userProfile";
    private static final String FORWARD = "FORWARD";
    private static final String SEND_REDIRECT = "SEND_REDIRECT";

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
        String type = SEND_REDIRECT;
        String url = PROFILE_PAGE;

        try {
            String fullname = (String) request.getParameter("fullname");
            String phone = (String) request.getParameter("phone");
            String email = (String) request.getParameter("email");
            String address = (String) request.getParameter("address");
            User user = (User) request.getSession().getAttribute("account_infomation");
            user.setFullname(fullname);
            user.setPhone(phone);
            user.setEmail(email);
            user.setAddress(address);
            boolean isSuccess = UserDao.updateUser(user);

        } catch (Exception ex) {
            type = SEND_REDIRECT;
            url = HOME_PAGE;
        } finally {
            switch (type) {
                case FORWARD:
                    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                    dispatcher.forward(request, response);
                    break;
                case SEND_REDIRECT:
                    response.sendRedirect(url);
                    break;
                default:
                    throw new AssertionError();
            }
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
//        processRequest(request, response);
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
        processRequest(request, response);
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
