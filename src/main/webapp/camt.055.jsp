<%-- 
    Document   : camt.055
    Created on : Feb 28, 2025, 10:19:33 AM
    Author     : rafli
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>--%>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link rel="stylesheet" href="css/helper.css" type="text/css">
<link rel="stylesheet" href="css/data-tree.css" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/validateDate.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MX:camt05500108'}">
            <div id="judul">CAMT.055.001.08 - Customer Payment Cancellation Request V08</div>
            <form id="form1" class="form-mx" name="form1" method="post" action="SCDataTransaksiOutgoingMX">
                <input type="hidden" name="status" id="status" value="${headerById.flag}" />
                <input name="messageType" id="messageType" type="hidden" value="${headerById.messageType}" />
                <input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em;">
                    <ul class="tabs">
                        <li id="tab-view1"><a href="#" rel="view1">Header</a></li>
                        <li id="tab-view2"><a href="#" rel="view2">Essential Field</a></li>
                        <li id="tab-view3"><a href="#" rel="view3">MX Full</a></li>
                        <li id="tab-view4"><a href="#" rel="view4">Log MX Text</a></li>
                        <li id="tab-view5"><a href="#" rel="view5">Comment</a></li>
                        <li id="tab-view6"><a href="#" rel="view6">Histories</a></li>
                        <li id="tab-view7"><a href="#" rel="view7">Translation</a></li>
                        <li id="tab-validate"><a href="#" rel="view8" id="tab-view-validate" hidden>Validate</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <%@ include file="camt05500108.jsp" %>
                        </div>
                        <div id="view3" class="tabcontent">
                            <div class="form-row">
                                <div class="form-cols">
                                    <div class="blok-mx">
                                        <input type="hidden" name="hiddenmxfull" id="hiddenmxfull" value="<c:out value='${textById.modify_mt}'/>"/>
                                        <div name="mxfull" id="mxfull" style="overflow-y: scroll; height:440px; margin-left: 5px; padding: 10px;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="view4" class="tabcontent">
                            <%@ include file="logTrx_mx.jsp" %>
                        </div>
                        <div id="view5" class="tabcontent">
                            <%@ include file="comment_mt.jsp" %>
                        </div>
                        <div id="view6" class="tabcontent">
                            <%@ include file="history_mt.jsp" %>
                        </div>
                        <div id="view7" class="tabcontent">
                            <%@ include file="mx_mt.jsp" %>
                        </div>
                        <div id="view8" class="tabcontent">
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
<script type="text/javascript" src="js/data-tree.js"></script>
<script>
    var xmldata = document.getElementById("hiddenmxfull").value;
//    console.log(xmldata);
    new DataTree({
        xml: xmldata,
        container: '#mxfull',
        attrs:'show',
        startExpanded:true
    });
</script>