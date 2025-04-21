<%--
    Document  adduser
    Created onJan 31, 2013, 5:36:52 PM
    Author    hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_user.jsp" %>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
<c:forEach var="item" items="${role}">
    <c:if test="${item == 'USER:ADD'}">
        <div id="judul">Add User
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'USER:LIST'}">
                        <a href="SCDataUserList" class="srb3">User List</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="tabs-1">
            <form id="form1" name="form1" method="post" action="SCDataUser">
                <input type="hidden" name="user_id" id="user_id" value="<%=request.getParameter("user_id")%>" />
                <div id="tabs-1" class="formBody">
                    <div class="form-row">
    <span class="labelL2">Full Name</span>
    <input type="text" name="name" id="name" maxlength="255" value="<c:out value='${dataUserById.name}' />" />
</div>

                    <div class="form-row"><span class="labelL2">User ID</span>
                        <input type="text" name="username" id="username" maxlength="255" value="<c:out value="${dataUserById.user_id}" />" <% if(request.getParameter("user_id")==null) { %> <% } else { %> disabled="disabled" <% } %> />
                    </div>
<!--                    <div id="div_password" class="form-row"><span class="labelL2">Password</span>
                         <input type="text" name="password" id="password" maxlength="255" value="<c:out value="${dataUserById.password}" />" />
                    </div>-->
                    <%--
                    <div class="form-row"><span class="labelL2">Status New</span>
                        <input type="text" name="status_new" id="status_new" maxlength="45" value="<c:out value="${dataUserById.status_new}" />" />
                    </div>
                    <div class="form-row"><span class="labelL2">User Routing</span>
                        <input type="text" name="user_mt_routing" id="user_mt_routing" maxlength="45" value="<c:out value="${dataUserById.user_mt_routing}" />" />
                    </div>
                    --%>
                    <div class="form-row"><span class="labelL2">Description</span>
                        <input type="text" name="description" id="description" maxlength="255" value="<c:out value="${dataUserById.description}" />" />
                    </div>
                    <div class="form-row"><span class="labelL2">Role</span>
                        <select name="role" id="role">
                            <option value=""></option>
                            <c:forEach var="item" items="${dataRoleList}">
                                <option value="${item.role_id}" <c:if test="${item.role_id == dataUserById.role}"> selected="true" </c:if> >${item.role_name}</option>
                            </c:forEach>
                        </select>
                    </div>
<!--                    <div class="form-row"><span class="labelL2">Sub-Role</span>
                        <select name="role" id="sub-role">
                            <option value=""></option>
                            <option vlaue="1">Checker</option>
                            <option value="2">Maker</option>
                        </select>
                    </div>-->
                    <%--<div class="form-row"><span class="labelL2">Password Rule : </span>
                        <select name="rulepassword" id="rulepassword">
                             <option value=""></option>
                                <c:forEach var="item" items="${dataPasswordList}">
                                    <option value="${item.idRulePassword}" <c:if test="${item.idRulePassword == dataUserById.idpassword}"> selected="true" </c:if> >${item.nameRulePassword}</option>
                                </c:forEach>
                        </select>
                    </div> --%>
                    <div class="form-row"><span class="labelL2">Enable</span>
                        <input type="checkbox" name="enable" id="enable" value="1" <c:if test="${dataUserById.enable == '1'}"> checked="true" </c:if> />
                    </div>
<%--                    <div class="form-row"><span class="labelL2">Auto Disable</span>
                        <input type="text" name="auto_disable" id="auto_disable" maxlength="3" required="true" value="<c:out value="${dataUserById.auto_disable}" />" onkeypress="return numbersonly(event);" />
                    </div>--%>
                </div>
<!--                <div class="form-row"><span class="labelL2">&nbsp;</span>-->
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