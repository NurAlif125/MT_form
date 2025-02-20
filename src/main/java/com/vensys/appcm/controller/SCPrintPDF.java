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
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 *
 * @author hadi
 */
public class SCPrintPDF extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final ExecutorService executorService = Executors.newFixedThreadPool(5); // Background thread pool

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, String> requestData = new HashMap<>();
        requestData.put("io_type", request.getParameter("io_type"));
        requestData.put("mt_type", request.getParameter("mt_type"));
        requestData.put("date_from", request.getParameter("date_from"));
        requestData.put("date_end", request.getParameter("date_end"));
        requestData.put("flag", request.getParameter("flag"));
        requestData.put("status", request.getParameter("status") == null ? "" : request.getParameter("status"));
        requestData.put("value_date", request.getParameter("value_date").substring(2).replace("-", ""));
        requestData.put("value_date_end", request.getParameter("value_date_end").substring(2).replace("-", ""));
        requestData.put("filter_msg", request.getParameter("filter_msg"));
        requestData.put("cust_curr", request.getParameter("cust_curr"));

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");

        String pdfDirectoryPath = System.getProperty("user.home") + File.separator + "Downloads" + File.separator + "ReportCM";
        Files.createDirectories(Paths.get(pdfDirectoryPath));
        String pdfFileName = "report_" + userId + ".pdf";
        String pdfFilePath = pdfDirectoryPath + File.separator + pdfFileName;
        String ServerName = request.getServerName();
        int ServerPort = request.getServerPort();

        executorService.execute(() -> {
            generateAndSavePdf(requestData, userId, pdfFilePath, ServerName, ServerPort);
        });

        String downloadUrl = "http://" + ServerName + ":" + ServerPort + request.getContextPath() + "/download?file=" + pdfFileName;

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String jsonResponse = "{"
                + "\"status\": \"Processing\","
                + "\"message\": \"Your PDF is being generated.\","
                + "\"download_url\": \"" + downloadUrl + "\""
                + "}";

        response.getWriter().write(jsonResponse);
    }

    private void generateAndSavePdf(Map<String, String> requestData, String userId, String pdfFilePath, String ServerName, int ServerPort) {
        DBconnection dbConn = new DBconnection();
        ArrayList<Header> headers = new ArrayList<>();
        DBHeader bBHeaders = new DBHeader(dbConn.getConnection());

        byte[] bytes = null;

        try {

            Path pdfDir = Paths.get(System.getProperty("user.home"), "Downloads", "ReportCM");
            Files.createDirectories(pdfDir);

            File reportFile = new File(getServletConfig().getServletContext().getRealPath("/WEB-INF/reports/reportListMTNoTotal.jasper"));
            File reportFileInc = new File(getServletConfig().getServletContext().getRealPath("/WEB-INF/reports/reportListMTInc.jasper"));
            File reportFileOut = new File(getServletConfig().getServletContext().getRealPath("/WEB-INF/reports/reportListMTOut.jasper"));

            Map<String, Object> model = new HashMap<>();
            model.put("username", userId);
            model.put("status", requestData.get("status"));

            if ((requestData.get("flag").equalsIgnoreCase("INC-STL") && requestData.get("io_type").equalsIgnoreCase("O"))
                    || (requestData.get("flag").equalsIgnoreCase("INC-RSTL") && requestData.get("io_type").equalsIgnoreCase("O"))
                    || (requestData.get("flag").equalsIgnoreCase("INC-CNF") && requestData.get("io_type").equalsIgnoreCase("O"))) {

                headers = bBHeaders.getAllHeaderReportIncoming(requestData.get("status"), requestData.get("io_type"),
                        requestData.get("mt_type"), requestData.get("value_date"), requestData.get("date_from"),
                        requestData.get("date_end"), requestData.get("flag"), requestData.get("value_date_end"));
                bytes = JasperRunManager.runReportToPdf(reportFileInc.getPath(), model, new JRBeanCollectionDataSource(headers));

            } else if ((requestData.get("flag").equalsIgnoreCase("AUTH") && requestData.get("io_type").equalsIgnoreCase("I"))
                    || (requestData.get("flag").equalsIgnoreCase("TEXT") && requestData.get("io_type").equalsIgnoreCase("I"))
                    || (requestData.get("flag").equalsIgnoreCase("ACK") && requestData.get("io_type").equalsIgnoreCase("I"))) {

                headers = bBHeaders.getAllHeaderReportOutgoing(requestData.get("status"), requestData.get("io_type"),
                        requestData.get("mt_type"), requestData.get("value_date"), requestData.get("date_from"),
                        requestData.get("date_end"), requestData.get("flag"), requestData.get("value_date_end"), requestData.get("filter_msg"));
                bytes = JasperRunManager.runReportToPdf(reportFileOut.getPath(), model, new JRBeanCollectionDataSource(headers));

            } else {
                headers = bBHeaders.getAllHeaderReport(requestData.get("status"), requestData.get("io_type"), requestData.get("mt_type"),
                        requestData.get("value_date"), requestData.get("date_from"), requestData.get("date_end"),
                        requestData.get("flag"), requestData.get("filter_msg"), requestData.get("cust_curr"), requestData.get("value_date_end"));
                bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), model, new JRBeanCollectionDataSource(headers));
            }

            FileOutputStream fos = new FileOutputStream(pdfFilePath);
            fos.write(bytes);
            fos.close();

            String pdfFileName = new File(pdfFilePath).getName();
            String downloadUrl = "http://" + ServerName + ":" + ServerPort + getServletContext().getContextPath() + "/download?file=" + pdfFileName;

            System.out.println("PDF generated successfully: " + pdfFilePath);
            System.out.println("Download URL: " + downloadUrl);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
    }

    @Override
    public void destroy() {
        executorService.shutdown(); // Shut down executor when servlet is destroyed
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
