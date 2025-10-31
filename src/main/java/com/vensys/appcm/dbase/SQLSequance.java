/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;
/**
 *
 * @author HP
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class SQLSequance {
    Connection conn;
    Logger log = Logger.getLogger(this.getClass().toString());

    public SQLSequance(Connection conn) {
        this.conn = conn;
    }



    public String getSeq() throws SQLException {
        String seq = "";
        String resetDate = "";
        String sql = "SELECT seq_num, reset_seq_date FROM [sequence]";
        log.info("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            seq = rs.getString(1);
            resetDate = rs.getString(2);
        }
        log.info("seq : " + seq);
        return seq + '#' + resetDate;
    }

    public void updateSequence(String resetDate, String seq) throws ParseException {
        try {
            String sql = "UPDATE [sequence] SET reset_seq_date = ?, seq_num = ? ";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, resetDate);
            st.setString(2, seq);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}