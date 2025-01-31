/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataCounterRate;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.logging.Level;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataCounterRate;
import java.text.ParseException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
//import org.apache.log4j.Logger;

/**
 *
 * @author lenovo
 */
public class SCDataCounterRate extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        DBconnection dbConn = new DBconnection();
        DataCounterRate data = new DataCounterRate();
        DBDataCounterRate dbData = new DBDataCounterRate(dbConn.getConnection());
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String currDate = (new SimpleDateFormat("yyMMdd")).format(new Date());
        UUID uuid = UUID.randomUUID();
        String currency = request.getParameter("currency");
        String tanggal = request.getParameter("tanggal");
        String tc_buy = request.getParameter("tc_buy");
        String tt_buy = request.getParameter("tt_buy");
        String tt_sell = request.getParameter("tt_sell");
        String tc_sell = request.getParameter("tc_sell");
        String update_by = session.getAttribute("user_id").toString();
//        String update_date = request.getParameter("update_date");
        String against_currency = request.getParameter("against_currency");
        String action = request.getParameter("action");
        data.setId(currDate + "." + uuid);
        data.setCurrency(currency);
        data.setTanggal(tanggal);
        data.setTc_buy(tc_buy);
        data.setTt_buy(tt_buy);
        data.setTt_sell(tt_sell);
        data.setTc_sell(tc_sell);
        data.setUpdate_by(update_by);
        data.setAgainst_currency(against_currency);
        data.setMargin_point(calculateMarginPoint(tt_sell, tt_buy).toString());

        System.out.println("margin" + data.getMargin_point());

//        data.setUpdate_date(update_date);
        String strErrMsg = null;
        RequestDispatcher dispatcher = null;
        System.out.println("Pusing :");
//        boolean cekDataDuplicateBycurrency = dbData.cekDataDuplicateBycurrency(data.getCurrency(), data.getAgainst_currency(), data.getTanggal());
        try {
            boolean cekDataDuplicateBycurrency = dbData.cekDataDuplicateBycurrency(data.getCurrency(), data.getAgainst_currency(), data.getTanggal());
            if (id == null ? "null" == null : id.equals("null") || id.isEmpty()) {
                // ini logic Add
                if (cekDataDuplicateBycurrency == false) {
                    dbData.addDataCounterRate(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                    System.out.println("Data berhasil ");
                    dispatcher = request.getRequestDispatcher("CounterRateList");
                } else {
                    strErrMsg = "Counter Rate Already Exist";
                    session.setAttribute("errorMsg", strErrMsg);
                    dispatcher = request.getRequestDispatcher("addcounterrate.jsp?result=error");
                    log.info(strErrMsg);
                    System.out.println("Data Telah Ada Sebelumnya");
                }
            } else {
                //ini logic edit
                if (request.getParameter("delete") == null) {
                    dbData.updateDataCounterRate(data, id, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                    System.out.println("Data berhasil diupdate");
                    dispatcher = request.getRequestDispatcher("CounterRateList");
                } else {
                    dbData.hapusCounterRate(id, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                    dispatcher = request.getRequestDispatcher("CounterRateList");
                }

            }
        } catch (ParseException e) {
            // Handle exception, e.g., log it or throw a custom exception
            e.printStackTrace(); // or use logging
            // Optionally, you can set a default return value or handle the error in another way
        }

//         if (action == null) {
        try {
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
//        RequestDispatcher dispatcher = request.getRequestDispatcher("SCNegaraSuspectList");
        dispatcher.forward(request, response);
    }

    public BigDecimal calculateMarginPoint(String ttSell, String ttBuy) {
        BigDecimal ttSelllBigDc = new BigDecimal(ttSell);
        BigDecimal ttBuyBigDc = new BigDecimal(ttBuy);

        BigDecimal valueCal = (((ttSelllBigDc.subtract(ttBuyBigDc))).divide(new BigDecimal(2), 4, RoundingMode.HALF_UP)).multiply(new BigDecimal(0.8));

        return valueCal;
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
            java.util.logging.Logger.getLogger(SCDataCounterRate.class.getName()).log(Level.SEVERE, null, ex);
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
            java.util.logging.Logger.getLogger(SCDataCounterRate.class.getName()).log(Level.SEVERE, null, ex);
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
