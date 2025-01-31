<%@page import="java.io.FileInputStream" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.text.*,java.util.*" session="true"%>

<%!
//        DateFormat fmt = new SimpleDateFormat("EEEE, d MMMM yyyy");
//        String now = fmt.format(new Date());
//    Calendar calendar = Calendar.getInstance();
//    java.sql.Timestamp ourJavaTimestampObject = new java.sql.Timestamp(calendar.getTime().getTime());
//    SimpleDateFormat formatter = new SimpleDateFormat("EEEE, d MMMM yyyy");
//    String tglsekarang = formatter.format(ourJavaTimestampObject);
//
//HttpSession session = request.getSession();
%>
<html>
    <head>
        <title>clickMessenger Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="shortcut icon" href="images/icon.png"/>
        <meta name="description" content="CM" />
        <meta name="keywords" content="enter your keywords here" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <script type="text/javascript">
            function setFocus() {
                document.getElementById("username").focus();
            }
        </script>
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
                            <img class="loginPage" style="width: 100%;" src="images/flickr.com/cmmega.png"/><br><br><br>
                            <h3 style="color:#20696d;"><b>CM - SWIFT Interface</b></h3>
                            <br>
                            <div class="form-floating mb-3">
                                <input type="text" name="username" autocomplete="off" class="form-control"  autofocus="true" id="floatUserName" placeholder="Your Username">
                                <label for="floatUserName"><i class="fa-solid fa-user"></i> User ID</label>
                            </div>

                            <div class="form-floating">
                                <input type="password" class="form-control" name="password" id="password" autocomplete="off" placeholder="Password">
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


        <!--Toast for warning on login page-->                
        <span class="d-none d-print-block" id="error-msg"><c:out value="${errormsg}"/></span>
        <div class="toast-container position-fixed bottom-0 start-0 p-3">
            <div id="liveToast" class="shadow rounded toast" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <i class="fas fa-info-circle"></i>&nbsp;
                    <strong class="me-auto">Information</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body text-primary">
                    <c:out value="${errormsg}"/>
                </div>
            </div>
        </div>
        <script src="bootstrap-5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <script>

                // get node Error Message
                var nodeErrorMessage = document.getElementById("error-msg")
                const toastLiveExample = document.getElementById('liveToast')

                // event after the page is loaded perfectly
                window.onload = function () {
                    if (nodeErrorMessage.innerHTML !== "") {
                        // show the toast is ther is no error
                        console.log("Show the toast span")
                        const toast = new bootstrap.Toast(toastLiveExample)
                        toast.show();
                    } else {
                        console.log("dont show the toast")
                    }
                }

        </script>
        <!--    <div id="kaki2">
                <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
            </div>-->
    </body>
</html>
</html>