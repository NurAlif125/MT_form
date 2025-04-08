<%-- 
    Document   : header
    Created on : Apr 8, 2013, 5:43:20 PM
    Author     : VSI
--%>
<%@ page import="java.lang.System.*" %>
<%--<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.vensys.appcm.controller.SCNotification" %>
<%--<%@page import="java.io.FileInputStream" %>--%>
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
    <%--    <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
        <script type="text/javascript">
            $(window).load(function () {
                $('#slider').nivoSlider();
            });
        </script>--%>

    <%--
        String user_id = (String) session.getAttribute("user_id");
        if (user_id == null || user_id.equals("")) {
            response.sendRedirect("login.jsp");
        }
    --%>

    <!--readonly all form when flag is not MOD-->
    <% if (session.getAttribute("flagStatus") == null) {%>

    <% } else { %>
    <% if (!session.getAttribute("flagStatus").equals("MOD")) {%>
    <script type="text/javascript">
//        $('#form1').attr('readonly', 'readonly');
        $('#form1 input').attr('readonly', 'readonly');
//        console.log("kadieuuu header.jsp");
    </script>
    <% } %>    
    <% }%>

    <!-- Header -->
    <!--20210405 ditambah host dan appversion-->
    <h1 class="logoAtas"><img class="homePage" src="images/flickr.com/cm.png"/><span>${hostname} (${appVersion})</span></h1>
    <font class="main-site"><u><%= tglsekarang%></u> <a href="changePassword.jsp" class="adm"><% out.print((String) session.getAttribute("user_id"));%><img src="images/user.png" style="margin-bottom:-2px;" /></a> <a href="ServletControllerLogout" class="log">Logout <img src="images/logout.png" style="margin-bottom:-2px;" /></a> <br>
        <p class="last">Last Success Login: <% out.print((String) session.getAttribute("berhasillogin"));%><br>
            Last Failed Login: <% out.print((String) session.getAttribute("gagallogin"));%><br/>
            Transaction to VER: <a style="color:red"><% out.print((Integer) session.getAttribute("notifVer"));%></a>&nbsp; | &nbsp; Transaction to AUTH: <a style="color:red"><% out.print((Integer) session.getAttribute("notifAuth"));%></a></p>
    </font>
    <ul id="nav" class="dropdown dropdown-horizontal">
        <c:forEach var="item" items="${role}">
            <c:if test="${item == 'MENU:DASHBOARD'}">
                <li><span class="dir">Dash Board</span>
                    <ul>
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'DOT:LIST'}">
                                <li><a href="DashBoard.jsp">Daily Outgoing Transactions</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="item" items="${role}">
                                <c:if test="${item == 'DOT:LIST'}">
                                <li><a href="SCDashBoardTransactions?io_type=O">Summary Incoming</a></li>
                                </c:if>
                            </c:forEach>

                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'DOT:LIST'}">
                                <li><a href="SCDashBoardTransactions?io_type=I">Summary Outgoing</a></li>
                                </c:if>
                            </c:forEach>
                            <%--c:forEach var="item" items="${role}">
                                <c:if test="${item == 'DT:LIST'}">
                                <li><a href="DailyTransactions.jsp">Daily Transactions</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="item" items="${role}">
                                <c:if test="${item == 'YT:LIST'}">
                                <li><a href="YearlyTransactions.jsp">Yearly Transactions</a></li>
                                </c:if>
                            </c:forEach--%>
                    </ul>
                </li>
            </c:if>
        </c:forEach>
        <c:forEach var="item" items="${role}">
            <c:if test="${item == 'MENU:MASTER'}">
                <li><span class="dir">Master</span>
                    <ul>
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'MEMBER_CODE:LIST'}">
                                <li><a href="SCBICList">BIC</a></li>
                                </c:if>
                            </c:forEach>
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'BIC_GO:LIST'}">
                                <li><a href="SCDataBICGoList">Swift Go BIC</a></li>
                            </c:if>
                        </c:forEach>
                        <!-- <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'S_LIMIT:LIST'}">
                                <li><a href="SCDataSwiftLimitList">Swift Go Limit</a></li>
                            </c:if>
                        </c:forEach>     -->
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'MT_QUEUE:LIST'}">
                                <li><a href="SCDataMTList">Message Queue</a></li>
                            </c:if>
                        </c:forEach>
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'FIACONF:LIST'}">
                                <li><a href="SCFIAList">FIA Configuration</a></li>
                            </c:if>
                        </c:forEach>
                        <!-- <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'ACCP:LIST'}">
                                <li><a href="SCDataAccPenagihanList">Account Penagihan</a></li>
                            </c:if>
                        </c:forEach> -->
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'NOSTRO:LIST'}">
                                <li><a href="SCDataNostroList">Nostro</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="item" items="${role}">
                                <c:if test="${item == 'ACCV:LIST'}">
                                <li><a href="SCDataVerAccList">Verified Account</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="item" items="${role}">
                                <c:if test="${item == 'CTY:LIST'}">
                                <li><a href="SCNegaraSuspectList">Country Suspect</a></li>
                                </c:if>
                            </c:forEach>

                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'COT:VIEW'}">
                                <li><a href="SCDataCutOffList">Cut Of Time</a></li>
                                <!--<li><a href="SCCutOfTime">Cut Of Time</a></li>-->
                            </c:if>
                        </c:forEach>
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'CTR:LIST'}">
                                <li><a href="CounterRateList">Counter Rate</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="item" items="${role}">
                                <c:if test="${item == 'GS:VIEW'}">
                                <li><a href="SCGeneralSetting">General Setting</a></li>
                                </c:if>
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
                                <li><a href="SCDataRoleList">Role</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="item" items="${role}">
                                <c:if test="${item == 'USER:LIST'}">
                                <li><a href="SCDataUserList">User</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="item" items="${role}">
                                <c:if test="${item == 'STP_LIMIT:LIST'}">
                                <li><a href="SCSTPLimitList">STP Limit</a></li>
                                </c:if>
                            </c:forEach>
                            <%--<c:forEach var="item" items="${role}">
                                <c:if test="${item == 'UPLOAD_GO:LIST'}">
                                <li><a href="SCUploadSwiftGoList">Upload Member Swift Go</a></li>
                                </c:if>
                            </c:forEach>--%>

                    </ul>
                </li>
            </c:if>
        </c:forEach>
        <c:forEach var="item" items="${role}">
            <c:if test="${item == 'MENU:DUPLICATE'}">
                <li><a href="SCDuplicate">Duplicate</a></li>
                <li><a href="SCReject">Rejected</a></li>
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
                                            <%-- <c:if test="${item == 'MT:191'}">
                                                 <li><a href="mt191.jsp">191 - Request for Payment of Charges, Interest and Other Expenses</a></li>
                                                 </c:if>--%>
                                            <c:if test="${item == 'MT:103'}">
                                                <li><a href="mt103.jsp?create=true">103 - Single Customer Credit Transfer</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MT:199'}">
                                                <li><a href="mt199.jsp?create=true">199 - Free Format Message</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MT:199'}">
                                                <li><a href="SCInvesitvationOutgoing103">199 - Free Format Message (From MT103 Outgoing)</a></li>
                                                </c:if>
                                            </c:forEach>
                                    </ul>
                                </li>
                                <li><span class="dir">Message Category 2</span>
                                    <ul>
                                        <c:forEach var="item" items="${role}">
                                            <c:if test="${item == 'MT:200'}">
                                                <li><a href="mt200.jsp?create=true">200 - Financial Institution Transfer for its Own Account</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MT:202'}">
                                                <li><a href="mt202.jsp?create=true">202 - General Financial Institution Transfer</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MT:210'}">
                                                <li><a href="mt210.jsp?create=true">210 - Notice to Receive </a></li>
                                                </c:if>
                                                <%-- <c:if test="${item == 'MT:202COV'}">
                                                 <li><a href="mt202COV.jsp">202 COV - General Financial Institution Transfer</a></li>
                                                 </c:if> --%>
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
                                <li><span class="dir">Message Category 9</span>
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
                                </li>
                            </ul>
                        </li>
                        <li><span class="dir">MX</span>
                            <ul>
                                <li><span class="dir">Payments Clearing and Settlement</span>
                                    <ul>
                                        <c:forEach var="item" items="${role}">
                                            <c:if test="${item == 'MX:pacs00400109'}">
                                                <li><a href="main_pacs004.jsp">PACS.004.001.09 - Payment Return V09</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:pacs00800108'}">
                                                <li><a href="main_pacs008.jsp">PACS.008.001.08 - FI To FI Customer Credit Transfer V08</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:pacs00900108'}">
                                                <li><a href="main_pacs009.jsp">PACS.009.001.08 - Financial Institution Credit Transfer V08</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:pacs00900108cov'}">
                                                <li><a href="main_pacs009cov.jsp">PACS.009.001.08COV - Financial Institution Credit Transfer V08</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:pacs00900108adv'}">
                                                <li><a href="main_pacs009adv.jsp">PACS.009.001.08ADV - Financial Institution Credit Transfer V08</a></li>
                                                </c:if>
                                            </c:forEach>
                                    </ul>
                                </li>
                                <li><span class="dir">Cash Management</span>
                                    <ul>
                                        <c:forEach var="item" items="${role}">
                                            <c:if test="${item == 'MX:camt05300108'}">
                                                <li><a href="main_camt053.jsp">CAMT.053.001.08 - Bank To Customer Statement V08</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:camt05500108'}">
                                                <li><a href="main_camt055.jsp">CAMT.055.001.08 - Customer Payment Cancellation Request V08</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:camt05600108'}">
                                                <li><a href="main_camt056.jsp">CAMT.056.001.08 - FI To FI Payment Cancellation Request V08</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:camt10700101'}">
                                                <li><a href="main_camt107.jsp">CAMT.107.001.01 - Cheque Presentment Notification V01</a></li>
                                                </c:if>
                                                <c:if test="${item == 'MX:camt10800101'}">
                                                <li><a href="main_camt108.jsp">CAMT.108.001.01 - Cheque Cancellation Or Stop Request V01</a></li>
                                                </c:if>
                                            </c:forEach>
                                    </ul>
                                </li>
                            </ul>

                        </li>
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'FLOW:LTCREATE'}">
                                <li><a href="ControllerHeaderTemplate">Template List</a></li>
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
                        <li><a href="controllerHeaders">Message List</a></li>
                            <c:forEach var="item" items="${role}">
                                <c:if test="${(item == 'TYPE:OUTGOING_INCOMING') || (item == 'TYPE:INCOMING')}">
                                <li><span class="dir">Incoming</span>
                                    <ul>
                                        <li><a href="controllerHeaders?io_type=O&flag=INC-HOLD&menu=11">Incoming Hold</a></li>
                                            <c:forEach var="iteminc" items="${role}">
                                                <c:if test="${iteminc == 'FLOW:INCM'}">
                                                <li><a href="controllerHeaders?io_type=O&flag=INC-WAIT&menu=6">Incoming Wait</a></li>
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-NSTP&menu=17">Incoming NONSTP</a></li>-->
                                            </c:if>
                                            <c:if test="${iteminc == 'FLOW:INCS'}">
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-RSTL&menu=12">Incoming Re-Settle</a></li>-->
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-INV&menu=8">Incoming Investigation</a></li>-->
                                                <li><a href="controllerHeaders?io_type=O&flag=INC-OK&menu=9">Incoming OK</a></li>
                                                <li><a href="controllerHeaders?io_type=O&flag=INC-NOK&menu=10">Incoming Not OK</a></li>
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-ADJ&menu=19">Incoming Adjustment</a></li>-->
                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-SPRT&menu=18">Incoming Special Rate</a></li>-->
                                                <li><a href="controllerHeaders?io_type=O&flag=INC-STL&menu=7">Incoming Settle</a></li>
                                                <li><a href="controllerHeaders?io_type=O&flag=INC-RTR&menu=14">Incoming Retur</a></li>
                                                <li><a href="controllerHeaders?io_type=O&flag=INC-STLHOLD&menu=20">Incoming Settle Hold</a></li>
                                                <li><a href="controllerHeaders?io_type=O&flag=INC-STLHOLD-CNF&menu=12">Incoming Settle Hold Confirmation</a></li>


                                                <!--<li><a href="controllerHeaders?io_type=O&flag=INC-NSTP&menu=17">Incoming Big Amount</a></li>-->
                                            </c:if>
                                            <c:if test="${iteminc == 'FLOW:CVT-INC'}">
                                                <li><a href="controllerHeaders?io_type=O&flag=CVT-INC&menu=23">Incoming Convert</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <li><a href="controllerHeaders?io_type=O&flag=INC-INV&menu=8">Incoming Investigation</a></li>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${(item == 'TYPE:OUTGOING_INCOMING') || (item == 'TYPE:OUTGOING')}">
                                <li><span class="dir">Outgoing</span>
                                    <ul>
                                        <c:forEach var="item" items="${role}">
                                            <c:if test="${item == 'FLOW:MOD'}">
                                                <li><a href="controllerHeaders?io_type=I&flag=MOD&menu=1">Modification</a></li>
                                                </c:if>

                                            <c:if test="${item == 'FLOW:OUT-MOD-AML'}">
                                                <li><a href="controllerHeaders?io_type=I&flag=OUT-MOD-AML&menu=xx">FTI Modification AML</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:OUT-MOD-RMA'}">
                                                <li><a href="controllerHeaders?io_type=I&flag=OUT-MOD-RMA&menu=xx">FTI Modification RMA</a></li>
                                                </c:if>


                                            <c:if test="${item == 'FLOW:VER'}">
                                                <li><a href="controllerHeaders?io_type=I&flag=VER&menu=2">Verification</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:AUTH'}">
                                                <li><a href="controllerHeaders?io_type=I&flag=AUTH&menu=3">Authorization</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:CVT-MOD'}">
                                                <li><a href="controllerHeaders?io_type=I&flag=CVT-MOD&menu=20">Modify Convert</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:CVT-VER'}">
                                                <li><a href="controllerHeaders?io_type=I&flag=CVT-VER&menu=21">Verify Convert</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:WAITING-AML'}">
                                                <li><a href="controllerHeaders?io_type=I&flag=WAITING-AML&menu=22">Waiting AML</a></li>
                                                </c:if>
                                                <%--<c:if test="${item == 'FLOW:TEXT'}">--%>
                                            <!--<li><a href="controllerHeaders?io_type=I&flag=TEXT&menu=4">Text Generation</a></li>-->
                                            <%--</c:if>--%>
                                            <c:if test="${item == 'FLOW:ACK'}">
                                                <li><a href="controllerHeaders?io_type=I&flag=ACK&menu=13">ACK</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:NACK'}">
                                                <li><a href="controllerHeaders?io_type=I&flag=NACK&menu=5">NACK</a></li>
                                                </c:if>
                                                <c:if test="${item == 'FLOW:ERR'}">
                                                <li><a href="controllerHeaders?io_type=I&flag=ERR&menu=16">Error</a></li>
                                                </c:if>
                                            </c:forEach>
                                    </ul>
                                </li>
                            </c:if>
                            <%--c:if test="${(item == 'MENU:UPLOADCNF')}">
                                <li><a href="upload_confirmation.jsp">Upload Confirmation</a></li>
                                <li><a href="upload_branch.jsp">Upload Branch Outgoing</a></li>
                            </c:if--%>
                            <!--20230718 tambah menu-->
                            <c:if test="${(item == 'MENU:UPLOADSTMT')}">
                                <li><a href="upload_stmt.jsp">Upload MT950</a></li>
                                </c:if>
                            </c:forEach>
                    </ul>
                </li>
            </c:if>
            <c:if test="${(item == 'MENU:REPORTING')}">
                <li><span class="dir">Reporting</span>
                    <ul>
                        <li><a href="Report_print.jsp">Transaction</a></li>
                        <!--<li><a href="role_report.jsp">Role</a></li>-->
                        <li><a href="user_report.jsp">User</a></li>
                        <li><a href="user_activity_report.jsp">User Activity</a></li>
                        <li><a href="user_login_report.jsp">User Login</a></li>
                        <li><a href="SCNostroListReconcile">Recon</a></li>
                    </ul>
                </li>
            </c:if>
            <c:if test="${(item == 'MENU:HOUSEKEEPING')}">
                <li><span class="dir">House Keeping</span>
                    <ul>
                        <li><a href="SCArchive">Archive</a></li>
                        <li><a href="SCRestore">Restore</a></li>
                    </ul>
                </li>
            </c:if>
            <c:if test="${item == 'MENU:CONTACT'}">
                <li><a href="contact.jsp">Contact Us</a></li>
                </c:if>
            </c:forEach>
                
                <div onclick="openModal()" class="notif-container" style="float: right;">
                    <span class="link-notif">Notif</span>
                    <span id="notifCount" class="notif-badge"></span>
                </div>
    </ul>
    <body style="clear: both;">
        <input type="hidden" id="timeout" name="timeout" value="<% out.print(session.getAttribute("timeout"));%>"/>
        <!--<input type="hidden" id="timeout" name="timeout" value="300000"/>-->
        <script type="text/javascript">
            var wintimeout;
            function SetWinTimeout() {
                var time = document.getElementById("timeout").value;
                wintimeout = window.setTimeout("window.location.href='ServletControllerLogout';", time); //after 5 mins i.e. 5 * 60 * 1000
            }
            $('body').mouseover(function () {

                window.clearTimeout(wintimeout); //when user mouseover remove timeout and reset it

                SetWinTimeout();

            });
            SetWinTimeout();
        </script>
        
        
    
    <!-- Modal Notifikasi -->
    <div id="notifModal" class="modal-notif" onclick="outsideClick(event)">
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
                        </tr>
                    </thead>
                    <tbody id="notifList" class="tbl-body-notif">
                    </tbody>
                </table>
                
                <!-- Detail Pesan -->
                <div id="notifDetail" style="display: none;">
                    <h3>Detail Pesan</h3>
                    <div id="detailContent" style="overflow: scroll; height: 365px; max-height: 365px; padding:2px;"></div>
                    <button class="back-btn-detail" onclick="backToList()">Kembali</button>
                </div>
            </div>

            
            <div class="p-4 text-center border-t" style="padding: 7px 4px 4px 4px;">
             <input type="button" onclick="markAsRead()" name="submit_mt" id="btn-read" value="Read" class="px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600" />
            <!--<button onclick="markAsRead()" id="btn-read" class="px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600">Tandai Sudah Dibaca</button>-->
        </div>
        </div>
    </div>
    
    
    <%@ include file="NotificationControl.jsp" %>
 
    </body>