<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'COT:LIST'}">
            <div id="judul">List of Cut Off Time
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'COT:ADD'}">
                        <a href="addCutOf.jsp" class="srb2">Add Cut Of Time</a>
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
                            <th>Opening Time</th>
                            <th>Cut Off Time</th>
                            <th>Description</th>
                            <th>Updated By</th>
                            <th>Last Update</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${dataCot}" var="item">
                            <tr>
                                <td><%=rowNum++%></td>
                                <td><a href="VDataCOT?id_sandi=${item.id_sandi}">${item.sandi}</a></td>
                                <td>${item.waktu}</td>
                                <td>${item.waktu_end}</td>
                                <td>${item.deskripsi}</td>
                                <td>${item.updateBy}</td>
                                <td>${item.updateDate}</td>
                                <td><a href="VDataCOT?id_sandi=${item.id_sandi}">Edit</a></td> 
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