<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'BIC_GO:LIST'}">
            <div id="judul">List of BIC GO
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'BIC_GO:ADD'}">
                        <a href="addSwiftGo.jsp" class="srb2">Add Swift Go BIC</a>
                    </c:if>
                    <c:if test="${(item == 'BIC_GO:UPLOAD')}">
                        <a href="upload_swift_go.jsp" class="srb4">Upload Swift Go BIC</a>
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
                            <th>Update By</th>
                            <th>Update Date</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataSwiftGo}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VDataSwiftGo?swift_id=${item.swift_id}">${item.swift_code}</a></td>
                            <td>${item.company}</td>
                            <td>${item.updateBy}</td>
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