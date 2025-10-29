<%-- 
    Document   : SCDashBoardTransactions
    Created on : Oct 11, 2023, 10:46:20 AM
    Author     : Administrator
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<style>
#containerO table {
  border-collapse: collapse;
  width: 100%;
  font-size:11px;
}

#containerO td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 6px;
}

#containerO tr:nth-child(even) {
  background-color: #dddddd;
}


</style>
<%@ include file="header.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<%@ page import="java.util.*"%>
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<!--<link rel="icon" href="images/favicon.ico"/>-->
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
<script src="js/hoverMessages.js"></script>
<%@page import="java.util.Date"%>
<script>
function onHover(e) {
    // Get the 'id' from the element that was hovered over
    var idData = e.id;  // Use e.id to get the value of data.flag from the 'id' attribute

    console.log(idData); // Verify the value in the console

    var display;
    var idData2 = idData.replace(/-/g, "_");
    console.log("flagnya "+idData2);

    var messageData = hoverMessages[idData2];

    // Check if hover message exists for the given idData
    // Check if hover message exists for the given idData
    if (messageData) {
        // Construct the display message based on whether desc is available
        if (messageData.desc != null && messageData.desc !== "") {
            // Include both name and description if desc is available
             display = messageData.name + "\n\n(" + messageData.desc +")";
        } else {
            // Only include the name if description is not available
             display = messageData.name;
        }
    } else {
        // Fallback message if idData doesn't exist in hoverMessages
         display = "No information available";
    }
    //display = hoverMessages[idData2] || "No information available";
    // Set a display message based on idData value
    //if (idData2 === "INC_WAIT") {
      //  display = "Incoming WAIT";
    //} 

    // Set the title attribute to the display message
    e.setAttribute("title", display);
}

