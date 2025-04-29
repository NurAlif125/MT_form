/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBHeader;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
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

/**
 *
 * @author hadi
 */
public class SCRejectAction extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String comment = request.getParameter("operator_comment");
        DBconnection2 dbConn = new DBconnection2();
        DBDataTransaksiOutgoing dBDataTransaksiOutgoing = new DBDataTransaksiOutgoing(dbConn.getConnection2());
        HttpSession httpSession = request.getSession();
//        DBconnection dbConn = new DBconnection();
        List<Header> reject = new ArrayList<Header>();
        DBHeader bBHeaders = new DBHeader(dbConn.getConnection2());
        try {
            dBDataTransaksiOutgoing.updateStatusDuplicate(Integer.parseInt(id),(String) session.getAttribute("user_id"),(String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), comment);
//            reject = bBHeaders.getAllHeaderReject();
            httpSession.setAttribute("reject", reject);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection2();
        }
//        RequestDispatcher dispatcher = request.getRequestDispatcher("viewReject.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher("SCReject");
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
