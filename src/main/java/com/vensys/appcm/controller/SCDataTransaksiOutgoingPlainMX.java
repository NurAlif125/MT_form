/*
 * Click to change this license
 * Click to edit this template
 */
package com.vensys.appcm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.prowidesoftware.swift.model.mx.AbstractMX;
import com.prowidesoftware.swift.model.mx.AppHdr;
import com.prowidesoftware.swift.model.mx.BusinessAppHdrV02;
import com.prowidesoftware.swift.model.mx.MxCamt05300108;
import com.prowidesoftware.swift.model.mx.MxCamt05500108;
import com.prowidesoftware.swift.model.mx.MxCamt05600108;
import com.prowidesoftware.swift.model.mx.MxCamt10700101;
import com.prowidesoftware.swift.model.mx.MxCamt10800101;
import com.prowidesoftware.swift.model.mx.MxWriteConfiguration;
import com.prowidesoftware.swift.model.mx.dic.BranchAndFinancialInstitutionIdentification6;
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification18;
import com.prowidesoftware.swift.model.mx.dic.Party44Choice;
import com.prowidesoftware.swift.model.mx.MxPacs00400109;
import com.prowidesoftware.swift.model.mx.MxPacs00800108;
import com.prowidesoftware.swift.model.mx.MxPacs00900108;
import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBconnection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import com.vensys.appcm.model.DataHeaderTransaksi;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import org.apache.log4j.Logger;
/**
 *
 * @author rafli
 */
@WebServlet(name = "SCDataTransaksiOutgoingPlainMX", urlPatterns = {"/SCDataTransaksiOutgoingPlainMX"})
public class SCDataTransaksiOutgoingPlainMX extends HttpServlet {

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
            throws ServletException, IOException, ParseException, SQLException, Exception {
        HttpSession session = request.getSession();
        DBconnection dbConn = new DBconnection();
        DBDataTransaksiOutgoing dBTrx = new DBDataTransaksiOutgoing(dbConn.getConnection());
        
        String receiverAddress = request.getParameter("receiver_institution");
        String logicalTerminal = request.getParameter("sender_logical_terminal");
        
        log.info("The receiver address : " + receiverAddress);
        log.info("The logical terminal : " + logicalTerminal);
        
        String dataXml = request.getParameter("dataXML");
        
        System.out.println("Data XML \r\b" + dataXml);
        
        DataHeaderTransaksi data = new DataHeaderTransaksi();
        
        AbstractMX abstractMX = AbstractMX.parse(dataXml);
        data.setNetworkType("MX");
        data.setMessageType(abstractMX.getMxId().toString());
        data.setMessageType(abstractMX.getMxId().toString());
        data.setSender_logical_terminal(logicalTerminal);
        data.setReceiver_institution(receiverAddress);
        data.setPriority("N");
        data.setMonitoring("M");
        data.setBanking_priority("N");
        data.setMur("M");
        data.setOperator_comment("Operator Comment");
        if (abstractMX.getMxId().toString().contains("pacs.008") || abstractMX.getMxId().toString().contains("pacs.009")) {
            data.setBlock3(request.getParameter("UETR"));
        } else {
            data.setBlock3(null);
        }
        data.setFlag(dBTrx.getFlagFromQueue(abstractMX.getMxId().toString()));
//        data.setBlock3(UUID.randomUUID().toString());
        String returnId_headers = dBTrx.addDataTransaksiOutgoing(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
        
        MxWriteConfiguration mxConfiguration = new MxWriteConfiguration();
        mxConfiguration.documentPrefix = null;
        mxConfiguration.headerPrefix = null;
        
        String saaHeader = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>  <Saa:DataPDU xmlns:Saa=\"urn:swift:saa:xsd:saa.2.0\" xmlns:Sw=\"urn:swift:snl:ns.Sw\" xmlns:SwGbl=\"urn:swift:snl:ns.SwGbl\" xmlns:SwInt=\"urn:swift:snl:ns.SwInt\" xmlns:SwSec=\"urn:swift:snl:ns.SwSec\">   <Saa:Revision>2.0.13</Saa:Revision>   <Saa:Header></Saa:Header>   <Saa:Body>ONLY-SAA-HEADERS</Saa:Body></Saa:DataPDU>  ";
        
        BusinessAppHdrV02 appHeader = new BusinessAppHdrV02();
        appHeader.setFr(new Party44Choice());
        appHeader.getFr().setFIId(new BranchAndFinancialInstitutionIdentification6());
        appHeader.getFr().getFIId().setFinInstnId(new FinancialInstitutionIdentification18());
        appHeader.getFr().getFIId().getFinInstnId().setBICFI(logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12));
        
        appHeader.setTo(new Party44Choice());
        appHeader.getTo().setFIId(new BranchAndFinancialInstitutionIdentification6());
        appHeader.getTo().getFIId().setFinInstnId(new FinancialInstitutionIdentification18());
        appHeader.getTo().getFIId().getFinInstnId().setBICFI(receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12));
        
