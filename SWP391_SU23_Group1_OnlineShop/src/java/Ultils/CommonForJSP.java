/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ultils;

import DAL.DAO;
import Models.Color;
import Models.Comment;
import Models.Size;
import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

public class CommonForJSP {

    public Date getCurrentDate() {
        LocalDate curDate = java.time.LocalDate.now();
        return Date.valueOf(curDate.toString());
    }

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

    public int getRandomNumber(int min, int max) {
        return (int) Math.floor(Math.random() * (max - min + 1)) + min;
    }

    public boolean[] getCheckedColor(List<Color> color) {
        List<Color> list = new DAO().getAllColor();
        boolean[] checked = new boolean[list.size()];

        for (int i = 0; i < checked.length; i++) {
            checked[i] = checkedC(list.get(i).getId(), color);
        }

        return checked;
    }
    public boolean[] getCheckedSize(List<Size> size) {
        List<Size> list = new DAO().getAllSize();
        boolean[] checked = new boolean[list.size()];

        for (int i = 0; i < list.size(); i++) {
            checked[i] = checkedS(list.get(i).getId(), size);
        }
        return checked;
    }

    private boolean checkedC(int id, List<Color> list) {
        for (Color item : list) {
            if (item.getId() == id) {
                return true;
            }
        }
        return false;
    }

    private boolean checkedS(int id, List<Size> list) {
        for (Size item : list) {
            if (item.getId() == id) {
                return true;
            }
        }
        return false;
    }

    public float takeTotalRating(int pid){
        List<Comment> list = new CommentDAO().getCommentByProductId(pid);
        
        int total = 0;
        for (Comment item : list) {
            total += item.getRate();
        }
        
        int result = 0;
        if(!list.isEmpty()){
            result =  total / list.size();
        }
        return result;
        
        
    }

}
