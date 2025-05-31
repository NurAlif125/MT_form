package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.mt.mt1xx.MT103;
import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBMTRelationAndMatching;

import com.prowidesoftware.swift.model.field.Field50F;
import com.prowidesoftware.swift.model.field.Field50K;
import com.prowidesoftware.swift.model.mt.mt1xx.MT103;
import com.prowidesoftware.swift.model.mx.MxPacs00800108;
import com.prowidesoftware.swift.model.mx.dic.BranchAndFinancialInstitutionIdentification6;
import com.prowidesoftware.swift.model.mx.dic.PartyIdentification135;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.SQLSequance;
import java.io.IOException;
import java.sql.SQLException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.StringTokenizer;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataCharges;
import com.vensys.appcm.model.DataHeaderTransaksi;
import com.vensys.appcm.model.DataInvestigation;
import com.vensys.appcm.model.DataNostro;
import com.vensys.appcm.model.DataSequence;
import com.vensys.appcm.model.EssentialsFieldPacs0080108;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.TagDB;
import com.vensys.appcm.myutils.CostumerHelper;
import com.vensys.appcm.myutils.HistoryPaging;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;

//import org.apache.log4j.Logger;
/**
 *
 * @author M Abdul Hadi
 */
public class SCDataTransaksi199 extends HttpServlet {

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
            throws ServletException, IOException, SQLException, Exception {

//        log.info("SCDataTransaksiOutgoing-1");
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
        if (request.getParameter("flag").equalsIgnoreCase("INC-INV")) {
            // log.info("Investigate"); // 20190826
            Header header103 = dBDataTransaksiOutgoing.getHeaderById(id);
            dBDataTransaksiOutgoing.createReturTransaksiOutgoing(request.getParameter("flag"), Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            
            if (header103.getMessageType().equalsIgnoreCase("103")){
                // Create MT199 by MT
                log.info("Create MT199 Investigasi from MT103");
                createMT199ByMT(id,header103, dBDataTransaksiOutgoing, session, dbConn);
            }
            else if(header103.getMessageType().equalsIgnoreCase("pacs.008.001.08")) {
                // Create MT199 by MX
                log.info("Create MT199 Investgasi from Pacs.008.001.08");
                createMT199ByPacs0080108(id,header103, dBDataTransaksiOutgoing, session, dbConn);
            }
        } else if (request.getParameter("flag").equalsIgnoreCase("INC-STL")) {
            log.info("get confirmation kredit payment"); // 20190903
            dBDataTransaksiOutgoing.createReturTransaksiOutgoing(request.getParameter("flag"), Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            Header header103 = dBDataTransaksiOutgoing.getHeaderById(id);
            List<TagDB> tags103 = dBDataTransaksiOutgoing.getAllTagById(id);
            DataHeaderTransaksi header199 = new DataHeaderTransaksi();
            List<TagDB> tags199 = new ArrayList<TagDB>();
            header199.setSender_logical_terminal("MEGAIDJAXXXX");
            log.info("nSender_logical_terminal=" + header199.getSender_logical_terminal());
            header199.setMessageType("199");
            header199.setReceiver_institution("TRCKCHZZXXXX");
            log.info("nReceiver_institution=" + header199.getReceiver_institution());
            header199.setPriority("N");
            //20210128
            String blok3 = header103.getBlock3().substring(header103.getBlock3().indexOf("121:"));
            if (blok3.contains("433:")) {
                blok3 = blok3.replace(blok3.substring(blok3.indexOf("433:")), "");
            }
            //--------
//            header199.setBlock3(header103.getBlock3().substring(header103.getBlock3().indexOf("121:")));
            header199.setBlock3(blok3);
            //end

            dBDataTransaksiOutgoing.addDataTransaksiInvestigasi(header199, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            log.info("add data transaksi kredit payment");
            String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
//            String dataRtr = dBDataTransaksiOutgoing.getSeqRetur(tanggal_transaksi);
            String currDate = new SimpleDateFormat("yyMMdd").format(new Date());
//                    tag MT199
            String _010_mf20_sender_reference = "";
            String _011_of21_related_reference = "";
            String _012_mf79_narrative = "";
            String currency = "";
            String amount = "";
            String valueDate = "";
            String reason = header103.getKomentar();
//                    log.info("reason : "+reason);
            for (int i = 0; i < tags103.size(); i++) {
//                        _011_of21_related_reference
                if (tags103.get(i).getTagName().equalsIgnoreCase("_010_mf20_sender_reference")) {
                    _011_of21_related_reference = tags103.get(i).getDetail();
                } else if (tags103.get(i).getTagName().equalsIgnoreCase("_061_mf32a_currency")) {
                    currency = tags103.get(i).getDetail();
                } else if (tags103.get(i).getTagName().equalsIgnoreCase("_062_mf32a_amount")) {
                    amount = tags103.get(i).getDetail();
                } else if (tags103.get(i).getTagName().equalsIgnoreCase("_060_mf32a_date")) {
                    valueDate = tags103.get(i).getDetail();
                }
            }

            dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(id), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));

            TagDB tag199 = new TagDB();
//                    _010_mf20_sender_reference
            tag199.setUrutan(10);
            tag199.setTag("20");
//            tag199.setDetail("CNF" + currDate + "" + header103.getLogicalTerminal().substring(0, 4).toString() + "" + dataInv.getSeq_num());
            tag199.setDetail("CNF" + currDate + "" + header103.getLogicalTerminal().substring(0, 4));
            tag199.setTagName("_010_mf20_sender_reference");
            tags199.add(tag199);
//                    _011_mf21_
            tag199 = new TagDB();
            tag199.setUrutan(11);
            tag199.setTag("21");
            tag199.setDetail(_011_of21_related_reference);
            tag199.setTagName("_011_of21_related_reference");
            tags199.add(tag199);
//                    _060_mf32a_date
            tag199 = new TagDB();
            tag199.setUrutan(12);
            tag199.setTag("79");
            tag199.setDetail("//" + tgl_trx + "+0700\r\n"
                    + "//ACCC" + "\r\n"
                    + "//MEGAIDJA" + "\r\n"
                    + "//" + currency + amount);
            tag199.setTagName("_012_mf79_narrative");
            tags199.add(tag199);
            log.info("before add datatag investigasi");
            for (int i = 0; i < tags199.size(); i++) {
//                        log.info("before add datatag retur if");
                dBDataTransaksiOutgoing.addDataTag199(tags199.get(i).getUrutan(), tags199.get(i).getTag(), tags199.get(i).getDetail(), tags199.get(i).getTagName());
//                        log.info("after add datatag retur");
            }
            CreateText ct = new CreateText(dbConn.getConnection());
            log.info("create new MT");
            log.info("id header mt199: " + dBDataTransaksiOutgoing.id_headers());
            log.info("sebelum create final MT STL");
            dBDataTransaksiOutgoing.addMTText(ct.createFinalMT(ct.getHeaderById(dBDataTransaksiOutgoing.id_headers())), dBDataTransaksiOutgoing.id_headers());
            log.info("setelah create final MT STL");
            log.info("after add data tag confirmation kredit payment");
        } else if (request.getParameter("flag").equalsIgnoreCase("INC-WAIT") || request.getParameter("flag").equalsIgnoreCase("INC-RTR")) {
            System.out.println(request.getParameter("flag") + " PROCESS");
            int write = dBDataTransaksiOutgoing.checkWriteSession();
            int returnId_headers;//20220207 untuk nampung last id_headers
            if (true) {
//            if (write == 0) {
                dBDataTransaksiOutgoing.updateWriteSession(1);
                log.info("incoming retur"); // 20191105
                /**
                 * For now, the system (CM) will decide rather the response
                 * using ISO20022 or MT based on master data switchable features
                 */

//                Header header103 = dBDataTransaksiOutgoing.getHeaderById(id);
                // If true maka buat MX, jika flase maka buat MT
                if (messageType.toLowerCase().contains("103")) {
                    // INI MT103
                    createMT202orMT199ByMT(request, response, dBDataTransaksiOutgoing, dbConn);
                } else {
                    // Ini dari pacs008
                    createMT202orMT199ByMX(request, response, dBDataTransaksiOutgoing, dbConn);
                }

//                  dBDataTransaksiOutgoing.updateWriteSession(0);
//                  String pagingHistory = HistoryPaging.getPagingHistory(request, response);
//                  response.sendRedirect("controllerHeaders?" + pagingHistory);
            } else {
                dBDataTransaksiOutgoing.updateWriteSession(0);
                // log.info("session is used by reader");
            }
        }

        dbConn.closeConnection();
        // log.info("kadieuuuuuu....");
//        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("controllerHeaders");
        dispatcher.forward(request, response);

    }
    
    
    
    private void createMT199ByPacs0080108(String id,Header header103, DBDataTransaksiOutgoing dBDataTransaksiOutgoing, HttpSession session, DBconnection dbConn) throws SQLException, Exception{
        DataHeaderTransaksi header199 = new DataHeaderTransaksi();
        List<TagDB> tags199 = new ArrayList<TagDB>();
        header199.setSender_logical_terminal("MEGAIDJAXXXX");
        header199.setNetworkType("MT");
        String currDate = new SimpleDateFormat("yyMMdd").format(new Date());
        log.info("nSender_logical_terminal=" + header199.getSender_logical_terminal());
        header199.setMessageType("199");
        
        // ambil character ke 8, sisipkan x, ambil charater 3 terakhir
        String nReceiver_institution = header103.getReceiverAddress().substring(0, 8) + "X" + header103.getReceiverAddress().substring(8);
        header199.setReceiver_institution(nReceiver_institution);
        log.info("nReceiver_institution=" + header199.getReceiver_institution());
        header199.setPriority("N");
        
        // Tambahkan header dari pacs008
        header199.setBlock3("121:".concat(header103.getBlock3()).concat(";"));
        System.out.println("The Block 3 : "+header103.getBlock3());
        
        dBDataTransaksiOutgoing.addDataTransaksiInvestigasi(header199, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
        var seq = CostumerHelper.getTheLastSeqNew(dBDataTransaksiOutgoing);
        dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(id), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));

        
        // Untuk mneyimpan reff dari pacs.
        var essentialsFieldPacs0080108 = dBDataTransaksiOutgoing.getEssentialValuePacs00800108New(Integer.parseInt(id));
        var _011_of21_related_reference = essentialsFieldPacs0080108.instructionId();
        var currency = essentialsFieldPacs0080108.currency();
        var valueDate = essentialsFieldPacs0080108.valueDateMTFormat();
        var amount = essentialsFieldPacs0080108.amount();
        
        System.out.println("essentialsFieldPacs0080108 : "+essentialsFieldPacs0080108);
        System.out.println("_011_of21_related_reference : "+_011_of21_related_reference);
        System.out.println("currency : "+currency);
        System.out.println("valueDate : "+valueDate);
        System.out.println("amount : "+amount);
        
        
        
        TagDB tag199 = new TagDB();
//                    _010_mf20_sender_reference
        tag199.setUrutan(10);
        tag199.setTag("20");
        tag199.setDetail("INV" + currDate + header103.getLogicalTerminal().substring(0, 4) + seq);
        tag199.setTagName("_010_mf20_sender_reference");
        tags199.add(tag199);
//                    _011_mf21_
        tag199 = new TagDB();
        tag199.setUrutan(11);
        tag199.setTag("21");
        tag199.setDetail(_011_of21_related_reference);
        tag199.setTagName("_011_of21_related_reference");
        tags199.add(tag199);
//                    _060_mf32a_date
        tag199 = new TagDB();
        tag199.setUrutan(12);
        tag199.setTag("79");
//            tag199.setDetail("ATTN:INVESTIGATIONS" + "\r\n"
//                    + "CONCERNING YOUR MT103 DD " + valueDate + "\r\n"
//                    + "REF. " + _011_of21_related_reference + " FOR " + currency + " " + amount + "\r\n"
//                    + "." + "\r\n"
//                    + "WE ARE UNABLE TO APPLY THE PAYMENT" + "\r\n"
//                    + "DUE TO INCORRECT BENEF'S NAME" + "\r\n"
//                    + "." + "\r\n"
//                    + "IF WE DO NOT HEAR FROM YOU WITHIN 5 WORKING DAYS" + "\r\n"
//                    + "WE WILL RETURN YOUR PAYMENT AFTER LESS OUR CHARGE" + "\r\n"
//                    + "AND WE SHALL NOT BE RESPONSIBLE FOR ANY DELAY" + "\r\n"
//                    + "PLS QUOTE OUR REFF AT FIELD 20 IN YOUR REPLY" + "\r\n"
//                    + "PLS CONFIRM REMITTER AND PROVIDE US WITH CORRECT" + "\r\n"
//                    + "DETAIL A.S.A.P" + "\r\n"
//                    + "." + "\r\n"
//                    + "REGARDS" + "\r\n"
//                    + "BANK SYARIAH INDONESIA \r\n"
//                    + "INTERNATIONAL TRANSFER");

        
        // Set narative sesuai dengan kondisi
        tag199.setDetail(mt199CommentByCondition(header103, currency, valueDate, amount.toPlainString()));
        tag199.setTagName("_012_mf79_narrative");
        tags199.add(tag199);
        log.info("before add datatag investigasi");
        for (int i = 0; i < tags199.size(); i++) {
//                        log.info("before add datatag retur if");
            dBDataTransaksiOutgoing.addDataTag199(tags199.get(i).getUrutan(), tags199.get(i).getTag(), tags199.get(i).getDetail(), tags199.get(i).getTagName());
//                        log.info("after add datatag retur");
        }
        CreateText ct = new CreateText(dbConn.getConnection());
//            CreateTextNew ctn = new CreateTextNew(dbConn.getConnection());
        log.info("create new MT");
        log.info("id header mt199: " + dBDataTransaksiOutgoing.id_headers());
        dBDataTransaksiOutgoing.addMTText(ct.createFinalMT(ct.getHeaderById(dBDataTransaksiOutgoing.id_headers())), dBDataTransaksiOutgoing.id_headers());
        log.info("after add datatag investigasi");
    }
    
