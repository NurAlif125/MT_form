<%-- 
    Document   : VDataFeeRemit
    Created on : Jun 3, 2022, 11:07:46 AM
    Author     : ovasae
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'S_LIMIT:LIST'}">
            <div id="judul">List of Swift Go Limit
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'S_LIMIT:ADD'}">
                        <a href="addSwiftLimit.jsp" class="srb2">Add Swift Go Limit</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Currency</th>
                            <th>Amount</th>
                            <th>Update By</th>
                            <th>Update Date</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataSwiftLimit}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VDataSwiftLimit?limit_id=${item.limit_id}">${item.currency}</a></td>
                            <td>${item.amount}</td>
                            <td>${item.updateby}</td>
                            <td>${item.updateDate}</td>
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