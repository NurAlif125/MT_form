<%-- 
    Document   : mt412
    Created on : Aug 16, 2018
    Author     : Andhita Deara
--%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file ="header.jsp" %>
<script src="js/validate-mt/content/mt412_content.js"></script>
<script src="js/validate-mt/validate_rule_mt412.js"></script>
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
        <c:if test="${item == 'MT:412'}">
            <div id="judul">MT 412 Advice of Acceptance</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="412" />
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
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sending Bank's TRN</span>
                                <input type="text" name="_010_mf20_sending_bank_trn" id="_010_mf20_sending_bank_trn" input_type="MF20 Sending Bank Trn" location="Body" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sending_bank_trn'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                                <input type="text" name="_020_mf21_related_reference" id="_020_mf21_related_reference" input_type="MF21 Related Reference" location="Body" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF32A -->
                            <div class="form-row"><span class="label_body">MF32A</span><span class="label">*Maturity Date</span>
                                <input type="text" name="_030_mf32a_maturity_date" id="_030_mf32a_maturity_date" input_type="MF32A Maturity Date" location="Body" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32a_maturity_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                <input type="text" name="_031_mf32a_currency_code" id="_031_mf32a_currency_code" input_type="MF32A Currency Code" location="Body" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32a_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount Accepted</span>
                                <input type="text" name="_032_mf32a_amount_accepted" id="_032_mf32a_amount_accepted" input_type="MF32A Amount Accepted" location="Body" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf32a_amount_accepted'}"><c:out value="${item.detail}" /></c:if></c:forEach>"  onkeypress="return numbersonly(event, '_032_mf32a_amount_accepted');" onblur="checkZeroAmount(this.id); cek_koma(this);" ondrop="return false;" onpaste="return false;"/>
                            </div>
                            <hr/>

                            <!-- OF72 -->
                            <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_040_of72_sender_to_receiver" id="_040_of72_sender_to_receiver" input_type="OF72 Sender To Receiver" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of72_sender_to_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                        </div>
                        <div id="view3" class="tabcontent">
                            <%@include file="comment_mt.jsp" %>
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
<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>