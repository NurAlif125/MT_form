/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.myutils;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ErrorRedirectFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletResponse responseWrapper = new HttpServletResponseWrapper((HttpServletResponse) res) {
            @Override
            public void sendError(int sc) throws IOException {
                if (sc == 400) {
                    try {
                        ((HttpServletRequest) req).getRequestDispatcher("/errorPage/400.jsp").forward(req, res);
                    } catch (ServletException ex) {
                        System.getLogger(ErrorRedirectFilter.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
                    }
                } else if (sc == 404) {
                    try {
                        ((HttpServletRequest) req).getRequestDispatcher("/errorPage/404.jsp").forward(req, res);
                    } catch (ServletException ex) {
                        System.getLogger(ErrorRedirectFilter.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
                    }
                } else if (sc == 500) {
                    try {
                        ((HttpServletRequest) req).getRequestDispatcher("/errorPage/500.jsp").forward(req, res);
                    } catch (ServletException ex) {
                        System.getLogger(ErrorRedirectFilter.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
                    }
                } else {
                    super.sendError(sc);
                }
            }
        };

        chain.doFilter(req, responseWrapper);
    }
}
