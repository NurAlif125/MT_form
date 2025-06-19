/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.json.JSONArray;
import org.json.JSONObject;
import com.vensys.appcm.dbase.DBHeader;
import com.vensys.appcm.dbase.DBUserData;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.HeaderSearchCriteria;
import com.vensys.appcm.model.ResultHeader;
import com.vensys.appcm.myutils.HistoryPaging;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

// Ganti path sesuai kebutuhan
@WebServlet("/headerData")
public class HeaderListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String CONTROLLERHEADERS = "controllerHeaders.jsp";
    private static String RESULTHEADERS = "resultHeaders.jsp";
    Logger log = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
        log.info("SCHEADER:");     
        
        HeaderSearchCriteria criteria = new HeaderSearchCriteria();
        criteria.setMtSearch(request.getParameter("columns[1][search][value]"));
        criteria.setIoSearch(request.getParameter("columns[2][search][value]"));
        criteria.setSeqSearch(request.getParameter("columns[3][search][value]"));
        criteria.setLogicalSearch(request.getParameter("columns[4][search][value]"));
        criteria.setReceiverSearch(request.getParameter("columns[5][search][value]"));
        criteria.setRefSearch(request.getParameter("columns[6][search][value]"));
        criteria.setRelRefSearch(request.getParameter("columns[7][search][value]"));
        criteria.setValDateSearch(request.getParameter("columns[8][search][value]"));
        criteria.setCcySearch(request.getParameter("columns[9][search][value]"));
        criteria.setAmountSearch(request.getParameter("columns[10][search][value]"));
        criteria.setCreatedDateSearch(request.getParameter("columns[11][search][value]"));
        criteria.setFlagSearch(request.getParameter("columns[12][search][value]"));
        criteria.setSourceSearch(request.getParameter("columns[13][search][value]"));
        
//        System.out.println("mtSearch: " + request.getParameter("columns[1][search][value]"));
//        System.out.println("ioSearch: " + request.getParameter("columns[2][search][value]"));
//        System.out.println("seqSearch: " + request.getParameter("columns[3][search][value]"));
//        System.out.println("logicalSearch: " + request.getParameter("columns[4][search][value]"));
//        System.out.println("corespondent: " + request.getParameter("columns[5][search][value]"));
//        System.out.println("refSearch: " + request.getParameter("columns[6][search][value]"));
//        System.out.println("relRefSearch: " + request.getParameter("columns[7][search][value]"));
//        System.out.println("valDateSearch: " + request.getParameter("columns[8][search][value]"));
//        System.out.println("ccySearch: " + request.getParameter("columns[9][search][value]"));
//        System.out.println("amountSearch: " + request.getParameter("columns[10][search][value]"));
//        System.out.println("createdDateSearch: " + request.getParameter("columns[11][search][value]"));
//        System.out.println("flagSearch: " + request.getParameter("columns[12][search][value]"));
//        System.out.println("sourceSearch: " + request.getParameter("columns[13][search][value]"));




         HttpSession session = request.getSession();
//        String sender_logical_terminal = session.getAttribute("sender_logical_terminal") != null ? (String) session.getAttribute("sender_logical_terminal") : "";
//        String receiver_institution = session.getAttribute("receiver_institution") != null ? (String) session.getAttribute("receiver_institution") : "";
//        String mt_type = session.getAttribute("mt_type") != null ? (String) session.getAttribute("mt_type") : "";
//        String date_from = session.getAttribute("date_from") != null ? (String) session.getAttribute("date_from") : "";
//        String date_end = session.getAttribute("date_end") != null ? (String) session.getAttribute("date_end") : "";
//        System.out.println("=====================");
//        System.out.println("Date form___ :"+date_from);
//        String sender_reference = session.getAttribute("sender_reference") != null ? (String) session.getAttribute("sender_reference") : "";
//        String rel_reference = session.getAttribute("rel_reference") != null ? (String) session.getAttribute("rel_reference") : "";
//        String currency_code = session.getAttribute("currency_code") != null ? (String) session.getAttribute("currency_code") : "";
//        String amount = session.getAttribute("amount") != null ? (String) session.getAttribute("amount") : "";
//        String find = session.getAttribute("find") != null ? (String) session.getAttribute("find") : "";
//        String status = session.getAttribute("status") != null ? (String) session.getAttribute("status") : "";
//        String menu = session.getAttribute("menu") != null ? (String) session.getAttribute("menu") : "";

        int draw = Integer.parseInt(request.getParameter("draw"));
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));
        String io_type = request.getParameter("io_type"); // bisa jadi null
        String flag = request.getParameter("flag"); // bisa jadi null
        String channel = request.getParameter("channel"); // bisa jadi null
        log.info("SCHEADER:");
        String sender_logical_terminal = request.getParameter("sender_logical_terminal");
        String receiver_institution = request.getParameter("receiver_institution");
        String mt_type = request.getParameter("mt_type");
        String date_from = request.getParameter("date_from");
        String date_end = request.getParameter("date_end");
        String sender_reference = request.getParameter("sender_reference");
        String rel_reference = request.getParameter("rel_reference"); // ditambahkan pada 20151001 by Azan
        String sender_bank = request.getParameter("sender_bank");// ditambahkan pada 20151102 by Azan
        String receiver_bank = request.getParameter("receiver_bank");// ditambahkan pada 20151102 by Azan
        String currency_code = request.getParameter("currency_code");
        String amount = request.getParameter("amount");
        String find = request.getParameter("find");
