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
import com.vensys.appcm.model.DataNostro;

/**
 *
 * @author hadi
 */
public class DBDataNostro {

    Connection conn;

    public DBDataNostro(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addDataNostro(DataNostro data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO nostro (swift_code,name,address,ssl_no,ssl_name,currency_codes,acc_no,city,country) VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getSwift_code());     
            st.setString(2, data.getName());     
            st.setString(3, data.getAddress()); 
            st.setInt(4, data.getSsl_no());
            st.setString(5, data.getSsl_name());
            st.setString(6, data.getCurrency_codes());
            st.setString(7, data.getAcc_no());
            st.setString(8, data.getCity());
            st.setString(9, data.getCountry());
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah Nostro", ip, comp);
    }

    public void updateDataNostro(DataNostro data, int id_member, String mofier, String ip, String comp) {
        try {
            String sql = "UPDATE nostro SET swift_code=?,name=?,address=?,ssl_no =?,ssl_name=?,currency_codes=?,acc_no=?,city=?,country=? WHERE id_member=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getSwift_code());     
            st.setString(2, data.getName());     
            st.setString(3, data.getAddress());
            st.setInt(4, data.getSsl_no());
            st.setString(5, data.getSsl_name());
            st.setString(6, data.getCurrency_codes());
            st.setString(7, data.getAcc_no());
            st.setString(8, data.getCity());
            st.setString(9, data.getCountry());
            st.setInt(10, id_member);
            // System.out.println("sql update Nostro = " + sql);
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah Nostro", ip, comp);
    }

    public List<DataNostro> getAllDataNostro() throws Exception {
        List<DataNostro> datas = new ArrayList<DataNostro>();
        String sql = "SELECT id_member, swift_code,name,address,ssl_no,ssl_name,currency_codes,acc_no,city,country FROM nostro";
//        System.out.println("sql 1 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataNostro data = new DataNostro();
            data.setId_member(rs.getInt(1));   
            data.setSwift_code(rs.getString(2));
            data.setName(rs.getString(3));
            data.setAddress(rs.getString(4));
            data.setSsl_no(rs.getInt(5));
            data.setSsl_name(rs.getString(6));
            data.setCurrency_codes(rs.getString(7));
            data.setAcc_no(rs.getString(8));
            data.setCity(rs.getString(9));
            data.setCountry(rs.getString(10));
            datas.add(data);
        }
        return datas;
    }

    public List<DataNostro> getAllDataNostro(String swift_code, String name, String address) throws Exception {
        List<DataNostro> datas = new ArrayList<DataNostro>();
//        String sql = "SELECT user_id,name,password,status_new,user_mt_routing,description,role,enable,role_name FROM [user] LEFT JOIN roles ON role=role_id "
        String sql = "SELECT id_member, swift_code, name, address FROM nostro "
                + "WHERE swift_code LIKE '%" + swift_code + "%' AND name LIKE '%" + name + "%' "
                + "AND address LIKE '%" + address + "ORDER BY currency ASC";
        System.out.println("sql 2 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataNostro data = new DataNostro();
            data.setId_member(rs.getInt(1));  
            data.setSwift_code(rs.getString(2));  
            data.setName(rs.getString(3));    
            data.setAddress(rs.getString(4));  
            datas.add(data);
        }
        return datas;
    }

    public DataNostro getDataNostroById(int id_member) throws SQLException {
        DataNostro data = new DataNostro();
        String sql = "SELECT id_member, swift_code, name, address, ssl_no, ssl_name, currency_codes, acc_no, city, country FROM nostro WHERE id_member='" + id_member + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_member(rs.getInt(1));   
            data.setSwift_code(rs.getString(2));  
            data.setName(rs.getString(3));     
            data.setAddress(rs.getString(4));
            data.setSsl_no(rs.getInt(5));
            data.setSsl_name(rs.getString(6));
            data.setCurrency_codes(rs.getString(7));
            data.setAcc_no(rs.getString(8));
            data.setCity(rs.getString(9));
            data.setCountry(rs.getString(10));
        }
        return data;
    }


    public void delete(int id_member, String mofier, String ip, String comp) throws SQLException {
        String sql = "DELETE FROM nostro WHERE id_member=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id_member);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "Hapus Nostro", ip, comp);
        evl.updateLogUser(mofier, "Nostro", tanggal);
    }
    
    public List<String> cekDataDuplicateNostro(String swift_code) throws SQLException {
        List<String> datas = new ArrayList<String>();
        String sql = "SELECT t.swift_code FROM nostro AS t WHERE  t.swift_code = ? ORDER BY id_member ASC";
        System.out.println("sql cek Data Duplicate Nostro = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, swift_code);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1));
        }
        return datas;
    }
    
}

