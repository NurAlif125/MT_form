<!-- 
    Document   : home
    Created on : Nov 22, 2018, 10:53:13 AM
    Author     : admin.gtframe
-->

<%@ include file="header.jsp" %>
<%
    int timeout = 300;
    if (session.getAttribute("timeout") != null) {
        timeout = Integer.parseInt(session.getAttribute("timeout").toString());
    }

    response.setHeader("Cache-Control", "private, must-revalidate, max-age=" + timeout);
    response.setHeader("Pragma", ""); 
    response.setDateHeader("Expires", System.currentTimeMillis() + (timeout * 1000));
%>

<%
    String cspNonceHome = (request.getAttribute("cspNonce") != null) 
        ? (String) request.getAttribute("cspNonce") 
        : "tHeQTZaKLMY=";
%>

<style nonce="<%= cspNonceHome %>">
    #tr-txt {
        background-color: #28787c;
    }
    #td-txt {
        border:2px solid #28787c;
    } 
    #txt-notif {
        color:whitesmoke;
    }
    .notification h3 a {
        color: red;
    }
    #td-row2 {
        border:2px solid #28787c;
    }
</style>

<div id="isi">
    <div class="welcome">
        <h1>Welcome to Click Messenger</h1>
        <table class="notification">
            <tr id="tr-txt" ><td id="td-txt" ><a id="txt-notif"><h2>Notification</h2></a></td></tr>
            <tr><td id="td-row2">
        <% int jmlVer = ((Integer) session.getAttribute("notifVer"));
            if (jmlVer <= 1) {
        %>
        <h3>You have <a href="controllerHeaders?io_type=I&flag=MOD&menu=1"><% out.print((Integer) session.getAttribute("notifVer"));%></a> transaction to Verify.</h3><br/>
        <%
        } else {
        %>
        <h3>You have <a href="controllerHeaders?io_type=I&flag=MOD&menu=1"><% out.print((Integer) session.getAttribute("notifVer"));%></a> transactions to Verify.</h3><br/>
        <%
            }
            int jmlAuth = ((Integer) session.getAttribute("notifAuth"));
            if (jmlAuth <= 1) {
        %>
        <h3>You have <a href="controllerHeaders?io_type=I&flag=VER&menu=2"><% out.print((Integer) session.getAttribute("notifAuth"));%></a> transaction to Authorize.</h3><br/>
        <%
        } else {
        %>
        <h3>You have <a href="controllerHeaders?io_type=I&flag=VER&menu=2"><% out.print((Integer) session.getAttribute("notifAuth"));%></a> transactions to Authorize.</h3><br/>
        <%
            }
        %>
            </td></tr>
        </table>
    </div>
</div>