<%--
    Document   : controllerHeaders
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:DUPLICATE'}">
            <div id="judul">Duplicate of MessageType</div>
            <div id="content">
            <%int rowNum = 1;%>
            <display:table name="sessionScope.headers" pagesize="10" export="false" sort="list">
                <display:column value="<%=rowNum++%>" title="No" sortable="true" headerClass="sortable" />
                <display:column property="messageType" title="MessageType" sortable="true" headerClass="sortable" />
                <display:column property="logicalTerminal" title="LogicalTerminal" sortable="true" headerClass="sortable" />
                <display:column property="io_type" title="I/O" sortable="true" headerClass="sortable" />
                <display:column property="receiverAddress" title="ReceiverAddress" sortable="true" headerClass="sortable" />
                <display:column property="tanggal" title="CreationDate" sortable="true" headerClass="sortable" />
                <display:column paramId="id" paramProperty="id_headers" property="tag20" title="Tag20" sortable="true" headerClass="sortable" href="ViewDataTransaksiOutgoing" />
            </display:table>
            </div>
        </c:if>
    </c:forEach>
</div><!--close content-->