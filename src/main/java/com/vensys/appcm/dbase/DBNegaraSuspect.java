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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.vensys.appcm.model.DataNegaraSuspect;

/**
 *
 * @author hadi
 */
public class DBNegaraSuspect {

    Connection conn;

    public DBNegaraSuspect(Connection conn) {
        this.conn = conn;
    }

    public void addNegaraSuspect(DataNegaraSuspect data) {
//        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "INSERT INTO negara_suspect(kode_negara,nama_negara) VALUES (?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getKode_negara()); 
            st.setString(2, data.getNama_negara());     
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateNegaraSuspect(DataNegaraSuspect data, int id_negara) {
        try {
            String sql = "Update negara_suspect SET kode_negara=?,nama_negara=? where id_negara=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getKode_negara()); 
            st.setString(2, data.getNama_negara());     
            st.setInt(3, id_negara);     
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<DataNegaraSuspect> getAllNegaraSuspect() throws Exception {
        List<DataNegaraSuspect> datas = new ArrayList<DataNegaraSuspect>();
        String sql = "SELECT id_negara,kode_negara,nama_negara FROM negara_suspect ORDER BY kode_negara ASC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataNegaraSuspect data = new DataNegaraSuspect();
            data.setId_negara(rs.getInt(1));
            data.setKode_negara(rs.getString(2));
            data.setNama_negara(rs.getString(3));
            datas.add(data);
        }
        return datas;
    }

    public List<DataNegaraSuspect> getAllNegaraSuspect (String kode_negara, String nama_negara) throws Exception {
        List<DataNegaraSuspect> datas = new ArrayList<DataNegaraSuspect>();
        String sql = "SELECT id_negara,kode_negara,nama_negara FROM negara_suspect "
                + "WHERE kode_negara LIKE '%" + kode_negara + "%' AND nama_negara LIKE '%" + nama_negara + "%' "
                + "ORDER BY kode_negara ASC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataNegaraSuspect data = new DataNegaraSuspect();
            data.setId_negara(rs.getInt(1));
            data.setKode_negara(rs.getString(2));
            data.setNama_negara(rs.getString(3));
            datas.add(data);
        }
        return datas;
    }

    public DataNegaraSuspect getNegaraSuspectById(String id_negara) throws SQLException {
        DataNegaraSuspect data = new DataNegaraSuspect();
        String sql = "SELECT id_negara,kode_negara,nama_negara FROM negara_suspect WHERE id_negara='" + id_negara + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_negara(rs.getInt(1));
            data.setKode_negara(rs.getString(2));
            data.setNama_negara(rs.getString(3));
        }
        return data;
    }
    
    public DataNegaraSuspect getNegaraSuspectByCode(String kode_negara) throws SQLException {
        DataNegaraSuspect data = new DataNegaraSuspect();
        String sql = "SELECT id_negara,kode_negara,nama_negara FROM negara_suspect WHERE kode_negara LIKE '%" + kode_negara + "%'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_negara(rs.getInt(1));
            data.setKode_negara(rs.getString(2));
            data.setNama_negara(rs.getString(3));
        }
        return data;
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM negara_suspect WHERE id_negara=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id);
        st.executeUpdate();
    }
    
    public List<String> cekDataDuplicateCountry(String kode_negara, String nama_negara) throws SQLException {
        List<String> datas = new ArrayList<String>();
        String sql = "SELECT t.kode_negara,t.nama_negara FROM negara_suspect AS t WHERE  t.kode_negara = '"+kode_negara+"'  AND t.nama_negara = '"+nama_negara+"' ORDER BY kode_negara ASC";
//        String sql = "select id_account from account_penagihan";
        System.out.println("sql cek Data Duplicate Acc Penagih = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1));
        }
        return datas;
    }
}
