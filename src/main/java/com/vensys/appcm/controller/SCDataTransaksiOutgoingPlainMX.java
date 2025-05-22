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
import com.vensys.appcm.rulePacs.rulePacs008;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.Properties;
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
        DBconnection2 dbConn2 = new DBconnection2();
        DBDataTransaksiOutgoing dBTrx = new DBDataTransaksiOutgoing(dbConn.getConnection());
        DBDataTransaksiOutgoing dBTrx2 = new DBDataTransaksiOutgoing(dbConn2.getConnection2());

        String receiverAddress = request.getParameter("receiver_institution");
        String logicalTerminal = request.getParameter("sender_logical_terminal");
        String messType = request.getParameter("messageType");

        log.info("The receiver address : " + receiverAddress);
        log.info("The logical terminal : " + logicalTerminal);

        String dataXml = request.getParameter("dataXML");

        DataHeaderTransaksi data = new DataHeaderTransaksi();
        Header datas = new Header();

        AbstractMX abstractMX = AbstractMX.parse(dataXml);
        data.setNetworkType("MX");
        if (messType.equalsIgnoreCase("pacs00900108cov")) {
            data.setMessageType("pacs.009.001.08COV");
        } else if (messType.equalsIgnoreCase("pacs00900108adv")) {
            data.setMessageType("pacs.009.001.08ADV");
        } else {
            data.setMessageType(abstractMX.getMxId().toString());
        }
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
        data.setFlag("VER");
