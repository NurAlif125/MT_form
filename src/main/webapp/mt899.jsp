<%-- 
    Document   : mt899
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mtn99.jsp" %>
<%@ include file="banner_image.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<c:forEach var="item" items="${role}">
    <c:if test="${item == 'MT:899'}">
        <div id="tabs">
            <!-- Tabs -->
            <h3>MT 899 Free Format Message</h3>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="899" />
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
                        <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF21 -->
                    <div class="form-row"><span class="label_body">OF21</span><span class="label">Related Reference</span>
                        <input type="text" name="_011_of21_" id="_011_of21_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_of21_'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF79 -->
                    <div class="form-row"><span class="label_body">MF79</span><span class="label">*Narrative</span>
                        <textarea name="_012_mf79_" id="_012_mf79_" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_mf79_'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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