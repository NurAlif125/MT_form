/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

/**
 *
 * @author T430
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.vensys.appcm.model.DataMT;
import org.apache.log4j.Logger;

/**
 *
 * @author AplDev2
 */
public class DBDataMT {

    Connection conn;

    public DBDataMT(Connection conn) {
        this.conn = conn;
    }

    DBEventLog evl = new DBEventLog(conn);
    Logger log = Logger.getLogger(getClass().getName());
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addDataMT(DataMT data, String modifier, String ip, String comp) {
        try {
            String sql = "INSERT INTO mt_details (mt,details,queue,\"updateBy\",\"updateDate\") VALUES (?,?,?,?,LOCALTIMESTAMP)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getMt());
            st.setString(2, data.getDetail());
            st.setString(3, data.getQueue());
            st.setString(4, modifier);
//            st.setString(5, tanggal);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // System.out.println("dbase.DBDataMT.addDataMT() : " + e.getMessage());
            log.error("dbase.DBDataMT.addDataMT() : " + e.getMessage());
        }
        evl.insertDataEvent(modifier, "Tambah MT", ip, comp);
        evl.updateLogUser(modifier, "MT", tanggal);
    }

    public void updateDataMT(DataMT data, String modifier, String ip, String comp) {
        try {
            String sql = "UPDATE mt_details SET details=?,queue=?,\"updateBy\"=?,\"updateDate\"=LOCALTIMESTAMP WHERE id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getDetail());
            st.setString(2, data.getQueue());
            st.setString(3, modifier);
//            st.setString(4, tanggal);
            st.setInt(4, data.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            // System.out.println("dbase.DBDataMT.updateDataMT() : " + e.getMessage());
            log.error("dbase.DBDataMT.updateDataMT() : " + e.getMessage());
        }
        evl.insertDataEvent(modifier, "Ubah MT", ip, comp);
        evl.updateLogUser(modifier, "MT", tanggal);
    }

    public List<DataMT> getAllDataMT() throws Exception {
        List<DataMT> datas = new ArrayList<DataMT>();
        String sql = "SELECT id,mt,details,queue,\"updateBy\",\"updateDate\" FROM mt_details ORDER BY mt ASC";
        log.info("getAllDataMT here... :" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        log.info("before while... ");
        while (rs.next()) {
            DataMT data = new DataMT();
            data.setId(rs.getInt(1));
            data.setMt(rs.getString(2));
            data.setDetail(rs.getString(3));
            if (rs.getString(4).equals("1")) {
                data.setQueue("Modification");
            } else if (rs.getString(4).equals("2")) {
                data.setQueue("Verification");
            } else {
                data.setQueue("Authorization");
            }
            data.setUpdateby(rs.getString(5));
            data.setUpdatedate(rs.getString(6));
            datas.add(data);
        }
        return datas;
    }

    public List<DataMT> getAllDataMT(String mt) throws Exception {
        List<DataMT> datas = new ArrayList<DataMT>();
        String sql = "SELECT id,mt,details,queue,\"updateBy\",\"updateDate\" FROM mt_details "
                + "WHERE mt LIKE '%" + mt + "%' ORDER BY mt ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataMT data = new DataMT();
            data.setId(rs.getInt(1));
            data.setMt(rs.getString(2));
            data.setDetail(rs.getString(3));
            if (rs.getString(4).equals("1")) {
                data.setQueue("Modification");
            } else if (rs.getString(4).equals("2")) {
                data.setQueue("Verification");
            } else {
                data.setQueue("Authorization");
            }
            data.setUpdateby(rs.getString(5));
            data.setUpdatedate(rs.getString(6));
            datas.add(data);
        }
        return datas;
    }

    public DataMT getDataMTById(Integer id) throws SQLException {
        DataMT data = new DataMT();
        String sql = "SELECT id,mt,details,queue,\"updateBy\",\"updateDate\" FROM mt_details WHERE id=" + id;
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId(rs.getInt(1));
            data.setMt(rs.getString(2));
            data.setDetail(rs.getString(3));
            data.setQueue(rs.getString(4));
            data.setUpdateby(rs.getString(5));
            data.setUpdatedate(rs.getString(6));
        }
        return data;
    }
    
    public void delete(Integer id, String modifier, String ip, String comp) throws SQLException {
        String sql = "DELETE FROM mt_details WHERE id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id);
        st.executeUpdate();
        evl.insertDataEvent(modifier, "Hapus MT", ip, comp);
        evl.updateLogUser(modifier, "MT", tanggal);
    }
}
