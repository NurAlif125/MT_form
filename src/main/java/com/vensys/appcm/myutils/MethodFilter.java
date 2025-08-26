package com.vensys.appcm.myutils;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;
import org.springframework.core.annotation.Order;

@WebFilter("/*")
@Order(1)
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
            res.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
            res.setHeader("Pragma", "no-cache");
            res.setDateHeader("Expires", 0);
            res.setHeader("X-Content-Type-Options", "nosniff");
            res.setHeader("X-Frame-Options", "DENY");
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
