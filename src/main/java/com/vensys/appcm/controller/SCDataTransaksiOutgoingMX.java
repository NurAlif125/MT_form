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
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import com.vensys.appcm.model.DataHeaderTransaksi;
import com.vensys.appcm.model.Header;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
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
        DBDataTransaksiOutgoing dBTrx = new DBDataTransaksiOutgoing(dbConn.getConnection());
        
        String idHeaders = request.getParameter("id");
        
        Header headers = dBTrx.getHeaderById(idHeaders);
        String flag = headers.getFlag();
        String receiverAddress = request.getParameter("receiver_institution");
        String logicalTerminal = request.getParameter("sender_logical_terminal");
        
        String dataXml = request.getParameter("dataXML");
        
        MxWriteConfiguration mxConfiguration = new MxWriteConfiguration();
        mxConfiguration.documentPrefix = null;
        mxConfiguration.headerPrefix = null;
        
        AbstractMX abstractMX = AbstractMX.parse(dataXml);
        String saaHeader = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>  <Saa:DataPDU xmlns:Saa=\"urn:swift:saa:xsd:saa.2.0\" xmlns:Sw=\"urn:swift:snl:ns.Sw\" xmlns:SwGbl=\"urn:swift:snl:ns.SwGbl\" xmlns:SwInt=\"urn:swift:snl:ns.SwInt\" xmlns:SwSec=\"urn:swift:snl:ns.SwSec\">   <Saa:Revision>2.0.13</Saa:Revision>   <Saa:Header></Saa:Header>   <Saa:Body>ONLY-SAA-HEADERS</Saa:Body></Saa:DataPDU>  ";
        
        BusinessAppHdrV02 appHeader;
        
        if (abstractMX.getMxId().id().toLowerCase().contains("pacs.004")) {
            if (flag.equalsIgnoreCase("MOD")) {
                
                String newFlag = "VER";
                
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
                    appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
                }
                
                dataMXpacs004.setAppHdr(appHeader);
                String newXML = dataMXpacs004.message(mxConfiguration);
                dBTrx.updateMXText(newXML, headers.getId_headers());
                
                String newJson = dataMXpacs004.toJson();
                dBTrx.updateTagsMXText(newJson, headers.getId_headers());
                
                int doUpdate = dBTrx.updateFlagMX(receiverAddress, newFlag, "MOD", Integer.parseInt(idHeaders),
                        (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            }
        } else if (abstractMX.getMxId().id().toLowerCase().contains("pacs.008")) {
            if (flag.equalsIgnoreCase("MOD")) {
                String newFlag = "VER";
                
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
                    appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
                }
                
                dataMXpacs008.setAppHdr(appHeader);
                String newXML = dataMXpacs008.message(mxConfiguration);
                dBTrx.updateMXText(newXML, headers.getId_headers());
                
                String newJson = dataMXpacs008.toJson();
                dBTrx.updateTagsMXText(newJson, headers.getId_headers());
                
                int doUpdate = dBTrx.updateFlagMX(receiverAddress, newFlag, "MOD", Integer.parseInt(idHeaders),
                        (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            }
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
