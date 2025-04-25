/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBHeader;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
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
public class SCPrintXLS extends HttpServlet {

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
        String io_type = request.getParameter("io_type"); //20190926
        String value_date = request.getParameter("value_date").substring(2).replace("-", ""); //20190926
        String value_date_end = request.getParameter("value_date_end").substring(2).replace("-", "");
        String branch = "";
        String branchname = "";
        String filter = request.getParameter("filter_msg"); //20230522
        String currency = request.getParameter("cust_curr");
        String status_f= request.getParameter("status")+"";
        String channel2 = request.getParameter("channel");
        HttpSession session = request.getSession();
        DBconnection dbConn = new DBconnection();
        ArrayList<Header> headers = new ArrayList<Header>();
        DBHeader bBHeaders = new DBHeader(dbConn.getConnection());
        System.out.println("Channel="+channel2);

        try {
            System.out.println("before tgl " + value_date_end);
            headers = bBHeaders.getAllHeaderReport(status_f,io_type,mt_type, value_date, date_from, date_end, flag, filter, currency, value_date_end, channel2);
//            headers = bBHeaders.getAllHeaderReportXls(mt_type, flag, value_date, date_from, date_end, io_type, value_date_end, filter, currency);
            System.out.println("after tgl");

            ServletOutputStream sos = response.getOutputStream();

            WritableWorkbook workbook = Workbook.createWorkbook(sos);
            WritableSheet sheet = workbook.createSheet("Report", 0);
            WritableFont cellFont = new WritableFont(WritableFont.COURIER, 10);
            cellFont.setBoldStyle(WritableFont.BOLD);
            WritableCellFormat cellFormat = new WritableCellFormat(cellFont);
            WritableFont cellFont2 = new WritableFont(WritableFont.COURIER, 10);
            WritableCellFormat cellFormat2 = new WritableCellFormat(cellFont2);
            Label reportBy = new Label(1, 1, "REPORT BY : " + session.getAttribute("user_id").toString().toUpperCase(), cellFormat);
            Label lno = new Label(1, 3, "NO", cellFormat);
            Label lchannel = new Label(2, 3, "CHANNEL", cellFormat);
            Label lmt = new Label(3, 3, "MT/MX", cellFormat);
            Label lio = new Label(4, 3, "I/O", cellFormat);
            Label lsender = new Label(5, 3, "SENDER", cellFormat);
            Label lreceiver = new Label(6, 3, "RECEIVER", cellFormat);
            Label lreference = new Label(7, 3, "REFERENCE", cellFormat);
            Label ldt = new Label(8, 3, "CREATION TIME", cellFormat);
            Label ldate = new Label(9, 3, "VALUE DATE", cellFormat);
            Label lcurr = new Label(10, 3, "CURRENCY", cellFormat);
            Label lamt = new Label(11, 3, "AMOUNT", cellFormat);
            Label lstatus = new Label(12, 3, "STATUS", cellFormat);
            
//            -- ori
//            Label lmt = new Label(2, 3, "MT", cellFormat);
//            Label lio = new Label(3, 3, "I/O", cellFormat);
//            Label lsender = new Label(4, 3, "SENDER", cellFormat);
//            Label lreceiver = new Label(5, 3, "RECEIVER", cellFormat);
//            Label lreference = new Label(6, 3, "REFERENCE", cellFormat);
//            Label ldate = new Label(7, 3, "DATE", cellFormat);
//            Label lcurr = new Label(8, 3, "CURRENCY", cellFormat);
//            Label lamt = new Label(9, 3, "AMOUNT", cellFormat);
//            Label lsenacc = new Label(10, 3, "SENDER ACC.", cellFormat);
//            Label lsenname = new Label(11, 3, "SENDER NAME", cellFormat);
//            Label lrecacc = new Label(12, 3, "RECEIVER ACC.", cellFormat);
//            Label lrecname = new Label(13, 3, "RECEIVER NAME", cellFormat);
//            Label ldt = new Label(14, 3, "DATE TIME", cellFormat);
//            //penambahan kolom baru//20200511//
//            Label lsendercountry = new Label(15, 3, "NEGARA PENGIRIM", cellFormat);
//            Label lreceivercountry = new Label(16, 3, "NEGARA PENERIMA", cellFormat);
//            Label lsenderbank = new Label(17, 3, "BANK PENGIRIM", cellFormat);
//            Label lreceiverbank = new Label(18, 3, "BANK PENERIMA", cellFormat);
//            Label lnostro = new Label(19, 3, "NOSTRO", cellFormat);
//            Label linformation = new Label(20, 3, "KETERANGAN", cellFormat);
//            Label lcharges = new Label(21, 3, "CHARGES", cellFormat);
//            Label lbranch = new Label(22, 3, "BRANCH", cellFormat);
//            Label lbranchname = new Label(23, 3, "BRANCH NAME", cellFormat);
//            Label lnoft = new Label(24, 3, "NO REFERENSI FT", cellFormat);
//            Label lstatus = new Label(25, 3, "STATUS", cellFormat);
//            Label lkomentar = new Label(26, 3, "COMMENT", cellFormat);
            sheet.mergeCells(1, 1, 6, 1);
            sheet.addCell(reportBy);
            sheet.addCell(lno);
            sheet.addCell(lchannel);
            sheet.addCell(lmt);
            sheet.addCell(lio);
            sheet.addCell(lsender);
            sheet.addCell(lreceiver);
            sheet.addCell(lreference);
            sheet.addCell(ldt);
            sheet.addCell(ldate);
            sheet.addCell(lcurr);
            sheet.addCell(lamt);
            sheet.addCell(lstatus);
            for (int i = 0; i < headers.size(); i++) {
                Label no = new Label(1, i + 4, "" + (i + 1), cellFormat2);
                Label channel = new Label(2, i + 4, headers.get(i).getSource(), cellFormat2); 
                Label mt = new Label(3, i + 4, headers.get(i).getMessageType(), cellFormat2);
                Label io = new Label(4, i + 4, headers.get(i).getIo_type(), cellFormat2);
                Label sender = null;//20190926
                Label receiver = null;
                sender = new Label(5, i + 4, headers.get(i).getLogicalTerminal(), cellFormat2);
                receiver = new Label(6, i + 4, headers.get(i).getReceiverAddress(), cellFormat2);
                Label reference = new Label(7, i + 4, headers.get(i).getTag20(), cellFormat2);
                Label dt = new Label(8, i + 4, headers.get(i).getTanggal(), cellFormat2);
                Label date = new Label(9, i + 4, headers.get(i).getTag32Date(), cellFormat2);
                Label curr = new Label(10, i + 4, headers.get(i).getTag32Currency(), cellFormat2);
                Label amt = new Label(11, i + 4, headers.get(i).getTag32Amount(), cellFormat2);
                Label status = new Label(12, i + 4, headers.get(i).getFlag(), cellFormat2);
                
                //ori
//                Label no = new Label(1, i + 4, "" + (i + 1), cellFormat2);
//                Label mt = new Label(2, i + 4, headers.get(i).getMessageType(), cellFormat2);
//                Label io = new Label(3, i + 4, headers.get(i).getIo_type(), cellFormat2);
//                Label sender = null;//20190926
//                Label receiver = null;
//                sender = new Label(4, i + 4, headers.get(i).getLogicalTerminal(), cellFormat2);
//                receiver = new Label(5, i + 4, headers.get(i).getReceiverAddress(), cellFormat2);
//                Label reference = new Label(6, i + 4, headers.get(i).getTag20(), cellFormat2);
//                Label date = new Label(7, i + 4, headers.get(i).getTag32Date(), cellFormat2);
//                Label curr = new Label(8, i + 4, headers.get(i).getTag32Currency(), cellFormat2);
//                Label amt = new Label(9, i + 4, headers.get(i).getTag32Amount(), cellFormat2);
//                Label senacc = new Label(10, i + 4, headers.get(i).getTag50Acc(), cellFormat2);
//                Label senname = new Label(11, i + 4, headers.get(i).getTag50Nm(), cellFormat2);
//                Label recacc = new Label(12, i + 4, headers.get(i).getTag59Acc(), cellFormat2);
//                Label recname = new Label(13, i + 4, headers.get(i).getTag59Nm(), cellFormat2);
//                Label dt = new Label(14, i + 4, headers.get(i).getTanggal(), cellFormat2);
//                //penambahan kolom baru//20200511//
//                Label sendercountry = new Label(15, i + 4, headers.get(i).getTag52Cc(), cellFormat2);
//                Label receivercountry = new Label(16, i + 4, headers.get(i).getTag57Cc(), cellFormat2);
//                Label senderbank = new Label(17, i + 4, headers.get(i).getTag52(), cellFormat2);
//                Label receiverbank = new Label(18, i + 4, headers.get(i).getTag57(), cellFormat2);
//                if (headers.get(i).getIo_type().equalsIgnoreCase("Out")) {
//                    senderbank = new Label(17, i + 4, headers.get(i).getLogicalTerminal(), cellFormat2);
//                    sendercountry = new Label(15, i + 4, headers.get(i).getLogicalTerminal().substring(4, 6), cellFormat2);
//                }
//                if (headers.get(i).getTag57() == null) {
//                    receiverbank = new Label(18, i + 4, headers.get(i).getReceiverAddress());
//                }
//                if (headers.get(i).getTag57Cc() == null) {
//                    receivercountry = new Label(16, i + 4, headers.get(i).getReceiverAddress().substring(4, 6), cellFormat2);
//                }
//                Label nostro = new Label(19, i + 4, headers.get(i).getTag54(), cellFormat2);
//                Label information = new Label(20, i + 4, headers.get(i).getTag70(), cellFormat2);
//                Label charges = new Label(21, i + 4, headers.get(i).getTag71A(), cellFormat2);
//                if (headers.get(i).getBranch() != null) {
//                    if (headers.get(i).getBranch().contains("|")) {
//                        branch = headers.get(i).getBranch().substring(0, headers.get(i).getBranch().indexOf("|"));
//                        branchname = headers.get(i).getBranch().substring(headers.get(i).getBranch().indexOf("|")).replace("|", "");
//                    } else {
//                        branch = headers.get(i).getBranch();
//                        if (branch.equalsIgnoreCase("NOT FOUND")) {
//                            branch = "";
//                        }
//                        branchname = "";
//                    }
//                } else {
//                    branch = "";
//                    branchname = "";
//                }
//                Label sbranch = new Label(22, i + 4, branch, cellFormat2);
//                Label sbranchname = new Label(23, i + 4, branchname, cellFormat2);
//                Label noft = new Label(24, i + 4, headers.get(i).getNoFT(), cellFormat2);
//                Label status = new Label(25, i + 4, headers.get(i).getFlag(), cellFormat2);
//                String komen = "";
//                if (headers.get(i).getFlag().equalsIgnoreCase("INC-RTR") || headers.get(i).getFlag().equalsIgnoreCase("INC-INV")){
//                    komen = headers.get(i).getKomentar();
//                } else {
//                    komen = "";
//                }
//                Label komentar = new Label(26, i + 4, komen, cellFormat2);
                
                sheet.addCell(no);
                sheet.addCell(channel);
                sheet.addCell(mt);
                sheet.addCell(io);
                sheet.addCell(sender);
                sheet.addCell(receiver);
                sheet.addCell(reference);
                sheet.addCell(dt);
                sheet.addCell(date);
                sheet.addCell(curr);
                sheet.addCell(amt);
                sheet.addCell(status);
            }

            
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Expires", "0");
            response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
            response.setHeader("Pragma", "public");
            String xlsFileName = "Report_XLS_" + session.getAttribute("user_id").toString() + ".xls";
            response.setHeader("Content-Disposition", "inline; filename=\"" + xlsFileName + "\"");

            workbook.write();
            workbook.close();
            sos.close();
        } catch (Exception e) {
            e.printStackTrace();
            StringWriter stringWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(stringWriter);
            e.printStackTrace(printWriter);
            response.setContentType("text/plain");
            response.getOutputStream().print(stringWriter.toString());
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
