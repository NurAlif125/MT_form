/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

import com.vensys.appcm.model.DataWorkflowLogs;
import com.vensys.appcm.model.HeaderSearchCriteria;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;


import org.apache.log4j.Logger;

/**
 *
 * @author isal
 */
public class DBWorkflowLogs {
    
    Connection conn;
    private String tag;
    private String detail;
    Logger log = Logger.getLogger(getClass().getName());

    public DBWorkflowLogs(Connection conn) {
        this.conn = conn;
    }
    
    public List<DataWorkflowLogs> getResultDataWorkflow(
            HttpSession httpSession,
            int start,
            int length,
            DataWorkflowLogs dataWFLogs,
            String quicksearch,
            String sort,
            String date_from,
            String date_end,
            String noreff
    ) throws Exception {
        SqlWhere whereResult = buildWhereQuery(dataWFLogs, quicksearch, date_from, date_end, noreff);
        String whereQuery = whereResult.getClause();        
        List<Object> parameters = whereResult.getParams();

        List<DataWorkflowLogs> datas = new ArrayList<>();
        
        String sql = "SELECT to_char(to_timestamp(date_time, 'YYYY-MM-DD\"T\"HH24:MI:SSOF'), 'YYYY-MM-DD HH24:MI:SS') as date_time"
                + "\n ,component_name, message_type, file_name_original, file_name, refference, status, description, source " 
                + "\n FROM workflow_logs " 
                + "\n" + whereQuery 
                + "\n ORDER BY " + sort + " LIMIT ? OFFSET ?";

        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            int idx = 1;
            for (Object param : parameters) {
                st.setObject(idx++, param);
            }
            st.setInt(idx++, length); // limit
            st.setInt(idx, start);
            System.out.println("QUERY :: " + st.toString());
            
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    DataWorkflowLogs data = new DataWorkflowLogs();
                    data.setDate_time(rs.getString("date_time"));
                    data.setComponent_name(rs.getString("component_name"));
                    data.setFile_name_original(rs.getString("file_name_original"));
                    data.setFile_name(rs.getString("file_name"));
                    data.setRefference(rs.getString("refference"));
                    data.setStatus(rs.getString("status"));
                    data.setDescription(rs.getString("description"));
                    data.setSource(rs.getString("source"));
                    datas.add(data);
                }
            }
        }

        return datas;
    }
    
    public int getCountResultDataWorkflow(
            HttpSession httpSession,
            int start,
            int length,
            DataWorkflowLogs dataWFLogs,
            String quicksearch,
            String sort,
            String date_from,
            String date_end,
            String noreff
    ) throws Exception {
        SqlWhere whereResult = buildWhereQuery(dataWFLogs, quicksearch, date_from, date_end, noreff);
        String whereQuery = whereResult.getClause();        
        List<Object> parameters = whereResult.getParams();
        
        String sql = "SELECT COUNT(date_time) FROM workflow_logs " + whereQuery;

        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            int idx = 1;
            for (Object param : parameters) {
                st.setObject(idx++, param);
            }
            // System.out.println("PreparedStatement2: " + st.toString());
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        }

        return 0;
    }

    // private helper to build WHERE clause for workflow_logs
    private SqlWhere buildWhereQuery(
        DataWorkflowLogs dataWFLogs,
        String quicksearch,
        String date_from,
        String date_end,
        String noreff
    ) {
        Date tanggal = new Date();
        SimpleDateFormat dDay = new SimpleDateFormat("yyyy-MM-dd");
        List<Object> parameters = new ArrayList<>();
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");

        // quicksearch
        if (quicksearch != null && !quicksearch.isEmpty()) {
            where.append(" AND ("
                + " date_time like ?"
                + " or component_name ilike ?"
                + " or message_type ilike ?"
                + " or file_name_original ilike ?"
                + " or file_name ilike ?"
                + " or refference ilike ?"
                + " or status ilike ?"
                + " or description ilike ?"
                + " or source ilike ?)");
            parameters.add("%" + quicksearch + "%");
            parameters.add("%" + quicksearch + "%");
            parameters.add("%" + quicksearch + "%");
            parameters.add("%" + quicksearch + "%");
            parameters.add("%" + quicksearch + "%");
            parameters.add("%" + quicksearch + "%");
            parameters.add("%" + quicksearch + "%");
            parameters.add("%" + quicksearch + "%");
            parameters.add("%" + quicksearch + "%");
        }
        
        // String colDateExpr = "(date_time::timestamptz AT TIME ZONE 'Asia/Jakarta')::date";
        // boolean hasFrom = date_from != null && !date_from.isEmpty();
        // boolean hasEnd  = date_end  != null && !date_end.isEmpty();
        
        // date range
        if (date_from != null && !date_from.isEmpty()) {
            where.append(" AND to_char(to_timestamp(date_time, 'YYYY-MM-DD\"T\"HH24:MI:SSOF'),'YYYY-MM-DD HH24:MI:SS') >= ?");
            // where.append(" AND ").append(colDateExpr).append(" >= ?::date");
            parameters.add(date_from);
        }

        if (date_end != null && !date_end.isEmpty()) {
             where.append(" AND to_char(to_timestamp(date_time, 'YYYY-MM-DD\"T\"HH24:MI:SSOF'),'YYYY-MM-DD HH24:MI:SS') <= ?");
            // where.append(" AND ").append(colDateExpr).append(" <= ?::date");
            parameters.add(date_end);
        }
        
        // if (!hasFrom && !hasEnd) {
        if ((date_from == null || date_from.isEmpty()) && (date_end  == null || date_end.isEmpty())) {
            where.append(" AND ").append("to_char(to_timestamp(date_time, 'YYYY-MM-DD\"T\"HH24:MI:SSOF'),'YYYY-MM-DD')").append(" = ?");
            parameters.add(dDay.format(tanggal));
        }
        
        // noreff
        if (noreff != null && !noreff.isEmpty()) {
            where.append(" AND refference ilike ?");
            parameters.add("%" + noreff + "%");
        }

        if ( dataWFLogs.getDate_time() != null && !dataWFLogs.getDate_time().isEmpty()) {
            where.append(" AND date_time ilike ?");
            parameters.add("%" + dataWFLogs.getDate_time() + "%");
        }
        
        if ( dataWFLogs.getComponent_name() != null && !dataWFLogs.getComponent_name().isEmpty()) {
            where.append(" AND component_name ilike ?");
            parameters.add("%" + dataWFLogs.getComponent_name() + "%");
        }

        if ( dataWFLogs.getMessage_type() != null && !dataWFLogs.getMessage_type().isEmpty()) {
            where.append(" AND message_type ilike ?");
            parameters.add("%" + dataWFLogs.getMessage_type() + "%");
        }

        if ( dataWFLogs.getStatus() != null && !dataWFLogs.getStatus().isEmpty()) {
            where.append(" AND status ilike ?");
            parameters.add("%" + dataWFLogs.getStatus() + "%");
        }

        if ( dataWFLogs.getSource() != null && !dataWFLogs.getSource().isEmpty()) {
            where.append(" AND source ilike ?");
            parameters.add("%" + dataWFLogs.getSource() + "%");
        }

        if ( dataWFLogs.getFile_name() != null && !dataWFLogs.getFile_name().isEmpty()) {
            where.append(" AND file_name ilike ?");
            parameters.add("%" + dataWFLogs.getFile_name() + "%");
        }

        if ( dataWFLogs.getFile_name_original() != null && !dataWFLogs.getFile_name_original().isEmpty()) {
            where.append(" AND file_name_original ilike ?");
            parameters.add("%" + dataWFLogs.getFile_name_original() + "%");
        }

        if ( dataWFLogs.getRefference() != null && !dataWFLogs.getRefference().isEmpty()) {
            where.append(" AND refference ilike ?");
            parameters.add("%" + dataWFLogs.getRefference() + "%");
        }

        if ( dataWFLogs.getDescription() != null && !dataWFLogs.getDescription().isEmpty()) {
            where.append(" AND description ilike ?");
            parameters.add("%" + dataWFLogs.getDescription() + "%");
        }

        return new SqlWhere(where.toString(), parameters);
    }
    
    public class SqlWhere {
        private final String clause;
        private final List<Object> params;

        public SqlWhere(String clause, List<Object> params) {
            this.clause = clause;
            this.params = params;
        }

        public String getClause() {
            return clause;
        }

        public List<Object> getParams() {
            return params;
        }
    }

}

