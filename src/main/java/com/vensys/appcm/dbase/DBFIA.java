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
import com.vensys.appcm.model.DataFIA;
import com.vensys.appcm.model.DataFIAPath;
import org.apache.log4j.Logger;

/**
 *
 * @author hadi
 */
public class DBFIA {

    Connection conn;
//    String id = "1";
//    String jumlah = "1";

    public DBFIA(Connection conn) {
        this.conn = conn;
    }
    Logger log = Logger.getLogger(getClass().getName());
    DBEventLog evl = new DBEventLog(conn);
    public void addFIA(DataFIA data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO configuration_fia(source,mtormx,needcheckaml,needconverted,sourceto,isenable) VALUES (?,?,?,?,?,?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getSource());
            st.setString(2, data.getMtormx());
            st.setInt(3, data.getNeedcheckaml());
            st.setInt(4, data.getNeedconverted());
            st.setString(5, data.getSourceto());
            st.setInt(6, data.getIsenable());
            System.out.println(st);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah Config FIA", ip, comp);
    }

    public void updateFIA(DataFIA data, String id, String mofier, String ip, String comp) {
        try {
            String sql = "Update configuration_fia SET source=?,mtormx=?,needcheckaml=?,needconverted=?,sourceto=?,isenable=? where id=?";
            System.out.println("sql=" + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getSource());
            st.setString(2, data.getMtormx());
            st.setInt(3, data.getNeedcheckaml()); 
            st.setInt(4, data.getNeedconverted());
            st.setString(5, data.getSourceto());
            st.setInt(6, data.getIsenable());
            st.setInt(7, Integer.parseInt(id));
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah Config FIA", ip, comp);
    }

    public List<DataFIA> getAllFIA() throws Exception {
        List<DataFIA> datas = new ArrayList<DataFIA>();
        String sql = "SELECT id,source,mtormx,needcheckaml,needconverted,sourceto,isenable FROM configuration_fia ORDER BY id desc";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataFIA data = new DataFIA();
            data.setId(rs.getInt(1));
            data.setSource(rs.getString(2));
            data.setMtormx(rs.getString(3));
            data.setNeedcheckaml(rs.getInt(4));
            data.setNeedconverted(rs.getInt(5));
            data.setIsenable(rs.getInt(6));
            datas.add(data);
        }
        return datas;
    }

    
    public DataFIA getFiaById(String id) throws SQLException {
        DataFIA data = new DataFIA();
        String sql = "SELECT id,source,mtormx,needcheckaml,needconverted,sourceto,isenable FROM configuration_fia WHERE id='" + id + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId(rs.getInt(1));
            data.setSource(rs.getString(2));
            data.setMtormx(rs.getString(3));
            data.setNeedcheckaml(rs.getInt(4));
            data.setNeedconverted(rs.getInt(5));
            data.setSourceto(rs.getString(6));
            data.setIsenable(rs.getInt(7));
        }
        return data;
    }
    
    public int getNumberofRows() throws Exception {
        String sql = "SELECT count(id) FROM configuration_fia";
        ResultSet rs = this.conn.createStatement().executeQuery(sql);
        rs.next();
        return rs.getInt(1);
    }

    public List<String[]> getPagesFIAAjax(int offset, int numberLimit) throws Exception {
        List<String[]> datas = new ArrayList<String[]>();
        String sql = "SELECT id,source,mtormx,needcheckaml,needconverted,sourceto,isenable FROM configuration_fia ORDER BY id OFFSET " + offset + " ROWS FETCH NEXT " + numberLimit + " ROWS ONLY";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String[] value = {
                rs.getString(1),
                rs.getString(2),
                rs.getString(3),
                rs.getInt(4)==1 ? "Yes" : "No",
                rs.getInt(5)==1 ? "Yes" : "No",
                rs.getString(6),       
                rs.getInt(7)==1 ? "Yes" : "No",
                };
            datas.add(value);
        }
        return datas;
    }
    
    
    public int getNumberofRowsPathConf() throws Exception {
        String sql = "SELECT count(id) from sftp_reader_fia_new";
        ResultSet rs = this.conn.createStatement().executeQuery(sql);
        rs.next();
        return rs.getInt(1);
    }
    
    
    public DataFIAPath getFiaPathById(String id) throws SQLException {
        DataFIAPath data = new DataFIAPath();
        String sql = "SELECT id, config_name, host, port, username, password, privatekeytype, privatekeypath, privatekeypassword, path, localpath, transferpath, source, isenable, protocol, clientauthenticationtype, keystorefile, keystorepassword, keystorealias, keyfilepassword\n" +
"	FROM public.sftp_reader_fia_new where id = ?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, Integer.parseInt(id));
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            data.setId(rs.getInt("id"));
            data.setConfigName(rs.getString("config_name"));
            data.setHost(rs.getString("host"));
            data.setPort(rs.getString("port"));
            data.setUserName(rs.getString("username"));
            data.setPassword(rs.getString("password"));
            data.setPrivateKeyType(rs.getString("privatekeytype"));
            data.setPrivateKeyPath(rs.getString("privatekeypath"));
            data.setPrivateKeyPassword(rs.getString("privatekeypassword"));
            data.setPath(rs.getString("path"));
            data.setLocalPath(rs.getString("localpath"));
            data.setTransferPath(rs.getString("transferpath"));
            data.setSource(rs.getString("source"));
            data.setIsEnable(rs.getInt("isenable"));
            data.setProtocol(rs.getString("protocol"));
            data.setClientAuthenticationType(rs.getString("clientauthenticationtype"));
            data.setKeyStoreFile(rs.getString("keystorefile"));
            data.setKeyStorePassword(rs.getString("keystorepassword"));
            data.setKeyStoreAlias(rs.getString("keystorealias"));
            data.setKeyFilePassword(rs.getString("keyfilepassword"));
        }
        return data;
    }
    
    
    public List<String[]> getPagesFIAPathAjax(int offset, int numberLimit) throws Exception {
        List<String[]> datas = new ArrayList<String[]>();
        String sql = "SELECT id,config_name,host,protocol FROM sftp_reader_fia_new ORDER BY id OFFSET " + offset + " ROWS FETCH NEXT " + numberLimit + " ROWS ONLY";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String[] value = {
                rs.getString(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4)
                };
            datas.add(value);
        }
        return datas;
    }
    
    
    public void addFIAPath(DataFIAPath data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO public.sftp_reader_fia_new(\n" +
"	config_name, host, port, username, password, privatekeytype, privatekeypath, privatekeypassword, path, localpath, transferpath, source, isenable, protocol, clientauthenticationtype, keystorefile, keystorepassword, keystorealias, keyfilepassword)\n" +
"	VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            System.out.println(data.getPort().equalsIgnoreCase(""));
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getConfigName());
            st.setString(2, data.getHost());
            st.setInt(3, data.getPort().equalsIgnoreCase("") ? 0 : Integer.parseInt(data.getPort()));
            st.setString(4, data.getUserName());
            st.setString(5, data.getPassword());
            st.setString(6, data.getPrivateKeyType());
            st.setString(7, data.getPrivateKeyPath());
            st.setString(8, data.getPrivateKeyPassword());
            st.setString(9, data.getPath());
            st.setString(10, data.getLocalPath());
            st.setString(11, data.getTransferPath());
            st.setString(12, data.getSource());
            st.setInt(13, data.getIsEnable());
            st.setString(14, data.getProtocol());
            st.setString(15, data.getClientAuthenticationType());
            st.setString(16, data.getKeyStoreFile());
            st.setString(17, data.getKeyStorePassword());
            st.setString(18, data.getKeyStoreAlias());
            st.setString(19, data.getKeyStorePassword());
            
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah Config FIA Path", ip, comp);
    }
    
    public void updateFIAPath(DataFIAPath data, String id, String mofier, String ip, String comp) {
        try {
            String sql = "UPDATE public.sftp_reader_fia_new\n" +
            "	SET config_name=?, host=?, port=?, username=?, password=?, privatekeytype=?, privatekeypath=?, privatekeypassword=?, path=?, localpath=?, transferpath=?, source=?, isenable=?, "
                    + "protocol=?, clientauthenticationtype=?, keystorefile=?, keystorepassword=?, keystorealias=?, keyfilepassword=?\n" +
            "	WHERE id = ?;";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getConfigName());
            st.setString(2, data.getHost());
            st.setInt(3, data.getPort().equalsIgnoreCase("") ? 0 : Integer.parseInt(data.getPort()));
            st.setString(4, data.getUserName());
            st.setString(5, data.getPassword());
            st.setString(6, data.getPrivateKeyType());
            st.setString(7, data.getPrivateKeyPath());
            st.setString(8, data.getPrivateKeyPassword());
            st.setString(9, data.getPath());
            st.setString(10, data.getLocalPath());
            st.setString(11, data.getTransferPath());
            st.setString(12, data.getSource());
            st.setInt(13, data.getIsEnable());
            st.setString(14, data.getProtocol());
            st.setString(15, data.getClientAuthenticationType());
            st.setString(16, data.getKeyStoreFile());
            st.setString(17, data.getKeyStorePassword());
            st.setString(18, data.getKeyStoreAlias());
            st.setString(19, data.getKeyStorePassword());
            st.setInt(20,Integer.parseInt(id));
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah Config FIA Path", ip, comp);
    }
    

}

