/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

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
import java.util.logging.Level;
import java.util.logging.Logger;
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
            System.out.println("flagStatus: " + headerById.getFlag());
            System.out.println("id: " + request.getParameter("id"));
            httpSession.setAttribute("io_typeStatus", headerById.getIo_type());
            httpSession.setAttribute("messageType", headerById.getMessageType());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        if (headerById.getFlag().equalsIgnoreCase("INC-NOK") || headerById.getFlag().equalsIgnoreCase("INC-WAIT")) {
            DBDataTransaksiOutgoing dBDataTransaksiOutgoing = new DBDataTransaksiOutgoing(dbConn.getConnection());
            String rekening = dBDataTransaksiOutgoing.getTag59Account103(request.getParameter("id"));
            String namaCore = dBDataTransaksiOutgoing.getVerifiedAccName(rekening);
            System.out.println("Nama Core:" + namaCore);
            System.out.println("Rekening:" + rekening);
            httpSession.setAttribute("nama_core", namaCore);

            System.out.println();
        }
        try {
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
            System.out.println("masuk gettextbyid");
            textById = dbText.getMtTextById(Integer.parseInt(request.getParameter("id")));

//            textById = dbText.getMxTextById(Integer.parseInt(request.getParameter("id")));
            

            //ini yg bawaan MT
            String before = textById.getModify_mt();
            String after = textById.getFinal_mt();
            //ini modify baru MX
//            String before = textById.getOri_mx();
//            String after = textById.getModify_mx();
            //System.out.println("before : " + before);
            //System.out.println("after :" + after);

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
            System.out.println("Record di before ");
            String resultBfr = "";
            for (String keyBefore : beforeRecords.keySet()) {
                for (int i = 0; i < beforeRecords.get(keyBefore); i++) {
                    System.out.println("before: " + keyBefore);
                    resultBfr += keyBefore + "\r\n";
                }
            }
            System.out.println("Record di after ");
            String resultAft = "";
            for (String keyAfter : afterRecords.keySet()) {
                for (int i = 0; i < afterRecords.get(keyAfter); i++) {
                    System.out.println("after: " + keyAfter);
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
                logicalTerminal = arrLtri[3];
                receiverInstitution = arrLtri[1];
            } else {
                logicalTerminal = arrLtri[1];
                receiverInstitution = arrLtri[3];
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
        
        // TIdak akan muncul keculai di rumah INC-INV
        // Disini untuk memasukan nilai atribute role nya khsusu untuk INC-INV
        /*List role = (List)httpSession.getAttribute("role");
        if (headerById.getFlag().equalsIgnoreCase("INC-INV")){
            
//            System.out.println("Iterate Rolenya");
            for(int i = 0 ; i < role.size() ; i++){
//                System.out.println("Role : "+role.get(i));
                
                // Jika ternyata dia juga punya INC-CHGRTLACCT maka kirim attribute buat JSP
                if (role.get(i).toString().equalsIgnoreCase("FLOW:INC-CHGRTLACCT")){
                    request.setAttribute("isHasRoleChgRtlAcct", true);
                }
            }
        }*/

        //System.out.println("header is exist nih 72nya : " + headerById.getIsNextAgentExist());

        if (headerById.getMessageType().trim().toLowerCase().contains("pacs")||
                headerById.getMessageType().trim().toLowerCase().contains("camt") ||
                 headerById.getMessageType().trim().toLowerCase().contains("pain")) {
            System.out.println("apaapaan");
           if (headerById.getMessageType().trim().toLowerCase().contains("pacs.008")) {
                EssentialFieldPacs008 dataEssentialFieldPacs008 = bBHeaders.getEssentialFieldPacs008byId(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("mxById", dataEssentialFieldPacs008);
            }
            // converting json to mx
//            MxPacs00800108 pacs008 = MxPacs00800108.fromJson(dataMx.get("body"));
//            request.setAttribute("mx_modify", pacs008.message());
            Map<String, String> dataMx = opr.getMxTextById(request.getParameter("id"));

            request.setAttribute("mx_modify", dataMx.get("modify_mx"));
            request.setAttribute("final_mx", dataMx.get("final_mx"));
            request.setAttribute("multiformat_mt", dataMx.get("multiformat_mt"));
            request.setAttribute("message_type", headerById.getMessageType().trim());
            // System.out.println("muncul :" + dataMx.get("ori_mx") + "selesai ");
            RequestDispatcher view = request.getRequestDispatcher("VMxview.jsp");
//            RequestDispatcher view = request.getRequestDispatcher("ui2/page-message/" + headerById.getMessageType().trim() + ".jsp");
            view.forward(request, response);
        } else {
             System.out.println("apaapaan2");
             Map<String, String> dataMt = opr.getMtTextById(request.getParameter("id"));
            request.setAttribute("final_mt", dataMt.get("ori_mt"));
            request.setAttribute("modify_mt", dataMt.get("modify_mt"));
            request.setAttribute("final_mx", dataMt.get("final_mx"));
            request.setAttribute("final_mt", dataMt.get("final_mt"));
            request.setAttribute("message_type", headerById.getMessageType().trim());
            System.out.println("muncul :" + dataMt.get("ori_mt") + "selesai ");
            System.out.println("muncul :" + dataMt.get("final_mx") + "selesai ");
            System.out.println("muncul :" + dataMt.get("final_tags_mx") + "selesai ");
            // System.out.println("cov==" + headerById.getCov());
            if (headerById.getBlock3() == null) {
                RequestDispatcher view = request.getRequestDispatcher("mt" + headerById.getMessageType() + ".jsp");
                view.forward(request, response);
            } else if (headerById.getBlock3().contains("119:COV")) {
                RequestDispatcher view = request.getRequestDispatcher("mt" + headerById.getMessageType() + suffix + ".jsp");
                view.forward(request, response);
            } else {
                RequestDispatcher view = request.getRequestDispatcher("mt" + headerById.getMessageType() + ".jsp");
                view.forward(request, response);
            }
        }

//        System.out.println("JSP : "+"mt" + headerById.getMessageType().trim() + ".jsp");
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
            Logger.getLogger(VDataTransaksiOutgoing.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(VDataTransaksiOutgoing.class.getName()).log(Level.SEVERE, null, ex);
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