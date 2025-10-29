/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
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
import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.TagDB;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDataFormatter;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.NumberToTextConverter;

/**
 *
 * @author AplDev2
 */
public class SCUploadConfirmation extends HttpServlet {

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
            throws ServletException, IOException, FileUploadException, SQLException {
        HttpSession session = request.getSession();
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        SimpleDateFormat tanggalValuta = new SimpleDateFormat("yyMMdd");
        SimpleDateFormat tanggalValutaEx = new SimpleDateFormat("dd-MMM-yyyy");
//        String tgl_trx = new SimpleDateFormat("yyMMddHHmm").format(new Date());
        String jam_trx = new SimpleDateFormat("HHmm").format(new Date());
        DBconnection dbConn = new DBconnection();
        DataHeaderTransaksi data = new DataHeaderTransaksi();
        DBDataTransaksiOutgoing dBDataTransaksiOutgoing = new DBDataTransaksiOutgoing(dbConn.getConnection());
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            try {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = upload.parseRequest(request);
                Iterator iter = items.iterator();
                FileItem item = (FileItem) iter.next();
                InputStream myxls = item.getInputStream();
                HSSFWorkbook wb = new HSSFWorkbook(myxls);
                HSSFSheet sheet = wb.getSheetAt(0);
                HSSFRow row;
                int rows;
                String noref = "";
                String ref103 = "";
                String norekDebit = "";
                String tglValutaDb = "";
                String tglValutaCr = "";
                String currencyDb = "";
                String norekKredit = "";
                String id = "";
                String tag71 = "";
                String tag57Acc;
                String tag57Bic;
                rows = sheet.getPhysicalNumberOfRows();
                // System.out.println("rows nyaeta :" + rows);
                for (int i = 1; i < rows; i++) {
                    // log.info("cetakkk ....." + i);
                    // log.info("masuk for");
                    row = sheet.getRow(i);
                    HSSFDataFormatter df = new HSSFDataFormatter();
                    noref = row.getCell(0).toString();

                    HSSFCell cellRef103 = row.getCell(1);
//                    ref103 = df.formatCellValue(cellRef103);
                    if (cellRef103.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                        ref103 = NumberToTextConverter.toText(Double.parseDouble(row.getCell(1).toString()));
                        if (ref103.length() > 15) {
                            ref103 = ref103.substring(0, 15);
                        }
                        log.info("1 " + ref103);
                    } else {
                        ref103 = df.formatCellValue(cellRef103);
                        log.info("2 " + ref103);
                    }
                    HSSFCell cellRekDb = row.getCell(4);
                    if (cellRekDb.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                        norekDebit = NumberToTextConverter.toText(Double.parseDouble(row.getCell(4).toString()));
                        log.info("3 " + norekDebit);
                    } else {
                        norekDebit = df.formatCellValue(cellRekDb);
                        log.info("4 " + norekDebit);
                    }
                    tglValutaDb = row.getCell(6).toString();
                    Date tgl = tanggalValutaEx.parse(tglValutaDb);
                    tglValutaDb = tanggalValuta.format(tgl);
                    tglValutaCr = row.getCell(11).toString();
                    tgl = tanggalValutaEx.parse(tglValutaCr);
                    tglValutaCr = tanggalValuta.format(tgl);
                    currencyDb = row.getCell(7).toString();
                    HSSFCell cellRekCr = row.getCell(9);
                    if (cellRekCr.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                        norekKredit = NumberToTextConverter.toText(Double.parseDouble(row.getCell(9).toString()));
                        log.info("5 " + norekKredit);
                    } else {
                        norekKredit = df.formatCellValue(cellRekCr);
                        log.info("6 " + norekKredit);
                    }

                    List<String> dataTag71 = dBDataTransaksiOutgoing.getTag71(ref103, tglValutaDb, currencyDb, norekKredit);
                    log.info("dataTag71.size() : " + dataTag71.size());
                    if (dataTag71.size() > 0) {
                        log.info("ada MT103");
                        for (int j = 0; j < dataTag71.size(); j++) {
                            String str_data71 = dataTag71.get(j);
                            String[] rel71 = str_data71.split("#");
                            String relTag71 = rel71[0].trim();
                            id = rel71[2].trim();
                            log.info("tag71Detail :" + relTag71 + "#idHeaders :" + id);
                            String tag54A = dBDataTransaksiOutgoing.getTag54A(id);
                            if (relTag71.length() > 2) {
                                log.info("relTag71.length: " + relTag71.length());
                                if (relTag71.equalsIgnoreCase("OUR")) {

                                    log.info("71 OUR");
                                    log.info("create 191"); // 20200203
                                    dBDataTransaksiOutgoing.createReturTransaksiOutgoing("INC-CNF", Integer.parseInt(id), row.getCell(15) + "|" + row.getCell(16), noref.substring(0, noref.indexOf(";")));
                                    Header header103 = dBDataTransaksiOutgoing.getHeaderById(id);
                                    List<TagDB> tags103 = dBDataTransaksiOutgoing.getAllTagById(id);
                                    String currency = "";
                                    String amount = "";
                                    String _011_of21_related_reference = "";
                                    String valueDate = "";
                                    CreateText ct = new CreateText(dbConn.getConnection());
//                                    CreateTextNew ctn = new CreateTextNew(dbConn.getConnection());
                                    if (!header103.getReceiverAddress().contains("CENAIDJA") && !header103.getReceiverAddress().contains("BMRIIDJA")) {
                                        DataHeaderTransaksi header191 = new DataHeaderTransaksi();
                                        List<TagDB> tags191 = new ArrayList<TagDB>();
                                        header191.setSender_logical_terminal("MEGAIDJAXXXX");
                                        log.info("nSender_logical_terminal=" + header191.getSender_logical_terminal());
                                        header191.setMessageType("191");
                                        String nReceiver_institution = header103.getReceiverAddress().substring(0, 8) + "X" + header103.getReceiverAddress().substring(9);
                                        header191.setReceiver_institution(nReceiver_institution);
                                        log.info("nReceiver_institution=" + header191.getReceiver_institution());
                                        header191.setPriority("N");
                                        //20210127 ditambah ini
                                        String blok3 = header103.getBlock3().substring(header103.getBlock3().indexOf("121:"));
                                        if (blok3.contains("433:")) {
                                            blok3 = blok3.replace(blok3.substring(blok3.indexOf("433:")), "");
                                        }
                                        //--------
//                                        header191.setBlock3(header103.getBlock3().substring(header103.getBlock3().indexOf("121:")));
                                        header191.setBlock3(blok3);

//                                        DataInvestigation dataInv = dBDataTransaksiOutgoing.getDataInv(id);
                                        log.info("add data transaksi penagihan");
                                        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                                        String currDate = new SimpleDateFormat("yyMMdd").format(new Date());
                                        //                    tag MT199
                                        String _010_mf20_sender_reference = "";
                                        String _012_mf79_narrative = "";
                                        String reason = header103.getKomentar();
                                        String tag53Bic = "";

                                        //                    log.info("reason : "+reason);
                                        for (int a = 0; a < tags103.size(); a++) {
                                            //                        _011_of21_related_reference
                                            if (tags103.get(a).getTagName().equalsIgnoreCase("_010_mf20_sender_reference")) {
                                                _011_of21_related_reference = tags103.get(a).getDetail();
                                            } else if (tags103.get(a).getTagName().equalsIgnoreCase("_061_mf32a_currency")) {
                                                currency = tags103.get(a).getDetail();
                                            } else if (tags103.get(a).getTagName().equalsIgnoreCase("_062_mf32a_amount")) {
                                                amount = tags103.get(a).getDetail();
                                            } else if (tags103.get(a).getTagName().equalsIgnoreCase("_060_mf32a_date")) {
                                                valueDate = tags103.get(a).getDetail();
                                            } else if (tags103.get(a).getTagName().equalsIgnoreCase("_121_of53a_identifier_code")) {
                                                tag53Bic = tags103.get(a).getDetail();
                                            }
                                        }
                                        DataCharges charges = dBDataTransaksiOutgoing.getCharges(currency);
                                        if (charges.getCurrency() == null) {
                                            log.info("charges " + currency + " tidak ditemukan");
                                        } else {
                                            dBDataTransaksiOutgoing.addDataTransaksiInvestigasi(header191);
                                            dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(id));
                                            TagDB tag191 = new TagDB();
                                            //                    _010_mf20_sender_reference
                                            tag191.setUrutan(10);
                                            tag191.setTag("20");
                                            tag191.setDetail(noref.substring(0, 12));
                                            tag191.setTagName("_010_mf20_transaction_reference_number");
                                            tags191.add(tag191);
                                            //                    _020_mf21_
                                            tag191 = new TagDB();
                                            tag191.setUrutan(20);
                                            tag191.setTag("21");
                                            tag191.setDetail(_011_of21_related_reference);
                                            tag191.setTagName("_020_mf21_related_reference");
                                            tags191.add(tag191);
                                            //                    _030_mf32b_
                                            tag191 = new TagDB();
                                            tag191.setUrutan(30);
                                            tag191.setTag("32B");
                                            tag191.setDetail(currency);
                                            tag191.setTagName("_030_mf32b_currency");
                                            tags191.add(tag191);
                                            //                    _031_mf32b_
                                            tag191 = new TagDB();
                                            tag191.setUrutan(31);
                                            tag191.setTag("32B");

                                            if (currency.equalsIgnoreCase("JPY")) {
                                                tag191.setDetail(charges.getCharges().replaceAll("[.].*", ","));
                                            } else {
                                                tag191.setDetail(charges.getCharges().replace(".", ","));
                                            }
                                            tag191.setTagName("_031_mf32b_amount");
                                            tags191.add(tag191);
                                            if (tag54A.equalsIgnoreCase("none")) {
                                                tag57Bic = header103.getReceiverAddress().substring(0, 8) + header103.getReceiverAddress().substring(9);
                                                tag57Acc = dBDataTransaksiOutgoing.getAccPenagihan(tag57Bic);
                                                if (tag57Acc.equalsIgnoreCase("")) {
                                                    tag57Acc = dBDataTransaksiOutgoing.getAccPenagihan(tag53Bic);
                                                    tag57Bic = tag53Bic;
                                                }
                                            } else {
                                                tag57Bic = tag54A;
                                                tag57Acc = dBDataTransaksiOutgoing.getAccPenagihan(tag57Bic);
                                            }
                                            //                    _050_of57a_
                                            tag191 = new TagDB();
                                            tag191.setUrutan(50);
                                            tag191.setTag("57A");
                                            tag191.setDetail("/" + tag57Acc);
                                            tag191.setTagName("_050_of57a_party_identifier");
                                            tags191.add(tag191);
                                            //                    _051_of57a_
                                            tag191 = new TagDB();
                                            tag191.setUrutan(51);
                                            tag191.setTag("57A");
                                            tag191.setDetail(tag57Bic);
                                            tag191.setTagName("_051_of57a_identifier_code");
                                            tags191.add(tag191);
                                            //                    _060_mf71b_
                                            tag191 = new TagDB();
                                            tag191.setUrutan(60);
                                            tag191.setTag("71B");
                                            tag191.setDetail("BEING CHARGES OF YR MT 103\r\n"
                                                    + "DD " + valueDate + "\r\n"
                                                    + currency + " " + amount);
                                            tag191.setTagName("_060_mf71b_details_charges");
                                            tags191.add(tag191);
                                            //                    
                                            log.info("before add datatag penagihan");
                                            for (int a = 0; a < tags191.size(); a++) {
                                                //                        log.info("before add datatag retur if");
                                                dBDataTransaksiOutgoing.addDataTag199(tags191.get(a).getUrutan(), tags191.get(a).getTag(), tags191.get(a).getDetail(), tags191.get(a).getTagName());
                                                //                        log.info("after add datatag retur");
                                            }

                                            log.info("create new MT");
                                            log.info("id header mt191: " + dBDataTransaksiOutgoing.id_headers());
                                            dBDataTransaksiOutgoing.addMTText(ct.createFinalMT(ct.getHeaderById(dBDataTransaksiOutgoing.id_headers())), dBDataTransaksiOutgoing.id_headers());
                                            ct.getFinalMT((String) session.getAttribute("channel"), dBDataTransaksiOutgoing.id_headers(), "I", "", (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name") );
                                            // log.info("after add datatag penagihan");
                                        }

                                    }

                                    //MT199 Confirmation                        
                                    log.info("get confirmation kredit payment"); // 20190903
                                    DataHeaderTransaksi header199 = new DataHeaderTransaksi();
                                    List<TagDB> tags199 = new ArrayList<TagDB>();
                                    header199.setSender_logical_terminal("MEGAIDJAXXXX");
                                    log.info("nSender_logical_terminal=" + header199.getSender_logical_terminal());
                                    header199.setMessageType("199");
                                    header199.setReceiver_institution("TRCKCHZZXXXX");
                                    log.info("nReceiver_institution=" + header199.getReceiver_institution());
                                    header199.setPriority("N");
                                    //20210127 ditambah ini
                                    String blok3 = header103.getBlock3().substring(header103.getBlock3().indexOf("121:"));
                                    if (blok3.contains("433:")) {
                                        blok3 = blok3.replace(blok3.substring(blok3.indexOf("433:")), "");
                                    }
                                    //-------
//                                    header199.setBlock3(header103.getBlock3().substring(header103.getBlock3().indexOf("121:")));
                                    header199.setBlock3(blok3);

                                    dBDataTransaksiOutgoing.addDataTransaksiInvestigasi(header199);
                                    dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(id));
//                                    DataInvestigation dataInv199 = dBDataTransaksiOutgoing.getDataInv(id);
                                    log.info("add data transaksi kredit payment");
                                    for (int a = 0; a < tags103.size(); a++) {
                                        //                        _011_of21_related_reference
                                        if (tags103.get(a).getTagName().equalsIgnoreCase("_010_mf20_sender_reference")) {
                                            _011_of21_related_reference = tags103.get(a).getDetail();
                                        } else if (tags103.get(a).getTagName().equalsIgnoreCase("_061_mf32a_currency")) {
                                            currency = tags103.get(a).getDetail();
                                        } else if (tags103.get(a).getTagName().equalsIgnoreCase("_062_mf32a_amount")) {
                                            amount = tags103.get(a).getDetail();
                                        } else if (tags103.get(a).getTagName().equalsIgnoreCase("_060_mf32a_date")) {
                                            valueDate = tags103.get(a).getDetail();
                                        }
                                    }
                                    TagDB tag199 = new TagDB();
                                    //                    _010_mf20_sender_reference
                                    tag199.setUrutan(10);
                                    tag199.setTag("20");
                                    tag199.setDetail(noref.substring(0, 12));
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
                                    tag199.setDetail("//" + tglValutaCr + jam_trx + "+0700\r\n"
                                            + "//ACCC" + "\r\n"
                                            + "//MEGAIDJA" + "\r\n"
                                            + "//" + currency + amount);
                                    tag199.setTagName("_012_mf79_narrative");
                                    tags199.add(tag199);
                                    // log.info("before add datatag investigasi");
                                    for (int a = 0; a < tags199.size(); a++) {
                                        //                        log.info("before add datatag retur if");
                                        dBDataTransaksiOutgoing.addDataTag199(tags199.get(a).getUrutan(), tags199.get(a).getTag(), tags199.get(a).getDetail(), tags199.get(a).getTagName());
                                        //                        log.info("after add datatag retur");
                                    }
                                    //                        CreateText ct = new CreateText(dbConn.getConnection());
                                    log.info("create new MT");
                                    log.info("id header mt199: " + dBDataTransaksiOutgoing.id_headers());
                                    dBDataTransaksiOutgoing.addMTText(ct.createFinalMT(ct.getHeaderById(dBDataTransaksiOutgoing.id_headers())), dBDataTransaksiOutgoing.id_headers());
                                    ct.getFinalMT((String) session.getAttribute("channel"), dBDataTransaksiOutgoing.id_headers(), "I", "", (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                                    // log.info("after add data tag confirmation kredit payment");

                                } else {
                                    // log.info("bukan OUR");
                                    // log.info("get confirmation kredit payment"); // 20190903
                                    dBDataTransaksiOutgoing.createReturTransaksiOutgoing("INC-CNF", Integer.parseInt(id), row.getCell(15) + "|" + row.getCell(16), noref.substring(0, noref.indexOf(";")));
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
                                    //20210127 ditambah ini
                                    String blok3 = header103.getBlock3().substring(header103.getBlock3().indexOf("121:"));
                                    if (blok3.contains("433:")) {
                                        blok3 = blok3.replace(blok3.substring(blok3.indexOf("433:")), "");
                                    }

                                    //-------
//                                    header199.setBlock3(header103.getBlock3().substring(header103.getBlock3().indexOf("121:")));
                                    header199.setBlock3(blok3);
                                    //end

                                    dBDataTransaksiOutgoing.addDataTransaksiInvestigasi(header199);
                                    dBDataTransaksiOutgoing.createDataInvestigasi(Integer.parseInt(id));
//                                    DataInvestigation dataInv = dBDataTransaksiOutgoing.getDataInv(id);
                                    // log.info("add data transaksi kredit payment");
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
                                    for (int a = 0; a < tags103.size(); a++) {
                                        //                        _011_of21_related_reference
                                        if (tags103.get(a).getTagName().equalsIgnoreCase("_010_mf20_sender_reference")) {
                                            _011_of21_related_reference = tags103.get(a).getDetail();
                                        } else if (tags103.get(a).getTagName().equalsIgnoreCase("_061_mf32a_currency")) {
                                            currency = tags103.get(a).getDetail();
                                        } else if (tags103.get(a).getTagName().equalsIgnoreCase("_062_mf32a_amount")) {
                                            amount = tags103.get(a).getDetail();
                                        } else if (tags103.get(a).getTagName().equalsIgnoreCase("_060_mf32a_date")) {
                                            valueDate = tags103.get(a).getDetail();
                                        }
                                    }
                                    TagDB tag199 = new TagDB();
                                    //                    _010_mf20_sender_reference
                                    tag199.setUrutan(10);
                                    tag199.setTag("20");
                                    tag199.setDetail(noref.substring(0, 12));
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
                                    tag199.setDetail("//" + tglValutaCr + jam_trx + "+0700\r\n"
                                            + "//ACCC" + "\r\n"
                                            + "//MEGAIDJA" + "\r\n"
                                            + "//" + currency + amount);
                                    tag199.setTagName("_012_mf79_narrative");
                                    tags199.add(tag199);
                                    log.info("before add datatag investigasi");
                                    for (int a = 0; a < tags199.size(); a++) {
                                        //                        log.info("before add datatag retur if");
                                        dBDataTransaksiOutgoing.addDataTag199(tags199.get(a).getUrutan(), tags199.get(a).getTag(), tags199.get(a).getDetail(), tags199.get(a).getTagName());
                                        //                        log.info("after add datatag retur");
                                    }
                                    CreateText ct = new CreateText(dbConn.getConnection());
                                    log.info("create new MT");
                                    log.info("id header mt199: " + dBDataTransaksiOutgoing.id_headers());
                                    dBDataTransaksiOutgoing.addMTText(ct.createFinalMT(ct.getHeaderById(dBDataTransaksiOutgoing.id_headers())), dBDataTransaksiOutgoing.id_headers());
                                    ct.getFinalMT((String) session.getAttribute("channel"), dBDataTransaksiOutgoing.id_headers(), "I", "",  (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                                    log.info("after add data tag confirmation kredit payment");
                                }
                            }
                            // log.info("perulangan");
                        }
                    } else {
                        log.info("MT103 tidak ditemukan");
                    }
                }
                // log.info("berhaasil");
                RequestDispatcher dispatcher = request.getRequestDispatcher("upload_confirmation.jsp?status=y126");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                log.error("error upload : " + e.toString());
                e.printStackTrace();
                session.setAttribute("err", e.toString());
                RequestDispatcher dispatcher = request.getRequestDispatcher("upload_confirmation.jsp?status=x126");
                dispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("upload_confirmation.jsp?status=x126");
            dispatcher.forward(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            java.util.logging.Logger.getLogger(SCUploadConfirmation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SCUploadConfirmation.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (FileUploadException ex) {
            java.util.logging.Logger.getLogger(SCUploadConfirmation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SCUploadConfirmation.class.getName()).log(Level.SEVERE, null, ex);
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
