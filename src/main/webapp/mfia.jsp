<%@ include file="header.jsp" %>
<div id="isi">
    <c:forEach var="roleItem" items="${role}">
        <c:if test="${roleItem == 'FIACONF:ADD'}">
            <div id="judul">Add FIA config
                <c:forEach var="roleItem2" items="${role}">
                    <c:if test="${roleItem2 == 'FIACONF:LIST'}">
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
                        <span class="labelL2">Need Check AML</span>
                        <label for="needcheckaml_checkbox">
                            <input type="checkbox" name="needcheckaml" id="needcheckaml_checkbox" value="1"
                                <c:if test="${fiaById.needcheckaml == '1'}">checked</c:if> />
                            
                        </label>
                    </div>
                    <div class="form-row">
                        <span class="labelL2">Need Converted</span>
                        <label for="needconverted_checkbox">
                            <input type="checkbox" name="needconverted" id="needconverted_checkbox" value="1"
                                <c:if test="${fiaById.needconverted == '1'}">checked</c:if> />
                            
                        </label>
                    </div>                                                         
                    <div class="form-row">
                        <span class="labelL2">Source To</span>
                        <textarea name="sourceto" id="sourceto" ><c:out value="${fiaById.sourceto}" /></textarea>
                    </div>
                    <div class="form-row">
                        <span class="labelL2">Enable</span>
                        <label for="isenable_checkbox">
                            <input type="checkbox" name="isenable" id="isenable_checkbox" value="1"
                                <c:if test="${fiaById.isenable == '1'}">checked</c:if> />                           
                        </label>
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
