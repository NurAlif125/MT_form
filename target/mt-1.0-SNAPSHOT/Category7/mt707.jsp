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
    <title>MT707 Amendment to a Documentary Credit</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt707.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt707.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT 707 Amendment to a Documentary Credit</h2></div>
    <form id="form_mt707" method="post" 
          action="${pageContext.request.contextPath}/MT707Servlet"
          autocomplete="off"
          onsubmit="return validateMT707() && confirm('Do you want to save this MT707 data?');">

        <input type="hidden" name="messageType" value="707"/>

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
                    <div class="form-row"><span class="label_body">MF27</span><span class="label"><a style="color:red;text-decoration:none">*</a>Number</span>                                
                        <input type="text" onkeypress="avoidSplChars(event)" name="_010_mf27_number" id="_010_mf27_number" class="mandatory" maxlength="1" size="1" input_type="MF27 Sequence of Total" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Total</span>
                        <input type="text" onkeypress="avoidSplChars(event)" name="_011_mf27_total" id="_011_mf27_total" class="mandatory" maxlength="1" size="1" input_type="MF27 Sequence of Total" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF20 Sender's Reference -->
                    <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Sender's Reference</span>
                        <input type="text" name="_020_mf20_sender_reference" id="_020_mf20_sender_reference" class="mandatory" input_type="MF20 Sender's Reference" location="Body" maxlength="16" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf20_sender_reference'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF21 Receiver's Reference -->
                    <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Receiver's Reference</span>
                        <input type="text" name="_030_mf21_receiver_reference" id="_030_mf21_receiver_reference" class="mandatory" input_type="MF21 Receiver's Reference" location="Body" maxlength="16" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf21_receiver_reference'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF23 Issuing Bank's Reference -->
                    <div class="form-row"><span class="label_body">MF23</span><span class="label"><a style="color:red;text-decoration:none">*</a>Issuing Bank's Reference</span>
                        <input type="text" name="_040_mf23_issuing_bank_reference" id="_040_mf23_issuing_bank_reference" class="mandatory" input_type="MF23 Issuing Bank's Reference" location="Body" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf23_issuing_bank_reference'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF52a Issuing Bank -->
                    <div class="form-row"><span class="label_body">OF52a</span><span class="label">Issuing Bank</span>
                        <select id="_050_of52a_issuing_bank" name="_050_of52a_issuing_bank">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of52a_issuing_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of52a_issuing_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>

                    <div id="div_050_of52a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_051_of52a_party_identifier" name="_051_of52a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of52a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_052_of52a_identifier_code" name="_052_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of52a_identifier_code'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                        </div>
                    </div>

                    <div id="div_050_of52a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_053_of52a_party_identifier" name="_053_of52a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of52a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_054_of52a_name_address" name="_054_of52a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of52a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF50B Non-Bank Issuer -->
                    <div class="form-row"><span class="label_body">OF50B</span><span class="label">Non-Bank Issuer</span>
                        <textarea name="_060_of50b_non_bank_issuer" id="_060_of50b_non_bank_issuer" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of50b_non_bank_issuer'}"><c:out value="${item.detail}"/></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- MF31C Date of Issue -->
                    <div class="form-row"><span class="label_body">MF31C</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Issue</span>
                        <input type="text" name="_070_mf31c_date_of_issue" id="_070_mf31c_date_of_issue" class="mandatory" input_type="MF31C Date of Issue" location="Body" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf31c_date_of_issue'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF26E Number of Amendment -->
                    <div class="form-row"><span class="label_body">MF26E</span><span class="label"><a style="color:red;text-decoration:none">*</a>Number of Amendment</span>
                        <input type="text" name="_080_mf26e_number_of_amendment" id="_080_mf26e_number_of_amendment" class="mandatory" input_type="MF26E Number of Amendment" location="Body" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf26e_number_of_amendment'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF30 Date of Amendment -->
                    <div class="form-row"><span class="label_body">MF30</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Amendment</span>
                        <input type="text" name="_090_mf30_date_of_amendment" id="_090_mf30_date_of_amendment" class="mandatory" input_type="MF30 Date of Amendment" location="Body" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf30_date_of_amendment'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF22A Purpose of Message -->
                    <div class="form-row"><span class="label_body">MF22A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Purpose of Message</span>
                        <select name="_100_mf22a_purpose_of_message" id="_100_mf22a_purpose_of_message" class="mandatory" input_type="MF22A Purpose of Message" location="Body">
                            <option value="">choose a type</option>
                            <option value="ACNF" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ACNF'}"> selected="true" </c:if></c:if></c:forEach>>ACNF - Advice &amp; Confirmation</option>
                            <option value="ADVI" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ADVI'}"> selected="true" </c:if></c:if></c:forEach>>ADVI - Advice</option>
                            <option value="ISSU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ISSU'}"> selected="true" </c:if></c:if></c:forEach>>ISSU - Issuance</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF23S Cancellation Request -->
                    <div class="form-row"><span class="label_body">OF23S</span><span class="label">Cancellation Request</span>
                        <select name="_110_of23s_cancellation_request" id="_110_of23s_cancellation_request">
                            <option value="">choose a type</option>
                            <option value="CANCEL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of23s_cancellation_request'}"><c:if test="${item.detail=='CANCEL'}"> selected="true" </c:if></c:if></c:forEach>>CANCEL - Request to cancel the instrument</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF40A Form of Documentary Credit -->
                    <div class="form-row"><span class="label_body">OF40A</span><span class="label">Form of Documentary Credit</span>
                        <select name="_120_of40a_form_of_documentary_credit" id="_120_of40a_form_of_documentary_credit">
                            <option value="">choose a type</option>
                            <option value="IRREVOCABLE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of40a_form_of_documentary_credit'}"><c:if test="${item.detail=='IRREVOCABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE</option>
                            <option value="IRREVOCABLE TRANSFERABLE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of40a_form_of_documentary_credit'}"><c:if test="${item.detail=='IRREVOCABLE TRANSFERABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE TRANSFERABLE</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF40E Applicable Rules -->
                    <div class="form-row"><span class="label_body">OF40E</span><span class="label">Applicable Rules</span>
                        <select name="_130_of40e_applicable_rules" id="_130_of40e_applicable_rules">
                            <option value="">choose a type</option>
                            <option value="UCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='UCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCP LATEST VERSION</option>
                            <option value="UCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='UCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCPURR LATEST VERSION</option>
                            <option value="EUCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='EUCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCP LATEST VERSION</option>
                            <option value="EUCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='EUCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCPURR LATEST VERSION</option>
                            <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR - Other (must specify Narrative)</option>
                        </select>
                    </div>

                    <div id="div_130_of40e_narrative" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative (if OTHR)</span>
                            <textarea name="_131_of40e_narrative" id="_131_of40e_narrative" rows="2" maxlength="35"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_131_of40e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF31D Date and Place of Expiry -->
                    <div class="form-row"><span class="label_body">OF31D</span><span class="label">Date of Expiry</span>
                        <input type="text" name="_140_of31d_date_of_expiry" id="_140_of31d_date_of_expiry" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of31d_date_of_expiry'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Place of Expiry</span>
                        <input type="text" name="_141_of31d_place_of_expiry" id="_141_of31d_place_of_expiry" maxlength="29" placeholder="Place" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_of31d_place_of_expiry'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF50 Changed Applicant Details -->
                    <div class="form-row"><span class="label_body">OF50</span><span class="label">Changed Applicant Details</span>
                        <textarea name="_150_of50_changed_applicant_details" id="_150_of50_changed_applicant_details" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of50_changed_applicant_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF59 Beneficiary -->
                    <div class="form-row"><span class="label_body">OF59</span><span class="label">Beneficiary</span>
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                        <input type="text" name="_160_of59_account" id="_160_of59_account" maxlength="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)"/>
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                        <textarea name="_161_of59_name_address" id="_161_of59_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_of59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF32B Increase of Documentary Credit Amount -->
                    <div class="form-row"><span class="label_body">OF32B</span><span class="label">Increase of Documentary Credit Amount</span>
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                        <input type="text" name="_170_of32b_currency" id="_170_of32b_currency" maxlength="3" placeholder="Currency" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of32b_currency'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                        <input type="text" name="_171_of32b_amount" id="_171_of32b_amount" maxlength="15" placeholder="Amount" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of32b_amount'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF33B Decrease of Documentary Credit Amount -->
                    <div class="form-row"><span class="label_body">OF33B</span><span class="label">Decrease of Documentary Credit Amount</span>
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                        <input type="text" name="_180_of33b_currency" id="_180_of33b_currency" maxlength="3" placeholder="Currency" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of33b_currency'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                        <input type="text" name="_181_of33b_amount" id="_181_of33b_amount" maxlength="15" placeholder="Amount" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_of33b_amount'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF39A Percentage Credit Amount Tolerance -->
                    <div class="form-row"><span class="label_body">OF39A</span><span class="label">Percentage Credit Amount Tolerance</span>
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Plus %</span>
                        <input type="text" name="_190_of39a_plus" id="_190_of39a_plus" maxlength="2" placeholder="Plus %" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of39a_plus'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Minus %</span>
                        <input type="text" name="_191_of39a_minus" id="_191_of39a_minus" maxlength="2" placeholder="Minus %" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_191_of39a_minus'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF39C Additional Amounts Covered -->
                    <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                        <textarea name="_200_of39c_additional_amounts_covered" id="_200_of39c_additional_amounts_covered" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of39c_additional_amounts_covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF41a Available With ... By ... -->
                    <div class="form-row"><span class="label_body">OF41a</span><span class="label">Available With ... By ...</span>
                        <select id="_210_of41a_available_with_by" name="_210_of41a_available_with_by">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of41a_available_with_by'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of41a_available_with_by'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>

                    <div id="div_210_of41a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_211_of41a_identifier_code" name="_211_of41a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_211_of41a_identifier_code'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                        </div>
                    </div>

                    <div id="div_210_of41a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_212_of41a_name_address" name="_212_of41a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_212_of41a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>

                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">By</span>
                        <select id="_213_of41a_code" name="_213_of41a_code">
                            <option value="">choose a type</option>
                            <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_213_of41a_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option>
                            <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_213_of41a_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                            <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_213_of41a_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                            <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_213_of41a_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                            <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_213_of41a_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF42C Drafts at ... -->
                    <div class="form-row"><span class="label_body">OF42C</span><span class="label">Drafts at ...</span>
                        <textarea name="_220_of42c_drafts_at" id="_220_of42c_drafts_at" rows="3" maxlength="105"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of42c_drafts_at'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF42a Drawee -->
                    <div class="form-row"><span class="label_body">OF42a</span><span class="label">Drawee</span>
                        <select id="_230_of42a_drawee" name="_230_of42a_drawee">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of42a_drawee'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (Identifier Code)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of42a_drawee'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>
                    <div id="div_230_of42a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_231_of42a_party_identifier" name="_231_of42a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_231_of42a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_232_of42a_identifier_code" name="_232_of42a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_232_of42a_identifier_code'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_230_of42a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_233_of42a_party_identifier" name="_233_of42a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_233_of42a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_234_of42a_name_address" name="_234_of42a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_234_of42a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF42M Mixed Payment Details -->
                    <div class="form-row"><span class="label_body">OF42M</span><span class="label">Mixed Payment Details</span>
                        <textarea name="_240_of42m_mixed_payment_details" id="_240_of42m_mixed_payment_details" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of42m_mixed_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF42P Negotiation/Deferred Payment Details -->
                    <div class="form-row"><span class="label_body">OF42P</span><span class="label">Negotiation / Deferred Payment Details</span>
                        <textarea name="_250_of42p_negotiation_deferred_payment_details" id="_250_of42p_negotiation_deferred_payment_details" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of42p_negotiation_deferred_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF43P Partial Shipments -->
                    <div class="form-row"><span class="label_body">OF43P</span><span class="label">Partial Shipments</span>
                        <select id="_260_of43p_partial_shipments" name="_260_of43p_partial_shipments">
                            <option value="">choose a type</option>
                            <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of43p_partial_shipments'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option>
                            <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of43p_partial_shipments'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                            <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of43p_partial_shipments'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF43T Transhipment -->
                    <div class="form-row"><span class="label_body">OF43T</span><span class="label">Transhipment</span>
                        <select id="_270_of43t_transhipment" name="_270_of43t_transhipment">
                            <option value="">choose a type</option>
                            <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of43t_transhipment'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option>
                            <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of43t_transhipment'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                            <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of43t_transhipment'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF44A Place of Taking in Charge / Dispatch from / Place of Receipt -->
                    <div class="form-row"><span class="label_body">OF44A</span><span class="label">Place of Taking in Charge / Dispatch from / Place of Receipt</span>
                        <textarea name="_280_of44a_place_taking_in_charge_dispatch_from_place_of_receipt" id="_280_of44a_place_taking_in_charge_dispatch_from_place_of_receipt" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of44a_place_taking_in_charge_dispatch_from_place_of_receipt'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44E Port of Loading / Airport of Departure -->
                    <div class="form-row"><span class="label_body">OF44E</span><span class="label">Port of Loading / Airport of Departure</span>
                        <textarea name="_290_of44e_port_of_loading_airport_of_departure" id="_290_of44e_port_of_loading_airport_of_departure" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of44e_port_of_loading_airport_of_departure'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44F Port of Discharge / Airport of Destination -->
                    <div class="form-row"><span class="label_body">OF44F</span><span class="label">Port of Discharge / Airport of Destination</span>
                        <textarea name="_300_of44f_port_of_discharge_airport_of_destination" id="_300_of44f_port_of_discharge_airport_of_destination" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of44f_port_of_discharge_airport_of_destination'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44B Place of Final Destination / For Transportation to / Place of Delivery -->
                    <div class="form-row"><span class="label_body">OF44B</span><span class="label">Place of Final Destination / For Transportation to / Place of Delivery</span>
                        <textarea name="_310_of44b_place_of_final_destination_for_transportation_to_place_of_delivery" id="_310_of44b_place_of_final_destination_for_transportation_to_place_of_delivery" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of44b_place_of_final_destination_for_transportation_to_place_of_delivery'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44C Latest Date of Shipment -->
                    <div class="form-row"><span class="label_body">OF44C</span><span class="label">Latest Date of Shipment</span>
                        <input type="text" name="_320_of44c_latest_date_of_shipment" id="_320_of44c_latest_date_of_shipment" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of44c_latest_date_of_shipment'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF44D Shipment Period -->
                    <div class="form-row"><span class="label_body">OF44D</span><span class="label">Shipment Period</span>
                        <textarea name="_330_of44d_shipment_period" id="_330_of44d_shipment_period" rows="6" maxlength="390"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of44d_shipment_period'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF45B Description of Goods and/or Services -->
                    <div class="form-row"><span class="label_body">OF45B</span><span class="label">Description of Goods and/or Services</span>
                        <textarea name="_340_of45b_description_of_goods_and_or_services" id="_340_of45b_description_of_goods_and_or_services" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of45b_description_of_goods_and_or_services'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF46B Documents Required -->
                    <div class="form-row"><span class="label_body">OF46B</span><span class="label">Documents Required</span>
                        <textarea name="_350_of46b_documents_required" id="_350_of46b_documents_required" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_of46b_documents_required'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF47B Additional Conditions -->
                    <div class="form-row"><span class="label_body">OF47B</span><span class="label">Additional Conditions</span>
                        <textarea name="_360_of47b_additional_conditions" id="_360_of47b_additional_conditions" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of47b_additional_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF49M Special Payment Conditions for Beneficiary -->
                    <div class="form-row"><span class="label_body">OF49M</span><span class="label">Special Payment Conditions for Beneficiary</span>
                        <textarea name="_370_of49m_special_payment_conditions_for_beneficiary" id="_370_of49m_special_payment_conditions_for_beneficiary" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_of49m_special_payment_conditions_for_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF49N Special Payment Conditions for Bank Only -->
                    <div class="form-row"><span class="label_body">OF49N</span><span class="label">Special Payment Conditions for Bank Only</span>
                        <textarea name="_380_of49n_special_payment_conditions_for_bank_only" id="_380_of49n_special_payment_conditions_for_bank_only" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of49n_special_payment_conditions_for_bank_only'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF71D Charges -->
                    <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                        <textarea name="_390_of71d_charges" id="_390_of71d_charges" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_of71d_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF71N Amendment Charge Payable By -->
                    <div class="form-row"><span class="label_body">OF71N</span><span class="label">Amendment Charge Payable By</span>
                        <select id="_400_of71n_charge_code" name="_400_of71n_charge_code">
                            <option value="">choose a type</option>
                            <option value="APPL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_of71n_charge_code'}"><c:if test="${item.detail=='APPL'}"> selected="true" </c:if></c:if></c:forEach>>APPL - Applicant</option>
                            <option value="BENE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_of71n_charge_code'}"><c:if test="${item.detail=='BENE'}"> selected="true" </c:if></c:if></c:forEach>>BENE - Beneficiary</option>
                            <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_of71n_charge_code'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR - Other Party</option>
                        </select>
                    </div>
                    <div id="div_400_of71n_narrative" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative (only if OTHR)</span>
                            <textarea name="_401_of71n_narrative" id="_401_of71n_narrative" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_401_of71n_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF48 Period for Presentation in Days -->
                    <div class="form-row"><span class="label_body">OF48</span><span class="label">Period for Presentation in Days</span>
                        <input type="text" id="_410_of48_days" name="_410_of48_days" maxlength="3" placeholder="Number of days" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of48_days'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                        <input type="text" id="_411_of48_narrative" name="_411_of48_narrative" maxlength="35" placeholder="e.g. from invoice date" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_411_of48_narrative'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF49 Confirmation Instructions -->
                    <div class="form-row"><span class="label_body">OF49</span><span class="label">Confirmation Instructions</span>
                        <select id="_420_of49_confirmation_instructions" name="_420_of49_confirmation_instructions">
                            <option value="">choose a type</option>
                            <option value="CONFIRM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_of49_confirmation_instructions'}"><c:if test="${item.detail=='CONFIRM'}"> selected="true" </c:if></c:if></c:forEach>>CONFIRM - Confirmation requested</option>
                            <option value="MAY ADD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_of49_confirmation_instructions'}"><c:if test="${item.detail=='MAY ADD'}"> selected="true" </c:if></c:if></c:forEach>>MAY ADD - Confirmation may be added</option>
                            <option value="WITHOUT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_of49_confirmation_instructions'}"><c:if test="${item.detail=='WITHOUT'}"> selected="true" </c:if></c:if></c:forEach>>WITHOUT - No confirmation requested</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF58a Requested Confirmation Party -->
                    <div class="form-row"><span class="label_body">OF58a</span><span class="label">Requested Confirmation Party</span>
                        <select id="_430_of58a_requested_confirmation_party" name="_430_of58a_requested_confirmation_party">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_of58a_requested_confirmation_party'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_of58a_requested_confirmation_party'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>
                    <div id="div_430_of58a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_431_of58a_party_identifier" name="_431_of58a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_431_of58a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_432_of58a_identifier_code" name="_432_of58a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_432_of58a_identifier_code'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_430_of58a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_433_of58a_party_identifier" name="_433_of58a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_433_of58a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_434_of58a_name_address" name="_434_of58a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_434_of58a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF53a Reimbursing Bank -->
                    <div class="form-row"><span class="label_body">OF53a</span><span class="label">Reimbursing Bank</span>
                        <select id="_440_of53a_reimbursing_bank" name="_440_of53a_reimbursing_bank">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of53a_reimbursing_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of53a_reimbursing_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>
                    <div id="div_440_of53a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_441_of53a_party_identifier" name="_441_of53a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_441_of53a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_442_of53a_identifier_code" name="_442_of53a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_442_of53a_identifier_code'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_440_of53a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_443_of53a_party_identifier" name="_443_of53a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_443_of53a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_444_of53a_name_address" name="_444_of53a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_444_of53a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF78 Instructions to the Paying/Accepting/Negotiating Bank -->
                    <div class="form-row"><span class="label_body">OF78</span><span class="label">Instructions to the Paying/Accepting/Negotiating Bank</span>
                        <textarea name="_450_of78_instructions_to_the_paying_accepting_negotiating_bank" id="_450_of78_instructions_to_the_paying_accepting_negotiating_bank" rows="12" maxlength="780"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_450_of78_instructions_to_the_paying_accepting_negotiating_bank'}"><c:out value="${item.detail}"/></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF57a 'Advise Through' Bank -->
                    <div class="form-row"><span class="label_body">OF57a</span><span class="label">'Advise Through' Bank</span>
                        <select id="_460_of57a_advise_through_bank" name="_460_of57a_advise_through_bank">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_460_of57a_advise_through_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_460_of57a_advise_through_bank'}"><c:if test="${item.detail=='B'}"> selected="true" </c:if></c:if></c:forEach>>Option B (Location)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_460_of57a_advise_through_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>
                    <div id="div_460_of57a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_461_of57a_party_identifier" name="_461_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_461_of57a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_462_of57a_identifier_code" name="_462_of57a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_462_of57a_identifier_code'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_460_of57a_B" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_463_of57a_party_identifier" name="_463_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_463_of57a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                            <input type="text" id="_464_of57a_location" name="_464_of57a_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_464_of57a_location'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_460_of57a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_465_of57a_party_identifier" name="_465_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_465_of57a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_466_of57a_name_address" name="_466_of57a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_466_of57a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF72Z Sender to Receiver Information -->
                    <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                        <textarea name="_470_of72z_sender_to_receiver_information" id="_470_of72z_sender_to_receiver_information" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_470_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}"/></c:if></c:forEach></textarea>
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
<%@ include file="rule/validate_rule_mt707.jsp" %>
</body>
</html>