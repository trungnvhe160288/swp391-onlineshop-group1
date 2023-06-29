package Controllers.Dashboard;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import Ultils.Common;
import DAL.DAO;
import Models.Role;
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
 * @author phanh
 */
@WebServlet(urlPatterns = {"/dashboard/role"})
public class RoleDashboard extends HttpServlet {

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
                String id = request.getParameter("id");
                Role role = new DAO().getRoleById(Common.parseInt(id));
                request.setAttribute("role", role);
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
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        DAO dao = new DAO();

        switch (action) {
            case "detail":
                int id = Common.parseInt(request.getParameter("id"));

                Role role = dao.getRoleById(id);

                if (dao.checkNameColorExist(name) && !name.equals(role.getName())) {
                    session.setAttribute("message", "Role Name Was Exist !");
                    SupportMessage.sendToastToDashboard(session, 0, "Update Role", "Failed !");

                } else {
                    role.setName(name);
                    role.setUpdateAt(Common.getCurrentDate());
                    boolean status = dao.updateRole(role);
                    if (status) {
                        SupportMessage.sendToastToDashboard(session, 1, "Update Role", "Successful !");
                    } else {
                        SupportMessage.sendToastToDashboard(session, 0, "Update Role", "Failed !");
                    }
                }

                response.sendRedirect(request.getContextPath() + "/dashboard/role/detail.ad?id=" + id);
                break;
            case "add":
                if (dao.checkNameRoleExist(name)) {
                    request.setAttribute("name", name);
                    request.setAttribute("message", "Role Name Was Exist !");
                    SupportMessage.sendToastToDashboard(session, 0, "Add Color", "Failed !");
                    request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                } else {
                    Role newRole = new Role(-1, name, Common.getCurrentDate(), Common.getCurrentDate());
                    boolean status = dao.addRole(newRole);

                    if (status) {
                        SupportMessage.sendToastToDashboard(session, 1, "Add Role", "Successful !");
                    } else {
                        SupportMessage.sendToastToDashboard(session, 0, "Add Role", "Failed !");
                    }
                    response.sendRedirect(request.getContextPath() + "/dashboard/role/listing.ad");
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
