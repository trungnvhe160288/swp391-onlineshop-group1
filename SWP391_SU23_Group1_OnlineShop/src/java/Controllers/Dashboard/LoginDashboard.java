/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Dashboard;

import DAL.UserDAO;
import Models.User;
import Ultils.SupportMessage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author phanh
 */
@WebServlet(name = "LoginDashboard", urlPatterns = {"/dashboard/login"})
public class LoginDashboard extends HttpServlet {

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
            out.println("<title>Servlet LoginDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginDashboard at " + request.getContextPath() + "</h1>");
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
            case "login":
                request.getRequestDispatcher("/WEB-INF/dashboard/dashboard/login/login.jsp").forward(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "error");
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
        UserDAO ud = new UserDAO();
        switch (action) {
            case "login":
                login(request, response, ud);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "error");
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("account") != null) {
            session.removeAttribute("account");
            SupportMessage.sendToastToDashboard(session, 1, "Logout ", "Login Successfull !");
            response.sendRedirect(request.getContextPath() + "/dashboard/dashboard.ad");
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response, UserDAO ud) throws IOException, ServletException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = ud.login(email, password);

        if (user != null) {
            int status = user.getStatus();
            switch (status) {
                case 1:
                    session.setAttribute("account", user);
                    SupportMessage.sendToastToDashboard(session, 1, "Login ", "Login Successfull !");
                    response.sendRedirect(request.getContextPath() + "/dashboard/dashboard.ad");
                    break;
                case -1:
                    SupportMessage.sendToastToDashboard(session, 0, "Login ", "Your Account Has Blocked !");
                    request.getRequestDispatcher("/WEB-INF/dashboard/dashboard/login/login.jsp").forward(request, response);

                    break;
                case 0:
                    SupportMessage.sendToastToDashboard(session, 2, "Login ", "Your Account Has Not Yet Verified Email !");
                    request.getRequestDispatcher("/WEB-INF/dashboard/dashboard/login/login.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        } else {
            SupportMessage.sendToastToDashboard(session, 2, "Login ", "UserName or Password Incorrect !");
            request.getRequestDispatcher("/WEB-INF/dashboard/dashboard/login/login.jsp").forward(request, response);

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
