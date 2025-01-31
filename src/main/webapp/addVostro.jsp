<%-- 
    Document   : addVostro
    Created on : Jun 10, 2022, 11:18:43 AM
    Author     : ovasae
--%>

<%@ include file="header.jsp" %>
<%--@ include file="rule/validate_nostro.jsp" --%>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'VOSTRO:ADD'}">
            <div id="judul">Add Vostro
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'VOSTRO:LIST'}">
                        <a href="SCDataVostroList" class="srb3">Vostro List</a>
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
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="SCDataVostro">
                    <input type="hidden" name="vostro_id" id="vostro_id" value='<%=request.getParameter("vostro_id")%>' />
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL3">Swift Code [Example : CITIUS33<b style="color: red">X</b>BUD]</span>
                            <input type="text" name="swift_code" id="swift_code" maxlength="12" minlength="12" autocomplete="off" value="<c:out value="${dataVostroById.swift_code}" />" />
                        </div>
                        <div class="form-row"><span class="labelL3">Name</span>
                            <input type="text" name="name" id="name" maxlength="120" autocomplete="off" value="<c:out value="${dataVostroById.name}" />" />
                        </div>
                        <div class="form-row"><span class="labelL3">Account Number</span>
                            <input type="text" name="acc_no" id="acc_no" maxlength="34" autocomplete="off" value="<c:out value="${dataVostroById.acc_no}" />" />
                        </div>
                    </div>
                    <div class="form-row-action">
                        <input type="submit" name="submit" id="submit" class="trigger_popup_fricc" value="Save" />
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