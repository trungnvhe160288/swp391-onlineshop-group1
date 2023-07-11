package Controllers;

import DAL.CategoryDAO;
import DAL.CommentDAO;
import Ultils.Common;
import DAL.DAO;
import DAL.ProductDAO;
import Models.Cart;
import Models.Category;
import Models.Color;
import Models.Comment;
import Models.Item;
import Models.Product;
import Models.Size;
import Models.User;
import Ultils.SupportConvert;
import Ultils.SupportMessage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "ShopController", urlPatterns = {"/shop"})
public class ShopController extends HttpServlet {

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
            case "list":
                pagination(request, response);

                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "detail":
                getDetail(request, response);
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "error");
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
        }
    }
    
    
    //getDetail
    private void getDetail(HttpServletRequest request, HttpServletResponse response) {
        ProductDAO pd = new ProductDAO();

        String id_raw = request.getParameter("id");
        int id = Common.parseInt(id_raw);

        request.setAttribute("data", pd.getProductByID(id));
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
        HttpSession session = request.getSession();

        String action = (String) request.getAttribute("action");

        switch (action) {
            case "list":
                pagination(request, response);
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "detail":
                String id_raw = request.getParameter("id");
                int id = Common.parseInt(id_raw);
                System.out.println(id);
                addToCart(request, response, session);
                response.sendRedirect(request.getContextPath() + "/shop/detail.do?id=" + id);
                break;
            case "addtocart":
                addToCart(request, response, session);
                response.sendRedirect(request.getContextPath() + "/shop/list.do");
                break;
            case "review":
                review(request, response);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "error");
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
        }
    }

    private void review(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String rate_raw = request.getParameter("rate");
        String content = request.getParameter("content");
        String pid_raw = request.getParameter("pid");

        int rate = Common.parseInt(rate_raw);
        int pid = Common.parseInt(pid_raw);
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");

        if (u != null) {
            Comment c = new Comment(-1, content, name, email, rate, Common.getCurrentDate(), Common.getCurrentDate(), true, u.getId(), pid);
            CommentDAO dao = new CommentDAO();

            boolean status = dao.add(c);

            if (status) {
                SupportMessage.sendToast(session, 1, "Review Successful!");
            } else {
                SupportMessage.sendToast(session, 0, "Something Wrong !");
            }
        }
        
        session.setAttribute("active", "doReview");
        response.sendRedirect(request.getContextPath()+"/shop/detail.do?id=" + pid_raw);

    }
    //List product
    private List<Product> filter(HttpServletRequest request, HttpServletResponse response, List<Product> data) {
        ProductDAO pd = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();
        DAO dao = new DAO();

        String[] xCid = request.getParameterValues("cid");
        int[] cid = (xCid != null) ? SupportConvert.convertToInt(xCid) : new int[0];
        boolean[] cChecked = getCheckedCid(cd.getAll(), cid);

        data = (cid.length != 0) ? filterCategory(data, cid) : data;

        String[] xSid = request.getParameterValues("sid");
        int[] sid = (xSid != null) ? SupportConvert.convertToInt(xSid) : new int[0];
        boolean[] sChecked = getCheckedSid(dao.getAllSize(), sid);

        data = (sid.length != 0) ? filterSize(data, sid) : data;

        String[] xClid = request.getParameterValues("clid");
        int[] clid = (xClid != null) ? SupportConvert.convertToInt(xClid) : new int[0];
        boolean[] clChecked = getCheckedCLid(dao.getAllColor(), clid);

        data = (clid.length != 0) ? filterColor(data, clid) : data;

        String price_raw = request.getParameter("price");
        if (price_raw != null) {

            price_raw = price_raw.replaceAll("\\$", "");
            String[] prices = price_raw.split("-");

            int min = Common.parseInt(prices[0]);
            int max = Common.parseInt(prices[1]);

            if (max != 0) {
                data = pd.getProductByPrice(min, max);

                request.setAttribute("minPriceSelected", min);
                request.setAttribute("maxPriceSelected", max);
            }

        }

        request.setAttribute("cChecked", cChecked);
        request.setAttribute("categoryID", getResponseMessage(cid, "cid"));

        request.setAttribute("sChecked", sChecked);
        request.setAttribute("sizeID", getResponseMessage(sid, "sid"));

        request.setAttribute("clChecked", clChecked);
        request.setAttribute("colorID", getResponseMessage(clid, "clid"));

        return sorting(request, response, data);
    }
    //Sort product
    private List<Product> sorting(HttpServletRequest request, HttpServletResponse response, List<Product> data) {
        String sort = request.getParameter("sortBy");

        if (sort != null) {
            request.setAttribute("sortBy", sort);
            switch (sort) {
                case "a-z":
                    Collections.sort(data, (o1, o2) -> o1.getName().compareTo(o2.getName()));
                    break;
                case "z-a":
                    Collections.sort(data, (o1, o2) -> o2.getName().compareTo(o1.getName()));
                    break;
                case "low":
                    Collections.sort(data, (Product o1, Product o2) -> {
                        if (o1.getLastPrice() > o2.getLastPrice()) {
                            return 1;
                        }
                        return -1;
                    });
                    break;
                case "high":
                    Collections.sort(data, (Product o1, Product o2) -> {
                        if (o1.getLastPrice() > o2.getLastPrice()) {
                            return -1;
                        }
                        return 1;
                    });
                    break;
                case "new":
                    Collections.sort(data, (Product o1, Product o2) -> {
                        if (o1.getCreateAt().before(o2.getCreateAt())) {
                            return 1;
                        }
                        return -1;
                    });
                    break;
                case "old":
                    Collections.sort(data, (Product o1, Product o2) -> {
                        if (o1.getCreateAt().before(o2.getCreateAt())) {
                            return -1;
                        }
                        return 1;
                    });
                    break;
            }
        }
        return data;
    }
    //search
    private List<Product> search(HttpServletRequest request, HttpServletResponse response) {
        ProductDAO pd = new ProductDAO();

        String search = request.getParameter("search");

        if (search == null || search.isEmpty()) {
            return pd.getAll();
        } else {
            return pd.getProductByKey(search);
        }

    }

    private void pagination(HttpServletRequest request, HttpServletResponse response) {
        ProductDAO pd = new ProductDAO();

        List<Product> data = search(request, response);
        
        data = filter(request, response, data);

        String xpage = request.getParameter("page");

        int page = (xpage == null) ? 1 : Common.parseInt(xpage);
        int numberPerPage = 12;
        int size = data.size();
        int numberOfPage = ((size % numberPerPage == 0) ? (size / numberPerPage) : (size / numberPerPage + 1));
        int start = (page - 1) * numberPerPage;
        int end = Math.min(page * numberPerPage, size);

        List<Product> listByPage = pd.getListByPage(data, start, end);

        request.setAttribute("page", page);
        request.setAttribute("numberOfPage", numberOfPage);
        request.setAttribute("start", start + 1);
        request.setAttribute("end", end);
        request.setAttribute("numberPerPage", numberPerPage);

        request.setAttribute("data", listByPage);

    }

    private List<Product> filterCategory(List<Product> before, int[] cid) {
        List<Product> after = new ArrayList<>();

        if (cid != null && cid.length > 0) {
            for (Product item : before) {
                for (int id : cid) {
                    if (item.getCategory().getId() == id) {
                        after.add(item);
                    }
                }
            }
        }
        return after;
    }

    private List<Product> filterSize(List<Product> before, int[] sid) {
        List<Product> after = new ArrayList<>();

        if (sid != null && sid.length > 0) {
            for (Product item : before) {
                for (int id : sid) {
                    for (Size size : item.getSize()) {
                        if (size.getId() == id) {
                            after.add(item);
                        }
                    }
                }
            }
        }
        return after;
    }

    private List<Product> filterColor(List<Product> before, int[] cid) {
        List<Product> after = new ArrayList<>();

        if (cid != null && cid.length > 0) {
            for (Product item : before) {
                for (int id : cid) {
                    for (Color color : item.getColor()) {
                        if (color.getId() == id) {
                            after.add(item);
                        }
                    }
                }
            }
        }
        return after;
    }

    private boolean isCheck(int x, int[] before) {
        if (before == null) {
            return false;
        } else {
            for (int i = 0; i < before.length; i++) {
                if (before[i] == x) {
                    return true;
                }
            }
        }
        return false;
    }

    private String getResponseMessage(int[] x, String type) {
        String s = "";

        if (x.length > 0) {
            s += "&" + type + "=";
        }

        for (int i = 0; i < x.length; i++) {
            if (i == x.length - 1) {
                s += x[i];
            } else {
                s += x[i] + "&" + type + "=";
            }
        }

        return s;
    }

    private boolean[] getCheckedCid(List<Category> before, int[] x) {
        boolean[] checked = new boolean[before.size()];
        for (int i = 0; i < checked.length; i++) {
            checked[i] = isCheck(before.get(i).getId(), x);
        }

        return checked;
    }

    private boolean[] getCheckedSid(List<Size> before, int[] x) {
        boolean[] checked = new boolean[before.size()];
        for (int i = 0; i < checked.length; i++) {
            checked[i] = isCheck(before.get(i).getId(), x);
        }

        return checked;
    }

    private boolean[] getCheckedCLid(List<Color> before, int[] x) {
        boolean[] checked = new boolean[before.size()];
        for (int i = 0; i < checked.length; i++) {
            checked[i] = isCheck(before.get(i).getId(), x);
        }

        return checked;
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        ProductDAO pd = new ProductDAO();
        List<Product> prods = pd.getAll();
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

        String id_raw = request.getParameter("id");
        String quantity_raw = request.getParameter("quantity");
        String color_raw = request.getParameter("color");
        String size_raw = request.getParameter("size");

        int id = Common.parseInt(id_raw);
        int quantity = Common.parseInt(quantity_raw);
        int color = Common.parseInt(color_raw);
        int size = Common.parseInt(size_raw);

        Cart cartCheck = new Cart(txt, prods);
        Product pcheckQuan = pd.getProductByID(id);

        if (txt.isEmpty()) {
            txt = id + "_" + quantity + "/" + color + ":" + size;

        } else if (cartCheck.getItemByProductID(id) == null) {
            txt += "-" + id + "_" + quantity + "/" + color + ":" + size;
        } else if ((cartCheck.getQuantityByProductID(id) + quantity) >= pcheckQuan.getQuantity()) {

        }  else {
            txt += "-" + id + "_" + quantity + "/" + color + ":" + size;
        }

        Cart cart = new Cart(txt, prods);

        Cookie c = new Cookie("cart", txt);

        c.setPath(request.getContextPath());

        c.setMaxAge(24 * 60 * 60);
        response.addCookie(c);

        request.setAttribute("cart", cart);
        SupportMessage.sendToast(session, 1, "Add To Cart Successful !");

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
