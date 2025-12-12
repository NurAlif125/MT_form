<%-- 
    Document   : mt710
    Created on : September 2018
    Author     : Sri Puji 
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt710.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--<%@page contentType="text/html" import="java.util.*" %>--%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link rel="stylesheet" href="css/helper.css" type="text/css">
<link href="css/MT.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:710'}">
            <div id="judul">MT 710 Advice of Third Bank's or a Non-Bank's Documentary Credit</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="710" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li id="tab-view1"><a href="#" rel="view1">Header</a></li>
                        <li id="tab-view2"><a href="#" rel="view2">Body</a></li>
                        <li id="tab-view3"><a href="#" rel="view3">Comment</a></li>
                        <li id="tab-view4"><a href="#" rel="view4">Histories</a></li>
                        <li id="tab-view5"><a href="#" rel="view5">Log MT Text</a></li>                        
                        <li id="tab-view6"><a href="#" rel="view6">MT Relation</a></li>
                        <li id="tab-view7"><a href="#" rel="view7" id="tabView7">Translation</a></li>
                        <li hidden id="tab-validate"><a href="#" rel="view8" id="tabView8">Validate</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                            <%@ include file="special_rate.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">

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
                                    <input type="text" input_type="MF20 Sender Reference" location="Body" name="_030_mf20_sender_reference" id="_030_mf20_sender_reference" class="mandatory" onkeypress="avoidSplChars(event)" maxlength="16" minlength="1" pattern="[0-9a-zA-Z/\-?:().,\'\+ ]{1,16}" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />        
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
                                    <select id="type_of52a_issuing_bank" name="type_of52a_issuing_bank" input_type="OF52a Issuing Bank" location="Body">
                                        <option value="">choose a type</option>
                                        <option value="a">A - Party Identifier - Identifier Code</option>
                                        <option value="d">D - Identifier Code - Name Address</option>
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
                                    <textarea name="_100_of50b_non_bank_issuer" id="_100_of50b_non_bank_issuer" rows="4" maxlength="140" input_type="OF50B Non-Bank Issuer" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of50b_non_bank_issuer'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/> 

                                <!-- OF51a Applicant Bank (Option A or D) -->
                                <div class="form-row"><span class="label_body">OF51a</span><span class="label">Applicant Bank</span>
                                    <select name="_110_of51a_applicant_bank" id="_110_of51a_applicant_bank">
                                        <option value="">choose a type</option>
                                        <option value="a">A - Party Identifier - Identifier Code</option>
                                        <option value="d">D - Party Identifier - Name and Address</option>
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
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Account</span>
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
                                    <input type="checkbox" name="percentage_credit_amount_checkbox" id="percentage_credit_amount_checkbox" />
                                    <div id="check_of39a">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 1</span>
                                            <input type="text" name="_150_of39a_percentage_credit_amount_tolerance1" id="_150_of39a_percentage_credit_amount_tolerance1" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of39a_percentage_credit_amount_tolerance1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 2</span>
                                            <input type="text" name="_151_of39a_percentage_credit_amount_tolerance2" id="_151_of39a_percentage_credit_amount_tolerance2" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_151_of39a_percentage_credit_amount_tolerance2'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>

                                <!-- OF39C Additional Amounts Covered -->
                                <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                                    <textarea name="_160_of39c_additional_amounts_covered" id="_160_of39c_additional_amounts_covered" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of39c_additional_amounts_covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- MF41A Available With ... By ... -->
                                <div class="form-row"><span class="label_body">MF41a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Available With ... By ...</span>
                                    <select id="_170_mf41a_available_with_by" name="_170_mf41a_available_with_by" input_type="MF41 Available With ... By ..." location="Body" class="mandatory">
                                        <option value="">choose a type</option>
                                        <option value="a">A - Identifier Code - Code</option>
                                        <option value="d">D - Name and Address - Code</option>
                                    </select>
                                    <div id="div_170_mf41a_A">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                            <input type="text" name="_171_mf41a_identifier_code" id="_171_mf41a_identifier_code" input_type="MF41 Available With ... By ..." location="Body" class="mandatory" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_mf41a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Code</span>
                                            <select id="_172_mf41a_code" name="_172_mf41a_code" class="mandatory" input_type="MF41 Available With ... By ..." location="Body">
                                                <option value="">choose a code</option>
                                                <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_mf41a_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option>
                                                <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_mf41a_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                                <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_mf41a_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                                <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_mf41a_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                                <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_mf41a_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="div_170_mf41a_D">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_173_mf41d_name_and_address" id="_173_mf41d_name_and_address" class="mandatory" input_type="MF41 Available With ... By ..." location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_mf41d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Code</span>
                                            <select id="_174_mf41d_code" name="_174_mf41d_code" input_type="MF41 Available With ... By ..." location="Body"">
                                                <option value="">choose a code</option>
                                                <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_mf41d_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option>
                                                <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_mf41d_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                                <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_mf41d_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                                <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_mf41d_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                                <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_mf41d_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                            </select>
                                        </div>
                                    </div>
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
                                        <option value="a">A - Party Identifier - Identifier Code</option>
                                        <option value="d">D - Party Identifier - Name and Address</option>
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
                                    <input type="checkbox" name="period_for_presentation_in_days_checkbox" id="period_for_presentation_in_days_checkbox" />
                                    <div id="check_of48">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Days</span>
                                            <input type="text" name="_360_of48_days" id="_360_of48_days" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of48_days'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                            <input type="text" name="_361_of48_narrative" id="_361_of48_narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_361_of48_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
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
                                    <select id="type_of58a_issuing_bank" name="type_of58a_issuing_bank">
                                        <option value="">choose a type</option>
                                        <option value="a">A - Party Identifier - Identifier Code</option>
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                </div>
                                <div id="div_380_of58a_A">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_381_of58a_party_identifier" id="_381_of58a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_381_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                                        <input type="text" name="_382_of58a_bic" id="_382_of58a_bic" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_382_of58a_bic'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_380_of58a_D">
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
                                        <option value="a">A - Party Identifier - Identifier Code</option>
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                </div>
                                <div id="div_390_of53a_A">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_391_of53a_party_identifier" id="_391_of53a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_391_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                                        <input type="text" name="_392_of53a_bic" id="_392_of53a_bic" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_392_of53a_bic'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_390_of53a_D">
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
                                        <option value="a">A - Party Identifier - Identifier Code</option>
                                        <option value="b">B - Party Identifier - Location</option>
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                </div>
                                <div id="div_420_of57a_A">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_421_of57a_party_identifier" id="_421_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_421_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                                        <input type="text" name="_422_of57a_bic" id="_422_of57a_bic" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_422_of57a_bic'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_420_of57a_B">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_423_of57a_party_identifier" id="_423_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_423_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_424_of57a_location" id="_424_of57a_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_424_of57a_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_420_of57a_D">
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
                        <div id="view3" class="tabcontent">
                            <%@ include file="comment_mt.jsp" %>
                       </div>
                       <div id="view4" class="tabcontent">
                           <%@ include file="history_mt.jsp" %>
                       </div>
                       <div id="view5" class="tabcontent">
                           <%@ include file="logTrx_mt.jsp" %>
                       </div>
                       <div id="view6" class="tabcontent">
                           <%@ include file="relation_mt.jsp" %>
                       </div>
                       <div id="view7" class="tab-content">
                           <div class="form-row">
                               <%@include file="mt_mx.jsp" %>
                           </div>
                       </div>
                       <div id="view8" class="tabcontent">
                           <div id="error-container"></div>
                       </div>
                    </div>
                </div>
                <%@ include file="button_action.jsp" %>
            </form>
        </c:if>
    </c:forEach>
</div>

<script>
    // Fungsi untuk mengambil parameter dari URL
    function getQueryParameter(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    // Mengecek apakah ada parameter hideView1 di URL
    if (getQueryParameter('create') === 'true') {
        // Menyembunyikan tab view1 dan seluruh kontennya
        const tabView7 = document.getElementById('tabView7');
        const view1Content = document.getElementById('view7');

        if (tabView7)
            tabView7.style.display = 'none'; // Sembunyikan tab link
        if (view7Content)
            view7Content.style.display = 'none'; // Sembunyikan konten view1
    } else {
        // Tampilkan view1 jika tidak ada parameter untuk menyembunyikan
        document.getElementById('view7').classList.add('active');
    }
</script>

<script type="text/javascript" src="js/json-xml-data-tree/data-tree.js"></script>
<script>
    var xmldat = document.getElementById("mxview3").value;
    new DataTree({
        xml: xmldat,
        container: '#mxfull',
        attrs: 'show',
        startExpanded: true
    });
</script>