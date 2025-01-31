<%-- 
    Document   : resetpassword
    Created on : Mar 14, 2017, 2:32:34 PM
    Author     : AplDev2
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_user.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript">
    function passwordChanged() {
        document.getElementById("submit").disabled = true;
        //form.Change.desabled = true;
        var strength = document.getElementById('strength');
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{8,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{8,}).*", "g");
        var pwd = document.getElementById("password");
        if (pwd.value.length == 0) {
            strength.innerHTML = '';
        } else if (false == enoughRegex.test(pwd.value)) {
            strength.innerHTML = 'More Characters';
            document.getElementById("submit").disabled = true;
        } else if (strongRegex.test(pwd.value)) {
            strength.innerHTML = '<span style="font-weight:bold;color:green">Strong!</span>';
            document.getElementById("submit").disabled = false;
        } else if (mediumRegex.test(pwd.value)) {
            strength.innerHTML = '<span style="color:orange">Medium!</span>';
            document.getElementById("submit").disabled = true;
        } else {
            strength.innerHTML = '<span style="color:red">Weak!</span>';
            document.getElementById("submit").disabled = true;
        }
    }
</script> 
<script type="text/javascript" src="js/js.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'USER:UPDATE'}">
            <div id="judul">Reset User Password
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'USER:LIST'}">
                        <a href="SCDataUserList" class="srb3">User List</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="SCResetPassword">
                    <input type="hidden" name="user_id" id="user_id" value="<%=request.getParameter("user_id")%>" />
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="label">Full Name : </span>
                            <input type="text" name="name" id="name" maxlength="255" readonly="true" value="<c:out value="${dataUserById.name}" />" />
                        </div>
                        <div class="form-row"><span class="label">User ID : </span>
                            <input type="text" name="username" id="username" maxlength="255"  readonly="true" value="<c:out value="${dataUserById.user_id}" />" />
                        </div>
                        <div id="div_password" class="form-row"><span class="label">Password : </span>
                            <input type="text" name="password"oninput="passwordChanged()" onkeypress="return passwordChanged();" id="password" maxlength="255" />
                        </div>
                        <div id="form-row">
                            <span class="label">&nbsp; </span>
                            <span id="strength" style="font-size: 10px; padding-right: 37px"></span>
                        </div>
                        <div class="form-row">
                            <span class="label3">Password policy : </span>
                        </div>
                        <div class="form-row">
                            <span class="label3">Length Minimum 8 Char (alphanumeric) </span>
                        </div>
                        <div class="form-row">
                            <span class="label3">Contain Minimum :</span>
                        </div>
                        <div class="form-row">
                            <span class="label3">1 Capital Letter </span>
                        </div>
                        <div class="form-row">
                            <span class="label3">1 Non Capital Letter </span>
                        </div>
                        <div class="form-row">
                            <span class="label3">  1 Numerical </span>
                        </div>
                        <div class="form-row">
                            <span class="label3">  1 Special Char </span>
                        </div>
                      <br>
                    </div>
                    <!--                <div class="form-row"><span class="label">&nbsp;</span>-->
                    <div class="form-row-action">
                        <input type="submit" name="submit" id="submit" value="Save" />
                        <input type="button" name="back" id="back" value="Back" />
                    </div>
                </form>
            </div>
        </c:if>
    </c:forEach>
</div>
