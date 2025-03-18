/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

import com.vensys.appcm.model.DataUser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author HP PROBOOK 430 G8
 */
public class DBnotification {
    Connection conn;
    int countid = 0;

    public DBnotification(Connection conn) {
        this.conn = conn;
    }
    
    public int getCountNotif(String userId, String roleId) throws SQLException {
        int data = 0;
        String sql = "select count(id_notif) as count from notifications \n" +
                    "WHERE ? = ANY(string_to_array(COALESCE(msg_to_role, ''), ','))\n" +
                    "AND NOT (? = ANY(string_to_array(COALESCE(is_read_userid, ''), ',')));";
        
//        PreparedStatement st = this.conn.prepareStatement(sql);
        try (PreparedStatement st = this.conn.prepareStatement(sql)) {  // Auto-close PreparedStatement
            st.setString(1, roleId); 
            st.setString(2, userId);
//            ResultSet rs = st.executeQuery();
            
            try (ResultSet rs = st.executeQuery()) {  // Auto-close ResultSet
                if (rs.next()) {

                    System.out.println("DBNOTIFICATION.java jumlah data notif"+String.valueOf(rs.getInt("count")));
                    data = rs.getInt("count");
                }
            }
        }
        return data;
    }
    
    public List<Map<String, String>> getNotificationList(String userId, String roleId) throws SQLException {
        List<Map<String, String>> notifications = new ArrayList<>();
        String sql = "SELECT id_notif, title_msg, msg_body FROM notifications \n" +
                     "WHERE ? = ANY(string_to_array(COALESCE(msg_to_role, ''), ','))\n" +
                     "AND NOT (? = ANY(string_to_array(COALESCE(is_read_userid, ''), ',')))\n" +
                     "ORDER BY created_at DESC;";

        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            st.setString(1, roleId);
            st.setString(2, userId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> notif = new HashMap<>();
                    notif.put("id", rs.getString("id_notif"));
                    notif.put("title", rs.getString("title_msg"));
                    notif.put("message", rs.getString("msg_body"));
                    notifications.add(notif);
                }
            }
        }
        return notifications;
    }
    
    public List<Map<String, String>> markAsReadNotif(String userId, String roleId) throws SQLException {
        List<Map<String, String>> datas = new ArrayList<>();
        String sql = "SELECT id_notif, title_msg, msg_body FROM notifications \n" +
                     "WHERE ? = ANY(string_to_array(COALESCE(msg_to_role, ''), ','))\n" +
                     "AND NOT (? = ANY(string_to_array(COALESCE(is_read_userid, ''), ',')))\n" +
                     "ORDER BY created_at DESC;";

        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            st.setString(1, roleId);
            st.setString(2, userId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> notif = new HashMap<>();
                    notif.put("id", rs.getString("id_notif"));
                    notif.put("title", rs.getString("title_msg"));
                    notif.put("message", rs.getString("msg_body"));
                    datas.add(notif);
                }
            }
        }
        return datas;
    }
    
    
}
