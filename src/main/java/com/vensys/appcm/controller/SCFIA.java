/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBFIA;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.vensys.appcm.model.DataFIA;

/**
 *
 * @author hadi
 */
public class SCFIA extends HttpServlet {

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
        DataFIA data = new DataFIA();
        DBFIA dbData = new DBFIA(dbConn.getConnection());

        String id = request.getParameter("id");
        data.setSource(request.getParameter("source"));
        data.setMtormx(request.getParameter("mtormx"));
        data.setNeedcheckaml(Integer.parseInt(request.getParameter("needcheckaml")));
        data.setNeedconverted(Integer.parseInt(request.getParameter("needconverted")));
        data.setSourceto(request.getParameter("sourceto"));
        if (id == null ? "null" == null : id.equals("null") || id.isEmpty()) {
            //dbData.addBic(data);
        } else {
            dbData.updateFIA(data, id);
        }
        try {
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("SCFIAList");
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
