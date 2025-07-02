/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.dbase;

import com.vensys.appcm.controller.ConvertToTerbilang;
import com.vensys.appcm.model.EssentialFieldPacs008;
import com.vensys.appcm.model.EssentialFieldPacs009;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.StringTokenizer;
import jakarta.servlet.http.HttpSession;
//import com.vensys.appcm.model.DataInvestigation;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.HeaderStatus;
import com.vensys.appcm.model.TagDB;
import com.vensys.appcm.model.HeaderSearchCriteria;
import java.math.BigDecimal;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author Muhammad Abdul Hadi
 */
public class DBHeader {

    Connection conn;
    private String tag;
    private String detail;
    Logger log = Logger.getLogger(getClass().getName());

    public DBHeader(Connection conn) {
        this.conn = conn;
    }

    public ArrayList<Header> getAllHeaderReport2(String status, String io_type, String mt_type, String value_date, String date_from, String date_end, String flag, String filter, String cust_curr, String value_date_end) throws SQLException {
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

        formatRp.setCurrencySymbol("");
        formatRp.setMonetaryDecimalSeparator(',');
        formatRp.setGroupingSeparator('.');

        kursIndonesia.setDecimalFormatSymbols(formatRp);
        ArrayList<Header> headers = new ArrayList<Header>();
        String where = "";
        Double amountAck = 0.0;
        Double amountNack = 0.0;
        if (io_type.equalsIgnoreCase("IO")) {//20190926
            where += "";
        } else if (io_type.equalsIgnoreCase("I")) {
            where += " AND io_type = 'I'";
        } else {
            where += " AND io_type = 'O'";
        }
        if (mt_type == null || mt_type.isEmpty()) {
            where += "";
        } else {
            where += " AND messageType = '" + mt_type + "'";
        }
//        System.out.println("### flag ### = " + flag);
        if (flag == null || flag.isEmpty()) {
            where += "";
        } else {
            // diganti menjadi = asalnya like 20150930
            where += " AND flag = '" + flag + "'";
        }
        if (cust_curr != null && !cust_curr.isEmpty()) {
            where += " AND t32c.detail = '" + cust_curr + "'";
        }
//        if (value_date == null || value_date.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND t32d.detail='" + value_date + "'";
//        }

//        if (filter.equals("")) {
//            where += "";
//        } else if (filter.equals("1")) {
//            where += " AND block3 like '%111:009;%'";
//        } else if (filter.equals("0")) {
//            where += " AND block3 not like '%111:009;%'";
//        }
        where += " AND CAST(hd.tanggal as DATE) BETWEEN '" + date_from + "' AND '" + date_end + " 23:59:59'"; //20200213
        String sql = "SELECT DISTINCT hd.id_headers, hd.messageType,hd.logicalTerminal,hd.io_type,"
                + "hd.receiverAddress,hd.tanggal,hd.flag, t32d.detail, t32c.detail as ccy FROM headers as hd "
                + "LEFT JOIN header_status hds ON hds.id_headers = hd.id_headers "
                + "LEFT JOIN tags t32c ON t32c.id_headers = hd.id_headers and t32c.tagname like '%currency%' "
                + "LEFT JOIN tags t32d ON t32d.id_headers = hd.id_headers AND (t32d.tagName like '%mf32a_date%' OR t32d.tagName like '%mf62f_date%' OR t32d.tagName like '%mf62m_date%' OR t32d.tagName like '%mf32a_value_date%') "
                + "WHERE hd.id_headers=hds.id_headers AND isDuplicate=0 " + where
                + " ORDER BY tanggal DESC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        // kalo mau ada total nominal ack, nack, incok, incnok
//        while (rs.next()) {
//            Header header = new Header();
//            header.setTag32AmountOnlyAck(new java.text.DecimalFormat("#,##0.00").format(amountAck));
//            header.setTag32AmountOnlyNack(new java.text.DecimalFormat("#,##0.00").format(amountNack));
//            header.setTag32AmountOnlyTotal(new java.text.DecimalFormat("#,##0.00").format(amountAck + amountNack));
//            header.setMessageType(rs.getString(2));
//            header.setLogicalTerminal(rs.getString(3));
//            header.setIo_type(rs.getString(4));
//            header.setReceiverAddress(rs.getString(5));
//            header.setTanggal(rs.getString(6));
//            header.setFlag(rs.getString(7));
//            header.setId_headers(rs.getInt(1));
//            header.setTag20(ambilTag20(header.getId_headers()));
//            header.setTag32Amount(ambilTag32Amount(header.getId_headers()));
////            amount
//            header.setTag32AmountOnly(ambilTag32AmountOnly(header.getId_headers()));
////            sender
//            header.setTag53a_identifier_code(ambilTag53a_identifier_code(header.getId_headers()));
//            header.setTag50k_name_address(ambilTag50k_name_address(header.getId_headers()));
////            receiver
//            header.setTag57a_identifier_code(ambilTag57a_identifier_code(header.getId_headers()));
//            header.setTag59_name_address(ambilTag59_name_address(header.getId_headers()));
//            if (header.getMessageType().equalsIgnoreCase("103") || header.getMessageType().equalsIgnoreCase("202")) {
//                if (status.equalsIgnoreCase("Outgoing")) {
//                    if (header.getIo_type().equalsIgnoreCase("I")) {
////                        System.out.println("103||202#out#I#ACK||NACK");
//                        if (header.getFlag().equalsIgnoreCase("ACK") || header.getFlag().equalsIgnoreCase("NACK")) {
//                            if (header.getFlag().equalsIgnoreCase("ACK")) {
//                                amountAck += Double.valueOf(header.getTag32AmountOnly().replace(",", "."));
////                    amountAck += amountAck;
//                                header.setTag32AmountOnlyAck(new java.text.DecimalFormat("#,##0.00").format(amountAck));
//                            }
//                            if (header.getFlag().equalsIgnoreCase("NACK")) {
//                                amountNack += Double.valueOf(header.getTag32AmountOnly().replace(",", "."));
////                    amountNack += amountNack;
//                                header.setTag32AmountOnlyNack(new java.text.DecimalFormat("#,##0.00").format(amountNack));
//                            }
//                            header.setTag32AmountOnlyTotal(new java.text.DecimalFormat("#,##0.00").format(amountAck + amountNack));
//                            headers.add(header);
//                        }
//                    }
//                } else {
//                    if (header.getIo_type().equalsIgnoreCase("O")) {
////                        System.out.println("103||202#in#I#INC-OK||INC-NOK");
//                        if (header.getFlag().equalsIgnoreCase("INC-OK") || header.getFlag().equalsIgnoreCase("INC-NOK")) {
//                            if (header.getFlag().equalsIgnoreCase("INC-OK")) {
//                                amountAck += Double.valueOf(header.getTag32AmountOnly().replace(",", "."));
////                    amountAck += amountAck;
//                                header.setTag32AmountOnlyAck(new java.text.DecimalFormat("#,##0.00").format(amountAck));
//                            }
//                            if (header.getFlag().equalsIgnoreCase("INC-NOK")) {
//                                amountNack += Double.valueOf(header.getTag32AmountOnly().replace(",", "."));
////                    amountNack += amountNack;
//                                header.setTag32AmountOnlyNack(new java.text.DecimalFormat("#,##0.00").format(amountNack));
//                            }
//                            header.setTag32AmountOnlyTotal(new java.text.DecimalFormat("#,##0.00").format(amountAck + amountNack));
//                            headers.add(header);
//                        }
//                    }
//                }
//            }
//        }
        while (rs.next()) {
            Header header = new Header();
            header.setMessageType(rs.getString(2));
            if (rs.getString(4).equalsIgnoreCase("O")) {
                header.setLogicalTerminal(rs.getString(5));
                header.setReceiverAddress(rs.getString(3));
            } else {
                header.setLogicalTerminal(rs.getString(3));
                header.setReceiverAddress(rs.getString(5));
            }
            header.setIo_type(rs.getString(4));
            header.setTanggal(rs.getString(6));
            header.setFlag(rs.getString(7));
            header.setId_headers(rs.getInt(1));
            header.setTag20(ambilTag20(header.getId_headers(), ""));
            String tag32 = ambilTag32Amount(header.getId_headers(), "");
            if (tag32.contains("#")) {
                StringTokenizer st2 = new StringTokenizer(tag32, "#");
                header.setTag32Date(st2.nextElement().toString());
                header.setTag32Currency(st2.nextElement().toString());
                header.setTag32Amount(kursIndonesia.format(Double.parseDouble(st2.nextElement().toString().replace(",", "."))));
            } else {
                header.setTag32Date("");
                header.setTag32Currency("");
                header.setTag32Amount("");
            }
            // ditambahkan 20160502 Azan
            header.setTag53(ambilTag53(header.getId_headers()));
            header.setTag57(ambilTag57(header.getId_headers()));
            header.setTag58(ambilTag58(header.getId_headers()));
            String tag50 = ambilTag50(header.getId_headers());
            if (tag50.contains("#")) {
                StringTokenizer st50 = new StringTokenizer(tag50, "#");
                header.setTag50Acc(st50.nextElement().toString());
                header.setTag50Nm(st50.nextElement().toString());
            } else {
                header.setTag50Acc("");
                header.setTag50Nm("");
            }
            String tag59 = ambilTag59(header.getId_headers());
            if (tag59.contains("#")) {
                StringTokenizer st59 = new StringTokenizer(tag59, "#");
                header.setTag59Acc(st59.nextElement().toString());
                header.setTag59Nm(st59.nextElement().toString());
            } else {
                header.setTag59Acc("");
                header.setTag59Nm("");
            }
            headers.add(header);
        }
        return headers;
    }

