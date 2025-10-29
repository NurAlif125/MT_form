/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

import com.vensys.appcm.model.DataLimitDetail;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author rafli
 */
public class DBDataTieringLimit {

    Connection conn;

    public DBDataTieringLimit(Connection conn) {
        this.conn = conn;
    }

    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    Logger log = LogManager.getLogger(getClass().getName());

    public List<Map<String, Object>> getDataLimit(String level, String source) {
        List<Map<String, Object>> list = new ArrayList<>();
        
        if ("Treasury OPS".equalsIgnoreCase(source) || "FRONTARENA".equalsIgnoreCase(source) || "TSA".equalsIgnoreCase(source)) {
            source = "Treasury Ops";
        } else if ("BANKTRADE".equalsIgnoreCase(source)) {
            source = "Trade Ops";
        } else if ("CUSTODY".equalsIgnoreCase(source) || "CSA".equalsIgnoreCase(source)) {
            source = "Custody Ops";
        } else if ("EMS".equalsIgnoreCase(source) || "NCBS".equalsIgnoreCase(source)) {
            source = "Remittance Ops";
        }

        try {
            String sql = "SELECT id, currency, min_limit, max_limit, is_enable FROM tiering_limit WHERE is_enable = '1' AND level = ? AND source = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, level); 
            st.setString(2, source);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("currency", rs.getString("currency"));
                row.put("min_limit", rs.getBigDecimal("min_limit"));
                row.put("max_limit", rs.getBigDecimal("max_limit"));
                list.add(row);
            }
        } catch (SQLException e) {
            log.error("Error getDataLimit: " + e.getMessage());
        }

