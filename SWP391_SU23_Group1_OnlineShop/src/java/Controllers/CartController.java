/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.CartDAO;
import Ultils.Common;
import DAL.ProductDAO;
import Models.Cart;
import Models.Item;
import Models.Order;
import Models.Product;
import Models.User;
import Ultils.SupportMessage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (String) request.getAttribute("action");
        switch (action) {
            case "detail":
            case "checkout":
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "myorder":
                getMyOrder(request, response);
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "orderdetail":
                getOrderDetail(request, response);
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "process":
                process(request, response);
                response.sendRedirect(request.getContextPath() + "/cart/detail.do");
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "error");
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
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
        switch (action) {
            case "detail":
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "checkout":
                checkout(request, response);
                response.sendRedirect(request.getContextPath() + "/cart/checkout.do");
                break;
            case "orderdetail":
                String id_raw = request.getParameter("id");
                int id = Common.parseInt(id_raw);
                cancel(request, response, id);
                response.sendRedirect(request.getContextPath() + "/cart/orderdetail.do?id=" + id);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "error");
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
        }
    }

    private void cancel(HttpServletRequest request, HttpServletResponse response, int id) {
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("cancel")) {
            CartDAO dao = new CartDAO();

            dao.updateStatus(id, -1);

            HttpSession session = request.getSession();
            SupportMessage.sendToast(session, 1, "Cancel Success !");
        }
    }

    private void getMyOrder(HttpServletRequest request, HttpServletResponse response) {
        CartDAO cd = new CartDAO();

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");

        if (u != null) {
            List<Order> data = cd.getMyOrder(u);

            request.setAttribute("data", data);
        }
    }
    
    // getOrderDetail
    private void getOrderDetail(HttpServletRequest request, HttpServletResponse response) {
        CartDAO cd = new CartDAO();

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");

        if (u != null) {
            String id_raw = request.getParameter("id");
            int id = Common.parseInt(id_raw);

            Order order = cd.getOrderByID(id);

            request.setAttribute("data", order);
        }
    }

    private void checkout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ProductDAO pd = new ProductDAO();
        List<Product> prods = pd.getAll();
        Cookie arr[] = request.getCookies();
        String txt = "";

        if (arr != null) {
            for (Cookie item : arr) {
                if (item.getName().equals("cart")) {
                    txt += item.getValue();
                }
            }
        }

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        if (u == null) {
            response.sendRedirect(request.getContextPath() + "/login/login.do");
        } else {
            Cart cart = new Cart(txt, prods);

            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String note = request.getParameter("note");

            CartDAO cd = new CartDAO();

            cd.createOrder(cart, u, fullName, email, phone, address, note);

            Cookie c = new Cookie("cart", txt);
            c.setPath(request.getContextPath());
            c.setMaxAge(0);
            response.addCookie(c);

            SupportMessage.sendToast(session, 1, "Checkout Success !");
        }

    }

    private void process(HttpServletRequest request, HttpServletResponse response) {
        String id_raw = request.getParameter("id");
        String action = request.getParameter("action");

        int id = Common.parseInt(id_raw);

        ProductDAO pd = new ProductDAO();
        List<Product> list = pd.getAll();
        Cookie arr[] = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie item : arr) {
                if (item.getName().equals("cart")) {
                    txt += item.getValue();
                    item.setMaxAge(0);
                    response.addCookie(item);
                }
            }
        }

        Cart cart = new Cart(txt, list);

        Item item = cart.getItemByProductID(id);

        int quantity = item.getQuantity();

        switch (action) {
            case "minus":
                quantity--;
                cart.getItemByProductID(id).setQuantity(quantity);
                break;
            case "plus":
                quantity++;
                cart.getItemByProductID(id).setQuantity(quantity);
                break;
            case "remove":
                cart.removeItem(id);
                break;
        }

        if ((quantity <= 0) && (cart.getQuantityByProductID(id) <= 1)) {
            cart.removeItem(id);
        } else {
            List<Item> items = cart.getItems();
            txt = "";

            if (!items.isEmpty()) {
                txt = items.get(0).getProduct().getId() + "_"
                        + items.get(0).getQuantity() + "/" + items.get(0).getColorID() + ":" + items.get(0).getSizeID();
                for (int i = 1; i < items.size(); i++) {
                    txt += "-" + items.get(i).getProduct().getId() + "_"
                            + items.get(i).getQuantity() + "/" + items.get(i).getColorID() + ":" + items.get(i).getSizeID();
                }
            }

        }
        Cookie c = new Cookie("cart", txt);
        c.setPath(request.getContextPath());
        c.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(c);
        HttpSession session = request.getSession();

        SupportMessage.sendToast(session, 1, "Update Cart Success !");
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
