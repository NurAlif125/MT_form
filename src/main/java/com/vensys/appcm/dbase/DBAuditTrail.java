/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

import com.vensys.appcm.model.DataAuditTrail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author HP PROBOOK 430 G8
 */
public class DBAuditTrail {
    
    Logger log = Logger.getLogger(getClass().getName());
    Connection conn;

    public DBAuditTrail(Connection conn) {
        this.conn = conn;
    }

    public ArrayList<DataAuditTrail> getAllDataAuditTrail(String date_from, String date_end) throws Exception {
    ArrayList<DataAuditTrail> datas = new ArrayList<DataAuditTrail>();
    String sql = "SELECT b.messagetype, b.logicalterminal, \n" +
                "case when UPPER(b.io_type) = 'I' then 'Outgoing' else 'Incoming' end io_type, \n" +
                "a.status_header, a.user_login, a.ip_access, a.comp_name, \n" +
                "CASE \n" +
                " WHEN approveby IS NULL OR approveby = '--' THEN '' \n" +
                " WHEN approveby LIKE '%;%' THEN split_part(approveby, ';', 2) \n" +
                " ELSE approveby \n" +
                "END AS approveby,\n" +
                "b.receiveraddress, \n" + 
                "CASE \n" +
                " WHEN createby IS NULL OR createby = '--' THEN '' \n" +
                " WHEN createby LIKE '%;%' THEN split_part(createby, ';', 2) \n" +
                " ELSE createby\n" +
                "END as createby ,\n" +
                "b.flag, \n" +
            "case when b.komentar LIKE '%<?xml version%' then '' else b.komentar end komentar, \n" +
            "CASE \n" +
            "    WHEN b.source = '' AND b.logicalTerminal = 'BDINIDJAXTRS' THEN 'TSA'\n" +
            "    WHEN b.source = '' AND b.logicalTerminal = 'BDINIDJAXCLC' THEN 'BANKTRADE'\n" +
            "    WHEN b.source = '' AND b.logicalTerminal = 'BDINIDJAXCUS' THEN 'CUSTODY'\n" +
            "    WHEN b.source = '' AND b.logicalTerminal = 'BDINIDJAXRMT' THEN 'NCBS'\n" +
            "    WHEN b.source = '' AND b.logicalTerminal = 'BDINIDJAXXXX' THEN 'FRONTARENA'\n" +
            "    ELSE b.source\n" +
            "END AS source, left(a.status_tanggal,19) as tanggal, td.trans_reference \n" +
                " FROM header_status a INNER JOIN headers b ON a.id_headers = b.id_headers \n" +
                " LEFT JOIN trx_detail td ON td.id_headers = a.id_headers \n" +
                " WHERE b.tanggal BETWEEN ? AND ? ORDER BY a.id_headers DESC, a.status_tanggal ASC";
//    System.out.println("getAllDataHistoryLogin : " + sql);

    PreparedStatement st = this.conn.prepareStatement(sql);
    st.setTimestamp(1, java.sql.Timestamp.valueOf(date_from+" 00:00:00"));
    st.setTimestamp(2, java.sql.Timestamp.valueOf(date_end + " 23:59:00"));
    
    log.info("SQL Params: " + date_from + " 00:00:00 s/d " + date_end + " 23:59:59");

//    st.setTimestamp(1, Timestamp.valueOf(date_from.trim() + " 00:00:00"));
//    st.setTimestamp(2, Timestamp.valueOf(date_end.trim() + " 23:59:59"));


    ResultSet rs = st.executeQuery();
    while (rs.next()) {
        DataAuditTrail data = new DataAuditTrail();
        data.setMessagetype(rs.getString(1));
        data.setLogicalterminal(rs.getString(2));
        data.setIo_type(rs.getString(3));
        data.setStatus_header(rs.getString(4));
        data.setUser_login(rs.getString(5));
        data.setIp_access(rs.getString(6));
        data.setComp_name(rs.getString(7));
        data.setUseredit(rs.getString(8));
        data.setReceiveraddress(rs.getString(9));
        data.setUserentry(rs.getString(10));
        data.setFlag(rs.getString(11));
        data.setKomentar(rs.getString(12));
        data.setSource(rs.getString(13));
        data.setTanggal(rs.getString(14));
        data.setNoreff(rs.getString(15));
        datas.add(data);
    }
    return datas;
}


