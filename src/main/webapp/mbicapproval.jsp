<%-- 
    Document   : mbicapproval
    Created on : May 4, 2025, 3:30:36 PM
    Author     : rafli
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_mbcode.jsp" %>
<div id="isi">
    <c:forEach var="roleItem" items="${role}">
        <c:if test="${roleItem == 'MEMBER_CODE:APPROVAL'}">
            <div id="judul">Approve BIC
                <c:forEach var="roleItem2" items="${role}">
                    <c:if test="${roleItem2 == 'MEMBER_CODE:LIST'}">
                        <a href="SCBICList" class="srb3">BIC List</a>
                    </c:if>
                </c:forEach>
            </div>
            <form id="form1" name="form1" method="post" action="SCBICApproval">
                <input type="hidden" name="id_member" id="id_member" value="<%=request.getParameter("id_member")%>" />
                <div id="tabs-1" class="formBody">
                    <div class="form-row">
                        <span class="labelL2">BIC <b style="color: red">*</b></span>
                        <input type="text" name="code_member" id="code_member" maxlength="12" value="<c:out value="${bicById.code_member}" />" 
                               style="text-transform: uppercase;" 
                               oninput="this.value = this.value.toUpperCase();" readonly="true" />
                    </div>

                    <div class="form-row">
                        <span class="labelL2">Company <b style="color: red">*</b></span>
                        <input type="text" name="company" id="company" maxlength="45" value="<c:out value="${bicById.company}" />"
                               style="text-transform: uppercase;" 
                               oninput="this.value = this.value.toUpperCase();" readonly="true" />
                    </div>
                    <div class="form-row">
                        <span class="labelL2">Address</span>
                        <textarea name="address" id="address" style="text-transform: uppercase" readonly="true"><c:out value="${bicById.address}" /></textarea>
                    </div>
                    <div class="form-row">
                        <span class="labelL2">Note</span>
                        <textarea name="note" id="note" readonly="true"><c:out value="${bicById.note}" /></textarea>
                    </div>
                </div>
                <div class="form-row-action">
                    <input type="submit" name="approvebic" id="approvebic" value="Approve" />
                    
                    <input type="submit" name="rejectbic" id="rejectbic" value="Reject" />
                    
                    <input type="button" name="back" id="back" value="Back" />
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>