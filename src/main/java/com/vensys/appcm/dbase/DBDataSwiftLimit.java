/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

/**
 *
 * @author T430
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.vensys.appcm.model.DataSwiftLimit;

/**
 *
 * @author ovasae
 */
public class DBDataSwiftLimit {

    Connection conn;

    public DBDataSwiftLimit(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addDataSwiftLimit(DataSwiftLimit data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO swift_go_limit (currency, amount, updateby, updatedate) VALUES (?,?,?,LOCALTIMESTAMP)";
            // System.out.println("SQL addDataSwiftLimit " + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getCurrency());
            st.setBigDecimal(2, data.getAmount());
            st.setString(3, data.getUpdateby());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah Swift Go Limit", ip, comp);
    }

    public List<DataSwiftLimit> getAllDataSwiftLimit() throws Exception {
        List<DataSwiftLimit> datas = new ArrayList<DataSwiftLimit>();
        String sql = "SELECT limit_id, currency, amount, updateby, updatedate FROM swift_go_limit";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataSwiftLimit data = new DataSwiftLimit();
            data.setLimit_id(rs.getInt(1));
            data.setCurrency(rs.getString(2));
            data.setAmount(rs.getBigDecimal(3));
            data.setUpdateby(rs.getString(4));
            data.setUpdateDate(rs.getString(5));
            datas.add(data);
        }
        return datas;
    }

    public List<DataSwiftLimit> getAllDataSwiftLimit(String currency, String amount, String updateby) throws Exception {
        List<DataSwiftLimit> datas = new ArrayList<DataSwiftLimit>();
        String sql = "SELECT limit_id, currency, amount, updateby, updatedate FROM swift_go_limit "
                + "WHERE currency LIKE '%" + currency + "%' AND amount LIKE '%" + amount + "%' AND updateby LIKE '%" + updateby + "%' "
                + "ORDER BY currency ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataSwiftLimit data = new DataSwiftLimit();
            data.setLimit_id(rs.getInt(1));
            data.setCurrency(rs.getString(2));
            data.setAmount(rs.getBigDecimal(3));
            data.setUpdateby(rs.getString(4));
            data.setUpdateDate(rs.getString(5));
            datas.add(data);
        }
        return datas;
    }
    
    public DataSwiftLimit getSwiftLimitById(int limit_id) throws SQLException {
        DataSwiftLimit data = new DataSwiftLimit();
        String sql = "SELECT limit_id, currency, amount, updateby, updatedate FROM swift_go_limit WHERE limit_id='" + limit_id + "'";
        // System.out.println("getSwiftLimitById : " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setLimit_id(rs.getInt(1));
            data.setCurrency(rs.getString(2));
            data.setAmount(rs.getBigDecimal(3));
            data.setUpdateby(rs.getString(4));
            data.setUpdateDate(rs.getString(5));
        }
        return data;
    }

    public void updateDataSwiftLimit(DataSwiftLimit data, int limit_id, String mofier, String ip, String comp) {
        try {
            String sql = "UPDATE swift_go_limit SET currency=?, amount=?, updateby=?, updatedate=LOCALTIMESTAMP WHERE limit_id=?";
            // System.out.println("updateDataSwiftLimit : " + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getCurrency());
            st.setBigDecimal(2, data.getAmount());
            st.setString(3, data.getUpdateby());
            st.setInt(4, limit_id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah swift go limit", ip, comp);
    }

    public List<String> cekDataDuplicateSwiftLimit(String currency) throws SQLException {
        List<String> datas = new ArrayList<String>();
        String sql = "SELECT t.currency FROM swift_go_limit AS t WHERE  t.currency = '" + currency + "' ORDER BY limit_id ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1));
        }
        return datas;
    }

    public void delete(int limit_id, String mofier, String ip, String comp) throws SQLException {
        String sql = "DELETE FROM swift_go_limit WHERE limit_id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, limit_id);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "Hapus Swift Go Limit", ip, comp);
        evl.updateLogUser(mofier, "Swift Go Limit", tanggal);
    }

}
