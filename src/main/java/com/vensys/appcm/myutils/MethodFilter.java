package com.vensys.appcm.myutils;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

public class MethodFilter implements Filter {

    private static final Set<String> ALLOWED_METHODS = Set.of("GET", "POST");

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inisialisasi jika dibutuhkan
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String method = req.getMethod();

        if (!ALLOWED_METHODS.contains(method)) {
            res.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "HTTP method " + method + " not allowed.");
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup jika dibutuhkan
    }
}
