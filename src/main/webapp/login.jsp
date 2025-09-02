<%@page import="java.io.FileInputStream" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.*,java.util.*" session="true"%>

<%
// Security Headers
    response.setHeader("X-XSS-Protection", "1; mode=block");
    response.setHeader("X-Content-Type-Options", "nosniff");
    response.setHeader("X-Frame-Options", "DENY");
    response.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
    response.setHeader("Content-Security-Policy",
            "default-src 'self'; "
            + "script-src 'self' 'unsafe-inline' 'unsafe-eval' https://cdn.jsdelivr.net https://cdnjs.cloudflare.com; "
            + "style-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net https://cdnjs.cloudflare.com; "
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
    response.setHeader("Surrogate-Control", "no-store");
    response.setHeader("Vary", "accept-encoding");
    response.setDateHeader("Expires", 0);
    response.setHeader("Permissions-Policy", "geolocation=(), microphone=()");
    response.setHeader("Cross-Origin-Opener-Policy", "same-origin");
    response.setHeader("Cross-Origin-Embedder-Policy", "require-corp");
    response.setHeader("Server", "Unknown");
    response.setHeader("X-Powered-By", "Unknown");
%>

<html>
    <head>
        <title>clickMessenger Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icon.png"/>
        <meta name="description" content="CM" />
        <meta name="keywords" content="enter your keywords here" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <script type="text/javascript" src="js/login_focus.js"></script>
        <link href="fontawesome/css/all.css" rel="stylesheet">
        <link href="css/costume-css.css" rel="stylesheet">
        <link href="bootstrap-5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="lottie-player/dist/lottie-player.js"></script>

    </head>
    <body class="cm" style="background-color:#358f94;">
        <div class="container h-100 pt-5 pb-5">
            <div class="row h-100">
                <div class="col">
                    <div class="h-100 d-flex align-items-center" style="width: 35rem;">
                        <form>
                            <img class="loginPage" src="images/flickr.com/cmbig.png" style="width: 30rem;"/>
                            <lottie-player src="lotties/dashboard-elements.json"  
                                           background="transparent"  speed="0.5"  
                                           style="width: 300px; height: 300px;"  loop autoplay>
                            </lottie-player>
                        </form>
                    </div>
                </div>
                <div class="col">
                    <div style="width: 25rem;" class="shadow pt-5 px-5 bg-body rounded h-100 d-flex align-items-center">

                        <form class="w-100" nam="frmLogin" method="POST" action="ServletControllerUserData">
                            <img class="loginPage" style="width: 100%;" src="images/cmdanamon.png"/><br><br><br>
                            <h3 style="color:#20696d;"><b>CM - SWIFT Interface</b></h3>
                            <br>
                            <div class="form-floating mb-3">
                                <input required type="text" name="username" autocomplete="off" class="form-control"  autofocus="true" id="floatUserName" placeholder="Your Username" maxlength="20">
                                <label for="floatUserName"><i class="fa-solid fa-user"></i> User ID</label>
                            </div>

                            <div class="form-floating">
                                <input required type="password" minlength="8" class="form-control" name="password" id="password" autocomplete="off" placeholder="Password">
                                <label for="password"><i class="fa-solid fa-lock"></i> Password</label>
                            </div>
                            <input class="mt-3 btn btn-primary" type="submit" name="Login" value="Login">
                            <br><br>

                            <p style="font-size: 12px;" class="align-self-end"><a style="font-size:12px;text-decoration: none;" href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>               
        <span class="d-none d-print-block" id="error-msg"><c:out value="${errormsg}"/></span>
        <div class="toast-container position-fixed bottom-0 start-0 p-3">
            <div id="liveToast" class="shadow rounded toast" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <i class="fas fa-info-circle"></i>&nbsp;
                    <strong class="me-auto">Information</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body text-primary">
                    <c:if test="${not empty errormsg}">
                        <c:out value="${errormsg}"/>
                        <c:remove var="errormsg" scope="session"/>
                    </c:if>
                </div>
            </div>
        </div>
        <script src="bootstrap-5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <script type="text/javascript" src="js/login.js"></script>
    </body>
</html>