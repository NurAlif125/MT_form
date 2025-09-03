<%-- 
    Document   : mt707
    Created on : Sep 3, 2025, 11:32:34 AM
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

                    <!-- MF20 Sender's Reference -->
                    
                    <!-- MF21 Receiver's Reference -->
                    
                    <!-- MF23 Issuing Bank's Reference -->
                    
                    <!-- OF52a Issuing Bank -->
                    
                    <!-- OF50B Non-Bank Issuer -->

                    <!-- MF31C Date of Issue -->
                    <div class="form-row">
                        <span class="label_body">MF31C</span>
                        <span class="label"><a>*</a>Date of Issue</span>
                        <input type="text" name="_070_mf31c_date_of_issue" 
                               id="_070_mf31c_date_of_issue"
                               class="mandatory" maxlength="6"/>
                    </div>
                    <hr/>
                    
                    <!-- MF26E Number of Amendment -->
                    
                    <!-- MF30 Date of Amendment -->
                    
                    <!-- MF22A Purpose of Message -->
                    
                    <!-- OF23S Cancellation Request -->
                    
                    <!-- MF40A Form of Documentary Credit -->
                    <div class="form-row">
                        <span class="label_body">MF40A</span>
                        <span class="label"><a>*</a>Form of Documentary Credit</span>
                        <select name="_120_mf40a_form_of_credit" 
                                id="_120_mf40a_form_of_credit" 
                                class="mandatory">
                            <option value="">Choose...</option>
                            <option value="IRREVOCABLE">IRREVOCABLE</option>
                            <option value="IRREVOCABLE TRANSFERABLE">IRREVOCABLE TRANSFERABLE</option>
                        </select>
                    </div>
                    <hr/>
                    
                    <!-- MF40E Applicable Rules -->
                    <div class="form-row">
                        <span class="label_body">MF40E</span>
                        <span class="label"><a>*</a>Applicable Rules</span>
                        <select name="_130_mf40e_applicable_rules" 
                                id="_130_mf40e_applicable_rules"
                                class="mandatory">
                            <option value="">Choose...</option>
                            <option value="UCP LATEST VERSION">UCP LATEST VERSION</option>
                            <option value="UCPURR LATEST VERSION">UCPURR LATEST VERSION</option>
                            <option value="EUCP LATEST VERSION">EUCP LATEST VERSION</option>
                            <option value="EUCPURR LATEST VERSION">EUCPURR LATEST VERSION</option>
                            <option value="OTHR">OTHR</option>
                        </select>
                    </div>
                    <div id="div_130_mf40e_narrative" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Narrative (if OTHR)</span>
                            <textarea name="_131_mf40e_narrative" 
                                      id="_131_mf40e_narrative"
                                      rows="2" maxlength="35"></textarea>
                        </div>
                    </div>
                    <hr/>
                    
                    <!-- MF31D Date and Place of Expiry -->
                    <div class="form-row">
                        <span class="label_body">MF31D</span>
                        <span class="label"><a>*</a>Date and Place of Expiry</span>
                        <input type="text" name="_140_mf31d_date_of_expiry"
                               id="_140_mf31d_date_of_expiry"
                               class="mandatory" maxlength="6"
                               placeholder="YYMMDD"/>
                        <input type="text" name="_141_mf31d_place_of_expiry"
                               id="_141_mf31d_place_of_expiry"
                               maxlength="29"
                               placeholder="Place"/>
                    </div>
                    <hr/>
                    
                    <!-- OF50 Changed Applicant Details -->
                    
                    <!-- MF59 Beneficiary -->
                    <div class="form-row">
                        <span class="label_body">MF59</span>
                        <span class="label"><a>*</a>Beneficiary</span>
                    </div>
                    <div class="form-row">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Account</span>
                        <input type="text" name="_160_mf59_account"
                               id="_160_mf59_account"
                               maxlength="34"
                               value="<c:forEach var='item' items='${tags}'>
                                          <c:if test='${item.tagName eq "_160_mf59_account"}'>
                                              <c:out value='${item.detail}' />
                                          </c:if>
                                      </c:forEach>" />
                    </div>
                    <div class="form-row">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Name & Address</span>
                        <textarea name="_161_mf59_name_address"
                                  id="_161_mf59_name_address"
                                  class="mandatory"
                                  rows="4" maxlength="140"><c:forEach var='item' items='${tags}'>
                                      <c:if test='${item.tagName eq "_161_mf59_name_address"}'>
                                          <c:out value='${item.detail}' />
                                      </c:if>
                                  </c:forEach></textarea>
                    </div>
                    <hr/>
                    
                    <!-- OF32B Increase of Documentary Credit Amount -->
                    
                    <!-- OF33B Decrease of Documentary Credit Amount -->

                    <!-- OF39A Percentage Credit Amount Tolerance -->
                    <div class="form-row">
                        <span class="label_body">OF39A</span>
                        <span class="label">Percentage Credit Amount Tolerance</span>
                        <input type="text" name="_190_of39a_tolerance_plus"
                               id="_190_of39a_tolerance_plus"
                               maxlength="2"
                               placeholder="Plus %"
                               value="<c:forEach var='item' items='${tags}'>
                                          <c:if test='${item.tagName eq "_190_of39a_tolerance_plus"}'>
                                              <c:out value='${item.detail}' />
                                          </c:if>
                                      </c:forEach>" />
                        <input type="text" name="_191_of39a_tolerance_minus"
                               id="_191_of39a_tolerance_minus"
                               maxlength="2"
                               placeholder="Minus %"
                               value="<c:forEach var='item' items='${tags}'>
                                          <c:if test='${item.tagName eq "_191_of39a_tolerance_minus"}'>
                                              <c:out value='${item.detail}' />
                                          </c:if>
                                      </c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF39C Additional Amounts Covered -->
                    <div class="form-row">
                        <span class="label_body">OF39C</span>
                        <span class="label">Additional Amounts Covered</span>
                        <textarea name="_200_of39c_additional_amounts"
                                  id="_200_of39c_additional_amounts"
                                  rows="4" maxlength="140"><c:forEach var='item' items='${tags}'>
                                      <c:if test='${item.tagName eq "_200_of39c_additional_amounts"}'>
                                          <c:out value='${item.detail}' />
                                      </c:if>
                                  </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- MF41A Available With ... By ... -->
                    <div class="form-row">
                        <span class="label_body">MF41A</span>
                        <span class="label"><a>*</a>Available With ... By ...</span>
                        <select id="_210_mf41a_option" name="_210_mf41a_option">
                            <option value="">-- option --</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_210_mf41a_option' and item.detail eq 'A'}">selected</c:if></c:forEach>>Option A (BIC)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_210_mf41a_option' and item.detail eq 'D'}">selected</c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>

                    <div class="form-row" id="wrap_211_mf41a_identifier_code" style="display:none;">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Identifier Code (BIC)</span>
                        <input type="text" id="_211_mf41a_identifier_code" name="_211_mf41a_identifier_code"
                               maxlength="11"
                               value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_211_mf41a_identifier_code"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                    </div>

                    <div class="form-row" id="wrap_212_mf41d_name_and_address" style="display:none;">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Name & Address</span>
                        <textarea id="_212_mf41d_name_and_address" name="_212_mf41d_name_and_address"
                                  rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_212_mf41d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>

                    <div class="form-row">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">By</span>
                        <select id="_213_mf41a_by" name="_213_mf41a_by">
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
                        <textarea name="_220_of42c_drafts" id="_220_of42c_drafts"
                                  rows="3" maxlength="105"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_220_of42c_drafts"}'><c:out value='${item.detail}'/></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF42A Drawee -->
                    <div class="form-row">
                        <span class="label_body">OF42A</span>
                        <span class="label">Drawee</span>
                        <select id="_230_of42a_option" name="_230_of42a_option">
                            <option value="">-- option --</option>
                            <option value="A">Option A (BIC)</option>
                            <option value="D">Option D (Name &amp; Address)</option>
                        </select>
                    </div>

                    <div class="form-row" id="wrap_231_of42a_identifier_code" style="display:none;">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Identifier Code (BIC)</span>
                        <input type="text" id="_231_of42a_identifier_code" name="_231_of42a_identifier_code"
                               maxlength="11"
                               value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_231_of42a_identifier_code"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                    </div>

                    <div class="form-row" id="wrap_232_of42d_name_and_address" style="display:none;">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Name & Address</span>
                        <textarea id="_232_of42d_name_and_address" name="_232_of42d_name_and_address"
                                  rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_232_of42d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF42M Mixed Payment Details -->
                    <div class="form-row">
                        <span class="label_body">OF42M</span>
                        <span class="label">Mixed Payment Details</span>
                        <textarea name="_240_of42m_mixed_payment" id="_240_of42m_mixed_payment"
                                  rows="4" maxlength="140"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_240_of42m_mixed_payment"}'><c:out value='${item.detail}'/></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF42P Negotiation/Deferred Payment Details -->
                    <div class="form-row">
                        <span class="label_body">OF42P</span>
                        <span class="label">Negotiation/Deferred Payment Details</span>
                        <textarea name="_250_of42p_negotiation" id="_250_of42p_negotiation"
                                  rows="4" maxlength="140"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_250_of42p_negotiation"}'><c:out value='${item.detail}'/></c:if></c:forEach></textarea>
                    </div>
                    <hr/>
                    
                    <!-- OF43P Partial Shipments -->
                    <div class="form-row">
                        <span class="label_body">OF43P</span>
                        <span class="label">Partial Shipments</span>
                        <select name="_260_of43p_partial_shipments" id="_260_of43p_partial_shipments">
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
                        <select name="_270_of43t_transhipment" id="_270_of43t_transhipment">
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
                        <textarea name="_280_of44a_place_dispatch"
                                  id="_280_of44a_place_dispatch"
                                  rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_280_of44a_place_dispatch"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44E Port of Loading / Airport of Departure -->
                    <div class="form-row">
                        <span class="label_body">OF44E</span>
                        <span class="label">Port of Loading / Airport of Departure</span>
                        <textarea name="_290_of44e_port_loading"
                                  id="_290_of44e_port_loading"
                                  rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_290_of44e_port_loading"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44F Port of Discharge / Airport of Destination -->
                    <div class="form-row">
                        <span class="label_body">OF44F</span>
                        <span class="label">Port of Discharge / Airport of Destination</span>
                        <textarea name="_300_of44f_port_discharge"
                                  id="_300_of44f_port_discharge"
                                  rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_300_of44f_port_discharge"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44B Place of Final Destination / Place of Delivery -->
                    <div class="form-row">
                        <span class="label_body">OF44B</span>
                        <span class="label">Place of Final Destination / Place of Delivery</span>
                        <textarea name="_310_of44b_place_destination"
                                  id="_310_of44b_place_destination"
                                  rows="3" maxlength="140"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_310_of44b_place_destination"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44C Latest Date of Shipment -->
                    <div class="form-row">
                        <span class="label_body">OF44C</span>
                        <span class="label">Latest Date of Shipment</span>
                        <input type="text" name="_320_of44c_latest_date"
                               id="_320_of44c_latest_date"
                               maxlength="6"
                               placeholder="YYMMDD"
                               value="<c:forEach var='item' items='${tags}'>
                                          <c:if test='${item.tagName eq "_320_of44c_latest_date"}'>
                                              <c:out value='${item.detail}' />
                                          </c:if>
                                      </c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF44D Shipment Period -->
                    <div class="form-row">
                        <span class="label_body">OF44D</span>
                        <span class="label">Shipment Period</span>
                        <textarea name="_330_of44d_shipment_period"
                                  id="_330_of44d_shipment_period"
                                  rows="3" maxlength="390"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_330_of44d_shipment_period"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>
                    
                    <!-- OF45A Description of Goods and/or Services -->
                    <div class="form-row">
                        <span class="label_body">OF45A</span>
                        <span class="label">Description of Goods and/or Services</span>
                        <textarea name="_340_of45a_description" id="_340_of45a_description"
                                  rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                            <c:if test="${item.tagName eq '_340_of45a_description'}">
                                <c:out value="${item.detail}" />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF46A Documents Required -->
                    <div class="form-row">
                        <span class="label_body">OF46A</span>
                        <span class="label">Documents Required</span>
                        <textarea name="_350_of46a_documents" id="_350_of46a_documents"
                                  rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                            <c:if test="${item.tagName eq '_350_of46a_documents'}">
                                <c:out value="${item.detail}" />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF47A Additional Conditions -->
                    <div class="form-row">
                        <span class="label_body">OF47A</span>
                        <span class="label">Additional Conditions</span>
                        <textarea name="_360_of47a_additional_conditions" id="_360_of47a_additional_conditions"
                                  rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                            <c:if test="${item.tagName eq '_360_of47a_additional_conditions'}">
                                <c:out value="${item.detail}" />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF49G Special Payment Conditions for Beneficiary -->
                    <div class="form-row">
                        <span class="label_body">OF49G</span>
                        <span class="label">Special Payment Conditions for Beneficiary</span>
                        <textarea name="_370_of49g_special_payment_beneficiary" id="_370_of49g_special_payment_beneficiary"
                                  rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                            <c:if test="${item.tagName eq '_370_of49g_special_payment_beneficiary'}">
                                <c:out value="${item.detail}" />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF49H Special Payment Conditions for Bank Only -->
                    <div class="form-row">
                        <span class="label_body">OF49H</span>
                        <span class="label">Special Payment Conditions for Bank Only</span>
                        <textarea name="_380_of49h_special_payment_bank" id="_380_of49h_special_payment_bank"
                                  rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                            <c:if test="${item.tagName eq '_380_of49h_special_payment_bank'}">
                                <c:out value="${item.detail}" />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- MF71D Charges -->
                    <div class="form-row">
                        <span class="label_body">OF71D</span>
                        <span class="label">Charges</span>
                        <textarea name="_390_of71d_charges"
                                  id="_390_of71d_charges"
                                  rows="6" maxlength="210"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_390_of71d_charges"}'>
                                <c:out value='${item.detail}' />
                            </c:if>
                        </c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF71N Amendment Charge Payable By -->
                    
                    
                    <!-- OF48 Period for Presentation in Days -->
                    <div class="form-row">
                        <span class="label_body">OF48</span>
                        <span class="label">Period for Presentation in Days</span>
                        <input type="text" name="_410_of48_days"
                               id="_410_of48_days"
                               maxlength="3"
                               placeholder="Days"
                               value="<c:forEach var='item' items='${tags}'>
                                         <c:if test='${item.tagName eq "_410_of48_days"}'>
                                             <c:out value='${item.detail}' />
                                         </c:if>
                                      </c:forEach>" />
                        <input type="text" name="_411_of48_narrative"
                               id="_411_of48_narrative"
                               maxlength="35"
                               placeholder="Narrative (optional)"
                               value="<c:forEach var='item' items='${tags}'>
                                         <c:if test='${item.tagName eq "_411_of48_narrative"}'>
                                             <c:out value='${item.detail}' />
                                         </c:if>
                                      </c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF49 Confirmation Instructions -->
                    <div class="form-row">
                        <span class="label_body">MF49</span>
                        <span class="label"><a>*</a>Confirmation Instructions</span>
                        <select id="_420_mf49_confirmation" name="_420_mf49_confirmation" class="mandatory">
                            <option value="">-- select --</option>
                            <option value="CONFIRM"
                                    <c:if test="${_420_mf49_confirmation eq 'CONFIRM'}">selected</c:if>>
                                    CONFIRM
                                </option>
                                <option value="MAY ADD"
                                    <c:if test="${_420_mf49_confirmation eq 'MAY ADD'}">selected</c:if>>
                                    MAY ADD
                                </option>
                                <option value="WITHOUT"
                                    <c:if test="${_420_mf49_confirmation eq 'WITHOUT'}">selected</c:if>>
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
                                <select id="_430_of58a_option" name="_430_of58a_option">
                                    <option value="">-- option --</option>
                                    <option value="A"
                                        <c:if test="${_430_of58a_option eq 'A'}">selected</c:if>>
                                        Option A (BIC)
                                    </option>
                                    <option value="D"
                                        <c:if test="${_430_of58a_option eq 'D'}">selected</c:if>>
                                        Option D (Name &amp; Address)
                                    </option>
                                </select>
                            </div>
                            <div class="mt-col" id="wrap_431_of58a_bic" style="display:none;">
                                <input type="text" name="_431_of58a_bic" id="_431_of58a_bic"
                                       maxlength="11" placeholder="BIC"
                                       value="<c:forEach var='item' items='${tags}'>
                                                  <c:if test='${item.tagName eq "_431_of58a_bic"}'>
                                                      <c:out value='${item.detail}' />
                                                  </c:if>
                                              </c:forEach>" />
                            </div>
                            <div class="mt-col" id="wrap_432_of58a_name_address" style="display:none;">
                                <textarea name="_432_of58a_name_address" id="_432_of58a_name_address"
                                          rows="3" maxlength="140" placeholder="4*35x"><c:forEach var='item' items='${tags}'>
                                    <c:if test='${item.tagName eq "_432_of58a_name_address"}'>
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
                                <select id="_440_of53a_option" name="_440_of53a_option">
                                    <option value="">-- option --</option>
                                    <option value="A"
                                        <c:if test="${_440_of53a_option eq 'A'}">selected</c:if>>
                                        Option A (BIC)
                                    </option>
                                    <option value="D"
                                        <c:if test="${_440_of53a_option eq 'D'}">selected</c:if>>
                                        Option D (Name &amp; Address)
                                    </option>
                                </select>
                            </div>
                            <div class="mt-col" id="wrap_441_of53a_bic" style="display:none;">
                                <input type="text" name="_441_of53a_bic" id="_441_of53a_bic"
                                       maxlength="11" placeholder="BIC"
                                       value="<c:forEach var='item' items='${tags}'>
                                                  <c:if test='${item.tagName eq "_441_of53a_bic"}'>
                                                      <c:out value='${item.detail}' />
                                                  </c:if>
                                              </c:forEach>" />
                            </div>
                            <div class="mt-col" id="wrap_442_of53a_name_address" style="display:none;">
                                <textarea name="_442_of53a_name_address" id="_442_of53a_name_address"
                                          rows="3" maxlength="140" placeholder="4*35x"><c:forEach var='item' items='${tags}'>
                                    <c:if test='${item.tagName eq "_442_of53a_name_address"}'>
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
                        <textarea name="_450_of78_instructions"
                                  id="_450_of78_instructions"
                                  rows="6" maxlength="780"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_450_of78_instructions"}'>
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
                                <select id="_460_of57a_option" name="_460_of57a_option">
                                    <option value="">-- option --</option>
                                    <option value="A"
                                        <c:if test="${_460_of57a_option eq 'A'}">selected</c:if>>
                                        Option A (BIC)
                                    </option>
                                    <option value="B"
                                        <c:if test="${_460_of57a_option eq 'B'}">selected</c:if>>
                                        Option B (Location)
                                    </option>
                                    <option value="D"
                                        <c:if test="${_460_of57a_option eq 'D'}">selected</c:if>>
                                        Option D (Name &amp; Address)
                                    </option>
                                </select>
                            </div>
                            <div class="mt-col" id="wrap_461_of57a_bic" style="display:none;">
                                <input type="text" name="_461_of57a_bic" id="_461_of57a_bic"
                                       maxlength="11" placeholder="BIC"
                                       value="<c:forEach var='item' items='${tags}'>
                                                  <c:if test='${item.tagName eq "_461_of57a_bic"}'>
                                                      <c:out value='${item.detail}' />
                                                  </c:if>
                                              </c:forEach>" />
                            </div>
                            <div class="mt-col" id="wrap_462_of57a_location" style="display:none;">
                                <input type="text" name="_462_of57a_location" id="_462_of57a_location"
                                       maxlength="35" placeholder="Location"
                                       value="<c:forEach var='item' items='${tags}'>
                                                  <c:if test='${item.tagName eq "_462_of57a_location"}'>
                                                      <c:out value='${item.detail}' />
                                                  </c:if>
                                              </c:forEach>" />
                            </div>
                            <div class="mt-col" id="wrap_463_of57a_name_address" style="display:none;">
                                <textarea name="_463_of57a_name_address" id="_463_of57a_name_address"
                                          rows="3" maxlength="140" placeholder="4*35x"><c:forEach var='item' items='${tags}'>
                                    <c:if test='${item.tagName eq "_463_of57a_name_address"}'>
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
                        <textarea name="_470_of72z_information"
                                  id="_470_of72z_information"
                                  rows="6" maxlength="210"><c:forEach var='item' items='${tags}'>
                            <c:if test='${item.tagName eq "_470_of72z_information"}'>
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
