<%-- 
    Document   : main_pacs009
    Created on : Feb 10, 2025, 4:14:12 PM
    Author     : rafli
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<!--<link rel="icon" href="images/favicon.ico"/>-->
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MX:pacs00900108'}">
            <div id="judul">PACS.009.001.08 Financial Institution Credit Transfer V08</div>
            <form id="form1" name="form1" method="post" action="SCDataTransaksiOutgoingPlainMX">
                <input name="messageType" id="messageType" type="hidden" value="pacs00900108" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li><a href="#" rel="view1">Header</a></li>
                        <li><a href="#" rel="view2">Create Message</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <%@ include file="pacs00900108.jsp" %>
                        </div>
                    </div>
                </div>
                <%@ include file="button_action.jsp" %>
            </form>
        </c:if>
    </c:forEach>
</div>

