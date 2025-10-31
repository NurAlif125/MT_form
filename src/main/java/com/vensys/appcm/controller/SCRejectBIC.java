/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.google.gson.Gson;
import com.vensys.appcm.dbase.DBBIC;
import com.vensys.appcm.dbase.DBconnection2;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.vensys.appcm.model.DataBIC;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
/**
 *
 * @author rafli
 */
public class SCRejectBIC extends HttpServlet {
    
    Logger log = LogManager.getLogger(getClass().getName());

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
        DBconnection2 dbConn2 = new DBconnection2();
        DataBIC data = new DataBIC();
        DBBIC dbData = new DBBIC(dbConn2.getConnection2());
        Gson gson = new Gson();
        
        List<DataBIC> datas = dbData.selectForReject();
        if (datas.size() > 0) {
            for (int i = 0; i < datas.size(); i++) {
                if (datas.get(i).getCode_member() == null && datas.get(i).getCompany() == null) {
                    dbData.deletePermanentBICApproval(datas.get(i).getId_member());
                } else {
                    dbData.deleteBICApproval(datas.get(i).getId_member());
                }
            }
        }
        log.info("Reject all BIC");
        
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
