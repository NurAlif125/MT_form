<%-- 
    Document   : viewDuplicate
    Created on : Apr 9, 2013, 10:07:27 PM
    Author     : hadi
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:DUPLICATE'}">
            <div id="judul">Duplicate List</div>
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
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${duplicate}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td>${item.messageType}</td>
                            <td>${item.io_type}</td>
                            <td>${item.logicalTerminal}</td>
                            <td>${item.receiverAddress}</td>
                            <td><a href="ViewDataTransaksiOutgoing?id=${item.id_headers}">${item.tag20}</a></td>
                            <td>${item.tanggal}</td>
                            <td>${item.flag}</td>
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
                }
            ]
        });
    });
</script>