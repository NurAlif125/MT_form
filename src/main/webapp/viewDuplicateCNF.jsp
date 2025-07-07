<%-- 
    Document   : viewDuplicateCNF
    Created on : Jul 2, 2025, 7:28:29 PM
    Author     : rafli
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:DUPLICATE'}">
            <div id="judul">Duplicate Confirmation List</div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>MT</th>
                            <th>I/O</th>
                            <th>Logical terminal</th>
                            <th>Correspondent</th>
                            <th>Reference</th>
                            <th>Creation date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${duplicateCNF}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td>${item.messageType}</td>
                            <td>${item.io_type}</td>
                            <td>${item.logicalTerminal}</td>
                            <td>${item.receiverAddress}</td>
                            <td><a href="ViewDataTransaksiOutgoing?id=<c:out value="${item.id_headers}"/>"><c:out value="${item.tag20}"/></a></td>
                            <td>${item.tanggal}</td>
                            <td>${item.flag}</td>
                            <td><a href="ViewDataTransaksiOutgoing?id=<c:out value="${item.id_headers}"/>">View</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </c:forEach>
</div><!--close content-->
<script>
    $(document).ready(function () {
        $('#example').DataTable({
            "scrollX": true,
            "columnDefs": [
                {
                    "className": "dt-head-left", "targets": "_all"
                },
                {
                    orderable: false, targets: [0, 8]
                }
            ]
        });
    });
</script>