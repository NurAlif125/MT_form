/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.attribute.AKoneksiData;
import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.WSInquiryRek;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataHeaderTransaksi;
import com.vensys.appcm.model.DataInvestigation;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.MKoneksiData;
import com.vensys.appcm.model.TagDB;

/**
 *
 * @author M Abdul Hadi
 */
public class SCDataTransaksiIncoming extends HttpServlet {

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

        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String flagStatus = (String) session.getAttribute("flagStatus");

        String messageType = request.getParameter("messageType");
        DBconnection dbConn = new DBconnection();
        DataHeaderTransaksi data = new DataHeaderTransaksi();
        WSInquiryRek wsIr = new WSInquiryRek();
        MKoneksiData dataM = new MKoneksiData();
        DBDataTransaksiOutgoing dBDataTransaksiOutgoing = new DBDataTransaksiOutgoing(dbConn.getConnection());
        //data header
        data.setSender_logical_terminal(request.getParameter("sender_logical_terminal"));
        data.setMessageType(messageType);
        data.setReceiver_institution(request.getParameter("receiver_institution"));
        data.setPriority(request.getParameter("priority"));
        data.setMonitoring(request.getParameter("monitoring"));
        data.setBanking_priority(request.getParameter("banking_priority"));
        data.setMur(request.getParameter("mur"));
        data.setOperator_comment(request.getParameter("operator_comment"));
        data.setBlock3(request.getParameter("block3"));
        CreateText ct = new CreateText(dbConn.getConnection());
//        CreateTextNew ctn = new CreateTextNew(dbConn.getConnection());
        MKoneksiData dataFile = new MKoneksiData();
        AKoneksiData atribute = new AKoneksiData();
        dataFile = atribute.getAtributeKoneksiData();
        String networkType = dBDataTransaksiOutgoing.getNetworkType(Integer.parseInt(id));
        if (request.getParameter("flag").equalsIgnoreCase("VERACC")) { // 20180906 ditambah flag VERACC
            String acct = request.getParameter("acct");
            log.info("ACCT REK veracc:" + acct);
            String name = request.getParameter("accname");
            String acctnbr = request.getParameter("accnbr");
            if (session.getAttribute("nama_core") == null) {
                log.info("name_core null");
//                System.out.println("masuk if null nama_core");
//                String[] inqRek;
////            String testResponse = "1#7074906007#SITI KOMARIAH#CIAMIS";
////            inqRek = testResponse.split("#");
//                inqRek = wsIr.getResponseWSInquiryRek(dataM.getUrlWs(), dataM.getWebEnv(), dataM.getAction(), acctnbr).split("#");
//                if (inqRek.length > 1) {
//                    int found = Integer.parseInt(inqRek[0]);
//                    if (found == 1) {
//                        String acctname_lawan = inqRek[2].trim();
//                        dBDataTransaksiOutgoing.updateVerifiedAccount(acct, name);
//                        Integer idTemp = Integer.parseInt(id);
//                        String namaCore = dBDataTransaksiOutgoing.getVerifiedAccName(acct);
//                        String type59 = dBDataTransaksiOutgoing.getType59(acct, idTemp);
//                        log.info("Nama Core:" + namaCore);
//                        log.info("Nama :" + name);
//                        if (name.contains(acctname_lawan)) {
//                            log.info("Name Account Verified By WS");
//                            dBDataTransaksiOutgoing.updateTag59Name(idTemp, namaCore, type59);
//                            dBDataTransaksiOutgoing.updateMTText(ct.createFinalMT(ct.getHeaderById(Integer.parseInt(id))), Integer.parseInt(id));
//                            dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-STL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
//                        } else {
//                            log.info("Name Account Not Verified By WS");
//                        }
//                    } else {
//                        log.info("Rekeningg tidak ditemukan");
//                    }
//                }
            } else {
                System.out.println("masuk else nama_core");
                dBDataTransaksiOutgoing.updateVerifiedAccount(acct, name);
                Integer idTemp = Integer.parseInt(id);
                String namaCore = dBDataTransaksiOutgoing.getVerifiedAccName(acct);
                String type59 = dBDataTransaksiOutgoing.getType59(acct, idTemp);
//                String type71A = dBDataTransaksiOutgoing.getType71A(idTemp);
                log.info("Nama Core:" + namaCore);
                log.info("Nama :" + name);
                dBDataTransaksiOutgoing.updateTag59Name(idTemp, namaCore, type59);
                dBDataTransaksiOutgoing.updateMTText(ct.createFinalMT(ct.getHeaderById(Integer.parseInt(id))), Integer.parseInt(id));
                String amtCurr = dBDataTransaksiOutgoing.getAmount(idTemp);
                String[] arAmtCurr = amtCurr.split("#");
                String curr = arAmtCurr[1];
                BigDecimal amt = new BigDecimal(arAmtCurr[0].replace(",", "."));
                BigDecimal stpLimit = dBDataTransaksiOutgoing.getSTPLimit(curr);
//                if (cust_curr.equalsIgnoreCase("IDR")) {
                if (amt.compareTo(stpLimit) == 1) {
                    dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-NSTP", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
                } else {
                    dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-STL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
                }
//                } else {
//                    dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-STL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
//                }
            }
        } else if (request.getParameter("flag").equalsIgnoreCase("SENDTEXT")) {
            String amtCurr = dBDataTransaksiOutgoing.getAmount(Integer.parseInt(id));
            String[] arAmtCurr = amtCurr.split("#");
            String curr = arAmtCurr[1];
            BigDecimal amt = new BigDecimal(arAmtCurr[0].replace(",", "."));
            BigDecimal stpLimit = dBDataTransaksiOutgoing.getSTPLimit(curr);
//            if (cust_curr.equalsIgnoreCase("IDR")) {
            if (amt.compareTo(stpLimit) == 1) {
                dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-NSTP", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
            } else {
                dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-STL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
            }
//            } else {
//                dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-STL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
//            }
        } else if (request.getParameter("flag").equalsIgnoreCase("INC-ADJ")) {
            String custName = request.getParameter("custName");
            String custAcc = request.getParameter("custAcc");
            String type = request.getParameter("type");
            if (!custName.equals("") && !custAcc.equals("")) {
                dBDataTransaksiOutgoing.updateTag59NameInfo(Integer.parseInt(id), custName, type);
                dBDataTransaksiOutgoing.updateTag59AccInfo(Integer.parseInt(id), custAcc, type);
                dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing(request.getParameter("flag"), Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O");
            } else {
                log.info("Rekening dan Nama tidak diisi");
            }
            log.info("kadieu... INC-ADJ ");
//          dBDataTransaksiOutgoing.updateMTText(ct.createFinalMT(ct.getHeaderById(Integer.parseInt(id))), Integer.parseInt(id));
        } else if (request.getParameter("flag").equalsIgnoreCase("INC")) {  //20191231 ditambah search cover
            log.info("fundRecheking 940&950");
            String idHeaders = request.getParameter("id");
            Header datas = new Header();
            datas = dBDataTransaksiOutgoing.getHeaderById(idHeaders);
            List<String> datas950 = dBDataTransaksiOutgoing.cekRef940950();
//            log.info("datas.size() : "+datas.size());
            String ref103 = request.getParameter("ref");
            String amtCurr = dBDataTransaksiOutgoing.getAmount(Integer.parseInt(id));
            String[] arAmtCurr = amtCurr.split("#");
            String curr = arAmtCurr[1];
            BigDecimal amt = new BigDecimal(arAmtCurr[0].replace(",", "."));
            BigDecimal stpLimit = dBDataTransaksiOutgoing.getSTPLimit(curr);
            log.info("ref103: " + ref103);
            log.info("datas950.size() : " + datas950.size());
            for (int j = 0; j < datas950.size(); j++) {
                log.info("datas950.get(j) : " + datas950.get(j));
                String str_data950 = datas950.get(j);
                String[] relRef = str_data950.split("#");
                String relRef103 = relRef[0].trim();
                log.info("flag : " + datas.getFlag() + "#ref103 : " + ref103 + "#reslRef103 :" + relRef103);
                if (datas.getFlag().equalsIgnoreCase("INC-OK") && relRef103.contains(ref103)) {
//                    if (cust_curr.equalsIgnoreCase("IDR")) {
                    if (amt.compareTo(stpLimit) == 1) {
                        dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-NSTP", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
                    } else {
                        dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-STL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
                    }
//                    } else {
//                        dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-STL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
//                    }
                } else if (datas.getFlag().equalsIgnoreCase("INC-NOK") && relRef103.contains(ref103)) {
                    if (relRef[0].contains("//")) {
//                        log.info("kesiniiiii 1669 " + relRef[0]);
                        if (relRef[0].contains("\n")) {
//                            log.info("kesiniiiii 1671 " + relRef[0]);
                            relRef[0] = relRef[0].substring(relRef[0].indexOf("//"), relRef[0].indexOf("\n"));
                            relRef[0] = relRef[0].replace("//", "");
                        } else {
//                            log.info("kesiniiiii 1675 " + relRef[0]);
                            relRef[0] = relRef[0].substring(relRef[0].indexOf("//"));
                            relRef[0] = relRef[0].replace("//", "");
                        }
                    } else {
//                        log.info("kesiniiiii 1680 " + relRef[0]);
                        relRef[0] = ref103;
                    }
                    dBDataTransaksiOutgoing.updateInfoRef(relRef[2] + "," + relRef[0], Integer.parseInt(id));
                    dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-WAIT", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O");
                }
            }
        } else if (request.getParameter("flag").equalsIgnoreCase("RESENDTEXT")) {
            dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-RSTL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O");
        } else if (request.getParameter("flag").equalsIgnoreCase("SETTLE")) {
//            String amtCurr = dBDataTransaksiOutgoing.getAmount101(Integer.parseInt(id)); //20220121
//            String[] arAmtCurr = amtCurr.split("#");
//            String curr = arAmtCurr[1];
//            BigDecimal amt = new BigDecimal(arAmtCurr[0].replace(",", "."));
//            BigDecimal stpLimit = dBDataTransaksiOutgoing.getSTPLimit(curr);
//            if (cust_curr.equalsIgnoreCase("IDR")) {
//            if (amt.compareTo(stpLimit) == 1) {
            dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-NSTP", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
//            } else {
//                dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-STL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
//            }
//            } else {
//                dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-STL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
//            }
        } else if (request.getParameter("flag").equalsIgnoreCase("APPROVEADJ")) {
            String amtCurr = dBDataTransaksiOutgoing.getAmount(Integer.parseInt(id));
            String[] arAmtCurr = amtCurr.split("#");
            String curr = arAmtCurr[1];
            BigDecimal amt = new BigDecimal(arAmtCurr[0].replace(",", "."));
            BigDecimal stpLimit = dBDataTransaksiOutgoing.getSTPLimit(curr);
            String custName = request.getParameter("custName");
            String custAcc = request.getParameter("custAcc");
            String type = request.getParameter("type");
            dBDataTransaksiOutgoing.updateTag59Name(Integer.parseInt(id), custName, type);
            dBDataTransaksiOutgoing.updateTag59Acc(Integer.parseInt(id), custAcc, type);
            log.info("kadieu... APPROVEADJ ");
            dBDataTransaksiOutgoing.updateMTText(ct.createFinalMT(ct.getHeaderById(Integer.parseInt(id))), Integer.parseInt(id));
//            if (cust_curr.equalsIgnoreCase("IDR")) {
            if (amt.compareTo(stpLimit) == 1) {
                dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-NSTP", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
            } else {
                dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-STL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
            }
//            } else {
//                dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-STL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O"); // 20190412 dipindah
//            }
        } else if (request.getParameter("flag").equalsIgnoreCase("REJECTADJ")) {
            dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-WAIT", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O");
        } else if (request.getParameter("flag").equalsIgnoreCase("INC-SPOK") || request.getParameter("flag").equalsIgnoreCase("INC-NSTP")) {
            dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing(request.getParameter("flag"), Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O");
        }
        else if (request.getParameter("flag").equalsIgnoreCase("INC-STL")){
            // Maka release trasncation ke backend incoming
            dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing("INC-STL", Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O",networkType); // 20190412 dipindah
        }
        else {
            dBDataTransaksiOutgoing.updateStatusTransaksiOutgoing(request.getParameter("flag"), Integer.parseInt(id), flagStatus, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), "O");
        }
        
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SCDataTransaksiIncoming.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SCDataTransaksiIncoming.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SCDataTransaksiIncoming.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SCDataTransaksiIncoming.class.getName()).log(Level.SEVERE, null, ex);
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
