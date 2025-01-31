<%-- 
    Document   : VSandiKliring
    Created on : Jan 31, 2013, 11:24:52 PM
    Author     : hadi
--%>

<%@ include file="header.jsp" %>
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
        <c:if test="${item == 'BRANCH_CODE:LIST'}">
            <div id="judul">List of Branch Code
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'BRANCH_CODE:ADD'}">
                        <a href="branchcode.jsp" class="srb2">Add Branch Code</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="SCSandiKliringList?find=yes" style="margin-bottom: -10px">
                    <div id="tabs-1">
                        <div class="form-row"><span class="label">Kode : </span>
                            <input type="text" name="s_kode" id="s_kode" maxlength="5" />
                        </div>
                        <div class="form-row"><span class="label">Uraian : </span>
                            <input type="text" name="s_uraian" id="s_uraian" maxlength="45" />
                        </div>
                        <div class="form-row"><span class="label">Sandi Kliring : </span>
                            <input type="text" name="s_sandi_kliring" id="s_sandi_kliring" maxlength="45" />
                        </div>
                        <div class="form-row"><span class="label">Address : </span>
                            <input type="text" name="s_address" id="s_address" maxlength="45" />
                        </div>
                    </div>
                    <div class="form-row"><span class="label">&nbsp;</span>
                        <input type="submit" name="search" id="search" value="Search" />
                        <input type="reset" name="reset" id="reset" value="Reset" />
                        <input type="button" name="back" id="back" value="Back" />
                    </div>
                </form>
            </div>
            <div id="content">
                <%int rowNum = 1;%>
                <display:table name="sessionScope.sandiKliring" pagesize="10" export="false" sort="list" cellpadding="0" cellspacing="0">
                    <display:column value="<%=rowNum++%>" title="No" sortable="true" headerClass="sortable" />
                    <display:column property="kode" title="Kode" sortable="true" headerClass="sortable" />
                    <display:column paramId="id_sandi_kliring" paramProperty="id_sandi_kliring" property="uraian" title="Uraian" sortable="true" headerClass="sortable" href="VSandiKliring" />
                    <display:column property="sandi_kliring" title="Sandi Kliring" sortable="true" headerClass="sortable" />
                    <display:column property="address" title="Address" sortable="true" headerClass="sortable" />
                    <display:column property="note" title="Note" sortable="true" headerClass="sortable" />
                </display:table>
            </div><!--close content-->
        </c:if>
    </c:forEach>
</div>
