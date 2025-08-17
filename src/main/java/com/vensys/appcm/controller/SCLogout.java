/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBEventLog;
import com.vensys.appcm.dbase.DBUserData;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.Connection;

/**
 *
 * @author hadi
 */
public class SCLogout extends HttpServlet {

    private static final long serialVersionUID = 1L;
//    Connection conn;
//    DBEventLog evl = new DBEventLog(conn);
//    
//    public SCLogout(Connection conn) {
//        this.conn = conn;
//    }

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        DBconnection dbConn = new DBconnection();
        DBconnection2 dbConn2 = new DBconnection2();
        DBUserData dbo = new DBUserData(dbConn.getConnection());
        DBEventLog dbEvl = new DBEventLog(dbConn2.getConnection2());

        String user_id = (String) session.getAttribute("user_id");
        String ip_access = (String) session.getAttribute("ip_access");
        String comp_name = (String) session.getAttribute("comp_name");
        Object userObj = session.getAttribute("user");
        String userId = session.getAttribute("user_id") != null ? session.getAttribute("user_id").toString() : null;
        String ipAccess = session.getAttribute("ip_access") != null ? session.getAttribute("ip_access").toString() : null;
        String compName = session.getAttribute("comp_name") != null ? session.getAttribute("comp_name").toString() : null;

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, private");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setHeader("Content-Security-Policy",
                "default-src 'self'; "
                + "script-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net; "
                + "style-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net; "
                + "img-src 'self' data: https://flickr.com; "
                + "font-src 'self' https://cdn.jsdelivr.net; "
                + "connect-src 'self'; "
                + "object-src 'none'; "
                + "frame-ancestors 'none'; "
                + "base-uri 'self'; "
                + "form-action 'self'; "
                + "upgrade-insecure-requests;"
        );

        if (userId != null && ipAccess != null && compName != null) {
            String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            dbo.insertDataLogin(userId, "0", ipAccess, compName, tanggal, "1");
        } else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('Your session has expired, please log in again!');");
            out.println("window.location.href='login.jsp';");
            out.println("</script>");
            out.close();
//        response.sendRedirect("login.jsp");
            return;
            // System.out.println("Session attributes are missing: user_id, ip_access, or comp_name is null.");
//        log.info("Session attributes are missing: user_id, ip_access, or comp_name is null.");
        }

        try {
            dbEvl.insertDataEvent(user_id, "User Logout", ip_access, comp_name);
        } catch (Exception e) {
            e.printStackTrace(); // atau gunakan logger
            System.out.println("error" + e.getMessage());
        }

//    evl.insertDataEvent(user_id, "User Logout", ip_access, comp_name);
        // Lakukan sesuatu dengan userObj jika tidak null
        if (userObj != null) {
            String user = userObj.toString();
            // System.out.println("Logged out user: " + user);
//        evl.insertDataEvent(user_id, "User Logout", ip_access, comp_name);
        }

        session.invalidate();

        session = request.getSession(true);
        session.setAttribute("errorMsglogin", "You have been logged out.");

        // Redirect ke login.jsp
        response.sendRedirect("login.jsp");
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
        processRequest(request, response);
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
