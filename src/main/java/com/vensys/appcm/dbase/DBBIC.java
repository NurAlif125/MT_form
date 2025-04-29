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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.vensys.appcm.model.DataBIC;
import org.apache.log4j.Logger;

/**
 *
 * @author hadi
 */
public class DBBIC {

    Connection conn;
//    String id = "1";
//    String jumlah = "1";

    public DBBIC(Connection conn) {
        this.conn = conn;
    }
    Logger log = Logger.getLogger(getClass().getName());

    public void addBic(DataBIC data) {
//        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "INSERT INTO bic(code_member,company,address,note) VALUES (?,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getCode_member()); //code_member
            st.setString(2, data.getCompany());     //company
            st.setString(3, data.getAddress());     //address
            st.setString(4, data.getNote());     //note
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateBic(DataBIC data, int id_member) {
        try {
            String sql = "Update bic SET code_member=?,company=?,address=?,note=? where id_member=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getCode_member()); //code_member
            st.setString(2, data.getCompany());     //company
            st.setString(3, data.getAddress());     //address
            st.setString(4, data.getNote());     //note
            st.setInt(5, id_member);     //id_member
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<DataBIC> getAllBic() throws Exception {
        List<DataBIC> datas = new ArrayList<DataBIC>();
        String sql = "SELECT id_member,code_member,company,address,note FROM bic ORDER BY code_member ASC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataBIC data = new DataBIC();
            data.setId_member(rs.getInt(1));
            data.setCode_member(rs.getString(2));
            data.setCompany(rs.getString(3));
            data.setAddress(rs.getString(4));
            data.setNote(rs.getString(5));
            datas.add(data);
        }
        return datas;
    }

    public List<DataBIC> getAllBic(String code_member, String company, String address) throws Exception {
        List<DataBIC> datas = new ArrayList<DataBIC>();
        String sql = "SELECT id_member,code_member,company,address,note FROM bic "
                + "WHERE code_member LIKE '%" + code_member + "%' AND company LIKE '%" + company + "%' AND  "
                + "address LIKE '%" + address + "%' ORDER BY code_member ASC";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataBIC data = new DataBIC();
            data.setId_member(rs.getInt(1));
            data.setCode_member(rs.getString(2));
            data.setCompany(rs.getString(3));
            data.setAddress(rs.getString(4));
            data.setNote(rs.getString(5));
            datas.add(data);
        }
        return datas;
    }

    public DataBIC getBicById(String id_member) throws SQLException {
        DataBIC data = new DataBIC();
        String sql = "SELECT id_member,code_member,company,address,note FROM bic WHERE id_member='" + id_member + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_member(rs.getInt(1));
            data.setCode_member(rs.getString(2));
            data.setCompany(rs.getString(3));
            data.setAddress(rs.getString(4));
            data.setNote(rs.getString(5));
        }
        return data;
    }
    
    public DataBIC getBicByCode(String codeDataBIC) throws SQLException {
        DataBIC data = new DataBIC();
        String sql = "SELECT id_member,code_member,company,address,note FROM bic WHERE code_member LIKE '%" + codeDataBIC + "%'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId_member(rs.getInt(1));
            data.setCode_member(rs.getString(2));
            data.setCompany(rs.getString(3));
            data.setAddress(rs.getString(4));
            data.setNote(rs.getString(5));
        }
        return data;
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM bic WHERE id_member=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, id);
        st.executeUpdate();
    }
    
    //20221223
    public List<DataBIC> getAllMember(int offset, int fetch) throws Exception {
        List<DataBIC> datas = new ArrayList<DataBIC>();
        String sql = "SELECT id_member, code_member, company, address, note FROM bic order by code_member OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        System.out.println("sql DDataBIC = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, offset);
        st.setInt(2, fetch);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataBIC data = new DataBIC();
            data.setId_member(rs.getInt(1));
            data.setCode_member(rs.getString(2));
            data.setCompany(rs.getString(3));
            data.setAddress(rs.getString(4));
            data.setNote(rs.getString(5));
            datas.add(data);
        }
        return datas;
    }
    
    public int countMember() throws Exception {
        int result = 0;
        String sql = "select count(*) from bic";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            result = rs.getInt(1);
        }
        return result;
    }
        public int getNumberofRows() throws Exception {
        String sql = "SELECT count(*) FROM bic";
        ResultSet rs = this.conn.createStatement().executeQuery(sql);
        rs.next();
        return rs.getInt(1);
    }
        public List<String[]> getAllBicAjax() throws Exception {
        List<String[]> datas = new ArrayList<String[]>();
        String sql = "SELECT id_member,code_member,company,address,note FROM bic";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
//            DataBIC data = new DataBIC();
//            data.setId_member(rs.getInt(1));
//            data.setCode_member(rs.getString(2));
//            data.setCompany(rs.getString(3));
//            data.setAddress(rs.getString(4));
//            data.setNote(rs.getString(5));

            String[] value = {
                rs.getString(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5),};
            datas.add(value);
        }
        return datas;
    }
    public List<String[]> getPagesBicAjax(int offset, int numberLimit) throws Exception {
        List<String[]> datas = new ArrayList<String[]>();
        String sql = "SELECT id_member,code_member,company,address,note FROM bic ORDER BY id_member OFFSET " + offset + " ROWS FETCH NEXT " + numberLimit + " ROWS ONLY";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {

            String[] value = {
                rs.getString(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5),};
            datas.add(value);
        }
        return datas;
    }
        
    public void addBICBulk(List<DataBIC> data) {
        String sql = "INSERT INTO bic (code_member,company,address,note)"
                + "VALUES (?,?,?,?)";
        try {
            PreparedStatement st = this.conn.prepareStatement(sql);
            this.conn.setAutoCommit(false);
            for (DataBIC temp: data) {
                st.setString(1, temp.getCode_member());
                st.setString(2, temp.getCompany());
                st.setString(3, temp.getAddress());
                st.setString(4, temp.getNote());
                //st.setString(5, temp.getModification_flag());
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
        
    public String truncateBICBulk() {
        String result = "Gagal Truncate";
        try {
            String sql = "truncate table bic";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            result = "Gagal Truncate \n " + e.toString();
        }
        return result;
    }
}

