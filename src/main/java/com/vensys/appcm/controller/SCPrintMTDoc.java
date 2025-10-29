/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBBIC;
import com.vensys.appcm.dbase.DBHeader;
import com.vensys.appcm.dbase.DBconnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataBIC;
import com.vensys.appcm.model.Header;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

/**
 *
 * @author hadi
 */
public class SCPrintMTDoc extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBconnection dbConn = new DBconnection();
        DBHeader bBHeaders = new DBHeader(dbConn.getConnection());
        DBBIC bBIC = new DBBIC(dbConn.getConnection());
        Collection<Header> headers = new ArrayList<Header>();
        Header header = new Header();
        DataBIC bicSender = new DataBIC();
        DataBIC bicReceiver = new DataBIC();
        ServletOutputStream servletOutputStream = response.getOutputStream();
        File reportFile = new File(getServletConfig().getServletContext().getRealPath("/WEB-INF/reports/reportMTDoc.jasper"));
//        File reportFile = new File(getServletConfig().getServletContext().getRealPath("/WEB-INF/reports/reportMTDoc2.jasper"));
        byte[] bytes = null;
        try {
            headers = bBHeaders.printMTDoc(request.getParameter("id"));
            header = bBHeaders.getHeaderById2(request.getParameter("id"));
            if (header.getIo_type().equalsIgnoreCase("O")){ //20200109
                bicSender = bBIC.getBicByCode(header.getReceiverAddress());
                bicReceiver = bBIC.getBicByCode(header.getLogicalTerminal());
            } else {
                bicSender = bBIC.getBicByCode(header.getLogicalTerminal());
                bicReceiver = bBIC.getBicByCode(header.getReceiverAddress());
            }
            Map model = new HashMap();
            model.put("username", (String) session.getAttribute("user_id"));
            bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), model, new JRBeanCollectionDataSource(headers));
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