    public ArrayList<Header> getAllHeaderReportIncoming(String status, String io_type, String mt_type, String value_date, String date_from, String date_end, String flag, String value_date_end) throws SQLException {
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

        formatRp.setCurrencySymbol("");
        formatRp.setMonetaryDecimalSeparator(',');
        formatRp.setGroupingSeparator('.');

        kursIndonesia.setDecimalFormatSymbols(formatRp);
        ArrayList<Header> headers = new ArrayList<Header>();
        String where = "";
        Double amountAck = 0.0;
        Double amountNack = 0.0;
        if (mt_type == null || mt_type.isEmpty()) {
            where += "";
        } else {
            where += " AND messageType = '" + mt_type + "'";
        }
        if (io_type.equalsIgnoreCase("IO")) {//20190926
            where += "";
        } else if (io_type.equalsIgnoreCase("I")) {
            where += " AND io_type = 'I'";
        } else {
            where += " AND io_type = 'O'";
        }
//        System.out.println("### flag ### = " + flag);
        if (flag == null || flag.isEmpty()) {
            where += "";
//        } else if (flag.equalsIgnoreCase("INC-WAIT")) {
//            where += " AND status_header = '" + flag + "'";
        } else {
            // diganti menjadi = asalnya like 20150930
            where += " AND flag = '" + flag + "'";
        }
//        if (value_date == null || value_date.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND t32d.detail='" + value_date + "'";
//        }

        String sql = "SELECT DISTINCT h.id_headers,messageType,logicalTerminal,sessionNumber,sequenceNumber,io_type,receiverAddress,tanggal, h.id_headers,flag,isDuplicate,branch,\n"
                //                + "t20.detail as t20, t21.detail as t21, t32.detail as amount, t53.detail as sender, ISNULL(t57.detail, '-'), t58.detail as receiver2, t32d.detail as trx_date, t32c.detail as curr,\n"
                + "t20.detail as t20, t21.detail as t21, t32.detail as amount, t53.detail as sender, coalesce(t57.detail, '-'), t58.detail as receiver2, t32d.detail as trx_date, t32c.detail as curr,\n"
                //                + "replace(t50ac.detail,'/','') as senderAcc, t50nm.detail as senderName, replace(t59ac.detail,'/','') as receiverAcc, t59nm.detail as receiverName, ISNULL(t52.detail, '-'), ISNULL(SUBSTRING(t52.detail, 5,2), '-') AS ExtractString, ISNULL(SUBSTRING(t57.detail, 5,2), '-') AS ExtractString\n"
                + "replace(t50ac.detail,'/','') as senderAcc, t50nm.detail as senderName, replace(t59ac.detail,'/','') as receiverAcc, t59nm.detail as receiverName, coalesce(t52.detail, '-'), coalesce(SUBSTRING(t52.detail, 5,2), '-') AS ExtractString, coalesce(SUBSTRING(t57.detail, 5,2), '-') AS ExtractString\n"
                //                + "replace(t50ac.detail,'/','') as senderAcc, t50nm.detail as senderName, replace(t59ac.detail,'/','') as receiverAcc, t59nm.detail as receiverName, SUBSTRING(t52.detail, 5,2) AS ExtractString\n"
                + "FROM headers h\n"
                + "LEFT JOIN tags t20 ON t20.id_headers = h.id_headers AND t20.tag = '20'\n"
                + "LEFT JOIN tags t21 ON t21.id_headers = h.id_headers AND t21.tag = '21'\n"
                + "LEFT JOIN tags t32 ON t32.id_headers = h.id_headers AND (t32.tagName like '%mf32a_amount%' OR t32.tagName like '%mf62f_amount%' OR t32.tagName like '%mf62m_amount%')\n"
                + "LEFT JOIN tags t32c ON t32c.id_headers = h.id_headers AND (t32c.tagName like '%mf32a_currency%' OR t32c.tagName like '%mf62f_currency%' OR t32c.tagName like '%mf62m_currency%') \n"
                + "LEFT JOIN tags t32d ON t32d.id_headers = h.id_headers AND (t32d.tagName like '%mf32a_date%' OR t32d.tagName like '%mf62f_date%' OR t32d.tagName like '%mf62m_date%' OR t32d.tagName like '%mf32a_value_date%') \n"
                + "LEFT JOIN tags t52 ON t52.id_headers = h.id_headers AND t52.tagName like '%of52a_identifier_code%'\n"
                + "LEFT JOIN tags t53 ON t53.id_headers = h.id_headers AND t53.tagName like '%of53a_identifier_code%'\n"
                + "LEFT JOIN tags t57 ON t57.id_headers = h.id_headers AND t57.tagName like '%of57a_identifier_code%'\n"
                + "LEFT JOIN tags t58 ON t58.id_headers = h.id_headers AND t58.tagName like '%of58a_identifier_code%'\n"
                + "LEFT JOIN tags t50ac ON t50ac.id_headers = h.id_headers AND (t50ac.tagName like '%mf50k_account%' or t50ac.tagName like '%mf50f_party_identifier%')\n"
                + "LEFT JOIN tags t50nm ON t50nm.id_headers = h.id_headers AND (t50nm.tagName like '%mf50k_name_address%' or t50nm.tagName like '%mf50f_name_address%')\n"
                + "LEFT JOIN tags t59ac ON t59ac.id_headers = h.id_headers AND (t59ac.tagName like '%mf59_account%' or t59ac.tagName like '%mf59f_account%')\n"
                + "LEFT JOIN tags t59nm ON t59nm.id_headers = h.id_headers AND (t59nm.tagName like '%mf59_name_address%' or t59nm.tagName like '%_187_mf59f_details%')\n"
                + "WHERE (CAST(h.tanggal as date) between '" + date_from + "' and '" + date_end + "') "
                + "AND isDuplicate=0 AND t32d.detail between  '" + value_date + "' and '" + value_date_end + "'  "
                + where + " ORDER BY tanggal DESC";
//        where += " AND CAST(tanggal as DATE) BETWEEN '" + date_from + "' AND '" + date_end + "'";
//        String sql = "SELECT DISTINCT headers.id_headers, messageType,logicalTerminal,io_type,"
//                + "receiverAddress,tanggal,flag,branch FROM headers,header_status "
//                + "WHERE headers.id_headers=header_status.id_headers AND " + where
//                + " AND isDuplicate=0 ORDER BY tanggal DESC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header header = new Header();
            header.setMessageType(rs.getString(2));
            header.setLogicalTerminal(rs.getString(5));
            header.setReceiverAddress(rs.getString(3));
            header.setIo_type(rs.getString(6));
            header.setTanggal(rs.getString(8));
            header.setFlag(rs.getString(7));
            header.setBranch(rs.getString(12));
            header.setId_headers(rs.getInt(1));
            header.setTag20(ambilTag20(header.getId_headers(), ""));
            header.setTag32Amount(rs.getString(15));
            header.setTag32Date(rs.getString(19));
            header.setTag32Currency(rs.getString(20));
//            String tag32 = ambilTag32Amount(header.getId_headers(), "");
//            if (tag32.contains("#")) {
//                StringTokenizer st2 = new StringTokenizer(tag32, "#");
//                header.setTag32Date(st2.nextElement().toString());
//                header.setTag32Currency(st2.nextElement().toString());
//                header.setTag32Amount(kursIndonesia.format(Double.parseDouble(st2.nextElement().toString().replace(",", "."))));
//            } else {
//                header.setTag32Date("");
//                header.setTag32Currency("");
//                header.setTag32Amount("");
//            }
            // ditambahkan 20160502 Azan
            header.setTag52Cc(rs.getString(26));//20200421
            header.setTag52(rs.getString(25));
            header.setTag53(rs.getString(16));
            header.setTag57Cc(rs.getString(27));//20200421
            header.setTag57(rs.getString(17));
            header.setTag50Acc(rs.getString(21));
            header.setTag50Nm(rs.getString(22));
            header.setTag59Acc(rs.getString(23));
            header.setTag59Nm(rs.getString(24));
            header.setTag70(ambilTag70(header.getId_headers()));
            headers.add(header);
        }
        return headers;
    }

    public ArrayList<Header> getAllHeaderReportOutgoing(String status, String io_type, String mt_type, String value_date, String date_from, String date_end, String flag, String value_date_end, String filter) throws SQLException {
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

        formatRp.setCurrencySymbol("");
        formatRp.setMonetaryDecimalSeparator(',');
        formatRp.setGroupingSeparator('.');

        kursIndonesia.setDecimalFormatSymbols(formatRp);
        ArrayList<Header> headers = new ArrayList<Header>();
        String where = "";
        Double amountAck = 0.0;
        Double amountNack = 0.0;
        if (mt_type == null || mt_type.isEmpty()) {
            where += "";
        } else {
            where += " AND messageType = '" + mt_type + "'";
        }
        if (io_type.equalsIgnoreCase("IO")) {//20190926
            where += "";
        } else if (io_type.equalsIgnoreCase("I")) {
            where += " AND io_type = 'I'";
        } else {
            where += " AND io_type = 'O'";
        }
//        if (mt_type == null || mt_type.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND messageType LIKE '%" + mt_type + "%'";
//        }
//        System.out.println("### flag ### = " + flag);
        if (flag == null || flag.isEmpty()) {
            where += "";
//        } else if (flag.equalsIgnoreCase("INC-WAIT")) {
//            where += " AND status_header = '" + flag + "'";
        } else {
            // diganti menjadi = asalnya like 20150930
            where += " AND flag = '" + flag + "'";
        }
//        if (value_date == null || value_date.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND t32d.detail='" + value_date + "'";
//        }
//        20230517
//        if (filter == null || filter.isEmpty() || filter.equals("")) {
//            where += "";
//        } else {
//            where += " AND filter = '" + filter + "' ";
//        }
        if (filter == null) {
            where += "";
        } else if (filter.equals("1")) {
            where += " AND block3 like '%111:009;%'";
        } else if (filter.equals("0")) {
            where += " AND block3 not like '%111:009;%'";
        } else {
            where += "";
        }

        String sql = "SELECT DISTINCT h.id_headers,messageType,logicalTerminal,sessionNumber,sequenceNumber,io_type,receiverAddress,tanggal, h.id_headers,flag,isDuplicate,branch,\n"
                + "t20.detail as t20, t21.detail as t21, t32.detail as amount, t53.detail as sender, t57.detail as receiver, t58.detail as receiver2, t32d.detail as trx_date, t32c.detail as curr,\n"
                + "replace(t50ac.detail,'/','') as senderAcc, t50nm.detail as senderName, replace(t59ac.detail,'/','') as receiverAcc, t59nm.detail as receiverName, coalesce(t52.detail, '-'), coalesce(SUBSTRING(t52.detail, 5,2), '-') AS ExtractString, coalesce(SUBSTRING(t57.detail, 5,2), '-') AS ExtractString\n"
                //                + "replace(t50ac.detail,'/','') as senderAcc, t50nm.detail as senderName, replace(t59ac.detail,'/','') as receiverAcc, t59nm.detail as receiverName, ISNULL(t52.detail, '-'), ISNULL(SUBSTRING(t52.detail, 5,2), '-') AS ExtractString, ISNULL(SUBSTRING(t57.detail, 5,2), '-') AS ExtractString\n"
                + "FROM headers h\n"
                + "LEFT JOIN tags t20 ON t20.id_headers = h.id_headers AND t20.tag = '20'\n"
                + "LEFT JOIN tags t21 ON t21.id_headers = h.id_headers AND t21.tag = '21'\n"
                + "LEFT JOIN tags t32 ON t32.id_headers = h.id_headers AND (t32.tagName like '%mf32a_amount%' OR t32.tagName like '%mf62f_amount%' OR t32.tagName like '%mf62m_amount%')\n"
                + "LEFT JOIN tags t32c ON t32c.id_headers = h.id_headers AND (t32c.tagName like '%mf32a_currency%' OR t32c.tagName like '%mf62f_currency%' OR t32c.tagName like '%mf62m_currency%') \n"
                + "LEFT JOIN tags t32d ON t32d.id_headers = h.id_headers AND (t32d.tagName like '%mf32a_date%' OR t32d.tagName like '%mf62f_date%' OR t32d.tagName like '%mf62m_date%' OR t32d.tagName like '%mf32a_value_date%') \n"
                + "LEFT JOIN tags t52 ON t52.id_headers = h.id_headers AND t52.tagName like '%of52a_identifier_code%'\n"
                + "LEFT JOIN tags t53 ON t53.id_headers = h.id_headers AND t53.tagName like '%of53a_identifier_code%'\n"
                + "LEFT JOIN tags t57 ON t57.id_headers = h.id_headers AND t57.tagName like '%of57a_identifier_code%'\n"
                + "LEFT JOIN tags t58 ON t58.id_headers = h.id_headers AND t58.tagName like '%of58a_identifier_code%'\n"
                + "LEFT JOIN tags t50ac ON t50ac.id_headers = h.id_headers AND (t50ac.tagName like '%mf50k_account%' or t50ac.tagName like '%mf50f_party_identifier%')\n"
                + "LEFT JOIN tags t50nm ON t50nm.id_headers = h.id_headers AND (t50nm.tagName like '%mf50k_name_address%' or t50nm.tagName like '%mf50f_name_address%')\n"
                + "LEFT JOIN tags t59ac ON t59ac.id_headers = h.id_headers AND (t59ac.tagName like '%mf59_account%' or t59ac.tagName like '%mf59f_account%')\n"
                + "LEFT JOIN tags t59nm ON t59nm.id_headers = h.id_headers AND (t59nm.tagName like '%mf59_name_address%' or t59nm.tagName like '%_187_mf59f_details%')\n"
                + "WHERE (CAST(h.tanggal as date) between '" + date_from + "' and '" + date_end + "') "
                + "AND isDuplicate=0 AND t32d.detail between  '" + value_date + "' and '" + value_date_end + "'  "
                + where + " ORDER BY tanggal DESC";

//        where += " AND CAST(tanggal as DATE) BETWEEN '" + date_from + "' AND '" + date_end + "'";
//        String sql = "SELECT DISTINCT headers.id_headers, messageType,logicalTerminal,io_type,"
//                + "receiverAddress,tanggal,flag,branch FROM headers,header_status "
//                + "WHERE headers.id_headers=header_status.id_headers AND " + where
//                + " AND isDuplicate=0 ORDER BY tanggal DESC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header header = new Header();
            header.setMessageType(rs.getString(2));
            header.setLogicalTerminal(rs.getString(3));
            header.setIo_type(rs.getString(4));
            header.setReceiverAddress(rs.getString(5));
            header.setTanggal(rs.getString(6));
            header.setFlag(rs.getString(10));
            header.setBranch(rs.getString(8));
            header.setId_headers(rs.getInt(1));
            header.setTag20(ambilTag20(header.getId_headers(), ""));
            //updated 20200421 ovasae
            header.setTag32Amount(rs.getString(15));
            header.setTag32Date(rs.getString(19));
            header.setTag32Currency(rs.getString(20));
//            String tag32 = ambilTag32Amount(header.getId_headers(), "");
//            if (tag32.contains("#")) {
//                StringTokenizer st2 = new StringTokenizer(tag32, "#");
//                header.setTag32Date(st2.nextElement().toString());
//                header.setTag32Currency(st2.nextElement().toString());
//                header.setTag32Amount(kursIndonesia.format(Double.parseDouble(st2.nextElement().toString().replace(",", "."))));
//            } else {
//                header.setTag32Date("");
//                header.setTag32Currency("");
//                header.setTag32Amount("");
//            }
            // ditambahkan 20160502 Azan
            header.setTag53(ambilTag53(header.getId_headers()));
            //20200421_ovasae
            header.setTag52(rs.getString(25));
            header.setTag52Cc(rs.getString(26));
            header.setTag57(rs.getString(17));
            header.setTag57Cc(rs.getString(27));
            header.setTag50Acc(rs.getString(21));
            header.setTag50Nm(rs.getString(22));
            header.setTag59Acc(rs.getString(23));
            header.setTag59Nm(rs.getString(24));
//            header.setTag58(ambilTag58(header.getId_headers()));
//            String tag50 = ambilTag50(header.getId_headers());
//            if (tag50.contains("#")) {
//                StringTokenizer st50 = new StringTokenizer(tag50, "#");
//                header.setTag50Acc(st50.nextElement().toString().replace("/", ""));
//                header.setTag50Nm(st50.nextElement().toString());
//            } else {
//                header.setTag50Acc("");
//                header.setTag50Nm("");
//            }
//            String tag59 = ambilTag59(header.getId_headers());
//            if (tag59.contains("#")) {
//                StringTokenizer st59 = new StringTokenizer(tag59, "#");
//                header.setTag59Acc(st59.nextElement().toString().replace("/", ""));
//                header.setTag59Nm(st59.nextElement().toString());
//            } else {
//                header.setTag59Acc("");
//                header.setTag59Nm("");
//            }
            header.setTag70(ambilTag70(header.getId_headers()));
            headers.add(header);
        }
        return headers;
    }

    public ArrayList<Header> getAllHeaderReportXls(String mt_type, String flag, String value_date, String date_from, String date_end, String io, String value_date_end, String filter, String cust_curr) throws SQLException {
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

        formatRp.setCurrencySymbol("");
        formatRp.setMonetaryDecimalSeparator('.');
        formatRp.setGroupingSeparator(',');

        kursIndonesia.setDecimalFormatSymbols(formatRp);
        ArrayList<Header> headers = new ArrayList<Header>();
        String where = "";

        if (mt_type == null || mt_type.isEmpty()) {
            where += "";
        } else {
            where += " AND messageType = '" + mt_type + "'";
        }
        if (io.equalsIgnoreCase("IO")) {//20190926
            where += "";
        } else if (io.equalsIgnoreCase("I")) {
            where += " AND io_type = 'I'";
        } else {
            where += " AND io_type = 'O'";
        }
        if (flag == null || flag.isEmpty()) {
            where += "";
        } else {
            where += " AND flag = '" + flag + "'";
        }

        if (filter.equals("")) {
            where += "";
        } else if (filter.equals("1")) {
            where += " AND block3 like '%111:009;%'";
        } else if (filter.equals("0")) {
            where += " AND block3 not like '%111:009;%'";
        }
        if (cust_curr != null && !cust_curr.isEmpty()) {
            where += " AND t32c.detail = '" + cust_curr + "'";
        }
//        if (value_date == null || value_date.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND t32d.detail='" + value_date + "'";
//        }
        //20190926 diganti jadi ini
        String sql = "SELECT DISTINCT h.id_headers, messageType, logicalTerminal, sessionNumber, sequenceNumber, io_type, receiverAddress, tanggal, h.id_headers, flag, isDuplicate, "
                + "t20.detail as t20, t21.detail as t21, t32.detail as amount, t53.detail as sender, t57.detail, t58.detail as receiver2, t32d.detail as trx_date, t32c.detail as curr, "
                + "replace(t50ac.detail,'/','') as senderAcc, t50nm.detail as senderName, replace(t59ac.detail,'/','') as receiverAcc, t59nm.detail as receiverName, "
                + "coalesce(t52.detail, receiverAddress), coalesce(SUBSTRING(t52.detail, 5,2), SUBSTRING(receiverAddress, 5,2)) AS ExtractString, "
                + "SUBSTRING(t57.detail, 5,2) AS ExtractString, coalesce(t70.detail, '-'), coalesce(coalesce(t54.detail, t53.detail), receiverAddress), coalesce(t71a.detail, '-'), "
                + "branch, komentar "
                + "FROM headers h "
                + "LEFT JOIN tags t20 ON t20.id_headers = h.id_headers AND t20.tag = '20' "
                + "LEFT JOIN tags t21 ON t21.id_headers = h.id_headers AND t21.tag = '21' "
                + "LEFT JOIN tags t32 ON t32.id_headers = h.id_headers AND (t32.tagName like '%mf32a_amount%' OR t32.tagName like '%mf62f_amount%' OR t32.tagName like '%mf62m_amount%') "
                + "LEFT JOIN tags t32c ON t32c.id_headers = h.id_headers AND (t32c.tagName like '%mf32a_currency%' OR t32c.tagName like '%mf62f_currency%' OR t32c.tagName like '%mf62m_currency%') "
                + "LEFT JOIN tags t32d ON t32d.id_headers = h.id_headers AND (t32d.tagName like '%mf32a_date%' OR t32d.tagName like '%mf62f_date%' OR t32d.tagName like '%mf62m_date%' OR t32d.tagName like '%mf32a_value_date%') "
                + "LEFT JOIN tags t52 ON t52.id_headers = h.id_headers AND t52.tagName like '%of52a_identifier_code%' "
                + "LEFT JOIN tags t53 ON t53.id_headers = h.id_headers AND t53.tagName like '%of53a_identifier_code%' "
                + "LEFT JOIN tags t54 ON t54.id_headers = h.id_headers AND t54.tagName like '%of54a_identifier_code%' "
                + "LEFT JOIN tags t57 ON t57.id_headers = h.id_headers AND t57.tagName like '%of57a_identifier_code%' "
                + "LEFT JOIN tags t58 ON t58.id_headers = h.id_headers AND t58.tagName like '%of58a_identifier_code%' "
                + "LEFT JOIN tags t50ac ON t50ac.id_headers = h.id_headers AND (t50ac.tagName like '%mf50k_account%' or t50ac.tagName like '%_093_mf50f_account%') "
                + "LEFT JOIN tags t50nm ON t50nm.id_headers = h.id_headers AND (t50nm.tagName like '%mf50k_name_address%' or t50nm.tagName like '%_095_mf50f_details%') "
                + "LEFT JOIN tags t59ac ON t59ac.id_headers = h.id_headers AND (t59ac.tagName like '%mf59_account%' or t59ac.tagName like '%mf59f_account%') "
                + "LEFT JOIN tags t59nm ON t59nm.id_headers = h.id_headers AND (t59nm.tagName like '%mf59_name_address%' or t59nm.tagName like '%_187_mf59f_details%') "
                + "LEFT JOIN tags t70 ON t70.id_headers = h.id_headers AND t70.tagName like '%of70_remittance_information%' "
                + "LEFT JOIN tags t71a ON t71a.id_headers = h.id_headers AND t71a.tagName like '%of71a_details_charges%' "
                + "WHERE (CAST(h.tanggal as date) between '" + date_from + "' and '" + date_end + "') "
                + "AND isDuplicate=0 "
                + "AND (t32d.detail IS NULL OR (t32d.detail between '" + value_date + "' and '" + value_date_end + "')) "
                + where + " ORDER BY tanggal DESC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header header = new Header();
            header.setMessageType(rs.getString(2));
            String logTer = rs.getString(3).substring(0, 8) + rs.getString(3).substring(9); //20191227
//            System.out.println("sdj77 " + rs.getString(7));
            String recAdd = rs.getString(7).substring(0, 8) + rs.getString(7).substring(9);
            if (rs.getString(6).equalsIgnoreCase("O")) {
                header.setIo_type("Inc");
                header.setLogicalTerminal(recAdd);
                header.setReceiverAddress(logTer);
            } else {
                header.setIo_type("Out");
                header.setLogicalTerminal(logTer);
                header.setReceiverAddress(recAdd);
            }
            header.setTanggal(rs.getString(8));
            header.setFlag(rs.getString(10));
            header.setId_headers(rs.getInt(1));
            header.setTag20(rs.getString(12));
            header.setTag32Date(rs.getString(18));
            header.setTag32Currency(rs.getString(19));
            if (rs.getString(14) == null) {
                header.setTag32Amount("");
            } else {
                header.setTag32Amount(kursIndonesia.format(Double.parseDouble(rs.getString(14).replace(",", "."))));
            }
            //update//20200511//sae
            header.setTag52Cc(rs.getString(25));
            header.setTag52(rs.getString(24));
            header.setTag53(rs.getString(15));
            if (rs.getString(28).length() > 11) {
                header.setTag54(rs.getString(28).substring(0, 8) + rs.getString(28).substring(9));
            } else {
                if (rs.getString(28).length() < 11) {
                    header.setTag54(rs.getString(28) + "XXX");
                } else {
                    header.setTag54(rs.getString(28));
                }
            }
            header.setTag57Cc(rs.getString(26));
            header.setTag57(rs.getString(16));
            header.setTag50Acc(rs.getString(20));
            header.setTag50Nm(rs.getString(21));
            header.setTag59Acc(rs.getString(22));
            header.setTag59Nm(rs.getString(23));
            header.setTag70(rs.getString(27));
            header.setTag71A(rs.getString(29));
            header.setBranch(rs.getString(30));
            header.setKomentar(rs.getString(31));
//            System.out.println("isi komen " + rs.getString(31));
            //header.setNoFT(rs.getString(32));
            headers.add(header);
        }
        return headers;
    }

    public Collection<Header> printMTDoc(String id) throws SQLException, Exception {
        ArrayList<Header> headers = new ArrayList<Header>();
        String sql = "SELECT logicalTerminal,messageType,receiverAddress,messagePriority,"
                + "flag,bankingPriority,mur,komentar,MIRDate,MIRLogicalTerminal,MIRSessionNumber,MIRSequenceNumber,io_type "
                + "FROM headers WHERE id_headers=? ";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header header = new Header();
            String logTer = rs.getString(1).substring(0, 8) + rs.getString(1).substring(9); //20191227
            String recAdd = rs.getString(3).substring(0, 8) + rs.getString(3).substring(9);
            if (rs.getString(13).equalsIgnoreCase("O")) {
                header.setLogicalTerminal(logTer);
                header.setReceiverAddress(recAdd);
            } else {
                header.setLogicalTerminal(recAdd);
                header.setReceiverAddress(logTer);
            }
            header.setMessageType(rs.getString(2));
            header.setMessagePriority(rs.getString(4));
            header.setFlag(rs.getString(5));
            header.setBankingPriority(rs.getString(6));
            header.setMur(rs.getString(7));
            header.setKomentar(rs.getString(8));
            header.setMIRDate(rs.getString(9));
            header.setMIRLogicalTerminal(rs.getString(10));
            header.setMIRSessionNumber(rs.getString(11));
            header.setMIRSequenceNumber(rs.getString(12));
            header.setTagDB(getAllTagByIdReportMTDoc(id));
            headers.add(header);
        }
        return headers;
    }

    // tambahan untuk print nota 20180413
    public Collection<Header> printMTNota(String id) throws SQLException {
        ConvertToTerbilang cvt = new ConvertToTerbilang();
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

        formatRp.setCurrencySymbol("");
        formatRp.setMonetaryDecimalSeparator('.');
        formatRp.setGroupingSeparator(',');

        kursIndonesia.setDecimalFormatSymbols(formatRp);
        ArrayList<Header> headers = new ArrayList<Header>();
        String sql = "SELECT id_headers,logicalTerminal,messageType,receiverAddress,flag "
                + "FROM headers WHERE id_headers='" + id + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header header = new Header();
            header.setId_headers(rs.getInt(1));
            header.setMessageType(rs.getString(3));
            String logTer = rs.getString(2).substring(0, 8) + rs.getString(2).substring(9); //20191227
            String recAdd = rs.getString(4).substring(0, 8) + rs.getString(4).substring(9);
            if (rs.getString(6).equalsIgnoreCase("O")) {
                header.setLogicalTerminal(recAdd);
                header.setReceiverAddress(logTer);
            } else {
                header.setLogicalTerminal(logTer);
                header.setReceiverAddress(recAdd);
            }
            header.setFlag(rs.getString(5));
            header.setTag20(ambilTag20(header.getId_headers(), ""));
            String tag32 = ambilTag32Amount(header.getId_headers(), "");
            if (tag32.contains("#")) {
                StringTokenizer st2 = new StringTokenizer(tag32, "#");
                header.setTag32Date(st2.nextElement().toString());
                header.setTag32Currency(st2.nextElement().toString());
                header.setTag32Amount(kursIndonesia.format(Double.parseDouble(st2.nextElement().toString().replace(",", "."))));
            } else {
                header.setTag32Date("");
                header.setTag32Currency("");
                header.setTag32Amount("");
            }
            // ditambahkan 20180415 azan
            String terbilang = "";
            String amount = header.getTag32Amount();
            String[] amt = amount.split("\\.");
            if (!amt[1].equalsIgnoreCase("00")) {
                terbilang += cvt.angkaToTerbilang(amt[0].replace(".00", "").replace(",", "")).toLowerCase();
                terbilang += " koma ";
                if (amt[1].startsWith("0")) {
                    terbilang += " nol ";
                }
                terbilang += cvt.angkaToTerbilang(amt[1].replace(".00", "").replace(",", "")).toLowerCase();
            } else {
                terbilang += cvt.angkaToTerbilang(amount.replace(".00", "").replace(",", "")).toLowerCase();
            }
            terbilang += " rupiah,-";
            String output = terbilang.substring(0, 1).toUpperCase() + terbilang.substring(1);
            header.setTerbilang(output);
            // ditambahkan 20160502 Azan
            header.setTag53(ambilTag53(header.getId_headers()));
            header.setTag57(ambilTag57(header.getId_headers()));
            header.setTag58(ambilTag58(header.getId_headers()));
            String tag50 = ambilTag50(header.getId_headers());
            if (tag50.contains("#")) {
                StringTokenizer st50 = new StringTokenizer(tag50, "#");
                if (st50.countTokens() == 2) {
                    tag50 = " # " + tag50;
                }
                st50 = new StringTokenizer(tag50, "#");
                header.setTag50Acc(st50.nextElement().toString());
                header.setTag50Nm(st50.nextElement().toString().trim());
            } else {
                header.setTag50Acc("");
                header.setTag50Nm("");
            }
            String tag59 = ambilTag59(header.getId_headers());
            if (tag59.contains("#")) {
                StringTokenizer st59 = new StringTokenizer(tag59, "#");
                header.setTag59Acc(st59.nextElement().toString().replace("/", ""));
                header.setTag59Nm(st59.nextElement().toString().trim());
            } else {
                header.setTag59Acc("");
                header.setTag59Nm("");
            }
            header.setTag70(ambilTag70(header.getId_headers()));
            headers.add(header);
        }
        return headers;
    }

    public List<Header> getAllHeader(HttpSession httpSession, String io_type, String flag, String channel, int start, int length, HeaderSearchCriteria criteria, String quicksearch, String sort) throws Exception {
        String where = "";
        String role = "";
        String isDuplicate = "0";
        Calendar now = Calendar.getInstance();
        // dikomen karena hanya menampilkan transaksi today
//        now.add(Calendar.MONTH, -1);
        String tanggal_transaksi_sebulan = new SimpleDateFormat("yyyy-MM-dd").format(now.getTime());
//        System.out.println("tanggal_transaksi_sebulan : "+tanggal_transaksi_sebulan);
        List<String> list = (ArrayList) httpSession.getAttribute("role");
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println("data=" + i + "=" + list.get(i));
//        }
//        TYPE:INCOMING,TYPE:OUTGOING
        if (list.contains("TYPE:OUTGOING_INCOMING")) {
            where += "io_type IN ('I','O') AND "; // role diganti jadi where
        } else if (list.contains("TYPE:INCOMING")) {
            where += "io_type IN ('O') AND ";
        } else if (list.contains("TYPE:OUTGOING")) {
            where += "io_type IN ('I') AND ";
        } else {
            where += "io_type IN ('') AND ";
        }
//        SRC:MANUAL,SRC:FIA
        if (list.contains("SRC:MANUAL") && list.contains("SRC:FIA") && list.contains("SRC:UPLOAD")) {
            where += "userEntry IN ('SRC:MANUAL','SRC:FIA','SRC:UPLOAD') "; //role diganti jadi where. AND dihapus
        } else if (list.contains("SRC:MANUAL") && list.contains("SRC:FIA")) {
            where += "userEntry IN ('SRC:MANUAL','SRC:FIA') ";
        } else if (list.contains("SRC:FIA") && list.contains("SRC:UPLOAD")) {
            where += "userEntry IN ('SRC:FIA','SRC:UPLOAD') ";
        } else if (list.contains("SRC:MANUAL") && list.contains("SRC:UPLOAD")) {
            where += "userEntry IN ('SRC:MANUAL','SRC:UPLOAD') ";
        } else if (list.contains("SRC:MANUAL")) {
            where += "userEntry IN ('SRC:MANUAL')";
        } else if (list.contains("SRC:FIA")) {
            where += "userEntry IN ('SRC:FIA')";
        } else if (list.contains("SRC:UPLOAD")) {
            where += "userEntry IN ('SRC:UPLOAD')";
        } else {
            where += "userEntry IN ('') ";
        }
//        System.out.println("io_type=" + io_type);
        if (io_type == null || io_type.isEmpty()) {
            where += "";
        } else if (io_type.equalsIgnoreCase("i")) {
            where += "AND io_type='I' ";
        } else if (io_type.equalsIgnoreCase("o")) {
            where += "AND io_type='O' ";
        } else {
            where += "(io_type='O' OR io_type='I') ";
        }
        if (flag == null || flag.isEmpty()) {
            where += " AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("MOD")) {
            where += " AND flag='MOD' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("VER")) {
            where += " AND flag='VER' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
//        } else if (flag.equalsIgnoreCase("AUTH")) {
//            where += " AND flag='AUTH' AND CAST(h.tanggal as date) = '" + tanggal_transaksi_sebulan + "'";
//        } else if (flag.equalsIgnoreCase("TEXT")) {
//            where += " AND flag='TEXT' AND CAST(h.tanggal as date) = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("AUTH") || flag.equalsIgnoreCase("TEXT")) {
            where += " AND (flag='AUTH' OR flag='TEXT') AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("ACK")) {
            where += " AND flag='ACK' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-WAIT")) {
            where += " AND flag='INC-WAIT' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-STL")) {
            where += " AND flag='INC-STL' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-RSTL")) {
            where += " AND flag='INC-RSTL' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-INV")) {
            where += " AND flag='INC-INV' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-RTR")) {
            where += " AND flag='INC-RTR' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-OK")) {
            where += " AND flag='INC-OK' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-NOK")) {
            where += " AND flag='INC-NOK' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-HOLD")) {
            where += " AND flag='INC-HOLD' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("NACK")) {
            where += " AND flag='NACK' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("ACK")) {
            where += " AND flag='ACK' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-CNF")) {
            where += " AND flag='INC-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC")) {
            where += " AND flag='INC' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("ERR")) {
            isDuplicate = "3";
            where += " AND flag='MOD' ";
        } else if (flag.equalsIgnoreCase("CVT-MOD")) {
            where += " AND flag='CVT-MOD' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("CVT-VER")) {
            where += " AND flag='CVT-VER' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("WAITING-AML")) {
            where += " AND flag='WAITING-AML' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-CVT")) {
            where += " AND flag='INC-CVT' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC")) {
            where += " AND flag='INC' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("RESEND-CNF")) {
            where += " AND flag='RESEND-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-REJECT-CNF")) {
            where += " AND flag='INC-REJECT-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-AML")) {
            where += " AND flag='INC-AML' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-AML-FAILED")) {
            where += " AND flag='INC-AML-FAILED' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-AML-FAILED-CNF")) {
            where += " AND flag='INC-AML-FAILED-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("SETTLE")) {
            where += " AND flag='SETTLE' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("AML-TERMINATE-IN")) {
            where += " AND flag='AML-TERMINATE-IN' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("AML-TERMINATE-OUT")) {
            where += " AND flag='AML-TERMINATE-OUT' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("UNSETTLE-INC")) {
            where += " AND flag='UNSETTLE-INC' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-RESEND-CNF")) {
            where += " AND flag='INC-RESEND-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("UNSETTLE-OUT")) {
            where += " AND flag='UNSETTLE-OUT' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("WAITING-SAA-CNF")) {
            where += " AND flag='WAITING-SAA-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("AML-FAILED")) {
            where += " AND flag='AML-FAILED' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("AML-FAILED-CNF")) {
            where += " AND flag='AML-FAILED-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("FIA-FAILED")) {
            where += " AND flag='FIA-FAILED' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("FIA-FAILED-CNF")) {
            where += " AND flag='FIA-FAILED-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else {
            where += " AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        }

        if (channel != null && !channel.isBlank()) {
            where += " AND source LIKE '%" + channel + "%'";
        }

        if (quicksearch != null && !quicksearch.isEmpty()) {
            if (quicksearch.startsWith("ou")) {
                where += " AND (h.io_type = 'I' OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE '%" + quicksearch + "%')";
            } else if (quicksearch.startsWith("in")) {
                where += " AND (h.io_type = 'O' OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE '%" + quicksearch + "%')";
            } else {
                where += " AND CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE '%" + quicksearch + "%'";
            }
        }

        if (criteria.getMtSearch() != null && !criteria.getMtSearch().isEmpty()) {
            where += " AND messageType ILIKE '%" + criteria.getMtSearch() + "%'";
        }
        if (criteria.getIoSearch() != null && !criteria.getIoSearch().isEmpty()) {
            String ioInput = criteria.getIoSearch().trim().toLowerCase();
            if (ioInput.startsWith("ou")) {
                where += " AND h.io_type = 'I'";
            } else if (ioInput.startsWith("in")) {
                where += " AND h.io_type = 'O'";
            }
        }
        if (criteria.getSeqSearch() != null && !criteria.getSeqSearch().isEmpty()) {
            where += " AND sequenceNumber::TEXT ILIKE '%" + criteria.getSeqSearch() + "%'";
        }
        if (criteria.getLogicalSearch() != null && !criteria.getLogicalSearch().isEmpty()) {
            where += " AND logicalTerminal ILIKE '%" + criteria.getLogicalSearch() + "%'";
        }
        if (criteria.getReceiverSearch() != null && !criteria.getReceiverSearch().isEmpty()) {
            where += " AND receiverAddress ILIKE '%" + criteria.getReceiverSearch() + "%'";
        }
        if (criteria.getRefSearch() != null && !criteria.getRefSearch().isEmpty()) {
            where += " AND trans_reference ILIKE '%" + criteria.getRefSearch() + "%'";
        }
        if (criteria.getRelRefSearch() != null && !criteria.getRelRefSearch().isEmpty()) {
            where += " AND trans_related_reference ILIKE '%" + criteria.getRelRefSearch() + "%'";
        }
        if (criteria.getValDateSearch() != null && !criteria.getValDateSearch().isEmpty()) {
            where += " AND trans_date_value::TEXT ILIKE '%" + criteria.getValDateSearch() + "%'";
        }
        if (criteria.getCcySearch() != null && !criteria.getCcySearch().isEmpty()) {
            where += " AND trans_ccy ILIKE '%" + criteria.getCcySearch() + "%'";
        }
        if (criteria.getAmountSearch() != null && !criteria.getAmountSearch().isEmpty()) {
            where += " AND trans_amount::TEXT ILIKE '%" + criteria.getAmountSearch() + "%'";
        }
        if (criteria.getCreatedDateSearch() != null && !criteria.getCreatedDateSearch().isEmpty()) {
            where += " AND tanggal::TEXT ILIKE '%" + criteria.getCreatedDateSearch() + "%'";
        }
        if (criteria.getFlagSearch() != null && !criteria.getFlagSearch().isEmpty()) {
            where += " AND flag ILIKE '%" + criteria.getFlagSearch() + "%'";
        }
        if (criteria.getSourceSearch() != null && !criteria.getSourceSearch().isEmpty()) {
            where += " AND source ILIKE '%" + criteria.getSourceSearch() + "%'";
        }

        List<Header> headers = new ArrayList<Header>();
        String sql = """
                     SELECT h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type,
                     h.receiverAddress, h.tanggal, h.id_headers, h.flag, h.isDuplicate,
                     h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy
                     FROM headers h LEFT JOIN trx_detail td ON h.id_headers = td.id_headers WHERE isDuplicate='""" + isDuplicate + "' AND (" + where + ") "
                + "ORDER BY "+sort+" OFFSET " + start + " ROWS FETCH NEXT " + length + " ROWS ONLY --LIMIT 100 OFFSET (1 - 1) * 100";

//        LIMIT <jumlahDataPerHalaman> OFFSET (<nomorHalaman> - 1) * <jumlahDataPerHalaman>
//        System.out.println(sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header header = new Header();
            header.setMessageType(rs.getString(2));
            header.setLogicalTerminal(rs.getString(3).toUpperCase());
            header.setSessionNumber(rs.getString(4));
            header.setSequenceNumber(rs.getString(5));
            if (rs.getString(6).equalsIgnoreCase("i")) {
                header.setIo_type("OUTGOING");
            } else {
                header.setIo_type("INCOMING");
            }
            header.setReceiverAddress(rs.getString(7).toUpperCase());
            header.setTanggal(rs.getString(8));
            header.setId_headers(rs.getInt(9));
//            if (rs.getString(6).equalsIgnoreCase("3")) {
//                flag = "ERR";
//            }
            header.setFlag(rs.getString(10));
            header.setBlock3(rs.getString(12));
            header.setSource(rs.getString(13));
            header.setTrans_refference(rs.getString(14));
//            System.out.println("Refernce " + rs.getString(14));
            header.setTrans_related_refference(rs.getString(15));
            header.setTrans_amount(rs.getString(17));
            if (rs.getString(17) == null) {
                header.setTrans_amount("0");
            } else {
                header.setTrans_amount(rs.getString(17).replace(",", "."));
            }
            header.setTrans_date_value(rs.getString(16));
            header.setTrans_ccy(rs.getString(18));

//            header.setTrans_ccy(rs.getString(15));
//            header.setTag20(rs.getString(12));
//            header.setTag21(rs.getString(13));
//            header.setTag32Amount(blockNominal(rs.getString(14)));
//            header.setTag32Date(rs.getString(18));
//            header.setTag32Currency(rs.getString(19));
//            header.setBlock3(rs.getString(20));
//            header.setSource(rs.getString("source"));
            headers.add(header);
        }
        return headers;
    }

    public int countAllHeader(HttpSession httpSession, String io_type, String flag, String channel, HeaderSearchCriteria criteria, String quicksearch) throws Exception {
        String where = "";
        String role = "";
        String isDuplicate = "0";
        Calendar now = Calendar.getInstance();
        // dikomen karena hanya menampilkan transaksi today
//        now.add(Calendar.MONTH, -1);
        String tanggal_transaksi_sebulan = new SimpleDateFormat("yyyy-MM-dd").format(now.getTime());
//        System.out.println("tanggal_transaksi_sebulan : "+tanggal_transaksi_sebulan);
        List<String> list = (ArrayList) httpSession.getAttribute("role");
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println("data=" + i + "=" + list.get(i));
//        }
//        TYPE:INCOMING,TYPE:OUTGOING
        if (list.contains("TYPE:OUTGOING_INCOMING")) {
            where += "io_type IN ('I','O') AND "; // role diganti jadi where
        } else if (list.contains("TYPE:INCOMING")) {
            where += "io_type IN ('O') AND ";
        } else if (list.contains("TYPE:OUTGOING")) {
            where += "io_type IN ('I') AND ";
        } else {
            where += "io_type IN ('') AND ";
        }
//        SRC:MANUAL,SRC:FIA
        if (list.contains("SRC:MANUAL") && list.contains("SRC:FIA") && list.contains("SRC:UPLOAD")) {
            where += "userEntry IN ('SRC:MANUAL','SRC:FIA','SRC:UPLOAD') "; //role diganti jadi where. AND dihapus
        } else if (list.contains("SRC:MANUAL") && list.contains("SRC:FIA")) {
            where += "userEntry IN ('SRC:MANUAL','SRC:FIA') ";
        } else if (list.contains("SRC:FIA") && list.contains("SRC:UPLOAD")) {
            where += "userEntry IN ('SRC:FIA','SRC:UPLOAD') ";
        } else if (list.contains("SRC:MANUAL") && list.contains("SRC:UPLOAD")) {
            where += "userEntry IN ('SRC:MANUAL','SRC:UPLOAD') ";
        } else if (list.contains("SRC:MANUAL")) {
            where += "userEntry IN ('SRC:MANUAL')";
        } else if (list.contains("SRC:FIA")) {
            where += "userEntry IN ('SRC:FIA')";
        } else if (list.contains("SRC:UPLOAD")) {
            where += "userEntry IN ('SRC:UPLOAD')";
        } else {
            where += "userEntry IN ('') ";
        }
//        System.out.println("io_type=" + io_type);
        if (io_type == null || io_type.isEmpty()) {
            where += "";
        } else if (io_type.equalsIgnoreCase("i")) {
            where += "AND io_type='I' ";
        } else if (io_type.equalsIgnoreCase("o")) {
            where += "AND io_type='O' ";
        } else {
            where += "(AND io_type='O' OR io_type='I') ";
        }
        if (flag == null || flag.isEmpty()) {
            where += " AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("MOD")) {
            where += " AND flag='MOD' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("VER")) {
            where += " AND flag='VER' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
//        } else if (flag.equalsIgnoreCase("AUTH")) {
//            where += " AND flag='AUTH' AND CAST(h.tanggal as date) = '" + tanggal_transaksi_sebulan + "'";
//        } else if (flag.equalsIgnoreCase("TEXT")) {
//            where += " AND flag='TEXT' AND CAST(h.tanggal as date) = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("AUTH") || flag.equalsIgnoreCase("TEXT")) {
            where += " AND (flag='AUTH' OR flag='TEXT') AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("ACK")) {
            where += " AND flag='ACK' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-WAIT")) {
            where += " AND flag='INC-WAIT' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-STL")) {
            where += " AND flag='INC-STL' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-RSTL")) {
            where += " AND flag='INC-RSTL' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-INV")) {
            where += " AND flag='INC-INV' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-RTR")) {
            where += " AND flag='INC-RTR' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-OK")) {
            where += " AND flag='INC-OK' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-NOK")) {
            where += " AND flag='INC-NOK' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-HOLD")) {
            where += " AND flag='INC-HOLD' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("NACK")) {
            where += " AND flag='NACK' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("ACK")) {
            where += " AND flag='ACK' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-CNF")) {
            where += " AND flag='INC-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC")) {
            where += " AND flag='INC' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("ERR")) {
            isDuplicate = "3";
            where += " AND flag='MOD' ";
        } else if (flag.equalsIgnoreCase("CVT-MOD")) {
            where += " AND flag='CVT-MOD' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("CVT-VER")) {
            where += " AND flag='CVT-VER' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("WAITING-AML")) {
            where += " AND flag='WAITING-AML' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-CVT")) {
            where += " AND flag='INC-CVT' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC")) {
            where += " AND flag='INC' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("RESEND-CNF")) {
            where += " AND flag='RESEND-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-REJECT-CNF")) {
            where += " AND flag='INC-REJECT-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-AML")) {
            where += " AND flag='INC-AML' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-AML-FAILED")) {
            where += " AND flag='INC-AML-FAILED' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-AML-FAILED-CNF")) {
            where += " AND flag='INC-AML-FAILED-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("SETTLE")) {
            where += " AND flag='SETTLE' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("AML-TERMINATE-IN")) {
            where += " AND flag='AML-TERMINATE-IN' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("AML-TERMINATE-OUT")) {
            where += " AND flag='AML-TERMINATE-OUT' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("UNSETTLE-INC")) {
            where += " AND flag='UNSETTLE-INC' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("INC-RESEND-CNF")) {
            where += " AND flag='INC-RESEND-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("UNSETTLE-OUT")) {
            where += " AND flag='UNSETTLE-OUT' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("WAITING-SAA-CNF")) {
            where += " AND flag='WAITING-SAA-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("AML-FAILED")) {
            where += " AND flag='AML-FAILED' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("AML-FAILED-CNF")) {
            where += " AND flag='AML-FAILED-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("FIA-FAILED")) {
            where += " AND flag='FIA-FAILED' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else if (flag.equalsIgnoreCase("FIA-FAILED-CNF")) {
            where += " AND flag='FIA-FAILED-CNF' AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        } else {
            where += " AND TO_CHAR(tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "'";
        }

        if (channel != null && !channel.isBlank()) {
            where += " AND source LIKE '%" + channel + "%'";
        }

        if (quicksearch != null && !quicksearch.isEmpty()) {
            if (quicksearch.startsWith("ou")) {
                where += " AND (h.io_type = 'I' OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE '%" + quicksearch + "%')";
            } else if (quicksearch.startsWith("in")) {
                where += " AND (h.io_type = 'O' OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE '%" + quicksearch + "%')";
            } else {
                where += " AND CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE '%" + quicksearch + "%'";
            }
        }

        if (criteria.getMtSearch() != null && !criteria.getMtSearch().isEmpty()) {
            where += " AND messageType ILIKE '%" + criteria.getMtSearch() + "%'";
        }
        if (criteria.getIoSearch() != null && !criteria.getIoSearch().isEmpty()) {
            String ioInput = criteria.getIoSearch().trim().toLowerCase();
            if (ioInput.startsWith("ou")) {
                where += " AND h.io_type = 'I'";
            } else if (ioInput.startsWith("in")) {
                where += " AND h.io_type = 'O'";
            }
        }
        if (criteria.getSeqSearch() != null && !criteria.getSeqSearch().isEmpty()) {
            where += " AND sequenceNumber::TEXT ILIKE '%" + criteria.getSeqSearch() + "%'";
        }
        if (criteria.getLogicalSearch() != null && !criteria.getLogicalSearch().isEmpty()) {
            where += " AND logicalTerminal ILIKE '%" + criteria.getLogicalSearch() + "%'";
        }
        if (criteria.getReceiverSearch() != null && !criteria.getReceiverSearch().isEmpty()) {
            where += " AND receiverAddress ILIKE '%" + criteria.getReceiverSearch() + "%'";
        }
        if (criteria.getRefSearch() != null && !criteria.getRefSearch().isEmpty()) {
            where += " AND trans_reference ILIKE '%" + criteria.getRefSearch() + "%'";
        }
        if (criteria.getRelRefSearch() != null && !criteria.getRelRefSearch().isEmpty()) {
            where += " AND trans_related_reference ILIKE '%" + criteria.getRelRefSearch() + "%'";
        }
        if (criteria.getValDateSearch() != null && !criteria.getValDateSearch().isEmpty()) {
            where += " AND trans_date_value::TEXT ILIKE '%" + criteria.getValDateSearch() + "%'";
        }
        if (criteria.getCcySearch() != null && !criteria.getCcySearch().isEmpty()) {
            where += " AND trans_ccy ILIKE '%" + criteria.getCcySearch() + "%'";
        }
        if (criteria.getAmountSearch() != null && !criteria.getAmountSearch().isEmpty()) {
            where += " AND trans_amount::TEXT ILIKE '%" + criteria.getAmountSearch() + "%'";
        }
        if (criteria.getCreatedDateSearch() != null && !criteria.getCreatedDateSearch().isEmpty()) {
            where += " AND tanggal::TEXT ILIKE '%" + criteria.getCreatedDateSearch() + "%'";
        }
        if (criteria.getFlagSearch() != null && !criteria.getFlagSearch().isEmpty()) {
            where += " AND flag ILIKE '%" + criteria.getFlagSearch() + "%'";
        }
        if (criteria.getSourceSearch() != null && !criteria.getSourceSearch().isEmpty()) {
            where += " AND source ILIKE '%" + criteria.getSourceSearch() + "%'";
        }

        int headers = 0;
        String sql = """
                     SELECT count(h.id_headers)
                     FROM headers h LEFT JOIN trx_detail td ON h.id_headers = td.id_headers WHERE isDuplicate='""" + isDuplicate + "' AND (" + where + ") "
                + "--ORDER BY tanggal DESC --LIMIT 100 OFFSET (1 - 1) * 100";

