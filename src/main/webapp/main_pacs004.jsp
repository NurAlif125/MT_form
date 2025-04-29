<%-- 
    Document   : main_pacs008
    Created on : Feb 10, 2025, 3:30:33 PM
    Author     : rafli
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MX:pacs00400109'}">
            <div id="judul">PACS.004.001.09 Payment Return V09</div>
            <form id="form1" name="form1" method="post" action="SCDataTransaksiOutgoingPlainMX">
                <input name="messageType" id="messageType" type="hidden" value="pacs00400109" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li id="tab-view1"><a href="#" rel="view1">Header</a></li>
                        <li id="tab-view2"><a href="#" rel="view2">Create Message</a></li>
                        <li id="tab-validate"><a href="#" rel="view7" id="tab-view-validate" hidden>Validate</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <%@ include file="pacs00400109.jsp" %>
                        </div>
                        <div id="view7" class="tabcontent">
                            <div id="error-container">
                                <table id="errorInfoTable">
                                    <thead>
                                        <tr>
                                        <th>Message</th>
                                        <th>Path</th>
                                        </tr>
                                    </thead>
                                    <tbody id="errorInformationTable"></tbody>
                                </table> 
                            </div>
                        </div>
                    </div>
                </div>
                <%@ include file="tabValidateMX.jsp" %>
                <%@ include file="button_action.jsp" %>
            </form>
        </c:if>
    </c:forEach>
</div>

<%@ include file="validateMX.jsp" %>