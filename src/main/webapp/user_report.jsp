<%--
    Document   : user_report.jsp
    Author     : Azan
--%>

<%@ include file="header.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:REPORTING'}">
            <div id="judul">User Report</div>
            <form id="form1" name="form1" method="post" action="#">
                <div id="tabs-1" class="formBody">
                    <div class="form-row"><span class="labelL2">Status</span>
                        <select name="status" id="status">
                            <option value="">All</option>
                            <option value="1">Enable</option>
                            <option value="0">Disable</option>
                        </select>
                    </div>
                </div>
<!--                <div class="form-row"><span class="labelL2">&nbsp;</span>-->
                <div class="form-row-action">
                    <input type="button" name="print_pdfu" id="print_pdfu" value="View" />
<!--                    <input type="button" name="print_xlsu" id="print_xlsu" value="View XLS" />-->
<!--                    <input type="reset" name="reset" id="reset" value="Reset" />-->
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>