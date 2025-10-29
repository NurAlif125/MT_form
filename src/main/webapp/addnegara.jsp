<%--
    Document  addcharges
    Created on Jan 31, 2013, 5:36:52 PM
    Author    hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_mnegara.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
<c:forEach var="item" items="${role}">
    <c:if test="${item == 'CTY:ADD'}">
        <div id="judul">Add Country Suspect
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'CTY:LIST'}">
                        <a href="SCNegaraSuspectList" class="srb3">Country Suspect List</a>
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
            <form id="form1" name="form1" method="post" action="SCNegaraSuspect">
                <input type="hidden" name="id_negara" id="id_negara" value="<%=request.getParameter("id_negara")%>" />
                <div id="tabs-1" class="formBody">
                    <div class="form-row"><span class="labelL2">Kode Negara</span>
                        <input type="text" name="kode_negara" id="kode_negara" maxlength="2" value="<c:out value="${negaraById.kode_negara}" />" />
                    </div>
                    <div class="form-row"><span class="labelL2">Nama Negara</span>
                        <input type="text" name="nama_negara" id="nama_negara" maxlength="100" value="<c:out value="${negaraById.nama_negara}" />" />
                    </div>
                </div>
<!--                <div class="form-row"><span class="labelL2">&nbsp;</span>-->
                <div class="form-row-action">
                    <input type="submit" name="submit" id="submit" value="Save" />
                    <% if(request.getParameter("id_negara") != null) { %> 
                    <a href="SCNegaraSuspect?action=delete&id_negara=<%=request.getParameter("id_negara")%>"><input type="button" name="delete" id="delete" value="Delete" /></a>
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