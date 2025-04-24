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
import com.vensys.appcm.model.DataMTText;


/**
 *
 * @author hadi
 */
public class DBMTText {

    Connection conn;

    public DBMTText(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public DataMTText getMxTextById(int id_headers) throws SQLException {
        DataMTText data = new DataMTText();
        String sql = "SELECT *  FROM mx_text WHERE id_headers='" + id_headers + "'";
        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_headers(rs.getInt("id_headers"));  
            data.setModify_mt(rs.getString("modify_mx"));  
            data.setFinal_mt(rs.getString("final_mx"));     
             
        }
        return data;
    
    }
    
    public DataMTText getMtTextById(int id_headers) throws SQLException {
        DataMTText data = new DataMTText();
        String sql = "SELECT id_headers, modify_mt, final_mt, final_mx FROM mt_text WHERE id_headers='" + id_headers + "'";
        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_headers(rs.getInt(1));  
            data.setModify_mt(rs.getString(2));  
            data.setFinal_mt(rs.getString(3));  
            data.setFinal_mx(rs.getString(4));
        }
        return data;
    }

}
