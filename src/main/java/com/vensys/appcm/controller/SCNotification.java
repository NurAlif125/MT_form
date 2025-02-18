/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.google.gson.Gson;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBnotification;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author HP PROBOOK 430 G8
 */
@WebServlet({"/NotifServlet", "/SCNotificationList"})
public class SCNotification extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    Logger log = Logger.getLogger(getClass().getName());

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
        String strErrMsg = null;
        
         response.setContentType("application/json");
        PrintWriter out = response.getWriter();
         HttpSession session = request.getSession();
//         DBConnection dbConn = new DBConnection();
//         DBnotification notif = new DBnotification(dbConn.getConnection());
         String userId = (String) session.getAttribute("user_id");
         String roleId = (String) session.getAttribute("role_id");
         
        if (userId == null || roleId == null) {
            out.print("{\"count\": 0}");
            return;
        }

            DBconnection dbConn = new DBconnection();
        try {
            DBnotification notif = new DBnotification(dbConn.getConnection());

            int countNotif = notif.getCountNotif(userId, roleId);
            out.print("{\"count\": " + countNotif + "}");
        } catch (Exception e) {
            out.print("{\"count\": 0}");
            e.printStackTrace();
        } finally{
            dbConn.closeConnection();
        }
        
    }
    
    protected void getNotificationList(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("application/json");
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    
    String userId = (String) session.getAttribute("user_id");
    String roleId = (String) session.getAttribute("role_id");

    if (userId == null || roleId == null) {
        out.print("[]"); // Jika user belum login, kembalikan list kosong
        return;
    }

    DBconnection dbConn = new DBconnection();
    try {
        DBnotification notif = new DBnotification(dbConn.getConnection());
        List<Map<String, String>> notificationList = notif.getNotificationList(userId, roleId);
        Gson gson = new Gson();
        out.print(gson.toJson(notificationList));
        System.out.println(gson.toJson(notificationList));
    } catch (Exception e) {
        out.print("[]");
        e.printStackTrace();
        System.err.println("SCNotificationList Error: " + e.getMessage());
    } finally {
        dbConn.closeConnection();
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
//        processRequest(request, response);
         String path = request.getServletPath();

        if (path.equals("/SCNotificationList")) {
            getNotificationList(request, response);
        } else {
            processRequest(request, response);
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