//        LIMIT <jumlahDataPerHalaman> OFFSET (<nomorHalaman> - 1) * <jumlahDataPerHalaman>
//        System.out.println(sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            headers = rs.getInt(1);
        }
        return headers;
    }

    public List<Header> getAllHeaderPajak(HttpSession httpSession, String io_type, String flag) throws Exception {
        String where = "";
        String tag_where = "";
        String role = "";
        Calendar now = Calendar.getInstance();
        // dikomen karena hanya menampilkan trx today
//        now.add(Calendar.MONTH, -1);
        String tanggal_transaksi_sebulan = new SimpleDateFormat("yyyy-MM-dd").format(now.getTime());
        List<String> list = (ArrayList) httpSession.getAttribute("role");
//        TYPE:INCOMING,TYPE:OUTGOING
        if (list.contains("TYPE:INCOMING") && list.contains("TYPE:OUTGOING")) {
            role += "io_type IN ('I','O') AND ";
        } else if (list.contains("TYPE:INCOMING")) {
            role += "io_type IN ('I') AND ";
        } else if (list.contains("TYPE:OUTGOING")) {
            role += "io_type IN ('O') AND ";
        } else {
            role += "io_type IN ('') AND ";
        }
//        SRC:MANUAL,SRC:FIA
        if (list.contains("SRC:MANUAL") && list.contains("SRC:FIA")) {
            role += "userEntry IN ('SRC:MANUAL','SRC:FIA') AND ";
        } else if (list.contains("SRC:MANUAL")) {
            role += "userEntry IN ('SRC:MANUAL') AND ";
        } else if (list.contains("SRC:FIA")) {
            role += "userEntry IN ('SRC:FIA') AND ";
        } else {
            role += "userEntry IN ('') AND ";
        }
//        FLOW:MOD,FLOW:VER,FLOW:AUTH,FLOW:TEXT
//        if (list.contains("SRC:MANUAL") && list.contains("SRC:FIA")) {
//            role += "userEntry IN ('SRC:MANUAL','SRC:FIA') AND ";
//        } else if (list.contains("SRC:MANUAL")) {
//            role += "userEntry IN ('SRC:MANUAL') AND ";
//        } else if (list.contains("SRC:FIA")) {
//            role += "userEntry IN ('SRC:FIA') AND ";
//        } else {
//            role += "userEntry IN ('') AND ";
//        }
//        System.out.println("io_type=" + io_type);
        if (io_type == null || io_type.isEmpty()) {
            where += "io_type='O' OR io_type='I'";
        } else if (io_type.equalsIgnoreCase("i")) {
            where += "io_type='I'";
        } else if (io_type.equalsIgnoreCase("o")) {
            where += "io_type='O'";
        } else {
            where += "io_type='O' OR io_type='I'";
        }
        if (flag == null || flag.isEmpty()) {
            where += "";
        } else if (flag.equalsIgnoreCase("MOD")) {
            where += " AND flag='MOD'";
        } else if (flag.equalsIgnoreCase("VER")) {
            where += " AND flag='VER'";
        } else if (flag.equalsIgnoreCase("AUTH")) {
            where += " AND flag='AUTH'";
        } else if (flag.equalsIgnoreCase("TEXT")) {
            where += " AND flag='TEXT'";
        } else {
            where += "";
        }
//        tags
        tag_where += " AND tag='72' AND detail LIKE '%" + getOf72() + "%'";
        List<Header> headers = new ArrayList<Header>();
        String sql = "SELECT DISTINCT headers.id_headers,messageType,logicalTerminal,sessionNumber,sequenceNumber,io_type,"
                + "receiverAddress,tanggal, headers.id_headers,flag FROM headers,header_status "
                + "WHERE headers.id_headers=header_status.id_headers AND TO_CHAR(headers.tanggal, 'YYYY-MM-DD') = '" + tanggal_transaksi_sebulan + "' AND (" + where + ") "
                + "AND isDuplicate!=1 AND messageType='202' ORDER BY tanggal DESC";
//        System.out.println("sql getAllHeaderPajak=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header header = new Header();
            header.setMessageType(rs.getString(2));
            header.setLogicalTerminal(rs.getString(3).toUpperCase());
            header.setSessionNumber(rs.getString(4));
            header.setSequenceNumber(rs.getString(5));
//            header.setIo_type(rs.getString(5));
            if (rs.getString(6).equalsIgnoreCase("i")) {
                header.setIo_type("OUTGOING");
            } else {
                header.setIo_type("INCOMING");
            }
            header.setReceiverAddress(rs.getString(7).toUpperCase());
            header.setTanggal(rs.getString(8));
            header.setId_headers(rs.getInt(9));
            header.setStatus_header(rs.getString(10));
            header.setTag20(ambilTag20(header.getId_headers(), ""));
            //ditambahkan pada 20160317 by Azan -------
            header.setTag32Amount(ambilTag32AmountHeader(header.getId_headers()));
            header.setTag53(ambilTag53(header.getId_headers()));
            header.setTag57(ambilTag57(header.getId_headers()));
            //------------------------------------------
            header.setFlag(rs.getString(10));
            if (getResultTag(header.getId_headers(), tag_where, "")) {
                headers.add(header);
            }
        }
        return headers;
    }

    public List<Header> getAllHeaderRetur() throws Exception {
        String tag_where = "";
        Date tanggal = new Date();
        SimpleDateFormat dDay = new SimpleDateFormat("yyyy-MM-dd");
        tag_where += " AND tag='72' AND detail LIKE '%/CODTYPTR/190%'";
        List<Header> headers = new ArrayList<Header>();
        String sql = "SELECT DISTINCT headers.id_headers, messageType,logicalTerminal,sessionNumber,sequenceNumber,io_type,"
                + "receiverAddress,tanggal,headers.id_headers,flag FROM headers,header_status "
                + "WHERE headers.id_headers=header_status.id_headers "
                + "AND isDuplicate=0 AND io_type='O' AND messageType='202' AND TO_CHAR(headers.tanggal, 'YYYY-MM-DD') ='" + dDay.format(tanggal) + "' ORDER BY tanggal DESC";
//        System.out.println("sql retur=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header header = new Header();
            header.setMessageType(rs.getString(2));
            header.setLogicalTerminal(rs.getString(3));
            header.setSessionNumber(rs.getString(4));
            header.setSequenceNumber(rs.getString(5));
            header.setIo_type(rs.getString(6));
            header.setReceiverAddress(rs.getString(7));
            header.setTanggal(rs.getString(8));
            header.setId_headers(rs.getInt(1));
            header.setFlag(rs.getString(10));
            header.setTag20(ambilTag20(header.getId_headers(), ""));
            header.setTag21(ambilTag21(header.getId_headers(), ""));
            header.setTag53(ambilTag53(header.getId_headers()));
            header.setTag72(ambilTag72(header.getId_headers()));
            header.setFlag(rs.getString(10));
            if (getResultTag(header.getId_headers(), tag_where, "")) {
                headers.add(header);
            }
        }
        return headers;
    }

    public List<Header> getAllHeaderDuplicate() throws Exception {
        Date tanggal = new Date();
        SimpleDateFormat dDay = new SimpleDateFormat("yyyy-MM-dd");
        List<Header> headers = new ArrayList<Header>();
        String sql = "SELECT DISTINCT h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type,"
                + "h.receiverAddress, h.tanggal, h.flag, td.trans_reference FROM headers h LEFT JOIN trx_detail td ON h.id_headers = td.id_headers "
                + "WHERE TO_CHAR(h.tanggal, 'YYYY-MM-DD') = ? "
                + "AND h.isduplicate=1 ORDER BY tanggal DESC";
//        System.out.println("sql getAllHeaderDuplicate = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, dDay.format(tanggal));
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header header = new Header();
            header.setMessageType(rs.getString(2));
            header.setLogicalTerminal(rs.getString(3).toUpperCase());
            header.setSessionNumber(rs.getString(4));
            header.setSequenceNumber(rs.getString(5));
//            header.setIo_type(rs.getString(5));
            if (rs.getString(6).equalsIgnoreCase("i")) {
                header.setIo_type("OUTGOING");
            } else {
                header.setIo_type("INCOMING");
            }
            header.setReceiverAddress(rs.getString(7).toUpperCase());
            header.setTanggal(rs.getString(8));
            header.setId_headers(rs.getInt(1));
            header.setFlag(rs.getString(9));
            header.setTag20(rs.getString(10));
            headers.add(header);
        }
        return headers;
    }

    public List<Header> getAllHeaderReject() throws Exception {
        Date tanggal = new Date();
        SimpleDateFormat dDay = new SimpleDateFormat("yyyy-MM-dd");
        List<Header> headers = new ArrayList<Header>();
        String sql = "SELECT DISTINCT h.id_headers,h.messageType,h.logicalTerminal,h.sessionNumber,h.sequenceNumber,h.io_type,"
                + "h.receiverAddress,h.tanggal,h.flag,trx.trans_reference "
                + "FROM headers h INNER JOIN header_status hs ON h.id_headers = hs.id_headers LEFT JOIN trx_detail trx ON trx.id_headers = h.id_headers "
                + "WHERE h.isDuplicate = 2 AND hs.status_header = 'REJECT' AND TO_CHAR(h.tanggal, 'YYYY-MM-DD') = ? ORDER BY h.tanggal DESC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, dDay.format(tanggal));
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header header = new Header();
            header.setMessageType(rs.getString(2));
            header.setLogicalTerminal(rs.getString(3).toUpperCase());
            header.setSessionNumber(rs.getString(4));
            header.setSequenceNumber(rs.getString(5));
//            header.setIo_type(rs.getString(5));
            if (rs.getString(6).equalsIgnoreCase("i")) {
                header.setIo_type("OUTGOING");
            } else {
                header.setIo_type("INCOMING");
            }
            header.setReceiverAddress(rs.getString(7).toUpperCase());
            header.setTanggal(rs.getString(8));
            header.setId_headers(rs.getInt(1));
            header.setTag20(rs.getString(10));
            header.setFlag(rs.getString(9));
            headers.add(header);
        }
        return headers;
    }

