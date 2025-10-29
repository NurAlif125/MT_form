/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataTieringLimit;
import com.vensys.appcm.dbase.DBHeader;
import com.vensys.appcm.dbase.DBUserData;
import com.vensys.appcm.dbase.DBWorkflowLogs;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.DataLimitDetail;
import com.vensys.appcm.model.DataWorkflowLogs;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.commons.text.StringEscapeUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author HP PROBOOK 430 G8
 */
@WebServlet("/SCDataTieringLimit")
public class SCDataTieringLimit extends HttpServlet {
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
        HttpSession session = request.getSession();
        String userId = session.getAttribute("user_id") != null ? session.getAttribute("user_id").toString() : null;
        String ipAccess = session.getAttribute("ip_access") != null ? session.getAttribute("ip_access").toString() : null;
        String compName = session.getAttribute("comp_name") != null ? session.getAttribute("comp_name").toString() : null;
        
        if (userId == null && ipAccess == null && compName == null) {
            SessionRegistry.removeSession(userId);
             // Jika servlet dipanggil lewat DataTables (AJAX), kirim JSON error
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);

            PrintWriter out = response.getWriter();
            out.print("{\"error\": \"Unauthorized - Access denied\"}");
            out.flush();
            out.close();
            return;
        }
        
        
//        response.setContentType("text/html;charset=UTF-8");
        log.info("SCDataTieringLimit List");  
        response.setContentType("application/json");
        
         // get sort list table
        String orderColumnIndexRaw = request.getParameter("order[0][column]");
        String orderDirRaw = request.getParameter("order[0][dir]"); // asc / desc
        // Escape untuk mencegah XSS
        String orderColumnIndex = StringEscapeUtils.escapeHtml4(orderColumnIndexRaw);
        String orderDir = StringEscapeUtils.escapeHtml4(orderDirRaw);

         if (!orderColumnIndex.matches("\\d+")) {
            orderColumnIndex = "0"; // default index
        }

        // Ambil nama kolom
        String orderColumnNameRaw = request.getParameter("columns[" + orderColumnIndex + "][data]");
        
        System.out.println(orderColumnIndexRaw);
        // Escape juga kolom
        String orderColumnName = StringEscapeUtils.escapeHtml4(orderColumnNameRaw);
//        
//        System.out.println("57========= "+orderDir+" === "+orderColumnName);
        String sort = "", columnName = "";
        if (orderColumnName == null || orderColumnName.isEmpty() || "null".equalsIgnoreCase(orderColumnName) || "".equalsIgnoreCase(orderColumnName)) {
            columnName = "level ";
            sort = "level ASC";
//            System.out.println("62========= "+sort);
        } else {
            sort = orderColumnName+" "+orderDir;
//            System.out.println("69========= "+sort);
        }
        
        

        int draw = request.getParameter("draw") != null ? Integer.parseInt(request.getParameter("draw")) : 1;
        int start = request.getParameter("start") != null ? Integer.parseInt(request.getParameter("start")) : 0;
        int length = request.getParameter("length") != null ? Integer.parseInt(request.getParameter("length")) : 10;
        
        String find = request.getParameter("find");
        String quickSearch = request.getParameter("quicksearch");

        int pageNumber = (start / length) + 1; // (20 / 10) + 1 = 3
        int offset = (pageNumber - 1) * length; // (3 - 1) * 10 = 20


        PrintWriter out = response.getWriter();
        HttpSession httpSession = request.getSession();
        String level = (request.getParameter("level") == null) ? "" : request.getParameter("level");
        String source = (request.getParameter("source") == null) ? "" : request.getParameter("source");
        

        DBconnection dbConn = new DBconnection();
        DBDataTieringLimit dbLimit = new DBDataTieringLimit(dbConn.getConnection());
        
        try {
            List<DataLimitDetail> datas = new ArrayList<>();
            int totalRecords = 0;

            datas = dbLimit.getResultTieringLimit(level, source, start, length, quickSearch, sort);
            totalRecords = dbLimit.getCountDataLimit(quickSearch, level, source);
            System.out.println("Total Data:"+ String.valueOf(totalRecords));

            JSONArray dataArray = new JSONArray();
            for (DataLimitDetail h : datas) {
                JSONObject obj = new JSONObject();
                obj.put("id", h.getId());
                obj.put("currency", h.getCurrency());
                obj.put("min_limit", h.getMin_limit());
                obj.put("max_limit", h.getMax_limit());
                if(h.getIsEnable() == 1) {
                    obj.put("is_enable", "Enable");
                } else {
                    obj.put("is_enable", "Disable");
                }
                dataArray.put(obj);
            }

            JSONObject jsonResponse = new JSONObject();

            jsonResponse.put("draw", draw);
            jsonResponse.put("recordsTotal", totalRecords);
            jsonResponse.put("recordsFiltered", totalRecords); // PENTING
            jsonResponse.put("data", dataArray);
            out.print(jsonResponse.toString());

                
        } catch (Exception e) {
            e.printStackTrace();
            log.error("Error SCDataTieringLimit Servlet"+e.getMessage());
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("error", "Error fetching data: " + e.getMessage());
            out.print(errorResponse.toString());
        } finally {
            out.flush();
            out.close();
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
