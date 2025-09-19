<%-- 
    Document   : mt740
    Created on : Sep 12, 2025, 9:54:10 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT740 Authorisation to Reimburse</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt740.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt740.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT740 Authorisation to Reimburse</h2></div>
    <form id="form_mt740" method="post" 
          action="${pageContext.request.contextPath}/MT740Servlet"
          autocomplete="off"
          onsubmit="return validateMT740() && confirm('Do you want to save this MT740 data?');">

        <input type="hidden" name="messageType" value="740"/>

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

                        <!-- MF20 Documentary Credit Number -->
                        <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Documentary Credit Number</span>
                            <input type="text" name="_010_mf20_documentary_credit_number" 
                                   id="_010_mf20_documentary_credit_number"
                                   class="mandatory" maxlength="16"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_010_mf20_documentary_credit_number"}'>
                                                  <c:out value='${item.detail}' />
                                              </c:if>
                                          </c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- OF25 Account Identification -->
                        <div class="form-row"><span class="label_body">OF25</span><span class="label">Account Identification</span>
                            <input type="text" name="_020_of25_account_identification" id="_020_of25_account_identification"
                                   maxlength="35"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_020_of25_account_identification"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <hr/>
                        
                        <!-- MF40F Applicable Rules -->
                        <div class="form-row"><span class="label_body">MF40F</span><span class="label"><a style="color:red;text-decoration:none">*</a>Applicable Rules</span>
                            <select name="_030_mf40f_applicable_rules" id="_030_mf40f_applicable_rules" class="mandatory">
                                <option value="">choose a code</option>
                                <option value="NOTURR"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_030_mf40f_applicable_rules' and item.detail eq 'NOTURR'}">selected</c:if>
                                    </c:forEach>>
                                    NOTURR - Not subject to URR
                                </option>
                                <option value="URR LATEST VERSION"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_030_mf40f_applicable_rules' and item.detail eq 'URR LATEST VERSION'}">selected</c:if>
                                    </c:forEach>>
                                    URR LATEST VERSION
                                </option>
                            </select>
                        </div>
                        <hr/>
                        
                        <!-- OF31D Date and Place of Expiry -->
                        <div class="form-row"><span class="label_body">OF31D</span><span class="label">Date and Place of Expiry</span>
                            <input type="text" name="_040_of31d_date_of_expiry" id="_040_of31d_date_of_expiry"
                                   maxlength="6" placeholder="YYMMDD"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_040_of31d_date_of_expiry"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                            <input type="text" name="_041_of31d_place_of_expiry" id="_041_of31d_place_of_expiry"
                                   maxlength="29" placeholder="Place"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_041_of31d_place_of_expiry"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- OF58a Negotiating Bank -->
                        <div class="form-row"><span class="label_body">OF58a</span><span class="label">Negotiating Bank</span>
                            <select id="_050_of58a_negotiating_bank" name="_050_of58a_negotiating_bank">
                                <option value="">choose a type</option>
                                <option value="A" <c:if test="${_050_of58a_negotiating_bank eq 'A'}">selected</c:if>>Option A (Identifier Code)</option>
                                <option value="D" <c:if test="${_050_of58a_negotiating_bank eq 'D'}">selected</c:if>>Option D (Name &amp; Address)</option>
                            </select>
                        </div>
                            
                        <div class="form-row" id="wrap_051_of58a_party_identifier" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_051_of58a_party_identifier" name="_051_of58a_party_identifier"
                                   maxlength="34"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_051_of58a_party_identifier"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_052_of58a_identifier_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_052_of58a_identifier_code" name="_052_of58a_identifier_code"
                                   maxlength="11"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_052_of58a_identifier_code"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_053_of58a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_053_of58a_name_address" name="_053_of58a_name_address"
                                      rows="3" maxlength="140"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_053_of58a_name_address'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>
                        
                        <!-- OF59 Beneficiary -->
                        <div class="form-row"><span class="label_body">OF59</span><span class="label">Beneficiary</span>
                            <input type="checkbox" name="beneficiary_checkbox" id="beneficiary_checkbox" />
                            <div id="check_of59">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                    <input type="text" name="_060_of59_account" id="_060_of59_account" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)"/>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_061_of59_name_address" id="_061_of59_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>
                        </div>
                        <hr/>
                        
                        <!-- MF32B Credit Amount -->
                        <div class="form-row"><span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Credit Amount</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">currency</span>
                            <input type="text" name="_070_mf32b_currency" id="_070_mf32b_currency"
                                   class="mandatory"
                                   onkeypress="return textonly(event)"
                                   maxlength="3"
                                   style="text-transform: uppercase;"
                                   oninput="this.value = this.value.toUpperCase();"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_070_mf32b_currency"}'>
                                                  <c:out value='${item.detail}' />
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" name="_071_mf32b_amount" id="_071_mf32b_amount"
                                   class="mandatory"
                                   onblur="cek_koma(this);"
                                   maxlength="15"
                                   onpaste="return false" ondrop="return false"
                                   style="text-transform: uppercase;"
                                   oninput="this.value = this.value.toUpperCase();"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_071_mf32b_amount"}'>
                                                  <c:out value='${item.detail}' />
                                              </c:if>
                                          </c:forEach>"
                                   onkeypress="return numbersonly(event, '_070_mf32b_currency');" />
                            <!-- Format nominal (optional visual helper) -->
                            <font style="margin-left: 50px"></font>
                            <script>
                                function formatUang(n, currency) {
                                    if (isNaN(n)) {
                                        return "";
                                    }
                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                }
                                var number2 = document.getElementById('_071_mf32b_amount').value;
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
                        <div class="form-row"><span class="label_body">OF39A</span><span class="label">Percentage Credit Amount Tolerance</span>
                            <input type="number" name="_080_of39a_plus" id="_080_of39a_plus"
                                   min="0" max="99" placeholder="Plus %"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_080_of39a_plus"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                            <input type="number" name="_081_of39a_minus" id="_081_of39a_minus"
                                   min="0" max="99" placeholder="Minus %"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_081_of39a_minus"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF39C Additional Amounts Covered -->
                        <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                            <textarea name="_090_of39c_additional_amounts_covered" id="_090_of39c_additional_amounts_covered"
                                      rows="4" maxlength="140"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_090_of39c_additional_amounts_covered'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- MF41a Available With ... By ... -->
                        <div class="form-row"><span class="label_body">MF41a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Available With ... By ...</span>
                            <select id="_100_mf41a_available_with_by" name="_100_mf41a_available_with_by" class="mandatory">
                                <option value="">choose a type</option>
                                <option value="A"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_100_mf41a_available_with_by' and item.detail eq 'A'}">selected</c:if>
                                    </c:forEach>>
                                    Option A (Identifier Code)
                                </option>
                                <option value="D"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_100_mf41a_available_with_by' and item.detail eq 'D'}">selected</c:if>
                                    </c:forEach>>
                                    Option D (Name &amp; Address)
                                </option>
                            </select>
                        </div>

                        <div class="form-row" id="wrap_101_mf41a_identifier_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_101_mf41a_identifier_code" name="_101_mf41a_identifier_code"
                                   maxlength="11"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_101_mf41a_identifier_code"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_102_mf41a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_102_mf41a_name_address" name="_102_mf41a_name_address"
                                      rows="3" maxlength="140"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_102_mf41a_name_address'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>

                        <div class="form-row" id="wrap_103_mf41a_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Code</span>
                            <select id="_103_mf41a_code" name="_103_mf41a_code">
                                <option value="">choose a type</option>
                                <option value="BY ACCEPTANCE"
                                    <c:if test="${_103_mf41a_code eq 'BY ACCEPTANCE'}">selected</c:if>>
                                    BY ACCEPTANCE
                                </option>
                                <option value="BY DEF PAYMENT"
                                    <c:if test="${_103_mf41a_code eq 'BY DEF PAYMENT'}">selected</c:if>>
                                    BY DEF PAYMENT
                                </option>
                                <option value="BY MIXED PYMT"
                                    <c:if test="${_103_mf41a_code eq 'BY MIXED PYMT'}">selected</c:if>>
                                    BY MIXED PYMT
                                </option>
                                <option value="BY NEGOTIATION"
                                    <c:if test="${_103_mf41a_code eq 'BY NEGOTIATION'}">selected</c:if>>
                                    BY NEGOTIATION
                                </option>
                                <option value="BY PAYMENT"
                                    <c:if test="${_103_mf41a_code eq 'BY PAYMENT'}">selected</c:if>>
                                    BY PAYMENT
                                </option>
                            </select>
                        </div>
                        <hr/>

                        <!-- OF42C Drafts at ... -->
                        <div class="form-row"><span class="label_body">OF42C</span><span class="label">Drafts at ...</span>
                            <textarea name="_110_of42c_drafts_at" id="_110_of42c_drafts_at"
                                      rows="3" maxlength="105"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_110_of42c_drafts_at'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF42a Drawee -->
                        <div class="form-row"><span class="label_body">OF42a</span><span class="label">Drawee</span>
                            <select id="_120_of42a_drawee" name="_120_of42a_drawee">
                                <option value="">choose a type</option>
                                <option value="A"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_120_of42a_drawee' and item.detail eq 'A'}">selected</c:if>
                                    </c:forEach>>
                                    Option A (Identifier Code)
                                </option>
                                <option value="D"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_120_of42a_drawee' and item.detail eq 'D'}">selected</c:if>
                                    </c:forEach>>
                                    Option D (Name &amp; Address)
                                </option>
                            </select>
                        </div>

                        <div class="form-row" id="wrap_121_of42a_identifier_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_121_of42a_identifier_code" name="_121_of42a_identifier_code"
                                   maxlength="11"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_121_of42a_identifier_code"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_122_of42a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_122_of42a_name_address" name="_122_of42a_name_address"
                                      rows="3" maxlength="140"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_122_of42a_name_address'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF42M Mixed Payment Details -->
                        <div class="form-row"><span class="label_body">OF42M</span><span class="label">Mixed Payment Details</span>
                            <textarea name="_130_of42m_mixed_payment_details" id="_130_of42m_mixed_payment_details"
                                      rows="4" maxlength="140"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_130_of42m_mixed_payment_details'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF42P Negotiation/Deferred Payment Details -->
                        <div class="form-row"><span class="label_body">OF42P</span><span class="label">Negotiation / Deferred Payment Details</span>
                            <textarea name="_140_of42p_negotiation_deferred_payment_details" id="_140_of42p_negotiation_deferred_payment_details"
                                      rows="4" maxlength="140"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_140_of42p_negotiation_deferred_payment_details'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>
                        
                        <!-- OF71A Reimbursing Bank's Charges -->
                        <div class="form-row"><span class="label_body">OF71A</span><span class="label">Reimbursing Bank's Charges</span>
                            <select name="_150_of71a_reimbursing_banks_charges" id="_150_of71a_reimbursing_banks_charges">
                                <option value="">choose a code</option>
                                <option value="CLM" <c:if test="${_150_of71a_reimbursing_banks_charges eq 'CLM'}">selected</c:if>>CLM - Claiming bank's charges</option>
                                <option value="OUR" <c:if test="${_150_of71a_reimbursing_banks_charges eq 'OUR'}">selected</c:if>>OUR - Our charges</option>
                            </select>
                        </div>
                        <hr/>
                        
                        <!-- OF71D Other Charges -->
                        <div class="form-row"><span class="label_body">OF71D</span><span class="label">Other Charges</span>
                            <textarea name="_160_of71d_other_charges"
                                      id="_160_of71d_other_charges"
                                      rows="6" maxlength="210"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_160_of71d_other_charges"}'>
                                    <c:out value='${item.detail}' />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>
                        
                        <!-- OF72Z Sender to Receiver Information -->
                        <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                            <textarea name="_170_of72z_sender_to_receiver_information"
                                      id="_170_of72z_sender_to_receiver_information"
                                      rows="6" maxlength="210"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_170_of72z_sender_to_receiver_information"}'>
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
<%@ include file="rule/validate_rule_mt740.jsp" %>
</body>
</html>
