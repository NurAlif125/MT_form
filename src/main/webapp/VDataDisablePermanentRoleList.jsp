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
    <%-- <c:forEach var="item" items="${role}">
        <c:if test="${item == 'ROLE:DISABLEPERMANENT'}">--%>
            <div id="judul">List of Disable Permanent Role
                
            </div>
            <div id="message">
                <span class="style1">
                    <div align="center">
                       <% if(request.getParameter("action")==null){  %>
                        <% } else { %>
                       <c:out value="${message}"/>
                        <% }%>
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
                            <th>Disable Date</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${disablerole}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td>${item.role_name}</a></td>
                            <td>${item.role_desc}</td>
                            <td>${item.timeout}</td>
                            <td>${item.disable_permanent}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                
            </div><!--close content-->            
        <%-- </c:if>
    </c:forEach>--%>
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