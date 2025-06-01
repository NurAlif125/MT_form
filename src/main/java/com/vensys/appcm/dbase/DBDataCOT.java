/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.dbase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.vensys.appcm.model.DataCOT;
import java.sql.Time;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.apache.log4j.Logger;

/**
 *
 * @author AplDev2
 */
public class DBDataCOT {

    Connection conn;
    Logger log = Logger.getLogger(getClass().getName());

    public DBDataCOT(Connection conn) {
        this.conn = conn;
    }

    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void updateDataCOT(DataCOT data, int id_sandi, String modifier, String ip, String comp) {
        String sql = "UPDATE cut_of SET waktu = ?, waktu_end = ?, update_date = NOW(), update_by = ?, sandi = ?, description = ? where id_sandi = ?";
        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            st.setTime(1, data.getWaktu());
            // System.out.println("dapet waktu g >> " + data.getWaktu());
            st.setTime(2, data.getWaktu_end());
            // System.out.println("ini waktu end nya >> " + data.getWaktu_end());
//            st.setString(3, this.tanggal);
            st.setString(3, data.getUpdate_by());
            // System.out.println("Ini mod nyaa >> " + data.getUpdate_by());
            st.setString(4, data.getSandi());
            // System.out.println("sandi nya >> " + data.getSandi());
            st.setString(5, data.getDeskripsi());
            // System.out.println("deskripsi >> " + data.getDeskripsi());
            st.setInt(6, data.getId_sandi());
            // System.out.println("id sandi nya >> " + data.getId_sandi());
            //  System.out.println(data.getUpdateDate());
            // System.out.println("sql update cut of = " + sql);
            int rowsUpdated = st.executeUpdate();
            if (rowsUpdated > 0) {
                // System.out.println("Update successful.");
            } else {
                // System.out.println("No rows updated.");
            }
        } catch (SQLException e) {
            // System.out.println("dbase.DBDataCOT.updateDataCOT() : " + e.getMessage());
            log.info("dbase.DBDataCOT.updateDataCOT() : " + e.getMessage());
        }
        evl.insertDataEvent(modifier, "Ubah Cut Of Time", ip, comp);
//        evl.updateLogUser(modifier, "Cut Of Time", tanggal);
    }

    public DataCOT getDataCOT() throws SQLException {
        DataCOT data = new DataCOT();
        String sql = "SELECT sandi, waktu FROM cut_of";
        try (PreparedStatement st = this.conn.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                data.setSandi(rs.getString("sandi"));
                data.setWaktu(rs.getTime("waktu"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return data;
    }

    public DataCOT findDataCOTById(int id_sandi) {
        DataCOT temp = null;
        String sql = "SELECT id_sandi, sandi, waktu, waktu_end, description, update_by, update_date FROM cut_of WHERE id_sandi = ?";
        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            st.setInt(1, id_sandi);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    temp = new DataCOT();
                    temp.setId_sandi(rs.getInt("id_sandi"));
                    temp.setSandi(rs.getString("sandi"));
                    temp.setWaktu(rs.getTime("waktu"));
                    temp.setWaktu_end(rs.getTime("waktu_end"));
                    temp.setDeskripsi(rs.getString("description"));
                    temp.setUpdateBy(rs.getString("update_by"));
                    temp.setUpdateDate(rs.getString("update_date"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return temp;
    }

    public List<DataCOT> findAllDataCOT() {
        List<DataCOT> data = new ArrayList<>();
        String sql = "SELECT id_sandi, sandi, waktu, waktu_end, description, update_by, update_date FROM cut_of";
        try (PreparedStatement st = this.conn.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                DataCOT temp = new DataCOT();
                temp.setId_sandi(rs.getInt("id_sandi"));
                temp.setSandi(rs.getString("sandi"));
                temp.setWaktu(rs.getTime("waktu"));
                temp.setWaktu_end(rs.getTime("waktu_end"));
                temp.setDeskripsi(rs.getString("description"));
                temp.setUpdateBy(rs.getString("update_by"));
                temp.setUpdateDate(rs.getString("update_date"));

                data.add(temp);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return data;
    }

    public void insertDataCOT(DataCOT data, String creator, String ip, String comp) {
        String sql = "INSERT INTO cut_of (sandi, waktu, waktu_end, description, update_by, update_date) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            st.setString(1, data.getSandi());
            st.setTime(2, data.getWaktu());
            st.setTime(3, data.getWaktu_end());
            st.setString(4, data.getDeskripsi() != null ? data.getDeskripsi() : "");
            st.setString(5, creator);
            st.setString(6, this.tanggal);
            // System.out.println("sql add cut of = " + sql);

            int rowsInserted = st.executeUpdate();
            if (rowsInserted > 0) {
                // System.out.println("Insert successful.");
                log.info("Insert successful.");
            } else {
                // System.out.println("No rows inserted.");
                log.info("No rows inserted.");
            }
        } catch (SQLException e) {
            // System.out.println("dbase.DBDataCOT.insertDataCOT() : " + e.getMessage());
            log.info("dbase.DBDataCOT.insertDataCOT() : " + e.getMessage());
        }
        evl.insertDataEvent(creator, "Tambah Cut Of Time", ip, comp);
        evl.updateLogUser(creator, "Cut Of Time", tanggal);
    }

    public void removeDataCOT(int id_sandi, String modifier, String ip, String comp) {
        String sql = "DELETE FROM cut_of WHERE id_sandi = ?";
        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            st.setInt(1, id_sandi);

            int rowsDeleted = st.executeUpdate();
            if (rowsDeleted > 0) {
                // System.out.println("Delete successful.");
                log.info("Delete successful.");
            } else {
                // System.out.println("No rows deleted.");
                log.info("No rows deleted.");
            }
        } catch (SQLException e) {
            // System.out.println("dbase.DBDataCOT.removeDataCOT() : " + e.getMessage());
            log.info("dbase.DBDataCOT.removeDataCOT() : " + e.getMessage());
        }
        evl.insertDataEvent(modifier, "Hapus Cut Of Time", ip, comp);
        evl.updateLogUser(modifier, "Cut Of Time", tanggal);
    }

    public List<String> cekDataDuplicateCOT(String sandi) throws SQLException {
        List<String> datas = new ArrayList<String>();
        String sql = "SELECT t.sandi FROM cut_of AS t WHERE  t.sandi = '" + sandi + "' ORDER BY id_sandi ASC";
        // System.out.println("sql cek Data Duplicate cutof = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1));
        }
        return datas;
    }
}
