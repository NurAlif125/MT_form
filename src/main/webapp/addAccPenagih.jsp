<%--
    Document   : addAccPenagih
    Created on : Jul 5, 2019
    Author     : Andhita Deara
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_acc_penagih.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'ACCP:ADD'}">
            <div id="judul">Add Account Penagih
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'ACCP:LIST'}">
                        <a href="SCDataAccPenagihanList" class="srb3">Account Penagih List</a>
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
                <form id="form1" name="form1" method="post" action="SCDataAccPenagihan">
                    <input type="hidden" name="id_account" id="id_account" value='<%=request.getParameter("id_account")%>' />
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL2">Currency</span>
                            <input type="text" name="currency" id="currency" maxlength="3" value="<c:out value="${dataAccPById.currency}" />" />
                        </div>
                        <div class="form-row"><span class="labelL2">Swift Code Nostro BMI</span>
                            <input type="text" name="swift_code" id="swift_code" maxlength="11" value="<c:out value="${dataAccPById.swift_code}" />" />
                        </div>
                        <div class="form-row"><span class="labelL2">Account</span>
                            <input type="text" name="account" id="account" maxlength="35" value="<c:out value="${dataAccPById.account}" />" />
                        </div>
                    </div>
                    <!--                <div class="form-row"><span class="labelL2">&nbsp;</span>-->
                    <div class="form-row-action">
                        <input type="submit" name="submit" id="submit" class="trigger_popup_fricc" value="Save" />
                        <input type="submit" name="delete" id="delete" value="Delete" />
                        <input type="reset" name="reset" id="reset" value="Reset" />
                        <input type="button" name="back" id="back" value="Back" />
                    </div>
                    <!--                <div class="hover_bkgr_fricc">
                                        <span class="helper"></span>
                                        <div>
                                            <div class="popupCloseButton">&times;</div>
                                            
                                            <p>${message}<br /></p>
                                        </div>
                                    </div>-->
                </form>
                <div id="dialog"></div>
            </div>
        </c:if>
    </c:forEach>
</div>
<!--<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>-->