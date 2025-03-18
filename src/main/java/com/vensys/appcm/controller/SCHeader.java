/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBHeader;
import com.vensys.appcm.dbase.DBUserData;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.ResultHeader;
import java.io.Serializable;

/**
 *
 * @author Muhammad Abdul Hadi
 */
public class SCHeader extends HttpServlet implements Serializable {

    private static final long serialVersionUID = 1L;
    private static String CONTROLLERHEADERS = "controllerHeaders.jsp";
    private static String RESULTHEADERS = "resultHeaders.jsp";

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
        response.setContentType("text/html;charset=UTF-8");
        String io_type = request.getParameter("io_type");

        String sender_logical_terminal = request.getParameter("sender_logical_terminal");
        String receiver_institution = request.getParameter("receiver_institution");
        String mt_type = request.getParameter("mt_type");
        String date_from = request.getParameter("date_from");
        String date_end = request.getParameter("date_end");
        String sender_reference = request.getParameter("sender_reference");
        String rel_reference = request.getParameter("rel_reference"); // ditambahkan pada 20151001 by Azan
//        String sender_bank = request.getParameter("sender_bank");// ditambahkan pada 20151102 by Azan
//        String receiver_bank = request.getParameter("receiver_bank");// ditambahkan pada 20151102 by Azan
        String currency_code = request.getParameter("currency_code");
        String amount = request.getParameter("amount");
        String find = request.getParameter("find");
        String flag = request.getParameter("flag");
        System.out.println("flag: " + flag);
        String status = request.getParameter("status");
        System.out.println("status: " + status);
        String menu = request.getParameter("menu");
        System.out.println("menu: " + menu);
        String forward = "";
        int notifVer = 0;
        int notifAuth = 0;
        HttpSession httpSession = request.getSession();
//        httpSession.removeAttribute("flagStatus");
        DBconnection dbConn = new DBconnection();
        DBUserData dbo = new DBUserData(dbConn.getConnection());
        List<Header> headers = new ArrayList<Header>();
        List<Header> headersPajak = new ArrayList<Header>();
        DBHeader bBHeaders = new DBHeader(dbConn.getConnection());
        List<ResultHeader> resultHeader = new ArrayList<ResultHeader>();
        String flagStatus = (String) httpSession.getAttribute("flagStatus");
        System.out.println("flagStatus: " + flagStatus);
        try {
            notifVer = dbo.getNotificationVer();
            System.out.println("notifVer: " + notifVer);
            notifAuth = dbo.getNotificationAuth();
            System.out.println("notifAuth: " + notifAuth);
            httpSession.setAttribute("notifVer", notifVer);
            httpSession.setAttribute("notifAuth", notifAuth);
            if ((find == null || find.isEmpty()) && (flag == null || flag.isEmpty())) {
                System.out.println("masuk sini");
                headers = bBHeaders.getAllHeader(httpSession, io_type, flag);// 2025-01-07
//                headersPajak = bBHeaders.getAllHeaderPajak(httpSession, io_type, flag);
                forward = CONTROLLERHEADERS + "?menu=" + menu;
                httpSession.setAttribute("headers", headers);
                httpSession.removeAttribute("flagFilter");
//                httpSession.setAttribute("headersPajak", headersPajak);
            } else if (flag != null && !flag.isEmpty()) {
                if (menu == null) {
                    System.out.println("flag if : " + flag);
                    System.out.println("flag statusnya adalah :" + flagStatus);
//                httpSession.removeAttribute("flagFilter");
                    if (flag.equalsIgnoreCase("VER")) {
                        flag = "MOD";
                        menu = "1";
                    } else if (flag.equalsIgnoreCase("AUTH")) {
                        flag = "VER";
                        menu = "2";
                    } else if (flag.equalsIgnoreCase("MOD") && (flagStatus.equalsIgnoreCase("NACK"))) {
                        flag = "NACK";
                        menu = "5";
                    } else if ((flag.equalsIgnoreCase("VERACC")) && (flagStatus.equalsIgnoreCase("INC-INV"))) {
                        flag = "INC-INV";
                        menu = "8";
                    } else if (flag.equalsIgnoreCase("VERACC")) {
                        flag = "INC-WAIT";
                        menu = "6";
                    } else if ((flag.equalsIgnoreCase("SETTLE")) && (flagStatus.equalsIgnoreCase("INC-OK"))) {
                        flag = "INC-OK";
                        menu = "9";
                    } else if ((flag.equalsIgnoreCase("SETTLE")) && (flagStatus.equalsIgnoreCase("INC-NOK"))) {
                        flag = "INC-NOK";
                        menu = "10";
                    } else if (flag.equalsIgnoreCase("INC-STL")) {
                        flag = "";
                        menu = "";
                    } else if (flag.equalsIgnoreCase("MOD")) {
                        flag = "VER";
                        menu = "2";
                    } else if ((flag.equalsIgnoreCase("SENDTEXT")) && (flagStatus.equalsIgnoreCase("INC-INV"))) {
                        flag = "INC-INV";
                        menu = "8";
                    } else if (flag.equalsIgnoreCase("SENDTEXT")) {
                        flag = "INC-WAIT";
                        menu = "6";
                    } else if (flag.equalsIgnoreCase("RESENDTEXT")) {
                        flag = "INC-STL";
                        menu = "7";
                    } else if (flag.equalsIgnoreCase("INC-WAIT") && (flagStatus.equalsIgnoreCase("INC-HOLD"))) {
                        flag = "INC-HOLD";
                        menu = "11";
                    } else if (flag.equalsIgnoreCase("INC-WAIT")) {
                        flag = "INC-WAIT";
                        menu = "6";
                    } else if (flag.equalsIgnoreCase("INC-INV")) {
                        flag = "INC-WAIT";
                        menu = "6";
                    } else if (flag.equalsIgnoreCase("INC-RTR")) {
                        flag = "INC-INV";
                        menu = "8";
                    } else if (flag.equalsIgnoreCase("ERR")) {
                        flag = "ERR";
                        menu = "16";
                    } else if (flag.equalsIgnoreCase("INC-SPRT")) {
                        flag = "INC-NSTP";
                        menu = "17";
                    } else if (flag.equalsIgnoreCase("INC-SPOK")) {
                        flag = "INC-SPRT";
                        menu = "18";
                    } else if (flag.equalsIgnoreCase("APPROVEADJ") || flag.equalsIgnoreCase("REJECTADJ")) {
                        flag = "INC-ADJ";
                        menu = "19";
                    } else if (flag.equalsIgnoreCase("INC-ADJ") && flagStatus.equalsIgnoreCase("INC-WAIT")) {
                        flag = "INC-WAIT";
                        menu = "6";
                    } else if (flag.equalsIgnoreCase("CVT-MOD")) {
                        flag = "CVT-MOD";
                        menu = "20";
                    } else if (flag.equalsIgnoreCase("CVT-VER")) {
                        flag = "CVT-VER";
                        menu = "21";
                    } else if (flag.equalsIgnoreCase("WAITING-AML")) {
                        flag = "WAITING-AML";
                        menu = "22";
                    } else if (flag.equalsIgnoreCase("CVT-INC")) {
                        flag = "CVT-INC";
                        menu = "23";
                    } else {
                        flag = "AUTH";
                        menu = "3";
                    }

//                headers = bBHeaders.getAllHeader(httpSession, io_type, flag);
                    headers = bBHeaders.getAllHeader(httpSession, io_type, flag);
//                headersPajak = bBHeaders.getAllHeaderPajak(httpSession, io_type, flag);
                    forward = CONTROLLERHEADERS + "?menu=" + menu;
                    httpSession.setAttribute("headers", headers);
                    httpSession.setAttribute("flag", flag);
//                    if (flag.equalsIgnoreCase("VER")) {
//                        httpSession.setAttribute("flagFilter", "MOD");
//                    } else if (flag.equalsIgnoreCase("AUTH")) {
//                        httpSession.setAttribute("flagFilter", "VER");
//                    } else if (flag.equalsIgnoreCase("MOD")) {
                    httpSession.setAttribute("flagFilter", flag);
//                    }
                } else {
                    System.out.println("flag else : " + flag);
//                httpSession.removeAttribute("flagFilter");
                    headers = bBHeaders.getAllHeader(httpSession, io_type, flag);
//                    headers = bBHeaders.getAllHeader(httpSession, io_type, httpSession.getAttribute("flagFilter").toString());
//                headersPajak = bBHeaders.getAllHeaderPajak(httpSession, io_type, flag);
                    forward = CONTROLLERHEADERS + "?menu=" + menu;
                    httpSession.setAttribute("headers", headers);
                    httpSession.setAttribute("flag", flag);
                    httpSession.setAttribute("flagFilter", flag);
                }

//                httpSession.setAttribute("headersPajak", headersPajak);
            } else {
                System.out.println("masuk sini else");
                // ditambahkan rel_reference pada 20151001 by Azan
                // sender_logical_terminal => sender_bank dan receiver_institution => receiver_bank
                String db_type = request.getParameter("db_type");
//                resultHeader = bBHeaders.getResultHeader(httpSession, io_type, sender_logical_terminal, receiver_institution, mt_type, date_from, date_end, sender_reference, rel_reference, currency_code, amount, status, db_type);
                headers = bBHeaders.getResultHeader(httpSession, io_type, sender_logical_terminal, receiver_institution, mt_type, date_from, date_end, sender_reference, rel_reference, currency_code, amount, status, db_type);
//                forward = RESULTHEADERS + "?menu="+menu;
                forward = CONTROLLERHEADERS + "?menu=" + menu;
                httpSession.setAttribute("flag", status);
                httpSession.setAttribute("headers", headers);
                httpSession.setAttribute("db_type", db_type);
                if (httpSession.getAttribute("flagFilter") == null) {
                    httpSession.removeAttribute("flagFilter");
                }
            }
            System.out.println("menunyaaaa.... " + menu);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
        dispatcher.forward(request, response);
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
