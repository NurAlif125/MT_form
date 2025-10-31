/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.myutils;

/**
 *
 * @author rafli
 */
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.DispatcherType;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.EnumSet;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * SecureHeadersAndPathGuardFilter
 */
@WebFilter(
        filterName = "SecureHeadersAndPathGuardFilter",
        urlPatterns = {"/*"},
        dispatcherTypes = {
            DispatcherType.REQUEST, DispatcherType.FORWARD, DispatcherType.ERROR, DispatcherType.ASYNC, DispatcherType.INCLUDE
        }
)
public class SecureHeadersAndPathGuardFilter implements Filter {

    private String csp
            = "default-src 'self'; "
            + "script-src 'self' 'unsafe-inline' 'unsafe-eval' https://cdn.jsdelivr.net https://cdnjs.cloudflare.com; "
            + "style-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net https://cdnjs.cloudflare.com; "
            + "img-src 'self' data: https://flickr.com; "
            + "font-src 'self' https://cdn.jsdelivr.net; "
            + "connect-src 'self'; "
            + "object-src 'none'; "
            + "frame-ancestors 'none'; "
            + "base-uri 'self'; "
            + "form-action 'self'; "
            + "upgrade-insecure-requests;";
    private boolean addCsp = true;

    private static final Pattern TRAVERSAL
            = Pattern.compile("(?i)(\\.\\./|%2e%2e%2f|%2f%2e%2e|\\.\\.\\\\|%5c%5c|%5c\\.|\\./\\.|\\.%2e|%2e\\.)");
    private static final Pattern SENSITIVE_PATH
            = Pattern.compile("(?i)(/etc/passwd|/proc/|/sys/|/windows/|web-inf|meta-inf)");
    private static final Pattern SUS_QUERY_TOKEN
            = Pattern.compile("(?i)(/etc/passwd|\\Q..\\E|\\Q..%2f\\E|%2e%2e|%5c|/web-inf|/meta-inf)");

    @Override
    public void init(FilterConfig filterConfig) {

        String cspFromInit = filterConfig.getInitParameter("csp");
        if (cspFromInit != null && !cspFromInit.isBlank()) {
            this.csp = cspFromInit;
        }

        String addCspInit = filterConfig.getInitParameter("addCsp");
        if (addCspInit != null) {
            this.addCsp = Boolean.parseBoolean(addCspInit);
        }
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String rawUri = request.getRequestURI();
        String decodedUri = urlDecodeOnce(rawUri).replace('\\', '/');

        boolean badPath
                = TRAVERSAL.matcher(decodedUri).find()
                || SENSITIVE_PATH.matcher(decodedUri).find()
                || queryLooksSuspicious(request);

        boolean badHeader = false;
        var headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String headerName = headerNames.nextElement();
            String headerValue = request.getHeader(headerName);
            if (headerValue != null && (headerValue.contains("\r") || headerValue.contains("\n"))) {
                badHeader = true;
                break;
            }
        }

        if (badPath || badHeader) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            addCacheHeaders(response);
            addSecurityHeaders(response);
            if (addCsp) {
                addCspHeader(response);
            }
            request.setAttribute("errorMessage", "Invalid request detected");
            request.getRequestDispatcher("/errorPage/400.jsp")
                    .forward(request, response);
            return;
        }

        addCacheHeaders(response);
        addSecurityHeaders(response);
        if (addCsp) {
            addCspHeader(response);
        }

        chain.doFilter(request, response);
    }

    private static String urlDecodeOnce(String s) {
        try {
            return URLDecoder.decode(s, StandardCharsets.UTF_8);
        } catch (IllegalArgumentException ex) {
            return s;
        }
    }

    private static boolean queryLooksSuspicious(HttpServletRequest req) {
        Map<String, String[]> params = req.getParameterMap();
        for (Map.Entry<String, String[]> e : params.entrySet()) {
            String k = urlDecodeOnce(e.getKey());
            if (SUS_QUERY_TOKEN.matcher(k).find()) {
                return true;
            }
            for (String v : e.getValue()) {
                String dv = urlDecodeOnce(v);
                if (SUS_QUERY_TOKEN.matcher(dv).find()) {
                    return true;
                }
            }
        }
        return false;
    }

    private static void addCacheHeaders(HttpServletResponse resp) {
        resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0, private");
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Expires", "0");
        resp.setHeader("Surrogate-Control", "no-store");
        resp.setHeader("Vary", "accept-encoding");
    }

    private void addSecurityHeaders(HttpServletResponse resp) {
        resp.setHeader("X-Content-Type-Options", "nosniff");
        resp.setHeader("X-Frame-Options", "DENY");
        resp.setHeader("Referrer-Policy", "no-referrer");
        resp.setHeader("X-XSS-Protection", "1; mode=block");
        resp.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
        resp.setHeader("Server", "Unknown");
        resp.setHeader("X-Powered-By", "Unknown");
        resp.setHeader("Permissions-Policy",
                "geolocation=(), microphone=(), camera=(), payment=()");
        // COOP/COEP (aktifkan jika aplikasi Anda siap untuk cross-origin isolation)
        resp.setHeader("Cross-Origin-Opener-Policy", "same-origin");
        resp.setHeader("Cross-Origin-Embedder-Policy", "require-corp");
        resp.setHeader("Server", "Unknown");
        resp.setHeader("X-Powered-By", "Unknown");
    }

    private void addCspHeader(HttpServletResponse resp) {
        // Sesuaikan source list; hindari 'unsafe-eval' kecuali benar-benar diperlukan.
        resp.setHeader("Content-Security-Policy", csp);
    }
}
