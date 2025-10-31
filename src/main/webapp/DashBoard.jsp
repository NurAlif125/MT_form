<%-- 
    Document   : DashBoard
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

<%@ page import="org.exolab.castor.xml.validators.DoubleValidator" %>
<%@ page import="org.apache.poi.hssf.record.formula.functions.Replace" %>
<%@ page import="com.vensys.appcm.dbase.DBHeader" %>
<%@ page import="com.vensys.appcm.dbase.DBconnection" %>
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


<script type="text/javascript">
    $(function () {
    <% String[] s = {"Text", "Mod", "Ver", "Auth", "ACK", "NACK", "Inc", "Inc-OK", "Inc-NOK", "Inc-WAIT", "Inc-STL", "Inc-RSTL", "Inc-INV", "Inc-HOLD"};%>
    <%DBconnection dbConn = new DBconnection();%>
    <%DBHeader dbh = new DBHeader(dbConn.getConnection());%>

    <%DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");%>
    <%Date date = new Date();%>
    <%String tanggal1 = request.getParameter("date_from");%>
    <%String tanggal2 = request.getParameter("date_end");%>

    <%-- Integer a = dbh.getFlagStatus("MOD", "2013-01-01", formatDate.format(date));%>
    <% Integer b = dbh.getFlagStatus("VER", formatDate.format(date), formatDate.format(date));%>
    <% Integer c = dbh.getFlagStatus("AUTH", formatDate.format(date), formatDate.format(date));%>
    <% Integer d = dbh.getFlagStatus("TEXT", formatDate.format(date), formatDate.format(date));%>
    <% Integer e = dbh.getFlagStatus("ACK", formatDate.format(date), formatDate.format(date));%>
    <% Integer f = dbh.getFlagStatus("NACK", formatDate.format(date), formatDate.format(date));%>
    <% Integer g = dbh.getFlagStatus("INC", formatDate.format(date), formatDate.format(date));%>
    <% Integer h = dbh.getFlagStatus("INC-OK", formatDate.format(date), formatDate.format(date));%>
    <% Integer i = dbh.getFlagStatus("INC-NOK", formatDate.format(date), formatDate.format(date));%>
    <% Integer j = dbh.getFlagStatus("INC-WAIT", formatDate.format(date), formatDate.format(date));%>
    <% Integer k = dbh.getFlagStatus("INC-STL", formatDate.format(date), formatDate.format(date));%>
    <% Integer l = dbh.getFlagStatus("INC-RSTL", formatDate.format(date), formatDate.format(date));%>
    <% Integer m = dbh.getFlagStatus("INC-INV", formatDate.format(date), formatDate.format(date));%>
    <% Integer n = dbh.getFlagStatus("INC-HOLD", formatDate.format(date), formatDate.format(date));--%>

    <%--currency format uang--%>
    <%  Currency currentCurrency = Currency.getInstance(Locale.GERMANY);
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.GERMANY);%>

    <%-- Outgoing --%>
    <%-- String[] amountPie = dbh.getAmountsStringForBanks("57a", 71, formatDate.format(date), formatDate.format(date), "I");%>
    <% String[] bankPie = dbh.getBanksForChart("57a", 71, formatDate.format(date), formatDate.format(date), "I");--%>
    <%-- incoming --%>
    <%-- String[] amountPie2 = dbh.getAmountsStringForBanks("53a", 21, formatDate.format(date), formatDate.format(date), "O");%>
    <% String[] bankPie2 = dbh.getBanksForChart("53a", 21, formatDate.format(date), formatDate.format(date), "O");--%>

    <%-- Outgoing Harian --%>
    <% 
        String citius33 = dbh.getNominalBIC("CITIUS33XXX", formatDate.format(date), formatDate.format(date), "I");
        String bmriidja = dbh.getNominalBIC("BMRIIDJA", formatDate.format(date), formatDate.format(date), "I");
        String cenaidja = dbh.getNominalBIC("CENAIDJA", formatDate.format(date), formatDate.format(date), "I");
        String cobadeff = dbh.getNominalBIC("CITIUS33BUD", formatDate.format(date), formatDate.format(date), "I");
        String ncbksaje = dbh.getNominalBIC("CITIIDJX", formatDate.format(date), formatDate.format(date), "I");
        String rjhisari = dbh.getNominalBIC("CZNBKRSE", formatDate.format(date), formatDate.format(date), "I");
        String dbsssgso = dbh.getNominalBIC("BRINIDJA", formatDate.format(date), formatDate.format(date), "I");
        String uovbsgsg = dbh.getNominalBIC("NCBKSAJE", formatDate.format(date), formatDate.format(date), "I");
        String smbcjpjt = dbh.getNominalBIC("RJHISARI", formatDate.format(date), formatDate.format(date), "I");
        String anzbau3m = dbh.getNominalBIC("SCBLDEFX", formatDate.format(date), formatDate.format(date), "I");
        String dbsssgsg = dbh.getNominalBIC("DBSSSGSG", formatDate.format(date), formatDate.format(date), "I");
        String bninjpjt = dbh.getNominalBIC("BNINJPJT", formatDate.format(date), formatDate.format(date), "I");
        String bbynkwkw = dbh.getNominalBIC("BBYNKWKW", formatDate.format(date), formatDate.format(date), "I");
    %>

    });</script>


