<%-- 
    Document   : header
    Created on : Apr 8, 2013, 5:43:20 PM
    Author     : VSI
--%>
<%@ page import="java.lang.System.*" %>
<%--<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.vensys.appcm.controller.SCNotification" %>
<%--<%@page import="java.io.FileInputStream" %>--%>
<%
// Security Headers
response.setHeader("X-XSS-Protection", "1; mode=block");
response.setHeader("X-Content-Type-Options", "nosniff");
response.setHeader("X-Frame-Options", "DENY");
response.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
response.setHeader("Content-Security-Policy",
            "default-src 'self'; "
            + "script-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net https://cdnjs.cloudflare.com; "
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <%@ page import="java.text.*,java.util.*" session="true"%>
    <%
        Date dNow = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("EEEE, yyyy-MM-dd");
        String tglsekarang = formatter.format(dNow);
    %>
    <title>clickMessenger | System</title>
    <link rel="shortcut icon" href="images/icon.png"/>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <meta name="description" content="CM" />
    <meta name="keywords" content="enter your keywords here" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <%@ include file="rule/validate_button.jsp" %>
    <link rel="stylesheet" href="css/notification-styles.css" type="text/css"/>

    <% if (session.getAttribute("flagStatus") == null) {%>

    <% } else { %>
    <% if (!session.getAttribute("flagStatus").equals("MOD")) {%>
    <script type="text/javascript" src="js/header1.js"></script>
    <% } %>    
    <% }%>
    
    <h1 class="logoAtas"><img class="homePage" src="images/flickr.com/cm.png"/><span>${hostname} (${appVersion})</span></h1>
    <font class="main-site"><u><%= tglsekarang%></u> <a href="#" class="adm"><% out.print((String) session.getAttribute("user_id"));%><img src="images/user.png" style="margin-bottom:-2px;" /></a> <a href="ServletControllerLogout" class="log">Logout <img src="images/logout.png" style="margin-bottom:-2px;" /></a> <br>
        <p class="last">Last Success Login: <% out.print((String) session.getAttribute("berhasillogin"));%><br>
            Last Failed Login: <% out.print((String) session.getAttribute("gagallogin"));%><br/>
            Transaction to VER: <a style="color:red"><% out.print((Integer) session.getAttribute("notifVer"));%></a>&nbsp; | &nbsp; Transaction to AUTH: <a style="color:red"><% out.print((Integer) session.getAttribute("notifAuth"));%></a></p>
    </font>
    <ul id="nav" class="dropdown dropdown-horizontal">
        <c:forEach var="item" items="${role}">
            <c:if test="${item == 'MENU:DASHBOARD'}">
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'DOT:LIST'}">
                                </c:if>
                            </c:forEach>
                            <c:forEach var="item" items="${role}">
                                <c:if test="${item == 'DOT:LIST'}">
                                </c:if>
                            </c:forEach>
            </c:if>
        </c:forEach>
        <c:forEach var="item" items="${role}">
            <c:if test="${item == 'MENU:MASTER'}">
                <li><span class="dir">Master</span>
                    <ul>
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'MEMBER_CODE:LIST'}">
                                </c:if>
                            </c:forEach>
                            <c:forEach var="item" items="${role}">
                                <c:if test="${item == 'FIAPATHCONF:LIST'}">
                                <li><a onclick="userTrackMenuClick('FIA Path Configuration')" href="SCFIAPathList">FIA Path Configuration</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="item" items="${role}">

                            <c:if test="${item == 'FIACONF:LIST'}">
                                <li><a onclick="userTrackMenuClick('FIA Configuration')" href="SCFIAList">FIA Configuration</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="item" items="${role}">
                        </c:forEach>
                    </ul>
                </li>
            </c:if>
        </c:forEach>
        <c:forEach var="item" items="${role}">
            <c:if test="${(item == 'USER:LIST')}">
                <li><span class="dir">Administrator</span>
                    <ul>
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'ROLE:LIST'}">
                                <li><a onclick="userTrackMenuClick('Role')" href="SCDataRoleList">Role</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="item" items="${role}">
                                <c:if test="${item == 'USER:LIST'}">
                                <li><a onclick="userTrackMenuClick('User')" href="SCDataUserList">User</a></li>
                                </c:if>
                            </c:forEach>
                    </ul>
                </li>
            </c:if>
        </c:forEach>
        <c:forEach var="item" items="${role}">
            <c:if test="${item == 'MENU:DUPLICATE'}">
                <li><span class="dir">Duplicate</span>
                    <ul>
                        <li><a onclick="userTrackMenuClick('Duplicate')" href="SCDuplicate">List Duplicate</a></li>
                        <c:forEach var="item" items="${role}">
                            <c:if test="${(item == 'FLOW:DUPL-CNF')}">
                                <li><a onclick="userTrackMenuClick('Duplicate Confirmation')" href="SCDuplicateCNF">Duplicate Confirmation</a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>  
            </c:if>
        </c:forEach>
        <c:forEach var="item" items="${role}">
            <c:if test="${item == 'MENU:REJECTED'}">
                <li><a onclick="userTrackMenuClick('Rejected')" href="SCReject">Rejected</a></li>
            </c:if>
        </c:forEach>
        <c:forEach var="item" items="${role}">
            <c:if test="${(item == 'FLOW:CREATE')}">
                <li><span class="dir">Create Message</span>
                    <ul>

                        <li><span class="dir">MT</span>
                            <ul>
                                <li><span class="dir">Message Category 1</span>
                                    <ul>                        
                                        <c:forEach var="item" items="${role}">
                                            <%--c:if test="${item == 'MT:101'}">
                                            <li><a href="mt101.jsp">101 - Request for Transfer</a></li>
                                            </c:if--%>
                                            <c:if test="${item == 'MT:103'}">
                                                <li><a onclick="userTrackMenuClick('103 - Single Customer Credit Transfer')" href="mt103.jsp?create=true">103 - Single Customer Credit Transfer</a></li>
                                                </c:if>
                                            <c:if test="${item == 'MT:110'}">
                                                <li><a onclick="userTrackMenuClick('110 - Advice of Cheque(s)')" href="mt110.jsp?create=true">110 - Advice of Cheque(s)</a></li>
                                            </c:if>
                                            <c:if test="${item == 'MT:111'}">
                                                <li><a onclick="userTrackMenuClick('111 - Request for Stop Payment of a Cheque')" href="mt111.jsp?create=true">111 - Request for Stop Payment of a Cheque</a></li>
                                            </c:if>
                                            <c:if test="${item == 'MT:191'}">
                                                <li><a onclick="userTrackMenuClick('191 - Request for Payment of Charges, Interest and Other Expenses')" href="mt191.jsp?create=true">191 - Request for Payment of Charges, Interest and Other Expenses</a></li>
                                            </c:if>
                                            <c:if test="${item == 'MT:192'}">
                                                <li><a onclick="userTrackMenuClick('192 - Request for Cancellation')" href="mt192.jsp?create=true">192 - Request for Cancellation</a></li>
                                            </c:if>
                                            <c:if test="${item == 'MT:199'}">
                                                <li><a onclick="userTrackMenuClick('199 - Free Format Message')" href="mt199.jsp?create=true">199 - Free Format Message</a></li>
                                            </c:if>
                                            <c:if test="${item == 'MT:199'}">
                                                <!--<li><a href="SCInvesitvationOutgoing103">199 - Free Format Message (From MT103 Outgoing)</a></li>-->
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </li>
                                <li><span class="dir">Message Category 2</span>
                                    <ul>
                                        <c:forEach var="item" items="${role}">
                                            <c:if test="${item == 'MT:200'}">
                                                <li><a onclick="userTrackMenuClick('200 - Financial Institution Transfer for its Own Account')" href="mt200.jsp?create=true">200 - Financial Institution Transfer for its Own Account</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MT:202'}">
                                                <li><a onclick="userTrackMenuClick('202 - General Financial Institution Transfer')" href="mt202.jsp?create=true">202 - General Financial Institution Transfer</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MT:210'}">
                                                <!--<li><a href="mt210.jsp?create=true">210 - Notice to Receive </a></li>-->
                                            </c:if>
                                            <c:if test="${item == 'MT:202COV'}">
                                                <li><a onclick="userTrackMenuClick('202 COV - General Financial Institution Transfer')" href="mt202COV.jsp?create=true">202 COV - General Financial Institution Transfer</a></li>
                                            </c:if>
                                            <c:if test="${item == 'MT:299'}">
                                                <li><a onclick="userTrackMenuClick('299 - Free Format Message')" href="mt299.jsp?create=true">299 - Free Format Message</a></li>
                                            </c:if>
                                            </c:forEach>
                                    </ul>
                                </li>
                                <!--                        <li><span class="dir">Message Category 4</span>
                                
                                                        </li>
                                                        <li><span class="dir">Message Category 5</span>
                                
                                                        </li>-->
                                <!-- <li><span class="dir">Message Category 7</span>
                                    <ul>                        
                                <c:forEach var="item" items="${role}">
                                    <c:if test="${item == 'MT:760'}">
                                        <li><a href="mt760.jsp">760 - Issue of a Demand Guarantee/Standby Guarantee/Standby Letter of Credit</a></li>
                                    </c:if>
                                    <c:if test="${item == 'MT:761'}">
                                        <li><a href="mt761.jsp">761 - Issue of a Demand Guarantee/Standby Letter of Credit</a></li>
                                    </c:if>
                                    <c:if test="${item == 'MT:767'}">
                                        <li><a href="mt767.jsp">767 - Amendment to a Demand Guarantee/Standby Guarantee/Standby Letter of Credit</a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </li> -->
                                <!--                                <li><span class="dir">Message Category 9</span>
                                                                    <ul>
                                <c:forEach var="item" items="${role}">
                                    <%-- <c:if test="${item == 'MT:910'}">
                                         <li><a href="mt910.jsp">910 - Confirmation of Credit</a></li>
                                         </c:if> --%>
                                    <c:if test="${item == 'MT:940'}">
                                        <li><a href="mt940.jsp?create=true">940 - Customer Statement Message</a></li>
                                    </c:if>
                                    <%-- <c:if test="${item == 'MT:942'}">
                                     <li><a href="mt942.jsp">942 - Interim Transaction Report</a></li>
                                     </c:if>--%>
                                    <c:if test="${item == 'MT:950'}">
                                    <li><a href="mt950.jsp?create=true">950 - Statement Message</a></li>
                                    </c:if>
                                    <%-- <c:if test="${item == 'MT:999'}">
                                     <li><a href="mt999.jsp">999 - Free Format Message</a></li>
                                     </c:if>--%>
                                </c:forEach>
                        </ul>
                    </li>-->
                            </ul>
                        </li>
                        <li><span class="dir">MX</span>
                            <ul>
                                <li><span class="dir">Payments Clearing and Settlement</span>
                                    <ul>
                                        <c:forEach var="item" items="${role}">
                                            <c:if test="${item == 'MX:pacs00400109'}">
                                                <li><a onclick="userTrackMenuClick('PACS.004.001.09 - Payment Return V09')" href="main_pacs004.jsp?create=true">PACS.004.001.09 - Payment Return V09</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:pacs00800108'}">
                                                <li><a onclick="userTrackMenuClick('PACS.008.001.08 - FI To FI Customer Credit Transfer V08')" href="main_pacs008.jsp?create=true">PACS.008.001.08 - FI To FI Customer Credit Transfer V08</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:pacs00900108'}">
                                                <li><a onclick="userTrackMenuClick('PACS.009.001.08 - Financial Institution Credit Transfer V08')" href="main_pacs009.jsp?create=true">PACS.009.001.08 - Financial Institution Credit Transfer V08</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:pacs00900108cov'}">
                                                <li><a onclick="userTrackMenuClick('PACS.009.001.08COV - Financial Institution Credit Transfer V08')" href="main_pacs009cov.jsp?create=true">PACS.009.001.08COV - Financial Institution Credit Transfer V08</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:pacs00900108adv'}">
                                                <li><a onclick="userTrackMenuClick('PACS.009.001.08ADV - Financial Institution Credit Transfer V08')" href="main_pacs009adv.jsp?create=true">PACS.009.001.08ADV - Financial Institution Credit Transfer V08</a></li>
                                                </c:if>
                                            </c:forEach>
                                    </ul>
                                </li>
