package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.concurrent.*;

@WebListener
public class StartupScheduler implements ServletContextListener {

    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Inisialisasi scheduler...");
        System.out.println("Waktu server sekarang: " + LocalDateTime.now());

        scheduler = Executors.newScheduledThreadPool(1);

        Runnable task = () -> {
            LocalTime now = LocalTime.now();
            LocalTime start = LocalTime.of(01, 00);
            LocalTime end = LocalTime.of(01, 05);

            if (!now.isBefore(start) && now.isBefore(end)) {
                disableInactiveUsers();
            } else {
                System.out.println("Di luar rentang waktu 13:50–14:00, skip eksekusi pada: " + now);
            }
        };

        long initialDelay = 0;       // langsung mulai
        long period = 60;             // setiap 5 detik

        scheduler.scheduleAtFixedRate(task, initialDelay, period, TimeUnit.SECONDS);
        System.out.println("Scheduler aktif. Akan berjalan setiap 5 detik, tetapi hanya eksekusi antara 13:50–14:00.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (scheduler != null && !scheduler.isShutdown()) {
            scheduler.shutdown();
        }
        System.out.println("Scheduler dimatikan.");
    }

    private void disableInactiveUsers() {
        try {
            System.out.println("[Scheduler] Eksekusi dimulai pada: " + LocalTime.now());

            DBconnection dbConn = new DBconnection();
            //DBconnection2 dbConn2 = new DBconnection2();
            Connection conn1 = null;
            //Connection conn2 = null;

            String sql = """
                UPDATE users
                SET enable = 0
                WHERE enable = 1
                  AND last_login IS NOT NULL
                  AND to_timestamp(last_login, 'YYYY-MM-DD HH24:MI:SS') < CURRENT_DATE - INTERVAL '1 month' and user_id='admin2';
            """;

            try {
                conn1 = dbConn.getConnection();
                //conn2 = dbConn2.getConnection2();

                if (conn1 == null ) {
                    System.err.println(" Salah satu koneksi DB null.");
                    return;
                }

                int affected1 = conn1.prepareStatement(sql).executeUpdate();
                //int affected2 = conn2.prepareStatement(sql).executeUpdate();

                System.out.println(" DB1 - Jumlah user dinonaktifkan: " + affected1);
                //System.out.println("✅ DB2 - Jumlah user dinonaktifkan: " + affected2);

            } catch (Exception ex) {
                System.err.println(" Error saat menjalankan update:");
                ex.printStackTrace();
            } finally {
                dbConn.closeConnection();
                //dbConn2.closeConnection2();
            }

        } catch (Exception e) {
            System.err.println(" ERROR di disableInactiveUsers()");
            e.printStackTrace();
        }
    }
}