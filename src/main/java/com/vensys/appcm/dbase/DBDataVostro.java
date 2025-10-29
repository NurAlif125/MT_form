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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.vensys.appcm.model.DataVostro;

/**
 *
 * @author ovasae
 */
public class DBDataVostro {

    Connection conn;

    public DBDataVostro(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addDataVosto(DataVostro data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO vostro (swift_code,name,acc_no) VALUES (?,?,?)";
            System.out.println("SQL addDataVosto " + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getSwift_code());
            st.setString(2, data.getName());
            st.setString(3, data.getAcc_no());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah Vostro", ip, comp);
    }

    public void updateDataVostro(DataVostro data, int vostro_id, String mofier, String ip, String comp) {
        try {
            String sql = "UPDATE vostro SET swift_code=?,name=?,acc_no=? WHERE vostro_id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getSwift_code());
            st.setString(2, data.getName());
            st.setString(3, data.getAcc_no());
            st.setInt(4, vostro_id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah Vostro", ip, comp);
    }

    public List<DataVostro> getAllDataVostro() throws Exception {
        List<DataVostro> datas = new ArrayList<DataVostro>();
        String sql = "SELECT vostro_id, swift_code,name,acc_no FROM vostro";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataVostro data = new DataVostro();
            data.setVostro_id(rs.getInt(1));
            data.setSwift_code(rs.getString(2));
            data.setName(rs.getString(3));
            data.setAcc_no(rs.getString(4));
            datas.add(data);
        }
        return datas;
    }

    public List<DataVostro> getAllDataVostro(String swift_code, String name, String acc_no) throws Exception {
        List<DataVostro> datas = new ArrayList<DataVostro>();
        String sql = "SELECT vostro_id, swift_code, name FROM vostro"
                + "WHERE swift_code LIKE '" + swift_code + "&' AND name LIKE '&" + name + "&'"
                + " AND acc_no LIKE '&" + acc_no + "&' "
                + "ORDER BY vostro_id ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataVostro data = new DataVostro();
            data.setVostro_id(rs.getInt(1));
            data.setSwift_code(rs.getString(2));
            data.setName(rs.getString(3));
            data.setAcc_no(rs.getString(4));
            datas.add(data);
        }
        return datas;
    }

    public DataVostro getDataVostrobyId(int vostro_id) throws SQLException {
        DataVostro data = new DataVostro();
        String sql = "SELECT swift_code, name, acc_no FROM vostro WHERE vostro_id='" + vostro_id + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setSwift_code(rs.getString(1));
            data.setName(rs.getString(2));
            data.setAcc_no(rs.getString(3));
        }
        return data;
    }

    public void delete(int vostro_id, String mofier, String ip, String comp) throws SQLException {
        String sql = "DELETE FROM vostro WHERE vostro_id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, vostro_id);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "Hapus Nostro", ip, comp);
        evl.updateLogUser(mofier, "Vostro", tanggal);
    }

    public List<String> cekDataDuplicateVostro(String swift_code) throws SQLException {
        List<String> datas = new ArrayList<String>();
        String sql = "SELECT t.swift_code FROM vostro AS t WHERE  t.swift_code = '" + swift_code + "' ORDER BY vostro_id ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1));
        }
        return datas;
    }

}
