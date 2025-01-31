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
import com.vensys.appcm.model.DataCharges;

/**
 *
 * @author hadi
 */
public class DBCharges {

    Connection conn;

    public DBCharges(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addDataCharges(DataCharges data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO charges(currency,charges) VALUES (?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getCurrency());     
            st.setDouble(2, Double.parseDouble(data.getCharges().replaceAll(",", ".")));     
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah Charges", ip, comp);
    }

    public void updateDataCharges(DataCharges data, int id_charges, String mofier, String ip, String comp) {
        try {
            String sql = "UPDATE charges SET currency=?,charges=? WHERE id_charges=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getCurrency());     
            st.setDouble(2, Double.parseDouble(data.getCharges().replaceAll(",", ".")));      
            st.setInt(3, id_charges);     
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah Charges", ip, comp);
    }

    public List<DataCharges> getAllDataCharges() throws Exception {
        List<DataCharges> datas = new ArrayList<DataCharges>();
        String sql = "SELECT id_charges, currency, charges FROM charges";
//        System.out.println("sql 1 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataCharges data = new DataCharges();
            data.setId_charges(rs.getInt(1));   
            data.setCurrency(rs.getString(2));  
            data.setCharges(rs.getString(3));    
            datas.add(data);
        }
        return datas;
    }

    public List<DataCharges> getAllDataCharges(String currency, String charges) throws Exception {
        List<DataCharges> datas = new ArrayList<DataCharges>();
//        String sql = "SELECT user_id,name,password,status_new,user_mt_routing,description,role,enable,role_name FROM [user] LEFT JOIN roles ON role=role_id "
        String sql = "SELECT id_charges, currency, charges FROM charges "
                + "WHERE currency LIKE '%" + currency + "%' AND charges LIKE '%" + charges + "%' "
                + "ORDER BY currency ASC";
        System.out.println("sql 2 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataCharges data = new DataCharges();
            data.setId_charges(rs.getInt(1));  
            data.setCurrency(rs.getString(2));  
            data.setCharges(rs.getString(3));    
            datas.add(data);
        }
        return datas;
    }

    public DataCharges getDataChargesById(int id_charges) throws SQLException {
        DataCharges data = new DataCharges();
        String sql = "SELECT id_charges, currency, charges FROM charges WHERE id_charges='" + id_charges + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_charges(rs.getInt(1));   
            data.setCurrency(rs.getString(2));  
            data.setCharges(rs.getString(3));     
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

    public void delete(int id_charges, String mofier, String ip, String comp) throws SQLException {
        String sql = "DELETE FROM charges WHERE id_charges=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id_charges);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "Hapus Charges", ip, comp);
        evl.updateLogUser(mofier, "Charges", tanggal);
    }
    
    public List<String> cekDataDuplicateChanges(String currency) throws SQLException {
        List<String> datas = new ArrayList<String>();
        String sql = "SELECT t.currency,t.charges FROM charges AS t WHERE  t.currency = '"+currency+"' ORDER BY charges ASC";
//        String sql = "select id_account from account_penagihan";
        System.out.println("sql cek Data Duplicate Acc Penagih = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1));
        }
        return datas;
    }

}
