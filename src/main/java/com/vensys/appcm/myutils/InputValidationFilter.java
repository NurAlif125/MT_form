/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.myutils;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 *
 * @author rafli
 */

@WebFilter("/*")
public class InputValidationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;

        for (Map.Entry<String, String[]> entry : req.getParameterMap().entrySet()) {
            String paramName = entry.getKey();
            String[] values = entry.getValue();

            if (paramName.matches(".*(classLoader|class\\.module|\\$\\{).*")) {
                ((HttpServletResponse) response).sendError(400);
                return;
            }

            for (String v : values) {
                if (v != null && v.matches(".*(classLoader|class\\.module|\\$\\{).*")) {
                    ((HttpServletResponse) response).sendError(400);
                    return;
                }
            }
        }

        chain.doFilter(request, response);
    }
}
