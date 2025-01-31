<%-- 
    Document   : addSwiftLimit
    Created on : May 4, 2023, 4:36:55 PM
    Author     : ovasae
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<%@ include file="rule/validate_swift_go_limit.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/mt.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'S_LIMIT:ADD'}">
            <div id="judul">Add Swift Go Limit
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'S_LIMIT:LIST'}">
                        <a href="SCDataSwiftLimitList" class="srb3">Swift Go Limit List</a>
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
                <form id="form1" name="form1" method="post" action="SCDataSwiftLimit">
                   <input type="hidden" name="limit_id" id="limit_id" value='<%=request.getParameter("limit_id")%>' />
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL3">Currency</span>
                            <input type="text" name="currency" id="currency" maxlength="3" autocomplete="off" value="<c:out value="${dataSwiftLimitById.currency}" />" />
                        </div>
                        <div class="form-row"><span class="labelL3">Amount</span>
                            <input type="text" name="amount" id="amount" maxlength="15" autocomplete="off" value="<c:out value="${dataSwiftLimitById.amount}" />" onkeypress="return numbersonly(event, 'currency');" />
                        </div>
                        <div class="form-row"><span class="labelL3">Update By</span>
                            <input type="text" name="updateby" id="updateby" readonly="true" maxlength="45" value="<c:out value="${dataSwiftLimitById.updateby}" />" />
                        </div>
                        <div class="form-row"><span class="labelL3">Update Date</span>
                            <input type="text" name="value_date" id="value_date" readonly="true" maxlength="32" value="<c:out value="${dataSwiftLimitById.updateDate}" />" />
                        </div>
                    </div>
                    <!--                <div class="form-row"><span class="labelL2">&nbsp;</span>-->
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
