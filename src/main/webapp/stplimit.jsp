<%-- 
    Document   : applimit
    Created on : Oct 16, 2017, 3:27:09 PM
    Author     : AplDev2
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<%--<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>--%>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'STP_LIMIT:LIST'}">
            <div id="judul">List of STP Limit
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'STP_LIMIT:ADD'}">
                        <a href="addSTPLimit.jsp" class="srb2">Add STP Limit</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="message">
                <span class="style1">
                    <div align="center">
                        <c:out value="${message}"/>
                    </div>
                </span>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Currency</th>
                            <th>Limit</th>
                            <th>Update By</th>
                            <th>Last Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${STPLimit}" var="item">
                            <tr>
                                <td><%=rowNum++%></td>
                                <td>${item.currency}</td>
                                <td><a href="VSTPLimit?id=${item.id}">${item.limit}</a></td>
                                <td>${item.updateBy}</td>
                                <td>${item.tanggal}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div><!--close content-->

            <%--            <div id="content">
                            <%int rowNum = 1;%>
                            <display:table name="sessionScope.STPLimit" pagesize="8" export="false" sort="list" cellpadding="0" cellspacing="0">
                                <display:column value="<%=rowNum++%>" title="No" sortable="true" headerClass="sortable" />
                                <display:column paramId="id" paramProperty="id" property="limit" title="Limit" sortable="true" headerClass="sortable" href="VSTPLimit" />
                                <display:column property="updateBy" title="Update By" sortable="true" headerClass="sortable" />
                                <display:column property="tanggal" title="Last Update" sortable="true" headerClass="sortable" />
                                <display:column property="currency" title="Currency" sortable="true" headerClass="sortable" />
                            </display:table>
            </div>--%>
        </c:if>
    </c:forEach>
</div>
<script>
    $(document).ready(function () {
        $('#example').DataTable({
            "scrollX": true,
            "columnDefs": [
                {
                    "className": "dt-head-left", "targets": "_all"
                }
            ]
        });
    });
</script>