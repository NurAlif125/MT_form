<%-- 
    Document   : VDataRole
    Created on : Jan 31, 2013, 11:24:52 PM
    Author     : hadi
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'ROLE:LIST'}">
            <div id="judul">List of Role
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'ROLE:ADD'}">
                        <a href="addrole.jsp" class="srb2">Add Role</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="message">
                <span class="style1">
                    <div align="center">
                        <c:out value="${message}"/>
                    </div>
                </span>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Role Name</th>
                            <th>Description</th>
                            <th>Timeout</th>
                            <th>Status</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataRole}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VDataRole?role_id=${item.role_id}">${item.role_name}</a></td>
                            <td>${item.role_desc}</td>
                            <td>${item.timeout}</td>
                            <c:choose>
                                <c:when test="${item.role_enable == 1}">
                                    <td>Enable</td>
                                </c:when>    
                                <c:otherwise>
                                    <td>Disable</td>
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