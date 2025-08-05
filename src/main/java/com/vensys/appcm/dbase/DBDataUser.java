/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

/**
 *
 * @author T430
 */
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import jakarta.servlet.http.HttpServletRequest;
import com.vensys.appcm.model.DataRole;
import com.vensys.appcm.model.DataUser;
import java.sql.Timestamp;

/**
 *
 * @author hadi
 */
public class DBDataUser {

    Connection conn;

    public DBDataUser(Connection conn) {
        this.conn = conn;
    }
    

    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addDataUser(DataUser data, String mofier, String ip, String comp) {
//        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
             String sql = "INSERT INTO users (user_id,name,description,password,role,enable,status_new,sub_role,channel,user_bic) VALUES (?,?,?,?,?,?,?,?,?,?)";
//            String sql = "INSERT INTO [user] (user_id,name,description,role,enable) VALUES (?,?,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getUser_id()); //user_id
            st.setString(2, data.getName());     //name
            st.setString(3, data.getDescription());     //description
            st.setString(4, "1");     //password
            st.setInt(5, data.getRole());     //role
            st.setInt(6, data.getEnable());     //enable
            st.setInt(7, 1);
            st.setInt(8, data.getSub_role());
            st.setString(9, data.getChannel());
            st.setString(10, data.getUser_bic());
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah user - "+data.getUser_id(), ip, comp);
        evl.updateLogUser(mofier, "user", tanggal);
    }
    
