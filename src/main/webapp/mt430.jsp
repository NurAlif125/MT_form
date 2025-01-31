<%-- 
    Document   : mt430
    Created on : Aug 24, 2018
    Author     : Andhita Deara
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt430.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:430'}">
            <div id="judul">MT 430 Amendment of Instructions</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="430" />
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
                                    <input type="text" name="_010_mf20_sending_bank_TRN" id="_010_mf20_sending_bank_TRN" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sending_bank_TRN'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                            
                                <!-- MF21 -->
                                <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                                    <input type="text" name="_020_mf21_related_reference" id="_020_mf21_related_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF32 -->
                                <div class="form-row"><span class="label_body">OF32</span><span class="label">Existing Maturity Date, Currency Code, Amount</span>
                                    <select id="type_of32_existing_maturity" name="type_of32_existing_maturity">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Date - Currency - Amount</option> <!-- - Ordering Customer-->
                                        <option value="k">K - Day/Month - Number of Days/Months - Code - Currency - Amount</option>
                                    </select>
                                    <div id="div_of32a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                            <input type="text" name="_030_of32a_date" id="_030_of32a_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_031_of32a_currency" id="_031_of32a_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_of32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_032_of32a_amount" id="_032_of32a_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_of32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of32k_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Day/Month</span>
                                            <select id="_033_of32k_day_month" name="_033_of32k_day_month">
                                                <option value="">choose a code</option>
                                                <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_of32k_day_month'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>D (Days)</option>
                                                <option value="M" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_of32k_day_month'}"><c:if test="${item.detail=='M'}"> selected="true" </c:if></c:if></c:forEach>>M (Months)</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number of Days/Months</span>
                                            <input type="text" name="_034_of32k_number_of_days_months" id="_034_of32k_number_of_days_months" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_034_of32k_number_of_days_months'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Code</span>
                                            <select id="_035_of32k_code" name="_035_of32k_code">
                                                <option value="">choose a code</option>
                                                <option value="BE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_of32k_code'}"><c:if test="${item.detail=='BE'}"> selected="true" </c:if></c:if></c:forEach>>BE</option>
                                                <option value="CC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_of32k_code'}"><c:if test="${item.detail=='CC'}"> selected="true" </c:if></c:if></c:forEach>>CC</option>
                                                <option value="FD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_of32k_code'}"><c:if test="${item.detail=='FD'}"> selected="true" </c:if></c:if></c:forEach>>FD</option>
                                                <option value="FP" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_of32k_code'}"><c:if test="${item.detail=='FP'}"> selected="true" </c:if></c:if></c:forEach>>FP</option>
                                                <option value="GA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_of32k_code'}"><c:if test="${item.detail=='GA'}"> selected="true" </c:if></c:if></c:forEach>>GA</option>
                                                <option value="ID" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_of32k_code'}"><c:if test="${item.detail=='ID'}"> selected="true" </c:if></c:if></c:forEach>>ID</option>
                                                <option value="ST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_of32k_code'}"><c:if test="${item.detail=='ST'}"> selected="true" </c:if></c:if></c:forEach>>ST</option>
                                                <option value="TD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_of32k_code'}"><c:if test="${item.detail=='TD'}"> selected="true" </c:if></c:if></c:forEach>>TD</option>
                                                <option value="XX" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_of32k_code'}"><c:if test="${item.detail=='XX'}"> selected="true" </c:if></c:if></c:forEach>>XX</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_036_of32k_currency" id="_036_of32k_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_036_of32k_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_037_of32k_amount" id="_037_of32k_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_037_of32k_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF33 -->
                                <div class="form-row"><span class="label_body">OF33</span><span class="label">Amended Maturity Date, Currency Code, Amount</span>
                                    <select id="type_of33_amended_maturity" name="type_of33_amended_maturity">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Date - Currency - Amount</option> <!-- - Ordering Customer-->
                                        <option value="k">K - Day/Month - Number of Days/Months - Code - Currency - Amount</option>
                                    </select>
                                    <div id="div_of33a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                            <input type="text" name="_040_of33a_date" id="_040_of33a_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of33a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_041_of33a_currency" id="_041_of33a_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of33a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_042_of33a_amount" id="_042_of33a_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_of33a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of33k_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Day/Month</span>
                                            <select id="_043_of33k_day_month" name="_043_of33k_day_month">
                                                <option value="">choose a code</option>
                                                <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_of33k_day_month'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>D (Days)</option>
                                                <option value="M" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_of33k_day_month'}"><c:if test="${item.detail=='M'}"> selected="true" </c:if></c:if></c:forEach>>M (Months)</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number of Days/Months</span>
                                            <input type="text" name="_044_of33k_number_of_days_months" id="_044_of33k_number_of_days_months" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_044_of33k_number_of_days_months'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Code</span>
                                            <select id="_045_of33k_code" name="_045_of33k_code">
                                                <option value="">choose a code</option>
                                                <option value="BE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_045_of33k_code'}"><c:if test="${item.detail=='BE'}"> selected="true" </c:if></c:if></c:forEach>>BE</option>
                                                <option value="CC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_045_of33k_code'}"><c:if test="${item.detail=='CC'}"> selected="true" </c:if></c:if></c:forEach>>CC</option>
                                                <option value="FD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_045_of33k_code'}"><c:if test="${item.detail=='FD'}"> selected="true" </c:if></c:if></c:forEach>>FD</option>
                                                <option value="FP" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_045_of33k_code'}"><c:if test="${item.detail=='FP'}"> selected="true" </c:if></c:if></c:forEach>>FP</option>
                                                <option value="GA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_045_of33k_code'}"><c:if test="${item.detail=='GA'}"> selected="true" </c:if></c:if></c:forEach>>GA</option>
                                                <option value="ID" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_045_of33k_code'}"><c:if test="${item.detail=='ID'}"> selected="true" </c:if></c:if></c:forEach>>ID</option>
                                                <option value="ST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_045_of33k_code'}"><c:if test="${item.detail=='ST'}"> selected="true" </c:if></c:if></c:forEach>>ST</option>
                                                <option value="TD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_045_of33k_code'}"><c:if test="${item.detail=='TD'}"> selected="true" </c:if></c:if></c:forEach>>TD</option>
                                                <option value="XX" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_045_of33k_code'}"><c:if test="${item.detail=='XX'}"> selected="true" </c:if></c:if></c:forEach>>XX</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_046_of33k_currency" id="_046_of33k_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_046_of33k_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_047_of33k_amount" id="_047_of33k_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_047_of33k_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF59 -->
                                <div class="form-row"><span class="label_body">OF59</span><span class="label">Drawee</span>
                                    <input type="checkbox" name="drawee_checkbox" id="drawee_checkbox" />
                                    <div id="check_of59">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                            <input type="text" name="_050_of59_account" id="_050_of59_account" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_051_of59_name_address" id="_051_of59_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF72 -->
                                <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_060_of72_sender_to_receiver" id="_060_of72_sender_to_receiver"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of72_sender_to_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF74 -->
                                <div class="form-row"><span class="label_body">OF74</span><span class="label">Amendments</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_070_of74_amendments" id="_070_of74_amendments"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of74_amendments'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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