<!--                                <li><span class="dir">Cash Management</span>
                                    <ul>
                                        <c:forEach var="item" items="${role}">
                                            <c:if test="${item == 'MX:camt05300108'}">
                                                <li><a onclick="userTrackMenuClick('CAMT.053.001.08 - Bank To Customer Statement V08')" href="main_camt053.jsp?create=true">CAMT.053.001.08 - Bank To Customer Statement V08</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:camt05500108'}">
                                                <li><a onclick="userTrackMenuClick('CAMT.055.001.08 - Customer Payment Cancellation Request V08')" href="main_camt055.jsp?create=true">CAMT.055.001.08 - Customer Payment Cancellation Request V08</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:camt05600108'}">
                                                <li><a onclick="userTrackMenuClick('CAMT.056.001.08 - FI To FI Payment Cancellation Request V08')" href="main_camt056.jsp?create=true">CAMT.056.001.08 - FI To FI Payment Cancellation Request V08</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:camt10600102'}">
                                                <li><a onclick="userTrackMenuClick('CAMT.106.001.02 - Charges Payment Request V17')" href="main_camt106.jsp?create=true">CAMT.106.001.02 - Charges Payment Request V17</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:camt10700101'}">
                                                <li><a onclick="userTrackMenuClick('CAMT.107.001.01 - Cheque Presentment Notification V01')" href="main_camt107.jsp?create=true">CAMT.107.001.01 - Cheque Presentment Notification V01</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:camt10800101'}">
                                                <li><a onclick="userTrackMenuClick('CAMT.108.001.01 - Cheque Cancellation Or Stop Request V01')" href="main_camt108.jsp?create=true">CAMT.108.001.01 - Cheque Cancellation Or Stop Request V01</a></li>
                                                </c:if>
                                            </c:forEach>
                                    </ul>
                                </li>-->
                            </ul>

                        </li>
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'FLOW:LTCREATE'}">
                                <li><a onclick="userTrackMenuClick('Template List')" href="ControllerHeaderTemplate">Template List</a></li>
                                </c:if>
                            </c:forEach>
                    </ul>
                </li>
            </c:if>
        </c:forEach>
        <c:forEach var="item" items="${role}">
            <c:if test="${item == 'MENU:LIST_TRANSACTIONS'}">
                <li><span class="dir">Process</span>
                    <ul>
                        <li><a onclick="userTrackMenuClick('Message List')" href="controllerHeaders">Message List</a></li>
                            <c:forEach var="item" items="${role}">
                                <c:if test="${(item == 'TYPE:OUTGOING_INCOMING') || (item == 'TYPE:INCOMING')}">
                                <li><span class="dir">Incoming</span>
                                    <ul>
                                        <c:forEach var="iteminc" items="${role}">
                                            <c:if test="${iteminc == 'FLOW:INC-TRX'}">
                                                <li><a onclick="userTrackMenuClick('Incoming Transaction')" href="controllerHeaders?io_type=O&flag=INC&menu=24">Incoming Transaction</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach var="iteminc" items="${role}">
                                                <c:if test="${iteminc == 'FLOW:INCM'}">
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-WAIT&menu=6">Incoming Wait</a></li>-->
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-NSTP&menu=17">Incoming NONSTP</a></li>-->
                                            </c:if>
                                            <c:if test="${iteminc == 'FLOW:INCS'}">
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-RSTL&menu=12">Incoming Re-Settle</a></li>-->
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-INV&menu=8">Incoming Investigation</a></li>-->
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-OK&menu=9">Incoming OK</a></li>-->
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-NOK&menu=10">Incoming Not OK</a></li>-->
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-ADJ&menu=19">Incoming Adjustment</a></li>-->
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-SPRT&menu=18">Incoming Special Rate</a></li>-->
                                                <!--                                                <li><a href="controllerHeaders?io_type=O&flag=INC-STL&menu=7">Incoming Settle</a></li>
                                                                                                <li><a href="controllerHeaders?io_type=O&flag=INC-RTR&menu=14">Incoming Retur</a></li>
                                                                                                <li><a href="controllerHeaders?io_type=O&flag=INC-STLHOLD&menu=20">Incoming Settle Hold</a></li>
                                                                                                <li><a href="controllerHeaders?io_type=O&flag=INC-STLHOLD-CNF&menu=12">Incoming Settle Hold Confirmation</a></li>-->

                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-NSTP&menu=17">Incoming Big Amount</a></li>-->
                                            </c:if>
                                            <c:if test="${iteminc == 'FLOW:INC-CVT'}">
                                                <li><a onclick="userTrackMenuClick('Incoming Convert')" href="controllerHeaders?io_type=O&flag=INC-CVT&menu=23">Incoming Convert</a></li>
                                                </c:if>
                                                <c:if test="${iteminc == 'FLOW:RESEND-CNF'}">
                                                <li><a onclick="userTrackMenuClick('Incoming Convert Confirmation')" href="controllerHeaders?io_type=O&flag=RESEND-CNF&menu=25">Incoming Convert Confirmation</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach var="iteminc" items="${role}">
                                                <c:if test="${iteminc == 'FLOW:INC-AML'}">
                                                <li><a onclick="userTrackMenuClick('Incoming Reject AML')" href="controllerHeaders?io_type=O&flag=WAITING-AML&menu=26">Incoming Reject AML</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach var="iteminc" items="${role}">
                                                <c:if test="${iteminc == 'FLOW:AML-TERMINATE-IN'}">
                                                <li><a onclick="userTrackMenuClick('Incoming Reject AML Confirmation')" href="controllerHeaders?io_type=O&flag=AML-TERMINATE-IN&menu=27">Incoming Reject AML Confirmation</a></li>
                                                </c:if>
                                                <c:if test="${iteminc == 'FLOW:INC-AML-FAILED'}">
                                                <li><a onclick="userTrackMenuClick('Incoming Resend to AML')" href="controllerHeaders?io_type=O&flag=INC-AML-FAILED&menu=28">Incoming Resend to AML</a></li>
                                                </c:if>
                                                <c:if test="${iteminc == 'FLOW:INC-AML-FAILED-CNF'}">
                                                <li><a onclick="userTrackMenuClick('Incoming Resend to AML Confirmation')" href="controllerHeaders?io_type=O&flag=INC-AML-FAILED-CNF&menu=29">Incoming Resend to AML Confirmation</a></li>
                                                </c:if>
                                                <c:if test="${iteminc == 'FLOW:UNSETTLE-INC'}">
                                                <li><a onclick="userTrackMenuClick('Incoming Resend to Channel')" href="controllerHeaders?io_type=O&flag=UNSETTLE-INC&menu=30">Incoming Resend to Channel</a></li>
                                                </c:if>
                                                <c:if test="${iteminc == 'FLOW:INC-RESEND-CNF'}">
                                                <li><a onclick="userTrackMenuClick('Incoming Resend to Channel Confirmation')" href="controllerHeaders?io_type=O&flag=INC-RESEND-CNF&menu=31">Incoming Resend to Channel Confirmation</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach var="iteminc" items="${role}">
                                                <c:if test="${iteminc == 'FLOW:INC-REJECT-CNF'}">
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-REJECT-CNF&menu=26">Incoming Reject Confirmation</a></li>-->
                                            </c:if>
                                            <c:if test="${iteminc == 'FLOW:Un-Settle'}">
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=Un-Settle&menu=28">Incoming Un Settle</a></li>-->
                                            </c:if>
                                            <c:if test="${iteminc == 'FLOW:SETTLE'}">
                                                <li><a onclick="userTrackMenuClick('Incoming Settle')" href="controllerHeaders?io_type=O&flag=SETTLE&menu=32">Incoming Settle</a></li>
                                                </c:if>
                                            </c:forEach>
                                        <!--<li><a href="controllerHeaders?io_type=O&flag=INC-INV&menu=8">Incoming Investigation</a></li>-->
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${(item == 'TYPE:OUTGOING_INCOMING') || (item == 'TYPE:OUTGOING')}">
                                <li><span class="dir">Outgoing</span>
                                    <ul>
                                        <c:forEach var="item" items="${role}">
                                            <c:if test="${item == 'FLOW:MOD'}">
                                                <li><a onclick="userTrackMenuClick('Modification')" href="controllerHeaders?io_type=I&flag=MOD&menu=1">Modification</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:VER'}">
                                                <li><a onclick="userTrackMenuClick('Verification')" href="controllerHeaders?io_type=I&flag=VER&menu=2">Verification</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:AUTH'}">
                                                <li><a onclick="userTrackMenuClick('Authorize')" href="controllerHeaders?io_type=I&flag=AUTH&menu=3">Authorize</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach var="item" items="${role}">
                                                <c:if test="${item == 'FLOW:FIA-FAILED'}">
                                                <li><a onclick="userTrackMenuClick('Failed to Send to FIA')" href="controllerHeaders?io_type=I&flag=FIA-FAILED&menu=38">Failed to Send to FIA</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:FIA-FAILED-CNF'}">
                                                <li><a onclick="userTrackMenuClick('Failed to Send to FIA Confirmation')" href="controllerHeaders?io_type=I&flag=FIA-FAILED-CNF&menu=39">Failed to Send to FIA Confirmation</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach var="item" items="${role}">
                                                <c:if test="${item == 'FLOW:UNSETTLE-OUT'}">
                                                <li><a onclick="userTrackMenuClick('Failed to Send to SAA')" href="controllerHeaders?io_type=I&flag=UNSETTLE-OUT&menu=33">Failed to Send to SAA</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:WAITING-SAA-CNF'}">
                                                <li><a onclick="userTrackMenuClick('Failed to Send to SAA Confirmation')" href="controllerHeaders?io_type=I&flag=WAITING-SAA-CNF&menu=34">Failed to Send to SAA Confirmation</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach var="item" items="${role}">
                                                <c:if test="${item == 'FLOW:WAITING-AML'}">
                                                <li><a onclick="userTrackMenuClick('Reject AML')" href="controllerHeaders?io_type=I&flag=WAITING-AML&menu=22">Reject AML</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach var="item" items="${role}">
                                                <c:if test="${item == 'FLOW:AML-TERMINATE-OUT'}">
                                                <li><a onclick="userTrackMenuClick('Reject AML Confirmation')" href="controllerHeaders?io_type=I&flag=AML-TERMINATE-OUT&menu=35">Reject AML Confirmation</a></li>
                                                </c:if>
                                            </c:forEach>  
                                            <c:forEach var="item" items="${role}">
                                                <c:if test="${item == 'FLOW:AML-FAILED'}">
                                                <li><a onclick="userTrackMenuClick('Failed to Send to AML')" href="controllerHeaders?io_type=I&flag=AML-FAILED&menu=36">Failed to Send to AML</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:AML-FAILED-CNF'}">
                                                <li><a onclick="userTrackMenuClick('Failed to Send to AML Confirmation')" href="controllerHeaders?io_type=I&flag=AML-FAILED-CNF&menu=37">Failed to Send to AML Confirmation</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach var="item" items="${role}">
                                                <c:if test="${item == 'FLOW:CVT-MOD'}">
                                                <li><a onclick="userTrackMenuClick('Modify Convert')" href="controllerHeaders?io_type=I&flag=CVT-MOD&menu=20">Modify Convert</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:CVT-VER'}">
                                                <li><a onclick="userTrackMenuClick('Verify Convert')" href="controllerHeaders?io_type=I&flag=CVT-VER&menu=21">Verify Convert</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:ACK'}">
                                                <li><a onclick="userTrackMenuClick('ACK')" href="controllerHeaders?io_type=I&flag=ACK&menu=13">ACK</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:NACK'}">
                                                <li><a onclick="userTrackMenuClick('NACK')" href="controllerHeaders?io_type=I&flag=NACK&menu=5">NACK</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:ERR'}">
                                                <!--<li><a href="controllerHeaders?io_type=I&flag=ERR&menu=16">Error</a></li>-->
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${(item == 'MENU:UPLOADSTMT')}">
                                <li><a onclick="userTrackMenuClick('Upload MT950')" href="upload_stmt.jsp">Upload MT950</a></li>
                                </c:if>
                            </c:forEach>
                    </ul>
                </li>
            </c:if>
            <c:if test="${(item == 'MENU:REPORTING')}">
                <li><span class="dir">Reporting</span>
                    <ul>
                        <li><a onclick="userTrackMenuClick('Transaction')" href="Report_print.jsp">Transaction</a></li>
                        <!--<li><a href="role_report.jsp">Role</a></li>-->
                        <li><a onclick="userTrackMenuClick('User')" href="user_report.jsp">User</a></li>
                        <li><a onclick="userTrackMenuClick('Audit Trail User')" href="user_activity_report.jsp">Audit Trail User</a></li>
                        <li><a onclick="userTrackMenuClick('Audit Trail Transaction')" href="audit_trail_report.jsp">Audit Trail Transaction</a></li>
                        <!--<li><a href="user_login_report.jsp">User Login</a></li>-->
                        <!--<li><a href="SCNostroListReconcile">Recon</a></li>-->
                    </ul>
                </li>
            </c:if>
            <c:if test="${(item == 'MENU:HOUSEKEEPING')}">
                <li><span class="dir">House Keeping</span>
                    <ul>
                        <li><a onclick="userTrackMenuClick('Archive')" href="SCArchive">Archive</a></li>
                        <li><a onclick="userTrackMenuClick('Restore')" href="SCRestore">Restore</a></li>
                    </ul>
                </li>
            </c:if>
            <c:if test="${item == 'MENU:CONTACT'}">
                <li><a onclick="userTrackMenuClick('Contact Us')" href="contact.jsp">Contact Us</a></li>
            </c:if>
            </c:forEach>
            <c:if test="${sessionScope.role_id == '1'}">
                <li><a onclick="userTrackMenuClick('Workflow Logs')" href="SCWorkflowLogs">Workflow Logs</a></li>
            </c:if> 
                <!--Notifications-->
