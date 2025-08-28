package com.vensys.appcm.controller;

import com.jcraft.jsch.*;
import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
import com.vensys.appcm.model.DataSFTP;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.myutils.Encryptor;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import java.io.InputStream;
import java.util.Properties;

public class SFTP {
    private static final Logger log = LogManager.getLogger(SFTP.class);

    private final Encryptor enc = new Encryptor();

    private String privateKeyPath;
    private String sftpHost;
    private int sftpPort = 22;
    private String sftpUser;
    private String sftpPassword;
    private String remoteDir;
    private String localFilePath;
    private String mt_folder;
    private String mx_folder;
    private String remoteDirResend;
    private String sftpReSendFlag;
    private String sftpReSendPath;
    private String remoteDirBIC;

    public SFTP() {
        readSFTPProperties();
    }

    public void uploadToSftp(String channel, String MXorMT, String remoteFileName,int id, String flag, String user_id, String ip_access, String comp_name) {
        DBconnection2 dbConn2 = new DBconnection2();
        DBDataTransaksiOutgoing dBDataTransaksiOutgoing = new DBDataTransaksiOutgoing(dbConn2.getConnection2());
        JSch jsch = new JSch();
        String remoteDestinationDir = "";
        Session session = null;
        ChannelSftp channelSftp = null;
        // System.out.println("MMMflag:" + flag);
        try {
            session = prepareSession(jsch);

            log.info("Connecting to SFTP server...");
            session.connect(30000);
            log.info("SFTP session connected to {}", sftpHost);

            channelSftp = (ChannelSftp) session.openChannel("sftp");
            channelSftp.connect(10000);
            log.info("SFTP channel opened.");

            if (flag == null || flag.trim().isEmpty()) {
                throw new IllegalArgumentException("Flag is required and cannot be blank.");
            }
            
            // jika FIA RESEND ada kmungkinan dari flag CVT-VER-RESEND,INTEL-RESEND,REM-RESEND,DDA-RESEND,WAITING-SAA-RESEND,AML-RESEND
            if ("FIA-RESEND".equalsIgnoreCase(flag)) {

                String templateName = dBDataTransaksiOutgoing.getTemplateNameHeaders(id);
                System.out.println("templateName: " + templateName);
                if (templateName == null || templateName.trim().isEmpty()) {
                    System.out.println("templateName is null or empty, setting flag to null");
                    flag = null;
                } else {
                    System.out.println("templateName else");
                    flag = "CVT-VER-RESEND"; // placeholder aja, biar pakai folder resend karena smua resend satu folder
                }
            }            

            List<String> pathList = Arrays.asList(sftpReSendPath.split(","));
            List<String> flagList = Arrays.asList(sftpReSendFlag.split(","));

            // System.out.println("sftpReSendPath:" + sftpReSendPath);
            // System.out.println("sftpReSendFlag:" + sftpReSendFlag);

            Map<String, String> flagToPathMap = new HashMap<>();
            for (int i = 0; i < flagList.size(); i++) {
                if (i < pathList.size()) {
                    flagToPathMap.put(flagList.get(i), pathList.get(i));
                }
            }
            String destinationDir = flagToPathMap.get(flag);
            channel = channel == null || channel.equalsIgnoreCase("") ? "" : channel;
            String pathResend = channel.equals("") ? "" : "/"+channel+"/";
            System.out.println(pathResend);
            //remoteDestinationDir = remoteDirResend + destinationDir + pathResend ;
            remoteDestinationDir = remoteDirResend + destinationDir;
            System.out.println("remoteDestinationDir:" + remoteDestinationDir);
            System.out.println("remoteDir:" + remoteDir);
            System.out.println("id_headers:" + String.valueOf(id));
            // jika ga ktemu di list flag, maka taro di default folder (remoteDir)

            // Trade OPS = BANKTRADE
            // Remittance OPS =  EMS
            // Treasury OPS = TSA & FRONTARENA
            // Custody OPS = CUSTODY

            if (destinationDir == null) {
                System.out.println("destinationdir null:" );
                if(!channel.equals("")) {                    
                    System.out.println("remoteDirBIC:" + remoteDirBIC);
                    if ("NCBS".equalsIgnoreCase(channel) || "Remittance OPS".equalsIgnoreCase(channel)) {
                        channel = "EMS"; 
                    } else if ("Trade OPS".equalsIgnoreCase(channel)) {
                        channel = "BANKTRADE"; 
                    } else if ("Custody OPS".equalsIgnoreCase(channel)) {
                        channel = "CUSTODY";
                    } else if ("Treasury OPS".equalsIgnoreCase(channel)) {
                        Header headerdata = dBDataTransaksiOutgoing.getHeaderById(String.valueOf(id));
                        String bic = headerdata.getLogicalTerminal();
                        if ( "BDINIDJAXXXX".equalsIgnoreCase(bic) ) {
                            channel = "FRONTARENA"; 
                        } else if ( "BDINIDJAXTRS".equalsIgnoreCase(bic) ) {
                            channel = "TSA"; 
                        }
                    } 
                   remoteDestinationDir = remoteDirBIC + channel;
                } else {
                    if(MXorMT.equalsIgnoreCase("MT")) {
                        remoteDestinationDir = remoteDir + mt_folder;
                    } else if (MXorMT.equalsIgnoreCase("MX")) {
                        remoteDestinationDir = remoteDir + mx_folder;
                    } else {
                        log.error("Invalid MXorMT value: {}", MXorMT);
                        return;
                    }
                }
            }
            
            // Upload file
            log.info("Uploading file: {} to {}/{}", localFilePath, remoteDir, remoteFileName);
            System.out.println("id_headers:" + id);
            System.out.println("remoteDestinationDir:" + remoteDestinationDir);
            System.out.println("remoteFileName:" + remoteFileName);
            channelSftp.cd(remoteDestinationDir);
            System.out.println("local file path:" + localFilePath + "/" + remoteFileName);
            System.out.println("destination file path:" + remoteDestinationDir + "/" + remoteFileName);
            channelSftp.put(localFilePath + "/" + remoteFileName, remoteDestinationDir);
            log.info("SFTP upload successful: {}", remoteFileName);
        } catch (Exception e) {
            log.error("SFTP upload failed", e);            
            dBDataTransaksiOutgoing.updateFlagAfterValidate("FIA-FAILED", id, user_id, ip_access, comp_name);
        } finally {
            disconnectQuietly(channelSftp, session);
        }
    }

