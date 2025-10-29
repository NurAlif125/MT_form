<%--
    Document   : VBic
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MEMBER_CODE:LIST'}">
            <div id="judul">List of BIC
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'MEMBER_CODE:ADD'}">
                        <a href="mbic.jsp" class="srb2">Add BIC</a>
                        <a href="uploadbic.jsp" class="srb4">Upload BIC</a> <!-- 20191230 -->
                    </c:if>
                </c:forEach>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>BIC</th>
                            <th>Company</th>
                            <th>Address</th>
                            <th>Note</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${bic}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VBIC?id_member=${item.id_member}">${item.code_member}</a></td>
                            <td>${item.company}</td>
                            <td>${item.address}</td>
                            <td>${item.note}</td>
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