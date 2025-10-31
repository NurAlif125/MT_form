/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

import com.vensys.appcm.model.DataExcluteDuplicate;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author isal
 */
public class DBExcluteDuplicate {
    Connection conn;
    private String tag;
    private String detail;
    Logger log = LogManager.getLogger(getClass().getName());
    DBEventLog evl = new DBEventLog(conn);

    public DBExcluteDuplicate(Connection conn) {
        this.conn = conn;
    }
    
    public ArrayList<DataExcluteDuplicate> getAllDataExcDupl() throws SQLException {
        
        ArrayList<DataExcluteDuplicate> DataExcluteDuplicate = new ArrayList<DataExcluteDuplicate>();
        
        String sql = "SELECT id, "
                + "CASE WHEN io_type='I' THEN 'OUTGOING' ELSE 'INCOMING' END io_type, message_type, "
                + "CASE WHEN isenable=0 THEN 'Disable' ELSE 'Enable' END isenable "
                + "FROM exclude_duplicate;";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        
         while (rs.next()) {
             DataExcluteDuplicate datas = new DataExcluteDuplicate();
             
             datas.setId(rs.getInt("id"));
             datas.setIoType(rs.getString("io_type"));
             datas.setMsgType(rs.getString("message_type"));
             datas.setIsEnable(rs.getString("isenable"));
             
             DataExcluteDuplicate.add(datas);
         }
        
        return DataExcluteDuplicate;
    }
    
     public Map<String, Object> getDataById(String id) {
        Map<String, Object> data = null;
        
        try {
            String sql = "SELECT id, io_type, message_type, isenable FROM exclude_duplicate WHERE id = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(id));
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                data = new HashMap<>();
                data.put("id", rs.getInt("id"));
                data.put("io_type", rs.getString("io_type"));
                data.put("msg_type", rs.getString("message_type"));
                data.put("isEnable", rs.getInt("isenable"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            log.error(e.getMessage());
        }

        return data;
    }
     
      public void addDataExcDupl(String ioType, String msgType, String isEnable, String comp, String ip, String userid) {
        String tnggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "INSERT INTO exclude_duplicate(io_type, message_type, isenable) VALUES (?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, ioType);
            st.setString(2, msgType);
            st.setInt(3, Integer.parseInt(isEnable));
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            log.error(e.getMessage());
        }
        evl.insertDataEvent(userid, "Tambah Data Exclude Duplicate", ip, comp);
    }
      
      public void updateDataExcDupl(String id, String ioType, String msgType, String isEnable, String comp, String ip, String userid) {
        String tnggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "UPDATE exclude_duplicate set io_type=?, message_type=?, isenable=? WHERE id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, ioType);
            st.setString(2, msgType);
            st.setInt(3, Integer.parseInt(isEnable));
            st.setInt(4, Integer.parseInt(id));
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            log.error(e.getMessage());
        }
        evl.insertDataEvent(userid, "Update Data Exclude Duplicate", ip, comp);
    }
    
}