//        data.setBlock3(UUID.randomUUID().toString());
        String returnId_headers = dBTrx.addDataTransaksiOutgoing(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), (String) session.getAttribute("channel"));

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

        if (messType.contains("cov")) {
            appHeader.setBizSvc(getBizSvcCov());
        } else if (messType.contains("adv")) {
            appHeader.setBizSvc(getBizSvcAdv());
        } else {
            appHeader.setBizSvc(getBizSvc());
        }

        appHeader.setCreationDate(true);

        if (abstractMX.getMxId().id().toLowerCase().contains("pacs.004")) {
            log.info("ini " + abstractMX.getMxId().id());
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
                dBTrx2.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }

            dataMXpacs004.setAppHdr(appHeader);

            dBTrx2.addMXText(dataMXpacs004.message(mxConfiguration), returnId_headers);

            dBTrx2.addDataMXTag(returnId_headers, ((MxPacs00400109) abstractMX).toJson(), saaHeader);
            
            datas.setLogicalTerminal(logicalTerminal);
            datas.setReceiverAddress(receiverAddress);
            datas.setTrans_refference(dataMXpacs004.getPmtRtr().getTxInf().get(0).getRtrId());
            datas.setTrans_related_refference(dataMXpacs004.getPmtRtr().getTxInf().get(0).getOrgnlInstrId());
            datas.setTrans_date_value(dataMXpacs004.getPmtRtr().getTxInf().get(0).getIntrBkSttlmDt().getYear() + "-" + dataMXpacs004.getPmtRtr().getTxInf().get(0).getIntrBkSttlmDt().getMonthValue() + "-" + dataMXpacs004.getPmtRtr().getTxInf().get(0).getIntrBkSttlmDt().getDayOfMonth());
            datas.setTrans_amount(dataMXpacs004.getPmtRtr().getTxInf().get(0).getRtrdIntrBkSttlmAmt().getValue().toString().replace(",", "."));
            datas.setTrans_ccy(dataMXpacs004.getPmtRtr().getTxInf().get(0).getRtrdIntrBkSttlmAmt().getCcy());
            datas.setMessageType(abstractMX.getMxId().toString());
            
            List<Integer> idDupe = dBTrx.cekDuplikatID(datas);
            int lengthIdDupe = idDupe.size();
            log.info("panjang dupe nya.... " + lengthIdDupe);
            if (lengthIdDupe > 1) {
                log.info("246 masuk if");
                for (int ld = 1; ld < lengthIdDupe; ld++) {
                    dBTrx2.updateDuplikat(idDupe.get(ld));
                    log.info("sini 249");
                }
                log.info("masuk if 270");
            }
        } else if (abstractMX.getMxId().id().toLowerCase().contains("pacs.008")) {
            log.info("ini " + abstractMX.getMxId().id());
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
                dBTrx2.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }

            dataMXpacs008.setAppHdr(appHeader);

            dBTrx2.addMXText(dataMXpacs008.message(mxConfiguration), returnId_headers);

            dBTrx2.addDataMXTag(returnId_headers, ((MxPacs00800108) abstractMX).toJson(), saaHeader);
            
            datas.setLogicalTerminal(logicalTerminal);
            datas.setReceiverAddress(receiverAddress);
            datas.setTrans_refference(dataMXpacs008.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId());
            datas.setTrans_related_refference(dataMXpacs008.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getEndToEndId());
            datas.setTrans_date_value(dataMXpacs008.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmDt().getYear() + "-" + dataMXpacs008.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmDt().getMonthValue() + "-" + dataMXpacs008.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmDt().getDayOfMonth());
            datas.setTrans_amount(dataMXpacs008.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmAmt().getValue().toString().replace(",", "."));
            datas.setTrans_ccy(dataMXpacs008.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmAmt().getCcy());
            datas.setMessageType(data.getMessageType());
            
            List<Integer> idDupe = dBTrx.cekDuplikatID(datas);
            int lengthIdDupe = idDupe.size();
            log.info("panjang dupe nya.... " + lengthIdDupe);
            if (lengthIdDupe > 1) {
                log.info("246 masuk if");
                for (int ld = 1; ld < lengthIdDupe; ld++) {
                    dBTrx2.updateDuplikat(idDupe.get(ld));
                    log.info("sini 249");
                }
                log.info("masuk if 270");
            }
        } else if (abstractMX.getMxId().id().toLowerCase().contains("pacs.009")) {
            log.info("ini " + abstractMX.getMxId().id());
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
                dBTrx2.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }

            dataMXpacs009.setAppHdr(appHeader);

            dBTrx2.addMXText(dataMXpacs009.message(mxConfiguration), returnId_headers);

            dBTrx2.addDataMXTag(returnId_headers, ((MxPacs00900108) abstractMX).toJson(), saaHeader);
            
            datas.setLogicalTerminal(logicalTerminal);
            datas.setReceiverAddress(receiverAddress);
            datas.setTrans_refference(dataMXpacs009.getFICdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId());
            datas.setTrans_related_refference(dataMXpacs009.getFICdtTrf().getCdtTrfTxInf().get(0).getPmtId().getEndToEndId());
            datas.setTrans_date_value(dataMXpacs009.getFICdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmDt().getYear() + "-" + dataMXpacs009.getFICdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmDt().getMonthValue() + "-" + dataMXpacs009.getFICdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmDt().getDayOfMonth());
            datas.setTrans_amount(dataMXpacs009.getFICdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmAmt().getValue().toString().replace(",", "."));
            datas.setTrans_ccy(dataMXpacs009.getFICdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmAmt().getCcy());
            datas.setMessageType(data.getMessageType());
            
            List<Integer> idDupe = dBTrx.cekDuplikatID(datas);
            int lengthIdDupe = idDupe.size();
            log.info("panjang dupe nya.... " + lengthIdDupe);
            if (lengthIdDupe > 1) {
                log.info("246 masuk if");
                for (int ld = 1; ld < lengthIdDupe; ld++) {
                    dBTrx2.updateDuplikat(idDupe.get(ld));
                    log.info("sini 249");
                }
                log.info("masuk if 270");
            }
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
                dBTrx2.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }

            dataMXcamt053.setAppHdr(appHeader);

            dBTrx2.addMXText(dataMXcamt053.message(mxConfiguration), returnId_headers);

            dBTrx2.addDataMXTag(returnId_headers, ((MxCamt05300108) abstractMX).toJson(), saaHeader);
            List<Integer> idDupe = dBTrx.cekDuplikatID(datas);
            int lengthIdDupe = idDupe.size();
            log.info("panjang dupe nya.... " + lengthIdDupe);
            if (lengthIdDupe > 1) {
                log.info("246 masuk if");
                for (int ld = 1; ld < lengthIdDupe; ld++) {
                    dBTrx2.updateDuplikat(idDupe.get(ld));
                    log.info("sini 249");
                }
                log.info("masuk if 270");
            }
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
                dBTrx2.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }

            dataMXcamt055.setAppHdr(appHeader);

            dBTrx2.addMXText(dataMXcamt055.message(mxConfiguration), returnId_headers);

            dBTrx2.addDataMXTag(returnId_headers, ((MxCamt05500108) abstractMX).toJson(), saaHeader);
            List<Integer> idDupe = dBTrx.cekDuplikatID(datas);
            int lengthIdDupe = idDupe.size();
            log.info("panjang dupe nya.... " + lengthIdDupe);
            if (lengthIdDupe > 1) {
                log.info("246 masuk if");
                for (int ld = 1; ld < lengthIdDupe; ld++) {
                    dBTrx2.updateDuplikat(idDupe.get(ld));
                    log.info("sini 249");
                }
                log.info("masuk if 270");
            }
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
                dBTrx2.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }

            dataMXcamt056.setAppHdr(appHeader);

            dBTrx2.addMXText(dataMXcamt056.message(mxConfiguration), returnId_headers);

            dBTrx2.addDataMXTag(returnId_headers, ((MxCamt05600108) abstractMX).toJson(), saaHeader);
            List<Integer> idDupe = dBTrx.cekDuplikatID(datas);
            int lengthIdDupe = idDupe.size();
            log.info("panjang dupe nya.... " + lengthIdDupe);
            if (lengthIdDupe > 1) {
                log.info("246 masuk if");
                for (int ld = 1; ld < lengthIdDupe; ld++) {
                    dBTrx2.updateDuplikat(idDupe.get(ld));
                    log.info("sini 249");
                }
                log.info("masuk if 270");
            }
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
                dBTrx2.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }

            dataMXcamt107.setAppHdr(appHeader);

            dBTrx2.addMXText(dataMXcamt107.message(mxConfiguration), returnId_headers);

            dBTrx2.addDataMXTag(returnId_headers, ((MxCamt10700101) abstractMX).toJson(), saaHeader);
            List<Integer> idDupe = dBTrx.cekDuplikatID(datas);
            int lengthIdDupe = idDupe.size();
            log.info("panjang dupe nya.... " + lengthIdDupe);
            if (lengthIdDupe > 1) {
                log.info("246 masuk if");
                for (int ld = 1; ld < lengthIdDupe; ld++) {
                    dBTrx2.updateDuplikat(idDupe.get(ld));
                    log.info("sini 249");
                }
                log.info("masuk if 270");
            }
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
                dBTrx2.updateSequence(dateUpdate, seq);
                appHeader.setBizMsgIdr("BDIN" + tahun + bulan + hari + seq);
            }

            dataMXcamt108.setAppHdr(appHeader);

            dBTrx2.addMXText(dataMXcamt108.message(mxConfiguration), returnId_headers);

            dBTrx2.addDataMXTag(returnId_headers, ((MxCamt10800101) abstractMX).toJson(), saaHeader);
            List<Integer> idDupe = dBTrx.cekDuplikatID(datas);
            int lengthIdDupe = idDupe.size();
            log.info("panjang dupe nya.... " + lengthIdDupe);
            if (lengthIdDupe > 1) {
                log.info("246 masuk if");
                for (int ld = 1; ld < lengthIdDupe; ld++) {
                    dBTrx2.updateDuplikat(idDupe.get(ld));
                    log.info("sini 249");
                }
                log.info("masuk if 270");
            }
        }

        dbConn.closeConnection();
        dbConn2.closeConnection2();
        String pagingHistory = HistoryPaging.getPagingHistory(request, response);
        response.sendRedirect("controllerHeaders?" + pagingHistory);
    }

    public String getBizSvc() throws IOException {
        log.info("getBizSvc");
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("bizSvc");
    }

    public String getBizSvcCov() throws IOException {
        log.info("getBizSvcCov");
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("bizSvcCov");
    }

    public String getBizSvcAdv() throws IOException {
        log.info("getBizSvcAdv");
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("bizSvcAdv");
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
