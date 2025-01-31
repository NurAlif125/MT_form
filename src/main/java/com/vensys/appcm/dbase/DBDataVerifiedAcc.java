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
import com.vensys.appcm.model.DataVerifiedAcc;

/**
 *
 * @author hadi
 */
public class DBDataVerifiedAcc {

    Connection conn;

    public DBDataVerifiedAcc(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addDataAcc(DataVerifiedAcc data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO verified_account (acc,nameFromTrx,nameFromCore,verified,verified_date) VALUES (?,?,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getAcc());     
            st.setString(2, data.getNameFromTrx());     
            st.setString(3, data.getNameFromCore());     
            st.setString(4, data.getVerified());     
            st.setString(5, data.getVerified_date());     
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah Verified Account", ip, comp);
    }

    public void updateDataAcc(DataVerifiedAcc data, int id_account, String mofier, String ip, String comp) {
        try {
            String sql = "UPDATE verified_account SET acc=?,nameFromTrx=?,nameFromCore=?,verified=?,verified_date=? WHERE id_verAcc=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getAcc());     
            st.setString(2, data.getNameFromTrx());     
            st.setString(3, data.getNameFromCore());     
            st.setString(4, data.getVerified()); 
            st.setString(5, data.getVerified_date()); 
            st.setInt(6, data.getId_verAcc()); 
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah Verified Account", ip, comp);
    }

    public List<DataVerifiedAcc> getAllDataAcc() throws Exception {
        List<DataVerifiedAcc> datas = new ArrayList<DataVerifiedAcc>();
        String sql = "SELECT id_verAcc, acc, nameFromTrx, nameFromCore, verified, verified_date FROM verified_account";
        System.out.println("sql 1 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataVerifiedAcc data = new DataVerifiedAcc();
            data.setId_verAcc(rs.getInt(1));   
            data.setAcc(rs.getString(2));  
            data.setNameFromTrx(rs.getString(3));    
            data.setNameFromCore(rs.getString(4));     
            data.setVerified(rs.getString(5));     
            data.setVerified_date(rs.getString(6));     
            datas.add(data);
        }
        return datas;
    }

    public List<DataVerifiedAcc> getAllDataAcc(String acc, String nameFromTrx, String nameFromCore) throws Exception {
        List<DataVerifiedAcc> datas = new ArrayList<DataVerifiedAcc>();
//        String sql = "SELECT user_id,name,password,status_new,user_mt_routing,description,role,enable,role_name FROM [user] LEFT JOIN roles ON role=role_id "
        String sql = "SELECT id_verAcc, acc, nameFromTrx, nameFromCore, verified, verified_date FROM verified_account "
                + "WHERE acc LIKE '%" + acc + "%' AND nameFromTrx LIKE '%" + nameFromTrx + "%' "
                + "AND nameFromCore LIKE '%" + nameFromCore + "%' " + "ORDER BY acc ASC";
        System.out.println("sql 2 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataVerifiedAcc data = new DataVerifiedAcc();
            data.setId_verAcc(rs.getInt(1));  
            data.setAcc(rs.getString(2));  
            data.setNameFromTrx(rs.getString(3));    
            data.setNameFromCore(rs.getString(4));  
            data.setVerified(rs.getString(5));  
            data.setVerified_date(rs.getString(6));  
            datas.add(data);
        }
        return datas;
    }

    public DataVerifiedAcc getDataAccById(int id_verAcc) throws SQLException {
        DataVerifiedAcc data = new DataVerifiedAcc();
        String sql = "SELECT id_verAcc, acc, nameFromTrx, nameFromCore, verified, verified_date FROM verified_account WHERE id_verAcc='" + id_verAcc + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_verAcc(rs.getInt(1));   
            data.setAcc(rs.getString(2));  
            data.setNameFromTrx(rs.getString(3));     
            data.setNameFromCore(rs.getString(4));     
            data.setVerified(rs.getString(5));     
            data.setVerified_date(rs.getString(6));     
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

    public void delete(int id_verAcc, String mofier, String ip, String comp) throws SQLException {
        String sql = "DELETE FROM verified_account WHERE id_verAcc=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id_verAcc);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "Hapus Verified Account", ip, comp);
        evl.updateLogUser(mofier, "Verified Account", tanggal);
    }

}
