/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBAuditTrail;
import com.vensys.appcm.dbase.DBLoginHistory;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.DataAuditTrail;
import com.vensys.appcm.model.DataLoginHistory;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

/**
 *
 * @author HP PROBOOK 430 G8
 */
public class SCPrintAuditTrail extends HttpServlet {

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
        String date_from = request.getParameter("date_from");
        String date_end = request.getParameter("date_end");
        String user_idlog = request.getParameter("user_id");
        HttpSession session = request.getSession();
        DBconnection dbConn = new DBconnection();
        ArrayList<DataAuditTrail> dataAuditTrail = new ArrayList<DataAuditTrail>();
        DBAuditTrail dbAudit = new DBAuditTrail(dbConn.getConnection());
        ServletOutputStream servletOutputStream = response.getOutputStream();
        File reportFile = new File(getServletConfig().getServletContext().getRealPath("/WEB-INF/reports/reportAuditTrailTransaction.jasper"));
        byte[] bytes = null;
        
//        System.out.println("Jumlah data: " + dataAuditTrail.size());

        
        try {
            if (user_idlog == "null" || user_idlog.equals("") || user_idlog.isEmpty()) {
                dataAuditTrail = dbAudit.getAllDataAuditTrail(date_from, date_end);
            } else {
                dataAuditTrail = dbAudit.getAllDataAuditTrailByUser(date_from, date_end, user_idlog);
            }
            
            Map model = new HashMap();
            model.put("username", (String) session.getAttribute("user_id"));
            bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), model, new JRBeanCollectionDataSource(dataAuditTrail));
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
            // System.out.println("Report Audit Trail Report: "+e.getMessage());
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
