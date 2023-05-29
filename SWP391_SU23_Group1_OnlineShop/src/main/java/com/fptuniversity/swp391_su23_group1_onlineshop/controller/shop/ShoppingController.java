/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.controller.shop;

import com.fptuniversity.swp391_su23_group1_onlineshop.dao.ColorDao;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import com.fptuniversity.swp391_su23_group1_onlineshop.dao.ProductDao;
import com.fptuniversity.swp391_su23_group1_onlineshop.model.Product;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author dotra
 */
@WebServlet(name = "ShoppingController", value = "/shop")
public class ShoppingController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String SUCCESS_JSP = "shopping.jsp";
    private static final String PRODUCT_DETAIL_JSP = "productDetail.jsp";

    protected void processRequestDoGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = SUCCESS_JSP;

        try {
            String id = request.getParameter("id");
            if (id != null) {
                Product product = ProductDao.getProductById(Integer.parseInt(id));
                url = PRODUCT_DETAIL_JSP;
                request.setAttribute("product", product);
            } else {
                String parProductName = request.getParameter("productName");
                String parMinPricePrice = request.getParameter("minPrice");
                String parMaxPricePrice = request.getParameter("maxPrice");
                String parCategoryId = request.getParameter("categoryId");
                String parColorId = request.getParameter("colorId");
                String parRating = request.getParameter("rating");
                String parPage = request.getParameter("page");
                String parSort = request.getParameter("sort");
                if (parPage == null || parPage.isEmpty()) {
                    parPage = "1";
                }
                String productName = (parProductName != null && !parProductName.isEmpty()) ? parProductName : null;
                Float minPrice = (parMinPricePrice != null && !parMinPricePrice.isEmpty()) ? Float.parseFloat(parMinPricePrice) : null;
                Float maxPrice = (parMaxPricePrice != null && !parMaxPricePrice.isEmpty()) ? Float.parseFloat(parMaxPricePrice) : null;
                Integer categoryId = (parCategoryId != null && !parCategoryId.isEmpty()) ? Integer.parseInt(parCategoryId) : null;
                Integer colorId = (parColorId != null && !parColorId.isEmpty()) ? Integer.parseInt(parColorId) : null;
                Float rating = (parRating != null && !parRating.isEmpty()) ? Float.parseFloat(parRating) : null;
                String orderBy = null;
                String orderType = null;
                if (parSort != null && !parSort.isEmpty() && !"none".equals(parSort)) {
                    String[] parSortSlip = parSort.split("~");
                    orderBy = parSortSlip[0];
                    orderType = parSortSlip[1];
                }
                int page = Integer.parseInt(parPage);
                int size = 6;
                ArrayList<Product> listProducts = ProductDao.filterProducts(productName, minPrice, maxPrice, categoryId, colorId, rating, page, size, orderBy, orderType);
                int count = ProductDao.countFilterProducts(productName, minPrice, maxPrice, categoryId, colorId, rating);
                int totalPage = (int) Math.ceil((double) count / (double) size);
                request.setAttribute("listProducts", listProducts);
                request.setAttribute("colors", ColorDao.getAll());
                request.setAttribute("totalPage", totalPage);
                request.setAttribute("count", count);
            }
        } catch (NumberFormatException e) {
        } finally {
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequestDoGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //  processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