//        log.info("flag: " + flag);
        String status = request.getParameter("status");
//        log.info("status: " + status);
        String menu = request.getParameter("menu");
//        log.info("menu: " + menu);
        String forward = "";
        int notifVer = 0;
        int notifAuth = 0;

//        int offset = 0;
//        int limit = 10; // default limit
//        try {
//            offset = Integer.parseInt(request.getParameter("offset"));
//            limit = Integer.parseInt(request.getParameter("limit"));
//        } catch (Exception e) {
//            // gunakan default jika tidak valid
//        }

        int pageNumber = (start / length) + 1; // (20 / 10) + 1 = 3
        int offset = (pageNumber - 1) * length; // (3 - 1) * 10 = 20

//        HttpSession session = request.getSession();
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        DBconnection dbConn = new DBconnection();
        DBUserData dbo = new DBUserData(dbConn.getConnection());
        DBHeader bBHeaders = new DBHeader(dbConn.getConnection());
        HttpSession httpSession = request.getSession();
        
        String flagStatus = (String) httpSession.getAttribute("flagStatus");
//        log.info("flagStatus: " + flagStatus);

        try {
            channel = (String) httpSession.getAttribute("channel");
            notifVer = dbo.getNotificationVer();
//            log.info("notifVer: " + notifVer);
            notifAuth = dbo.getNotificationAuth();
//            log.info("notifAuth: " + notifAuth);
            httpSession.setAttribute("notifVer", notifVer);
            httpSession.setAttribute("notifAuth", notifAuth);
                DBHeader dbHeader = new DBHeader(dbConn.getConnection());
                int totalRecords = 0;
                List<Header> headers = new ArrayList<>();
                
            if ((find == null || find.isEmpty()) && (flag == null || flag.isEmpty())) {
                headers = dbHeader.getAllHeader(session, io_type, flag, channel, start, length, criteria);
                totalRecords = dbHeader.countAllHeader(session, io_type, flag, channel, criteria);
                System.out.println("Total Data"+ String.valueOf(totalRecords));
            } else if (flag != null && !flag.isEmpty()) {
                if (menu == null) {
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
                    }  else if (flag.equalsIgnoreCase("ACK")) {
                        flag = "ACK";
                        menu = "13";
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
                    } else if (flag.equalsIgnoreCase("INC")) {
                        flag = "INC";
                        menu = "24";
                    } else if (flag.equalsIgnoreCase("RESEND-CNF")) {
                        flag = "RESEND-CNF";
                        menu = "25";
                    } else if (flag.equalsIgnoreCase("INC-AML")) {
                        flag = "INC-AML";
                        menu = "26";
                    } else if (flag.equalsIgnoreCase("AML-TERMINATE-IN")) {
                        flag = "AML-TERMINATE-IN";
                        menu = "27";
                    } else if (flag.equalsIgnoreCase("INC-AML-FAILED")) {
                        flag = "INC-AML-FAILED";
                        menu = "28";
                    } else if (flag.equalsIgnoreCase("INC-AML-FAILED-CNF")) {
                        flag = "INC-AML-FAILED-CNF";
                        menu = "29";
                    } else if (flag.equalsIgnoreCase("UNSETTLE-INC")) {
                        flag = "UNSETTLE-INC";
                        menu = "30";
                    } else if (flag.equalsIgnoreCase("INC-RESEND-CNF")) {
                        flag = "INC-RESEND-CNF";
                        menu = "31";
                    } else if (flag.equalsIgnoreCase("SETTLE")) {
                        flag = "SETTLE";
                        menu = "32";
                    } else if (flag.equalsIgnoreCase("UNSETTLE-OUT")) {
                        flag = "UNSETTLE-OUT";
                        menu = "33";
                    } else if (flag.equalsIgnoreCase("WAITING-SAA-CNF")) {
                        flag = "WAITING-SAA-CNF";
                        menu = "34";
                    } else if (flag.equalsIgnoreCase("WAITING-AML")) {
                        flag = "WAITING-AML";
                        menu = "35";
                    }  else if (flag.equalsIgnoreCase("AML-TERMINATE-OUT")) {
                        flag = "AML-TERMINATE-OUT";
                        menu = "36";
                    } else if (flag.equalsIgnoreCase("FIA-FAILED")) {
                        flag = "FIA-FAILED";
                        menu = "38";
                    } else if (flag.equalsIgnoreCase("FIA-FAILED-CNF")) {
                        flag = "FIA-FAILED-CNF";
                        menu = "39";
                    } else {
                        flag = "AUTH";
                        menu = "3";
                    }

                    headers = dbHeader.getAllHeader(session, io_type, flag, channel, start, length, criteria);
                    totalRecords = dbHeader.countAllHeader(session, io_type, flag, channel, criteria);
                    System.out.println("Total Data"+ String.valueOf(totalRecords));
                
                    forward = CONTROLLERHEADERS + "?menu=" + menu;
                    httpSession.setAttribute("headers", headers);
                    httpSession.setAttribute("flag", flag);
                    httpSession.setAttribute("flagFilter", flag);
                } else {
//                    log.info("flag else : " + flag);
                    headers = dbHeader.getAllHeader(session, io_type, flag, channel, start, length, criteria);
                    totalRecords = dbHeader.countAllHeader(session, io_type, flag, channel, criteria);
                    System.out.println("Total Data"+ String.valueOf(totalRecords));
                    forward = CONTROLLERHEADERS + "?menu=" + menu;
                    httpSession.setAttribute("flag", flag);
                    httpSession.setAttribute("flagFilter", flag);
                }

            } else {
//                log.info("masuk sini else");
                String db_type = request.getParameter("db_type") != null ? request.getParameter("db_type") : "";

                System.out.println("DATE FORM: "+date_from+" ------- "+date_end);
//                resultHeader = bBHeaders.getResultHeader(httpSession, io_type, sender_logical_terminal, receiver_institution, mt_type, date_from, date_end, sender_reference, rel_reference, currency_code, amount, status, db_type);
                headers = bBHeaders.getResultHeader(httpSession, io_type, sender_logical_terminal, receiver_institution, mt_type, date_from, date_end, sender_reference, rel_reference, currency_code, amount, status, db_type, channel, start, length, criteria);
                totalRecords = bBHeaders.getCountResultHeader(httpSession, io_type, sender_logical_terminal, receiver_institution, mt_type, date_from, date_end, sender_reference, rel_reference, currency_code, amount, status, db_type, channel, criteria);
                System.out.println("TOtal REcordd ----"+totalRecords);
//                forward = RESULTHEADERS + "?menu="+menu;
                forward = CONTROLLERHEADERS + "?menu=" + menu;
                httpSession.setAttribute("flag", status);
                httpSession.setAttribute("headers", headers);
                httpSession.setAttribute("db_type", db_type);
                if (httpSession.getAttribute("flagFilter") == null) {
                    httpSession.removeAttribute("flagFilter");
                }
            }
                

                JSONArray dataArray = new JSONArray();
                for (Header h : headers) {
                    JSONObject obj = new JSONObject();
                    obj.put("messageType", h.getMessageType());
                    obj.put("logicalTerminal", h.getLogicalTerminal());
                    obj.put("sessionNumber", h.getSessionNumber());
                    obj.put("sequenceNumber", h.getSequenceNumber());
                    obj.put("io_type", h.getIo_type());
                    obj.put("receiverAddress", h.getReceiverAddress());
                    obj.put("tanggal", h.getTanggal());
                    obj.put("id_headers", h.getId_headers());
                    obj.put("flag", h.getFlag());
                    obj.put("block3", h.getBlock3());
                    obj.put("source", h.getSource());
                    obj.put("trans_reference", h.getTrans_refference());
                    obj.put("trans_related_reference", h.getTrans_related_refference());
                    obj.put("trans_date_value", h.getTrans_date_value());
                    obj.put("trans_amount", h.getTrans_amount());
                    obj.put("trans_ccy", h.getTrans_ccy());
                    dataArray.put(obj);
                }

                JSONObject jsonResponse = new JSONObject();
    //            jsonResponse.put("draw", draw);
    //            jsonResponse.put("recordsTotal", totalRecords);
    //            jsonResponse.put("recordsFiltered", filteredRecords);
    //            jsonResponse.put("data", dataArray);

                jsonResponse.put("draw", draw);
                jsonResponse.put("recordsTotal", totalRecords);
                jsonResponse.put("recordsFiltered", totalRecords); // PENTING
                jsonResponse.put("data", dataArray);
    //            System.out.println("JSON Response: " + jsonResponse.toString());
                out.print(jsonResponse.toString());
//            out.print(jsonResponse.toString());

            session.removeAttribute("db_type");
            session.removeAttribute("io_type");
            session.removeAttribute("sender_logical_terminal");
            session.removeAttribute("receiver_institution");
            session.removeAttribute("mt_type");
            session.removeAttribute("date_from");
            session.removeAttribute("date_end");
            session.removeAttribute("status");
            session.removeAttribute("sender_reference");
            session.removeAttribute("rel_reference");
            session.removeAttribute("currency_code");
            session.removeAttribute("amount");
            session.removeAttribute("find");
        } catch (Exception e) {
            e.printStackTrace();
            log.error("Error Header Servlet"+e.getMessage());
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("error", "Error fetching data: " + e.getMessage());
            out.print(errorResponse.toString());
        } finally {
            out.flush();
            out.close();
        }
    }
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Handle POST sama seperti GET
        RequestDispatcher dispatcher = request.getRequestDispatcher("controllerHeaders.jsp?find=yes");
        dispatcher.forward(request, response);

    }

}

