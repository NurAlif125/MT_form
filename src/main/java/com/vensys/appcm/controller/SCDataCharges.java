/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBCharges;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataCharges;

/**
 *
 * @author hadi
 */
public class SCDataCharges extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Logger log = Logger.getLogger(getClass().getName());

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
            throws ServletException, IOException, SQLException, Exception {

        DBconnection dbConn = new DBconnection();
        DataCharges data = new DataCharges();
        DBCharges dbData = new DBCharges(dbConn.getConnection());
        HttpSession session = request.getSession();
        String id_charges = request.getParameter("id_charges");
        String action = request.getParameter("action");
        data.setCurrency(request.getParameter("currency"));
        data.setCharges(request.getParameter("charges"));
        String strErrMsg = null;
        RequestDispatcher dispatcher = null;
        List<String> duplicate = dbData.cekDataDuplicateChanges(data.getCurrency());
        System.out.println("Data Duplicate : " + duplicate.size());

        if (action == null) {
            if (id_charges == null ? "null" == null : id_charges.equals("null") || id_charges.isEmpty()) {
                if (duplicate.size() > 0) {
                    strErrMsg = "Charges Already Exist";
                    session.setAttribute("errorMsg", strErrMsg);
                    dispatcher = request.getRequestDispatcher("addcharges.jsp");
                    dispatcher.forward(request, response);
                    log.info(strErrMsg);
                    System.out.println("Data Telah Ada Sebelumnya");
                } else {
                    dbData.addDataCharges(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                    System.out.println("Data Telah Terinput");
                }
                dispatcher = request.getRequestDispatcher("SCDataChargesList");
            } else {
                dbData.updateDataCharges(data, Integer.parseInt(id_charges), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                dispatcher = request.getRequestDispatcher("SCDataChargesList");
            }
        } else {
            dbData.delete(Integer.parseInt(id_charges), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            dispatcher = request.getRequestDispatcher("SCDataChargesList");
        }

        try {
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
//        RequestDispatcher dispatcher = request.getRequestDispatcher("SCDataChargesList");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SCDataCharges.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SCDataCharges.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SCDataCharges.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SCDataCharges.class.getName()).log(Level.SEVERE, null, ex);
        }
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
