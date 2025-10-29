/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBHeader;
import com.vensys.appcm.dbase.DBUserData;
import com.vensys.appcm.dbase.DBWorkflowLogs;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.DataWorkflowLogs;
import com.vensys.appcm.model.HeaderSearchCriteria;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.text.StringEscapeUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author isal
 */

@WebServlet("/WorkflowLogsListServlet")
public class WorkflowLogsListServlet extends HttpServlet{
    Logger log = LogManager.getLogger(getClass().getName());
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.info("Workflow Logs List");  
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
            columnName = "date_time";
            sort = "date_time DESC";
//            System.out.println("62========= "+sort);
        } else {

            sort = orderColumnName+" "+orderDir;
//            System.out.println("69========= "+sort);
        }
        
        DataWorkflowLogs dataWFLogs = new DataWorkflowLogs();
        dataWFLogs.setDate_time(request.getParameter("columns[1][search][value]"));
        dataWFLogs.setComponent_name(request.getParameter("columns[2][search][value]"));
        dataWFLogs.setMessage_type(request.getParameter("columns[3][search][value]"));
        dataWFLogs.setFile_name_original(request.getParameter("columns[4][search][value]"));
        dataWFLogs.setFile_name(request.getParameter("columns[5][search][value]"));
        dataWFLogs.setRefference(request.getParameter("columns[6][search][value]"));
        dataWFLogs.setStatus(request.getParameter("columns[7][search][value]"));
        dataWFLogs.setDescription(request.getParameter("columns[8][search][value]"));
        dataWFLogs.setSource(request.getParameter("columns[9][search][value]"));

        
        HttpSession session = request.getSession();

        int draw = request.getParameter("draw") != null ? Integer.parseInt(request.getParameter("draw")) : 1;
        int start = request.getParameter("start") != null ? Integer.parseInt(request.getParameter("start")) : 0;
        int length = request.getParameter("length") != null ? Integer.parseInt(request.getParameter("length")) : 10;

        
        String date_time = request.getParameter("date_time");
        String component_name = request.getParameter("component_name");
        String message_type = request.getParameter("message_type");
        String file_name_original = request.getParameter("file_name_original");
        String file_name = request.getParameter("file_name");
        String refference = request.getParameter("no_refference");
        String status = request.getParameter("status");
        String description = request.getParameter("description");
        String source = request.getParameter("source");
        
        String date_from = request.getParameter("date_from");
        String date_end = request.getParameter("date_end");
        
        if (date_from == null) {
//            date_from = now();
        } 
        
        if (date_end != null) {
//            date_end = now();
        } 

        
        String find = request.getParameter("find");
        String quickSearch = request.getParameter("quicksearch");

        int notifVer = 0;
        int notifAuth = 0;


        int pageNumber = (start / length) + 1; // (20 / 10) + 1 = 3
        int offset = (pageNumber - 1) * length; // (3 - 1) * 10 = 20

//        HttpSession session = request.getSession();

        PrintWriter out = response.getWriter();
        DBconnection dbConn = new DBconnection();
        DBUserData dbo = new DBUserData(dbConn.getConnection());
        DBWorkflowLogs DBWFLogs = new DBWorkflowLogs(dbConn.getConnection());
        HttpSession httpSession = request.getSession();
//        String forward = CONTROLLERHEADERS;
        

        String channel = "";
        try {
            channel = (String) httpSession.getAttribute("channel");
            if (channel != null && !channel.equalsIgnoreCase("")) {
                notifVer = dbo.getNotificationVer(channel);
                notifAuth = dbo.getNotificationAuth(channel);
            } else {
                notifVer = dbo.getNotifVerAll();
                notifAuth = dbo.getNotifAuthAll();
            }
            httpSession.setAttribute("notifVer", notifVer);
            httpSession.setAttribute("notifAuth", notifAuth);
            
            DBHeader dbHeader = new DBHeader(dbConn.getConnection());
            int totalRecords = 0;
            List<DataWorkflowLogs> datas = new ArrayList<>();

            datas = DBWFLogs.getResultDataWorkflow(httpSession, start, length, dataWFLogs, quickSearch, sort, date_from, date_end, refference);
            totalRecords = DBWFLogs.getCountResultDataWorkflow(httpSession, start, length, dataWFLogs, quickSearch, sort, date_from, date_end, refference);
            System.out.println("Total Data:"+ String.valueOf(totalRecords));

            JSONArray dataArray = new JSONArray();
            for (DataWorkflowLogs h : datas) {
                JSONObject obj = new JSONObject();
                obj.put("date_time", h.getDate_time());
                obj.put("component_name", h.getComponent_name());
                obj.put("message_type", h.getMessage_type());
                obj.put("file_name_original", h.getFile_name_original());
                obj.put("file_name", h.getFile_name());
                obj.put("refference", h.getRefference());
                obj.put("status", h.getStatus());
                obj.put("description", h.getDescription());
                obj.put("source", h.getSource());
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
            log.error("Error WorkflowLogsList Servlet"+e.getMessage());
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
//        RequestDispatcher dispatcher = request.getRequestDispatcher("workflow_logs.jsp?find=yes");
//        dispatcher.forward(request, response);
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST not allowed");

    }
    
    
}
