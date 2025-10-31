<%-- 
    Document   : VDataAccBalance
    Created on : Jan 31, 2022, 10:12:35 AM
    Author     : ovasae
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'ACCB:LIST'}">
            <div id="judul">List of Account Balance
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'ACCB:ADD'}">
                        <a href="addAccBalance.jsp" class="srb2">Add Account Balance</a>
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
                            <th>Date</th>
                            <th>Balance</th>
                            <th>Always Send</th>
                            <th>Sequence Statement</th>
                            <th>Sequence Date</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataAccBalance}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VDataAccBalance?id_account=${item.id_account}">${item.account}</a></td>
                            <td>${item.value_date}</td>
                            <td>${item.balance}</td>
                            <td>${item.always_send}</td>
                            <td>${item.sequence_stmt}</td>
                            <td>${item.sequence_date}</td>
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
