/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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
import com.prowidesoftware.swift.model.mx.dic.BranchAndFinancialInstitutionIdentification;
import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import com.vensys.appcm.model.DataHeaderTransaksi;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.myutils.HistoryPaging;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.Properties;
import org.apache.log4j.Logger;

/**
 *
 * @author rafli
 */
@WebServlet(name = "SCDataTransaksiOutgoingMX", urlPatterns = {"/SCDataTransaksiOutgoingMX"})
public class SCDataTransaksiOutgoingMX extends HttpServlet {
    
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
        DBconnection2 dbConn2 = new DBconnection2();
        DBDataTransaksiOutgoing dBTrx = new DBDataTransaksiOutgoing(dbConn.getConnection());
        DBDataTransaksiOutgoing dBTrx2 = new DBDataTransaksiOutgoing(dbConn2.getConnection2());
        
        String idHeaders = request.getParameter("id");
        
        Header headers = dBTrx.getHeaderById(idHeaders);
        String flag = headers.getFlag();
        String receiverAddress = request.getParameter("receiver_institution");
        String logicalTerminal = request.getParameter("sender_logical_terminal");
        String dnSender = "ou=" + logicalTerminal.substring(9, 12).toLowerCase() + ",o=" + logicalTerminal.substring(0, 8).toLowerCase() + ",o=swift";
        String dnReceiver = "ou=" + receiverAddress.substring(9, 12).toLowerCase() + ",o=" + receiverAddress.substring(0, 8).toLowerCase() + ",o=swift";
        String service = getService();
        String priority = request.getParameter("priority");
        String headerPriority = "";

        if (priority.equalsIgnoreCase("N")) {
            priority = "NORM";
        } else if (priority.equalsIgnoreCase("U")) {
            priority = "HIGH";
        }
        
        if (priority.equalsIgnoreCase("NORM")) {
            headerPriority = "Normal";
        } else if (priority.equalsIgnoreCase("HIGH")) {
            headerPriority = "Urgent";
        }
        
        String dataXml = request.getParameter("dataXML");
        
        MxWriteConfiguration mxConfiguration = new MxWriteConfiguration();
        mxConfiguration.documentPrefix = null;
        mxConfiguration.headerPrefix = null;
        
        AbstractMX abstractMX = AbstractMX.parse(dataXml);
        String reference = "";
        if (abstractMX.getMxId().id().toLowerCase().contains("pacs.008") || abstractMX.getMxId().id().toLowerCase().contains("pacs.009")) {
            reference = request.getParameter("instrId") + headers.getBlock3().replace("121:", "").replace(";", "");
        } else if (abstractMX.getMxId().id().toLowerCase().contains("pacs.004")) {
            reference = "Reference: " + request.getParameter("rtrId");
        }
        String saaHeader = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><DataPDU xmlns=\"urn:swift:saa:xsd:saa.2.0\"><Revision>2.0.13</Revision><Header>THIS-IS-SAA-HEADER</Header><Body>ONLY-SAA-HEADERS</Body></DataPDU>";
        
        BusinessAppHdrV02 appHeader;
        
        if (abstractMX.getMxId().id().toLowerCase().contains("pacs.004")) {
            log.info("process pacs.004");
            if (flag.equalsIgnoreCase("MOD") || flag.equalsIgnoreCase("CVT-MOD")) {
                String newFlag = "";
                if (flag.equalsIgnoreCase("MOD")) {
                    newFlag = "VER";
                } else if (flag.equalsIgnoreCase("CVT-MOD")) {
                    newFlag = "CVT-VER";
                }
                
                MxPacs00400109 dataMXpacs004 = (MxPacs00400109) abstractMX;
                
                String json = dBTrx.getTagsMX(Integer.parseInt(idHeaders));
                
                MxPacs00400109 dataOld = MxPacs00400109.fromJson(json);
                
                appHeader = (BusinessAppHdrV02) dataOld.getAppHdr();
                appHeader.setFr(new Party44Choice());
                appHeader.getFr().setFIId(new BranchAndFinancialInstitutionIdentification6());
                appHeader.getFr().getFIId().setFinInstnId(new FinancialInstitutionIdentification18());
                appHeader.getFr().getFIId().getFinInstnId().setBICFI(logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12));
                
                appHeader.setTo(new Party44Choice());
                appHeader.getTo().setFIId(new BranchAndFinancialInstitutionIdentification6());
                appHeader.getTo().getFIId().setFinInstnId(new FinancialInstitutionIdentification18());
                appHeader.getTo().getFIId().getFinInstnId().setBICFI(receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12));
                
