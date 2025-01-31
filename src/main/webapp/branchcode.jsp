<%--
    Document   : branchcode
    Created on : Jan 31, 2013, 5:36:52 PM
    Author     : hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_branchcode.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
<c:forEach var="item" items="${role}">
    <c:if test="${item == 'BRANCH_CODE:ADD'}">
        <div id="judul">Add Branch Code
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'BRANCH_CODE:LIST'}">
                        <a href="SCSandiKliringList" class="srb2">List of Branch Code</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="tabs-1">
            <form id="form1" name="form1" method="post" action="SCSandiKliring">
                <input type="hidden" name="id_sandi_kliring" id="id_sandi_kliring" value="<%=request.getParameter("id_sandi_kliring")%>" />
                <div id="tabs-1" class="formBody">
                    <div class="form-row"><span class="label">Kode : </span>
                        <input type="text" name="kode" id="kode" maxlength="5" value="<c:out value="${sandiKliringById.kode}" />" />
                    </div>
                    <div class="form-row"><span class="label">Uraian : </span>
                        <input type="text" name="uraian" id="uraian" maxlength="45" value="<c:out value="${sandiKliringById.uraian}" />" />
                    </div>
                    <div class="form-row"><span class="label">Sandi Kliring : </span>
                        <input type="text" name="sandi_kliring" id="sandi_kliring" maxlength="45" value="<c:out value="${sandiKliringById.sandi_kliring}" />" />
                    </div>
                    <div class="form-row"><span class="label">Address : </span>
                        <textarea name="address" id="address" ><c:out value="${sandiKliringById.address}" /></textarea>
                    </div>
                    <div class="form-row"><span class="label">Note : </span>
                        <textarea name="note" id="note" ><c:out value="${sandiKliringById.note}" /></textarea>
                    </div>
                </div>
<!--                <div class="form-row"><span class="label">&nbsp;</span>-->
                <div class="form-row-action">
                    <input type="submit" name="submit" id="submit" value="Save" />
                    <!--
                    <input type="button" name="delete" id="delete" value="Delete" />
                    -->
                    <input type="reset" name="reset" id="reset" value="Reset" />
                    <input type="button" name="back" id="back" value="Back" />
                </div>
            </form>
        </div>
    </c:if>
</c:forEach>
</div>