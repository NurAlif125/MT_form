<%-- 
    Document   : HeaderTemplates
    Created on : Dec 29, 2024
    Author     : rahmat
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'FLOW:LTCREATE'}">
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>MT</th>
                            <th>Name</th>
                            <th>Sender</th>
                            <th>Receiver</th>
                            <th>Update By</th>
                            <th>Update Time</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${headersTemplate}" var="item">
                            <tr>
                                <td><%=rowNum++%></td>
                                <td>${item.messageType}</td>
                                <td>${item.name}</td>
                                <td>${item.logicalTerminal}</td>
                                <td>${item.receiverAddress}</td>
                                <td>${item.updateBy}</td>
                                <td>${item.updateTime}</td>
                                <td>
                                    <c:forEach var="item1" items="${role}">
                                    <c:if test="${item1 == 'FLOW:LTUPDATE'}">
                                        <a href="VDataTemplateMT?idlt=${item.id_Templates}&ltedit=true">View
                                        </a> &nbsp; 
                                    </c:if>
                                        </c:forEach>
                                        <c:forEach var="item2" items="${role}">
                                    <c:if test="${item2 == 'FLOW:LTDELETE'}">
                                        <a id="delete_template" href="SCDataTemplateMT?idlt=${item.id_Templates}&isdelete=true">
                                            <img src="images/trash.png" width="11px" height="11px"/>
                                        </a>
                                    </c:if>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div><!--close content-->            
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