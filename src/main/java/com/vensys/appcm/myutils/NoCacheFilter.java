/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.myutils;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;
import java.io.IOException;

/**
 *
 * @author rafli
 */
@WebFilter("/*")
public class NoCacheFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        if (response instanceof HttpServletResponse && request instanceof HttpServletRequest) {
            HttpServletResponse httpResp = (HttpServletResponse) response;
            HttpServletRequest httpReq = (HttpServletRequest) request;

            // Bungkus response dulu
            HttpServletResponseWrapper wrappedResp = new HttpServletResponseWrapper(httpResp) {
                @Override
                public void addCookie(Cookie cookie) {
                    cookie.setHttpOnly(true);
                    cookie.setSecure(true);
                    cookie.setPath("/");
                    try {
                        // Java 11+ support
//                    cookie.setComment("SameSite=Strict");
                        cookie.setAttribute("SameSite", "Strict");
                    } catch (Exception ignored) {
                    }

                    super.addCookie(cookie);
                }
            };

            // === Set header non-cookie ===
            httpResp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
            httpResp.setHeader("Pragma", "no-cache");
            httpResp.setDateHeader("Expires", 0);

            httpResp.setHeader("X-Content-Type-Options", "nosniff");
            httpResp.setHeader("X-Frame-Options", "DENY");
            httpResp.setHeader("X-XSS-Protection", "1; mode=block");
            httpResp.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
            httpResp.setHeader("Content-Security-Policy",
                    "default-src 'self'; "
                    + "script-src 'self' 'unsafe-inline' 'unsafe-eval' https://cdn.jsdelivr.net; "
                    + "style-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net; "
                    + "img-src 'self' data: https://flickr.com; "
                    + "font-src 'self' https://cdn.jsdelivr.net; "
                    + "connect-src 'self'; "
                    + "object-src 'none'; "
                    + "frame-ancestors 'none'; "
                    + "base-uri 'self'; "
                    + "form-action 'self'; "
                    + "upgrade-insecure-requests;"
            );
            httpResp.setHeader("Referrer-Policy", "no-referrer");
            httpResp.setHeader("Permissions-Policy", "geolocation=(), microphone=()");
            httpResp.setHeader("Server", "Unknown");
            httpResp.setHeader("X-Powered-By", "Unknown");
            
            chain.doFilter(request, wrappedResp);
            return;
        }

        chain.doFilter(request, response);
    }
}
