/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ultils;

import DAL.UserDAO;
import Models.OTP;
import Models.User;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SupportMail {

    public static void sendMail(String userEmail, int type) {

        switch (type) {
            case 1:
                sendVerifyMail(userEmail, "Email Verify Account !");
                break;
            case 2:
                sendPasswordEmail(userEmail, "Email Forgot Password !");
                break;
        }

    }

    private static void sendPasswordEmail(String userEmail, String type) {
        // Tạo mã xác thực duy nhất
//        String uuid = UUID.randomUUID().toString();
        String newPassword = randomCode();

        UserDAO ud = new UserDAO();

        User u = ud.getAccountByEmail(userEmail);

        if (u != null) {
            u.setPassword(newPassword);
            ud.changePass(u);
        }

        // Lưu mã xác thực trong cơ sở dữ liệu của bạn để sử dụng sau này
        // Trong ví dụ này, chúng ta sẽ in mã xác thực ra màn hình để kiểm tra xem nó hoạt động như thế nào
        // Thiết lập thông tin email
        final String username = "landocrissian1206@gmail.com";
        final String password = "tjeblubuzxewwmgt";
        String host = "smtp.gmail.com";
        int port = 587;
        String from = userEmail;
        String subject = type;
        String content = "Mat khau moi cua ban la: " + newPassword;

        // Thiết lập các thuộc tính email
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);

        // Tạo phiên gửi email và thiết lập thông tin người gửi
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo đối tượng MimeMessage và thiết lập các thuộc tính email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
            message.setSubject(subject);
            message.setText(content);

            // Gửi email
            Transport.send(message);

            OTP otp = ud.getLastOTPByEmail(userEmail);

            if (otp != null) {
                ud.deActiveCodeLast(otp.getId());
            }

            ud.saveOTP(newPassword, type, userEmail);

            // Chuyển hướng đến trang xác nhận email
        } catch (MessagingException e) {
            throw new RuntimeException("SendMail Controller -> doGet(): " + e);
        }
    }

    private static void sendVerifyMail(String userEmail, String type) {
        // Tạo mã xác thực duy nhất
//        String uuid = UUID.randomUUID().toString();
        String code = randomCode();

        // setup thông tin email gửi đi
        // Thiết lập thông tin email
        final String username = "landocrissian1206@gmail.com";
        final String password = "tjeblubuzxewwmgt";
        String host = "smtp.gmail.com";
        int port = 587;
        String from = userEmail;
        String subject = type;
        String content = "Verify Your Email. http://localhost:9999/mywebsite/login/verifyEmail.do?email=" + userEmail + "&code=" + code;

        // Thiết lập các thuộc tính email
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);

        // Tạo phiên gửi email và thiết lập thông tin người gửi
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo đối tượng MimeMessage và thiết lập các thuộc tính email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
            message.setSubject(subject);
            message.setText(content);

            // Gửi email
            Transport.send(message);

            UserDAO ud = new UserDAO();
            OTP otp = ud.getLastOTPByEmail(userEmail);

            if (otp != null) {
                ud.deActiveCodeLast(otp.getId());
            }

            ud.saveOTP(code, type, userEmail);

            // Chuyển hướng đến trang xác nhận email
        } catch (MessagingException e) {
            throw new RuntimeException("SendMail Controller -> doGet(): " + e);
        }
    }

    public static String randomCode() {
        String s = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0123456789";
        // String là 1 mảnh char thôi :> mà có mảng thì sẽ có index để lấy ra

        String code = "";

        int min = 0;
        int max = s.length() - 1;

        for (int i = 1; i <= 6; i++) {
            int index = (int) (Math.random() * (max - min + 1) + min); // tạo ra 1 index ngẫu nhiên từ min tới max 
            code += s.charAt(index) + "";

        }

        return code;
    }

}
