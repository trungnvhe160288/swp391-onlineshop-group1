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

    public static String uploadImage(HttpServletRequest request, HttpServletResponse response, String urlPath, String newName) throws IOException, ServletException {
        Part file = request.getPart("upload_image");

        String imageFileName = file.getSubmittedFileName(); // lấy ra file ảnh đã chọn
        System.out.println("Image Selected: " + imageFileName);
        String uploadName = "";

        if (!imageFileName.isEmpty()) {
            String[] image_split = imageFileName.split("\\.");

            uploadName = newName + "." + image_split[1];

            String uploadPath = "D:/SU23/Java/Group1_Online_Shop/web" + urlPath + uploadName;

            System.out.println("uploadPath: " + uploadPath);
            System.out.println("uploadName: " + uploadName);

            try {
                FileOutputStream fos = new FileOutputStream(uploadPath);
                InputStream is = file.getInputStream();

                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();

            } catch (IOException e) {
                System.out.println(e);
                return "";
            }
        }
        return uploadName;
    }
}
