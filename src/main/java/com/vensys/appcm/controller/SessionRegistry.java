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

    public static synchronized void registerSession(String username, HttpSession session) {
        // Jika sudah ada session lama, tendang dulu
        if (sessions.containsKey(username)) {
            HttpSession oldSession = sessions.get(username);
            if (oldSession != null) {
                try {
                    oldSession.setAttribute("duplicateLoginMessage", "Your account has been logged in from another device. Please log in again.");
//                    oldSession.invalidate();
                } catch (IllegalStateException ignored) {}
            }
        }
        sessions.put(username, session);
    }

    public static synchronized void removeSession(String username) {
        sessions.remove(username);
    }
}
