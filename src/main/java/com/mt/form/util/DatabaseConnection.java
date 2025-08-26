/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mt.form.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;
import java.io.IOException;

/**
 *
 * @author mslam
 */
public class DatabaseConnection {

    private static final String PROPERTIES_FILE = "/db.properties";

    public static Connection getConnection() throws SQLException {
        try (InputStream input = DatabaseConnection.class.getResourceAsStream(PROPERTIES_FILE)) {
            if (input == null) {
                throw new SQLException("db.properties not found in resources!");
            }
            Properties props = new Properties();
            props.load(input);

            String url = props.getProperty("db.url");
            String user = props.getProperty("db.username");   // ✅ fix: konsisten
            String password = props.getProperty("db.password");
            String driver = props.getProperty("db.driver");

            // ✅ pastikan driver PostgreSQL ter-load
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e) {
                throw new SQLException("PostgreSQL JDBC Driver not found in classpath", e);
            }

            return DriverManager.getConnection(url, user, password);

        } catch (IOException ex) {
            throw new SQLException("Failed to load db.properties", ex);
        }
    }
}
