<%-- 
    Document   : viewRetur
    Created on : Mei 12, 2016, 2:52:46 PM
    Author     : Azan
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
        <c:if test="${item == 'FLOW:RETURN'}">
            <div id="judul">Return Message</div>
            <div id="konten">
                <div id="content">
                    <%int rowNum = 1;%>
                    <display:table name="sessionScope.retur" pagesize="15" export="false" sort="list" cellpadding="0" cellspacing="0" id="table">
                        <display:column value="<%=rowNum++%>" title="No" sortable="true" headerClass="sortable" />
                        <display:column property="tanggal" title="CreationDate" sortable="true" headerClass="sortable" />
                        <display:column property="tag53" title="Sender" sortable="true" headerClass="sortable" />
                        <display:column paramId="id" paramProperty="id_headers" property="tag20" title="Reference" sortable="true" headerClass="sortable" href="ViewDataTransaksiOutgoing" />
                        <display:column property="tag21" title="Rel. Reference" sortable="true" headerClass="sortable" />
                        <display:column property="tag72" title="Description" sortable="true" headerClass="sortable" />
                        <display:column property="flag" title="Status" sortable="true" headerClass="sortable" />
                    </display:table>
                </div>
            </div>
        </c:if>
    </c:forEach>
</div>
