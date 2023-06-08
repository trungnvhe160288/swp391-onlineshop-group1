/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.controller.user;

import com.fptuniversity.swp391_su23_group1_onlineshop.dao.UserDao;
import com.fptuniversity.swp391_su23_group1_onlineshop.model.User;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author dotra
 */
@WebServlet(name = "googleCallbackController", urlPatterns = {"/google-callback"})
public class googleCallbackController extends HttpServlet {

    private static final String SESSION_ACCOUNT_INFOMATION = "account_infomation";
    private static final String CLIENT_ID = "412116264638-chdoab67m6di484a0br12ejdsmkr8n8a.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "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";
    private static final String REDIRECT_URI = "http://localhost:8080/SWP391_SU23_Group1_OnlineShop/google-callback";
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    private static final String REGISTER_PAGE_JSP = "register.jsp";
    private static final String HOME_PAGE = "home";
    private static final String FORWARD = "FORWARD";
    private static final String SEND_REDIRECT = "SEND_REDIRECT";

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
        String code = request.getParameter("code");
        String type = SEND_REDIRECT;
        String url = HOME_PAGE;

        List<String> scopes = Arrays.asList("https://www.googleapis.com/auth/userinfo.email", "https://www.googleapis.com/auth/userinfo.profile");
        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                new NetHttpTransport(), JSON_FACTORY, CLIENT_ID, CLIENT_SECRET,
                scopes)
                .build();

        GoogleTokenResponse tokenResponse = flow.newTokenRequest(code)
                .setRedirectUri(REDIRECT_URI)
                .execute();

        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), JSON_FACTORY)
                .setAudience(Collections.singletonList(CLIENT_ID))
                .build();
        System.out.println(CLIENT_ID);
        try {
            GoogleIdToken idToken = verifier.verify(tokenResponse.getIdToken());
            if (idToken != null) {
                String userId = idToken.getPayload().getSubject();
                String email = idToken.getPayload().getEmail();
                String fullName = (String) idToken.getPayload().get("name");
                String profilePictureUrl = (String) idToken.getPayload().get("picture");

                User checkUser = UserDao.getInfoUserByEmail(email);

                if (checkUser == null) {
                    User newUser = new User();

                    newUser.setEmail(email);
                    newUser.setAvatar(profilePictureUrl);
                    newUser.setFullname(fullName);
                    newUser.setUserRole("customer");
                    UserDao.addUser(newUser);

                }
                User user = UserDao.getInfoUserByEmail(email);

                HttpSession session = request.getSession(true);
                session.setAttribute(SESSION_ACCOUNT_INFOMATION, checkUser);
                type = SEND_REDIRECT;
                url = HOME_PAGE;
                switch (type) {
                    case FORWARD:
                        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                        dispatcher.forward(request, response);
                        break;
                    case SEND_REDIRECT:
                        response.sendRedirect(url);
                        break;
                    default:
                        throw new AssertionError();
                }
                // Perform further actions with the user information
                // For example, store the user in the session or redirect to a dashboard page
            } else {
                // Invalid ID token
                response.sendRedirect("/error-page");
            }
        } catch (Exception e) {
            // Exception occurred during verification
            response.sendRedirect("/error-page");
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
