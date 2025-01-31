/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

/**
 *
 * @author T430
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
import com.vensys.appcm.model.DataAccPenagih;

/**
 *
 * @author hadi
 */
public class DBDataAccPenagih {

    Connection conn;

    public DBDataAccPenagih(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addDataAcc(DataAccPenagih data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO account_penagihan (currency,swift_code,account) VALUES (?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getCurrency());     
            st.setString(2, data.getSwift_code());     
            st.setString(3, data.getAccount());     
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah Account Penagih", ip, comp);
    }

    public void updateDataAcc(DataAccPenagih data, int id_account, String mofier, String ip, String comp) {
        try {
            String sql = "UPDATE account_penagihan SET currency=?,swift_code=?,account=? WHERE id_account=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getCurrency());     
            st.setString(2, data.getSwift_code());     
            st.setString(3, data.getAccount());     
            st.setInt(4, id_account); 
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah Account Penagih", ip, comp);
    }

    public List<DataAccPenagih> getAllDataAcc() throws Exception {
        List<DataAccPenagih> datas = new ArrayList<DataAccPenagih>();
        String sql = "SELECT id_account, currency, swift_code, account FROM account_penagihan";
//        System.out.println("sql 1 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataAccPenagih data = new DataAccPenagih();
            data.setId_account(rs.getInt(1));   
            data.setCurrency(rs.getString(2));  
            data.setSwift_code(rs.getString(3));    
            data.setAccount(rs.getString(4));     
            datas.add(data);
        }
        return datas;
    }

    public List<DataAccPenagih> getAllDataAcc(String currency, String swift_code, String account) throws Exception {
        List<DataAccPenagih> datas = new ArrayList<DataAccPenagih>();
//        String sql = "SELECT user_id,name,password,status_new,user_mt_routing,description,role,enable,role_name FROM [user] LEFT JOIN roles ON role=role_id "
        String sql = "SELECT id_account, currency, swift_code, account FROM account_penagihan "
                + "WHERE currency LIKE '%" + currency + "%' AND swift_code LIKE '%" + swift_code + "%' "
                + "AND account LIKE '%" + account + "%' " + "ORDER BY currency ASC";
        System.out.println("sql 2 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataAccPenagih data = new DataAccPenagih();
            data.setId_account(rs.getInt(1));  
            data.setCurrency(rs.getString(2));  
            data.setSwift_code(rs.getString(3));    
            data.setAccount(rs.getString(4));  
            datas.add(data);
        }
        return datas;
    }

    public DataAccPenagih getDataAccById(int id_account) throws SQLException {
        DataAccPenagih data = new DataAccPenagih();
        String sql = "SELECT id_account, currency, swift_code, account FROM account_penagihan WHERE id_account='" + id_account + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_account(rs.getInt(1));   
            data.setCurrency(rs.getString(2));  
            data.setSwift_code(rs.getString(3));     
            data.setAccount(rs.getString(4));     
        }
        return data;
    }

//    public ArrayList<DataAccPenagih> getAllDataAccReport() throws Exception {
//        ArrayList<DataAccPenagih> datas = new ArrayList<DataAccPenagih>();
//
//        String sql = "SELECT id_headers, currency, swift_code, account FROM account_penagihan ";
////        System.out.println("sql 2 = " + sql);
//        PreparedStatement st = this.conn.prepareStatement(sql);
//        ResultSet rs = st.executeQuery();
//        while (rs.next()) {
//            DataAccPenagih data = new DataAccPenagih();
//            data.setId_account(rs.getInt(1));  
//            data.setCurrency(rs.getString(2)); 
//            data.setSwift_code(rs.getString(3));     
//            data.setAccount(rs.getString(4));    
//            datas.add(data);
//        }
//        return datas;
//    }

    public void delete(int id_account, String mofier, String ip, String comp) throws SQLException {
        String sql = "DELETE FROM account_penagihan WHERE id_account=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id_account);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "Hapus Account Penagihan", ip, comp);
        evl.updateLogUser(mofier, "Account Penagihan", tanggal);
    }
    
    public List<String> cekDataDuplicateAccPenagih2(String swift_code, String account) throws SQLException {
        List<String> datas = new ArrayList<String>();
        String sql = "SELECT t.swift_code,t.account FROM account_penagihan AS t WHERE  t.swift_code = '"+swift_code+"'  AND t.account = '"+account+"' ORDER BY account ASC";
//        String sql = "select id_account from account_penagihan";
        System.out.println("sql cek Data Duplicate Acc Penagih = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1)+"#"+rs.getString(2));
        }
        return datas;
    }

}
