<%@ include file="header.jsp" %>
<div id="isi">
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
                        <span class="labelL2">Source</span>
                        <input type="text" name="source" id="source" maxlength="12" value="<c:out value='${fiaById.source}' />" /> 
                    </div>

                    <div class="form-row">
                        <span class="labelL2">Message Type </span>
                        <input type="text" name="mtormx" id="mtormx" maxlength="45" value="<c:out value='${fiaById.mtormx}' />"/>
                    </div>
                    <div class="form-row">
                        <span class="labelL2">Need Check AML </span>
                        <label for="needcheckaml_yes">
                            <input type="radio" name="needcheckaml" id="needcheckaml_yes" value="1"
                                <c:if test="${fiaById.needcheckaml == '1'}">checked</c:if> />
                            Yes
                        </label>

                        <label for="needcheckaml_no" style="margin-left: 1em;">
                            <input type="radio" name="needcheckaml" id="needcheckaml_no" value="0"
                                <c:if test="${fiaById.needcheckaml == '0'}">checked</c:if> />
                            No
                        </label>
                    </div>
                    <div class="form-row">
                        <span class="labelL2">Need Converted </span>
                        <label for="needconverted_yes">
                            <input type="radio" name="needconverted" id="needconverted_yes" value="1"
                                <c:if test="${fiaById.needconverted == '1'}">checked</c:if> />
                            Yes
                        </label>
                        <label for="needconverted_no" style="margin-left: 1em;">
                            <input type="radio" name="needconverted" id="needconverted_no" value="0"
                                <c:if test="${fiaById.needconverted == '0'}">checked</c:if> />
                            No
                        </label>
                    </div>
                    <div class="form-row">
                        <span class="labelL2">Source To</span>
                        <textarea name="sourceto" id="sourceto" ><c:out value="${fiaById.sourceto}" /></textarea>
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
