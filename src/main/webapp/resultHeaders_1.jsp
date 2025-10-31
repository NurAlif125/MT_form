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
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<div id="isi">
    <div id="judul">List Search Result</div>
    <input type="button" name="back" id="back" value="Back" class="srb" />
    <div id="content">
    <%int rowNum = 1;%>
    <display:table name="sessionScope.headers" pagesize="10" export="false" sort="list" cellspacing="0" cellpadding="0">
        <display:column value="<%=rowNum++%>" title="No" sortable="true" headerClass="sortable" />
        <display:column property="messageType" title="MessageType" sortable="true" headerClass="sortable" />
        <display:column property="io_type" title="I/O" sortable="true" headerClass="sortable" />
        <display:column property="logicalTerminal" title="Sender Bank" sortable="true" headerClass="sortable" />
        <display:column property="receiverAddress" title="Receiver Bank" sortable="true" headerClass="sortable" />
        <display:column paramId="id" paramProperty="id_headers" property="tag20" title="Reference" sortable="true" headerClass="sortable" href="ViewDataTransaksiOutgoing" />
        <display:column property="tag21" title="Rel. Reference" sortable="true" headerClass="sortable"/>
        <display:column property="tag32Amount" title="Date # Currency # Amount" sortable="true" headerClass="sortable" />
        <display:column property="tanggal" title="CreationDate" sortable="true" headerClass="sortable" />
        <display:column property="flag" title="Status" sortable="true" headerClass="sortable" />
    </display:table>
    </div><!--close content-->
</div>
