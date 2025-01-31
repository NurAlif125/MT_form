<%--
    Document  addcharges
    Created on Jan 31, 2013, 5:36:52 PM
    Author    hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_charges.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/mt.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'CRG:ADD'}">
            <div id="judul">Add Charges
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'CRG:LIST'}">
                        <a href="SCDataChargesList" class="srb3">Charges List</a>
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
                <form id="form1" name="form1" method="post" action="SCDataCharges">
                    <input type="hidden" name="id_charges" id="id_charges" value='<%=request.getParameter("id_charges")%>' />
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL2">Currency</span>
                            <input type="text" name="currency" id="currency" maxlength="3" value="<c:out value="${dataChargesById.currency}" />" />
                        </div>
                        <div class="form-row"><span class="labelL2">Charges</span>
                            <input type="text" name="charges" id="charges" maxlength="18" value="<c:out value="${dataChargesById.charges}" />" onkeypress="return numbersonly(event, '_061_mf32a_currency');" />
                        </div>
                    </div>
                    <!--                <div class="form-row"><span class="labelL2">&nbsp;</span>-->
                    <div class="form-row-action">
                        <input type="submit" name="submit" id="submit" value="Save" />
                        <% if(request.getParameter("id_charges") != null) { %> 
                    <a href="SCDataCharges?action=delete&id_charges=<%=request.getParameter("id_charges")%>">
                        <input type="button" name="delete" id="delete" value="Delete" /></a>
                     <% } %>
                        <input type="reset" name="reset" id="reset" value="Reset" />
                        <input type="button" name="back" id="back" value="Back" />
                    </div>

                </form>
                <div id="dialog"></div>
            </div>
        </c:if>
    </c:forEach>
</div>
<!--<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>-->