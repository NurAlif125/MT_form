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

public class DBconnection {

    private Connection conn;
    private static final Logger log = LogManager.getLogger(DBconnection.class);
    Encryptor enc = new Encryptor();

    public DBconnection() {
        try {
 
            LoggerContext loggerContext = (LoggerContext) LogManager.getContext(false);
            loggerContext.setConfigLocation(getClass().getResource("/log4j.properties").toURI());
            
         Properties prop = new Properties();
            InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
            if (inputStream != null) {
                prop.load(inputStream);
                String DRIVER = prop.getProperty("driver");
                String URL = prop.getProperty("url");
//                String USER = prop.getProperty("user");
//                String PASS = prop.getProperty("password");
                String USER = null;
                String PASS = null;
                try {
                    USER = enc.decryptTD(prop.getProperty("user"), "AKey@VenSys");
                    PASS = enc.decryptTD(prop.getProperty("password"), "AKey@VenSys");
                } catch (Exception ex) {
                    java.util.logging.Logger.getLogger(DBconnection.class.getName()).log(Level.SEVERE, null, ex);
                }
                Class.forName(DRIVER);
                conn = DriverManager.getConnection(URL, USER, PASS);
                log.info("Database connection established");
            } else {
                log.error("db.properties file not found in the classpath");
                // Handle this situation accordingly
            }
        } catch (URISyntaxException | ClassNotFoundException | SQLException | IOException e) {
            log.error("Error initializing database connection: " + e.getMessage());
        }
    }

    public Connection getConnection() {
        return this.conn;
    }

    public void closeConnection() {
        if (this.conn != null) {
            try {
                this.conn.close();
                log.info("Database connection closed");
            } catch (SQLException ex) {
                log.error("Error closing database connection: " + ex.getMessage());
            }
        }
    }
}