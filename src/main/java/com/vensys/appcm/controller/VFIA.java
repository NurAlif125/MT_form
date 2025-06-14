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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hadi
 */
public class VFIA extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DBconnection dbConn = new DBconnection();
        //DataFIA fiaById = new DataFIA();
        DataFIA fiaById = null;
        DBFIA db = new DBFIA(dbConn.getConnection());
        List<String> dataSource = null;
        List<String> selectedSourceToList = new ArrayList<>();
        try {
            String id = request.getParameter("id");
            if (id != null && !id.trim().isEmpty()) {
                fiaById = db.getFiaById(id);
                String selectedStr = fiaById.getSourceto();
                if (selectedStr != null && !selectedStr.trim().isEmpty()) {
                    for (String val : selectedStr.split(",")) {
                        selectedSourceToList.add(val.trim());
                    }
                }
            } else {
                fiaById = new DataFIA(); 
            }
            dataSource = db.getSourcefromSftpReaderFia();
        } catch (Exception ex) {
            // System.out.println("error di servletxx");
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }

        request.setAttribute("fiaById", fiaById);
        request.setAttribute("dataSource", dataSource);
        request.setAttribute("selectedSourceToList", selectedSourceToList);
        RequestDispatcher view = request.getRequestDispatcher("mfia.jsp");
        view.forward(request, response);
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
