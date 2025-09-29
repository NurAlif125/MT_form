<%-- 
    Document   : mt759
    Created on : Sep 24, 2025, 9:00:16 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT759 Ancillary Trade Structured Message</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt759.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt759.js"></script>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT759 Ancillary Trade Structured Message</h2></div>
    <form id="form_mt759" method="post" 
          action="${pageContext.request.contextPath}/MT759Servlet"
          autocomplete="off"
          onsubmit="return validateMT759() && confirm('Do you want to save this MT759 data?');">

        <input type="hidden" name="messageType" value="759"/>

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
                        <div class="form-row"><span class="label_body">MF27</span><span class="label"><a style="color:red;text-decoration:none">*</a>Sequence of Total</span>
                            <input type="text" name="_010_mf27_sequence_of_total" id="_010_mf27_sequence_of_total" class="mandatory" maxlength="5" input_type="MF27 Sequence of Total" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf27_sequence_of_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- MF20 Transaction Reference Number -->
                        <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Transaction Reference Number</span>
                            <input type="text" name="_020_mf20_transaction_reference_number" id="_020_mf20_transaction_reference_number" class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)" input_type="MF20 Transaction Reference Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf20_transaction_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- OF21 Related Reference Number -->
                        <div class="form-row"><span class="label_body">OF21</span><span class="label">Related Reference Number</span>
                            <input type="text" name="_030_of21_related_reference_number" id="_030_of21_related_reference_number" maxlength="16" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of21_related_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF22D Form of Undertaking -->
                        <div class="form-row"><span class="label_body">MF22D</span><span class="label"><a style="color:red;text-decoration:none">*</a>Form of Undertaking</span>
                            <select name="_040_mf22d_form_of_undertaking" id="_040_mf22d_form_of_undertaking" class="mandatory" input_type="MF22D Form of Undertaking" location="Body">
                                <option value="">choose a type</option>
                                <option value="DGAR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='DGAR'}"> selected="true" </c:if></c:if></c:forEach>>DGAR - Demand Guarantee</option>
                                <option value="DOCR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='DOCR'}"> selected="true" </c:if></c:if></c:forEach>>DOCR - Documentary Credit</option>
                                <option value="STBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='STBY'}"> selected="true" </c:if></c:if></c:forEach>>STBY - Standby Letter of Credit</option>
                                <option value="UNDK" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='UNDK'}"> selected="true" </c:if></c:if></c:forEach>>UNDK - Undertaking</option>
                            </select>
                        </div>
                        <hr/>

                        <!-- OF23 Undertaking Number -->
                        <div class="form-row"><span class="label_body">OF23</span><span class="label">Undertaking Number</span>
                            <input type="text" name="_050_of23_undertaking_number" id="_050_of23_undertaking_number" maxlength="16" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of23_undertaking_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF52a Issuer -->
                        <div class="form-row"><span class="label_body">OF52a</span><span class="label">Issuer</span>
                            <select id="_060_of52a_issuer" name="_060_of52a_issuer" onchange="toggle52aOption(this.value)">
                                <option value="">choose a type</option>
                                <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of52a_issuer'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                                <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of52a_issuer'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                            </select>
                        </div>

                        <div class="form-row" id="wrap_061_of52a_party_identifier" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                            <input type="text" id="_061_of52a_party_identifier" name="_061_of52a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_062_of52a_identifier_code" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                            <input type="text" id="_062_of52a_identifier_code" name="_062_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row" id="wrap_063_of52a_name_address" style="display:none;"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                            <textarea id="_063_of52a_name_address" name="_063_of52a_name_address" rows="4" maxlength="140" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of52a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- MF23H Function of Message --> 
                        <div class="form-row"><span class="label_body">MF23H</span><span class="label"><a style="color:red;text-decoration:none">*</a>Function of Message</span>
                            <select name="_070_mf23h_function_of_message" id="_070_mf23h_function_of_message" class="mandatory" input_type="MF23H Function of Message" location="Body">
                                <option value="">choose a type</option>
                                <option value="CLSVCLOS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='CLSVCLOS'}"> selected="true" </c:if></c:if></c:forEach>>CLSVCLOS - Closing of Service Call</option>
                                <option value="CLSVOPEN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='CLSVOPEN'}"> selected="true" </c:if></c:if></c:forEach>>CLSVOPEN - Opening of Service Call</option>
                                <option value="FRAUDMSG" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='FRAUDMSG'}"> selected="true" </c:if></c:if></c:forEach>>FRAUDMSG - Fraud Attempt</option>
                                <option value="GENINFAD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='GENINFAD'}"> selected="true" </c:if></c:if></c:forEach>>GENINFAD - General Info</option>
                                <option value="ISSAMEND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='ISSAMEND'}"> selected="true" </c:if></c:if></c:forEach>>ISSAMEND - Amend Free-form Undertaking</option>
                                <option value="ISSUANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='ISSUANCE'}"> selected="true" </c:if></c:if></c:forEach>>ISSUANCE - Issue Free-form Undertaking</option>
                                <option value="OTHERFNC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='OTHERFNC'}"> selected="true" </c:if></c:if></c:forEach>>OTHERFNC - Other Request</option>
                                <option value="PREDENOT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='PREDENOT'}"> selected="true" </c:if></c:if></c:forEach>>PREDENOT - Pre-debit Notification</option>
                                <option value="REIMBURS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REIMBURS'}"> selected="true" </c:if></c:if></c:forEach>>REIMBURS - Reimbursement Request</option>
                                <option value="REQAMEND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REQAMEND'}"> selected="true" </c:if></c:if></c:forEach>>REQAMEND - Request to Amend</option>
                                <option value="REQFINAN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REQFINAN'}"> selected="true" </c:if></c:if></c:forEach>>REQFINAN - Financing Request</option>
                                <option value="REQISSUE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REQISSUE'}"> selected="true" </c:if></c:if></c:forEach>>REQISSUE - Request to Issue</option>
                                <option value="REXTMATU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REXTMATU'}"> selected="true" </c:if></c:if></c:forEach>>REXTMATU - Request Maturity Change</option>
                                <option value="TRANSFER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='TRANSFER'}"> selected="true" </c:if></c:if></c:forEach>>TRANSFER - Transfer of Undertaking</option>
                            </select>
                        </div>
                        <hr/>

                        <!-- MF45D Narrative --> 
                        <div class="form-row"><span class="label_body">MF45D</span><span class="label"><a style="color:red;text-decoration:none">*</a>Narrative</span>
                            <textarea name="_080_mf45d_narrative" id="_080_mf45d_narrative" rows="6" maxlength="9750" class="mandatory" input_type="MF45D Narrative" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf45d_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>
                        
                        <!-- OF23X File Identification -->
                        <div class="form-row"><span class="label_body">OF23X</span><span class="label">File Identification</span>
                            <select name="_090_of23x_file_identification" id="_090_of23x_file_identification">
                                <option value="">choose a code</option>
                                <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>COUR - Courier delivery</option>
                                <option value="EMAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='EMAL'}"> selected="true" </c:if></c:if></c:forEach>>EMAL - Email transfer</option>
                                <option value="FACT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='FACT'}"> selected="true" </c:if></c:if></c:forEach>>FACT - SWIFTNet FileAct</option>
                                <option value="FAXT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='FAXT'}"> selected="true" </c:if></c:if></c:forEach>>FAXT - Fax transfer</option>
                                <option value="HOST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='HOST'}"> selected="true" </c:if></c:if></c:forEach>>HOST - Host-to-Host</option>
                                <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>MAIL - Postal delivery</option>
                                <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR - Other delivery channel</option>
                            </select>
                            <input type="text" name="_091_of23x_file_name" id="_091_of23x_file_name" maxlength="65" placeholder="Filename or reference" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of23x_file_name'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
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
<%@ include file="rule/validate_rule_mt759.jsp" %>
</body>
</html>




 