<%-- 
    Document   : DailyTransactions
    Created on : Nov 4, 2013, 11:36:47 AM
    Author     : Denna
--%>

<style>
#containerO table {
  border-collapse: collapse;
  width: 100%;
  font-size:12px;
}

#containerO td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

#containerO tr:nth-child(even) {
  background-color: #dddddd;
}


</style>

<%@page import="org.exolab.castor.xml.validators.DoubleValidator"%>
<%@page import="org.apache.poi.hssf.record.formula.functions.Replace"%>
<%@page import="dbase.DBHeader"%>
<%@page import="dbase.DBconnection"%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<%@ page import="java.util.*"%>
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>



    
    <%DBconnection dbConn = new DBconnection();%>
    <%DBHeader dbh = new DBHeader(dbConn.getConnection());%>
                
    <%DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");%>
    <%Date date = new Date();%>
    <%String tanggal1 = request.getParameter("date_from");%>
    <%String tanggal2 = request.getParameter("date_end");
        //USD
        String incCnfUsd;
        String incInvUsd;
        String incRtrUsd;
        String AckUsd;
        String[] arrincCnfUsd = null;
        String[] arrincInvUsd = null;
        String[] arrincRtrUsd = null;
        String[] arrAckUsd = null;
        
        //AUD
        String incCnfAud;
        String incInvAud;
        String incRtrAud;
        String AckAud;
        String[] arrincCnfAud = null;
        String[] arrincInvAud = null;
        String[] arrincRtrAud = null;
        String[] arrAckAud = null;
        
        //SGD
        String incCnfSgd;
        String incInvSgd;
        String incRtrSgd;
        String AckSgd;
        String[] arrincCnfSgd = null;
        String[] arrincInvSgd = null;
        String[] arrincRtrSgd = null;
        String[] arrAckSgd = null;
        
        //EUR
        String incCnfEur;
        String incInvEur;
        String incRtrEur;
        String AckEur;
        String[] arrincCnfEur = null;
        String[] arrincInvEur = null;
        String[] arrincRtrEur = null;
        String[] arrAckEur = null;
        
        //JPY
        String incCnfJpy;
        String incInvJpy;
        String incRtrJpy;
        String AckJpy;
        String[] arrincCnfJpy = null;
        String[] arrincInvJpy = null;
        String[] arrincRtrJpy = null;
        String[] arrAckJpy = null;
        
        //SAR
        String incCnfSar;
        String incInvSar;
        String incRtrSar;
        String AckSar;
        String[] arrincCnfSar = null;
        String[] arrincInvSar = null;
        String[] arrincRtrSar = null;
        String[] arrAckSar = null;
    %>
    

