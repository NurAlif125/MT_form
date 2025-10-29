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
import com.vensys.appcm.model.DataSandiKliring;

/**
 *
 * @author hadi
 */
public class DBSandiKliring {

    Connection conn;

    public DBSandiKliring(Connection conn) {
        this.conn = conn;
    }

    public void addSandiKliring(DataSandiKliring data) {
//        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "INSERT INTO sandi_kliring(kode,uraian,sandi_kliring,address,note) VALUES (?,?,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getKode()); //kode
            st.setString(2, data.getUraian());     //uraian
            st.setString(3, data.getSandi_kliring());     //sandi_kliring
            st.setString(4, data.getAddress());     //address
            st.setString(5, data.getNote());     //note
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateSandiKliring(DataSandiKliring data, String id_sandi_kliring) {
        try {
            String sql = "Update sandi_kliring SET kode=?,uraian=?,sandi_kliring=?,address=?,note=? where id_sandi_kliring=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getKode()); //kode
            st.setString(2, data.getUraian());     //uraian
            st.setString(3, data.getSandi_kliring());     //sandi_kliring
            st.setString(4, data.getAddress());     //address
            st.setString(5, data.getNote());     //note
            st.setString(6, id_sandi_kliring);     //id_sandi_kliring
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<DataSandiKliring> getAllSandiKliring() throws Exception {
        List<DataSandiKliring> datas = new ArrayList<DataSandiKliring>();
        String sql = "SELECT id_sandi_kliring,kode,uraian,sandi_kliring,address,note FROM sandi_kliring ORDER BY kode ASC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataSandiKliring data = new DataSandiKliring();
            data.setId_sandi_kliring(rs.getInt(1));
            data.setKode(rs.getString(2));
            data.setUraian(rs.getString(3));
            data.setSandi_kliring(rs.getString(4));
            data.setAddress(rs.getString(5));
            data.setNote(rs.getString(6));
            datas.add(data);
        }
        return datas;
    }

    public List<DataSandiKliring> getAllSandiKliring(String kode, String uraian, String sandi_kliring, String address) throws Exception {
        List<DataSandiKliring> datas = new ArrayList<DataSandiKliring>();
        String sql = "SELECT id_sandi_kliring,kode,uraian,sandi_kliring,address,note FROM sandi_kliring "
                + "WHERE kode LIKE '%" + kode + "%' AND uraian LIKE '%" + uraian + "%' AND  "
                + "sandi_kliring LIKE '%" + sandi_kliring + "%' AND address LIKE '%" + address + "%' ORDER BY kode ASC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataSandiKliring data = new DataSandiKliring();
            data.setId_sandi_kliring(rs.getInt(1));
            data.setKode(rs.getString(2));
            data.setUraian(rs.getString(3));
            data.setSandi_kliring(rs.getString(4));
            data.setAddress(rs.getString(5));
            data.setNote(rs.getString(6));
            datas.add(data);
        }
        return datas;
    }

    public DataSandiKliring getSandiKliringById(String id_sandi_kliring) throws SQLException {
        DataSandiKliring data = new DataSandiKliring();
        String sql = "SELECT id_sandi_kliring,kode,uraian,sandi_kliring,address,note FROM sandi_kliring WHERE id_sandi_kliring='" + id_sandi_kliring + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_sandi_kliring(rs.getInt(1));
            data.setKode(rs.getString(2));
            data.setUraian(rs.getString(3));
            data.setSandi_kliring(rs.getString(4));
            data.setAddress(rs.getString(5));
            data.setNote(rs.getString(6));
        }
        return data;
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM sandi_kliring WHERE id_sandi_kliring=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id);
        st.executeUpdate();
    }
}
