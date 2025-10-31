/*
tr4 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBRecon;
import com.vensys.appcm.dbase.DBconnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.util.HSSFColor.LAVENDER;

import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jxl.Workbook;
import jxl.write.*;

import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.Recon;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

/**
 *
 * @author AplDev2
 */
public class SCPrintRecon extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String getCurrentDateTime() { // Tambahkan fungsi ini
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        return formatter.format(new java.util.Date());
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String date_from = request.getParameter("date_from");
        String date_end = request.getParameter("date_end");
        String nostro = request.getParameter("nostro");
        String cust_curr = request.getParameter("cust_curr");
        String value_date = request.getParameter("value_date").substring(2).replace("-", ""); //20190926
        String value_date_end = request.getParameter("value_date_end").substring(2).replace("-", "");
        String reff = request.getParameter("no_reff");
        String io_type = request.getParameter("io_type");
        String filter = request.getParameter("filter_msg");
        String nostro_corr = request.getParameter("nostro_corr");
        HttpSession session = request.getSession();
        DBconnection dbConn = new DBconnection();
        DBRecon dbRecon = new DBRecon(dbConn.getConnection());
        ArrayList<Recon> recon = new ArrayList<Recon>();
        ArrayList<Recon> recon2 = new ArrayList<Recon>();
        ServletOutputStream servletOutputStream = response.getOutputStream();
        File reportFile = new File(
                getServletConfig().getServletContext().getRealPath("/WEB-INF/reports/reportRecon.jasper"));
        byte[] bytes = null;

