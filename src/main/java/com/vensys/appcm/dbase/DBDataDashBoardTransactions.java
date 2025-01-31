/*
    * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
    * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.vensys.appcm.model.DataDashBoardTransactions;
//    import com.vensys.appcm.model.DataDashBoardTransactionsFTI;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
//import org.apache.log4j.Logger;

/**
 *
 * @author Administrator
 */
public class DBDataDashBoardTransactions {

    Connection conn;
    //    String id = "1";
    //    String jumlah = "1";

    public DBDataDashBoardTransactions(Connection conn) {
        this.conn = conn;
    }

    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    Logger log = LogManager.getLogger(getClass().getName());

    public List<String> findAllPosibleTagByCharges(String io_type, String begDateInsert, String endDateInsert) {

        System.out.println(begDateInsert);
        System.out.println(endDateInsert);

        List<String> values = new ArrayList<>();
        String sql = "";

        try {
            if (io_type.equalsIgnoreCase("O")) { //incoming
                sql = "select distinct(flag) from viewReportIncCharges where (CAST(tanggal as DATE) BETWEEN ? AND ?)";
            } else {
                sql = "select distinct(flag) from viewReportOutCharges where (CAST(tanggal as DATE) BETWEEN ? AND ?)";
            }
            System.out.println("sql findAllPosibleTagByCharges " + sql);
            PreparedStatement st = this.conn.prepareCall(sql);
            st.setString(1, begDateInsert);
            st.setString(2, endDateInsert);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                values.add(rs.getString(1).trim().toUpperCase());
            }

        } catch (SQLException ex) {
            log.error("err findAllPosibleTagByCharges " + ex.getLocalizedMessage());
        }

        return values;
    }

    public List<String> findAllPosibleTagByInsertDate(String io_type, String begDateInsert, String endDateInsert) {

        System.out.println(begDateInsert);
        System.out.println(endDateInsert);

        List<String> values = new ArrayList<>();
        String sql = "";

        try {
            if (io_type.equalsIgnoreCase("O")) { //incoming
                sql = "select distinct(flag) from viewReportIncFTI where (CAST(tanggal as DATE) BETWEEN ? AND ?)";
            } else {
                sql = "select distinct(flag) from viewReportOutFTI where (CAST(tanggal as DATE) BETWEEN ? AND ?)";
            }
            System.out.println("sql findAllPosibleTagByInsertDate " + sql);
            PreparedStatement st = this.conn.prepareCall(sql);
            st.setString(1, begDateInsert);
            st.setString(2, endDateInsert);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                values.add(rs.getString(1).trim().toUpperCase());
            }

        } catch (SQLException ex) {
            log.error("findAllPosibleTagByInsertDate" + ex.getLocalizedMessage());
        }

        return values;
    }

    //public List<String> findAllPosibleTag(String begDate, String endDate, String begDateInsert, String endDateInsert){
    public List<String> findAllPosibleTag(String begDate, String endDate, String begDateInsert, String endDateInsert, String io_type) {
        System.out.println(begDate);
        System.out.println(endDate);
        System.out.println(begDateInsert);

        List<String> values = new ArrayList<>();
        String sql = "";
        try {
            if (io_type.equalsIgnoreCase("O")) { //incoming
                sql = "select distinct(flag) from viewReportIncAll where (dateValue BETWEEN ? AND ? OR dateValue='--') AND (CAST(tanggal AS DATE) BETWEEN CAST(? AS DATE) AND CAST(? AS DATE))";
            } else {
                sql = "select distinct(flag) from viewReportOutAll where (dateValue BETWEEN ? AND ? OR dateValue='--') AND (CAST(tanggal AS DATE) BETWEEN CAST(? AS DATE) AND CAST(? AS DATE))";
            }

            System.out.println("sql findAllPosibleTag: " + sql);
            //String sql = "select distinct(flag) from viewReport where (dateValue BETWEEN ? AND ? OR dateValue='--') AND (CAST(tanggal as DATE) BETWEEN ? AND ?)";
            PreparedStatement st = this.conn.prepareCall(sql);
            st.setString(1, begDate);
            st.setString(2, endDate);
            st.setString(3, begDateInsert);
            st.setString(4, endDateInsert);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                values.add(rs.getString(1).trim().toUpperCase());
            }

        } catch (SQLException ex) {
            log.error("err findAllPosibleTag" + ex.getLocalizedMessage());
        }

        return values;
    }

    //public List<String> findAllPosibleCcy(String begDate, String endDate, String begDateInsert, String endDateInsert){
    public List<String> findAllPosibleCcy(String begDate, String endDate, String begDateInsert, String endDateInsert, String io_type) {
        List<String> values = new ArrayList<>();
        String sql = "";
        try {
            if (io_type.equalsIgnoreCase("O")) { // Incoming
                sql = "select distinct(ccy) from viewReportIncAll where (dateValue BETWEEN ? AND ? OR dateValue='--') AND (CAST(tanggal as DATE) BETWEEN CAST(? AS DATE) AND CAST(? AS DATE))";
            } else { // Outgoing
                sql = "select distinct(ccy) from viewReportOutAll where (dateValue BETWEEN ? AND ? OR dateValue='--') AND (CAST(tanggal as DATE) BETWEEN CAST(? AS DATE) AND CAST(? AS DATE))";
            }            
            //String sql = "select distinct(ccy) from viewReport where (dateValue BETWEEN ? AND ? OR dateValue='--') AND (CAST(tanggal as DATE) BETWEEN ? AND ?)";
            System.out.println("sql findAllPosibleCcy : " + sql);
            PreparedStatement st = this.conn.prepareCall(sql);
            st.setString(1, begDate);
            st.setString(2, endDate);
            st.setString(3, begDateInsert);
            st.setString(4, endDateInsert);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                values.add(rs.getString(1).trim().toUpperCase());
            }

        } catch (SQLException ex) {
            log.error("err findAllPosibleCcy " + ex.getLocalizedMessage());
        }

        return values;
    }

