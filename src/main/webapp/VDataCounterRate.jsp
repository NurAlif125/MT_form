<%-- 
    Document   : VDataCounterRate
    Created on : Aug 17, 2023, 10:22:42 PM
    Author     : Baim
--%>

<%@include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'CTR:LIST'}"> 
            <div id="judul">List Counter Rate
                <c:forEach var="item" items="${role}"><c:if test="${item == 'CTR:ADD'}">
                        <a href="addcounterrate.jsp" class="srb2">Add Counter Rate</a>
                    </c:if>                       
                </c:forEach>
              <c:forEach var="item" items="${role}"><c:if test="${item == 'CTR:UPLOAD'}">                       
                        <a href="UploadCounterrate.jsp" class="srb4">Upload</a>
                    </c:if></c:forEach>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>Currency</th>
                            <th>Against Currency</th>
                            <th>Date</th>
                            <th>TC BUY</th>
                            <th>TT BUY</th>
                            <th>TC SELL</th>
                            <th>TT SELL</th>
                            <th>Margin Point</th>
                            <th>Update By</th>
                            <th>Update Date</th>                             
                    <c:forEach var="item" items="${role}">
                        <c:if test="${item =='CTR:VIEW'}"> <th>Action</th> 
                        </c:if></c:forEach>    
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${datacounterrate}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td>${item.currency}</td>
                            <td>${item.against_currency}</td>
                            <td>${item.tanggal}</td>
                            <td>${item.tc_buy}</td>
                            <td>${item.tt_buy}</td>
                            <td>${item.tc_sell}</td>
                            <td>${item.tt_sell}</td>
                            <td>${item.margin_point}</td>
                            <td>${item.update_by}</td>
                            <td>${item.update_date}</td>
                        <c:forEach var="role" items="${role}">
                            <c:if test="${role =='CTR:VIEW'}"> <td><a href="VDataCounterRate?id=${item.id}">View </a></td> 
                            </c:if></c:forEach>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
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