        return list;
    }
    
    public List<DataLimitDetail> getResultTieringLimit(
            String level,
            String source,
            int start,
            int length,
            String quicksearch,
            String sort
    ) throws Exception {
        List<DataLimitDetail> datas = new ArrayList<>();
        List<Object> parameters = new ArrayList<>();

        StringBuilder where = new StringBuilder("1=1 ");
        
        if (!"".equals(level)) {
            where.append(" AND level = ?");
            parameters.add(level);
        } else {
            where.append(" AND level = ''");
        }
        
        if (!"".equals(source)) {
            where.append(" AND source = ?");
            parameters.add(source);
        } else {
            where.append(" AND source = ''");
        }
        
        if (quicksearch != null && !quicksearch.isEmpty()) {
            if (quicksearch.toLowerCase().startsWith("en")) {
                where.append(" AND (is_enable = ? or CONCAT(currency, min_limit, max_limit, is_enable) ILIKE ?) ");
                parameters.add("1");
                parameters.add("%" + quicksearch + "%");
            } else if (quicksearch.toLowerCase().startsWith("di")) {
                where.append(" AND (is_enable = ? or CONCAT(currency, min_limit, max_limit, is_enable) ILIKE ?) ");
                parameters.add("0");
                parameters.add("%" + quicksearch + "%");
            } else {
                where.append(" AND CONCAT(currency, min_limit, max_limit, is_enable) ILIKE ?");
                parameters.add("%" + quicksearch + "%");
            }
        }
        
        String sql = "SELECT id, currency, min_limit, max_limit, is_enable FROM tiering_limit"
                + " WHERE " + where + " ORDER BY " + sort + " LIMIT ? OFFSET ?";

        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            int idx = 1;
            for (Object param : parameters) {
                st.setObject(idx++, param);
            }
            st.setInt(idx++, length); // limit
            st.setInt(idx, start);

            //check hasil query
//            String rawSql = sql;
//            for (Object param : parameters) {
//                rawSql = rawSql.replaceFirst("\\?", "'" + String.valueOf(param).replace("'", "''") + "'");
//            }
//            rawSql = rawSql.replaceFirst("\\?", String.valueOf(length));
//            rawSql = rawSql.replaceFirst("\\?", String.valueOf(start));
//        System.out.println("Expanded LIST search SQL:\n" + rawSql); //cetak hasil query
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    DataLimitDetail data = new DataLimitDetail();
                    data.setId(rs.getInt("id"));
                    data.setCurrency(rs.getString("currency"));
                    data.setMin_limit(rs.getBigDecimal("min_limit"));
                    data.setMax_limit(rs.getBigDecimal("max_limit"));
                    data.setIsEnable(rs.getByte("is_enable"));
                    
//                    if ("1".equalsIgnoreCase(rs.getString("is_enable"))) {
//                        data.setIsEnable("Enable");
//                    } else {
//                        data.setIsEnable("Enable");
//                    }
                    
                    datas.add(data);
                }
            }
        }

        return datas;
    }
    
    public int getCountDataLimit(String quicksearch, String level, String source) throws SQLException {
        StringBuilder where = new StringBuilder("1=1");
        List<Object> parameters = new ArrayList<>();
        
        if (quicksearch != null && !quicksearch.isEmpty()) {
            where.append(" AND CONCAT(currency, min_limit, max_limit, is_enable) ILIKE ?");
            parameters.add("%" + quicksearch + "%");
        }
        
        String sql = "SELECT id, currency, min_limit, max_limit, is_enable FROM tiering_limit WHERE " + where;
        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            int idx = 1;
            for (Object param : parameters) {
                st.setObject(idx++, param);
            }
            ResultSet rs = st.executeQuery();

//            String rawSql = sql;
//            for (Object param : parameters) {
//                rawSql = rawSql.replaceFirst("\\?", "'" + String.valueOf(param).replace("'", "''") + "'");
//            }
//        System.out.println("Expanded Count List Search SQL:\n" + rawSql); //cetak hasil query
            if (rs.next()) {
                return rs.getInt(1);
            }
        }

        return 0;
    }
    
     public Map<String, Object> getDataById(String id) {
        Map<String, Object> data = null;
        
        try {
            String sql = "SELECT id, currency, min_limit, max_limit, is_enable, level, source FROM tiering_limit WHERE id = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(id));
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                data = new HashMap<>();
                data.put("id", rs.getInt("id"));
                data.put("currency", rs.getString("currency"));
                data.put("min_limit", rs.getString("min_limit"));
                data.put("max_limit", rs.getInt("max_limit"));
                data.put("is_enable", rs.getInt("is_enable"));
                data.put("level", rs.getInt("level"));
                data.put("source", rs.getString("source"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            log.error(e.getMessage());
        }

        return data;
    }
    
    public void insertLimit(String currency, BigDecimal min_limit, BigDecimal max_limit, String isEnable, String level, String source) {
        try {
            log.info("inserLimit(): Inserting new currency for Tiering Limit");
            String sql = "INSERT INTO tiering_limit (currency, min_limit, max_limit, is_enable, level, source) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, currency);
            st.setBigDecimal(2, min_limit);
            st.setBigDecimal(3, max_limit);
            st.setString(4, isEnable);
            st.setString(5, level);
            st.setString(6, source);
            st.executeUpdate();
            log.info("insertLimit(): insert success");
        } catch (SQLException e) {
            log.error("insertLimit(): " + e.getMessage());
        }
    }
    
    public void updateLimit(String id, String currency, BigDecimal min_limit, BigDecimal max_limit, String isEnable, String level, String source) {
        try {
            log.info("updateLimit(): Updating Limit Details");
            String sql = "UPDATE tiering_limit SET currency= ?, min_limit = ?, max_limit = ?, is_enable = ? WHERE id = ? AND level = ? AND source = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, currency);
            st.setBigDecimal(2, min_limit);
            st.setBigDecimal(3, max_limit);
            st.setString(4, isEnable);
            st.setInt(5, Integer.parseInt(id));
            st.setString(6, level);
            st.setString(7, source);
            st.executeUpdate();
            log.info("updateLimit(): Limit successfully updated.");
        } catch (SQLException e) {
            log.error("updateLimit(): " + e.getMessage());
        }
    }
    
    public int checkDuplicateTiering(String currency, String level, String channel) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM tiering_limit WHERE currency = ? AND level = ? AND source = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, currency);
            st.setString(2, level);
            st.setString(3, channel);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            log.error("checkDuplicateTiering(): " + e.getMessage());
        }

        return count;
    }

    
}
