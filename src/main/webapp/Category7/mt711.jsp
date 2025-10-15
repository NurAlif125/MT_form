<%-- 
    Document   : mt711
    Created on : Sep 3, 2025, 11:34:50 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT711 Advice of a Third Bank's or a Non-Bank's Documentary Credit</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt711.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt711.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT711 Advice of a Third Bank's or a Non-Bank's Documentary Credit</h2></div>
    <form id="form_mt711" method="post" 
          action="${pageContext.request.contextPath}/MT711Servlet"
          autocomplete="off"
          onsubmit="return validateMT711() && confirm('Do you want to save this MT711 data?');">

        <input type="hidden" name="messageType" value="711"/>

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

                    <!-- MF20 Sender's Reference -->
                    <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Sender's Reference</span>
                        <input type="text" onkeypress="avoidSplChars(event)" name="_020_mf20_sender_reference" id="_020_mf20_sender_reference" class="mandatory" maxlength="16" input_type="MF20 Sender's Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF21 Documentary Credit Number -->
                    <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Documentary Credit Number</span>
                        <input type="text" name="_030_mf21_documentary_credit_number" id="_030_mf21_documentary_credit_number" class="mandatory" maxlength="16" input_type="MF21 Documentary Credit Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf21_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- OF45A Description of Goods and/or Services -->
                    <div class="form-row"><span class="label_body">OF45A</span><span class="label">Description of Goods and/or Services</span>
                        <textarea name="_040_of45a_description_of_goods_and_or_services" id="_040_of45a_description_of_goods_and_or_services" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of45a_description_of_goods_and_or_services'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF46A Documents Required -->
                    <div class="form-row"><span class="label_body">OF46A</span><span class="label">Documents Required</span>
                        <textarea name="_050_of46a_documents_required" id="_050_of46a_documents_required" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of46a_documents_required'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF47A Additional Conditions -->
                    <div class="form-row"><span class="label_body">OF47A</span><span class="label">Additional Conditions</span>
                        <textarea name="_060_of47a_additional_conditions" id="_060_of47a_additional_conditions" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of47a_additional_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF49G Special Payment Conditions for Beneficiary -->
                    <div class="form-row"><span class="label_body">OF49G</span><span class="label">Special Payment Conditions for Beneficiary</span>
                        <textarea name="_070_of49g_special_payment_conditions_for_beneficiary" id="_070_of49g_special_payment_conditions_for_beneficiary" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of49g_special_payment_conditions_for_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF49H Special Payment Conditions for Bank Only -->
                    <div class="form-row"><span class="label_body">OF49H</span><span class="label">Special Payment Conditions for Bank Only</span>
                        <textarea name="_080_of49h_special_payment_conditions_for_bank_only" id="_080_of49h_special_payment_conditions_for_bank_only" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of49h_special_payment_conditions_for_bank_only'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
<%@ include file="rule/validate_rule_mt711.jsp" %>
</body>
</html>

