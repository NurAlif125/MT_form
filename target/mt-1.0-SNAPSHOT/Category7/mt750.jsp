<%-- 
    Document   : mt750
    Created on : Sep 23, 2025, 10:13:50 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT750 Advice of Discrepancy</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt750.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt750.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT750 Advice of Discrepancy</h2></div>
    <form id="form_mt750" method="post" 
          action="${pageContext.request.contextPath}/MT750Servlet"
          autocomplete="off"
          onsubmit="return validateMT750() && confirm('Do you want to save this MT750 data?');">

        <input type="hidden" name="messageType" value="750"/>

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
                        
                        <!-- MF32B Principal Amount -->
                        <div class="form-row"><span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Principal Amount</span></div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" name="_030_mf32b_currency" id="_030_mf32b_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Principal Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>

                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" name="_031_mf32b_amount" id="_031_mf32b_amount" class="mandatory" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Principal Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_030_mf32b_currency');" />
                            <font style="margin-left: 50px"></font>
                            <script>
                                function formatUang(n, currency) {
                                    if (isNaN(n)) {
                                        return "";
                                    }
                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                }
                                var number2 = document.getElementById('_031_mf32b_amount').value;
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

                        <!-- OF33B Additional Amount -->
                        <div class="form-row"><span class="label_body">OF33B</span><span class="label">Additional Amount</span></div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" id="_040_of33b_currency" name="_040_of33b_currency" maxlength="3" style="text-transform:uppercase;" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" id="_041_of33b_amount" name="_041_of33b_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- OF71D Charges to be Deducted -->
                        <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges to be Deducted</span>
                            <textarea name="_050_of71d_charges_to_be_deducted" id="_050_of71d_charges_to_be_deducted" rows="6" maxlength="210" placeholder="/COMM/USD123,45 Commission or narrative text"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of71d_charges_to_be_deducted'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF73A Charges to be Added -->
                        <div class="form-row"><span class="label_body">OF73A</span><span class="label">Charges to be Added</span>
                            <textarea name="_060_of73a_charges_to_be_added" id="_060_of73a_charges_to_be_added" rows="6" maxlength="210" placeholder="/AGENT/EUR100,00 Agent Commission or narrative text"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of73a_charges_to_be_added'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF34B Total Amount to be Paid -->
                        <div class="form-row"><span class="label_body">OF34B</span><span class="label">Total Amount to be Paid</span></div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" id="_070_of34b_currency" name="_070_of34b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of34b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" id="_071_of34b_amount" name="_071_of34b_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of34b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF57a Account With Bank -->
                        <div class="form-row"><span class="label_body">OF57a</span><span class="label">Account With Bank</span>
                            <select id="_080_of57a_account_with_bank" name="_080_of57a_account_with_bank" onchange="toggle57aOption(this.value)">
                                <option value="">choose option</option>
                                <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of57a_account_with_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (Identifier Code)</option>
                                <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of57a_account_with_bank'}"><c:if test="${item.detail=='B'}"> selected="true" </c:if></c:if></c:forEach>>Option B (Location)</option>
                                <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of57a_account_with_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                            </select>
                        </div>
                        <div class="form-row" id="wrap_081_of57a_party_identifier" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_081_of57a_party_identifier" name="_081_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_082_of57a_identifier_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_082_of57a_identifier_code" name="_082_of57a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_083_of57a_location" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                            <textarea id="_083_of57a_location" name="_083_of57a_location" maxlength="35"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of57a_location'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <div class="form-row" id="wrap_084_of57a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_084_of57a_name_address" name="_084_of57a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of57a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF72Z Sender to Receiver Information -->
                        <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                            <textarea name="_090_of72z_sender_to_receiver_information" id="_090_of72z_sender_to_receiver_information" rows="6" maxlength="210" placeholder="/INS/Details of insurance OR narrative text"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- MF77J Discrepancies -->
                        <div class="form-row"><span class="label_body">MF77J</span><span class="label"><a style="color:red;text-decoration:none">*</a>Discrepancies</span>
                            <textarea name="_100_mf77j_discrepancies" id="_100_mf77j_discrepancies" rows="6" maxlength="3500" placeholder="/DOCM Invoice missing OR narrative text" class="mandatory" input_type="MF77J Discrepancies" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf77j_discrepancies'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
<%@ include file="rule/validate_rule_mt750.jsp" %>
</body>
</html>


