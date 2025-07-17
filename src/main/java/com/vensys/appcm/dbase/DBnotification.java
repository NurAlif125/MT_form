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
import org.apache.log4j.Logger;

/**
 *
 * @author HP PROBOOK 430 G8
 */
public class DBnotification {
    Connection conn;
    int countid = 0;
    Logger log = Logger.getLogger(getClass().getName());

    public DBnotification(Connection conn) {
        this.conn = conn;
    }
    
    public int getCountNotif(String userId, String roleId) throws SQLException {
        int data = 0;
        String sql = "select count(id_notif) as count from notifications \n" +
                    "WHERE ? = ANY(string_to_array(COALESCE(msg_to_role, ''), ','))\n" +
                    "AND NOT (? = ANY(string_to_array(COALESCE(is_read_userid, ''), ','))) AND TO_CHAR(created_at, 'YYYY-MM-DD') = TO_CHAR(now(), 'YYYY-MM-DD');";

        try (PreparedStatement st = this.conn.prepareStatement(sql)) {  // Auto-close PreparedStatement
            st.setString(1, roleId); 
            st.setString(2, userId);
            
            try (ResultSet rs = st.executeQuery()) {  // Auto-close ResultSet
                if (rs.next()) {
                    data = rs.getInt("count");
                }
            }
        }
        return data;
    }
    
    public List<Map<String, String>> getNotificationList(String userId, String roleId, int offset, int limit) throws SQLException {
        List<Map<String, String>> notifications = new ArrayList<>();
        String sql = "SELECT id_notif, title_msg, msg_body, TO_CHAR(created_at, 'YYYY-MM-DD HH24:MI:SS') as created_at FROM notifications \n" +
                     "WHERE ? = ANY(string_to_array(COALESCE(msg_to_role, ''), ','))\n" +
                     "AND NOT (? = ANY(string_to_array(COALESCE(is_read_userid, ''), ',')))\n" +
                     " AND TO_CHAR(created_at, 'YYYY-MM-DD') = TO_CHAR(now(), 'YYYY-MM-DD') ORDER BY created_at DESC \n"+
                     "LIMIT ? OFFSET ?";

        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            st.setString(1, roleId);
            st.setString(2, userId);
            st.setInt(3, limit);
            st.setInt(4, offset);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> notif = new HashMap<>();
                    notif.put("id", rs.getString("id_notif"));
                    notif.put("title", rs.getString("title_msg"));
                    notif.put("message", rs.getString("msg_body"));
                    notif.put("created_at", rs.getString("created_at"));
                    notifications.add(notif);
                }
            }
        }
        return notifications;
    }
    
//    public boolean markAsReadNotif(String userId, String roleId, String readIdNotif) throws SQLException {
////        String placeholders = String.join(",", java.util.Collections.nCopies(readIdNotif.length, "?"));
//        
//        String sql = "UPDATE notifications SET is_read_userid = (CASE "
//	+"WHEN is_read_userid = '' OR is_read_userid IS NULL THEN ? "
//	+"ELSE is_read_userid || ',' || ? END) "
//        +"WHERE id_notif in (?) AND NOT (? = ANY(STRING_TO_ARRAY(COALESCE(is_read_userid, ''), ',')));";
//        
//            System.out.println("QUERYNYAA========================"+sql);
//        try (PreparedStatement st = this.conn.prepareStatement(sql)) {  // Auto-close PreparedStatement
//            st.setString(1, userId); 
//            st.setString(2, userId);
//            st.setString(3, readIdNotif);
//            st.setString(4, userId);
//            int rowsAffected = st.executeUpdate();
//            return rowsAffected > 0;
//        } catch (SQLException e) {
//            log.error("SQL Error in markAsReadNotif:");
//            log.error("- SQL: " + sql);
//            log.error("- Parameters: userId=" + userId + 
//                             ", readIdNotif=" + readIdNotif);
//            log.error("- Error Code: " + e.getErrorCode());
//            log.error("- SQL State: " + e.getSQLState());
//            log.error("- Message: " + e.getMessage());
//
//            // Re-throw the exception after logging
//            throw e;
//        }
//    }
    
     public boolean markAsReadNotif(String userId, String roleId, String readIdNotif) throws SQLException {
        String[] notifIds = readIdNotif.split(",");
        String placeholders = String.join(",", java.util.Collections.nCopies(notifIds.length, "CAST(? AS INTEGER)"));

        String sql = "UPDATE notifications SET is_read_userid = (CASE "
                + "WHEN is_read_userid = '' OR is_read_userid IS NULL THEN ? "
                + "ELSE is_read_userid || ',' || ? END) "
                + "WHERE id_notif IN (" + placeholders + ") "
                + "AND NOT (? = ANY(STRING_TO_ARRAY(COALESCE(is_read_userid, ''), ',')))";

        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            st.setString(1, userId);
            st.setString(2, userId);

            int index = 3;
            for (String id : notifIds) {
                st.setString(index++, id);
            }
            st.setString(index, userId);

            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            log.error("SQL Error in markAsReadNotif:");
            log.error("- SQL: " + sql);
            log.error("- Parameters: userId=" + userId + 
                             ", readIdNotif=" + readIdNotif);
            log.error("- Error Code: " + e.getErrorCode());
            log.error("- SQL State: " + e.getSQLState());
            log.error("- Message: " + e.getMessage());

            // Re-throw the exception after logging
            throw e;
        }
    }
    
    
}