                if (dataMXpacs004.getPmtRtr().getTxInf().get(0).getRtrId() != null) {
                    appHeader.setBizMsgIdr(dataMXpacs004.getPmtRtr().getTxInf().get(0).getRtrId());
                } else {
                    String seq;
                    String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                    String seqDB = dBTrx.getSeq();
                    String[] arSeq = seqDB.split("#");
                    seq = arSeq[0].trim();
                    int seqInt = Integer.parseInt(seq);
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
                    dBTrx2.updateSequence(dateUpdate, seq);
                    appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
                }
                
                dataMXpacs004.setAppHdr(appHeader);
                String newXML = dataMXpacs004.message(mxConfiguration);
                dBTrx2.updateMXText(newXML, Integer.parseInt(idHeaders));
                
                String headerSaa = "<Message><SenderReference>I" + logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12) + "." + idHeaders + "</SenderReference><MessageIdentifier>" + appHeader.getMsgDefIdr() + "</MessageIdentifier><Format>MX</Format><SubFormat>Input</SubFormat><Sender><DN>" + dnSender + "</DN><FullName><X1>" + logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12) + "</X1></FullName></Sender><Receiver><DN>" + dnReceiver + "</DN><FullName><X1>" + receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12) + "</X1></FullName></Receiver><InterfaceInfo><UserReference>" + appHeader.getBizMsgIdr() + "</UserReference></InterfaceInfo><NetworkInfo><Priority>" + headerPriority + "</Priority><Service>" + service + "</Service><SWIFTNetNetworkInfo><RequestType>" + appHeader.getMsgDefIdr() + "</RequestType><RequestSubtype>" + appHeader.getBizSvc() + "</RequestSubtype></SWIFTNetNetworkInfo></NetworkInfo></Message>";
                saaHeader = saaHeader.replace("THIS-IS-SAA-HEADER", headerSaa);
                
                String newJson = dataMXpacs004.toJson();
                dBTrx2.updateTagsMXText(newJson, saaHeader, Integer.parseInt(idHeaders));
                
                if(flag.equalsIgnoreCase("MOD")) {
                    int doUpdate = dBTrx.updateFlagMX(logicalTerminal, receiverAddress, newFlag, "MOD", Integer.parseInt(idHeaders),
                        (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), reference);
                } else if (flag.equalsIgnoreCase("CVT-MOD")) {
                    int doUpdate = dBTrx.updateFlagMX(logicalTerminal, receiverAddress, newFlag, "CVT-MOD", Integer.parseInt(idHeaders),
                        (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), reference);
                }
                
            }
        } else if (abstractMX.getMxId().id().toLowerCase().contains("pacs.008")) {
            log.info("process pacs.008");
            if (flag.equalsIgnoreCase("MOD") || flag.equalsIgnoreCase("CVT-MOD")) {
                String newFlag = "";
                if (flag.equalsIgnoreCase("MOD")) {
                    newFlag = "VER";
                } else if (flag.equalsIgnoreCase("CVT-MOD")) {
                    newFlag = "CVT-VER";
                }
                
                MxPacs00800108 dataMXpacs008 = (MxPacs00800108) abstractMX;
                
                String json = dBTrx.getTagsMX(Integer.parseInt(idHeaders));
                
                MxPacs00800108 dataOld = MxPacs00800108.fromJson(json);
                
                appHeader = (BusinessAppHdrV02) dataOld.getAppHdr();
                appHeader.setFr(new Party44Choice());
                appHeader.getFr().setFIId(new BranchAndFinancialInstitutionIdentification6());
                appHeader.getFr().getFIId().setFinInstnId(new FinancialInstitutionIdentification18());
                appHeader.getFr().getFIId().getFinInstnId().setBICFI(logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12));
                
                appHeader.setTo(new Party44Choice());
                appHeader.getTo().setFIId(new BranchAndFinancialInstitutionIdentification6());
                appHeader.getTo().getFIId().setFinInstnId(new FinancialInstitutionIdentification18());
                appHeader.getTo().getFIId().getFinInstnId().setBICFI(receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12));
                
                if (dataMXpacs008.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId() != null) {
                    appHeader.setBizMsgIdr(dataMXpacs008.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId());
                } else {
                    String seq;
                    String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                    String seqDB = dBTrx.getSeq();
                    String[] arSeq = seqDB.split("#");
                    seq = arSeq[0].trim();
                    int seqInt = Integer.parseInt(seq);
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
                    dBTrx2.updateSequence(dateUpdate, seq);
                    appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
                }
                
                dataMXpacs008.setAppHdr(appHeader);
                String newXML = dataMXpacs008.message(mxConfiguration);
                dBTrx2.updateMXText(newXML, Integer.parseInt(idHeaders));
                
                String headerSaa = "<Message><SenderReference>I" + logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12) + "." + idHeaders + "</SenderReference><MessageIdentifier>" + appHeader.getMsgDefIdr() + "</MessageIdentifier><Format>MX</Format><SubFormat>Input</SubFormat><Sender><DN>" + dnSender + "</DN><FullName><X1>" + logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12) + "</X1></FullName></Sender><Receiver><DN>" + dnReceiver + "</DN><FullName><X1>" + receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12) + "</X1></FullName></Receiver><InterfaceInfo><UserReference>" + appHeader.getBizMsgIdr() + "</UserReference></InterfaceInfo><NetworkInfo><Priority>" + headerPriority + "</Priority><Service>" + service + "</Service><SWIFTNetNetworkInfo><RequestType>" + appHeader.getMsgDefIdr() + "</RequestType><RequestSubtype>" + appHeader.getBizSvc() + "</RequestSubtype></SWIFTNetNetworkInfo></NetworkInfo></Message>";
                saaHeader = saaHeader.replace("THIS-IS-SAA-HEADER", headerSaa);
                
                String newJson = dataMXpacs008.toJson();
                dBTrx2.updateTagsMXText(newJson, saaHeader, Integer.parseInt(idHeaders));
                
                if(flag.equalsIgnoreCase("MOD")) {
                    int doUpdate = dBTrx.updateFlagMX(logicalTerminal, receiverAddress, newFlag, "MOD", Integer.parseInt(idHeaders),
                        (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), reference);
                } else if (flag.equalsIgnoreCase("CVT-MOD")) {
                    int doUpdate = dBTrx.updateFlagMX(logicalTerminal, receiverAddress, newFlag, "CVT-MOD", Integer.parseInt(idHeaders),
                        (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), reference);
                }
                
            }
        } else if (abstractMX.getMxId().id().toLowerCase().contains("pacs.009")) {
            log.info("process pacs.009");
            if (flag.equalsIgnoreCase("MOD") || flag.equalsIgnoreCase("CVT-MOD")) {
                String newFlag = "";
                if (flag.equalsIgnoreCase("MOD")) {
                    newFlag = "VER";
                } else if (flag.equalsIgnoreCase("CVT-MOD")) {
                    newFlag = "CVT-VER";
                }
                
                MxPacs00900108 dataMXpacs009 = (MxPacs00900108) abstractMX;
                
                String json = dBTrx.getTagsMX(Integer.parseInt(idHeaders));
                
                MxPacs00900108 dataOld = MxPacs00900108.fromJson(json);
                
                appHeader = (BusinessAppHdrV02) dataOld.getAppHdr();
                appHeader.setFr(new Party44Choice());
                appHeader.getFr().setFIId(new BranchAndFinancialInstitutionIdentification6());
                appHeader.getFr().getFIId().setFinInstnId(new FinancialInstitutionIdentification18());
                appHeader.getFr().getFIId().getFinInstnId().setBICFI(logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12));
                
                appHeader.setTo(new Party44Choice());
                appHeader.getTo().setFIId(new BranchAndFinancialInstitutionIdentification6());
                appHeader.getTo().getFIId().setFinInstnId(new FinancialInstitutionIdentification18());
                appHeader.getTo().getFIId().getFinInstnId().setBICFI(receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12));
                
                if (dataMXpacs009.getFICdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId() != null) {
                    appHeader.setBizMsgIdr(dataMXpacs009.getFICdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId());
                } else {
                    String seq;
                    String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                    String seqDB = dBTrx.getSeq();
                    String[] arSeq = seqDB.split("#");
                    seq = arSeq[0].trim();
                    int seqInt = Integer.parseInt(seq);
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
                    dBTrx2.updateSequence(dateUpdate, seq);
                    appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
                }
                
                dataMXpacs009.setAppHdr(appHeader);
                String newXML = dataMXpacs009.message(mxConfiguration);
                dBTrx2.updateMXText(newXML, Integer.parseInt(idHeaders));
                
                String headerSaa = "<Message><SenderReference>I" + logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12) + "." + idHeaders + "</SenderReference><MessageIdentifier>" + appHeader.getMsgDefIdr() + "</MessageIdentifier><Format>MX</Format><SubFormat>Input</SubFormat><Sender><DN>" + dnSender + "</DN><FullName><X1>" + logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12) + "</X1></FullName></Sender><Receiver><DN>" + dnReceiver + "</DN><FullName><X1>" + receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12) + "</X1></FullName></Receiver><InterfaceInfo><UserReference>" + appHeader.getBizMsgIdr() + "</UserReference></InterfaceInfo><NetworkInfo><Priority>" + headerPriority + "</Priority><Service>" + service + "</Service><SWIFTNetNetworkInfo><RequestType>" + appHeader.getMsgDefIdr() + "</RequestType><RequestSubtype>" + appHeader.getBizSvc() + "</RequestSubtype></SWIFTNetNetworkInfo></NetworkInfo></Message>";
                saaHeader = saaHeader.replace("THIS-IS-SAA-HEADER", headerSaa);
                
                String newJson = dataMXpacs009.toJson();
                dBTrx2.updateTagsMXText(newJson, saaHeader, Integer.parseInt(idHeaders));
                
                if(flag.equalsIgnoreCase("MOD")) {
                    int doUpdate = dBTrx.updateFlagMX(logicalTerminal, receiverAddress, newFlag, "MOD", Integer.parseInt(idHeaders),
                        (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), reference);
                } else if (flag.equalsIgnoreCase("CVT-MOD")) {
                    int doUpdate = dBTrx.updateFlagMX(logicalTerminal, receiverAddress, newFlag, "CVT-MOD", Integer.parseInt(idHeaders),
                        (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), reference);
                }
                
            }
        } else if (abstractMX.getMxId().id().toLowerCase().contains("camt.053")) {
            log.info("process camt.053");
            if (flag.equalsIgnoreCase("MOD") || flag.equalsIgnoreCase("CVT-MOD")) {
                String newFlag = "";
                if (flag.equalsIgnoreCase("MOD")) {
                    newFlag = "VER";
                } else if (flag.equalsIgnoreCase("CVT-MOD")) {
                    newFlag = "CVT-VER";
                }
                
                MxCamt05300108 dataMXcamt053 = (MxCamt05300108) abstractMX;
                
                String json = dBTrx.getTagsMX(Integer.parseInt(idHeaders));
                
                MxCamt05300108 dataOld = MxCamt05300108.fromJson(json);
                
                appHeader = (BusinessAppHdrV02) dataOld.getAppHdr();
                appHeader.setFr(new Party44Choice());
                appHeader.getFr().setFIId(new BranchAndFinancialInstitutionIdentification6());
                appHeader.getFr().getFIId().setFinInstnId(new FinancialInstitutionIdentification18());
                appHeader.getFr().getFIId().getFinInstnId().setBICFI(logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12));
                
                appHeader.setTo(new Party44Choice());
                appHeader.getTo().setFIId(new BranchAndFinancialInstitutionIdentification6());
                appHeader.getTo().getFIId().setFinInstnId(new FinancialInstitutionIdentification18());
                appHeader.getTo().getFIId().getFinInstnId().setBICFI(receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12));
                
                if (dataMXcamt053.getBkToCstmrStmt().getStmt().get(0).getId() != null) {
                    appHeader.setBizMsgIdr(dataMXcamt053.getBkToCstmrStmt().getStmt().get(0).getId());
                } else {
                    String seq;
                    String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                    String seqDB = dBTrx.getSeq();
                    String[] arSeq = seqDB.split("#");
                    seq = arSeq[0].trim();
                    int seqInt = Integer.parseInt(seq);
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
                    dBTrx2.updateSequence(dateUpdate, seq);
                    appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
                }
                
                dataMXcamt053.setAppHdr(appHeader);
                String newXML = dataMXcamt053.message(mxConfiguration);
                dBTrx2.updateMXText(newXML, Integer.parseInt(idHeaders));
                
                String headerSaa = "<Message><SenderReference>I" + logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12) + "." + idHeaders + "</SenderReference><MessageIdentifier>" + appHeader.getMsgDefIdr() + "</MessageIdentifier><Format>MX</Format><SubFormat>Input</SubFormat><Sender><DN>" + dnSender + "</DN><FullName><X1>" + logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12) + "</X1></FullName></Sender><Receiver><DN>" + dnReceiver + "</DN><FullName><X1>" + receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12) + "</X1></FullName></Receiver><InterfaceInfo><UserReference>" + appHeader.getBizMsgIdr() + "</UserReference></InterfaceInfo><NetworkInfo><Priority>" + headerPriority + "</Priority><Service>" + service + "</Service><SWIFTNetNetworkInfo><RequestType>" + appHeader.getMsgDefIdr() + "</RequestType><RequestSubtype>" + appHeader.getBizSvc() + "</RequestSubtype></SWIFTNetNetworkInfo></NetworkInfo></Message>";
                saaHeader = saaHeader.replace("THIS-IS-SAA-HEADER", headerSaa);
                
                String newJson = dataMXcamt053.toJson();
                dBTrx2.updateTagsMXText(newJson, saaHeader, Integer.parseInt(idHeaders));
                
                if(flag.equalsIgnoreCase("MOD")) {
                    int doUpdate = dBTrx.updateFlagMX(logicalTerminal, receiverAddress, newFlag, "MOD", Integer.parseInt(idHeaders),
                        (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), reference);
                } else if (flag.equalsIgnoreCase("CVT-MOD")) {
                    int doUpdate = dBTrx.updateFlagMX(logicalTerminal, receiverAddress, newFlag, "CVT-MOD", Integer.parseInt(idHeaders),
                        (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), reference);
                }
                
            }
        }
        
        
        dbConn.closeConnection();
        dbConn2.closeConnection2();
        String pagingHistory = HistoryPaging.getPagingHistory(request, response);
        response.sendRedirect("controllerHeaders?" + pagingHistory);
    }
    
    public String getService() throws IOException {
        log.info("getService");
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("service");
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
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SCDataTransaksiOutgoingMX.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(SCDataTransaksiOutgoingMX.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SCDataTransaksiOutgoingMX.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(SCDataTransaksiOutgoingMX.class.getName()).log(Level.SEVERE, null, ex);
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
