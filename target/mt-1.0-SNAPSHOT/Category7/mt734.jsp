<%-- 
    Document   : mt734
    Created on : Sep 12, 2025, 9:53:55 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT734 Advice of Refusal</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt734.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt734.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT734 Advice of Refusal</h2></div>
    <form id="form_mt734" method="post" 
          action="${pageContext.request.contextPath}/MT734Servlet"
          autocomplete="off"
          onsubmit="return validateMT734() && confirm('Do you want to save this MT734 data?');">

        <input type="hidden" name="messageType" value="734"/>

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

                        <!-- MF20 Sender's TRN -->
                        <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Sender's TRN</span>
                            <input type="text" name="_010_mf20_sender_trn" id="_010_mf20_sender_trn"
                                class="mandatory" maxlength="16"
                                onkeypress="avoidSplChars(event)"
                                value="<c:forEach var='item' items='${tags}'>
                                           <c:if test='${item.tagName eq "_010_mf20_sender_trn"}'>
                                        <c:out value='${item.detail}'/>
                                    </c:if>
                                </c:forEach>"/>
                        </div>
                        <hr/>
                        
                        <!-- MF21 Presenting Bank's Reference -->
                        <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Presenting Bank's Reference</span>
                            <input type="text" name="_020_mf21_presenting_bank_reference" id="_020_mf21_presenting_bank_reference"
                                   class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_020_mf21_presenting_bank_reference"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <hr/>
                        
                        <!-- MF32A Date and Amount of Utilisation -->
                        <div class="form-row"><span class="label_body">MF32A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date and Amount of Utilisation</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                            <input type="text" name="_030_mf32a_date" id="_030_mf32a_date" maxlength="6" placeholder="YYMMDD"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_030_mf32a_date"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" name="_031_mf32a_currency" id="_031_mf32a_currency" maxlength="3"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_031_mf32a_currency"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" name="_032_mf32a_amount" id="_032_mf32a_amount" maxlength="15"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_032_mf32a_amount"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <hr/>
                        
                        <!-- OF73A Charges Claimed -->
                        <div class="form-row"><span class="label_body">OF73A</span><span class="label">Charges Claimed</span>
                            <textarea name="_040_of73A_charges_claimed"
                                      id="_040_of73A_charges_claimed"
                                      rows="6" maxlength="210"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_040_of73A_charges_claimed"}'>
                                    <c:out value='${item.detail}' />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF33a Total Amount Claimed -->
                        <div class="form-row"><span class="label_body">OF33a</span><span class="label">Total Amount Claimed</span>
                                <select id="_050_of33a_total_amount_claimed" name="_050_of33a_total_amount_claimed">
                                    <option value="">Choose option</option>
                                    <option value="A" <c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_050_of33a_total_amount_claimed" and item.detail eq "A"}'>selected</c:if></c:forEach>>Option A (Date, Currency, Amount)</option>
                                    <option value="B" <c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_050_of33a_total_amount_claimed" and item.detail eq "B"}'>selected</c:if></c:forEach>>Option B (Currency, Amount)</option>
                                </select>
                        </div>
                        
                        <div class="form-row" id="wrap_051_of33a_date" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                            <input type="text" id="_051_of33a_date" name="_051_of33a_date"
                                   maxlength="6" placeholder="YYMMDD"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_051_of33a_date"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_052_of33a_currency" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                            <input type="text" id="_052_of33a_currency" name="_052_of33a_currency"
                                   maxlength="3"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_052_of33a_currency"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_053_of33a_amount" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input type="text" id="_053_of33a_amount" name="_053_of33a_amount"
                                   maxlength="15"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_053_of33a_amount"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- OF57a Account With Bank -->
                        <div class="form-row"><span class="label_body">OF57a</span><span class="label">Account With Bank</span>
                            <select id="_060_of57a_account_with_bank" name="_060_of57a_account_with_bank" onchange="toggle57aOption(this.value)">
                                <option value="">choose option</option>
                                <option value="A" <c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_060_of57a_account_with_bank" and item.detail eq "A"}'>selected</c:if></c:forEach>>Option A (Identifier Code)</option>
                                <option value="B" <c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_060_of57a_account_with_bank" and item.detail eq "B"}'>selected</c:if></c:forEach>>Option B (Location)</option>
                                <option value="D" <c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_060_of57a_account_with_bank" and item.detail eq "D"}'>selected</c:if></c:forEach>>Option D (Name &amp; Address)</option>
                            </select>
                        </div>

                        <div class="form-row" id="wrap_061_of57a_party_identifier" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_061_of57a_party_identifier" name="_061_of57a_party_identifier"
                                   maxlength="35"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_061_of57a_party_identifier"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_062_of57a_identifier_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_062_of57a_identifier_code" name="_062_of57a_identifier_code"
                                   maxlength="11"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_062_of57a_identifier_code"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>
                        
                        <div class="form-row" id="wrap_063_of57a_location" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                            <textarea id="_063_of57a_location" name="_063_of57a_location" 
                                      maxlength="35"><c:forEach var='item' items='${tags}'>
                                    <c:if test='${item.tagName eq "_063_of57a_location"}'>
                                        <c:out value='${item.detail}'/>
                                    </c:if>
                                </c:forEach></textarea>

                        </div>

                        <div class="form-row" id="wrap_064_of57a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_064_of57a_name_address" name="_064_of57a_name_address"
                                      rows="4" maxlength="140"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_064_of57a_name_address'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>
                        
                        <!-- OF72Z Sender to Receiver Information -->
                        <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                            <textarea name="_070_of72z_sender_to_receiver_information"
                                      id="_070_of72z_sender_to_receiver_information"
                                      rows="6" maxlength="210"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_070_of72z_sender_to_receiver_information"}'>
                                    <c:out value='${item.detail}' />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>
                        
                        <!-- MF77J Discrepancies -->
                        <div class="form-row"><span class="label_body">MF77J</span><span class="label"><a style="color:red;text-decoration:none">*</a>Discrepancies</span>
                            <textarea name="_080_mf77j_discrepancies"
                                      id="_080_mf77j_discrepancies" 
                                      rows="6" maxlength="3500" 
                                      class="mandatory"><c:forEach var='item' items='${tags}'>
                                    <c:if test='${item.tagName eq "_080_mf77j_discrepancies"}'>
                                        <c:out value='${item.detail}'/>
                                    </c:if>
                                </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- MF77B Disposal of Documents -->
                        <div class="form-row"><span class="label_body">MF77B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Disposal of Documents</span>
                            <textarea name="_090_mf77b_disposal_of_documents"
                                      id="_090_mf77b_disposal_of_documents"
                                      rows="3" maxlength="105"
                                      class="mandatory"><c:forEach var='item' items='${tags}'>
                                    <c:if test='${item.tagName eq "_090_mf77b_disposal_of_documents"}'>
                                        <c:out value='${item.detail}'/>
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
<%@ include file="rule/validate_rule_mt734.jsp" %>
</body>
</html>

