/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.controller.search;

import com.fptuniversity.swp391_su23_group1_onlineshop.dao.PostDao;
import com.fptuniversity.swp391_su23_group1_onlineshop.dao.ProductDao;
import com.fptuniversity.swp391_su23_group1_onlineshop.model.Post;
import com.fptuniversity.swp391_su23_group1_onlineshop.model.Product;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author trung
 */
@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String SUCCESS_JSP = "search.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            int sizeProduct = 8;
            String parKeySearch = request.getParameter("keySearch");
            String parPageProduct = request.getParameter("pageProduct");
            String parSortProduct = request.getParameter("sortProduct");
            if (parPageProduct == null || parPageProduct.isEmpty()) {
                parPageProduct = "1";
            }
            String keySearch = (parKeySearch != null && !parKeySearch.isEmpty()) ? parKeySearch : null;

            String orderByProduct = null;
            String orderTypeProduct = null;
            if (parSortProduct != null && !parSortProduct.isEmpty() && !"none".equals(parSortProduct)) {
                String[] parSortSlip = parSortProduct.split("~");
                orderByProduct = parSortSlip[0];
                orderTypeProduct = parSortSlip[1];
            }
            int pageProduct = Integer.parseInt(parPageProduct);

            ArrayList<Product> listProducts = ProductDao.filterProducts(keySearch, null, null, null, null, null, pageProduct, sizeProduct, orderByProduct, orderTypeProduct);
            int countProduct = ProductDao.countFilterProducts(keySearch, null, null, null, null, null);
            int totalPageProduct = (int) Math.ceil((double) countProduct / (double) sizeProduct);
            request.setAttribute("listProducts", listProducts);
            request.setAttribute("totalPageProduct", totalPageProduct);

            String parPagePost = request.getParameter("pagePost");
            String parSortPost = request.getParameter("sortPost");
            if (parPagePost == null || parPagePost.isEmpty()) {
                parPagePost = "1";
            }
            int sizePost = 2;
            String orderByPost = null;
            String orderTypePost = null;
            if (parSortPost != null && !parSortPost.isEmpty() && !"none".equals(parSortPost)) {
                String[] parSortSlip = parSortPost.split("~");
                orderByPost = parSortSlip[0];
                orderTypePost = parSortSlip[1];
            }
            int pagePost = Integer.parseInt(parPagePost);

            ArrayList<Post> listPosts = PostDao.filterPosts(keySearch, pagePost, sizePost, orderByPost, orderTypePost);
            int count = PostDao.countFilterPosts(keySearch);
            int totalPagePost = (int) Math.ceil((double) count / (double) sizePost);
            request.setAttribute("totalPagePost", totalPagePost);
            request.setAttribute("listPosts", listPosts);

            //
        } catch (Exception e) {
        } finally {
            RequestDispatcher dispatcher = request.getRequestDispatcher(SUCCESS_JSP);
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
