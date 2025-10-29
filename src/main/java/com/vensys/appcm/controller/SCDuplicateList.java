/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.apache.commons.text.StringEscapeUtils;
import com.vensys.appcm.dbase.DBHeader;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.Header;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

// Ganti path sesuai kebutuhan
@WebServlet("/SCDuplicateList")
public class SCDuplicateList extends HttpServlet {
    Logger log = LogManager.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
        // get sort list table
        String orderColumnIndexRaw = request.getParameter("order[0][column]");
        String orderDirRaw = request.getParameter("order[0][dir]"); // asc / desc
        // Escape untuk mencegah XSS
        String orderColumnIndex = StringEscapeUtils.escapeHtml4(orderColumnIndexRaw);
        String orderDir = StringEscapeUtils.escapeHtml4(orderDirRaw);

        // Validasi angka index
        if (!orderColumnIndex.matches("\\d+")) {
            orderColumnIndex = "0"; // default index
        }

        // Ambil nama kolom
        String orderColumnNameRaw = request.getParameter("columns[" + orderColumnIndex + "][data]");
        // Escape juga kolom
        String orderColumnName = StringEscapeUtils.escapeHtml4(orderColumnNameRaw);
//        
//        System.out.println("48========= "+orderDir+" === "+orderColumnName);
        String sort = "", columnName = "";
        if (orderColumnName == null || orderColumnName.isEmpty() || "null".equalsIgnoreCase(orderColumnName) || "".equalsIgnoreCase(orderColumnName)) {
            columnName = "tanggal";
            sort = "tanggal DESC";
//            System.out.println("53========= "+sort);
        } else {
            sort = orderColumnName+" "+orderDir;
//            System.out.println("56========= "+sort);
        }

        int draw = Integer.parseInt(request.getParameter("draw"));
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        String quickSearch = request.getParameter("quicksearch");
//        String quickSearch2 = request.getParameter("quicksearch");
        
//        System.out.println("search 1="+quickSearch+"    | serach2 = "+quickSearch2);
   
//        int pageNumber = (start / length) + 1; // (20 / 10) + 1 = 3
//        int offset = (pageNumber - 1) * length; // (3 - 1) * 10 = 20

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        DBconnection dbConn = new DBconnection();
        HttpSession httpSession = request.getSession();
        
        String flagStatus = (String) httpSession.getAttribute("flagStatus");

        List<Header> duplicate = new ArrayList<Header>();
        DBHeader bBHeaders = new DBHeader(dbConn.getConnection());
        String channel = httpSession.getAttribute("channel").toString();
        
        
        try {
            log.info("SC");
            int totalRecords = 0;
            duplicate = bBHeaders.getAllHeaderDuplicate(httpSession, channel, start, length, quickSearch, sort);
            totalRecords = bBHeaders.getCountAllHeaderDuplicate(httpSession, channel, quickSearch);
//            httpSession.setAttribute("duplicate", duplicate);
            httpSession.setAttribute("flagFilter", "DUPL");
            httpSession.setAttribute("flag", "DUPL");
        
        
            JSONArray dataArray = new JSONArray();
            for (Header h : duplicate) {
                JSONObject obj = new JSONObject();
                obj.put("id_headers", h.getId_headers());
                obj.put("messageType", h.getMessageType());
                obj.put("logicalTerminal", h.getLogicalTerminal());
                obj.put("sessionNumber", h.getSessionNumber());
                obj.put("sequenceNumber", h.getSequenceNumber());
                obj.put("io_type", h.getIo_type());
                obj.put("receiverAddress", h.getReceiverAddress());
                obj.put("tanggal", h.getTanggal());
                obj.put("flag", h.getFlag());
                obj.put("trans_reference", h.getTag20());
                dataArray.put(obj);
            }

            JSONObject jsonResponse = new JSONObject();

            jsonResponse.put("draw", draw);
            jsonResponse.put("recordsTotal", totalRecords);
            jsonResponse.put("recordsFiltered", totalRecords); // PENTING
            jsonResponse.put("data", dataArray);
//            System.out.println("JSON Response: " + jsonResponse.toString());
            out.print(jsonResponse.toString());
//            out.print(jsonResponse.toString());
        } catch (Exception e) {
            e.printStackTrace();
            log.error("Error Header Servlet"+e.getMessage());
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("error", "Error fetching data: " + e.getMessage());
            out.print(errorResponse.toString());
        } finally {
            out.flush();
            out.close();
        }
    }
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Handle POST sama seperti GET
//        RequestDispatcher dispatcher = request.getRequestDispatcher("controllerHeaders.jsp?find=yes");
//        dispatcher.forward(request, response);

    }

}

