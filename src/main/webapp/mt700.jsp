<%-- 
    Document   : mt700
    Created on : Jul 18, 2018
    Author     : Andhita Deara
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt700.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<!--<link rel="icon" href="images/favicon.ico"/>-->
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:700'}">
            <div id="judul">MT 700 Issue of a Documentary Credit</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="700" />
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
                                <!-- MF27 -->
                                <div class="form-row"><span class="label_body">MF27</span><span class="label">*Number</span>
                                    <input type="text" name="_010_mf27_number" id="_010_mf27_number" maxlength="1" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" /> 
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Total</span>
                                    <input type="text" name="_011_mf27_total" id="_011_mf27_total" maxlength="8" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF40A -->
                                <div class="form-row"><span class="label_body">MF40A</span><span class="label">*Form of Documentary Credit</span>
                                    <select id="_020_mf40a_form_of_documentary_credit" name="_020_mf40a_form_of_documentary_credit">
                                        <option value="">choose a code</option>
                                        <option value="IRREVOCABLE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf40a_form_of_documentary_credit'}"><c:if test="${item.detail=='IRREVOCABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE</option> <!-- - Ordering Customer-->
                                        <option value="IRREVOCABLE TRANSFERABLE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf40a_form_of_documentary_credit'}"><c:if test="${item.detail=='IRREVOCABLE TRANSFERABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE TRANSFERABLE</option>
                                        <option value="IRREVOCABLE STANDBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf40a_form_of_documentary_credit'}"><c:if test="${item.detail=='IRREVOCABLE STANDBY'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE STANDBY</option>
                                        <option value="IRREVOC TRANS STANDBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf40a_form_of_documentary_credit'}"><c:if test="${item.detail=='IRREVOC TRANS STANDBY'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOC TRANS STANDBY</option>
                                    </select>
                                </div>
                                <hr/>

                                <!-- MF20 -->
                                <div class="form-row"><span class="label_body">MF20</span><span class="label">*Documentary Credit Number</span>
                                    <input type="text" name="_030_mf20_documentary_credit_number" id="_030_mf20_documentary_credit_number" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf20_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- OF23 -->
                                <div class="form-row"><span class="label_body">OF23</span><span class="label">Reference to Pre-Advice</span>
                                    <input type="text" name="_040_of23_reference_to_preadvice" id="_040_of23_reference_to_preadvice" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of23_reference_to_preadvice'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF31C -->
                                <div class="form-row"><span class="label_body">MF31C</span><span class="label">*Date of Issue</span>
                                    <input type="text" name="_050_mf31c_date_of_issue" id="_050_mf31c_date_of_issue" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf31c_date_of_issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF40E -->
                                <div class="form-row"><span class="label_body">MF40E</span><span class="label">*Applicable Rules</span>
                                    <select id="_060_mf40e_applicable_rules" name="_060_mf40e_applicable_rules">
                                        <option value="">choose a code</option>
                                        <option value="EUCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='EUCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCP LATEST VERSION</option> <!-- - Ordering Customer-->
                                        <option value="EUCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='EUCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCPURR LATEST VERSION</option>
                                        <option value="ISP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='ISP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>ISP LATEST VERSION</option>
                                        <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                        <option value="UCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='UCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCP LATEST VERSION</option>
                                        <option value="UCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='UCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCPURR LATEST VERSION</option>
                                    </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                    <input type="text" name="_061_mf40e_narrative" id="_061_mf40e_narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf40e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF31D -->
                                <div class="form-row"><span class="label_body">MF31D</span><span class="label">*Date of Expiry</span>
                                    <input type="text" name="_070_mf31d_date_of_expiry" id="_070_mf31d_date_of_expiry" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf31d_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Place of Expiry</span>
                                    <input type="text" name="_071_mf31d_place_of_expiry" id="_071_mf31d_place_of_expiry" maxlength="29" size="29" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_mf31d_place_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                            
                                <!-- OF51 -->
                                <div class="form-row"><span class="label_body">OF51</span><span class="label">Applicant Bank</span>
                                    <select id="type_of51_applicant_bank" name="type_of51_applicant_bank">
                                        <option value="">choose a type</option>
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of51a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_080_of51a_party_identifier" id="_080_of51a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of51a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_081_of51a_identifier_code" id="_081_of51a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of51a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of51d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_082_of51d_party_identifier" id="_082_of51d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of51d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_083_of51d_name_address" id="_083_of51d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of51d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- MF50 -->
                                <div class="form-row"><span class="label_body">MF50</span><span class="label">*Name and Address Applicant</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_090_mf50_name_address_applicant" id="_090_mf50_name_address_applicant"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf50_name_address_applicant'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- MF59 -->
                                <div class="form-row"><span class="label_body">MF59</span><span class="label">Account Beneficiary</span>
                                    <input type="text" name="_100_mf59_account_beneficiary" id="_100_mf59_account_beneficiary" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf59_account_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address Beneficiary</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_101_mf59_name_address_beneficiary" id="_101_mf59_name_address_beneficiary"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf59_name_address_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- MF32B -->
                                <div class="form-row"><span class="label_body">MF32B</span><span class="label">*Currency Code</span>
                                    <input type="text" name="_110_mf32b_currency" id="_110_mf32b_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                    <input type="text" name="_111_mf32b_amount" id="_111_mf32b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    <font style="margin-left: 50px"></font>
                                    <script langauge="javascript">
                                        function formatUang(n, currency) {
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_111_mf32b_amount').value;
                                        var number2r = number2.replace(',', '.');
                                        var number2F = parseFloat(number2r);
                                        var nominal = formatUang(number2F, "");
                                        var nominalStyle = nominal.fontsize(3);
                                        var nominalStylec = nominalStyle.fontcolor("red");
                                        //var nominalStylecw = nominalStylec.fontWeight("900");
                                        document.write(nominalStylec);
                                    </script>
                                </div>
                                <hr/>
                                
                                <!-- OF39A -->
                                <div class="form-row"><span class="label_body">OF39A</span><span class="label">Percentage Credit Amount</span>
                                    <input type="checkbox" name="percentage_credit_amount_checkbox" id="percentage_credit_amount_checkbox" />
                                    <div id="check_of39a">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 1</span>
                                            <input type="text" name="_120_of39a_percentage_credit_amount_tolerance1" id="_120_of39a_percentage_credit_amount_tolerance1" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of39a_percentage_credit_amount_tolerance1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 2</span>
                                            <input type="text" name="_121_of39a_percentage_credit_amount_tolerance2" id="_121_of39a_percentage_credit_amount_tolerance2" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_of39a_percentage_credit_amount_tolerance2'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF39C -->
                                <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_130_of39c_additional_amount_covered" id="_130_of39c_additional_amount_covered"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of39c_additional_amount_covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- MF41 -->
                                <div class="form-row"><span class="label_body">MF41</span><span class="label">*Available With ... By ...</span>
                                    <select id="type_mf41_available_with_by" name="type_mf41_available_with_by">
                                        <option value="">choose a type</option>
                                        <option value="a">A - Identifier Code - Code</option> <!-- - Ordering Customer-->
                                        <option value="d">D - Name and Address - Code</option>
                                    </select>
                                    <div id="div_mf41a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                            <input type="text" name="_140_mf41a_identifier_code" id="_140_mf41a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_mf41a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                            <select id="_141_mf41a_code" name="_141_mf41a_code">
                                                <option value="">choose a code</option>
                                                <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_mf41a_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option> <!-- - Ordering Customer-->
                                                <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_mf41a_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                                <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_mf41a_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                                <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_mf41a_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                                <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_mf41a_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="div_mf41d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_142_mf41d_name_address" id="_142_mf41d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_142_mf41d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                            <select id="_143_mf41d_code" name="_143_mf41d_code">
                                                <option value="">choose a code</option>
                                                <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_143_mf41d_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option>
                                                <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_143_mf41d_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                                <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_143_mf41d_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                                <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_143_mf41d_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                                <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_143_mf41d_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF42C -->
                                <div class="form-row"><span class="label_body">OF42C</span><span class="label">Drafts at ...</span>
                                    <textarea cols="35" rows="3" maxlength="105" wrap="hard" style="resize:none;" name="_150_of42c_drafts_at" id="_150_of42c_drafts_at"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of42c_drafts_at'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF42 -->
                                <div class="form-row"><span class="label_body">OF42</span><span class="label">Drawee</span>
                                    <select id="type_of42_drawee" name="type_of42_drawee">
                                        <option value="">choose a type</option>
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of42a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_160_of42a_party_identifier" id="_160_of42a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of42a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_161_of42a_identifier_code" id="_161_of42a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_of42a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of42d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_162_of42d_party_identifier" id="_162_of42d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_of42d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_163_of42d_name_address" id="_163_of42d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_163_of42d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF42M -->
                                <div class="form-row"><span class="label_body">OF42M</span><span class="label">Mixed Payment Details</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_170_of42m_mixed_payment_details" id="_170_of42m_mixed_payment_details"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of42m_mixed_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF42P -->
                                <div class="form-row"><span class="label_body">OF42P</span><span class="label">Negotiation/Deferred Payment Details</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_180_of42p_negotiation_payment_details" id="_180_of42p_negotiation_payment_details"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of42p_negotiation_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF43P -->
                                <div class="form-row"><span class="label_body">OF43P</span><span class="label">Partial Shipments Code</span>
                                    <select id="_190_of43p_partial_shipments_code" name="_190_of43p_partial_shipments_code">
                                        <option value="">choose a code</option>
                                        <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of43p_partial_shipments_code'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option> <!-- - Ordering Customer-->
                                        <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of43p_partial_shipments_code'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                                        <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of43p_partial_shipments_code'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- OF43T -->
                                <div class="form-row"><span class="label_body">OF43T</span><span class="label">Transhipment Code</span>
                                    <select id="_200_of43t_transhipment_code" name="_200_of43t_transhipment_code">
                                        <option value="">choose a code</option>
                                        <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of43t_transhipment_code'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option> <!-- - Ordering Customer-->
                                        <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of43t_transhipment_code'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                                        <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of43t_transhipment_code'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- OF44A -->
                                <div class="form-row"><span class="label_body">OF44A</span><span class="label">Place of Taking in Charge/Dispatch from .../Place of Receipt</span>
                                    <input type="text" name="_210_of44a_place_of_receipt" id="_210_of44a_place_of_receipt" maxlength="65" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of44a_place_of_receipt'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF44E -->
                                <div class="form-row"><span class="label_body">OF44E</span><span class="label">Port of Loading/Airport of Departure</span>
                                    <input type="text" name="_220_of44e_port_of_loading" id="_220_of44e_port_of_loading" maxlength="65" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of44e_port_of_loading'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF44F -->
                                <div class="form-row"><span class="label_body">OF44F</span><span class="label">Port of Discharge/Airport of Destination</span>
                                    <input type="text" name="_230_of44f_port_of_discharge" id="_230_of44f_port_of_discharge" maxlength="65" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of44f_port_of_discharge'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF44B -->
                                <div class="form-row"><span class="label_body">OF44B</span><span class="label">Place of Final Destination/For Transportation to .../Place of Delivery</span>
                                    <input type="text" name="_240_of44b_place_of_delivery" id="_240_of44b_place_of_delivery" maxlength="65" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of44b_place_of_delivery'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF44C -->
                                <div class="form-row"><span class="label_body">OF44C</span><span class="label">Latest Date of Shipment</span>
                                    <input type="text" name="_250_of44c_latest_date_of_shipment" id="_250_of44c_latest_date_of_shipment" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of44c_latest_date_of_shipment'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF44D -->
                                <div class="form-row"><span class="label_body">OF44D</span><span class="label">Shipment Period</span>
                                    <textarea cols="65" rows="6" maxlength="390" wrap="hard" style="resize:none;" name="_260_of44d_shipment_period" id="_260_of44d_shipment_period"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of44d_shipment_period'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF45A -->
                                <div class="form-row"><span class="label_body">OF45A</span><span class="label">Description of Goods and/or Services</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_270_of45a_description_of_goods" id="_270_of45a_description_of_goods"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of45a_description_of_goods'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF46A -->
                                <div class="form-row"><span class="label_body">OF46A</span><span class="label">Documents Required</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_280_of46a_documents_required" id="_280_of46a_documents_required"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of46a_documents_required'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF47A -->
                                <div class="form-row"><span class="label_body">OF47A</span><span class="label">Additional Conditions</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_290_of47a_additional_conditions" id="_290_of47a_additional_conditions"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of47a_additional_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF49G -->
                                <div class="form-row"><span class="label_body">OF49G</span><span class="label">Special Payment Conditions for Beneficiary</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_300_of49g_special_payment_for_beneficiary" id="_300_of49g_special_payment_for_beneficiary"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of49g_special_payment_for_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF49H -->
                                <div class="form-row"><span class="label_body">OF49H</span><span class="label">Special Payment Conditions for Receiving Bank</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_310_of49h_special_payment_for_receiving" id="_310_of49h_special_payment_for_receiving"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of49h_special_payment_for_receiving'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF71D -->
                                <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_320_of71d_charges" id="_320_of71d_charges"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of71d_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF48 -->
                                <div class="form-row"><span class="label_body">OF48</span><span class="label">Period for Presentation in Days</span>
                                    <input type="text" name="_330_of48_period_for_presentation_in_days" id="_330_of48_period_for_presentation_in_days" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of48_period_for_presentation_in_days'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                    <input type="text" name="_331_of48_narrative" id="_331_of48_narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_331_of48_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF49 -->
                                <div class="form-row"><span class="label_body">MF49</span><span class="label">*Confirmation Instructions</span>
                                    <select id="_340_mf49_confirmation_instructions" name="_340_mf49_confirmation_instructions">
                                        <option value="">choose a code</option>
                                        <option value="CONFIRM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_mf49_confirmation_instructions'}"><c:if test="${item.detail=='CONFIRM'}"> selected="true" </c:if></c:if></c:forEach>>CONFIRM</option> <!-- - Ordering Customer-->
                                        <option value="MAY ADD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_mf49_confirmation_instructions'}"><c:if test="${item.detail=='MAY ADD'}"> selected="true" </c:if></c:if></c:forEach>>MAY ADD</option>
                                        <option value="WITHOUT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_mf49_confirmation_instructions'}"><c:if test="${item.detail=='WITHOUT'}"> selected="true" </c:if></c:if></c:forEach>>WITHOUT</option>
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- OF58 -->
                                <div class="form-row"><span class="label_body">OF58</span><span class="label">Requested Confirmation Party</span>
                                    <select id="type_of58_request_confirmation_party" name="type_of58_request_confirmation_party">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of58a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_350_of58a_party_identifier" id="_350_of58a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_351_of58a_identifier_code" id="_351_of58a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_351_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of58d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_352_of58d_party_identifier" id="_352_of58d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_352_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_353_of58d_name_address" id="_353_of58d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_353_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF53 -->
                                <div class="form-row"><span class="label_body">OF53</span><span class="label">Reimbursing Bank</span>
                                    <select id="type_of53_reimbursing_bank" name="type_of53_reimbursing_bank">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of53a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_360_of53a_party_identifier" id="_360_of53a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_361_of53a_identifier_code" id="_361_of53a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_361_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of53d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_362_of53d_party_identifier" id="_362_of53d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_362_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_363_of53d_name_address" id="_363_of53d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_363_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF78 -->
                                <div class="form-row"><span class="label_body">OF78</span><span class="label">Instructions to the Paying/Accepting/Negotiating Bank</span>
                                    <textarea cols="65" rows="12" maxlength="780" wrap="hard" style="resize:none;" name="_370_of78_instructions_of_paying" id="_370_of78_instructions_of_paying"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_of78_instructions_of_paying'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF57 -->
                                <div class="form-row"><span class="label_body">OF57</span><span class="label">'Advise Through' Bank</span>
                                    <select id="type_of57_advise_through_bank" name="type_of57_advise_through_bank">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="b">B - Party Identifier - Location</option> 
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of57a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_380_of57a_party_identifier" id="_380_of57a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_381_of57a_identifier_code" id="_381_of57a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_381_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of57b_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_382_of57b_party_identifier" id="_382_of57b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_382_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                            <input type="text" name="_383_of57b_location" id="_383_of57b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_383_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of57d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_384_of57d_party_identifier" id="_384_of57d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_384_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_385_of57d_name_address" id="_385_of57d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_385_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF72Z -->
                                <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_390_of72z_sender_to_receiver" id="_390_of72z_sender_to_receiver"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_of72z_sender_to_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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