</script>
<div id="isi" align="center" onload="refresh()">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:DASHBOARD'}">
            <c:if test="${fn:containsIgnoreCase(io_type, 'O')}">
                <div id="judul">Dashboard Incoming</div>
            </c:if>
            <c:if test="${fn:containsIgnoreCase(io_type, 'I')}">
                <div id="judul">Dashboard Outgoing</div>
            </c:if>
            <form id="form1" name="form1" method="post" action="#" style="padding-bottom: 10px;">
                <% Date tgl_today = new java.util.Date();
            pageContext.setAttribute("tgl_today", tgl_today);%>
                <c:set var="tgl_today" value="${tgl_today}" />
                <div id="tabs-1" align="center">
                    <div class="form-row-dashboard">
                        Date From (Value Date) : 
                        <%--${tgl_today}--%>
                        <input type="hidden" name="varTemp">
                        <c:if test="${empty beg1}">
                            <input type="text" name="date_from" id="date_from" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />" size="10" />
                        </c:if>
                        <c:if test="${not empty beg1}">
                            <input type="text" name="date_from" id="date_from" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${beg1}" />" size="10" />
                        </c:if>
                        
                        <%----%>
                        Date End (Value Date): 
                        <c:if test="${empty beg2}">
                            <input type="text" name="date_end" id="date_end" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />" size="10" />
                        </c:if>
                        <c:if test="${not empty beg2}">
                            <input type="text" name="date_end" id="date_end" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${beg2}" />" size="10" />
                        </c:if>
                            
                         <br/><br/>
                         Date From (Insert Date) : 
                        <%--${tgl_today}--%>
                        <input type="hidden" name="varTemp">
                        <c:if test="${empty insert_beg1}">
                            <input type="text" name="insert_date_from" id="insert_date_from" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />" size="10" />
                        </c:if>
                        <c:if test="${not empty insert_beg1}">
                            <input type="text" name="insert_date_from" id="insert_date_from" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${insert_beg1}" />" size="10" />
                        </c:if>
                        
                        <%----%>
                        Date End (Insert Date): 
                        <c:if test="${empty insert_beg2}">
                            <input type="text" name="insert_date_end" id="insert_date_end" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />" size="10" />
                        </c:if>
                        <c:if test="${not empty insert_beg2}">
                            <input type="text" name="insert_date_end" id="insert_date_end" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${insert_beg2}" />" size="10" />
                        </c:if>
                        <br/>
                        <br/>
                        <!--&nbsp;-->
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
                            <tr>
                                <td style="text-align:center"
                                    ><div id="judul">Daily Transactions From (Value Date) :

                                        <c:if test="${empty beg1}">
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />

                                        </c:if>
                                        <c:if test="${not empty beg1}">
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${beg1}" />

                                        </c:if>

                                        To :

                                        <c:if test="${empty beg2}">
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />
                                        </c:if>
                                        <c:if test="${not empty beg2}">
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${beg2}" />
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:center"
                                    ><div id="judul">Daily Transactions From (Insert Date) :

                                        <c:if test="${empty insert_beg1}">
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />

                                        </c:if>
                                        <c:if test="${not empty insert_beg1}">
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${insert_beg1}" />

                                        </c:if>

                                        To :

                                        <c:if test="${empty insert_beg2}">
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />
                                        </c:if>
                                        <c:if test="${not empty insert_beg2}">
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${insert_beg2}" />
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;padding:10px">
                                    <c:if test="${not isEmpty}">
                                        <div id="containerO" style="margin: 0 auto">
                                            <table>
                                             <tr>
                                              <th rowspan="2">Description</th>
                                              <!--Ini untuk retreive ccynya dahulu-->
                                              <c:forEach items="${datasCcy}" var="currencyData">
                                                <th style="text-align: center" colspan="2" >${currencyData}</th>
                                              </c:forEach>
                                              <th rowspan="2">Jumlah</th>
                                              
                                             </tr>
                                             <tr>
                                                 <c:forEach items="${datasCcy}" var="currencyData">
                                                    <th>Total</th>
                                                    <th>Amount</th>
                                                </c:forEach>

                                             </tr>
                                             <!--Disini foreach untuk flagnya-->
                                             <c:forEach items="${dataDashboard}" var="data">
                                                <tr>
                                                    <td title="" 
                                                        id="${data.flag.trim().replace(' ', '_')}"
                                                        onmouseover="onHover(this)" 
                                                        class="testHover" >
                                                         
                                                        <c:if test="${empty beg1 and empty beg2}">
                                                            <a href="controllerHeaders?io_type=${io_type}&flag=${data.flag}&date1=<fmt:formatDate pattern='yyyy-MM-dd' value='${tgl_today}'/>&date2=<fmt:formatDate pattern='yyyy-MM-dd' value='${tgl_today}' />">${data.flag}</a>
                                                        </c:if>
                                                        <c:if test="${not empty beg1 and not empty insert_beg1}">
                                                            <a href="controllerHeaders?io_type=${io_type}&flag=${data.flag}&date1=<fmt:formatDate pattern='yyyy-MM-dd' value='${beg1}'/>&date2=<fmt:formatDate pattern='yyyy-MM-dd' value='${beg2}'/>&date1insert=<fmt:formatDate pattern='yyyy-MM-dd' value='${insert_beg1}'/>&date2insert=<fmt:formatDate pattern='yyyy-MM-dd' value='${insert_beg2}' />">${data.flag}</a>
                                                        </c:if>
                                                    </td>


                                                 <!-- reset untuk penjumlahan horizontal-->
                                                 <c:set var="jumlah_total_h" value="0" />
                                                 
                                                 <!--Pakai ccy untuk pencocokan data-->
                                                 <!--Disni foreach untuk nilainya-->
                                                 <c:forEach items="${data.dataSlipAndAmount}" var="data_nested">
                                                     
                                                    <td style="text-align: right">${data_nested.value.slip}</td>
                                                    
                                                    <!-- untuk penjumlahan 'total' secara horizontal-->
                                                    <c:set var="jumlah_total_h" value="${jumlah_total_h + data_nested.value.slip}" />
                                                 
                                                    <td style="text-align: right"><fmt:formatNumber value = "${data_nested.value.amount}" type = "number" minFractionDigits ="2"/></td>

                                                 </c:forEach>
                                                    <td style="text-align: right; font-weight: bold;">${jumlah_total_h}</td>
                                                </tr>
                                             </c:forEach>
                                             <tr>
                                                <!-- penjumlahan 'total' dan 'amount' secara vertikal-->
                                                <th rowspan="2">Jumlah</th>
                                                <c:forEach items="${dataSumSlipAmount}" var="jumlah_v">
                                                    <%--<c:if test=""--%>
                                                    <td style="text-align: right; font-weight: bold;">${jumlah_v.slip}</td>
                                                    <td style="text-align: right; font-weight: bold;"><fmt:formatNumber value = "${jumlah_v.amount}" type = "number" minFractionDigits ="2"/></td>
                                                </c:forEach>
                                             </tr>
                                             </table>
                                        </div>
                                    </c:if>
                                    <c:if test="${isEmpty}">
                                        <table class="notification">
                                            <tbody>
                                                <tr><td style="border:2px solid #28787c">

                                                    <h3>There is no data</h3>

                                                </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </c:if>
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