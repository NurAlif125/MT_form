/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.controller;

/**
 *
 * @author HP PROBOOK 430 G8
 */
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

//check user login atau tidak dan tidak bisa back
//@WebFilter("/*")
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

//         HttpServletRequest request = (HttpServletRequest) req;
//        HttpServletResponse response = (HttpServletResponse) res;
//
//        String path = request.getRequestURI();
//        String uri = request.getRequestURI().toLowerCase();
//
//        // Bypass untuk static resources (CSS, JS, gambar, fonts)
//        if (uri.contains("/assets/") ||
//            uri.contains("/resources/") ||
//            uri.contains("/lottie-player/") ||  
//            uri.contains(".css") ||
//            uri.contains(".js") ||
//            uri.contains(".json") ||
//            uri.contains(".ts") ||
//            uri.contains(".map") ||
//            uri.contains(".png") ||
//            uri.contains(".jpg") ||
//            uri.contains(".jpeg") ||
//            uri.contains(".gif") ||
//            uri.contains(".woff") ||
//            uri.contains(".woff2") ||
//            uri.contains(".ttf")) {
//            chain.doFilter(req, res);
//            return;
//        }
        
//        String[] whitelist = { "login.jsp","ServletControllerUserData" };
//
//        for (String safe : whitelist) {
//            if (uri.contains(safe)) {
//                chain.doFilter(req, res);
//                return;
//            }
//        }

//        HttpSession session = request.getSession(false);
//        if (session == null || session.getAttribute("username") == null) {
//            response.sendRedirect("login.jsp");
//            return;
//        }

//        chain.doFilter(req, res);
    }
}
