<%-- 
    Document   : mt761
    Created on : Oct 1, 2025, 10:11:41 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT761 Issue of a Demand Guarantee/Standby Letter of Credit</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt761.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt761.js"></script>
    <style>
    body { 
        font-family: Arial, sans-serif; 
        padding: 20px; 
        background:#f9f9f9; 
    }

    .form-row { 
        margin-bottom: 12px; 
        display:flex; 
        align-items:flex-start; 
    }

    .label_body { 
        width: 100px; 
        font-weight: bold; 
    }

    .label { 
        width: 300px; 
        text-align:right; 
        margin-right:10px; 
    }

    .label a { 
        color:red; 
    }

    input, textarea, select { 
        padding:5px; 
        border:1px solid #999; 
        border-radius:4px; 
    }

    input.mandatory, textarea.mandatory, select.mandatory { 
        border: 1px solid #666; 
    }

    .tabs { 
        list-style: none; 
        margin: 0; 
        padding: 0; 
        display: flex; 
    }
    .tabs li { 
        margin-right: 10px; 
    }
    .tabs a { 
        text-decoration: none; 
        padding: 5px 10px; 
        border: 1px solid #ccc; 
        border-radius: 4px; 
    }
    .tabcontent { 
        display: none; 
    }
    .tabcontent.active { 
        display: block; 
    }

    .form-container {
        border:1px solid #ccc;
        border-radius:6px;
        overflow:hidden;  
        background:#fff;
        margin-top:10px;
    }

    .form-body { 
        padding:15px; 
        background:#fff; 
    }

    .footer {
        padding:12px;
        background:#2a7d80; 
        display:flex;
        justify-content:flex-start;
        gap:10px;
        border-top:1px solid #ccc;
    }

    .footer button {
        padding:8px 18px; 
        border:1px solid #aaa; 
        border-radius:4px;
        background:#f0f0f0; 
        color:#000; 
        font-weight:bold; 
        cursor:pointer;
    }
    .footer button:hover { 
        background:#e0e0e0; 
    }

    .mt-col { 
        flex: 1; 
        display:flex; 
        flex-direction:column; 
        gap:6px;      
    }

    .mt-col select,
    .mt-col input,
    .mt-col textarea {
        width: 100%;
    }

    .mt-row.multi { 
        flex-wrap:wrap; 
        gap:10px;
    }

    .mt-row.multi .mt-col { 
        flex:0 0 auto;
        min-width:180px;    
    }

    textarea {
        height: 100px;
        width: 300px;
        resize: vertical;      
    }
    </style>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT761 Issue of a Demand Guarantee/Standby Letter of Credit</h2></div>
    <form id="form_mt761" method="post" 
          action="${pageContext.request.contextPath}/MT761Servlet"
          autocomplete="off"
          onsubmit="return validateMT761() && confirm('Do you want to save this MT761 data?');">

        <input type="hidden" name="messageType" value="761"/>

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
                   
                        
                            <!--MF27 Sequence of Total-->
                            <!--Number-->
                            <div class="form-row"><span class="label_body">MF27</span><span class="label"><a style="color:red;text-decoration:none">*</a>Number</span>                                
                                <input type="text" onkeypress="avoidSplChars(event)" name="_010_mf27_number" id="_010_mf27_number" class="mandatory" maxlength="1" size="1" input_type="MF27 Sequence of Total" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--Total-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Total</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_011_mf27_total" id="_011_mf27_total" class="mandatory" maxlength="1" size="1" input_type="MF27 Sequence of Total" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--MF20 Undertaking Number-->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Undertaking Number</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_020_mf20_undertaking_number" id="_020_mf20_undertaking_number" class="mandatory" maxlength="16" input_type="MF20 Undertaking Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf20_undertaking_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--MF52a Issuer-->
                            <div class="form-row"><span class="label_body">MF52a </span><span class="label"><a style="color:red;text-decoration:none">*</a>Issuer</span>
                                <select id="_030_mf52a_issuer" name="_030_mf52a_issuer" class="mandatory" input_type="MF52a Issuer" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_mf52a_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_031_mf52a_party_identifier" id="_031_mf52a_party_identifier" maxlength="37" input_type="MF52a Issuer" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_032_mf52a_identifier_code" id="_032_mf52a_identifier_code" maxlength="11" class="mandatory" input_type="MF52a Issuer" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_mf52d_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_033_mf52d_party_identifier" id="_033_mf52d_party_identifier" maxlength="35" input_type="MF52a Issuer" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_mf52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_034_mf52d_name_address" id="_034_mf52d_name_address" input_type="MF52a Issuer" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_034_mf52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>        
                                    
                            <!--OF77U Undertaking Terms and Conditions-->
                            <div class="form-row"><span class="label_body">OF77U</span><span class="label">Undertaking Terms and Conditions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="150" maxlength="9750" style="resize:none;" name="_040_of77u_undertaking_terms_and_conditions" id="_040_of77u_undertaking_terms_and_conditions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of77u_undertaking_terms_and_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF77L Requested Local Undertaking Terms and Conditions-->
                            <div class="form-row"><span class="label_body">OF77L</span><span class="label">Requested Local Undertaking Terms and Conditions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="150" maxlength="9750" style="resize:none;" name="_050_of77l_requested_local_undertaking_terms_and_conditions" id="_050_of77l_requested_local_undertaking_terms_and_conditions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of77l_requested_local_undertaking_terms_and_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
<%@ include file="rule/validate_rule_mt761.jsp" %>
</body>
</html>




 

