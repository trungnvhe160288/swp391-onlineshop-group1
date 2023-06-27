/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Dashboard;

import Ultils.Common;
import DAL.SliderDAO;
import Models.Slider;
import Ultils.SupportImage;
import Ultils.SupportMessage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 *
 * @author phanh
 */
@WebServlet(name = "SliderDashboard", urlPatterns = {"/dashboard/slider"})
public class SliderDashboard extends HttpServlet {

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
        SliderDAO sd = new SliderDAO();
        switch (action) {
            case "listing":
                request.setAttribute("slider", sd.getAll());
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "add":
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            case "detail":
                getDetail(request, response);
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "404");
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
        }
    }

    private void getDetail(HttpServletRequest request, HttpServletResponse response) {
        String id_raw = request.getParameter("id");
        int id = Common.parseInt(id_raw);

        SliderDAO sl = new SliderDAO();

        Slider slider = sl.getSliderById(id);
        request.setAttribute("data", slider);
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
                String id_raw = request.getParameter("id");
                update(request, response);
                response.sendRedirect(request.getContextPath() + "/dashboard/slider/detail.ad?id=" + id_raw);
                break;
            case "add":
                add(request, response);
                response.sendRedirect(request.getContextPath() + "/dashboard/slider/listing.ad");
                break;
            
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "404");
                request.getRequestDispatcher("/WEB-INF/layouts/dashboard.jsp").forward(request, response);
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String title = request.getParameter("title");
        String subTitle = request.getParameter("subTitle");
        String actived = request.getParameter("actived");

        SliderDAO dao = new SliderDAO();
        Slider slider = dao.getLastSlider();
        int id = slider.getId() + 1;
        String url = "";

        //Upload Image
        Part file = request.getPart("upload_image");
        if (file != null) {
            String uploadPath = "/images/slider/";
            String fileName = "slider_" + id;
            String uploadName = SupportImage.uploadImage(request, response, uploadPath, fileName);

            if (!uploadName.isEmpty()) {
               url = uploadPath + uploadName;
            } else {
                SupportMessage.sendToastToDashboard(request.getSession(), 0, "UpLoad Image", "Failed !");
            }
        }
        //

        Slider newSlider = new Slider(id, url, title, subTitle, Common.getCurrentDate(), Common.getCurrentDate(), actived.equalsIgnoreCase("true"));
        boolean status = dao.add(newSlider);
        
        if (status) {
            SupportMessage.sendToastToDashboard(request.getSession(), 1, "ADD Silder", "Successful !");
        } else {
            SupportMessage.sendToastToDashboard(request.getSession(), 0, "ADD Silder", "Failed !");
        }

    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id_raw = request.getParameter("id");
        String title = request.getParameter("title");
        String subTitle = request.getParameter("subTitle");
        String actived = request.getParameter("actived");

        int id = Common.parseInt(id_raw);

        SliderDAO dao = new SliderDAO();
        Slider slider = dao.getSliderById(id);
        slider.setActive(actived.equalsIgnoreCase("true"));
        slider.setTitle(title);
        slider.setSubTitle(subTitle);
        slider.setUpdateAt(Common.getCurrentDate());

        Part file = request.getPart("upload_image");

        // uploadImage
        if (file != null) {
            String uploadPath = "/images/slider/";
            String fileName = "slider_" + id;
            String uploadName = SupportImage.uploadImage(request, response, uploadPath, fileName);

            if (!uploadName.isEmpty()) {
                String url = uploadPath + uploadName;
                slider.setUrl(url);
            } else {
                SupportMessage.sendToastToDashboard(request.getSession(), 0, "UpLoad Image", "Failed !");
            }
        }

        boolean status = dao.update(slider);

        if (status) {
            SupportMessage.sendToastToDashboard(request.getSession(), 1, "Update Silder", "Successful !");
        } else {
            SupportMessage.sendToastToDashboard(request.getSession(), 0, "Update Silder", "Failed !");
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
