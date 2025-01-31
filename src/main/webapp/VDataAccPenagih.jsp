<%-- 
    Document   : VDataAccPenagih
    Created on : Jul 5, 2019
    Author     : Andhita Deara
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'ACCP:LIST'}">
            <div id="judul">List of Account Penagihan
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'ACCP:ADD'}">
                        <a href="addAccPenagih.jsp" class="srb2">Add Account Penagihan</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Account</th>
                            <th>Currency</th>
                            <th>Swift Code Nostro BMI</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataAccPenagih}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VDataAccPenagih?id_account=${item.id_account}">${item.account}</a></td>
                            <td>${item.currency}</td>
                            <td>${item.swift_code}</td>
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