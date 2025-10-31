<%-- 
    Document   : VDataLimitDetail
    Created on : 5 Oct 2025, 15.52.50
    Author     : rafli
--%>

<%@ include file="header.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />

<c:set var="checkAdmin" value="false" scope="page" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${!checkAdmin && (item == 'ADM:MAKER' || item == 'ADM:CHECKER')}">
            <c:set var="checkAdmin" value="true" scope="page" />
            <div id="judul">Add Limit</div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="SCCurrencyLimit">
                    <input type="hidden" name="id" id="id" value="${dataLimitDetail != null ? dataLimitDetail['id'] : ''}" />
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL">Level</span>
                            <input type="text" name="level" id="level" value="${dataLimitDetail != null ? dataLimitDetail['level'] : ''}" readonly="true" />
                        </div>
                        <div class="form-row"><span class="labelL">Source</span>
                            <input type="text" name="source" id="source" value="${dataLimitDetail != null ? dataLimitDetail['source'] : ''}" readonly="true" />
                        </div>
                        <div class="form-row"><span class="labelL">Currency</span>
                            <input type="text" name="currency" id="currency" maxlength="3" required="true" oninput="this.value = this.value.toUpperCase()" required value="${dataLimitDetail != null ? dataLimitDetail['currency'] : ''}" ${dataLimitDetail != null && dataLimitDetail['is_enable'] == 1 ? 'readonly="true"' : ''} />
                        </div>
                        <div class="form-row"><span class="labelL">Min. Limit</span>
                            <input type="number" name="min_limit" id="min_limit" maxlength="18"required step="0.00001" 
                                value="${dataLimitDetail != null ? dataLimitDetail['min_limit'] : ''}" 
                                ${dataLimitDetail != null && dataLimitDetail['is_enable'] == 1 ? 'readonly="true"' : ''} />
                        </div>
                        <div class="form-row"><span class="labelL">Max. Limit</span>
                            <input type="number" name="max_limit" id="max_limit" maxlength="18" required step="0.00001" 
                                value="${dataLimitDetail != null ? dataLimitDetail['max_limit'] : ''}" 
                                ${dataLimitDetail != null && dataLimitDetail['is_enable'] == 1 ? 'readonly="true"' : ''} />
                        </div>
                        <div class="form-row"><span class="labelL">Enable/Disable</span>
                        <c:set var="isMaker" value="${false}" />
                        <c:set var="isChecker" value="${false}" />

                        <c:forEach var="r" items="${role}">
                            <c:if test="${r == 'ADM:MAKER'}">
                                <c:set var="isMaker" value="${true}" />
                            </c:if>
                            <c:if test="${r == 'ADM:CHECKER'}">
                                <c:set var="isChecker" value="${true}" />
                            </c:if>
                        </c:forEach>

                        <c:if test="${not empty dataLimitDetail}">
                            <c:choose>
                                <c:when test="${isMaker and isChecker}">
                                    <c:if test="${dataLimitDetail['is_enable'] == 1}">
                                        <input type="radio" name="enable" value="1" checked> Enable &nbsp;
                                        <input type="radio" name="enable" value="0"> Disable &nbsp;
                                    </c:if>
                                    <c:if test="${dataLimitDetail['is_enable'] == 0}">
                                        <input type="radio" name="enable" value="1"> Enable &nbsp;
                                        <input type="radio" name="enable" value="0" checked> Disable &nbsp;
                                    </c:if>
                                </c:when>

                                <c:when test="${isMaker and not isChecker}">
                                    <c:if test="${dataLimitDetail['is_enable'] == 1}">
                                        <input type="radio" name="enable" value="1" checked onclick="return false;"> Enable &nbsp;
                                        <input type="radio" name="enable" value="0" onclick="return false;"> Disable &nbsp;
                                    </c:if>
                                    <c:if test="${dataLimitDetail['is_enable'] == 0}">
                                        <input type="radio" name="enable" value="1" onclick="return false;"> Enable &nbsp;
                                        <input type="radio" name="enable" value="0" checked onclick="return false;"> Disable &nbsp;
                                    </c:if>
                                </c:when>

                                <c:when test="${isChecker and not isMaker}">
                                    <c:if test="${dataLimitDetail['is_enable'] == 1}">
                                        <input type="radio" name="enable" value="1" checked> Enable &nbsp;
                                        <input type="radio" name="enable" value="0"> Disable &nbsp;
                                    </c:if>
                                    <c:if test="${dataLimitDetail['is_enable'] == 0}">
                                        <input type="radio" name="enable" value="1"> Enable &nbsp;
                                        <input type="radio" name="enable" value="0" checked> Disable &nbsp;
                                    </c:if>
                                </c:when>
                            </c:choose>
                        </c:if>

                        </div>
                    </div>
                        <div class="form-row-action">
                        <input type="submit" name="submit" id="submit" class="trigger_popup_fricc" value="Save" />
                        <a href="VDataTieringLimit.jsp" ><input type="button" name="backs" id="backs" value="Back" /> </a>
                    </div>
                </form>
            </div>
        </c:if>
    </c:forEach>
</div>

<%
    String level = (String) request.getAttribute("level");
    String source = (String) request.getAttribute("source");
    
    Map<String, Object> dataLimitDetail = (Map<String, Object>) request.getAttribute("dataLimitDetail");
    if (dataLimitDetail != null) {
        level = (level != null) ? level : (dataLimitDetail.get("level") != null ? dataLimitDetail.get("level").toString() : null);
        source = (source != null) ? source : (dataLimitDetail.get("source") != null ? dataLimitDetail.get("source").toString() : null);
    }
    
    if (level != null) session.setAttribute("slevel", level);
    if (source != null) session.setAttribute("schannel", source);
%>