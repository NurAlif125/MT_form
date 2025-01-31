/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataFeeRemit;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataFeeRemit;

/**
 *
 * @author ovasae
 */
public class SCDataFeeRemit extends HttpServlet {

    DBconnection dbConn = new DBconnection();
    DBDataFeeRemit dBDataFeeRemit = new DBDataFeeRemit(dbConn.getConnection());
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
            throws ServletException, IOException, SQLException {
        DBconnection dbConn = new DBconnection();
        DataFeeRemit data = new DataFeeRemit();
        DBDataFeeRemit dbData = new DBDataFeeRemit(dbConn.getConnection());
        HttpSession session = request.getSession();
        String fee_id = request.getParameter("fee_id");
        System.out.println("fee_id adalah " + fee_id);
        String currency = request.getParameter("currency");
        String fee_amount = request.getParameter("fee_amount");
        String strErrMsg = null;
        RequestDispatcher dispatcher = null;
        data.setCurrency(request.getParameter("currency"));
        BigDecimal feeAmount;
        feeAmount = new BigDecimal(fee_amount.replace(",", "."));
        data.setFee_amount(feeAmount);
//        data.setFee_amount(request.getParameter("fee_amount"));
        List<String> duplicate = dBDataFeeRemit.cekDataDuplicateFeeRemit(currency);
        System.out.println("Data Duplicate Fee Remit : " + duplicate.size());
        
        if (fee_id == null? "null" == null : fee_id.equals("null") || fee_id.isEmpty()) {
            if (duplicate.size() > 0) {
                strErrMsg = "Fee Remittance Already Exist";
                session.setAttribute("errorMsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("addFeeRemit.jsp");
                dispatcher.forward(request, response);
                log.info(strErrMsg);
                System.out.println("Data Telah Ada Sebelumnya");
            } else {
                dbData.addDataFeeRemit(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                System.out.println("Data Telah Terinput");
                dispatcher = request.getRequestDispatcher("SCDataFeeRemitList");
            }
        } else if (request.getParameter("delete") == null) {
            dbData.updateDataFeeRemit(data, Integer.parseInt(fee_id), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            System.out.println("updateDataFeeRemit");
            dispatcher = request.getRequestDispatcher("SCDataFeeRemitList");
        } else {
            dbData.delete(Integer.parseInt(fee_id), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            System.out.println("delete");
            dispatcher = request.getRequestDispatcher("SCDataFeeRemitList");
        }
        
        try {
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
        
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
            Logger.getLogger(SCDataFeeRemit.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SCDataFeeRemit.class.getName()).log(Level.SEVERE, null, ex);
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
