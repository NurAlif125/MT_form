<%-- 
    Document   : mt767
    Created on : Oct 1, 2025, 10:11:49 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT767 Amendment to a Demand Guarantee/Standby Guarantee/Standby Letter of Credit</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt767.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt767.js"></script>
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
    <div id="judul"><h2>MT 767 Amendment to a Demand Guarantee/Standby Guarantee/Standby Letter of Credit</h2></div>
    <form id="form_mt767" method="post" 
          action="${pageContext.request.contextPath}/MT767Servlet"
          autocomplete="off"
          onsubmit="return validateMT767() && confirm('Do you want to save this MT767 data?');">

        <input type="hidden" name="messageType" value="767"/>

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
                   
                            <!--MAN A-->
                            <h2 class="header-title">Mandatory Sequence A General Information</h2>
                            <!--MF15A New Sequence-->
                            <div class="form-row"><span class="label_body">MF15A</span><span class="label"><a style="color:red;text-decoration:none">*</a>New Sequence</span>
                                <input name="_010_mf15a_new_sequence" id="_010_mf15a_new_sequence" class="mandatory" type="hidden" input_type="MF15A New Sequence" location="Body" value="" />
                            </div>
                            <hr/>

                            <!--MF27 Sequence of Total-->
                            <!--Number-->
                            <div class="form-row"><span class="label_body">MF27</span><span class="label"><a style="color:red;text-decoration:none">*</a>Number</span>                                
                                <input type="text" onkeypress="avoidSplChars(event)" name="_020_mf27_number" id="_020_mf27_number" class="mandatory" maxlength="1" size="1" input_type="MF27 Sequence of Total" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--Total-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Total</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_021_mf27_total" id="_021_mf27_total" class="mandatory" maxlength="1" size="1" input_type="MF27 Sequence of Total" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF21 Related Reference -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Related Reference</span>
                                <input type="text" name="_030_mf21_related_reference" id="_030_mf21_related_reference" class="mandatory" maxlength="16" input_type="MF21 Related Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!--MF22A Purpose of Message-->
                            <div class="form-row"><span class="label_body">MF22A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Purpose of Message</span>
                                <select name="_040_mf22a_purpose_of_message" id="_040_mf22a_purpose_of_message" class="mandatory" input_type="MF22A Purpose of Message" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="ACNA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ACNA'}"> selected="true" </c:if></c:if></c:forEach>>ACNA</option>
                                    <option value="ADVA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ADVA'}"> selected="true" </c:if></c:if></c:forEach>>ADVA</option>
                                    <option value="ICCA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ICCA'}"> selected="true" </c:if></c:if></c:forEach>>ICCA</option>
                                    <option value="ISCA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ISCA'}"> selected="true" </c:if></c:if></c:forEach>>ISCA</option>
                                    <option value="ISUA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ISUA'}"> selected="true" </c:if></c:if></c:forEach>>ISUA</option>
                                </select>
                            </div>
                            <hr/>

                            <!--OF23S Cancellation Request--> 
                            <div class="form-row"><span class="label_body">OF23S</span><span class="label">Cancellation Request</span>
                                <select name="_050_of23s_cancellation_request" id="_050_of23s_cancellation_request">
                                    <option value="">choose a type</option>
                                    <option value="CANCEL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of23s_cancellation_request'}"><c:if test="${item.detail=='CANCEL'}"> selected="true" </c:if></c:if></c:forEach>>CANCEL</option>
                                </select>
                            </div>
                            <hr/>

                            <!--OF72Z Sender to Receiver Information -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_060_of72Z_sender_receiver_information" id="_060_of72Z_sender_receiver_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of72Z_sender_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF23X File Identification-->
                            <div class="form-row"><span class="label_body">OF23X</span><span class="label">Codes</span>
                                <select name="_070_of23x_file_identification" id="_070_of23x_file_identification">
                                    <option value="">choose a type</option>
                                    <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of23x_file_identification'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>COUR</option>
                                    <option value="EMAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of23x_file_identification'}"><c:if test="${item.detail=='EMAL'}"> selected="true" </c:if></c:if></c:forEach>>EMAL</option>
                                    <option value="FACT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of23x_file_identification'}"><c:if test="${item.detail=='FACT'}"> selected="true" </c:if></c:if></c:forEach>>FACT</option>
                                    <option value="FAXT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of23x_file_identification'}"><c:if test="${item.detail=='FAXT'}"> selected="true" </c:if></c:if></c:forEach>>FAXT</option>
                                    <option value="HOST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of23x_file_identification'}"><c:if test="${item.detail=='HOST'}"> selected="true" </c:if></c:if></c:forEach>>HOST</option>
                                    <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of23x_file_identification'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>MAIL</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of23x_file_identification'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Usage Rules</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_071_of23x_file_name_or_reference" id="_071_of23x_file_name_or_reference" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of23x_file_name_or_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>

                            <h2 class="header-credit">End of Sequence A General Information</h2>

                            <!--MAN B-->
                            <h2 class="header-title">Mandatory Sequence B Undertaking Details</h2>

                            <!--MF15B New Sequence-->
                            <div class="form-row"><span class="label_body">MF15B</span><span class="label"><a style="color:red;text-decoration:none">*</a>New Sequence</span>
                                <input name="_080_mf15b_new_sequence" id="_080_mf15b_new_sequence" class="mandatory" type="hidden" input_type="MF15B New Sequence" location="Body" value="" />
                            </div>

                            <!--MF20 Undertaking Number-->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Undertaking Number</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_090_mf20_undertaking_number" id="_090_mf20_undertaking_number" class="mandatory" maxlength="16" input_type="MF20 Undertaking Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20_undertaking_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--MF26E Number of Amendment--> 
                            <div class="form-row"><span class="label_body">MF26E</span><span class="label"><a style="color:red;text-decoration:none">*</a>Number of Amendment</span>                                
                                <input type="text" onkeypress="avoidSplChars(event)" name="_100_mf26e_number_of_amendment" id="_100_mf26e_number_of_amendment" class="mandatory" maxlength="3" size="3" input_type="MF26E Number of Amendment" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf26e_number_of_amendment'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--MF30 Date of Amendment--> 
                            <div class="form-row"><span class="label_body">MF30</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Amendment</span>
                                <input type="text" name="_110_mf30_date_of_amendment" id="_110_mf30_date_of_amendment" class ="mandatory" maxlength="6" size="6" input_type="MF30 Date of Amendment" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_mf30_date_of_amendment'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--MF52a Issuer-->
                            <div class="form-row"><span class="label_body">MF52a </span><span class="label"><a style="color:red;text-decoration:none">*</a>Issuer</span>
                                <select id="_120_mf52a_issuer" name="_120_mf52a_issuer" class="mandatory" input_type="MF52a Issuer" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_mf52a_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_121_mf52a_party_identifier" id="_121_mf52a_party_identifier" maxlength="37" input_type="MF52a Issuer" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_mf52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_122_mf52a_identifier_code" id="_122_mf52a_identifier_code" maxlength="11" class="mandatory" input_type="MF52a Issuer" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_122_mf52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_mf52d_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_123_mf52d_party_identifier" id="_123_mf52d_party_identifier" maxlength="35" input_type="MF52a Issuer" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_123_mf52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_124_mf52d_name_address" id="_124_mf52d_name_address" input_type="MF52a Issuer" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_124_mf52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!-- OF23 Advising Bank Reference  -->
                            <div class="form-row"><span class="label_body">OF23</span><span class="label">Advising Bank Reference</span>
                                <input type="text" name="_130_of23_advising_bank_reference" id="_130_of23_advising_bank_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of23_advising_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF32B Increase of Undertaking Amount  -->
                            <div class="form-row"><span class="label_body">OF32B</span><span class="label">Currency</span>
                                <input type="text" name="_140_of32b_currency" id="_140_of32b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_141_of32b_amount" id="_141_of32b_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_of32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_koma(this)" />  
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_141_of32b_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(2);
                                    var nominalStylec = nominalStyle.fontcolor("red");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    document.write(nominalStylec);
                                </script>
                            </div>
                            <hr/>

                            <!--OF33B Decrease of Undertaking Amount-->
                            <div class="form-row"><span class="label_body">OF33B</span><span class="label">Currency</span>
                                <input type="text" name="_150_of33b_currency" id="_150_of33b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_151_of33b_amount" id="_151_of33b_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_151_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_koma(this)" /> 
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_151_of33b_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(2);
                                    var nominalStylec = nominalStyle.fontcolor("red");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    document.write(nominalStylec);
                                </script>
                            </div>
                            <hr/>

                            <!--OF23B Expiry Type-->
                            <div class="form-row"><span class="label_body">OF23B</span><span class="label">Expiry Type</span>
                                <select name="_160_of23b_expiry_type" id="_160_of23b_expiry_type">
                                    <option value="">choose a type</option>
                                    <option value="COND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of23b_expiry_type'}"><c:if test="${item.detail=='COND'}"> selected="true" </c:if></c:if></c:forEach>>COND</option>
                                    <option value="FIXD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of23b_expiry_type'}"><c:if test="${item.detail=='FIXD'}"> selected="true" </c:if></c:if></c:forEach>>FIXD</option>
                                    <option value="OPEN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of23b_expiry_type'}"><c:if test="${item.detail=='OPEN'}"> selected="true" </c:if></c:if></c:forEach>>OPEN</option>
                                </select>
                            </div>
                            <hr/>

                            <!--OF31E Date of Expiry-->
                            <div class="form-row"><span class="label_body">OF31E</span><span class="label">Date of Expiry</span>
                                <input type="text" name="_170_of31e_date_of_expiry" id="_170_of31e_date_of_expiry" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of31e_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--OF35G Expiry Condition/Event-->
                            <div class="form-row"><span class="label_body">OF35G</span><span class="label">Expiry Condition/Event</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_180_of35g_expiry_conditions_event" id="_180_of35g_expiry_conditions_event" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of35g_expiry_conditions_event'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF59a Beneficiary-->
                            <div class="form-row"><span class="label_body">OF59a</span><span class="label">Beneficiary</span>
                                <select id="_190_of59a_beneficiary" name="_190_of59a_beneficiary">
                                    <option value="">choose a type</option>
                                    <option value="no">Name and Address</option>
                                    <option value="a">A - BIC</option>
                                </select>
                                <div id="div_of59no_beneficiary">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_191_of59a_account" id="_191_of59a_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_191_of59a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_192_of59a_name_address" id="_192_of59a_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_192_of59a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of59a_beneficiary">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_193_of59a_account" id="_193_of59a_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_193_of59a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_194_of59a_identifier_code" id="_194_of59a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_194_of59a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--OF77U Other Amendments to Undertaking-->
                            <div class="form-row"><span class="label_body">OF77U</span><span class="label">Other Amendments to Undertaking</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="150" maxlength="9750" style="resize:none;" name="_200_of77u_other_amandments_to_undertaking" id="_200_of77u_other_amandments_to_undertaking" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of77u_other_amandments_to_undertaking'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF24E Delivery of Amendment To Undertaking-->
                            <!--Code-->
                            <div class="form-row"><span class="label_body">OF24E</span><span class="label">Delivery of Original Undertaking</span>
                                <select name="_210_of24e_delivery_of_amendment_to_undertaking" id="_210_of24e_delivery_of_amendment_to_undertaking">
                                    <option value="">choose a type</option>
                                    <option value="COLL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of24e_delivery_of_amendment_to_undertaking'}"><c:if test="${item.detail=='COLL'}"> selected="true" </c:if></c:if></c:forEach>>COLL</option>
                                    <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of24e_delivery_of_amendment_to_undertaking'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>COUR</option>
                                    <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of24e_delivery_of_amendment_to_undertaking'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>MAIL</option>
                                    <option value="MESS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of24e_delivery_of_amendment_to_undertaking'}"><c:if test="${item.detail=='MESS'}"> selected="true" </c:if></c:if></c:forEach>>MESS</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of24e_delivery_of_amendment_to_undertaking'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                    <option value="REGM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of24e_delivery_of_amendment_to_undertaking'}"><c:if test="${item.detail=='REGM'}"> selected="true" </c:if></c:if></c:forEach>>REGM</option>
                                </select>
                            </div>
                            <!--Additional Information-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Additional Information</span>
                                <input type="text" name="_211_of24e_narrative" id="_211_of24e_narrative" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_211_of24e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--of24G Delivery To/Collection By-->
                            <!--Code-->
                            <div class="form-row"><span class="label_body">OF24G</span><span class="label">Delivery To/Collection By</span>
                                <select name="_220_of24g_delivery_to_collection_by" id="_220_of24g_delivery_to_collection_by">
                                    <option value="">choose a type</option>
                                    <option value="BENE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of24g_delivery_to_collection_by'}"><c:if test="${item.detail=='BENE'}"> selected="true" </c:if></c:if></c:forEach>>BENE</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of24g_delivery_to_collection_by'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                </select>
                            </div>
                            <!--Narrative-->
                            <div class="form-row"><span class="label">Narrative</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_220_of24g_narrative" id="_220_of24g_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of24g_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            
                            <h2 class="header-credit">End of Sequence B Undertaking Details</h2>
                            
                            <!--OPT C-->
                            <!--<h2 class="header-title">Optional Sequence C Local Undertaking Details</h2>-->
                            <h2 class="header-title">
                                <label class="optsel">
                                    <input type="checkbox" name="check_seq_C" id="check_seq_C" />
                                </label>Optional Sequence C Local Undertaking Details
                            </h2>
                            <div id="check_seq_c">
                            <!--MF15C New Sequence-->
                            <div class="form-row"><span class="label_body">MF15C</span><span class="label"><a style="color:red;text-decoration:none">*</a>New Sequence</span>
                                <input name="_230_mf15c_new_sequence" id="_230_mf15c_new_sequence" class="mandatory" type="hidden" input_type="MF15C New Sequence" location="Body" value="" />
                            </div>  

                            <!-- OF32B Increase of Undertaking Amount  -->
                            <div class="form-row"><span class="label_body">OF32B</span><span class="label">Currency</span>
                                <input type="text" name="_240_of32b_currency" id="_240_of32b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_241_of32b_amount" id="_241_of32b_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_241_of32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_koma(this)" />  
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_241_of32b_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(2);
                                    var nominalStylec = nominalStyle.fontcolor("red");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    document.write(nominalStylec);
                                </script>
                            </div>
                            <hr/>

                            <!--OF33B Decrease of Undertaking Amount-->
                            <div class="form-row"><span class="label_body">OF33B</span><span class="label">Currency</span>
                                <input type="text" name="_250_of33b_currency" id="_250_of33b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_251_of33b_amount" id="_251_of33b_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_251_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_koma(this)" /> 
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_251_of33b_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(2);
                                    var nominalStylec = nominalStyle.fontcolor("red");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    document.write(nominalStylec);
                                </script>
                            </div>
                            <hr/>

                            <!--OF23B Expiry Type-->
                            <div class="form-row"><span class="label_body">OF23B</span><span class="label">Expiry Type</span>
                                <select name="_260_of23b_expiry_type" id="_260_of23b_expiry_type">
                                    <option value="">choose a type</option>
                                    <option value="COND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of23b_expiry_type'}"><c:if test="${item.detail=='COND'}"> selected="true" </c:if></c:if></c:forEach>>COND</option>
                                    <option value="FIXD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of23b_expiry_type'}"><c:if test="${item.detail=='FIXD'}"> selected="true" </c:if></c:if></c:forEach>>FIXD</option>
                                    <option value="OPEN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of23b_expiry_type'}"><c:if test="${item.detail=='OPEN'}"> selected="true" </c:if></c:if></c:forEach>>OPEN</option>
                                </select>
                            </div>
                            <hr/>

                            <!--OF31E Date of Expiry-->
                            <div class="form-row"><span class="label_body">OF31E</span><span class="label">Date of Expiry</span>
                                <input type="text" name="_270_of31e_date_of_expiry" id="value_date_3" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of31e_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--OF35G Expiry Condition/Event-->
                            <div class="form-row"><span class="label_body">OF35G</span><span class="label">Expiry Condition/Event</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_280_of35g_expiry_conditions_event" id="_280_of35g_expiry_conditions_event" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of35g_expiry_conditions_event'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF59 Beneficiary-->
                            <!--Account-->
                            <div class="form-row"><span class="label_body">OF59</span><span class="label">Beneficiary</span>
                                <input type="text" name="_290_of59_beneficiary" id="_290_of59_beneficiary" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of59_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                            </div>
                            <!--Name and Address-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_291_of59_name_address" id="_291_of59_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_291_of59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF77L Other Amendments to Local Undertaking-->
                            <div class="form-row"><span class="label_body">OF77L</span><span class="label">Other Amendments to Local Undertaking</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="150" maxlength="9750" style="resize:none;" name="_300_of77l_other_amandments_to_local_undertaking" id="_300_of77l_other_amandments_to_local_undertaking" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of77l_other_amandments_to_local_undertaking'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF24E Delivery of Amendment To Undertaking-->
                            <!--Code-->
                            <div class="form-row"><span class="label_body">OF24E</span><span class="label">Delivery of Original Undertaking</span>
                                <select name="_310_of24e_delivery_of_amendment_to_undertaking" id="_310_of24e_delivery_of_amendment_to_undertaking">
                                    <option value="">choose a type</option>
                                    <option value="COLL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of24e_delivery_of_amendment_to_undertaking'}"><c:if test="${item.detail=='COLL'}"> selected="true" </c:if></c:if></c:forEach>>COLL</option>
                                    <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of24e_delivery_of_amendment_to_undertaking'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>COUR</option>
                                    <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of24e_delivery_of_amendment_to_undertaking'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>MAIL</option>
                                    <option value="MESS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of24e_delivery_of_amendment_to_undertaking'}"><c:if test="${item.detail=='MESS'}"> selected="true" </c:if></c:if></c:forEach>>MESS</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of24e_delivery_of_amendment_to_undertaking'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                    <option value="REGM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of24e_delivery_of_amendment_to_undertaking'}"><c:if test="${item.detail=='REGM'}"> selected="true" </c:if></c:if></c:forEach>>REGM</option>
                                </select>
                            </div>
                            <!--Additional Information-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Additional Information</span>
                                <input type="text" name="_311_of24e_narrative" id="_311_of24e_narrative" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_311_of24e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--of24G Delivery To/Collection By-->
                            <!--Code-->
                            <div class="form-row"><span class="label_body">OF24G</span><span class="label">Delivery To/Collection By</span>
                                <select name="_320_of24g_delivery_to_collection_by" id="_320_of24g_delivery_to_collection_by">
                                    <option value="">choose a type</option>
                                    <option value="BENE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of24g_delivery_to_collection_by'}"><c:if test="${item.detail=='BENE'}"> selected="true" </c:if></c:if></c:forEach>>BENE</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of24g_delivery_to_collection_by'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                </select>
                            </div>
                            <!--Narrative-->
                            <div class="form-row"><span class="label">Narrative</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_320_of24g_narrative" id="_320_of24g_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of24g_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
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
<%@ include file="rule/validate_rule_mt767.jsp" %>
</body>
</html>




 

