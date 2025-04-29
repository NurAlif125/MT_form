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
                        <select name="role" id="role" onchange="handleRoleChange()">
                            <option value=""></option>
                            <c:forEach var="item" items="${dataRoleList}">
                                <option value="${item.role_id}" <c:if test="${item.role_id == dataUserById.role}"> selected="true" </c:if> >${item.role_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-row" id="sub-role-container" style="display: none;">
                        <span class="labelL2">Sub-Role</span>
                        <label style="margin-right: 13px;">
                            <input type="radio" name="subrole" value="1" <c:if test="${dataUserById.sub_role == '1'}"> checked="true" </c:if> />Checker
                        </label>
                        <label>
                            <input type="radio" name="subrole" value="2" <c:if test="${dataUserById.sub_role == '2'}"> checked="true" </c:if> />Maker
                        </label>
                    </div>
                    <div class="form-row"><span class="labelL2">Channel</span>
                        <select name="channel" id="channel">
                            <option value="">All Channel</option>
                        <c:forEach var="item1" items="${dataChannel}">
                            <option value="${item1}"<c:if test="${item1 == dataUserById.channel}"> selected="true" </c:if>>${item1}</option>
                        </c:forEach>
                        </select>
                    </div>
                    <div class="form-row"><span class="labelL2">Enable</span>
                        <input type="checkbox" name="enable" id="enable" value="1" 
                            <c:if test="${dataUserById.enable == '1'}"> checked="true" </c:if>
                            <c:if test="${sessionScope.sub_role_user == '2'}"> readonly onclick="return false;" style="accent-color: grey;" </c:if>
                        />
                    </div>
<%--                    <div class="form-row"><span class="labelL2">Auto Disable</span>
                        <input type="text" name="auto_disable" id="auto_disable" maxlength="3" required="true" value="<c:out value="${dataUserById.auto_disable}" />" onkeypress="return numbersonly(event);" />
                    </div>--%>
                </div>
<!--                <div class="form-row"><span class="labelL2">&nbsp;</span>-->
                <div class="form-row-action">
                    <input type="submit" name="submit" id="submit" value="Save" />
                    <c:if test="${sessionScope.sub_role_user == '1'}">
                    <input type="button" name="delete_user" id="delete_user" value="Disable Permanent" />
                    </c:if>
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

<script>
    function handleRoleChange() {
        const roleSelect = document.getElementById("role");
        const subRoleContainer = document.getElementById("sub-role-container");
        const subRoleRadios = document.querySelectorAll('input[name="subrole"]');

        if (roleSelect.value === "1") {
            subRoleContainer.style.display = "block";
            subRoleRadios.forEach(radio => {
                radio.setAttribute("required", "required");
            });
        } else {
            subRoleContainer.style.display = "none";
            subRoleRadios.forEach(radio => {
                radio.removeAttribute("required");
                radio.checked = false;
            });
        }
    }

    window.onload = handleRoleChange;
</script>
<!--<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>-->