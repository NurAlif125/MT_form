/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataUser;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataUser;
import java.util.regex.Pattern;
import org.apache.log4j.Logger;

/**
 *
 * @author hadi
 */
public class SCDataUserList extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Logger log = Logger.getLogger(getClass().getName());

    private static final Pattern SAFE_INPUT_PATTERN = Pattern.compile("^[a-zA-Z0-9_-]{0,50}$");

    private static final String[] MALICIOUS_PARAMETERS = {
        "classloader", "class.module", "bytes[", "process", "runtime", "exec"
    };
    
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Set security headers
        setSecurityHeaders(response);
        
        //Log Info Request
        logRequestInfo(request);
        
        //validasi parameter
        if (containsMaliciousParameters(request)) {
            log.warn("Blocked malicious parameter access attempt from IP: " + request.getRemoteAddr());
            response.sendError(500);
            return;
        }

        String user_id = request.getParameter("s_user_id") == null ? "" : request.getParameter("s_user_id").trim();
        String name = request.getParameter("s_name") == null ? "" : request.getParameter("s_name").trim();
        String find = request.getParameter("find") == null ? "" : request.getParameter("find").trim();
        String description = request.getParameter("s_description") == null ? "" : request.getParameter("s_description").trim();
        
        //validasi input
        if (!isInputValid(find) || !isInputValid(name) || !isInputValid(user_id) || !isInputValid(description)) {
            log.warn("Invalid input detected - find: " + find + ", name: " + name + ", user_id: " + user_id + ", description: " + description);
            response.sendError(400);
            return;
        }
        
        HttpSession httpSession = request.getSession();
        DBconnection dbConn = new DBconnection();
        List<DataUser> dataUser = new ArrayList<DataUser>();
        DBDataUser db = new DBDataUser(dbConn.getConnection());
        try {
            log.info("processRequest");
            if (find == null || find.isEmpty()) {
                dataUser = db.getAllDataUser();
            } else {
                dataUser = db.getAllDataUser(user_id, name, description);
            }

            httpSession.setAttribute("dataUser", dataUser);
        } catch (Exception ex) {
            log.error("Exception: " + ex.getMessage(), ex);
            response.sendError(500);
            return;
        } finally {
            dbConn.closeConnection();
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("VDataUser.jsp");
        dispatcher.forward(request, response);
    }

    private void setSecurityHeaders(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        
        response.setHeader("X-Content-Type-Options", "nosniff");
        response.setHeader("X-Frame-Options", "DENY");
        response.setHeader("X-XSS-Protection", "1; mode=block");
        response.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains");
        response.setHeader("Content-Security-Policy", "default-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'; frame-ancestors 'none'; base-uri 'self';");
        response.setHeader("Referrer-Policy", "no-referrer");
        response.setHeader("Permissions-Policy", "geolocation=(), microphone=()");
    }

    private void logRequestInfo(HttpServletRequest request) {
        log.info("Request from IP: " + request.getRemoteAddr()
                + " | URL: " + request.getRequestURL()
                + " | Parameters: " + request.getQueryString());
    }

    private boolean containsMaliciousParameters(HttpServletRequest request) {
        return request.getParameterMap().keySet().stream()
                .anyMatch(key -> {
                    String lowerKey = key.toLowerCase();
                    for (String malicious : MALICIOUS_PARAMETERS) {
                        if (lowerKey.contains(malicious)) {
                            return true;
                        }
                    }
                    return false;
                });
    }
    
    private boolean isInputValid(String input) {
        return SAFE_INPUT_PATTERN.matcher(input).matches();
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
