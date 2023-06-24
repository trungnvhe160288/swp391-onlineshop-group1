/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.BlogDAO;
import Ultils.Common;
import Models.Blog;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author phuc
 */
@WebServlet(name = "BlogController", urlPatterns = {"/blog"})
public class BlogController extends HttpServlet {

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
        BlogDAO bd = new BlogDAO();

        switch (action) {
            case "list":
                pagination(request, response);
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response); 
                break;
            case "detail":
                String id_raw = request.getParameter("id");
                int id = Common.parseInt(id_raw);
                Blog b = bd.getBlogByIDAndPublished(id);
                request.setAttribute("data", b);
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "contact":
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "error");
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);

        }
    }

    private List<Blog> search(HttpServletRequest request, HttpServletResponse response) {
        BlogDAO bd = new BlogDAO();

        String search = request.getParameter("blog_search");
        request.setAttribute("blog_search", search);

        return bd.getBlogByKey((search == null ? "" : search));

    }

    private void pagination(HttpServletRequest request, HttpServletResponse response) {
        BlogDAO bd = new BlogDAO();
        List<Blog> data = search(request, response);
        String xpage = request.getParameter("page");

        int page = (xpage == null) ? 1 : Common.parseInt(xpage);
        int numberPerPage = 3;
        int size = data.size();
        int numberOfPage = ((size % numberPerPage == 0) ? (size / numberPerPage) : (size / numberPerPage + 1));
        int start = (page - 1) * numberPerPage;
        int end = Math.min(page * numberPerPage, size);

        List<Blog> listByPage = bd.getListByPage(data, start, end);

        request.setAttribute("page", page);
        request.setAttribute("numberOfPage", numberOfPage);
        request.setAttribute("start", start + 1);
        request.setAttribute("end", end);
        request.setAttribute("numberPerPage", numberPerPage);

        request.setAttribute("data", listByPage);

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
        BlogDAO bd = new BlogDAO();

        switch (action) {
            case "list":
                pagination(request, response);
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response); 
                break;
            case "detail":
                String id_raw = request.getParameter("id");
                int id = Common.parseInt(id_raw);

                Blog b = bd.getBlogByIDAndPublished(id);
                request.setAttribute("data", b);
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "contact":
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "error");
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);

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
