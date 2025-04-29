/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBBIC;
import com.vensys.appcm.dbase.DBconnection2;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.vensys.appcm.model.DataBIC;

/**
 *
 * @author hadi
 */
public class SCBIC extends HttpServlet {

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

        DBconnection2 dbConn2 = new DBconnection2();
        DataBIC data = new DataBIC();
        DBBIC dbData = new DBBIC(dbConn2.getConnection2());

        String id_member = request.getParameter("id_member");
        data.setCode_member(request.getParameter("code_member"));
        data.setCompany(request.getParameter("company"));
        data.setAddress(request.getParameter("address"));
        data.setNote(request.getParameter("note"));
//        System.out.println("id_member=" + id_member);
//        if (id_member == null || id_member.isEmpty()) {
        if (id_member == null ? "null" == null : id_member.equals("null") || id_member.isEmpty()) {
            dbData.addBic(data);
//            System.out.println("addBic");
        } else {
            int idMember = Integer.parseInt(id_member);
            dbData.updateBic(data, idMember);
//            System.out.println("updateBic");
        }
        try {
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn2.closeConnection2();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("SCBICList");
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
