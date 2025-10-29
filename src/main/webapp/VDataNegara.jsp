<%-- 
    Document   : VDataCharges
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
        <c:if test="${item == 'CTY:LIST'}">
            <div id="judul">List of Country Suspect
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'CTY:ADD'}">
                        <a href="addnegara.jsp" class="srb2">Add Country</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Country Code</th>
                            <th>Country Name</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataNegara}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VDataNegara?id_negara=${item.id_negara}">${item.kode_negara}</a></td>
                            <td>${item.nama_negara}</td>
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