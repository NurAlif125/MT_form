/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBUserData;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataUser;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author hadi
 */
public class SCChangeUserData extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Logger log = LogManager.getLogger(getClass().getName());

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = null;

        DBconnection dbConn = new DBconnection();
        DataUser data = new DataUser();
        DBUserData dbo = new DBUserData(dbConn.getConnection());
        String strErrMsg = null;
        HttpSession session = request.getSession();

        String user_id = (String) session.getAttribute("user_id");
        String password = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String retypePassword = request.getParameter("retypePassword");

        try {
            data = dbo.getUserDataById(user_id);
        } catch (Exception ex) {
            log.error(ex.getMessage());
            ex.printStackTrace();
        }

        boolean isValidLogon = false;
        try {
            data.setStatus_new(0);
            isValidLogon = dbo.authenticateLogin(user_id, password);
            if (isValidLogon && (data.getStatus_new() == 0)) {
//                isValidLogon = dbo.cekHistoryPass(user_id, newPassword);
//                if (isValidLogon) {
                    if (newPassword.equals(retypePassword)) {
                        dbo.updateUserDataPasswordById(user_id, newPassword);
//                        dbo.modifyPassInfo(user_id, newPassword);
                        dispatcher = request.getRequestDispatcher("login.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        strErrMsg = "New Password is not equal with Re-Type Password..";
                        session.setAttribute("errorMsglogin", strErrMsg);
                        dispatcher = request.getRequestDispatcher("changePassword.jsp");
                        dispatcher.forward(request, response);
                    }
//                } else {
//                    strErrMsg = "Password has been used";
//                    session.setAttribute("errorMsglogin", strErrMsg);
//                    dispatcher = request.getRequestDispatcher("changePassword.jsp");
//                    dispatcher.forward(request, response);
//                }
            } else {
                strErrMsg = "Password is invalid. Please try again.";
                session.setAttribute("errorMsglogin", strErrMsg);
                dispatcher = request.getRequestDispatcher("changePassword.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            log.error(e.getMessage());
            strErrMsg = "Unable to connect to database";
            session.setAttribute("errorMsglogin", strErrMsg);
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }

//        if (isValidLogon && (data.getStatus_new() == 1)) {
//            dispatcher = request.getRequestDispatcher("controllerHeaders");
//            dispatcher.forward(request, response);
//        } else if (isValidLogon && (data.getStatus_new() == 0)) {
//            dispatcher = request.getRequestDispatcher("changePassword.jsp");
//            dispatcher.forward(request, response);
//        } else {
//            session.setAttribute("errorMsglogin", strErrMsg);
//            dispatcher = request.getRequestDispatcher("login.jsp");
//            dispatcher.forward(request, response);
//        }

        try {
        } catch (Exception ex) {
            log.error(ex.getMessage());
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