    private void createMT199ByMT(String id,Header header103, DBDataTransaksiOutgoing dBDataTransaksiOutgoing, HttpSession session, DBconnection dbConn) throws SQLException, ParseException, Exception{
        List<TagDB> tags103 = dBDataTransaksiOutgoing.getAllTagById(id);
        DataHeaderTransaksi header199 = new DataHeaderTransaksi();
        List<TagDB> tags199 = new ArrayList<TagDB>();
        header199.setSender_logical_terminal("MEGAIDJAXXXX");
        header199.setNetworkType("MT");
        log.info("nSender_logical_terminal=" + header199.getSender_logical_terminal());
        header199.setMessageType("199");
        String nReceiver_institution = header103.getReceiverAddress().substring(0, 8) + "X" + header103.getReceiverAddress().substring(9);
        header199.setReceiver_institution(nReceiver_institution);
        log.info("nReceiver_institution=" + header199.getReceiver_institution());
        header199.setPriority("N");
        //20210128
        String blok3 = header103.getBlock3().substring(header103.getBlock3().indexOf("121:"));
        if (blok3.contains("433:")) {
            blok3 = blok3.replace(blok3.substring(blok3.indexOf("433:")), "");
        }
        //--------
//            header199.setBlock3(header103.getBlock3().substring(header103.getBlock3().indexOf("121:")));
        header199.setBlock3(blok3);
        //end
        dBDataTransaksiOutgoing.addDataTransaksiInvestigasi(header199, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
        String seqDB = dBDataTransaksiOutgoing.getSeq();

        var seq = CostumerHelper.getTheLastSeqNew(dBDataTransaksiOutgoing);

        System.out.println("199_114 ");
        dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(id), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
//            DataInvestigation dataInv = dBDataTransaksiOutgoing.getDataInv(id);
        log.info("add data transaksi investigasi");
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        String currDate = new SimpleDateFormat("yyMMdd").format(new Date());
//                    tag MT199
        String _010_mf20_sender_reference = "";
        String _011_of21_related_reference = "";
        String _012_mf79_narrative = "";
        String currency = "";
        String amount = "";
        String reason = header103.getKomentar();
        String valueDate = "";
//                    log.info("reason : "+reason);
        for (int i = 0; i < tags103.size(); i++) {
//                        _011_of21_related_reference
            if (tags103.get(i).getTagName().equalsIgnoreCase("_010_mf20_sender_reference")) {
                _011_of21_related_reference = tags103.get(i).getDetail();
            } else if (tags103.get(i).getTagName().equalsIgnoreCase("_061_mf32a_currency")) {
                currency = tags103.get(i).getDetail();
            } else if (tags103.get(i).getTagName().equalsIgnoreCase("_062_mf32a_amount")) {
                amount = tags103.get(i).getDetail();
            } else if (tags103.get(i).getTagName().equalsIgnoreCase("_060_mf32a_date")) {
                valueDate = tags103.get(i).getDetail();
            }
        }
        TagDB tag199 = new TagDB();
//                    _010_mf20_sender_reference
        tag199.setUrutan(10);
        tag199.setTag("20");
        tag199.setDetail("INV" + currDate + header103.getLogicalTerminal().substring(0, 4) + seq);
        tag199.setTagName("_010_mf20_sender_reference");
        tags199.add(tag199);
//                    _011_mf21_
        tag199 = new TagDB();
        tag199.setUrutan(11);
        tag199.setTag("21");
        tag199.setDetail(_011_of21_related_reference);
        tag199.setTagName("_011_of21_related_reference");
        tags199.add(tag199);
//                    _060_mf32a_date
        tag199 = new TagDB();
        tag199.setUrutan(12);
        tag199.setTag("79");
        
        // Set narative sesuai dengan kondisi
        tag199.setDetail(mt199CommentByCondition(header103, currency, valueDate, amount));
        tag199.setTagName("_012_mf79_narrative");
        tags199.add(tag199);
        log.info("before add datatag investigasi");
        for (int i = 0; i < tags199.size(); i++) {
//                        log.info("before add datatag retur if");
            dBDataTransaksiOutgoing.addDataTag199(tags199.get(i).getUrutan(), tags199.get(i).getTag(), tags199.get(i).getDetail(), tags199.get(i).getTagName());
//                        log.info("after add datatag retur");
        }
        CreateText ct = new CreateText(dbConn.getConnection());
//            CreateTextNew ctn = new CreateTextNew(dbConn.getConnection());
        log.info("create new MT");
        log.info("id header mt199: " + dBDataTransaksiOutgoing.id_headers());
        dBDataTransaksiOutgoing.addMTText(ct.createFinalMT(ct.getHeaderById(dBDataTransaksiOutgoing.id_headers())), dBDataTransaksiOutgoing.id_headers());
        log.info("after add datatag investigasi");
    }
    
    
    protected String mt199CommentByCondition(Header header103, String currency, String valueDate, String amount){
        log.info("Choose Narative condition MT199 Investigation");
        
        System.out.println("Komen : "+header103.getKomentar());
        System.out.println("Flag : "+header103.getFlag());
        var komentarInvalidAccountNumber = "ATTN: " + currency + " FT INVESTIGATIONS." + "\r\n"
                + "." + "\r\n"
                + "REFER TO YOUR PACS.008 DD " + valueDate + " WITH ABOVE REF\r\n"
                //                    + "REF. " + _011_of21_related_reference + " FOR " + currency + " " + amount + "\r\n"
                + "NUMBER REGARDING CREDIT TO OUR ACC FOR AMOUNT \r\n"
                + currency + "." + amount + ". VALUE DATE " + valueDate + ".\r\n"
                + "." + "\r\n"
                + "PLEASE BE INFORMED THAT WE ARE UNABLE TO APPLY" + "\r\n"
                + "THE PO SINCE THERE IS INVALID BENEFICIARY" + "\r\n"
                + "ACCOUNT NUMBER.\r\n"
                + "." + "\r\n"
                + "KINDLY INFORM US THE VALID BENEFICIARY ACCOUNT" + "\r\n"
                + "NUMBER.\r\n"
                + "REGARDS," + "\r\n"
                + "REMITTANCE OPERATION \r\n"
                + "BANK MEGA";
        
        var komentarBeneName = "ATTN: " + currency + " FT INVESTIGATIONS." + "\r\n"
                + "." + "\r\n"
                + "REFER TO YOUR PACS.008 DD " + valueDate + " WITH ABOVE REF\r\n"
                //                    + "REF. " + _011_of21_related_reference + " FOR " + currency + " " + amount + "\r\n"
                + "NUMBER REGARDING CREDIT TO OUR ACC FOR AMOUNT \r\n"
                + currency + "." + amount + ". VALUE DATE " + valueDate + ".\r\n"
                + "." + "\r\n"
                + "PLEASE BE INFORMED THAT WE ARE UNABLE TO APPLY" + "\r\n"
                + "THE PO SINCE THERE IS INVALID BENEFICIARY" + "\r\n"
                + "NAME.\r\n"
                + "." + "\r\n"
                + "KINDLY INFORM US THE VALID BENEFICIARY" + "\r\n"
                + "NAME. \r\n"
                + "REGARDS," + "\r\n"
                + "REMITTANCE OPERATION \r\n"
                + "BANK MEGA";
                
        var komentarStatementNotYetRecieve = "ATTN: " + currency + " FT INVESTIGATIONS." + "\r\n"
                + "." + "\r\n"
                + "REFER TO YOUR PACS.008 DD " + valueDate + " WITH ABOVE REF\r\n"
                //                    + "REF. " + _011_of21_related_reference + " FOR " + currency + " " + amount + "\r\n"
                + "NUMBER REGARDING CREDIT TO OUR ACC FOR AMOUNT \r\n"
                + currency + "." + amount + ". VALUE DATE " + valueDate + ".\r\n"
                + "." + "\r\n"
                + "PLEASE BE INFORMED THAT WE ARE UNABLE TO APPLY" + "\r\n"
                + "THE PO SINCE WE HAVE NOT RECEIVE YET" + "\r\n"
                + "STATEMENT OF REGARDING TRANSACTION.\r\n"
                + "." + "\r\n"
                + "REGARDS," + "\r\n"
                + "REMITTANCE OPERATION \r\n"
                + "BANK MEGA";
        
        var anyKomen = "ATTN: " + currency + " FT INVESTIGATIONS." + "\r\n"
                + "." + "\r\n"
                + "REFER TO YOUR PACS.008 DD " + valueDate + " WITH ABOVE REF\r\n"
                //                    + "REF. " + _011_of21_related_reference + " FOR " + currency + " " + amount + "\r\n"
                + "NUMBER REGARDING CREDIT TO OUR ACC FOR AMOUNT \r\n"
                + currency + "." + amount + ". VALUE DATE " + valueDate + ".\r\n"
                + "." + "\r\n"
                + "PLEASE BE INFORMED THAT WE ARE UNABLE TO APPLY" + "\r\n"
                + "THE PO SINCE ................" + "\r\n"
                + "." + "\r\n"
                + "." + "\r\n"
                + "REGARDS," + "\r\n"
                + "REMITTANCE OPERATION \r\n"
                + "BANK MEGA";
        
        // perlu kondisi untuk setiap investigasi
        if (header103.getFlag().equalsIgnoreCase("INC-OK")){
            return komentarStatementNotYetRecieve;
        }
        else if((header103.getFlag().equalsIgnoreCase("INC-NOK") || header103.getFlag().equalsIgnoreCase("INC-WAIT")) && header103.getKomentar().toLowerCase().contains("account number not found")){
            return komentarInvalidAccountNumber;
        }
        else if((header103.getFlag().equalsIgnoreCase("INC-NOK") || header103.getFlag().equalsIgnoreCase("INC-WAIT")) && header103.getKomentar().toLowerCase().contains("account name doesn't match")){
            return komentarBeneName;
        }
        else {
            return anyKomen;
        }
    }

    private void createMT202orMT199ByMT(HttpServletRequest request, HttpServletResponse response, DBDataTransaksiOutgoing dBDataTransaksiOutgoing, DBconnection dbConn) throws SQLException, Exception {
        boolean isBooking = false;
        String messageType = request.getParameter("messageType");
        String idTransaction = request.getParameter("id");
        HttpSession session = request.getSession();
        String flagStatus = (String) session.getAttribute("flagStatus");

        Header header103 = dBDataTransaksiOutgoing.getHeaderById(idTransaction);

        Map<String, String> mtText = dBDataTransaksiOutgoing.getMtTextById(idTransaction);

        // Buat object prowide
        MT103 mt103 = new MT103(mtText.get("final_mt"));
        System.out.println("Data " + mt103.getField20().getValue());

        List<TagDB> tags103 = dBDataTransaksiOutgoing.getAllTagById(idTransaction);
        DataHeaderTransaksi header199 = new DataHeaderTransaksi();
        List<TagDB> tags199 = new ArrayList<TagDB>();

        String nReceiver_institution = "";
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        String currDate = new SimpleDateFormat("yyMMdd").format(new Date());
        CreateText ct = new CreateText(dbConn.getConnection());
        String tag54A = dBDataTransaksiOutgoing.getTag54A(idTransaction);
        String tag20 = "none";
        String seq = "";
        String currency2 = "";
        String _010_mf20_sender_reference2 = "";
        String _011_of21_related_reference2 = "";
        String _012_mf79_narrative2 = "";

        String amount2 = "";
        String valueDate2 = "";
        String reason2 = header103.getKomentar();

        for (int i = 0; i < tags103.size(); i++) {
            if (tags103.get(i).getTagName().equalsIgnoreCase("_010_mf20_sender_reference")) {
                _010_mf20_sender_reference2 = tags103.get(i).getDetail();
            } else if (tags103.get(i).getTagName().equalsIgnoreCase("_061_mf32a_currency")) {
                currency2 = tags103.get(i).getDetail();
            } else if (tags103.get(i).getTagName().equalsIgnoreCase("_062_mf32a_amount")) {
                amount2 = tags103.get(i).getDetail();
            } else if (tags103.get(i).getTagName().equalsIgnoreCase("_060_mf32a_date")) {
                valueDate2 = tags103.get(i).getDetail();
            }
        }
        log.info("masuk mt 103");

        DataCharges charges2 = dBDataTransaksiOutgoing.getCharges("USD");
        // log.info("sebelum cek chargessss...");
        if (charges2.getCharges() == null) {
            // log.info("kadarieu kadarieu.....");
        } else {
            // log.info("setelah masuk chargesssss....");

            //InsyaAllah nanti part 2, -> dipakai 240111
            //MT 199 TIPE 2
            List<TagDB> tags199_2 = new ArrayList<TagDB>();
            DataHeaderTransaksi header199_2 = new DataHeaderTransaksi();
            header199_2.setSender_logical_terminal("MEGAIDJAXXXX");
            log.info("nSender_logical_terminal=" + header199_2.getSender_logical_terminal());
            header199_2.setMessageType("199");
            header199_2.setNetworkType("MT");
            nReceiver_institution = header103.getReceiverAddress().substring(0, 8) + "X" + header103.getReceiverAddress().substring(9);
            //nReceiver_institution = header103.getReceiverAddress();
//                        nReceiver_institution = ""; //(Bank Koresponden Bank Pengirim)
            header199_2.setReceiver_institution(nReceiver_institution);
            log.info("nReceiver_institution=" + nReceiver_institution);
            header199_2.setPriority("N");
            //20210129
            String blok3 = header103.getBlock3().substring(header103.getBlock3().indexOf("121:"));
            if (blok3.contains("433:")) {
                blok3 = blok3.replace(blok3.substring(blok3.indexOf("433:")), "");
            }
            System.out.println("blok3 nyaeta : " + blok3);
            //-------
//                                    header199_2.setBlock3(header103.getBlock3().substring(header103.getBlock3().indexOf("121:")));
            header199_2.setBlock3(blok3);
            //end

            header199_2.setOperator_comment(header103.getKomentar());
            if (dBDataTransaksiOutgoing.getRefInv(idTransaction).equalsIgnoreCase("none")) {
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
                String tgl_trx = new SimpleDateFormat("yyMMddHHmm").format(new Date());
                String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
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
                tag20 = "RTR" + currDate + header103.getLogicalTerminal().substring(0, 4) + seq;
            } else {
                tag20 = dBDataTransaksiOutgoing.getRefInv(idTransaction);

            }

            //tag 20 dijadikan rel reference
            _011_of21_related_reference2 = _010_mf20_sender_reference2;

            // String charges2_convert = charges2.getCharges();
            dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(idTransaction), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            String nominal2 = charges2.getCharges();
            String totCharges2 = dBDataTransaksiOutgoing.addTotalCharges(amount2, nominal2);
            log.info("cek ");
            TagDB tag199_2 = new TagDB();
//                    _010_mf20_sender_reference
            tag199_2.setUrutan(10);
            tag199_2.setTag("20");
            tag199_2.setDetail(tag20);
//                tag199_2.setDetail("RTR" + currDate + "" + header103.getLogicalTerminal().substring(0, 4).toString() + "" + dataInv_2.getSeq_num());S
            tag199_2.setTagName("_010_mf20_sender_reference");
            tags199_2.add(tag199_2);
//                    _011_mf21_
            tag199_2 = new TagDB();
            tag199_2.setUrutan(11);
            tag199_2.setTag("21");
            tag199_2.setDetail(_011_of21_related_reference2);
            tag199_2.setTagName("_011_of21_related_reference");
            tags199_2.add(tag199_2);
//                    _060_mf32a_date
            tag199_2 = new TagDB();
            tag199_2.setUrutan(12);
            tag199_2.setTag("79");
            tag199_2.setTagName("_012_mf79_narrative");
            tag199_2.setDetail("ATTN: RETUR" + "\r\n"
                    + "." + "\r\n"
                    + "CONCERNING YOUR MT103 DD " + valueDate2 + "\r\n"
                    + "REF. " + _011_of21_related_reference2 + " FOR " + currency2 + " " + amount2 + "\r\n"
                    + "." + "\r\n"
                    + "WE CANCEL YOUR A/M MT103 DUE TO INVALID" + "\r\n"
                    + "BENEF ACC NR AND WE HAVE REFUND THE FUND THROUGH" + "\r\n"
                    + tag54A + " FOR " + currency2 + " " + totCharges2 + " (LESS OUR CHARGES" + "\r\n"
                    + currency2 + " " + nominal2 + ")" + "\r\n"
                    + "." + "\r\n"
                    + "WE CONFIRM THIS PAYMENT ORDER IS NOW CONSIDERED" + "\r\n"
                    + "AS CANCELLATION AND TREAT IT AS NULL AND VOID." + "\r\n"
                    + "." + "\r\n"
                    + "WE CLOSE OUR FILE ON THIS CASE" + "\r\n"
                    + "." + "\r\n"
                    + "REGARDS" + "\r\n"
                    + "REMITTANCE OPERATION \r\n"
                    + "PT.BANK MEGA INDONESIA, ");

            //bila nostro narrative pakai template mizuho
            tags199_2.add(tag199_2);

            int returnId_headers = dBDataTransaksiOutgoing.addDataTransaksiInvestigasi(header199_2, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(idTransaction), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));

            log.info("before add data tag incoming retur tipe 2");
            for (int i = 0; i < tags199_2.size(); i++) {
//                        log.info("before add datatag retur if");
                dBDataTransaksiOutgoing.addDataTag199(tags199_2.get(i).getUrutan(), tags199_2.get(i).getTag(), tags199_2.get(i).getDetail(), tags199_2.get(i).getTagName());
//                        log.info("after add datatag retur");
            }
            log.info("create new MT");
//                        log.info("idTransaction header mt199: " + dBDataTransaksiOutgoing.id_headers());
            log.info("id header mt199: " + returnId_headers);
            dBDataTransaksiOutgoing.addMTText(ct.createFinalMT(ct.getHeaderById(returnId_headers)), returnId_headers);
            log.info("after add data tag incoming retur tipe 2");

            //bila bukan nostro maka generate mt 202 juga
            if (header103.getIsNostro().equals("0")) {
                //MT 202
                List<TagDB> tags202 = new ArrayList<TagDB>();
                DataHeaderTransaksi header202 = new DataHeaderTransaksi();
                header202.setSender_logical_terminal("MEGAIDJAXXXX");
                log.info("nSender_logical_terminal=" + header202.getSender_logical_terminal());
                header202.setMessageType("202");
                header202.setNetworkType("MT");
//                            nReceiver_institution = header103.getReceiverAddress().substring(0, 8) + "X" + header103.getReceiverAddress().substring(9);

                // 2024-06-25 (Farras) : Dari dhika "Receiver di MT202 selalu ke nostro kita mas "
                boolean isNostroFound = false;
                String receiverMT202 = "";
                // Ini ambil dari tag54 ya
                if (mt103.getField54A() != null && !isNostroFound) {
                    if (mt103.getField54A().getComponent3AsBIC() != null) {
                        String bic8Digit = mt103.getField54A().getComponent3AsBIC().getBic8();

                        // Ambil data Nostronya menggunakan bic8 dan ccy
                        DataNostro dataNostro = dBDataTransaksiOutgoing.getListNostro(bic8Digit, currency2);
                        if (dataNostro != null) {
                            // Ada nostronya
                            isNostroFound = true;
                            receiverMT202 = dataNostro.getSwift_bic();
                        }
                    }

                }

                // Jika tidak ada tag54 check ke tag 53
                if (mt103.getField53A() != null && !isNostroFound) {
                    if (mt103.getField53A().getComponent3AsBIC() != null) {

                        String bic8Digit = mt103.getField53A().getComponent3AsBIC().getBic8();
                        // Ambil data Nostronya menggunakan bic8 dan ccy
                        DataNostro dataNostro = dBDataTransaksiOutgoing.getListNostro(bic8Digit, currency2);
                        if (dataNostro != null) {
                            // Ada nostronya
                            isNostroFound = true;
                            receiverMT202 = dataNostro.getSwift_bic();
                        }
                    }

                }
                if (mt103.getSender() != null && !isNostroFound) {

                    if (mt103.getSender().length() >= 11) {
                        receiverMT202 = mt103.getSender().substring(0, 8).concat("X").concat(mt103.getSender().substring(9));
                    } else {
                        receiverMT202 = mt103.getSender().substring(0, 8).concat("XXXX");
                    }
                }

                header202.setReceiver_institution(receiverMT202);
                log.info("nReceiver_institution=" + receiverMT202);
                header202.setPriority("N");

                //20210129
                blok3 = header103.getBlock3().substring(header103.getBlock3().indexOf("121:"));
                if (blok3.contains("433:")) {
                    blok3.replace(blok3.substring(blok3.indexOf("433:")), "");
                }
                System.out.println("blok3 nyaeta : " + blok3);
                //-------
//                                    header202.setBlock3(header103.getBlock3().substring(header103.getBlock3().indexOf("121:")));
                header202.setBlock3(blok3);
                //end

                header202.setOperator_comment(header103.getKomentar());
                returnId_headers = dBDataTransaksiOutgoing.addDataTransaksiInvestigasi(header202, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(idTransaction), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));

                TagDB tag202 = new TagDB();
//                    _010_mf20_sender_reference
                tag202.setUrutan(10);
                tag202.setTag("20");
                tag202.setDetail(tag20);
//                tag202.setDetail("RTR" + currDate + "" + header103.getLogicalTerminal().substring(0, 4).toString() + "" + dataInv_2.getSeq_num());S
                tag202.setTagName("_010_mf20_sender_reference");
                tags202.add(tag202);
//                    _011_mf21_
                tag202 = new TagDB();
                tag202.setUrutan(11);
                tag202.setTag("21");
                tag202.setDetail(_011_of21_related_reference2);
                tag202.setTagName("_011_mf21_");
                tags202.add(tag202);
                //                    _060_mf32a_date
                tag202 = new TagDB();
                tag202.setUrutan(60);
                tag202.setTag("32a");

                // Ini harus dibuat today
                tag202.setDetail(currDate);
                tag202.setTagName("_060_mf32a_date");
                tags202.add(tag202);
                //                    _061_mf32a_currency
                tag202 = new TagDB();
                tag202.setUrutan(61);
                tag202.setTag("32a");
                tag202.setDetail(currency2);
                tag202.setTagName("_061_mf32a_currency");
                tags202.add(tag202);
                //                    _062_mf32a_amount
                tag202 = new TagDB();
                tag202.setUrutan(62);
                tag202.setTag("32a");
                tag202.setDetail(amount2);
                tag202.setTagName("_062_mf32a_amount");
                tags202.add(tag202);

                // menambahkan tag57 (Account with instituion) MT202 dari sender correspondent MT103 tag54 atau 53, check dulu 54nya ada dan dia nostro
                // 2024-06-24 (Farras) : Jadi gini gk mas, 53 MT103 akan akan menjadi 57 MT202. Namun, jika 53 MT103 adalah nostro, maka 57 MT 202 adalah sender
                // Jika ada tag 54 dan 53 maka 53 menjad tag 57
                // Jika ada 53 tanpa ada 54 maka sender sebagai tag 57
                // JIka tidak ada 53 dan 54 maka sender sebagai tag 57
                if ((mt103.getField53A() != null || mt103.getField53B() != null || mt103.getField53D() != null)
                        && (mt103.getField54A() != null || mt103.getField54B() != null || mt103.getField54D() != null)) {
                    if (mt103.getField53A() != null) {

                        if (mt103.getField53A().getPartyIdentifier() != null) {
                            tag202 = new TagDB();
                            tag202.setUrutan(170);
                            tag202.setTag("57a");
                            tag202.setDetail(mt103.getField53A().getPartyIdentifier());
                            tag202.setTagName("_170_of57a_party_identifier");
                            tags202.add(tag202);
                        }
                        if (mt103.getField53A().getComponent3AsBIC() != null) {
                            tag202 = new TagDB();
                            tag202.setUrutan(171);
                            tag202.setTag("57a");
                            tag202.setDetail(mt103.getField53A().getComponent3AsBIC().getBic11());
                            tag202.setTagName("_171_of57a_identifier_code");
                            tags202.add(tag202);
                        }
                    } else if (mt103.getField53B() != null) {
                        if (mt103.getField53B().getPartyIdentifier() != null) {
                            tag202 = new TagDB();
                            tag202.setUrutan(173);
                            tag202.setTag("57b");
                            tag202.setDetail(mt103.getField53B().getPartyIdentifier());
                            tag202.setTagName("_173_of57b_party_identifier");
                            tags202.add(tag202);
                        }
                        if (mt103.getField53B().getLocation() != null) {
                            tag202 = new TagDB();
                            tag202.setUrutan(174);
                            tag202.setTag("57b");
                            tag202.setDetail(mt103.getField53B().getLocation());
                            tag202.setTagName("_174_of57b_location");
                            tags202.add(tag202);
                        }
                    } else if (mt103.getField53D() != null) {

                        if (mt103.getField53D().getPartyIdentifier() != null) {
                            tag202 = new TagDB();
                            tag202.setUrutan(176);
                            tag202.setTag("57d");
                            tag202.setDetail(mt103.getField53D().getPartyIdentifier());
                            tag202.setTagName("_176_of57d_party_identifier");
                            tags202.add(tag202);
                        }

                        StringBuilder nameAndAddress = new StringBuilder();
                        if (mt103.getField53D().getNameAndAddressLine1() != null) {
                            nameAndAddress.append(mt103.getField53D().getNameAndAddressLine1()).append("\r\n");
                        }
                        if (mt103.getField53D().getNameAndAddressLine2() != null) {
                            nameAndAddress.append(mt103.getField53D().getNameAndAddressLine2()).append("\r\n");
                        }
                        if (mt103.getField53D().getNameAndAddressLine3() != null) {
                            nameAndAddress.append(mt103.getField53D().getNameAndAddressLine3()).append("\r\n");
                        }
                        if (mt103.getField53D().getNameAndAddressLine4() != null) {
                            nameAndAddress.append(mt103.getField53D().getNameAndAddressLine4()).append("\r\n");
                        }

                        String theFullNameAndAddress = nameAndAddress.toString().trim();
                        if (theFullNameAndAddress.length() >= 1) {
                            tag202 = new TagDB();
                            tag202.setUrutan(177);
                            tag202.setTag("57d");
                            tag202.setDetail(theFullNameAndAddress);
                            tag202.setTagName("_177_of57d_name_address");
                            tags202.add(tag202);
                        }
                    }
                } else {

                    String identifierCode;
                    if (mt103.getSender().length() >= 11) {
                        identifierCode = mt103.getSender().substring(0, 8).concat(mt103.getSender().substring(9));
                    } else {
                        identifierCode = mt103.getSender().substring(0, 8).concat("XXX");
                    }

                    // Jika tag 53 juga tidak ada maka ambil dari sender MT103
                    tag202 = new TagDB();
                    tag202.setUrutan(171);
                    tag202.setTag("57a");
                    tag202.setDetail(identifierCode);
                    tag202.setTagName("_171_of57a_identifier_code");
                    tags202.add(tag202);
                }

                // 2024-06-25 (Farras) : Informasi dika "pokoknga bank pengirim di mt103 (bisa tag 52 atau sender) akan jadi tag 58"
                if (mt103.getField52A() != null || mt103.getField52D() != null) {

                    // Jika ada 52 A maka pakai 52 A
                    if (mt103.getField52A() != null) {
                        if (mt103.getField52A().getPartyIdentifier() != null) {
                            tag202 = new TagDB();
                            tag202.setUrutan(180);
                            tag202.setTag("58a");
                            tag202.setDetail(mt103.getField52A().getPartyIdentifier());
                            tag202.setTagName("_180_of58a_party_identifier");
                            tags202.add(tag202);
                        }
                        if (mt103.getField52A().getComponent3AsBIC() != null) {
                            tag202 = new TagDB();
                            tag202.setUrutan(181);
                            tag202.setTag("58a");
                            tag202.setDetail(mt103.getField52A().getComponent3AsBIC().getBic11());
                            tag202.setTagName("_181_of58a_identifier_code");
                            tags202.add(tag202);
                        }
                    } else if (mt103.getField52D() != null) {
                        if (mt103.getField52D().getPartyIdentifier() != null) {
                            tag202 = new TagDB();
                            tag202.setUrutan(183);
                            tag202.setTag("58d");
                            tag202.setDetail(mt103.getField52D().getPartyIdentifier());
                            tag202.setTagName("_183_of58d_party_identifier");
                            tags202.add(tag202);
                        }

                        StringBuilder nameAndAddress = new StringBuilder();
                        if (mt103.getField52D().getNameAndAddressLine1() != null) {
                            nameAndAddress.append(mt103.getField52D().getNameAndAddressLine1()).append("\r\n");
                        }
                        if (mt103.getField52D().getNameAndAddressLine2() != null) {
                            nameAndAddress.append(mt103.getField52D().getNameAndAddressLine2()).append("\r\n");
                        }
                        if (mt103.getField52D().getNameAndAddressLine3() != null) {
                            nameAndAddress.append(mt103.getField52D().getNameAndAddressLine3()).append("\r\n");
                        }
                        if (mt103.getField52D().getNameAndAddressLine4() != null) {
                            nameAndAddress.append(mt103.getField52D().getNameAndAddressLine4()).append("\r\n");
                        }

                        String theFullNameAndAddress = nameAndAddress.toString().trim();
                        if (theFullNameAndAddress.length() >= 1) {
                            tag202 = new TagDB();
                            tag202.setUrutan(184);
                            tag202.setTag("58d");
                            tag202.setDetail(theFullNameAndAddress);
                            tag202.setTagName("_184_of58d_name_address");
                            tags202.add(tag202);
                        }
                    }

                } else {

                    String identifierCode;
                    if (mt103.getSender().length() >= 11) {
                        identifierCode = mt103.getSender().substring(0, 8).concat(mt103.getSender().substring(9));
                    } else {
                        identifierCode = mt103.getSender().substring(0, 8).concat("XXX");
                    }

                    tag202 = new TagDB();
                    tag202.setUrutan(181);
                    tag202.setTag("58a");
                    tag202.setDetail(identifierCode);
                    tag202.setTagName("_181_of58a_identifier_code");
                    tags202.add(tag202);
                }

                log.info("before add data tag incoming retur");
                for (int i = 0; i < tags202.size(); i++) {
                    dBDataTransaksiOutgoing.addDataTag199(tags202.get(i).getUrutan(), tags202.get(i).getTag(), tags202.get(i).getDetail(), tags202.get(i).getTagName());
//                        dBDataTransaksiOutgoing.addDataTag199(tags202.get(i).getUrutan(), tags202.get(i).getTag(), tags202.get(i).getDetail(), tags202.get(i).getTagName(), returnId_headers);
                }
                CreateText ct2 = new CreateText(dbConn.getConnection());
                log.info("create new MT");
                log.info("id header mt202: " + returnId_headers);
                dBDataTransaksiOutgoing.addMTText(ct2.createFinalMT(ct2.getHeaderById(returnId_headers)), returnId_headers);
            }

            // Setelah proses berhasil, ubah statusnya jadi INC-RTR
            dBDataTransaksiOutgoing.createReturTransaksiOutgoing("INC-RTR", Integer.parseInt(idTransaction), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));

