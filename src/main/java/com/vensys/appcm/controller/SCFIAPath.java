/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBFIA;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
import com.vensys.appcm.model.DataFIA;
import com.vensys.appcm.model.DataFIAPath;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class SCFIAPath extends HttpServlet {

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
            DBconnection2 dbConn = new DBconnection2();
            DataFIAPath data = new DataFIAPath();
            DBFIA dbData = new DBFIA(dbConn.getConnection2());
            HttpSession session = request.getSession();

            String id = request.getParameter("id");
//            data.setId(Integer.parseInt(id));
            
            // Jika protokolnya MFT maka nilainya kosong (Kata Rahmat)
            String configName = request.getParameter("configName");
            String protocol = request.getParameter("protocol").equalsIgnoreCase("") ? "" : request.getParameter("protocol");
            String host = request.getParameter("host") == null ? "" : request.getParameter("host");
            String port = request.getParameter("port") == null ? "" : request.getParameter("port");
            String userName = request.getParameter("userName") == null ? "" : request.getParameter("userName");
            String password = request.getParameter("password") == null ? "" : request.getParameter("password");
            data.setConfigName(configName);
            data.setProtocol(protocol);
            data.setHost(host);
            data.setPort(port);
            data.setUserName(userName);
            data.setPassword(password);
            
            // SFTP Value
            // clientAuthenticationTypeSFTP
            // privateKeyType
            // privateKeyPath
            // keyFilePassword
            String clientAuthenticationTypeSFTP = request.getParameter("clientAuthenticationTypeSFTP") == null ? "" : request.getParameter("clientAuthenticationTypeSFTP");
            String privateKeyType = request.getParameter("privateKeyType") == null ? "" : request.getParameter("privateKeyType");
            String privateKeyPath = request.getParameter("privateKeyPath") == null ? "" : request.getParameter("privateKeyPath");
            String keyFilePassword = request.getParameter("keyFilePassword") == null ? "" : request.getParameter("keyFilePassword");
            
            if (!clientAuthenticationTypeSFTP.isEmpty()) {                
                data.setClientAuthenticationType(clientAuthenticationTypeSFTP);
                data.setPrivateKeyType(privateKeyType);
                data.setPrivateKeyPath(privateKeyPath);
                data.setKeyFilePassword(keyFilePassword);
            }
            
            // FTPS Values
//            clientAuthenticationTypeFTPS
//            privateKeyPassword
//            keyStoreFile
//            keyStorePassword
//            keyStoreAlias
            String clientAuthenticationTypeFTPS = request.getParameter("clientAuthenticationTypeFTPS") == null ? "" : request.getParameter("clientAuthenticationTypeFTPS");
            String privateKeyPassword = request.getParameter("privateKeyPassword") == null ? "" : request.getParameter("privateKeyPassword");
            String keyStoreFile = request.getParameter("keyStoreFile") == null ? "" : request.getParameter("keyStoreFile");
            String keyStorePassword = request.getParameter("keyStorePassword") == null ? "" : request.getParameter("keyStorePassword");
            String keyStoreAlias = request.getParameter("keyStoreAlias") == null ? "" : request.getParameter("keyStoreAlias");
            
            if (!clientAuthenticationTypeFTPS.isEmpty()) {                
                data.setClientAuthenticationType(clientAuthenticationTypeFTPS);
                data.setPrivateKeyPassword(privateKeyPassword);
                data.setKeyStoreFile(keyStoreFile);
                data.setKeyStorePassword(keyStorePassword);
                data.setKeyStoreAlias(keyStoreAlias);
            }    
            
            // Global
            // path
            // transferPath
            // localPath
            // source
            // isenable
            data.setPath(request.getParameter("path") == null ? "" : request.getParameter("path"));
            data.setTransferPath(request.getParameter("transferPath") == null ? "" : request.getParameter("transferPath"));
            data.setLocalPath(request.getParameter("localPath") == null ? "" : request.getParameter("localPath"));
            data.setSource(request.getParameter("source") == null ? "" : request.getParameter("source"));
            data.setIsEnable(parseIntSafe(request.getParameter("isenable"),0));
            

            if (id == null ? "null" == null : id.equals("null") || id.isEmpty()) {
                dbData.addFIAPath(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            } else {
                dbData.updateFIAPath(data, id, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            }
            try {
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                dbConn.closeConnection2();
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("SCFIAPathList");
            dispatcher.forward(request, response);
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

    private int parseIntSafe(String value, int defaultValue) {
        if (value == null || value.trim().isEmpty()) {
            return defaultValue;
        }
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }
}
