<%-- 
    Document   : mt760
    Created on : Oct 1, 2025, 10:11:10?AM
    Author     : mslam
--%>


<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT760 Issue of a Demand Guarantee/Standby Guarantee/Standby Letter of Credit</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/mt760.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="assets/js/mt760.js"></script>
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
    <div id="judul"><h2>MT760 Issue of a Demand Guarantee/Standby Guarantee/Standby Letter of Credit</h2></div>
    <form id="form_mt760" method="post" 
          action="${pageContext.request.contextPath}/MT760Servlet"
          autocomplete="off"
          onsubmit="return validateMT760() && confirm('Do you want to save this MT760 data?');">

        <input type="hidden" name="messageType" value="760"/>

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
                                <input name="_010_mf15a_new_sequence" id="_010_mf15a_new_sequence" type="hidden" input_type="MF15A New Sequence" location="Body" value="" />
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
                            
                            <!--MF22A Purpose of Message-->
                            <div class="form-row"><span class="label_body">MF22A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Purpose of Message</span>
                                <select name="_030_mf22a_purpose_of_message" id="_030_mf22a_purpose_of_message" class="mandatory" input_type="MF22A Purpose of Message" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="ACNF" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ACNF'}"> selected="true" </c:if></c:if></c:forEach>>ACNF</option>
                                    <option value="ADVI" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ADVI'}"> selected="true" </c:if></c:if></c:forEach>>ADVI</option>
                                    <option value="ICCO" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ICCO'}"> selected="true" </c:if></c:if></c:forEach>>ICCO</option>
                                    <option value="ISCO" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ISCO'}"> selected="true" </c:if></c:if></c:forEach>>ISCO</option>
                                    <option value="ISSU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ISSU'}"> selected="true" </c:if></c:if></c:forEach>>ISSU</option>
                                </select>
                            </div>
                            <hr/>
                            
                            <!--OF72Z Sender to Receiver Information -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_040_of72Z_sender_receiver_information" id="_040_of72Z_sender_receiver_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of72Z_sender_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF23X File Identification-->
                            <div class="form-row"><span class="label_body">OF23X</span><span class="label">Codes</span>
                                <select name="_050_of23x_file_identification" id="_050_of23x_file_identification">
                                    <option value="">choose a type</option>
                                    <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of23x_file_identification'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>COUR</option>
                                    <option value="EMAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of23x_file_identification'}"><c:if test="${item.detail=='EMAL'}"> selected="true" </c:if></c:if></c:forEach>>EMAL</option>
                                    <option value="FACT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of23x_file_identification'}"><c:if test="${item.detail=='FACT'}"> selected="true" </c:if></c:if></c:forEach>>FACT</option>
                                    <option value="FAXT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of23x_file_identification'}"><c:if test="${item.detail=='FAXT'}"> selected="true" </c:if></c:if></c:forEach>>FAXT</option>
                                    <option value="HOST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of23x_file_identification'}"><c:if test="${item.detail=='HOST'}"> selected="true" </c:if></c:if></c:forEach>>HOST</option>
                                    <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of23x_file_identification'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>MAIL</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of23x_file_identification'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Usage Rules</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_051_of23x_file_name_or_reference" id="_051_of23x_file_name_or_reference" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of23x_file_name_or_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>

                        <h2 class="header-credit">End of Sequence A General Information</h2>
                            
                        <!--MAN B-->
                        <h2 class="header-title">Mandatory Sequence B Undertaking Details</h2>
                            
                            <!--MF15B New Sequence-->
                            <div class="form-row"><span class="label_body">MF15B</span><span class="label"><a style="color:red;text-decoration:none">*</a>New Sequence</span>
                                <input name="_060_mf15b_new_sequence" id="_060_mf15b_new_sequence" type="hidden" input_type="MF15B New Sequence" location="Body" value="" />
                            </div>
                            
                            <!--MF20 Undertaking Number-->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Undertaking Number</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_070_mf20_undertaking_number" id="_070_mf20_undertaking_number" class="mandatory" maxlength="16" input_type="MF20 Undertaking Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf20_undertaking_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--MF30 Date of Issue-->
                            <div class="form-row"><span class="label_body">MF30</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Issue</span>
                                <input type="text" name="_080_mf30_date_of_issue" id="_080_mf30_date_of_issue" class ="mandatory" maxlength="6" size="6" input_type="MF30 Date of Issue" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf30_date_of_issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--MF22D Form of Undertaking-->
                            <div class="form-row"><span class="label_body">MF22D</span><span class="label"><a style="color:red;text-decoration:none">*</a>Form of Undertaking</span>
                                <select name="_090_mf22d_form_of_undertaking" id="_090_mf22d_form_of_undertaking" class="mandatory" input_type="MF22D Form of Undertaking" location="Body"> 
                                    <option value="">choose a type</option>
                                    <option value="DGAR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='DGAR'}"> selected="true" </c:if></c:if></c:forEach>>DGAR</option>
                                    <option value="STBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='STBY'}"> selected="true" </c:if></c:if></c:forEach>>STBY</option>
                                </select>
                            </div>
                            <hr/>
                            
                            <!--MF40C Applicable Rules-->
                            <!--Codes-->
                            <div class="form-row"><span class="label_body">MF40C</span><span class="label"><a style="color:red;text-decoration:none">*</a>Type</span>
                                <select name="_100_mf40c_applicable_rules" id="_100_mf40c_applicable_rules" class="mandatory" input_type="MF40C Applicable Rules" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="ISPR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf40c_applicable_rules'}"><c:if test="${item.detail=='ISPR'}"> selected="true" </c:if></c:if></c:forEach>>ISPR</option>
                                    <option value="NONE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf40c_applicable_rules'}"><c:if test="${item.detail=='NONE'}"> selected="true" </c:if></c:if></c:forEach>>NONE</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf40c_applicable_rules'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                    <option value="UCPR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf40c_applicable_rules'}"><c:if test="${item.detail=='UCPR'}"> selected="true" </c:if></c:if></c:forEach>>UCPR</option>
                                    <option value="URDG" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf40c_applicable_rules'}"><c:if test="${item.detail=='URDG'}"> selected="true" </c:if></c:if></c:forEach>>URDG</option>
                                </select>
                            </div>
                            <!--Narrative if choose OTHR-->
                            <!--If Type is OTHR, then Narrative may be present, otherwise Narrative is not allowed-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                <input type="text" name="_101_mf40c_narrative" id="_101_mf40c_narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf40c_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--MF23B Expiry Type-->
                            <div class="form-row"><span class="label_body">MF23B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Expiry Type</span>
                                <select name="_110_mf23b_expiry_type" id="_110_mf23b_expiry_type" class="mandatory" input_type="MF23B Expiry Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="COND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_mf23b_expiry_type'}"><c:if test="${item.detail=='COND'}"> selected="true" </c:if></c:if></c:forEach>>COND</option>
                                    <option value="FIXD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_mf23b_expiry_type'}"><c:if test="${item.detail=='FIXD'}"> selected="true" </c:if></c:if></c:forEach>>FIXD</option>
                                    <option value="OPEN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_mf23b_expiry_type'}"><c:if test="${item.detail=='OPEN'}"> selected="true" </c:if></c:if></c:forEach>>OPEN</option>
                                </select>
                            </div>
                            <hr/>
                            
                            <!--OF31E Date of Expiry-->
                            <div class="form-row"><span class="label_body">OF31E</span><span class="label">Date of Expiry</span>
                                <input type="text" name="_120_of31e_date_of_expiry" id="_120_of31e_date_of_expiry" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of31e_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF35G Expiry Condition/Event-->
                            <div class="form-row"><span class="label_body">OF35G</span><span class="label">Expiry Condition/Event</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_130_of35g_expiry_condition_event" id="_130_of35g_expiry_condition_event" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of35g_expiry_condition_event'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF50 Applicant-->
                            <div class="form-row"><span class="label_body">OF50</span><span class="label">Applicant</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_140_of50_applicant" id="_140_of50_applicant" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of50_applicant'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF51 Obligor/Instructing Party-->
                            <div class="form-row"><span class="label_body">OF51</span><span class="label">Obligor/Instructing Party</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_150_of51_obligor_instructing_party" id="_150_of51_obligor_instructing_party" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of51_obligor_instructing_party'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--MF52a Issuer-->
                            <div class="form-row"><span class="label_body">MF52a </span><span class="label"><a style="color:red;text-decoration:none">*</a>Issuer</span>
                                <select id="_160_mf52a_issuer" name="_160_mf52a_issuer" class="mandatory" input_type="MF52a Issuer" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_mf52a_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_161_mf52a_party_identifier" id="_161_mf52a_party_identifier" maxlength="37" input_type="MF52a Issuer" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_mf52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_162_mf52a_identifier_code" id="_162_mf52a_identifier_code" maxlength="11" class="mandatory" input_type="MF52a Issuer" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_mf52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_mf52d_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_163_mf52d_party_identifier" id="_163_mf52d_party_identifier" maxlength="35" input_type="MF52a Issuer" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_163_mf52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_164_mf52d_name_address" id="_164_mf52d_name_address" input_type="MF52a Issuer" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_164_mf52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--MF59a Beneficiary-->
                            <div class="form-row"><span class="label_body">MF59a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Beneficiary</span>
                                <select id="_170_mf59a_beneficiary" name="_170_mf59a_beneficiary" class="mandatory" input_type="MF59a Beneficiary" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="no">Name and Address</option>
                                    <option value="a">A - BIC</option>
                                </select>
                                <div id="div_mf59no_beneficiary">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_171_mf59a_account" id="_171_mf59a_account" maxlength="35" class="mandatory" input_type="MF59a Beneficiary" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_mf59a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_172_mf59a_name_address" id="_172_mf59a_name_address" class="mandatory" input_type="MF59a Beneficiary" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_mf59a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_mf59a_beneficiary">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_173_mf59a_account" id="_173_mf59a_account" maxlength="35" class="mandatory" input_type="MF59a Beneficiary" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_mf59a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_174_mf59a_identifier_code" id="_174_mf59a_identifier_code" maxlength="11" class="mandatory" input_type="MF59a Beneficiary" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_mf59a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF56a Advising Bank-->
                            <div class="form-row"><span class="label_body">OF56a</span><span class="label">Advising Bank</span>
                                <select id="_180_of56a_advising_bank" name="_180_of56a_advising_bank">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_of56a_advising_bank">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_181_of56a_party_identifier" id="_181_of56a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_182_of56a_identifier_code" id="_182_of56a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_182_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of56d_advising_bank">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_183_of56d_party_identifier" id="_183_of56d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_183_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_184_of56d_name_address" id="_184_of56d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF23 Advising Bank Reference-->
                            <div class="form-row"><span class="label_body">OF23</span><span class="label">Advising Bank Reference</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_190_of23_advising_bank_reference" id="_190_of23_advising_bank_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of23_advising_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF57a 'Advise Through' Bank-->
                            <div class="form-row"><span class="label_body">OF57a</span><span class="label">Advise Through Bank</span>
                                <select id="_200_of57a_advise_through_bank" name="_200_of57a_advise_through_bank">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_of57a_advise_through_bank">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_201_of57a_party_identifier" id="_201_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_201_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_202_of57a_identifier_code" id="_202_of57a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_202_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57d_advise_through_bank">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_203_of57d_party_identifier" id="_203_of57d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_203_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_204_of57d_name_address" id="_204_of57d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_204_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--MF32B Undertaking Amount-->
                            <!--currency-->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                                <input type="text" name="_210_mf32b_currency" id="_210_mf32b_currency" maxlength="3" class="mandatory" input_type="MF32B Undertaking Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--amount-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>                             
                                <input type="text" name="_211_mf32b_amount" id="_211_mf32b_amount" class="mandatory" onpaste="return false" ondrop="return false" maxlength="15" input_type="MF32B Undertaking Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_211_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_210_mf32b_currency');" onblur="cek_koma(this)" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_211_mf32b_amount').value;
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
                            
                            <!--OF39F Supplementary Information About Amount-->
                            <div class="form-row"><span class="label_body">OF39F</span><span class="label">Supplementary Information About Amount</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_220_of39f_supplementary_information_about_amount" id="_220_of39f_supplementary_information_about_amount" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of39f_supplementary_information_about_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF41a Available With...-->
                            <div class="form-row"><span class="label_body">OF41a</span><span class="label">Available With</span>
                                <select id="_230_of41a_available_with" name="_230_of41a_available_with">
                                    <option value="">choose a type</option>
                                    <option value="f">F - BIC</option>
                                    <option value="g">G - Name & Address</option>
                                </select>
                                <div id="div_of41f_avaliable_with">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_231_of41f_identifier_code" id="_231_of41f_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_231_of41f_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of41g_avaliable_with">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_232_of41g_name_address" id="_232_of41g_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_232_of41g_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF71D Charges-->
                            <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_240_of71D_charges" id="_240_of71D_charges" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of71D_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF45C Document and Presentation Instructions-->
                            <div class="form-row"><span class="label_body">OF45C</span><span class="label">Document and Presentation Instructions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="100" maxlength="6500" style="resize:none;" name="_250_of45c_document_and_presentation_instructions" id="_250_of45c_document_and_presentation_instructions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of45c_document_and_presentation_instructions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--MF77U Undertaking Terms and Conditions-->
                            <div class="form-row"><span class="label_body">MF77U</span><span class="label"><a style="color:red;text-decoration:none">*</a>Undertaking Terms and Conditions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="150" maxlength="9750" name="_260_mf77u_undertaking_terms_and_conditions" id="_260_mf77u_undertaking_terms_and_conditions" class="mandatory" input_type="MF77U Undertaking Terms and Conditions" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_mf77u_undertaking_terms_and_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF49 Confirmation Instructions-->
                            <div class="form-row"><span class="label_body">OF49</span><span class="label">Confirmation Instructions</span>
                                <select name="_270_of49_confirmation_instructions" id="_270_of49_confirmation_instructions">
                                    <option value="">choose a type</option>
                                    <option value="CONFIRM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of49_confirmation_instructions'}"><c:if test="${item.detail=='CONFIRM'}"> selected="true" </c:if></c:if></c:forEach>>CONFIRM</option>
                                    <option value="MAY ADD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of49_confirmation_instructions'}"><c:if test="${item.detail=='MAY ADD'}"> selected="true" </c:if></c:if></c:forEach>>MAY ADD</option>
                                    <option value="WITHOUT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of49_confirmation_instructions'}"><c:if test="${item.detail=='WITHOUT'}"> selected="true" </c:if></c:if></c:forEach>>WITHOUT</option>
                                </select>
                            </div>
                            <hr/>
                            
                            <!--OF58a Requested Confirmation Party-->
                            <div class="form-row"><span class="label_body">OF58a</span><span class="label">Requested Confirmation Party</span>
                                <select id="_280_of58a_requested_confirmation_party" name="_280_of58a_requested_confirmation_party">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_of58a_requested_confirmation_party">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_281_of58a_party_identifier" id="_281_of58a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_281_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_282_of58a_identifier_code" id="_282_of58a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_282_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of58d_requested_confirmation_party">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_283_of58d_party_identifier" id="_283_of58d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_283_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_284_of58d_name_address" id="_284_of58d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_284_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF44J Governing Law/Jurisdiction-->
                            <!--country code-->
                            <div class="form-row"><span class="label_body">OF44J</span><span class="label">Country Code</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_290_of44j_country_code" id="_290_of44j_country_code" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of44j_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--narrative-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_291_of44j_narrative" id="_291_of44j_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_291_of44j_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF23F Automatic Extension Period--> 
                            <div class="form-row"><span class="label_body">OF23F</span><span class="label">Automatic Extension Period</span>
                                <select name="_300_of23f_automatic_extension_period" id="_300_of23f_automatic_extension_period">
                                    <option value="">choose a type</option>
                                    <option value="DAYS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of23f_automatic_extension_period'}"><c:if test="${item.detail=='DAYS'}"> selected="true" </c:if></c:if></c:forEach>>DAYS</option>
                                    <option value="ONEY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of23f_automatic_extension_period'}"><c:if test="${item.detail=='ONEY'}"> selected="true" </c:if></c:if></c:forEach>>ONEY</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of23f_automatic_extension_period'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                </select>
                            </div>
                            <!--details-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_301_of23f_narrative" id="_301_of23f_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_301_of23f_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF78 Automatic Extension Non-Extension Notification-->
                            <div class="form-row"><span class="label_body">OF78</span><span class="label">Automatic Extension Non-Extension Notification</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_310_of78_automatic_extension_non_extension_notification" id="_310_of78_automatic_extension_non_extension_notification" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of78_automatic_extension_non_extension_notification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF26E Automatic Extension Notification Period-->
                            <div class="form-row"><span class="label_body">OF26E</span><span class="label">Automatic Extension Notification Period</span>                                
                                <input type="text" onkeypress="avoidSplChars(event)" name="_320_of26e_automatic_extension_notification_period" id="_320_of26e_automatic_extension_notification_period" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of26e_automatic_extension_notification_period'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF31S Automatic Extension Final Expiry Date-->
                            <div class="form-row"><span class="label_body">OF31S</span><span class="label">Automatic Extension Final Expiry Date</span>
                                <input type="text" name="_330_of31s_automatic_extension_final_expiry_date" id="_330_of31s_automatic_extension_final_expiry_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of31s_automatic_extension_final_expiry_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF48B Demand Indicator-->
                            <div class="form-row"><span class="label_body">OF48B</span><span class="label">Demand Indicator</span>
                                <select name="_340_of48b_demand_indicator" id="_340_of48b_demand_indicator">
                                    <option value="">choose a type</option>
                                    <option value="NMLT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of48b_demand_indicator'}"><c:if test="${item.detail=='NMLT'}"> selected="true" </c:if></c:if></c:forEach>>NMLT</option>
                                    <option value="NMPT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of48b_demand_indicator'}"><c:if test="${item.detail=='NMPT'}"> selected="true" </c:if></c:if></c:forEach>>NMPT</option>
                                    <option value="NPRT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of48b_demand_indicator'}"><c:if test="${item.detail=='NPRT'}"> selected="true" </c:if></c:if></c:forEach>>NPRT</option>
                                </select>
                            </div>
                            <hr/>
                            
                            <!--OF48D Transfer Indicator-->
                            <div class="form-row"><span class="label_body">OF48D</span><span class="label">Transfer Indicator</span>
                                <select name="_350_of48d_transfer_indicator" id="_350_of48d_transfer_indicator">
                                    <option value="">choose a type</option>
                                    <option value="TRAN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_of48d_transfer_indicator'}"><c:if test="${item.detail=='TRAN'}"> selected="true" </c:if></c:if></c:forEach>>TRAN</option>
                                </select>
                            </div>
                            <hr/>
                            
                            <!--OF39E Transfer Conditions-->
                            <div class="form-row"><span class="label_body">OF39E</span><span class="label">Transfer Conditions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_360_of39e_transfer_conditions" id="_360_of39e_transfer_conditions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of39e_transfer_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF45L Underlying Transaction Details-->
                            <div class="form-row"><span class="label_body">OF45L</span><span class="label">Underlying Transaction Details</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="50" maxlength="3250" style="resize:none;" name="_370_of45l_underlying_transaction_details" id="_370_of45l_underlying_transaction_details" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_of45l_underlying_transaction_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF24E Delivery of Original Undertaking-->
                            <!--Code-->
                            <div class="form-row"><span class="label_body">OF24E</span><span class="label">Delivery of Original Undertaking</span>
                                <select name="_380_of24e_delivery_of_original_undertaking" id="_380_of24e_delivery_of_original_undertaking">
                                    <option value="">choose a type</option>
                                    <option value="COLL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of24e_delivery_of_original_undertaking'}"><c:if test="${item.detail=='COLL'}"> selected="true" </c:if></c:if></c:forEach>>COLL</option>
                                    <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of24e_delivery_of_original_undertaking'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>COUR</option>
                                    <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of24e_delivery_of_original_undertaking'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>MAIL</option>
                                    <option value="MESS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of24e_delivery_of_original_undertaking'}"><c:if test="${item.detail=='MESS'}"> selected="true" </c:if></c:if></c:forEach>>MESS</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of24e_delivery_of_original_undertaking'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                    <option value="REGM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of24e_delivery_of_original_undertaking'}"><c:if test="${item.detail=='REGM'}"> selected="true" </c:if></c:if></c:forEach>>REGM</option>
                                </select>
                            </div>
                            <!--Additional Information-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Additional Information</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_381_of24e_narrative" id="_381_of24e_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_381_of24e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF24G Delivery To/Collection By-->
                            <!--Code-->
                            <div class="form-row"><span class="label_body">OF24G</span><span class="label">Delivery To/Collection By</span>
                                <select name="_390_of24g_delivery_to_collection_by" id="_390_of24g_delivery_to_collection_by">
                                    <option value="">choose a type</option>
                                    <option value="BENE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_of24g_delivery_to_collection_by'}"><c:if test="${item.detail=='BENE'}"> selected="true" </c:if></c:if></c:forEach>>BENE</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_of24g_delivery_to_collection_by'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                </select>
                            </div>
                            <!--Narrative-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_390_of24g_narrative" id="_390_of24g_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_of24g_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            
                        <h2 class="header-credit">End of Sequence B Undertaking Details</h2>
                            
                        <!--OPT C-->
                        <!--<h2 class="header-title">Optional Sequence C Local Undertaking Details</h2>-->
                        <h2 class="header-title">
                            <label class="optsel">
                                <input type="checkbox" name="seq_C_checkbox" id="seq_C_checkbox" />
                            </label>Optional Sequence C Local Undertaking Details
                        </h2>
                        <div id="check_seq_c">
                            <!--MF15C New Sequence-->
                            <div class="form-row"><span class="label_body">MF15C</span><span class="label"><a style="color:red;text-decoration:none">*</a>New Sequence</span>
                                <input name="_400_mf15c_new_sequence" id="_400_mf15c_new_sequence" type="hidden" input_type="MF15C New Sequence" location="Body" value="" />
                            </div>  

                            <!--OF31C Requested Date of Issue-->
                            <div class="form-row"><span class="label_body">OF31C</span><span class="label">Requested Date of Issue </span>
                                <input type="text" name="_410_of31c_requested_date_of_issue" id="_410_of31c_requested_date_of_issue" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of31c_requested_date_of_issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--MF22D Form of Undertaking-->
                            <div class="form-row"><span class="label_body">MF22D</span><span class="label"><a style="color:red;text-decoration:none">*</a>Form of Undertaking</span>
                                <select name="_420_mf22d_form_of_undertaking" id="_420_mf22d_form_of_undertaking" class="mandatory" input_type="MF22D Form of Undertaking" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="DEPU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='DEPU'}"> selected="true" </c:if></c:if></c:forEach>>DEPU</option>
                                    <option value="DGAR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='DGAR'}"> selected="true" </c:if></c:if></c:forEach>>DGAR</option>
                                    <option value="STBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='STBY'}"> selected="true" </c:if></c:if></c:forEach>>STBY</option>
                                </select>
                            </div>
                            <hr/>

                            <!--MF40C Applicable Rules-->
                            <!--Codes-->
                            <div class="form-row"><span class="label_body">MF40C</span><span class="label"><a style="color:red;text-decoration:none">*</a>Type</span>
                                <select name="_430_mf40c_applicable_rules" id="_430_mf40c_applicable_rules" class="mandatory" input_type="MF40C Applicable Rules" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="ISPR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_mf40c_applicable_rules'}"><c:if test="${item.detail=='ISPR'}"> selected="true" </c:if></c:if></c:forEach>>ISPR</option>
                                    <option value="NONE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_mf40c_applicable_rules'}"><c:if test="${item.detail=='NONE'}"> selected="true" </c:if></c:if></c:forEach>>NONE</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_mf40c_applicable_rules'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                    <option value="UCPR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_mf40c_applicable_rules'}"><c:if test="${item.detail=='UCPR'}"> selected="true" </c:if></c:if></c:forEach>>UCPR</option>
                                    <option value="URDG" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_mf40c_applicable_rules'}"><c:if test="${item.detail=='URDG'}"> selected="true" </c:if></c:if></c:forEach>>URDG</option>
                                </select>
                            </div>
                            <!--Narrative if choose OTHR-->
                            <!--If Type is OTHR, then Narrative may be present, otherwise Narrative is not allowed-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                <input type="text" name="_431_mf40c_narrative" id="_431_mf40c_narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_431_mf40c_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--OF22K Type of Undertaking-->
                            <div class="form-row"><span class="label_body">OF22K</span><span class="label">Type of Undertaking</span>
                                <select name="_440_of22k_type_of_undertaking" id="_440_of22k_type_of_undertaking">
                                    <option value="">choose a type</option>
                                    <option value="APAY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='APAY'}"> selected="true" </c:if></c:if></c:forEach>>APAY</option>
                                    <option value="BILL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='BILL'}"> selected="true" </c:if></c:if></c:forEach>>BILL</option>
                                    <option value="CUST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='CUST'}"> selected="true" </c:if></c:if></c:forEach>>CUST</option>
                                    <option value="DPAY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='DPAY'}"> selected="true" </c:if></c:if></c:forEach>>DPAY</option>
                                    <option value="INSU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='INSU'}"> selected="true" </c:if></c:if></c:forEach>>INSU</option>
                                    <option value="JUDI" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='JUDI'}"> selected="true" </c:if></c:if></c:forEach>>JUDI</option>
                                    <option value="LEAS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='LEAS'}"> selected="true" </c:if></c:if></c:forEach>>LEAS</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                    <option value="PAYM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='PAYM'}"> selected="true" </c:if></c:if></c:forEach>>PAYM</option>
                                    <option value="PERF" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='PERF'}"> selected="true" </c:if></c:if></c:forEach>>PERF</option>
                                    <option value="RETN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='RETN'}"> selected="true" </c:if></c:if></c:forEach>>RETN</option>
                                    <option value="SHIP" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='SHIP'}"> selected="true" </c:if></c:if></c:forEach>>SHIP</option>
                                    <option value="TEND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='TEND'}"> selected="true" </c:if></c:if></c:forEach>>TEND</option>
                                    <option value="WARR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of22k_type_of_undertaking'}"><c:if test="${item.detail=='WARR'}"> selected="true" </c:if></c:if></c:forEach>>WARR</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_441_of22k_type_narrative" id="_441_of22k_type_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_441_of22k_type_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--MF23B Expiry Type-->
                            <div class="form-row"><span class="label_body">MF23B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Expiry Type</span>
                                <select name="_450_mf23b_expiry_type" id="_450_mf23b_expiry_type" class="mandatory" input_type="MF23B Expiry Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="COND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_450_mf23b_expiry_type'}"><c:if test="${item.detail=='COND'}"> selected="true" </c:if></c:if></c:forEach>>COND</option>
                                    <option value="FIXD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_450_mf23b_expiry_type'}"><c:if test="${item.detail=='FIXD'}"> selected="true" </c:if></c:if></c:forEach>>FIXD</option>
                                    <option value="OPEN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_450_mf23b_expiry_type'}"><c:if test="${item.detail=='OPEN'}"> selected="true" </c:if></c:if></c:forEach>>OPEN</option>
                                </select>
                            </div>
                            <hr/>

                            <!--OF31E Date of Expiry-->
                            <div class="form-row"><span class="label_body">OF31E</span><span class="label">Date of Expiry</span>
                                <input type="text" name="_460_of31e_date_of_expiry" id="_460_of31e_date_of_expiry" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_460_of31e_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--OF35G Expiry Condition/Event-->
                            <div class="form-row"><span class="label_body">OF35G</span><span class="label">Expiry Condition/Event</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_470_of35G_expiry_condition_events" id="_470_of35G_expiry_condition_events" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_470_of35G_expiry_condition_events'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--MF50 Applicant-->
                            <div class="form-row"><span class="label_body">MF50</span><span class="label"><a style="color:red;text-decoration:none">*</a>Applicant</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_480_of50_applicant" id="_480_of50_applicant" input_type="MF50 Applicant" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_480_of50_applicant'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF51 Obligor/Instructing Party-->
                            <div class="form-row"><span class="label_body">OF51</span><span class="label">Obligor/Instructing Party</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_490_of51_obligor_instructing_party" id="_490_of51_obligor_instructing_party"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_490_of51_obligor_instructing_party'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF52a Issuer-->
                            <div class="form-row"><span class="label_body">OF52a </span><span class="label">Issuer</span>
                                <select id="_500_of52a_issuer" name="_500_of52a_issuer"">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_of52a_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_501_of52a_party_identifier" id="_501_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_501_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_502_of52a_identifier_code" id="_502_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_502_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of52d_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_503_of52d_party_identifier" id="_503_of52d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_503_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_504_of52d_name_address" id="_504_of52d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_504_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--MF59 Beneficiary-->
                            <!--Account-->
                            <div class="form-row"><span class="label_body">MF59</span><span class="label"><a style="color:red;text-decoration:none">*</a>Account</span>
                                <input type="text" name="_510_mf59_beneficiary" id="_510_mf59_beneficiary" maxlength="35" class="mandatory" input_type="MF59 Beneficiary" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_510_mf59_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                            </div>
                            <!--Name and Address-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_511_mf59_name_address" id="_511_mf59_name_address" input_type="MF59 Beneficiary" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_511_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--MF32B Undertaking Amount-->
                            <!--currency-->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                                <input type="text" name="_520_mf32b_currency" id="_520_mf32b_currency" maxlength="3" class="mandatory" input_type="MF32B Undertaking Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_520_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--amount-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>                             
                                <input type="text" name="_521_mf32b_amount" id="_521_mf32b_amount" class="mandatory" onpaste="return false" ondrop="return false" maxlength="15" input_type="MF32B Undertaking Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_521_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_520_mf32b_currency');" onblur="cek_koma(this)" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_521_mf32b_amount').value;
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

                            <!--OF39F Supplementary Information About Amount-->
                            <div class="form-row"><span class="label_body">OF39F</span><span class="label">Supplementary Information About Amount</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_530_of39f_supplementary_information_about_amount" id="_530_of39f_supplementary_information_about_amount" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_530_of39f_supplementary_information_about_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF57a 'Advise Through' Bank-->
                            <div class="form-row"><span class="label_body">OF57a</span><span class="label">Advise Through Bank</span>
                                <select id="_540_of57a_advise_through_bank" name="_540_of57a_advise_through_bank">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_of57a_advise_through_bank">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_541_of57a_party_identifier" id="_541_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_541_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_542_of57a_identifier_code" id="_542_of57a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_542_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57d_advise_through_bank">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_543_of57d_party_identifier" id="_543_of57d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_543_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_544_of57d_name_address" id="_544_of57d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_544_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--OF41a Available With...-->
                            <div class="form-row"><span class="label_body">OF41a</span><span class="label">Available With</span>
                                <select id="_550_of41a_available_with" name="_550_of41a_available_with">
                                    <option value="">choose a type</option>
                                    <option value="f">F - BIC</option>
                                    <option value="g">G - Name & Address</option>
                                </select>
                                <div id="div_of41f_avaliable_with_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_551_of41f_identifier_code" id="_551_of41f_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_551_of41f_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of41g_avaliable_with_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_552_of41g_name_address" id="_552_of41g_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_552_of41g_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--OF71D Charges-->
                            <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_560_of71D_charges" id="_560_of71D_charges" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_560_of71D_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF45C Document and Presentation Instructions-->
                            <div class="form-row"><span class="label_body">OF45C</span><span class="label">Document and Presentation Instructions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="100" maxlength="6500" style="resize:none;" name="_570_of45c_document_and_presentation_instructions" id="_570_of45c_document_and_presentation_instructions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_570_of45c_document_and_presentation_instructions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF77L Requested Local Undertaking Terms and Conditions-->
                            <div class="form-row"><span class="label_body">OF77L</span><span class="label">Requested Local Undertaking Terms and Conditions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="150" maxlength="9750" name="_580_of77l_requested_local_undertaking_terms_and_conditions" id="_580_of77l_requested_local_undertaking_terms_and_conditions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_580_of77l_requested_local_undertaking_terms_and_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF22Y Standard Wording Required-->
                            <div class="form-row"><span class="label_body">OF22Y</span><span class="label">Standard Wording Required</span>
                                <select name="_590_of22y_standard_wording_required" id="_590_of22y_standard_wording_required">
                                    <option value="">choose a type</option>
                                    <option value="STND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_590_of22y_standard_wording_required'}"><c:if test="${item.detail=='STND'}"> selected="true" </c:if></c:if></c:forEach>>STND</option>
                                </select>
                            </div>
                            <hr/>

                            <!--OF40D Standard Wording Requested Language-->
                            <div class="form-row"><span class="label_body">OF40D</span><span class="label">Standard Wording Requested Language</span>                                
                                <input type="text" onkeypress="avoidSplChars(event)" name="_600_of40d_standard_wording_reqested_language" id="_600_of40d_standard_wording_reqested_language" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_600_of40d_standard_wording_reqested_language'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--OF44J Governing Law/Jurisdiction-->
                            <!--country code-->
                            <div class="form-row"><span class="label_body">OF44J</span><span class="label">Country Code</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_610_of44j_country_code" id="_610_of44j_country_code" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_610_of44j_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>

                            <!--narrative-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_611_of44j_narrative" id="_611_of44j_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_611_of44j_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--OF23F Automatic Extension Period-->
                            <div class="form-row"><span class="label_body">OF23F</span><span class="label">Automatic Extension Period</span>
                                <select name="_620_of23f_automatic_extension_period" id="_620_of23f_automatic_extension_period">
                                    <option value="">choose a type</option>
                                    <option value="DAYS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_620_of23f_automatic_extension_period'}"><c:if test="${item.detail=='DAYS'}"> selected="true" </c:if></c:if></c:forEach>>DAYS</option>
                                    <option value="ONEY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_620_of23f_automatic_extension_period'}"><c:if test="${item.detail=='ONEY'}"> selected="true" </c:if></c:if></c:forEach>>ONEY</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_620_of23f_automatic_extension_period'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                </select>
                            </div>
                            <!--details-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_621_of23f_narrative" id="_621_of23f_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_621_of23f_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--OF78 Automatic Extension Non-Extension Notification-->
                            <div class="form-row"><span class="label_body">OF78</span><span class="label">Automatic Extension Non-Extension Notification</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_630_of78_automatic_extension_non_extenstion_notification" id="_630_of78_automatic_extension_non_extenstion_notification" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_of78_automatic_extension_non_extenstion_notification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF26E Automatic Extension Notification Period-->
                            <div class="form-row"><span class="label_body">OF26E</span><span class="label">Automatic Extension Notification Period</span>                                
                                <input type="text" onkeypress="avoidSplChars(event)" name="_640_of26e_automatic_extension_notification_period" id="_640_of26e_automatic_extension_notification_period" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_640_of26e_automatic_extension_notification_period'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--OF31S Automatic Extension Final Expiry Date-->
                            <div class="form-row"><span class="label_body">OF31S</span><span class="label">Automatic Extension Final Expiry Date</span>
                                <input type="text" name="_650_of31s_automatic_extension_final_expiry_date" id="_650_of31s_automatic_extension_final_expiry_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_650_of31s_automatic_extension_final_expiry_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--OF48B Demand Indicator-->
                            <div class="form-row"><span class="label_body">OF48B</span><span class="label">Demand Indicator</span>
                                <select name="_660_of48b_demand_indicator" id="_660_of48b_demand_indicator">
                                    <option value="">choose a type</option>
                                    <option value="NMLT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_660_of48b_demand_indicator'}"><c:if test="${item.detail=='NMLT'}"> selected="true" </c:if></c:if></c:forEach>>NMLT</option>
                                    <option value="NMPT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_660_of48b_demand_indicator'}"><c:if test="${item.detail=='NMPT'}"> selected="true" </c:if></c:if></c:forEach>>NMPT</option>
                                    <option value="NPRT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_660_of48b_demand_indicator'}"><c:if test="${item.detail=='NPRT'}"> selected="true" </c:if></c:if></c:forEach>>NPRT</option>
                                </select>
                            </div>
                            <hr/>    

                            <!--OF48D Transfer Indicator-->
                            <div class="form-row"><span class="label_body">OF48D</span><span class="label">Transfer Indicator</span>
                                <select name="_670_of48d_transfer_indicator" id="_670_of48d_transfer_indicator">
                                    <option value="">choose a type</option>
                                    <option value="TRAN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_670_of48d_transfer_indicator'}"><c:if test="${item.detail=='TRAN'}"> selected="true" </c:if></c:if></c:forEach>>TRAN</option>
                                </select>
                            </div>
                            <hr/>

                            <!--OF39E Transfer Conditions-->
                            <div class="form-row"><span class="label_body">OF39E</span><span class="label">Transfer Conditions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_680_of39e_transfer_conditions" id="_680_of39e_transfer_conditions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_680_of39e_transfer_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--MF45L Underlying Transaction Details-->
                            <div class="form-row"><span class="label_body">MF45L</span><span class="label"><a style="color:red;text-decoration:none">*</a>Underlying Transaction Details</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="50" maxlength="3250" style="resize:none;" name="_690_mf45l_underlying_transaction_details" id="_690_mf45l_underlying_transaction_details" class ="mandatory" input_type="MF30 Date of Amendment" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_690_mf45l_underlying_transaction_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF24E Delivery of Local Undertaking--> 
                            <!--Code-->
                            <div class="form-row"><span class="label_body">OF24E</span><span class="label">Delivery of Original Undertaking</span>
                                <select name="_700_of24e_delivery_of_local_undertaking" id="_700_of24e_delivery_of_local_undertaking">
                                    <option value="">choose a type</option>
                                    <option value="COLL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_700_of24e_delivery_of_local_undertaking'}"><c:if test="${item.detail=='COLL'}"> selected="true" </c:if></c:if></c:forEach>>COLL</option>
                                    <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_700_of24e_delivery_of_local_undertaking'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>COUR</option>
                                    <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_700_of24e_delivery_of_local_undertaking'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>MAIL</option>
                                    <option value="MESS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_700_of24e_delivery_of_local_undertaking'}"><c:if test="${item.detail=='MESS'}"> selected="true" </c:if></c:if></c:forEach>>MESS</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_700_of24e_delivery_of_local_undertaking'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                    <option value="REGM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_700_of24e_delivery_of_local_undertaking'}"><c:if test="${item.detail=='REGM'}"> selected="true" </c:if></c:if></c:forEach>>REGM</option>
                                </select>
                            </div>
                            <!--Additional Information-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Additional Information</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_701_of24e_narrative" id="_701_of24e_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_701_of24e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--OF24G Delivery To/Collection By-->
                            <!--Code-->
                            <div class="form-row"><span class="label_body">OF24G</span><span class="label">Delivery To/Collection By</span>
                                <select name="_710_of24g_delivery_to_collection_by" id="_710_of24g_delivery_to_collection_by">
                                    <option value="">choose a type</option>
                                    <option value="BENE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_710_of24g_delivery_to_collection_by'}"><c:if test="${item.detail=='BENE'}"> selected="true" </c:if></c:if></c:forEach>>BENE</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_710_of24g_delivery_to_collection_by'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                </select>
                            </div>
                            <!--Narrative-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_710_of24g_narrative" id="_710_of24g_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_710_of24g_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                                
                        </div>

                        <h2 class="header-credit">End of Sequence C Local Undertaking Details</h2>
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
<%@ include file="rule/validate_rule_mt760.jsp" %>
</body>
</html>




 