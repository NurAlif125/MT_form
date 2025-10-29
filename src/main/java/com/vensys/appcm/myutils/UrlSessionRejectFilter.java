/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.myutils;


import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author isal
 */

public class UrlSessionRejectFilter implements Filter {
    
    private static final Logger log = LogManager.getLogger(BlockMethodOverrideFilter.class);
    
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
            HttpServletRequest request = (HttpServletRequest) req;
            HttpServletResponse response = (HttpServletResponse) res;
        try {
    //
    //        if (request.isRequestedSessionIdFromURL()) {
    //            // redirect to login (atau tolak)
    //            response.sendRedirect(request.getContextPath() + "/login.jsp");
    //            return;
    //        }
    //        chain.doFilter(req, res);

             String uri = request.getRequestURI();
            if (uri != null && uri.toLowerCase().contains(";jsessionid=")) {
                // langsung tolak / redirect
//                log.warn("Request dengan URL session ID ditolak: {}", uri);
                if(!response.isCommitted()){
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "URL session ID is not allowed");
                } else {
                    log.warn("Attempted to send error but response already committed");
                }
                // response.sendError(HttpServletResponse.SC_BAD_REQUEST, "URL session ID is not allowed");
                return;
            }

            chain.doFilter(req, res);
        } catch (Exception e) {
            log.error("Error di UrlSessionRejectFilter: {}", e.getMessage(), e);
            // kalau mau lempar lagi biar error muncul ke client
            // throw new ServletException(e);

            // Block request dan kirim status aman
            if(!response.isCommitted()){
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Request blocked due to filter error");
            } else {
                log.warn("Attempted to send error but response already committed");
            }
            // response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Request blocked due to filter error");
        }
    }
}
