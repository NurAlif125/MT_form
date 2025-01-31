/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

/**
 *
 * @author RIZKY
 */
import java.math.BigDecimal;
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
import com.vensys.appcm.model.STPLimit;

/**
 *
 * @author AplDev2
 */
public class DBSTPLimit {

    Connection conn;

    public DBSTPLimit(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
    

    public List<STPLimit> getAllDataLimit() throws Exception {
        List<STPLimit> datas = new ArrayList<STPLimit>();
        String uang = "";
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

        formatRp.setCurrencySymbol("");
        formatRp.setMonetaryDecimalSeparator(',');
        formatRp.setGroupingSeparator('.');

        kursIndonesia.setDecimalFormatSymbols(formatRp);
        String sql = "SELECT * FROM stp_limit";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            STPLimit data = new STPLimit();
            data.setId(rs.getInt("id"));
            uang = rs.getString("batas");
            uang = kursIndonesia.format(Double.parseDouble(uang.replace(",", ".")));
            data.setLimit(uang);
            data.setUpdateBy(rs.getString("updateby"));
            data.setTanggal(rs.getString("tanggalupdate"));
            data.setCurrency(rs.getString("currency"));
            datas.add(data);
        }
        return datas;
    }

    public void updateDataLimit(STPLimit data, String ip, String comp, int id) {
//        String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "UPDATE stp_limit SET batas=?, updateby=?, tanggalupdate=LOCALTIMESTAMP where id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setBigDecimal(1, new BigDecimal(data.getLimit()));
            st.setString(2, data.getUpdateBy());
//            st.setString(3, tanggal);
            st.setInt(3, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(data.getUpdateBy(), "Ubah STP limit", ip, comp);
    }
    
    public void addDataLimit(STPLimit data, String ip, String comp) {
        try {
            String sql = "Insert into stp_limit (batas, currency, updateby, tanggalupdate) values (?,?,?,LOCALTIMESTAMP)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setBigDecimal(1, new BigDecimal(data.getLimit()));
            st.setString(2, data.getCurrency());
            st.setString(3, data.getUpdateBy());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(data.getUpdateBy(), "Ubah STP limit", ip, comp);
    }
    
    public STPLimit getDataLimitById(String id) throws SQLException {
        STPLimit data = new STPLimit();
        String sql = "SELECT * FROM stp_limit WHERE id='" + id + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId(rs.getInt("id"));  
            data.setLimit(rs.getString("batas"));  
            data.setCurrency(rs.getString("currency"));  
            data.setUpdateBy(rs.getString("updateby"));  
            data.setTanggal(rs.getString("tanggalupdate"));    
        }
        return data;
    }
}
