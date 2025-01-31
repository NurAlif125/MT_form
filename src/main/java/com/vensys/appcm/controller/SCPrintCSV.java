/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBHeader;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jxl.Workbook;
import jxl.write.*;
import com.vensys.appcm.model.Header;

/**
 *
 * @author hadi
 */
public class SCPrintCSV extends HttpServlet {

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
        String mt_type = request.getParameter("mt_type");
        String date_from = request.getParameter("date_from");
        String date_end = request.getParameter("date_end");
        String flag = request.getParameter("flag");
String value_date = request.getParameter("value_date").substring(2).replace("-", ""); //20190926
        String value_date_end = request.getParameter("value_date_end").substring(2).replace("-", "");
        String io_type = request.getParameter("io_type"); //20190926
        String filter = request.getParameter("filter_msg"); //20230522
        String currency = request.getParameter("cust_curr");

        HttpSession session = request.getSession();
        DBconnection dbConn = new DBconnection();
        ArrayList<Header> headers = new ArrayList<Header>();
        DBHeader bBHeaders = new DBHeader(dbConn.getConnection());
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=report.csv");
        try {
            headers = bBHeaders.getAllHeaderReportXls(mt_type, flag, value_date, date_from, date_end, io_type, value_date_end, filter, currency);
//            headers = bBHeaders.getAllHeaderReportXls(mt_type, flag, value_date, date_from, date_end, io_type, value_date_end);
            OutputStream outputStream = response.getOutputStream();
            String outputResult = "NO;MT;I/O;SENDER;RECEIVER;REFERENCE;DATE;CURRENCY;AMOUNT;SENDER ACC.;SENDER NAME;RECEIVER ACC.;RECEIVER NAME;DATE TIME;STATUS\n";
            String sender = "";//20190926
            String receiver = "";
            for (int i = 0; i < headers.size(); i++) {
//                outputResult += (i + 1) + ";" + headers.get(i).getMessageType() + ";" + headers.get(i).getIo_type() + ";" + headers.get(i).getTag53() + ";" + headers.get(i).getTag57().concat(headers.get(i).getTag58()) + ";" + headers.get(i).getTag20() + ";" + headers.get(i).getTag32Date() + ";" + headers.get(i).getTag32Currency() + ";" + headers.get(i).getTag32Amount() + ";" + headers.get(i).getTag50Acc() + ";" + headers.get(i).getTag50Nm().replace("\r", " ") + ";" + headers.get(i).getTag59Acc() + ";" + headers.get(i).getTag59Nm().replace("\r", " ") + ";" + headers.get(i).getTanggal() + ";" + headers.get(i).getFlag() + "\n";
                if (headers.get(i).getIo_type().equalsIgnoreCase("Inc") || headers.get(i).getIo_type().equalsIgnoreCase("O")) { //20190926
                    sender = headers.get(i).getReceiverAddress(); //20190926
                    receiver = headers.get(i).getLogicalTerminal();
                } else {
                    sender = headers.get(i).getLogicalTerminal(); //20190926
                    receiver = headers.get(i).getReceiverAddress();
                }

                //20190926
                outputResult += (i + 1) + ";" + headers.get(i).getMessageType() + ";" + headers.get(i).getIo_type() + ";" + sender + ";" + receiver + ";" + headers.get(i).getTag20() + ";" + headers.get(i).getTag32Date() + ";" + headers.get(i).getTag32Currency() + ";" + headers.get(i).getTag32Amount() + ";" + headers.get(i).getTag50Acc() + ";" + headers.get(i).getTag50Nm() + ";" + headers.get(i).getTag59Acc() + ";" + headers.get(i).getTag59Nm() + ";" + headers.get(i).getTanggal() + ";" + headers.get(i).getFlag() + "\n";
            }
            outputStream.write(outputResult.getBytes());
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.toString());
        } finally {
            dbConn.closeConnection();
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
