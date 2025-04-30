/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.dbase;

import com.vensys.appcm.controller.ConvertToMD5;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import jakarta.servlet.http.HttpServletRequest;
import com.vensys.appcm.model.DataLogin;
import com.vensys.appcm.model.DataUser;

/**
 *
 * @author hadi
 */
public class DBUserData {

    Connection conn;
    int countid = 0;

    public DBUserData(Connection conn) {
        this.conn = conn;
    }

    public DataUser getUserDataById(String str) throws SQLException {
        DataUser data = new DataUser();

        String sql = "SELECT user_id,name,password,status_new,user_mt_routing,description,role,idrulepass,wrongpass,enable,sub_role,channel FROM users WHERE user_id=?";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, str);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            data.setUser_id(rs.getString(1));
            data.setName(rs.getString(2));
            data.setPassword(rs.getString(3));
            data.setStatus_new(rs.getInt(4));
            data.setUser_mt_routing(rs.getInt(5));
            data.setDescription(rs.getString(6));
            data.setRole(rs.getInt(7));
            data.setIdpassword(rs.getInt(8));
            data.setWrongpass(rs.getInt(9));
            data.setEnable(rs.getInt(10));
            data.setSub_role(rs.getInt(11));
            data.setChannel(rs.getString(12));
        }
        return data;
    }

    public DataLogin selectLastLoginBerhasil(String user_id) throws SQLException {
        DataLogin data = new DataLogin();
        String sql = "select time_login FROM login_history where status_login='1' And user_id='" + user_id + "' order by time_login desc limit 1";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            data.setLoginBerhasil(rs.getString(1));

        }
        return data;

    }

    public DataLogin selectLastLoginGagal(String user_id) throws SQLException {
        DataLogin data = new DataLogin();
        System.out.println("selectLastLoginGagal");
        String sql = "select time_login FROM login_history where status_login='0' And user_id='" + user_id + "' order by time_login desc limit 1";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            data.setLoginGagal(rs.getString(1));
        }
        return data;
    }

    public void updateUserDataPasswordById(String user_id, String password) throws SQLException, NoSuchAlgorithmException {
        String md5_password = new ConvertToMD5().convert(password);
        String sql = "Update users SET password = ?, status_new = 1 where user_id = ?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, md5_password);
        st.setString(2, user_id);
        st.executeUpdate();
    }

    public void updateWrongPass(DataUser data) {
        try {
            String sql = "UPDATE users SET wrongpass=? WHERE user_id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, data.getWrongpass());     //wrongpass
            st.setString(2, data.getUser_id());     //user_id
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateEnable(DataUser data) {
        try {
            String sql = "UPDATE users SET enable=0 WHERE user_id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getUser_id());     //user_id
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean authenticateLogin(String user_id, String password) throws Exception {
        boolean isValid = false;
        String md5_password = new ConvertToMD5().convert(password);
//        System.out.println("md5_password=" + md5_password);
//        System.out.println("password=" + password);
        String sql = "SELECT user_id, name, password, status_new, user_mt_routing, description "
                + "FROM users WHERE user_id='" + user_id + "' AND password='" + md5_password + "' AND enable=1";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            String _user_id = rs.getString(1);
            String _md5_password = rs.getString(3);
            if (_user_id.equalsIgnoreCase(user_id) && _md5_password.equalsIgnoreCase(md5_password)) {
//                System.out.println("authenticateLogin --> OK");
                isValid = true;
            }
//            System.out.println("isValid=" + isValid);
        }
        return isValid;
    }

    public boolean authenticateUser(String user_id) throws Exception {
        boolean isValid = false;
        String sql = "SELECT user_id, name, password, status_new, user_mt_routing, description, role_id "
                + "FROM users WHERE user_id= ? ";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1 , user_id);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            String _user_id = rs.getString(1);
            if (_user_id.equalsIgnoreCase(user_id)) {
                isValid = true;
            }
        }
        return isValid;
    }

    public boolean cekHistoryPass(String user_id, String password) throws Exception {
        boolean isValid = true;
        String p;
        String md5_password = new ConvertToMD5().convert(password);
        String sql = "SELECT history_pass FROM password_history where user_id='" + user_id + "' order by id_history";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            p = rs.getString("history_pass");
            countid++;
            if (md5_password.equalsIgnoreCase(p)) {
                isValid = false;
            }
        }
        return isValid;
    }

    public void modifyPassInfo(String user_id, String password) throws SQLException, NoSuchAlgorithmException {
        if (countid == 11) {
            updateUserDataPasswordById(user_id, password);
            deletePassHistory(user_id);
            insertPassHistory(user_id, password);
        } else {
            updateUserDataPasswordById(user_id, password);
            insertPassHistory(user_id, password);
        }
        countid = 0;
    }

    public void insertPassHistory(String user_id, String password) throws SQLException, NoSuchAlgorithmException {
        String md5_password = new ConvertToMD5().convert(password);
        String today = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String sql = "INSERT INTO password_history (id_history, user_id, history_pass) VALUES (?,?,?)";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, today);
        st.setString(2, user_id);
        st.setString(3, md5_password);
        st.executeUpdate();
    }

    public DataUser getUserLdapById(String str) throws SQLException {
        DataUser data = new DataUser();

        String sql = "SELECT user_id,name,user_mt_routing,description,role,enable,auto_disable FROM ldap_user WHERE user_id='" + str + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            data.setUser_id(rs.getString(1));
            data.setName(rs.getString(2));
            data.setUser_mt_routing(rs.getInt(3));
            data.setDescription(rs.getString(4));
            data.setRole(rs.getInt(5));
            data.setEnable(rs.getInt(6));
            data.setAuto_disable(rs.getInt(7));
        }
        return data;
    }

    public void deletePassHistory(String user_id) throws SQLException, NoSuchAlgorithmException {
        String sql = "WITH q AS (SELECT TOP 1 * FROM password_history WHERE user_id='?' ORDER BY id_history) DELETE FROM q";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, user_id);
        st.executeUpdate();
    }

    public void insertDataLogin(String user_id, String isLogin, String ip, String com, String tanggal, String statusLogin) {
        try {
            String sql = "Insert into login_history (user_id, time_login, status_login, ip ,hostname, islogin) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, user_id);
            st.setString(2, tanggal);
            st.setString(3, statusLogin);
            st.setString(4, ip);
            st.setString(5, com);
            st.setString(6, isLogin);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error insert data login : " + e.toString());
        }

    }

    public int getNotificationVer() throws Exception {
        int total = 0;
        Calendar now = Calendar.getInstance();
        String tanggal_transaksi_sebulan = new SimpleDateFormat("yyyy-MM-dd").format(now.getTime());
        String sql = "SELECT count(*) FROM headers WHERE flag='MOD'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            total = rs.getInt(1);
            System.out.println("total VER: " + total);
        }
        return total;
    }

    public int getNotificationAuth() throws Exception {
        int total = 0;
        Calendar now = Calendar.getInstance();
        String tanggal_transaksi_sebulan = new SimpleDateFormat("yyyy-MM-dd").format(now.getTime());
        String sql = "SELECT count(*) FROM headers WHERE flag='VER'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            total = rs.getInt(1);
            System.out.println("total AUTH: " + total);
        }
        return total;
    }

    public DataUser getUserDataByIdLDAP(String user_id) throws SQLException {
        DataUser data = new DataUser();
//        String sql = "SELECT user_id,name,user_mt_routing,description,role,enable,auto_disable FROM ldap_user WHERE user_id='" + user_id + "'";
        String sql = "SELECT user_id,name,user_mt_routing,description,role,enable,auto_disable, DATEDIFF(day, create_date, getdate()) as neverlog,DATEDIFF(day, last_login, LOCALTIMESTAMP) as nolog FROM ldap_user WHERE user_id=?";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, user_id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setUser_id(rs.getString(1));
            data.setName(rs.getString(2));
            data.setUser_mt_routing(rs.getInt(3));
            data.setDescription(rs.getString(4));
            data.setRole(rs.getInt(5));
            data.setEnable(rs.getInt(6));
            data.setAuto_disable(rs.getInt(7));
            data.setNeverlog(rs.getString(8));
            data.setNolog(rs.getString(9));
        }
        return data;
    }

    public void disableUser(String user_id) throws SQLException, NoSuchAlgorithmException {
//        String sql = "WITH q AS (SELECT TOP 1 * FROM password_history WHERE user_id='?' ORDER BY id_history) DELETE FROM q";
        String sql = "UPDATE ldap_user SET enable = '0' WHERE user_id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, user_id);
        st.executeUpdate();
    }

    public void updatewrongpass(DataUser data) {
        try {
            String sql = "UPDATE users SET wrongpass=? WHERE user_id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, data.getWrongpass());     //wrongpass
            st.setString(2, data.getUser_id());     //user_id
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
        public void updateenable(DataUser data) {
        try {
            String sql = "UPDATE users SET enable=0 WHERE user_id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getUser_id());     //user_id
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
