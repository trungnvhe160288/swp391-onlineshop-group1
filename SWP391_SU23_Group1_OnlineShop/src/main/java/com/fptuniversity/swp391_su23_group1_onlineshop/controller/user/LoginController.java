/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.controller.user;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import com.fptuniversity.swp391_su23_group1_onlineshop.dao.UserDao;
import com.fptuniversity.swp391_su23_group1_onlineshop.model.User;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String SESSION_ACCOUNT_INFOMATION = "account_infomation";
    private static final String ATTRIBUTE_ERROR = "error";
    private static final String HOME_PAGE = "home";
    private static final String LOGIN_PAGE_JSP = "login.jsp";
    private static final String ERROR_USERNAME_PASSWORD_INCORRECT = "Username or password incorrect.";
    private static final String FORWARD = "FORWARD";
    private static final String SEND_REDIRECT = "SEND_REDIRECT";

    protected void processRequestDoGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String type = FORWARD;
        try {
            String token = "";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("token")) {
                        token = cookie.getValue();
                    }
                }
            }
            if (!token.equals("")) {
                User user = UserDao.userLoginWithTokenRememberMe(token);
                System.out.println(user);
                HttpSession session = request.getSession(true);
                session.setAttribute(SESSION_ACCOUNT_INFOMATION, user);
                type = SEND_REDIRECT;

            }
            String error = (String) request.getAttribute(ATTRIBUTE_ERROR);
            if (error == null) {
                error = "";
            }
            request.setAttribute(ATTRIBUTE_ERROR, error);
        } catch (SQLException e) {
        } finally {
            switch (type) {
                case FORWARD:
                    RequestDispatcher dispatcher = request.getRequestDispatcher(LOGIN_PAGE_JSP);
                    dispatcher.forward(request, response);
                    break;
                case SEND_REDIRECT:
                    response.sendRedirect(SEND_REDIRECT);
                    break;
                default:
                    throw new AssertionError();
            }

        }
    }

    /**
     * Processes requests for both HTTP <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequestDoPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("DO POST");
        User user = null;
        request.setAttribute(ATTRIBUTE_ERROR, null);

        /* TODO output your page here. You may use following sample code. */
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember-me");

        try {
            if (rememberMe != null) {
                String token = String.format("%x", (int) (Math.random() * 20000000)) + username.hashCode();
                UserDao.createTokenByUsername(token, username);
                Cookie cookie = new Cookie("token", token);
                cookie.setMaxAge(60 * 2);
                response.addCookie(cookie);
            }
            user = UserDao.userLoginByUsernameAndPassowrd(username, password);

        } catch (SQLException e) {
            response.sendRedirect("invalid.html");
        } finally {
            if (user == null) {
                request.setAttribute(ATTRIBUTE_ERROR, ERROR_USERNAME_PASSWORD_INCORRECT);
                this.processRequestDoGet(request, response);
            } else {
                HttpSession session = request.getSession(true);
                session.setAttribute(SESSION_ACCOUNT_INFOMATION, user);
                response.sendRedirect(HOME_PAGE);
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
        processRequestDoGet(request, response);
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
        processRequestDoPost(request, response);
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