    public ArrayList<DataAuditTrail> getAllDataAuditTrailByUser(String date_from, String date_end, String user_id) throws Exception {
        ArrayList<DataAuditTrail> datas = new ArrayList<DataAuditTrail>();
        String sql = "SELECT b.messagetype, b.logicalterminal, \n" +
                    "case when UPPER(b.io_type) = 'I' then 'Outgoing' else 'Incoming' end io_type, \n" +
                    "a.status_header, a.user_login, a.ip_access, a.comp_name, \n" +
                    "CASE \n" +
                    " WHEN approveby IS NULL OR approveby = '--' THEN '' \n" +
                    " WHEN approveby LIKE '%;%' THEN split_part(approveby, ';', 2) \n" +
                    " ELSE approveby \n" +
                    "END AS approveby,\n" +
                    "b.receiveraddress, \n" +
                    "CASE \n" +
                    " WHEN createby IS NULL OR createby = '--' THEN '' \n" +
                    " WHEN createby LIKE '%;%' THEN split_part(createby, ';', 2) \n" +
                    " ELSE createby \n" +
                    "END as createby ,\n" +
                    "b.flag, b.komentar,"+ "CASE \n" +
                    "    WHEN b.source = '' AND b.logicalTerminal = 'BDINIDJAXTRS' THEN 'TSA'\n" +
                    "    WHEN b.source = '' AND b.logicalTerminal = 'BDINIDJAXCLC' THEN 'BANKTRADE'\n" +
                    "    WHEN b.source = '' AND b.logicalTerminal = 'BDINIDJAXCUS' THEN 'CUSTODY'\n" +
                    "    WHEN b.source = '' AND b.logicalTerminal = 'BDINIDJAXRMT' THEN 'NCBS'\n" +
                    "    WHEN b.source = '' AND b.logicalTerminal = 'BDINIDJAXXXX' THEN 'FRONTARENA'\n" +
                    "    ELSE b.source\n" +
                    "END AS source, left(a.status_tanggal,19) as tanggal, td.trans_reference\n" +
                    "FROM header_status a INNER JOIN headers b ON a.id_headers = b.id_headers \n" +
                    " LEFT JOIN trx_detail td ON td.id_headers = a.id_headers \n" +
                    " WHERE tanggal BETWEEN ? AND ? AND user_login=? ORDER BY a.id_headers DESC, a.status_tanggal ASC";
    //    System.out.println("getAllDataHistoryLogin : " + sql);

        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setTimestamp(1, java.sql.Timestamp.valueOf(date_from+" 00:00:00"));
        st.setTimestamp(2, java.sql.Timestamp.valueOf(date_end + " 23:59:00"));
        st.setString(3, user_id);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataAuditTrail data = new DataAuditTrail();
            data.setMessagetype(rs.getString(1));
            data.setLogicalterminal(rs.getString(2));
            data.setIo_type(rs.getString(3));
            data.setStatus_header(rs.getString(4));
            data.setUser_login(rs.getString(5));
            data.setIp_access(rs.getString(6));
            data.setComp_name(rs.getString(7));
            data.setUseredit(rs.getString(8));
            data.setReceiveraddress(rs.getString(9));
            data.setUserentry(rs.getString(10));
            data.setFlag(rs.getString(11));
            data.setKomentar(rs.getString(12));
            data.setSource(rs.getString(13));
            data.setTanggal(rs.getString(14));
            data.setNoreff(rs.getString(15));
            datas.add(data);
        }
        return datas;
    }
    
}
