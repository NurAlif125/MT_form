<%-- 
    Document   : mt756
    Created on : Sep 24, 2025, 9:00:08 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT756 Advice of Reimbursement or Payment</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt756.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt756.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT756 Advice of Reimbursement or Payment</h2></div>
    <form id="form_mt756" method="post" 
          action="${pageContext.request.contextPath}/MT756Servlet"
          autocomplete="off"
          onsubmit="return validateMT756() && confirm('Do you want to save this MT756 data?');">

        <input type="hidden" name="messageType" value="756"/>

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
                            <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)" input_type="MF20 Sender's Reference" location="Body" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_010_mf20_sender_reference"}'><c:out value='${item.detail}'/></c:if></c:forEach>"/>
                        </div>
                        <hr/>

                        <!-- MF21 Presenting Bank's Reference -->
                        <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Presenting Bank's Reference</span>
                            <input type="text" name="_020_mf21_presenting_banks_reference" id="_020_mf21_presenting_banks_reference" class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)" input_type="MF21 Presenting Bank's Reference" location="Body" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_020_mf21_presenting_banks_reference"}'><c:out value='${item.detail}'/></c:if></c:forEach>"/>
                        </div>
                        <hr/>
                        
                        <!-- MF32B Total Amount Claimed -->
                        <div class="form-row"><span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Total Amount Claimed</span></div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" id="_030_mf32b_currency" name="_030_mf32b_currency" class="mandatory" maxlength="3" style="text-transform:uppercase;" onkeypress="return onlyAlpha(event)" input_type="MF32B Total Amount Claimed" location="Body" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_030_mf32b_currency"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" id="_031_mf32b_amount" name="_031_mf32b_amount" class="mandatory" maxlength="15" input_type="MF32B Total Amount Claimed" location="Body" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_031_mf32b_amount"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- MF33A Amount Reimbursed or Paid -->
                        <div class="form-row"><span class="label_body">MF33A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount Reimbursed or Paid</span></div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                            <input type="text" id="_040_mf33a_date" name="_040_mf33a_date" class="mandatory" maxlength="6" placeholder="YYMMDD" onkeypress="return onlyNumber(event)" input_type="MF33A Amount Reimbursed or Paid" location="Body" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_040_mf33a_date"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" id="_041_mf33a_currency" name="_041_mf33a_currency" class="mandatory" maxlength="3" style="text-transform:uppercase;" onkeypress="return onlyAlpha(event)" input_type="MF33A Amount Reimbursed or Paid" location="Body" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_041_mf33a_currency"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" id="_042_mf33a_amount" name="_042_mf33a_amount" class="mandatory" maxlength="15" input_type="MF33A Amount Reimbursed or Paid" location="Body" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_042_mf33a_amount"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- OF53a Sender's Correspondent -->
                        <div class="form-row"><span class="label_body">OF53a</span><span class="label">Sender's Correspondent</span>
                            <div class="mt-row">
                                <div class="mt-col">
                                    <select id="_050_of53a_senders_correspondent" name="_050_of53a_senders_correspondent">
                                        <option value="">choose a type</option>
                                        <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_050_of53a_senders_correspondent' and item.detail eq 'A'}">selected</c:if></c:forEach>>Option A (BIC)</option>
                                        <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_050_of53a_senders_correspondent' and item.detail eq 'B'}">selected</c:if></c:forEach>>Option B (Location)</option>
                                        <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_050_of53a_senders_correspondent' and item.detail eq 'D'}">selected</c:if></c:forEach>>Option D (Name &amp; Address)</option>
                                    </select>
                                </div>
                                <div class="form-row" id="wrap_051_of53a_party_identifier" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" id="_051_of53a_party_identifier" name="_051_of53a_party_identifier" maxlength="35" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_051_of53a_party_identifier"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                                </div>
                                <div class="form-row" id="wrap_052_of53a_identifier_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                                    <input type="text" id="_052_of53a_identifier_code" name="_052_of53a_identifier_code" maxlength="11" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_052_of53a_identifier_code"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                                </div>
                                <div class="form-row" id="wrap_053_of53a_location" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                    <textarea id="_053_of53a_location" name="_053_of53a_location" maxlength="35"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_053_of53a_location"}'><c:out value='${item.detail}'/></c:if></c:forEach></textarea>
                                </div>
                                <div class="form-row" id="wrap_054_of53a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                                    <textarea id="_054_of53a_name_address" name="_054_of53a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_054_of53a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>
                        </div>
                        <hr/>
                        
                        <!-- OF54a Receiver's Correspondent -->
                        <div class="form-row"><span class="label_body">OF54a</span><span class="label">Receiver's Correspondent</span>
                            <div class="mt-row">
                                <div class="mt-col">
                                    <select id="_060_of54a_receivers_correspondent" name="_060_of54a_receivers_correspondent">
                                        <option value="">choose a type</option>
                                        <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_060_of54a_receivers_correspondent' and item.detail eq 'A'}">selected</c:if></c:forEach>>Option A (BIC)</option>
                                        <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_060_of54a_receivers_correspondent' and item.detail eq 'B'}">selected</c:if></c:forEach>>Option B (Location)</option>
                                        <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_060_of54a_receivers_correspondent' and item.detail eq 'D'}">selected</c:if></c:forEach>>Option D (Name &amp; Address)</option>
                                    </select>
                                </div>
                                <div class="form-row" id="wrap_061_of54a_party_identifier" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" id="_061_of54a_party_identifier" name="_061_of54a_party_identifier" maxlength="35" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_061_of54a_party_identifier"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                                </div>
                                <div class="form-row" id="wrap_062_of54a_identifier_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                                    <input type="text" id="_062_of54a_identifier_code" name="_062_of54a_identifier_code" maxlength="11" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_062_of54a_identifier_code"}'><c:out value='${item.detail}'/></c:if></c:forEach>" />
                                </div>
                                <div class="form-row" id="wrap_063_of54a_location" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                    <textarea id="_063_of54a_location" name="_063_of54a_location" maxlength="35"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_063_of54a_location"}'><c:out value='${item.detail}'/></c:if></c:forEach></textarea>
                                </div>
                                <div class="form-row" id="wrap_064_of54a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                                    <textarea id="_064_of54a_name_address" name="_064_of54a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName eq '_064_of54a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>
                        </div>
                        <hr/>
                        
                        <!-- OF72Z Sender to Receiver Information -->
                        <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                            <textarea name="_070_of72z_sender_to_receiver_information" id="_070_of72z_sender_to_receiver_information" rows="6" maxlength="210"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_070_of72z_sender_to_receiver_information"}'><c:out value='${item.detail}' /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF79Z Narrative -->
                        <div class="form-row"><span class="label_body">OF79Z</span><span class="label">Narrative</span>
                            <textarea name="_080_of79z_narrative" id="_080_of79z_narrative" rows="6" maxlength="1750"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_080_of79z_narrative"}'><c:out value='${item.detail}' /></c:if></c:forEach></textarea>
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
<%@ include file="rule/validate_rule_mt756.jsp" %>
</body>
</html>



