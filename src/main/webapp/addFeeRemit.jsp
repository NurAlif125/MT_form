<%-- 
    Document   : addFeeRemit
    Created on : Jun 3, 2022, 10:24:22 AM
    Author     : ovasae
--%>

<%@ include file="header.jsp" %>
<%--@ include file="rule/validate_feeRemit.jsp" --%>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'FEE_REMIT:ADD'}">
            <div id="judul">Add Fee Remittance
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'FEE_REMIT:LIST'}">
                        <a href="SCDataFeeRemitList" class="srb3">Fee Remittance List</a>
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
                <form id="form1" name="form1" method="post" action="SCDataFeeRemit">
                    <input type="hidden" name="fee_id" id="fee_id" value='<%=request.getParameter("fee_id")%>' />
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL3">Currency</span>
                            <input type="text" name="currency" id="currency" maxlength="3" autocomplete="off" value="<c:out value="${dataFeeRemitById.currency}" />" />
                        </div>
                        <div class="form-row"><span class="labelL3">Fee Amount</span>
                            <input type="text" name="fee_amount" id="fee_amount" maxlength="15" autocomplete="off" value="<c:out value="${dataFeeRemitById.fee_amount}" />" />
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