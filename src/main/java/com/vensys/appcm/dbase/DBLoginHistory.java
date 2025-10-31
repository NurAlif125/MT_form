/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

/**
 *
 * @author RIZKY
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.vensys.appcm.model.DataLoginHistory;

/**
 *
 * @author AplDev2
 */
public class DBLoginHistory {

    Connection conn;

    public DBLoginHistory(Connection conn) {
        this.conn = conn;
    }

    public ArrayList<DataLoginHistory> getAllDataHistoryLogin(String date_from, String date_end) throws Exception {
        ArrayList<DataLoginHistory> datas = new ArrayList<DataLoginHistory>();
        String sql = "select user_id,time_login,ip, hostname,status_login from login_history where time_login BETWEEN '" + date_from + "' AND '" + date_end + " 23:59:00'";
        System.out.println("getAllDataHistoryLogin : " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataLoginHistory data = new DataLoginHistory();
            data.setUser_id(rs.getString(1));
            data.setTime_login(rs.getString(2));
            data.setHostname(rs.getString(3));
            data.setIp(rs.getString(4));
            if (rs.getString(5).equals("1")) {
                data.setStatus_login("Berhasil");
            } else {
                data.setStatus_login("Gagal");
            }
            datas.add(data);
        }
        return datas;
    }

    public ArrayList<DataLoginHistory> getAllDataHistoryLoginById(String date_from, String date_end, String user_id) throws Exception {
        ArrayList<DataLoginHistory> datas = new ArrayList<DataLoginHistory>();
        String sql = "select user_id,time_login,ip, hostname,status_login from login_history where time_login BETWEEN '" + date_from + "' AND '" + date_end + " 23:59:00' And user_id ='" + user_id + "' ";
        System.out.println(sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataLoginHistory data = new DataLoginHistory();
            data.setUser_id(rs.getString(1));
            data.setTime_login(rs.getString(2));
            data.setHostname(rs.getString(3));
            data.setIp(rs.getString(4));
            if (rs.getString(5).equals("1")) {
                data.setStatus_login("Berhasil");
            } else {
                data.setStatus_login("Gagal");
            }

            datas.add(data);
        }
        return datas;
    }
}
