/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.dbase;

import com.vensys.appcm.controller.CreateText;
import com.vensys.appcm.controller.CreateTextNew;
import java.math.BigDecimal;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataCharges;
import com.vensys.appcm.model.DataHeaderTransaksi;
import com.vensys.appcm.model.DataInvestigation;
import com.vensys.appcm.model.DataNostro;
import com.vensys.appcm.model.DataSequence;
import com.vensys.appcm.model.DataSwiftLimit;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.TagDB;
import com.prowidesoftware.swift.model.mx.AbstractMX;
import com.prowidesoftware.swift.model.mx.MxPacs00800108;
import com.prowidesoftware.swift.model.mx.MxWriteConfiguration;
import com.vensys.appcm.model.EssentialsFieldPacs0080108;
import com.vensys.appcm.myutils.CostumerHelper;
import java.sql.Timestamp;
import org.apache.log4j.Logger;
import org.postgresql.util.PSQLException;

/**
 *
 * @author M Abdul Hadi
 */
public class DBDataTransaksiOutgoing {

    Connection conn;
//    String id = "1";
//    String jumlah = "1";

    public DBDataTransaksiOutgoing(Connection conn) {
        this.conn = conn;
    }

    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    Logger log = Logger.getLogger(getClass().getName());

    public int id_headers() {
        int id = 0;
        try {
            String sql = "SELECT max(id_headers) as id_headers from headers;";
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = Integer.parseInt(rs.getString("id_headers"));
            }

        } catch (Exception e) {
            log.error("ID : " + e);
        }
        return id;
    }

    public String addDataTransaksiOutgoing(DataHeaderTransaksi data, String user_id, String ip_access, String comp_name, String channel, String reference) {
        String header = "";
        // Mendapatkan string format tanggal dan Timestamp secara langsung
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String timestampString = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);
        try {
            String sql = "INSERT INTO headers(applicationId, serviceId, logicalTerminal, sessionNumber, sequenceNumber, io_type, messageType, receiverAddress, messagePriority, deliveryMonitoring, obsolescencePeriod, bankingPriority, mur, komentar, tanggal,flag, userEdit, templateName, flagTemplate, senderInputTime, MIRDate, MIRLogicalTerminal, MIRSessionNumber, MIRSequenceNumber, receiverOutputDate, receiverOutputTime, block3, userEntry, networktype, source) \n"
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) \n"
                    + "RETURNING id_headers;";
            PreparedStatement st = this.conn.prepareStatement(sql);

            st.setString(1, "F"); //app id
            st.setString(2, "01"); //service id
            st.setString(3, data.getSender_logical_terminal()); //logical terminal
            st.setString(4, "0000"); //session number 
            st.setString(5, "000000"); //seq number
            st.setString(6, "I"); // io type
            st.setString(7, data.getMessageType()); // MT 
            st.setString(8, data.getReceiver_institution());// receiver address 
            st.setString(9, data.getPriority()); //message priority
            st.setString(10, data.getMonitoring()); // delivery monitoring
            st.setString(11, ""); //obsolescence period
            st.setString(12, data.getBanking_priority()); //banking priority
            st.setString(13, data.getMur()); // mur
            st.setString(14, data.getOperator_comment()); //komentar
            st.setTimestamp(15, timestamp); //tanggal
            if (data.getFlag().isEmpty() || data.getFlag() == null || data.getFlag().equalsIgnoreCase("")) {
                st.setString(16, "MOD"); //flag
            } else {
                st.setString(16, data.getFlag()); //flag
            }
            st.setString(17, "SRC:MANUAL"); //user edit 
            st.setString(18, ""); //template name 
            st.setInt(19, 0); //flag template 
            st.setString(20, ""); //sender input name 
            st.setString(21, ""); //MIR date
            st.setString(22, ""); //MIR logical terminal
            st.setString(23, ""); //MIR session number
            st.setString(24, ""); //MIR sequence number
            st.setString(25, ""); //receiver output date
            st.setString(26, ""); //receiver output time 
            st.setString(27, data.getBlock3()); // block 3 
            st.setString(28, "SRC:MANUAL"); //user entry
            st.setString(29, data.getNetworkType()); //networktype
            st.setString(30, channel);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                header = rs.getString("id_headers");
            }
        } catch (SQLException e) {
            log.error("SQLState: " + e.getSQLState());
            log.error("Error Code: " + e.getErrorCode());
            log.error("Message: " + e.getMessage());
            e.printStackTrace();
        }

        addDataHeaderStatus("VER", user_id, ip_access, comp_name);
        evl.insertDataEvent(user_id, "Membuat transaksi baru "+data.getMessageType()+" "+reference, ip_access, comp_name);
        evl.updateLogUser(user_id, "trx", timestampString);
        return header;
    }
    
    public boolean tagsExists(int id_headers) {
        try {
            String selectSql = "SELECT id_headers FROM tags WHERE id_headers = ? LIMIT 1";
            PreparedStatement selectSt = this.conn.prepareStatement(selectSql);
            selectSt.setInt(1, id_headers);
            try (ResultSet rs = selectSt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            log.info("tagsExists:" + e.getMessage());
            log.error("tagsExists:" + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean tagsMxExists (int id_headers) {
        try {
            String sql = "SELECT id_headers FROM tags_mx WHERE id_headers = ? LIMIT 1";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id_headers);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            log.info("tagsMxExists: " + e.getMessage());
            log.error("tagsMxExists: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean tags20Exists(int id_headers) {
        try {
            String selectSql = "SELECT id_headers FROM tags WHERE id_headers = ? and tag='20' LIMIT 1";
            PreparedStatement selectSt = this.conn.prepareStatement(selectSql);
            selectSt.setInt(1, id_headers);
            try (ResultSet rs = selectSt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            log.info("tagsExists:" + e.getMessage());
            log.error("tagsExists:" + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    public String getFlagFromQueue(String messType) throws SQLException, Exception {
        log.info("masuk getFlagFromQueue();");
        String flag = "MOD";
        
        try {
            String sql = "SELECT queue FROM mt_details WHERE mt = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, messType);
            
            ResultSet rs = st.executeQuery();
            
            while(rs.next()) {
                if (rs.getString("queue").equals("1")) {
                    flag = "MOD";
                } else if (rs.getString("queue").equals("2")) {
                    flag = "VER";
                } else if (rs.getString("queue").equals("3")) {
                    flag = "AUTH";
                } else {
                    flag = "MOD";
                }
            }
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            e.printStackTrace();
        }
        return flag;
    }

//    }
    public void updateDataTransaksiOutgoing(DataHeaderTransaksi data, String flag, String user_id, Integer id_headers, String ip_access, String comp_name) throws SQLException, Exception {
        log.info("updateDataTransaksiOutgoing");
//        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        try {
            String sql = "UPDATE headers SET applicationId=?,serviceId=?,logicalTerminal=?,"
                    + "sessionNumber=?,sequenceNumber=?,io_type=?,messageType=?,receiverAddress=?,messagePriority=?,"
                    + "deliveryMonitoring=?,obsolescencePeriod=?,bankingPriority=?,mur=?,komentar=?,"
                    + "flag=?,userEdit=?,flagTemplate=?,senderInputTime=?,MIRDate=?,"
                    + "MIRLogicalTerminal=?,MIRSessionNumber=?,MIRSequenceNumber=?,receiverOutputDate=?,"
                    + "receiverOutputTime=?,block3=? WHERE id_headers=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, "F");   //applicationId/
            st.setString(2, "01");  //serviceId/
            st.setString(3, data.getSender_logical_terminal());  //logicalTerminal/
            st.setString(4, "0000");    //sessionNumber/
            st.setString(5, "000000");    //sequenceNumber/
            st.setString(6, "I");   //io_type/
            st.setString(7, data.getMessageType());  //messageType/
            st.setString(8, data.getReceiver_institution()); //receiverAddress/

            st.setString(9, data.getPriority());   //messagePriority/
            st.setString(10, data.getMonitoring());   //deliveryMonitoring/
            st.setString(11, "");   //obsolescencePeriod/
            st.setString(12, data.getBanking_priority()); //bankingPriority/
            st.setString(13, data.getMur()); //mur/

            st.setString(14, data.getOperator_comment());   //komentar/
            st.setString(15, flag);  //flag/
            st.setString(16, user_id);   //userEdit/
            
//            st.setString(15, "SRC:MANUAL");   //userEntry/
            

//            st.setString(17, "");   //templateName//
            st.setInt(17, 0);   //flagTemplate//
            st.setString(18, "");   //senderInputTime//
            st.setString(19, "");   //MIRDate//
            st.setString(20, "");   //MIRLogicalTerminal//

            st.setString(21, "");   //MIRSessionNumber//
            st.setString(22, "");   //MIRSequenceNumber//
            st.setString(23, "");   //receiverOutputDate//
            st.setString(24, "");   //receiverOutputTime//
            st.setString(25, data.getBlock3());   //block3/
            st.setInt(26, id_headers);
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            log.error(e.getLocalizedMessage());
            e.printStackTrace();
        }
        updateDataHeaderStatus("UPDATE", id_headers, user_id, ip_access, comp_name);
    }

    public void updateCommentMod(String komentar, String flag, String user_id, Integer id_headers, String ip_access, String comp_name, String flag_prev) throws SQLException, Exception {
        log.info("updateCommentMod");
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
//            String sql = "UPDATE headers SET komentar=?, flag=?, isDuplicate=0 WHERE id_headers=? AND flag=?";
            String sql = "UPDATE headers SET flag=?, isDuplicate=0 WHERE id_headers=? AND flag=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
//            st.setString(1, komentar);   //komentar/
            st.setString(1, flag);  //flag/
            st.setInt(2, id_headers);   //id_headers/
            st.setString(3, flag_prev);
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        updateDataHeaderStatus("UPDATE", tanggal_transaksi, id_headers, user_id, ip_access, comp_name);
    }

    public void moveJournalHistory(String req) {  // 20180417 penambahan untuk memindahkan jurnal history
        try {
            String sql = "INSERT INTO bak_journal_history (request,datetime) "
                    + "SELECT request,datetime FROM journal_history WHERE request=? ";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, req);
            st.executeUpdate();
            sql = "DELETE FROM journal_history WHERE request='" + req + "'";
            st = this.conn.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            log.error("Error moveJournalHistory : " + e.toString());
        }
    }
    
    /**
     * methodoverload untuk updateStatusTransaksiOutgoing
     * @param flag
     * @param id_headers
     * @param flagStatus
     * @param user_id
     * @param ip_access
     * @param comp_name
     * @param io_type
     * @throws SQLException
     * @throws Exception 
     */
    public void updateStatusTransaksiOutgoing(String channel, String flag, Integer id_headers, String flagStatus, String user_id, String ip_access, String comp_name, String io_type) throws SQLException, Exception {
        updateStatusTransaksiOutgoing(channel, flag, id_headers,flagStatus,user_id,ip_access,comp_name,io_type,"MT");
    }

    /**
     * 
     * @param flag
     * @param id_headers
     * @param flagStatus
     * @param user_id
     * @param ip_access
     * @param comp_name
     * @param io_type
     * @param networkType
     * @throws SQLException
     * @throws Exception 
     */
    public void updateStatusTransaksiOutgoing(String getChannel, String flag, Integer id_headers, String flagStatus, String user_id, String ip_access, String comp_name, String io_type, String networkType) throws SQLException, Exception {
//        boolean TEXT = false;
        boolean AUTH = false;
        String flag_before = "";
        if (flag.equalsIgnoreCase("MOD")) {
            log.info("flag mod 214");
            // ditambahnkan NACK untuk meMod trx yang NACK 16 Sept 2015
            flag_before = " AND (flag='VER' or flag = 'NACK') ";
        } else if (flag.equalsIgnoreCase("VER")) {
            flag_before = " AND flag='MOD'";
        } else if (flag.equalsIgnoreCase("AUTH")) {
            log.info("flagnya auth 220");
            flag_before = " AND (flag='VER' or flag='CVT-VER' or flag='DUPL-CNF')";
        } else if (flag.equalsIgnoreCase("TEXT")) {
            flag_before = " AND flag='AUTH'";
        } // diubah menjadi INC-WAIT setelah save data nasabah 20180413
        else if (flag.equalsIgnoreCase("INC-WAIT")) {
            flag_before = " AND (flag='INC-NOK' or flag='INC-HOLD' or flag='INC-ADJ')";
        } // untuk approve incoming OK dari wait
        else if (flag.equalsIgnoreCase("INC-OK")) {
            flag_before = " AND flag='INC-WAIT'";
        }// penmabahn untuk resend ACK 17 april 2018
        else if (flag.equalsIgnoreCase("RACK")) {
            flag_before = " AND flag='ACK'";
        } // penmabahn untuk resend inc-ok 17 april 2018
        else if (flag.equalsIgnoreCase("INC-ROK")) {
            flag_before = " AND flag='INC-OK'";
        } else if (flag.equalsIgnoreCase("INC-SPOK")) {
            flag_before = " AND flag='INC-SPRT'";
        } else if (flag.equalsIgnoreCase("INC-NSTP")) {
            flag_before = " AND (flag='INC-SPRT' or flag='INC-WAIT' or flag='INC-ADJ' or flag='INC-OK')";
        } else if (flag.equalsIgnoreCase("INC-STL")) {
            flag_before = " AND (flag='INC-WAIT' or flag = 'INC-NOK' or flag = 'INC-OK' or flag = 'INC-INV' or flag='INC-ADJ' or flag='INC-STLHOLD-CNF')";
        } else if (flag.equalsIgnoreCase("INC-RSTL")) {
            flag_before = " AND (flag='INC-STL')";
        } else if (flag.equalsIgnoreCase("INC-ADJ")) {
            flag_before = " AND (flag='INC-WAIT')";
        } else if (flag.equalsIgnoreCase("FIA-FAILED-CNF")) {
            flag_before = " AND (flag='FIA-FAILED')";
        }  else if (flag.equalsIgnoreCase("FIA-RESEND")) {
            flag_before = " AND (flag='FIA-FAILED-CNF' or flag='FIA-RESEND')";
        }  else if (flag.equalsIgnoreCase("AML-RESEND")) {
            flag_before = " AND (flag='AML-FAILED-CNF')";
        }  else if (flag.equalsIgnoreCase("WAITING-SAA-RESEND")) {
            flag_before = " AND (flag='WAITING-SAA-CNF')";
        }  else if (flag.equalsIgnoreCase("DDA-RESEND")) {
            flag_before = " AND (flag='DDA-FAILED-CNF')";
        }  else if (flag.equalsIgnoreCase("INTEL-RESEND")) {
            flag_before = " AND (flag='INTEL-FAILED-CNF')";
        }  else if (flag.equalsIgnoreCase("REM-RESEND")) {
            flag_before = " AND (flag='REM-FAILED-CNF')";
        }  else if (flag.equalsIgnoreCase("CVT-VER-RESEND")) {
            flag_before = " AND (flag='CVT-VER')";            
        }  else if (flag.equalsIgnoreCase("DUPL-CNF")) {
            flag_before = " AND (flag='DUPL')";
        }  else if (flag.equalsIgnoreCase("DUPL-RESEND")) {
            flag_before = " AND (flag='DUPL-CNF')";
        }
        
      
//        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
//            String sql = "UPDATE headers SET flag=?,isDuplicate=0,tanggal=LOCALTIMESTAMP WHERE id_headers=?";
            String sql = "UPDATE headers SET flag=?,isDuplicate=0 WHERE id_headers=?";
            sql += flag_before;
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, flag);  //flag/
//            st.setString(2, tanggal_transaksi);   //id_headers/
            st.setInt(2, id_headers);   //id_headers/
            if (st.executeUpdate() > 0) {
                AUTH = true;
//                TEXT = true;
            }
//            System.out.println(st);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        updateDataHeaderStatus(flag, id_headers, user_id, ip_access, comp_name);
        // penmabahn unutk force inc-OK ' || (flag.equalsIgnoreCase("INC-OK") && flagStatus.equalsIgnoreCase("INC-NOK"))' 16 sept 2015
        // INC-NOK diubah menjadi INC-WAIT 20180413
        if (
            (flag.equalsIgnoreCase("AUTH") && AUTH) || 
            (flag.equalsIgnoreCase("TEXT") && flagStatus.equalsIgnoreCase("AUTH")) || 
            (flag.equalsIgnoreCase("INC-STL") && AUTH) || 
            (flag.equalsIgnoreCase("INC-SPOK") && AUTH) || 
            (flag.equalsIgnoreCase("INC-RSTL") && AUTH) || 
            (flag.equalsIgnoreCase("FIA-RESEND") && AUTH) ||
            (flag.equalsIgnoreCase("AML-RESEND") && AUTH) ||
            (flag.equalsIgnoreCase("WAITING-SAA-RESEND") && AUTH) ||
            (flag.equalsIgnoreCase("INTEL-RESEND") && AUTH) ||
            (flag.equalsIgnoreCase("REM-RESEND") && AUTH) ||
            (flag.equalsIgnoreCase("DDA-RESEND") && AUTH) ||
            (flag.equalsIgnoreCase("CVT-VER-RESEND") && AUTH) ||
            (flag.equalsIgnoreCase("INC-RESEND") && AUTH) ||
            (flag.equalsIgnoreCase("INC-RESEND") && AUTH) ||
            (flag.equalsIgnoreCase("INC-AML-RESEND") && AUTH) ||
            (flag.equalsIgnoreCase("INC-CVT-RESEND") && AUTH) ||
            (flag.equalsIgnoreCase("DUPL-RESEND")) && AUTH
            ) {
            CreateText ct = new CreateText(conn);
            
            // Harus mengetahui dulu apakah MX atau MT
            if (networkType.contains("pacs") || networkType.contains("camt")) {
                log.info("STL MX for id_headers "+id_headers);
                
                // get json
                var mapHeadAmdBody = getJSONMXandHeaderSaa(id_headers);
                var body = mapHeadAmdBody.get("body");
                var head = mapHeadAmdBody.get("header");
                String channel = mapHeadAmdBody.get("channel");
//                System.out.println("Body JSON "+body);
                
                // merubah json ke object prowide
                var bodyMessage = AbstractMX.fromJson(body);
                var variant = bodyMessage.getMxId().id();
                
                Map<String, String> finalMX = getMxTextById(id_headers.toString());
                
                log.info("Version : "+variant);
                
               var fullMessage = CostumerHelper.joinHeadersAndBodyMX(variant.toLowerCase(), body, head);
                
//                System.out.println(finalMX.get("final_mx"));
                ct.createTextFileMX(getChannel, fullMessage,variant,id_headers, "I", channel, flag, user_id, ip_access, comp_name);
                
            } else {
                log.info("STL MT for id_headers "+id_headers);
                
    //            CreateTextNew ctn = new CreateTextNew(conn);
                ct.getFinalMT(getChannel, id_headers, io_type, flag, user_id, ip_access, comp_name);
            }
        }
    }
    
    
    public Map<String,String> getJSONMXandHeaderSaa(int idHeaders){
        log.info("Get Body MX and Header SAA");
        String sql = "SELECT json_tag::varchar, header_saa, h.source AS channel FROM tags_mx LEFT JOIN headers h ON h.id_headers = tags_mx.id_headers WHERE tags_mx.id_headers = ?";
        
        var data = new HashMap<String,String>();
        
        try {
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, idHeaders);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()){
                data.put("body", rs.getString("json_tag"));
                data.put("header", rs.getString("header_saa"));
                data.put("source", rs.getString("channel"));
                
                // return true
                return data;
            }
        }
        catch (Exception ex){
            log.error(ex.getLocalizedMessage());
            ex.printStackTrace();
        }
        
        return null;
        
        
    }

    public void updateSpecialRate(BigDecimal rate, Integer id_headers, String flag, String user_id, String ip_access, String comp_name, String branch, BigDecimal multi_rate) throws SQLException, Exception {
        String flag_before = "";
        if (flag.equalsIgnoreCase("INC-SPRT")) {
            flag_before = " AND flag='INC-NSTP'";
        }
        try {
//            String sql = "UPDATE headers SET flag=?,special_rate=?,tanggal=LOCALTIMESTAMP,branch=?,special_rate_multi=? WHERE id_headers=?";
            String sql = "UPDATE headers SET flag=?,special_rate=?,branch=?,special_rate_multi=? WHERE id_headers=?";
            sql += flag_before;
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, flag);
            st.setBigDecimal(2, rate);
            st.setString(3, branch);
            st.setBigDecimal(4, multi_rate);
            st.setInt(5, id_headers);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        updateDataHeaderStatus(flag, id_headers, user_id, ip_access, comp_name);
    }

//    public void updateSpecialRateCust(BigDecimal rate, Integer id_headers, String flag, String user_id, String ip_access, String comp_name, String branch) throws SQLException, Exception {
//        String flag_before = "";
//        if (flag.equalsIgnoreCase("INC-SPRT")) {
//            flag_before = " AND flag='INC-NSTP'";
//        }
//        try {
//            String sql = "UPDATE headers SET flag=?,special_rate_cust=?,tanggal=LOCALTIMESTAMP,branch=? WHERE id_headers=?";
//            sql += flag_before;
//            PreparedStatement st = this.conn.prepareStatement(sql);
//            st.setString(1, flag);
//            st.setBigDecimal(2, rate);
//            st.setString(3, branch);
//            st.setInt(4, id_headers);
//            st.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        updateDataHeaderStatus(flag, id_headers, user_id, ip_access, comp_name);
//    }
    public void updateIncSPRT(Integer id_headers, String flag, String user_id, String ip_access, String comp_name, String branch) throws SQLException, Exception {
        String flag_before = "";
        if (flag.equalsIgnoreCase("INC-SPRT")) {
            flag_before = " AND flag='INC-NSTP'";
        }
        try {
//            String sql = "UPDATE headers SET flag=?,tanggal=LOCALTIMESTAMP,branch=? WHERE id_headers=?";
            String sql = "UPDATE headers SET flag=?,branch=? WHERE id_headers=?";
            sql += flag_before;
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, flag);
            st.setString(2, branch);
            st.setInt(3, id_headers);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        updateDataHeaderStatus(flag, id_headers, user_id, ip_access, comp_name);
    }

    public void createReturTransaksiOutgoing(String flag, Integer id_headers, String flagStatus, String user_id, String ip_access, String comp_name) throws SQLException, Exception {
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "UPDATE headers SET flag=? WHERE id_headers=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, flag);  //flag/
            st.setInt(2, id_headers);   //id_headers/
            st.executeUpdate();
            log.info("benderanya " + flag);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(user_id, "Meretur transaksi", ip_access, comp_name);
        evl.updateLogUser(user_id, "trx", tanggal);
        updateDataHeaderStatus(flag, id_headers, user_id, ip_access, comp_name);
    }

    public void createReturTransaksiOutgoing(String flag, Integer id_headers, String branch, String noFT) throws SQLException, Exception {
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "UPDATE headers SET flag=?, branch=?, noFT=? WHERE id_headers=? AND flag = 'INC-CRDT'";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, flag);  //flag/
            st.setString(2, branch);
            st.setString(3, noFT);
            st.setInt(4, id_headers);   //id_headers/
            st.executeUpdate();
//            System.out.println(st);
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        updateDataHeaderStatus(flag, tanggal_transaksi, id_headers, user_id, ip_access, comp_name);
    }

    public Header getHeaderById(String headerId) throws SQLException {
        Header header = new Header();
        String sql = "SELECT logicalTerminal, messageType, receiverAddress, messagePriority, "
                + "deliveryMonitoring, bankingPriority, mur, komentar, block3, flag, io_type, sessionNumber, "
                + "sequenceNumber, COALESCE(networkType, 'MT') AS networkType, komentar, tanggal, "
                + "senderInputTime, MIRLogicalTerminal, receiverOutputDate, receiverOutputTime, source "
                + "FROM headers WHERE id_headers = ?";

//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, Integer.parseInt(headerId));
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            header.setLogicalTerminal(rs.getString(1));
            header.setMessageType(rs.getString(2));
            header.setReceiverAddress(rs.getString(3));
            header.setMessagePriority(rs.getString(4));
            header.setDeliveryMonitoring(rs.getString(5));
            header.setBankingPriority(rs.getString(6));
            header.setMur(rs.getString(7));
            header.setKomentar(rs.getString(8));
            header.setBlock3(rs.getString(9));
            header.setFlag(rs.getString(10));
            header.setIo_type(rs.getString(11));
            header.setSessionNumber(rs.getString(12));
            header.setSequenceNumber(rs.getString(13));
            header.setNetworktype(rs.getString(14));//20231227 ditambah ini
            header.setKomentar(rs.getString("komentar"));
            header.setTanggal(rs.getString("tanggal"));
            header.setSenderInputTime(rs.getString("senderInputTime"));
            header.setMIRLogicalTerminal(rs.getString("MIRLogicalTerminal"));
            header.setReceiverOutputDate(rs.getString("receiverOutputDate"));
            header.setReceiverOutputTime(rs.getString("receiverOutputTime"));
            header.setStatus_header(rs.getString("source"));
        }
        return header;
    }

    public List<TagDB> getAllTagById(String headerId) throws Exception {
        List<TagDB> tags = new ArrayList<TagDB>();
        String sql = "SELECT urutan,tag,detail,tagName,info FROM tags WHERE id_headers=?";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, headerId);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            TagDB tag = new TagDB();
            tag.setUrutan(rs.getInt(1));
            tag.setTag(rs.getString(2));
            tag.setDetail(rs.getString(3));
            tag.setTagName(rs.getString(4));
            tag.setInfo(rs.getString(5));
            tags.add(tag);
        }
        return tags;
    }

    public void updateStatusDuplicate(Integer id_headers, String userId, String ipAccess, String compName, String comment) {
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
//        String sql = "UPDATE headers SET flag='REJECT',isDuplicate=2,komentar=? WHERE id_headers=? AND flag NOT IN ('INC-STL', 'INC-CRDT', 'ACK', 'INC-CNF', 'INC-SPOK') ";
//        String sql = "UPDATE headers SET flag='REJECT',isDuplicate=2, tanggal = LOCALTIMESTAMP WHERE id_headers=? AND flag NOT IN ('INC-STL', 'INC-CRDT', 'ACK', 'INC-CNF', 'INC-SPOK') ";
        String sql = "UPDATE headers SET flag='REJECT',isDuplicate=2 WHERE id_headers=? AND flag NOT IN ('INC-STL', 'INC-CRDT', 'ACK', 'INC-CNF', 'INC-SPOK') ";
        try {
            PreparedStatement st = this.conn.prepareStatement(sql);
//            st.setString(1, comment);   //comment
            st.setInt(1, id_headers);   //id_headers/
            st.executeUpdate();
//            System.out.println(st);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(userId, "Reject transaksi", ipAccess, compName);
        evl.updateLogUser(userId, "trx", tanggal);
        updateDataHeaderStatus("REJECT", id_headers, userId, ipAccess, compName);
    }

    public void addDataHeaderStatus(String status_header, String user_login, String ip_access, String comp_name) {
        int id = id_headers();
        try {
            String sql = "INSERT INTO header_status(id_headers,status_header,status_tanggal,user_login,ip_access,comp_name) VALUES ('" + id + "',?,LOCALTIMESTAMP,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, status_header);
//            st.setString(2, status_tanggal);
            st.setString(2, user_login);
            st.setString(3, ip_access);
            st.setString(4, comp_name);
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateDataHeaderStatus(String status_header, Integer id_headers, String user_login, String ip_access, String comp_name) {
        log.info("updateDataHeaderStatus");
        log.info("statusHeader:"+status_header);
        try {
            String sql = "INSERT INTO header_status(id_headers,status_header,status_tanggal,user_login,ip_access,comp_name) VALUES (?,?,LOCALTIMESTAMP,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id_headers);
            st.setString(2, status_header);
//            st.setString(3, status_tanggal);
            st.setString(3, user_login);
            st.setString(4, ip_access);
            st.setString(5, comp_name);
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(user_login, "Update status transaksi menjadi " + status_header, ip_access, comp_name);
        evl.updateLogUser(user_login, "trx", tanggal);
    }

    public void addDataTag(int urutan, String tag, String detail, String tagName, int id) {
//        int id = id_headers();
        try {
            String sql = "INSERT INTO tags(urutan,id_headers,tag,detail,tagName,info) VALUES (?,?,?,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            
            st.setInt(1, urutan);
            st.setInt(2,id);
            st.setString(3, tag);
            st.setString(4, detail);
            st.setString(5, tagName);
            st.setString(6, "");
            // System.out.println("addDataTag : " + st.toString());
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addDataTag199(int urutan, String tag, String detail, String tagName) {
        int id = id_headers();
        try {
            String sql = "INSERT INTO tags(urutan,id_headers,tag,detail,tagName,info) VALUES (?,'" + id + "',?,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, urutan);
            st.setString(2, tag);
            st.setString(3, detail);
            st.setString(4, tagName);
            st.setString(5, "");
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String getSeqRetur(String tgl) throws SQLException {
        int i = 0;
        String j = "";
        String sql = "SELECT COUNT(*) AS jumlah FROM headers WHERE flag='INC-RTR' AND CAST(tanggal as DATE)='" + tgl + "'";
        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            i = rs.getInt(1);
        }
        i = i + 1;
        for (int k = 0; k < 3 - String.valueOf(i).length(); k++) {
            j += "0";
        }
        return j + String.valueOf(i);
    }

    public void cleanDataTag(int id_headers) {
        try {
            String sql = "DELETE FROM tags WHERE id_headers = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id_headers);
            st.executeUpdate();
        } catch (SQLException e) {
            log.info("Error Delete Tag:" + e.getMessage());
        }
    }
    public void cleanDataTrxDetail(int id_headers) {
        try {
            String sql = "DELETE FROM trx_detail WHERE id_headers = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id_headers);
            st.executeUpdate();
        } catch (SQLException e) {
            log.info("Error Delete trx_detail:" + e.getMessage());
        }
    }

    public void updateDataTag(int urutan, String tag, String detail, String tagName, int id_headers) {
        try {
            String sql = "UPDATE tags SET detail=? WHERE id_headers = ? AND tagName = ? AND detail = 'OUR'";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, detail);
            st.setInt(2, id_headers);
            st.setString(3, tagName);
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateDataTagCharges(String tag, String detail, String tagName, int id_headers) {
        try {
            String sql = "UPDATE tags SET detail=? WHERE id_headers = ? AND tagName like ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, detail);
            st.setInt(2, id_headers);
            st.setString(3, "%" + tagName);
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int cekDataTags(String id, String tags) {
        int rowID = 0;
//        System.out.println("tags : " + tags);
        try {
            String sql = "SELECT COUNT(*) AS cek FROM tags WHERE id_headers='" + id + "' AND tagName='" + tags + "'";
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                rowID = Integer.parseInt(rs.getString("cek"));
                //System.out.println(sql+" == "+rowID);
            }
        } catch (Exception es) {
            es.printStackTrace();
        }
        return rowID;
    }

    public void removeDataTagMT(String _id, String tag) {
        log.info("Update Tag:" + tag);
        try {
            String sql = "DELETE FROM tags WHERE id_headers='" + _id + "' AND tag='" + tag + "'";
            PreparedStatement st = this.conn.prepareStatement(sql);;
            st.executeUpdate();
        } catch (SQLException e) {
            log.info("Error Remove Tag MT" + e.getMessage());
        }
    }

    public void removeDataTag(int urutan, String _id, String tag, String tagName) {
        try {
            String sql = "DELETE FROM tags WHERE urutan='" + urutan + "' AND id_headers='" + _id + "' AND tag='" + tag + "' AND tagName='" + tagName + "'";
            PreparedStatement st = this.conn.prepareStatement(sql);;
            st.executeUpdate();
//            System.out.println("success remove : " + tag);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addDataTagsBeforeNoTags(int urutan, String id, String tagsKey, String tagValue, String tagName) {
        String info = "";
        try {
            String sql = "INSERT INTO tags (urutan,id_headers,tag,detail,tagName,info) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            try {
                st.setInt(1, urutan);  //count
                st.setInt(2, Integer.parseInt(id));  //id
                st.setString(3, tagsKey);  //tag
                st.setString(4, tagValue.trim());  //detail
                st.setString(5, tagName);  //tagName
                st.setString(6, info);  //info
                st.executeUpdate();
//                System.out.println("success add : " + tagsKey);
            } catch (SQLException e) {
                log.error("Error SQL MT: " + e.getMessage());
            }
        } catch (SQLException swl) {
            log.error("Error SQL MT: " + swl.getMessage());
        }
    }

    public void updateMTText(String data, int id) {
        log.info("updateMTText");
        try {
            String sql = "Update mt_text set final_mt=? WHERE id_headers=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data);
            st.setInt(2, id);
            st.executeUpdate();
            log.info("updateDataTransaksi() is successfully");
        } catch (SQLException e) {
            log.error("updateDataTransaksi():" + e.getMessage());
        }
    }

    public void addMTText(String data, int id) {
        log.info("addMTText");
        try {
            String sql = "INSERT INTO mt_text (id_headers,modify_mt,final_mt) VALUES (?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, data);
            st.setString(3, data);
            st.executeUpdate();
            log.info("addDataTransaksi() is successfully");
        } catch (SQLException e) {
            log.error("addDataTransaksi():" + e.getMessage());
        }
    }
    
    public int updateMXText(String xml, int id_headers) throws SQLException, Exception {
        log.info("masuk updateMXText();");
        int update = 0;
        try {
            String sql = "UPDATE mx_text set final_mx=? where id_headers=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, xml);
            st.setInt(2, id_headers);
            update = st.executeUpdate();
            log.info("update MX berhasil!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return update;
    }
    
    public int updateTagsMXText (String json, String headersaa, int id_headers) throws SQLException, Exception {
        int update = 0;
        try {
            String sql = "UPDATE tags_mx set json_tag=?::jsonb, header_saa=? where id_headers=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, json);
            st.setString(2, headersaa);
            st.setInt(3, id_headers);
            update = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return update;
    }
    
    public int updateFlagMX(String lt, String responder, String flag, String flag_before, int id_headers, String user_id, String ip_access, String comp_name) throws SQLException, Exception {
        int update = 0;
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "UPDATE headers set logicalTerminal=?, receiverAddress=?, flag=? where flag =? and id_headers=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, lt.toUpperCase());
            st.setString(2, responder.toUpperCase());
            st.setString(3, flag);
//            st.setTimestamp(3, new java.sql.Timestamp(new java.util.Date().getTime()));
            st.setString(4, flag_before);
            st.setInt(5, id_headers);
            update = st.executeUpdate();
            if (update > 0) {
                log.info("Update Flag to:" + flag);
                updateDataHeaderStatus(flag, tanggal_transaksi, id_headers, user_id, ip_access, comp_name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return update;
    }
    
    public int updateFlagAfterValidate(String flag, int id_headers, String user_id, String ip_access, String comp_name) {
        int update = 0;
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "UPDATE headers set flag=? where id_headers=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, flag);
//            st.setTimestamp(2, new java.sql.Timestamp(new java.util.Date().getTime()));
            st.setInt(2, id_headers);
            update = st.executeUpdate();
            if (update > 0) {
                log.info("Update Flag to:" + flag);
                updateDataHeaderStatus(flag, tanggal_transaksi, id_headers, user_id, ip_access, comp_name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return update;
    }
    
    public void updateDataHeaderStatus(String status_header, String status_tanggal, Integer id_headers, String user_login, String ip_access, String comp_name) {
        log.info("updateDataHeaderStatus");
        try {
            String sql = "INSERT INTO header_status(id_headers,status_header,status_tanggal,user_login,ip_access,comp_name) VALUES (?,?,?,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id_headers);
            st.setString(2, status_header);
            st.setString(3, status_tanggal);
            st.setString(4, user_login);
            st.setString(5, ip_access);
            st.setString(6, comp_name);
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(user_login, "Update status transaksi menjadi " + status_header, ip_access, comp_name);
        evl.updateLogUser(user_login, "trx", tanggal);
    }
    
    public void addMXText(String data, String id) {
        try {
            String sql = "INSERT INTO mx_text(id_headers, final_mx,modify_mx) VALUES (?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(id));
            st.setString(2, data);
            st.setString(3, data);
            st.executeUpdate();
        } catch (SQLException e) {
            log.error("Add data mx_text " + e.getMessage());
        }

    }
    
    public void addDataMXTag(String id, String json, String headerSaa) {
        try {
            String sql = "INSERT INTO tags_mx VALUES(?,?::jsonb,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(id));
            st.setString(2, json);
            st.setString(3, headerSaa);
            st.setString(4, "");
            st.executeUpdate();
            log.info("addDataMXTag success");
        } catch (SQLException e) {
//            e.printStackTrace();
            log.error("addDataTag():" + e.toString());
        }

    }
    
    public void clearTrxDetail (int id) {
        try {
            String sql = "DELETE FROM trx_detail WHERE id_headers = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            log.error("clearTrxDetail: " + e.getMessage());
        }
    }
    
    public void clearJsonTags (int id) {
        try {
            String sql = "DELETE FROM tags_mx WHERE id_headers = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            log.error("clearTags_MX: " + e.getMessage());
        }
    }
    
    public String getTagsMX (int id) {
        String json = "";
        try {
            String sql = "SELECT json_tag from tags_mx WHERE id_headers = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                json = rs.getString(1);
            }
//            System.out.println("json_tag: " + json);
        } catch (SQLException e) {
            log.error("Error getTagsMX: " + e.getMessage());
        }
        return json;
    }
    
    public Map<String, String> getBodyAnHeaderMXById(int id) {
        Map<String, String> data = new HashMap<String, String>();
        try {
            log.info("ID for get tags_MX " + id);
            String sql = "SELECT json_tag, header_saa FROM tags_mx WHERE id_headers=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                data.put("bodyMX", rs.getString("json_tag"));
                data.put("headerMX", rs.getString("header_saa"));
            }
        } catch (Exception e) {
            log.error("On class " + this.getClass().toString() + " function getBodyAnHeaderMXById():" + e.toString());
        }
        return data;
    }

    public void updateVerifiedAccount(String acc, String name) {
        try {
            name = name.replace("1/", "");
            name = name.replaceAll("2/.*", "");
            acc = acc.replaceAll("/", "");
            log.info("ACC=" + acc);
            log.info("Name=" + name);
            String sql = "UPDATE verified_account set verified = '1', verified_date=LOCALTIMESTAMP where acc = ? and \"nameFromTrx\"= ? ";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, acc);
            st.setString(2, name);
            st.executeUpdate();
        } catch (SQLException e) {
            // System.out.println("Error Update Verified Account 599: " + e.getMessage());
            log.error("Error Update Verified Account 599: " + e.getMessage());
        }
    }

    public String getVerifiedAccName(String acc) {
        String nama = "";
        try {
            acc = acc.replaceAll("/", "");
            String sql = "Select \"nameFromCore\" from verified_account where acc ='" + acc + "'";
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
//                nama = rs.getString("1");
                nama = rs.getString("nameFromCore");
            }
            // System.out.println("Nama wuer:" + nama);
        } catch (SQLException e) {
            // System.out.println("Error Select Verified Account by Acc: " + e.getMessage());
            log.info("Error Select Verified Account by Acc: " + e.getMessage());
        }
        return nama;
    }

    public String getTag59Account103(String id) {
        String rekening = "";
        try {
//            String sql = "Select detail from tags where id_headers='" + id + "' and tagName='_180_mf59_account'";
//20190923 ditambah or karena ada 59f
            String sql = "Select detail from tags where id_headers='" + id + "' and (tagName='_180_mf59_account' or tagName='_185_mf59f_account')";
            PreparedStatement st = this.conn.prepareStatement(sql);
            // System.out.println("sqlgetTag59Account103 : " + sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                rekening = rs.getString("detail");
            }
        } catch (SQLException e) {
            // System.out.println("Error Select Verified Account by id: " + e.getMessage());
            log.info("Error Select Verified Account by id: " + e.getMessage());
        }
        rekening = rekening.replace("/", "");
        return rekening;
    }

    //20190923 ditambah type untuk bedain 59 dan 59f
    public void updateTag59Name(int id_headers, String nama, String type) {
        String sql = "";
        try {
            if (type.equalsIgnoreCase("59")) {
                sql = "UPDATE tags SET detail=? WHERE tagName='_181_mf59_name_address' AND id_headers=?";
                if (nama.length() > 35) {
                    nama = nama.substring(0, 35) + "\r\n" + nama.substring(35);
                }
            } else {
                sql = "UPDATE tags SET detail=? WHERE tagName='_187_mf59f_details' AND id_headers=?";
                if (nama.length() > 33) {
                    nama = "1/" + nama.substring(0, 33) + "\r\n1/" + nama.substring(33);
                } else {
                    nama = "1/" + nama;
                }
            }
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, nama);  //message/
            st.setInt(2, id_headers);   //id_headers/
            st.executeUpdate();
            log.info("updateTag59AccName " + sql + "# " + nama + "# " + id_headers + "# " + type);
        } catch (SQLException e) {
            // System.out.println("Error Update Tag Name: " + e.getMessage());
            log.info("Error Update Tag Name: " + e.getMessage());
        }
    }

    public void updateTag59Acc(int id_headers, String nama, String type) {
        String sql = "";
        try {
            if (type.equalsIgnoreCase("59")) {
                sql = "UPDATE tags SET detail=? WHERE tagName='_180_mf59_account' AND id_headers=?";
            } else {
                sql = "UPDATE tags SET detail=? WHERE tagName='_185_mf59f_account' AND id_headers=?";
            }
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, nama);  //message/
            st.setInt(2, id_headers);   //id_headers/
            st.executeUpdate();
            log.info("updateTag59Acc " + sql + "# " + nama + "# " + id_headers + "# " + type);
        } catch (SQLException e) {
            // System.out.println("Error Update Tag Name: " + e.getMessage());
            log.info("Error Update Tag Name: " + e.getMessage());
        }
    }

    public String getType59(String acc, int id) {
        String type = "";
        try {
            String sql = "Select tag from tags where detail ='" + acc + "' and id_headers=" + id;
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                type = rs.getString(1);
            }
            // System.out.println("type :" + type);
        } catch (SQLException e) {
            // System.out.println("Error type by Acc: " + e.getMessage());
            log.info("Error type by Acc: " + e.getMessage());
        }
        return type;
    }

    public String getType71A(int id) {
        String type = "";
        try {
            String sql = "Select detail from tags where tag ='71A' and id_headers=" + id;
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                type = rs.getString(1);
            }
            // System.out.println("type :" + type);
        } catch (SQLException e) {
            // System.out.println("Error type by Acc: " + e.getMessage());
            log.info("Error type by Acc: " + e.getMessage());
        }
        return type;
    }

    public void updateTag59NameInfo(int id_headers, String nama, String type) {
        String sql = "";
        try {
            if (type.equalsIgnoreCase("59")) {
                sql = "UPDATE tags SET info=? WHERE tagName='_181_mf59_name_address' AND id_headers=?";
            } else {
                sql = "UPDATE tags SET info=? WHERE tagName='_187_mf59f_details' AND id_headers=?";
            }
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, nama);  //message/
            st.setInt(2, id_headers);   //id_headers/
            st.executeUpdate();
            log.info("updateTag59NameInfo " + sql + "# " + nama + "# " + id_headers + "# " + type);
        } catch (SQLException e) {
            // System.out.println("Error Update Tag Info: " + e.getMessage());
            log.info("Error Update Tag Info: " + e.getMessage());
        }
    }

    public void updateTag59AccInfo(int id_headers, String nama, String type) {
        String sql = "";
        try {
            if (type.equalsIgnoreCase("59")) {
                sql = "UPDATE tags SET info=? WHERE tagName='_180_mf59_account' AND id_headers=?";
            } else {
                sql = "UPDATE tags SET info=? WHERE tagName='_185_mf59f_account' AND id_headers=?";
            }
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, nama);  //message/
            st.setInt(2, id_headers);   //id_headers/
            st.executeUpdate();
            log.info("updateTag59AccInfo " + sql + "# " + nama + "# " + id_headers + "# " + type);
        } catch (SQLException e) {
            // System.out.println("Error Update Tag Info: " + e.getMessage());
            log.info("Error Update Tag Info: " + e.getMessage());
        }
    }

    public int addDataTransaksiInvestigasi(DataHeaderTransaksi data, String user_id, String ip_access, String comp_name) {
        log.info("addDataTransaksi");
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        int id_headers = 0;
        try {
            String sql = "INSERT INTO headers(applicationId, serviceId, logicalTerminal, "
                    + "sessionNumber, sequenceNumber, io_type, messageType, receiverAddress, messagePriority, "
                    + "deliveryMonitoring, obsolescencePeriod, bankingPriority, mur, komentar, tanggal, "
                    + "userEntry, flag, userEdit, templateName, flagTemplate, senderInputTime, MIRDate, "
                    + "MIRLogicalTerminal, MIRSessionNumber, MIRSequenceNumber, receiverOutputDate, "
                    + "receiverOutputTime, block3, networkType) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) "
                    + "RETURNING id_headers";

            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, "F");   //applicationId/
            st.setString(2, "01");  //serviceId/
            st.setString(3, data.getSender_logical_terminal());  //logicalTerminal/

            st.setString(4, "0000");    //sessionNumber/
            st.setString(5, "000000");    //sequenceNumber/
            st.setString(6, "I");   //io_type/
            st.setString(7, data.getMessageType());  //messageType/
            st.setString(8, data.getReceiver_institution()); //receiverAddress/

            st.setString(9, data.getPriority());   //messagePriority/
            st.setString(10, data.getMonitoring());   //deliveryMonitoring/
            st.setString(11, "");   //obsolescencePeriod/
            st.setString(12, data.getBanking_priority()); //bankingPriority/
            st.setString(13, data.getMur()); //mur/

            st.setString(14, data.getOperator_comment());   //komentar/
            st.setTimestamp(15, new java.sql.Timestamp(new java.util.Date().getTime()));    // tanggal
            st.setString(16, "SRC:MANUAL");   //userEntry/
            st.setString(17, "MOD");  //flag/
            st.setString(18, user_id);   //userEdit/

            st.setString(19, "");   //templateName//
            st.setInt(20, 0);   //flagTemplate//
            st.setString(21, "");   //senderInputTime//
            st.setString(22, "");   //MIRDate//
            st.setString(23, "");   //MIRLogicalTerminal//

            st.setString(24, "");   //MIRSessionNumber//
            st.setString(25, "");   //MIRSequenceNumber//
            st.setString(26, "");   //receiverOutputDate//
            st.setString(27, "");   //receiverOutputTime//
            st.setString(28, data.getBlock3());   //block3/
            st.setString(29, data.getNetworkType());

            // Debugging: log the full query with parameters
            log.info("Executing SQL: " + st.toString());

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                id_headers = rs.getInt("id_headers");
            }

            log.info("SQL executed successfully, id_headers=" + id_headers);
        } catch (SQLException e) {
            e.printStackTrace();
            log.error("SQL execution failed: " + e.getMessage());
        }

        addDataHeaderStatus("MOD", user_id, ip_access, comp_name);
        evl.insertDataEvent(user_id, "Membuat transaksi baru", ip_access, comp_name);
        evl.updateLogUser(user_id, "trx", tanggal_transaksi);
        return id_headers;
    }

    public void addDataTransaksiInvestigasi(DataHeaderTransaksi data) {
        log.info("addDataTransaksi");
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "INSERT INTO headers(applicationId, serviceId, logicalTerminal, "
                    + "sessionNumber, sequenceNumber, io_type, messageType, receiverAddress, messagePriority, "
                    + "deliveryMonitoring, obsolescencePeriod, bankingPriority, mur, komentar, tanggal, "
                    + "userEntry, flag, userEdit, templateName, flagTemplate, senderInputTime, MIRDate, "
                    + "MIRLogicalTerminal, MIRSessionNumber, MIRSequenceNumber, receiverOutputDate, "
                    + "receiverOutputTime, block3) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, "F");   // applicationId
            st.setString(2, "01");  // serviceId
            st.setString(3, data.getSender_logical_terminal());  // logicalTerminal

            st.setString(4, "0000");    // sessionNumber
            st.setString(5, "000000");  // sequenceNumber
            st.setString(6, "I");       // io_type
            st.setString(7, data.getMessageType());  // messageType
            st.setString(8, data.getReceiver_institution()); // receiverAddress

            st.setString(9, data.getPriority());     // messagePriority
            st.setString(10, data.getMonitoring());  // deliveryMonitoring
            st.setString(11, "");                    // obsolescencePeriod
            st.setString(12, data.getBanking_priority()); // bankingPriority
            st.setString(13, data.getMur());         // mur

            st.setString(14, data.getOperator_comment()); // komentar
            st.setString(15, tanggal_transaksi);         // tanggal
            st.setString(16, "SRC:MANUAL");              // userEntry
            st.setString(17, "AUTH");                    // flag
            st.setString(18, "");                        // userEdit

            st.setString(19, "");   // templateName
            st.setInt(20, 0);       // flagTemplate
            st.setString(21, "");   // senderInputTime
            st.setString(22, "");   // MIRDate
            st.setString(23, "");   // MIRLogicalTerminal

            st.setString(24, "");   // MIRSessionNumber
            st.setString(25, "");   // MIRSequenceNumber
            st.setString(26, "");   // receiverOutputDate
            st.setString(27, "");   // receiverOutputTime
            st.setString(28, data.getBlock3());   // block3

            // Log the prepared statement for debugging purposes
            log.info("Executing SQL: " + st.toString());

            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            log.error("SQL execution failed: " + e.getMessage());
        }
    }

    public void createDataInvestigasi(int id_headers, String user_id, String ip_access, String comp_name) {
        int id = id_headers();
//        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        try {
            String sql = "INSERT INTO investigation(id_headers,id_relation) "
                    + "VALUES (?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id_headers);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void createDataInvestigasi(int id_headers) {
        int id = id_headers();
//        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        try {
            String sql = "INSERT INTO investigation(id_headers,id_relation) "
                    + "VALUES (?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id_headers);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//    public DataInvestigation getDataInv(String id) throws SQLException {
//        DataInvestigation dataInv = new DataInvestigation();
//        String sql = "SELECT id_headers, id_relation, seq_num FROM investigation WHERE id_headers='" + id + "'";
//        System.out.println("sql=" + sql);
//        PreparedStatement st = this.conn.prepareStatement(sql);
//        ResultSet rs = st.executeQuery();
//        while (rs.next()) {
//            dataInv.setId_headers(rs.getInt(1));
//            dataInv.setId_relation(rs.getInt(2));
//            dataInv.setSeq_num(rs.getString(3));
//            log.info("seq num: " + rs.getString(3));
//        }
//        return dataInv;
//    }
//    public String getSeqInv(String tgl) throws SQLException {
//        int i = 0;
//        String j = "";
//        String sql = "SELECT max(CAST(seq_num AS INT)) FROM investigation as inv "
//                + "INNER JOIN headers hd on hd.id_headers = inv.id_relation "
//                + "WHERE CAST(tanggal as DATE)='" + tgl + "'";
//        System.out.println("sql=" + sql);
//        PreparedStatement st = this.conn.prepareStatement(sql);
//        ResultSet rs = st.executeQuery();
//        while (rs.next()) {
//            i = rs.getInt(1);
//        }
//        i = i + 1;
//        for (int k = 0; k < 3 - String.valueOf(i).length(); k++) {
//            j += "0";
//        }
//        System.out.println("seq inv:  " + j + String.valueOf(i));
//        return j + String.valueOf(i);
//    }
    public void updateSequence(String resetDate, String seq) throws ParseException {
        try {
//            String sql = "UPDATE [sequence] SET reset_seq_date = ?, seq_num = ? ";
            String sql = "UPDATE sequence SET reset_seq_date = ?, seq_num = ? ";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, resetDate);
            st.setString(2, seq);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//    public DataSequence getDataSeq(String id) throws SQLException {
//        DataSequence dataSeq = new DataSequence();
//        String sql = "SELECT id_headers, id_relation, seq_num, keterangan FROM [sequence] WHERE id_headers='" + id + "'";
//        System.out.println("sql=" + sql);
//        PreparedStatement st = this.conn.prepareStatement(sql);
//        ResultSet rs = st.executeQuery();
//        while (rs.next()) {
//            dataSeq.setId_headers(rs.getInt(1));
//            dataSeq.setId_relation(rs.getInt(2));
//            dataSeq.setSeq_num(rs.getString(3));
//        }
//        return dataSeq;
//    }
    public String getSeq() throws SQLException {
        String seq = "";
        String resetDate = "";
//        String sql = "SELECT seq_num, reset_seq_date FROM [sequence]";
        String sql = "SELECT seq_num, reset_seq_date FROM sequence";
        log.info("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            seq = rs.getString(1);
            resetDate = rs.getString(2);
        }
        log.info("seq : " + seq);
        return seq + '#' + resetDate;
    }

    public String get199InvDate(int id_headers) throws SQLException {
        String InvDate = "";
        String sql = "select status_tanggal from header_status where id_headers = '" + id_headers + "' and status_header = 'INC-INV' ";
        log.info("get199InvDate = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            InvDate = rs.getString(1);
        }
        log.info("InvDate : " + InvDate);
        return InvDate;
    }

    public DataCharges getCharges(String curr) throws SQLException {
        DataCharges dataSeq = new DataCharges();
        String sql = "SELECT id_charges, currency, charges FROM charges WHERE currency='" + curr + "'";
        // System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            dataSeq.setId_charges(rs.getInt(1));
            log.info("id charges: " + dataSeq.getId_charges());
            dataSeq.setCurrency(rs.getString(2));
            log.info("currency: " + dataSeq.getCurrency());
            dataSeq.setCharges(rs.getString(3));
            log.info("charges: " + dataSeq.getCharges());
        }
        return dataSeq;
    }

    public String addTotalCharges(String nominal1, String nominal2) throws ParseException {
        String nominal3;
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setGroupingSeparator(',');
        symbols.setDecimalSeparator('.');
        String pattern = "####.##";
        DecimalFormat decimalFormat = new DecimalFormat(pattern, symbols);
        decimalFormat.setParseBigDecimal(true);
        BigDecimal bigDecimal1 = (BigDecimal) decimalFormat.parse(nominal1.replace(",", "."));
        BigDecimal bigDecimal2 = (BigDecimal) decimalFormat.parse(nominal2.replace(",", "."));
        BigDecimal bigDecimal3 = bigDecimal1.subtract(bigDecimal2);
        nominal3 = bigDecimal3.toString();
        String output = nominal3.replace(".", ",");
        int cmaPstn = 0;
        for (int i = 0; i < output.length(); i++) {
            int j = i + 1;
            String a = output.substring(i, j);
            if (a.equals(",")) {
                cmaPstn = j;
            }
        }
        int c = output.length() - cmaPstn;
        if (c == 1) {
            output = output + "0";
        }
        if (cmaPstn == 0) {
            output = output + ",00";
        }
        log.info("output tota charges: " + output);
        return output;
    }

    public List<String> cekRef940950() throws SQLException {  //20191231 ditambah search cover
        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        List<String> datas = new ArrayList<String>();
        String sql = "SELECT b.detail, a.flag, a.messageType FROM headers AS a, tags AS b WHERE a.id_headers=b.id_headers AND b.tag='61' AND a.io_type='O' AND a.messageType IN ('950','940') AND a.flag = 'INC' AND a.isDuplicate = 0 AND tanggal > '" + tanggal_transaksi + "' ORDER BY a.id_headers";
//        log.info("sql cekRef103 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1) + "#" + rs.getString(2) + "#" + rs.getString(3));
        }
        return datas;
    }

    public List<String> getTag71(String ref103, String tglValutaDb, String currencyDb, String norekKredit) throws SQLException {  //20191231 ditambah search cover
        List<String> datas = new ArrayList<String>();
        String sql = "SELECT DISTINCT tag71.detail, tag71.tag, a.id_headers FROM headers AS a \n"
                + "RIGHT JOIN tags tag20 ON a.id_headers=tag20.id_headers AND tag20.tag='20' \n"
                + "RIGHT JOIN tags tag71 ON a.id_headers=tag71.id_headers AND tag71.tag='71a' \n"
                + "RIGHT JOIN tags tag32aDate ON a.id_headers=tag32aDate.id_headers AND tag32aDate.tagName='_060_mf32a_date' \n"
                + "RIGHT JOIN tags tag32aCurr ON a.id_headers=tag32aCurr.id_headers AND tag32aCurr.tagName='_061_mf32a_currency' \n"
                + "RIGHT JOIN tags acc ON a.id_headers=acc.id_headers AND (acc.tagName='_180_mf59_account' or acc.tagName='_185_mf59f_account') \n"
                + "WHERE a.messageType='103' AND a.flag = 'INC-STL' AND a.isDuplicate = 0 "
                + "AND tag20.detail like '%" + ref103 + "%' AND tag32aDate.detail='" + tglValutaDb + "' AND tag32aCurr.detail='" + currencyDb + "'";
        log.info("sql getTag71 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1) + "#" + rs.getString(2) + "#" + rs.getString(3));
        }
        return datas;
    }

//    public List<String> getTag71_old(String ref103, String tglValutaDb, String currencyDb, String norekKredit) throws SQLException {  //20191231 ditambah search cover
//        List<String> datas = new ArrayList<String>();
//        String sql = "SELECT DISTINCT tag71.detail, tag71.tag, a.id_headers FROM headers AS a \n"
//                + "RIGHT JOIN tags tag20 ON a.id_headers=tag20.id_headers AND tag20.tag='20' \n"
//                + "RIGHT JOIN tags tag71 ON a.id_headers=tag71.id_headers AND tag71.tag='71a' \n"
//                + "RIGHT JOIN tags tag32aDate ON a.id_headers=tag32aDate.id_headers AND tag32aDate.tagName='_060_mf32a_date' \n"
//                + "RIGHT JOIN tags tag32aCurr ON a.id_headers=tag32aCurr.id_headers AND tag32aCurr.tagName='_061_mf32a_currency' \n"
//                + "RIGHT JOIN tags acc ON a.id_headers=acc.id_headers AND (acc.tagName='_180_mf59_account' or acc.tagName='_185_mf59f_account') \n"
//                + "WHERE a.messageType='103' AND a.flag = 'INC-STL' AND a.isDuplicate = 0 "
//                + "AND tag20.detail like '%" + ref103 + "%' AND tag32aDate.detail='" + tglValutaDb + "' AND tag32aCurr.detail='" + currencyDb + "' AND acc.detail like '%" + norekKredit + "'";
//        log.info("sql getTag71 = " + sql);
//        PreparedStatement st = this.conn.prepareStatement(sql);
//        ResultSet rs = st.executeQuery();
//        while (rs.next()) {
//            datas.add(rs.getString(1) + "#" + rs.getString(2) + "#" + rs.getString(3));
//        }
//        return datas;
//    }
    public List<String> getAll103Stl() throws SQLException {  //20200403 ditambah get all 103 Settle
        List<String> datas = new ArrayList<String>();
        String sql = "SELECT DISTINCT a.id_headers, tag20.detail as t20, tag32aDate.detail as trx_date, tag32aCurr.detail as curr, tag71.detail as t71d, acc.detail as acc \n"
                + "FROM headers a \n"
                + "RIGHT JOIN tags tag20 ON a.id_headers=tag20.id_headers AND tag20.tag='20' \n"
                + "RIGHT JOIN tags tag71 ON a.id_headers=tag71.id_headers AND tag71.tag='71a' \n"
                + "RIGHT JOIN tags tag32aDate ON a.id_headers=tag32aDate.id_headers AND tag32aDate.tagName='_060_mf32a_date' \n"
                + "RIGHT JOIN tags tag32aCurr ON a.id_headers=tag32aCurr.id_headers AND tag32aCurr.tagName='_061_mf32a_currency' \n"
                + "RIGHT JOIN tags acc ON a.id_headers=acc.id_headers AND acc.tagName='_180_mf59_account' \n"
                + "WHERE a.messageType='103' AND a.flag = 'INC-STL' AND a.isDuplicate = 0 ";
        log.info("sql get103Upload = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1) + "#" + rs.getString(2) + "#" + rs.getString(3) + "#" + rs.getString(4) + "#" + rs.getString(5) + "#" + rs.getString(6));
        }
        return datas;
    }

    public String getTag54A(String id) {
        String rowID = "none";
//        System.out.println("tags : " + tags);
        try {
//            String sql = "SELECT detail FROM tags WHERE id_headers='" + id + "' AND tagName='_131_of54a_identifier_code'";
            String sql = "SELECT coalesce(coalesce(t54.detail,t53.detail),'none') as t54 FROM headers h\n"
                    + "LEFT JOIN tags t53 ON\n"
                    + "t53.id_headers=h.id_headers\n"
                    + "and t53.tagName = '_121_of53a_identifier_code'\n"
                    + "LEFT JOIN tags t54 ON\n"
                    + "t54.id_headers=h.id_headers\n"
                    + "and t54.tagName = '_131_of54a_identifier_code'\n"
                    + "WHERE h.id_headers=" + id;
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                rowID = rs.getString(1);
            }
        } catch (Exception es) {
            es.printStackTrace();
        }
        return rowID;
    }

    public String getAccPenagihan(String bic) {
        String rowID = "";
//        System.out.println("tags : " + tags);
        try {
            String sql = "SELECT account FROM account_penagihan WHERE swift_code like '%" + bic.substring(0, 8) + "%'";
            // System.out.println("akun penagihan " + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                rowID = (rs.getString("account"));
                // System.out.println(sql + " == " + rowID);
            }
        } catch (Exception es) {
            es.printStackTrace();
        }
        return rowID;
    }

    public String getRefInv(String id) {
        String rowID = "none";
        try {
            String sql = "SELECT a.detail, a.tag, a.id_headers, i.id_relation FROM tags a\n"
                    + "LEFT JOIN investigation i ON i.id_relation = a.id_headers\n"
                    + "WHERE i.id_headers = ?\n"
                    + "AND a.tag = '20'";
            // System.out.println("get ID Header 103 " + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(id));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                rowID = (rs.getString("detail"));
            }
        } catch (Exception es) {
            es.printStackTrace();
        }
        return rowID;
    }

    public void updateInfoRef(String info, int id_headers) {
        try {
            String sql = "Update tags SET info=? WHERE id_headers=? AND tagName = '_010_mf20_sender_reference'";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, info);  //flag/
            st.setInt(2, id_headers);   //id_headers/
            st.executeUpdate();
            System.out.println("info: " + info + " , id: " + id_headers);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateBranchOutgoing(int id_headers, String branch) {           //20210415
        log.info("updateDataHeaderStatus");
        try {
            String sql = "UPDATE headers SET branch = ? WHERE id_headers = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, branch);
            st.setInt(2, id_headers());
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getIdHeaderOutgoing(String ref103) throws SQLException {         //20210415
        int datas = 0;
        String sql = "SELECT a.id_headers FROM headers AS a \n"
                + "RIGHT JOIN tags tag20 ON a.id_headers=tag20.id_headers AND tag20.tag='20' \n"
                + "WHERE a.messageType='103' "
                + "AND tag20.detail like '%" + ref103 + "%' ";
        log.info("sql getTag71 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas = rs.getInt(1);
        }
        return datas;
    }

    public List<Integer> cekDuplikatID(Header data) throws Exception {
        List<Integer> dupe = new ArrayList<Integer>();
        SimpleDateFormat originalFormat = new SimpleDateFormat("ddMMyy");
        SimpleDateFormat sqlFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = originalFormat.parse(data.getTrans_date_value());
        String sqlFormattedDate = sqlFormat.format(date);
        BigDecimal amount = new BigDecimal(data.getTrans_amount());
        try {
            String sql = "SELECT DISTINCT h.id_headers, messageType, logicalTerminal, sessionNumber, sequenceNumber, io_type,\n"
                    + "receiverAddress, tanggal, flag, isDuplicate, trx.trans_reference, trx.trans_related_reference, trx.trans_date_value, trx.trans_amount,\n"
                    + "trx.trans_ccy FROM headers h LEFT JOIN trx_detail trx ON h.id_headers = trx.id_headers WHERE logicalTerminal = ? AND receiverAddress = ? AND lower(trx.trans_reference) = ?\n"
                    + "AND trx.trans_date_value::date = ?::date AND trx.trans_amount = ? AND trx.trans_ccy = ? AND messageType = ?\n"
                    + "AND tanggal > CURRENT_DATE AND io_type = 'I' ORDER BY h.id_headers";
            log.info("trans_reference & trans_date_value" + data.getTrans_refference() + " # " + data.getTrans_date_value());
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getLogicalTerminal());
            log.info("logical terminal : " + data.getLogicalTerminal());
            st.setString(2, data.getReceiverAddress());
            log.info("receiver Address : " + data.getReceiverAddress());
            st.setString(3, data.getTrans_refference().toLowerCase());
            log.info("trans_reference : " + data.getTrans_refference());
            if (data.getTrans_date_value().length() == 6) {
                st.setString(4, "20" + data.getTrans_date_value().substring(0, 2) + "-" + data.getTrans_date_value().substring(2, 4) + "-" + data.getTrans_date_value().substring(4, 6));
            } else {
                st.setString(4, data.getTrans_date_value());
            }
            log.info("trans_date_value : " + data.getTrans_date_value());
            st.setBigDecimal(5, amount);
            log.info("trans_amount : " + data.getTrans_amount());
            st.setString(6, data.getTrans_ccy());
            log.info("trans_ccy : " + data.getTrans_ccy());
            st.setString(7, data.getMessageType());
            log.info("messageType : " + data.getMessageType());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                dupe.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dupe;

    }

    public void updateDuplikat(int id_headers) throws Exception {
        String sql = "update headers set isduplicate = '1', flag = 'DUPL' where id_headers = ?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id_headers);
        st.executeUpdate();
    }
    
    public void updateDuplikatCNF (int id_headers) throws Exception {
        String sql = "update headers set isduplicate = '0' where id_headers = ?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id_headers);
        st.executeUpdate();
    }

    public BigDecimal getSTPLimit(String currency) throws SQLException {
        String sql = "select batas from stp_limit where currency='" + currency + "'";
        BigDecimal result = new BigDecimal(0);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            result = rs.getBigDecimal(1);
        }
        log.info("result : " + result);
        return result;
    }

    public String getAmount(int id_headers) throws SQLException {
        String sql = "select t1.detail, t2.detail from headers t0\n"
                + "left join tags t1 on t1.id_headers = t0.id_headers and t1.tagname = '_062_mf32a_amount' \n"
                + "left join tags t2 on t0.id_headers = t2.id_headers and t2.tagname = '_061_mf32a_currency'\n"
                + "where t0.id_headers = '" + id_headers + "'";
        String result = "";
        log.info("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            result = rs.getString(1) + "#" + rs.getString(2);
        }
        log.info("result : " + result);
        return result;
    }

    public String getAmount101(int id_headers) throws SQLException {
        String sql = "select t1.detail, t2.detail from headers t0\n"
                + "left join tags t1 on t1.id_headers = t0.id_headers and t1.tagname = '_131_mf32b_amount' \n"
                + "left join tags t2 on t0.id_headers = t2.id_headers and t2.tagname = '_130_mf32b_currency'\n"
                + "where t0.id_headers = '" + id_headers + "'";
        String result = "";
        log.info("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            result = rs.getString(1) + "#" + rs.getString(2);
        }
        log.info("result : " + result);
        return result;
    }

    public String getNetworkType(int id_headers) throws SQLException {
        String sql = "select networktype from headers where id_headers= ? ";
        String result = "";
        log.info("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id_headers);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
//            result = rs.getString(1) + "#" + rs.getString(2);
            result = rs.getString("networktype");
            if (result == null) {
                result = "N/A";
            }
        }
        log.info("result : " + result);
        return result;
    }

    public boolean cekSwiftGoBIC(String receiver) throws SQLException {
        String sql = "select * from swift_go_bic where swift_code like '" + receiver + "%' ";
        boolean result = false;
        log.info("sql cekSwiftGoBIC = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            result = true;
        }
        log.info("result : " + result);
        return result;
    }

    public boolean cekSwiftGoCurr(String currency) throws SQLException {
        String sql = "select * from swift_go_limit where currency = '" + currency + "' ";
        boolean result = false;
        log.info("sql cekSwiftGoCurr = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            result = true;
        }
        log.info("result : " + result);
        return result;
    }

    public boolean cekSwiftGoLimit(String currency, String amount) throws SQLException {
        String sql = "select amount from swift_go_limit where currency = '" + currency + "' ";
        boolean result = false;
        log.info("sql cekSwiftGoLimit = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            BigDecimal limitAmount;
            BigDecimal trxAmount;
            limitAmount = new BigDecimal(rs.getString(1).replace(",", "."));
            log.info("cek limitAmount " + limitAmount);
            trxAmount = new BigDecimal(amount.replace(",", "."));
            log.info("cek trxAmount " + trxAmount);
            if (trxAmount.compareTo(limitAmount) == 1) {
                log.info("if trxAmount " + trxAmount);
                result = false;
            } else {
                log.info("else trxAmount " + trxAmount);
                result = true;
            }
        }
        log.info("result : " + result);
        return result;
    }

    public Map<String, String> getMxTextById(String headerId) throws Exception {
        String sql = "SELECT * FROM mx_text WHERE id_headers ='" + headerId + "'";
        Map<String, String> adat = new HashMap<String, String>();
        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            adat.put("final_mx", rs.getString("final_mx"));
            adat.put("modify_mx", rs.getString("modify_mx"));
            adat.put("multiformat_mt", rs.getString("multiformat_mt"));
        }
        //System.out.println(adat.get("ori_mx"));
        return adat;
    }

    public int checkWriteSession() throws SQLException {
        int data = 0;
        String sql = "SELECT session_value from write_session ";
//        log.info("sql cekRef103 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data = rs.getInt(1);
        }
        return data;
    }

    public void updateWriteSession(int value) {
        try {
            String sql = "update write_session set session_value = " + value;
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.executeUpdate();
            log.info("updateWriteSession is successfully");
        } catch (SQLException e) {
            log.error("updateWriteSession:" + e.getMessage());
        }
    }

    public Map<String, String> getMtTextById(String headerId) throws Exception {
        String sql = "SELECT * FROM mt_text WHERE id_headers ='" + headerId + "'";
        Map<String, String> adat = new HashMap<String, String>();
        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
//            adat.put("ori_mt", rs.getString("final_mt"));
            adat.put("modify_mt", rs.getString("modify_mt"));
            adat.put("final_mt", rs.getString("final_mt"));
//            adat.put("final_mx", rs.getString("final_mx"));
        }
        return adat;
    }

    public DataNostro getListNostro(String bic, String ccy) throws SQLException {
        String sql = "SELECT id_member, swift_code,name,address,ssl_no,ssl_name,currency_codes,acc_no,city,country FROM nostro WHERE swift_bic LIKE ? and currency = ?";

        System.out.println("BIC : " + bic);
        System.out.println("CCY  : " + ccy);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, "%" + bic + "%");
        st.setString(2, ccy);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            DataNostro data = new DataNostro();
            data.setId_member(rs.getInt(1));
            data.setSwift_code(rs.getString(2));
            data.setName(rs.getString(3));
            data.setAddress(rs.getString(4));
            data.setSsl_no(rs.getInt(5));
            data.setSsl_name(rs.getString(6));
            data.setCurrency_codes(rs.getString(7));
            data.setAcc_no(rs.getString(8));
            data.setCity(rs.getString(9));
            data.setCountry(rs.getString(10));