//    public List<ResultHeader> getResultHeader(HttpSession httpSession, String io_type, String sender_bank, String receiver_bank, String mt_type, String date_from, String date_end, String sender_reference, String rel_reference, String currency_code, String amount, String status, String db_type) throws Exception {
//    public List<Header> getResultHeader(HttpSession httpSession, String io_type, String sender_bank, String receiver_bank, String mt_type, String date_from, String date_end, String sender_reference, String rel_reference, String currency_code, String amount, String status, String db_type, String channel, int start, int length, HeaderSearchCriteria criteria) throws Exception {
//        String where = "";
//        String prefix = "";
//        if (io_type == null || io_type.isEmpty()) {
//            where += " (h.io_type='O' OR h.io_type='I')";
//        } else if (io_type.equalsIgnoreCase("i")) {
//            where += " h.io_type='I'";
//        } else if (io_type.equalsIgnoreCase("o")) {
//            where += " h.io_type='O'";
//        } else {
//            where += " (h.io_type='O' OR h.io_type='I')";
//        }
//        if (sender_bank == null || sender_bank.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND logicalTerminal LIKE '%" + sender_bank + "%'";
//        }
//        if (receiver_bank == null || receiver_bank.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND receiverAddress LIKE '%" + receiver_bank + "%'";
//        }
//        if (mt_type == null || mt_type.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND h.messageType LIKE '%" + mt_type + "%'";
//        }
//        if (date_from == null || date_from.isEmpty() || date_end == null || date_end.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND TO_CHAR(h.tanggal, 'YYYY-MM-DD') BETWEEN '" + date_from + "' AND '" + date_end + "'";
//        }
//        if (status == null || status.isEmpty()) {
//            where += "";
//        } else {
//            //diganti jadi = pd tgl 20151007
//            where += " AND h.flag = '" + status + "'";
//        }
////        tags
//        if (sender_reference == null || sender_reference.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND td.trans_reference LIKE '%" + sender_reference + "%'";
//        }
//        // ditambahkan rel_reference pada 20151102 by Azan
//        if (rel_reference == null || rel_reference.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND td.trans_related_reference LIKE '%" + rel_reference + "%'";
//        }
////        if (sender_bank == null || sender_bank.isEmpty()) {
////            where += "";
////        } else {
////            where += " AND t53.detail LIKE '%" + sender_bank + "%'";
////        }
////        if (receiver_bank == null || receiver_bank.isEmpty()) {
////            where += "";
////        } else {
////            where += " AND t57.detail LIKE '%" + receiver_bank + "%'";
////        }
////        end of tambahan 20151102
//        if (currency_code == null || currency_code.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND td.trans_ccy LIKE '%" + currency_code + "%'";
//        }
//        if (amount == null || amount.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND td.trans_amount::text LIKE '%" + amount + "%'";
//        }
//        if (db_type.equalsIgnoreCase("backup")) {
//            prefix = "a";
//        }
//        
//        if (channel != null && !channel.isBlank()) {
//            where += " AND source LIKE '%" + channel + "%'";
//        }
//        
//         if (criteria.getMtSearch() != null && !criteria.getMtSearch().isEmpty()) {
//            where += " AND messageType ILIKE '%" + criteria.getMtSearch() + "%'";
//        }
//        if (criteria.getIoSearch() != null && !criteria.getIoSearch().isEmpty()) {
//            where += " AND io_type ILIKE '%" + criteria.getIoSearch() + "%'";
//        }
//        if (criteria.getSeqSearch() != null && !criteria.getSeqSearch().isEmpty()) {
//            where += " AND sequenceNumber::TEXT ILIKE '%" + criteria.getSeqSearch() + "%'";
//        }
//        if (criteria.getLogicalSearch() != null && !criteria.getLogicalSearch().isEmpty()) {
//            where += " AND logicalTerminal ILIKE '%" + criteria.getLogicalSearch() + "%'";
//        }
//        if (criteria.getReceiverSearch() != null && !criteria.getReceiverSearch().isEmpty()) {
//            where += " AND receiverAddress ILIKE '%" + criteria.getReceiverSearch() + "%'";
//        }
//        if (criteria.getRefSearch() != null && !criteria.getRefSearch().isEmpty()) {
//            where += " AND trans_reference ILIKE '%" + criteria.getRefSearch() + "%'";
//        }
//        if (criteria.getRelRefSearch() != null && !criteria.getRelRefSearch().isEmpty()) {
//            where += " AND trans_related_reference ILIKE '%" + criteria.getRelRefSearch() + "%'";
//        }
//        if (criteria.getValDateSearch() != null && !criteria.getValDateSearch().isEmpty()) {
//            where += " AND trans_date_value::TEXT ILIKE '%" + criteria.getValDateSearch() + "%'";
//        }
//        if (criteria.getCcySearch() != null && !criteria.getCcySearch().isEmpty()) {
//            where += " AND trans_ccy ILIKE '%" + criteria.getCcySearch() + "%'";
//        }
//        if (criteria.getAmountSearch() != null && !criteria.getAmountSearch().isEmpty()) {
//            where += " AND trans_amount::TEXT ILIKE '%" + criteria.getAmountSearch() + "%'";
//        }
//        if (criteria.getCreatedDateSearch() != null && !criteria.getCreatedDateSearch().isEmpty()) {
//            where += " AND tanggal::TEXT ILIKE '%" + criteria.getCreatedDateSearch() + "%'";
//        }
//        if (criteria.getFlagSearch() != null && !criteria.getFlagSearch().isEmpty()) {
//            where += " AND flag ILIKE '%" + criteria.getFlagSearch() + "%'";
//        }
//        if (criteria.getSourceSearch() != null && !criteria.getSourceSearch().isEmpty()) {
//            where += " AND source ILIKE '%" + criteria.getSourceSearch() + "%'";
//        }
//        
//        
////        List<ResultHeader> datas = new ArrayList<ResultHeader>();
//        List<Header> datas = new ArrayList<Header>();
//        String sql = "SELECT h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type,\n" +
//"                     h.receiverAddress, h.tanggal, h.id_headers, h.flag, h.isDuplicate,\n" +
//"                     h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy\n" +
//"                     FROM headers h LEFT JOIN trx_detail td ON h.id_headers = td.id_headers WHERE (" + where + ") \n"+
//                      " AND h.isDuplicate!=1 ORDER BY h.tanggal DESC OFFSET "+start+" ROWS FETCH NEXT "+length+" ROWS ONLY --LIMIT 100 OFFSET (1 - 1) * 100";
//        PreparedStatement st = this.conn.prepareStatement(sql);
//        ResultSet rs = st.executeQuery();
//        while (rs.next()) {
//            Header data = new Header();
//            data.setMessageType(rs.getString(2));
//            data.setLogicalTerminal(rs.getString(3));
//            data.setReceiverAddress(rs.getString(7));
//            if (rs.getString(6).equalsIgnoreCase("i")) {
//                data.setIo_type("Outgoing");
//            } else {
//                data.setIo_type("Incoming");
//            }
//            data.setTanggal(rs.getString(8));
//            data.setId_headers(rs.getInt(1));
//            data.setFlag(rs.getString(10));
//            data.setTrans_refference(rs.getString(14));
//            data.setTrans_related_refference(rs.getString(15));
//            if (rs.getString(17) == null) {
//                data.setTrans_amount("0");
//            } else {
//                data.setTrans_amount(rs.getString(17).replace(",", "."));
//            }
//            data.setTrans_date_value(rs.getString(16));
//            data.setTrans_ccy(rs.getString(18));
//            data.setBlock3(rs.getString(12));
//            data.setSource(rs.getString("source"));
//            data.setSequenceNumber(rs.getString("sequenceNumber"));
//            datas.add(data);
//        }
//        return datas;
//    }
    public List<Header> getResultHeader(
            HttpSession httpSession,
            String io_type,
            String sender_bank,
            String receiver_bank,
            String mt_type,
            String date_from,
            String date_end,
            String sender_reference,
            String rel_reference,
            String currency_code,
            String amount,
            String status,
            String db_type,
            String channel,
            int start,
            int length,
            HeaderSearchCriteria criteria,
            String quicksearch,
            String sort
    ) throws Exception {
        List<Header> datas = new ArrayList<>();
        List<Object> parameters = new ArrayList<>();

        StringBuilder where = new StringBuilder("h.isDuplicate != 1");

        // io_type
        if (io_type == null || io_type.isEmpty()) {
            where.append(" AND (h.io_type='O' OR h.io_type='I')");
        } else if (io_type.equalsIgnoreCase("i")) {
            where.append(" AND h.io_type = ?");
            parameters.add("I");
        } else if (io_type.equalsIgnoreCase("o")) {
            where.append(" AND h.io_type = ?");
            parameters.add("O");
        } else {
            where.append(" AND (h.io_type='O' OR h.io_type='I')");
        }

        if (sender_bank != null && !sender_bank.isEmpty()) {
            where.append(" AND h.logicalTerminal ILIKE ?");
            parameters.add("%" + sender_bank + "%");
        }
        if (receiver_bank != null && !receiver_bank.isEmpty()) {
            where.append(" AND h.receiverAddress ILIKE ?");
            parameters.add("%" + receiver_bank + "%");
        }
        if (mt_type != null && !mt_type.isEmpty()) {
            where.append(" AND h.messageType ILIKE ?");
            parameters.add("%" + mt_type + "%");
        }
        if (date_from != null && !date_from.isEmpty() && date_end != null && !date_end.isEmpty()) {
            where.append(" AND TO_CHAR(h.tanggal, 'YYYY-MM-DD') BETWEEN ? AND ?");
            parameters.add(date_from);
            parameters.add(date_end);
        }
        if (status != null && !status.isEmpty()) {
            where.append(" AND h.flag = ?");
            parameters.add(status);
        }
        if (sender_reference != null && !sender_reference.isEmpty()) {
            where.append(" AND td.trans_reference ILIKE ?");
            parameters.add("%" + sender_reference + "%");
        }
        if (rel_reference != null && !rel_reference.isEmpty()) {
            where.append(" AND td.trans_related_reference ILIKE ?");
            parameters.add("%" + rel_reference + "%");
        }
        if (currency_code != null && !currency_code.isEmpty()) {
            where.append(" AND td.trans_ccy ILIKE ?");
            parameters.add("%" + currency_code + "%");
        }
        if (amount != null && !amount.isEmpty()) {
            where.append(" AND td.trans_amount::TEXT ILIKE ?");
            parameters.add("%" + amount + "%");
        }
        if (channel != null && !channel.isBlank()) {
            where.append(" AND h.source ILIKE ?");
            parameters.add("%" + channel + "%");
        }

        if (quicksearch != null && !quicksearch.isEmpty()) {
            if (quicksearch.startsWith("ou")) {
                where.append(" AND (h.io_type = ? OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?)");
                parameters.add("I");
                parameters.add("%" + quicksearch + "%");
            } else if (quicksearch.startsWith("in")) {
                where.append(" AND (h.io_type = ? OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?)");
                parameters.add("O");
                parameters.add("%" + quicksearch + "%");
            } else {
                where.append(" AND CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?");
                parameters.add("%" + quicksearch + "%");
            }
        }

        // Dynamic filters dari criteria
        if (criteria != null) {
            if (criteria.getMtSearch() != null && !criteria.getMtSearch().isEmpty()) {
                where.append(" AND h.messageType ILIKE ?");
                parameters.add("%" + criteria.getMtSearch() + "%");
            }
            if (criteria.getIoSearch() != null && !criteria.getIoSearch().isEmpty()) {
//            where.append(" AND h.io_type ILIKE ?");
                where.append(" AND h.io_type = ?");
                String ioInput = criteria.getIoSearch().trim().toLowerCase();
//            if ("incoming".contains(ioInput)) {
                if (ioInput.startsWith("ou")) {
                    parameters.add("I");
//            } else if ("outgoing".contains(ioInput)) {
                } else if (ioInput.startsWith("in")) {
                    parameters.add("O");
                }
//                parameters.add("%" + criteria.getIoSearch() + "%");
            }
            if (criteria.getSeqSearch() != null && !criteria.getSeqSearch().isEmpty()) {
                where.append(" AND h.sequenceNumber::TEXT ILIKE ?");
                parameters.add("%" + criteria.getSeqSearch() + "%");
            }
            if (criteria.getLogicalSearch() != null && !criteria.getLogicalSearch().isEmpty()) {
                where.append(" AND h.logicalTerminal ILIKE ?");
                parameters.add("%" + criteria.getLogicalSearch() + "%");
            }
            if (criteria.getReceiverSearch() != null && !criteria.getReceiverSearch().isEmpty()) {
                where.append(" AND h.receiverAddress ILIKE ?");
                parameters.add("%" + criteria.getReceiverSearch() + "%");
            }
            if (criteria.getRefSearch() != null && !criteria.getRefSearch().isEmpty()) {
                where.append(" AND td.trans_reference ILIKE ?");
                parameters.add("%" + criteria.getRefSearch() + "%");
            }
            if (criteria.getRelRefSearch() != null && !criteria.getRelRefSearch().isEmpty()) {
                where.append(" AND td.trans_related_reference ILIKE ?");
                parameters.add("%" + criteria.getRelRefSearch() + "%");
            }
            if (criteria.getValDateSearch() != null && !criteria.getValDateSearch().isEmpty()) {
                where.append(" AND td.trans_date_value::TEXT ILIKE ?");
                parameters.add("%" + criteria.getValDateSearch() + "%");
            }
            if (criteria.getCcySearch() != null && !criteria.getCcySearch().isEmpty()) {
                where.append(" AND td.trans_ccy ILIKE ?");
                parameters.add("%" + criteria.getCcySearch() + "%");
            }
            if (criteria.getAmountSearch() != null && !criteria.getAmountSearch().isEmpty()) {
                where.append(" AND td.trans_amount::TEXT ILIKE ?");
                parameters.add("%" + criteria.getAmountSearch() + "%");
            }
            if (criteria.getCreatedDateSearch() != null && !criteria.getCreatedDateSearch().isEmpty()) {
                where.append(" AND h.tanggal::TEXT ILIKE ?");
                parameters.add("%" + criteria.getCreatedDateSearch() + "%");
            }
            if (criteria.getFlagSearch() != null && !criteria.getFlagSearch().isEmpty()) {
                where.append(" AND h.flag ILIKE ?");
                parameters.add("%" + criteria.getFlagSearch() + "%");
            }
            if (criteria.getSourceSearch() != null && !criteria.getSourceSearch().isEmpty()) {
                where.append(" AND h.source ILIKE ?");
                parameters.add("%" + criteria.getSourceSearch() + "%");
            }
        }

        // Final query
        String sql = "SELECT h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, "
                + "h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, "
                + "td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy "
                + "FROM headers h LEFT JOIN trx_detail td ON h.id_headers = td.id_headers "
                + "WHERE " + where + " ORDER BY "+sort+" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            int idx = 1;
            for (Object param : parameters) {
                st.setObject(idx++, param);
            }
            st.setInt(idx++, start);
            st.setInt(idx, length);

            String rawSql = sql;
            for (Object param : parameters) {
                rawSql = rawSql.replaceFirst("\\?", "'" + String.valueOf(param).replace("'", "''") + "'");
            }
            rawSql = rawSql.replaceFirst("\\?", String.valueOf(start));
            rawSql = rawSql.replaceFirst("\\?", String.valueOf(length));
//        System.out.println("Expanded SQL:\n" + rawSql); //cetak hasil query

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Header data = new Header();
                    data.setId_headers(rs.getInt("id_headers"));
                    data.setMessageType(rs.getString("messageType"));
                    data.setLogicalTerminal(rs.getString("logicalTerminal"));
                    data.setSessionNumber(rs.getString("sessionNumber"));
                    data.setSequenceNumber(rs.getString("sequenceNumber"));
                    data.setIo_type("I".equalsIgnoreCase(rs.getString("io_type")) ? "OUTGOING" : "INCOMING");
                    data.setReceiverAddress(rs.getString("receiverAddress"));
                    data.setTanggal(rs.getString("tanggal"));
                    data.setFlag(rs.getString("flag"));
                    data.setBlock3(rs.getString("block3"));
                    data.setSource(rs.getString("source"));
                    data.setTrans_refference(rs.getString("trans_reference"));
                    data.setTrans_related_refference(rs.getString("trans_related_reference"));
                    data.setTrans_date_value(rs.getString("trans_date_value"));
                    String amt = rs.getString("trans_amount");
                    data.setTrans_amount((amt == null) ? "0" : amt.replace(",", "."));
                    data.setTrans_ccy(rs.getString("trans_ccy"));
                    datas.add(data);
                }
            }
        }

        return datas;
    }

