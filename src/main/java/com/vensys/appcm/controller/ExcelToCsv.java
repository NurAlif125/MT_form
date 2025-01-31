/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.controller;

/**
 *
 * @author T430
 */
import com.vensys.appcm.dbase.DBEventLog;
import com.vensys.appcm.dbase.DBconnection;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.util.Properties;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDataFormatter;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFRow;

/**
 *
 * @author AplDev2
 */
public class ExcelToCsv {

    Connection conn;
    public ExcelToCsv(Connection conn) {
        this.conn = conn;
    }
    
    Logger log = Logger.getLogger(getClass().getName());
    DBEventLog evl = new DBEventLog(conn);

    public void echoAsCSV(String file, HSSFSheet sheet, String user, String ip, String comp) {
        HSSFRow row = null;
        StringBuffer data = new StringBuffer();
        String fileName = "";
        try {
            fileName = getCsvDir() + "/" + file + ".csv";
        } catch (IOException ex) {
            log.error(ex);
        }
        try {
            FileOutputStream fos = new FileOutputStream(fileName);
            HSSFDataFormatter df = new HSSFDataFormatter();
            for (int i = 0; i <= sheet.getLastRowNum(); i++) {
                row = sheet.getRow(i);
                for (int j = 0; j < row.getLastCellNum(); j++) {
                    if (row.getCell(j).toString().length() > 0) {
                        if (i > 0 & j == 2) {
                            HSSFCell cell = row.getCell(2);
                            String value = df.formatCellValue(cell);
                            data.append(value + ";");
                        } else {
                            data.append(row.getCell(j) + ";");
                        }
                    }
                }
                data.append("\n");
            }
            fos.write(data.toString().replaceAll("(?m)^\\s", "").getBytes());
            log.info("File " + fileName + " created");
            fos.close();
        } catch (FileNotFoundException ex) {
            log.error(ex);
        } catch (IOException e) {
            log.error(e);
        }
        evl.insertDataEvent(user, "Upload file excel RTGS", ip, comp);
    }

    public String getCsvDir() throws IOException {
        log.info("getCsvDir");
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("csv_dir");
    }
}

