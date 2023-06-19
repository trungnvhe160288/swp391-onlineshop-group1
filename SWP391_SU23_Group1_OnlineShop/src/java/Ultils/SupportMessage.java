/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ultils;

import jakarta.servlet.http.HttpSession;

public class SupportMessage {

    public static void sendToast(HttpSession session, int type, String toast__message) {
        String toast__type = "";
        String toast__icons = "";

        switch (type) {
            case 0:
                toast__type = "error";
                toast__icons = "fa-solid fa-circle-xmark fa-bounce";
                break;
            case 1:
                toast__type = "success";
                toast__icons = "fa-solid fa-circle-check fa-bounce";
                break;
            case 2:
                toast__type = "warning";
                toast__icons = "fa-solid fa-triangle-exclamation fa-beat-fade";
                break;
            case 3:
                toast__type = "info";
                toast__icons = "fa-solid fa-circle-info fa-flip";
                break;
            default:
                break;

        }

        session.setAttribute("toast__message", toast__message);
        session.setAttribute("toast__icons", toast__icons);
        session.setAttribute("toast__type", toast__type);

    }

}
