<%-- 
    Document   : mt416
    Created on : Aug 20, 2018
    Author     : Andhita Deara
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt416.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:416'}">
            <div id="judul">MT 416 Advice of Non-Payment/Non-Acceptance</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="416" />
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
                                <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sender's Reference</span>
                                    <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF21 -->
                                <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                                    <input type="text" name="_020_mf21_related_reference" id="_020_mf21_related_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                                <hr/>
                                
                                <!-- OF23E -->
                                <div class="form-row"><span class="label_body">OF23E</span><span class="label">Advice Type</span>
                                    <input type="checkbox" name="advice_type_checkbox" id="advice_type_checkbox" />
                                    <div id="check_of23e">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Type</span>
                                            <select id="_030_of23e_type" name="_030_of23e_type">
                                                <option value="">choose a code</option>
                                                <option value="NACC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of23e_type'}"><c:if test="${item.detail=='NACC'}"> selected="true" </c:if></c:if></c:forEach>>Non-acceptance</option> 
                                                <option value="NPAY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of23e_type'}"><c:if test="${item.detail=='NPAY'}"> selected="true" </c:if></c:if></c:forEach>>No Payment</option>
                                                <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of23e_type'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>Other</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                            <input type="text" name="_031_of23e_narrative" id="_031_of23e_narrative" maxlength="30" size="30" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_of23e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF51A -->
                                <div class="form-row"><span class="label_body">OF51A</span><span class="label">Sending Institution</span>
                                    <input type="checkbox" name="sending_institution_checkbox" id="sending_institution_checkbox" />
                                    <div id="check_of51a">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_040_of51a_party_identifier" id="_040_of51a_party_identifier" maxlength="37" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of51a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                            <input type="text" name="_041_of51a_identifier_code" id="_041_of51a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of51a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF53 -->
                                <div class="form-row"><span class="label_body">OF53</span><span class="label">Sender's Correspondent</span>
                                    <select id="type_of53_sender_correspondent" name="type_of53_sender_correspondent">
                                        <option value="">choose a type</option>
                                        <option value="a">A - Party Identifier - Identifier Code</option>
                                        <option value="b">B - Party Identifier - Location</option>
                                    </select>
                                    <div id="div_of53a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_050_of53a_party_identifier" id="_050_of53a_party_identifier" maxlength="37" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                            <input type="text" name="_051_of53a_identifier_code" id="_051_of53a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                        </div>
                                        <!--<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>-->
                                            <!--<textarea name="_112_of52a_address" id="_112_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_112_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>-->
                                        <!--</div>-->
                                    </div>
                                    <div id="div_of53b_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_052_of53b_party_identifier" id="_052_of53b_party_identifier" maxlength="37" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of53b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                            <input type="text" name="_053_of53b_location" id="_053_of53b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of53b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF71F -->
                                <div class="form-row"><span class="label_body">OF71F</span><span class="label">Sender's Charges</span>
                                    <input type="checkbox" name="sender_charges_checkbox" id="sender_charges_checkbox" />
                                    <div id="check_of71f">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                            <input type="text" name="_060_of71f_currency" id="_060_of71f_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of71f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                            <input type="text" name="_061_of71f_amount" id="_061_of71f_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of71f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF77A -->
                                <div class="form-row"><span class="label_body">OF77A</span><span class="label">Reason for Non-Payment/Non-Acceptance</span>
                                    <textarea cols="35" rows="20" maxlength="700" wrap="hard" style="resize:none;" name="_070_of77a_reason_for_non_payment" id="_070_of77a_reason_for_non_payment"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of77a_reason_for_non_payment'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- MF21A -->
                                <div class="form-row"><span class="label_body">MF21A</span><span class="label">*Related Sequence Reference</span>
                                    <input type="text" name="_080_mf21a_related_sequence_reference" id="_080_mf21a_related_sequence_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf21a_related_sequence_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                                <hr/>
                                
                                <!-- OF23E -->
                                <div class="form-row"><span class="label_body">OF23E</span><span class="label">Advice Type</span>
                                    <input type="checkbox" name="advice_type_checkbox2" id="advice_type_checkbox2" />
                                    <div id="check2_of23e">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Type</span>
                                            <select id="_090_of23e_type" name="_090_of23e_type">
                                                <option value="">choose a code</option>
                                                <option value="NACC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23e_type'}"><c:if test="${item.detail=='NACC'}"> selected="true" </c:if></c:if></c:forEach>>Non-acceptance</option> 
                                                <option value="NPAY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23e_type'}"><c:if test="${item.detail=='NPAY'}"> selected="true" </c:if></c:if></c:forEach>>No Payment</option>
                                                <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23e_type'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>Other</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                            <input type="text" name="_091_of23e_narrative" id="_091_of23e_narrative" maxlength="30" size="30" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of23e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF21C -->
                                <div class="form-row"><span class="label_body">OF21C</span><span class="label">Principal's Reference</span>
                                    <input type="text" name="_100_of21c_principal_reference" id="_100_of21c_principal_reference" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of21c_principal_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                                <hr/>
                                
                                <!-- MF32 -->
                                <div class="form-row"><span class="label_body">MF32</span><span class="label">*Face Amount of Document(s)</span>
                                    <select id="type_mf32_face_amount_of_document" name="type_mf32_face_amount_of_document">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Date - Currency - Amount</option> 
                                        <option value="b">B - Currency - Amount</option> 
                                        <option value="k">K - Day/Month - Number of Days/Months - Code - Currency - Amount</option>
                                    </select>
                                    <div id="div_mf32a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                            <input type="text" name="_110_mf32a_date" id="_110_mf32a_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                            <input type="text" name="_111_mf32a_currency" id="_111_mf32a_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                            <input type="text" name="_112_mf32a_amount" id="_112_mf32a_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_112_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_mf32b_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                            <input type="text" name="_113_mf32b_currency" id="_113_mf32b_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_113_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                            <input type="text" name="_114_mf32b_amount" id="_114_mf32b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_114_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_mf32k_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Day/Month</span>
                                            <select id="_115_mf32k_day_month" name="_115_mf32k_day_month">
                                                <option value="">choose a code</option>
                                                <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_115_mf32k_day_month'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>D (Days)</option>
                                                <option value="M" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_115_mf32k_day_month'}"><c:if test="${item.detail=='M'}"> selected="true" </c:if></c:if></c:forEach>>M (Months)</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number of Days/Months</span>
                                            <input type="text" name="_116_mf32k_number_of_days_months" id="_116_mf32k_number_of_days_months" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_116_mf32k_number_of_days_months'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                            <select id="_117_mf32k_code" name="_117_mf32k_code">
                                                <option value="">choose a code</option>
                                                <option value="BE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_117_mf32k_code'}"><c:if test="${item.detail=='BE'}"> selected="true" </c:if></c:if></c:forEach>>BE</option>
                                                <option value="CC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_117_mf32k_code'}"><c:if test="${item.detail=='CC'}"> selected="true" </c:if></c:if></c:forEach>>CC</option>
                                                <option value="FD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_117_mf32k_code'}"><c:if test="${item.detail=='FD'}"> selected="true" </c:if></c:if></c:forEach>>FD</option>
                                                <option value="FP" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_117_mf32k_code'}"><c:if test="${item.detail=='FP'}"> selected="true" </c:if></c:if></c:forEach>>FP</option>
                                                <option value="GA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_117_mf32k_code'}"><c:if test="${item.detail=='GA'}"> selected="true" </c:if></c:if></c:forEach>>GA</option>
                                                <option value="ID" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_117_mf32k_code'}"><c:if test="${item.detail=='ID'}"> selected="true" </c:if></c:if></c:forEach>>ID</option>
                                                <option value="ST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_117_mf32k_code'}"><c:if test="${item.detail=='ST'}"> selected="true" </c:if></c:if></c:forEach>>ST</option>
                                                <option value="TD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_117_mf32k_code'}"><c:if test="${item.detail=='TD'}"> selected="true" </c:if></c:if></c:forEach>>TD</option>
                                                <option value="XX" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_117_mf32k_code'}"><c:if test="${item.detail=='XX'}"> selected="true" </c:if></c:if></c:forEach>>XX</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                            <input type="text" name="_118_mf32k_currency" id="_118_mf32k_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_118_mf32k_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                            <input type="text" name="_119_mf32k_amount" id="_119_mf32k_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_119_mf32k_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF50D -->
                                <div class="form-row"><span class="label_body">OF50D</span><span class="label">Principal</span>
                                    <input type="checkbox" name="principal_checkbox" id="principal_checkbox" />
                                    <div id="check_of50d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_120_of50d_party_identifier" id="_120_of50d_party_identifier" maxlength="37" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of50d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_121_of50d_name_address" id="_121_of50d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_of50d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF59 -->
                                <div class="form-row"><span class="label_body">OF59</span><span class="label">Drawee</span>
                                    <input type="checkbox" name="drawee_checkbox" id="drawee_checkbox" />
                                    <div id="check_of59">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                            <input type="text" name="_130_of59_account" id="_130_of59_account" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_131_of59_name_address" id="_131_of59_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_131_of59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF71F -->
                                <div class="form-row"><span class="label_body">OF71F</span><span class="label">Sender's Charges</span>
                                    <input type="checkbox" name="sender_charges_checkbox2" id="sender_charges_checkbox2" />
                                    <div id="check2_of71f">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                            <input type="text" name="_140_of71f_currency" id="_140_of71f_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of71f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                            <input type="text" name="_141_of71f_amount" id="_141_of71f_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_of71f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF77A -->
                                <div class="form-row"><span class="label_body">OF77A</span><span class="label">Reason for Non-Payment/Non-Acceptance</span>
                                    <textarea cols="35" rows="20" maxlength="700" wrap="hard" style="resize:none;" name="_150_of77a_reason_for_non_payment" id="_150_of77a_reason_for_non_payment"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of77a_reason_for_non_payment'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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