/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Dashboard;

import DAL.BlogDAO;
import Ultils.Common;
import Models.Blog;
import Models.User;
import Ultils.SupportImage;
import Ultils.SupportMessage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.List;

@WebServlet(name = "BlogDashboard", urlPatterns = {"/dashboard/blog"})
public class BlogDashboard extends HttpServlet {

    //process pagination for blog dashboard
    private void pagination(HttpServletRequest request, HttpServletResponse response) {
        //Call BlogDAO 
        BlogDAO bd = new BlogDAO();
        List<Blog> data = bd.getAll();
        
        //Process redirect pagination
        String xpage = request.getParameter("page");

        int page = (xpage == null) ? 1 : Common.parseInt(xpage);
        int numberPerPage = 8;
        int size = data.size();
        int numberOfPage = ((size % numberPerPage == 0) ? (size / numberPerPage) : (size / numberPerPage + 1));
        int start = (page - 1) * numberPerPage;
        int end = Math.min(page * numberPerPage, size);
        //Call BlogDAO to get list need to show
        List<Blog> listByPage = bd.getListByPage(data, start, end);
        
        //Set data for view 
        request.setAttribute("page", page);
        request.setAttribute("numberOfPage", numberOfPage);
        request.setAttribute("start", start + 1);
        request.setAttribute("end", end);
        request.setAttribute("numberPerPage", numberPerPage);

        request.setAttribute("data", listByPage);

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
