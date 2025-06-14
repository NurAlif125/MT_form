/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataBICGO;
import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.sql.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataHeaderTransaksi;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.TagDB;
import com.vensys.appcm.myutils.HistoryPaging;
import org.apache.log4j.Logger;
//import org.apache.log4j.Logger;

/**
 *
 * @author M Abdul Hadi
 */
public class SCDataTransaksiOutgoing extends HttpServlet {

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
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");     //20211216
        //simple date format
//        String pattern = "yyyy-MM-dd";
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//        String date = simpleDateFormat.format(new Date());

//        Date now = new Date();
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String[] idsToUpdate = request.getParameterValues("chkId");
        String io_typeStatus = (String) session.getAttribute("io_typeStatus");
        String flagStatus = (String) session.getAttribute("flagStatus");
        String flag = request.getParameter("flag");
        String action_type = request.getParameter("action_type");
        if (action_type == null) {
            action_type = "";
        }
        String lastInsertedID = "";
        int cek = 0;
        String messageType = request.getParameter("messageType");
        String komentar = request.getParameter("komentar");
        DBconnection dbConn = new DBconnection();
        DBconnection2 dbConn2 = new DBconnection2();
        DataHeaderTransaksi data = new DataHeaderTransaksi();
        Header header = new Header();
        CreateText ct = new CreateText(dbConn.getConnection());
        CreateTextNew ctn = new CreateTextNew(dbConn.getConnection());
        DBDataTransaksiOutgoing dBDataTransaksiOutgoing = new DBDataTransaksiOutgoing(dbConn.getConnection());
        DBDataTransaksiOutgoing dBDataTransaksiOutgoing2 = new DBDataTransaksiOutgoing(dbConn2.getConnection2());
        String dataXml = request.getParameter("dataXML");

//        log.info("SCData Transaksi Outgoign Awalan");
        if (idsToUpdate == null) {
            //data header
            log.info("sender1: " + request.getParameter("sender_logical_terminal"));
            data.setSender_logical_terminal(request.getParameter("sender_logical_terminal"));
            data.setMessageType(messageType);
            header.setMessageType(messageType);
            data.setFlag("VER");
            data.setReceiver_institution(request.getParameter("receiver_institution"));
            data.setPriority(request.getParameter("priority"));
            data.setMonitoring(request.getParameter("monitoring"));
            data.setBanking_priority(request.getParameter("banking_priority"));
            data.setMur(request.getParameter("mur"));
            data.setOperator_comment(request.getParameter("operator_comment"));
            data.setBlock3(request.getParameter("block3"));
            data.setMulti_currency(request.getParameter("multi_currency"));
            header.setLogicalTerminal(data.getSender_logical_terminal());
            header.setReceiverAddress(data.getReceiver_institution());
            data.setNetworkType("MT");
//            header.setTanggal(now.toString());//tanggal date time formatter
//            header.setTanggal_date(now);

            //end of the code
            //UETR
            if (messageType.equals("103") || messageType.contains("202") || messageType.equals("200")) {//191227 ditambah uetr
                log.info("masuk sini 181");
                if (flagStatus.length() > 0) {
                    log.info("masuk sini 183");
//                    if (flagStatus.equalsIgnoreCase("MOD")) {
                    if (action_type.equalsIgnoreCase("Save")) {
                        if (messageType.contains("COV")) {
                            data.setBlock3("119:COV;");
                        }
                        if (!data.getBlock3().contains("121:")) {
                            log.info("masuk sini 185");
                            String uetr = UUID.randomUUID().toString();
                            data.setBlock3(data.getBlock3() + "121:" + uetr + ";");

                        } else {
                            data.setBlock3(data.getBlock3().replace("111:009;", ""));
                        }
                    }
                } else {
                    log.info("masuk else 196 " + data.getBlock3());
                    if (action_type.equalsIgnoreCase("Save")) {
                        if (messageType.contains("COV")) {
                            data.setBlock3("119:COV;");
                        }
                        if (!data.getBlock3().contains("121:")) {
                            log.info("masuk sini 198");
                            String uetr = UUID.randomUUID().toString();
                            data.setBlock3(data.getBlock3() + "121:" + uetr + ";");
                        } else {
                            data.setBlock3(data.getBlock3().replace("111:009;", ""));
                        }
                    }
                }
            }

            // System.out.println("flagStatus: " + flagStatus);
//            // System.out.println("flag: " + request.getParameter("flag"));
//                System.out.println("=============================message type: "+messageType);
//                System.out.println("========================= Reference : "+request.getParameter("instrId"));
            if (id == null ? "null" == null : id.equals("null") || id.isEmpty()) {
                String reference = "";
                if (!messageType.contains("pacs") || !messageType.contains("camt")) {
                    reference = "Reference: "+request.getParameter("_010_mf20_sender_reference");
                } 
                
                lastInsertedID = dBDataTransaksiOutgoing2.addDataTransaksiOutgoing(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), (String) session.getAttribute("channel"), reference);
                log.info("lastInsertedID " + lastInsertedID);
            } else {
                if (io_typeStatus.equalsIgnoreCase("I")) {
                    if (request.getParameter("flag") == null) {
                        log.info("flag req null");
                        if (flagStatus.equalsIgnoreCase("MOD") || flagStatus.equalsIgnoreCase("CVT-MOD")) {
                            dBDataTransaksiOutgoing2.updateDataTransaksiOutgoing(data, flag, (String) session.getAttribute("user_id"), Integer.parseInt(id), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                        }
                    } else {
                        // System.out.println("flag req ada");
                        if (flagStatus.equalsIgnoreCase("MOD") || flagStatus.equals("CVT-MOD")) {
                            log.info("flag req mod");
                            if (request.getParameter("sender_logical_terminal") == null) {
                                log.info("sender null");
                                dBDataTransaksiOutgoing2.updateStatusTransaksiOutgoing(request.getParameter("flag"), Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "I");
                            } else {
                                log.info("sender ada");
                                dBDataTransaksiOutgoing2.updateDataTransaksiOutgoing(data, flag, (String) session.getAttribute("user_id"), Integer.parseInt(id), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                            }
//                        } else if (flagStatus.equalsIgnoreCase("VER")) {
//                            System.out.println("flag req ver");
//                            dBDataTransaksiOutgoing.updateCommentMod(komentar, flag, (String) session.getAttribute("user_id"), Integer.parseInt(id), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                        } else {
                            // System.out.println("flag req selain ver and mod");
                            dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing(request.getParameter("flag"), Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "I", messageType);
                            
                            if ((flagStatus.equalsIgnoreCase("VER") && flag.equalsIgnoreCase("MOD")) || (flagStatus.equalsIgnoreCase("CVT-VER") && flag.equalsIgnoreCase("CVT-MOD"))) {
                                // log.info("kadieuu flag selain mod 146");
                                dBDataTransaksiOutgoing2.updateCommentMod(komentar, flag, (String) session.getAttribute("user_id"), Integer.parseInt(id), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), flagStatus);
                            }
                        }
                    }
                } else {
                    log.info("SCDataTransaksiOutgoing-else-2 : " + flagStatus);
                    if (request.getParameter("flag") == null) {
                        log.info("SCDataTransaksiOutgoing-elseif-1");
                        dBDataTransaksiOutgoing2.updateStatusTransaksiOutgoing("INC-WAIT", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "I");
                    } else {
                        if(request.getParameter("flag").equalsIgnoreCase("INC-SPRT")){
                            dBDataTransaksiOutgoing2.updateStatusTransaksiOutgoing("WAITING-SAA-CNF", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "I");
                        }
                        if (request.getParameter("flag").equalsIgnoreCase("INC-SPRT")) {
                            log.info("flagstatus 161 " + flagStatus);
                            String special_rate = request.getParameter("special_rate");
                            String special_rate_multi = request.getParameter("special_rate_multi");
                            String branch_101 = "";
                            if (messageType.equals("101")) {
                                branch_101 = request.getParameter("branch_101");
                            }
                        } else {
                            //new flag 19-05-2025
                            dBDataTransaksiOutgoing2.updateStatusTransaksiOutgoing(request.getParameter("flag"), Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "I");
                        }
                    }
                }
            }
            //data body
            TagDB tag = new TagDB();
            Enumeration names = request.getParameterNames();
            String tags;
            //Clean ID Header
//            if (request.getParameter("flag") == null) {
//                dBDataTransaksiOutgoing.cleanDataTag(id);
//            }
            //191227 ditambah cleanTag
            if (id == null ? "null" == null : id.equals("null") || id.isEmpty()) {
//                dBDataTransaksiOutgoing.cleanDataTag(id);
            } else {
                // System.out.println("baris 266");
                if (flagStatus.equalsIgnoreCase("MOD") || flagStatus.equalsIgnoreCase("CVT-MOD") || flagStatus.equalsIgnoreCase("INC-HOLD") || flagStatus.equalsIgnoreCase("INC-WAIT")) {//191202 ditambah if //191227 ditambah inc-wait
                    log.info("baris 268");
                    dBDataTransaksiOutgoing2.cleanDataTag(Integer.parseInt(id));
                    log.info("baris 270");
                }
                // System.out.println("baris 272");
            }
            if (!flagStatus.equalsIgnoreCase("INC-NSTP")) {
                while (names.hasMoreElements()) {
                    tags = names.nextElement().toString();
                    if (tags.startsWith("_")) {
                        StringTokenizer st = new StringTokenizer(tags, "_");
                        int i = 0;
                        String arr[] = new String[st.countTokens()];
                        while (st.hasMoreElements()) {
                            arr[i] = st.nextToken().trim();
//                        System.out.println("arr[" + i + "]" + arr[i]); di komen heula
                            i++;
                        }
                        tag.setUrutan(Integer.parseInt(arr[0]));    //urutan
                        tag.setTag(arr[1].substring(2));    //tag
                        tag.setDetail(request.getParameter(tags));  //detail
                        tag.setTagName(tags);   //tagName
                        //20211216 penambahan get tagMT 103 untuk pengecekan duplikat
                        if (tag.getTagName().equalsIgnoreCase("_010_mf20_sender_reference")) {
                            header.setTrans_refference(tag.getDetail());
                        } else if (tag.getTagName().equalsIgnoreCase("_011_mf21_")) {
                            header.setTrans_related_refference(tag.getDetail());
                        } else if (tag.getTagName().equalsIgnoreCase("_062_mf32a_amount")) {
                            header.setTrans_amount(tag.getDetail().replace(",", "."));
                        } else if (tag.getTagName().equalsIgnoreCase("_061_mf32a_currency")) {
                            header.setTrans_ccy(tag.getDetail());
                        } else if (tag.getTagName().equalsIgnoreCase("_060_mf32a_date")) {
                            header.setTrans_date_value(tag.getDetail());
                        } else if (tag.getTagName().equalsIgnoreCase("_171_of57a_identifier_code")) {
                            header.setTag57(tag.getDetail());
                        } else if (tag.getTagName().equalsIgnoreCase("_180_mf59_account") || (tag.getTagName().equalsIgnoreCase("_185_mf59f_account"))) {
                            header.setTag59Acc(tag.getDetail());
                        }
                        //end of the line 20211216 //
                        if (id == null ? "null" == null : id.equals("null") || id.isEmpty()) {
//                        log.info("masuk id null"); di komen heula banyak log na soalna

//                        int id_headers = dBDataTransaksiOutgoing.id_headers();
//                        log.info("get id header: " + id_headers); di komen heula banyak log na soalna
                            if (tag.getTag().startsWith("15")) {
                                dBDataTransaksiOutgoing2.addDataTag(tag.getUrutan(), tag.getTag(), tag.getDetail(), tag.getTagName(), Integer.parseInt(lastInsertedID));
                            } else {
                                if (!tag.getDetail().isEmpty()) {
                                    dBDataTransaksiOutgoing2.addDataTag(tag.getUrutan(), tag.getTag(), tag.getDetail(), tag.getTagName(), Integer.parseInt(lastInsertedID));
                                }
                            }
                        } else {
                            log.info("update data MT");
                            if (tag.getTag().startsWith("15")) {
                                log.info("tag 207 " + tag.getTag());
                                cek = dBDataTransaksiOutgoing.cekDataTags(id, tags);
                                log.info("cek 209 " + cek);
                                if (cek == 0) {
                                    dBDataTransaksiOutgoing2.addDataTagsBeforeNoTags(tag.getUrutan(), id, tag.getTag(), tag.getDetail(), tag.getTagName());
                                }
                            } else {
                                if (!tag.getDetail().isEmpty()) {
                                    // System.out.println(tag.getUrutan() + tag.getDetail() + tag.getTag() + tag.getTagName());
                                    dBDataTransaksiOutgoing2.addDataTag(tag.getUrutan(), tag.getTag(), tag.getDetail(), tag.getTagName(), Integer.parseInt(id));
                                }
                            }
                        }
                    }
                }
//            CreateText ct = new CreateText(dbConn.getConnection());
                //Add to MT Text
                if (id == null ? "null" == null : id.equals("null") || id.isEmpty()) {
                    int id_headers = dBDataTransaksiOutgoing.id_headers();
                    log.info("create new MT");
                    List<Integer> idDupe = dBDataTransaksiOutgoing.cekDuplikatID(header);
                    int lengthIdDupe = idDupe.size();
                    log.info("panjang dupe nya.... " + lengthIdDupe);
                    if (lengthIdDupe > 1) {
                        log.info("246 masuk if");
                        for (int ld = 1; ld < lengthIdDupe; ld++) {
                            dBDataTransaksiOutgoing2.updateDuplikat(idDupe.get(ld));
                            log.info("sini 249");
                        }
                        // log.info("masuk if 270");
                    }
                    if (messageType.equals("760") || messageType.equals("767") || messageType.equals("300") || messageType.equals("320")) {
                        dBDataTransaksiOutgoing2.addMTText(ctn.createFinalMT(ctn.getHeaderById(id_headers)), id_headers);
                    } else {
                        dBDataTransaksiOutgoing2.addMTText(ct.createFinalMT(ct.getHeaderById(id_headers)), id_headers);
                    }
                } else {
                    if (messageType.contains("pacs") || messageType.contains("camt")) {
                        log.info("update data MX");
//                        dBDataTransaksiOutgoing2.updateMXText(dataXml, Integer.parseInt(id));
                    } else {
                        log.info("update data MT");
                        if (messageType.equals("760") || messageType.equals("767") || messageType.equals("300") || messageType.equals("320")) {
                            dBDataTransaksiOutgoing2.updateMTText(ctn.createFinalMT(ctn.getHeaderById(Integer.parseInt(id))), Integer.parseInt(id));
                        } else {
                            dBDataTransaksiOutgoing2.updateMTText(ct.createFinalMT(ct.getHeaderById(Integer.parseInt(id))), Integer.parseInt(id));
                        }
                    }
                }
//                20211215 penambahan cek duplikat create manual

                // end of the line
            }

        } else {
            for (int i = 0; i < idsToUpdate.length; i++) {
                log.info(idsToUpdate[i]);
                dBDataTransaksiOutgoing2.updateStatusTransaksiOutgoing(request.getParameter("flag"), Integer.parseInt(idsToUpdate[i]), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "I");
            }
        }
        dbConn.closeConnection();
        dbConn2.closeConnection2();
//        RequestDispatcher dispatcher = request.getRequestDispatcher("controllerHeaders");
//        dispatcher.forward(request, response);
        String pagingHistory = HistoryPaging.getPagingHistory(request, response);
        response.sendRedirect("controllerHeaders?" + pagingHistory);

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
            log.error(ex.getMessage());
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            log.error(ex.getMessage());
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
