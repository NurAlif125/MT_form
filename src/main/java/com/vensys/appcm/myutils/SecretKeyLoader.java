/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.myutils;

/**
 *
 * @author Isal
 */
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.PosixFileAttributeView;
import java.nio.file.attribute.PosixFilePermission;
import java.util.EnumSet;
import java.util.Properties;
import java.util.Set;
import java.util.logging.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SecretKeyLoader {
    
    private static final Logger log = LogManager.getLogger(SecretKeyLoader.class);
    
    public String loadSecret() throws IOException {
        String path = null;
            
        Properties prop = new Properties();
        InputStream inputStream = SecretKeyLoader.class.getResourceAsStream("/db.properties");
        
        if (inputStream != null) {
            prop.load(inputStream);
            path = prop.getProperty("secret_key_path");
        }else {
            log.error("SecretKeyLoader.class - db.properties file not found in the classpath");
            throw new IOException("SecretKeyLoader.class - db.properties file not found in the classpath: " + path);
        }

        if (path == null || path.isBlank()) {
        // jika tidak ada bisa dibuat default
//            path = System.getProperty("secret_key_path", "QUtleUBWZW5TeXM="); 
            log.error("varaibel secret_key_path tidak ditemukan atau kosong");
        }

        Path secretPath = Paths.get(path);

        if (!Files.exists(secretPath)) {
            throw new IOException("Secret_key file tidak ditemukan: " + path);
        } else {
//            log.info("SecretKey file ditemukan: "+path);
        }

        // Atur permission (kalau sistem mendukung POSIX)
        PosixFileAttributeView posixView = Files.getFileAttributeView(secretPath, PosixFileAttributeView.class);
        if (posixView != null) {
            Set<PosixFilePermission> perms = EnumSet.of(
                    PosixFilePermission.OWNER_READ,
                    PosixFilePermission.OWNER_WRITE
            );
            Files.setPosixFilePermissions(secretPath, perms);
//            log.info("Permission file secretKey: "+path+" berhasil di-set menjadi 600 (rw-------)");
        } else {
//            System.out.println("POSIX permission tidak tersedia, lewati pengaturan chmod.");
        }

        // Baca isi secret dan trim whitespace/newline
        String secret = Files.readString(secretPath).trim();

        if (secret.isEmpty()) {
            log.error("Secret kosong pada file: " + secretPath);
            throw new IOException("Secret kosong pada file: " + secretPath);
        }

        return secret;
        
    }

    public static void main(String[] args) {
            try {
                String secret = new SecretKeyLoader().loadSecret();
                System.out.println("Secret berhasil dimuat (panjang): " + secret);

                // Jangan tampilkan isi secret di log untuk keamanan
                Encryptor enc = new Encryptor();

                Properties prop = new Properties();
                InputStream inputStream = SecretKeyLoader.class.getResourceAsStream("/db.properties");
                String user = "";
                if (inputStream != null) {
                    prop.load(inputStream);
                    user = prop.getProperty("user");
                }else {
                    log.error("SecretKeyLoader.class - db.properties file not found in the classpath");
                }

                String secretKey = "";
                try {
                    secretKey = new SecretKeyLoader().loadSecret();
                } catch (IOException e) {
                    e.printStackTrace();
                    log.error("Error SecretKeyLoader : "+e.getMessage());
                }

                String USER = "";
                try {
                    USER = enc.decryptTD(user, secretKey);
                    System.out.println("Hasil decrypt: "+USER);
                } catch (Exception ex) {
                }
        } catch (IOException e) {
            e.printStackTrace();
            log.error("Error SecretKeyLoader : "+e.getMessage());
//            System.exit(1);
        }
    }
}

