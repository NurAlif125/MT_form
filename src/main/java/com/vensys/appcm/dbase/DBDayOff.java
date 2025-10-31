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
import com.vensys.appcm.model.DayOff;

public class DBDayOff {

    Connection conn;

    public DBDayOff(Connection conn) {
        this.conn = conn;
    }

    public void addDayOff(DayOff data) {
        try {
            String sql = "INSERT INTO day_off(date_off,date_desc) VALUES (?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getDateOff());
            st.setString(2, data.getDateDesc());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateDayOff(DayOff data) {
        try {
            String sql = "Update day_off SET date_off=?,date_desc=? where id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getDateOff());
            st.setString(2, data.getDateDesc());
            st.setInt(3, data.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<DayOff> getAllDayOff() throws Exception {
        List<DayOff> datas = new ArrayList<>();
        String sql = "SELECT id,date_off,date_desc FROM day_off ORDER BY id ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DayOff data = new DayOff();
            data.setId(rs.getInt(1));
            data.setDateOff(rs.getString(2));
            data.setDateDesc(rs.getString(3));
            datas.add(data);
        }
        return datas;
    }

    public DayOff getAllDayOffById(int id) throws SQLException {
        DayOff data = new DayOff();
        String sql = "SELECT id,date_off,date_desc FROM day_off WHERE id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId(rs.getInt(1));
            data.setDateOff(rs.getString(2));
            data.setDateDesc(rs.getString(3));
        }
        return data;
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM day_off WHERE id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id);
        st.executeUpdate();
    }
}
