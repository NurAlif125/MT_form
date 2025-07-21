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
import com.vensys.appcm.model.DataUserActivity;

/**
 *
 * @author AplDev2
 */
public class DBLogEvent {

    Connection conn;

    public DBLogEvent(Connection conn) {
        this.conn = conn;
    }

    public ArrayList<DataUserActivity> getAllDataLogEvent(String date_from, String date_end) throws Exception {
        ArrayList<DataUserActivity> datas = new ArrayList<DataUserActivity>();
        String sql = "select user_id,event_date, hostname, ip, description from event_log where event_date BETWEEN '" + date_from + "' AND '" + date_end + " 23:59:00' order by event_date DESC";
//        System.out.println("getAllDataLogEvent : " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataUserActivity data = new DataUserActivity();
            data.setUser_id(rs.getString(1));
            data.setEvent_date(rs.getString(2));
            data.setHostname(rs.getString(3));
            data.setIp(rs.getString(4));
            data.setDescription(rs.getString(5));
            datas.add(data);
        }
        return datas;
    }

    public ArrayList<DataUserActivity> getAllDataLogEventById(String date_from, String date_end, String user_idlog) throws Exception {
        ArrayList<DataUserActivity> datas = new ArrayList<DataUserActivity>();
        String sql = "select user_id,event_date, hostname, ip, description from event_log where event_date BETWEEN '" + date_from + "' AND '" + date_end + " 23:59:00' And user_id = '" + user_idlog + "' order by event_date DESC";
//        System.out.println("sql activity : "+sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataUserActivity data = new DataUserActivity();
            data.setUser_id(rs.getString(1));
            data.setEvent_date(rs.getString(2));
            data.setHostname(rs.getString(3));
            data.setIp(rs.getString(4));
            data.setDescription(rs.getString(5));
            datas.add(data);
        }
        return datas;
    }
}
