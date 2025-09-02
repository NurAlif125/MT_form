<%-- 
    Document   : 500
    Created on : 30 Jul 2025, 11.12.30
    Author     : rafli
--%>

<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// Security Headers
    response.setHeader("X-XSS-Protection", "1; mode=block");
    response.setHeader("X-Content-Type-Options", "nosniff");
    response.setHeader("X-Frame-Options", "DENY");
    response.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
    response.setHeader("Content-Security-Policy",
            "default-src 'self'; "
            + "script-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net; "
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
    response.setHeader("Referrer-Policy", "strict-origin-when-cross-origin");
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    response.setHeader("Surrogate-Control", "no-store");
    response.setHeader("Vary", "accept-encoding");
    response.setHeader("Permissions-Policy", "geolocation=(), microphone=()");
    response.setHeader("Server", "Unknown");
    response.setHeader("X-Powered-By", "Unknown");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>500 - Internal Server Error</title>
        <style>
            body {
                margin: 0;
                font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(to right, #2c3e50, #4ca1af);
                color: white;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100vh;
                text-align: center;
            }
            .error-box {
                background: rgba(0, 0, 0, 0.3);
                padding: 40px;
                border-radius: 15px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
            }
            h1 {
                font-size: 72px;
                margin: 0;
            }
            p {
                font-size: 20px;
                margin-top: 10px;
            }
            a {
                margin-top: 20px;
                display: inline-block;
                background: #ffffff22;
                padding: 10px 20px;
                color: white;
                text-decoration: none;
                border-radius: 8px;
                transition: background 0.3s ease;
            }
            a:hover {
                background: #ffffff44;
            }
        </style>
    </head>
    <body>
        <div class="error-box">
            <h1>500</h1>
            <p>Oops! Internal Server Error.</p>
            <p>Something went wrong on our side. Please try again later.</p>
            <a href="<%= request.getContextPath()%>/">Back</a>
        </div>
    </body>
</html>