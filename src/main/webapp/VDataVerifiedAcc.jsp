<%-- 
    Document   : VDataVerifiedAcc
    Created on : Jul 23, 2019
    Author     : Andhita Deara
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'ACCV:LIST'}">
            <div id="judul">List of Verified Account
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Account</th>
                            <th>Name From Transaction</th>
                            <th>Name From Core</th>
                            <th>Status</th>
                            <th>Verified Date</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataVerAcc}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td>${item.acc}</td>
                            <td>${item.nameFromTrx}</td>
                            <td>${item.nameFromCore}</td>
                            <c:choose>
                                <c:when test="${item.verified == 1}">
                                    <td>Verified</td>
                                </c:when>    
                                <c:otherwise>
                                    <td>Not Verified</td>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${item.verified == 1}">
                                    <td>${item.verified_date}</td>
                                </c:when>    
                                <c:otherwise>
                                    <td></td>
                                </c:otherwise>
                            </c:choose>
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