package Controllers;

import Ultils.Common;
import DAL.UserDAO;
import Models.OTP;
import Models.Role;
import Models.User;
import Ultils.SupportMail;
import Ultils.SupportMessage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

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

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        UserDAO ud = new UserDAO();
        switch (action) {
            case "login":
            case "register":
            case "forgot":
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "logout":
                logout(request);
                response.sendRedirect(request.getContextPath() + "/login/login.do");
                break;
            case "verifyEmail":
                verifyEmail(request, response, ud);
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "changepass":
            case "userProfile":
                int id = user.getId();
                request.setAttribute("data", ud.getUserByID(id));
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
        UserDAO ud = new UserDAO();

        switch (action) {
            case "login":
                login(request, response, ud);
                break;
            case "register":
                register(request, response, ud);
                break;
            case "forgot":
                forgot(request, response, ud);
                break;
            case "verifyEmail":
                getNewCode(request, response);
                break;
            case "changepass":
                changePass(request, response);
                break;
            case "userProfile":
                userProfile(request, response);
                break;
            default:
                //Show error page
                request.setAttribute("controller", "error");
                request.setAttribute("action", "error");
                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
        }
    }

    private void userProfile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserDAO ud = new UserDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        int id = user.getId();
        String name = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        try {
            // Update user profile
            ud.updateUserProfile(id, name, phone, address);
            SupportMessage.sendToast(session, 3, "Update Profile Successful !");
            response.sendRedirect(request.getContextPath() + "/login/userProfile.do?id=" + id);
        } catch (Exception e) {
            // Handle unexpected exceptions
            e.printStackTrace();
            SupportMessage.sendToast(session, 0, "An unexpected error occurred. Please try again later.");
            request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
        }
    }

    private void changePass(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String oldPassword = request.getParameter("oldpass");
        String newPassword = request.getParameter("newpass");

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");

        if (u != null) {
            if (u.getPassword().equals(oldPassword)) {
                u.setPassword(newPassword);
                UserDAO ud = new UserDAO();
                boolean status = ud.changePass(u);

                if (status) {
                    // Password change successful
                    SupportMessage.sendToast(session, 1, "Change Password successful !");
                    response.sendRedirect(request.getContextPath() + "/index.do");
                } else {
                    // Password change failed due to unexpected error
                    SupportMessage.sendToast(session, 0, "Unexpected error happened. Please try again.");
                    response.sendRedirect(request.getContextPath() + "/index.do");
                }
            } else {
                // Old password provided by the user is incorrect
                SupportMessage.sendToast(session, 0, "Failed to change password. Please try again.");
                response.sendRedirect(request.getContextPath() + "/index.do");
            }
        }
    }

    private void forgot(HttpServletRequest request, HttpServletResponse response, UserDAO ud) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");

        SupportMail.sendMail(email, 2);

        SupportMessage.sendToast(session, 1, "New Password Was Send To Your Email !");

        request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);

    }

    private void getNewCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");

        SupportMail.sendMail(email, 1);

        SupportMessage.sendToast(session, 1, "New Code Send To Your Email !");

        request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response, UserDAO ud) throws IOException, ServletException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = ud.login(email, password);

        if (user != null) {
            int status = user.getStatus();
            switch (status) {
                case 1:
                    session.setAttribute("account", user);
                    System.out.println(user.getPassword());
                    SupportMessage.sendToast(session, 1, "Login Successfull !");
                    response.sendRedirect(request.getContextPath() + "/index.do");
                    break;
                case -1:
                    SupportMessage.sendToast(session, 0, "Your Account Has Blocked !");
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                    break;
                case 0:
                    SupportMessage.sendToast(session, 2, "Your Account Has Not Yet Verified Email !");
                    request.setAttribute("message", "<h3 >You Must Verify Email To Use Account ! <a href=\"https://mail.google.com/mail/u/0/#inbox\" target=\"_blank\" class=\"text-info\">Click Here To Verify Email !</a></h3>");
                    request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        } else {
            SupportMessage.sendToast(session, 2, "UserName or Password Incorrect !");
            request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
        }

    }

    private void register(HttpServletRequest request, HttpServletResponse response, UserDAO ud) throws IOException, ServletException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");

        boolean flag = ud.checkEmailExits(email);

        if (flag) {
            SupportMessage.sendToast(session, 0, "Email was exit!");

            request.setAttribute("email", email);
            request.setAttribute("fullName", fullName);
            request.setAttribute("password", password);
        } else {

            User u = new User(-1, email, password, fullName, "", "", "", -1, Common.getCurrentDate(), Common.getCurrentDate(), new Role());

            ud.register(u);
            SupportMessage.sendToast(session, 1, "Register Successfull !");

            request.setAttribute("message", "<h3 >You Must Verify Email To Use Account ! <a href=\"https://mail.google.com/mail/u/0/#inbox\" target=\"_blank\" class=\"text-info\">Click Here To Verify Email !</a></h3>");

            SupportMail.sendMail(email, 1);
        }

        request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);

    }

    private void logout(HttpServletRequest request) {
        HttpSession session = request.getSession();

        if (session.getAttribute("account") != null) {
            session.removeAttribute("account");
            SupportMessage.sendToast(session, 1, "Logout Successfull !");
        }
    }

    private void verifyEmail(HttpServletRequest request, HttpServletResponse response, UserDAO ud) {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String code = request.getParameter("code");

        OTP otp = ud.getLastOTPByEmail(email);

        if (otp != null) {
            if (otp.getCode().equals(code) && otp.isActive()) {
                ud.verifyAccount(email);
                ud.deActiveCodeLast(otp.getId());
                SupportMessage.sendToast(session, 1, "Verify Account Successful !");
            } else {
                SupportMessage.sendToast(session, 0, "Code Not Exits");
            }
        } else {
            SupportMessage.sendToast(session, 2, "No Have Any Code For This Email");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
