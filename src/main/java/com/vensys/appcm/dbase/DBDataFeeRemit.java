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
import com.vensys.appcm.model.DataFeeRemit;

/**
 *
 * @author ovasae
 */
public class DBDataFeeRemit {

    Connection conn;

    public DBDataFeeRemit(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addDataFeeRemit(DataFeeRemit data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO fee_remittance (currency,fee_amount) VALUES (?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getCurrency());
            st.setBigDecimal(2, data.getFee_amount());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah Fee Remittance", ip, comp);
    }

    public void updateDataFeeRemit(DataFeeRemit data, int fee_id, String mofier, String ip, String comp) {
        try {
            String sql = "UPDATE fee_remittance SET currency=?,fee_amount=? WHERE fee_id=?";
            System.out.println("update fee remit " + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getCurrency());
            st.setBigDecimal(2, data.getFee_amount());
            st.setInt(3, fee_id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah Fee Remittance", ip, comp);
    }

    public List<DataFeeRemit> getAllDataFeeRemit() throws Exception {
        List<DataFeeRemit> datas = new ArrayList<DataFeeRemit>();
        String sql = "SELECT fee_id, currency, fee_amount FROM fee_remittance";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataFeeRemit data = new DataFeeRemit();
            data.setFee_id(rs.getInt(1));
            data.setCurrency(rs.getString(2));
            data.setFee_amount(rs.getBigDecimal(3));
            datas.add(data);
        }
        return datas;
    }

    public List<DataFeeRemit> getAllDataRemite(String currency, String fee_amount) throws Exception {
        List<DataFeeRemit> datas = new ArrayList<DataFeeRemit>();
        String sql = "SELECT fee_id, currency, fee_amount "
                + "WHERE currency LIKE '%" + currency + "%' AND fee_amount LIKE '%" + fee_amount + "%' "
                + "ORDER BY currency ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataFeeRemit data = new DataFeeRemit();
            data.setFee_id(rs.getInt(1));
            data.setCurrency(rs.getString(2));
            data.setFee_amount(rs.getBigDecimal(3));
            datas.add(data);
        }
        return datas;
    }

    public DataFeeRemit getDataFeeRemitById(int fee_id) throws SQLException {
        DataFeeRemit data = new DataFeeRemit();
        String sql = "SELECT fee_id, currency, fee_amount FROM fee_remittance WHERE fee_id = '" + fee_id + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setFee_id(rs.getInt(1));
            data.setCurrency(rs.getString(2));
            data.setFee_amount(rs.getBigDecimal(3));
        }
        return data;
    }

    public void delete(int fee_id, String mofier, String ip, String comp) throws SQLException {
        String sql = "DELETE FROM fee_remittance WHERE fee_id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, fee_id);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "Hapus Fee Remittance", ip, comp);
        evl.updateLogUser(mofier, "Fee Remittance", tanggal);
    }

    public List<String> cekDataDuplicateFeeRemit(String currency) throws SQLException {
        List<String> datas = new ArrayList<String>();
        String sql = "SELECT t.currency FROM fee_remittance AS t WHERE  t.currency = '" + currency + "' ORDER BY fee_id ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1));
        }
        return datas;
    }

}
