/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.dbase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.vensys.appcm.model.DataBICSwiftGo;
import org.apache.log4j.Logger;

/**
 *
 * @author ovasae
 */
public class DBDataBICGO {

    Connection conn;

    public DBDataBICGO(Connection conn) {
        this.conn = conn;
    }
    Logger log = Logger.getLogger(getClass().getName());
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addBicGo(DataBICSwiftGo data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO swift_go_bic (swift_code, company, updateby, updatedate) VALUES (?,?,?,LOCALTIMESTAMP)";
            System.out.println("SQL addBicGo " + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getSwift_code());
            st.setString(2, data.getCompany());
            st.setString(3, data.getUpdateBy());
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error Insert " + e.getMessage());
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah Swift Go Code", ip, comp);
    }

//    public void addBicGoTemp(DataBICSwiftGo data, String mofier, String ip, String comp) {
//        try {
//            String sql = "INSERT INTO swift_go_bic_temp (swift_code, company, updatedate, updateby) VALUES (?,?,LOCALTIMESTAMP,?)";
//            System.out.println("SQL addBicGo " + sql);
//            PreparedStatement st = this.conn.prepareStatement(sql);
//            st.setString(1, data.getSwift_code());
//            st.setString(2, data.getCompany());
//            st.setString(3, data.getUpdateBy());
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.err.println("Error Insert " + e.getMessage());
//            e.printStackTrace();
//        }
//        evl.insertDataEvent(mofier, "Tambah Swift Go Code", ip, comp);
//    }
    public void updateBicGo(DataBICSwiftGo data, int swift_id, String mofier, String ip, String comp) {
        try {
            String sql = "UPDATE swift_go_bic SET swift_code=?, company=?, updateby=?, updatedate=LOCALTIMESTAMP where swift_id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getSwift_code());
            st.setString(2, data.getCompany());
            st.setString(3, data.getUpdateBy());
            st.setInt(4, swift_id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah BIC Swift Go", ip, comp);
    }

    public List<DataBICSwiftGo> getAllBicGo() throws Exception {
        List<DataBICSwiftGo> datas = new ArrayList<>();
        String sql = "SELECT swift_id, swift_code, company, updateby, updatedate  FROM swift_go_bic ORDER BY swift_code ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataBICSwiftGo data = new DataBICSwiftGo();
            data.setSwift_id(rs.getInt(1));
            data.setSwift_code(rs.getString(2));
            data.setCompany(rs.getString(3));
            data.setUpdateBy(rs.getString(4));
            data.setUpdateDate(rs.getString(5));
            datas.add(data);
        }
        return datas;
    }

    public List<DataBICSwiftGo> getAllBicGo(String swift_code, String company, String updateby) throws Exception {
        List<DataBICSwiftGo> datas = new ArrayList<DataBICSwiftGo>();
        String sql = "SELECT swift_id, swift_code, company, updateby, updatedate FROM swift_go_bic "
                + "WHERE swift_code LIKE '%" + swift_code + "%' AND company LIKE '%" + company + "%'"
                + "AND updateby LIKE '%" + updateby + "%'"
                + "ORDER BY swift_code ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataBICSwiftGo data = new DataBICSwiftGo();
            data.setSwift_id(rs.getInt(1));
            data.setSwift_code(rs.getString(2));
            data.setCompany(rs.getString(3));
            data.setUpdateBy(rs.getString(4));
            data.setUpdateDate(rs.getString(5));
            datas.add(data);
        }
        return datas;
    }

    public DataBICSwiftGo getBicGoById(int swift_id) throws SQLException {
        DataBICSwiftGo data = new DataBICSwiftGo();
        String sql = "SELECT swift_id, swift_code, company, updateby, updatedate FROM swift_go_bic WHERE swift_id='" + swift_id + "'";
        System.out.println("getBicGoById : " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setSwift_id(rs.getInt(1));
            data.setSwift_code(rs.getString(2));
            data.setCompany(rs.getString(3));
            data.setUpdateBy(rs.getString(4));
            data.setUpdateDate(rs.getString(5));
        }
        return data;
    }

