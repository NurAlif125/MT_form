/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.myutils;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author Isal
 */
@WebFilter("/*")
public class BlockMethodOverrideFilter implements Filter {
    private static final Logger log = LogManager.getLogger(BlockMethodOverrideFilter.class);

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpServletResponse httpRes = (HttpServletResponse) response;

        try {
            boolean hasOverrideHeader = httpReq.getHeader("X-HTTP-Method-Override") != null
                    || httpReq.getHeader("X-HTTP-Method") != null
                    || httpReq.getHeader("X-Method-Override") != null;
            boolean hasMethodParam = httpReq.getParameter("_method") != null;

            if (hasOverrideHeader || hasMethodParam) {
                log.warn("Blocked method override attempt: method=" + httpReq.getMethod()
                        + " uri=" + httpReq.getRequestURI()
                        + " query=" + httpReq.getQueryString());
                // Gunakan 400 Bad Request atau 405 jika ingin lebih spesifik
                if(!httpRes.isCommitted()){
                    httpRes.sendError(HttpServletResponse.SC_BAD_REQUEST, "HTTP Method Override not allowed");
                } else {
                    log.warn("Attempted to send error but response already committed");
                }
                return; // jangan lanjutkan chain
            }

            chain.doFilter(request, response);
        } catch (Exception ex) {
            // Tangani exception di sini supaya tidak bocor stacktrace ke client
//            log.error("Error in BlockMethodOverrideFilter", ex);
            if(!httpRes.isCommitted()){
                httpRes.sendError(HttpServletResponse.SC_BAD_REQUEST, "Request blocked due to filter error");
            } else {
                log.warn("Attempted to send error but response already committed");
            }
            // httpRes.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server error");
        }
    }
}