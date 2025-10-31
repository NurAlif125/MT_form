<%-- 
    Document   : mt412
    Created on : Aug 16, 2018
    Author     : Andhita Deara
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt412.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:412'}">
            <div id="judul">MT 412 Advice of Acceptance</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="412" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li><a href="#" rel="view1">Header</a></li>
                        <li><a href="#" rel="view2">Body</a></li>
                        <li><a href="#" rel="view3">Comment</a></li>
                        <li><a href="#" rel="view4">Histories</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            
                                <!-- MF20 -->
                                <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sending Bank's TRN</span>
                                    <input type="text" name="_010_mf20_sending_bank_TRN" id="_010_mf20_sending_bank_TRN" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sending_bank_TRN'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF21 -->
                                <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                                    <input type="text" name="_020_mf21_related_reference" id="_020_mf21_related_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF32A -->
                                <div class="form-row"><span class="label_body">MF32A</span><span class="label">*Maturity Date</span>
                                    <input type="text" name="_030_mf32a_maturity_date" id="_030_mf32a_maturity_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32a_maturity_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                    <input type="text" name="_031_mf32a_currency_code" id="_031_mf32a_currency_code" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32a_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount Accepted</span>
                                    <input type="text" name="_032_mf32a_amount_accepted" id="_032_mf32a_amount_accepted" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf32a_amount_accepted'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF72 -->
                                <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_040_of72_sender_to_receiver" id="_040_of72_sender_to_receiver"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of72_sender_to_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                            
                        </div>
                        <div id="view3" class="tabcontent">
                            <%@ include file="comment_mt.jsp" %>
                        </div>
                        <div id="view4" class="tabcontent">
                            <%@ include file="history_mt.jsp" %>
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