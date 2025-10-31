<%-- 
    Document   : VDataNostro
    Created on : Jan 12, 2021
    Author     : Ovasae
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'NOSTRO:LIST'}">
            <div id="judul">List of Nostro
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'NOSTRO:ADD'}">
                        <a href="addNostro.jsp" class="srb2">Add Nostro</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nostro</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>SSL No</th>
                            <th>SSL Name</th>
                            <th>Currency Codes</th>
                            <th>Acc No</th>
                            <th>City</th>
                            <th>Country</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataNos}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VDataNostro?id_member=${item.id_member}">${item.swift_code}</a></td>
                            <%--<td>${item.swift_code}</td>--%>
                            <td>${item.name}</td>
                            <td>${item.address}</td>
                            <td>${item.ssl_no}</td>
                            <td>${item.ssl_name}</td>
                            <td>${item.currency_codes}</td>
                            <td>${item.acc_no}</td>
                            <td>${item.city}</td>
                            <td>${item.country}</td>
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