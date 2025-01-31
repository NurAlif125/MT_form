/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.DataHeaderTransaksi;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.TagDB;
import com.vensys.appcm.myutils.CostumerHelper;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "SCInvesitvationOutgoing103", urlPatterns = {"/SCInvesitvationOutgoing103"})
public class SCInvesitvationOutgoing103 extends HttpServlet {
    
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
        var typeAction = request.getParameter("action");
        int cek = 0;
        String messageType = request.getParameter("messageType");
        DBconnection dbConn = new DBconnection();
        DataHeaderTransaksi data = new DataHeaderTransaksi();
        DBDataTransaksiOutgoing dBDataTransaksiOutgoing = new DBDataTransaksiOutgoing(dbConn.getConnection());
        String tgl_trx = new SimpleDateFormat("yyMMddHHmm").format(new Date());
        String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        
        
        // check action
        log.info("Type action : "+typeAction);
        
        if (typeAction == null){
            // Jika null maka ini awalan insert hanya tampilkan value saja
            RequestDispatcher dispatcher = request.getRequestDispatcher("investigation_list_outgoing103.jsp");
            dispatcher.forward(request, response);            
        }
        else if (typeAction.equalsIgnoreCase("submit")){
            
            // ambil value
            var refference = request.getParameter("refference");
            var currency = request.getParameter("currency");
            var dateValue = request.getParameter("dateValue");
            var receiver = request.getParameter("receiver");
           
            
            // ambil dari database transactions outgoing-nya
            
            var essentialSelect = dBDataTransaksiOutgoing.getMT103OutgoingByRefferenceDatevalueReceiverAndCurrency(refference, currency, dateValue, receiver);
            
            if (essentialSelect == null){
                // tidak ada data maka balik ke jsp pemelihan
                request.setAttribute("errorMsg", "There is no data");
                
                // untuk menaruh input user agar tidak click manual lagi
                request.setAttribute("refference",refference);
                request.setAttribute("currency",currency);
                request.setAttribute("dateValue",dateValue);
                request.setAttribute("receiver",receiver);
                
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("investigation_list_outgoing103.jsp");
                dispatcher.forward(request, response); 
            }
            else {
                // generate MT199
                var header103 = dBDataTransaksiOutgoing.getHeaderById(String.valueOf(essentialSelect.idHeaders()));
                createMT199ByMT(String.valueOf(essentialSelect.idHeaders()),header103,dBDataTransaksiOutgoing, session, dbConn);
                RequestDispatcher dispatcher = request.getRequestDispatcher("controllerHeaders");
                dispatcher.forward(request, response); 
            }
            
            
        }
        
       
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
        tag199.setDetail("");
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
            java.util.logging.Logger.getLogger(SCInvesitvationOutgoing103.class.getName()).log(Level.SEVERE, null, ex);
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
            java.util.logging.Logger.getLogger(SCInvesitvationOutgoing103.class.getName()).log(Level.SEVERE, null, ex);
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
