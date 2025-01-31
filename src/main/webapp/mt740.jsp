<%-- 
    Document   : mt740
    Created on : Aug 14, 2018
    Author     : Andhita Deara
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt740.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:740'}">
            <div id="judul">MT 740 Authorisation to Reimburse</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="740" />
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
                                <div class="form-row"><span class="label_body">MF20</span><span class="label">*Documentary Credit Number</span>
                                    <input type="text" name="_010_mf20_documentary_credit_number" id="_010_mf20_documentary_credit_number" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF25 -->
                                <div class="form-row"><span class="label_body">OF25</span><span class="label">Account Identification</span>
                                    <input type="text" name="_020_of25_account_identification" id="_020_of25_account_identification" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of25_account_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF40F -->
                                <div class="form-row"><span class="label_body">MF40F</span><span class="label">*Applicable Rules</span>
                                    <select id="_030_mf40f_applicable_rules" name="_030_mf40f_applicable_rules">
                                        <option value="">choose a code</option>
                                        <option value="NOTURR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf40f_applicable_rules'}"><c:if test="${item.detail=='NOTURR'}"> selected="true" </c:if></c:if></c:forEach>>NOTURR</option> <!-- - Ordering Customer-->
                                        <option value="URR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf40f_applicable_rules'}"><c:if test="${item.detail=='URR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>URR LATEST VERSION</option>
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- OF31D -->
                                <div class="form-row"><span class="label_body">OF31D</span><span class="label">Date and Place of Expiry</span>
                                    <input type="checkbox" name="date_place_of_expiry_checkbox" id="date_place_of_expiry_checkbox" />
                                    <div id="check_of31d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                            <input type="text" name="_040_of31d_date" id="_040_of31d_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of31d_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Place</span>
                                            <input type="text" name="_041_of31d_place" id="_041_of31d_place" maxlength="29" size="29" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of31d_place'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF58 -->
                                <div class="form-row"><span class="label_body">OF58</span><span class="label">Negotiating Bank</span>
                                    <select id="type_of58_negotiating_bank" name="type_of58_negotiating_bank">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of58a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_050_of58a_party_identifier" id="_050_of58a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_051_of58a_identifier_code" id="_051_of58a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of58d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_052_of58d_party_identifier" id="_052_of58d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_053_of58d_name_address" id="_053_of58d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF59 -->
                                <div class="form-row"><span class="label_body">OF59</span><span class="label">Beneficiary</span>
                                    <input type="checkbox" name="beneficiary_checkbox" id="beneficiary_checkbox" />
                                    <div id="check_of59">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                            <input type="text" name="_060_of59_account" id="_060_of59_account" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_061_of59_name_address" id="_061_of59_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- MF32B -->
                                <div class="form-row"><span class="label_body">MF32B</span><span class="label">*Currency Credit Amount</span>
                                    <input type="text" name="_070_mf32b_currency_credit_amount" id="_070_mf32b_currency_credit_amount" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf32b_currency_credit_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                    <input type="text" name="_071_mf32b_amount" id="_071_mf32b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    <font style="margin-left: 50px"></font>
                                    <script langauge="javascript">
                                        function formatUang(n, currency) {
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_071_mf32b_amount').value;
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
                                <div class="form-row"><span class="label_body">OF39A</span><span class="label">Percentage Credit Amount Tolerance</span>
                                    <input type="checkbox" name="percentage_credit_amount_checkbox" id="percentage_credit_amount_checkbox" />
                                    <div id="check_of39a">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 1</span>
                                            <input type="text" name="_080_of39a_percentage_credit_amount_tolerance1" id="_080_of39a_percentage_credit_amount_tolerance1" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of39a_percentage_credit_amount_tolerance1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 2</span>
                                            <input type="text" name="_081_of39a_percentage_credit_amount_tolerance2" id="_081_of39a_percentage_credit_amount_tolerance2" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of39a_percentage_credit_amount_tolerance2'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF39C -->
                                <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_090_of39c_additional_amount_covered" id="_090_of39c_additional_amount_covered"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of39c_additional_amount_covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
                                            <input type="text" name="_100_mf41a_identifier_code" id="_100_mf41a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf41a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                            <select id="_101_mf41a_code" name="_101_mf41a_code">
                                                <option value="">choose a code</option>
                                                <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option> <!-- - Ordering Customer-->
                                                <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                                <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                                <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                                <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="div_mf41d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_102_mf41d_name_address" id="_102_mf41d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_mf41d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                            <select id="_103_mf41d_code" name="_103_mf41d_code">
                                                <option value="">choose a code</option>
                                                <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option> <!-- - Ordering Customer-->
                                                <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                                <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                                <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                                <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF42C -->
                                <div class="form-row"><span class="label_body">OF42C</span><span class="label">Drafts at ...</span>
                                    <textarea cols="35" rows="3" maxlength="105" wrap="hard" style="resize:none;" name="_110_of42c_drafts_at" id="_110_of42c_drafts_at"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of42c_drafts_at'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
                                            <input type="text" name="_120_of42a_party_identifier" id="_120_of42a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of42a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_121_of42a_identifier_code" id="_121_of42a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_of42a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of42d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_122_of42d_party_identifier" id="_122_of42d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_122_of42d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_123_of42d_name_address" id="_123_of42d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_123_of42d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF42M -->
                                <div class="form-row"><span class="label_body">OF42M</span><span class="label">Mixed Payment Details</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_130_of42m_mixed_payment_details" id="_130_of42m_mixed_payment_details"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of42m_mixed_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF42P -->
                                <div class="form-row"><span class="label_body">OF42P</span><span class="label">Negotiation/Deferred Payment Details</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_140_of42p_negotiation_payment_details" id="_140_of42p_negotiation_payment_details"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of42p_negotiation_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF71A -->
                                <div class="form-row"><span class="label_body">OF71A</span><span class="label">Reimbursing Bank's Charges</span>
                                    <select id="_150_of71a_applicable_rules" name="_150_of71a_applicable_rules">
                                        <option value="">choose a code</option>
                                        <option value="CLM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of71a_applicable_rules'}"><c:if test="${item.detail=='CLM'}"> selected="true" </c:if></c:if></c:forEach>>Claiming bank's charges</option> <!-- - Ordering Customer-->
                                        <option value="OUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of71a_applicable_rules'}"><c:if test="${item.detail=='OUR'}"> selected="true" </c:if></c:if></c:forEach>>Our charges</option>
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- OF71D -->
                                <div class="form-row"><span class="label_body">OF71D</span><span class="label">Other Charges</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_160_of71d_other_charges" id="_160_of71d_other_charges"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of71d_other_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF72Z -->
                                <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_170_of72z_sender_to_receiver" id="_170_of72z_sender_to_receiver"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of72z_sender_to_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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