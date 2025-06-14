<%-- 
    Document   : header_mt
    Created on : Aug 14, 2012, 6:48:05 AM
    Author     : M Abdul Hadi
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>--%>
<input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>" />
<div class="form-row"><span class="label_sub"><b>Sender</b></span></div>
<div class="form-row"><span class="label"><a style="color:red;text-decoration:none">*</a>Sender Logical Terminal</span>
    <c:choose>
        <c:when test="${headerById.io_type == null}">
            <select name="sender_logical_terminal" id="sender_logical_terminal">
                <c:choose>
                    <c:when test="${sessionScope.user_bic eq null or sessionScope.user_bic eq 'null'}">
                        <c:forEach var="item1" items="${sessionScope.dataBicProp}">
                            <option value="${item1}" <c:if test="${item1 == sessionScope.user_bic or item1==headerById.logicalTerminal}">selected="true"</c:if>>${item1}</option>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <option value="${sessionScope.user_bic}" selected="true">${sessionScope.user_bic}</option>
                    </c:otherwise>
                </c:choose>
<!--                <option value="BDINIDJAXXXX" <c:if test="${headerById.logicalTerminal=='BDINIDJAXXXX'}"> selected </c:if>>BDINIDJAXXXX</option>
                <option value="BDINIDJ0AXXX" <c:if test="${headerById.logicalTerminal=='BDINIDJ0AXXX'}"> selected </c:if>>BDINIDJ0AXXX</option>-->
            </select>
        </c:when>
        <c:when test="${headerById.io_type == 'I'}">
            <select name="sender_logical_terminal" id="sender_logical_terminal">
                <c:choose>
                    <c:when test="${sessionScope.user_bic eq null or sessionScope.user_bic eq 'null'}">
                        <c:forEach var="item1" items="${sessionScope.dataBicProp}">
                            <option value="${item1}" <c:if test="${item1 == sessionScope.user_bic or item1==headerById.logicalTerminal}">selected="true"</c:if>>${item1}</option>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <option value="${sessionScope.user_bic}" selected="true">${sessionScope.user_bic}</option>
                    </c:otherwise>
                </c:choose>
<!--                <option value="BDINIDJAXXXX" <c:if test="${headerById.logicalTerminal=='BDINIDJAXXXX'}"> selected </c:if>>BDINIDJAXXXX</option>
                <option value="BDINIDJ0AXXX" <c:if test="${headerById.logicalTerminal=='BDINIDJ0AXXX'}"> selected </c:if>>BDINIDJ0AXXX</option>-->
            </select>
        </c:when>
        <c:otherwise>
            <input type="text" name="sender_logical_terminal" id="sender_logical_terminal" maxlength="12" minlength="12" autocomplete="off" <c:choose><c:when test="${empty headerById.logicalTerminal}">value=""</c:when><c:otherwise>value="${headerById.logicalTerminal}"</c:otherwise></c:choose> />
        </c:otherwise>
    </c:choose>

</div>
<div class="form-row"><span class="label">Address Expansion</span> <!-- 20191230 -->
    <textarea name="address_sender_logical_terminal" id="address_sender_logical_terminal" disabled="true"><c:out value="${logicalTerminal}" /></textarea>
</div>
<hr/>
<div class="form-row"><span class="label_sub"><b>Receiver</b></span></div>
<div class="form-row"><span class="label"><a style="color:red;text-decoration:none">*</a>Institution</span>
    <input type="text" name="receiver_institution" id="receiver_institution" maxlength="12" minlength="12" autocomplete="off" input_type="Receiver Institution" location="Header" <c:choose><c:when test="${empty headerById.receiverAddress}">value=""</c:when><c:otherwise>value="${headerById.receiverAddress}"</c:otherwise></c:choose> />
    <%--<input readonly="true" type="text" name="receiver_institution" id="receiver_institution" maxlength="12" <c:choose><c:when test="${empty headerById.receiverAddress}">value="INDOIDJRXXXX"</c:when><c:otherwise>value="${headerById.receiverAddress}"</c:otherwise></c:choose> />--%>
</div>
<div class="form-row"><span class="label">Address Expansion</span>  <!-- 20191230 -->
    <textarea name="address_institution" id="address_institution" disabled="true"><c:out value="${receiverInstitution}" /></textarea>
</div>
<hr/>
<div class="form-row"><span class="label_sub"><b>Options</b></span></div>
<div class="form-row"><span class="label"><a style="color:red;text-decoration:none">*</a>Priority</span>
    <select name="priority" id="priority">
        <option value="N" <c:if test="${headerById.messagePriority=='N'}"> selected </c:if>>Normal</option>
        <option value="U" <c:if test="${headerById.messagePriority=='U'}"> selected </c:if>>Urgent</option>
        </select>
    </div>
    <hr/>
    <div class="form-row"><span class="label_sub"><b>Block3</b></span></div>
    <div class="form-row"><span class="label">Block3</span>
        <input type="text" name="block3" id="block3" maxlength="100" size="100" value="<c:out value="${headerById.block3}" />" />
</div>
<%--<c:if test="${headerById.io_type == 'O'}">
    <c:if test="${headerById.flag == 'INC-NSTP' || headerById.flag == 'INC-SPRT'}">
        <hr/>
        <div class="form-row"><span class="label_sub"><b>Special Rate</b></span></div>
        <div class="form-row"><span class="label">Rate</span>
            <input type="text" name="special_rate" id="special_rate" maxlength="10" size="10" value="<c:out value="${headerById.special_rate}" />" onkeypress="return numbersonly(event, '_061_mf32a_currency');" />
        </div>
    </c:if>
</c:if>--%>


