/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.dbase;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.http.HttpServletRequest;
import com.vensys.appcm.model.DataMTRelation;
import com.vensys.appcm.model.Header;

/**
 *
 * @author hadi
 */
public class DBMTRelationAndMatching {

    Connection conn;

    public DBMTRelationAndMatching(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public DataMTRelation getMtRelByIdRel(int id_relation) throws SQLException {
        DataMTRelation data = new DataMTRelation();
        String sql = "SELECT id_headers FROM mt_relation WHERE id_relation='" + id_relation + "'";
        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_headers(rs.getInt(1));  
        }
        return data;
    }
    
    public List<Header> getMtRelbyIdHeaders(String id_headers) throws SQLException{
        List<Header> datas = new ArrayList<Header>();
        String sql = "SELECT hd.messageType, hd.io_type, hd.id_headers, HD.flag  FROM headers as hd " // 2024-05-25(farras), ditambah flag
                + "INNER JOIN investigation as inv ON inv.id_relation = hd.id_headers "
                + "WHERE inv.id_headers='" + id_headers + "' "
                + "order by hd.tanggal desc";
        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header data = new Header();
            data.setMessageType(rs.getString(1));  
            data.setIo_type(rs.getString(2));  
            data.setId_headers(rs.getInt(3));  // 2024-05-25 (Farras), menambahkah flag untuk ditampilkan
            data.setFlag(rs.getString("flag"));
            datas.add(data);
        }
        return datas;
    }
    
     public List<Header> getMtRelbyIdHeaders2(String id_headers) throws SQLException{
        List<Header> datas = new ArrayList<Header>();
        String sql = "SELECT \n" +
                "    hd.messageType, \n" +
                "    hd.io_type, \n" +
                "    hd.id_headers, \n" +
                "    hd.flag, \n" +
                "    CASE \n" +
                "        WHEN inv.id_relation = ? THEN 'Generated from' \n" +
                "        WHEN inv.id_headers = ? THEN '' \n" +
                "        ELSE NULL \n" +
                "    END AS info\n" +
                "FROM headers AS hd\n" +
                "INNER JOIN investigation AS inv ON \n" +
                "(inv.id_relation = ? AND inv.id_headers = hd.id_headers)  \n" +
                "OR (inv.id_headers = ? AND inv.id_relation = hd.id_headers)\n" +
                "WHERE inv.id_headers = ? OR inv.id_relation = ?\n" +
                "ORDER BY hd.tanggal DESC;";
        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, id_headers);
        st.setString(2, id_headers);
        st.setString(3, id_headers);
        st.setString(4, id_headers);
        st.setString(5, id_headers);
        st.setString(6, id_headers);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header data = new Header();
            data.setMessageType(rs.getString(1));  
            data.setIo_type(rs.getString(2));  
            data.setId_headers(rs.getInt(3));  // 2024-05-25 (Farras), menambahkah flag untuk ditampilkan
            data.setFlag(rs.getString("flag"));
            data.setInfogenerate(rs.getString("info"));
            datas.add(data);
        }
        return datas;
    }
    
    //20240205 ditambah ini
    public int getMtRelCount(String id_headers) throws SQLException{
        int datas = 0;
        String sql = "SELECT count(*) FROM headers as hd \n" +
                "INNER JOIN investigation as inv ON inv.id_relation = hd.id_headers \n" +
                "WHERE inv.id_headers=?";
        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, id_headers);
        ResultSet rs = st.executeQuery();
        while (rs.next()) { 
            datas = rs.getInt(1);
        }
        return datas;
    }
    
    
    public List<Header> getMatchingTransctionsbyIdHeaders(String id_headers){
        List<Header> datas = new ArrayList<Header>();
        try {
            
            /*String sql = "select  \n" +
            "h.messageType, h.io_type,h.id_headers, h.flag from matching_relation as mr \n" +
            "inner join headers as h on h.id_headers = mr.id_second_matching\n" +
            "where mr.id_main_matching = ? \n" +
            "order by mr.id_relation desc";*/
            String sql = "select   \n" +
"             h.messageType, h.io_type,h.id_headers, h.flag\n" +
"		from matching_relation as mr  \n" +
"             inner join headers as h on \n" +
"			  (mr.id_main_matching = ? AND mr.id_second_matching = h.id_headers)   \n" +
"                 OR (mr.id_second_matching = ? AND mr.id_main_matching = h.id_headers) \n" +
"             where mr.id_main_matching = ?  or mr.id_second_matching=?\n" +
"             order by mr.id_relation desc ";
            System.out.println("sql=" + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, id_headers);
            st.setString(2, id_headers);
            st.setString(3, id_headers);
            st.setString(4, id_headers);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Header data = new Header();
                data.setMessageType(rs.getString(1));
                data.setIo_type(rs.getString(2));
                data.setId_headers(rs.getInt(3));  // 2024-05-25 (Farras), menambahkah flag untuk ditampilkan
                data.setFlag(rs.getString("flag"));
                datas.add(data);
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(DBMTRelationAndMatching.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datas;
    }

}