<script>
    function refresh(){
        //20200722
        
        
    <% if (tanggal1 == null && tanggal2 == null) {
            //USD
            incCnfUsd = dbh.getDailyTrx("INC-CNF", formatDate.format(date), formatDate.format(date), "USD");
            incInvUsd = dbh.getDailyTrx("INC-INV", formatDate.format(date), formatDate.format(date), "USD");
            incRtrUsd = dbh.getDailyTrx("INC-RTR", formatDate.format(date), formatDate.format(date), "USD");
            AckUsd = dbh.getDailyTrx("ACK", formatDate.format(date), formatDate.format(date), "USD");
            //AUD
            incCnfAud = dbh.getDailyTrx("INC-CNF", formatDate.format(date), formatDate.format(date), "AUD");
            incInvAud = dbh.getDailyTrx("INC-INV", formatDate.format(date), formatDate.format(date), "AUD");
            incRtrAud = dbh.getDailyTrx("INC-RTR", formatDate.format(date), formatDate.format(date), "AUD");
            AckAud = dbh.getDailyTrx("ACK", formatDate.format(date), formatDate.format(date), "AUD");
            //SGD
            incCnfSgd = dbh.getDailyTrx("INC-CNF", formatDate.format(date), formatDate.format(date), "SGD");
            incInvSgd = dbh.getDailyTrx("INC-INV", formatDate.format(date), formatDate.format(date), "SGD");
            incRtrSgd = dbh.getDailyTrx("INC-RTR", formatDate.format(date), formatDate.format(date), "SGD");
            AckSgd = dbh.getDailyTrx("ACK", formatDate.format(date), formatDate.format(date), "SGD");
            //EUR
            incCnfEur = dbh.getDailyTrx("INC-CNF", formatDate.format(date), formatDate.format(date), "EUR");
            incInvEur = dbh.getDailyTrx("INC-INV", formatDate.format(date), formatDate.format(date), "EUR");
            incRtrEur = dbh.getDailyTrx("INC-RTR", formatDate.format(date), formatDate.format(date), "EUR");
            AckEur = dbh.getDailyTrx("ACK", formatDate.format(date), formatDate.format(date), "EUR");
            //JPY
            incCnfJpy = dbh.getDailyTrx("INC-CNF", formatDate.format(date), formatDate.format(date), "JPY");
            incInvJpy = dbh.getDailyTrx("INC-INV", formatDate.format(date), formatDate.format(date), "JPY");
            incRtrJpy = dbh.getDailyTrx("INC-RTR", formatDate.format(date), formatDate.format(date), "JPY");
            AckJpy = dbh.getDailyTrx("ACK", formatDate.format(date), formatDate.format(date), "JPY");
            //SAR
            incCnfSar = dbh.getDailyTrx("INC-CNF", formatDate.format(date), formatDate.format(date), "SAR");
            incInvSar = dbh.getDailyTrx("INC-INV", formatDate.format(date), formatDate.format(date), "SAR");
            incRtrSar = dbh.getDailyTrx("INC-RTR", formatDate.format(date), formatDate.format(date), "SAR");
            AckSar = dbh.getDailyTrx("ACK", formatDate.format(date), formatDate.format(date), "SAR");

        } else {
            //USD
            incCnfUsd = dbh.getDailyTrx("INC-CNF", tanggal1, tanggal2, "USD");
            incInvUsd = dbh.getDailyTrx("INC-INV", tanggal1, tanggal2, "USD");
            incRtrUsd = dbh.getDailyTrx("INC-RTR", tanggal1, tanggal2, "USD");
            AckUsd = dbh.getDailyTrx("ACK", tanggal1, tanggal2, "USD");
            //AUD
            incCnfAud = dbh.getDailyTrx("INC-CNF", tanggal1, tanggal2, "AUD");
            incInvAud = dbh.getDailyTrx("INC-INV", tanggal1, tanggal2, "AUD");
            incRtrAud = dbh.getDailyTrx("INC-RTR", tanggal1, tanggal2, "AUD");
            AckAud = dbh.getDailyTrx("ACK", tanggal1, tanggal2, "AUD");
            //SGD
            incCnfSgd = dbh.getDailyTrx("INC-CNF", tanggal1, tanggal2, "SGD");
            incInvSgd = dbh.getDailyTrx("INC-INV", tanggal1, tanggal2, "SGD");
            incRtrSgd = dbh.getDailyTrx("INC-RTR", tanggal1, tanggal2, "SGD");
            AckSgd = dbh.getDailyTrx("ACK", tanggal1, tanggal2, "SGD");
            //EUR
            incCnfEur = dbh.getDailyTrx("INC-CNF", tanggal1, tanggal2, "EUR");
            incInvEur = dbh.getDailyTrx("INC-INV", tanggal1, tanggal2, "EUR");
            incRtrEur = dbh.getDailyTrx("INC-RTR", tanggal1, tanggal2, "EUR");
            AckEur = dbh.getDailyTrx("ACK", tanggal1, tanggal2, "EUR");
            //JPY
            incCnfJpy = dbh.getDailyTrx("INC-CNF", tanggal1, tanggal2, "JPY");
            incInvJpy = dbh.getDailyTrx("INC-INV", tanggal1, tanggal2, "JPY");
            incRtrJpy = dbh.getDailyTrx("INC-RTR", tanggal1, tanggal2, "JPY");
            AckJpy = dbh.getDailyTrx("ACK", tanggal1, tanggal2, "JPY");
            //JPY
            incCnfSar = dbh.getDailyTrx("INC-CNF", tanggal1, tanggal2, "SAR");
            incInvSar = dbh.getDailyTrx("INC-INV", tanggal1, tanggal2, "SAR");
            incRtrSar = dbh.getDailyTrx("INC-RTR", tanggal1, tanggal2, "SAR");
            AckSar = dbh.getDailyTrx("ACK", tanggal1, tanggal2, "SAR");
            
            
        }
            //Array USD
            arrincCnfUsd = incCnfUsd.split("#");
            arrincInvUsd = incInvUsd.split("#");
            arrincRtrUsd = incRtrUsd.split("#");
            arrAckUsd = AckUsd.split("#");
            //Array AUD
            arrincCnfAud = incCnfAud.split("#");
            arrincInvAud = incInvAud.split("#");
            arrincRtrAud = incRtrAud.split("#");
            arrAckAud = AckAud.split("#");
            //Array SGD
            arrincCnfSgd = incCnfSgd.split("#");
            arrincInvSgd = incInvSgd.split("#");
            arrincRtrSgd = incRtrSgd.split("#");
            arrAckSgd = AckSgd.split("#");
            //Array EUR
            arrincCnfEur = incCnfEur.split("#");
            arrincInvEur = incInvEur.split("#");
            arrincRtrEur = incRtrEur.split("#");
            arrAckEur = AckEur.split("#");
            //Array JPY
            arrincCnfJpy = incCnfJpy.split("#");
            arrincInvJpy = incInvJpy.split("#");
            arrincRtrJpy = incRtrJpy.split("#");
            arrAckJpy = AckJpy.split("#");
            //Array SAR
            arrincCnfSar = incCnfSar.split("#");
            arrincInvSar = incInvSar.split("#");
            arrincRtrSar = incRtrSar.split("#");
            arrAckSar = AckSar.split("#");
            
            
    %>
                
    <% tanggal1 = request.getParameter("date_from");%>
    <% tanggal2 = request.getParameter("date_end");%>
                
        }
