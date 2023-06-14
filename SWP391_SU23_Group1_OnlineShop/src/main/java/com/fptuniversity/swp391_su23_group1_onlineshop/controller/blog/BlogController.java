/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.controller.blog;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import com.fptuniversity.swp391_su23_group1_onlineshop.model.Post;
import com.fptuniversity.swp391_su23_group1_onlineshop.dao.PostDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author PbucLH
 */
@WebServlet(name = "BlogController", value = "/blog")
public class BlogController extends HttpServlet {

    //Path of view
    private static final String SUCCESS_JSP = "blog.jsp";
    private static final String BLOG_DETAIL_JSP = "blogDetail.jsp";

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
        String url = SUCCESS_JSP;
        try {

            String id = request.getParameter("id");

            if (id != null) {
                int idPost = Integer.parseInt(id);
                
                // Call PostDao : get detail blog 
                Post post = PostDao.getPostById(Integer.parseInt(id));
                url = BLOG_DETAIL_JSP;
                
                // Set data for view 
                request.setAttribute("post", post);
            } else {
                
                // Get data from view 
                String parSort = request.getParameter("sort");
                String parPage = request.getParameter("page");
                if (parPage == null || parPage.isEmpty()) {
                    parPage = "1";
                }
                String orderBy = null;
                String orderType = null;
                if (parSort != null && !parSort.isEmpty() && !"none".equals(parSort)) {
                    String[] parSortSlip = parSort.split("~");
                    orderBy = parSortSlip[0];
                    orderType = parSortSlip[1];
                }
                int page = Integer.parseInt(parPage);
                int size = 3;
                
                // Call PostDAO : get list blog
                ArrayList<Post> listPosts = PostDao.getAllPosts(page, size, orderBy, orderType);
                // Call PostDAO : count post to paging
                int count = PostDao.countAllPosts();
                int totalPage = (int) Math.ceil((double) count / (double) size);
                
                // Set data for view 
                request.setAttribute("totalPage", totalPage);
                request.setAttribute("listPosts", listPosts);
            }
        } catch (Exception e) {
        } finally {
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
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
        processRequest(request, response);
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