<script>
    function refresh() {
    <% if (tanggal1 == null && tanggal2 == null) {
//            
            citius33 = dbh.getNominalBIC("CITIUS33XXX", formatDate.format(date), formatDate.format(date), "I");
            bmriidja = dbh.getNominalBIC("BMRIIDJA", formatDate.format(date), formatDate.format(date), "I");
            cenaidja = dbh.getNominalBIC("CENAIDJA", formatDate.format(date), formatDate.format(date), "I");
            cobadeff = dbh.getNominalBIC("CITIUS33BUD", formatDate.format(date), formatDate.format(date), "I");
            ncbksaje = dbh.getNominalBIC("CITIIDJX", formatDate.format(date), formatDate.format(date), "I");
            rjhisari = dbh.getNominalBIC("CZNBKRSE", formatDate.format(date), formatDate.format(date), "I");
            dbsssgso = dbh.getNominalBIC("BRINIDJA", formatDate.format(date), formatDate.format(date), "I");
            uovbsgsg = dbh.getNominalBIC("NCBKSAJE", formatDate.format(date), formatDate.format(date), "I");
            smbcjpjt = dbh.getNominalBIC("RJHISARI", formatDate.format(date), formatDate.format(date), "I");
            anzbau3m = dbh.getNominalBIC("SCBLDEFX", formatDate.format(date), formatDate.format(date), "I");
            dbsssgsg = dbh.getNominalBIC("DBSSSGSG", formatDate.format(date), formatDate.format(date), "I");
            bninjpjt = dbh.getNominalBIC("BNINJPJT", formatDate.format(date), formatDate.format(date), "I");
            bbynkwkw = dbh.getNominalBIC("BBYNKWKW", formatDate.format(date), formatDate.format(date), "I");

        } else {
            
            System.out.println("tanggal 1 dan 2 " + request.getParameter("date_from") + request.getParameter("date_end"));
            
            citius33 = dbh.getNominalBIC("CITIUS33XXX", request.getParameter("date_from"), request.getParameter("date_end"), "I");
            bmriidja = dbh.getNominalBIC("BMRIIDJA", request.getParameter("date_from"), request.getParameter("date_end"), "I");
            cenaidja = dbh.getNominalBIC("CENAIDJA", request.getParameter("date_from"), request.getParameter("date_end"), "I");
            cobadeff = dbh.getNominalBIC("CITIUS33BUD", request.getParameter("date_from"), request.getParameter("date_end"), "I");
            ncbksaje = dbh.getNominalBIC("CITIIDJX", request.getParameter("date_from"), request.getParameter("date_end"), "I");
            rjhisari = dbh.getNominalBIC("CZNBKRSE", request.getParameter("date_from"), request.getParameter("date_end"), "I");
            dbsssgso = dbh.getNominalBIC("BRINIDJA", request.getParameter("date_from"), request.getParameter("date_end"), "I");
            uovbsgsg = dbh.getNominalBIC("NCBKSAJE", request.getParameter("date_from"), request.getParameter("date_end"), "I");
            smbcjpjt = dbh.getNominalBIC("RJHISARI", request.getParameter("date_from"), request.getParameter("date_end"), "I");
            anzbau3m = dbh.getNominalBIC("SCBLDEFX", request.getParameter("date_from"), request.getParameter("date_end"), "I");
            dbsssgsg = dbh.getNominalBIC("DBSSSGSG", request.getParameter("date_from"), request.getParameter("date_end"), "I");
            bninjpjt = dbh.getNominalBIC("BNINJPJT", request.getParameter("date_from"), request.getParameter("date_end"), "I");
            bbynkwkw = dbh.getNominalBIC("BBYNKWKW", request.getParameter("date_from"), request.getParameter("date_end"), "I");
        }%>

    <% tanggal1 = request.getParameter("date_from");%>
    <% tanggal2 = request.getParameter("date_end");%>

    }