//        public DataDashBoardTransactionsFTI findDataDashBoardTransactionsFlagSumCharges(String io_type, String flag, String begDateInsert, String endDateInsert){
//            System.out.println("start findDataDashBoardTransactionsFlagSumCharges only InsertDate");
//            String sql="";
//            DataDashBoardTransactionsFTI tempData = new DataDashBoardTransactionsFTI();
//            
//            try{
//                if(io_type.equalsIgnoreCase("O")){ //incoming
//                    sql = "select flag, count(flag) as sumFti from viewReportIncCharges where flag = ? AND (CAST(tanggal as DATE) BETWEEN ? AND ?) group by flag";
//                } else {
//                    sql = "select flag, count(flag) as sumFti from viewReportOutCharges where flag = ? AND (CAST(tanggal as DATE) BETWEEN ? AND ?) group by flag";
//                }
//                PreparedStatement st = this.conn.prepareCall(sql);
//                st.setString(1, flag);
//                st.setString(2, begDateInsert);
//                st.setString(3, endDateInsert);
//                
//                ResultSet rs = st.executeQuery();
//                
//                while(rs.next()){
//                    tempData.setFlag(rs.getString("flag"));
//                    tempData.setSum(rs.getString("sumFti"));
//                }
//                
//            }
//            catch(SQLException ex){
//                log.error(ex.getLocalizedMessage());
//            }
//            
//            return tempData;
//        }
//        public DataDashBoardTransactionsFTI findDataDashBoardTransactionsFlagSumByInsertDate(String io_type, String flag, String begDateInsert, String endDateInsert){
//            System.out.println("start findDataDashBoardTransactionsFlagSumByInsertDate only InsertDate");
//            String sql="";
//            DataDashBoardTransactionsFTI tempData = new DataDashBoardTransactionsFTI();
//            
//            try{
//                if(io_type.equalsIgnoreCase("O")){ //incoming
//                    sql = "select flag, count(flag) as sumFti from viewReportIncFTI where flag = ? AND (CAST(tanggal as DATE) BETWEEN ? AND ?) group by flag";
//                } else {
//                    sql = "select flag, count(flag) as sumFti from viewReportOutFTI where flag = ? AND (CAST(tanggal as DATE) BETWEEN ? AND ?) group by flag";
//                }
//                PreparedStatement st = this.conn.prepareCall(sql);
//                st.setString(1, flag);
//                st.setString(2, begDateInsert);
//                st.setString(3, endDateInsert);
//                
//                ResultSet rs = st.executeQuery();
//                
//                while(rs.next()){
//                    tempData.setFlag(rs.getString("flag"));
//                    tempData.setSum(rs.getString("sumFti"));
//                }
//                
//            }
//            catch(SQLException ex){
//                log.error(ex.getLocalizedMessage());
//            }
//            
//            return tempData;
//        }
    //semua flag ditampilin, meskipun nilai nya 0
