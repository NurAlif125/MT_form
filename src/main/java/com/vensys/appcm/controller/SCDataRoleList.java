package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataRole;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.DataRole;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class SCDataRoleList extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Logger log = LogManager.getLogger(getClass().getName());

    private static final Pattern SAFE_INPUT_PATTERN = Pattern.compile("^[a-zA-Z0-9_-]{0,50}$");

    private static final String[] MALICIOUS_PARAMETERS = {
        "classloader", "class.module", "bytes[", "process", "runtime", "exec"
    };

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Set security headers
        setSecurityHeaders(response);

        //Log Info Request
        logRequestInfo(request);
        
        //validasi parameter
        if (containsMaliciousParameters(request)) {
            log.warn("Blocked malicious parameter access attempt from IP: " + request.getRemoteAddr());
            response.sendError(500);
            return;
        }
        
        //ambil value parameter
        String find = request.getParameter("find") == null ? "" : request.getParameter("find").trim();
        String role_name = request.getParameter("_s_role_name") == null ? "" : request.getParameter("_s_role_name").trim();

        //validasi input
        if (!isInputValid(find) || !isInputValid(role_name)) {
            log.warn("Invalid input detected - find: " + find + ", role_name: " + role_name);
            response.sendError(400);
            return;
        }

        HttpSession httpSession = request.getSession();
        DBconnection dbConn = new DBconnection();
        List<DataRole> dataRole = new ArrayList<>();

        try {
            log.info("Processing SCDataRoleList...");

            DBDataRole db = new DBDataRole(dbConn.getConnection());

            if (find.isEmpty()) {
                dataRole = db.getAllDataRole();
            } else {
                dataRole = db.getAllDataRole(role_name);
            }

            httpSession.setAttribute("dataRole", dataRole);

        } catch (Exception ex) {
            log.error("Exception: " + ex.getMessage(), ex);
            response.sendError(500);
            return;
        } finally {
            dbConn.closeConnection();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("VDataRole.jsp");
        dispatcher.forward(request, response);
    }

    private void setSecurityHeaders(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0, private");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        
        response.setHeader("X-Content-Type-Options", "nosniff");
        response.setHeader("X-Frame-Options", "DENY");
        response.setHeader("X-XSS-Protection", "1; mode=block");
        response.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains");
        response.setHeader("Content-Security-Policy", "default-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'; frame-ancestors 'none'; base-uri 'self';");
        response.setHeader("Referrer-Policy", "no-referrer");
        response.setHeader("Permissions-Policy", "geolocation=(), microphone=()");
    }

    private void logRequestInfo(HttpServletRequest request) {
        log.info("Request from IP: " + request.getRemoteAddr()
                + " | URL: " + request.getRequestURL()
                + " | Parameters: " + request.getQueryString());
    }

    private boolean containsMaliciousParameters(HttpServletRequest request) {
        return request.getParameterMap().keySet().stream()
                .anyMatch(key -> {
                    String lowerKey = key.toLowerCase();
                    for (String malicious : MALICIOUS_PARAMETERS) {
                        if (lowerKey.contains(malicious)) {
                            return true;
                        }
                    }
                    return false;
                });
    }
    
    private boolean isInputValid(String input) {
        return SAFE_INPUT_PATTERN.matcher(input).matches();
    }
}
