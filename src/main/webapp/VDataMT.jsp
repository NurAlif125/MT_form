<%-- 
    Document   : VDataMT.jsp
    Created on : 20180731 9.39
    Author     : Azan
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT_QUEUE:LIST'}">
            <div id="judul">List of Message Queue
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'MT_QUEUE:ADD'}">
                        <a href="addMT.jsp" class="srb2">Add Message Queue</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>MT/MX</th>
                            <th>Detail</th>
                            <th>Queue</th>
                            <th>Last Update</th>
                            <th>Update by</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataMT}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VDataMT?id=${item.id}">${item.mt}</a></td>
                            <td>${item.detail}</td>
                            <td>${item.queue}</td>
                            <td>${item.updatedate}</td>
                            <td>${item.updateby}</td>
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