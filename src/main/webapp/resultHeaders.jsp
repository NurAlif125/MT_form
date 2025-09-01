<%-- 
    Document   : controllerHeaders
    Author     : Azan
--%>

<%@ include file="header.jsp" %>
<link type="text/css" href="css/paging/pagingheader.css" rel="stylesheet" />
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <div id="judul">List Search Result</div>
    <input type="button" name="back" id="back" value="Back" class="srb" />
    <div id="content">
        <div id="third-container">
            <div class="my-navigation">
                <div class="simple-pagination-first"></div>
                <div class="simple-pagination-previous"></div>
                <div class="simple-pagination-page-numbers"></div>
                <div class="simple-pagination-next"></div>
                <div class="simple-pagination-last"></div>
            </div>
            <%int rowNum = 1;%>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to authorize the data(s)?');">
                <c:if test="${flagFilter == 'VER'}">
                    <c:forEach var="item" items="${role}">
                        <c:if test="${item == 'FLOW:AUTH'}">
                            <input type="submit" value="Authorize">
                            <input type="hidden" id="flag" name="flag" value="AUTH">
                        </c:if>
                    </c:forEach>
                </c:if>
                <table class="fixed_header" id="mytable" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                    <c:if test="${flagFilter == 'VER'}">
                        <th style="width:2%;"><input type="checkbox" name="chkAll" id="chkAll"></th>
                    </c:if>
                    <th style="width:3%; padding-right: 5px;">No</th>
                    <th style="width:15%;" >Creation Date</th>
                    <th style="width:5%;" >MT</th>
                    <th style="width:10%;" >I/O</th>
                    <th style="width:10%;" >Logical Terminal</th>
                    <th style="width:10%;" >Receiver Address</th>
                    <th style="width:15%;" >Reference</th>
                    <th style="width:15%;" >Rel. Reference</th>
                    <th style="width:15%;">Date # Currency # Amount</th>
                    <th style="width:5%;" >Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${headers}" var="item">
                        <tr>
                        <c:if test="${flagFilter == 'VER'}">
                            <td style="width:2%;"><input type="checkbox" name="chkId" id="chkId" value="${item.id_headers}"></td>
                        </c:if>
                        <td style="width:3%; text-align: right;"><%=rowNum++%></td>
                        <td style="width:15%;">${item.tanggal}</td>
                        <td style="width:5%;">${item.messageType}</td>
                        <td style="width:10%;">${item.io_type}</td>
                        <td style="width:10%;">${item.logicalTerminal}</td>
                        <td style="width:10%;">${item.receiverAddress}</td>
                        <td style="width:15%;"><a href="ViewDataTransaksiOutgoing?id=${item.id_headers}">${item.tag20}</a></td>
                        <td style="width:15%;">${item.tag21}</td>
                        <td style="width:15%;">${item.tag32Amount}</td>
                        <td style="width:5%;">${item.flag}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
            <div class="my-navigation">
                <div class="simple-pagination-first"></div>
                <div class="simple-pagination-previous"></div>
                <div class="simple-pagination-page-numbers"></div>
                <div class="simple-pagination-next"></div>
                <div class="simple-pagination-last"></div>
            </div>
            <div class="simple-pagination-page-x-of-x"></div>
            <div class="simple-pagination-showing-x-of-x"></div>
            <div>
                Display <select class="simple-pagination-items-per-page"></select> items per page.
            </div>
        </div>
    </div><!--close content-->
</div>
<script type="text/javascript" src="js/resultHeaders.js"></script>