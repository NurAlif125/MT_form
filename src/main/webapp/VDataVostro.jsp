<%-- 
    Document   : VDataVostro
    Created on : Jun 10, 2022, 11:24:03 AM
    Author     : ovasae
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'VOSTRO:LIST'}">
            <div id="judul">List of Vostro
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'VOSTRO:ADD'}">
                        <a href="addVostro.jsp" class="srb2">Add Vostro</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Vostro</th>
                            <th>Name</th>
                            <th>Acc No</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataVostro}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VDataVostro?vostro_id=${item.vostro_id}">${item.swift_code}</a></td>
                            <td>${item.name}</td>
                            <td>${item.acc_no}</td>
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
