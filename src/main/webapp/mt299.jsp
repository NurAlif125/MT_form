<%-- 
    Document   : mt299
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mtn99.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:299'}">
            <div id="judul">MT 299 Free Format Message</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="299" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <!--<li><a href="#" rel="view1">Header</a></li>
                        <li><a href="#" rel="view2">Body</a></li>
                        <li><a href="#" rel="view3">Comment</a></li>
                        <li hidden id="tab-validate"><a href="#" rel="view4" id="tabView4">Validate</a></li>-->
                        <li id="tab-view1"><a href="#" rel="view1">Header</a></li>
                        <li id="tab-view2"><a href="#" rel="view2">Body</a></li>
                        <li id="tab-view3"><a href="#" rel="view3">Comment</a></li>
                        <li id="tab-view4"><a href="#" rel="view4">Histories</a></li>
                        <li id="tab-view5"><a href="#" rel="view5">Log MT Text</a></li>
                        <li id="tab-view6"><a href="#" rel="view6">MT Relation</a></li>
                        <li id="tab-view7"><a href="#" rel="view7" id="tabView7">Translation</a></li>
                        <li hidden id="tab-validate"><a href="#" rel="view8" id="tabView8">Validate</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                            <%@ include file="special_rate.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Transaction Reference Number</span>
                                <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- OF21 -->
                            <div class="form-row"><span class="label_body">OF21</span><span class="label">Related Reference</span>
                                <input type="text" name="_011_of21_Related_Reference" id="_011_of21_Related_Reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_of21_Related_Reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF79 -->
                            <div class="form-row"><span class="label_body">MF79</span><span class="label">*Narrative</span>
                                <textarea cols="50" rows="35" maxlength="1750" wrap="hard" style="resize:none;" name="_012_mf79_Narrative" id="_012_mf79_Narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_mf79_Narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                        </div>
                        <div id="view3" class="tabcontent">
                            <%@ include file="comment_mt.jsp" %>
                        </div>
                        <div id="view4" class="tabcontent">
                            <%@ include file="history_mt.jsp" %>
                        </div>
                        <div id="view5" class="tabcontent">
                            <%@ include file="logTrx_mt.jsp" %>
                        </div>
                        <div id="view6" class="tabcontent">
                            <%@ include file="relation_mt.jsp" %>
                        </div>
                        <div id="view7" class="tab-content">
                            <div class="form-row">
                                <%@include file="mt_mx.jsp" %>
                            </div>
                        </div>
                        <div id="view8" class="tabcontent">
                            <div id="error-container"></div>
                        </div>
                    </div>
                </div>
                    <%@ include file="button_action.jsp" %>
            </form>
        </c:if>
    </c:forEach>
</div>
