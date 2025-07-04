/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBHeader;
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
import com.vensys.appcm.model.Header;
import org.apache.log4j.Logger;

/**
 *
 * @author hadi
 */
public class SCDuplicate extends HttpServlet {

    Logger log = Logger.getLogger(getClass().getName());

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
        HttpSession httpSession = request.getSession();
        DBconnection dbConn = new DBconnection();
        List<Header> duplicate = new ArrayList<Header>();
        DBHeader bBHeaders = new DBHeader(dbConn.getConnection());
        String channel = httpSession.getAttribute("channel").toString();
        try {
            log.info("processRequest");
            duplicate = bBHeaders.getAllHeaderDuplicate(channel);
            httpSession.setAttribute("duplicate", duplicate);
            httpSession.setAttribute("flagFilter", "MOD");
//            httpSession.setAttribute("headers", duplicate);
        } catch (Exception ex) {
            log.error(ex.getMessage());
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewDuplicate.jsp");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("controllerHeaders.jsp?menu=0");
        dispatcher.forward(request, response);
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
