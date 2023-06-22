/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ultils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class SupportImage {

    public static void uploadImage(HttpServletRequest request, HttpServletResponse response, String urlPath, String newName) throws IOException, ServletException {
        Part file = request.getPart("upload_image");

        String imageFileName = file.getSubmittedFileName(); // lấy ra file ảnh đã chọn

        System.out.println("Image Selected: " + imageFileName);

        System.out.println("urlPath: " + urlPath);
        System.out.println("newName: " + newName);

        String uploadPath = request.getContextPath() + urlPath;

        System.out.println("UploadPath: " + uploadPath);
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

            SupportMessage.sendToastToDashboard(request.getSession(), 1, "UpLoad Image", "Successful !");

        } catch (IOException e) {
            System.out.println(e);
            SupportMessage.sendToastToDashboard(request.getSession(), 0, "UpLoad Image", "Something Wrong !");

        }
    }
}
