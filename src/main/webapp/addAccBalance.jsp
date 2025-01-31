<%-- 
    Document   : addAccBalance
    Created on : Jan 31, 2022, 10:14:45 AM
    Author     : ovasae
--%>
<%@ taglib prefix "c" uri="jakarta.tags.core" %>
<%@ include file="header.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<%@ include file="rule/validate_acc_balance.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/mt.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'ACCB:ADD'}">
            <div id="judul">Add Account Balance
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'ACCB:LIST'}">
                        <a href="SCDataBalanceList" class="srb3">Account Balance List</a>
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
                <form id="form1" name="form1" method="post" action="SCDataAccBalance">
                    <input type="hidden" name="id_account" id="id_account" value='<%=request.getParameter("id_account")%>' />
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL2">Account</span>
                            <input type="text" name="account" id="account" maxlength="35" required="true" value="<c:out value="${dataAccBById.account}" />" />
                        </div>
                        <div class="form-row"><span class="labelL2">Date</span>
                            <input type="text" name="balance_date" id="balance_date" required="true" maxlength="6" value="<c:out value="${dataAccBById.value_date}" />" />
                        </div>
                        <div class="form-row"><span class="labelL2">Balance</span>
                            <input type="text" name="balance" id="balance" required="true" maxlength="35" value="<c:out value="${dataAccBById.balance}" />" onkeypress="return numbersonly(event, 'currency');" />
                            <input type="hidden" id="currency" value="" />
                        </div>
                        <div class="form-row"><span class="labelL2">Always Send</span>
                            <select id="always_send" name="always_send" required="true">
                                <option value="0" <c:if test="${dataAccBById.always_send=='0'}"> selected </c:if>>No</option>
                                <option value="1" <c:if test="${dataAccBById.always_send=='1'}"> selected </c:if>>Yes</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="labelL2">Sequence Statement</span>
                            <input type="text" name="sequence_stmt" id="sequence_stmt" readonly="true" maxlength="1" value="<c:out value="${dataAccBById.sequence_stmt}" />" />
                        </div>
                        <div class="form-row"><span class="labelL2">Sequence Date</span>
                            <input type="text" name="sequence_date" id="sequence_date" readonly="true" maxlength="6" value="<c:out value="${dataAccBById.sequence_date}" />" />
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