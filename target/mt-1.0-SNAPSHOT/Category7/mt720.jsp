<%-- 
    Document   : mt720
    Created on : Sep 12, 2025, 9:53:26 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT720 Transfer of a Documentary Credit</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt720.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt720.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT720 Transfer of a Documentary Credit</h2></div>
    <form id="form_mt720" method="post" 
          action="${pageContext.request.contextPath}/MT720Servlet"
          autocomplete="off"
          onsubmit="return validateMT720() && confirm('Do you want to save this MT720 data?');">

        <input type="hidden" name="messageType" value="720"/>

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
                            <span class="label"><a style="color:red;text-decoration:none">*</a>Sequence of Total</span>
                            <input type="text" name="_010_mf27_sequence_of_total" 
                                id="_010_mf27_sequence_of_total"
                                class="mandatory" maxlength="3"
                                value="<c:forEach var='item' items='${tags}'>
                                           <c:if test='${item.tagName eq "_010_mf27_sequence_of_total"}'>
                                               <c:out value='${item.detail}' />
                                           </c:if>
                                       </c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF40B Form of Documentary Credit -->
                        <div class="form-row">
                            <span class="label_body">MF40B</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a> Form of Documentary Credit</span>
                            <select name="_020_mf40b_type" id="_020_mf40b_type" class="mandatory">
                                <option value="">choose a type</option>
                                <option value="IRREVOCABLE"
                                  <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName eq '_020_mf40b_type' and item.detail eq 'IRREVOCABLE'}">selected</c:if>
                                  </c:forEach>>IRREVOCABLE</option>
                            </select>

                            <select name="_021_mf40b_code" id="_021_mf40b_code" class="mandatory">
                                <option value="">choose</option>
                                <option value="ADDING OUR CONFIRMATION"
                                  <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName eq '_021_mf40b_code' and item.detail eq 'ADDING OUR CONFIRMATION'}">selected</c:if>
                                  </c:forEach>>ADDING OUR CONFIRMATION</option>
                                <option value="WITHOUT OUR CONFIRMATION"
                                  <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName eq '_021_mf40b_code' and item.detail eq 'WITHOUT OUR CONFIRMATION'}">selected</c:if>
                                  </c:forEach>>WITHOUT OUR CONFIRMATION</option>
                            </select>
                        </div>
                        <hr/>

                        <!-- MF20 Transferring Bank's Reference -->
                        <div class="form-row">
                            <span class="label_body">MF20</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a> Transferring Bank's Reference</span>
                            <input type="text" name="_030_mf20_transferring_bank_reference" id="_030_mf20_transferring_bank_reference"
                                class="mandatory" maxlength="16"
                                onkeypress="avoidSplChars(event)"
                                value="<c:forEach var='item' items='${tags}'>
                                           <c:if test='${item.tagName eq "_030_mf20_transferring_bank_reference"}'>
                                        <c:out value='${item.detail}'/>
                                    </c:if>
                                </c:forEach>"/>
                        </div>
                        <hr/>

                        <!-- MF21 Documentary Credit Number -->
                        <div class="form-row">
                            <span class="label_body">MF21</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a>Documentary Credit Number</span>
                            <input type="text" name="_040_mf21_documentary_credit_number" 
                                   id="_040_mf21_documentary_credit_number"
                                   class="mandatory" maxlength="16"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_040_mf21_documentary_credit_number"}'>
                                                  <c:out value='${item.detail}' />
                                              </c:if>
                                          </c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF31C Date of Issue -->
                        <div class="form-row">
                            <span class="label_body">MF31C</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a>Date of Issue</span>
                            <input type="text" name="_050_mf31c_date_of_issue" 
                                   id="_050_mf31c_date_of_issue"
                                   class="mandatory" maxlength="6" placeholder="YYMMDD"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_050_mf31c_date_of_issue"}'>
                                                  <c:out value='${item.detail}' />
                                              </c:if>
                                          </c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF40E Applicable Rules -->
                        <div class="form-row">
                            <span class="label_body">MF40E</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a>Applicable Rules</span>
                            <select name="_060_mf40e_applicable_rules" 
                                    id="_060_mf40e_applicable_rules"
                                    class="mandatory">
                                <option value="">choose a type</option>
                                <option value="UCP LATEST VERSION"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_060_mf40e_applicable_rules' and item.detail eq 'UCP LATEST VERSION'}">selected</c:if>
                                    </c:forEach>>UCP LATEST VERSION</option>
                                <option value="UCPURR LATEST VERSION"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_060_mf40e_applicable_rules' and item.detail eq 'UCPURR LATEST VERSION'}">selected</c:if>
                                    </c:forEach>>UCPURR LATEST VERSION</option>
                                <option value="EUCP LATEST VERSION"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_060_mf40e_applicable_rules' and item.detail eq 'EUCP LATEST VERSION'}">selected</c:if>
                                    </c:forEach>>EUCP LATEST VERSION</option>
                                <option value="EUCPURR LATEST VERSION"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_060_mf40e_applicable_rules' and item.detail eq 'EUCPURR LATEST VERSION'}">selected</c:if>
                                    </c:forEach>>EUCPURR LATEST VERSION</option>
                                <option value="OTHR"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_060_mf40e_applicable_rules' and item.detail eq 'OTHR'}">selected</c:if>
                                    </c:forEach>>OTHR</option>
                            </select>
                        </div>
                        <div id="div_060_mf40e_narrative" style="display:none;">
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span>
                                <span class="label">Narrative (if OTHR)</span>
                                <textarea name="_061_mf40e_narrative" 
                                          id="_061_mf40e_narrative"
                                          rows="2" maxlength="35"><c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName eq '_061_mf40e_narrative'}">
                                        <c:out value="${item.detail}" />
                                    </c:if>
                                </c:forEach></textarea>
                            </div>
                        </div>
                        <hr/>

                        <!-- MF31D Date and Place of Expiry -->
                        <div class="form-row">
                            <span class="label_body">MF31D</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a>Date and Place of Expiry</span>
                            <input type="text" name="_070_mf31d_date_of_expiry"
                                   id="_070_mf31d_date_of_expiry"
                                   class="mandatory" maxlength="6"
                                   placeholder="YYMMDD"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_070_mf31d_date_of_expiry"}'>
                                                  <c:out value='${item.detail}' />
                                              </c:if>
                                          </c:forEach>" />
                            <input type="text" name="_071_mf31d_place_of_expiry"
                                   id="_071_mf31d_place_of_expiry"
                                   maxlength="29"
                                   placeholder="Place"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_071_mf31d_place_of_expiry"}'>
                                                  <c:out value='${item.detail}' />
                                              </c:if>
                                          </c:forEach>" />
                        </div>
                        <hr/>
                    
                        <!-- OF52a Issuing Bank of the Original Documentary Credit -->
                        <div class="form-row">
                            <span class="label_body">OF52a</span>
                            <span class="label">Issuing Bank of the Original Documentary Credit</span>
                            <select id="_080_of52a_issuing_bank_of_the_original_documentary_credit" name="_080_of52a_issuing_bank_of_the_original_documentary_credit">
                                <option value="">choose a type</option>
                                <option value="A"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_080_of52a_issuing_bank_of_the_original_documentary_credit' and item.detail eq 'A'}">selected</c:if>
                                    </c:forEach>>
                                    Option A (BIC)
                                </option>
                                <option value="D"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_080_of52a_issuing_bank_of_the_original_documentary_credit' and item.detail eq 'D'}">selected</c:if>
                                    </c:forEach>>
                                    Option D (Name &amp; Address)
                                </option>
                            </select>
                        </div>

                        <div class="form-row" id="wrap_081_of52a_identifier_code" style="display:none;">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_081_of52a_identifier_code" name="_081_of52a_identifier_code"
                                   maxlength="11"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_081_of52a_identifier_code"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_082_of52a_name_address" style="display:none;">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Name &amp; Address</span>
                            <textarea id="_082_of52a_name_address" name="_082_of52a_name_address"
                                      rows="3" maxlength="140"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_082_of52a_name_address'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF50B Non-Bank Issuer of the Original Documentary Credit -->
                        <div class="form-row">
                            <span class="label_body">OF50B</span>
                            <span class="label">Non-Bank Issuer of the Original Documentary Credit</span>
                            <textarea name="_090_of50b_non_bank_issuer_of_the_original_documentary_credit" id="_090_of50b_non_bank_issuer_of_the_original_documentary_credit"
                                      rows="3" maxlength="140"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_090_of50b_non_bank_issuer_of_the_original_documentary_credit'}">
                                    <c:out value="${item.detail}"/>
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/> 
                        
                        <!-- MF50 First Beneficiary --> 
                        <div class="form-row">
                            <span class="label_body">MF50</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a> First Beneficiary</span>
                        </div>
                        <div class="form-row">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Name & Address</span>
                            <textarea name="_100_mf50_name_address" id="_100_mf50_name_address" rows="4" 
                                      class="mandatory" maxlength="140"><c:forEach var="item" items="${tags}">
                                <c:if test='${item.tagName eq "_100_mf50_name_address"}'>
                                    <c:out value='${item.detail}'/>
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- MF59 Second Beneficiary -->
                        <div class="form-row">
                            <span class="label_body">MF59</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a> Second Beneficiary</span>
                        </div>
                        <div class="form-row">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Account</span>
                            <input type="text" name="_110_mf59_account" id="_110_mf59_account" maxlength="34"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_110_mf59_account"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <div class="form-row">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Name & Address</span>
                            <textarea name="_111_mf59_name_address" id="_111_mf59_name_address" rows="4" 
                                      class="mandatory" maxlength="140"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_111_mf59_name_address'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- MF32B Currency Code, Amount -->
                        <div class="form-row">
                            <span class="label_body">MF32B</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                            <input type="text" name="_120_mf32b_currency" id="_120_mf32b_currency"
                                   class="mandatory"
                                   onkeypress="return textonly(event)"
                                   maxlength="3"
                                   style="text-transform: uppercase;"
                                   oninput="this.value = this.value.toUpperCase();"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_120_mf32b_currency"}'>
                                                  <c:out value='${item.detail}' />
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row">
                            <span class="label_body">&nbsp;</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                            <input type="text" name="_121_mf32b_amount" id="_121_mf32b_amount"
                                   class="mandatory"
                                   onblur="cek_koma(this);"
                                   maxlength="15"
                                   onpaste="return false" ondrop="return false"
                                   style="text-transform: uppercase;"
                                   oninput="this.value = this.value.toUpperCase();"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_121_mf32b_amount"}'>
                                                  <c:out value='${item.detail}' />
                                              </c:if>
                                          </c:forEach>"
                                   onkeypress="return numbersonly(event, '_120_mf32b_currency');" />
                            <!-- Format nominal (optional visual helper) -->
                            <font style="margin-left: 50px"></font>
                            <script>
                                function formatUang(n, currency) {
                                    if (isNaN(n)) {
                                        return "";
                                    }
                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                }
                                var number2 = document.getElementById('_121_mf32b_amount').value;
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
                            <input type="text" name="_130_of39a_tolerance_plus"
                                   id="_130_of39a_tolerance_plus"
                                   maxlength="2"
                                   placeholder="Plus %"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_130_of39a_tolerance_plus"}'>
                                                  <c:out value='${item.detail}' />
                                              </c:if>
                                          </c:forEach>" />
                            <input type="text" name="_131_of39a_tolerance_minus"
                                   id="_131_of39a_tolerance_minus"
                                   maxlength="2"
                                   placeholder="Minus %"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_131_of39a_tolerance_minus"}'>
                                                  <c:out value='${item.detail}' />
                                              </c:if>
                                          </c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF39C Additional Amounts Covered -->
                        <div class="form-row">
                            <span class="label_body">OF39C</span>
                            <span class="label">Additional Amounts Covered</span>
                            <textarea name="_140_of39c_additional_amounts_covered"
                                      id="_140_of39c_additional_amounts_covered"
                                      rows="4" maxlength="140"><c:forEach var='item' items='${tags}'>
                                          <c:if test='${item.tagName eq "_140_of39c_additional_amounts_covered"}'>
                                              <c:out value='${item.detail}' />
                                          </c:if>
                                      </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- MF41A Available With ... By ... -->
                        <div class="form-row">
                            <span class="label_body">MF41A</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a>Available With ... By ...</span>
                            <select id="_150_mf41a_available_with_by" name="_150_mf41a_available_with_by">
                                <option value="">choose a type</option>
                                <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_150_mf41a_available_with_by' and item.detail eq 'A'}">selected</c:if></c:forEach>>Option A (BIC)</option>
                                <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_150_mf41a_available_with_by' and item.detail eq 'D'}">selected</c:if></c:forEach>>Option D (Name &amp; Address)</option>
                            </select>
                        </div>

                        <div class="form-row" id="wrap_151_mf41a_identifier_code" style="display:none;">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_151_mf41a_identifier_code" name="_151_mf41a_identifier_code"
                                   maxlength="11"
                                   value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_151_mf41a_identifier_code"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_152_mf41d_name_and_address" style="display:none;">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Name & Address</span>
                            <textarea id="_152_mf41d_name_and_address" name="_152_mf41d_name_and_address"
                                      rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_152_mf41d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>

                        <div class="form-row">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">By</span>
                            <select id="_153_mf41a_by" name="_153_mf41a_by">
                                <option value="">choose a type</option>
                                <option <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_153_mf41a_by' and item.detail eq 'BY ACCEPTANCE'}">selected</c:if></c:forEach>>BY ACCEPTANCE</option>
                                <option <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_153_mf41a_by' and item.detail eq 'BY DEF PAYMENT'}">selected</c:if></c:forEach>>BY DEF PAYMENT</option>
                                <option <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_153_mf41a_by' and item.detail eq 'BY MIXED PYMT'}">selected</c:if></c:forEach>>BY MIXED PYMT</option>
                                <option <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_153_mf41a_by' and item.detail eq 'BY NEGOTIATION'}">selected</c:if></c:forEach>>BY NEGOTIATION</option>
                                <option <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_153_mf41a_by' and item.detail eq 'BY PAYMENT'}">selected</c:if></c:forEach>>BY PAYMENT</option>
                            </select>
                        </div>
                        <hr/>

                        <!-- OF42C Drafts at ... -->
                        <div class="form-row">
                            <span class="label_body">OF42C</span>
                            <span class="label">Drafts at ...</span>
                            <textarea name="_160_of42c_drafts_at" id="_160_of42c_drafts_at"
                                      rows="3" maxlength="105"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_160_of42c_drafts_at"}'><c:out value='${item.detail}'/></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF42A Drawee -->
                        <div class="form-row">
                            <span class="label_body">OF42A</span>
                            <span class="label">Drawee</span>
                            <select id="_170_of42a_drawee" name="_170_of42a_drawee">
                                <option value="">choose a type</option>
                                <option value="A" <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName eq '_170_of42a_drawee' and item.detail eq 'A'}">selected</c:if>
                                </c:forEach>>Option A (BIC)</option>
                                <option value="D" <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName eq '_170_of42a_drawee' and item.detail eq 'D'}">selected</c:if>
                                </c:forEach>>Option D (Name &amp; Address)</option>
                            </select>
                        </div>

                        <div class="form-row" id="wrap_171_of42a_identifier_code" style="display:none;">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_171_of42a_identifier_code" name="_171_of42a_identifier_code"
                                   maxlength="11"
                                   value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_171_of42a_identifier_code"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_172_of42d_name_and_address" style="display:none;">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Name & Address</span>
                            <textarea id="_172_of42d_name_and_address" name="_172_of42d_name_and_address"
                                      rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_172_of42d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF42M Mixed Payment Details -->
                        <div class="form-row">
                            <span class="label_body">OF42M</span>
                            <span class="label">Mixed Payment Details</span>
                            <textarea name="_180_of42m_mixed_payment_details" id="_180_of42m_mixed_payment_details"
                                      rows="4" maxlength="140"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_180_of42m_mixed_payment_details"}'><c:out value='${item.detail}'/></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF42P Negotiation/Deferred Payment Details -->
                        <div class="form-row">
                            <span class="label_body">OF42P</span>
                            <span class="label">Negotiation/Deferred Payment Details</span>
                            <textarea name="_190_of42p_negotiation_deferred_payment_details" id="_190_of42p_negotiation_deferred_payment_details"
                                      rows="4" maxlength="140"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_190_of42p_negotiation_deferred_payment_details"}'><c:out value='${item.detail}'/></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF43P Partial Shipments -->
                        <div class="form-row">
                            <span class="label_body">OF43P</span>
                            <span class="label">Partial Shipments</span>
                            <select name="_200_of43p_partial_shipments" id="_200_of43p_partial_shipments">
                                <option value="">choose a type</option>
                                <option value="ALLOWED" <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName eq '_200_of43p_partial_shipments' and item.detail eq 'ALLOWED'}">selected</c:if>
                                </c:forEach>>ALLOWED</option>
                                <option value="CONDITIONAL" <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName eq '_200_of43p_partial_shipments' and item.detail eq 'CONDITIONAL'}">selected</c:if>
                                </c:forEach>>CONDITIONAL</option>
                                <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName eq '_200_of43p_partial_shipments' and item.detail eq 'NOT ALLOWED'}">selected</c:if>
                                </c:forEach>>NOT ALLOWED</option>
                            </select>
                        </div>
                        <hr/>

                        <!-- OF43T Transhipment -->
                        <div class="form-row">
                            <span class="label_body">OF43T</span>
                            <span class="label">Transhipment</span>
                            <select name="_210_of43t_transhipment" id="_210_of43t_transhipment">
                                <option value="">choose a type</option>
                                <option value="ALLOWED" <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName eq '_210_of43t_transhipment' and item.detail eq 'ALLOWED'}">selected</c:if>
                                </c:forEach>>ALLOWED</option>
                                <option value="CONDITIONAL" <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName eq '_210_of43t_transhipment' and item.detail eq 'CONDITIONAL'}">selected</c:if>
                                </c:forEach>>CONDITIONAL</option>
                                <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName eq '_210_of43t_transhipment' and item.detail eq 'NOT ALLOWED'}">selected</c:if>
                                </c:forEach>>NOT ALLOWED</option>
                            </select>
                        </div>
                        <hr/>

                        <!-- OF44A Place of Taking in Charge/Dispatch/Receipt -->
                        <div class="form-row">
                            <span class="label_body">OF44A</span>
                            <span class="label">Place of Taking in Charge / Dispatch from / Place of Receipt</span>
                            <textarea name="_220_of44a_place_of_taking_in_charge_dispatch_from_place_of_receipt"
                                      id="_220_of44a_place_of_taking_in_charge_dispatch_from_place_of_receipt"
                                      rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_220_of44a_place_of_taking_in_charge_dispatch_from_place_of_receipt"}'>
                                    <c:out value='${item.detail}' />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF44E Port of Loading / Airport of Departure -->
                        <div class="form-row">
                            <span class="label_body">OF44E</span>
                            <span class="label">Port of Loading / Airport of Departure</span>
                            <textarea name="_230_of44e_port_of_loading_airport_of_departure"
                                      id="_230_of44e_port_of_loading_airport_of_departure"
                                      rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_230_of44e_port_of_loading_airport_of_departure"}'>
                                    <c:out value='${item.detail}' />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF44F Port of Discharge / Airport of Destination -->
                        <div class="form-row">
                            <span class="label_body">OF44F</span>
                            <span class="label">Port of Discharge / Airport of Destination</span>
                            <textarea name="_240_of44f_port_of_discharge_airport_of_destination"
                                      id="_240_of44f_port_of_discharge_airport_of_destination"
                                      rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_240_of44f_port_of_discharge_airport_of_destination"}'>
                                    <c:out value='${item.detail}' />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF44B Place of Final Destination / Place of Delivery -->
                        <div class="form-row">
                            <span class="label_body">OF44B</span>
                            <span class="label">Place of Final Destination / Place of Delivery</span>
                            <textarea name="_250_of44b_place_of_final_destination_for_transportation_to_place_of_delivery"
                                      id="_250_of44b_place_of_final_destination_for_transportation_to_place_of_delivery"
                                      rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_250_of44b_place_of_final_destination_for_transportation_to_place_of_delivery"}'>
                                    <c:out value='${item.detail}' />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF44C Latest Date of Shipment -->
                        <div class="form-row">
                            <span class="label_body">OF44C</span>
                            <span class="label">Latest Date of Shipment</span>
                            <input type="text" name="_260_of44c_latest_date_of_shipment"
                                   id="_260_of44c_latest_date_of_shipment"
                                   maxlength="6"
                                   placeholder="YYMMDD"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_260_of44c_latest_date_of_shipment"}'>
                                                  <c:out value='${item.detail}' />
                                              </c:if>
                                          </c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF44D Shipment Period -->
                        <div class="form-row">
                            <span class="label_body">OF44D</span>
                            <span class="label">Shipment Period</span>
                            <textarea name="_270_of44d_shipment_period"
                                      id="_270_of44d_shipment_period"
                                      rows="3" maxlength="390"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_270_of44d_shipment_period"}'>
                                    <c:out value='${item.detail}' />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF45A Description of Goods and/or Services -->
                        <div class="form-row">
                            <span class="label_body">OF45A</span>
                            <span class="label">Description of Goods and/or Services</span>
                            <textarea name="_280_of45a_description_of_goods_and_or_services" id="_280_of45a_description_of_goods_and_or_services"
                                      rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_280_of45a_description_of_goods_and_or_services'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF46A Documents Required -->
                        <div class="form-row">
                            <span class="label_body">OF46A</span>
                            <span class="label">Documents Required</span>
                            <textarea name="_290_of46a_documents_required" id="_290_of46a_documents_required"
                                      rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_290_of46a_documents_required'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF47A Additional Conditions -->
                        <div class="form-row">
                            <span class="label_body">OF47A</span>
                            <span class="label">Additional Conditions</span>
                            <textarea name="_300_of47a_additional_conditions" id="_300_of47a_additional_conditions"
                                      rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_300_of47a_additional_conditions'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF49G Special Payment Conditions for Beneficiary -->
                        <div class="form-row">
                            <span class="label_body">OF49G</span>
                            <span class="label">Special Payment Conditions for Beneficiary</span>
                            <textarea name="_310_of49g_special_payment_conditions_for_beneficiary" id="_310_of49g_special_payment_conditions_for_beneficiary"
                                      rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_310_of49g_special_payment_conditions_for_beneficiary'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF49H Special Payment Conditions for Bank Only -->
                        <div class="form-row">
                            <span class="label_body">OF49H</span>
                            <span class="label">Special Payment Conditions for Bank Only</span>
                            <textarea name="_320_of49h_special_payment_conditions_for_bank_only" id="_320_of49h_special_payment_conditions_for_bank_only"
                                      rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_320_of49h_special_payment_conditions_for_bank_only'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF71D Charges -->
                        <div class="form-row">
                            <span class="label_body">OF71D</span>
                            <span class="label">Charges</span>
                            <textarea name="_330_of71d_charges"
                                      id="_330_of71d_charges"
                                      rows="6" maxlength="210"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_330_of71d_charges"}'>
                                    <c:out value='${item.detail}' />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF48 Period for Presentation in Days -->
                        <div class="form-row">
                            <span class="label_body">OF48</span>
                            <span class="label">Period for Presentation in Days</span>
                            <input type="text" name="_340_of48_days"
                                   id="_340_of48_days"
                                   maxlength="3"
                                   placeholder="Days"
                                   value="<c:forEach var='item' items='${tags}'>
                                             <c:if test='${item.tagName eq "_340_of48_days"}'>
                                                 <c:out value='${item.detail}' />
                                             </c:if>
                                          </c:forEach>" />
                            <input type="text" name="_341_of48_narrative"
                                   id="_341_of48_narrative"
                                   maxlength="35"
                                   placeholder="Narrative (optional)"
                                   value="<c:forEach var='item' items='${tags}'>
                                             <c:if test='${item.tagName eq "_341_of48_narrative"}'>
                                                 <c:out value='${item.detail}' />
                                             </c:if>
                                          </c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF49 Confirmation Instructions -->
                        <div class="form-row">
                            <span class="label_body">MF49</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a>Confirmation Instructions</span>
                            <select id="_350_mf49_confirmation_instructions" name="_350_mf49_confirmation_instructions" class="mandatory">
                                <option value="">choose a type</option>
                                <option value="CONFIRM"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_350_mf49_confirmation_instructions' and item.detail eq 'CONFIRM'}">selected</c:if>
                                    </c:forEach>>CONFIRM</option>
                                <option value="MAY ADD"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_350_mf49_confirmation_instructions' and item.detail eq 'MAY ADD'}">selected</c:if>
                                    </c:forEach>>MAY ADD</option>
                                <option value="WITHOUT"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_350_mf49_confirmation_instructions' and item.detail eq 'WITHOUT'}">selected</c:if>
                                    </c:forEach>>WITHOUT</option>
                            </select>
                        </div>
                        <hr/>

                        <!-- OF58a Requested Confirmation Party -->
                        <div class="form-row">
                            <span class="label_body">OF58a</span>
                            <span class="label">Requested Confirmation Party</span>
                            <div class="mt-row">
                                <div class="mt-col">
                                    <select id="_360_of58a_requested_confirmation_party" name="_360_of58a_requested_confirmation_party">
                                        <option value="">choose a type</option>
                                        <option value="A"
                                            <c:forEach var="item" items="${tags}">
                                                <c:if test="${item.tagName eq '_360_of58a_requested_confirmation_party' and item.detail eq 'A'}">selected</c:if>
                                            </c:forEach>>Option A (BIC)</option>
                                        <option value="D"
                                            <c:forEach var="item" items="${tags}">
                                                <c:if test="${item.tagName eq '_360_of58a_requested_confirmation_party' and item.detail eq 'D'}">selected</c:if>
                                            </c:forEach>>Option D (Name &amp; Address)</option>
                                    </select>
                                </div>
                                <div class="mt-col" id="wrap_361_of58a_bic" style="display:none;">
                                    <input type="text" name="_361_of58a_bic" id="_361_of58a_bic"
                                           maxlength="11" placeholder="BIC"
                                           value="<c:forEach var='item' items='${tags}'>
                                                      <c:if test='${item.tagName eq "_361_of58a_bic"}'>
                                                          <c:out value='${item.detail}' />
                                                      </c:if>
                                                  </c:forEach>" />
                                </div>
                                <div class="mt-col" id="wrap_362_of58a_name_address" style="display:none;">
                                    <textarea name="_362_of58a_name_address" id="_362_of58a_name_address"
                                              rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                                        <c:if test='${item.tagName eq "_362_of58a_name_address"}'>
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
                            <textarea name="_370_of78_instructions_to_the_paying_accepting_negotiating_bank"
                                      id="_370_of78_instructions_to_the_paying_accepting_negotiating_bank"
                                      rows="6" maxlength="780"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_370_of78_instructions_to_the_paying_accepting_negotiating_bank"}'>
                                    <c:out value='${item.detail}' />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>
                        
                        <!-- OF78D Instructions from Intermediary Bank -->
                        <div class="form-row">
                            <span class="label_body">OF78D</span>
                            <span class="label">Instructions from Intermediary Bank</span>
                            <textarea name="_380_of78d_instructions_from_transferring_bank"
                                      id="_380_of78d_instructions_from_transferring_bank"
                                      rows="6" maxlength="780"><c:forEach var="item" items="${tags}">
                                <c:if test='${item.tagName eq "_380_of78d_instructions_from_transferring_bank"}'>
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
                                    <select id="_390_of57a_advise_through_bank" name="_390_of57a_advise_through_bank">
                                        <option value="">choose a type</option>
                                        <option value="A"
                                            <c:forEach var="item" items="${tags}">
                                                <c:if test="${item.tagName eq '_390_of57a_advise_through_bank' and item.detail eq 'A'}">selected</c:if>
                                            </c:forEach>>Option A (BIC)</option>
                                        <option value="B"
                                            <c:forEach var="item" items="${tags}">
                                                <c:if test="${item.tagName eq '_390_of57a_advise_through_bank' and item.detail eq 'B'}">selected</c:if>
                                            </c:forEach>>Option B (Location)</option>
                                        <option value="D"
                                            <c:forEach var="item" items="${tags}">
                                                <c:if test="${item.tagName eq '_390_of57a_advise_through_bank' and item.detail eq 'D'}">selected</c:if>
                                            </c:forEach>>Option D (Name &amp; Address)</option>
                                    </select>
                                </div>
                                <div class="mt-col" id="wrap_391_of57a_bic" style="display:none;">
                                    <input type="text" name="_391_of57a_bic" id="_391_of57a_bic"
                                           maxlength="11" placeholder="BIC"
                                           value="<c:forEach var='item' items='${tags}'>
                                                      <c:if test='${item.tagName eq "_391_of57a_bic"}'>
                                                          <c:out value='${item.detail}' />
                                                      </c:if>
                                                  </c:forEach>" />
                                </div>
                                <div class="mt-col" id="wrap_392_of57a_location" style="display:none;">
                                    <input type="text" name="_392_of57a_location" id="_392_of57a_location"
                                           maxlength="35" placeholder="Location"
                                           value="<c:forEach var='item' items='${tags}'>
                                                      <c:if test='${item.tagName eq "_392_of57a_location"}'>
                                                          <c:out value='${item.detail}' />
                                                      </c:if>
                                                  </c:forEach>" />
                                </div>
                                <div class="mt-col" id="wrap_393_of57a_name_address" style="display:none;">
                                    <textarea name="_393_of57a_name_address" id="_393_of57a_name_address"
                                              rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                                        <c:if test='${item.tagName eq "_393_of57a_name_address"}'>
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
                            <textarea name="_400_of72z_sender_to_receiver_information"
                                      id="_400_of72z_sender_to_receiver_information"
                                      rows="6" maxlength="210"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_400_of72z_sender_to_receiver_information"}'>
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
<%@ include file="rule/validate_rule_mt720.jsp" %>
</body>
</html>