</script>



<script type="text/javascript">
    $(window).load(function () {
    $('#slider').nivoSlider();
    });</script>





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

            <table style="width:100%">
                <tr><td style="text-align:center"><div id="judul">Daily Outgoing Transactions From :
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
                        <div id="containerO" style="width: 400px; height: 400px; margin: 0 auto">
                            <table style="width:100%">
                                <tr>
                                    <th style="padding:5px">No.</th>
                                    <th style="padding:5px">BIC</th>
                                    <th style="padding:5px">Currency</th>
                                    <th style="padding:5px">Amount</th>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">1</td>
                                    <td style="padding:5px;text-align:center">CITIUS33XXX</td>
                                    <td style="padding:5px;text-align:center">USD</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (citius33==null){%>
                                        0
                                        <% } else {%>
                                        <%=citius33%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">2</td>
                                    <td style="padding:5px;text-align:center">BMRIIDJA</td>
                                    <td style="padding:5px;text-align:center">USD</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (bmriidja==null){%>
                                        0
                                        <% } else {%>
                                        <%=bmriidja%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">3</td>
                                    <td style="padding:5px;text-align:center">CENAIDJA</td>
                                    <td style="padding:5px;text-align:center">USD</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (cenaidja==null){%>
                                        0
                                        <% } else {%>
                                        <%=cenaidja%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">4</td>
                                    <td style="padding:5px;text-align:center">CITIUS33BUD</td>
                                    <td style="padding:5px;text-align:center">MULTICURRENCY</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (cobadeff==null){%>
                                        0
                                        <% } else {%>
                                        <%=cobadeff%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">5</td>
                                    <td style="padding:5px;text-align:center">CITIIDJX</td>
                                    <td style="padding:5px;text-align:center">USD</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (ncbksaje==null){%>
                                        0
                                        <% } else {%>
                                        <%=ncbksaje%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">6</td>
                                    <td style="padding:5px;text-align:center">CZNBKRSE</td>
                                    <td style="padding:5px;text-align:center">USD</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (rjhisari==null){%>
                                        0
                                        <% } else {%>
                                        <%=rjhisari%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">7</td>
                                    <td style="padding:5px;text-align:center">BRINIDJA</td>
                                    <td style="padding:5px;text-align:center">USD</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (dbsssgso==null){%>
                                        0
                                        <% } else {%>
                                        <%=dbsssgso%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">8</td>
                                    <td style="padding:5px;text-align:center">NCBKSAJE</td>
                                    <td style="padding:5px;text-align:center">SAR</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (uovbsgsg==null){%>
                                        0
                                        <% } else {%>
                                        <%=uovbsgsg%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">9</td>
                                    <td style="padding:5px;text-align:center">RJHISARI</td>
                                    <td style="padding:5px;text-align:center">SAR</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (smbcjpjt==null){%>
                                        0
                                        <% } else {%>
                                        <%=smbcjpjt%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">10</td>
                                    <td style="padding:5px;text-align:center">SCBLDEFX</td>
                                    <td style="padding:5px;text-align:center">EUR</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (anzbau3m==null){%>
                                        0
                                        <% } else {%>
                                        <%=anzbau3m%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">11</td>
                                    <td style="padding:5px;text-align:center">DBSSSGSG</td>
                                    <td style="padding:5px;text-align:center">SGD</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (dbsssgsg==null){%>
                                        0
                                        <% } else {%>
                                        <%=dbsssgsg%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">12</td>
                                    <td style="padding:5px;text-align:center">BNINJPJT</td>
                                    <td style="padding:5px;text-align:center">JPY</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (bninjpjt==null){%>
                                        0
                                        <% } else {%>
                                        <%=bninjpjt%>
                                        <% }%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:5px;text-align:center">13</td>
                                    <td style="padding:5px;text-align:center">BBYNKWKW</td>
                                    <td style="padding:5px;text-align:center">KWD</td>
                                    <td style="padding:5px;text-align:right">
                                        <% if (bbynkwkw==null){%>
                                        0
                                        <% } else {%>
                                        <%=bbynkwkw%>
                                        <% }%>
                                    </td>
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