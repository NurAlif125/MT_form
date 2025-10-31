/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.sql.SQLException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.StringTokenizer;
import java.util.logging.Level;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataCharges;
import com.vensys.appcm.model.DataHeaderTransaksi;
import com.vensys.appcm.model.DataInvestigation;
import com.vensys.appcm.model.DataSequence;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.TagDB;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author ovasae
 */
public class SCDataTransaksi299 extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Logger log = LogManager.getLogger(getClass().getName());

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
            throws ServletException, IOException, SQLException, Exception {

        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String[] idsToUpdate = request.getParameterValues("chkId");
        String io_typeStatus = (String) session.getAttribute("io_typeStatus");
        String flagStatus = (String) session.getAttribute("flagStatus");
        int cek = 0;
        String messageType = request.getParameter("messageType");
        DBconnection dbConn = new DBconnection();
        DataHeaderTransaksi data = new DataHeaderTransaksi();
        DBDataTransaksiOutgoing dBDataTransaksiOutgoing = new DBDataTransaksiOutgoing(dbConn.getConnection());
        String tgl_trx = new SimpleDateFormat("yyMMddHHmm").format(new Date());
        String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        
        if (request.getParameter("flag").equalsIgnoreCase("INC-RTR")) {
            log.info("incoming retur"); // 20191105
            Header header2xx = dBDataTransaksiOutgoing.getHeaderById(id);
            List<TagDB> tags2xx = dBDataTransaksiOutgoing.getAllTagById(id);
            DataHeaderTransaksi header199 = new DataHeaderTransaksi();
//            List<TagDB> tags299 = new ArrayList<TagDB>();
            String nReceiver_institution = "";
            String currDate = new SimpleDateFormat("yyMMdd").format(new Date());
            CreateText ct = new CreateText(dbConn.getConnection());
            String tag20 = "none";
            String seq = "";
            String currency2 = "";
            String _010_mf20_sender_reference2 = "";
            String amount2 = "";
            String valueDate2 = "";
//            String komen2xx = 
            
            for (int i = 0; i < tags2xx.size(); i++) {
                if (tags2xx.get(i).getTagName().equalsIgnoreCase("_010_mf20_sender_reference")) {
                    _010_mf20_sender_reference2 = tags2xx.get(i).getDetail();
                } else if (tags2xx.get(i).getTagName().equalsIgnoreCase("_061_mf32a_currency")) {
                    currency2 = tags2xx.get(i).getDetail();
                } else if (tags2xx.get(i).getTagName().equalsIgnoreCase("_062_mf32a_amount")) {
                    amount2 = tags2xx.get(i).getDetail();
                } else if (tags2xx.get(i).getTagName().equalsIgnoreCase("_060_mf32a_date")) {
                    valueDate2 = tags2xx.get(i).getDetail();
                }
            }
            

            dBDataTransaksiOutgoing.createReturTransaksiOutgoing("INC-RTR", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            List<TagDB> tags199_2 = new ArrayList<TagDB>();
            DataHeaderTransaksi header299 = new DataHeaderTransaksi();
            header299.setSender_logical_terminal("MEGAIDJAXXXX");
            log.info("nSender_logical_terminal=" + header299.getSender_logical_terminal());
            header299.setMessageType("299");
            nReceiver_institution = header2xx.getReceiverAddress().substring(0, 8) + "X" + header2xx.getReceiverAddress().substring(9);
//            nReceiver_institution = ""; //(Bank Koresponden Bank Pengirim)
            header299.setReceiver_institution(nReceiver_institution);
            log.info("nReceiver_institution=" + nReceiver_institution);
            header299.setPriority("N");
            String blok3 = "";
            String reasonRetur = "";

            //20210129
            if (header2xx.getBlock3() == null) {
                //do  nothing
            } else {
                blok3 = header2xx.getBlock3().substring(header2xx.getBlock3().indexOf("121:"));
                if (blok3.contains("433:")) {
                    blok3 = blok3.replace(blok3.substring(blok3.indexOf("433:")), "");
                }
            }

            // System.out.println("blok3 nyaeta : " + blok3);
            //-------
            header299.setBlock3(blok3);
            //end
            
            //20230109
            if (!header2xx.getKomentar().equalsIgnoreCase("Account Not Found in Vostro List")) {
                reasonRetur = "INSUFFICIENT BALANCE.";
            } else {
                reasonRetur = "WE DO NOT MAINTAIN ACCOUNT WITH YOU.";
            }
            
            header299.setOperator_comment(header2xx.getKomentar());
            dBDataTransaksiOutgoing.addDataTransaksiInvestigasi(header299, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            String seqDB = dBDataTransaksiOutgoing.getSeq();
            String[] arSeq = seqDB.split("#");
            seq = arSeq[0].trim();
            int seqInt = Integer.parseInt(seq);
            seqInt = seqInt + 1;
            String sseqint = String.valueOf(seqInt);
            String padder = "";
            for (int k = 0; k < 3 - sseqint.length(); k++) {
                padder += "0";
            }
            seq = padder + sseqint;
            String resetDate = arSeq[1].trim();
            SimpleDateFormat tgl = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = tgl.parse(tglToday);
            Date date2 = tgl.parse(resetDate);
            String dateUpdate = resetDate;
            int tahun = Integer.parseInt(tglToday.substring(0, 4));
            if (date1.compareTo(date2) > 0 || date1.compareTo(date2) == 0) {
                tahun = tahun + 1;
                dateUpdate = String.valueOf(tahun) + "-01-01";
                seq = "000";
            } else {
                dateUpdate = resetDate;
            }
            dBDataTransaksiOutgoing.updateSequence(dateUpdate, seq);
            tag20 = "RTR" + currDate + header2xx.getLogicalTerminal().substring(0, 4) + seq;

            dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(id), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));

            TagDB tag199_2 = new TagDB();
//                    _010_mf20_sender_reference
            tag199_2.setUrutan(10);
            tag199_2.setTag("20");
            tag199_2.setDetail(tag20);
//                tag199_2.setDetail("RTR" + currDate + "" + header2xx.getLogicalTerminal().substring(0, 4).toString() + "" + dataInv_2.getSeq_num());S
            tag199_2.setTagName("_010_mf20_sender_reference");
            tags199_2.add(tag199_2);
//                    _011_mf21_
            tag199_2 = new TagDB();
            tag199_2.setUrutan(11);
            tag199_2.setTag("21");
            tag199_2.setDetail(_010_mf20_sender_reference2);
            tag199_2.setTagName("_011_of21_Related_Reference");
            tags199_2.add(tag199_2);
//                    _060_mf32a_date
            tag199_2 = new TagDB();
            tag199_2.setUrutan(12);
            tag199_2.setTag("79");
            tag199_2.setDetail("ATTN: REMMITANCE DEPT OR WHO MAY CONCERN" + "\r\n"
                    + "." + "\r\n"
                    + "REFER TO YOUR MT " + messageType + " DD " + valueDate2 + "\r\n"
                    + "REF. " + _010_mf20_sender_reference2 + " FOR " + currency2 + " " + amount2 + "\r\n"
                    + "." + "\r\n"
                    + "PLEASE BE INFORMED WE HEREBY CANCEL YOUR A/M MT " + messageType + " DUE TO " + reasonRetur + "\r\n"
//                    + "..................................." + "\r\n"
                    + "." + "\r\n"
                    + "WE CONFIRM THIS PAYMENT ORDER IS NOW CONSIDERED" + "\r\n"
                    + "AS CANCELLATION AND TREAT IT AS NULL AND VOID." + "\r\n"
                    + "." + "\r\n"
                    + "WE CLOSE OUR FILE ON THIS CASE." + "\r\n"
                    + "." + "\r\n"
                    + "REGARDS, " + "\r\n"
                    + "REMITTANCE OPERATION \r\n"
                    + "PT. BANK MUAMALAT INDONESIA, TBK.");
            tag199_2.setTagName("_012_mf79_Narrative");
            tags199_2.add(tag199_2);
            log.info("before add data tag incoming retur tipe 2");
            for (int i = 0; i < tags199_2.size(); i++) {
                dBDataTransaksiOutgoing.addDataTag199(tags199_2.get(i).getUrutan(), tags199_2.get(i).getTag(), tags199_2.get(i).getDetail(), tags199_2.get(i).getTagName());
            }
            log.info("create new MT");
            log.info("id header mt299: " + dBDataTransaksiOutgoing.id_headers());
            dBDataTransaksiOutgoing.addMTText(ct.createFinalMT(ct.getHeaderById(dBDataTransaksiOutgoing.id_headers())), dBDataTransaksiOutgoing.id_headers());
            log.info("after add data tag incoming retur");

        }
        dbConn.closeConnection();
        // log.info("kadieuuuuuu....");
//        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("controllerHeaders");
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(SCDataTransaksi299.class.getName()).log(Level.SEVERE, null, ex);
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
            java.util.logging.Logger.getLogger(SCDataTransaksi299.class.getName()).log(Level.SEVERE, null, ex);
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
