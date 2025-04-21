/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.dbase;

import java.net.URISyntaxException;
/**
 *
 * @author M Abdul Hadi
 */
import java.io.InputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.LoggerContext;
import com.vensys.appcm.myutils.Encryptor;
import java.util.logging.Level;

public class DBconnection2 {

    private Connection conn2;
    private static final Logger log = LogManager.getLogger(DBconnection2.class);
    Encryptor enc = new Encryptor();

    public DBconnection2() {
        try {
 
            LoggerContext loggerContext = (LoggerContext) LogManager.getContext(false);
            loggerContext.setConfigLocation(getClass().getResource("/log4j.properties").toURI());
            
         Properties prop = new Properties();
            InputStream inputStream = DBconnection2.class.getClassLoader().getResourceAsStream("/db.properties");
            if (inputStream != null) {
                prop.load(inputStream);
                String DRIVER = prop.getProperty("driver");
                String URL = prop.getProperty("url2");
//                String USER = prop.getProperty("user");
//                String PASS = prop.getProperty("password");
                String USER = null;
                String PASS = null;
                try {
                    USER = enc.decryptTD(prop.getProperty("user2"), "AKey@VenSys");
                    PASS = enc.decryptTD(prop.getProperty("password2"), "AKey@VenSys");
                } catch (Exception ex) {
                    java.util.logging.Logger.getLogger(DBconnection.class.getName()).log(Level.SEVERE, null, ex);
                }
                Class.forName(DRIVER);
                conn2 = DriverManager.getConnection(URL, USER, PASS);
                log.info("Database connection 2 established");
                System.out.println("Database connection 2 established");
            } else {
                log.error("db.properties file not found in the classpath");
                // Handle this situation accordingly
            }
        } catch (URISyntaxException | ClassNotFoundException | SQLException | IOException e) {
            log.error("Error initializing database connection 2: " + e.getMessage());
        }
    }

    public Connection getConnection2() {
        return this.conn2;
    }

    public void closeConnection2() {
        if (this.conn2 != null) {
            try {
                this.conn2.close();
                log.info("Database connection closed 2");
            } catch (SQLException ex) {
                log.error("Error closing database connection 2: " + ex.getMessage());
            }
        }
    }
}