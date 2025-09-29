<%-- 
    Document   : mt747
    Created on : Sep 12, 2025, 9:54:32 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT747 Amendment to an Authorisation to Reimburse</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt747.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt747.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT747 Amendment to an Authorisation to Reimburse</h2></div>
    <form id="form_mt747" method="post" 
          action="${pageContext.request.contextPath}/MT747Servlet"
          autocomplete="off"
          onsubmit="return validateMT747() && confirm('Do you want to save this MT747 data?');">

        <input type="hidden" name="messageType" value="747"/>

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
                            <input type="text" name="_010_mf20_documentary_credit_number" id="_010_mf20_documentary_credit_number" class="mandatory" maxlength="16" input_type="MF20 Documentary Credit Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF21 Reimbursing Bank's Reference -->
                        <div class="form-row"><span class="label_body">OF21</span><span class="label">Reimbursing Bank's Reference</span>
                            <input type="text" name="_020_of21_reimbursing_bank_reference" id="_020_of21_reimbursing_bank_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of21_reimbursing_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF30 Date of the Original Authorisation to Reimburse -->
                        <div class="form-row"><span class="label_body">MF30</span><span class="label"><a style="color:red;text-decoration:none">*</a> Date of the Original Authorisation to Reimburse</span>
                            <input type="text" name="_030_mf30_date_of_the_original_authorisation_to_reimburse" id="_030_mf30_date_of_the_original_authorisation_to_reimburse" class="mandatory" maxlength="6" placeholder="YYMMDD" input_type="MF30 Date of the Original Authorisation to Reimburse" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf30_date_of_the_original_authorisation_to_reimburse'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF31E New Date of Expiry -->
                        <div class="form-row"><span class="label_body">OF31E</span><span class="label">New Date of Expiry</span>
                            <input type="text" name="_040_of31e_new_date_of_expiry" id="_040_of31e_new_date_of_expiry" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of31e_new_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF32B Increase of Documentary Credit Amount -->
                        <div class="form-row"><span class="label_body">OF32B</span><span class="label">Increase of Documentary Credit Amount</span>
                            <input type="text" name="_050_of32b_currency" id="_050_of32b_currency" maxlength="3" placeholder="Currency" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            <input type="text" name="_051_of32b_amount" id="_051_of32b_amount" maxlength="15" placeholder="Amount" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF33B Decrease of Documentary Credit Amount -->
                        <div class="form-row"><span class="label_body">OF33B</span><span class="label">Decrease of Documentary Credit Amount</span>
                            <input type="text" name="_060_of33b_currency" id="_060_of33b_currency" maxlength="3" placeholder="Currency" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            <input type="text" name="_061_of33b_amount" id="_061_of33b_amount" maxlength="15" placeholder="Amount" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF34B New Documentary Credit Amount After Amendment -->
                        <div class="form-row"><span class="label_body">OF34B</span><span class="label">New Documentary Credit Amount After Amendment</span>
                            <input type="text" id="_070_of34b_currency" name="_070_of34b_currency" maxlength="3" placeholder="Currency" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of34b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            <input type="text" id="_071_of34b_amount" name="_071_of34b_amount" maxlength="15" placeholder="Amount" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of34b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF39A Percentage Credit Amount Tolerance -->
                        <div class="form-row"><span class="label_body">OF39A</span><span class="label">Percentage Credit Amount Tolerance</span>
                            <input type="number" name="_080_of39a_plus" id="_080_of39a_plus" min="0" max="99" placeholder="Plus %" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of39a_plus'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            <input type="number" name="_081_of39a_minus" id="_081_of39a_minus" min="0" max="99" placeholder="Minus %" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of39a_minus'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF39C Additional Amounts Covered -->
                        <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                            <textarea name="_090_of39c_additional_amounts_covered" id="_090_of39c_additional_amounts_covered" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of39c_additional_amounts_covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF72Z Sender to Receiver Information -->
                        <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                            <textarea name="_100_of72z_sender_to_receiver_information" id="_100_of72z_sender_to_receiver_information" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF77 Narrative -->
                        <div class="form-row"><span class="label_body">OF77</span><span class="label">Narrative</span>
                            <textarea name="_110_of77_narrative" id="_110_of77_narrative" rows="6" maxlength="700"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of77_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
<%@ include file="rule/validate_rule_mt747.jsp" %>
</body>
</html>