    public List<String> cekDataDuplicateBICGo(String swift_code) throws SQLException {
        List<String> datas = new ArrayList<String>();
        String sql = "SELECT t.swift_code FROM swift_go_bic AS t WHERE  t.swift_code = '" + swift_code + "' ORDER BY swift_id ASC";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            datas.add(rs.getString(1));
        }
        return datas;
    }

    public void delete(int swift_id, String mofier, String ip, String comp) throws SQLException {
        String sql = "DELETE FROM swift_go_bic WHERE swift_id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, swift_id);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "Hapus BIC Swift Go", ip, comp);
        evl.updateLogUser(mofier, "BIC Swift Go", tanggal);
    }

    //insert banyak/bulk
    public void addSwiftGoBulk(List<DataBICSwiftGo> data) {
        String sql = "INSERT INTO swift_go_bic_temp (swift_code,company,updatedate,updateby,modification_flag) "
                + "VALUES (?,?,LOCALTIMESTAMP,?,?)";
        try {
            PreparedStatement st = this.conn.prepareStatement(sql);
            this.conn.setAutoCommit(false);
            for (DataBICSwiftGo temp : data) {
//                st.setInt(1, temp.getSwift_id());
                st.setString(1, temp.getSwift_code());
                st.setString(2, temp.getCompany());
                st.setString(3, temp.getUpdateBy());
                st.setString(4, temp.getModification_flag());
                st.addBatch();
            }
            int[] result = st.executeBatch();
            this.log.info("The number of rows inserted: " + result.length);
            this.conn.commit();
        } catch (Exception e) {
            try {
                this.conn.rollback();
            } catch (SQLException ex) {
                this.log.error(ex.getMessage());
            }
            e.printStackTrace();
            this.log.error(e.getMessage());
        }
    }

    //update banyak/bulk
//    public String updateSwiftGoBulk() {
//        String result = "Ubah gagal";
//        try {
//            String sql = "update swift_go_bic set company=?, updatedate=localtimestamp, updateby=?\n"
//                    + "where swift_code in (select a.swift_code from swift_go_bic a "
//                    + "left join swift_go_bic_temp b on a.swift_code=b.swift_code \n"
//                    + "where b.swift_id is not null) and modification_flag = 'M' "
//                    + "group by swift_code ";
//            PreparedStatement st = this.conn.prepareStatement(sql);
//            if (st.executeUpdate() > 0) {
//                result = "Ubah data berhasil";
//            }
//            this.conn.commit();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            result = "Ubah data gagal \n " + e.toString();
//        }
//        return result;
//    }

    public String insertSwiftGoFromTemp() {
        String result = "Ubah gagal";
        try {
            String sql = "insert into swift_go_bic (swift_code,company,updatedate,updateby) select swift_code,max(company),max(updatedate),max(updateby)\n"
                    + "from swift_go_bic_temp \n"
                    + "where swift_code not in ( select a.swift_code from swift_go_bic a "
                    + "left join swift_go_bic_temp b on a.swift_code=b.swift_code where b.swift_id is not null)"
                    + "and modification_flag = 'A' "
                    + "group by swift_code";
            log.info("insertSwiftGoFromTemp " + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            int rowInserted = st.executeUpdate();
            if (rowInserted > 0) {
                result = "Insert " + rowInserted + " data berhasil";
            } else {
                result = "Tidak ada data baru";
            }
            this.conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            result = "Insert data gagal\n " + e.toString();
        }
        return result;
    }

    public String deleteSwiftGoBulk() {
        String result = "Gagal Hapus";
        try {
            String sql = "Delete from swift_go_bic "
                    + "where swift_code in(select swift_code from swift_go_bic_temp where modification_flag = 'D')";
            PreparedStatement st = this.conn.prepareStatement(sql);
            int deletedRows = st.executeUpdate();
            log.info("data terhapus sebanyak : " + deletedRows);
            this.conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            result = "Gagal Hapus\n " + e.toString();
        }
        return result;
    }

    public String truncateSwiftGoBulk() {
        String result = "Gagal Truncate";
        try {
            String sql = "truncate table swift_go_bic_temp";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            result = "Gagal Truncate \n " + e.toString();
        }
        return result;
    }

}
