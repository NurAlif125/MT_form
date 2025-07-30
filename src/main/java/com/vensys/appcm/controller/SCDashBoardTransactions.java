/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataDashBoardTransactions;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.vensys.appcm.model.DataDashBoardTransactions;
import com.vensys.appcm.model.DataSlipAndAmount;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
//import org.apache.log4j.Logger;

/**
 *
 * @author Administrator
 */
public class SCDashBoardTransactions extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DBconnection dbConn = new DBconnection();
        DBDataDashBoardTransactions dBDataDashBoardTransactions = new DBDataDashBoardTransactions(dbConn.getConnection());
        Logger log = LogManager.getLogger(getClass().getName());
        List<DataDashBoardTransactions> datas =  new ArrayList<>();
        
        String begDate = request.getParameter("date_from");
        String endDate = request.getParameter("date_end");
        
        String begDateInsert = request.getParameter("insert_date_from");
        String endDateInsert = request.getParameter("insert_date_end");
        String io_type = request.getParameter("io_type");
        
        String ioType = request.getParameter("io_type");
        if (ioType == null || !ioType.matches("^[a-zA-Z0-9_-]+$")) {
            log.warn("Invalid io_type parameter: {}", io_type);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input");
            return;
        }
        // System.out.println("::: Tipe Dashboard ALL -> " + io_type);
      
        try {  
            Date begDateTypeDate = begDate == null ? null : new SimpleDateFormat("yyyy-MM-dd").parse(begDate);
            Date endDateTypeDate = endDate == null ? null : new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
            
            Date begDateInsertTypeDate = begDateInsert == null ? null : new SimpleDateFormat("yyyy-MM-dd").parse(begDateInsert);
            Date endDateInsertTypeDate = endDateInsert == null ? null : new SimpleDateFormat("yyyy-MM-dd").parse(endDateInsert);
            
            request.setAttribute("beg1",begDateTypeDate);
            request.setAttribute("beg2",endDateTypeDate);
            
            request.setAttribute("insert_beg1",begDateInsertTypeDate);
            request.setAttribute("insert_beg2",endDateInsertTypeDate);
        } catch (ParseException ex) {
            java.util.logging.Logger.getLogger(SCDashBoardTransactions.class.getName()).log(Level.SEVERE, null, ex);
        }

        
        // Ambil semua flag yg ada dulu
        List<String> flags = dBDataDashBoardTransactions.findAllPosibleTag(begDate,endDate,begDateInsert,endDateInsert,io_type);
        List<String> ccyDistincy = dBDataDashBoardTransactions.findAllPosibleCcy(begDate,endDate,begDateInsert,endDateInsert,io_type);
        Collections.sort(ccyDistincy);
        
        for (String flagSatuan : flags){
            // System.out.println("Flag nya coy : "+flagSatuan);
            
            DataDashBoardTransactions tempData = dBDataDashBoardTransactions.findDataDashBoardTransactionsByTag(flagSatuan,begDate,endDate,begDateInsert,endDateInsert,ccyDistincy,io_type);
            
//            for (String ccy : ccyDistincy){
//                // check ccynya bnanyaknya sama atau tidak, jika tidak maka buat - saja
//                List<DataSlipAndAmount> slipAmout = tempData.getDataSlipAndAmount();
//                
//                if(!slipAmout.stream().anyMatch(s -> s.getCcy().equalsIgnoreCase(ccy))){
//                    System.out.println("Flag "+flagSatuan + " tidak ada currency : "+ccy);
//                    // masukan ccy dengan nilai kosong
//                    tempData.addSlipAmountAndCCY(ccy, "0", "0.00");
//                }
//            
//            }
            
            datas.add(tempData);
        }
        
        Map<String, Map<String,String>> dataJumlah = dBDataDashBoardTransactions.findSumSlipAmount(begDate, endDate, begDateInsert, endDateInsert,io_type);
        List<Map<String,String>> dataSum = new ArrayList<>();
                        
        // Disini memasukan new order ccy baru
        List<String> newCcyOrder = new ArrayList<>();
        for (DataDashBoardTransactions satuan : datas){
//            System.out.println("---------------------");
//            System.out.println("Flag : "+satuan.getFlag());
            
            
            satuan.getDataSlipAndAmount().forEach((k,v)-> {
//                System.out.println("======");
//                System.out.println("CCY ["+v.getCcy()+"] Slip ["+v.getSlip()+"] Amount ["+v.getAmount()+"]");
                newCcyOrder.add(v.getCcy());
                // Data untuk total slip dan amount berdasarkan ccy nya
                Map<String,String> temp = new HashMap<>(); 
                temp.put("slip", dataJumlah.get(v.getCcy()).get("countSlip"));
                temp.put("amount", dataJumlah.get(v.getCcy()).get("countAmount"));
                dataSum.add(temp);
//                System.out.println("======");
            });
            break;
//            System.out.println("---------------------");
            
        }
        
        for (DataDashBoardTransactions dataSout : datas){
            // System.out.println("Ini datanya sample : "+dataSout.getFlag());
        }
        
        // ini buat kirim apakah ada datanya atau tida
        if (ccyDistincy.isEmpty()){
            request.setAttribute("isEmpty",true);
        }
        else {
            request.setAttribute("isEmpty",false);
        }
        
        // System.out.println("Beg Date "+begDate);
        // System.out.println("End Date "+endDate);
        
        
        
        
        
        request.setAttribute("datasCcy",newCcyOrder);
        request.setAttribute("dataDashboard", datas);
        request.setAttribute("dataSumSlipAmount", dataSum);
        request.setAttribute("io_type",io_type);
        // System.out.println(":::: io_type"+io_type);
        RequestDispatcher dispatcher = request.getRequestDispatcher("SCDashBoardTransactions.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
