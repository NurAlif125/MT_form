/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author AplDev2
 */
public class DBEventLog {

    Connection conn2;

    public DBEventLog(Connection conn2) {
        DBconnection2 dbConn = new DBconnection2();
        this.conn2 = dbConn.getConnection2();
    }
    
    public void insertDataEvent(String user_id, String event, String ip, String com) {
        insertDataEvent(user_id, event, ip, com, "");
    }

    public void insertDataEvent(String user_id, String event, String ip, String com, String changes) {
        String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "Insert into event_log (user_id, event_date, ip, hostname, description, changes) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = this.conn2.prepareStatement(sql);
            try {
                st.setString(1, user_id);
                st.setString(2, tanggal);
                st.setString(3, ip);
                st.setString(4, com);
                st.setString(5, event);
                st.setString(6, changes);
                st.executeUpdate();
            } catch (SQLException e) {
                System.out.print("Error SQL insert Event: " + e.getMessage());
            }
        } catch (SQLException swl) {
            System.out.print("Error SQL insert event: " + swl.getMessage());
        }
    }
    
    
    /**
     * Menyimpan catatan login user dan last activity
     * login | non login
     * @param user_id
     * @param type
     * @param tanggal 
     */
    public void updateLogUser(String user_id, String type, String tanggal) {
        try {
            String sql;
            PreparedStatement st;
            if (type.equalsIgnoreCase("login")) {
                sql = "UPDATE users SET last_login=?,last_activity=? WHERE user_id=?";
                st = this.conn2.prepareStatement(sql);
                st.setString(1, tanggal);
                st.setString(2, tanggal);
                st.setString(3, user_id);
            } else {
                sql = "UPDATE users SET last_activity=? WHERE user_id=?";
                st = this.conn2.prepareStatement(sql);
                st.setString(1, tanggal);
                st.setString(2, user_id);
                
                
            }
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error update info activity user : "+e.toString());
        }
    }
    
    /**
     * @depecated Usang
     * @param user_id
     * @param type
     * @param tanggal 
     */
    public void updateLogUserNorm(String user_id, String type, String tanggal) {
        try {
            String sql;
            PreparedStatement st;
            if (type.equalsIgnoreCase("login")) {
                sql = "UPDATE user SET last_login=?,last_activity=? WHERE user_id=?";
                st = this.conn2.prepareStatement(sql);
                st.setString(1, tanggal);
                st.setString(2, tanggal);
                st.setString(3, user_id);
            } else {
                sql = "UPDATE user SET last_activity=? WHERE user_id=?";
                st = this.conn2.prepareStatement(sql);
                st.setString(1, tanggal);
                st.setString(2, user_id);
            }
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error update info activity user : "+e.toString());
        }
    }

    private String GETDATE() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
/**
 *
 * @author T430
 */
//public class DBEventLog {
//    
//}
