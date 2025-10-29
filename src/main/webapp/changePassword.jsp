<%--<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
 <%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%> 
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*" session="true"%>
<%!
    Calendar calendar = Calendar.getInstance();
    java.sql.Timestamp ourJavaTimestampObject = new java.sql.Timestamp(calendar.getTime().getTime());
    SimpleDateFormat formatter = new SimpleDateFormat("EEEE, d MMMM yyyy");
    String tglsekarang = formatter.format(ourJavaTimestampObject);
%>
<%
     String isalfaspecial =(String) session.getAttribute("isalfaspecial");
%>
<html>
    <head>
        <title>clickMessenger | Change Password</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icon.png"/>
        <meta name="description" content="RTGS - BI #2" />
        <meta name="keywords" content="enter your keywords here" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
        <script type="text/javascript" language="javascript">
            function setFocus() {
                document.getElementById("oldPassword").focus();
            }
        </script>
        <script type="text/javascript" language="javascript">
            function passwordChanged() {
                document.getElementById("Change").disabled = true;
                //form.Change.desabled = true;
                var strength = document.getElementById('strength');
                var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
                var mediumRegex = new RegExp("^(?=.{8,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
                var enoughRegex = new RegExp("(?=.{8,}).*", "g");
                var pwd = document.getElementById("newPassword");
                if (pwd.value.length == 0) {
                    strength.innerHTML = '';
                } else if (false == enoughRegex.test(pwd.value)) {
                    strength.innerHTML = 'More Characters';
                    document.getElementById("Change").disabled = true;
                } else if (strongRegex.test(pwd.value)) {
                    strength.innerHTML = '<span style="font-weight:bold;color:green">Strong!</span>';
                    document.getElementById("Change").disabled = false;
                } else if (mediumRegex.test(pwd.value)) {
                    strength.innerHTML = '<span style="color:orange">Medium!</span>';
                    document.getElementById("Change").disabled = true;
                } else {
                    strength.innerHTML = '<span style="color:red">Weak!</span>';
                    document.getElementById("Change").disabled = true;
                }
            }
        </script> 
        <script type="text/javascript" src="js/js.js"></script>
    </head>
    <body class="cm">
        <font class="main-sitelog"><u><%= tglsekarang%></u> | After password changed, login page will appear</font>
        <h1 class="logoAtas"><img class="loginPage" src="images/flickr.com/cmmizuho.png"/></h1>
        <div id="frmmidle" style="padding-bottom: 50px;">
            <div id="frmlog"><!--<img src="images/bsm.jpg"> <div id="moto"><b>Click Messenger Application</b> <br> for RTGS Gen 2</div>-->
                <form name="frmLogin" method="POST" action="ServletControllerChangeUserData">
                    <p>Old Password</p>
                    <input type="password" name="oldPassword" id="oldPassword" autofocus="true"><br><br>
                    <p>New Password</p>
                    <input type="password" name="newPassword" oninput="passwordChanged()" id="newPassword" required <c:if test="${isalfaspecial == 1}">onkeypress="return passwordChanged();</c:if>
                if (this.checkValidity())
                    form.retypePassword.pattern = this.value;
                           "><br><br>
                        <p><span id="strength" style="font-size: 10px; padding-right: 37px"></span></p><br/>
                        <p>Re-type New Password</p>
                        <input type="password" name="retypePassword" id="retypePassword" /><br>
                        <br>
                        <pre style="font-size: 10px ;">Password policy :
Length Minimum 8 Char (alphanumeric)
Contain Minimum :
1 Capital Letter
1 Non Capital Letter
1 Numerical
1 Special Char</pre><br>
                        <div id="button">
                            <p><input id="Change" type="submit" value="Submit" /> &nbsp;&nbsp;
                                <!--                    <input type="button" name="back" value="Back" onclick="back();">-->
                                <a style="cursor: pointer;" onclick="window.history.back();" class="log">Cancel</a></p>
                        </div>
                        <div id="message">
                            <span class="style1"><div align="center"><c:out value="${errorMsg}"/></div></span>
                    </div>
                </form>
            </div>
        </div>
        <!--    <div id="kaki3">
                <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
            </div>-->
    </body>
</html>