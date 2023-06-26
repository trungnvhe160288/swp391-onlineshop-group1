/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ultils;

import Models.Color;
import Models.Size;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.DatatypeConverter;

public class Common {

    public static String convertPassToMD5(String password) {
        MessageDigest convert = null;

        try {

            convert = MessageDigest.getInstance("MD5");

        } catch (NoSuchAlgorithmException e) {
            Logger.getLogger(Common.class.getName()).log(Level.SEVERE, null, e);
        }

        convert.update(password.getBytes());
        byte[] passwordByte = convert.digest();
        return DatatypeConverter.printHexBinary(passwordByte);
    }
    
    public static Date getCurrentDate() {
        LocalDate curDate = java.time.LocalDate.now();
        return Date.valueOf(curDate.toString());
    }

    public static int parseInt(String x) {
        int n = 0;

        try {
            n = Integer.parseInt(x);
        } catch (NumberFormatException e) {
            System.out.println("Error Parse Int: " + e);
        }

        return n;
    }
    
    public static float parseFloat(String x) {
        float n = 0;

        try {
            n = Float.parseFloat(x);
        } catch (NumberFormatException e) {
            System.out.println("Error Parse Float: " + e);
        }

        return n;
    }
    
    public static double parseDouble(String x) {
        double n = 0;

        try {
            n = Double.parseDouble(x);
        } catch (NumberFormatException e) {
            System.out.println("Error Parse Double: " + e);
        }

        return n;
    }

    public static String getPriceFormat(double price) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(price);
    }
    
    public static int getRandomNumber(int min, int max){
        return (int)Math.floor(Math.random() * (max - min + 1)) + min;
    }
    
    
}