//    public int getCountResultHeader(HttpSession httpSession, String io_type, String sender_bank, String receiver_bank, String mt_type, String date_from, String date_end, String sender_reference, String rel_reference, String currency_code, String amount, String status, String db_type, String channel, HeaderSearchCriteria criteria) throws Exception {
//        String where = "";
//        String prefix = "";
//        if (io_type == null || io_type.isEmpty()) {
//            where += " (h.io_type='O' OR h.io_type='I')";
//        } else if (io_type.equalsIgnoreCase("i")) {
//            where += " h.io_type='I'";
//        } else if (io_type.equalsIgnoreCase("o")) {
//            where += " h.io_type='O'";
//        } else {
//            where += " (h.io_type='O' OR h.io_type='I')";
//        }
//        if (sender_bank == null || sender_bank.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND logicalTerminal LIKE '%" + sender_bank + "%'";
//        }
//        if (receiver_bank == null || receiver_bank.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND receiverAddress LIKE '%" + receiver_bank + "%'";
//        }
//        if (mt_type == null || mt_type.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND h.messageType LIKE '%" + mt_type + "%'";
//        }
//        if (date_from == null || date_from.isEmpty() || date_end == null || date_end.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND TO_CHAR(h.tanggal, 'YYYY-MM-DD') BETWEEN '" + date_from + "' AND '" + date_end + "'";
//        }
//        if (status == null || status.isEmpty()) {
//            where += "";
//        } else {
//            //diganti jadi = pd tgl 20151007
//            where += " AND h.flag = '" + status + "'";
//        }
////        tags
//        if (sender_reference == null || sender_reference.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND td.trans_reference LIKE '%" + sender_reference + "%'";
//        }
//        // ditambahkan rel_reference pada 20151102 by Azan
//        if (rel_reference == null || rel_reference.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND td.trans_related_reference LIKE '%" + rel_reference + "%'";
//        }
////        if (sender_bank == null || sender_bank.isEmpty()) {
////            where += "";
////        } else {
////            where += " AND t53.detail LIKE '%" + sender_bank + "%'";
////        }
////        if (receiver_bank == null || receiver_bank.isEmpty()) {
////            where += "";
////        } else {
////            where += " AND t57.detail LIKE '%" + receiver_bank + "%'";
////        }
////        end of tambahan 20151102
//        if (currency_code == null || currency_code.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND td.trans_ccy LIKE '%" + currency_code + "%'";
//        }
//        if (amount == null || amount.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND td.trans_amount::text LIKE '%" + amount + "%'";
//        }
//        if (db_type.equalsIgnoreCase("backup")) {
//            prefix = "a";
//        }
//        
//        if (channel != null && !channel.isBlank()) {
//            where += " AND source LIKE '%" + channel + "%'";
//        }
//        
//         if (criteria.getMtSearch() != null && !criteria.getMtSearch().isEmpty()) {
//            where += " AND messageType ILIKE '%" + criteria.getMtSearch() + "%'";
//        }
//        if (criteria.getIoSearch() != null && !criteria.getIoSearch().isEmpty()) {
//            where += " AND io_type ILIKE '%" + criteria.getIoSearch() + "%'";
//        }
//        if (criteria.getSeqSearch() != null && !criteria.getSeqSearch().isEmpty()) {
//            where += " AND sequenceNumber::TEXT ILIKE '%" + criteria.getSeqSearch() + "%'";
//        }
//        if (criteria.getLogicalSearch() != null && !criteria.getLogicalSearch().isEmpty()) {
//            where += " AND logicalTerminal ILIKE '%" + criteria.getLogicalSearch() + "%'";
//        }
//        if (criteria.getReceiverSearch() != null && !criteria.getReceiverSearch().isEmpty()) {
//            where += " AND receiverAddress ILIKE '%" + criteria.getReceiverSearch() + "%'";
//        }
//        if (criteria.getRefSearch() != null && !criteria.getRefSearch().isEmpty()) {
//            where += " AND trans_reference ILIKE '%" + criteria.getRefSearch() + "%'";
//        }
//        if (criteria.getRelRefSearch() != null && !criteria.getRelRefSearch().isEmpty()) {
//            where += " AND trans_related_reference ILIKE '%" + criteria.getRelRefSearch() + "%'";
//        }
//        if (criteria.getValDateSearch() != null && !criteria.getValDateSearch().isEmpty()) {
//            where += " AND trans_date_value::TEXT ILIKE '%" + criteria.getValDateSearch() + "%'";
//        }
//        if (criteria.getCcySearch() != null && !criteria.getCcySearch().isEmpty()) {
//            where += " AND trans_ccy ILIKE '%" + criteria.getCcySearch() + "%'";
//        }
//        if (criteria.getAmountSearch() != null && !criteria.getAmountSearch().isEmpty()) {
//            where += " AND trans_amount::TEXT ILIKE '%" + criteria.getAmountSearch() + "%'";
//        }
//        if (criteria.getCreatedDateSearch() != null && !criteria.getCreatedDateSearch().isEmpty()) {
//            where += " AND tanggal::TEXT ILIKE '%" + criteria.getCreatedDateSearch() + "%'";
//        }
//        if (criteria.getFlagSearch() != null && !criteria.getFlagSearch().isEmpty()) {
//            where += " AND flag ILIKE '%" + criteria.getFlagSearch() + "%'";
//        }
//        if (criteria.getSourceSearch() != null && !criteria.getSourceSearch().isEmpty()) {
//            where += " AND source ILIKE '%" + criteria.getSourceSearch() + "%'";
//        }
//        
////        List<ResultHeader> datas = new ArrayList<ResultHeader>();
//        List<Header> datas = new ArrayList<Header>();
//        String sql = "SELECT count(h.id_headers) \n" +
//"                     FROM headers h LEFT JOIN trx_detail td ON h.id_headers = td.id_headers WHERE (" + where + ") AND h.isDuplicate!=1";
//        
////        System.out.pritln("");
//        PreparedStatement st = this.conn.prepareStatement(sql);
//        ResultSet rs = st.executeQuery();
//        int headers = 0;
//        while (rs.next()) {
//           headers = rs.getInt(1);
//        }
//        return headers;
//    }
    public int getCountResultHeader(HttpSession httpSession, String io_type, String sender_bank, String receiver_bank, String mt_type, String date_from, String date_end, String sender_reference, String rel_reference, String currency_code, String amount, String status, String db_type, String channel, HeaderSearchCriteria criteria, String quicksearch) throws Exception {
        StringBuilder where = new StringBuilder("WHERE 1=1");
        List<Object> parameters = new ArrayList<>();

        if (io_type == null || io_type.isEmpty()) {
            where.append(" AND (h.io_type='O' OR h.io_type='I')");
        } else if (io_type.equalsIgnoreCase("i")) {
            where.append(" AND h.io_type=?");
            parameters.add("I");
        } else if (io_type.equalsIgnoreCase("o")) {
            where.append(" AND h.io_type=?");
            parameters.add("O");
        }

        if (sender_bank != null && !sender_bank.isEmpty()) {
            where.append(" AND logicalTerminal LIKE ?");
            parameters.add("%" + sender_bank + "%");
        }

        if (receiver_bank != null && !receiver_bank.isEmpty()) {
            where.append(" AND receiverAddress LIKE ?");
            parameters.add("%" + receiver_bank + "%");
        }

        if (mt_type != null && !mt_type.isEmpty()) {
            where.append(" AND h.messageType LIKE ?");
            parameters.add("%" + mt_type + "%");
        }

        if (date_from != null && !date_from.isEmpty() && date_end != null && !date_end.isEmpty()) {
            where.append(" AND TO_CHAR(h.tanggal, 'YYYY-MM-DD') BETWEEN ? AND ?");
            parameters.add(date_from);
            parameters.add(date_end);
        }

        if (status != null && !status.isEmpty()) {
            where.append(" AND h.flag = ?");
            parameters.add(status);
        }

        if (sender_reference != null && !sender_reference.isEmpty()) {
            where.append(" AND td.trans_reference LIKE ?");
            parameters.add("%" + sender_reference + "%");
        }

        if (rel_reference != null && !rel_reference.isEmpty()) {
            where.append(" AND td.trans_related_reference LIKE ?");
            parameters.add("%" + rel_reference + "%");
        }

        if (currency_code != null && !currency_code.isEmpty()) {
            where.append(" AND td.trans_ccy LIKE ?");
            parameters.add("%" + currency_code + "%");
        }

        if (amount != null && !amount.isEmpty()) {
            where.append(" AND td.trans_amount::text LIKE ?");
            parameters.add("%" + amount + "%");
        }

        if (channel != null && !channel.isBlank()) {
            where.append(" AND source LIKE ?");
            parameters.add("%" + channel + "%");
        }

        if (quicksearch != null && !quicksearch.isEmpty()) {
            if (quicksearch.startsWith("ou")) {
                where.append(" AND (h.io_type = ? OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?)");
                parameters.add("I");
                parameters.add("%" + quicksearch + "%");
            } else if (quicksearch.startsWith("in")) {
                where.append(" AND (h.io_type = ? OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?)");
                parameters.add("O");
                parameters.add("%" + quicksearch + "%");
            } else {
                where.append(" AND CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?");
                parameters.add("%" + quicksearch + "%");
            }
        }

        // From HeaderSearchCriteria (Datatables column search)
        if (criteria.getMtSearch() != null && !criteria.getMtSearch().isEmpty()) {
            where.append(" AND messageType ILIKE ?");
            parameters.add("%" + criteria.getMtSearch() + "%");
        }
        if (criteria.getIoSearch() != null && !criteria.getIoSearch().isEmpty()) {
//            where.append(" AND h.io_type ILIKE ?");
            where.append(" AND h.io_type = ?");
            String ioInput = criteria.getIoSearch().trim().toLowerCase();
//            if ("incoming".contains(ioInput)) {
            if (ioInput.startsWith("o")) {
                parameters.add("I");
//            } else if ("outgoing".contains(ioInput)) {
            } else if (ioInput.startsWith("i")) {
                parameters.add("O");
            }
//                parameters.add("%" + criteria.getIoSearch() + "%");
        }
        if (criteria.getSeqSearch() != null && !criteria.getSeqSearch().isEmpty()) {
            where.append(" AND sequenceNumber::TEXT ILIKE ?");
            parameters.add("%" + criteria.getSeqSearch() + "%");
        }
        if (criteria.getLogicalSearch() != null && !criteria.getLogicalSearch().isEmpty()) {
            where.append(" AND logicalTerminal ILIKE ?");
            parameters.add("%" + criteria.getLogicalSearch() + "%");
        }
        if (criteria.getReceiverSearch() != null && !criteria.getReceiverSearch().isEmpty()) {
            where.append(" AND receiverAddress ILIKE ?");
            parameters.add("%" + criteria.getReceiverSearch() + "%");
        }
        if (criteria.getRefSearch() != null && !criteria.getRefSearch().isEmpty()) {
            where.append(" AND trans_reference ILIKE ?");
            parameters.add("%" + criteria.getRefSearch() + "%");
        }
        if (criteria.getRelRefSearch() != null && !criteria.getRelRefSearch().isEmpty()) {
            where.append(" AND trans_related_reference ILIKE ?");
            parameters.add("%" + criteria.getRelRefSearch() + "%");
        }
        if (criteria.getValDateSearch() != null && !criteria.getValDateSearch().isEmpty()) {
            where.append(" AND trans_date_value::TEXT ILIKE ?");
            parameters.add("%" + criteria.getValDateSearch() + "%");
        }
        if (criteria.getCcySearch() != null && !criteria.getCcySearch().isEmpty()) {
            where.append(" AND trans_ccy ILIKE ?");
            parameters.add("%" + criteria.getCcySearch() + "%");
        }
        if (criteria.getAmountSearch() != null && !criteria.getAmountSearch().isEmpty()) {
            where.append(" AND trans_amount::TEXT ILIKE ?");
            parameters.add("%" + criteria.getAmountSearch() + "%");
        }
        if (criteria.getCreatedDateSearch() != null && !criteria.getCreatedDateSearch().isEmpty()) {
            where.append(" AND tanggal::TEXT ILIKE ?");
            parameters.add("%" + criteria.getCreatedDateSearch() + "%");
        }
        if (criteria.getFlagSearch() != null && !criteria.getFlagSearch().isEmpty()) {
            where.append(" AND flag ILIKE ?");
            parameters.add("%" + criteria.getFlagSearch() + "%");
        }
        if (criteria.getSourceSearch() != null && !criteria.getSourceSearch().isEmpty()) {
            where.append(" AND source ILIKE ?");
            parameters.add("%" + criteria.getSourceSearch() + "%");
        }

        String sql = "SELECT count(h.id_headers) FROM headers h LEFT JOIN trx_detail td ON h.id_headers = td.id_headers "
                + where.toString() + " AND h.isDuplicate!=1";

        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            for (int i = 0; i < parameters.size(); i++) {
                st.setObject(i + 1, parameters.get(i));
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }

        return 0;
    }

    public boolean getResultTag(int headerId, String tag_where, String prefix) throws Exception {
        boolean hasil = false;
        String sql = "SELECT tag,detail FROM " + prefix + "tags WHERE id_headers=" + headerId + tag_where;
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            setTag(rs.getString(1));
            setDetail(rs.getString(2));
            hasil = true;
        }
//        System.out.println("hasil=" + hasil);
        return hasil;
    }

    public Header getHeaderById(String headerId, String prefix) throws SQLException {
        Header header = new Header();
        String sql = "SELECT DISTINCT \n"
                + "    logicalTerminal, \n"
                + "    messageType, \n"
                + "    receiverAddress, \n"
                + "    messagePriority, \n"
                + "    deliveryMonitoring, \n"
                + "    bankingPriority, \n"
                + "    mur, \n"
                + "    komentar, \n"
                + "    block3, \n"
                + "    flag, \n"
                + "    io_type, \n"
                + "    branch, \n"
                + "    isduplicate, \n"
                + "    COALESCE(t32c.detail, json_tag->'fiToFICstmrCdtTrf'->'cdtTrfTxInf'->0->'intrBkSttlmAmt'->>'ccy') AS curr,\n"
                + "    COALESCE(networkType, 'MT') as networkType\n"
                + "FROM \n"
                + "    headers h\n"
                + "LEFT JOIN \n"
                + "    tags_mx tm ON tm.id_headers = h.id_headers\n"
                + "LEFT JOIN \n"
                + "    tags t32c ON t32c.id_headers = h.id_headers \n"
                + "    AND t32c.tagName LIKE '%mf32a_currency%'\n"
                + "WHERE h.id_headers='" + headerId + "'";

//                "SELECT DISTINCT logicalTerminal, messageType, receiverAddress, messagePriority, deliveryMonitoring, bankingPriority, mur, komentar, block3, flag, io_type, special_rate, multi_currency, multi_amount, cust_curr, branch, t32c.detail as curr, special_rate_multi\n"
//                + "FROM headers " + prefix + " h\n"
//                + "left join tags t32c ON t32c.id_headers = h.id_headers AND (t32c.tagName like '%mf32a_currency%')\n"
//                + "WHERE h.id_headers='" + headerId + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            if (rs.getString(11).equalsIgnoreCase("O")) { //20200106
                header.setLogicalTerminal(rs.getString(3));
                header.setReceiverAddress(rs.getString(1));
            } else {
                header.setLogicalTerminal(rs.getString(1));
                header.setReceiverAddress(rs.getString(3));
            }
            header.setMessageType(rs.getString(2).trim());
            header.setMessagePriority(rs.getString(4));
            header.setDeliveryMonitoring(rs.getString(5));
            header.setBankingPriority(rs.getString(6));
            header.setMur(rs.getString(7));
            header.setKomentar(rs.getString(8));
            header.setBlock3(rs.getString(9));
            header.setFlag(rs.getString(10));
            header.setIo_type(rs.getString(11));
            header.setBranch(rs.getString(12));
            header.setTag32Currency(rs.getString(13));
            header.setNetworktype(rs.getString("networktype"));
            header.setIsDuplicate(rs.getString("isduplicate"));
        }
        return header;
    }

    public Header getHeaderById2(String headerId) throws SQLException {
        Header header = new Header();
        String sql = "SELECT logicalTerminal,messageType,receiverAddress,messagePriority,"
                + "deliveryMonitoring,bankingPriority,mur,komentar,block3,flag,io_type FROM headers WHERE id_headers='" + headerId + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            if (rs.getString(11).equalsIgnoreCase("O")) {
                header.setReceiverAddress(rs.getString(3).substring(0, 8));
                header.setLogicalTerminal(rs.getString(1).substring(0, 8));
            } else {
                header.setLogicalTerminal(rs.getString(1).substring(0, 8));
                header.setReceiverAddress(rs.getString(3).substring(0, 8));
            }
            header.setMessageType(rs.getString(2));
            header.setMessagePriority(rs.getString(4));
            header.setDeliveryMonitoring(rs.getString(5));
            header.setBankingPriority(rs.getString(6));
            header.setMur(rs.getString(7));
            header.setKomentar(rs.getString(8));
            header.setBlock3(rs.getString(9));
            header.setFlag(rs.getString(10));
            header.setIo_type(rs.getString(11));
        }
        return header;
    }

    public Collection<TagDB> getAllTagByIdReportMTDoc(String id) throws Exception {
        Collection<TagDB> tags = new ArrayList<TagDB>();
        String sql = "SELECT urutan,tag,detail,tagName,info FROM tags WHERE id_headers='" + id + "' ORDER BY urutan";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            TagDB tag = new TagDB();
            tag.setUrutan(rs.getInt(1));
            tag.setTag(rs.getString(2));
            tag.setDetail(rs.getString(3));
            tag.setTagName(parseDataTagName(rs.getString(4)));
            tag.setInfo(rs.getString(5).toUpperCase());
            tags.add(tag);
        }
        return tags;
    }

    public String parseDataTagName(String str) {
        StringTokenizer st = new StringTokenizer(str, "_");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        StringBuffer sb = new StringBuffer();
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
//            System.out.println(i + " = data = " + arr[i]);
            i++;
        }
        sb.append(arr[1].substring(2) + " ");
        if (i > 1) {
            for (int j = 2; j < arr.length; j++) {
                sb.append(arr[j] + " ");
            }
        }
        return sb.toString().toUpperCase();
    }

    public List<TagDB> getAllTagById(String headerId, String prefix) throws Exception {
        List<TagDB> tags = new ArrayList<TagDB>();
        String sql = "SELECT urutan,tag,detail,tagName,info FROM " + prefix + "tags WHERE id_headers='" + headerId + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            TagDB tag = new TagDB();
            tag.setUrutan(rs.getInt(1));
            tag.setTag(rs.getString(2));
            if (tag.getTag().equals("61")) {
                tag.setDetail(rs.getString(3) + "\n");
            } else {
                tag.setDetail(rs.getString(3));
            }
            tag.setTagName(rs.getString(4));
            tag.setInfo(rs.getString(5));
            tags.add(tag);
        }
        return tags;
    }

    // ditambahkan pada 20191230 untuk mengetahui nama logical terminal dan receiverinsr
    public String getLTRI(String headerId) throws Exception {
        String result = "";
        String sql = "select logicalTerminal, COALESCE(lt.company, '') as ltAddress, receiverAddress, concat(ri.company, ' ' , ri.address), io_type\n"
                + "from headers \n"
                + "LEFT JOIN bic lt ON lt.code_member = logicalTerminal\n"
                + "LEFT JOIN bic ri ON ri.code_member = receiverAddress\n"
                + "where id_headers=" + headerId;
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            result = rs.getString(1) + "#" + rs.getString(2) + "#" + rs.getString(3) + "#" + rs.getString(4) + "#" + rs.getString(5); //20200106
        }
        return result;
    }

    // ditambahkan pada 20180326 untuk mengetahui nama dari BANK
    public String getSenderBank(String headerId) throws Exception {
        String result = "";
//        String sql = "DECLARE @bic Varchar(11) "
//                + "SET @bic = (select detail from tags where tag='53a' and tagName='_121_of53a_identifier_code' and id_headers='" + headerId + "') "
//                + "select * from bic where code_member like '%' +@bic+ '%'";
        String sql = "select * from bic where code_member = select detail from tags where tag='53a' and tagName='_121_of53a_identifier_code' and id_headers='" + headerId + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            result = (rs.getString(3));
        }
        return result;
    }

    // ditambahkan pada 20180326 untuk mengetahui nama dari BANK
    public String getRecBank(String headerId) throws Exception {
        String result = "";
        String city = "";
        String tag57 = getTag57(headerId);
        if (tag57.length() < 9) {
            city = "XXX";
        }
        String sql = "select code_member, company, address from bic where code_member = concat((select detail from tags where tag='57a' and tagName='_171_of57a_identifier_code' and id_headers ='" + headerId + "'), '" + city + "')";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            result = rs.getString(2) + " " + rs.getString(3);
        }
        return result;
    }

    public String getTag57(String headerId) throws Exception {
        String result = "";
        String sql = "select detail from tags where tag='57a' and tagName='_171_of57a_identifier_code' and id_headers ='" + headerId + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            result = (rs.getString(1));
        }
        return result;
    }

    public List<HeaderStatus> getAllHeaderStatus(String headerId, String prefix) throws Exception {
        List<HeaderStatus> header_status = new ArrayList<HeaderStatus>();
        String sql = "SELECT status_header,status_tanggal,user_login,ip_access,comp_name FROM " + prefix + "header_status WHERE id_headers=" + headerId + " ORDER BY status_tanggal DESC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            HeaderStatus dt = new HeaderStatus();
            dt.setStatus_header(rs.getString(1));
            dt.setStatus_tanggal(rs.getTimestamp(2));
            dt.setUser_login(rs.getString(3));
            dt.setIp_access(rs.getString(4));
            dt.setComp_name(rs.getString(5));
            header_status.add(dt);
        }
        return header_status;
    }

    public String ambilTag20(int headerId, String prefix) throws SQLException {
        String data = "";
        String sql = "SELECT detail FROM " + prefix + "tags WHERE id_headers=" + headerId + " AND tag='20'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data = rs.getString(1);
        }
        System.out.println("data=" + data);
        return data.toUpperCase();
    }

    public String ambilTag70(int headerId) throws SQLException {
        String data = "";
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tag='70'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data = rs.getString(1);
        }
        return data.toUpperCase();
    }

    public String ambilTag21(int headerId, String prefix) throws SQLException {
        String data = "";
        String sql = "SELECT detail FROM " + prefix + "tags WHERE id_headers=" + headerId + " AND tag='21'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data = rs.getString(1);
        }
//        System.out.println("data=" + data);
        return data.toUpperCase();
    }

    public String ambilTag32Amount(int headerId, String prefix) throws SQLException {
        StringBuffer data = new StringBuffer();
        String sql = "SELECT detail FROM " + prefix + "tags WHERE id_headers=" + headerId + " AND tag='32a' ORDER BY urutan ASC";
//        System.out.println("sql ambilTag32Amount =" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.append(rs.getString(1) + " # ");
        }
//        System.out.println("data=" + data);
        return data.toString();
    }

    // ditambahkan pada 20150929
    public String ambilTag32AmountHeader(int headerId) throws SQLException {
        String data = "";
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

        formatRp.setCurrencySymbol("");
        formatRp.setMonetaryDecimalSeparator(',');
        formatRp.setGroupingSeparator('.');

        kursIndonesia.setDecimalFormatSymbols(formatRp);
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND (tagName like '%32a_amount' or tagName like '%32b_amount')";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data = rs.getString(1);
            data = kursIndonesia.format(Double.parseDouble(data.replace(",", ".")));
        }

//        System.out.println("data=" + data);
        return data;
    }

    // ditambahkan pada 20150929
    public String ambilTag53(int headerId) throws SQLException {
        String data = "";
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tagName='_121_of53a_identifier_code'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data = rs.getString(1);
        }
//        System.out.println("data=" + data);
        return data.toUpperCase();
    }

    public String ambilTagSenRec(int headerId, String tag) throws SQLException {
        String data = "";
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tagName like '%of" + tag + "a_identifier_code'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data = rs.getString(1);
        }
//        System.out.println("data=" + data);
        return data.toUpperCase();
    }

    // ditambahkan pada 20150929
    public String ambilTag57(int headerId) throws SQLException {
        String data = "";
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tagName='_171_of57a_identifier_code'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data = rs.getString(1);
        }
//        System.out.println("data=" + data);
        return data.toUpperCase();
    }

    // ditambahkan pada 20150929
    public String ambilTag58(int headerId) throws SQLException {
        String data = "";
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tagName='_181_of58a_identifier_code'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data = rs.getString(1);
        }
//        System.out.println("data=" + data);
        return data.toUpperCase();
    }

//    amount only
    public String ambilTag32AmountOnly(int headerId) throws SQLException {
        StringBuffer data = new StringBuffer();
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tagName like '%mf32a_amount' ORDER BY urutan ASC";
//        System.out.println("sql ambilTag32AmountOnly =" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.append(rs.getString(1));
        }
//        System.out.println("data=" + data);
        return data.toString();
    }

//    sender
    public String ambilTag53a_identifier_code(int headerId) throws SQLException {
        StringBuffer data = new StringBuffer();
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tagName like '%of53a_identifier_code' ORDER BY urutan ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.append(rs.getString(1));
        }
//        System.out.println("data=" + data);
        return data.toString();
    }

    public String ambilTag50k_name_address(int headerId) throws SQLException {
        StringBuffer data = new StringBuffer();
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tagName like '%mf50k_name_address' ORDER BY urutan ASC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.append(rs.getString(1));
        }
//        System.out.println("data=" + data);
        return data.toString();
    }

//    receiver
    public String ambilTag57a_identifier_code(int headerId) throws SQLException {
        StringBuffer data = new StringBuffer();
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tagName like '%of57a_identifier_code' ORDER BY urutan ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.append(rs.getString(1));
        }
//        System.out.println("data=" + data);
        return data.toString();
    }

    public String ambilTag59_name_address(int headerId) throws SQLException {
        StringBuffer data = new StringBuffer();
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tagName like '%mf59_name_address' ORDER BY urutan ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.append(rs.getString(1));
        }
//        System.out.println("data=" + data);
        return data.toString();
    }

    public String ambilTag50(int headerId) throws SQLException {
        StringBuffer data = new StringBuffer();
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tag='50k' ORDER BY urutan ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.append(rs.getString(1).replace("\n", " ") + " # ");
        }
        return data.toString();
    }

    public String ambilTag59(int headerId) throws SQLException {
        StringBuffer data = new StringBuffer();
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tag='59' ORDER BY urutan ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.append(rs.getString(1).replace("\n", " ") + " # ");
        }
        return data.toString();
    }

    public String ambilTag72(int headerId) throws SQLException {
        String data = "";
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tagName='_230_of72_sender_receiver_information'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data = rs.getString(1);
        }
        return data.toUpperCase();
    }

    /**
     * @return the tag
     */
    public String getTag() {
        return tag;
    }

    /**
     * @param tag the tag to set
     */
    public void setTag(String tag) {
        this.tag = tag;
    }

    /**
     * @return the detail
     */
    public String getDetail() {
        return detail;
    }

    /**
     * @param detail the detail to set
     */
    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getOf72() throws IOException {
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("of72");
    }

    //// tambahan buat ngitung transaksi dengan flag tertentu (by DENNA)
    public int getFlagStatus(String flag, String tanggal1, String tanggal2) throws Exception {
        int jumlah = 0;
        //where STR_TO_DATE(tanggal,'%Y-%m-%d')='tanggal dari cm'
        String sql = "select * FROM headers where flag='" + flag + "' and TO_CHAR(tanggal, 'YYYY-MM-DD') BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + " 23:59' and isduplicate=0;";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            jumlah++;
        }
//        System.out.println("hasil=" + hasil);
        return jumlah;
    }
