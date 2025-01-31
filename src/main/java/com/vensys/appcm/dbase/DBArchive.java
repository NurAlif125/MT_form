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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.vensys.appcm.model.Archive;

/**
 *
 * @author AplDev2
 */
public class DBArchive {

    Connection conn;

    public DBArchive(Connection conn) {
        this.conn = conn;
    }

    public List<Archive> getAllData(String action) throws SQLException {
        List<Archive> backups = new ArrayList<>();
        String sql = "SELECT TOP 20 id,task,user_id,action,date_action FROM backup_history where action='" + action + "' ORDER BY date_action DESC";
        System.out.println("getalldata: " + sql);
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Archive backup = new Archive();
            backup.setId(rs.getInt(1));
            backup.setTask(rs.getString(2));
            backup.setUserId(rs.getString(3));
            backup.setAction(rs.getString(4));
            backup.setDateAction(rs.getString(5));
            backups.add(backup);
        }
        return backups;
    }

    public void archiveDataHeader(String userId, String action, String tanggal1, String tanggal2) {
        try {
            String sql = "SET IDENTITY_INSERT [DBCMAR].[dbo].[headers] ON; "
                    + "INSERT INTO [DBCMAR].[dbo].[headers] (id_headers,applicationId,serviceId,logicalTerminal,sessionNumber,sequenceNumber,io_type,messageType,receiverAddress,messagePriority,deliveryMonitoring,obsolescencePeriod,bankingPriority,mur,komentar,tanggal,userEntry,flag,userEdit,templateName,flagTemplate,senderInputTime,MIRDate,MIRLogicalTerminal,MIRSessionNumber,MIRSequenceNumber,receiverOutputDate,receiverOutputTime,block3,isDuplicate) "
                    + "select id_headers,applicationId,serviceId,logicalTerminal,sessionNumber,sequenceNumber,io_type,messageType,receiverAddress,messagePriority,deliveryMonitoring,obsolescencePeriod,bankingPriority,mur,komentar,tanggal,userEntry,flag,userEdit,templateName,flagTemplate,senderInputTime,MIRDate,MIRLogicalTerminal,MIRSessionNumber,MIRSequenceNumber,receiverOutputDate,receiverOutputTime,block3,isDuplicate "
                    + "FROM headers "
                    + "WHERE CAST(tanggal as date) BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + "' AND flag not in ('MOD', 'VER', 'AUTH', 'NACK', 'INC-WAIT', 'INC-NOK', 'INC-OK', 'INC-INV', 'INC-HOLD');"
                    + "SET IDENTITY_INSERT [DBCMAR].[dbo].[headers] OFF";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        addUtilityHistory(userId, tanggal1, tanggal2, action);
        archiveDataHeaderStatus(tanggal1, tanggal2);
    }

    public void restoreDataHeader(String userId, String action, String tanggal1, String tanggal2) {
        try {
            String sql = "SET IDENTITY_INSERT [DBCM].[dbo].[headers] ON; "
                    + "INSERT INTO [DBCM].[dbo].[headers] (id_headers,applicationId,serviceId,logicalTerminal,sessionNumber,sequenceNumber,io_type,messageType,receiverAddress,messagePriority,deliveryMonitoring,obsolescencePeriod,bankingPriority,mur,komentar,tanggal,userEntry,flag,userEdit,templateName,flagTemplate,senderInputTime,MIRDate,MIRLogicalTerminal,MIRSessionNumber,MIRSequenceNumber,receiverOutputDate,receiverOutputTime,block3,isDuplicate) "
                    + "select id_headers,applicationId,serviceId,logicalTerminal,sessionNumber,sequenceNumber,io_type,messageType,receiverAddress,messagePriority,deliveryMonitoring,obsolescencePeriod,bankingPriority,mur,komentar,tanggal,userEntry,flag,userEdit,templateName,flagTemplate,senderInputTime,MIRDate,MIRLogicalTerminal,MIRSessionNumber,MIRSequenceNumber,receiverOutputDate,receiverOutputTime,block3,isDuplicate "
                    + "FROM [DBCMAR].[dbo].[headers] "
                    + "WHERE CAST(tanggal as date) BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + "' AND flag not in ('MOD', 'VER');"
                    + "SET IDENTITY_INSERT [DBCM].[dbo].[headers] OFF";
            System.out.println("restoreDataHeader: " + sql);
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
//        addUtilityHistory(userId, tanggal1, tanggal2, action);
        restoreDataHeaderStatus(tanggal1, tanggal2);
    }

    public void archiveDataHeaderStatus(String tanggal1, String tanggal2) {
        try {
            String sql = "INSERT INTO [DBCMAR].[dbo].[header_status] SELECT s.id_headers,status_header,status_tanggal,user_login,ip_access,comp_name FROM header_status s, headers h WHERE s.id_headers=h.id_headers AND CAST(h.tanggal as date) BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + "' AND h.flag not in ('MOD', 'VER', 'AUTH', 'NACK', 'INC-WAIT', 'INC-NOK', 'INC-OK', 'INC-INV', 'INC-HOLD')";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        archiveDataTags(tanggal1, tanggal2);
    }

    public void restoreDataHeaderStatus(String tanggal1, String tanggal2) {
        try {
            String sql = "INSERT INTO [DBCM].[dbo].[header_status] SELECT s.id_headers,status_header,status_tanggal,user_login,ip_access,comp_name FROM [DBCMAR].[dbo].[header_status] s, [DBCMAR].[dbo].[headers] h WHERE s.id_headers=h.id_headers AND CAST(h.tanggal as date) BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + "' AND h.flag not in ('MOD','VER','AUTH')";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        restoreDataTags(tanggal1, tanggal2);
    }

    public void archiveDataTags(String tanggal1, String tanggal2) {
        try {
            String sql = "INSERT INTO [DBCMAR].[dbo].[tags] SELECT urutan,t.id_headers,tag,detail,tagName,info FROM tags t, headers h WHERE t.id_headers=h.id_headers  AND CAST(h.tanggal as date) BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + "' AND h.flag not in ('MOD', 'VER', 'AUTH', 'NACK', 'INC-WAIT', 'INC-NOK', 'INC-OK', 'INC-INV', 'INC-HOLD')";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
//            deleteDataHeader(tanggal1, tanggal2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        archiveDataMTText(tanggal1, tanggal2);
    }

    public void restoreDataTags(String tanggal1, String tanggal2) {
        try {
            String sql = "INSERT INTO [DBCM].[dbo].[tags] SELECT urutan,t.id_headers,tag,detail,tagName,info FROM [DBCMAR].[dbo].[tags] t, [DBCMAR].[dbo].[headers] h WHERE t.id_headers=h.id_headers  AND CAST(h.tanggal as date) BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + "' AND h.flag not in ('MOD','VER','AUTH')";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
//            deleteDataHeader(tanggal1, tanggal2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        restoreDataMTText(tanggal1, tanggal2);
    }

    public void archiveDataMTText(String tanggal1, String tanggal2) {
        try {
            String sql = "INSERT INTO [DBCMAR].[dbo].[mt_text] SELECT t.id_headers,modify_mt,final_mt FROM mt_text t, headers h WHERE t.id_headers=h.id_headers  AND CAST(h.tanggal as date) BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + "' AND h.flag not in ('MOD', 'VER', 'AUTH', 'NACK', 'INC-WAIT', 'INC-NOK', 'INC-OK', 'INC-INV', 'INC-HOLD')";
            System.out.println("archiveDataMTText cetak : " + sql);
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        archiveDataInv(tanggal1, tanggal2);
    }

    public void archiveDataInv(String tanggal1, String tanggal2) {
        try {
            String sql = "SET IDENTITY_INSERT [DBCMAR].[dbo].[investigation] ON;"
                    + " INSERT INTO [DBCMAR].[dbo].[investigation] (id_investigate,id_headers,id_relation) SELECT id_investigate,t.id_headers,id_relation FROM investigation t, headers h WHERE t.id_headers=h.id_headers  AND CAST(h.tanggal as date) BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + "' AND h.flag not in ('MOD', 'VER', 'AUTH', 'NACK', 'INC-WAIT', 'INC-NOK', 'INC-OK', 'INC-INV', 'INC-HOLD');"
                    + "SET IDENTITY_INSERT [DBCMAR].[dbo].[investigation] OFF";
            System.out.println("archiveDataInv cetak : " + sql);
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        deleteDataHeader(tanggal1, tanggal2);
    }

    public void restoreDataMTText(String tanggal1, String tanggal2) {
        try {
            String sql = "INSERT INTO [DBCM].[dbo].[mt_text] SELECT t.id_headers,modify_mt,final_mt FROM [DBCMAR].[dbo].[mt_text] t, [DBCMAR].[dbo].[headers] h WHERE t.id_headers=h.id_headers  AND CAST(h.tanggal as date) BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + "' AND h.flag not in ('MOD','VER','AUTH')";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        restoreDataInv(tanggal1, tanggal2);
    }

    public void restoreDataInv(String tanggal1, String tanggal2) {
        try {
//            String sql = "INSERT INTO [DBCM].[dbo].[investigation] SELECT t.id_investigate,t.id_headers,id_relation FROM [DBCMAR].[dbo].[investigation] t, [DBCMAR].[dbo].[headers] h WHERE t.id_headers=h.id_headers  AND CAST(h.tanggal as date) BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + "' AND h.flag not in ('MOD','VER','AUTH')";
            String sql = "SET IDENTITY_INSERT [DBCM].[dbo].[investigation] ON;"
                    + " INSERT INTO [DBCM].[dbo].[investigation] (id_investigate,id_headers,id_relation) SELECT id_investigate,t.id_headers,id_relation FROM investigation t, headers h WHERE t.id_headers=h.id_headers  AND CAST(h.tanggal as date) BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + "' AND h.flag not in ('MOD', 'VER', 'AUTH', 'NACK', 'INC-WAIT', 'INC-NOK', 'INC-OK', 'INC-INV', 'INC-HOLD');"
                    + "SET IDENTITY_INSERT [DBCM].[dbo].[investigation] OFF";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        deleteDataHeader(tanggal1, tanggal2);
    }

    public void deleteDataHeader(String tanggal1, String tanggal2) {
        try {
            String sql = "DELETE FROM headers WHERE CAST(tanggal as date) BETWEEN '" + tanggal1 + "' AND '" + tanggal2 + "' AND flag not in ('MOD', 'VER', 'AUTH', 'NACK', 'INC-WAIT', 'INC-NOK', 'INC-OK', 'INC-INV', 'INC-HOLD')";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addUtilityHistory(String userId, String tanggal1, String tanggal2, String action) {
        String today = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            String sql = "INSERT INTO backup_history (task,user_id,action,date_action) VALUES (?,?,?,?)";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            String act = "";
            if (action.equalsIgnoreCase("1")) {
                act = "Archive";
            } else {
                act = "Restore";
            }
            ps.setString(1, act + " data from " + tanggal1 + " until " + tanggal2);
            ps.setString(2, userId);
            ps.setString(3, action);
            ps.setString(4, today);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
