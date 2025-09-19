<%-- 
    Document   : mt103
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : Abdul Rojak
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file ="header.jsp" %>
<script src="js/validate-mt/content/mtn99_content.js"></script>
<script src="js/validate-mt/validate_rule_mtn99.js"></script>
<script src="js/validate-mt/validateList_scr.js"></script>
<link rel="stylesheet" type="text/css" href="css/validate_case.css"/>
<script src="js/tabcontent.js" type="text/javascript"></script>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css"/>
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css"/>
<link href="css/tabcontent.css" rel="stylesheet" type="text/css"/>
<link href="css/MT.css" rel="stylesheet" type="text/css"/>
<link rel="icon" href="images/favicon.ico"/>
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:499'}">
            <div id="judul">MT 499 Free Format Message</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="499" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li id="tab-view1"><a href="#" rel="view1">Header</a></li>
                        <li id="tab-view2"><a href="#" rel="view2">Body</a></li>
                        <li id="tab-view3"><a href="#" rel="view3">Comment</a></li>
                        <li id="tab-view4"><a href="#" rel="view4">Histories</a></li>
                        <li id="tab-view5"><a href="#" rel="view5">Log MT Text</a></li>
                        <li id="tab-view6"><a href="#" rel="view6">MT Relation</a></li>
                        <li  id="tab-view7"><a href="#" rel="view7" id="tabView7">Translation</a></li>
                        <li hidden id="tab-validate"><a href="#" rel="view8" id="tabView8">Validate</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Transaction Reference Number</span>
                                <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" input_type="MF20 Sender Reference" location="Body" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- OF21 -->
                            <div class="form-row"><span class="label_body">OF21</span><span class="label">Related Reference</span>
                                <input type="text" name="_011_of21_Related_Reference" id="_011_of21_Related_Reference" input_type="OF21 Related Reference" location="Body" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_of21_Related_Reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF79 -->
                            <div class="form-row"><span class="label_body">MF79</span><span class="label">*Narrative</span>
                                <textarea cols="50" rows="35" maxlength="1750" wrap="hard" style="resize:none;" name="_012_mf79_Narrative" id="_012_mf79_Narrative" input_type="MF79 Narrative" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_mf79_Narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- Hidden for cekduplikat -->
                            <div>
                                <input type="hidden" name="_060_mf32a_date" id="_060_mf32a_date" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                <input type="hidden" name="_062_mf32a_amount" id="_062_mf32a_amount" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
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
            </div>
            <%@ include file="button_action.jsp" %>
        </form>
    </c:if>
    </c:forEach>
</div>
<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>