            dBDataTransaksiOutgoing.updateWriteSession(0);
            String pagingHistory = HistoryPaging.getPagingHistory(request, response);
            response.sendRedirect("controllerHeaders?" + pagingHistory);

        }
    }

    private void createMT202orMT199ByMX(HttpServletRequest request, HttpServletResponse response, DBDataTransaksiOutgoing dBDataTransaksiOutgoing, DBconnection dbConn) throws SQLException, Exception {
        boolean isBooking = false;
        String messageType = request.getParameter("messageType");
        String idTransaction = request.getParameter("id");
        HttpSession session = request.getSession();
        String flagStatus = (String) session.getAttribute("flagStatus");

        Header header103 = dBDataTransaksiOutgoing.getHeaderById(idTransaction);

        Map<String, String> mtText = dBDataTransaksiOutgoing.getMxFromById(Integer.parseInt(idTransaction));
        String bodyMX = mtText.get("bodyMX");
        if (bodyMX == null || bodyMX.isEmpty()) {
            System.out.println("bodyMX is null or empty. Unable to parse JSON.");
            throw new IllegalArgumentException("bodyMX is null or empty. Unable to parse JSON.");
        }
        // Buat object prowide
        MxPacs00800108 mxPacs = MxPacs00800108.fromJson(bodyMX);
        String currency2 = mxPacs.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmAmt().getCcy();
        String amount2 = mxPacs.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmAmt().getValue().toString();
        String valueDate2 = CostumerHelper.xmlGregorianCalenderToMTFormatString(mxPacs.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmDt());

        System.out.println("Data " + mxPacs.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId());

        List<TagDB> tags103 = dBDataTransaksiOutgoing.getAllTagById(idTransaction);
        DataHeaderTransaksi header199 = new DataHeaderTransaksi();
        List<TagDB> tags199 = new ArrayList<TagDB>();

        String nReceiver_institution = "";
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        String currDate = new SimpleDateFormat("yyMMdd").format(new Date());
        CreateText ct = new CreateText(dbConn.getConnection());
        String tag54A = dBDataTransaksiOutgoing.getTag54A(idTransaction);
        String tag20 = "none";
        String seq = "";

        log.info("masuk mt 103");

        DataCharges charges2 = dBDataTransaksiOutgoing.getCharges("USD");
        log.info("sebelum cek chargessss...");
        if (charges2.getCharges() == null) {
            // log.info("kadarieu kadarieu.....");
        } else {
            // log.info("setelah masuk chargesssss....");

            //MT 199 TIPE 2
            List<TagDB> tags199_2 = new ArrayList<TagDB>();
            DataHeaderTransaksi header199_2 = new DataHeaderTransaksi();
            header199_2.setSender_logical_terminal("MEGAIDJAXXXX");
            log.info("nSender_logical_terminal=" + header199_2.getSender_logical_terminal());
            header199_2.setMessageType("199");
            header199_2.setNetworkType("MT");
//                        nReceiver_institution = header103.getReceiverAddress().substring(0, 8) + "X" + header103.getReceiverAddress().substring(9);
            nReceiver_institution = header103.getReceiverAddress();
//                        nReceiver_institution = ""; //(Bank Koresponden Bank Pengirim)
            header199_2.setReceiver_institution(header103.getLogicalTerminal());
            log.info("nReceiver_institution=" + nReceiver_institution);
            header199_2.setPriority("N");
            //20210129
            String blok3 = "121:".concat(mxPacs.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getUETR());
            header199_2.setBlock3(blok3);
            //end

            header199_2.setOperator_comment(header103.getKomentar());
            if (dBDataTransaksiOutgoing.getRefInv(idTransaction).equalsIgnoreCase("none")) {
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
                String tgl_trx = new SimpleDateFormat("yyMMddHHmm").format(new Date());
                String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
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
                tag20 = "RTR" + currDate + header103.getLogicalTerminal().substring(0, 4) + seq;
            } else {
                tag20 = dBDataTransaksiOutgoing.getRefInv(idTransaction);
            }

            //tag 20 dijadikan rel reference
            String _011_of21_related_reference2 = mxPacs.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId();

            String charges2_convert = charges2.getCharges();
            TagDB tag199_2 = new TagDB();
//                    _010_mf20_sender_reference
            tag199_2.setUrutan(10);
            tag199_2.setTag("20");
            tag199_2.setDetail(tag20);
//                tag199_2.setDetail("RTR" + currDate + "" + header103.getLogicalTerminal().substring(0, 4).toString() + "" + dataInv_2.getSeq_num());S
            tag199_2.setTagName("_010_mf20_sender_reference");
            tags199_2.add(tag199_2);
//                    _011_mf21_
            tag199_2 = new TagDB();
            tag199_2.setUrutan(11);
            tag199_2.setTag("21");
            tag199_2.setDetail(_011_of21_related_reference2);
            tag199_2.setTagName("_011_of21_related_reference");
            tags199_2.add(tag199_2);
//                    _060_mf32a_date
            tag199_2 = new TagDB();
            tag199_2.setUrutan(12);
            tag199_2.setTag("79");
            //bila nostro narrative pakai template mizuho
            if (header103.getIsNostro().equals("0")) {
                String narrativeTo = "";
                boolean isNostroF = false;
                // Ini ambil dari tag54
                if (mxPacs.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getInstdRmbrsmntAgt() != null && !isNostroF) {
                    if (mxPacs.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getInstdRmbrsmntAgt().getFinInstnId().getBICFI() != null) {

                        String bic8Digit = mxPacs.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getInstdRmbrsmntAgt().getFinInstnId().getBICFI().substring(0, 8);
                        // Ambil data Nostronya menggunakan bic8 dan ccy
                        DataNostro dataNostro = dBDataTransaksiOutgoing.getListNostro(bic8Digit, currency2);
                        if (dataNostro != null) {
                            // Ada nostronya
                            isNostroF = true;
                            narrativeTo = dataNostro.getSwift_bic();
                        }
                    }

                }

                // Jika tidak ada tag54 check ke tag 53
                if (mxPacs.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getInstgRmbrsmntAgt() != null && !isNostroF) {
                    if (mxPacs.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getInstgRmbrsmntAgt().getFinInstnId().getBICFI() != null) {

                        String bic8Digit = mxPacs.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getInstgRmbrsmntAgt().getFinInstnId().getBICFI().substring(0, 8);
                        // Ambil data Nostronya menggunakan bic8 dan ccy
                        DataNostro dataNostro = dBDataTransaksiOutgoing.getListNostro(bic8Digit, currency2);
                        if (dataNostro != null) {
                            // Ada nostronya
                            isNostroF = true;
                            narrativeTo = dataNostro.getSwift_bic();
                        }
                    }
                }

                if (mxPacs.getAppHdr().from() != null && !isNostroF) {
                    if (mxPacs.getAppHdr().from().length() == 11) {
                        narrativeTo = mxPacs.getAppHdr().from().substring(0, 8).concat("X").concat(mxPacs.getAppHdr().from().substring(9));
                    } else {
                        narrativeTo = mxPacs.getAppHdr().from().substring(0, 8).concat("XXX");
                    }
                }

                tag199_2.setTagName("_012_mf79_narrative");
                tags199_2.add(tag199_2);
                log.info("before add data tag incoming retur tipe 2");

                int returnId_headers = dBDataTransaksiOutgoing.addDataTransaksiInvestigasi(header199_2, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
//                dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(idTransaction), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), returnId_headers);
                dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(idTransaction), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));

                for (int i = 0; i < tags199_2.size(); i++) {
//                        log.info("before add datatag retur if");
                    dBDataTransaksiOutgoing.addDataTag199(tags199_2.get(i).getUrutan(), tags199_2.get(i).getTag(), tags199_2.get(i).getDetail(), tags199_2.get(i).getTagName());
//                    dBDataTransaksiOutgoing.addDataTag199(tags199_2.get(i).getUrutan(), tags199_2.get(i).getTag(), tags199_2.get(i).getDetail(), tags199_2.get(i).getTagName(), returnId_headers);
//                        log.info("after add datatag retur");
                }
                log.info("create new MT");
//                        log.info("idTransaction header mt199: " + dBDataTransaksiOutgoing.id_headers());
                log.info("id header mt199: " + returnId_headers);
                dBDataTransaksiOutgoing.addMTText(ct.createFinalMT(ct.getHeaderById(returnId_headers)), returnId_headers);
                log.info("after add data tag incoming retur tipe 2");

                //bila bukan nostro maka generate mt 202 juga
                if (header103.getIsNostro().equals("0")) {
                    //MT 202
                    List<TagDB> tags202 = new ArrayList<TagDB>();
                    DataHeaderTransaksi header202 = new DataHeaderTransaksi();
                    header202.setSender_logical_terminal("MEGAIDJAXXXX");
                    log.info("nSender_logical_terminal=" + header202.getSender_logical_terminal());
                    header202.setMessageType("202");
                    header202.setNetworkType("MT");
//                            nReceiver_institution = header103.getReceiverAddress().substring(0, 8) + "X" + header103.getReceiverAddress().substring(9);

                    // 2024-06-25 (Farras) : Dari dhika "Receiver di MT202 selalu ke nostro kita mas "
                    boolean isNostroFound = false;
                    String receiverMT202 = "";
                    BranchAndFinancialInstitutionIdentification6 instructedReimbursementAgent = mxPacs.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getInstdRmbrsmntAgt();

                    BranchAndFinancialInstitutionIdentification6 instructingReimbursementAgent = mxPacs.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getInstgRmbrsmntAgt();

                    // Ini ambil dari tag54 ya
                    if (instructedReimbursementAgent != null && !isNostroFound) {
                        if (instructedReimbursementAgent.getFinInstnId().getBICFI() != null) {
                            String bic8Digit = instructedReimbursementAgent.getFinInstnId().getBICFI().substring(0, 8);

                            // Ambil data Nostronya menggunakan bic8 dan ccy
                            DataNostro dataNostro = dBDataTransaksiOutgoing.getListNostro(bic8Digit, currency2);
                            if (dataNostro != null) {
                                // Ada nostronya
                                isNostroFound = true;
                                receiverMT202 = dataNostro.getSwift_bic();
                            }
                        }

                    }

                    // Jika tidak ada tag54 check ke tag 53
                    if (instructingReimbursementAgent != null && !isNostroFound) {
                        if (instructingReimbursementAgent.getFinInstnId().getBICFI() != null) {

                            String bic8Digit = instructingReimbursementAgent.getFinInstnId().getBICFI().substring(0, 8);
                            // Ambil data Nostronya menggunakan bic8 dan ccy
                            DataNostro dataNostro = dBDataTransaksiOutgoing.getListNostro(bic8Digit, currency2);
                            if (dataNostro != null) {
                                // Ada nostronya
                                isNostroFound = true;
                                receiverMT202 = dataNostro.getSwift_bic();
                            }
                        }

                    }

                    if (header103.getLogicalTerminal() != null && !isNostroFound) {

                        if (header103.getLogicalTerminal().length() >= 11) {
                            receiverMT202 = header103.getLogicalTerminal().substring(0, 8).concat("X").concat(header103.getLogicalTerminal().substring(9));
                        } else {
                            receiverMT202 = header103.getLogicalTerminal().substring(0, 8).concat("XXXX");
                        }
                    }
                    header202.setReceiver_institution(receiverMT202);
                    log.info("nReceiver_institution=" + receiverMT202);

                    header202.setPriority("N");
                    //20210129
                    blok3 = "121:".concat(mxPacs.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getUETR());
                    header199_2.setBlock3(blok3);
                    header202.setBlock3(blok3);
                    //end

                    header202.setOperator_comment(header103.getKomentar());
                    returnId_headers = dBDataTransaksiOutgoing.addDataTransaksiInvestigasi(header202, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
//                    dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(idTransaction), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), returnId_headers);
                    dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(idTransaction), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));

                    TagDB tag202 = new TagDB();
//                    _010_mf20_sender_reference
                    tag202.setUrutan(10);
                    tag202.setTag("20");
                    tag202.setDetail(tag20);
//                tag202.setDetail("RTR" + currDate + "" + header103.getLogicalTerminal().substring(0, 4).toString() + "" + dataInv_2.getSeq_num());S
                    tag202.setTagName("_010_mf20_sender_reference");
                    tags202.add(tag202);
//                    _011_mf21_
                    tag202 = new TagDB();
                    tag202.setUrutan(11);
                    tag202.setTag("21");
                    tag202.setDetail(_011_of21_related_reference2);
                    tag202.setTagName("_011_mf21_");
                    tags202.add(tag202);
                    //                    _060_mf32a_date
                    tag202 = new TagDB();
                    tag202.setUrutan(60);
                    tag202.setTag("32a");
                    tag202.setDetail(valueDate2);
                    tag202.setTagName("_060_mf32a_date");
                    tags202.add(tag202);
                    //                    _061_mf32a_currency
                    tag202 = new TagDB();
                    tag202.setUrutan(61);
                    tag202.setTag("32a");
                    tag202.setDetail(currency2);
                    tag202.setTagName("_061_mf32a_currency");
                    tags202.add(tag202);
                    //                    _062_mf32a_amount
                    tag202 = new TagDB();
                    tag202.setUrutan(62);
                    tag202.setTag("32a");
//                    tag202.setDetail(totCharges2);
                    tag202.setTagName("_062_mf32a_amount");
                    tags202.add(tag202);

                    // Jika ada tag 54 dan 53 maka 53 menjad tag 57
                    // Jika ada 53 tanpa ada 54 maka sender sebagai tag 57
                    // JIka tidak ada 53 dan 54 maka sender sebagai tag 57
                    if (instructedReimbursementAgent != null && instructingReimbursementAgent != null) {

                        if (instructingReimbursementAgent.getFinInstnId() != null) {

                            String bicfi = instructingReimbursementAgent.getFinInstnId().getBICFI();

                            String dbtragtBIC11;

                            if (bicfi.length() >= 11) {
                                dbtragtBIC11 = bicfi.substring(0, 8)
                                        .concat(header103.getLogicalTerminal().substring(9));
                            } else {
                                dbtragtBIC11 = bicfi.substring(0, 8).concat("XXX");
                            }

                            tag202 = new TagDB();
                            tag202.setUrutan(171);
                            tag202.setTag("57a");
                            tag202.setDetail(dbtragtBIC11);
                            tag202.setTagName("_171_of57a_identifier_code");
                            tags202.add(tag202);
                        }

                    } else {

                        String identifierCode;
                        if (header103.getLogicalTerminal().length() >= 11) {
                            identifierCode = header103.getLogicalTerminal().substring(0, 8)
                                    .concat(header103.getLogicalTerminal().substring(9));
                        } else {
                            identifierCode = header103.getLogicalTerminal().substring(0, 8).concat("XXX");
                        }

                        // Jika tag 53 juga tidak ada maka ambil dari sender MT103
                        tag202 = new TagDB();
                        tag202.setUrutan(171);
                        tag202.setTag("57a");
                        tag202.setDetail(identifierCode);
                        tag202.setTagName("_171_of57a_identifier_code");
                        tags202.add(tag202);
                    }

                    // menambahkan tag58 berdsarakan Pacs008-nya
                    // Yang menjadi Tag 58 adalah DebtorAgent atau (52)
                    // Jika dbtr namenya ada maka
                    BranchAndFinancialInstitutionIdentification6 dbtrAgt = mxPacs.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getDbtrAgt();
                    if (dbtrAgt != null) {
                        if (dbtrAgt.getFinInstnId() != null) {
                            if (dbtrAgt.getFinInstnId().getBICFI() != null) {
                                String dbtragtBIC11;

                                if (dbtrAgt.getFinInstnId().getBICFI().length() >= 11) {
                                    dbtragtBIC11 = dbtrAgt.getFinInstnId().getBICFI().substring(0, 8)
                                            .concat(header103.getLogicalTerminal().substring(9));
                                } else {
                                    dbtragtBIC11 = dbtrAgt.getFinInstnId().getBICFI().substring(0, 8).concat("XXX");
                                }

                                tag202 = new TagDB();
                                tag202.setUrutan(184);
                                tag202.setTag("58a");
                                tag202.setDetail(dbtragtBIC11);
                                tag202.setTagName("_181_of58a_identifier_code");
                                tags202.add(tag202);
                            }
                        }
                    }

                    log.info("before add data tag incoming retur");
                    for (int i = 0; i < tags202.size(); i++) {
                        dBDataTransaksiOutgoing.addDataTag199(tags202.get(i).getUrutan(), tags202.get(i).getTag(), tags202.get(i).getDetail(), tags202.get(i).getTagName());
//                        dBDataTransaksiOutgoing.addDataTag199(tags202.get(i).getUrutan(), tags202.get(i).getTag(), tags202.get(i).getDetail(), tags202.get(i).getTagName(), returnId_headers);
                    }
                    CreateText ct2 = new CreateText(dbConn.getConnection());
                    log.info("create new MT");
                    log.info("id header mt202: " + returnId_headers);
                    dBDataTransaksiOutgoing.addMTText(ct2.createFinalMT(ct2.getHeaderById(returnId_headers)), returnId_headers);
                }

                // Setelah proses berhasil, ubah statusnya jadi INC-RTR
                dBDataTransaksiOutgoing.createReturTransaksiOutgoing("INC-RTR", Integer.parseInt(idTransaction), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));

            }

            dBDataTransaksiOutgoing.updateWriteSession(0);
            String pagingHistory = HistoryPaging.getPagingHistory(request, response);
            response.sendRedirect("controllerHeaders?" + pagingHistory);
        }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
//            log.error(ex.getMessage());
        } catch (Exception ex) {
//            log.error(ex.getMessage());
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
//            log.error(ex.getMessage());
        } catch (Exception ex) {
//            log.error(ex.getMessage());
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
