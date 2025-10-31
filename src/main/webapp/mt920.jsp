<%--
    Document   : mt920
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt920.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:920'}">
            <div id="judul">MT 920 Request Message</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="920" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li><a href="#" rel="view1">Header</a></li>
                        <li><a href="#" rel="view2">Body</a></li>
                        <li><a href="#" rel="view3">Comment</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Transaction Reference Number</span>
                                <input type="text" name="_010_mf20_" id="_010_mf20_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF12 -->
                            <div class="form-row"><span class="label_body">MF12</span><span class="label">*Message Requested</span>
                                <input type="text" name="_011_mf12_" id="_011_mf12_" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf12_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF25 -->
                            <div class="form-row"><span class="label_body">MF25</span><span class="label">*Account Identification</span>
                                <input type="text" name="_012_mf25_" id="_012_mf25_" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_mf25_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF34F -->
                            <div class="form-row"><span class="label_body">OF34F</span><span class="label">Floor Limit Indicator</span>&nbsp;</div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" name="_013_of34f_currency" id="_013_of34f_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_013_of34f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">D/C Mark</span>
                                <input type="text" name="_014_of34f_mark" id="_014_of34f_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_014_of34f_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_015_of34f_amount" id="_015_of34f_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_015_of34f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF34F -->
                            <div class="form-row"><span class="label_body">OF34F</span><span class="label">Floor Limit Indicator</span>&nbsp;</div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" name="_016_of34f_currency" id="_016_of34f_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_016_of34f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">D/C Mark</span>
                                <input type="text" name="_017_of34f_mark" id="_017_of34f_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_017_of34f_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_018_of34f_amount" id="_018_of34f_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_018_of34f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>
                        </div>
                        <div id="view3" class="tabcontent">
                            <%@ include file="comment_mt.jsp" %>
                        </div>
                        <%@ include file="button_action.jsp" %>
                    </div>
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>
