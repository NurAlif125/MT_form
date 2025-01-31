<%-- 
    Document   : mt103
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt420.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:420'}">
            <div id="judul">MT 420 Tracer</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="420" />
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
                                <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sending Bank TRN</span>
                                    <input type="text" name="_010_mf20_sending_bank_trn" id="_010_mf20_sending_bank_trn" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sending_bank_trn'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF23B -->
                                <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related References</span>
                                    <input type="text" name="_020_mf21_related_references" id="_020_mf21_related_references" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_references'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- OF32 -->
                                 <div class="form-row"><span class="label_body">MF32</span><span class="label">*Amount traced</span>
                                <select id="type_mf32_amount_traced" name="type_mf32_amount_traced">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - Date, Currency, Amount</option>
                                    <option value="b">B - Currency - Amount</option>
                                    <option value="k">K - Days Month - Number of Days Months - Code - Currency - Amount</option>
                                </select>
                                <div id="div_mf32a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                        <input type="text" name="_031_mf32a_Date" id="_031_mf32a_Date" maxlength="6" minlength="6" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32a_Date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                        <input type="text" name="_032_mf32a_Currency" id="_032_mf32a_Currency" maxlength="3" minlength="3" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf32a_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_033_mf32a_Amount" id="_033_mf32a_Amount" maxlength="15" minlength="2" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_mf32a_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_mf32b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                        <input type="text" name="_034_mf32b_Currency" id="_034_mf32b_Currency" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_034_mf32b_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_035_mf32b_Amount" id="_035_mf32b_Amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_mf32b_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                 <div id="div_mf32k_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Day/Month</span>
                                            <select id="_036_mf32k_day_month" name="_036_mf32k_day_month">
                                                <option value="">choose a code</option>
                                                <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_036_mf32k_day_month'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>D (Days)</option>
                                                <option value="M" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_036_mf32k_day_month'}"><c:if test="${item.detail=='M'}"> selected="true" </c:if></c:if></c:forEach>>M (Months)</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number of Days/Months</span>
                                            <input type="text" name="_037_mf32k_number_of_days_months" id="_037_mf32k_number_of_days_months" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_037_mf32k_number_of_days_months'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Code</span>
                                            <select id="_038_mf32k_code" name="_038_mf32k_code">
                                                <option value="">choose a code</option>
                                                <option value="BE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='BE'}"> selected="true" </c:if></c:if></c:forEach>>BE</option>
                                                <option value="CC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='CC'}"> selected="true" </c:if></c:if></c:forEach>>CC</option>
                                                <option value="FD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='FD'}"> selected="true" </c:if></c:if></c:forEach>>FD</option>
                                                <option value="FP" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='FP'}"> selected="true" </c:if></c:if></c:forEach>>FP</option>
                                                <option value="GA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='GA'}"> selected="true" </c:if></c:if></c:forEach>>GA</option>
                                                <option value="ID" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='ID'}"> selected="true" </c:if></c:if></c:forEach>>ID</option>
                                                <option value="ST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='ST'}"> selected="true" </c:if></c:if></c:forEach>>ST</option>
                                                <option value="TD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='TD'}"> selected="true" </c:if></c:if></c:forEach>>TD</option>
                                                <option value="XX" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='XX'}"> selected="true" </c:if></c:if></c:forEach>>XX</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_039_mf32k_currency" id="_039_mf32k_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_039_mf32k_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_040_mf32k_amount" id="_040_mf32k_amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf32k_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                 <div class="form-row"><span class="label_body">OF30</span><span class="label">Date of Collection Instruction</span>
                                    <input type="text" name="_050_of30_date_of_collection" id="_050_of30_date_of_collection" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of30_date_of_collection'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!--OF59-->
                                <div class="form-row"><span class="label_body">OF59</span><span class="label">Drawee</span>
                                    <input type="checkbox" name="drawee_checkbox" id="drawee_checkbox" />
                                    <div id="check_of59">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                            <input type="text" name="_060_of59_account" id="_060_of59_account" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_061_of59_name_address" id="_061_of59_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>

                                <!--of72-->
                                 <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to receive Information</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_070_of72_sender_receive_information" id="_070_of72_sender_receive_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of72_sender_receive_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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