        appHeader.setBizSvc("swift.cbprplus.02");
        appHeader.setCreationDate(true);
        
        if (abstractMX.getMxId().id().toLowerCase().contains("pacs.004")) {
            appHeader.setMsgDefIdr("pacs.004.001.09");
            
            MxPacs00400109 dataMXpacs004 = (MxPacs00400109) abstractMX;
            
            if (dataMXpacs004.getPmtRtr().getTxInf().get(0).getRtrId() != null) {
                appHeader.setBizMsgIdr(dataMXpacs004.getPmtRtr().getTxInf().get(0).getRtrId());
            } else {
                String seq;
                String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                String seqDB = dBTrx.getSeq();
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
                String bulan = tglToday.substring(5, 7);
                String hari = tglToday.substring(8, 10);
                if (date1.compareTo(date2) > 0 || date1.compareTo(date2) == 0) {
                    tahun = tahun + 1;
                    dateUpdate = String.valueOf(tahun) + "-01-01";
                    seq = "000";
                } else {
                    dateUpdate = resetDate;
                }
                dBTrx.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }
            
            dataMXpacs004.setAppHdr(appHeader);
            
            dBTrx.addMXText(dataMXpacs004.message(mxConfiguration), returnId_headers);
            
            dBTrx.addDataMXTag(returnId_headers, ((MxPacs00400109) abstractMX).toJson(), saaHeader);
        } else if (abstractMX.getMxId().id().toLowerCase().contains("pacs.008")) {
            appHeader.setMsgDefIdr("pacs.008.001.08");
            
            MxPacs00800108 dataMXpacs008 = (MxPacs00800108) abstractMX;
            
            if (dataMXpacs008.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId() != null) {
                appHeader.setBizMsgIdr(dataMXpacs008.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId());
            } else {
                String seq;
                String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                String seqDB = dBTrx.getSeq();
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
                String bulan = tglToday.substring(5, 7);
                String hari = tglToday.substring(8, 10);
                if (date1.compareTo(date2) > 0 || date1.compareTo(date2) == 0) {
                    tahun = tahun + 1;
                    dateUpdate = String.valueOf(tahun) + "-01-01";
                    seq = "000";
                } else {
                    dateUpdate = resetDate;
                }
                dBTrx.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }
            
            dataMXpacs008.setAppHdr(appHeader);
            
            dBTrx.addMXText(dataMXpacs008.message(mxConfiguration), returnId_headers);
            
            dBTrx.addDataMXTag(returnId_headers, ((MxPacs00800108) abstractMX).toJson(), saaHeader);
        } else if (abstractMX.getMxId().id().toLowerCase().contains("pacs.009")) {
            appHeader.setMsgDefIdr("pacs.009.001.08");
            
            MxPacs00900108 dataMXpacs009 = (MxPacs00900108) abstractMX;
            
            if (dataMXpacs009.getFICdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId() != null) {
                appHeader.setBizMsgIdr(dataMXpacs009.getFICdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId());
            } else {
                String seq;
                String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                String seqDB = dBTrx.getSeq();
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
                String bulan = tglToday.substring(5, 7);
                String hari = tglToday.substring(8, 10);
                if (date1.compareTo(date2) > 0 || date1.compareTo(date2) == 0) {
                    tahun = tahun + 1;
                    dateUpdate = String.valueOf(tahun) + "-01-01";
                    seq = "000";
                } else {
                    dateUpdate = resetDate;
                }
                dBTrx.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }
            
            dataMXpacs009.setAppHdr(appHeader);
            
            dBTrx.addMXText(dataMXpacs009.message(mxConfiguration), returnId_headers);
            
            dBTrx.addDataMXTag(returnId_headers, ((MxPacs00900108) abstractMX).toJson(), saaHeader);
        } else if (abstractMX.getMxId().id().toLowerCase().contains("camt.053")) {
            appHeader.setMsgDefIdr("camt.053.001.08");
            
            MxCamt05300108 dataMXcamt053 = (MxCamt05300108) abstractMX;
            
            if (dataMXcamt053.getBkToCstmrStmt().getStmt().get(0).getId() != null) {
                appHeader.setBizMsgIdr(dataMXcamt053.getBkToCstmrStmt().getStmt().get(0).getId());
            } else {
                String seq;
                String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                String seqDB = dBTrx.getSeq();
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
                String bulan = tglToday.substring(5, 7);
                String hari = tglToday.substring(8, 10);
                if (date1.compareTo(date2) > 0 || date1.compareTo(date2) == 0) {
                    tahun = tahun + 1;
                    dateUpdate = String.valueOf(tahun) + "-01-01";
                    seq = "000";
                } else {
                    dateUpdate = resetDate;
                }
                dBTrx.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }
            
            dataMXcamt053.setAppHdr(appHeader);
            
            dBTrx.addMXText(dataMXcamt053.message(mxConfiguration), returnId_headers);
            
            dBTrx.addDataMXTag(returnId_headers, ((MxCamt05300108) abstractMX).toJson(), saaHeader);
        } else if (abstractMX.getMxId().id().toLowerCase().contains("camt.055")) {
            appHeader.setMsgDefIdr("camt.055.001.08");
            
            MxCamt05500108 dataMXcamt055 = (MxCamt05500108) abstractMX;
            
            if (dataMXcamt055.getCstmrPmtCxlReq().getAssgnmt().getId() != null) {
                appHeader.setBizMsgIdr(dataMXcamt055.getCstmrPmtCxlReq().getAssgnmt().getId());
            } else {
                String seq;
                String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                String seqDB = dBTrx.getSeq();
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
                String bulan = tglToday.substring(5, 7);
                String hari = tglToday.substring(8, 10);
                if (date1.compareTo(date2) > 0 || date1.compareTo(date2) == 0) {
                    tahun = tahun + 1;
                    dateUpdate = String.valueOf(tahun) + "-01-01";
                    seq = "000";
                } else {
                    dateUpdate = resetDate;
                }
                dBTrx.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }
            
            dataMXcamt055.setAppHdr(appHeader);
            
            dBTrx.addMXText(dataMXcamt055.message(mxConfiguration), returnId_headers);
            
            dBTrx.addDataMXTag(returnId_headers, ((MxCamt05500108) abstractMX).toJson(), saaHeader);
        } else if (abstractMX.getMxId().id().toLowerCase().contains("camt.056")) {
            appHeader.setMsgDefIdr("camt.056.001.08");
            
            MxCamt05600108 dataMXcamt056 = (MxCamt05600108) abstractMX;
            
            if (dataMXcamt056.getFIToFIPmtCxlReq().getAssgnmt().getId() != null) {
                appHeader.setBizMsgIdr(dataMXcamt056.getFIToFIPmtCxlReq().getAssgnmt().getId());
            } else {
                String seq;
                String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                String seqDB = dBTrx.getSeq();
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
                String bulan = tglToday.substring(5, 7);
                String hari = tglToday.substring(8, 10);
                if (date1.compareTo(date2) > 0 || date1.compareTo(date2) == 0) {
                    tahun = tahun + 1;
                    dateUpdate = String.valueOf(tahun) + "-01-01";
                    seq = "000";
                } else {
                    dateUpdate = resetDate;
                }
                dBTrx.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }
            
            dataMXcamt056.setAppHdr(appHeader);
            
            dBTrx.addMXText(dataMXcamt056.message(mxConfiguration), returnId_headers);
            
            dBTrx.addDataMXTag(returnId_headers, ((MxCamt05600108) abstractMX).toJson(), saaHeader);
        } else if (abstractMX.getMxId().id().toLowerCase().contains("camt.107")) {
            appHeader.setMsgDefIdr("camt.107.001.01");
            
            MxCamt10700101 dataMXcamt107 = (MxCamt10700101) abstractMX;
            
            if (dataMXcamt107.getChqPresntmntNtfctn().getChq().get(0).getInstrId() != null) {
                appHeader.setBizMsgIdr(dataMXcamt107.getChqPresntmntNtfctn().getChq().get(0).getInstrId());
            } else {
                String seq;
                String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                String seqDB = dBTrx.getSeq();
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
                String bulan = tglToday.substring(5, 7);
                String hari = tglToday.substring(8, 10);
                if (date1.compareTo(date2) > 0 || date1.compareTo(date2) == 0) {
                    tahun = tahun + 1;
                    dateUpdate = String.valueOf(tahun) + "-01-01";
                    seq = "000";
                } else {
                    dateUpdate = resetDate;
                }
                dBTrx.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }
            
            dataMXcamt107.setAppHdr(appHeader);
            
            dBTrx.addMXText(dataMXcamt107.message(mxConfiguration), returnId_headers);
            
            dBTrx.addDataMXTag(returnId_headers, ((MxCamt10700101) abstractMX).toJson(), saaHeader);
        } else if (abstractMX.getMxId().id().toLowerCase().contains("camt.108")) {
            appHeader.setMsgDefIdr("camt.108.001.01");
            
            MxCamt10800101 dataMXcamt108 = (MxCamt10800101) abstractMX;
            
            if (dataMXcamt108.getChqCxlOrStopReq().getGrpHdr().getMsgId() != null) {
                appHeader.setBizMsgIdr(dataMXcamt108.getChqCxlOrStopReq().getGrpHdr().getMsgId());
            } else {
                String seq;
                String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                String seqDB = dBTrx.getSeq();
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
                String bulan = tglToday.substring(5, 7);
                String hari = tglToday.substring(8, 10);
                if (date1.compareTo(date2) > 0 || date1.compareTo(date2) == 0) {
                    tahun = tahun + 1;
                    dateUpdate = String.valueOf(tahun) + "-01-01";
                    seq = "000";
                } else {
                    dateUpdate = resetDate;
                }
                dBTrx.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }
            
            dataMXcamt108.setAppHdr(appHeader);
            
            dBTrx.addMXText(dataMXcamt108.message(mxConfiguration), returnId_headers);
            
            dBTrx.addDataMXTag(returnId_headers, ((MxCamt10800101) abstractMX).toJson(), saaHeader);
        }
        
        dbConn.closeConnection();
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
        } catch (ParseException ex) {
            java.util.logging.Logger.getLogger(SCDataTransaksiOutgoingPlainMX.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SCDataTransaksiOutgoingPlainMX.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(SCDataTransaksiOutgoingPlainMX.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            java.util.logging.Logger.getLogger(SCDataTransaksiOutgoingPlainMX.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SCDataTransaksiOutgoingPlainMX.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(SCDataTransaksiOutgoingPlainMX.class.getName()).log(Level.SEVERE, null, ex);
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
