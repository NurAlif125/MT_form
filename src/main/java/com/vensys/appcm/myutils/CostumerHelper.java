/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.myutils;

import com.prowidesoftware.swift.model.mx.MxCamt02900109;
import com.prowidesoftware.swift.model.mx.MxCamt05600108;
import com.prowidesoftware.swift.model.mx.MxPacs00400109;
import com.prowidesoftware.swift.model.mx.MxPacs00800108;
import com.prowidesoftware.swift.model.mx.MxPacs00900108;
import com.prowidesoftware.swift.model.mx.MxWriteConfiguration;
import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.SQLSequance;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import org.apache.commons.lang3.StringUtils;
//import jxl.write.DateFormat;

/**
 *
 * @author HP
 */
public class CostumerHelper {

    public static String getOnlyBodyMt(String mt) {

        String regex = "(?<=\\{4:).*?(?=-\\})";

        Pattern pattern = Pattern.compile(regex, Pattern.DOTALL);
        Matcher matcher = pattern.matcher(mt);

        if (matcher.find()) {
            return matcher.group();
        } else {
            return "Body MT Not Found";
        }
    }

    public static XMLGregorianCalendar mtDateToXMLGregorianCalender(String mtDate) {

        LocalDate dateNow = LocalDate.parse(mtDate, DateTimeFormatter.ofPattern("yyMMdd"));
        try {
            XMLGregorianCalendar xmlGregorianCalendar
                    = DatatypeFactory.newInstance().newXMLGregorianCalendar(dateNow.toString());

            return xmlGregorianCalendar;
        } catch (DatatypeConfigurationException e) {
            throw new RuntimeException(e);
//            return null;
        }
//        return null;
    }

    public static String xmlGregorianCalenderToMTFormatString(XMLGregorianCalendar xCal) {
        Date date = xCal.toGregorianCalendar().getTime();
        DateFormat df = new SimpleDateFormat("yyMMdd");
        return df.format(date);
    }
    
    
    public static String xmlGregorianCalenderToMTFormatString(LocalDate xCal) {
       
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyMMdd");
        return xCal.format(df);
    } 
    
    
    
    /**
     * @deprecated  terlalu banyak logic dan reset 1 tahun </br>
     *              Tidak terlalu bagus...
     */
    @Deprecated
    public static String getTheLastSeq(SQLSequance sqlSequance){
        String tglToday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        try {
            String seqDB  = sqlSequance.getSeq();

            String[] arSeq = seqDB.split("#");
            String seq = arSeq[0].trim();
            int seqInt = Integer.parseInt(seq);
            seqInt = seqInt + 1;
            String sseqint = String.valueOf(seqInt);
            String padder = "";
            for (int k = 0; k < 3 - sseqint.length(); k++) {
                padder += "0";
            }
            seq = padder + sseqint;
            System.out.println("THe seq is : "+seq);
            String resetDate = arSeq[1].trim();
            SimpleDateFormat tgl = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = tgl.parse(tglToday);
            Date date2 = tgl.parse(resetDate);
            String dateUpdate = resetDate;
            int tahun = Integer.parseInt(tglToday.substring(0, 4));
            if (date1.compareTo(date2) > 0 || date1.compareTo(date2) == 0) {
//                tahun = tahun + 1;
//                dateUpdate = String.valueOf(tahun) + "-01-01";
//                
                dateUpdate = (LocalDate.now().plusDays(1L)).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                seq = "001";
            } else {
                dateUpdate = resetDate;
            }
            sqlSequance.updateSequence(dateUpdate, seq);

            return seq;
        } catch (SQLException | ParseException e) {
            throw new RuntimeException(e);
        }
    }
    
    
    public static String getTheLastSeqNew(DBDataTransaksiOutgoing sl) throws ParseException, SQLException{

        var dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        var dateNow = LocalDate.now();
        var dateLast = LocalDate.parse(sl.getSeq().split("#")[1],dateTimeFormatter);

        /**
         * 1. Check dahulu apakah date hari ini lebih kecil dibandingkan dengan sebelumnya
         * 2. JIka tanggal hari ini lebih tinggi maka harus update tanggal dan testart sequance
         */
        var seq = "";

        if (dateNow.isAfter(dateLast)){
            // get sequance
            seq = "001";
            // update sequance menjadi 000 dan update restart date
            sl.updateSequence(dateNow.format(dateTimeFormatter),seq);

        }
        else {
            seq = StringUtils.right("000"+Math.addExact(Integer.parseInt(sl.getSeq().split("#")[0]),1),3);
            // update sequance menjadi 000 dan update last
            sl.updateSequence(dateLast.format(dateTimeFormatter),seq);
        }
        
        return seq;
    }
    
    /**
     * 
     * @param messageType
     * @param body
     * @param saaHeader
     * @return 
     */
    public static String joinHeadersAndBodyMX(String messageType, String body, String saaHeader){
        
        // Untuk configuration mx xml
        var conf = new MxWriteConfiguration();
        conf.documentPrefix = null;
        
        // Join header dan body untuk pacs 008
        if (messageType.contains("pacs.008")){
            MxPacs00800108 bodyMX = MxPacs00800108.fromJson(body);
            String xmlBodyMX = bodyMX.message(conf).replaceFirst("<\\?xml version=\"1.0\" encoding=\"UTF-8\" \\?>", "");
            String fullBody = saaHeader.replace("ONLY-SAA-HEADERS", xmlBodyMX);
            return fullBody;
        }else if(messageType.contains("pacs.004")){
            MxPacs00400109 bodyMX = MxPacs00400109.fromJson(body);
            String xmlBodyMX = bodyMX.message(conf).replaceFirst("<\\?xml version=\"1.0\" encoding=\"UTF-8\" \\?>", "");
            String fullBody = saaHeader.replace("ONLY-SAA-HEADERS", xmlBodyMX);
            return fullBody;
        }
        else if(messageType.contains("pacs.009")){
            MxPacs00900108 bodyMX = MxPacs00900108.fromJson(body);
            String xmlBodyMX = bodyMX.message(conf).replaceFirst("<\\?xml version=\"1.0\" encoding=\"UTF-8\" \\?>", "");
            String fullBody = saaHeader.replace("ONLY-SAA-HEADERS", xmlBodyMX);
            return fullBody;
        } else if(messageType.contains("camt.056")){
            MxCamt05600108 bodyMX = MxCamt05600108.fromJson(body);
            String xmlBodyMX = bodyMX.message(conf).replaceFirst("<\\?xml version=\"1.0\" encoding=\"UTF-8\" \\?>", "");
            String fullBody = saaHeader.replace("ONLY-SAA-HEADERS", xmlBodyMX);
            return fullBody;
        } else if(messageType.contains("camt.029")){
            MxCamt02900109 bodyMX = MxCamt02900109.fromJson(body);
            String xmlBodyMX = bodyMX.message(conf).replaceFirst("<\\?xml version=\"1.0\" encoding=\"UTF-8\" \\?>", "");
            String fullBody = saaHeader.replace("ONLY-SAA-HEADERS", xmlBodyMX);
            return fullBody;
        }
        // Join header dan body untuk pacs 004
//        if (messageType.contains("pacs.004")){
//            MxPacs00400109 bodyMX = MxPacs00400109.fromJson(body);
//            String xmlBodyMX = bodyMX.message().replaceFirst("<\\?xml version=\"1.0\" encoding=\"UTF-8\" \\?>", "");
//            
//            String fullBody = saaHeader.replaceFirst("ONLY-SAA-HEADERS", xmlBodyMX);
//            return fullBody;
//        }
        return "";
    }
}