//        public DataDashBoardTransactionsFTI findDataDashBoardTransactionsFlagSumOutFTI(String io_type, String flag, String begDateInsert, String endDateInsert){
//            System.out.println("start findDataDashBoardTransactionsFlagSumOutFTI flag = " + flag);
//            String sql="";
//            DataDashBoardTransactionsFTI tempData = new DataDashBoardTransactionsFTI();
//            
//            try{
//                if(io_type.equalsIgnoreCase("O")){ //incoming
//                    sql = "select flag, count(flag) as sumFti from viewReportIncFTI where flag = ? AND (CAST(tanggal as DATE) BETWEEN ? AND ?) group by flag";
//                } else {
//                    sql = "select flag, count(flag) as sumFti from viewReportOutFTI where flag = ? AND (CAST(tanggal as DATE) BETWEEN ? AND ?) group by flag";
//                }
//                PreparedStatement st = this.conn.prepareCall(sql);
//                st.setString(1, flag);
//                st.setString(2, begDateInsert);
//                st.setString(3, endDateInsert);
//                
//                ResultSet rs = st.executeQuery();
//                if(rs.next()){
//                    tempData.setFlag(rs.getString("flag"));
//                    tempData.setSum(rs.getString("sumFti"));
//                } else {
//                    tempData.setFlag(flag);
//                    tempData.setSum("0");
//                }
//                
//            }
//            catch(SQLException ex){
//                log.error(ex.getLocalizedMessage());
//            }
//            
//            return tempData;
//        }
    public DataDashBoardTransactions findDataDashBoardTransactionsByTag(String flag, String begDate, String endDate,
            String begDateInsert, String endDateInsert, List<String> ccyDistincy, String io_type) {
        System.out.println("start findDataDashBoardTransactionsByTag");

        DataDashBoardTransactions tempData = new DataDashBoardTransactions();
        String sql = "";
        try {
            if (io_type.equalsIgnoreCase("O")) { //incoming
                sql = "select flag, ccy, count(ccy) as slip, sum(valCcy) as val from viewReportIncAll\n"
                        + "where flag = ? and (dateValue BETWEEN ? AND ? OR dateValue='--') AND (CAST(tanggal as DATE) BETWEEN CAST(? AS DATE) AND CAST(? AS DATE))\n"
                        + "group by ccy,flag";
            } else {
                sql = "select flag, ccy, count(ccy) as slip, sum(valCcy) as val from viewReportOutAll\n"
                        + "where flag = ? and (dateValue BETWEEN ? AND ? OR dateValue='--') AND (CAST(tanggal as DATE) BETWEEN CAST(? AS DATE) AND CAST(? AS DATE))\n"
                        + "group by ccy,flag";
            }
            /*String sql = "select flag, ccy, count(ccy) as slip, sum(valCcy) as val from viewReport\n" +
                "where flag = ? and (dateValue BETWEEN ? AND ? OR dateValue='--') AND (CAST(tanggal as DATE) BETWEEN ? AND ?)\n" +
                "group by ccy,flag";*/
            System.out.println("sql findDataDashBoardTransactionsByTag" + sql);
            PreparedStatement st = this.conn.prepareCall(sql);
            st.setString(1, flag);
            st.setString(2, begDate);
            st.setString(3, endDate);
            st.setString(4, begDateInsert);
            st.setString(5, endDateInsert);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                // Parent objectnya
                // Jika null maka isi flag
                if (tempData.getFlag() == null) {
                    tempData.setFlag(rs.getString("flag"));
                }
                System.out.println(rs.getString("flag"));
                // Sisanya masukan data yang lainnya
                // dan
                // Hanya memasukan sesuai urutan
                for (String ccyUrutan : ccyDistincy) {

                    // check sesuai urutan ccy
                    if (ccyUrutan.equalsIgnoreCase(rs.getString("ccy"))) {
                        System.out.println("Ada data : " + ccyUrutan + " (" + rs.getString("slip") + ")");
                        tempData.addSlipAmountAndCCY(rs.getString("ccy"), rs.getString("slip"), rs.getString("val"));
                    } else {
                        // Jadikan angka null maka disini
                        System.out.println("Tidak ada data " + ccyUrutan);
                        tempData.addSlipAmountAndCCY(ccyUrutan, "0", "0.00");
                    }

                }

            }

        } catch (SQLException ex) {
            log.error("err findDataDashBoardTransactionsByTag " + ex.getLocalizedMessage());
        }

        return tempData;
    }

    //public Map<String, Map<String,String>> findSumSlipAmount (String begDate, String endDate, String begDateInsert,String endDateInsert){
    public Map<String, Map<String, String>> findSumSlipAmount(String begDate, String endDate, String begDateInsert, String endDateInsert, String io_type) {
        System.out.println("start findSumSlipAmount");

        Map<String, Map<String, String>> sumData = new HashMap<String, Map<String, String>>();
        String sql = "";
        try {
            if (io_type.equalsIgnoreCase("O")) { // Incoming
                sql = "select ccy, count(ccy) as sumSlip, sum(valCcy) as sumAmount "
                        + "from viewReportIncAll "
                        + "where (dateValue BETWEEN ? AND ? OR dateValue='--') "
                        + "AND (CAST(tanggal as DATE) BETWEEN CAST(? AS DATE) AND CAST(? AS DATE)) "
                        + "group by ccy";
            } else { // Outgoing
                sql = "select ccy, count(ccy) as sumSlip, sum(valCcy) as sumAmount "
                        + "from viewReportOutAll "
                        + "where (dateValue BETWEEN ? AND ? OR dateValue='--') "
                        + "AND (CAST(tanggal as DATE) BETWEEN CAST(? AS DATE) AND CAST(? AS DATE)) "
                        + "group by ccy";
            }
            // String sql = "select ccy,count(ccy) as sumSlip, sum(valCcy) as sumAmount from viewReport where (dateValue BETWEEN ? AND ? OR dateValue='--') AND (CAST(tanggal as DATE) BETWEEN ? AND ?) group by ccy";
            System.out.println("sql findSumSlipAmount: " + sql);
            PreparedStatement st = this.conn.prepareCall(sql);
            st.setString(1, begDate);
            st.setString(2, endDate);
            st.setString(3, begDateInsert);
            st.setString(4, endDateInsert);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Map<String, String> temp = new HashMap<String, String>();
                temp.put("countSlip", rs.getString("sumSlip"));
                temp.put("countAmount", rs.getString("sumAmount"));
                sumData.put(rs.getString("ccy"), temp);
            }

        } catch (SQLException ex) {
            log.error("err findSumSlipAmount " + ex.getLocalizedMessage());
        }

        return sumData;
    }

}
