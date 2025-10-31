<%--
    Document   : addVerifiedAcc
    Created on : Jul 5, 2019
    Author     : Andhita Deara
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_ver_acc.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
<c:forEach var="item" items="${role}">
    <c:if test="${item == 'ACCV:ADD'}">
        <div id="judul">Add Verified Account
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'ACCV:LIST'}">
                        <a href="SCDataVerAccList" class="srb3">Verified Account List</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="tabs-1">
            <form id="form1" name="form1" method="post" action="SCDataVerifiedAcc">
                <input type="hidden" name="id_verAcc" id="id_verAcc" value="<%=request.getParameter("id_verAcc")%>" />
                <div id="tabs-1" class="formBody">
                    <div class="form-row"><span class="labelL2">Account</span>
                        <input type="text" name="acc" id="acc" maxlength="35" value="<c:out value="${dataAccVById.acc}" />" />
                    </div>
                    <div class="form-row"><span class="labelL2">Name From Transaction</span>
                        <input type="text" name="nameFromTrx" id="nameFromTrx" maxlength="255" value="<c:out value="${dataAccVById.nameFromTrx}" />" />
                    </div>
                    <div class="form-row"><span class="labelL2">Name From Core</span>
                        <input type="text" name="nameFromCore" id="nameFromCore" maxlength="255" value="<c:out value="${dataAccVById.nameFromCore}" />" />
                    </div>
                    <div class="form-row"><span class="labelL2">Verified</span>
                        <input type="text" name="verified" id="verified" maxlength="1" value="<c:out value="${dataAccVById.verified}" />" />
                    </div>
                    <div class="form-row"><span class="labelL2">Verified Date</span>
                        <input type="text" name="verified_date" id="verified_date" maxlength="10" value="<c:out value="${dataAccVById.verified_date}" />" />
                    </div>
                </div>
<!--                <div class="form-row"><span class="labelL2">&nbsp;</span>-->
                <div class="form-row-action">
                    <input type="submit" name="submit" id="submit" value="Save" />
                    <input type="submit" name="delete" id="delete" value="Delete" />
                    <input type="reset" name="reset" id="reset" value="Reset" />
                    <input type="button" name="back" id="back" value="Back" />
                </div>
            </form>
            <div id="dialog"></div>
        </div>
    </c:if>
</c:forEach>
</div>
<!--<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>-->