//            datas.add(data);
        }
        return null;
    }

    public Map<String, String> getMxFromById(int id) {

        Map<String, String> data = new HashMap<String, String>();
        try {
            log.info("ID for get tags_MX " + id);
            String sql = "SELECT \n"
                    + "    json_tag::text as jsonTag, \n"
                    + "    header_saa, \n"
                    + "    h.isNostro AS isNostro, \n"
                    + "    mxt.final_mx AS finalMx, \n"
                    + "    mxt.modify_mx AS modifyMx \n"
                    + "FROM \n"
                    + "    tags_mx tag\n"
                    + "INNER JOIN \n"
                    + "    headers AS h ON tag.id_headers = h.id_headers \n"
                    + "INNER JOIN \n"
                    + "    mx_text AS mxt ON mxt.id_headers = h.id_headers\n"
                    + "WHERE \n"
                    + "    h.id_headers = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String bodyMX = rs.getString("jsonTag");
                String headerMX = rs.getString("header_saa");
                String isNostro = rs.getString("isNostro");
                // String isVostro = rs.getString("isVostro");
                String finalMx = rs.getString("finalMx");
                String modifyMx = rs.getString("modifyMx");

                // Put into the map
                data.put("bodyMX", bodyMX);
                data.put("headerMX", headerMX);
                data.put("isNostro", isNostro);
                // data.put("isVostro", isVostro);
                data.put("finalMx", finalMx);
                data.put("modifyMx", modifyMx);

                System.out.println("bodyMX: " + (bodyMX != null ? bodyMX : "null"));

            }

        } catch (SQLException e) {
            log.error("On class " + this.getClass().toString() + " function getBodyAnHeaderMXById():" + e.toString());
            e.printStackTrace();
        }
        return data;
    }

    public String getEsentialPacs008ById(String headerId) throws Exception {
        String tags = "";
        String sql = "SELECT \n"
                + "    mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'pmtId' ->> 'instrId' AS instr_id,\n"
                + "    mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmAmt' ->> 'ccy' AS ccy,\n"
                + "    mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmAmt' ->> 'value' AS value,\n"
                + "    RIGHT(mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' ->> 'year', 2) || \n"
                + "    RIGHT('0' || mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' ->> 'month', 2) || \n"
                + "    RIGHT('0' || mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' ->> 'day', 2) AS settlement_date,\n"
                + "    mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'grpHdr' -> 'sttlmInf' -> 'instdRmbrsmntAgt' -> 'finInstnId' ->> 'bicfi' AS bicfi,\n"
                + "    mx.info\n"
                + "FROM headers h\n"
                + "LEFT JOIN tags_mx mx \n"
                + "    ON h.id_headers = mx.id_headers\n"
                + "WHERE h.id_headers = ?;";
        PreparedStatement st = this.conn.prepareStatement(sql);
        System.out.println("getEsentialPacs008ById: " + sql);
        st.setString(1, headerId);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            tags = rs.getString(1) + "#" + rs.getString(2) + "#" + rs.getString(3) + "#" + rs.getString(4) + "#" + rs.getString(5) + "#" + rs.getString(6) + "#reswvwed";
        }
        return tags;
    }

    public List<String> getDetailRelationQuery(int idHeaders) {
        List<String> data = new ArrayList<>();
        try {
            log.info("getDetailRelationQuery " + idHeaders);
            String sql = "select top(1) h.id_headers,h.messageType, tag20.detail as refference, tag21.detail as relRefference from investigation as inv\n"
                    + "INNER JOIN headers as h ON h.id_headers = inv.id_relation and h.messageType = '195'\n"
                    + "INNER JOIN tags as tag20 ON tag20.id_headers = inv.id_relation AND tag20.tag = '20'\n"
                    + "INNER JOIN tags as tag21 ON tag21.id_headers = inv.id_relation AND tag21.tag = '21'\n"
                    + "where inv.id_headers = ? \n"
                    + "order by inv.id_investigate desc";

            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, idHeaders);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                data.add(rs.getString("id_headers"));
                data.add(rs.getString("messageType"));
                data.add(rs.getString("refference"));
                data.add(rs.getString("relRefference"));
            }

        } catch (Exception e) {
            log.error("On class " + this.getClass().toString() + " function getDetailRelationQuery():" + e.toString());
        }
        return data;
    }

    public void updateLock(int value, int id_headers, String user) {
        // log.info("grrrrr");
        // log.info("masuk updateLock#" + value + "#" + user + "#" + id_headers);
        try {
            String sql = "update headers set isLock =?, usedBy=? where id_headers=? ";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, value);
            st.setString(2, user);
            st.setInt(3, id_headers);
            st.executeUpdate();
            log.info("updateLock is successfully");
        } catch (SQLException e) {
            log.error("updateLock:" + e.getMessage());
        }
    }
    
    public EssentialsFieldPacs0080108 getEssentialValuePacs00800108New(int headerId) {
        EssentialsFieldPacs0080108 tags = null;
        try {
            
            String sql = "SELECT \n" +
                        "    mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'pmtId' ->> 'instrId' AS instr_id,\n" +
                        "    mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmAmt' ->> 'ccy' AS ccy,\n" +
                        "    mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmAmt' ->> 'value'::TEXT AS value,\n" +
                        "	CONCAT(\n" +
                        "		RIGHT(CONCAT(mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' ->> 'year'), 2) , \n" +
                        "		RIGHT(CONCAT('0' , mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' ->> 'month'), 2),\n" +
                        "		RIGHT(CONCAT('0' , mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'cdtTrfTxInf' -> 0 -> 'intrBkSttlmDt' ->> 'day'), 2)\n" +
                        "	) AS settlement_date,\n" +
                        "    mx.json_tag -> 'fiToFICstmrCdtTrf' -> 'grpHdr' -> 'sttlmInf' -> 'instdRmbrsmntAgt' -> 'finInstnId' ->> 'bicfi' AS bicfi,\n" +
                        "    mx.info\n" +
                        "FROM headers h\n" +
                        "LEFT JOIN tags_mx mx \n" +
                        "    ON h.id_headers = mx.id_headers\n" +
                        "WHERE h.id_headers = ?;";
            
            PreparedStatement st = this.conn.prepareStatement(sql);
            System.out.println("getEsentialPacs008ById: " + sql);
            st.setInt(1, headerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                System.out.println("Start");
                tags = new EssentialsFieldPacs0080108(
                rs.getString("instr_id") // instruction id
                ,rs.getString("ccy"),
                new BigDecimal(rs.getString("value").replace(",", ".")),
                rs.getString("settlement_date")); // Currency
                System.out.println("End");
            }
            
        }
        catch (SQLException ex){
            log.error(ex.getLocalizedMessage());
            ex.printStackTrace();
        }
        return tags;
    }
    
    
    public EssentialsFieldPacs0080108 getMT103OutgoingByRefferenceDatevalueReceiverAndCurrency(String refference,  String ccy, String dateValue,String receiver) {
        EssentialsFieldPacs0080108 tags = null;
        try {
            
            String sql = "select h.id_headers as id_headers, \n" +
            "flag,\n" +
            "t20.detail as refference,\n" +
            "t32c.detail as currency,\n" +
            "t32d.detail as dateValue,\n" +
            "concat(left(receiveraddress,8),right(receiveraddress,3)) as receiver\n"+
            "from headers as h\n" +
            "inner join tags as t20 on t20.id_headers = h.id_headers and t20.tagname = '_010_mf20_sender_reference'\n" +
            "inner join tags as t32c on t32c.id_headers = h.id_headers and t32c.tagname = '_061_mf32a_currency'\n" +
            "inner join tags as t32d on t32d.id_headers = h.id_headers and t32d.tagname = '_060_mf32a_date'\n" +
            "where h.io_type = 'I' and h.messageType = '103' and h.isDuplicate = '0' and flag in ('AUTH','ACK','MOD','VER')\n" +
            "and t20.detail = ? and t32c.detail = ? and t32d.detail = ? and concat(left(receiveraddress,8),right(receiveraddress,3)) = ?;";
            
            PreparedStatement st = this.conn.prepareStatement(sql);
            System.out.println("getEsentialPacs008ById: " + sql);
            st.setString(1, refference);
            st.setString(2, ccy);
            st.setString(3, dateValue);
            st.setString(4, receiver);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                System.out.println("Start");
                tags = new EssentialsFieldPacs0080108(
                rs.getString("refference") // instruction id
                ,rs.getString("currency"),
                null,
                rs.getString("dateValue"),
                rs.getInt("id_headers"),
                rs.getString("receiver")); // Currency
                System.out.println("End");
            }
            
        }
        catch (SQLException ex){
            log.error(ex.getLocalizedMessage());
            ex.printStackTrace();
        }
        return tags;
    }
    
    public boolean updateKomentar(int id_headers, String komentar) {
        
        boolean update = false;
        try {
            String sql = "Update headers SET komentar=? WHERE id_headers=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, komentar);  //flag/
            st.setInt(2, id_headers);   //id_headers/
            if (st.executeUpdate() > 0) {
                update = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return update;
    }

    public String getTemplateNameHeaders(Integer id_headers) throws SQLException, Exception {
        String sql = "SELECT templatename FROM headers WHERE id_headers = ? ";
        String templatename = null;
        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            st.setInt(1, id_headers);

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    templatename = rs.getString("templatename");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return templatename;    
    }    
}
