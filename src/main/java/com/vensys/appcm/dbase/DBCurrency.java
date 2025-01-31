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
import java.util.ArrayList;
import java.util.List;
import com.vensys.appcm.model.DataCurrency;

/**
 *
 * @author ovasae
 */
public class DBCurrency {

    Connection conn;
    
    public DBCurrency(Connection conn) {
        this.conn = conn;
    }

    public List<DataCurrency> getAllCurr() throws Exception {
        List<DataCurrency> datas = new ArrayList<DataCurrency>();
        String sql = "SELECT id,code,detail FROM currency ORDER BY code ASC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataCurrency data = new DataCurrency();
            data.setId(rs.getInt(1));
            data.setCode(rs.getString(2));
            data.setDetail(rs.getString(3));
            datas.add(data);
        }
        return datas;
    }
}
