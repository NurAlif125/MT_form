/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataTieringLimit;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;

/**
 *
 * @author rafli
 */
public class SCCurrencyLimit extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        DBconnection2 dbConn = new DBconnection2();
        DBDataTieringLimit dbLimit = new DBDataTieringLimit(dbConn.getConnection2());
        String id = request.getParameter("id");
        String level = request.getParameter("level");
        String channel = request.getParameter("source");
        String currency = request.getParameter("currency");
        String ccy = request.getParameter("ccy");
        String min = request.getParameter("min_limit");
        String max = request.getParameter("max_limit");
        String isEnable = request.getParameter("enable");
        BigDecimal min_limit;
        if (min != null) {
            min_limit = new BigDecimal(min);
        } else {
            min_limit = BigDecimal.ZERO;
        }
        
        BigDecimal max_limit;
        if (max != null) {
            max_limit = new BigDecimal(max);
        } else {
            max_limit = BigDecimal.ZERO;
        }
        
        int checkDupl = 0;
        checkDupl = dbLimit.checkDuplicateTiering(currency, level, channel);
        if (id == null || "".equalsIgnoreCase(id)) {
            if (checkDupl > 0) {
                session.setAttribute("alertTieringLimit", ""+currency+" data for "+level+" and "+channel+" channel already exists.");
            } else {
                dbLimit.insertLimit(currency, min_limit, max_limit, isEnable, level, channel);
            }
        } else {
            if (checkDupl > 1) {
                session.setAttribute("alertTieringLimit", ""+currency+" data for "+level+" and "+channel+" channel already exists.");
            } else {
                dbLimit.updateLimit(id, currency, min_limit, max_limit, isEnable, level, channel);
            }
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("VDataTieringLimit.jsp");
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
