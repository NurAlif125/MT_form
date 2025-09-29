<%-- 
    Document   : mt742
    Created on : Sep 12, 2025, 9:54:20 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT742 Reimbursement Claim</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt742.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt742.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT742 Reimbursement Claim</h2></div>
    <form id="form_mt742" method="post" 
          action="${pageContext.request.contextPath}/MT742Servlet"
          autocomplete="off"
          onsubmit="return validateMT742() && confirm('Do you want to save this MT742 data?');">

        <input type="hidden" name="messageType" value="742"/>

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
                 
                        <!-- MF20 Claiming Bank's Reference -->
                        <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Claiming Bank's Reference</span>
                            <input type="text" onkeypress="avoidSplChars(event)" name="_010_mf20_claiming_bank_reference" id="_010_mf20_claiming_bank_reference" class="mandatory" maxlength="16" input_type="MF20 Claiming Bank's Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_claiming_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF21 Documentary Credit Number -->
                        <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Documentary Credit Number</span>
                            <input type="text" name="_020_mf21_documentary_credit_number" id="_020_mf21_documentary_credit_number" class="mandatory" maxlength="16" input_type="MF21 Documentary Credit Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/> 

                        <!-- OF31C Date of Issue -->
                        <div class="form-row"><span class="label_body">OF31C</span><span class="label">Date of Issue</span>
                            <input type="text" name="_030_of31c_date_of_issue" id="_030_of31c_date_of_issue" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of31c_date_of_issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF52a Issuing Bank -->
                        <div class="form-row"><span class="label_body">MF52a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Issuing Bank</span>
                            <select id="_040_mf52a_issuing_bank" name="_040_mf52a_issuing_bank" class="mandatory" input_type="MF52a Issuing Bank" location="Body">
                                <option value="">choose a type</option>
                                <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf52a_issuing_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (Identifier Code)</option>
                                <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf52a_issuing_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                            </select>
                        </div>

                        <div class="form-row" id="wrap_041_mf52a_party_identifier" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_041_mf52a_party_identifier" name="_041_mf52a_party_identifier" maxlength="35" input_type="MF52a Issuing Bank" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_mf52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_042_mf52a_identifier_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_042_mf52a_identifier_code" name="_042_mf52a_identifier_code" maxlength="11" input_type="MF52a Issuing Bank" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_043_mf52a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_043_mf52a_name_address" name="_043_mf52a_name_address" rows="3" maxlength="140" input_type="MF52a Issuing Bank" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_mf52a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- MF32B Principal Amount Claimed -->
                        <div class="form-row"><span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Principal Amount Claimed</span></div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" name="_050_mf32b_currency" id="_050_mf32b_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Principal Amount Claimed" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>

                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" name="_051_mf32b_amount" id="_051_mf32b_amount" class="mandatory" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Principal Amount Claimed" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_050_mf32b_currency');" />
                            <font style="margin-left: 50px"></font>
                            <script>
                                function formatUang(n, currency) {
                                    if (isNaN(n)) {
                                        return "";
                                    }
                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                }
                                var number2 = document.getElementById('_051_mf32b_amount').value;
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

                        <!-- OF33B Additional Amount Claimed as Allowed for in Excess of Principal Amount -->
                        <div class="form-row"><span class="label_body">OF33B</span><span class="label">Additional Amount Claimed as Allowed for in Excess of Principal Amount</span>
                            <input type="text" id="_060_of33b_currency" name="_060_of33b_currency" maxlength="3" style="text-transform:uppercase;" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            <input type="text" id="_061_of33b_amount" name="_061_of33b_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF71D Charges -->
                        <div class="form-row"><span class="label_body">OF71D</span><span class="label">Other Charges</span>
                            <textarea name="_070_of71d_charges" id="_070_of71d_charges" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of71d_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- MF34a Total Amount Claimed -->
                        <div class="form-row"><span class="label_body">MF34a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Total Amount Claimed</span>
                            <select id="_080_mf34a_total_amount_claimed" name="_080_mf34a_total_amount_claimed" class="mandatory" onchange="toggle34aOption(this.value)" input_type="MF34a Total Amount Claimed" location="Body">
                                <option value="">choose a type</option>
                                <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf34a_total_amount_claimed'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (Date + Currency + Amount)</option>
                                <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf34a_total_amount_claimed'}"><c:if test="${item.detail=='B'}"> selected="true" </c:if></c:if></c:forEach>>Option B (Currency + Amount)</option>
                            </select>
                        </div>

                        <div class="form-row" id="wrap_081_mf34a_date" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                            <input type="text" id="_081_mf34a_date" name="_081_mf34a_date" maxlength="6" placeholder="YYMMDD" input_type="MF34a Total Amount Claimed" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_mf34a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_082_mf34a_currency" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" id="_082_mf34a_currency" name="_082_mf34a_currency" maxlength="3" style="text-transform:uppercase;" oninput="this.value=this.value.toUpperCase();" input_type="MF34a Total Amount Claimed" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_mf34a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_083_mf34a_amount" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" id="_083_mf34a_amount" name="_083_mf34a_amount" maxlength="15" input_type="MF34a Total Amount Claimed" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf34a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF57a Account With Bank -->
                        <div class="form-row"><span class="label_body">OF57a</span><span class="label">Account With Bank</span>
                            <select id="_090_of57a_account_with_bank" name="_090_of57a_account_with_bank" onchange="toggle57aOption(this.value)">
                                <option value="">choose a type</option>
                                <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of57a_account_with_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
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
                        <div class="form-row" id="wrap_093_of57a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_093_of57a_name_address" name="_093_of57a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of57a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
                    
                </div>
            </div>
            <div class="footer">
                <button type="submit">Save</button>
                <button type="button" onclick="window.location.href='../index.jsp'">Back</button>
            </div>
        </div>
    </form>
</div>
<%@ include file="rule/validate_rule_mt742.jsp" %>
</body>
</html>

