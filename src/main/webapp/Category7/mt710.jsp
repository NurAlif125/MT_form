<%-- 
    Document   : mt710
    Created on : Sep 10, 2025, 10:14:09 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT710 Advice of a Third Bank's or a Non-Bank's Documentary Credit</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt710.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt710.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT710 Advice of a Third Bank's or a Non-Bank's Documentary Credit</h2></div>
    <form id="form_mt710" method="post" 
          action="${pageContext.request.contextPath}/MT710Servlet"
          autocomplete="off"
          onsubmit="return validateMT710() && confirm('Do you want to save this MT710 data?');">

        <input type="hidden" name="messageType" value="710"/>

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

                    <!-- MF40B Form of Documentary Credit (Type + Code) -->
                    <div class="form-row"><span class="label_body">MF40B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Form of Documentary Credit</span>
                        <select name="_020_mf40b_form_of_documentary_credit_type" id="_020_mf40b_form_of_documentary_credit_type" class="mandatory" input_type="MF40B Form of Documentary Credit" location="Body">
                            <option value="">choose a type</option>
                            <option value="IRREVOCABLE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf40b_form_of_documentary_credit_type'}"><c:if test="${item.detail=='IRREVOCABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE</option>
                            <option value="IRREVOCABLE TRANSFERABLE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf40b_form_of_documentary_credit_type'}"><c:if test="${item.detail=='IRREVOCABLE TRANSFERABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE TRANSFERABLE</option>
                        </select>
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Code</span>
                        <select name="_021_mf40b_code" id="_021_mf40b_code" class="mandatory" input_type="MF40B Form of Documentary Credit" location="Body">
                            <option value="">choose a code</option>
                            <option value="ADDING OUR CONFIRMATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf40b_code'}"><c:if test="${item.detail=='ADDING OUR CONFIRMATION'}"> selected="true" </c:if></c:if></c:forEach>>ADDING OUR CONFIRMATION</option>
                            <option value="WITHOUT OUR CONFIRMATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf40b_code'}"><c:if test="${item.detail=='WITHOUT OUR CONFIRMATION'}"> selected="true" </c:if></c:if></c:forEach>>WITHOUT OUR CONFIRMATION</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- MF20 Sender's Reference -->
                    <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Sender's Reference</span>
                        <input type="text" name="_030_mf20_sender_reference" id="_030_mf20_sender_reference" class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)" input_type="MF20 Sender's Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF21 Documentary Credit Number -->
                    <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Documentary Credit Number</span>
                        <input type="text" name="_040_mf21_documentary_credit_number" id="_040_mf21_documentary_credit_number" class="mandatory" maxlength="16" input_type="MF21 Documentary Credit Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf21_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF23 Reference to Pre-Advice -->
                    <div class="form-row"><span class="label_body">OF23</span><span class="label">Reference to Pre-Advice</span>
                        <input type="text" name="_050_of23_reference_to_preadvice" id="_050_of23_reference_to_preadvice" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of23_reference_to_preadvice'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF31C Date of Issue -->
                    <div class="form-row"><span class="label_body">MF31C</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Issue</span>
                        <input type="text" name="_060_mf31c_date_of_issue" id="_060_mf31c_date_of_issue" class="mandatory" maxlength="6" placeholder="YYMMDD" input_type="MF31C Date of Issue" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf31c_date_of_issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF40E Applicable Rules -->
                    <div class="form-row"><span class="label_body">MF40E</span><span class="label"><a style="color:red;text-decoration:none">*</a>Applicable Rules</span>
                        <select name="_070_mf40e_applicable_rules" id="_070_mf40e_applicable_rules" class="mandatory" input_type="MF40E Applicable Rules" location="Body">
                            <option value="">choose a type</option>
                            <option value="UCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf40e_applicable_rules'}"><c:if test="${item.detail=='UCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCP LATEST VERSION</option>
                            <option value="UCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf40e_applicable_rules'}"><c:if test="${item.detail=='UCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCPURR LATEST VERSION</option>
                            <option value="EUCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf40e_applicable_rules'}"><c:if test="${item.detail=='EUCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCP LATEST VERSION</option>
                            <option value="EUCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf40e_applicable_rules'}"><c:if test="${item.detail=='EUCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCPURR LATEST VERSION</option>
                            <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf40e_applicable_rules'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                        </select>
                    </div>
                    <div id="div_070_mf40e_narrative" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative (if OTHR)</span>
                            <textarea name="_071_mf40e_narrative" id="_071_mf40e_narrative" rows="2" maxlength="35"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_mf40e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- MF31D Date and Place of Expiry -->
                    <div class="form-row"><span class="label_body">MF31D</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Expiry</span>
                        <input type="text" name="_080_mf31d_date_of_expiry" id="_080_mf31d_date_of_expiry" class="mandatory" maxlength="6" placeholder="YYMMDD" input_type="MF31D Date and Place of Expiry" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf31d_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Place of Expiry</span>
                        <input type="text" name="_081_mf31d_place_of_expiry" id="_081_mf31d_place_of_expiry" class="mandatory" maxlength="29" placeholder="Place" input_type="MF31D Date and Place of Expiry" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_mf31d_place_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF52a Issuing Bank -->
                    <div class="form-row"><span class="label_body">OF52a</span><span class="label">Issuing Bank</span>
                        <select id="_090_of52a_issuing_bank" name="_090_of52a_issuing_bank">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of52a_issuing_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of52a_issuing_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>
                    <div id="div_090_of52a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_091_of52a_party_identifier" id="_091_of52a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_092_of52a_identifier_code" name="_092_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_090_of52a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_093_of52a_party_identifier" id="_093_of52a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_094_of52a_name_address" name="_094_of52a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of52a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF50B Non-Bank Issuer -->
                    <div class="form-row"><span class="label_body">OF50B</span><span class="label">Non-Bank Issuer</span>
                        <textarea name="_100_of50b_non_bank_issuer" id="_100_of50b_non_bank_issuer" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of50b_non_bank_issuer'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/> 
                    
                    <!-- OF51a Applicant Bank (Option A or D) -->
                    <div class="form-row"><span class="label_body">OF51a</span><span class="label">Applicant Bank</span>
                        <select name="_110_of51a_applicant_bank" id="_110_of51a_applicant_bank">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of51a_applicant_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of51a_applicant_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name & Address)</option>
                        </select>
                    </div>
                    <div id="div_110_of51a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_111_of51a_party_identifier" id="_111_of51a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_of51a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" name="_112_of51a_bic" id="_112_of51a_bic" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_112_of51a_bic'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_110_of51a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_113_of51a_party_identifier" id="_113_of51a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_113_of51a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name & Address</span>
                            <textarea name="_114_of51a_name_address" id="_114_of51a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_114_of51a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- MF50 Applicant -->
                    <div class="form-row"><span class="label_body">MF50</span><span class="label"><a style="color:red;text-decoration:none">*</a>Applicant</span>
                        <textarea name="_120_mf50_applicant" id="_120_mf50_applicant" class="mandatory" rows="4" maxlength="140" input_type="MF50 Applicant" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_mf50_applicant'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- MF59 Beneficiary -->
                    <div class="form-row"><span class="label_body">MF59</span><span class="label"><a style="color:red;text-decoration:none">*</a>Beneficiary</span></div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                        <input type="text" name="_130_mf59_account" id="_130_mf59_account" class="mandatory" maxlength="34" input_type="MF59 Beneficiary" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_mf59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name & Address</span>
                        <textarea name="_131_mf59_name_address" id="_131_mf59_name_address" class="mandatory" rows="4" maxlength="140" input_type="MF59 Beneficiary" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_131_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- MF32B Currency Code, Amount -->
                    <div class="form-row"><span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency Code, Amount</span></div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                        <input type="text" name="_140_mf32b_currency" id="_140_mf32b_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Currency Code, Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                        <input type="text" name="_141_mf32b_amount" id="_141_mf32b_amount" class="mandatory" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Currency Code, Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_140_mf32b_currency');" />
                        <font style="margin-left: 50px"></font>
                        <script>
                            function formatUang(n, currency) {
                                if (isNaN(n)) {
                                    return "";
                                }
                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                            }
                            var number2 = document.getElementById('_141_mf32b_amount').value;
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
                        <input type="text" name="_150_of39a_tolerance_plus" id="_150_of39a_tolerance_plus" maxlength="2" placeholder="Plus %" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of39a_tolerance_plus'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        <input type="text" name="_151_of39a_tolerance_minus" id="_151_of39a_tolerance_minus" maxlength="2" placeholder="Minus %" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_151_of39a_tolerance_minus'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF39C Additional Amounts Covered -->
                    <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                        <textarea name="_160_of39c_additional_amounts_covered" id="_160_of39c_additional_amounts_covered" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of39c_additional_amounts_covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- MF41A Available With ... By ... -->
                    <div class="form-row"><span class="label_body">MF41A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Available With ... By ...</span>
                        <select id="_170_mf41a_available_with_by" name="_170_mf41a_available_with_by" class="mandatory" input_type="MF41A Available With ... By ..." location="Body">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_mf41a_available_with_by'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_mf41a_available_with_by'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>
                    <div id="div_170_mf41a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_171_mf41a_identifier_code" name="_171_mf41a_identifier_code" maxlength="11" input_type="MF41A Available With ... By ..." location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_mf41a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_170_mf41a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name & Address</span>
                            <textarea id="_172_mf41d_name_and_address" name="_172_mf41d_name_and_address" rows="4" maxlength="140" input_type="MF41A Available With ... By ..." location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_mf41d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>By</span>
                        <select id="_173_mf41a_by" name="_173_mf41a_by" class="mandatory" input_type="MF41A Available With ... By ..." location="Body">
                            <option value="">choose a type</option>
                            <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_mf41a_by'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option>
                            <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_mf41a_by'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                            <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_mf41a_by'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                            <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_mf41a_by'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                            <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_mf41a_by'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF42C Drafts at ... -->
                    <div class="form-row"><span class="label_body">OF42C</span><span class="label">Drafts at ...</span>
                        <textarea name="_180_of42c_drafts_at" id="_180_of42c_drafts_at" rows="3" maxlength="105"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of42c_drafts_at'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF42A Drawee -->
                    <div class="form-row"><span class="label_body">OF42A</span><span class="label">Drawee</span>
                        <select id="_190_of42a_drawee" name="_190_of42a_drawee">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of42a_drawee'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of42a_drawee'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>
                    <div id="div_190_of42a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_191_of42a_party_identifier" id="_191_of42a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_191_of42a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_192_of42a_identifier_code" name="_192_of42a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_192_of42a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_190_of42a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_193_of42a_party_identifier" id="_193_of42a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_193_of42a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name & Address</span>
                            <textarea id="_194_of42d_name_and_address" name="_194_of42d_name_and_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_194_of42d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF42M Mixed Payment Details -->
                    <div class="form-row"><span class="label_body">OF42M</span><span class="label">Mixed Payment Details</span>
                        <textarea name="_200_of42m_mixed_payment_details" id="_200_of42m_mixed_payment_details" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of42m_mixed_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF42P Negotiation/Deferred Payment Details -->
                    <div class="form-row"><span class="label_body">OF42P</span><span class="label">Negotiation/Deferred Payment Details</span>
                        <textarea name="_210_of42p_negotiation" id="_210_of42p_negotiation" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of42p_negotiation'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF43P Partial Shipments -->
                    <div class="form-row"><span class="label_body">OF43P</span><span class="label">Partial Shipments</span>
                        <select name="_220_of43p_partial_shipments" id="_220_of43p_partial_shipments">
                            <option value="">choose a type</option>
                            <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of43p_partial_shipments'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option>
                            <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of43p_partial_shipments'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                            <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of43p_partial_shipments'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF43T Transhipment -->
                    <div class="form-row"><span class="label_body">OF43T</span><span class="label">Transhipment</span>
                        <select name="_230_of43t_transhipment" id="_230_of43t_transhipment">
                            <option value="">choose a type</option>
                            <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of43t_transhipment'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option>
                            <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of43t_transhipment'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                            <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of43t_transhipment'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF44A Place of Taking in Charge/Dispatch/Receipt -->
                    <div class="form-row"><span class="label_body">OF44A</span><span class="label">Place of Taking in Charge / Dispatch from / Place of Receipt</span>
                        <textarea name="_240_of44a_place_taking_in_charge_dispatch_from_place_of_receipt" id="_240_of44a_place_taking_in_charge_dispatch_from_place_of_receipt" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of44a_place_taking_in_charge_dispatch_from_place_of_receipt'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44E Port of Loading / Airport of Departure -->
                    <div class="form-row"><span class="label_body">OF44E</span><span class="label">Port of Loading / Airport of Departure</span>
                        <textarea name="_250_of44e_port_of_loading_airport_of_departure" id="_250_of44e_port_of_loading_airport_of_departure" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of44e_port_of_loading_airport_of_departure'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44F Port of Discharge / Airport of Destination -->
                    <div class="form-row"><span class="label_body">OF44F</span><span class="label">Port of Discharge / Airport of Destination</span>
                        <textarea name="_260_of44f_port_of_discharge_airport_of_destination" id="_260_of44f_port_of_discharge_airport_of_destination" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of44f_port_of_discharge_airport_of_destination'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44B Place of Final Destination / Place of Delivery -->
                    <div class="form-row"><span class="label_body">OF44B</span><span class="label">Place of Final Destination / Place of Delivery</span>
                        <textarea name="_270_of44b_place_of_final_destination_for_transportation_to_place_of_delivery" id="_270_of44b_place_of_final_destination_for_transportation_to_place_of_delivery" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of44b_place_of_final_destination_for_transportation_to_place_of_delivery'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF44C Latest Date of Shipment -->
                    <div class="form-row"><span class="label_body">OF44C</span><span class="label">Latest Date of Shipment</span>
                        <input type="text" name="_280_of44c_latest_date_of_shipment" id="_280_of44c_latest_date_of_shipment" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of44c_latest_date_of_shipment'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF44D Shipment Period -->
                    <div class="form-row"><span class="label_body">OF44D</span><span class="label">Shipment Period</span>
                        <textarea name="_290_of44d_shipment_period" id="_290_of44d_shipment_period" rows="6" maxlength="390"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of44d_shipment_period'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF45A Description of Goods and/or Services -->
                    <div class="form-row"><span class="label_body">OF45A</span><span class="label">Description of Goods and/or Services</span>
                        <textarea name="_300_of45a_description_of_goods_and_or_services" id="_300_of45a_description_of_goods_and_or_services" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of45a_description_of_goods_and_or_services'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF46A Documents Required -->
                    <div class="form-row"><span class="label_body">OF46A</span><span class="label">Documents Required</span>
                        <textarea name="_310_of46a_documents_required" id="_310_of46a_documents_required" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of46a_documents_required'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF47A Additional Conditions -->
                    <div class="form-row"><span class="label_body">OF47A</span><span class="label">Additional Conditions</span>
                        <textarea name="_320_of47a_additional_conditions" id="_320_of47a_additional_conditions" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of47a_additional_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF49G Special Payment Conditions for Beneficiary -->
                    <div class="form-row"><span class="label_body">OF49G</span><span class="label">Special Payment Conditions for Beneficiary</span>
                        <textarea name="_330_of49g_special_payment_conditions_for_beneficiary" id="_330_of49g_special_payment_conditions_for_beneficiary" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of49g_special_payment_conditions_for_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF49H Special Payment Conditions for Bank Only -->
                    <div class="form-row"><span class="label_body">OF49H</span><span class="label">Special Payment Conditions for Bank Only</span>
                        <textarea name="_340_of49h_special_payment_conditions_for_bank_only" id="_340_of49h_special_payment_conditions_for_bank_only" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of49h_special_payment_conditions_for_bank_only'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF71D Charges -->
                    <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                        <textarea name="_350_of71d_charges" id="_350_of71d_charges" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_of71d_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF48 Period for Presentation in Days -->
                    <div class="form-row"><span class="label_body">OF48</span><span class="label">Period for Presentation in Days</span>
                        <input type="text" name="_360_of48_days" id="_360_of48_days" maxlength="3" placeholder="Days" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of48_days'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative (optional)</span>
                        <input type="text" name="_361_of48_narrative" id="_361_of48_narrative" maxlength="35" placeholder="Narrative" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_361_of48_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF49 Confirmation Instructions -->
                    <div class="form-row"><span class="label_body">MF49</span><span class="label"><a style="color:red;text-decoration:none">*</a>Confirmation Instructions</span>
                        <select id="_370_mf49_confirmation_instructions" name="_370_mf49_confirmation_instructions" class="mandatory" input_type="MF49 Confirmation Instructions" location="Body">
                            <option value="">choose a type</option>
                            <option value="CONFIRM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_mf49_confirmation_instructions'}"><c:if test="${item.detail=='CONFIRM'}"> selected="true" </c:if></c:if></c:forEach>>CONFIRM</option>
                            <option value="MAY ADD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_mf49_confirmation_instructions'}"><c:if test="${item.detail=='MAY ADD'}"> selected="true" </c:if></c:if></c:forEach>>MAY ADD</option>
                            <option value="WITHOUT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_mf49_confirmation_instructions'}"><c:if test="${item.detail=='WITHOUT'}"> selected="true" </c:if></c:if></c:forEach>>WITHOUT</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- OF58a Requested Confirmation Party -->
                    <div class="form-row"><span class="label_body">OF58a</span><span class="label">Requested Confirmation Party</span>
                        <select id="_380_of58a_requested_confirmation_party" name="_380_of58a_requested_confirmation_party">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of58a_requested_confirmation_party'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of58a_requested_confirmation_party'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>
                    <div id="div_380_of58a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_381_of58a_party_identifier" id="_381_of58a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_381_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" name="_382_of58a_bic" id="_382_of58a_bic" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_382_of58a_bic'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_380_of58a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_383_of58a_party_identifier" id="_383_of58a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_383_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name & Address</span>
                            <textarea name="_384_of58a_name_address" id="_384_of58a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_384_of58a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF53a Reimbursing Bank -->
                    <div class="form-row"><span class="label_body">OF53a</span><span class="label">Reimbursing Bank</span>
                        <select id="_390_of53a_reimbursing_bank" name="_390_of53a_reimbursing_bank">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_of53a_reimbursing_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_of53a_reimbursing_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>
                    <div id="div_390_of53a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_391_of53a_party_identifier" id="_391_of53a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_391_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" name="_392_of53a_bic" id="_392_of53a_bic" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_392_of53a_bic'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_390_of53a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_393_of53a_party_identifier" id="_393_of53a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_393_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name & Address</span>
                            <textarea name="_394_of53a_name_address" id="_394_of53a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_394_of53a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF78 Instructions to Paying/Accepting/Negotiating Bank -->
                    <div class="form-row"><span class="label_body">OF78</span><span class="label">Instructions to the Paying/Accepting/Negotiating Bank</span>
                        <textarea name="_400_of78_instructions_to_the_paying_accepting_negotiating_bank" id="_400_of78_instructions_to_the_paying_accepting_negotiating_bank" rows="12" maxlength="780"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_of78_instructions_to_the_paying_accepting_negotiating_bank'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF78D Instructions from Intermediary Bank -->
                    <div class="form-row"><span class="label_body">OF78D</span><span class="label">Instructions from Intermediary Bank</span>
                        <textarea name="_410_of78d_instructions_from_intermediary_bank" id="_410_of78d_instructions_from_intermediary_bank" rows="12" maxlength="780"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of78d_instructions_from_intermediary_bank'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF57a Advise Through Bank -->
                    <div class="form-row"><span class="label_body">OF57a</span><span class="label">'Advise Through' Bank</span>
                        <select id="_420_of57a_advise_through_bank" name="_420_of57a_advise_through_bank">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_of57a_advise_through_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_of57a_advise_through_bank'}"><c:if test="${item.detail=='B'}"> selected="true" </c:if></c:if></c:forEach>>Option B (Location)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_of57a_advise_through_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>
                    <div id="div_420_of57a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_421_of57a_party_identifier" id="_421_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_421_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" name="_422_of57a_bic" id="_422_of57a_bic" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_422_of57a_bic'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_420_of57a_B" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_423_of57a_party_identifier" id="_423_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_423_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                            <input type="text" name="_424_of57a_location" id="_424_of57a_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_424_of57a_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="div_420_of57a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" name="_425_of57a_party_identifier" id="_425_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_425_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name & Address</span>
                            <textarea name="_426_of57a_name_address" id="_426_of57a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_426_of57a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF72Z Sender to Receiver Information -->
                    <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                        <textarea name="_430_of72z_information" id="_430_of72z_information" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_of72z_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
<%@ include file="rule/validate_rule_mt710.jsp" %>
</body>
</html>
