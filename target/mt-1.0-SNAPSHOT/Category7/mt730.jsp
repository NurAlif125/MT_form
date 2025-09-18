<%-- 
    Document   : mt730
    Created on : Sep 12, 2025, 9:53:44 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT730 Acknowledgement</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt730.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt730.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT730 Acknowledgement</h2></div>
    <form id="form_mt730" method="post" 
          action="${pageContext.request.contextPath}/MT730Servlet"
          autocomplete="off"
          onsubmit="return validateMT730() && confirm('Do you want to save this MT730 data?');">

        <input type="hidden" name="messageType" value="730"/>

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
                        <div class="form-row">
                            <span class="label_body">MF20</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a> Sender's Reference</span>
                            <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference"
                                class="mandatory" maxlength="16"
                                onkeypress="avoidSplChars(event)"
                                value="<c:forEach var='item' items='${tags}'>
                                           <c:if test='${item.tagName eq "_010_mf20_sender_reference"}'>
                                        <c:out value='${item.detail}'/>
                                    </c:if>
                                </c:forEach>"/>
                        </div>
                        <hr/>
                        
                        <!-- MF21 Receiver's Reference -->
                        <div class="form-row">
                            <span class="label_body">MF21</span>
                            <span class="label"><a style="color:red">*</a> Receiver's Reference</span>
                            <input type="text" name="_020_mf21_receiver_reference" id="_020_mf21_receiver_reference"
                                   class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_020_mf21_receiver_reference"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <hr/>
                        
                        <!-- OF25 Account Identification -->
                        <div class="form-row">
                            <span class="label_body">OF25</span>
                            <span class="label">Account Identification</span>
                            <input type="text" name="_030_of25_account_identification" id="_030_of25_account_identification"
                                   maxlength="35"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_030_of25_account_identification"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <hr/>
                        
                        <!-- MF30 Date of Message Being Acknowledged -->
                        <div class="form-row">
                            <span class="label_body">MF30</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a> Date of Message Being Acknowledged</span>
                            <input type="text" name="_040_mf30_date_of_message_being_acknowledged" id="_040_mf30_date_of_message_being_acknowledged"
                                   class="mandatory" maxlength="6" placeholder="YYMMDD"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_040_mf30_date_of_message_being_acknowledged"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <hr/>

                        <!-- OF32a Amount of Charges -->
                        <div class="form-row">
                            <span class="label_body">OF32a</span>
                            <span class="label">Amount of Charges</span>
                            <select id="_050_of32a_amount_of_charges" name="_050_of32a_amount_of_charges" onchange="toggle32aOption(this.value)">
                                <option value="">choose a type</option>
                                <option value="B"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_050_of32a_amount_of_charges' and item.detail eq 'B'}">selected</c:if>
                                    </c:forEach>>
                                    Option B (Currency + Amount)
                                </option>
                                <option value="D"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_050_of32a_amount_of_charges' and item.detail eq 'D'}">selected</c:if>
                                    </c:forEach>>
                                    Option D (Date + Currency + Amount)
                                </option>
                            </select>
                        </div>
                        
                        <div class="form-row" id="wrap_051_of32a_date" style="display:none;">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Date</span>
                            <input type="text" id="_051_of32a_date" name="_051_of32a_date"
                                   maxlength="6" placeholder="YYMMDD"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_051_of32a_date"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_052_of32a_currency" style="display:none;">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Currency</span>
                            <input type="text" id="_052_of32a_currency" name="_052_of32a_currency"
                                   maxlength="3"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_052_of32a_currency"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_053_of32a_amount" style="display:none;">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Amount</span>
                            <input type="text" id="_053_of32a_amount" name="_053_of32a_amount"
                                   maxlength="15"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_053_of32a_amount"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- OF57a Account With Bank -->
                        <div class="form-row">
                            <span class="label_body">OF57a</span>
                            <span class="label">Account With Bank</span>
                            <select id="_060_of57a_account_with_bank" name="_060_of57a_account_with_bank" onchange="toggle57aOption(this.value)">
                                <option value="">choose a type</option>
                                <option value="A"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_060_of57a_account_with_bank' and item.detail eq 'A'}">selected</c:if>
                                    </c:forEach>>
                                    Option A (BIC)
                                </option>
                                <option value="D"
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName eq '_060_of57a_account_with_bank' and item.detail eq 'D'}">selected</c:if>
                                    </c:forEach>>
                                    Option D (Name &amp; Address)
                                </option>
                            </select>
                        </div>

                        <div class="form-row" id="wrap_061_of57a_party_identifier" style="display:none;">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Party Identifier</span>
                            <input type="text" id="_061_of57a_party_identifier" name="_061_of57a_party_identifier"
                                   maxlength="35"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_061_of57a_party_identifier"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_062_of57a_identifier_code" style="display:none;">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_062_of57a_identifier_code" name="_062_of57a_identifier_code"
                                   maxlength="11"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_062_of57a_identifier_code"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>" />
                        </div>

                        <div class="form-row" id="wrap_063_of57a_name_address" style="display:none;">
                            <span class="label_body">&nbsp;</span>
                            <span class="label">Name &amp; Address</span>
                            <textarea id="_063_of57a_name_address" name="_063_of57a_name_address"
                                      rows="4" maxlength="140"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_063_of57a_name_address'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>
                        
                        <!-- OF71D Charges -->
                        <div class="form-row">
                            <span class="label_body">OF71D</span>
                            <span class="label">Charges</span>
                            <textarea name="_070_of71d_charges"
                                      id="_070_of71d_charges"
                                      rows="6" maxlength="210"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_070_of71d_charges"}'>
                                    <c:out value='${item.detail}' />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF72Z Sender to Receiver Information -->
                        <div class="form-row">
                            <span class="label_body">OF72Z</span>
                            <span class="label">Sender to Receiver Information</span>
                            <textarea name="_080_of72z_sender_to_receiver_information"
                                      id="_080_of72z_sender_to_receiver_information"
                                      rows="6" maxlength="210"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_080_of72z_sender_to_receiver_information"}'>
                                    <c:out value='${item.detail}' />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>
                        
                        <!-- OF79Z Narrative -->
                        <div class="form-row">
                            <span class="label_body">OF79Z</span>
                            <span class="label">Narrative</span>
                            <textarea name="_090_of79z_narrative" id="_090_of79z_narrative"
                                      rows="6" maxlength="1750"><c:forEach var='item' items='${tags}'>
                                <c:if test='${item.tagName eq "_090_of79z_narrative"}'>
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
<%@ include file="rule/validate_rule_mt730.jsp" %>
</body>
</html>
