/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

import com.vensys.appcm.dbase.DBEventLog;
import com.vensys.appcm.dbase.DBEventLog;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.vensys.appcm.model.HeaderTemplate;
import com.vensys.appcm.model.TagTemplateDB;
import org.apache.log4j.Logger;

/**
 *
 * @author rahma
 */
public class DBDataTemplateMT {

    Connection conn;

    public DBDataTemplateMT(Connection conn) {
        this.conn = conn;
    }

    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    Logger log = Logger.getLogger(getClass().getName());

    public int id_template() {
        int id = 0;
        try {
            String sql = "SELECT max(id_template) as id_template from headers_template;";
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = Integer.parseInt(rs.getString("id_template"));
            }

        } catch (Exception e) {
            // System.out.println("ID TEMPLATE : " + e);
            log.error("ID TEMPLATE : " + e);
        }
        return id;
    }

    public String addDataTemplateMT(HeaderTemplate data, String user_id, String ip_access, String comp_name) {
        String headerTemplate = "";
        try {
            String sql = "INSERT INTO headers_template(name,logicalterminal,receiverAddress,"
                    + "messagetype,isenable,updateby,updatetime) VALUES (?,?,?,?,?,?,LOCALTIMESTAMP) returning id_templates";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getName());
            st.setString(2, data.getLogicalTerminal());
            st.setString(3, data.getReceiverAddress());
            st.setString(4, data.getMessageType());
            st.setBoolean(5, true);
            st.setString(6, user_id);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                headerTemplate = rs.getString("id_templates");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(user_id, "Membuat Template Baru", ip_access, comp_name);
        evl.updateLogUser(user_id, "TMP", tanggal);
        return headerTemplate;
    }

    public void addDataTagTemplate(int urutan, String tag, String detail, String tagName, int id) {
        try {
            String sql = "INSERT INTO tags_template(urutan,id_templates,tag,detail,tagName,info) VALUES (?,'" + id + "',?,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, urutan);
            st.setString(2, tag);
            st.setString(3, detail);
            st.setString(4, tagName);
            st.setString(5, "");
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addDataTagsBeforeNoTagsTemplate(int urutan, String id, String tagsKey, String tagValue, String tagName) {
        String info = "";
        try {
            String sql = "INSERT INTO tags_template (urutan,id_templates,tag,detail,tagName,info) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            try {
                st.setInt(1, urutan);  //count
                st.setInt(2, Integer.parseInt(id));  //id
                st.setString(3, tagsKey);  //tag
                st.setString(4, tagValue.trim());  //detail
                st.setString(5, tagName);  //tagName
                st.setString(6, info);  //info
                st.executeUpdate();
            } catch (SQLException e) {
                // System.out.print("Error SQL MT: " + e.getMessage());
                log.info("Error SQL MT: " + e.getMessage());
            }
        } catch (SQLException swl) {
            // System.out.print("Error SQL MT: " + swl.getMessage());
            log.info("Error SQL MT: " + swl.getMessage());
        }
    }

    public void updateDataTemplateMT(HeaderTemplate data, String user_id, Integer id_templates, String ip_access, String comp_name) throws SQLException, Exception {
        log.info("updateDataTemplateMT");
        try {
            String sql = "UPDATE headers_template SET logicalterminal = ?, receiverAddress = ?, updateby = ?, updatetime = LOCALTIMESTAMP WHERE isenable = true AND id_templates = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getLogicalTerminal());
            st.setString(2, data.getReceiverAddress());
            st.setString(3, user_id);
            st.setInt(4, id_templates);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteDataTemplateMT(HeaderTemplate data, String user_id, Integer id_templates, String ip_access, String comp_name) throws SQLException, Exception {
        log.info("deleteDataTemplateMT");
        try {
            String sql = "UPDATE headers_template SET isenable = false, updateby = ?, updatetime = LOCALTIMESTAMP WHERE isenable = true AND id_templates = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, user_id);
            st.setInt(2, id_templates);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void cleanDataTagTemplate(int id_templates) {
        try {
            String sql = "DELETE FROM tags_template WHERE id_templates = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, id_templates);
            st.executeUpdate();
        } catch (SQLException e) {
            log.info("Error Delete Tag:" + e.getMessage());
        }
    }

    public void updateDataTag(int urutan, String tag, String detail, String tagName, int id_templates) {
        try {
            String sql = "UPDATE tags_template SET detail=? WHERE id_templates = ? AND tagName = ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, detail);
            st.setInt(2, id_templates);
            st.setString(3, tagName);
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateDataTagCharges(String tag, String detail, String tagName, int id_templates) {
        try {
            String sql = "UPDATE tags_template SET detail=? WHERE id_templates = ? AND tagName like ?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, detail);
            st.setInt(2, id_templates);
            st.setString(3, "%" + tagName);
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public HeaderTemplate getHeaderTemplateById(String Idtemplate) throws SQLException {
        HeaderTemplate headertemplate = new HeaderTemplate();
        String sql = "SELECT name,logicalTerminal,receiverAddress,messagetype,"
                + "updateby,updatetime, null AS io_type, null AS messagepriority, "
                + "null AS block3, null AS mur, null AS komentar, null AS networktype, "
                + "null AS id_headers, null AS cust_curr, true AS isdefaultfia, null AS cov, null AS settlementmethod "
                + "FROM headers_template WHERE isenable = true AND id_templates='" + Idtemplate + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            headertemplate.setName(rs.getString(1));
            headertemplate.setLogicalTerminal(rs.getString(2));
            headertemplate.setReceiverAddress(rs.getString(3));
            headertemplate.setMessageType(rs.getString(4));
            headertemplate.setUpdateBy(rs.getString(5));
            headertemplate.setUpdateTime(rs.getString(6));
            headertemplate.setio_type(rs.getString(7));
            headertemplate.setMessagePriority(rs.getString(8));
            headertemplate.setblock3(rs.getString(9));
            headertemplate.setmur(rs.getString(10));
            headertemplate.setkomentar(rs.getString(11));
            headertemplate.setnetworktype(rs.getString(12));
            headertemplate.setid_headers(rs.getInt(13));
            headertemplate.setcust_curr(rs.getString(14));
            headertemplate.setIsdefaultfia(rs.getBoolean(15));
            headertemplate.setCov(rs.getBoolean(16));
            headertemplate.setSettlementmethod(rs.getString(17));
        }
        return headertemplate;
    }

    public HeaderTemplate getHeaderTemplateByMTName(String mtname) throws SQLException {
        HeaderTemplate headertemplate = new HeaderTemplate();
        String sql = "SELECT name,logicalTerminal,receiverAddress,messagetype,"
                + "updateby,updatetime, null AS io_type, null AS messagepriority, "
                + "null AS block3, null AS mur, null AS komentar, null AS networktype, "
                + "null AS id_headers, null AS cust_curr, true AS isdefaultfia, null AS cov, null AS settlementmethod, "
                + "id_templates FROM headers_template WHERE isenable = true AND messagetype='" + mtname + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            headertemplate.setName(rs.getString(1));
            headertemplate.setLogicalTerminal(rs.getString(2));
            headertemplate.setReceiverAddress(rs.getString(3));
            headertemplate.setMessageType(rs.getString(4));
            headertemplate.setUpdateBy(rs.getString(5));
            headertemplate.setUpdateTime(rs.getString(6));
            headertemplate.setio_type(rs.getString(7));
            headertemplate.setMessagePriority(rs.getString(8));
            headertemplate.setblock3(rs.getString(9));
            headertemplate.setmur(rs.getString(10));
            headertemplate.setkomentar(rs.getString(11));
            headertemplate.setnetworktype(rs.getString(12));
            headertemplate.setid_headers(rs.getInt(13));
            headertemplate.setcust_curr(rs.getString(14));
            headertemplate.setIsdefaultfia(rs.getBoolean(15));
            headertemplate.setCov(rs.getBoolean(16));
            headertemplate.setSettlementmethod(rs.getString(17));
            headertemplate.setId_Templates(rs.getInt(18));
        }
        return headertemplate;
    }

    public List<TagTemplateDB> getAllTagTemplateById(String id_templates) throws Exception {
        List<TagTemplateDB> tagstemplate = new ArrayList<TagTemplateDB>();
        String sql = "SELECT urutan,tag,detail,tagName,info FROM tags_template WHERE id_templates='" + id_templates + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            TagTemplateDB tagtemplate = new TagTemplateDB();
            tagtemplate.setUrutan(rs.getInt(1));
            tagtemplate.setTag(rs.getString(2));
            tagtemplate.setDetail(rs.getString(3));
            tagtemplate.setTagName(rs.getString(4));
            tagtemplate.setInfo(rs.getString(5));
            tagstemplate.add(tagtemplate);
        }
        return tagstemplate;
    }

    public int cekDataTagsTemplate(String id, String tags) {
        int rowID = 0;
        try {
            String sql = "SELECT COUNT(*) AS cek FROM tags_template WHERE id_templates='" + id + "' AND tagName='" + tags + "'";
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                rowID = Integer.parseInt(rs.getString("cek"));
            }
        } catch (Exception es) {
            es.printStackTrace();
        }
        return rowID;
    }

}