    public boolean isSftpServerReachable() {
        JSch jsch = new JSch();
        Session session = null;

        try {
            session = prepareSession(jsch);
            session.connect(5000);
            boolean connected = session.isConnected();
            log.info("SFTP server reachable: {}", connected);
            return connected;
        } catch (Exception e) {
            log.error("SFTP connection test failed: {}", e.getMessage());
            return false;
        } finally {
            disconnectQuietly(null, session);
        }
    }

    private Session prepareSession(JSch jsch) throws Exception {
        if (privateKeyPath != null && !privateKeyPath.isEmpty()) {
            log.info("Using private key for SFTP.");
            System.out.println("privateKeyPath:"+privateKeyPath);
            jsch.addIdentity(privateKeyPath);
        }

        Session session = jsch.getSession(sftpUser, sftpHost, sftpPort);
        session.setConfig("StrictHostKeyChecking", "no");

        if ((privateKeyPath == null || privateKeyPath.isEmpty()) && sftpPassword != null && !sftpPassword.isEmpty()) {
            log.info("Using password authentication for SFTP.");
            session.setPassword(sftpPassword);
        }

        if ((privateKeyPath == null || privateKeyPath.isEmpty()) && (sftpPassword == null || sftpPassword.isEmpty())) {
            log.error("Neither private key nor password provided.");
            throw new RuntimeException("SFTP credentials missing");
        }

        return session;
    }

    private void disconnectQuietly(ChannelSftp channel, Session session) {
        if (channel != null && channel.isConnected()) {
            channel.disconnect();
            log.info("SFTP channel disconnected.");
        }
        if (session != null && session.isConnected()) {
            session.disconnect();
            log.info("SFTP session disconnected.");
        }
    }

    private void readSFTPProperties() {
        try (InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (inputStream == null) {
                log.error("db.properties file not found in classpath.");
                return;
            }

            Properties prop = new Properties();
            prop.load(inputStream);

            privateKeyPath = prop.getProperty("privateKeyPath");
            sftpHost = prop.getProperty("sftpHost");
            sftpPort = Integer.parseInt(prop.getProperty("sftpPort", "22"));
            sftpUser = enc.decryptTD(prop.getProperty("sftpUser"), "AKey@VenSys");
            sftpPassword = enc.decryptTD(prop.getProperty("sftpPassword"), "AKey@VenSys");
            remoteDir = prop.getProperty("remoteDir");
            localFilePath = prop.getProperty("localFilePath");
            mt_folder = prop.getProperty("mt_folder");
            mx_folder = prop.getProperty("mx_folder");
            remoteDirResend = prop.getProperty("remoteDirResend");
            sftpReSendFlag = prop.getProperty("sftpReSendFlag");
            sftpReSendPath = prop.getProperty("sftpReSendPath");
            remoteDirBIC = prop.getProperty("remoteDirBIC");

        } catch (Exception e) {
            log.error("Failed to read SFTP properties", e);
        }
    }
}
