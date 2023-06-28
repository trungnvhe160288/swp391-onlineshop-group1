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
                pagination(request, response); // call process pagination
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "add":
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "detail":
                getDetailBlogByID(request, response);// call get detail blog
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
        int id;
        switch (action) {
            case "add":
                add(request, response);
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "edit":
                String id_raw = request.getParameter("id");
                id = Common.parseInt(id_raw);
                edit(request, response, id);
                response.sendRedirect(request.getContextPath() + "/dashboard/blog/detail.ad?id=" + id);
                break;
            case "upload":
                String xId_raw = request.getParameter("id");
                int xId = Common.parseInt(xId_raw);
                upload(request, response, xId);
                response.sendRedirect(request.getContextPath() + "/dashboard/blog/detail.ad?id=" + xId);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "404");
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
        }
    }
    
    private void upload(HttpServletRequest request, HttpServletResponse response, int id) throws IOException, ServletException {
        String uploadPath = "/images/blog/";
        String fileName = "blog_" + id;
        String uploadName = SupportImage.uploadImage(request, response, uploadPath, fileName);
        if (!uploadName.isEmpty()) {
            BlogDAO bd = new BlogDAO();
            bd.uploadImage(id, "/images/blog/" + uploadName);
            SupportMessage.sendToastToDashboard(request.getSession(), 1, "UpLoad Image", "Successful !");
        } else {
            SupportMessage.sendToastToDashboard(request.getSession(), 0, "UpLoad Image", "Failed !");
        }

    }
    
    //process add button onview
    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        BlogDAO bd = new BlogDAO();

        String title = request.getParameter("title");
        String published = request.getParameter("published");
        String description = request.getParameter("description");
        String content = request.getParameter("content");
        Blog lastBlog = bd.getLastBlog();
        int id = lastBlog.getId() + 1;
        //upload image
        String newName = "blog_" + id;
        String uploadPath = "/images/blog/";
        String uploadName = SupportImage.uploadImage(request, response, uploadPath, newName);
        String thumbnail_url = uploadPath + uploadName;
        //
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");

        Blog blog = new Blog(id, thumbnail_url, u.getId(), title, description, content, Common.getCurrentDate(), Common.getCurrentDate(), published.equalsIgnoreCase("true"));

        boolean flag = bd.add(blog);

        if (flag) {
            SupportMessage.sendToastToDashboard(session, 1, "Add Blog", "Successful !");
        } else {
            SupportMessage.sendToastToDashboard(session, 0, "Add Blog", "Faild !");
        }

    }
    
    //Process for edit blog
    private void edit(HttpServletRequest request, HttpServletResponse response, int id) {
        BlogDAO bd = new BlogDAO();

        String title = request.getParameter("title");
        String published = request.getParameter("published");
        String description = request.getParameter("description");
        String content = request.getParameter("content");

        Blog blog = bd.getBlogByID(id);

        if (blog != null) {
            blog.setTitle(title);
            blog.setPublished(published.equalsIgnoreCase("true"));
            blog.setDescription(description);
            blog.setContent(content);
            blog.setUpdateAt(Common.getCurrentDate());

            bd.update(blog);

            SupportMessage.sendToastToDashboard(request.getSession(), 1, "Update Blog", "Successful !");
        } else {
            SupportMessage.sendToastToDashboard(request.getSession(), 0, "Update Blog", "Something Wrong !");
        }

        request.getSession().setAttribute("active", "edit");

    }

    //process detail blog 
    private void getDetailBlogByID(HttpServletRequest request, HttpServletResponse response) {
        //Call BlogDAO 
        BlogDAO bd = new BlogDAO();

        String xID = request.getParameter("id");
        int id = Common.parseInt(xID);

        Blog blog = bd.getBlogByID(id);

        request.setAttribute("data", blog);
    }

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