    public void updateDataUser(DataUser newData, String user_id, DataUser oldData, String mofier, String ip, String comp) {
        try {
            StringBuilder changes = new StringBuilder();

            if (!Objects.equals(oldData.getName(), newData.getName())) {
            changes.append("name :\n")
                   .append("before: '").append(oldData.getName()).append("'\n")
                   .append("after: '").append(newData.getName()).append("'\n");
            }
            if (!Objects.equals(oldData.getDescription(), newData.getDescription())) {
                changes.append("description :\n")
                    .append("before: '").append(oldData.getDescription()).append("'\n")
                    .append("after: '").append(newData.getDescription()).append("'\n");
            }
            if (oldData.getRole() != newData.getRole()) {
                changes.append("role :\n")
                    .append("before: ").append(oldData.getRole()).append("\n")
                    .append("after: ").append(newData.getRole()).append("\n");
            }
            if (oldData.getSub_role() != newData.getSub_role()) {
                changes.append("sub_role :\n")
                    .append("before: ").append(oldData.getSub_role()).append("\n")
                    .append("after: ").append(newData.getSub_role()).append("\n");
            }
            if (!Objects.equals(oldData.getChannel(), newData.getChannel())) {
                changes.append("channel :\n")
                    .append("before: '").append(oldData.getChannel()).append("'\n")
                    .append("after: '").append(newData.getChannel()).append("'\n");
            }
            if (oldData.getEnable() != newData.getEnable()) {
                changes.append("enable :\n")
                    .append("before: ").append(oldData.getEnable()).append("\n")
                    .append("after: ").append(newData.getEnable()).append("\n");
            }
            if (!Objects.equals(oldData.getUser_bic(), newData.getUser_bic())) {
                changes.append("user_bic :\n")
                    .append("before: '").append(oldData.getUser_bic()).append("'\n")
                    .append("after: '").append(newData.getUser_bic()).append("'\n");
            }

            // Only perform update if changes exist
            if (changes.length() > 0) {
                String sql = "UPDATE users SET name=?, description=?, role=?, sub_role=?, channel=?, enable=?, user_bic=? WHERE user_id=?";
                PreparedStatement st = this.conn.prepareStatement(sql);
                st.setString(1, newData.getName());
                st.setString(2, newData.getDescription());
                st.setInt(3, newData.getRole());
                st.setInt(4, newData.getSub_role());
                st.setString(5, newData.getChannel());
                st.setInt(6, newData.getEnable());
                st.setString(7, newData.getUser_bic());
                st.setString(8, user_id);
                st.executeUpdate();

                // Log change details
                evl.insertDataEvent(mofier, "Ubah user - " + user_id , ip, comp, changes.toString());
            } else {
                evl.insertDataEvent(mofier, "Ubah user - " + user_id + ": No changes made.", ip, comp);
            }

            evl.updateLogUser(mofier, "user", tanggal);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void updateDataUserOLD(DataUser data, String user_id, String mofier, String ip, String comp) {
//        System.out.println("user_id" + user_id);
        try {
//            String sql = "UPDATE [user] SET name=?,description=?,role=?,enable=? WHERE user_id=?";
            String sql = "UPDATE users SET name=?,description=?,role=?,sub_role=?,channel=?,enable=?,user_bic=? WHERE user_id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getName());     //name
            st.setString(2, data.getDescription());     //description
            st.setInt(3, data.getRole());     //role
            st.setInt(4, data.getSub_role()); 
            st.setString(5, data.getChannel());
            st.setInt(6, data.getEnable());     //enable
            st.setString(7, data.getUser_bic()); //user_id
            st.setString(8, user_id); //user_id
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah user - "+user_id, ip, comp);
        evl.updateLogUser(mofier, "user", tanggal);
    }

    public void resetPasswordUser(DataUser data, String mofier, String ip, String comp) {
        try {
            String sql = "UPDATE users SET password=? WHERE user_id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getPassword());     //password
            st.setString(2, data.getUser_id());     //user_id
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Reset password user", ip, comp);
        evl.updateLogUser(mofier, "user", tanggal);
    }

    public void updateWrongPass(DataUser data) {
        try {
            String sql = "UPDATE users SET wrongpass=? WHERE user_id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setInt(1, data.getWrongpass());     //wrongpass
            st.setString(2, data.getUser_id());     //user_id
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<DataUser> getAllDataUser() throws Exception {
        List<DataUser> datas = new ArrayList<DataUser>();
//        String sql = "SELECT user_id,name,password,status_new,user_mt_routing,description,role,enable,role_name FROM [user] LEFT JOIN roles ON role=role_id ORDER BY user_id ASC";
        String sql = "SELECT usr.user_id,usr.name,usr.user_mt_routing,usr.description,usr.role,usr.enable,rl.role_name,usr.channel,usr.user_bic FROM users AS usr \n" +
"LEFT JOIN roles AS rl ON usr.role=rl.role_id \n" +
"WHERE usr.enable !=2\n" +
"ORDER BY usr.user_id ASC";
//        System.out.println("sql 1 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataUser data = new DataUser();
            data.setUser_id(rs.getString(1));   //user_id
            data.setName(rs.getString(2));  //name
//            data.setPassword(rs.getString(3));     //password
//            data.setStatus_new(rs.getInt(3));     //status_new
            data.setUser_mt_routing(rs.getInt(3));     //user_mt_routing
            data.setDescription(rs.getString(4));     //description
            data.setRole(rs.getInt(5));     //role
            data.setEnable(rs.getInt(6));     //enable
            data.setRole_name(rs.getString(7));     //role_name
            data.setChannel(rs.getString(8));
            data.setUser_bic(rs.getString(9));
            datas.add(data);
        }
        return datas;
    }

    public List<DataUser> getAllDataUser(String user_id, String name, String description) throws Exception {
        List<DataUser> datas = new ArrayList<DataUser>();
//        String sql = "SELECT user_id,name,password,status_new,user_mt_routing,description,role,enable,role_name FROM [user] LEFT JOIN roles ON role=role_id "
        String sql = "SELECT user_id,name,user_mt_routing,description,role,enable,role_name,channel,user_bic FROM users LEFT JOIN roles ON role=role_id "
                + "WHERE user_id LIKE '%" + user_id + "%' AND name LIKE '%" + name + "%' "
                + "AND description LIKE '%" + description + "%' " + "ORDER BY user_id ASC";
//        System.out.println("sql 2 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataUser data = new DataUser();
            data.setUser_id(rs.getString(1));   //user_id
            data.setName(rs.getString(2));  //name
//            data.setPassword(rs.getString(3));     //password
//            data.setStatus_new(rs.getInt(4));     //status_new
            data.setUser_mt_routing(rs.getInt(3));     //user_mt_routing
            data.setDescription(rs.getString(4));     //description
            data.setRole(rs.getInt(5));     //role
            data.setEnable(rs.getInt(6));     //enable
            data.setRole_name(rs.getString(7));     //role_name
            data.setChannel(rs.getString(8));
            data.setUser_bic(rs.getString(9));
            datas.add(data);
        }
        return datas;
    }

    public DataUser getDataUserById(String user_id) throws SQLException {
        DataUser data = new DataUser();
        String sql = "SELECT user_id,name,password,status_new,user_mt_routing,description,role,enable,sub_role,channel,user_bic FROM users WHERE user_id=?";
//        String sql = "SELECT user_id,name,user_mt_routing,description,role,enable FROM [user] WHERE user_id='" + user_id + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, user_id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setUser_id(rs.getString(1));   //user_id
            data.setName(rs.getString(2));  //name
            data.setPassword(rs.getString(3));     //password
            data.setStatus_new(rs.getInt(4));     //status_new
            data.setUser_mt_routing(rs.getInt(5));     //user_mt_routing
            data.setDescription(rs.getString(6));     //description
            data.setRole(rs.getInt(7));     //role
            data.setEnable(rs.getInt(8));     //enable
            data.setSub_role(rs.getInt(9));     //enable
            data.setChannel(rs.getString(10));
            data.setUser_bic(rs.getString(11));
        }
        return data;
    }

    public ArrayList<DataUser> getAllDataUserReport(String status) throws Exception {
        ArrayList<DataUser> datas = new ArrayList<DataUser>();
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

        formatRp.setCurrencySymbol("");
        formatRp.setMonetaryDecimalSeparator(',');
        formatRp.setGroupingSeparator('.');

        kursIndonesia.setDecimalFormatSymbols(formatRp);
        String where = "";
        if (status != "") {
            where = "WHERE enable = '" + status + "'";
        }
        String sql = "SELECT user_id, name, role_name, enable, last_login, last_activity, channel "
                + "FROM users as u "
                + "LEFT JOIN roles as r "
                + "ON u.role = r.role_id "
                + where;
//        System.out.println("sql 2 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataUser data = new DataUser();
            data.setUser_id(rs.getString(1));   //user_id
            data.setName(rs.getString(2));  //name
            data.setRole_name(rs.getString(3));     //role_name
//            data.setDescription(kursIndonesia.format(Double.parseDouble(rs.getString(4).replace(",", ".")))); // limit
            data.setEnable(rs.getInt(4));     //enable
            data.setLast_login(replaceNull(rs.getString(5)));
            data.setLast_activity(replaceNull(rs.getString(6)));
            data.setChannel(replaceNullChannel(rs.getString(7)));
            datas.add(data);
        }
        return datas;
    }

    public void delete(String user_id, String mofier, String ip, String comp) throws SQLException {
//        String sql = "DELETE FROM [user] WHERE user_id=?";
        String sql = "DELETE FROM users WHERE user_id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, user_id);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "Hapus user", ip, comp);
        evl.updateLogUser(mofier, "user", tanggal);
    }
    
    public String replaceNullChannel(String data) {
        String result;
        if (data == null) {
            result = "";
        } else {
            result = data;
        }
        return result;
    }

    public String replaceNull(String data) {
        String result;
        if (data == null) {
            result = "Never Login";
        } else {
            result = data;
        }
        return result;
    }
    
    public void addDataUserLDAP(DataUser data, String mofier, String ip, String comp) {
//        String tanggal_transaksi = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "INSERT INTO ldap_user (user_id,name,description,role,enable, auto_disable, create_date) VALUES (?,?,?,?,?,?,LOCALTIMESTAMP)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getUser_id()); //user_id
            st.setString(2, data.getName());     //name
//            st.setString(3, data.getPassword());     //password
            st.setString(3, data.getDescription());     //description
            st.setInt(4, data.getRole());     //role
            st.setInt(5, data.getEnable());     //enable
            st.setInt(6, data.getAuto_disable());
            System.out.println("add auto disable : " + data.getAuto_disable());
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah user", ip, comp);
        evl.updateLogUser(mofier, "user", tanggal);
    }
    
    public void updateDataUserLDAP(DataUser data, String user_id, String mofier, String ip, String comp) {
//        System.out.println("user_id" + user_id);
        try {
//            String sql = "UPDATE [user] SET name=?,description=?,role=?,enable=? WHERE user_id=?";
            String sql = "UPDATE ldap_user SET name=?,description=?,role=?,enable=?,auto_disable=? WHERE user_id=?";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getName());     //name
            st.setString(2, data.getDescription());     //description
            st.setInt(3, data.getRole());     //role
            st.setInt(4, data.getEnable());     //enable
            st.setInt(5, data.getAuto_disable());
            st.setString(6, user_id); //user_id
            System.out.println("update auto disable : " + data.getAuto_disable());
            System.out.println("update user id : " + data.getName());
//            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah user", ip, comp);
        evl.updateLogUser(mofier, "user", tanggal);
    }
    
    public List<DataUser> getAllDataUserLDAP() throws Exception {
        List<DataUser> datas = new ArrayList<DataUser>();
//        String sql = "SELECT user_id,name,password,status_new,user_mt_routing,description,role,enable,role_name FROM [user] LEFT JOIN roles ON role=role_id ORDER BY user_id ASC";
        String sql = "SELECT user_id,name,user_mt_routing,description,role,enable,role_name,auto_disable FROM ldap_user LEFT JOIN roles ON role=role_id ORDER BY user_id ASC";
//        System.out.println("sql 1 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataUser data = new DataUser();
            data.setUser_id(rs.getString(1));   //user_id
            data.setName(rs.getString(2));  //name
//            data.setPassword(rs.getString(3));     //password
//            data.setStatus_new(rs.getInt(3));     //status_new
            data.setUser_mt_routing(rs.getInt(3));     //user_mt_routing
            data.setDescription(rs.getString(4));     //description
            data.setRole(rs.getInt(5));     //role
            data.setEnable(rs.getInt(6));     //enable
            data.setRole_name(rs.getString(7));     //role_name
            data.setAuto_disable(rs.getInt(8));
            datas.add(data);
        }
        return datas;
    }
    
    public DataUser getDataUserByIdLDAP(String user_id) throws SQLException {
        DataUser data = new DataUser();
//        String sql = "SELECT user_id,name,password,status_new,user_mt_routing,description,role,enable FROM [user] WHERE user_id='" + user_id + "'";
        String sql = "SELECT user_id,name,user_mt_routing,description,role,enable,auto_disable FROM ldap_user WHERE user_id='" + user_id + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setUser_id(rs.getString(1));   //user_id
            data.setName(rs.getString(2));  //name
//            data.setPassword(rs.getString(3));     //password
//            data.setStatus_new(rs.getInt(4));     //status_new
            data.setUser_mt_routing(rs.getInt(3));     //user_mt_routing
            data.setDescription(rs.getString(4));     //description
            data.setRole(rs.getInt(5));     //role
            data.setEnable(rs.getInt(6));     //enable
            data.setAuto_disable(rs.getInt(7));
        }
        return data;
    }
    
    public void disablePermanent(String user_id, String mofier, String ip, String comp) throws SQLException {
//        String sql = "DELETE FROM [user] WHERE user_id=?";
        String sql = "Update users set enable =2 , disable_permanent_date=CURRENT_TIMESTAMP WHERE user_id=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setString(1, user_id);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "disable permanent user - "+user_id, ip, comp);
        evl.updateLogUser(mofier, "user", tanggal);
    }
    
    public List<DataUser> getAllDataUserDisable() throws Exception {
        List<DataUser> datas = new ArrayList<DataUser>();
        String sql = "SELECT user_id,name,channel,u.description, rl.role_name as role, disable_permanent_date FROM users  as u\n" +
        "INNER JOIN roles as rl ON rl.role_id=u.role\n" +
        "Where u.enable='2'";
//        System.out.println("sql 1 = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataUser data = new DataUser();            
            data.setUser_id(rs.getString(1));   //user_id
            data.setName(rs.getString(2));  //name
            data.setChannel(rs.getString(3));
            data.setDescription(rs.getString(4));     //description
            data.setRole_name(rs.getString(5));     //role
            data.setDisable_permanent_date(rs.getDate(6));
            datas.add(data);
        }
        return datas;
    }
}