        try {
            recon = dbRecon.getPrintRecon(io_type, cust_curr, date_from, date_end, value_date, value_date_end, reff, filter);
            WritableWorkbook workbook = Workbook.createWorkbook(servletOutputStream);
            recon2 = dbRecon.getHostdata(io_type, filter);

            WritableSheet sheet = workbook.createSheet("Report Reconcile", 0);
            WritableFont cellFont = new WritableFont(WritableFont.ARIAL, 10);
            cellFont.setBoldStyle(WritableFont.BOLD);
            WritableFont cellFont3 = new WritableFont(WritableFont.ARIAL, 10);
            cellFont3.setBoldStyle(WritableFont.BOLD);
            cellFont3.setColour(Colour.WHITE);
            WritableCellFormat cellFormat = new WritableCellFormat(cellFont);
            WritableFont cellFont2 = new WritableFont(WritableFont.ARIAL, 10);
            WritableCellFormat cellFormat2 = new WritableCellFormat(cellFont2);
            WritableCellFormat blueCellFormat = new WritableCellFormat(cellFont3);
            WritableCellFormat yellowCellFormat = new WritableCellFormat(cellFont);
            workbook.setColourRGB(jxl.format.Colour.BLUE2, 72, 61, 139);
            blueCellFormat.setBackground(jxl.format.Colour.BLUE2);
            yellowCellFormat.setBackground(jxl.format.Colour.YELLOW);

            Label dateFrom = new Label(1, 1, "Date: " + date_from, cellFormat);
            Label dateEnd = new Label(4, 1, "to: " + date_end, cellFormat);
            Label nostroCorr = new Label(6, 1, "Nostro/Correspondent: ", cellFormat);
            Label curr = new Label(1, 2, "Currency : " + cust_curr, cellFormat);
            Label valDt = new Label(4, 2, "Value Date: " + value_date, cellFormat);
            Label noreff = new Label(6, 2, "No. Reff: " + reff, cellFormat);

            // case 1 : Outgoing HOST
            if (io_type.equalsIgnoreCase("I") && filter.equalsIgnoreCase("3")) {
                Label texRep = new Label(1, 4, "REPORT RECONCILE HOST-SWIFT", cellFormat);
                Label textRephead = new Label(1, 7, "REPORT TYPE: MESSAGE FILE - RECONCILE OUTGOING  HOST-SWIFT",
                        yellowCellFormat);
                Label transcAcc = new Label(1, 10, "TRANSACTION ACCEPTED BY HOST(CORE BANKING)", cellFormat);
                Label transAcc2 = new Label(9, 10, "TRANSACTION ACCEPTED BY SWIFT", cellFormat);

                sheet.addCell(texRep);
                sheet.addCell(transcAcc);
                sheet.addCell(transAcc2);
                sheet.addCell(textRephead);
            } // case 2 : Incoming HOST
            else if (io_type.equalsIgnoreCase("O") && filter.equalsIgnoreCase("3")) {
                Label texRep = new Label(1, 4, "REPORT RECONCILE HOST-SWIFT", cellFormat);
                Label textRephead = new Label(1, 7, "REPORT TYPE: MESSAGE FILE - RECONCILE INCOMING HOST-SWIFT",
                        yellowCellFormat);
                Label transcAcc = new Label(1, 10, "TRANSACTION SENT BY HOST(CORE BANKING)", cellFormat);
                Label transAcc2 = new Label(9, 10, "TRANSACTION SENT BY SWIFT", cellFormat);

                sheet.addCell(texRep);
                sheet.addCell(transcAcc);
                sheet.addCell(transAcc2);
                sheet.addCell(textRephead);
            } // case 3 : Outgoing Spectrum
            else if (io_type.equalsIgnoreCase("I") && filter.equalsIgnoreCase("1")) {
                Label texRep = new Label(1, 4, "REPORT RECONCILE SPECTRUM-SWIFT", cellFormat);
                Label textRephead = new Label(1, 7, "REPORT TYPE: MESSAGE FILE - RECONCILE OUTGOING SPECTRUM-SWIFT",
                        yellowCellFormat);
                Label transcAcc = new Label(1, 10, "TRANSACTION SENT BY SPECTRUM", cellFormat);
                Label transAcc2 = new Label(9, 10, "TRANSACTION ACCEPTED BY SWIFT", cellFormat);
                sheet.addCell(texRep);
                sheet.addCell(transcAcc);
                sheet.addCell(transAcc2);
                sheet.addCell(textRephead);
            } // case 4: Incoming Interbank
            else if (io_type.equalsIgnoreCase("O") && filter.equalsIgnoreCase("4")) {
                Label texRep = new Label(1, 4, "REPORT RECONCILE SPECTRUM-SWIFT", cellFormat);
                Label textRephead = new Label(1, 7, "REPORT TYPE: MESSAGE FILE - RECONCILE INCOMING INTERBANK-SWIFT",
                        yellowCellFormat);
                Label transcAcc = new Label(1, 10, "TRANSACTION SENT BY HOST(MT202)", cellFormat);
                Label transAcc2 = new Label(9, 10, "TRANSACTION ACCEPTED BY SWIFT(MT950)", cellFormat);
                sheet.addCell(texRep);
                sheet.addCell(transcAcc);
                sheet.addCell(transAcc2);
                sheet.addCell(textRephead);
            } // case 5 : Outgoing Systrade
            else if (io_type.equalsIgnoreCase("I") && filter.equalsIgnoreCase("2")) {
                Label texRep = new Label(1, 4, "REPORT RECONCILE SPECTRUM-SWIFT", cellFormat);
                Label textRephead = new Label(1, 7, "REPORT TYPE: MESSAGE FILE - RECONCILE OUTGOING SYSTRADE-SWIFT",
                        yellowCellFormat);
                Label transcAcc = new Label(1, 10, "TRANSACTION SENT BY SYSTRADE", cellFormat);
                Label transAcc2 = new Label(9, 10, "TRANSACTION ACCEPTED BY SWIFT", cellFormat);
                sheet.addCell(texRep);
                sheet.addCell(transcAcc);
                sheet.addCell(transAcc2);
                sheet.addCell(textRephead);
            } // case 6 : Incoming Systrade
            else if (io_type.equalsIgnoreCase("O") && filter.equalsIgnoreCase("2")) {
                Label texRep = new Label(1, 4, "REPORT RECONCILE SPECTRUM-SWIFT", cellFormat);
                Label textRephead = new Label(1, 7, "REPORT TYPE: MESSAGE FILE - RECONCILE INCOMING SYSTRADE-SWIFT",
                        yellowCellFormat);
                Label transcAcc = new Label(1, 10, "TRANSACTION ACCEPTED BY HOST(CORE BANKING)", cellFormat);
                Label transAcc2 = new Label(9, 10, "TRANSACTION SENT BY SWIFT", cellFormat);
                sheet.addCell(texRep);
                sheet.addCell(transcAcc);
                sheet.addCell(transAcc2);
                sheet.addCell(textRephead);
            }
            Label staticTextRepheader = new Label(1, 5, "REPORT HEADER", blueCellFormat);
            Label app = new Label(1, 6, "APPLICATION: ", cellFormat);
            Label operator = new Label(1, 8, "OPERATOR :" + session.getAttribute("user_id").toString().toUpperCase(),
                    cellFormat);
            // Label textRephead = new Label(1, 5, "REPORT:", cellFormat);;

            Label datetime = new Label(1, 9, "DATE-TIME: " + getCurrentDateTime(), cellFormat);
            Label messages = new Label(1, 11, "MESAGES", blueCellFormat);
            Label empty = new Label(9, 11, " ", blueCellFormat);

            Label lno = new Label(1, 12, "NO", yellowCellFormat);
            Label lnoReff = new Label(2, 12, "No.REFF", yellowCellFormat);
            Label lccy = new Label(3, 12, "CURRENCY", yellowCellFormat);
            Label lvdate = new Label(4, 12, "VALUE DATE", yellowCellFormat);
            Label lamt = new Label(5, 12, "AMOUNT", yellowCellFormat);
            Label lnosCor = new Label(6, 12, "NOSTRO/KORESPONDEN", yellowCellFormat);
            Label lstatusHost = new Label(7, 12, "STATUS HOST", yellowCellFormat);

            Label lno2 = new Label(9, 12, "NO", yellowCellFormat);
            Label lnoReff2 = new Label(10, 12, "NO REFF", yellowCellFormat);
            Label lccy2 = new Label(11, 12, "CURRENCY", yellowCellFormat);
            Label lvdate2 = new Label(12, 12, "VALUE DATE", yellowCellFormat);
            Label lamt2 = new Label(13, 12, "AMOUNT", yellowCellFormat);
            Label lnosCor2 = new Label(14, 12, "NOSTRO/KORESPONDEN", yellowCellFormat);
            Label lstatusHost2 = new Label(15, 12, "STATUS SWIFT", yellowCellFormat);

            //int pertama kolom awal, int kedua baris awal, int ketiga kolom akhir, int keempat baris terakhir
            sheet.mergeCells(1, 7, 8, 7); // buat nentuin report apa 
//            sheet.mergeCells(1, recon.size() + 13, 15, recon.size() + 13);//report footer
            sheet.mergeCells(1, 5, 15, 5); //report header
            sheet.mergeCells(1, 11, 7, 11);// messages
            sheet.mergeCells(9, 11, 15, 11);//empty
//            sheet.mergeCells(1, 5, 15, 5);
            sheet.mergeCells(0, 0, 0, 0);
            sheet.addCell(staticTextRepheader);
            sheet.addCell(dateFrom);
            sheet.addCell(dateEnd);
            sheet.addCell(nostroCorr);
            sheet.addCell(curr);
            sheet.addCell(noreff);
            sheet.addCell(app);
            // sheet.addCell(texRep);
            // sheet.addCell(textRephead);
            sheet.addCell(operator);
            sheet.addCell(datetime);
            sheet.addCell(messages);
            sheet.addCell(empty);
            sheet.addCell(valDt);

            sheet.addCell(lno);
            sheet.addCell(lnoReff);
            sheet.addCell(lccy);
            sheet.addCell(lvdate);
            sheet.addCell(lamt);
            sheet.addCell(lnosCor);
            sheet.addCell(lstatusHost);
            sheet.addCell(lno2);
            sheet.addCell(lnoReff2);
            sheet.addCell(lccy2);
            sheet.addCell(lvdate2);
            sheet.addCell(lamt2);
            sheet.addCell(lnosCor2);
            sheet.addCell(lstatusHost2);

            for (int i = 0; i < recon2.size(); i++) {
                Label no = new Label(1, i + 13, "" + (i + 1), cellFormat2);
                Label noReff = new Label(2, i + 13, recon.get(i).getHostRef(), cellFormat2);
                Label ccy = new Label(3, i + 13, recon.get(i).getHostCcy(), cellFormat2);
                Label vdate = new Label(4, i + 13, recon.get(i).getHostValueDate(), cellFormat2);
                Label amt = new Label(5, i + 13, recon.get(i).getHostAmount(), cellFormat2);
                Label nosCor = new Label(6, i + 13, recon.get(i).getHostNostro(), cellFormat2);
                Label statusHost = new Label(7, i + 13, recon.get(i).getHostStatus(), cellFormat2);

                sheet.addCell(no);
                sheet.addCell(noReff);
                sheet.addCell(ccy);
                sheet.addCell(vdate);
                sheet.addCell(amt);
                sheet.addCell(nosCor);
                sheet.addCell(statusHost);

            }

            for (int j = 0; j < recon.size(); j++) {
                Label no2 = new Label(9, j + 13, "" + (j + 1), cellFormat2);
                Label noReff2 = new Label(10, j + 13, recon.get(j).getReff(), cellFormat2);
                Label ccy2 = new Label(11, j + 13, recon.get(j).getCurrency(), cellFormat2);
                Label vdate2 = new Label(12, j + 13, recon.get(j).getValue_date(), cellFormat2);
                Label amt2 = new Label(13, j + 13, recon.get(j).getAmount(), cellFormat2);
                Label nosCor2 = new Label(14, j + 13, recon.get(j).getNostroCorr(), cellFormat2);
                Label statusHost2 = new Label(15, j + 13, recon.get(j).getStatus(), cellFormat2);
                sheet.addCell(no2);
                sheet.addCell(noReff2);
                sheet.addCell(ccy2);
                sheet.addCell(vdate2);
                sheet.addCell(amt2);
                sheet.addCell(nosCor2);
                sheet.addCell(statusHost2);

            }
            // System.out.println(recon.size());
            int bigRecon = recon.size() < recon2.size() ? recon2.size() : recon.size();
            sheet.mergeCells(1, bigRecon + 13, 15, bigRecon + 13);//report footer
            Label reportFooter = new Label(1, bigRecon + 13, "REPORT FOOTER", blueCellFormat);
            sheet.addCell(reportFooter);

            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Expires", "0");
            response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
            response.setHeader("Pragma", "public");
            response.setHeader("Content-Disposition", "inline; filename=report-recon.xls");
            workbook.write();
            workbook.close();
            servletOutputStream.close();
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
