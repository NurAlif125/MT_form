<%--
    Document  adduser
    Created onJan 31, 2013, 5:36:52 PM
    Author    hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_user.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
<c:forEach var="item" items="${role}">
    <c:if test="${item == 'USER:ADD'}">
        <div id="judul">Add Password Rule
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'USER:LIST'}">
                        <a href="SCPasswordSettingList" class="srb3">Password Rule List</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="tabs-1">
            <form id="form1" name="form1" method="post" action="SCPasswordSetting">
                <input type="hidden" name="idRulePassword" id="idRulePassword" value="<c:out value="${dataUserById.idRulePassword}" />" />
                 <div id="tabs-1" class="formBody">
                    <div class="form-row"><span class="labelL3">Password Rule Name</span>
                        <input type="text" name="nameRulePassword" id="nameRulePassword" maxlength="255" value="<c:out value="${dataUserById.nameRulePassword}" />" />
                    </div>
                    <%--<div id="div_password" class="form-row"><span class="label">Character Of UserName</span>
                        Min
                        <input type="text" name="minlongusername" id="minlongusername" maxlength="10" value="<c:out value="${dataUserById.minlongusername}" />" size="4" />
                        Max
                        <input type="text" name="maxlongusername" id="maxlongusername" maxlength="10" value="<c:out value="${dataUserById.maxlongusername}" />" size="4" />
                    </div>
                    <div id="div_password" class="form-row"><span class="label">Character Of Password</span>
                        Min
                        <input type="text" name="jumlahminchar" id="jumlahminchar" maxlength="10" value="<c:out value="${dataUserById.jumlahminchar}" />" size="4" />
                        Max
                        <input type="text" name="jumlahmaxchar" id="jumlahmaxchar" maxlength="10" value="<c:out value="${dataUserById.jumlahmaxchar}" />" size="4" />
                    </div>
                    <div class="form-row"><span class="label">First Character Must Capital</span>
                         <c:if test="${dataUserById.charfirst == '1'}">
                            <input type="radio" name="charfirst" value="1" checked="checked"/>Active </input>
                            <input type="radio" name="charfirst" value="0" />Non Active</input>
                         </c:if>
                        <c:if test="${dataUserById.charfirst == '0'}">
                             <input type="radio" name="charfirst" value="1" />Active </input>
                             <input type="radio" name="charfirst" value="0" checked="checked"/>Non Active </input> 
                        </c:if>
                        <c:if test="${dataUserById.charfirst == null}">
                             <input type="radio" name="charfirst" value="1" />Active </input>
                             <input type="radio" name="charfirst" value="0" />Non Active </input> 
                        </c:if>
                    </div>--%>
                    <div class="form-row"><span class="labelL3">Alphanumeric and Special Char</span>
                        <c:if test="${dataUserById.alfaSpecial == '1'}">
                        <input type="radio" name="isalfaspec" value="1" checked="checked"> Active </input>
                        <input type="radio" name="isalfaspec" value="0" />Non Active</input>
                        </c:if>
                        <c:if test="${dataUserById.alfaSpecial == '0'}">
                        <input type="radio" name="isalfaspec" value="1" checked="checked"> Active </input>
                        <input type="radio" name="isalfaspec" value="0" checked="checked" >Non Active </input>
                        </c:if>
                        <c:if test="${dataUserById.alfaSpecial == null}">
                        <input type="radio" name="isalfaspec" value="1" > Active </input>
                        <input type="radio" name="isalfaspec" value="0" >Non Active </input>
                        </c:if>
                    </div>
                    <div class="form-row"><span class="labelL3">Password Expired Period</span>
                        <input type="text" name="pasexp" value="<c:out value="${dataUserById.pasexp}" />" size="14"/> days
                    </div>
                    <div class="form-row"><span class="labelL3">Password Cycle Period</span>
                        <input type="text" name="pascylperiode" value="<c:out value="${dataUserById.pascylperiode}" />" size="14"/> times
                    </div>
                    <%--<div class="form-row"><span class="label">Lock User Never Login</span>
                        <input type="text" name="loguserperiode" value="<c:out value="${dataUserById.loguserperiode}" />" size="14"/> days
                    </div>--%>
                    <div class="form-row"><span class="labelL3">Max Wrong Password</span>
                        <input type="text" name="maxwronglog" value="<c:out value="${dataUserById.maxwronglog}" />" size="14"/> times
                    </div>
                    <div class="form-row"><span class="labelL3">Session Timeout : </span>
                        <input type="text" name="timeout" value="<c:out value="${dataUserById.timeout}" />" size="14"/> 60000 = 1 Minute
                    </div>
                    <div class="form-row"><span class="labelL3">Modified by</span>
                        <input type="text" name="updateBy" disabled="true" value="<c:out value="${dataUserById.updateBy}" />"/>
                        <input type="hidden" name="modifby" value="<%= (String) session.getAttribute("user_id")%>" >
                    </div>
                    <div class="form-row"><span class="labelL3">Modify Date</span>
                        <input type="text" name="tanggalUpdate" disabled="true" value="<c:out value="${dataUserById.tanggalUpdate}" />" />
                    </div>
                    <div class="form-row"><span class="labelL3">Status Rule Password</span>
                        <c:if test="${dataUserById.statusrulepassword == '1'}">
                            <input type="radio" name="statusrulepassword" value="1" checked="checked" > Active</input>
                            <input type="radio" name="statusrulepassword" value="0" > Non Active</input>
                        </c:if>
                        <c:if test="${dataUserById.statusrulepassword == '0'}">
                            <input type="radio" name="statusrulepassword" value="1" checked="checked" > Active</input>
                            <input type="radio" name="statusrulepassword" value="0" checked="checked"> Non Active</input>
                        </c:if>
                        <c:if test="${dataUserById.statusrulepassword == null}">
                            <input type="radio" name="statusrulepassword" value="1" > Active</input>
                            <input type="radio" name="statusrulepassword" value="0" > Non Active</input>
                        </c:if>
                    </div>
                </div>
<!--                <div class="form-row"><span class="label">&nbsp;</span>-->
                <div class="form-row-action">
                    <input type="submit" name="submit" id="submit" value="Save" />
                    <!--<input type="button" name="delete_user" id="delete_user" value="Delete" />-->
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