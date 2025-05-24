/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.mx.MxCamt05300108;
import com.prowidesoftware.swift.model.mx.MxCamt05500108;
import com.prowidesoftware.swift.model.mx.MxCamt05600108;
import com.prowidesoftware.swift.model.mx.MxCamt10700101;
import com.prowidesoftware.swift.model.mx.MxCamt10800101;
import com.prowidesoftware.swift.model.mx.MxPacs00400109;
import com.prowidesoftware.swift.model.mx.MxPacs00800108;
import com.prowidesoftware.swift.model.mx.MxPacs00900108;
import com.prowidesoftware.swift.model.mx.MxWriteConfiguration;
import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBHeader;
import com.vensys.appcm.dbase.DBMTRelation;
import com.vensys.appcm.dbase.DBMTText;
import com.vensys.appcm.dbase.DBconnection;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataMTText;
import com.vensys.appcm.model.HeaderStatus;
import com.vensys.appcm.model.TagDB;
import com.vensys.appcm.model.Header;
import org.apache.log4j.Logger;
import com.vensys.appcm.dbase.DBMXText;
import com.vensys.appcm.model.DataMXText;
import com.vensys.appcm.model.EssentialFieldPacs008;
import org.apache.commons.lang.StringEscapeUtils;

/**
 *
 * @author M Abdul Hadi
 */
public class VDataTransaksiOutgoing extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    Logger log = Logger.getLogger(getClass().getName());
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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
//        String io_type = request.getParameter("io_type");
        HttpSession httpSession = request.getSession();
        String db_type = (String) httpSession.getAttribute("db_type");
        String evidence_exist = "no";
        String prefix = "";
        String curr = "";
        if (db_type != null) {
            if (db_type.equalsIgnoreCase("backup")) {
                prefix = "a";
            }
        }
        DBconnection dbConn = new DBconnection();
        Header headerById = new Header();
        List<Header> relation = new ArrayList<Header>();
        List<TagDB> tags = new ArrayList<TagDB>();
        List<HeaderStatus> header_status = new ArrayList<HeaderStatus>();
        DataMTText textById = new DataMTText();
//        DataMXText textById = new DataMXText();
        String senderBank = "", receiverBank = ""; // ditambahkan pada 20180326 untuk mengetahui nama dari BANK
        String logicalTerminal = "", receiverInstitution = ""; // ditambahkan pada 20191230 untuk mengetahui nama header blok12
        DBHeader bBHeaders = new DBHeader(dbConn.getConnection());
        DBDataTransaksiOutgoing opr = new DBDataTransaksiOutgoing(dbConn.getConnection());
        DBMTRelation dbRelation = new DBMTRelation(dbConn.getConnection());
