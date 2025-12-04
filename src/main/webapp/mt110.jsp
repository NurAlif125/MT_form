<%-- 
    Document   : mt110
    Created on : Apr 10, 2025, 9:45:26 AM
    Author     : rizkiyee
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt110.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--<%@page contentType="text/html" import="java.util.*" %>--%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link rel="stylesheet" href="css/helper.css" type="text/css">
<link href="css/MT.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:110'}">
            <div id="judul">MT 110 Advice of Cheque(s)</div>
            <script>
                var tagData = {};
                <c:forEach var="t" items="${tags}">
                tagData["${t.tagName}"] = "${t.detail}";
                </c:forEach>
            </script>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="110" />
                <% Date tgl_today = new java.util.Date();
                    pageContext.setAttribute("tgl_today", tgl_today);%>
                <c:set var="tgl_today" value="${tgl_today}" />

                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li id="tab-view1"><a href="#" rel="view1">Header</a></li>
                        <li id="tab-view2"><a href="#" rel="view2">Body</a></li>
                        <li id="tab-view3"><a href="#" rel="view3">Comment</a></li>
                        <li id="tab-view4"><a href="#" rel="view4">Histories</a></li>
                        <li id="tab-view5"><a href="#" rel="view5">Log MT Text</a></li>
                        <li id="tab-view6"><a href="#" rel="view6">MT Relation</a></li>
                        <li id="tab-view7"><a href="#" rel="view7" id="tabView7">Translation</a></li>
                        <li hidden id="tab-validate"><a href="#" rel="view8" id="tabView8">Validate</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                            <%@ include file="special_rate.jsp" %>

                        </div>
                        <div id="view2" class="tabcontent">
                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Sender's Reference</span>
                                <input type="text" name="_010_mf20_senders_reference" id="_010_mf20_senders_reference" class="mandatory" maxlength="16" input_type="MF20 Sender's Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_senders_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <hr/>

                                    <!-- OF53 -->
                                    <div class="form-row"><span class="label_body">OF53</span><span class="label">Sender's Correspondent</span>
                                        <select id="type_of53_" name="type_of53_">
                                            <option value="">choose a type</option>
                                            <option value="a">A - BIC</option>
                                            <option value="b">B - Location</option>
                                            <option value="d">D - Name and Address</option>
                                        </select>
                                        <div id="div_of53a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_120_of53a_party_identifier" id="_120_of53a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_121_of53a_identifier_code" id="_121_of53a_identifier_code" minlength="8" maxlength="11" class="mandatory" autocomplete="off" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^a-zA-Z0-9]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea disabled="true"><c:out value="${senderBank}" /></textarea>
                                    </div>
                                </div>
                                <div id="div_of53b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_123_of53b_party_identifier" id="_123_of53b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_123_of53b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                <input onkeypress="avoidSplChars(event)" type="text" name="_124_of53b_location" id="_124_of53b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_124_of53b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                        <div id="div_of53d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_125_of53d_party_identifier" id="_125_of53d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_125_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" class="mandatory" name="_126_of53d_name_address" id="_126_of53d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_126_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!-- OF54 -->
                                    <div class="form-row"><span class="label_body">OF54</span><span class="label">Receiver's Correspondent</span>
                                        <select id="type_of54_" name="type_of54_">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Receiver's Correspondent - BIC</option>
                                            <option value="b">B - Receiver's Correspondent - Location</option>
                                            <option value="d">D - Receiver's Correspondent - Name and Address</option>
                                        </select>
                                        <div id="div_of54a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_130_of54a_party_identifier" id="_130_of54a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_131_of54a_identifier_code" id="_131_of54a_identifier_code" minlength="8" maxlength="11" class="mandatory" autocomplete="off" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^a-zA-Z0-9]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_131_of54a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_132_of54a_address" id="_132_of54a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_132_of54a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of54b_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_133_of54b_party_identifier" id="_133_of54b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_133_of54b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                <input type="text" onkeypress="avoidSplChars(event)" name="_134_of54b_location" id="_134_of54b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_134_of54b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                        <div id="div_of54d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_135_of54d_party_identifier" id="_135_of54d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_135_of54d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" class="mandatory" name="_136_of54d_name_address" id="_136_of54d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_136_of54d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!-- OF72 -->
                                    <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_240_of72_sender_receiver_information" id="_240_of72_sender_receiver_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of72_sender_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>
                                    <div id="loop-container"><div id="loop-container">
                                            <div id="loop-set">
                                                <!--MF21-->
                                                <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Cheque Number</span>
                                                    <input type="text" name="_151_mf21_cheque_number" id="_151_mf21_cheque_number" maxlength="16" class="mandatory" input_type="MF21 Cheque Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_151_mf21_cheque_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>

                                                <!-- MF30 -->
                                                <div class="form-row"><span class="label_body">MF30</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Issue</span>
                                                    <input type="text" name="_161_mf30_date_of_issue" id="_161_mf30_date_of_issue" maxlength="6" size="6" class="mandatory" input_type="MF30 Date of Issue" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_mf30_date_of_issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>

                                                <!--MF32-->
                                                <div class="form-row"><span class="label_body">MF32a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                                                    <select id="type_mf32_amount_collected" name="type_mf32_amount_collected" class="mandatory" input_type="MF32a Amount" location="Body">
                                                        <option value="">choose a type</option>
                                                        <option value="a">A - Date, Currency, Amount</option>
                                                        <option value="b">B - Currency - Amount</option>
                                                    </select>
                                                    <div id="div_mf32a">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                                            <input type="text" name="_170_mf32a_date" id="_170_mf32a_date" maxlength="6" minlength="6" size="6" class="mandatory" input_type="MF32a Date" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                                            <input type="text" name="_171_mf32a_currency" id="_171_mf32a_currency" maxlength="3" minlength="3" class="mandatory" input_type="MF32a Currency" location="Body" size="3" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^a-zA-Z]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                                            <input type="text" name="_172_mf32a_amount" id="_172_mf32a_amount" maxlength="15" minlength="1" size="15" class="mandatory" input_type="MF32a Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_172_mf32a_amount');" onblur="cek_koma(this)"/>                                     
                                                        </div>

                                                    </div>
                                                    <div id="div_mf32b">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                                            <input type="text" name="_173_mf32b_currency" id="_173_mf32b_currency" maxlength="3" minlength="3" size="3" class="mandatory" input_type="MF32a Currency" location="Body" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^a-zA-Z]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                                            <input type="text" name="_174_mf32b_amount" id="_174_mf32b_amount" maxlength="15" minlength="1" size="15" class="mandatory" input_type="MF32a Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_172_mf32a_amount');" onblur="cek_koma(this)"/>                                     
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- OF50 -->
                                                <div class="form-row"><span class="label_body">OF50</span><span class="label">Payer</span>
                                                    <select id="type_of50_payer" name="type_of50_payer">
                                                        <option value="">choose a type</option>
                                                        <option value="a">A - BIC</option>
                                                        <option value="f">F - Number/Name and Address Details</option>
                                                        <option value="k">K - Name and Address</option>
                                                    </select>
                                                    <div id="div_of50a_">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                            <input type="text" name="_180_of50a_account" id="_180_of50a_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of50a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                            <input type="text" name="_181_of50a_identifier_code" id="_181_of50a_identifier_code" minlength="8" maxlength="11" class="mandatory" autocomplete="off" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^a-zA-Z0-9]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_of50a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                            <textarea name="_182_of50a_address" id="_182_of50a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_182_of50a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                        </div>
                                                    </div>
                                                    <!--20200709-->
                                                    <div id="div_mf50f_">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                            <input type="text" name="_183_of50f_account" id="_183_of50f_account" maxlength="35" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_183_of50f_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                            <select id="_184_mf50f_number" name="_184_mf50f_number" class="mandatory">
                                                                <option value=""></option>
                                                                <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_mf50f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                        <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_mf50f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                        <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_mf50f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                        <option value="4" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_mf50f_number'}"><c:if test="${item.detail=='4'}"> selected="true" </c:if></c:if></c:forEach>>4</option>
                                                        <option value="5" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_mf50f_number'}"><c:if test="${item.detail=='5'}"> selected="true" </c:if></c:if></c:forEach>>5</option>
                                                        <option value="6" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_mf50f_number'}"><c:if test="${item.detail=='6'}"> selected="true" </c:if></c:if></c:forEach>>6</option>
                                                        <option value="7" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_mf50f_number'}"><c:if test="${item.detail=='7'}"> selected="true" </c:if></c:if></c:forEach>>7</option>
                                                        <option value="8" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_mf50f_number'}"><c:if test="${item.detail=='8'}"> selected="true" </c:if></c:if></c:forEach>>8</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                <input type="text" name="_185_of50f_details" id="_185_of50f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_185_of50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                        </div>
                                                    </div>
                                                    <div id="div_mf50f_2">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 2</span>
                                                            <input type="checkbox" name="name_address_checkbox_2_50" id="name_address_checkbox_2_50" />
                                                            <div id="check_mf50f_2">
                                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                                    <select id="_186_of50f_number" name="_186_of50f_number" class="mandatory">
                                                                        <option value=""></option>
                                                                        <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_186_of50f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                                <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_186_of50f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                                <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_186_of50f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                                <option value="4" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_186_of50f_number'}"><c:if test="${item.detail=='4'}"> selected="true" </c:if></c:if></c:forEach>>4</option>
                                                                <option value="5" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_186_of50f_number'}"><c:if test="${item.detail=='5'}"> selected="true" </c:if></c:if></c:forEach>>5</option>
                                                                <option value="6" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_186_of50f_number'}"><c:if test="${item.detail=='6'}"> selected="true" </c:if></c:if></c:forEach>>6</option>
                                                                <option value="7" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_186_of50f_number'}"><c:if test="${item.detail=='7'}"> selected="true" </c:if></c:if></c:forEach>>7</option>
                                                                <option value="8" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_186_of50f_number'}"><c:if test="${item.detail=='8'}"> selected="true" </c:if></c:if></c:forEach>>8</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                        <input type="text" name="_187_of50f_details" id="_187_of50f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_187_of50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="div_mf50f_3">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 3</span>
                                                            <input type="checkbox" name="name_address_checkbox_3_50" id="name_address_checkbox_3_50" />
                                                            <div id="check_mf50f_3">
                                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                                    <select id="_188_of50f_number" name="_188_of50f_number" class="mandatory">
                                                                        <option value=""></option>
                                                                        <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_188_of50f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                                <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_188_of50f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                                <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_188_of50f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                                <option value="4" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_188_of50f_number'}"><c:if test="${item.detail=='4'}"> selected="true" </c:if></c:if></c:forEach>>4</option>
                                                                <option value="5" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_188_of50f_number'}"><c:if test="${item.detail=='5'}"> selected="true" </c:if></c:if></c:forEach>>5</option>
                                                                <option value="6" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_188_of50f_number'}"><c:if test="${item.detail=='6'}"> selected="true" </c:if></c:if></c:forEach>>6</option>
                                                                <option value="7" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_188_of50f_number'}"><c:if test="${item.detail=='7'}"> selected="true" </c:if></c:if></c:forEach>>7</option>
                                                                <option value="8" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_188_of50f_number'}"><c:if test="${item.detail=='8'}"> selected="true" </c:if></c:if></c:forEach>>8</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                        <input type="text" name="_189_of50f_details" id="_189_of50f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_189_of50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="div_mf50f_4">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 4</span>
                                                            <input type="checkbox" name="name_address_checkbox_4_50" id="name_address_checkbox_4_50" />
                                                            <div id="check_mf50f_4">
                                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                                    <select id="_190_of50f_number" name="_190_of50f_number" class="mandatory">
                                                                        <option value=""></option>
                                                                        <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of50f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                                <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of50f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                                <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of50f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                                <option value="4" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of50f_number'}"><c:if test="${item.detail=='4'}"> selected="true" </c:if></c:if></c:forEach>>4</option>
                                                                <option value="5" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of50f_number'}"><c:if test="${item.detail=='5'}"> selected="true" </c:if></c:if></c:forEach>>5</option>
                                                                <option value="6" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of50f_number'}"><c:if test="${item.detail=='6'}"> selected="true" </c:if></c:if></c:forEach>>6</option>
                                                                <option value="7" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of50f_number'}"><c:if test="${item.detail=='7'}"> selected="true" </c:if></c:if></c:forEach>>7</option>
                                                                <option value="8" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of50f_number'}"><c:if test="${item.detail=='8'}"> selected="true" </c:if></c:if></c:forEach>>8</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                        <input type="text" name="_191_of50f_details" id="_191_of50f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_191_of50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="div_mf50k_">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                            <input type="text" name="_192_of50k_account" id="_192_of50k_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_192_of50k_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                            <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_193_of50k_name_address" id="_193_of50k_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_193_of50k_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- OF52A -->
                                                <div class="form-row"><span class="label_body">OF52A</span><span class="label">Drawer Bank</span>
                                                    <select id="type_of52_Sender_of_Cash_Letter" name="type_of52_Sender_of_Cash_Letter">
                                                        <option value="">choose a type</option>
                                                        <option value="a">A - BIC</option>
                                                        <option value="b">B - Location</option>
                                                        <option value="d">D - Name and Address</option>
                                                    </select>
                                                    <div id="div_of52a_">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                            <input type="text" name="_290_of52a_Party_Identifier" id="_290_of52a_Party_Identifier" maxlength="37" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of52a_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)"/>
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                            <input type="text" name="_291_of52a_Identifier_Code" id="_291_of52a_Identifier_Code" minlength="8" maxlength="11" autocomplete="off" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^a-zA-Z0-9]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_291_of52a_Identifier_Code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                            <textarea disabled="true"><c:out value="${senderBank}" /></textarea>
                                                </div>
                                            </div>
                                            <div id="div_of52b_">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_292_of52b_Party_Identifier" id="_292_of52b_Party_Identifier" maxlength="37" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_292_of52b_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)"/>
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                            <input type="text" name="_293_of52b_Location" id="_293_of52b_Location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_293_of52b_Location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                        </div>
                                                    </div>
                                                    <div id="div_of52d_">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                            <input type="text" name="_294_of52d_Party_Identifier" id="_294_of52d_Party_Identifier" maxlength="37" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_294_of52d_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)"/>
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_295_of52d_Name_and_Address" id="_295_of52d_Name_and_Address" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_295_of52d_Name_and_Address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- M59/59A -->
                                                <div class="form-row"><span class="label_body">MF59a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Payee</span>
                                                    <select id="type_of59_59a_" name="type_of59_59a_" class="mandatory" input_type="MF59a Payee" location="Body">
                                                        <option value="">choose a type</option>
                                                        <option value="59">59 - Name and Address</option>
                                                        <option value="59f">59F - Number/Name and Address Details</option>
                                                    </select>
                                                    <div id="div_mf59_">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Account</span>
                                                            <input type="text" name="_300_mf59_account" id="_300_mf59_account" maxlength="35" size="40" input_type="MF59a Account" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_mf59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                        </div>
                                                <% if (session.getAttribute("flagStatus").equals("INC-WAIT") || session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
                                                <c:if test="${headerById.komentar=='Not Found'}">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">New Account</span>
                                                        <input type="text" name="acc_adj" id="acc_adj" maxlength="35" size="35" style="background-color: yellow" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_mf59_account'}"><c:out value="${item.info}" /></c:if></c:forEach>" onblur="cek_slash(this)">
                                                            </div>
                                                </c:if>
                                                <% }%>
                                                <% if (session.getAttribute("flagStatus").equals("INC-NOK") || session.getAttribute("flagStatus").equals("INC-WAIT")) {%>
                                                <c:if test="${headerById.komentar!='Not Found'}">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name from Core</span><span style="color: red; font-size: 13px">${nama_core}</span> 
                                                    </div>
                                                </c:if>
                                                <% }%>
                                                <% if (session.getAttribute("flagStatus").equals("INC-NSTP") || session.getAttribute("flagStatus").equals("INC-SPRT")) {%>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Customer Currency</span><span style="color: red; font-size: 13px">${headerById.cust_curr}</span> 
                                                </div>
                                                <% }%>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_301_mf59_name_address" id="_301_mf59_name_address" input_type="MF59a Name and Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_301_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>         
                                                        </div>
                                                <% if (session.getAttribute("flagStatus").equals("INC-WAIT") || session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
                                                <c:if test="${headerById.komentar=='Not Found'}">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">New Name</span>
                                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none; background-color: yellow" name="nm_adj" id="nm_adj"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_301_mf59_name_address'}"><c:out value="${item.info}" /></c:if></c:forEach></textarea>
                                                            </div>
                                                </c:if>
                                                <% }%>
                                            </div>
                                            <!--20200416-->
                                            <div id="div_mf59f_">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Account</span>
                                                    <input type="text" name="_302_mf59f_account" id="_302_mf59f_account" maxlength="35" input_type="MF59a Account" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_302_mf59f_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                        </div>
                                                <% if (session.getAttribute("flagStatus").equals("INC-WAIT") || session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
                                                <c:if test="${headerById.komentar=='Not Found'}">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">New Account</span>
                                                        <input type="text" name="acc_adj_f" id="acc_adj_f" maxlength="35" size="35" style="background-color: yellow" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_302_mf59f_account'}"><c:out value="${item.info}" /></c:if></c:forEach>" onblur="cek_slash(this)">
                                                            </div>
                                                </c:if>
                                                <% }%>
                                                <% if (session.getAttribute("flagStatus").equals("INC-NOK") || session.getAttribute("flagStatus").equals("INC-WAIT")) {%>
                                                <c:if test="${headerById.komentar!='Not Found'}">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name from Core</span><span style="color: red; font-size: 13px">${nama_core}</span> 
                                                    </div>
                                                </c:if>
                                                <% }%>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                    <select id="_303_mf59f_number" name="_303_mf59f_number" class="mandatory" input_type="MF59a Number" location="Body">
                                                        <option value=""></option>
                                                        <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_303_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                        <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_303_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                        <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_303_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                <input type="text" name="_304_mf59f_details" id="_304_mf59f_details" maxlength="33" class="mandatory" input_type="MF59a Details" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_304_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" /> 
                                                        </div>
                                                <% if (session.getAttribute("flagStatus").equals("INC-WAIT") || session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
                                                <c:if test="${headerById.komentar=='Not Found'}">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">New Name</span>
                                                        <input type="text" name="nm_adj_f" id="nm_adj_f" maxlength="33" style="background-color: yellow" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_304_mf59f_details'}"><c:out value="${item.info}" /></c:if></c:forEach>" /> 
                                                            </div>
                                                </c:if>
                                                <% }%>
                                            </div>
                                            <div id="div_mf59f_2">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 2</span>
                                                    <input type="checkbox" name="name_address_checkbox_2" id="name_address_checkbox_2" />
                                                    <div id="check_mf59f_2">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                            <select id="_305_mf59f_number" name="_305_mf59f_number" class="mandatory" input_type="MF59a Number" location="Body">
                                                                <option value=""></option>
                                                                <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_305_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                                <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_305_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                                <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_305_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                        <input type="text" name="_306_mf59f_details" id="_306_mf59f_details" maxlength="33" class="mandatory" input_type="MF59a Details" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_306_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="div_mf59f_3">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 3</span>
                                                            <input type="checkbox" name="name_address_checkbox_3" id="name_address_checkbox_3" />
                                                            <div id="check_mf59f_3">
                                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                                    <select id="_307_mf59f_number" name="_307_mf59f_number" class="mandatory" input_type="MF59a Number" location="Body">
                                                                        <option value=""></option>
                                                                        <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_307_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                                <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_307_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                                <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_307_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                        <input type="text" name="_308_mf59f_details" id="_308_mf59f_details" maxlength="33" class="mandatory" input_type="MF59a Details" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_308_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="div_mf59f_4">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 4</span>
                                                            <input type="checkbox" name="name_address_checkbox_4" id="name_address_checkbox_4" />
                                                            <div id="check_mf59f_4">
                                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                                    <select id="_309_mf59f_number" name="_309_mf59f_number" class="mandatory" input_type="MF59a Number" location="Body">
                                                                        <option value=""></option>
                                                                        <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_309_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                                        <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_309_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                                        <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_309_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                        <input type="text" name="_310_mf59f_details" id="_310_mf59f_details" maxlength="33" class="mandatory" input_type="MF59a Details" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <a id="renaa" href="#">Add Loop</a>

                                        <hr/>
                                    </div>
                                </div>

                        <div id="view3" class="tabcontent">
                            <%@ include file="comment_mt.jsp" %>
                        </div>
                        <div id="view4" class="tabcontent">
                            <%@ include file="history_mt.jsp" %>
                        </div>
                        <div id="view5" class="tabcontent">
                            <%@ include file="logTrx_mt.jsp" %>
                        </div>
                        <div id="view6" class="tabcontent">
                            <%@ include file="relation_mt.jsp" %>
                        </div>
                        <div id="view7" class="tab-content">
                            <div class="form-row">
                                <%@include file="mt_mx.jsp" %>
                            </div>
                        </div>
                        <div id="view8" class="tabcontent">
                            <div id="error-container"></div>
                        </div>
                    </div>
                </div>
                <%@ include file="button_action.jsp" %>
            </form>
        </c:if>
    </c:forEach>
</div>

<script>
    // Fungsi untuk mengambil parameter dari URL
    function getQueryParameter(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    // Mengecek apakah ada parameter hideView1 di URL
    if (getQueryParameter('create') === 'true') {
        // Menyembunyikan tab view1 dan seluruh kontennya
        const tabView7 = document.getElementById('tabView7');
        const view1Content = document.getElementById('view7');

        if (tabView7)
            tabView7.style.display = 'none'; // Sembunyikan tab link
        if (view7Content)
            view7Content.style.display = 'none'; // Sembunyikan konten view1
    } else {
        // Tampilkan view1 jika tidak ada parameter untuk menyembunyikan
        document.getElementById('view7').classList.add('active');
    }
</script>

<script type="text/javascript" src="js/json-xml-data-tree/data-tree.js"></script>
<script>
    var xmldat = document.getElementById("mxview3").value;
    new DataTree({
        xml: xmldat,
        container: '#mxfull',
        attrs: 'show',
        startExpanded: true
    });
</script>


