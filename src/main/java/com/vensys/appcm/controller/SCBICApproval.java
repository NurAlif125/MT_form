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
import java.sql.SQLException;
import java.util.logging.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author rafli
 */
public class SCBICApproval extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        DBconnection2 dbConn2 = new DBconnection2();
        DataBIC data = new DataBIC();
        DataBIC datas = new DataBIC();
        DBBIC dbData = new DBBIC(dbConn2.getConnection2());

        String id_member = request.getParameter("id_member");
        String action = request.getParameter("approvebic") != null ? "APPROVE"
                : request.getParameter("rejectbic") != null ? "REJECT" : null;

        try {
            if (id_member == null || !id_member.matches("\\d+")) {
                response.sendError(400, "Invalid or missing id_member");
                return;
            }

            if (action == null) {
                response.sendError(400, "No action specified");
                return;
            }

            data.setCode_member(request.getParameter("code_member"));
            data.setCompany(request.getParameter("company"));
            data.setAddress(request.getParameter("address"));
            data.setNote(request.getParameter("note"));

            if (action.equalsIgnoreCase("APPROVE")) {
                log.info("Approving BIC");
                dbData.addDataAfterApproval(data, Integer.parseInt(id_member));
            } else if (action.equalsIgnoreCase("REJECT")) {
                data = dbData.getBicById(id_member);
                if (data.getCode_member() == null && data.getCompany() == null) {
                    dbData.deletePermanentBICApproval(Integer.parseInt(id_member));
                } else {
                    dbData.deleteBICApproval(Integer.parseInt(id_member));
                }
            }
        } catch (NumberFormatException e) {
            response.sendError(400);
        } catch (Exception ex) {
            log.error("Exception in processRequest: ", ex);
            response.sendError(500);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SCBICApproval.class.getName()).log(Level.SEVERE, null, ex);
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
            java.util.logging.Logger.getLogger(SCBICApproval.class.getName()).log(Level.SEVERE, null, ex);
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
