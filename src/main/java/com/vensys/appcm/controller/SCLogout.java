/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBUserData;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author hadi
 */
public class SCLogout extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    HttpSession session = request.getSession();
    DBconnection dbConn = new DBconnection();
    DBUserData dbo = new DBUserData(dbConn.getConnection());
    Object userObj = session.getAttribute("user");
    String userId = session.getAttribute("user_id") != null ? session.getAttribute("user_id").toString() : null;
    String ipAccess = session.getAttribute("ip_access") != null ? session.getAttribute("ip_access").toString() : null;
    String compName = session.getAttribute("comp_name") != null ? session.getAttribute("comp_name").toString() : null;
    
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    if (userId != null && ipAccess != null && compName != null) {
        dbo.insertDataLogin(userId, "0", ipAccess, compName, tanggal, "1");
    } else {
        // System.out.println("Session attributes are missing: user_id, ip_access, or comp_name is null.");
//        log.info("Session attributes are missing: user_id, ip_access, or comp_name is null.");
    }
    session.invalidate();
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    session = request.getSession();
    session.setAttribute("errorMsglogin", "You have been logged out.");

    // Lakukan sesuatu dengan userObj jika tidak null
    if (userObj != null) {
        String user = userObj.toString();
        // System.out.println("Logged out user: " + user);
    }

    // Redirect ke login.jsp
    response.sendRedirect("login.jsp");
}


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
