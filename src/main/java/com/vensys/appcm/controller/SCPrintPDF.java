/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBHeader;
import com.vensys.appcm.dbase.DBconnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.Header;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
/**
 *
 * @author hadi
 */
public class SCPrintPDF extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String io_type = request.getParameter("io_type");
        String mt_type = request.getParameter("mt_type");
        String date_from = request.getParameter("date_from");
        String date_end = request.getParameter("date_end");
        String flag = request.getParameter("flag");
        String status = request.getParameter("status");
        if(status == null){
            status = "";
        }
        String value_date = request.getParameter("value_date").substring(2).replace("-", ""); //20190926
        String value_date_end = request.getParameter("value_date_end").substring(2).replace("-", "");
        String filter = request.getParameter("filter_msg");
        String cust_curr = request.getParameter("cust_curr");

        HttpSession session = request.getSession();
        DBconnection dbConn = new DBconnection();
        ArrayList<Header> headers = new ArrayList<Header>();
        DBHeader bBHeaders = new DBHeader(dbConn.getConnection());

        ServletOutputStream servletOutputStream = response.getOutputStream();
//        File reportFile = new File(getServletConfig().getServletContext().getRealPath("/WEB-INF/reports/reportListMT.jasper"));
        File reportFile = new File(getServletConfig().getServletContext().getRealPath("/WEB-INF/reports/reportListMTNoTotal.jasper"));
        File reportFileInc = new File(getServletConfig().getServletContext().getRealPath("/WEB-INF/reports/reportListMTInc.jasper"));
        File reportFileOut = new File(getServletConfig().getServletContext().getRealPath("/WEB-INF/reports/reportListMTOut.jasper"));
        byte[] bytes = null;

        try {
            // status dihapus
//            headers = bBHeaders.getAllHeaderReport(status, io_type, mt_type, date_from, date_end, flag);
            Map model = new HashMap();
            model.put("username", (String) session.getAttribute("user_id"));
            model.put("status", status);
            if ((flag.equalsIgnoreCase("INC-STL") && io_type.equalsIgnoreCase("O")) || (flag.equalsIgnoreCase("INC-RSTL") && io_type.equalsIgnoreCase("O")) || (flag.equalsIgnoreCase("INC-CNF") && io_type.equalsIgnoreCase("O"))){
                headers = bBHeaders.getAllHeaderReportIncoming(status, io_type, mt_type, value_date, date_from, date_end, flag, value_date_end);
//                headers = bBHeaders.getAllHeaderReport(status, io_type, mt_type, date_from, date_end, flag);
                bytes = JasperRunManager.runReportToPdf(reportFileInc.getPath(), model, new JRBeanCollectionDataSource(headers));
            } else if ((flag.equalsIgnoreCase("AUTH") && io_type.equalsIgnoreCase("I")) || (flag.equalsIgnoreCase("TEXT") && io_type.equalsIgnoreCase("I")) || (flag.equalsIgnoreCase("ACK") && io_type.equalsIgnoreCase("I"))){
                headers = bBHeaders.getAllHeaderReportOutgoing(status, io_type, mt_type, value_date, date_from, date_end, flag, value_date_end, filter);
//                headers = bBHeaders.getAllHeaderReport(status, io_type, mt_type, date_from, date_end, flag);
                bytes = JasperRunManager.runReportToPdf(reportFileOut.getPath(), model, new JRBeanCollectionDataSource(headers));
                System.out.println("filter_msg adalah : " + filter);
            } else {
                System.out.println("flag: "+flag);
//                headers = bBHeaders.getAllHeaderReport(status, io_type, mt_type, value_date, flag);//20190926
                headers = bBHeaders.getAllHeaderReport(status, io_type, mt_type, value_date, date_from, date_end, flag, filter, cust_curr, value_date_end); //20200213
                bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), model, new JRBeanCollectionDataSource(headers));
            }
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);

            servletOutputStream.write(bytes, 0, bytes.length);
            servletOutputStream.flush();
            servletOutputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
            StringWriter stringWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(stringWriter);
            e.printStackTrace(printWriter);
            response.setContentType("text/plain");
            response.getOutputStream().print(stringWriter.toString());
        } finally {
            dbConn.closeConnection();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
