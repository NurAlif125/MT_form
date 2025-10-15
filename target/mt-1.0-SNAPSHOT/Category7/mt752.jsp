<%-- 
    Document   : mt752
    Created on : Sep 23, 2025, 10:14:35 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT752 Authorisation to Pay, Accept or Negotiate</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt752.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt752.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT752 Authorisation to Pay, Accept or Negotiate</h2></div>
    <form id="form_mt752" method="post" 
          action="${pageContext.request.contextPath}/MT752Servlet"
          autocomplete="off"
          onsubmit="return validateMT752() && confirm('Do you want to save this MT752 data?');">

        <input type="hidden" name="messageType" value="752"/>

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
                        <input type="text" name="_010_mf20_documentary_credit_number" id="_010_mf20_documentary_credit_number" class="mandatory" maxlength="16" input_type="MF20 Documentary Credit Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF21 Presenting Bank's Reference -->
                    <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Presenting Bank's Reference</span>
                        <input type="text" name="_020_mf21_presenting_banks_reference" id="_020_mf21_presenting_banks_reference" class="mandatory" maxlength="16" input_type="MF21 Presenting Bank's Reference" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_presenting_banks_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF23 Further Identification -->
                    <div class="form-row"><span class="label_body">MF23</span><span class="label"><a style="color:red;text-decoration:none">*</a>Further Identification</span>
                        <select name="_030_mf23_further_identification" id="_030_mf23_further_identification" class="mandatory" input_type="MF23 Further Identification" location="Body">
                            <option value="">choose a type</option>
                            <option value="ACCEPT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='ACCEPT'}"> selected="true" </c:if></c:if></c:forEach>>ACCEPT - Conveys an authorisation to accept a draft</option>
                            <option value="DEBIT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='DEBIT'}"> selected="true" </c:if></c:if></c:forEach>>DEBIT - Conveys an authorisation to debit the account of the issuing bank</option>
                            <option value="NEGOTIATE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='NEGOTIATE'}"> selected="true" </c:if></c:if></c:forEach>>NEGOTIATE - Conveys an authorisation to negotiate the documents with discrepancies</option>
                            <option value="REIMBURSE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='REIMBURSE'}"> selected="true" </c:if></c:if></c:forEach>>REIMBURSE - Conveys an authorisation to claim reimbursement</option>
                            <option value="REMITTED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='REMITTED'}"> selected="true" </c:if></c:if></c:forEach>>REMITTED - Is used to pay the presenting bank</option>
                            <option value="SEE79Z" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='SEE79Z'}"> selected="true" </c:if></c:if></c:forEach>>SEE79Z - Conveys an authorisation (mixture or special version)</option> 
                        </select>
                    </div>
                    <hr/>
                    
                    <!-- MF30 Date of Advice of Discrepancy or Mailing -->
                    <div class="form-row"><span class="label_body">MF30</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Advice of Discrepancy or Mailing</span>
                        <input type="text" name="_040_mf30_date_of_advice_of_discrepancy_or_mailing" id="_040_mf30_date_of_advice_of_discrepancy_or_mailing" class="mandatory" maxlength="6" placeholder="YYMMDD" input_type="MF30 Date of Advice of Discrepancy or Mailing" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf30_date_of_advice_of_discrepancy_or_mailing'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF32B Total Amount Advised -->
                    <div class="form-row"><span class="label_body">OF32B</span><span class="label">Total Amount Advised</span>
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                        <input type="text" id="_050_of32b_currency" name="_050_of32b_currency" maxlength="3" placeholder="Currency" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                        <input type="text" id="_051_of32b_amount" name="_051_of32b_amount" maxlength="15" placeholder="Amount" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>
                    
                    <!-- OF71D Charges Deducted -->
                    <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges Deducted</span>
                        <textarea name="_060_of71d_charges_deducted" id="_060_of71d_charges_deducted" rows="6" maxlength="210" placeholder="Format: /CODE/CCY123,45 or narrative text"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of71d_charges_deducted'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>
                    
                    <!-- OF33a Net Amount -->
                    <div class="form-row"><span class="label_body">OF33a</span><span class="label">Net Amount</span>
                        <select id="_070_of33a_net_amount" name="_070_of33a_net_amount">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of33a_net_amount'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (Date, Currency, Amount)</option>
                            <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of33a_net_amount'}"><c:if test="${item.detail=='B'}"> selected="true" </c:if></c:if></c:forEach>>Option B (Currency, Amount)</option>
                        </select>
                    </div>

                    <div id="div_070_of33a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                            <input type="text" id="_071_of33a_date" name="_071_of33a_date" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of33a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" id="_072_of33a_currency" name="_072_of33a_currency" maxlength="3" placeholder="Currency" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of33a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" id="_073_of33a_amount" name="_073_of33a_amount" maxlength="15" placeholder="Amount" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of33a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>

                    <div id="div_070_of33a_B" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" id="_074_of33a_currency" name="_074_of33a_currency" maxlength="3" placeholder="Currency" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_074_of33a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" id="_075_of33a_amount" name="_075_of33a_amount" maxlength="15" placeholder="Amount" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_075_of33a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <hr/>
                    
                    <!-- OF53a Sender's Correspondent -->
                    <div class="form-row"><span class="label_body">OF53a</span><span class="label">Sender's Correspondent</span>
                        <select id="_080_of53a_senders_correspondent" name="_080_of53a_senders_correspondent">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of53a_senders_correspondent'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of53a_senders_correspondent'}"><c:if test="${item.detail=='B'}"> selected="true" </c:if></c:if></c:forEach>>Option B (Location)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of53a_senders_correspondent'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>

                    <div id="div_080_of53a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_081_of53a_party_identifier" name="_081_of53a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_082_of53a_identifier_code" name="_082_of53a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>

                    <div id="div_080_of53a_B" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_083_of53a_party_identifier" name="_083_of53a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                            <input type="text" id="_084_of53a_location" name="_084_of53a_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of53a_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>

                    <div id="div_080_of53a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_085_of53a_party_identifier" name="_085_of53a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_085_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_086_of53a_name_address" name="_086_of53a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_086_of53a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>
                    
                    <!-- OF54a Receiver's Correspondent -->
                    <div class="form-row"><span class="label_body">OF54a</span><span class="label">Receiver's Correspondent</span>
                        <select id="_090_of54a_receivers_correspondent" name="_090_of54a_receivers_correspondent">
                            <option value="">choose a type</option>
                            <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of54a_receivers_correspondent'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                            <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of54a_receivers_correspondent'}"><c:if test="${item.detail=='B'}"> selected="true" </c:if></c:if></c:forEach>>Option B (Location)</option>
                            <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of54a_receivers_correspondent'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                        </select>
                    </div>

                    <div id="div_090_of54a_A" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_091_of54a_party_identifier" name="_091_of54a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_092_of54a_identifier_code" name="_092_of54a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of54a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>

                    <div id="div_090_of54a_B" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_093_of54a_party_identifier" name="_093_of54a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                            <input type="text" id="_094_of54a_location" name="_094_of54a_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of54a_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>

                    <div id="div_090_of54a_D" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_095_of54a_party_identifier" name="_095_of54a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_095_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_096_of54a_name_address" name="_096_of54a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_of54a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <hr/>
                    
                    <!-- OF72Z Sender to Receiver Information -->
                    <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                        <textarea name="_100_of72z_sender_to_receiver_information" id="_100_of72z_sender_to_receiver_information" rows="6" maxlength="210" placeholder="Format: /CODE/text or narrative text"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF79Z Narrative -->
                    <div class="form-row"><span class="label_body">OF79Z</span><span class="label">Narrative</span>
                        <textarea name="_110_of79z_narrative" id="_110_of79z_narrative" rows="35" maxlength="1750"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of79z_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
<%@ include file="rule/validate_rule_mt752.jsp" %>
</body>
</html>

