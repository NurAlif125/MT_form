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
            HeaderSearchCriteria criteria,
            String quicksearch,
            String sort,
            String date_from,
            String date_end
    ) throws Exception {
        List<DataWorkflowLogs> datas = new ArrayList<>();
        List<Object> parameters = new ArrayList<>();

        StringBuilder where = new StringBuilder("1=1");
        
//        where.append(" AND to_char(to_timestamp(date_time, 'YYYY-MM-DD\"T\"HH24:MI:SSOF'), 'YYYY-MM-DD HH24:MI:SS') = ?");
//        parameters.add(date_from);

//        if (quicksearch != null && !quicksearch.isEmpty()) {
//            if (quicksearch.toLowerCase().startsWith("ou")) {
//                where.append(" AND (h.io_type = ? OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?)");
//                parameters.add("I");
//                parameters.add("%" + quicksearch + "%");
//            } else if (quicksearch.toLowerCase().startsWith("in")) {
//                where.append(" AND (h.io_type = ? OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?)");
//                parameters.add("O");
//                parameters.add("%" + quicksearch + "%");
//            } else if (quicksearch.toLowerCase().startsWith("man")) {
//                where.append(" AND (h.userentry = ? OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?)");
//                parameters.add("SRC:MANUAl");
//                parameters.add("%" + quicksearch + "%");
//            } else if (quicksearch.toLowerCase().startsWith("c")) {
//                where.append(" AND (h.userentry = ? OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?)");
//                parameters.add("SRC:FIA");
//                parameters.add("%" + quicksearch + "%");
//            } else {
//                where.append(" AND CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?");
//                parameters.add("%" + quicksearch + "%");
//            }
//        }
//
//        // Dynamic filters dari criteria
//        if (criteria != null) {
//            if (criteria.getMtSearch() != null && !criteria.getMtSearch().isEmpty()) {
//                where.append(" AND h.messageType ILIKE ?");
//                parameters.add("%" + criteria.getMtSearch() + "%");
//            }
//            if (criteria.getIoSearch() != null && !criteria.getIoSearch().isEmpty()) {
////            where.append(" AND h.io_type ILIKE ?");
//                where.append(" AND h.io_type = ?");
//                String ioInput = criteria.getIoSearch().trim().toLowerCase();
////            if ("incoming".contains(ioInput)) {
//                if (ioInput.startsWith("ou")) {
//                    parameters.add("I");
////            } else if ("outgoing".contains(ioInput)) {
//                } else if (ioInput.startsWith("in")) {
//                    parameters.add("O");
//                }
////                parameters.add("%" + criteria.getIoSearch() + "%");
//            }
//            if (criteria.getSeqSearch() != null && !criteria.getSeqSearch().isEmpty()) {
//                where.append(" AND h.sequenceNumber::TEXT ILIKE ?");
//                parameters.add("%" + criteria.getSeqSearch() + "%");
//            }
//            if (criteria.getLogicalSearch() != null && !criteria.getLogicalSearch().isEmpty()) {
//                where.append(" AND h.logicalTerminal ILIKE ?");
//                parameters.add("%" + criteria.getLogicalSearch() + "%");
//            }
//            if (criteria.getReceiverSearch() != null && !criteria.getReceiverSearch().isEmpty()) {
//                where.append(" AND h.receiverAddress ILIKE ?");
//                parameters.add("%" + criteria.getReceiverSearch() + "%");
//            }
//            if (criteria.getRefSearch() != null && !criteria.getRefSearch().isEmpty()) {
//                where.append(" AND td.trans_reference ILIKE ?");
//                parameters.add("%" + criteria.getRefSearch() + "%");
//            }
//            if (criteria.getRelRefSearch() != null && !criteria.getRelRefSearch().isEmpty()) {
//                where.append(" AND td.trans_related_reference ILIKE ?");
//                parameters.add("%" + criteria.getRelRefSearch() + "%");
//            }
//            if (criteria.getValDateSearch() != null && !criteria.getValDateSearch().isEmpty()) {
//                where.append(" AND td.trans_date_value::TEXT ILIKE ?");
//                parameters.add("%" + criteria.getValDateSearch() + "%");
//            }
//            if (criteria.getCcySearch() != null && !criteria.getCcySearch().isEmpty()) {
//                where.append(" AND td.trans_ccy ILIKE ?");
//                parameters.add("%" + criteria.getCcySearch() + "%");
//            }
//            if (criteria.getAmountSearch() != null && !criteria.getAmountSearch().isEmpty()) {
//                where.append(" AND td.trans_amount::TEXT ILIKE ?");
//                parameters.add("%" + criteria.getAmountSearch().replace(".", "").replace(",", ".") + "%");
//            }
//            if (criteria.getCreatedDateSearch() != null && !criteria.getCreatedDateSearch().isEmpty()) {
//                where.append(" AND h.tanggal::TEXT ILIKE ?");
//                parameters.add("%" + criteria.getCreatedDateSearch() + "%");
//            }
//            if (criteria.getFlagSearch() != null && !criteria.getFlagSearch().isEmpty()) {
//                where.append(" AND h.flag ILIKE ?");
//                parameters.add("%" + criteria.getFlagSearch() + "%");
//            }
//            
//            if (criteria.getSourceSearch() != null && !criteria.getSourceSearch().isEmpty()) {
//                 source = criteria.getSourceSearch().trim();
//                if (source.startsWith("tre") || source.startsWith("Tre") || source.startsWith("TRE")) {
//                    where.append(" AND (source IN ('FRONTARENA', 'TSA') OR logicalTerminal IN ('BDINIDJAXTRS', 'BDINIDJAXXXX'))");
//                } else if (source.startsWith("tra") || source.startsWith("Tra") || source.startsWith("TRA")) {
//                    where.append(" AND (source = 'BANKTRADE' OR logicalTerminal = 'BDINIDJAXCLC')");
//                } else if (source.startsWith("c") || source.startsWith("C")) {
//                    where.append(" AND (source = 'CSA' OR source = 'CUSTODY' OR logicalTerminal='BDINIDJAXCUS')");
//                } else if (source.startsWith("r") || source.startsWith("R")) {
//                    where.append(" AND (source = 'NCBS' OR logicalTerminal='BDINIDJAXRMT')");
//                } else {
//                    where.append(" AND h.source ILIKE ?");
//                    parameters.add("%" + criteria.getSourceSearch() + "%");
//                }
//            }
//            if (criteria.getCreateby() != null && !criteria.getCreateby().isEmpty()) {
//                where.append(" AND h.createby ILIKE ?");
//                parameters.add("%" + criteria.getCreateby() + "%");
//            }
//            if (criteria.getApproveby() != null && !criteria.getApproveby().isEmpty()) {
//                where.append(" AND h.approveby ILIKE ?");
//                parameters.add("%" + criteria.getApproveby() + "%");
//            }
//        }
        
        String sql = "SELECT to_char(to_timestamp(date_time, 'YYYY-MM-DD\"T\"HH24:MI:SSOF'), 'YYYY-MM-DD HH24:MI:SS') as date_time"
                + ",component_name, message_type, file_name_original, file_name, refference, status, description, source " 
                    +"FROM workflow_logs "
                + "WHERE " + where + " ORDER BY " + sort + " LIMIT ? OFFSET ?";

        try (PreparedStatement st = this.conn.prepareStatement(sql)) {
            int idx = 1;
            for (Object param : parameters) {
                st.setObject(idx++, param);
            }
            st.setInt(idx++, length); // limit
            st.setInt(idx, start);
            
            //check hasil query
            String rawSql = sql;
            for (Object param : parameters) {
                rawSql = rawSql.replaceFirst("\\?", "'" + String.valueOf(param).replace("'", "''") + "'");
            }
            rawSql = rawSql.replaceFirst("\\?", String.valueOf(length));
            rawSql = rawSql.replaceFirst("\\?", String.valueOf(start));
        System.out.println("Expanded LIST search SQL:\n" + rawSql); //cetak hasil query
            
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    DataWorkflowLogs data = new DataWorkflowLogs();
                    data.setDate_time(rs.getString("date_time"));
                    data.setCompoent_name(rs.getString("component_name"));
                    data.setMessage_type(rs.getString("message_type"));
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
            HeaderSearchCriteria criteria,
            String quicksearch,
            String sort,
            String date_from,
            String date_end
    ) throws Exception {
        List<Object> parameters = new ArrayList<>();

        StringBuilder where = new StringBuilder("1=1");
//
//        if (quicksearch != null && !quicksearch.isEmpty()) {
//            if (quicksearch.toLowerCase().startsWith("ou")) {
//                where.append(" AND (h.io_type = ? OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?)");
//                parameters.add("I");
//                parameters.add("%" + quicksearch + "%");
//            } else if (quicksearch.toLowerCase().startsWith("in")) {
//                where.append(" AND (h.io_type = ? OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?)");
//                parameters.add("O");
//                parameters.add("%" + quicksearch + "%");
//            } else if (quicksearch.toLowerCase().startsWith("man")) {
//                where.append(" AND (h.userentry = ? OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?)");
//                parameters.add("SRC:MANUAl");
//                parameters.add("%" + quicksearch + "%");
//            } else if (quicksearch.toLowerCase().startsWith("c")) {
//                where.append(" AND (h.userentry = ? OR CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?)");
//                parameters.add("SRC:FIA");
//                parameters.add("%" + quicksearch + "%");
//            } else {
//                where.append(" AND CONCAT(h.id_headers, h.messageType, h.logicalTerminal, h.sessionNumber, h.sequenceNumber, h.io_type, h.receiverAddress, h.tanggal, h.flag, h.block3, h.source, td.trans_reference, td.trans_related_reference, td.trans_date_value, td.trans_amount, td.trans_ccy) ILIKE ?");
//                parameters.add("%" + quicksearch + "%");
//            }
//        }
//
//        // Dynamic filters dari criteria
//        if (criteria != null) {
//            if (criteria.getMtSearch() != null && !criteria.getMtSearch().isEmpty()) {
//                where.append(" AND h.messageType ILIKE ?");
//                parameters.add("%" + criteria.getMtSearch() + "%");
//            }
//            if (criteria.getIoSearch() != null && !criteria.getIoSearch().isEmpty()) {
////            where.append(" AND h.io_type ILIKE ?");
//                where.append(" AND h.io_type = ?");
//                String ioInput = criteria.getIoSearch().trim().toLowerCase();
////            if ("incoming".contains(ioInput)) {
//                if (ioInput.startsWith("ou")) {
//                    parameters.add("I");
////            } else if ("outgoing".contains(ioInput)) {
//                } else if (ioInput.startsWith("in")) {
//                    parameters.add("O");
//                }
////                parameters.add("%" + criteria.getIoSearch() + "%");
//            }
//            if (criteria.getSeqSearch() != null && !criteria.getSeqSearch().isEmpty()) {
//                where.append(" AND h.sequenceNumber::TEXT ILIKE ?");
//                parameters.add("%" + criteria.getSeqSearch() + "%");
//            }
//            if (criteria.getLogicalSearch() != null && !criteria.getLogicalSearch().isEmpty()) {
//                where.append(" AND h.logicalTerminal ILIKE ?");
//                parameters.add("%" + criteria.getLogicalSearch() + "%");
//            }
//            if (criteria.getReceiverSearch() != null && !criteria.getReceiverSearch().isEmpty()) {
//                where.append(" AND h.receiverAddress ILIKE ?");
//                parameters.add("%" + criteria.getReceiverSearch() + "%");
//            }
//            if (criteria.getRefSearch() != null && !criteria.getRefSearch().isEmpty()) {
//                where.append(" AND td.trans_reference ILIKE ?");
//                parameters.add("%" + criteria.getRefSearch() + "%");
//            }
//            if (criteria.getRelRefSearch() != null && !criteria.getRelRefSearch().isEmpty()) {
//                where.append(" AND td.trans_related_reference ILIKE ?");
//                parameters.add("%" + criteria.getRelRefSearch() + "%");
//            }
//            if (criteria.getValDateSearch() != null && !criteria.getValDateSearch().isEmpty()) {
//                where.append(" AND td.trans_date_value::TEXT ILIKE ?");
//                parameters.add("%" + criteria.getValDateSearch() + "%");
//            }
//            if (criteria.getCcySearch() != null && !criteria.getCcySearch().isEmpty()) {
//                where.append(" AND td.trans_ccy ILIKE ?");
//                parameters.add("%" + criteria.getCcySearch() + "%");
//            }
//            if (criteria.getAmountSearch() != null && !criteria.getAmountSearch().isEmpty()) {
//                where.append(" AND td.trans_amount::TEXT ILIKE ?");
//                parameters.add("%" + criteria.getAmountSearch().replace(".", "").replace(",", ".") + "%");
//            }
//            if (criteria.getCreatedDateSearch() != null && !criteria.getCreatedDateSearch().isEmpty()) {
//                where.append(" AND h.tanggal::TEXT ILIKE ?");
//                parameters.add("%" + criteria.getCreatedDateSearch() + "%");
//            }
//            if (criteria.getFlagSearch() != null && !criteria.getFlagSearch().isEmpty()) {
//                where.append(" AND h.flag ILIKE ?");
//                parameters.add("%" + criteria.getFlagSearch() + "%");
//            }
//            
//            if (criteria.getSourceSearch() != null && !criteria.getSourceSearch().isEmpty()) {
//                 source = criteria.getSourceSearch().trim();
//                if (source.startsWith("tre") || source.startsWith("Tre") || source.startsWith("TRE")) {
//                    where.append(" AND (source IN ('FRONTARENA', 'TSA') OR logicalTerminal IN ('BDINIDJAXTRS', 'BDINIDJAXXXX'))");
//                } else if (source.startsWith("tra") || source.startsWith("Tra") || source.startsWith("TRA")) {
//                    where.append(" AND (source = 'BANKTRADE' OR logicalTerminal = 'BDINIDJAXCLC')");
//                } else if (source.startsWith("c") || source.startsWith("C")) {
//                    where.append(" AND (source = 'CSA' OR source = 'CUSTODY' OR logicalTerminal='BDINIDJAXCUS')");
//                } else if (source.startsWith("r") || source.startsWith("R")) {
//                    where.append(" AND (source = 'NCBS' OR logicalTerminal='BDINIDJAXRMT')");
//                } else {
//                    where.append(" AND h.source ILIKE ?");
//                    parameters.add("%" + criteria.getSourceSearch() + "%");
//                }
//            }
//            if (criteria.getCreateby() != null && !criteria.getCreateby().isEmpty()) {
//                where.append(" AND h.createby ILIKE ?");
//                parameters.add("%" + criteria.getCreateby() + "%");
//            }
//            if (criteria.getApproveby() != null && !criteria.getApproveby().isEmpty()) {
//                where.append(" AND h.approveby ILIKE ?");
//                parameters.add("%" + criteria.getApproveby() + "%");
//            }
//        }
        
        String sql = "SELECT COUNT(date_time) FROM workflow_logs "
                + "WHERE " + where;

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
    
}
