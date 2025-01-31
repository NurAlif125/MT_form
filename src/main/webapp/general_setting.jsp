<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="header.jsp" %>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'GS:VIEW'}">
            <form id="form1" name="form1" method="post" action="SCGeneralSetting">
                <div id="tabs-1" class="formBody">
                    <input type="hidden" name="id" id="id" maxlength="10" size="10" value="<c:out value="${dataGS.id}" />" />
                    <div class="form-row"><span class="labelL">Hostname</span>
                        <input type="text" name="hostname" id="hostname" value="${dataGS.hostname}" required />
                    </div>
                    <div class="form-row"><span class="labelL">Application Version</span>
                        <input type="text" name="appversion" id="appversion" value="${dataGS.appversion}" required />
                    </div>

                    <div class="form-row"><span class="labelL">Modified By</span>
                        <input type="text" name="modified_by" id="modified_by" value="${dataGS.modifiedBy}" readonly />
                    </div>
                    <div class="form-row"><span class="labelL">Last Update</span>
                        <input type="text" name="last_update" id="last_update" value="${dataGS.lastUpdate}" readonly />
                    </div>
                    <c:choose>
                        <c:when test="${updateResult==null}"></c:when>
                        <c:otherwise>
                            <div class="form-row">
                                <span style="font-weight: bold; color: #006A69">${updateResult}</span>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="form-row-action">
                    <c:forEach var="item" items="${role}">
                        <c:if test="${item == 'GS:UPDATE'}">
                            <input type="hidden" name="idgs" id="idgs" value="${dataGS.id}" />
                            <input type="submit" name="submit" id="submit" value="Save" />
                            <input type="reset" name="reset" id="reset" value="Reset" />
                        </c:if>
                    </c:forEach>
                    <input type="button" name="back" id="back" value="Back" />
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>
<!--<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>-->