</script>



<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
</script>




<div id="isi" align="center" onload="refresh()">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:DASHBOARD'}">
            <div id="judul">DashBoard</div>
            <form id="form1" name="form1" method="post" action="#" style="padding-bottom: 10px;">
                <% Date tgl_today = new java.util.Date();
            pageContext.setAttribute("tgl_today", tgl_today);%>
                <c:set var="tgl_today" value="${tgl_today}" />
                <div id="tabs-1" align="center">
                    <div class="form-row-dashboard">
                        Date From : 
                        <%--${tgl_today}--%>
                        <input type="hidden" name="varTemp">
                        <input type="text" name="date_from" id="date_from" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />" size="10" />
                        <%----%>
                        Date End : 
                        <input type="text" name="date_end" id="date_end" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />" size="10" />
                        &nbsp;
                        <button class="srb" onclick="refresh()">Refresh</button>
                    </div>
                </div>
            </form>

            <script src="Diagram/js/highcharts.js"></script>
            <script src="Diagram/js/modules/exporting.js"></script>

<!--            <table border="0" cellspacing="1" cellpadding="1">
                <tr>-->
                    <!--<td style="vertical-align: top;padding:10px">-->
                            <table style="width:80%">
                                <tr><td style="text-align:center"><div id="judul">Daily Transactions From :
                                        <% if (tanggal1 == null) { %>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />
                                            <%} else { out.print(tanggal1); } %>
                                            To :
                                            <% if (tanggal1 == null) { %>
                                                <fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />
                                                <%} else {out.print(tanggal2); } %>
                                        </div></td></tr>
                                <tr>
                                    <td style="vertical-align: top;padding:10px">
                                        <div id="containerO" style="margin: 0 auto">
                                            <table>
                                             <tr>
                                              <th rowspan="2">Description</th>
                                              <th style="text-align: center" colspan="2" >USD</th>
                                              <th style="text-align: center" colspan="2">AUD</th>
                                              <th style="text-align: center" colspan="2">SGD</th>
                                              <th style="text-align: center" colspan="2">EUR</th>
                                              <th style="text-align: center" colspan="2">JPY</th>
                                              <th style="text-align: center" colspan="2">SAR</th>
                                             </tr>
                                             <tr>
                                              <th>Total</th>
                                              <th>Amount</th>
                                              <th>Total</th>
                                              <th>Amount</th>
                                              <th>Total</th>
                                              <th>Amount</th>
                                              <th>Total</th>
                                              <th>Amount</th>
                                              <th>Total</th>
                                              <th>Amount</th>
                                              <th>Total</th>
                                              <th>Amount</th>
                                             </tr>
                                             <tr>
                                              <td>Outgoing</td>
                                              <td style="text-align: right"><%=arrAckUsd[1]%></td>
                                              <td style="text-align: right"><%=arrAckUsd[0]%></td>
                                              <td style="text-align: right"><%=arrAckAud[1]%></td>
                                              <td style="text-align: right"><%=arrAckAud[0]%></td>
                                              <td style="text-align: right"><%=arrAckSgd[1]%></td>
                                              <td style="text-align: right"><%=arrAckSgd[0]%></td>
                                              <td style="text-align: right"><%=arrAckEur[1]%></td>
                                              <td style="text-align: right"><%=arrAckEur[0]%></td>
                                              <td style="text-align: right"><%=arrAckJpy[1]%></td>
                                              <td style="text-align: right"><%=arrAckJpy[0]%></td>
                                              <td style="text-align: right"><%=arrAckSar[1]%></td>
                                              <td style="text-align: right"><%=arrAckSar[0]%></td>
                                             </tr>
                                             <tr>
                                              <td>Incoming</td>
                                              <td style="text-align: right"><%=arrincCnfUsd[1]%></td>
                                              <td style="text-align: right"><%=arrincCnfUsd[0]%></td>
                                              <td style="text-align: right"><%=arrincCnfAud[1]%></td>
                                              <td style="text-align: right"><%=arrincCnfAud[0]%></td>
                                              <td style="text-align: right"><%=arrincCnfSgd[1]%></td>
                                              <td style="text-align: right"><%=arrincCnfSgd[0]%></td>
                                              <td style="text-align: right"><%=arrincCnfEur[1]%></td>
                                              <td style="text-align: right"><%=arrincCnfEur[0]%></td>
                                              <td style="text-align: right"><%=arrincCnfJpy[1]%></td>
                                              <td style="text-align: right"><%=arrincCnfJpy[0]%></td>
                                              <td style="text-align: right"><%=arrincCnfSar[1]%></td>
                                              <td style="text-align: right"><%=arrincCnfSar[0]%></td>
                                             </tr>
                                             <tr>
                                              <td>Investigation</td>
                                              <td style="text-align: right"><%=arrincInvUsd[1]%></td>
                                              <td style="text-align: right"><%=arrincInvUsd[0]%></td>
                                              <td style="text-align: right"><%=arrincInvAud[1]%></td>
                                              <td style="text-align: right"><%=arrincInvAud[0]%></td>
                                              <td style="text-align: right"><%=arrincInvSgd[1]%></td>
                                              <td style="text-align: right"><%=arrincInvSgd[0]%></td>
                                              <td style="text-align: right"><%=arrincInvEur[1]%></td>
                                              <td style="text-align: right"><%=arrincInvEur[0]%></td>
                                              <td style="text-align: right"><%=arrincInvJpy[1]%></td>
                                              <td style="text-align: right"><%=arrincInvJpy[0]%></td>
                                              <td style="text-align: right"><%=arrincInvSar[1]%></td>
                                              <td style="text-align: right"><%=arrincInvSar[0]%></td>
                                             </tr>
                                             <tr>
                                              <td>Return</td>
                                              <td style="text-align: right"><%=arrincRtrUsd[1]%></td>
                                              <td style="text-align: right"><%=arrincRtrUsd[0]%></td>
                                              <td style="text-align: right"><%=arrincRtrAud[1]%></td>
                                              <td style="text-align: right"><%=arrincRtrAud[0]%></td>
                                              <td style="text-align: right"><%=arrincRtrSgd[1]%></td>
                                              <td style="text-align: right"><%=arrincRtrSgd[0]%></td>
                                              <td style="text-align: right"><%=arrincRtrEur[1]%></td>
                                              <td style="text-align: right"><%=arrincRtrEur[0]%></td>
                                              <td style="text-align: right"><%=arrincRtrJpy[1]%></td>
                                              <td style="text-align: right"><%=arrincRtrJpy[0]%></td>
                                              <td style="text-align: right"><%=arrincRtrSar[1]%></td>
                                              <td style="text-align: right"><%=arrincRtrSar[0]%></td>
                                             </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                    <!--</td>-->
<!--                    <td style="vertical-align: top;padding:10px">
                        <table style="width:100%">
                            <tr>
                                <td><div id="container" style="width: 450px; height: 400px; margin: 0 auto"></div></td>
                            </tr>
                        </table>
                    </td>-->
<!--                </tr>
            </table>-->
        </c:if>
    </c:forEach>
</div>