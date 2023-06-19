/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ultils;

import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class CommonForJSP {

    

    public int parseInt(String x) {
        int n = 0;

        try {
            n = Integer.parseInt(x);
        } catch (NumberFormatException e) {
            System.out.println("Error Parse Int: " + e);
        }

        return n;
    }

    public String getPriceFormat(double price) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(price);
    }

    public String getDateFormat(Date date, String pattern) {
        return new SimpleDateFormat(pattern).format(date);
    }

    public int getRandomNumber(int min, int max){
        return (int)Math.floor(Math.random() * (max - min + 1)) + min;
    }
    
}
