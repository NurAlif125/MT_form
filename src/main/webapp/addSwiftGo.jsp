<%@ include file="header.jsp" %>
<%@ include file="rule/validate_mbcode.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/mt.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'BIC_GO:ADD'}">
            <div id="judul">Add BIC
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'BIC_GO:LIST'}">
                        <a href="SCDataBICGoList" class="srb3"> Swift Go BIC List</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="message">
                <span class="style1">
                    <div align="center">
                        <c:out value="${errorMsg}"/>
                    </div>
                </span>
            </div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="SCDataBICGo">
                    <input type="hidden" name="id" id="id" value='<%=request.getParameter("swift_id")%>' />
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL2">Swift Go Code</span>
                            <input type="text" name="swift_code" id="swift_code" maxlength="11" value="<c:out value="${bicGoById.swift_code}" />" />
                        </div>
                        <div class="form-row"><span class="labelL2">Company</span>
                            <input type="text" name="company" id="company" maxlength="45" value="<c:out value="${bicGoById.company}" />" />
                        </div>
                        <div class="form-row"><span class="labelL2">Update By</span>
                            <input type="text" name="updateby" id="updateby" readonly="true" maxlength="45" value="<c:out value="${bicGoById.updateBy}" />" />
                        </div>
                        <div class="form-row"><span class="labelL2">Update Date</span>
                            <input type="text" name="update_date" readonly="true" maxlength="32" value="<c:out value="${bicGoById.updateDate}" />" />
                        </div>
                    </div>
                    <!--<div class="form-row"><span class="label">&nbsp;</span>-->
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