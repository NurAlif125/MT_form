/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.dbase;

import com.vensys.appcm.model.DataGeneralSetting;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author AplDev2 20210405
 */
public class DBDataGeneralSetting {

    Connection conn;
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    Logger log = LogManager.getLogger(getClass().getName());
    public DBDataGeneralSetting(Connection conn) {
        DBconnection dbConn = new DBconnection();
        this.conn = dbConn.getConnection();
    }

    public String[] getGeneralSetting() {
        String[] result = new String[2];
        try {
            String sql = "select hostname, appVersion from general_setting";
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result[0] = rs.getString(1);
                result[1] = rs.getString(2);
            }
        } catch (SQLException swl) {
            // System.out.print("Error SQL getGeneralSetting " + swl.getMessage());
            log.info("Error SQL getGeneralSetting " + swl.getMessage());
        }
        return result;
    }

    public DataGeneralSetting getDataGS() throws SQLException {
        DataGeneralSetting data = new DataGeneralSetting();
        String sql = "SELECT id,hostname,appversion FROM general_setting";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId(rs.getInt("id"));
            data.setHostname(rs.getString("hostname"));
            data.setAppversion(rs.getString("appversion"));
//            data.setMT103(rs.getString("mt103"));
//            data.setMT202(rs.getString("mt202"));
//            data.setMT192(rs.getString("mt192"));
//            data.setMT196(rs.getString("mt196"));
//            data.setMT950(rs.getString("mt950"));
//            data.setModifiedBy(rs.getString("modified_by"));
//            data.setLastUpdate(rs.getString("last_update"));
        }
        return data;
    }

    public int updateDataGS(DataGeneralSetting data, String modifier, String ip, String comp) {
        int result = 0;
        try {
            String sql = "UPDATE general_setting SET hostname=?,appVersion=? where id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getHostname());
            st.setString(2, data.getAppversion());
//            st.setString(3, data.getMT103());
//            st.setString(4, data.getMT202());
//            st.setString(5, data.getMT192());
//            st.setString(6, data.getMT196());
//            st.setString(7, data.getMT950());
//            st.setString(8, modifier);
            st.setInt(3, data.getId());
            result = st.executeUpdate();
        } catch (SQLException e) {
            // System.out.println("Error updateDataGS : " + e.getMessage());
            log.error("Error updateDataGS : " + e.getMessage());
        }
        evl.insertDataEvent(modifier, "Ubah General Setting", ip, comp);
        evl.updateLogUser(modifier, "General Setting", tanggal);
        return result;
    }
}
