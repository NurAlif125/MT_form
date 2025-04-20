<%-- 
    Document   : VDataUser
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
        <c:if test="${item == 'USER:LIST'}">
            <div id="judul">List of User
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'USER:ADD'}">
                        <a href="adduser.jsp" class="srb2">Add User</a>
                    </c:if>
                </c:forEach>
            </div>
<!--            <div id="message">
                <span class="style1">
                    <div align="center">
                        <c:out value="${message}"/>
                    </div>
                </span>
            </div>-->
            <c:if test="${not empty sessionScope.message}">
                <div id="message">
                    <span class="style1">
                        <div align="center">
                            <c:out value="${sessionScope.message}" />
                        </div>
                    </span>
                </div>
                <c:remove var="message" scope="session" />
            </c:if>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>User Id</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Role</th>
                            <th>Status</th>
                            <!--<th>Action</th>-->
                            <!--<th>Auto Disable</th>-->
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${dataUser}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <td><a href="VDataUser?user_id=${item.user_id}">${item.user_id}</a></td>
                            <td>${item.name}</td>
                            <td>${item.description}</td>
                            <td>${item.role_name}</td>
                        <c:choose>
                            <c:when test="${item.enable == 1}">
                                <td>Enable</td>
                            </c:when>    
                            <c:otherwise>
                                <td>Disable</td>
                            </c:otherwise>
                        </c:choose>
                            <%--<td>${item.auto_disable}</td>--%>
                        <!--<td><a href="ResetPassword?user_id=${item.user_id}">Reset password</a></td>-->
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