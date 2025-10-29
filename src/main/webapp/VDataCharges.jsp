<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'CRG:LIST'}">
            <div id="judul">List of Charges
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'CRG:ADD'}">
                        <a href="addcharges.jsp" class="srb2">Add Charges</a>
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
                            <th>Charges</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataCharges}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VDataCharges?id_charges=${item.id_charges}">${item.currency}</a></td>
                            <td>${item.charges}</td>
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