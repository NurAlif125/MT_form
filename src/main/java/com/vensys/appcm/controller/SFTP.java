package com.vensys.appcm.controller;

import com.jcraft.jsch.*;
import com.vensys.appcm.dbase.DBconnection;
import java.sql.Connection;
import com.vensys.appcm.dbase.DBSTPLimit;
import com.vensys.appcm.model.DataSFTP;
import java.sql.SQLException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SFTP {
    Logger log = LogManager.getLogger(getClass().getName());
    DBconnection dbConn = new DBconnection();
    public void uploadToSftp(String localFilePath, String remoteFileName) {
        DataSFTP valueSFTP = null;
        DBSTPLimit dbsftp = new DBSTPLimit(dbConn.getConnection());
        try {
            valueSFTP = dbsftp.getConfigSFTPbyName("coba");
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }
        
        // String privateKeyPath = valueSFTP.getPrivatekeypath(); // /home/tomcat/.ssh/known_hosts
//        String privateKeyPath = (valueSFTP.getPrivatekeypath() == null || valueSFTP.getPrivatekeypath().trim().isEmpty()) ? "/home/tomcat/.ssh/known_hosts" : valueSFTP.getPrivatekeypath();
//        System.out.println("privateKeyPath:" + privateKeyPath);
//        String sftpHost = valueSFTP.getHost(); // 192.168.220.42
//        int sftpPort = valueSFTP.getPort(); // 22
//        String sftpUser = valueSFTP.getUsername(); // root
//        String remoteDir = valueSFTP.getTransferpath(); // /root/Public
        // String localFilePath = valueSFTP.getPath();
        String privateKeyPath = (valueSFTP.getPrivatekeypath() == null || valueSFTP.getPrivatekeypath().trim().isEmpty()) ? "C:/Users/T440P/.ssh/id_rsa" : valueSFTP.getPrivatekeypath(); // "/home/tomcat/.ssh/known_hosts"
        String sftpHost = (valueSFTP.getHost() == null || valueSFTP.getHost().trim().isEmpty()) ? "192.168.220.42" : valueSFTP.getHost();
        int sftpPort = (valueSFTP.getPort() == 0) ? 22 : valueSFTP.getPort();
        String sftpUser = (valueSFTP.getUsername() == null || valueSFTP.getUsername().trim().isEmpty()) ? "root" : valueSFTP.getUsername();
        String remoteDir = (valueSFTP.getTransferpath() == null || valueSFTP.getTransferpath().trim().isEmpty()) ? "/root/Public" : valueSFTP.getTransferpath();

        JSch jsch = new JSch();
        Session session = null;
        ChannelSftp channelSftp = null;

        try {
            jsch.addIdentity(privateKeyPath);
            session = jsch.getSession(sftpUser, sftpHost, sftpPort);

            // Optional - safer in production
            session.setConfig("StrictHostKeyChecking", "yes");
            jsch.setKnownHosts("C:/Users/T440P/.ssh/known_hosts");
            // jsch.setKnownHosts("/home/tomcat/.ssh/known_hosts");
            
            session.connect();

            channelSftp = (ChannelSftp) session.openChannel("sftp");
            channelSftp.connect();

            // Upload
            System.out.println("Uploading file: " + localFilePath + " to " + remoteDir + "/" + remoteFileName);
            channelSftp.cd(remoteDir);
            channelSftp.put(localFilePath, remoteFileName);

            log.info("SFTP upload successful: " + remoteFileName);
            System.out.println("SFTP upload successful: " + remoteFileName);
        } catch (Exception e) {
            log.error("SFTP upload failed", e);
        } finally {
            if (channelSftp != null && channelSftp.isConnected()) {
                channelSftp.disconnect();
            }
            if (session != null && session.isConnected()) {
                session.disconnect();
            }
        }
    }

//    public static void main(String[] args) {
//		SFTP sftp = new SFTP();
//		String filePath = "C:/test/inicumatest.txt"; 
//		String fileName = "inicumatest.txt";
//		sftp.uploadToSftp(filePath, fileName);    
//    }
}