//// tambahan buat ngitung transaksi dan sum amount pada bank tertentu (by DENNA)

    public String[] getBanksForChart(String tag, int tagName, String tanggal1, String tanggal2, String ioType) throws Exception {
        String[] hasil = new String[0];
        String sql;
        if (ioType.equalsIgnoreCase("I")) {
            sql = "SELECT detail FROM tags as t, headers as h where t.id_headers = h.id_headers and h.io_type = '" + ioType + "' and ((tag='" + tag + "' and tagName='_1" + tagName + "_of" + tag + "_identifier_code') or (tag='58a' and tagName='_181_of58a_identifier_code') or (tag='54a' and tagName='_321_of54a_identifier_code')) and h.tanggal BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + " 23:59' and isduplicate=0;";
        } else {
            sql = "SELECT detail FROM tags as t, headers as h where t.id_headers = h.id_headers and h.io_type = '" + ioType + "' and ((tag='" + tag + "' and tagName='_1" + tagName + "_of" + tag + "_identifier_code') or (tag='53a' and tagName='_311_of53a_identifier_code')) and h.tanggal BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + " 23:59' and isduplicate=0;";
        }
//        System.out.println("sql getBanksForChart : " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
//        System.out.println("hasil=" + hasil);

        while (rs.next()) {
            String temp;
            boolean found = false;
            temp = rs.getString(1);
            for (int i = 0; i < hasil.length; i++) {
                if (hasil[i].equals(temp)) {
                    found = true;
                }
            }
            if (found == false) {
                hasil = Arrays.copyOf(hasil, hasil.length + 1);
                hasil[hasil.length - 1] = rs.getString(1);
            }
        }

        return hasil;
    }

    public String[] getAmountsStringForBanks(String tag, int tagName, String tanggal1, String tanggal2, String ioType) throws Exception {
        //SELECT id_headers, tag, convert(detail using latin1), tagName FROM rtgs.tags where id_headers=49;

        String[] banks = getBanksForChart(tag, tagName, tanggal1, tanggal2, ioType);
        String[] hasil = new String[banks.length];
        String sql;
        for (int j = 0; j < banks.length; j++) {

            if (ioType.equalsIgnoreCase("I")) {
                sql = "SELECT SUM(CAST(REPLACE(detail,',','.') as decimal)) FROM tags as t, headers as h where t.id_headers = h.id_headers and h.io_type = '" + ioType + "' and tag='32a' AND tagName like '%mf32a_amount' AND t.id_headers in (SELECT t.id_headers FROM tags as t where ((tag='" + tag + "' and tagName='_1" + tagName + "_of" + tag + "_identifier_code') or (tag='58a' and tagName='_181_of58a_identifier_code') or (tag='54a' and tagName='_321_of54a_identifier_code')) and detail ='" + banks[j] + "') and h.tanggal BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + " 23:59'  and isduplicate=0;";
            } else {
                sql = "SELECT SUM(CAST(REPLACE(detail,',','.') as decimal)) FROM tags as t, headers as h where t.id_headers = h.id_headers and h.io_type = '" + ioType + "' and tag='32a' AND tagName like '%mf32a_amount' AND t.id_headers in (SELECT t.id_headers FROM tags as t where ((tag='" + tag + "' and tagName='_1" + tagName + "_of" + tag + "_identifier_code') or (tag='53a' and tagName='_311_of53a_identifier_code')) and detail ='" + banks[j] + "') and h.tanggal BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + " 23:59'  and isduplicate=0;";
            }

//            System.out.println("sql getAmountsStringForBanks : " + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                hasil[j] = rs.getString(1);
            }
        }
