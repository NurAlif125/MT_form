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
import com.vensys.appcm.model.DataMXText;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author hadi
 */
public class DBMXText {

    Connection conn;
    Logger log = LogManager.getLogger(getClass().getName());

    public DBMXText(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public DataMXText getMxTextById(int id_headers) throws SQLException {
        DataMXText data = new DataMXText();
        String sql = "SELECT id_headers, final_mx, modify_mx, final_mt FROM mx_text WHERE id_headers='" + id_headers + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_headers(rs.getInt(1));  
            data.setOri_mx(rs.getString(2));  
            data.setModify_mx(rs.getString(3));
            data.setFinal_mt(rs.getString(4));
            
        }
        return data;
    }

    public DataMXText getMtTextById(int parseInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}