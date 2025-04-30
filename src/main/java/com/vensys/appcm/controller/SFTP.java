package com.vensys.appcm.controller;

import com.jcraft.jsch.*;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.DataSFTP;
import com.vensys.appcm.myutils.Encryptor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

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

    public SFTP() {
        readSFTPProperties();
    }

    public void uploadToSftp(String MXorMT, String remoteFileName) {
        JSch jsch = new JSch();
        Session session = null;
        ChannelSftp channelSftp = null;

        try {
            session = prepareSession(jsch);

            log.info("Connecting to SFTP server...");
            session.connect(30000);
            log.info("SFTP session connected to {}", sftpHost);

            channelSftp = (ChannelSftp) session.openChannel("sftp");
            channelSftp.connect(10000);
            log.info("SFTP channel opened.");

            if(MXorMT.equalsIgnoreCase("MT")) {
                remoteDir = remoteDir + mt_folder;
            } else if (MXorMT.equalsIgnoreCase("MX")) {
                remoteDir = remoteDir + mx_folder;
            } else {
                log.error("Invalid MXorMT value: {}", MXorMT);
                return;
            }

            // Upload file
            log.info("Uploading file: {} to {}/{}", localFilePath, remoteDir, remoteFileName);
            channelSftp.cd(remoteDir);
            System.out.println("localFilePath / remoteFileName:" + localFilePath + "/" + remoteFileName);
            System.out.println("remoteDir:" + remoteDir);
            channelSftp.put(localFilePath + "/" + remoteFileName, remoteDir);
            log.info("SFTP upload successful: {}", remoteFileName);
        } catch (Exception e) {
            System.out.println("error:"+e);
            log.error("SFTP upload failed", e);
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

        } catch (Exception e) {
            log.error("Failed to read SFTP properties", e);
        }
    }
}