<!--        <div onclick="openModal()" class="notif-container" style="float: right;">
            <span onclick="userTrackMenuClick('Notifications')" class="link-notif">Notif</span>
            <span id="notifCount" class="notif-badge"></span>
        </div>-->
    </ul>
    <body style="clear: both;">
        <c:if test="${empty sessionScope.user_id}">
            <script type="text/javascript" src="js/header2.js"></script>
        </c:if>

        <c:choose>
            <c:when test="${not empty sessionScope.duplicateLoginMessage}">
<!--                <script type="text/javascript">
                    alert('Your account has been logged in from another device. Please log in again.');
                    window.location.href = 'login.jsp';
                </script>-->
                <c:remove var="duplicateLoginMessage" scope="session"/>
            </c:when>
            <c:when test="${empty sessionScope.user_id}">
<!--                <script type="text/javascript">
                    alert('Your session has expired, please log in again!');
                    window.location.href = 'login.jsp';
                </script>-->
            </c:when>
        </c:choose>

        
        
        <input type="hidden" id="timeout" name="timeout" value="<% out.print(session.getAttribute("timeout"));%>"/>
        <!--<input type="hidden" id="timeout" name="timeout" value="300000"/>-->
        <script type="text/javascript" src="js/header3.js"></script>
        
        

        <!-- Modal Notifikasi -->
