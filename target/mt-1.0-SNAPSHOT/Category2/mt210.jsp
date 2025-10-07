<%-- 
    Document   : mt210
    Created on : Oct 1, 2025, 10:22:13 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT210 Notice to Receive</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt210.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt210.js"></script>
    <style>
    /* ==================== BASE STYLES ==================== */
    body { 
        font-family: Arial, sans-serif; 
        padding: 20px; 
        background: #f7fbfc; 
    }

    h2 {
        margin: 0 0 10px 0;
    }

    /* ==================== FORM ROW ==================== */
    .form-row { 
        margin-bottom: 12px; 
        display: flex; 
        align-items: flex-start;
        gap: 12px;
    }

    .label_body { 
        width: 100px; 
        font-weight: bold; 
        color: #57656b;
    }

    .label { 
        width: 300px; 
        text-align: right; 
        margin-right: 10px; 
        color: #33434a;
    }

    .label a { 
        color: #d33; 
        text-decoration: none;
    }

    /* ==================== INPUT FIELDS ==================== */
    input, textarea, select { 
        padding: 6px; 
        border: 1px solid #98a6ad; 
        border-radius: 4px; 
        font-family: Arial, sans-serif;
        background: #eef7fb;
    }

    textarea {
        resize: vertical;
    }

    input.mandatory, textarea.mandatory, select.mandatory { 
        border: 2px solid #666; 
        background-color: #fffef0;
    }

    input:focus, textarea:focus, select:focus {
        outline: none;
        border-color: #4CAF50;
        box-shadow: 0 0 5px rgba(76, 175, 80, 0.3);
    }

    input[readonly], textarea[readonly] {
        background-color: #f0f0f0;
        cursor: not-allowed;
    }

    /* ==================== TABS ==================== */
    .tabs { 
        list-style: none; 
        margin: 0 0 10px 0; 
        padding: 0; 
        display: flex; 
        flex-wrap: wrap;
    }

    .tabs li { 
        margin-right: 10px; 
        margin-bottom: 5px;
    }

    .tabs a { 
        text-decoration: none; 
        padding: 8px 15px; 
        border: 1px solid #ccc; 
        border-radius: 4px; 
        background-color: #f5f5f5;
        color: #333;
        display: inline-block;
        transition: background-color 0.2s;
    }

    .tabs a:hover {
        background-color: #e0e0e0;
    }

    .tabs a.selected {
        background-color: #4CAF50;
        color: white;
        border-color: #4CAF50;
    }

    /* ==================== TAB CONTENT ==================== */
    .tabcontent { 
        display: none; 
    }

    .tabcontent.active { 
        display: block; 
    }

    /* ==================== FORM CONTAINER ==================== */
    .form-container {
        border: 1px solid #cdd3d5;
        border-radius: 6px;
        overflow: hidden;  
        background: #fff;
        margin-top: 10px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .form-body { 
        padding: 15px; 
        background: #fff; 
    }

    /* ==================== FOOTER ==================== */
    .footer {
        padding: 12px;
        background: #2a7d80; 
        display: flex;
        justify-content: flex-start;
        gap: 10px;
        border-top: 1px solid #cdd3d5;
    }

    .footer button {
        padding: 8px 18px; 
        border: 1px solid #aaa; 
        border-radius: 6px;
        background: #eef0f1; 
        color: #000; 
        font-weight: bold; 
        cursor: pointer;
        transition: background-color 0.2s;
    }

    .footer button:hover { 
        background: #e0e0e0; 
    }

    .footer button:active {
        background: #d0d0d0;
    }

    /* ==================== MT COL ==================== */
    .mt-col { 
        flex: 1; 
        display: flex; 
        flex-direction: column; 
        gap: 6px;      
    }

    .mt-col select,
    .mt-col input,
    .mt-col textarea {
        width: 100%;
    }

    .mt-row.multi { 
        flex-wrap: wrap; 
        gap: 10px;
    }

    .mt-row.multi .mt-col { 
        flex: 0 0 auto;
        min-width: 180px;
    }

    /* ==================== REPETITIVE SEQUENCE STYLES ==================== */
    .transaction-sequence {
        border: 2px solid #4CAF50;
        padding: 15px;
        margin: 20px 0;
        background-color: #f9fff9;
        border-radius: 5px;
        position: relative;
    }

    .transaction-header {
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        margin: -15px -15px 15px -15px;
        border-radius: 3px 3px 0 0;
        font-weight: bold;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .transaction-header span {
        font-size: 16px;
    }

    .remove-transaction-btn {
        background-color: #f44336;
        color: white;
        border: none;
        padding: 5px 15px;
        cursor: pointer;
        border-radius: 3px;
        font-size: 12px;
        font-weight: bold;
        transition: background-color 0.2s;
    }

    .remove-transaction-btn:hover {
        background-color: #da190b;
    }

    .remove-transaction-btn:active {
        background-color: #c41408;
    }

    .add-transaction-btn {
        background-color: #2196F3;
        color: white;
        border: none;
        padding: 12px 20px;
        cursor: pointer;
        border-radius: 5px;
        font-size: 14px;
        font-weight: bold;
        margin: 20px 0;
        width: 100%;
        transition: background-color 0.2s;
    }

    .add-transaction-btn:hover {
        background-color: #0b7dda;
    }

    .add-transaction-btn:active {
        background-color: #0a6bc4;
    }

    .add-transaction-btn:disabled {
        background-color: #cccccc;
        cursor: not-allowed;
        opacity: 0.6;
    }

    .transaction-count-info {
        background-color: #2196F3;
        color: white;
        padding: 10px;
        text-align: center;
        border-radius: 5px;
        margin-bottom: 15px;
        font-weight: bold;
        font-size: 14px;
    }

    /* ==================== SECTIONS ==================== */
    .section-title {
        margin: 14px 0 8px 0;
        font-size: 15px;
        color: #1b3942;
    }

    .loop-header {
        font-weight: bold;
        margin: 8px 0 6px 0;
        color: #1f4c56;
    }

    .non-repetitive-section {
        background-color: #e3f2fd;
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 5px;
        border: 1px solid #90caf9;
    }

    .non-repetitive-section h3 {
        margin-top: 0;
        color: #1976d2;
        font-size: 16px;
        margin-bottom: 15px;
    }

    .set-box {
        border: 1px dashed #bdd3d9;
        padding: 10px;
        border-radius: 6px;
        background: #fbfeff;
        margin-bottom: 10px;
    }

    .small-note {
        font-size: 12px;
        color: #6a7a80;
    }

    /* ==================== AMOUNT DISPLAY ==================== */
    .amount-display {
        margin-left: 20px;
        font-size: 14px;
        color: #f44336;
        font-weight: bold;
        display: inline-block;
        min-width: 150px;
    }

    /* ==================== ERROR STYLES ==================== */
    label.error {
        color: #f44336;
        font-size: 12px;
        display: block;
        margin-top: 3px;
        margin-left: 0;
    }

    input.error, textarea.error, select.error {
        border-color: #f44336 !important;
        background-color: #fff5f5 !important;
    }

    .error-container {
        margin-top: 20px;
        padding: 15px;
        background-color: #fff5f5;
        border: 1px solid #f44336;
        border-radius: 5px;
    }

    .error-container h4 {
        color: #f44336;
        margin-top: 0;
    }

    /* ==================== VALIDATION TABLE ==================== */
    #error-container table {
        width: 100%;
        border-collapse: collapse;
        font-size: 8pt;
    }

    #error-container th {
        background-color: #d6d6d6;
        padding: 8px;
        text-align: left;
        font-weight: bold;
    }

    #error-container td {
        padding: 5px;
        border-bottom: 1px solid #e0e0e0;
    }

    #error-container tr:hover {
        background-color: #f6f6f6;
    }

    .error__row {
        cursor: pointer;
    }

    /* ==================== RESPONSIVE ==================== */
    @media (max-width: 768px) {
        .form-row {
            flex-direction: column;
        }

        .label_body, .label {
            width: 100%;
            text-align: left;
            margin-bottom: 5px;
        }

        .tabs {
            flex-direction: column;
        }

        .tabs li {
            margin-right: 0;
            width: 100%;
        }

        .tabs a {
            display: block;
            text-align: center;
        }

        .transaction-header {
            flex-direction: column;
            gap: 10px;
        }

        .remove-transaction-btn {
            width: 100%;
        }
    }

    /* ==================== UTILITY CLASSES ==================== */
    .hidden {
        display: none !important;
    }

    .text-center {
        text-align: center;
    }

    .text-right {
        text-align: right;
    }

    .mt-10 {
        margin-top: 10px;
    }

    .mt-20 {
        margin-top: 20px;
    }

    .mb-10 {
        margin-bottom: 10px;
    }

    .mb-20 {
        margin-bottom: 20px;
    }

    hr {
        border: none;
        border-top: 1px solid #e4ecef;
        margin: 15px 0;
    }

    /* ==================== LOADING INDICATOR ==================== */
    .loading {
        display: inline-block;
        width: 20px;
        height: 20px;
        border: 3px solid #f3f3f3;
        border-top: 3px solid #4CAF50;
        border-radius: 50%;
        animation: spin 1s linear infinite;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    /* ==================== TOOLTIP ==================== */
    .tooltip {
        position: relative;
        display: inline-block;
    }

    .tooltip .tooltiptext {
        visibility: hidden;
        width: 200px;
        background-color: #555;
        color: #fff;
        text-align: center;
        border-radius: 6px;
        padding: 5px;
        position: absolute;
        z-index: 1;
        bottom: 125%;
        left: 50%;
        margin-left: -100px;
        opacity: 0;
        transition: opacity 0.3s;
        font-size: 12px;
    }

    .tooltip:hover .tooltiptext {
        visibility: visible;
        opacity: 1;
    }

    /* ==================== PRINT STYLES ==================== */
    @media print {
        .tabs, .footer, .add-transaction-btn, .remove-transaction-btn {
            display: none !important;
        }

        .transaction-sequence {
            page-break-inside: avoid;
        }

        body {
            background: white;
        }
    }

    /* ==================== ACTION LINKS ==================== */
    .action-link {
        color: #307aa6;
        text-decoration: underline;
        cursor: pointer;
        margin-right: 15px;
        font-size: 12px;
    }

    .action-link:hover {
        color: #1f5a7a;
    }
    </style>
</head>
<body>

<div id="isi">
    <div id="judul"><h2>MT210 Notice to Receive</h2></div>
    <form id="form_mt210" method="post" 
          action="${pageContext.request.contextPath}/MT210Servlet"
          autocomplete="off"
          onsubmit="return validateMT210() && confirm('Do you want to save this MT210 data?');">

        <input type="hidden" name="messageType" value="210"/>

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
                        
                        <!-- MF20 Transaction Reference Number -->
                        <div class="form-row">
                            <span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Transaction Reference Number</span>
                            <input type="text" name="_010_mf20_transactions_reference_number" id="_010_mf20_transactions_reference_number" maxlength="16" class="mandatory" input_type="MF20 Transaction Reference Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_transactions_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF25 Account Identification -->
                        <div class="form-row">
                            <span class="label_body">OF25</span><span class="label">Account Identification</span>
                            <input type="text" name="_020_of25_account_identification" id="_020_of25_account_identification" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of25_account_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF30 Value Date -->
                        <div class="form-row">
                            <span class="label_body">MF30</span><span class="label"><a style="color:red;text-decoration:none">*</a>Value Date</span>
                            <input type="text" name="_030_mf30_value_date" id="_030_mf30_value_date" maxlength="6" class="mandatory" input_type="MF30 Value Date" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf30_value_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                    <input type="hidden" id="setCount" name="setCount" value="1"/>
                    
                    <div id="setsContainer">
                        <div class="set-box" data-index="0" id="set_0">
                            <div class="loop-header">Set #1</div>
                            
                            <!-- MF21 Related Reference -->
                            <div class="form-row">
                                <span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Related Reference</span>
                                <input type="text" name="_040_mf21_related_references" id="_040_mf21_related_references" maxlength="16" class="mandatory" input_type="MF21 Related Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf21_related_references'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF32B Currency Code, Amount -->
                            <div class="form-row">
                                <span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency Code</span>
                                <input type="text" name="_050_mf32b_currency" id="_050_mf32b_currency" maxlength="3" class="mandatory" input_type="MF32B Currency Code Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>                            
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>                             
                                <input type="text" name="_051_mf32b_amount" id="_051_mf32b_amount" maxlength="15" class="mandatory" input_type="MF32B Currency Code Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- OF50a Ordering Customer -->
                            <div class="form-row">
                                <span class="label_body">OF50a</span><span class="label">Ordering Customer</span>
                                <select id="_060_of50a_ordering_customer" name="_060_of50a_ordering_customer">
                                    <option value="">choose a type</option>
                                    <option value="a">No Letter - Name and Address</option> 
                                    <option value="c">C - Identifier Code</option>
                                    <option value="f">F - Party Identifier - Name and Address</option>
                                </select>
                                
                                <!-- Option A: Name and Address -->
                                <div id="div_of50_ordering_customer" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_061_of50a_name_address" id="_061_of50a_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of50a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                
                                <!-- Option C: Identifier Code -->
                                <div id="div_of50c_ordering_customer" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_062_of50c_identifier_code" id="_062_of50c_identifier_code" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of50c_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                
                                <!-- Option F: Party Identifier -->
                                <div id="div_of50f_ordering_customer" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_063_of50f_party_identifier" id="_063_of50f_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of50f_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <div class="form-row">
                                            <span class="label_body">&nbsp;</span><span class="label">Number</span>
                                            <select id="_064_of50f_number" name="_064_of50f_number">
                                                <option value="">CHOOSE A TYPE</option>
                                                <option value="ARNU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='ARNU'}"> selected="true" </c:if></c:if></c:forEach>>ARNU - Alien Registration Number</option>
                                                <option value="CCPT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='CCPT'}"> selected="true" </c:if></c:if></c:forEach>>CCPT - Passport Number</option>
                                                <option value="CUST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='CUST'}"> selected="true" </c:if></c:if></c:forEach>>CUST - Customer Identification Number</option>
                                                <option value="DRLC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='DRLC'}"> selected="true" </c:if></c:if></c:forEach>>DRLC - Driver's Licence Number</option>
                                                <option value="EMPL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='EMPL'}"> selected="true" </c:if></c:if></c:forEach>>EMPL - Employer Number</option>
                                                <option value="NIDN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='NIDN'}"> selected="true" </c:if></c:if></c:forEach>>NIDN - National Identity Number</option>
                                                <option value="SOSE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='SOSE'}"> selected="true" </c:if></c:if></c:forEach>>SOSE - Social Security Number</option>
                                                <option value="TXID" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='TXID'}"> selected="true" </c:if></c:if></c:forEach>>TXID - Tax Identification Number</option>
                                            </select>
                                        </div>
                                        <div class="form-row">
                                            <span class="label_body">&nbsp;</span><span class="label">Details</span>
                                            <input type="text" name="_065_of50f_details" id="_065_of50f_details" maxlength="33" minlength="1" size="33" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>        
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF52A Ordering Institution -->
                            <div class="form-row">
                                <span class="label_body">OF52A</span><span class="label">Ordering Institution</span>
                                <select id="_070_of52A_ordering_institution" name="_070_of52A_ordering_institution">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Ordering Institution - BIC</option>
                                    <option value="d">D - Ordering Institution - Name and Address</option>
                                </select>
                                
                                <!-- Option A: BIC -->
                                <div id="div_of52a_ordering_institution" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_071_of52a_party_identifier" id="_071_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_072_of52a_identifier_code" id="_072_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                
                                <!-- Option D: Name and Address -->
                                <div id="div_of52d_ordering_institution" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_073_of52d_party_identifier" id="_073_of52d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_074_of52d_name_address" id="_074_of52d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_074_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF56a Intermediary -->
                            <div class="form-row">
                                <span class="label_body">OF56A</span><span class="label">Intermediary Institution</span>
                                <select id="_080_of56a_intermediary" name="_080_of56a_intermediary">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Party Identifier - Identifier Code</option>
                                    <option value="d">D - Party Identifier - name and address</option>
                                </select>
                                
                                <!-- Option A: Identifier Code -->
                                <div id="div_of56a_intermediary" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_081_of56a_party_identifier" id="_081_of56a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_082_of56a_identifier_code" id="_082_of56a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                
                                <!-- Option D: Name and Address -->
                                <div id="div_of56d_intermediary" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_083_of56d_party_identifier" id="_083_of56d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_084_of56d_name_address" id="_084_of56d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                        </div>
                    </div>
                                    
                    <div style="margin-top: 15px;">
                        <span id="addSet" class="action-link" style="cursor:pointer; color:blue; text-decoration:underline;">Add Loop</span>
                        <span id="removeSet" class="action-link" style="cursor:pointer; color:red; text-decoration:underline;">Remove Last Set</span>
                    </div>
                                    
                </div>
            </div>
                    
            <div class="footer">
                <button type="submit">Save</button>
                <button type="button" onclick="window.location.href='../index.jsp'">Back</button>
            </div>
        </div>
    </form>
</div>

<%@ include file="rule/validate_rule_mt210.jsp" %>

</body>
</html>




 