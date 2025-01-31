/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.dbase;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.Date;
import java.util.List;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import com.vensys.appcm.model.DataCounterRate;

/**
 *
 * @author Baim
 */
public class DBDataCounterRate {

    Connection conn;

    public DBDataCounterRate(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
//    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addDataCounterRate(DataCounterRate data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO counter_rate (id, currency, tanggal, tc_buy, tt_buy, tc_sell, tt_sell, margin_point, update_by, update_date, against_currency) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?)";
            PreparedStatement st = this.conn.prepareStatement(sql);

            st.setString(1, data.getId());
            st.setString(2, data.getCurrency());

            // Convert data.getTanggal() (String) to java.sql.Date
            java.sql.Date sqlDate = java.sql.Date.valueOf(data.getTanggal());  // Assumes data.getTanggal() is in "yyyy-MM-dd" format
            st.setDate(3, sqlDate);

            st.setBigDecimal(4, new BigDecimal(data.getTc_buy()));
            st.setBigDecimal(5, new BigDecimal(data.getTt_buy()));
            st.setBigDecimal(6, new BigDecimal(data.getTc_sell()));
            st.setBigDecimal(7, new BigDecimal(data.getTt_sell()));
            st.setBigDecimal(8, new BigDecimal(data.getMargin_point()));
            st.setString(9, data.getUpdate_by());
            st.setString(10, data.getAgainst_currency());

            st.executeLargeUpdate();

            String[] dataCounterRate = {
                data.getCurrency(),
                data.getTanggal(),
                data.getTc_buy(),
                data.getTt_buy(),
                data.getTc_sell(),
                data.getTt_sell(),
                data.getAgainst_currency()
            };

            String joinedData = "Tambah Counter Rate( " + String.join(",", dataCounterRate) + " )";
            evl.insertDataEvent(mofier, joinedData, ip, comp);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

public void updateDataCounterRate(DataCounterRate data, String id, String mofier, String ip, String comp) throws SQLException {
    try {
        String sql = "UPDATE counter_rate SET tc_buy=?, tt_buy=?, tc_sell=?, tt_sell=?, margin_point=?, update_by=?, update_date=NOW() WHERE id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        
        // Assuming these fields can be converted to BigDecimal
        st.setBigDecimal(1, new BigDecimal(data.getTc_buy()));
        st.setBigDecimal(2, new BigDecimal(data.getTt_buy()));
        st.setBigDecimal(3, new BigDecimal(data.getTc_sell()));
        st.setBigDecimal(4, new BigDecimal(data.getTt_sell()));
        st.setBigDecimal(5, new BigDecimal(data.getMargin_point()));
        st.setString(6, data.getUpdate_by());
        st.setString(7, id);
        
        st.executeLargeUpdate();
        evl.insertDataEvent(mofier, "Ubah Counter Rate(" + id + ")", ip, comp);
    } catch (SQLException e) {
        e.printStackTrace();
    }
}


    public void updateDataCounterRate(DataCounterRate data, String mofier, String ip, String comp) throws SQLException {
        try {
            String sql = "UPDATE counter_rate SET tc_buy=? , tt_buy=? ,tc_sell=? ,tt_sell=?, margin_point=? , update_by=? , update_date=getdate() WHERE currency=? and against_currency=? And tanggal=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getTc_buy());
            st.setString(2, data.getTt_buy());
            st.setString(3, data.getTc_sell());
            st.setString(4, data.getTt_sell());
            st.setString(5, data.getMargin_point());
            st.setString(6, data.getUpdate_by());
            st.setString(7, data.getCurrency());
            st.setString(8, data.getAgainst_currency());
            st.setString(9, data.getTanggal());
            st.executeLargeUpdate();
            evl.insertDataEvent(mofier, "Ubah Counter Rate", ip, comp);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<DataCounterRate> getallCounterRate(String tanggal) throws SQLException {
        List<DataCounterRate> datar = new ArrayList<DataCounterRate>();
        String sql = "SELECT id, currency, tanggal, tc_buy, tt_buy, tc_sell, tt_sell, margin_point, update_by, update_date, against_currency FROM counter_rate WHERE tanggal = ? ORDER BY currency ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);

        try {
            // Convert tanggal String to java.sql.Date, assuming format "yyyy-MM-dd"
            java.sql.Date sqlDate = java.sql.Date.valueOf(tanggal);
            st.setDate(1, sqlDate);
        } catch (IllegalArgumentException e) {
            throw new SQLException("Invalid date format for tanggal. Expected format is 'yyyy-MM-dd'.");
        }

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataCounterRate data = new DataCounterRate();
            data.setId(rs.getString(1));
            data.setCurrency(rs.getString(2));
            data.setTanggal(rs.getString(3));
            data.setTc_buy(rs.getString(4));
            data.setTt_buy(rs.getString(5));
            data.setTc_sell(rs.getString(6));
            data.setTt_sell(rs.getString(7));
            data.setMargin_point(rs.getString(8));
            data.setUpdate_by(rs.getString(9));
            data.setUpdate_date(rs.getString(10));
            data.setAgainst_currency(rs.getString(11));
            datar.add(data);
        }

        System.out.println("isi datana " + datar);
        return datar;
    }

    public DataCounterRate getallCounterRatebyId(String id) throws SQLException {
        DataCounterRate data = new DataCounterRate();
        String sql = "SELECT currency,tanggal,tc_buy,tt_buy,tc_sell,tt_sell,margin_point, update_by, update_date , id, against_currency  FROM counter_rate WHERE id=? ";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setCurrency(rs.getString(1));
            data.setTanggal(rs.getString(2));
            data.setTc_buy(rs.getString(3));
            data.setTt_buy(rs.getString(4));
            data.setTc_sell(rs.getString(5));
            data.setTt_sell(rs.getString(6));
            data.setMargin_point(rs.getString(7));
            data.setUpdate_by(rs.getString(8));
            data.setUpdate_date(rs.getString(9));
            data.setId(rs.getString(10));
            data.setAgainst_currency(rs.getString(11));
        }
        return data;
    }

    public void hapusCounterRate(String id, String mofier, String ip, String comp) throws SQLException {

        String sql = "DELETE FROM counter_rate WHERE id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, id);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "Hapus Counter Rate", ip, comp);
    }

    public boolean cekDataDuplicateBycurrency(String currency, String against_currency, String tanggal) throws SQLException, ParseException {
        boolean data = false;
        String sql = "SELECT t.currency FROM counter_rate AS t WHERE t.currency =? AND t.against_currency=? AND t.tanggal=?";
        System.out.println("sql cek Data Duplicate Currency = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, currency);
        st.setString(2, against_currency);

        // Convert tanggal String to java.sql.Date
        java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(tanggal);
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        st.setDate(3, sqlDate);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data = true;
        }
        return data;
    }

}
