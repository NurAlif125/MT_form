/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.controller;

/**
 *
 * @author HP PROBOOK 430 G8
 */
import jakarta.servlet.http.HttpSession;
import java.util.concurrent.ConcurrentHashMap;

public class SessionRegistry {
    private static final ConcurrentHashMap<String, HttpSession> sessions = new ConcurrentHashMap<>();

    /**
     * Register session baru untuk username tertentu.
     * Jika ada session lama, invalidate dulu.
     */
    public static synchronized void registerSession(String username, HttpSession newSession) {
        if (username == null || newSession == null) return;

        HttpSession oldSession = sessions.put(username, newSession);

        if (oldSession != null) {
            try {
                oldSession.setAttribute("duplicateLoginMessage",
                        "Your account has been logged in from another device. Please log in again.");
//                oldSession.invalidate();
            } catch (IllegalStateException ignored) {}
        }
    }

    /**
     * Remove session dari registry
     */
    public static synchronized void removeSession(String username) {
        if (username != null) {
            sessions.remove(username);
        }
    }

    /**
     * Ambil session dari registry, return null kalau tidak valid
     */
    public static synchronized HttpSession getSession(String username) {
        if (username == null) return null;

        HttpSession session = sessions.get(username);
        if (session == null) return null;

        try {
            session.getCreationTime();
            return session;
        } catch (IllegalStateException e) {
            sessions.remove(username);
            return null;
        }
    }
}
