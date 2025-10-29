<%--
    Document   : mt992
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mtn92.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:992'}">
            <div id="judul">MT 992 Request for Cancellation</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="992" />
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
                                <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                                <input type="text" name="_011_mf21_" id="_011_mf21_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf21_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF11S -->
                            <div class="form-row"><span class="label_body">MF11S</span><span class="label">*MT Number</span>
                                <input type="text" name="_012_mf11s_mt_number" id="_012_mf11s_mt_number" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_mf11s_mt_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                <input type="text" name="_013_mf11s_date" id="_013_mf11s_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_013_mf11s_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Session Number(ISN)</span>
                                <input type="text" name="_014_mf11s_session_number" id="_014_mf11s_session_number" maxlength="10" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_014_mf11s_session_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF79 -->
                            <div class="form-row"><span class="label_body">OF79</span><span class="label">Narrative Desc of the Ori Message</span>
                                <textarea name="_015_of79_narrative" id="_015_of79_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_015_of79_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OMSG -->
                            <div class="form-row"><span class="label_body">OMSG</span><span class="label">&nbsp;</span>
                                <textarea name="_016_omsg" id="_016_omsg"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_016_omsg'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
