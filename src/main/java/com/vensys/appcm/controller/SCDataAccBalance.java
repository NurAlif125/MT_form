/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataAccBalance;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataAccBalance;

/**
 *
 * @author ovasae
 */
public class SCDataAccBalance extends HttpServlet {

    DBconnection dbConn = new DBconnection();
    DBDataAccBalance dbDataBalance = new DBDataAccBalance(dbConn.getConnection());
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
        DataAccBalance data = new DataAccBalance();
        DBDataAccBalance dbData = new DBDataAccBalance(dbConn.getConnection());
        HttpSession session = request.getSession();
        String id_account = request.getParameter("id_account");
        String account = request.getParameter("account");
//        String action = request.getParameter("action");
        String strErrMsg = null;
        RequestDispatcher dispatcher = null;
        data.setAccount(account);
        data.setValue_date(request.getParameter("balance_date"));
//        data.setBalance(BigDecimal.valueOf(request.getParameter("balance")));
        BigDecimal bd1 = new BigDecimal(request.getParameter("balance").replace(",", "."));
        data.setBalance(bd1);
        data.setAlways_send(request.getParameter("always_send"));
        data.setSequence_stmt(0);
        data.setSequence_date(request.getParameter("sequence_date"));
        data.setIsDuplicate(request.getParameter("isDuplicate"));
        List<String> duplicate = dbDataBalance.cekDataDuplicateAccBalance(account);
        if (id_account == null ? "null" == null : id_account.equals("null") || id_account.isEmpty()) {
            if (duplicate.size() > 0) {
                strErrMsg = "Account Balance Already Exist";
                session.setAttribute("errorMsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("addAccBalance.jsp");
                dispatcher.forward(request, response);
                log.info(strErrMsg);
                System.out.println("Data Telah Ada Sebelumnya");
            } else {
                UUID uuid = UUID.randomUUID();
                data.setId_account("AC." + uuid);
                dbData.addDataAccBalance(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                System.out.println("Data Telah Terinput");
                dispatcher = request.getRequestDispatcher("SCDataBalanceList");
            }
        } else if (request.getParameter("delete") == null) {
            data.setId_account(id_account);
            dbData.updateDataAccBalance(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            dispatcher = request.getRequestDispatcher("SCDataBalanceList");
        } else {
            dbData.delete(id_account, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            dispatcher = request.getRequestDispatcher("SCDataBalanceList");
        }

        try {
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
//        RequestDispatcher dispatcher = request.getRequestDispatcher("SCDataBalanceList");
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
            Logger.getLogger(SCDataAccBalance.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SCDataAccBalance.class.getName()).log(Level.SEVERE, null, ex);
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
