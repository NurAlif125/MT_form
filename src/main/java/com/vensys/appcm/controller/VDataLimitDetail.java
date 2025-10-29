/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataTieringLimit;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.DataLimitDetail;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author rafli
 */
@WebServlet("/VDataLimitDetail")
public class VDataLimitDetail extends HttpServlet {
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
        response.setContentType("text/html;charset=UTF-8");
        DBconnection dbConn = new DBconnection();
        DBDataTieringLimit dbLimit = new DBDataTieringLimit(dbConn.getConnection());
        DataLimitDetail data = new DataLimitDetail();
        String id = request.getParameter("id");
        String level = request.getParameter("level");
        String source = request.getParameter("source");
        try {
            if (id != null) {
                data.setId(Integer.parseInt(id));
                Map<String, Object> selectedData = dbLimit.getDataById(id);
                
                if (selectedData != null) {
                    request.setAttribute("dataLimitDetail", selectedData);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("addLimitDetail.jsp");
                    dispatcher.forward(request, response);

                } else {
                    request.setAttribute("dataLimitDetail", null);
                }
            } else {
                Map<String, Object> datas = new HashMap<>();
                datas.put("id", "");
                datas.put("currency", "");
                datas.put("min_limit", 0);
                datas.put("max_limit", 0);
                datas.put("is_enable", 0);
                datas.put("level", level);
                datas.put("source", source);
                
//                datas.setLevel(level);
//                data.setSource(source);
//                data.setMin_limit(BigDecimal.ZERO);
//                data.setMax_limit(BigDecimal.ZERO);

                request.setAttribute("dataLimitDetail", datas);
                RequestDispatcher view = request.getRequestDispatcher("addLimitDetail.jsp");
                view.forward(request, response);
            }
        
        } catch(Exception e) {
            e.printStackTrace();
            log.error(e.getMessage());
        } finally {
            dbConn.closeConnection();
        }
        
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
