/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBExcluteDuplicate;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
import com.vensys.appcm.myutils.HistoryPaging;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author HP PROBOOK 430 G8
 */
public class VExcluteDuplicate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     
     private static String EXCLUTEDUPLICATE = "VExcluteDuplicate.jsp";
     Logger log = LogManager.getLogger(getClass().getName());
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String forward = "";
        DBconnection dbConn = new DBconnection();
        DBconnection2 dbConn2 = new DBconnection2();
        HttpSession session = request.getSession();
        
        String userId = session.getAttribute("user_id") != null ? session.getAttribute("user_id").toString() : null;
        String ipAccess = session.getAttribute("ip_access") != null ? session.getAttribute("ip_access").toString() : null;
        String compName = session.getAttribute("comp_name") != null ? session.getAttribute("comp_name").toString() : null;
        
        String id = (request.getParameter("id") == null) ? "" : request.getParameter("id");
        String action = (request.getParameter("action") == null) ? "" : request.getParameter("action");
        
        if(id.equalsIgnoreCase("") || action.equals("edit")) { //add
            if (action.equals("edit")) { //edit
                String id_data = (request.getParameter("id_data") == null) ? "" : request.getParameter("id_data");
                String ioType = (request.getParameter("inp_io_type") == null) ? "" : request.getParameter("inp_io_type");
                String msgType = (request.getParameter("inp_msg_type") == null) ? "" : request.getParameter("inp_msg_type");
                String isEnable = (request.getParameter("inp_isenable") == null) ? "" : request.getParameter("inp_isenable");
                DBExcluteDuplicate dBExcDuplicateUpdate = new DBExcluteDuplicate(dbConn2.getConnection2());

                try {
                    dBExcDuplicateUpdate.updateDataExcDupl(id_data, ioType, msgType, isEnable, compName, ipAccess, userId);
                } catch(Exception e) {
                    e.printStackTrace();
                    log.error(e.getMessage());
                } finally {
                    dbConn2.closeConnection2();
                }
                session.setAttribute("message", "Succes Update Data Exclude Duplicate");
                response.sendRedirect("SCExcluteDuplicate");
                return;
            } else {
                String ioType = (request.getParameter("inp_io_type") == null) ? "" : request.getParameter("inp_io_type");
                String msgType = (request.getParameter("inp_msg_type") == null) ? "" : request.getParameter("inp_msg_type");
                String isEnable = (request.getParameter("inp_isenable") == null) ? "" : request.getParameter("inp_isenable");
                DBExcluteDuplicate dBExcDuplicatePost = new DBExcluteDuplicate(dbConn2.getConnection2());

                try {
                    dBExcDuplicatePost.addDataExcDupl(ioType, msgType, isEnable, compName, ipAccess, userId);
                } catch(Exception e) {
                    e.printStackTrace();
                    log.error(e.getMessage());
                } finally {
                    dbConn2.closeConnection2();
                }
                session.setAttribute("message", "Succes Create Data Exclude Duplicate");
                response.sendRedirect("SCExcluteDuplicate");
                return;
            }
        }
        
        
            
        if ( !id.equals("")) { // view
            DBExcluteDuplicate dBExcDuplicate = new DBExcluteDuplicate(dbConn.getConnection());

            try {
                Map<String, Object> selectedData = dBExcDuplicate.getDataById(id);

                forward = "VExcluteDuplicate.jsp";

                if (selectedData != null) {
                    request.setAttribute("vdata", selectedData);
                    RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
                    dispatcher.forward(request, response);

                } else {
                    request.setAttribute("vdata", null);
                }
            } catch(Exception e) {
                e.printStackTrace();
                log.error(e.getMessage());
            } finally {
                dbConn.closeConnection();
            }
            return;
        }
        
       
//        forward = EXCLUTEDUPLICATE;
//        RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
//        dispatcher.forward(request, response);
//            RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
//            dispatcher.forward(request, response);
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
