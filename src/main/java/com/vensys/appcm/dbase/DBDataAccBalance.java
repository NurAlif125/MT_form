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
import com.vensys.appcm.model.DataAccBalance;

/**
 *
 * @author ovasae
 */
public class DBDataAccBalance {

    Connection conn;

    public DBDataAccBalance(Connection conn) {
        this.conn = conn;
    }

    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addDataAccBalance(DataAccBalance data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO account_balance (account,value_date,balance,always_send,sequence_stmt,sequence_date, id_account) VALUES (?,?,?,?,?,CURRENT_DATE,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getAccount());
            st.setString(2, data.getValue_date());
            st.setBigDecimal(3, data.getBalance());
            st.setString(4, data.getAlways_send());
            st.setInt(5, data.getSequence_stmt());
            st.setString(6, data.getId_account());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah Account Balance", ip, comp);
    }

    public void updateDataAccBalance(DataAccBalance data, String mofier, String ip, String comp) {
        try {
            String sql = "UPDATE account_balance SET account=?,value_date=?,balance=?,always_send=? WHERE id_account=?";
//            String sql = "UPDATE account_balance SET account=?,value_date=?,balance=? WHERE id_account=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getAccount());
            st.setString(2, data.getValue_date());
            st.setBigDecimal(3, data.getBalance());
            st.setString(4, data.getAlways_send());
            st.setString(5, data.getId_account());
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah Account Balance", ip, comp);
    }

    public List<DataAccBalance> getAllDataAccBalance() throws Exception {
        List<DataAccBalance> datas = new ArrayList<>();
        String sql = "SELECT id_account, account, value_date, balance, always_send, sequence_stmt, sequence_date FROM account_balance";
        // System.out.println("getAllDataAccBalance 70 " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataAccBalance data = new DataAccBalance();
            data.setId_account(rs.getString(1));
            data.setAccount(rs.getString(2));
            data.setValue_date(rs.getString(3));
            data.setBalance(rs.getBigDecimal(4));
            data.setAlways_send(rs.getString(5));
            data.setSequence_stmt(rs.getInt(6));
            data.setSequence_date(rs.getString(7));
            datas.add(data);
        }
        return datas;
    }

    public List<DataAccBalance> getAllDataAccBalance(String account, String value_date, String balance, String always_send, String sequence_stmt, String sequence_date) throws Exception {
        List<DataAccBalance> datas = new ArrayList<>();
        String sql = "SELECT id_account, account, value_date, balance, always_send FROM account_balance "
                + "WHERE account LIKE '%" + account + "%' AND value_date LIKE '%" + value_date + "%' "
                + "AND balance LIKE '%" + balance + "%' AND always_send LIKE '%" + always_send + "%' "
                + "AND sequence_stmt LIKE '%" + sequence_stmt + "%' AND sequence_date LIKE '%" + sequence_date + "%' "
                + "ORDER BY currency ASC";
        // System.out.println("getAllDataAccBalance 85 " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataAccBalance data = new DataAccBalance();
            data.setId_account(rs.getString(1));
            data.setAccount(rs.getString(2));
            data.setValue_date(rs.getString(3));
            data.setBalance(rs.getBigDecimal(4));
            data.setAlways_send(rs.getString(5));
            data.setSequence_stmt(rs.getInt(6));
            data.setSequence_date(rs.getString(7));
            datas.add(data);
        }
        return datas;
    }

    public DataAccBalance getDataAccBalanceById(String id_account) throws SQLException {
        DataAccBalance data = new DataAccBalance();
        String sql = "SELECT id_account, account, value_date, balance, always_send, sequence_stmt, sequence_date FROM account_balance WHERE id_account='" + id_account + "'";
        // System.out.println("getDataAccBalanceById 109 " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_account(rs.getString(1));
            data.setAccount(rs.getString(2));
            data.setValue_date(rs.getString(3));
            data.setBalance(rs.getBigDecimal(4));
            data.setAlways_send(rs.getString(5));
            data.setSequence_stmt(rs.getInt(6));
            data.setSequence_date(rs.getString(7));
        }
        return data;
    }

    public void delete(String id_account, String mofier, String ip, String comp) throws SQLException {
        String sql = "DELETE FROM account_balance WHERE id_account=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, id_account);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "Hapus Account Balance", ip, comp);
        evl.updateLogUser(mofier, "Account Balance", tanggal);
    }

    public List<String> cekDataDuplicateAccBalance(String account) throws SQLException {
        List<String> datas = new ArrayList<>();
        String sql = "SELECT t.account FROM account_balance AS t WHERE t.account = '" + account + "' ORDER BY account ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1));
        }
        return datas;
    }

}
