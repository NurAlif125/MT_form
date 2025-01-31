/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

/**
 *
 * @author RIZKY
 */
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
import jakarta.servlet.http.HttpServletRequest;
import com.vensys.appcm.model.DataMTRelation;
import com.vensys.appcm.model.Header;

/**
 *
 * @author hadi
 */
public class DBMTRelation {

    Connection conn;

    public DBMTRelation(Connection conn) {
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
        String sql = "SELECT hd.messageType, hd.io_type, hd.id_headers FROM headers as hd "
                + "INNER JOIN investigation as inv ON inv.id_relation = hd.id_headers "
                + "WHERE inv.id_headers='" + id_headers + "'";
        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Header data = new Header();
            data.setMessageType(rs.getString(1));  
            data.setIo_type(rs.getString(2));  
            data.setId_headers(rs.getInt(3));  
            datas.add(data);
        }
        return datas;
    }

}
