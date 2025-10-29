<%--
    Document   : mt898
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mtn98.jsp" %>
<%@ include file="banner_image.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<c:forEach var="item" items="${role}">
    <c:if test="${item == 'MT:898'}">
        <div id="tabs">
            <!-- Tabs -->
            <h3>MT 898 Proprietary Message</h3>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="898" />
                <ul>
                    <li><a href="#tabs-1">Header</a></li>
                    <li><a href="#tabs-2">Body</a></li>
                    <li><a href="#tabs-3">Comment</a></li>
                </ul>
                <div id="tabs-1">
                    <%@ include file="header_mt.jsp" %>
                </div>
                <div id="tabs-2">
                    <!-- MF20 -->
                    <div class="form-row"><span class="label_body">MF20</span><span class="label">*Transaction Reference Number</span>
                        <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                    </div>
                    <hr/>

                    <!-- MF12 -->
                    <div class="form-row"><span class="label_body">MF12</span><span class="label">*Sub-Message Type</span>
                        <input type="text" name="_011_mf12_" id="_011_mf12_" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf12_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                    </div>
                    <hr/>

                    <!-- MF77E -->
                    <div class="form-row"><span class="label_body">MF77E</span><span class="label">*Proprietary Message</span>
                        <textarea name="_012_mf77e_" id="_012_mf77e_"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_mf77e_'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>
                </div>
                <div id="tabs-3">
                    <%@ include file="comment_mt.jsp" %>
                </div>
                <%@ include file="button_action.jsp" %>
                <br/><br/>
            </form>
        </div>
    </c:if>
</c:forEach>
<%@ include file="footer_1.jsp" %>