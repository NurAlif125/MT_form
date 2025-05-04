/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.dbase;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.vensys.appcm.model.DataRole;

/**
 *
 * @author hadi
 */
public class DBDataRole {

    Connection conn;

    public DBDataRole(Connection conn) {
        this.conn = conn;
    }

    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    public void addDataRole(DataRole data, String modifier, String ip, String comp) {
//        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "INSERT INTO roles (role_name,role_detail,role_desc,timeout) VALUES (?,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
//            BigDecimal bd = new BigDecimal(data.getLimit());
            st.setString(1, data.getRole_name()); //role_name
            st.setString(2, data.getRole_detail());     //role_detail
            st.setString(3, data.getRole_desc());     //role_desc
            st.setInt(4, data.getTimeout());
//            st.setBigDecimal(4, bd);
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(modifier, "Tambah role", ip, comp);
        evl.updateLogUser(modifier, "role", tanggal);
    }

    public void updateDataRole(DataRole data, String modifier, String ip, String comp) {
        try {
            String sql = "UPDATE roles SET role_name=?,role_detail=?,role_enable=?,role_desc=?, timeout=? WHERE role_id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
//            BigDecimal db = new BigDecimal(data.getLimit());
            st.setString(1, data.getRole_name());     //role_name
            st.setString(2, data.getRole_detail());     //role_detail
            st.setInt(3, data.getRole_enable());     //role_enable
            st.setString(4, data.getRole_desc());     //role_desc
            st.setInt(5, data.getTimeout());     //timeout
//            st.setBigDecimal(5, db);
            st.setInt(6, data.getRole_id());     //role_id
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(modifier, "Ubah role", ip, comp);
        evl.updateLogUser(modifier, "role", tanggal);
    }

    public List<DataRole> getAllDataRole() throws Exception {
        List<DataRole> datas = new ArrayList<DataRole>();
        String sql = "SELECT role_id,role_name,role_detail,role_enable,role_desc,timeout FROM roles where role_enable !=2 ORDER BY role_name ASC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataRole data = new DataRole();
            data.setRole_id(rs.getInt(1));   //role_id
            data.setRole_name(rs.getString(2));   //role_name
            data.setRole_detail(rs.getString(3));  //role_detail
            data.setRole_enable(rs.getInt(4));     //role_enable
            data.setRole_desc(rs.getString(5));     //role_desc
            data.setTimeout(rs.getInt(6));     //timeout
            datas.add(data);
        }
        return datas;
    }

    public List<DataRole> getAllDataRole(String role_name) throws Exception {
        List<DataRole> datas = new ArrayList<DataRole>();
        String sql = "SELECT role_id,role_name,role_detail,role_enable,role_desc,timeout FROM roles "
                + "WHERE role_name LIKE '%" + role_name + "%' ORDER BY role_name ASC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataRole data = new DataRole();
            data.setRole_id(rs.getInt(1));   //role_id
            data.setRole_name(rs.getString(2));   //role_name
            data.setRole_detail(rs.getString(3));  //role_detail
            data.setRole_enable(rs.getInt(4));     //role_enable
            data.setRole_desc(rs.getString(5));     //role_desc
            data.setTimeout(rs.getInt(6));     //timeout
            datas.add(data);
        }
        return datas;
    }
    
     public List<DataRole> getAllDataRoleForm() throws Exception {
        List<DataRole> datas = new ArrayList<DataRole>();
        String sql = "SELECT role_id,role_name,role_detail,role_enable,role_desc,timeout FROM roles where role_enable NOT IN (0,2) ORDER BY role_name ASC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataRole data = new DataRole();
            data.setRole_id(rs.getInt(1));   //role_id
            data.setRole_name(rs.getString(2));   //role_name
            data.setRole_detail(rs.getString(3));  //role_detail
            data.setRole_enable(rs.getInt(4));     //role_enable
            data.setRole_desc(rs.getString(5));     //role_desc
            data.setTimeout(rs.getInt(6));     //timeout
            datas.add(data);
        }
        return datas;
    }

    public DataRole getDataRoleById(String role_id) throws SQLException {
        DataRole data = new DataRole();
        String sql = "SELECT role_id,role_name,role_detail,role_enable,role_desc,timeout FROM roles WHERE role_id='" + role_id + "'";
//        System.out.println("sql injection =" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
//            BigInteger bd = new BigInteger(rs.getString(6));
            data.setRole_id(rs.getInt(1));   //role_id
            data.setRole_name(rs.getString(2));   //role_name
            data.setRole_detail(rs.getString(3));  //role_detail
            data.setRole_enable(rs.getInt(4));     //role_enable
            data.setRole_desc(rs.getString(5));     //role_desc
            data.setTimeout(rs.getInt(6));     //timeout
        }
        return data;
    }

    public ArrayList<DataRole> getAllDataRoleReport(String status) throws Exception {
        ArrayList<DataRole> datas = new ArrayList<DataRole>();
        String where = "";
        if (status != "") {
            where = "WHERE role_enable = '" + status + "'";
        }
        String sql = "SELECT role_name, role_detail, role_desc,timeout FROM roles "+ where;
//        System.out.println("sql 2 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataRole data = new DataRole();
            data.setRole_name(rs.getString(1)); 
            data.setRole_detail(rs.getString(2).replace(",", "\n")); 
            data.setRole_desc(rs.getString(3));  
            data.setTimeout(rs.getInt(4));  
            datas.add(data);
        }
        return datas;
    }
    
    public void delete(Integer role_id, String modifier, String ip, String comp) throws SQLException {
        String sql = "DELETE FROM roles WHERE role_id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, role_id);
        st.executeUpdate();
        System.out.println(st);
        evl.insertDataEvent(modifier, "Hapus role", ip, comp);
        evl.updateLogUser(modifier, "role", tanggal);
    }
    
    public boolean cekDataDuplicateRole(String role_name) throws SQLException {
        boolean datas = false;
        String sql = "SELECT role_name FROM roles WHERE role_name = '"+role_name+"' ORDER BY role_id ASC";
//        String sql = "select id_account from account_penagihan";
        System.out.println("sql cek duplicate role_name = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas = true;
        }
        return datas;
    }
    
    public boolean roleIsUsed(int role_id) throws SQLException {
        boolean datas = false;
        String sql = "SELECT * from users where role = ? and enable!=2";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, role_id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas = true;
        }
        System.out.println("sini"+ datas);
        return datas;
    }
    
    public void disablePermanent(Integer role_id, String modifier, String ip, String comp) throws SQLException {
        String sql = "update roles set role_enable = 2, disable_permanent = CURRENT_TIMESTAMP WHERE role_id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, role_id);
        st.executeUpdate();
        System.out.println(st);
        evl.insertDataEvent(modifier, "Disable Permanent role", ip, comp);
        evl.updateLogUser(modifier, "role", tanggal);
    }
    
    public List<DataRole> getAllDisableDataRole() throws Exception {
        List<DataRole> datas = new ArrayList<DataRole>();
        String sql = "SELECT role_name,role_desc,timeout,disable_permanent FROM roles where role_enable = 2 ORDER BY role_name ASC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataRole data = new DataRole();
            data.setRole_name(rs.getString(1));   //role_name
            data.setRole_desc(rs.getString(2));     //role_desc
            data.setTimeout(rs.getInt(3));  //timeout
            data.setDisable_permanent(rs.getDate(4));//timeout
            System.out.println("data tanggal disble ="+ data.getDisable_permanent());
            datas.add(data);
        }
        
        
        return datas;
       
    }
}
