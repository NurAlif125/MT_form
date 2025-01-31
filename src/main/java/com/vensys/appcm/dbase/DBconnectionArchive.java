/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

/**
 *
 * @author RIZKY
 */
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

/**
 *
 * @author M Abdul Hadi
 */
public class DBconnectionArchive {

    Connection connAr = null;
    Logger log = Logger.getLogger(getClass().getName());

    public DBconnectionArchive() {
//        PropertyConfigurator.configure("C:/Program Files/Apache Software Foundation/Tomcat 8.5/webapps/AppRTGS2/WEB-INF/classes/log4j.properties");
//        PropertyConfigurator.configure("D:/Vensys/Client/Sumut/RTGS_SKN/CM/AppRTGS2/src/java/log4j.properties");
        PropertyConfigurator.configure(getClass().getResource("/log4j.properties"));
        try {
            Properties prop = new Properties();
            InputStream inputStream = DBconnectionArchive.class.getClassLoader().getResourceAsStream("/db.properties");
            prop.load(inputStream);
//            System.out.println("Current working directory is " + prop..toString());
            String DRIVER = prop.getProperty("driver");
            String URL = prop.getProperty("url_ar");
            String USER = prop.getProperty("user");
            String PASS = prop.getProperty("password");
            Class.forName(DRIVER);
            connAr = DriverManager.getConnection(URL, USER, PASS);
            log.info("DBconnection");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            log.error(e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            log.error(e.getMessage());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            log.error(e.getMessage());
        } catch (IOException e) {
            e.printStackTrace();
            log.error(e.getMessage());
        }
    }

    public Connection getConnectionAr() {
//        System.out.println("DBconnection getConnection()");
        log.info("getConnection");
        return this.connAr;
    }

    public void closeConnectionAr() {
        if (this.connAr != null) {
            try {
//                System.out.println("DBconnection closeConnection()");
                this.connAr.close();
                log.info("closeConnection");
            } catch (Exception ex) {
//                System.err.println(ex);
                log.error(ex.getMessage());
            }
        }
    }
}
