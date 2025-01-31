/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.controller;
/**
 *
 * @author HP
 */
import com.vensys.appcm.dbase.DBDataCounterRate;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataCounterRate;
//import model.DataNegaraSuspect;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
//import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//import org.apache.poi.xssf.usermodel.XSSFRow;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author lenovo
 */
public class UploadCounterRate extends HttpServlet {

    private static final long serialVersionUID = 1L;
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
            throws ServletException, IOException {
        DBconnection dbConn = new DBconnection();
        DataCounterRate data = new DataCounterRate();
        DBDataCounterRate dbData = new DBDataCounterRate(dbConn.getConnection());
        HttpSession session = request.getSession();
        String strErrMsg = null;
        RequestDispatcher dispatcher = null;
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            try {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = upload.parseRequest(request);
                Iterator iter = items.iterator();
                FileItem item = (FileItem) iter.next();
                InputStream myxls = item.getInputStream();
//                    OPCPackage pkg = OPCPackage.open(myxls);
                HSSFWorkbook wb = new HSSFWorkbook(myxls);
//                    HSSFWorkbook wb = new HSSFWorkbook(pkg);
                HSSFSheet sheet = wb.getSheetAt(0);
//                    HSSFSheet sheet = wb.getSheetAt(0);
                HSSFRow row;
//                    HSSFRow row;
                int rows;
                rows = sheet.getPhysicalNumberOfRows();
                String id;
                String currDate = (new SimpleDateFormat("yyMMdd")).format(new Date());
                String currDate2 = (new SimpleDateFormat("yyyy-MM-dd")).format(new Date());
                String currency;
                String against_currency;
                String tanggal;
                String tc_buy;
                String tt_buy;
                String tt_sell;
                String tc_sell;
                String update_by;
                System.out.println("rows teh mangrupa :" + rows);
                int startReaderRow = 15;
                
                // Ini untuk table pertama yang berisikan IDR
                for (int i = 0; i < rows; i++) {
                    String currencyBetween ="";
                    if (i > startReaderRow) {
                        UUID uuid = UUID.randomUUID();
                        log.info("Cetak Na" + i);
                        log.info("Asup for");
                        row = sheet.getRow(i);
//                            HSSFDataFormatter df = new HSSFDataFormatter();
                        
                        
                        if(row.getCell(1)==null){
                            continue;
                        } else {
                            currencyBetween = row.getCell(1).toString();
                        }
                        
                        // CHeck dahulu apakah patternya cocok itu berisikan currency atua tidak
                        Pattern pattern = Pattern.compile("[a-zA-Z]{3}/[a-zA-Z]{3}");
                        
                        // Jika tidak sesuai patterm maka skip
                        if (!(pattern.matcher(currencyBetween).find())) continue;
                        
                        // Jika tidak maka lanjutkan
                        String[] arrcur = currencyBetween.split("/");
                        currency = arrcur[0];
                        against_currency = arrcur[1];
                        tanggal = currDate2;
                        tc_buy = row.getCell(2).toString();
                        tt_buy = row.getCell(3).toString();
                        tt_sell = row.getCell(4).toString();
                        tc_sell = row.getCell(5).toString();
                        update_by = session.getAttribute("user_id").toString();
                        
                        // validate untuk tc sell dan buy yang null
                        tc_sell = tc_sell.isEmpty()? "0":tc_sell;
                        tc_buy = tc_buy.isEmpty()? "0":tc_buy;
                        
                        System.out.println("TC Sell : "+tc_sell);
                        System.out.println("TC Buy : "+tc_buy);
                        
                        boolean cekDataDuplicateBycurrency = dbData.cekDataDuplicateBycurrency(currency, against_currency, tanggal);
                        data.setId(currDate + "." + uuid);
                        data.setCurrency(currency);
                        data.setAgainst_currency(against_currency);
                        data.setTanggal(tanggal);
                        data.setTc_buy(tc_buy);
                        data.setTt_buy(tt_buy);
                        data.setTt_sell(tt_sell);
                        data.setTc_sell(tc_sell);
                        data.setUpdate_by(update_by);
                        data.setMargin_point(calculateMarginPoint(tt_sell,tt_buy,against_currency).toString());
                        // ini logic Add
                        if (cekDataDuplicateBycurrency == false) {

                            dbData.addDataCounterRate(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                            System.out.println("Data berhasil diinput ke : " + i);
                        } else {
                            dbData.updateDataCounterRate(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                        }
                    }
                }
                
                // Ini untuk table kedua
                for (int i = 0; i < rows; i++) {
                    String currencyBetween ="";
                    if (i > startReaderRow) {
                        UUID uuid = UUID.randomUUID();
                        log.info("Cetak Na" + i);
                        log.info("Asup for");
                        row = sheet.getRow(i);
//                            HSSFDataFormatter df = new HSSFDataFormatter();
                        if(row.getCell(7)==null){
                            continue;
                        } else {
                            currencyBetween = row.getCell(7).toString();
                        }
                        
                        // CHeck dahulu apakah patternya cocok itu berisikan currency atua tidak
                        Pattern pattern = Pattern.compile("[a-zA-Z]{3}/[a-zA-Z]{3}");
                        
                        // Jika tidak sesuai patterm maka skip
                        if (!(pattern.matcher(currencyBetween).find())) continue;
                        
                        // Jika tidak maka lanjutkan
                        String[] arrcur = currencyBetween.split("/");
                        currency = arrcur[0];
                        against_currency = arrcur[1];
                        tanggal = currDate2;
                        tc_buy = "0";
                        tt_buy = row.getCell(8).toString();
                        tt_sell = row.getCell(9).toString();
                        tc_sell = "0";
                        update_by = session.getAttribute("user_id").toString();

                        boolean cekDataDuplicateBycurrency = dbData.cekDataDuplicateBycurrency(currency, against_currency, tanggal);
                        data.setId(currDate + "." + uuid);
                        data.setCurrency(currency);
                        data.setAgainst_currency(against_currency);
                        data.setTanggal(tanggal);
                        data.setTc_buy(tc_buy);
                        data.setTt_buy(tt_buy);
                        data.setTt_sell(tt_sell);
                        data.setTc_sell(tc_sell);
                        data.setMargin_point(calculateMarginPoint(tt_sell,tt_buy,against_currency).toString());
                        data.setUpdate_by(update_by);
                        // ini logic Add
                        if (cekDataDuplicateBycurrency == false) {

                            dbData.addDataCounterRate(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                            System.out.println("Data berhasil diinput ke : " + i);
                        } else {
                            dbData.updateDataCounterRate(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                        }
                    }
                }
//                for (int i = 2; i < rows; i++) {
//                    if (i > 1) {
//                        UUID uuid = UUID.randomUUID();
//                        log.info("Cetak Na" + i);
//                        log.info("Asup for");
//                        row = sheet.getRow(i);
////                            HSSFDataFormatter df = new HSSFDataFormatter();
//                        
//                        String[] arrcur = row.getCell(0).toString().split("/");
//                        currency = arrcur[0];
//                        against_currency = arrcur[1];
//                        tanggal = currDate2;
//                        tc_buy = row.getCell(1).toString();
//                        tt_buy = row.getCell(2).toString();
//                        tt_sell = row.getCell(3).toString();
//                        tc_sell = row.getCell(4).toString();
//                        update_by = session.getAttribute("user_id").toString();
//
//                        boolean cekDataDuplicateBycurrency = dbData.cekDataDuplicateBycurrency(currency, against_currency, tanggal);
//                        data.setId(currDate + "." + uuid);
//                        data.setCurrency(currency);
//                        data.setAgainst_currency(against_currency);
//                        data.setTanggal(tanggal);
//                        data.setTc_buy(tc_buy);
//                        data.setTt_buy(tt_buy);
//                        data.setTt_sell(tt_sell);
//                        data.setTc_sell(tc_sell);
//                        data.setUpdate_by(update_by);
//                        // ini logic Add
//                        if (cekDataDuplicateBycurrency == false) {
//
//                            dbData.addDataCounterRate(data);
//                            System.out.println("Data berhasil diinput ke : " + i);
//                        } else {
//                            dbData.updateDataCounterRate(data);
//                        }
//                    }
//                }

                log.info("berhaasil");
                strErrMsg = "Upload success";
                request.setAttribute("errorMsg", strErrMsg);

                dispatcher = request.getRequestDispatcher("CounterRateList?result=errorMsg");

            } catch (Exception e) {

                log.error("error upload : " + e.toString());
                e.printStackTrace();
                request.setAttribute("err", e.toString());
                dispatcher = request.getRequestDispatcher("CounterRateList?result=error");

            }
        } else {
            dispatcher = request.getRequestDispatcher("CounterRateList?result=error");

        }
//        RequestDispatcher dispatcher = request.getRequestDispatcher("SCNegaraSuspectList");
        dispatcher.forward(request, response);
    }
    
    public BigDecimal calculateMarginPoint(String ttSell, String ttBuy, String against_currency){
        BigDecimal ttSelllBigDc = new BigDecimal(ttSell);
        BigDecimal ttBuyBigDc = new BigDecimal(ttBuy);
        
        BigDecimal valueCal =  (((ttSelllBigDc.subtract(ttBuyBigDc))).divide(new BigDecimal(2), 4, RoundingMode.HALF_UP)).multiply(new BigDecimal(0.8));
        
        // Pembulatan untuk agains currency IDR
        if (against_currency.equalsIgnoreCase("IDR")){
            
            // Jika dibulatkan dan hasilnya noll maka kembalikan apa adanya
            if (!valueCal.setScale(0, RoundingMode.HALF_UP).toBigInteger().equals(BigInteger.ZERO)){
                return valueCal.setScale(0, RoundingMode.HALF_UP);
            }
        }
        
        return valueCal;
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
