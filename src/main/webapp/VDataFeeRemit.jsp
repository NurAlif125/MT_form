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
        <c:if test="${item == 'FEE_REMIT:LIST'}">
            <div id="judul">List of Nostro
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'FEE_REMIT:ADD'}">
                        <a href="addFeeRemit.jsp" class="srb2">Add Fee Remittance</a>
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
                            <th>Fee Amount</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataFRemit}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VDataFeeRemit?fee_id=${item.fee_id}">${item.currency}</a></td>
                            <td>${item.fee_amount}</td>
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