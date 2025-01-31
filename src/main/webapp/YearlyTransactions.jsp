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

<%DateFormat formatYear = new SimpleDateFormat("yyyy");%>
<%String yearNow = new SimpleDateFormat("yyyy").format(new Date());%>
<%DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");%>
<%Date date = new Date();%>
<%String tahun = request.getParameter("tahun");%>
<% List<String> yearly_trx = new ArrayList<String>(); %>


<script>
    function refresh() {
    <% if (tahun == null) {
        yearly_trx = dbh.getYearlyTrx(formatYear.format(date));
    } else {
        yearly_trx = dbh.getYearlyTrx(tahun);
    } tahun = request.getParameter("tahun");%>

    }
</script>



<script type="text/javascript">
    $(window).load(function () {
        $('#slider').nivoSlider();
    });
</script>




<div id="isi" align="center" onload="refresh()">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:DASHBOARD'}">
            <div id="judul">DashBoard</div>
            <form id="form1" name="form1" method="post" action="#" style="padding-bottom: 10px;">
                <div id="tabs-1" align="center">
                    <div class="form-row-dashboard">
                        Year : 
                        <select name="tahun" id="tahun">
                        <%
                                    for (int i = 2019; i < Integer.parseInt(yearNow) + 11; i++) {
                                        String strTahun = "<option value=\"" + i + "\"";
                                        if (yearNow.equalsIgnoreCase(Integer.toString(i))) {
                                            strTahun += " selected >";
                                        } else {
                                            strTahun += ">";
                                        }
                                        strTahun += i + "</option>";
                                        out.write(strTahun);
                                    }
                                %>
                          </select>
                        <button class="srb" onclick="refresh()">Refresh</button>
                    </div>
                </div>
            </form>
            
            <script src="Diagram/js/highcharts.js"></script>
            <script src="Diagram/js/modules/exporting.js"></script>
            <table style="width: 400px">
                <tr><td style="text-align:center"><div id="judul">Yearly Transactions by  
                            <% if (tahun == null) { 
                                    out.print(yearNow);
                                } else {
                                    out.print(tahun);
                                } %>
                        </div></td></tr>
                <tr>
                    <td style="vertical-align: top;padding:10px">
                        <div id="containerO" style="margin: 0 auto">
                            <table>
                                <tr>
                                    <th>Description</th>
                                    <th style="text-align: center">In</th>
                                    <th style="text-align: center">Out</th>
                                </tr>
                                <% for (int i = 0; i < yearly_trx.size(); i++){
                                    String[] arrTrx = yearly_trx.get(i).split("#");
                                %>
                                <tr>
                                    <td><%out.print(arrTrx[1]);%></td>
                                    <td style="text-align: right"><%out.print(arrTrx[2]);%></td>
                                    <td style="text-align: right"><%out.print(arrTrx[3]);%></td>
                                </tr>
                                <% } %>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </c:if>
    </c:forEach>
</div>