<%-- 
    Document   : mt754
    Created on : Sep 24, 2025, 8:59:44 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT754 Advice of Payment/Acceptance/Negotiation</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt754.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt754.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT754 Advice of Payment/Acceptance/Negotiation</h2></div>
    <form id="form_mt754" method="post" 
          action="${pageContext.request.contextPath}/MT754Servlet"
          autocomplete="off"
          onsubmit="return validateMT754() && confirm('Do you want to save this MT754 data?');">

        <input type="hidden" name="messageType" value="754"/>

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
                        
                        <!-- MF20 Sender's Reference -->
                        <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Sender's Reference</span>
                            <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)" input_type="MF20 Sender's Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF21 Related Reference -->
                        <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Related Reference</span>
                            <input type="text" name="_020_mf21_related_reference" id="_020_mf21_related_reference" class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)" input_type="MF21 Related Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- MF32a Principal Amount Paid/Accepted/Negotiated -->
                        <div class="form-row"><span class="label_body">MF32a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Principal Amount Paid/Accepted/Negotiated</span>
                            <select id="_030_mf32a_principal_amount_paid_accepted_negotiated" name="_030_mf32a_principal_amount_paid_accepted_negotiated" class="mandatory" input_type="MF32a Principal Amount Paid/Accepted/Negotiated" location="Body" onchange="toggle32aOption(this.value)">
                                <option value="">choose a type</option>
                                <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32a_principal_amount_paid_accepted_negotiated'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (Date + Currency + Amount)</option>
                                <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32a_principal_amount_paid_accepted_negotiated'}"><c:if test="${item.detail=='B'}"> selected="true" </c:if></c:if></c:forEach>>Option B (Currency + Amount)</option>
                            </select>
                        </div>
                        <div class="form-row" id="wrap_031_mf32a_date" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                            <input type="text" id="_031_mf32a_date" name="_031_mf32a_date" maxlength="6" placeholder="YYMMDD" input_type="MF32a Principal Amount Paid/Accepted/Negotiated" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_032_mf32a_currency" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" id="_032_mf32a_currency" name="_032_mf32a_currency" maxlength="3" style="text-transform:uppercase;" input_type="MF32a Principal Amount Paid/Accepted/Negotiated" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_033_mf32a_amount" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" id="_033_mf32a_amount" name="_033_mf32a_amount" maxlength="15" input_type="MF32a Principal Amount Paid/Accepted/Negotiated" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF33B Additional Amount -->
                        <div class="form-row"><span class="label_body">OF33B</span><span class="label">Additional Amount</span></div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" id="_040_of33b_currency" name="_040_of33b_currency" maxlength="3" style="text-transform:uppercase;" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" id="_041_of33b_amount" name="_041_of33b_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- OF71D Charges Deducted -->
                        <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges Deducted</span>
                            <textarea name="_050_of71d_charges_deducted" id="_050_of71d_charges_deducted" rows="6" maxlength="210" placeholder="/COMM/USD123,45 Commission or narrative text"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of71d_charges_deducted'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF73A Charges Added -->
                        <div class="form-row"><span class="label_body">OF73A</span><span class="label">Charges Added</span>
                            <textarea name="_060_of73a_charges_added" id="_060_of73a_charges_added" rows="6" maxlength="210" placeholder="/AGENT/EUR100,00 Agent Commission or narrative text"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of73a_charges_added'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>


                        <!-- OF34a Total Amount Claimed -->
                        <div class="form-row"><span class="label_body">OF34a</span><span class="label">Total Amount Claimed</span>
                            <select id="_070_of34a_total_amount_claimed" name="_070_of34a_total_amount_claimed" onchange="toggle34aOption(this.value)">
                                <option value="">choose a type</option>
                                <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of34a_total_amount_claimed'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (Date + Currency + Amount)</option>
                                <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of34a_total_amount_claimed'}"><c:if test="${item.detail=='B'}"> selected="true" </c:if></c:if></c:forEach>>Option B (Currency + Amount)</option>
                            </select>
                        </div>

                        <div class="form-row" id="wrap_071_of34a_date" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                            <input type="text" id="_071_of34a_date" name="_071_of34a_date" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of34a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_072_of34a_currency" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" id="_072_of34a_currency" name="_072_of34a_currency" maxlength="3" style="text-transform:uppercase;" oninput="this.value=this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of34a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_073_of34a_amount" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" id="_073_of34a_amount" name="_073_of34a_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of34a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF53a Reimbursing Bank -->
                        <div class="form-row"><span class="label_body">OF53a</span><span class="label">Reimbursing Bank</span>
                            <select id="_080_of53a_reimbursing_bank" name="_080_of53a_reimbursing_bank" onchange="toggle53aOption(this.value)">
                                <option value="">choose option</option>
                                <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of53a_reimbursing_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (Identifier Code)</option>
                                <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of53a_reimbursing_bank'}"><c:if test="${item.detail=='B'}"> selected="true" </c:if></c:if></c:forEach>>Option B (Location)</option>
                                <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of53a_reimbursing_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                            </select>
                        </div>
                        <div class="form-row" id="wrap_081_of53a_party_identifier" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_081_of53a_party_identifier" name="_081_of53a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_082_of53a_identifier_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_082_of53a_identifier_code" name="_082_of53a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_083_of53a_location" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                            <textarea id="_083_of53a_location" name="_083_of53a_location" maxlength="35"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of53a_location'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <div class="form-row" id="wrap_084_of53a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_084_of53a_name_address" name="_084_of53a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of53a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>
                        
                        <!-- OF57a Account With Bank -->
                        <div class="form-row"><span class="label_body">OF57a</span><span class="label">Account With Bank</span>
                            <select id="_090_of57a_account_with_bank" name="_090_of57a_account_with_bank" onchange="toggle57aOption(this.value)">
                                <option value="">choose option</option>
                                <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of57a_account_with_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (Identifier Code)</option>
                                <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of57a_account_with_bank'}"><c:if test="${item.detail=='B'}"> selected="true" </c:if></c:if></c:forEach>>Option B (Location)</option>
                                <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of57a_account_with_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                            </select>
                        </div>
                        <div class="form-row" id="wrap_091_of57a_party_identifier" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_091_of57a_party_identifier" name="_091_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_092_of57a_identifier_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_092_of57a_identifier_code" name="_092_of57a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_093_of57a_location" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                            <textarea id="_093_of57a_location" name="_093_of57a_location" maxlength="35"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of57a_location'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <div class="form-row" id="wrap_094_of57a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_094_of57a_name_address" name="_094_of57a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of57a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF58a Beneficiary Bank -->
                        <div class="form-row"><span class="label_body">OF58a</span><span class="label">Beneficiary Bank</span>
                            <select id="_100_of58a_beneficiary_bank" name="_100_of58a_beneficiary_bank" onchange="toggle58aOption(this.value)">
                                <option value="">choose a type</option>
                                <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of58a_beneficiary_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                                <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of58a_beneficiary_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                            </select>
                        </div>

                        <div class="form-row" id="wrap_101_of58a_party_identifier" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_101_of58a_party_identifier" name="_101_of58a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_102_of58a_identifier_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_102_of58a_identifier_code" name="_102_of58a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_103_of58a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_103_of58a_name_address" name="_103_of58a_name_address" rows="4" maxlength="140" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_of58a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>
                        
                        <!-- OF72Z Sender to Receiver Information -->
                        <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                            <textarea name="_110_of72z_sender_to_receiver_information" id="_110_of72z_sender_to_receiver_information" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF77 Narrative -->
                        <div class="form-row"><span class="label_body">OF77</span><span class="label">Narrative</span>
                            <textarea name="_120_of77_narrative" id="_120_of77_narrative" rows="6" maxlength="1750"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of77_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
<%@ include file="rule/validate_rule_mt754.jsp" %>
</body>
</html>