//        System.out.println(banks.length);
        return hasil;
    }

    public String blockNominal(String data) {
        String result = "";
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();
        formatRp.setCurrencySymbol("");
        formatRp.setMonetaryDecimalSeparator(',');
        formatRp.setGroupingSeparator('.');
        kursIndonesia.setDecimalFormatSymbols(formatRp);
        if (data != null) {
            result = kursIndonesia.format(Double.parseDouble(data.replace(",", ".")));
        }
        return result;
    }

    public String getNominalBIC(String bic, String tanggal1, String tanggal2, String io_type) throws Exception {
        String nominal = "";
        Double dNominal;
        NumberFormat nf2 = NumberFormat.getInstance(new Locale("id", "ID")); //hasilnya pake titik(.)
//        NumberFormat nf2 = NumberFormat.getInstance(new Locale("us", "US")); //hasilnya pake koma(,)
        String sql = "SELECT SUM(CAST(replace(detail, ',','.') AS DECIMAL )) as nominal "
                + "FROM tags as t, headers as h "
                + "where t.id_headers = h.id_headers and h.io_type = '" + io_type + "' and tag='32a' AND tagName like '%mf32a_amount' "
                + "AND h.receiverAddress like '" + bic + "%' AND (flag='AUTH' OR flag='TEXT' OR flag='ACK' OR flag='NACK') AND "
                + "h.tanggal BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + " 23:59'  and isduplicate=0";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            dNominal = rs.getDouble(1);
            nominal = nf2.format(dNominal);
        }
        return nominal;
    }

    public String getDailyTrx(String flag, String tanggal1, String tanggal2, String currency, String flag2) throws Exception {
        String nominal = "";
        String sql = "exec dailyTrx @date1 = '" + tanggal1 + "', @date2 = '" + tanggal2 + "', @curr = '" + currency + "', @flag = '" + flag + "',@flag2 = '" + flag2 + "'  ";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            nominal = rs.getString(1) + "#" + rs.getString(2) + "#" + rs.getString(3) + "#" + rs.getString(4);
        }
        if (nominal.equals("")) {
            nominal = "0#0#" + currency + "#" + flag;
        }
        return nominal;
    }

    public String getDailyTrxInvRtr(String flag, String tanggal1, String tanggal2, String currency) throws Exception {
        String nominal = "";
        String sql = "exec dailyTrxInv @date1 = '" + tanggal1 + "', @date2 = '" + tanggal2 + "', @curr = '" + currency + "', @flag = '" + flag + "' ";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            nominal = rs.getString(1) + "#" + rs.getString(2) + "#" + rs.getString(3) + "#" + rs.getString(4);
        }
        if (nominal.equals("")) {
            nominal = "0#0#" + currency + "#" + flag;
        }
        return nominal;
    }

    public List<String> getYearlyTrx(String year) throws SQLException {
        List<String> data = new ArrayList<String>();
        String month = "";
        String sql = "select year_trx, month_trx, trx_in, trx_out from dashboard where year_trx = '" + year + "' order by month_trx asc";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String strmonth = rs.getString(2);
            switch (strmonth) {
                case "01":
                    month = "January";
                    break;
                case "02":
                    month = "February";
                    break;
                case "03":
                    month = "March";
                    break;
                case "04":
                    month = "April";
                    break;
                case "05":
                    month = "May";
                    break;
                case "06":
                    month = "June";
                    break;
                case "07":
                    month = "July";
                    break;
                case "08":
                    month = "August";
                    break;
                case "09":
                    month = "September";
                    break;
                case "10":
                    month = "October";
                    break;
                case "11":
                    month = "November";
                    break;
                case "12":
                    month = "December";
                    break;
            }
            data.add(rs.getString(1) + "#" + month + "#" + rs.getString(3) + "#" + rs.getString(4));
        }
        return data;
    }

    public EssentialFieldPacs008 getEssentialFieldPacs008byId(int id_headers) {
        String sql = "select json_tag->> 'identifier' as identifier ,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'pmtId' ->> 'instrId' as InstrId ,    \n"
                + "CONCAT(json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' -> 'year',  \n"
                + "            LPAD((json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' -> 'month')::TEXT, 2, '0'), \n"
                + "            LPAD((json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' -> 'day')::TEXT, 2, '0')\n"
                + "        ) AS sattlement_date, \n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmAmt' ->> 'ccy' as Currency,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmAmt' ->> 'value' as Sattlement_Amout,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 ->> 'chrgBr' as Charges,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'instdAmt' ->> 'ccy' AS instr_ccy,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'instdAmt' ->> 'value' AS instr_amount,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'xchgRate' ->> 'rate' AS rate,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' ->> 'nm' AS debtor_name,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'orgId' -> 'othr' ->> 'id' AS debtor_identification,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'dept' AS debtor_dept,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'subDept' AS debtor_sub_dept,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'strtNm' AS debtor_street,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'bldgNb' AS debtor_building_number,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'bldgNm' AS debtor_building_name,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'flr' AS debtor_floor,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'pstBx' AS debtor_post_box,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'room' AS debtor_room,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'pstCd' AS debtor_post_code,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'twnNm' AS debtor_town_name,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'twnLctnNm' AS debtor_town_loc_name,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'dstrctNm' AS debtor_district_name,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'ctry' AS debtor_country,\n"
                + //                    "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'adrLine' AS debtor_addressline,\n" +
                "    CONCAT(\n"
                + "       json_tag->'fiToFICstmrCdtTrf'->'cdtTrfTxInf'->0->'dbtr'->'pstlAdr'->'adrLine'->>0, CHR(10),\n"
                + "       json_tag->'fiToFICstmrCdtTrf'->'cdtTrfTxInf'->0->'dbtr'->'pstlAdr'->'adrLine'->>1, CHR(10),\n"
                + "       json_tag->'fiToFICstmrCdtTrf'->'cdtTrfTxInf'->0->'dbtr'->'pstlAdr'->'adrLine'->>2\n"
                + "    ) AS debtor_addressline,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtrAcct' -> 'id'  -> 'othr' ->> 'id' AS debtor_acc_number,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtrAgt' -> 'finInstnId' ->> 'nm' AS instructing_bank,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrmyAgt1' -> 'finInstnId' ->> 'nm' AS intermediary_bank,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtrAgt' -> 'finInstnId' ->> 'nm' AS debtor_bank,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtrAgt' -> 'finInstnId' ->> 'nm' AS creditor_bank,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' ->> 'nm' AS creditor_name,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'dept' AS creditor_dept,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'subDept' AS creditor_sub_dept,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'strtNm' AS creditor_street,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'bldgNb' AS creditor_building_number,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'bldgNm' AS creditor_building_name,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'flr' AS creditor_floor,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'pstBx' AS creditor_post_box,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'room' AS creditor_room,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'pstCd' AS creditor_post_code,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'twnNm' AS creditor_town_name,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'twnLctnNm' AS creditor_town_loc_name,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'dstrctNm' AS creditor_district_name,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'ctry' AS creditor_country,\n"
                + //                    "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'adrLine' AS creditor_addressline,\n" +
                "    CONCAT(\n"
                + "       json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' -> 'adrLine' ->>0, CHR(10),\n"
                + "       json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' -> 'adrLine' ->>1, CHR(10),\n"
                + "       json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' -> 'adrLine' ->>2\n"
                + "    ) AS creditor_addressline,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'orgId' -> 'othr' ->> 'id' AS creditor_identification, \n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtrAcct' -> 'id' -> 'othr' ->> 'id' AS creditor_acc_number,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'rmtInf' -> 'ustrd'->>0 AS remittance_info\n"
                + "from tags_mx where id_headers = ?";
        try {
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id_headers);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                EssentialFieldPacs008 dataEssentialFieldPacs008 = new EssentialFieldPacs008();
                dataEssentialFieldPacs008.setMessage_identifier(resultSet.getString("identifier"));
                dataEssentialFieldPacs008.setInstruction_id(resultSet.getString("InstrId"));
                dataEssentialFieldPacs008.setValue_date(resultSet.getString("Sattlement_date"));
                dataEssentialFieldPacs008.setCurrency(resultSet.getString("Currency"));
                dataEssentialFieldPacs008.setAmount(resultSet.getString("Sattlement_Amout"));
                dataEssentialFieldPacs008.setCharges(resultSet.getString("Charges"));
                dataEssentialFieldPacs008.setInstr_ccy(resultSet.getString("instr_ccy"));
                dataEssentialFieldPacs008.setInstr_amount(resultSet.getString("instr_amount"));
                dataEssentialFieldPacs008.setRate(resultSet.getString("rate"));
                dataEssentialFieldPacs008.setDebtor_name(resultSet.getString("debtor_name"));
                dataEssentialFieldPacs008.setDebtor_identification(resultSet.getString("debtor_identification"));
                dataEssentialFieldPacs008.setDebtor_dept(resultSet.getString("debtor_dept"));
                dataEssentialFieldPacs008.setDebtor_sub_dept(resultSet.getString("debtor_sub_dept"));
                dataEssentialFieldPacs008.setDebtor_street(resultSet.getString("debtor_street"));
                dataEssentialFieldPacs008.setDebtor_building_number(resultSet.getString("debtor_building_number"));
                dataEssentialFieldPacs008.setDebtor_building_name(resultSet.getString("debtor_building_name"));
                dataEssentialFieldPacs008.setDebtor_floor(resultSet.getString("debtor_floor"));
                dataEssentialFieldPacs008.setDebtor_post_box(resultSet.getString("debtor_post_box"));
                dataEssentialFieldPacs008.setDebtor_room(resultSet.getString("debtor_room"));
                dataEssentialFieldPacs008.setDebtor_post_code(resultSet.getString("debtor_post_code"));
                dataEssentialFieldPacs008.setDebtor_town_name(resultSet.getString("debtor_town_name"));
                dataEssentialFieldPacs008.setDebtor_town_loc_name(resultSet.getString("debtor_town_loc_name"));
                dataEssentialFieldPacs008.setDebtor_district_name(resultSet.getString("debtor_district_name"));
                dataEssentialFieldPacs008.setDebtor_country(resultSet.getString("debtor_country"));
                dataEssentialFieldPacs008.setDebtor_addressline(resultSet.getString("debtor_addressline"));
                dataEssentialFieldPacs008.setDebtor_acc_number(resultSet.getString("debtor_acc_number"));
                dataEssentialFieldPacs008.setInstructing_bank(resultSet.getString("instructing_bank"));
                dataEssentialFieldPacs008.setIntermediary_bank(resultSet.getString("intermediary_bank"));
                dataEssentialFieldPacs008.setDebtor_bank(resultSet.getString("debtor_bank"));
                dataEssentialFieldPacs008.setCreditor_bank(resultSet.getString("creditor_bank"));
                dataEssentialFieldPacs008.setCreditor_name(resultSet.getString("creditor_name"));
                dataEssentialFieldPacs008.setCreditor_dept(resultSet.getString("creditor_dept"));
                dataEssentialFieldPacs008.setCreditor_sub_dept(resultSet.getString("creditor_sub_dept"));
                dataEssentialFieldPacs008.setCreditor_street(resultSet.getString("creditor_street"));
                dataEssentialFieldPacs008.setCreditor_building_number(resultSet.getString("creditor_building_number"));
                dataEssentialFieldPacs008.setCreditor_building_name(resultSet.getString("creditor_building_name"));
                dataEssentialFieldPacs008.setCreditor_floor(resultSet.getString("creditor_floor"));
                dataEssentialFieldPacs008.setCreditor_post_box(resultSet.getString("creditor_post_box"));
                dataEssentialFieldPacs008.setCreditor_room(resultSet.getString("creditor_room"));
                dataEssentialFieldPacs008.setCreditor_post_code(resultSet.getString("creditor_post_code"));
                dataEssentialFieldPacs008.setCreditor_town_name(resultSet.getString("creditor_town_name"));
                dataEssentialFieldPacs008.setCreditor_town_loc_name(resultSet.getString("creditor_town_loc_name"));
                dataEssentialFieldPacs008.setCreditor_district_name(resultSet.getString("creditor_district_name"));
                dataEssentialFieldPacs008.setCreditor_country(resultSet.getString("creditor_country"));
                dataEssentialFieldPacs008.setCreditor_addressline(resultSet.getString("creditor_addressline"));
                dataEssentialFieldPacs008.setCreditor_identification(resultSet.getString("creditor_identification"));
                dataEssentialFieldPacs008.setCreditor_acc_number(resultSet.getString("creditor_acc_number"));
                dataEssentialFieldPacs008.setRemittance_info(resultSet.getString("remittance_info"));

                return dataEssentialFieldPacs008;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBHeader.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public String clearXMLEncode(String text) {

        if (text == null) {
            return "";
        }
        text = text.replace("&amp;amp;", "&");
        text = text.replace("&amp;lt;", "<");
        text = text.replace("&amp;gt;", ">");
        text = text.replace("&amp;quot;", "\"");
        text = text.replace("&amp;apos;", "'");

        text = text.replace("&amp;", "&");
        text = text.replace("&lt;", "<");
        text = text.replace("&gt;", ">");
        text = text.replace("&quot;", "\"");
        text = text.replace("&apos;", "'");

        return text;

    }

    public EssentialFieldPacs009 getEssentialFieldPacs009byId(int id_headers) {
        String sql = "SELECT \n"
                + "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'pmtId' ->> 'instrId' AS instructionId,\n"
                + "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'pmtId' ->> 'endToEndId' AS endToEndId,\n"
                + "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'pmtId' ->> 'uetr' AS uetr,\n"
                + "    TO_DATE(\n"
                + "        CONCAT(\n"
                + "            json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' ->> 'year', '-', \n"
                + "            LPAD((json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' ->> 'month')::TEXT, 2, '0'), '-', \n"
                + "            LPAD((json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' ->> 'day')::TEXT, 2, '0')\n"
                + "        ), \n"
                + "        'YYYY-MM-DD'\n"
                + "    ) AS interbankSettlementDate,\n"
                + "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmAmt' ->> 'ccy' AS interbankSettlementCurrency,\n"
                + "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmAmt' ->> 'value' AS interbankSettlementAmount,\n"
                + "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'instgAgt' -> 'finInstnId' ->> 'nm' AS instructingAgent,\n"
                + "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'instdAgt' -> 'finInstnId' ->> 'nm' AS instructedAgent,\n"
                + "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtrAgt' -> 'finInstnId' ->> 'bicfi' AS debtorInstitutionId,\n"
                + "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtrAgt' -> 'finInstnId' ->> 'nm' AS debtorAgent,\n"
                + "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtrAgt' -> 'finInstnId' ->> 'bicfi' AS creditorInstitutionId,\n"
                + "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtrAgt' -> 'finInstnId' ->> 'nm' AS creditorAgent,\n"
                + //                "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtrAcct' -> 'id' ->> 'othr' AS debtorAcc,\n" +
                "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtrAcct' -> 'id' ->> 'othr' AS creditorAcc,\n"
                + //                "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' ->> 'nm' AS debtorNm,\n" +
                "    json_tag -> 'fiCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' ->> 'nm' AS creditorNm\n"
                + "FROM \n"
                + "    tags_mx\n"
                + "WHERE \n"
                + "    id_headers = ?;";

        try {
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id_headers);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                EssentialFieldPacs009 dataEssentialFieldPacs009 = new EssentialFieldPacs009();
                dataEssentialFieldPacs009.setInstructionId(resultSet.getString("instructionId"));
                dataEssentialFieldPacs009.setEndToEndId(resultSet.getString("endToEndId"));
                dataEssentialFieldPacs009.setUetr(resultSet.getString("uetr"));
                dataEssentialFieldPacs009.setInterbankSettlementDate(resultSet.getString("interbankSettlementDate"));
                dataEssentialFieldPacs009.setInterbankSettlementCurrency(resultSet.getString("interbankSettlementCurrency"));
                dataEssentialFieldPacs009.setInterbankSettlementAmount(resultSet.getString("interbankSettlementAmount"));
//            dataEssentialFieldPacs009.setPreviousInstructingAgent1(resultSet.getString("previousInstructingAgent1"));
//            dataEssentialFieldPacs009.setPreviousInstructingAgent2(resultSet.getString("previousInstructingAgent2"));
//            dataEssentialFieldPacs009.setPreviousInstructingAgent3(resultSet.getString("previousInstructingAgent3"));
                dataEssentialFieldPacs009.setInstructingAgent(resultSet.getString("instructingAgent"));
                dataEssentialFieldPacs009.setInstructedAgent(resultSet.getString("instructedAgent"));
                dataEssentialFieldPacs009.setDebtorInstitutionId(resultSet.getString("debtorInstitutionId"));
                dataEssentialFieldPacs009.setDebtorAgent(resultSet.getString("debtorAgent"));
                dataEssentialFieldPacs009.setCreditorInstitutionId(resultSet.getString("creditorInstitutionId"));
                dataEssentialFieldPacs009.setCreditorAgent(resultSet.getString("creditorAgent"));
                dataEssentialFieldPacs009.setCreditorAcc(resultSet.getString("creditorAcc"));
                dataEssentialFieldPacs009.setCreditorNm(resultSet.getString("creditorNm"));

                return dataEssentialFieldPacs009;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBHeader.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public Collection<Header> printMXDocPacs008(String id) throws SQLException, Exception {
        ArrayList<Header> headers = new ArrayList<Header>();
        DecimalFormat df = new DecimalFormat("#,###.####");
        String sql = "SELECT \n"
                + "    logicalTerminal,\n"
                + "    messageType,\n"
                + "    receiverAddress,\n"
                + "    messagePriority,\n"
                + "    bankingPriority,\n"
                + "    mur,\n"
                + "    komentar,\n"
                + "    MIRDate,\n"
                + "    COALESCE(MIRLogicalTerminal, ''),\n"
                + "    COALESCE(MIRSessionNumber, ''),\n"
                + "    COALESCE(MIRSequenceNumber, ''),\n"
                + "    json_tag -> 'appHdr' -> 'fr' -> 'fiId' -> 'finInstnId' ->> 'bicfi' AS fr_bicfi,\n"
                + "    json_tag -> 'appHdr' -> 'to' -> 'fiId' -> 'finInstnId' ->> 'bicfi' AS to_bicfi,\n"
                + "    json_tag -> 'appHdr' ->> 'msgDefIdr' AS msgDefIdr,\n"
                + "    h.flag,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'grpHdr' ->> 'msgId' AS msgId,\n"
                + "    CONCAT(\n"
                + "        json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' ->> 'year', '-', \n"
                + "        LPAD(json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' ->> 'month', 2, '0'), '-', \n"
                + "        LPAD(json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' ->> 'day', 2, '0')\n"
                + "    ) AS intrBkSttlmDt,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmAmt' ->> 'ccy' AS intrBkSttlmAmt_ccy,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmAmt' ->> 'value' AS intrBkSttlmAmt_value,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 ->> 'chrgBr' AS chrgBr,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'instdAmt' ->> 'ccy' AS instdAmt_ccy,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'instdAmt' ->> 'value' AS instdAmt_value,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 ->> 'xchgRate' AS xchgRate,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' ->> 'nm' AS dbtr_nm,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'dept' AS dbtr_pstlAdr_dept,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'subDept' AS dbtr_pstlAdr_subDept,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'strtNm' AS dbtr_pstlAdr_strtNm,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'bldgNb' AS dbtr_pstlAdr_bldgNb,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'bldgNm' AS dbtr_pstlAdr_bldgNm,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'flr' AS dbtr_pstlAdr_flr,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'pstBx' AS dbtr_pstlAdr_pstBx,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'room' AS dbtr_pstlAdr_room,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'pstCd' AS dbtr_pstlAdr_pstCd,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'twnNm' AS dbtr_pstlAdr_twnNm,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'twnLctnNm' AS dbtr_pstlAdr_twnLctnNm,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'dstrctNm' AS dbtr_pstlAdr_dstrctNm,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' ->> 'ctry' AS dbtr_pstlAdr_ctry,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' -> 'adrLine' ->> 0 AS dbtr_pstlAdr_adrLine_0,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' -> 'adrLine' ->> 1 AS dbtr_pstlAdr_adrLine_1,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'pstlAdr' -> 'adrLine' ->> 2 AS dbtr_pstlAdr_adrLine_2,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtr' -> 'id' -> 'prvtId' -> 'othr' -> 0 ->> 'id' AS dbtr_id,\n"
                + "    CONCAT(\n"
                + "        json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtrAcct' -> 'id' -> 'othr' ->> 'id', \n"
                + "        json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtrAcct' -> 'id' ->> 'iban'\n"
                + "    ) AS dbtrAcct_id,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'instgAgt' -> 'finInstnId' ->> 'bicfi' AS instgAgt_bicfi,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrmyAgt1' -> 'finInstnId' ->> 'bicfi' AS intrmyAgt1_bicfi,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'dbtrAgt' -> 'finInstnId' ->> 'bicfi' AS dbtrAgt_bicfi,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtrAgt' -> 'finInstnId' ->> 'bicfi' AS cdtrAgt_bicfi,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' ->> 'nm' AS cdtr_nm,\n"
                + "	json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'dept' AS cdtr_pstlAdr_dept,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'subDept' AS cdtr_pstlAdr_subDept,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'strtNm' AS cdtr_pstlAdr_strtNm,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'bldgNb' AS cdtr_pstlAdr_bldgNb,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'bldgNm' AS cdtr_pstlAdr_bldgNm,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'flr' AS cdtr_pstlAdr_flr,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'pstBx' AS cdtr_pstlAdr_pstBx,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'room' AS cdtr_pstlAdr_room,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'pstCd' AS cdtr_pstlAdr_pstCd,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'twnNm' AS cdtr_pstlAdr_twnNm,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'twnLctnNm' AS cdtr_pstlAdr_twnLctnNm,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'dstrctNm' AS cdtr_pstlAdr_dstrctNm,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' ->> 'ctry' AS cdtr_pstlAdr_ctry,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' -> 'adrLine' ->> 0 AS cdtr_pstlAdr_adrLine_0,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' -> 'adrLine' ->> 1 AS cdtr_pstlAdr_adrLine_1,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'pstlAdr' -> 'adrLine' ->> 2 AS cdtr_pstlAdr_adrLine_2,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtr' -> 'id' -> 'prvtId' -> 'othr' -> 0 ->> 'id' AS cdtr_id,\n"
                + "    CONCAT(\n"
                + "        json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtrAcct' -> 'id' -> 'othr' ->> 'id',\n"
                + "        json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'cdtrAcct' -> 'id' ->> 'iban'\n"
                + "    ) AS cdtrAcct_id,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'rmtInf' -> 'ustrd' ->> 0 AS rmtInf_ustrd,\n"
                + "    json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'pmtId' ->> 'instrId' AS pmtId_instrId \n"
                + "	from headers h\n"
                + "    left join tags_mx mx on\n"
                + "    h.id_headers=mx.id_headers\n"
                + "    where h.id_headers=?";

        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, Integer.parseInt(id));
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header header = new Header();
            String logTer = rs.getString(1).substring(0, 8) + "XXX";
            String recAdd = rs.getString(3).substring(0, 8) + "XXX";

            if (rs.getString(13).equalsIgnoreCase("O")) {
                header.setLogicalTerminal(logTer);
                header.setReceiverAddress(recAdd);
            } else {
                header.setLogicalTerminal(recAdd);
                header.setReceiverAddress(logTer);
            }
            header.setMessageType(rs.getString("messageType"));
            header.setMessagePriority(rs.getString(4));
            header.setBankingPriority(rs.getString(5));
            header.setMur(rs.getString(6));
            header.setKomentar(rs.getString(7));
            header.setMIRDate(rs.getString(8).trim());
            header.setMIRLogicalTerminal(rs.getString(9).substring(0, 8) + "XXX");
            header.setMIRSessionNumber(rs.getString(10));
            header.setMIRSequenceNumber(rs.getString(11));
            header.setFlag(rs.getString(15));
            String data = "";
            data += "Requestor DN\t\t\t: ou=" + rs.getString(12).substring(8).toLowerCase() + ",o=" + rs.getString(1).substring(0, 8).toLowerCase() + ",o=swift\n";
            data += "Responder DN\t\t\t: ou=" + rs.getString(13).substring(8).toLowerCase() + ",o=" + rs.getString(3).substring(0, 8).toLowerCase() + ",o=swift\n";
            data += "Identifier\t\t\t\t: " + rs.getString(14) + "\n";
            data += "Message Identifier\t\t: " + rs.getString(16) + "\n";
            data += "Instruction Id\t\t\t: " + rs.getString(67) + "\n";
            data += "Interbank Settlement Date\t\t: " + rs.getString(17) + "\n";
            data += "Currency\t\t\t: " + rs.getString(18) + "\n";
            data += "Interbank Settlement Amount\t: " + df.format(new BigDecimal(rs.getString(19))) + "\n";
            data += "Charges\t\t\t\t: " + rs.getString(20) + "\n";
            String instrCurr = rs.getString(21);
            if (instrCurr == null) {
                instrCurr = "";
            } else {
                instrCurr = "Instructed Currency\t\t: " + instrCurr + "\n";
            }
            String instrAmt = rs.getString(22);
            if (instrAmt == null) {
                instrAmt = "";
            } else {
                instrAmt = "Instructed Amount\t\t: " + df.format(new BigDecimal(instrAmt)) + "\n";
            }
            String rate = rs.getString(23);
            if (rate == null) {
                rate = "";
            } else {
                rate = "Exchange Rate\t\t\t: " + df.format(new BigDecimal(rate)) + "\n";
            }
            data += instrCurr;
            data += instrAmt;
            data += rate;
            data += "Debtor\n";
            String debtorName = rs.getString(24);
            if (debtorName == null) {
                debtorName = "";
            } else {
                debtorName = "    Name\t\t\t\t: " + clearXMLEncode(debtorName) + "\n";
            }
            data += debtorName;
            String debtorDept = rs.getString(25);
            if (debtorDept == null) {
                debtorDept = "";
            } else {
                debtorDept = "    Department\t\t\t: " + clearXMLEncode(debtorDept) + "\n";
            }
            data += debtorDept;
            String debtorSubDept = rs.getString(26);
            if (debtorSubDept == null) {
                debtorSubDept = "";
            } else {
                debtorSubDept = "    Sub Department\t\t: " + clearXMLEncode(debtorSubDept) + "\n";
            }
            data += debtorSubDept;
            String debtorStreet = rs.getString(27);
            if (debtorStreet == null) {
                debtorStreet = "";
            } else {
                debtorStreet = "    Street Name\t\t\t: " + clearXMLEncode(debtorStreet) + "\n";
            }
            data += debtorStreet;
            String debtorBdNb = rs.getString(28);
            if (debtorBdNb == null) {
                debtorBdNb = "";
            } else {
                debtorBdNb = "    Building Number\t\t: " + clearXMLEncode(debtorBdNb) + "\n";
            }
            data += debtorBdNb;
            String debtorBdNm = rs.getString(29);
            if (debtorBdNm == null) {
                debtorBdNm = "";
            } else {
                debtorBdNm = "    Building Name\t\t\t: " + clearXMLEncode(debtorBdNm) + "\n";
            }
            data += debtorBdNm;
            String debtorFloor = rs.getString(30);
            if (debtorFloor == null) {
                debtorFloor = "";
            } else {
                debtorFloor = "    Floor\t\t\t\t: " + clearXMLEncode(debtorFloor) + "\n";
            }
            data += debtorFloor;
            String debtorPoBox = rs.getString(31);
            if (debtorPoBox == null) {
                debtorPoBox = "";
            } else {
                debtorPoBox = "    Post Box\t\t\t: " + clearXMLEncode(debtorPoBox) + "\n";
            }
            data += debtorPoBox;
            String debtorRoom = rs.getString(32);
            if (debtorRoom == null) {
                debtorRoom = "";
            } else {
                debtorRoom = "    Room\t\t\t\t: " + clearXMLEncode(debtorRoom) + "\n";
            }
            data += debtorRoom;
            String debtorPoCd = rs.getString(33);
            if (debtorPoCd == null) {
                debtorPoCd = "";
            } else {
                debtorPoCd = "    Post Code\t\t\t: " + clearXMLEncode(debtorPoCd) + "\n";
            }
            data += debtorPoCd;
            String debtorTwn = rs.getString(34);
            if (debtorTwn == null) {
                debtorTwn = "";
            } else {
                debtorTwn = "    Town Name\t\t\t: " + clearXMLEncode(debtorTwn) + "\n";
            }
            data += debtorTwn;
            String debtorTwnLc = rs.getString(35);
            if (debtorTwnLc == null) {
                debtorTwnLc = "";
            } else {
                debtorTwnLc = "    Town Location Name\t\t: " + clearXMLEncode(debtorTwnLc) + "\n";
            }
            data += debtorTwnLc;
            String debtorDistrc = rs.getString(36);
            if (debtorDistrc == null) {
                debtorDistrc = "";
            } else {
                debtorDistrc = "    District Name\t\t\t: " + clearXMLEncode(debtorDistrc) + "\n";
            }
            data += debtorDistrc;
            String debtorCtry = rs.getString(37);
            if (debtorCtry == null) {
                debtorCtry = "";
            } else {
                debtorCtry = "    Country\t\t\t: " + clearXMLEncode(debtorCtry) + "\n";
            }
            data += debtorCtry;
            String debtorAddrLine1 = rs.getString(38);
            if (debtorAddrLine1 == null) {
                debtorAddrLine1 = "";
            } else {
                debtorAddrLine1 = "    Address Line\t\t\t: " + clearXMLEncode(debtorAddrLine1) + "\n";
            }
            data += debtorAddrLine1;
            String debtorAddrLine2 = rs.getString(39);
            if (debtorAddrLine2 == null) {
                debtorAddrLine2 = "";
            } else {
                debtorAddrLine2 = "    \t\t\t\t  " + clearXMLEncode(debtorAddrLine2) + "\n";
            }
            data += debtorAddrLine2;
            String debtorAddrLine3 = rs.getString(40);
            if (debtorAddrLine3 == null) {
                debtorAddrLine3 = "";
            } else {
                debtorAddrLine3 = "    \t\t\t\t  " + clearXMLEncode(debtorAddrLine3) + "\n";
            }
            data += debtorAddrLine3;
            String debtorIdent = rs.getString(41);
            if (debtorIdent == null) {
                debtorIdent = "";
            } else {
                debtorIdent = "    Identification\t\t: " + clearXMLEncode(debtorIdent) + "\n";
            }
            data += debtorIdent;
            String debtorAcc = rs.getString(42);
            if (debtorAcc.length() < 1) {
                debtorAcc = "";
            } else {
                debtorAcc = "Debtor Account Number\t\t: " + debtorAcc + "\n";
            }
            data += debtorAcc;
            String instrgBank = rs.getString(43);
            if (instrgBank == null) {
                instrgBank = "";
            } else {
                instrgBank = "Instructing Bank\t\t\t: " + clearXMLEncode(instrgBank) + "\n";
            }
            data += instrgBank;
            String intrmBank = rs.getString(44);
            if (intrmBank == null) {
                intrmBank = "";
            } else {
                intrmBank = "Intermediary Bank\t\t\t: " + clearXMLEncode(intrmBank) + "\n";
            }
            data += intrmBank;
            String debtorBank = rs.getString(45);
            if (debtorBank == null) {
                debtorBank = "";
            } else {
                debtorBank = "Debtor Bank\t\t\t: " + clearXMLEncode(debtorBank) + "\n";
            }
            data += debtorBank;
            String creditorBank = rs.getString(46);
            if (creditorBank == null) {
                creditorBank = "";
            } else {
                creditorBank = "Creditor Bank\t\t\t: " + clearXMLEncode(creditorBank) + "\n";
            }
            data += creditorBank;
            data += "Creditor\n";
            String creditorName = rs.getString(47);
            if (creditorName == null) {
                creditorName = "";
            } else {
                creditorName = "    Name\t\t\t\t: " + clearXMLEncode(creditorName) + "\n";
            }
            data += creditorName;
            String creditorDept = rs.getString(48);
            if (creditorDept == null) {
                creditorDept = "";
            } else {
                creditorDept = "    Department\t\t\t: " + clearXMLEncode(creditorDept) + "\n";
            }
            data += creditorDept;
            String creditorSubDept = rs.getString(49);
            if (creditorSubDept == null) {
                creditorSubDept = "";
            } else {
                creditorSubDept = "    Sub Department\t\t: " + clearXMLEncode(creditorSubDept) + "\n";
            }
            data += creditorSubDept;
            String creditorStreet = rs.getString(50);
            if (creditorStreet == null) {
                creditorStreet = "";
            } else {
                creditorStreet = "    Street Name\t\t\t: " + clearXMLEncode(creditorStreet) + "\n";
            }
            data += creditorStreet;
            String creditorBdNb = rs.getString(51);
            if (creditorBdNb == null) {
                creditorBdNb = "";
            } else {
                creditorBdNb = "    Building Number\t\t: " + clearXMLEncode(creditorBdNb) + "\n";
            }
            data += creditorBdNb;
            String creditorBdNm = rs.getString(52);
            if (creditorBdNm == null) {
                creditorBdNm = "";
            } else {
                creditorBdNm = "    Building Name\t\t\t: " + clearXMLEncode(creditorBdNm) + "\n";
            }
            data += creditorBdNm;
            String creditorFloor = rs.getString(53);
            if (creditorFloor == null) {
                creditorFloor = "";
            } else {
                creditorFloor = "    Floor\t\t\t\t: " + clearXMLEncode(creditorFloor) + "\n";
            }
            data += creditorFloor;
            String creditorPoBox = rs.getString(54);
            if (creditorPoBox == null) {
                creditorPoBox = "";
            } else {
                creditorPoBox = "    Post Box\t\t\t: " + clearXMLEncode(creditorPoBox) + "\n";
            }
            data += creditorPoBox;
            String creditorRoom = rs.getString(55);
            if (creditorRoom == null) {
                creditorRoom = "";
            } else {
                creditorRoom = "    Room\t\t\t\t: " + clearXMLEncode(creditorRoom) + "\n";
            }
            data += creditorRoom;
            String creditorPoCd = rs.getString(56);
            if (creditorPoCd == null) {
                creditorPoCd = "";
            } else {
                creditorPoCd = "    Post Code\t\t\t: " + clearXMLEncode(creditorPoCd) + "\n";
            }
            data += creditorPoCd;
            String creditorTwn = rs.getString(57);
            if (creditorTwn == null) {
                creditorTwn = "";
            } else {
                creditorTwn = "    Town Name\t\t\t: " + clearXMLEncode(creditorTwn) + "\n";
            }
            data += creditorTwn;
            String creditorTwnLc = rs.getString(58);
            if (creditorTwnLc == null) {
                creditorTwnLc = "";
            } else {
                creditorTwnLc = "    Town Location Name\t\t: " + clearXMLEncode(creditorTwnLc) + "\n";
            }
            data += creditorTwnLc;
            String creditorDistrc = rs.getString(59);
            if (creditorDistrc == null) {
                creditorDistrc = "";
            } else {
                creditorDistrc = "    District Name\t\t\t: " + clearXMLEncode(creditorDistrc) + "\n";
            }
            data += creditorDistrc;
            String creditorCtry = rs.getString(60);
            if (creditorCtry == null) {
                creditorCtry = "";
            } else {
                creditorCtry = "    Country\t\t\t: " + clearXMLEncode(creditorCtry) + "\n";
            }
            data += creditorCtry;
            String creditorAddrLine1 = rs.getString(61);
            if (creditorAddrLine1 == null) {
                creditorAddrLine1 = "";
            } else {
                creditorAddrLine1 = "    Address Line\t\t\t: " + clearXMLEncode(creditorAddrLine1) + "\n";
            }
            data += creditorAddrLine1;
            String creditorAddrLine2 = rs.getString(62);
            if (creditorAddrLine2 == null) {
                creditorAddrLine2 = "";
            } else {
                creditorAddrLine2 = "    \t\t\t\t  " + clearXMLEncode(creditorAddrLine2) + "\n";
            }
            data += creditorAddrLine2;
            String creditorAddrLine3 = rs.getString(63);
            if (creditorAddrLine3 == null) {
                creditorAddrLine3 = "";
            } else {
                creditorAddrLine3 = "    \t\t\t\t  " + clearXMLEncode(creditorAddrLine3) + "\n";
            }
            data += creditorAddrLine3;
            String creditorIdent = rs.getString(64);
            if (creditorIdent == null) {
                creditorIdent = "";
            } else {
                creditorIdent = "    Identification\t\t: " + clearXMLEncode(creditorIdent) + "\n";
            }
            data += creditorIdent;
            String creditorAcc = rs.getString(65);
            if (creditorAcc.length() < 1) {
                creditorAcc = "";
            } else {
                creditorAcc = "Creditor Account Number\t\t: " + creditorAcc + "\n";
            }
            data += creditorAcc;
            String remittanceInfo1 = rs.getString(66);
            if (remittanceInfo1 == null) {
                remittanceInfo1 = "";
            } else {
                if (remittanceInfo1.length() > 70) {
                    remittanceInfo1 = "Remittance Information\t\t: " + remittanceInfo1.substring(0, 70) + "\n    \t\t\t\t  " + remittanceInfo1.substring(70);
                } else {
                    remittanceInfo1 = "Remittance Information\t\t: " + remittanceInfo1;
                }
            }
            data += clearXMLEncode(remittanceInfo1);
            header.setMxdetail(data);
            headers.add(header);
        }
        return headers;
    }

    public Collection<Header> printMXDocPacs009(String id) throws SQLException, Exception {
        ArrayList<Header> headers = new ArrayList<Header>();
        DecimalFormat df = new DecimalFormat("#,###.####");
        String sql = "SELECT logicalTerminal,messageType,receiverAddress,messagePriority,   \n"
                + "                        bankingPriority,mur,komentar,   \n"
                + "                        MIRDate, \n"
                + "						COALESCE(MIRLogicalTerminal, '') AS MIRLogicalTerminal,  \n"
                + "						COALESCE(MIRSessionNumber, '') AS MIRSessionNumber,  \n"
                + "						COALESCE(MIRSequenceNumber, '') AS MIRSequenceNumber,  \n"
                + "                        json_tag->'appHdr'->'fr'->'fiId'->'finInstnId'->>'bicfi' AS fromBic, \n"
                + "						json_tag->'appHdr'->'to'->'fiId'->'finInstnId'->>'bicfi' AS toBic,  \n"
                + "						json_tag->'appHdr'->>'msgDefIdr' AS msgDefIdr,   \n"
                + "						h.flag,   \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'pmtId'->>'instrId' AS instructionId, \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'pmtId'->>'endToEndId' AS endToEndId, \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'pmtId'->>'uetr' AS uetr,  \n"
                + "						CONCAT( \n"
                + "							mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'intrBkSttlmDt'->>'year', '-',  \n"
                + "							LPAD(mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'intrBkSttlmDt'->>'month', 2, '0'), '-',  \n"
                + "							LPAD(mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'intrBkSttlmDt'->>'day', 2, '0') \n"
                + "    					) AS interbankSettlementDate,  \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'intrBkSttlmAmt'->>'ccy' AS interBankSettlementCcy,  \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'intrBkSttlmAmt'->>'value' AS interBankSettlementAmount, \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'prvsInstgAgt1'->'finInstnId'->>'bicfi' AS preInstructingAgent1,  \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'prvsInstgAgt2'->'finInstnId'->>'bicfi' AS preInstructingAgent2,  \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'prvsInstgAgt3'->'finInstnId'->>'bicfi' AS preInstructingAgent3,  \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'dbtr'->'finInstnId'->>'bicfi' AS debtorInstitutionId,  \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'cdtr'->'finInstnId'->>'bicfi' AS creditorInstitutionId,  \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'instgAgt'->'finInstnId'->>'bicfi' AS instructingAgent,  \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'instdAgt'->'finInstnId'->>'bicfi' AS instructedAgent,  \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'dbtrAgt'->'finInstnId'->>'bicfi' AS debtorAgent,  \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'undrlygCstmrCdtTrf'->'cdtrAgt'->'finInstnId'->>'bicfi' AS creditorAgent,  \n"
                + "						CONCAT( \n"
                + "							mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'undrlygCstmrCdtTrf'->'cdtrAcct'->'id'->'othr'->>'id',  \n"
                + "							mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'undrlygCstmrCdtTrf'->'cdtrAcct'->'id'->>'iban' \n"
                + "						) AS creditoracc,  \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'undrlygCstmrCdtTrf'->'cdtr'->>'nm' AS creditornm,  \n"
                + "						mx.json_tag->'fiCdtTrf'->'cdtTrfTxInf'->0->'undrlygCstmrCdtTrf'->'cdtrAcct'->'id'->'othr'->>'id' AS nm, \n"
                + "                        io_type as io_type   \n"
                + "                         from headers h   \n"
                + "                         left join tags_mx mx on  \n"
                + "                         h.id_headers=mx.id_headers  \n"
                + "                         where h.id_headers=?";
        //        System.out.println("printMXDoc009= " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, Integer.parseInt(id));
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Header header = new Header();
            String logTer = rs.getString("logicalTerminal").substring(0, 8) + "XXX";
            String recAdd = rs.getString("receiverAddress").substring(0, 8) + "XXX";

            if (rs.getString("io_type").equalsIgnoreCase("O")) {
                header.setLogicalTerminal(logTer);
                header.setReceiverAddress(recAdd);
            } else {
                header.setLogicalTerminal(recAdd);
                header.setReceiverAddress(logTer);
            }
            header.setMessageType(rs.getString("messageType"));
            header.setMessagePriority(rs.getString("messagePriority"));
            if (rs.getString("bankingPriority") != null) {
                header.setBankingPriority(rs.getString("bankingPriority"));
            }
            if (rs.getString("mur") != null) {
                header.setMur(rs.getString("mur"));
            }
            if (rs.getString("komentar") != null) {
                header.setKomentar(rs.getString("komentar"));
            }
            if (rs.getString("MIRDate") != null) {
                header.setMIRDate(rs.getString("MIRDate").trim());
            }
            if (rs.getString("MIRLogicalTerminal") != null) {
                if (rs.getString("MIRLogicalTerminal").length() >= 8) {
                    header.setMIRLogicalTerminal(rs.getString("MIRLogicalTerminal").substring(0, 8) + "XXX");
                }
            }
            if (rs.getString("MIRSessionNumber") != null) {
                header.setMIRSessionNumber(rs.getString("MIRSessionNumber"));
            }
            if (rs.getString("MIRSequenceNumber") != null) {
                header.setMIRSequenceNumber(rs.getString("MIRSequenceNumber"));
            }

            header.setFlag(rs.getString("flag"));
            String data = "";
            data += "Requestor DN\t\t\t\t: ou=" + rs.getString("fromBic").substring(8).toLowerCase() + ",o=" + rs.getString(1).substring(0, 8).toLowerCase() + ",o=swift\n";
            data += "Responder DN\t\t\t\t: ou=" + rs.getString("toBic").substring(8).toLowerCase() + ",o=" + rs.getString(3).substring(0, 8).toLowerCase() + ",o=swift\n";

            //Identifier
            if (rs.getString("instructionId") == null) {
                data += "";
            } else {
                data += "Identifier\t\t\t\t\t: " + rs.getString("instructionId") + "\n";
            }
            //End to End Id
            if (rs.getString("endToEndId") == null) {
                data += "";
            } else {
                data += "End to End Id\t\t\t\t: " + rs.getString("endToEndId") + "\n";
            }
            //UETR
            if (rs.getString("uetr") == null) {
                data += "";
            } else {
                data += "UETR\t\t\t\t\t: " + rs.getString("uetr") + "\n";
            }
            //Interbank Settlement 
            if (rs.getString("interbankSettlementDate") == null) {
                data += "";
            } else {
                data += "Interbank Settlement Date\t\t\t: " + rs.getString("interbankSettlementDate") + "\n";
            }
            if (rs.getString("interBankSettlementCcy") == null) {
                data += "";
            } else {
                data += "Interbank Settlement Currency\t\t: " + rs.getString("interBankSettlementCcy") + "\n";
            }
            if (rs.getString("interBankSettlementAmount") == null) {
                data += "";
            } else {
                data += "Interbank Settlement Amount\t\t: " + rs.getString("interBankSettlementAmount") + "\n";
            }

            //Previous agent
            if (rs.getString("preInstructingAgent1") == null) {
                data += "";
            } else {
                data += "Previous agent 1\t\t\t\t: " + clearXMLEncode(rs.getString("preInstructingAgent1")) + "\n";
            }
            if (rs.getString("preInstructingAgent2") == null) {
                data += "";
            } else {
                data += "Previous agent 2\t\t\t\t: " + clearXMLEncode(rs.getString("preInstructingAgent2")) + "\n";
            }
            if (rs.getString("preInstructingAgent3") == null) {
                data += "";
            } else {
                data += "Previous agent 3\t\t\t\t: " + clearXMLEncode(rs.getString("preInstructingAgent3")) + "\n";
            }

            //Debtor Creditor Agent
            if (rs.getString("instructingAgent") == null) {
                data += "";
            } else {
                data += "Instructing Agent\t\t\t\t: " + clearXMLEncode(rs.getString("instructingAgent")) + "\n";
            }
            if (rs.getString("instructedAgent") == null) {
                data += "";
            } else {
                data += "Instructed Agent\t\t\t\t: " + clearXMLEncode(rs.getString("instructedAgent")) + "\n";
            }
            if (rs.getString("debtorInstitutionId") == null) {
                data += "";
            } else {
                data += "Debtor Institution ID\t\t\t: " + clearXMLEncode(rs.getString("debtorInstitutionId")) + "\n";
            }
            if (rs.getString("debtorAgent") == null) {
                data += "";
            } else {
                data += "Debtor Agent\t\t\t\t: " + clearXMLEncode(rs.getString("debtorAgent")) + "\n";
            }
            if (rs.getString("creditorInstitutionId") == null) {
                data += "";
            } else {
                data += "Creditor Institution ID\t\t\t: " + clearXMLEncode(rs.getString("creditorInstitutionId")) + "\n";
            }
            if (rs.getString("creditorAgent") == null) {
                data += "";
            } else {
                data += "Creditor Agent\t\t\t\t: " + clearXMLEncode(rs.getString("creditorAgent")) + "\n";
            }
            if (rs.getString("creditoracc") == null || rs.getString("creditoracc").equalsIgnoreCase("")) {
                data += "";
            } else {
                data += "Creditor Account Number\t\t\t: " + clearXMLEncode(rs.getString("creditoracc")) + "\n";
            }

            header.setMxdetail(data);
            headers.add(header);
        }
        return headers;
    }

    public ArrayList<Header> getAllHeaderReport(String status, String io_type, String mt_type, String value_date, String date_from, String date_end, String flag, String filter, String cust_curr, String value_date_end, String channel) throws SQLException {
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();
        formatRp.setCurrencySymbol("");
        formatRp.setMonetaryDecimalSeparator(',');
        formatRp.setGroupingSeparator('.');

        kursIndonesia.setDecimalFormatSymbols(formatRp);
        ArrayList<Header> headers = new ArrayList<Header>();
//        String where = "";
        Double amountAck = 0.0;
        Double amountNack = 0.0;
//        if (io_type.equalsIgnoreCase("IO")) {//20190926
//            where += "";
//        } else if (io_type.equalsIgnoreCase("I")) {
//            where += " AND io_type = 'I'";
//        } else {
//            where += " AND io_type = 'O'";
//        }
//        
//        if (mt_type == null || mt_type.isEmpty()) {
//            where += "";
//        } else {
//            where += " AND messageType = '" + mt_type + "'";
//        }
////        System.out.println("### flag ### = " + flag);
//        if (flag == null || flag.isEmpty()) {
//            where += "";
//        } else {
//            // diganti menjadi = asalnya like 20150930
//            where += " AND flag = '" + flag + "'";
//        }
//        
//        if (cust_curr != null && !cust_curr.isEmpty()) {
//            where += " AND t32c.detail = '" + cust_curr + "'";
//        }
//        
//        if ( filter == null) {
//            where += "";
//        } else if (filter.equals("1")) {
//            where += " AND block3 like '%111:009;%'";
//        } else if (filter.equals("0")) {
//            where += " AND block3 not like '%111:009;%'";
//        }else{
//            where += "";
//        }
//        
//        if ( channel == null) {
//            where += "";
//        } else{
//            where += " AND source = '"+channel+"'";
//        }
//
//        where += " AND CAST(hd.tanggal as DATE) BETWEEN '" + date_from + "' AND '" + date_end + " 23:59:59'"; //20200213
//        String sql = "SELECT DISTINCT \n" +
//                    "    hd.id_headers, \n" +
//                    "    hd.messageType,\n" +
//                    "    hd.logicalTerminal,\n" +
//                    "    hd.io_type,\n" +
//                    "    hd.receiverAddress,\n" +
//                    "    hd.tanggal,\n" +
//                    "    hd.flag, \n" +
//                    "    COALESCE('20' || SUBSTRING(t32d.detail FROM 1 FOR 2) || '-' ||\n" +
//"                    SUBSTRING(t32d.detail FROM 3 FOR 2) || '-' ||\n" +
//"                    RIGHT(t32d.detail, 2), '') AS vdate,\n" +
//                    "\n" +
//                    "    -- REF --\n" +
//                    "    COALESCE(\n" +
//                    "        t20.detail, \n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiToFICstmrCdtTrf.cdtTrfTxInf[0].pmtId.instrId'), -- pacs.008\n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.pmtRtr.grpHdr.msgId'), -- pacs.004\n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiCdtTrf.cdtTrfTxInf[0].pmtId.instrId'), -- pacs.009\n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.rsltnOfInvstgtn.assgnmt.id'), -- camt.029\n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.bkToCstmrAcctRpt.rpt[0].id'), -- camt.052\n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.bkToCstmrStmt.stmt[0].id'), -- camt.053\n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiToFIPmtCxlReq.undrlyg[0].txInf[0]._case.id'), -- camt.056\n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiToFIPmtCxlReq.assgnmt.id'), -- camt.056\n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiToFIPmtStsRpt.grpHdr.msgId'),\n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.ntfctnToRcv.ntfctn.id'),\n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.ntfctnToRcv.grpHdr.msgId'),\n" +
//                    "                 JSON_VALUE(mx.json_tag,'$.cstmrPmtCxlReq.assgnmt.id')\n" +
//                    "        )))))))))))) as ref,\n" +
//                    "\n" +
//                    "    -- Currency\n" +
//                    "    COALESCE(\n" +
//                    "        t32c.detail, \n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiToFICstmrCdtTrf.cdtTrfTxInf[0].intrBkSttlmAmt.ccy'), -- pacs.008\n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.pmtRtr.txInf[0].rtrdIntrBkSttlmAmt.ccy'),  -- pacs.004\n" +
//                    "                 JSON_VALUE(mx.json_tag,'$.fiCdtTrf.cdtTrfTxInf[0].intrBkSttlmAmt.ccy')  -- pacs.009\n" +
//                    "        ))\n" +
//                    "    ) as curr,\n" +
//                    "\n" +
//                    "    -- Amount\n" +
//                    "    COALESCE(\n" +
//                    "        t32.detail, \n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiToFICstmrCdtTrf.cdtTrfTxInf[0].intrBkSttlmAmt.value'), -- pacs.008\n" +
//                    "        COALESCE(JSON_VALUE(mx.json_tag,'$.pmtRtr.txInf[0].rtrdIntrBkSttlmAmt.value'), -- pacs.004\n" +
//                    "                 JSON_VALUE(mx.json_tag,'$.fiCdtTrf.cdtTrfTxInf[0].intrBkSttlmAmt.value') -- pacs.009\n" +
//                    "        ))\n" +
//                    "    ) as amount,\n" +
//                    "\n" +
//                    "hd.source\n" +
//                    "FROM headers as hd \n" +
//                    "--LEFT JOIN header_status hds ON hds.id_headers = hd.id_headers \n" +
//                    "LEFT JOIN tags t20 ON t20.id_headers = hd.id_headers AND t20.tag = '20'\n" +
//                    "LEFT JOIN tags t32c ON t32c.id_headers = hd.id_headers \n" +
//                    "    AND (t32c.tagName LIKE '%mf32a_currency%' OR t32c.tagName LIKE '%mf62f_currency%' OR t32c.tagName LIKE '%mf62m_currency%' OR t32c.tagName LIKE '%mf32b_currency%') \n" +
//                    "LEFT JOIN tags t32d ON t32d.id_headers = hd.id_headers \n" +
//                    "    AND (t32d.tagName LIKE '%mf32a_date%' OR t32d.tagName LIKE '%mf62f_date%' OR t32d.tagName LIKE '%mf62m_date%' OR t32d.tagName LIKE '%mf32a_value_date%') \n" +
//                    "LEFT JOIN tags t32 ON t32.id_headers = hd.id_headers \n" +
//                    "    AND (t32.tagName LIKE '%mf32a_amount%' OR t32.tagName LIKE '%mf62f_amount%' OR t32.tagName LIKE '%mf62m_amount%' OR t32.tagName LIKE '%mf32b_amount%')\n" +
//                    "LEFT JOIN tags_mx mx ON mx.id_headers = hd.id_headers WHERE " 
//                + " isDuplicate=0 " + where
//                + " ORDER BY tanggal DESC";
//        PreparedStatement st = this.conn.prepareStatement(sql);
//        ResultSet rs = st.executeQuery();

        StringBuilder where = new StringBuilder(" isDuplicate=0 ");
        List<Object> params = new ArrayList<>();

        // io_type condition
        if (io_type != null && !io_type.equalsIgnoreCase("IO")) {
            if (io_type.equalsIgnoreCase("I")) {
                where.append(" AND io_type = ?");
                params.add("I");
            } else {
                where.append(" AND io_type = ?");
                params.add("O");
            }
        }

        // mt_type condition
        if (mt_type != null && !mt_type.isEmpty()) {
            where.append(" AND messageType = ?");
            params.add(mt_type);
        }

        // flag condition
        if (flag != null && !flag.isEmpty()) {
            where.append(" AND flag = ?");
            params.add(flag);
        }

        // cust_curr condition
        if (cust_curr != null && !cust_curr.isEmpty()) {
            where.append(" AND t32c.detail = ?");
            params.add(cust_curr);
        }

        // filter condition
        if (filter != null) {
            if (filter.equals("1")) {
                where.append(" AND block3 like ?");
                params.add("%111:009;%");
            } else if (filter.equals("0")) {
                where.append(" AND block3 not like ?");
                params.add("%111:009;%");
            }
        }

        // channel condition
        if (channel != null && !channel.isEmpty()) {
            where.append(" AND source = ?");
            params.add(channel);
        }

        // date range condition (harus selalu ada)
        where.append(" AND CAST(hd.tanggal as DATE) BETWEEN ? AND ?");
        params.add(java.sql.Date.valueOf(date_from));  // pastikan format yyyy-MM-dd
        params.add(java.sql.Timestamp.valueOf(date_end + " 23:59:59"));

        // SQL lengkap
//            String sql = "SELECT DISTINCT \n" +
//                "    hd.id_headers, \n" +
//                "    hd.messageType,\n" +
//                "    hd.logicalTerminal,\n" +
//                "    hd.io_type,\n" +
//                "    hd.receiverAddress,\n" +
//                "    hd.tanggal,\n" +
//                "    hd.flag, \n" +
//                "    COALESCE('20' || SUBSTRING(t32d.detail FROM 1 FOR 2) || '-' ||\n" +
//                "        SUBSTRING(t32d.detail FROM 3 FOR 2) || '-' ||\n" +
//                "        RIGHT(t32d.detail, 2), '') AS vdate,\n" +
//                "    -- REF --\n" +
//                "    COALESCE(\n" +
//                "        t20.detail, \n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiToFICstmrCdtTrf.cdtTrfTxInf[0].pmtId.instrId'),\n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.pmtRtr.grpHdr.msgId'),\n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiCdtTrf.cdtTrfTxInf[0].pmtId.instrId'),\n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.rsltnOfInvstgtn.assgnmt.id'),\n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.bkToCstmrAcctRpt.rpt[0].id'),\n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.bkToCstmrStmt.stmt[0].id'),\n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiToFIPmtCxlReq.undrlyg[0].txInf[0]._case.id'),\n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiToFIPmtCxlReq.assgnmt.id'),\n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiToFIPmtStsRpt.grpHdr.msgId'),\n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.ntfctnToRcv.ntfctn.id'),\n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.ntfctnToRcv.grpHdr.msgId'),\n" +
//                "                 JSON_VALUE(mx.json_tag,'$.cstmrPmtCxlReq.assgnmt.id')\n" +
//                "        )))))))))))) as ref,\n" +
//                "    -- Currency\n" +
//                "    COALESCE(\n" +
//                "        t32c.detail, \n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiToFICstmrCdtTrf.cdtTrfTxInf[0].intrBkSttlmAmt.ccy'),\n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.pmtRtr.txInf[0].rtrdIntrBkSttlmAmt.ccy'),\n" +
//                "                 JSON_VALUE(mx.json_tag,'$.fiCdtTrf.cdtTrfTxInf[0].intrBkSttlmAmt.ccy')\n" +
//                "        ))\n" +
//                "    ) as curr,\n" +
//                "    -- Amount\n" +
//                "    COALESCE(\n" +
//                "        t32.detail, \n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.fiToFICstmrCdtTrf.cdtTrfTxInf[0].intrBkSttlmAmt.value'),\n" +
//                "        COALESCE(JSON_VALUE(mx.json_tag,'$.pmtRtr.txInf[0].rtrdIntrBkSttlmAmt.value'),\n" +
//                "                 JSON_VALUE(mx.json_tag,'$.fiCdtTrf.cdtTrfTxInf[0].intrBkSttlmAmt.value')\n" +
//                "        ))\n" +
//                "    ) as amount,\n" +
//                "hd.source\n" +
//                "FROM headers as hd \n" +
//                "LEFT JOIN tags t20 ON t20.id_headers = hd.id_headers AND t20.tag = '20'\n" +
//                "LEFT JOIN tags t32c ON t32c.id_headers = hd.id_headers \n" +
//                "    AND (t32c.tagName LIKE '%mf32a_currency%' OR t32c.tagName LIKE '%mf62f_currency%' OR t32c.tagName LIKE '%mf62m_currency%' OR t32c.tagName LIKE '%mf32b_currency%') \n" +
//                "LEFT JOIN tags t32d ON t32d.id_headers = hd.id_headers \n" +
//                "    AND (t32d.tagName LIKE '%mf32a_date%' OR t32d.tagName LIKE '%mf62f_date%' OR t32d.tagName LIKE '%mf62m_date%' OR t32d.tagName LIKE '%mf32a_value_date%') \n" +
//                "LEFT JOIN tags t32 ON t32.id_headers = hd.id_headers \n" +
//                "    AND (t32.tagName LIKE '%mf32a_amount%' OR t32.tagName LIKE '%mf62f_amount%' OR t32.tagName LIKE '%mf62m_amount%' OR t32.tagName LIKE '%mf32b_amount%')\n" +
//                "LEFT JOIN tags_mx mx ON mx.id_headers = hd.id_headers WHERE "
//                + where.toString() + " ORDER BY tanggal DESC";
        String sql = "SELECT DISTINCT \n"
                + "    hd.id_headers, \n"
                + "    hd.messageType,\n"
                + "    hd.logicalTerminal,\n"
                + "    hd.io_type,\n"
                + "    hd.receiverAddress,\n"
                + "    hd.tanggal,\n"
                + "    hd.flag, \n"
                + "    COALESCE('20' || SUBSTRING(t32d.detail FROM 1 FOR 2) || '-' ||\n"
                + "                    SUBSTRING(t32d.detail FROM 3 FOR 2) || '-' ||\n"
                + "                    RIGHT(t32d.detail, 2), '') AS vdate,\n"
                + "\n"
                + "    -- REF --\n"
                + "    COALESCE(\n"
                + "        t20.detail, \n"
                + "        COALESCE(mx.json_tag #>> '{fiToFICstmrCdtTrf,cdtTrfTxInf,0,pmtId,instrId}', -- pacs.008\n"
                + "        COALESCE(mx.json_tag #>> '{pmtRtr,grpHdr,msgId}', -- pacs.004\n"
                + "        COALESCE(mx.json_tag #>> '{fiCdtTrf,cdtTrfTxInf,0,pmtId,instrId}', -- pacs.009\n"
                + "        COALESCE(mx.json_tag #>> '{rsltnOfInvstgtn,assgnmt,id}', -- camt.029\n"
                + "        COALESCE(mx.json_tag #>> '{bkToCstmrAcctRpt,rpt,0,id}', -- camt.052\n"
                + "        COALESCE(mx.json_tag #>> '{bkToCstmrStmt,stmt,0,id}', -- camt.053\n"
                + "        COALESCE(mx.json_tag #>> '{fiToFIPmtCxlReq,undrlyg,0,txInf,0,_case,id}', -- camt.056\n"
                + "        COALESCE(mx.json_tag #>> '{fiToFIPmtCxlReq,assgnmt,id}', -- camt.056\n"
                + "        COALESCE(mx.json_tag #>> '{fiToFIPmtStsRpt,grpHdr,msgId}',\n"
                + "        COALESCE(mx.json_tag #>> '{ntfctnToRcv,ntfctn,id}',\n"
                + "        COALESCE(mx.json_tag #>> '{ntfctnToRcv,grpHdr,msgId}',\n"
                + "                 mx.json_tag #>> '{cstmrPmtCxlReq,assgnmt,id}'\n"
                + "        )))))))))))) as ref,\n"
                + "\n"
                + "    -- Currency\n"
                + "    COALESCE(\n"
                + "        t32c.detail, \n"
                + "        COALESCE(mx.json_tag #>> '{fiToFICstmrCdtTrf,cdtTrfTxInf,0,intrBkSttlmAmt,ccy}', -- pacs.008\n"
                + "        COALESCE(mx.json_tag #>> '{pmtRtr,txInf,0,rtrdIntrBkSttlmAmt,ccy}',  -- pacs.004\n"
                + "                 mx.json_tag #>> '{fiCdtTrf,cdtTrfTxInf,0,intrBkSttlmAmt,ccy}'  -- pacs.009\n"
                + "        ))\n"
                + "    ) as curr,\n"
                + "\n"
                + "    -- Amount\n"
                + "    COALESCE(\n"
                + "        t32.detail, \n"
                + "        COALESCE(mx.json_tag #>> '{fiToFICstmrCdtTrf,cdtTrfTxInf,0,intrBkSttlmAmt,value}', -- pacs.008\n"
                + "        COALESCE(mx.json_tag #>> '{pmtRtr,txInf,0,rtrdIntrBkSttlmAmt,value}', -- pacs.004\n"
                + "                 mx.json_tag #>> '{fiCdtTrf,cdtTrfTxInf,0,intrBkSttlmAmt,value}' -- pacs.009\n"
                + "        ))\n"
                + "    ) as amount,\n"
                + "\n"
                + "    hd.source\n"
                + "\n"
                + "FROM headers as hd \n"
                + "\n"
                + "LEFT JOIN tags t20 ON t20.id_headers = hd.id_headers AND t20.tag = '20'\n"
                + "\n"
                + "LEFT JOIN tags t32c ON t32c.id_headers = hd.id_headers \n"
                + "    AND (t32c.tagName LIKE '%mf32a_currency%' OR t32c.tagName LIKE '%mf62f_currency%' OR t32c.tagName LIKE '%mf62m_currency%' OR t32c.tagName LIKE '%mf32b_currency%') \n"
                + "\n"
                + "LEFT JOIN tags t32d ON t32d.id_headers = hd.id_headers \n"
                + "    AND (t32d.tagName LIKE '%mf32a_date%' OR t32d.tagName LIKE '%mf62f_date%' OR t32d.tagName LIKE '%mf62m_date%' OR t32d.tagName LIKE '%mf32a_value_date%') \n"
                + "\n"
                + "LEFT JOIN tags t32 ON t32.id_headers = hd.id_headers \n"
                + "    AND (t32.tagName LIKE '%mf32a_amount%' OR t32.tagName LIKE '%mf62f_amount%' OR t32.tagName LIKE '%mf62m_amount%' OR t32.tagName LIKE '%mf32b_amount%')\n"
                + "\n"
                + "LEFT JOIN tags_mx mx ON mx.id_headers = hd.id_headers \n"
                + "WHERE " + where.toString() + " ORDER BY tanggal DESC;";
//            System.out.println(sql);
        PreparedStatement st = this.conn.prepareStatement(sql);

        // set parameters ke prepared statement
        for (int i = 0; i < params.size(); i++) {
            Object param = params.get(i);
            if (param instanceof String) {
                st.setString(i + 1, (String) param);
            } else if (param instanceof java.sql.Date) {
                st.setDate(i + 1, (java.sql.Date) param);
            } else if (param instanceof java.sql.Timestamp) {
                st.setTimestamp(i + 1, (java.sql.Timestamp) param);
            } else {
                st.setObject(i + 1, param);
            }
        }

        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Header header = new Header();
            header.setMessageType(rs.getString(2));
            if (rs.getString(4).equalsIgnoreCase("O")) {
                header.setLogicalTerminal(rs.getString(5));
                header.setReceiverAddress(rs.getString(3));
            } else {
                header.setLogicalTerminal(rs.getString(3));
                header.setReceiverAddress(rs.getString(5));
            }
            header.setIo_type(rs.getString(4));
            header.setTanggal(rs.getString(6));
            header.setFlag(rs.getString(7));
            header.setId_headers(rs.getInt(1));
            header.setTag20(rs.getString("ref"));
            header.setTag32Date(rs.getString("vdate"));
            header.setTag32Currency(rs.getString("curr"));
            header.setTag32Amount(rs.getString("amount"));
            header.setSource(rs.getString("source"));

            headers.add(header);
        }
        return headers;
    }
}
