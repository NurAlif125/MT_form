/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

/**
 *
 * @author RIZKY
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.vensys.appcm.model.DataPasswordSetting;

/**
 *
 * @author faldi
 */
public class DBDataPasswordSetting {

    Connection conn;

    public DBDataPasswordSetting(Connection conn) {
        this.conn = conn;
    }
    DBEventLog evl = new DBEventLog(conn);
    String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

    public void addPassword(DataPasswordSetting data, String mofier, String ip, String comp) {
        try {
            String sql = "INSERT INTO rule_password(JumlahMinChar, JumlahMaxChar, Charfirst, IsAlfaSpecial, PasCylPeriode,PasExp,logUserPeriode, MaxWrongLog, namerulepassword, updateby,"
                    + " tanggalupdate, MaxLongusername , MinLongusername, StatusRulePassword, timeout) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, LOCALTIMESTAMP, ?, ?, ?, ?)";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getJumlahminchar());
            st.setString(2, data.getJumlahmaxchar());
            st.setString(3, data.getCharfirst());
            st.setString(4, data.getAlfaSpecial());
            st.setString(5, data.getPascylperiode());
            st.setString(6, data.getPasexp());
            st.setString(7, data.getLoguserperiode());
            st.setString(8, data.getMaxwronglog());
            st.setString(9, data.getnameRulePassword());
            st.setString(10, data.getUpdateBy());
            st.setString(11, data.getMaxlongusername());
            st.setString(12, data.getMinlongusername());
            st.setString(13, data.getStatusrulepassword());
            st.setInt(14, data.getTimeout());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Tambah rule password", ip, comp);
        evl.updateLogUser(mofier, "rulepass", tanggal);
    }

    public void UpdatePassword(DataPasswordSetting data, String mofier, String ip, String comp) {
        try {
            String sql = "UPDATE rule_password SET JumlahMinChar=?, JumlahMaxChar=?, Isalfaspecial=?, PasCylPeriode=?, "
                    + "PasExp=?, logUserPeriode=?, MaxWrongLog=?, namerulepassword=?, updateby=?, tanggalupdate = GETDATE(),"
                    + " MaxLongusername=?, MinLongusername=?, StatusRulePassword=?, timeout=? WHERE idrulepassword=? ";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, data.getJumlahminchar());     //JumlahMinChar
            st.setString(2, data.getJumlahmaxchar());     //JumlahMaxChar
            st.setString(3, data.getAlfaSpecial());     //Charfirst
            st.setString(4, data.getPascylperiode());     //PasCylPeriode
            st.setString(5, data.getPasexp());     //PasExp
            st.setString(6, data.getLoguserperiode());     //logUserPeriode
            st.setString(7, data.getMaxwronglog());     //MaxWrongLog
            st.setString(8, data.getnameRulePassword());     //namerulepassword
            st.setString(9, data.getUpdateBy());     //updateby
            st.setString(10, data.getMaxlongusername());     //MaxLongusername
            st.setString(11, data.getMinlongusername());     //MinLongusername
            st.setString(12, data.getStatusrulepassword());     //StatusRulePassword
            st.setInt(13, data.getTimeout());     //Timeout
            st.setInt(14, data.getIdRulePassword());     //StatusRulePassword
//          System.out.println(sql);
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        evl.insertDataEvent(mofier, "Ubah rule password", ip, comp);
        evl.updateLogUser(mofier, "rulepass", tanggal);
    }

    public List<DataPasswordSetting> getAllDataPasswordSetting() throws Exception {
        List<DataPasswordSetting> datas = new ArrayList<DataPasswordSetting>();
        String sql = "SELECT idrulepassword, namerulepassword, updateby, tanggalupdate FROM rule_password order by idrulepassword";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataPasswordSetting data = new DataPasswordSetting();
            data.setIdRulePassword(rs.getInt(1));   //idrulepassword
            data.setnameRulePassword(rs.getString(2));   //namerulepassword
            data.setUpdateBy(rs.getString(3));  //updateby
            data.settanggalUpdate(rs.getString(4));     //tanggalupdate
            datas.add(data);

        }
        return datas;
    }

    public List<DataPasswordSetting> getAllDataPasswordSetting(String name_PassSet) throws Exception {
        List<DataPasswordSetting> datas = new ArrayList<DataPasswordSetting>();
        String sql = "SELECT idrulepassword, namerulepassword, updateby, tanggalupdate FROM rule_password where namerulepassword= '" + name_PassSet + "' order by idrulepassword";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            DataPasswordSetting data = new DataPasswordSetting();
            data.setIdRulePassword(rs.getInt(1));   //idrulepassword
            data.setnameRulePassword(rs.getString(2));   //namerulepassword
            data.setUpdateBy(rs.getString(3));  //updateby
            data.settanggalUpdate(rs.getString(4));     //tanggalupdate
            datas.add(data);
        }
        return datas;
    }

    public DataPasswordSetting getDataPasswordSettingById(int idrulePassword) throws SQLException {
        DataPasswordSetting data = new DataPasswordSetting();
        String sql = "select JumlahMinChar, JumlahMaxChar, Charfirst, IsAlfaSpecial,"
                + " PasCylPeriode, PasExp, logUserPeriode, MaxWrongLog, namerulepassword,"
                + " updateby, tanggalupdate, MaxLongusername,MinLongusername,StatusRulePassword,timeout  "
                + " from rule_password where idrulepassword= '" + idrulePassword + "'";
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            data.setJumlahminchar(rs.getString(1));   //JumlahMinChar
            data.setJumlahmaxchar(rs.getString(2));   //JumlahMaxChar
            data.setCharfirst(rs.getString(3));  //Charfirst
            data.setAlfaSpecial(rs.getString(4));     //IsAlfaSpecial
//            data.setIsspechar(rs.getString(5));     //IsSpeChar
            data.setPascylperiode(rs.getString(5));     //PasCylPeriode
            data.setPasexp(rs.getString(6));     //PasExp
            data.setLoguserperiode(rs.getString(7));     //logUserPeriode
            data.setMaxwronglog(rs.getString(8));     //MaxWrongLog
            data.setNameRulePassword(rs.getString(9));     //idrulepassword
            data.setUpdateBy(rs.getString(10));     //updateby
            data.settanggalUpdate(rs.getString(11));     //tanggalupdate
            data.setMaxlongusername(rs.getString(12));     //MaxLongusername
            data.setMinlongusername(rs.getString(13));     //tanggalupdate
            data.setStatusrulepassword(rs.getString(14));     //MinLongusername
            data.setIdRulePassword(idrulePassword);     //MinLongusername
            data.setTimeout(rs.getInt(15));
        }
        return data;
    }

    public void delete(int idrulepassword, String mofier, String ip, String comp) throws SQLException {
        String sql = "DELETE FROM rule_password WHERE idrulepassword=?";
        PreparedStatement st = this.conn.prepareStatement(sql);
        st.setInt(1, idrulepassword);
        st.executeUpdate();
        evl.insertDataEvent(mofier, "Hapus rule password", ip, comp);
        evl.updateLogUser(mofier, "rulepass", tanggal);
    }
}
