/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ultils;

public class SupportConvert {

    public static int[] convertToInt(String[] x) {
        int[] id = new int[x.length];

        for (int i = 0; i < id.length; i++) {
            id[i] = Integer.parseInt(x[i]);
        }

        return id;
    }
}
