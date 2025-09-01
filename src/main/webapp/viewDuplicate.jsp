<%-- 
    Document   : viewDuplicate
    Created on : Apr 9, 2013, 10:07:27 PM
    Author     : hadi
--%>

<%@ include file="header.jsp" %>

<link type="text/css" href="css/paging/pagingheader.css" rel="stylesheet" />
<script src="js/jquery-3.7.1.min_cdn"></script>
<script src="js/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"></script>

<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:DUPLICATE'}">
            <div id="judul">Duplicate List</div>
            <div id="rowsearch">
                <a href="List_scr.jsp" class="btnLink">Advance search</a>
                <div class="my-navigation">
                    <div class="simple-help"><a id="myBtn" style="cursor:pointer;" ><img class="img-help" src="images/help.png"/></a></div>
                </div>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>MT</th>
                            <th>I/O</th>
                            <th>Logical terminal</th>
                            <th>Correspondent</th>
                            <th>Reference</th>
                            <th>Creation date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </c:if>
    </c:forEach>
</div><!--close content-->
<script type="text/javascript" src="js/viewDuplicate.js"></script>