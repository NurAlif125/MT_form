/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//20210405 ditambah ini
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataCharges;
import com.vensys.appcm.model.DataHeaderTransaksi;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.TagDB;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDataFormatter;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.NumberToTextConverter;

/**
 *
 * @author Azan
 */
public class SCUploadBranch extends HttpServlet {

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
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        SimpleDateFormat tanggalValuta = new SimpleDateFormat("yyMMdd");
        SimpleDateFormat tanggalValutaEx = new SimpleDateFormat("dd-MMM-yyyy");
        DBconnection dbConn = new DBconnection();
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
//                String id = "";
//                String tag71 = "";
//                String tag57Acc;
//                String tag57Bic;
                rows = sheet.getPhysicalNumberOfRows();
                System.out.println("rows nyaeta :" + rows);
                for (int i = 1; i < rows; i++) {
                    log.info("cetakkk ....." + i);
                    log.info("masuk for");
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
                    int idHeaderOut = dBDataTransaksiOutgoing.getIdHeaderOutgoing(ref103);
                    //
                    log.info("dataTag71.size() : " + dataTag71.size());
                    log.info("idHeaderOut " + idHeaderOut);
                    if (dataTag71.size() > 0) {
                    } else {
                        log.info("MT103 outgoing dengan nomor ref " + ref103 + " tidak ditemukan");
                    }
                    
                }
                log.info("berhaasil");
                RequestDispatcher dispatcher = request.getRequestDispatcher("upload_branch.jsp?status=y126");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                log.error("error upload : " + e.toString());
                e.printStackTrace();
                session.setAttribute("err", e.toString());
                RequestDispatcher dispatcher = request.getRequestDispatcher("upload_branch.jsp?status=x126");
                dispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("upload_branch.jsp?status=x126");
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
