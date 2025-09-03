<%-- 
    Document   : mt700
    Created on : Aug 26, 2025, 11:35:39 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT700 Issue of a Documentary Credit</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/mt700.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/mt700.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT 700 Issue of a Documentary Credit</h2></div>
    <form id="form_mt700" method="post" 
          action="${pageContext.request.contextPath}/MT700Servlet"
          autocomplete="off"
          onsubmit="return validateMT700() && confirm('Do you want to save this MT700 data?');">

        <input type="hidden" name="messageType" value="700"/>

        <ul class="tabs">
            <li><a href="#" rel="view1">Header</a></li>
            <li><a href="#" rel="view2">Body</a></li>
            <li><a href="#" rel="view3">Comment</a></li>
            <li><a href="#" rel="view4">Histories</a></li>
            <li><a href="#" rel="view5">Log MT Text</a></li>
            <li><a href="#" rel="view6">MT Relation</a></li>
            <li><a href="#" rel="view7">Translation</a></li>
        </ul>

        <div class="form-container">
            <div class="form-body tabcontents">
                <div id="view2" class="tabcontent active">

                    <!-- MF27 Sequence of Total -->
                    <div class="form-row">
                        <span class="label_body">MF27</span>
                        <span class="label"><a>*</a>Sequence of Total</span>
                        <input type="text" name="_010_mf27_sequence_of_total" 
                               id="_010_mf27_sequence_of_total"
                               class="mandatory" maxlength="3"/>
                    </div>
                    <hr/>

                    <!-- MF40A Form of Documentary Credit -->
                    <div class="form-row">
                        <span class="label_body">MF40A</span>
                        <span class="label"><a>*</a>Form of Documentary Credit</span>
                        <select name="_020_mf40a_form_of_credit" 
                                id="_020_mf40a_form_of_credit" 
                                class="mandatory">
                            <option value="">Choose...</option>
                            <option value="IRREVOCABLE">IRREVOCABLE</option>
                            <option value="IRREVOCABLE TRANSFERABLE">IRREVOCABLE TRANSFERABLE</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- MF20 Documentary Credit Number -->
                    <div class="form-row">
                        <span class="label_body">MF20</span>
                        <span class="label"><a>*</a>Documentary Credit Number</span>
                        <input type="text" name="_030_mf20_documentary_credit_number" 
                               id="_030_mf20_documentary_credit_number"
                               class="mandatory" maxlength="16"/>
                    </div>
                    <hr/>

                    <!-- OF23 Reference to Pre-Advice -->
                    <div class="form-row">
                        <span class="label_body">OF23</span>
                        <span class="label">Reference to Pre-Advice</span>
                        <input type="text" name="_040_of23_reference_to_preadvice" 
                               id="_040_of23_reference_to_preadvice"
                               maxlength="16"/>
                    </div>
                    <hr/>

                    <!-- MF31C Date of Issue -->
                    <div class="form-row">
                        <span class="label_body">MF31C</span>
                        <span class="label"><a>*</a>Date of Issue</span>
                        <input type="text" name="_050_mf31c_date_of_issue" 
                               id="_050_mf31c_date_of_issue"
                               class="mandatory" maxlength="6"/>
                    </div>
                    <hr/>

                    <!-- MF40E Applicable Rules -->
                    <div class="form-row">
                        <span class="label_body">MF40E</span>
                        <span class="label"><a>*</a>Applicable Rules</span>
                        <select name="_060_mf40e_applicable_rules" 
                                id="_060_mf40e_applicable_rules"
                                class="mandatory">
                            <option value="">Choose...</option>
                            <option value="UCP LATEST VERSION">UCP LATEST VERSION</option>
                            <option value="UCPURR LATEST VERSION">UCPURR LATEST VERSION</option>
                            <option value="EUCP LATEST VERSION">EUCP LATEST VERSION</option>
                            <option value="EUCPURR LATEST VERSION">EUCPURR LATEST VERSION</option>
                            <option value="OTHR">OTHR</option>
                        </select>
                    </div>
                    <div id="div_060_mf40e_narrative" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Narrative (if OTHR)</span>
                            <textarea name="_061_mf40e_narrative" 
                                      id="_061_mf40e_narrative"
                                      rows="2" maxlength="35"></textarea>
                        </div>
                    </div>
                    <hr/>
                    
                    <!-- MF31D Date and Place of Expiry -->
                    <div class="form-row">
                        <span class="label_body">MF31D</span>
                        <span class="label"><a>*</a>Date and Place of Expiry</span>
                        <input type="text" name="_070_mf31d_date_of_expiry"
                               id="_070_mf31d_date_of_expiry"
                               class="mandatory" maxlength="6"
                               placeholder="YYMMDD"/>
                        <input type="text" name="_071_mf31d_place_of_expiry"
                               id="_071_mf31d_place_of_expiry"
                               maxlength="29"
                               placeholder="Place"/>
                    </div>
                    <hr/>

                    <!-- OF51a Applicant Bank (Option A or D) -->
                    <div class="form-row">
                        <span class="label_body">OF51a</span>
                        <span class="label">Applicant Bank</span>
                        <select name="_080_of51a_option" id="_080_of51a_option">
                            <option value="">Choose a type</option>
                            <option value="A">Option A (BIC)</option>
                            <option value="D">Option D (Name & Address)</option>
                        </select>
                    </div>
                    <div id="div_080_of51a_A" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Identifier Code (BIC)</span>
                            <input type="text" name="_081_of51a_bic"
                                   id="_081_of51a_bic"
                                   maxlength="11"/>
                        </div>
                    </div>
                    <div id="div_080_of51a_D" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Name & Address</span>
                            <textarea name="_082_of51a_name_address"
                                      id="_082_of51a_name_address"
                                      rows="3" maxlength="140"></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- MF50 Applicant -->
                    <div class="form-row">
                        <span class="label_body">MF50</span>
                        <span class="label"><a>*</a>Applicant</span>
                        <textarea name="_090_mf50_applicant"
                                  id="_090_mf50_applicant"
                                  class="mandatory"
                                  rows="4" maxlength="140"></textarea>
                    </div>
                    <hr/>
                    
                    <!-- MF59 Beneficiary -->
                    <div class="form-row">
                        <span class="label_body">MF59</span>
                        <span class="label"><a>*</a>Beneficiary</span>
                    </div>
                    <div class="form-row">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Account</span>
                        <input type="text" name="_100_mf59_account"
                               id="_100_mf59_account"
                               maxlength="34"
                               value="<c:forEach var='item' items='${tags}'>
                                          <c:if test='${item.tagName eq "_100_mf59_account"}'>
                                              <c:out value='${item.detail}' />
                                          </c:if>
                                      </c:forEach>" />
                    </div>
                    <div class="form-row">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Name & Address</span>
                        <textarea name="_101_mf59_name_address"
                                  id="_101_mf59_name_address"
                                  class="mandatory"
                                  rows="4" maxlength="140"><c:forEach var='item' items='${tags}'>
                                      <c:if test='${item.tagName eq "_101_mf59_name_address"}'>
                                          <c:out value='${item.detail}' />
                                      </c:if>
                                  </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- MF32B Currency Code, Amount -->
                    <div class="form-row">
                        <span class="label_body">MF32B</span>
                        <span class="label"><a>*</a>Currency</span>
                        <input type="text" name="_110_mf32b_currency" id="_110_mf32b_currency"
                               class="mandatory"
                               onkeypress="return textonly(event)"
                               maxlength="3"
                               style="text-transform: uppercase;"
                               oninput="this.value = this.value.toUpperCase();"
                               value="<c:forEach var='item' items='${tags}'>
                                          <c:if test='${item.tagName eq "_110_mf32b_currency"}'>
                                              <c:out value='${item.detail}' />
                                          </c:if>
                                      </c:forEach>" />
                    </div>

                    <div class="form-row">
                        <span class="label_body">&nbsp;</span>
                        <span class="label"><a>*</a>Amount</span>
                        <input type="text" name="_111_mf32b_amount" id="_111_mf32b_amount"
                               class="mandatory"
                               onblur="cek_koma(this);"
                               maxlength="15"
                               onpaste="return false" ondrop="return false"
                               style="text-transform: uppercase;"
                               oninput="this.value = this.value.toUpperCase();"
                               value="<c:forEach var='item' items='${tags}'>
                                          <c:if test='${item.tagName eq "_111_mf32b_amount"}'>
                                              <c:out value='${item.detail}' />
                                          </c:if>
                                      </c:forEach>"
                               onkeypress="return numbersonly(event, '_110_mf32b_currency');" />
                        <!-- Format nominal (optional visual helper) -->
                        <font style="margin-left: 50px"></font>
                        <script>
                            function formatUang(n, currency) {
                                if (isNaN(n)) {
                                    return "";
                                }
                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                            }
                            var number2 = document.getElementById('_111_mf32b_amount').value;
                            if (number2) {
                                var number2r = number2.replace(',', '.');
                                var number2F = parseFloat(number2r);
                                var nominal = formatUang(number2F, "");
                                if (nominal !== "") {
                                    document.write(nominal.fontsize(2).fontcolor("blue"));
                                }
                            }
                        </script>
                    </div>
                    <hr/>

                    <!-- OF39A Percentage Credit Amount Tolerance -->
                    <div class="form-row">
                        <span class="label_body">OF39A</span>
                        <span class="label">Percentage Credit Amount Tolerance</span>
                        <input type="text" name="_120_of39a_tolerance_plus"
                               id="_120_of39a_tolerance_plus"
                               maxlength="2"
                               placeholder="Plus %"
                               value="<c:forEach var='item' items='${tags}'>
                                          <c:if test='${item.tagName eq "_120_of39a_tolerance_plus"}'>
                                              <c:out value='${item.detail}' />
                                          </c:if>
                                      </c:forEach>" />
                        <input type="text" name="_121_of39a_tolerance_minus"
                               id="_121_of39a_tolerance_minus"
                               maxlength="2"
                               placeholder="Minus %"
                               value="<c:forEach var='item' items='${tags}'>
                                          <c:if test='${item.tagName eq "_121_of39a_tolerance_minus"}'>
                                              <c:out value='${item.detail}' />
                                          </c:if>
                                      </c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF39C Additional Amounts Covered -->
                    <div class="form-row">
                        <span class="label_body">OF39C</span>
                        <span class="label">Additional Amounts Covered</span>
                        <textarea name="_130_of39c_additional_amounts"
                                  id="_130_of39c_additional_amounts"
                                  rows="4" maxlength="140"><c:forEach var='item' items='${tags}'>
                                      <c:if test='${item.tagName eq "_130_of39c_additional_amounts"}'>
                                          <c:out value='${item.detail}' />
                                      </c:if>
                                  </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- MF41A Available With ... By ... -->
                    <div class="form-row">
                        <span class="label_body">MF41A</span>
                        <span class="label"><a>*</a>Available With ... By ...</span>
                        <select id="_140_mf41a_option" name="_140_mf41a_option">
                            <option value="">-- option --</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_140_mf41a_option' and item.detail eq 'A'}">selected</c:if></c:forEach>>Option A (BIC)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_140_mf41a_option' and item.detail eq 'D'}">selected</c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>

                    <div class="form-row" id="wrap_141_mf41a_identifier_code" style="display:none;">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Identifier Code (BIC)</span>
                        <input type="text" id="_141_mf41a_identifier_code" name="_141_mf41a_identifier_code"
                               maxlength="11"
                               value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_141_mf41a_identifier_code"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                    </div>

                    <div class="form-row" id="wrap_142_mf41d_name_and_address" style="display:none;">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Name & Address</span>
                        <textarea id="_142_mf41d_name_and_address" name="_142_mf41d_name_and_address"
                                  rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_142_mf41d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>

                    <div class="form-row">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">By</span>
                        <select id="_143_mf41a_by" name="_143_mf41a_by">
                            <option value="">-- pilih --</option>
                            <option>BY ACCEPTANCE</option>
                            <option>BY DEF PAYMENT</option>
                            <option>BY MIXED PYMT</option>
                            <option>BY NEGOTIATION</option>
                            <option>BY PAYMENT</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF42C Drafts at ... -->
                    <div class="form-row">
                        <span class="label_body">OF42C</span>
                        <span class="label">Drafts at ...</span>
                        <textarea name="_150_of42c_drafts" id="_150_of42c_drafts"
                                  rows="3" maxlength="105"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_150_of42c_drafts"}'><c:out value='${item.detail}'/></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF42A Drawee -->
                    <div class="form-row">
                        <span class="label_body">OF42A</span>
                        <span class="label">Drawee</span>
                        <select id="_160_of42a_option" name="_160_of42a_option">
                            <option value="">-- option --</option>
                            <option value="A">Option A (BIC)</option>
                            <option value="D">Option D (Name &amp; Address)</option>
                        </select>
                    </div>

                    <div class="form-row" id="wrap_161_of42a_identifier_code" style="display:none;">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Identifier Code (BIC)</span>
                        <input type="text" id="_161_of42a_identifier_code" name="_161_of42a_identifier_code"
                               maxlength="11"
                               value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_161_of42a_identifier_code"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                    </div>

                    <div class="form-row" id="wrap_162_of42d_name_and_address" style="display:none;">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Name & Address</span>
                        <textarea id="_162_of42d_name_and_address" name="_162_of42d_name_and_address"
                                  rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_162_of42d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF42M Mixed Payment Details -->
                    <div class="form-row">
                        <span class="label_body">OF42M</span>
                        <span class="label">Mixed Payment Details</span>
                        <textarea name="_170_of42m_mixed_payment" id="_170_of42m_mixed_payment"
                                  rows="4" maxlength="140"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_170_of42m_mixed_payment"}'><c:out value='${item.detail}'/></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF42P Negotiation/Deferred Payment Details -->
                    <div class="form-row">
                        <span class="label_body">OF42P</span>
                        <span class="label">Negotiation/Deferred Payment Details</span>
                        <textarea name="_180_of42p_negotiation" id="_180_of42p_negotiation"
                                  rows="4" maxlength="140"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_180_of42p_negotiation"}'><c:out value='${item.detail}'/></c:if></c:forEach></textarea>
                    </div>
                    <hr/>
                    
                    <!-- OF43P Partial Shipments -->
                    <div class="form-row">
                        <span class="label_body">OF43P</span>
                        <span class="label">Partial Shipments</span>
                        <select name="_190_of43p_partial_shipments" id="_190_of43p_partial_shipments">
                            <option value="">-- choose --</option>
                            <option value="ALLOWED">ALLOWED</option>
                            <option value="CONDITIONAL">CONDITIONAL</option>
                            <option value="NOT ALLOWED">NOT ALLOWED</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF43T Transhipment -->
                    <div class="form-row">
                        <span class="label_body">OF43T</span>
                        <span class="label">Transhipment</span>
                        <select name="_200_of43t_transhipment" id="_200_of43t_transhipment">
                            <option value="">-- choose --</option>
                            <option value="ALLOWED">ALLOWED</option>
                            <option value="CONDITIONAL">CONDITIONAL</option>
                            <option value="NOT ALLOWED">NOT ALLOWED</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF44A Place of Taking in Charge/Dispatch/Receipt -->
                    <div class="form-row">
                        <span class="label_body">OF44A</span>
                        <span class="label">Place of Taking in Charge / Dispatch from / Place of Receipt</span>
                        <textarea name="_210_of44a_place_dispatch"
                                  id="_210_of44a_place_dispatch"
                                  rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_210_of44a_place_dispatch"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44E Port of Loading / Airport of Departure -->
                    <div class="form-row">
                        <span class="label_body">OF44E</span>
                        <span class="label">Port of Loading / Airport of Departure</span>
                        <textarea name="_220_of44e_port_loading"
                                  id="_220_of44e_port_loading"
                                  rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_220_of44e_port_loading"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44F Port of Discharge / Airport of Destination -->
                    <div class="form-row">
                        <span class="label_body">OF44F</span>
                        <span class="label">Port of Discharge / Airport of Destination</span>
                        <textarea name="_230_of44f_port_discharge"
                                  id="_230_of44f_port_discharge"
                                  rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_230_of44f_port_discharge"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44B Place of Final Destination / Place of Delivery -->
                    <div class="form-row">
                        <span class="label_body">OF44B</span>
                        <span class="label">Place of Final Destination / Place of Delivery</span>
                        <textarea name="_240_of44b_place_destination"
                                  id="_240_of44b_place_destination"
                                  rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_240_of44b_place_destination"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44C Latest Date of Shipment -->
                    <div class="form-row">
                        <span class="label_body">OF44C</span>
                        <span class="label">Latest Date of Shipment</span>
                        <input type="text" name="_250_of44c_latest_date"
                               id="_250_of44c_latest_date"
                               maxlength="6"
                               placeholder="YYMMDD"
                               value="<c:forEach var='item' items='${tags}'>
                                          <c:if test='${item.tagName eq "_250_of44c_latest_date"}'>
                                              <c:out value='${item.detail}' />
                                          </c:if>
                                      </c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF44D Shipment Period -->
                    <div class="form-row">
                        <span class="label_body">OF44D</span>
                        <span class="label">Shipment Period</span>
                        <textarea name="_260_of44d_shipment_period"
                                  id="_260_of44d_shipment_period"
                                  rows="3" maxlength="390"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_260_of44d_shipment_period"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>
                    
                    <!-- OF45A Description of Goods and/or Services -->
                    <div class="form-row">
                        <span class="label_body">OF45A</span>
                        <span class="label">Description of Goods and/or Services</span>
                        <textarea name="_270_of45a_description" id="_270_of45a_description"
                                  rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                            <c:if test="${item.tagName eq '_270_of45a_description'}">
                                <c:out value="${item.detail}" />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF46A Documents Required -->
                    <div class="form-row">
                        <span class="label_body">OF46A</span>
                        <span class="label">Documents Required</span>
                        <textarea name="_280_of46a_documents" id="_280_of46a_documents"
                                  rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                            <c:if test="${item.tagName eq '_280_of46a_documents'}">
                                <c:out value="${item.detail}" />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF47A Additional Conditions -->
                    <div class="form-row">
                        <span class="label_body">OF47A</span>
                        <span class="label">Additional Conditions</span>
                        <textarea name="_290_of47a_additional_conditions" id="_290_of47a_additional_conditions"
                                  rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                            <c:if test="${item.tagName eq '_290_of47a_additional_conditions'}">
                                <c:out value="${item.detail}" />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF49G Special Payment Conditions for Beneficiary -->
                    <div class="form-row">
                        <span class="label_body">OF49G</span>
                        <span class="label">Special Payment Conditions for Beneficiary</span>
                        <textarea name="_300_of49g_special_payment_beneficiary" id="_300_of49g_special_payment_beneficiary"
                                  rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                            <c:if test="${item.tagName eq '_300_of49g_special_payment_beneficiary'}">
                                <c:out value="${item.detail}" />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF49H Special Payment Conditions for Bank Only -->
                    <div class="form-row">
                        <span class="label_body">OF49H</span>
                        <span class="label">Special Payment Conditions for Bank Only</span>
                        <textarea name="_310_of49h_special_payment_bank" id="_310_of49h_special_payment_bank"
                                  rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                            <c:if test="${item.tagName eq '_310_of49h_special_payment_bank'}">
                                <c:out value="${item.detail}" />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- MF71D Charges -->
                    <div class="form-row">
                        <span class="label_body">OF71D</span>
                        <span class="label">Charges</span>
                        <textarea name="_320_of71d_charges"
                                  id="_320_of71d_charges"
                                  rows="6" maxlength="210"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_320_of71d_charges"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF48 Period for Presentation in Days -->
                    <div class="form-row">
                        <span class="label_body">OF48</span>
                        <span class="label">Period for Presentation in Days</span>
                        <input type="text" name="_330_of48_days"
                               id="_330_of48_days"
                               maxlength="3"
                               placeholder="Days"
                               value="<c:forEach var='item' items='${tags}'>
                                         <c:if test='${item.tagName eq "_330_of48_days"}'>
                                             <c:out value='${item.detail}' />
                                         </c:if>
                                      </c:forEach>" />
                        <input type="text" name="_331_of48_narrative"
                               id="_331_of48_narrative"
                               maxlength="35"
                               placeholder="Narrative (optional)"
                               value="<c:forEach var='item' items='${tags}'>
                                         <c:if test='${item.tagName eq "_331_of48_narrative"}'>
                                             <c:out value='${item.detail}' />
                                         </c:if>
                                      </c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF49 Confirmation Instructions -->
                    <div class="form-row">
                        <span class="label_body">MF49</span>
                        <span class="label"><a>*</a>Confirmation Instructions</span>
                        <select id="_340_mf49_confirmation" name="_340_mf49_confirmation" class="mandatory">
                            <option value="">-- select --</option>
                            <option value="CONFIRM"
                                    <c:if test="${_340_mf49_confirmation eq 'CONFIRM'}">selected</c:if>>
                                    CONFIRM
                                </option>
                                <option value="MAY ADD"
                                    <c:if test="${_340_mf49_confirmation eq 'MAY ADD'}">selected</c:if>>
                                    MAY ADD
                                </option>
                                <option value="WITHOUT"
                                    <c:if test="${_340_mf49_confirmation eq 'WITHOUT'}">selected</c:if>>
                                    WITHOUT
                                </option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF58a Requested Confirmation Party -->
                    <div class="form-row">
                        <span class="label_body">OF58a</span>
                        <span class="label">Requested Confirmation Party</span>
                        <div class="mt-row">
                            <div class="mt-col">
                                <select id="_350_of58a_option" name="_350_of58a_option">
                                    <option value="">-- option --</option>
                                    <option value="A"
                                        <c:if test="${_350_of58a_option eq 'A'}">selected</c:if>>
                                        Option A (BIC)
                                    </option>
                                    <option value="D"
                                        <c:if test="${_350_of58a_option eq 'D'}">selected</c:if>>
                                        Option D (Name &amp; Address)
                                    </option>
                                </select>
                            </div>
                            <div class="mt-col" id="wrap_351_of58a_bic" style="display:none;">
                                <input type="text" name="_351_of58a_bic" id="_351_of58a_bic"
                                       maxlength="11" placeholder="BIC"
                                       value="<c:forEach var='item' items='${tags}'>
                                                  <c:if test='${item.tagName eq "_351_of58a_bic"}'>
                                                      <c:out value='${item.detail}' />
                                                  </c:if>
                                              </c:forEach>" />
                            </div>
                            <div class="mt-col" id="wrap_352_of58a_name_address" style="display:none;">
                                <textarea name="_352_of58a_name_address" id="_352_of58a_name_address"
                                          rows="3" maxlength="140" placeholder="4*35x"><c:forEach var='item' items='${tags}'>
                                    <c:if test='${item.tagName eq "_352_of58a_name_address"}'>
                                        <c:out value='${item.detail}' />
                                    </c:if>
                                </c:forEach></textarea>
                            </div>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF53a Reimbursing Bank -->
                    <div class="form-row">
                        <span class="label_body">OF53a</span>
                        <span class="label">Reimbursing Bank</span>
                        <div class="mt-row">
                            <div class="mt-col">
                                <select id="_360_of53a_option" name="_360_of53a_option">
                                    <option value="">-- option --</option>
                                    <option value="A"
                                        <c:if test="${_360_of53a_option eq 'A'}">selected</c:if>>
                                        Option A (BIC)
                                    </option>
                                    <option value="D"
                                        <c:if test="${_360_of53a_option eq 'D'}">selected</c:if>>
                                        Option D (Name &amp; Address)
                                    </option>
                                </select>
                            </div>
                            <div class="mt-col" id="wrap_361_of53a_bic" style="display:none;">
                                <input type="text" name="_361_of53a_bic" id="_361_of53a_bic"
                                       maxlength="11" placeholder="BIC"
                                       value="<c:forEach var='item' items='${tags}'>
                                                  <c:if test='${item.tagName eq "_361_of53a_bic"}'>
                                                      <c:out value='${item.detail}' />
                                                  </c:if>
                                              </c:forEach>" />
                            </div>
                            <div class="mt-col" id="wrap_362_of53a_name_address" style="display:none;">
                                <textarea name="_362_of53a_name_address" id="_362_of53a_name_address"
                                          rows="3" maxlength="140" placeholder="4*35x"><c:forEach var='item' items='${tags}'>
                                    <c:if test='${item.tagName eq "_362_of53a_name_address"}'>
                                        <c:out value='${item.detail}' />
                                    </c:if>
                                </c:forEach></textarea>
                            </div>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF78 Instructions to Paying/Accepting/Negotiating Bank -->
                    <div class="form-row">
                        <span class="label_body">OF78</span>
                        <span class="label">Instructions to the Paying/Accepting/Negotiating Bank</span>
                        <textarea name="_370_of78_instructions"
                                  id="_370_of78_instructions"
                                  rows="6" maxlength="780"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_370_of78_instructions"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF57a Advise Through Bank -->
                    <div class="form-row">
                        <span class="label_body">OF57a</span>
                        <span class="label">'Advise Through' Bank</span>
                        <div class="mt-row">
                            <div class="mt-col">
                                <select id="_380_of57a_option" name="_380_of57a_option">
                                    <option value="">-- option --</option>
                                    <option value="A"
                                        <c:if test="${_380_of57a_option eq 'A'}">selected</c:if>>
                                        Option A (BIC)
                                    </option>
                                    <option value="B"
                                        <c:if test="${_380_of57a_option eq 'B'}">selected</c:if>>
                                        Option B (Location)
                                    </option>
                                    <option value="D"
                                        <c:if test="${_380_of57a_option eq 'D'}">selected</c:if>>
                                        Option D (Name &amp; Address)
                                    </option>
                                </select>
                            </div>
                            <div class="mt-col" id="wrap_381_of57a_bic" style="display:none;">
                                <input type="text" name="_381_of57a_bic" id="_381_of57a_bic"
                                       maxlength="11" placeholder="BIC"
                                       value="<c:forEach var='item' items='${tags}'>
                                                  <c:if test='${item.tagName eq "_381_of57a_bic"}'>
                                                      <c:out value='${item.detail}' />
                                                  </c:if>
                                              </c:forEach>" />
                            </div>
                            <div class="mt-col" id="wrap_382_of57a_location" style="display:none;">
                                <input type="text" name="_382_of57a_location" id="_382_of57a_location"
                                       maxlength="35" placeholder="Location"
                                       value="<c:forEach var='item' items='${tags}'>
                                                  <c:if test='${item.tagName eq "_382_of57a_location"}'>
                                                      <c:out value='${item.detail}' />
                                                  </c:if>
                                              </c:forEach>" />
                            </div>
                            <div class="mt-col" id="wrap_383_of57a_name_address" style="display:none;">
                                <textarea name="_383_of57a_name_address" id="_383_of57a_name_address"
                                          rows="3" maxlength="140" placeholder="4*35x"><c:forEach var='item' items='${tags}'>
                                    <c:if test='${item.tagName eq "_383_of57a_name_address"}'>
                                        <c:out value='${item.detail}' />
                                    </c:if>
                                </c:forEach></textarea>
                            </div>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF72Z Sender to Receiver Information -->
                    <div class="form-row">
                        <span class="label_body">OF72Z</span>
                        <span class="label">Sender to Receiver Information</span>
                        <textarea name="_390_of72z_information"
                                  id="_390_of72z_information"
                                  rows="6" maxlength="210"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_390_of72z_information"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>
                    
                </div>
            </div>
            <div class="footer">
                <button type="submit">Save</button>
                <button type="button" onclick="window.location.href='../index.jsp'">Back</button>
            </div>
        </div>
    </form>
</div>
<%@ include file="rule/validate_rule_mt700.jsp" %>
</body>
</html>
