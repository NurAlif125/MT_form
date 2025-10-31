<%-- 
    Document   : backup
    Created on : Oct 16, 2017, 3:27:09 PM
    Author     : AplDev2
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:HOUSEKEEPING'}">
            <div id="judul">Transaction Archiving</div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="SCArchive">
                    <% Date tgl_today = new java.util.Date();
                        pageContext.setAttribute("tgl_today", tgl_today);%>
                    <c:set var="tgl_today" value="${tgl_today}" />
                    <input type="hidden" id="user_id" name="user_id" value="<%out.print((String) session.getAttribute("user_id"));%>"/>
                    <input type="hidden" id="action" name="action" value="1"/>
                    <div id="tabs-1">
                        <table class="tablebackup" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><b>From Date</b>
                                    <input type="text" maxlength="10" size="10" name="date_from" id="date_from" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />" />
                                </td>
                                <td><b>To Date</b>
                                    <input type="text" maxlength="10" size="10" name="date_end" id="date_end" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />" />
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><b>Action</b><br>
                                    <input type="submit" name="archive" id="archive" value="Archive" />
                                    <input type="reset" name="reset" id="reset" value="Reset" />   
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
            <div id="judul">Last Archiving</div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Type</th>
                            <th>Date</th>
                            <th>Action</th>
                            <th>User</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${archive}" var="item">
                        <tr>
                            <td><%=rowNum++%></td>
                            <c:choose>
                                <c:when test="${item.action == 1}">
                                    <td>Backup</td>
                                </c:when>    
                                <c:otherwise>
                                    <td>Restore</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${item.dateAction}</td>
                            <td>${item.task}</td>
                            <td>${item.userId}</td>
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