//        DBMTText dbText = new DBMTText(dbConn.getConnection());
        DBMTText dbText = new DBMTText(dbConn.getConnection());
        try {
            headerById = bBHeaders.getHeaderById(request.getParameter("id"), prefix);
//            System.out.println("flagStatus:" + headerById.getFlag());
            httpSession.setAttribute("flagStatus", headerById.getFlag());
//            System.out.println("flagStatus: " + headerById.getFlag());
//            System.out.println("id: " + request.getParameter("id"));
            httpSession.setAttribute("io_typeStatus", headerById.getIo_type());
            httpSession.setAttribute("messageType", headerById.getMessageType());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        if (headerById.getFlag().equalsIgnoreCase("INC-NOK") || headerById.getFlag().equalsIgnoreCase("INC-WAIT")) {
            DBDataTransaksiOutgoing dBDataTransaksiOutgoing = new DBDataTransaksiOutgoing(dbConn.getConnection());
            String rekening = dBDataTransaksiOutgoing.getTag59Account103(request.getParameter("id"));
            String namaCore = dBDataTransaksiOutgoing.getVerifiedAccName(rekening);
//            System.out.println("Nama Core:" + namaCore);
//            System.out.println("Rekening:" + rekening);
            httpSession.setAttribute("nama_core", namaCore);
        }
        try {
            CHeader headermt = new CHeader(); 
            headermt.wifeParser(headerById.getMessageType(),Integer.parseInt(request.getParameter("id")));
            tags = bBHeaders.getAllTagById(request.getParameter("id"), prefix);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        try {
            header_status = bBHeaders.getAllHeaderStatus(request.getParameter("id"), prefix);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        try {
            log.info("masuk gettextbyid");
            
            if (headerById.getMessageType().contains("pacs") || headerById.getMessageType().contains("camt")) {
                textById = dbText.getMxTextById(Integer.parseInt(request.getParameter("id")));
            } else {
                textById = dbText.getMtTextById(Integer.parseInt(request.getParameter("id")));
            }
            

            //ini yg bawaan MT
            String before = textById.getModify_mt();
            String after = textById.getFinal_mt();

            BufferedReader br1 = null;
            BufferedReader br2 = null;
            String sCurrentLine;
            int linelength;
            HashMap<String, Integer> beforeRecords = new HashMap<String, Integer>();
            HashMap<String, Integer> afterRecords = new HashMap<String, Integer>();
            if (before == null) {
                br1 = new BufferedReader(new StringReader(""));;
            } else {
                br1 = new BufferedReader(new StringReader(before));
            }
            if (after == null) {
                br2 = new BufferedReader(new StringReader(""));
            } else {
                br2 = new BufferedReader(new StringReader(after));
            }

            while ((sCurrentLine = br1.readLine()) != null) {
                if (beforeRecords.containsKey(sCurrentLine)) {
                    beforeRecords.put(sCurrentLine, beforeRecords.get(sCurrentLine) + 1);
                } else {
                    beforeRecords.put(sCurrentLine, 1);
                }
            }
            while ((sCurrentLine = br2.readLine()) != null) {
                if (beforeRecords.containsKey(sCurrentLine)) {
                    int beforeCount = beforeRecords.get(sCurrentLine) - 1;
                    if (beforeCount == 0) {
                        beforeRecords.remove(sCurrentLine);
                    } else {
                        beforeRecords.put(sCurrentLine, beforeCount);
                    }
                } else {
                    if (afterRecords.containsKey(sCurrentLine)) {
                        afterRecords.put(sCurrentLine, afterRecords.get(sCurrentLine) + 1);
                    } else {
                        afterRecords.put(sCurrentLine, 1);
                    }
                }
            }
//            System.out.println("Record di before ");
            String resultBfr = "";
            for (String keyBefore : beforeRecords.keySet()) {
                for (int i = 0; i < beforeRecords.get(keyBefore); i++) {
//                    System.out.println("before: " + keyBefore);
                    resultBfr += keyBefore + "\r\n";
                }
            }
//            System.out.println("Record di after ");
            String resultAft = "";
            for (String keyAfter : afterRecords.keySet()) {
                for (int i = 0; i < afterRecords.get(keyAfter); i++) {
//                    System.out.println("after: " + keyAfter);
                    resultAft += keyAfter + "\r\n";
                }
            }
            //request.setAttribute("keyAfter", resultAft);
            //request.setAttribute("keyBefore", resultBfr);
           request.setAttribute("keyAfter", StringEscapeUtils.escapeHtml(resultAft));
           request.setAttribute("keyBefore", StringEscapeUtils.escapeHtml(resultBfr));

//            System.out.println("textByid: "+textById);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        // ditambahkan pada 20180326 untuk mengetahui nama dari BANK
        //try {
          //  senderBank = bBHeaders.getSenderBank(request.getParameter("id"));
//            System.out.println("senderBank : "+senderBank);
        //} catch (Exception ex) {
           // ex.printStackTrace();
        //}

        // ditambahkan pada 20180326 untuk mengetahui nama dari BANK
        try {
            receiverBank = bBHeaders.getRecBank(request.getParameter("id"));
//            System.out.println("receiverBank : "+receiverBank);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        try {
            relation = dbRelation.getMtRelbyIdHeaders(request.getParameter("id"));
           // user_comments = opr.getAllUserCommentEvidence(Integer.parseInt(request.getParameter("id")),"comment");
            //evidence_list = opr.getAllUserCommentEvidence(Integer.parseInt(request.getParameter("id")),"attachment");
            //if(evidence_list.size()>0){
               // evidence_exist = "yes";
            //}
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        // ditambahkan pada 20191230 untuk mengetahui nama dari LT dan receiver inst
        try {
            String ltri = bBHeaders.getLTRI(request.getParameter("id"));
            String[] arrLtri = ltri.split("#");
            if (arrLtri[4].equalsIgnoreCase("O")) { //20200106
                if (!arrLtri[3].isEmpty()) {
                    logicalTerminal = arrLtri[3];
                } else {
                    logicalTerminal = "";
                }
                
                if (!arrLtri[1].isEmpty()) {
                    receiverInstitution = arrLtri[1];
                } else {
                    receiverInstitution = "";
                }
                
            } else {
                if (!arrLtri[1].isEmpty()) {
                    logicalTerminal = arrLtri[1];
                } else {
                    logicalTerminal = "";
                }
                
                if (!arrLtri[3].isEmpty()) {
                    receiverInstitution = arrLtri[3];
                } else {
                    receiverInstitution = "";
                }
                
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        /*try {
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }*/
        request.setAttribute("headerById", headerById);
        request.setAttribute("tags", tags);
        request.setAttribute("header_status", header_status);
        request.setAttribute("textById", textById);
        request.setAttribute("senderBank", senderBank); // ditambahkan pada 20180326 untuk mengetahui nama dari BANK
        request.setAttribute("receiverBank", receiverBank); // ditambahkan pada 20180326 untuk mengetahui nama dari BANK
        request.setAttribute("relation", relation); // ditambahkan pada 20191112 untuk tabel relasi
        request.setAttribute("logicalTerminal", logicalTerminal); // ditambahkan pada 20191230 untuk mengetahui nama dari lt
        request.setAttribute("receiverInstitution", receiverInstitution); // ditambahkan pada 20191230 untuk mengetahui nama dari recins
        //request.setAttribute("evidence_exist", evidence_exist); //20240108 ditambah ini
        String suffix = "COV";
        RequestDispatcher view;
        
        if (headerById.getNetworktype().contains("MT")) { 
            if (headerById.getMessageType().contains("103") || headerById.getMessageType().contains("200") || headerById.getMessageType().contains("202")) {
                view = request.getRequestDispatcher("mt" + headerById.getMessageType().trim() + ".jsp");
            } else {
                view = request.getRequestDispatcher("mt.jsp");
            }
        } else {
            MxWriteConfiguration mxConfiguration =  new MxWriteConfiguration();
            mxConfiguration.rootElement = "Document";
            mxConfiguration.documentPrefix = null;
            mxConfiguration.headerPrefix = null;
            if (headerById.getMessageType().contains("COV")) {
                String json = opr.getBodyAnHeaderMXById(Integer.parseInt(request.getParameter("id"))).get("bodyMX");
                MxPacs00900108 dataMXpacs009 = MxPacs00900108.fromJson(json);
                dataMXpacs009.setAppHdr(null);
                String clearMX = dataMXpacs009.message(mxConfiguration);
                request.setAttribute("dataIsoXML", clearMX);
                
                view = request.getRequestDispatcher(headerById.getMessageType().substring(0, 8) + "cov.jsp");
            } else if (headerById.getMessageType().contains("ADV")) {
                String json = opr.getBodyAnHeaderMXById(Integer.parseInt(request.getParameter("id"))).get("bodyMX");
                MxPacs00900108 dataMXpacs009 = MxPacs00900108.fromJson(json);
                dataMXpacs009.setAppHdr(null);
                String clearMX = dataMXpacs009.message(mxConfiguration);
                request.setAttribute("dataIsoXML", clearMX);
                
                view = request.getRequestDispatcher(headerById.getMessageType().substring(0, 8) + "adv.jsp");
            } else if (headerById.getMessageType().contains("pacs.004") || headerById.getMessageType().contains("pacs.008") || headerById.getMessageType().contains("pacs.009") || headerById.getMessageType().contains("camt.053") || headerById.getMessageType().contains("camt.055") || headerById.getMessageType().contains("camt.056") || headerById.getMessageType().contains("camt.107") || headerById.getMessageType().contains("camt.108")) {
                String json = opr.getBodyAnHeaderMXById(Integer.parseInt(request.getParameter("id"))).get("bodyMX");
                if (headerById.getMessageType().contains("pacs.004")) {
                    MxPacs00400109 dataMXpacs004 = MxPacs00400109.fromJson(json);
                    dataMXpacs004.setAppHdr(null);
                    String clearMX = dataMXpacs004.message(mxConfiguration);
                    request.setAttribute("dataIsoXML", clearMX);
                } else if (headerById.getMessageType().contains("pacs.008")) {
                    MxPacs00800108 dataMXpacs008 = MxPacs00800108.fromJson(json);
                    dataMXpacs008.setAppHdr(null);
                    String clearMX = dataMXpacs008.message(mxConfiguration);
                    request.setAttribute("dataIsoXML", clearMX);
                } else if (headerById.getMessageType().contains("pacs.009")) {
                    MxPacs00900108 dataMXpacs009 = MxPacs00900108.fromJson(json);
                    dataMXpacs009.setAppHdr(null);
                    String clearMX = dataMXpacs009.message(mxConfiguration);
                    request.setAttribute("dataIsoXML", clearMX);
                } else if (headerById.getMessageType().contains("camt.053")) {
                    MxCamt05300108 dataMXcamt053 = MxCamt05300108.fromJson(json);
                    dataMXcamt053.setAppHdr(null);
                    String clearMX = dataMXcamt053.message(mxConfiguration);
                    request.setAttribute("dataIsoXML", clearMX);
                } else if (headerById.getMessageType().contains("camt.055")) {
                    MxCamt05500108 dataMXcamt055 = MxCamt05500108.fromJson(json);
                    dataMXcamt055.setAppHdr(null);
                    String clearMX = dataMXcamt055.message(mxConfiguration);
                    request.setAttribute("dataIsoXML", clearMX);
                } else if (headerById.getMessageType().contains("camt.056")) {
                    MxCamt05600108 dataMXcamt056 = MxCamt05600108.fromJson(json);
                    dataMXcamt056.setAppHdr(null);
                    String clearMX = dataMXcamt056.message(mxConfiguration);
                    request.setAttribute("dataIsoXML", clearMX);
                } else if (headerById.getMessageType().contains("camt.107")) {
                    MxCamt10700101 dataMXcamt107 = MxCamt10700101.fromJson(json);
                    dataMXcamt107.setAppHdr(null);
                    String clearMX = dataMXcamt107.message(mxConfiguration);
                    request.setAttribute("dataIsoXML", clearMX);
                } else if (headerById.getMessageType().contains("camt.108")) {
                    MxCamt10800101 dataMXcamt108 = MxCamt10800101.fromJson(json);
                    dataMXcamt108.setAppHdr(null);
                    String clearMX = dataMXcamt108.message(mxConfiguration);
                    request.setAttribute("dataIsoXML", clearMX);
                }
                
                view = request.getRequestDispatcher(headerById.getMessageType().substring(0, 8) + ".jsp");
            } else {
                view = request.getRequestDispatcher("mx.jsp");
            }
        }
        view.forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            log.error(ex.getMessage());
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            log.error(ex.getMessage());
        }
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