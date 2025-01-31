<%--
    Document   : addAccPenagih
    Created on : Jul 5, 2019
    Author     : Andhita Deara
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_nostro.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'NOSTRO:ADD'}">
            <div id="judul">Add Nostro
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'NOSTRO:LIST'}">
                        <a href="SCDataNostroList" class="srb3">Nostro List</a>
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
                <form id="form1" name="form1" method="post" action="SCDataNostro">
                    <input type="hidden" name="id_member" id="id_member" value='<%=request.getParameter("id_member")%>' />
                    <div id="tabs-1" class="formBody">
                        <div class="form-row">
                            <span class="labelL3">Swift Code [Example : CITIUS33<b style="color: red">X</b>BUD] <b style="color: red">*</b></span>
                            <input type="text" name="swift_code" id="swift_code" maxlength="12" minlength="12" autocomplete="off" 
                                   value="<c:out value="${dataNostroById.swift_code}" />" 
                                   style="text-transform: uppercase;" 
                                   oninput="this.value = this.value.toUpperCase();" />
                        </div>
                        <div class="form-row">
                            <span class="labelL3">Name <b style="color: red">*</b></span>
                            <input type="text" name="name" id="name" maxlength="120" autocomplete="off" value="<c:out value='${dataNostroById.name}' />" 
                                   style="text-transform: uppercase;" 
                                   oninput="this.value = this.value.toUpperCase();" 
                                   />
                        </div>
                        <div class="form-row">
                            <span class="labelL3">Address <b style="color: red">*</b></span>
                            <input type="text" name="address" id="address" maxlength="120" autocomplete="off" value="<c:out value='${dataNostroById.address}' />" 
                                   style="text-transform: uppercase;" 
                                   oninput="this.value = this.value.toUpperCase();" 
                                   />
                        </div>

                        <div class="form-row"><span class="labelL3">SSL No</span>
                            <input type="text" onkeypress="return onlyNumberKey(event)"name="ssl_no" id="ssl_no" maxlength="12" autocomplete="off" value="<c:out value="${dataNostroById.ssl_no}" />" />
                        </div>
                        <div class="form-row"><span class="labelL3">SSL Name</span>
                            <input type="text" name="ssl_name" id="ssl_name" maxlength="120" autocomplete="off" value="<c:out value="${dataNostroById.ssl_name}" />" />
                        </div>
                        <div class="form-row"><span class="labelL3">Currency Codes</span>
                            <input type="text" name="currency_codes" id="currency_codes" maxlength="3" autocomplete="off" value="<c:out value="${dataNostroById.currency_codes}" />" />
                        </div>
                        <div class="form-row"><span class="labelL3">Account Number</span>
                            <input type="text" name="acc_no" id="acc_no" maxlength="34" autocomplete="off" value="<c:out value="${dataNostroById.acc_no}" />" />
                        </div>
                        <div class="form-row"><span class="labelL3">City</span>
                            <input type="text" name="city" id="city" maxlength="120" autocomplete="off" value="<c:out value="${dataNostroById.city}" />" />
                        </div>
                        <div class="form-row"><span class="labelL3">Country</span>
                            <input type="text" name="country" id="country" maxlength="120" autocomplete="off" value="<c:out value="${dataNostroById.country}" />" />
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
<script>
    function onlyNumberKey(evt) {

        // Only ASCII character in that range allowed
        let ASCIICode = (evt.which) ? evt.which : evt.keyCode
        if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
            return false;
        return true;
    }
</script>
<!--<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>-->