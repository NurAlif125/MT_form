/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBSandiKliring;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.vensys.appcm.model.DataSandiKliring;

/**
 *
 * @author hadi
 */
public class SCSandiKliring extends HttpServlet {
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

        DBconnection dbConn = new DBconnection();
        DataSandiKliring data = new DataSandiKliring();
        DBSandiKliring dbData = new DBSandiKliring(dbConn.getConnection());

        String id_sandi_kliring = request.getParameter("id_sandi_kliring");
        data.setKode(request.getParameter("kode"));
        data.setUraian(request.getParameter("uraian"));
        data.setSandi_kliring(request.getParameter("sandi_kliring"));
        data.setAddress(request.getParameter("address"));
        data.setNote(request.getParameter("note"));
//        System.out.println("id_sandi_kliring=" + id_sandi_kliring);
//        if (id_sandi_kliring == null || id_sandi_kliring.isEmpty()) {
        if (id_sandi_kliring == null ? "null" == null : id_sandi_kliring.equals("null") || id_sandi_kliring.isEmpty()) {
            dbData.addSandiKliring(data);
//            System.out.println("addSandiKliring");
        } else {
            dbData.updateSandiKliring(data, id_sandi_kliring);
//            System.out.println("updateSandiKliring");
        }
        try {
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("SCSandiKliringList");
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