<!--        <div id="notifModal" class="modal-notif" onclick="outsideClick(event)">
            <div class="modal-notif-content">
                <span class="close-modal" onclick="closeModal()">&times;</span>
                <h3>Notifications</h3>

                <div id="notifLists" style="overflow: scroll; height: 450px; max-height: 450px;">
                    <table id="tableList" class="tbl-notif">
                        <thead class="tbl-head-notif">
                            <tr class="bg-gray-200">
                                <th class="tbl-th-notif" style="width:10px; cursor:pointer;"><input type="checkbox" id="checkAll" onclick="toggleAllCheckboxes()"></th>
                                <th class="tbl-th-notif">title</th>
                                <th class="tbl-th-notif">message</th>
                                <th class="tbl-th-notif">Dates</th>
                            </tr>
                        </thead>
                        <tbody id="notifList" class="tbl-body-notif">
                        </tbody>
                    </table>
                    <div id="loadingNotif" style="text-align: center; display: none; color:blue !important; padding: 5px;">Loading...</div>

                     Detail Pesan 
                    <div id="notifDetail" style="display: none;">
                        <h3>Detail Pesan</h3>
                        <div id="detailContent" style="overflow: scroll; height: 365px; max-height: 365px; padding:2px;"></div>
                        <button class="back-btn-detail" onclick="backToList()">Kembali</button>
                    </div>
                </div>


                <div class="p-4 text-center border-t" style="padding: 7px 4px 4px 4px;">
                    <input type="button" onclick="markAsRead()" name="submit_mt" id="btn-read" value="Read" class="px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600" />
                    <button onclick="markAsRead()" id="btn-read" class="px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600">Tandai Sudah Dibaca</button>
                </div>
            </div>
        </div>-->


        <%--<%@ include file="NotificationControl.jsp" %>--%>

        <script type="text/javascript" src="js/header4.js"></script>

    </body>