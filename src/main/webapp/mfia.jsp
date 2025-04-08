<%@ include file="header.jsp" %>
<%@ include file="rule/validate_mbcode.jsp" %>
<div id="isi"> id,source,mtormx,needcheckaml,needconverted,sourceto
    <c:forEach var="roleItem" items="${role}">
        <c:if test="${roleItem == 'MEMBER_CODE:ADD'}">
            <div id="judul">Add FIA config
                <c:forEach var="roleItem2" items="${role}">
                    <c:if test="${roleItem2 == 'MEMBER_CODE:LIST'}">
                        <a href="SCFIAList" class="srb3">FIA config List</a>
                    </c:if>
                </c:forEach>
            </div>
            <form id="form1" name="form1" method="post" action="SCFIA">
                <input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>" />
                <div id="tabs-1" class="formBody">
                    <div class="form-row">
                        <span class="labelL2">Source<b style="color: red">*</b></span>
                        <input type="text" name="source" id="source" maxlength="12" value="<c:out value="${fiaById.source}" />" 
                              style="text-transform: uppercase;" 
                              oninput="this.value = this.value.toUpperCase();" />
                    </div>

                    <div class="form-row">
                        <span class="labelL2">Message Type <b style="color: red">*</b></span>
                        <input type="text" name="mtormx" id="company" maxlength="45" value="<c:out value="${fiaById.mtormx}" />"
                              style="text-transform: uppercase;" 
                              oninput="this.value = this.value.toUpperCase();"
                              />
                    </div>
                    <div class="form-row">
                        <span class="labelL2">Need Check AML <b style="color: red">*</b></span>
                        <input type="text" name="needcheckaml" id="needcheckaml" maxlength="45" value="<c:out value="${fiaById.needcheckaml}" />"
                              />
                    </div>
                    <div class="form-row">
                        <span class="labelL2">Need Converted <b style="color: red">*</b></span>
                        <input type="text" name="needconverted" id="needconverted" maxlength="45" value="<c:out value="${fiaById.needconverted}" />"
                              />
                    </div>
                    <div class="form-row">
                        <span class="labelL2">Source To</span>
                        <textarea name="sourceto" id="sourceto" style="text-transform: uppercase"><c:out value="${fiaById.sourceto}" /></textarea>
                    </div>
                </div>
                <div class="form-row-action">
                    <input type="submit" name="submit" id="submit" value="Save" />
                    <input type="reset" name="reset" id="reset" value="Reset" />
                    <input type="button" name="back" id="back" value="Back" />
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>
