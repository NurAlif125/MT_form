package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataUser;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.DataUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SCPrintUser extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(SCPrintUser.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = request.getParameter("status");
        HttpSession session = request.getSession();
        DBconnection dbConn = new DBconnection();
        ArrayList<DataUser> dataUser = new ArrayList<>();
        DBDataUser dbUser = new DBDataUser(dbConn.getConnection());

        ServletOutputStream servletOutputStream = response.getOutputStream();
        String reportPath = getServletConfig().getServletContext().getRealPath("/WEB-INF/reports/reportListUser.jasper");
        File reportFile = new File(reportPath);

        if (!reportFile.exists()) {
            LOGGER.log(Level.SEVERE, "Report file not found at {0}", reportPath);
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Report file not found");
            return;
        }

        try {
            dataUser = dbUser.getAllDataUserReport(status);
            Map<String, Object> model = new HashMap<>();
            model.put("username", session.getAttribute("user_id"));
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), model, new JRBeanCollectionDataSource(dataUser));

            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);

            servletOutputStream.write(bytes, 0, bytes.length);
            servletOutputStream.flush();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Exception occurred while generating report", e);

            StringWriter stringWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(stringWriter);
            e.printStackTrace(printWriter);

            response.setContentType("text/plain");
            response.getOutputStream().print(stringWriter.toString());
        } finally {
            servletOutputStream.close();
            dbConn.closeConnection();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
