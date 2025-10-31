/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBExcluteDuplicate;
import com.vensys.appcm.dbase.DBHeader;
import com.vensys.appcm.dbase.DBUserData;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
import com.vensys.appcm.model.DataExcluteDuplicate;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.myutils.HistoryPaging;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author HP PROBOOK 430 G8
 */
public class SCExcluteDuplicate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    Logger log = LogManager.getLogger(getClass().getName());
    private static String EXCLUTEDUPLICATE = "ExcluteDuplicate.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String forward = "";
        HttpSession httpSession = request.getSession();
        
        getNotifAuthVer(httpSession);
        
        String typeAction = request.getParameter("typAction");
        String id = (request.getParameter("id") == null) ? "" : request.getParameter("id");
        
//        System.out.println("idnya============"+id);
        
        DBconnection dbConn = new DBconnection();
        DBconnection2 dbConn2 = new DBconnection2();
        List<DataExcluteDuplicate> dataExcDuplicate = new ArrayList<DataExcluteDuplicate>();
        
        
        DBExcluteDuplicate dBExcDuplicate = new DBExcluteDuplicate(dbConn.getConnection());
        try {
           
            dataExcDuplicate = dBExcDuplicate.getAllDataExcDupl();
            httpSession.setAttribute("dataExcDupplicate", dataExcDuplicate);

        } catch (Exception e){
            log.error(e.getMessage());
            e.printStackTrace();
        } finally {
            dbConn.closeConnection();
            dbConn2.closeConnection2();
        }
        
        forward = EXCLUTEDUPLICATE;
                
        HistoryPaging.getAndSaveAllParameterOnSession(request, response);
        RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
        dispatcher.forward(request, response);
        

    }
    
    private void getNotifAuthVer(HttpSession httpSession) {
        DBconnection dbConn = new DBconnection();
        DBUserData dbo = new DBUserData(dbConn.getConnection());
        int notifVer = 0;
        int notifAuth = 0;
        String channel = "";
        
         try {
            channel = (String) httpSession.getAttribute("channel");
            if (!"".equalsIgnoreCase(channel) && channel != null) {
                notifVer = dbo.getNotificationVer(channel);
                notifAuth = dbo.getNotificationAuth(channel);
            } else {
                notifVer = dbo.getNotifVerAll();
                notifAuth = dbo.getNotifAuthAll();
            }
            httpSession.setAttribute("notifVer", notifVer);
            httpSession.setAttribute("notifAuth", notifAuth);
           
        } catch (Exception e){
            log.error(e.getMessage());
            e.printStackTrace();
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
