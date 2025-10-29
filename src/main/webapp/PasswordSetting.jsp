<%-- 
    Document   : PasswordSetting
    Created on : Oct 10, 2017, 4:34:02 PM
    Author     : faldi
--%>
<%@ include file="header.jsp"%>
<%@ include file="rule/validate_mbcode.jsp" %>
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'USER:LIST'}">
            <div id="judul">Password Rule List
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'USER:ADD'}">
                        <a href="addPassword.jsp" class="srb2">Add Password Rule</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="SCPasswordSettingList?find=yes" style="margin-bottom: -10px">
                    <div id="tabs-1">
                        <table class="tablesearch" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><b>Password Rule Name</b>
                                    <input type="text" name="namaPasswordSet" id="namaPasswordSet" maxlength="25" />
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><b>Action</b><br>
                                    <input type="submit" name="search" id="search" value="Search" />
<!--                                    <input type="reset" name="reset" id="reset" value="Reset" />    -->
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <display:table name="sessionScope.dataPassword" pagesize="10" export="false" sort="list" cellpadding="0" cellspacing="0">
                    <display:column value="<%=rowNum++%>" title="No" sortable="true" headerClass="sortable" />
                    <display:column paramId="idRulePassword" paramProperty="idRulePassword" property="nameRulePassword" title="Password Rule Name" sortable="true" headerClass="sortable" href="VPasswordSetting"/>
                    <display:column property="updateBy" title="Last Update By" sortable="true" headerClass="sortable" />
                    <display:column property="tanggalUpdate" title="Last Update Date" sortable="true" headerClass="sortable" />
                </display:table>
            </div><!--close content-->
        </c:if>
    </c:forEach>
</div>
