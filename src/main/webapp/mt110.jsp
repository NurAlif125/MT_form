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
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sender's Reference</span>
                                <input type="text" name="_010_mf20_senders_reference" id="_010_mf20_senders_reference" class="mandatory" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_senders_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
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
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
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
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
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
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
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
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
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
                                                <div class="form-row"><span class="label_body">MF21</span><span class="label">Cheque Number</span>
                                                    <input type="text" name="_151_mf21_cheque_number" id="_151_mf21_cheque_number" maxlength="16" value="" class="mandatory"/>
                                                </div>

                                                <!-- MF30 -->
                                                <div class="form-row"><span class="label_body">MF30</span><span class="label">Date of Issue</span>
                                                    <input type="text" name="_161_mf30_date_of_issue" id="_161_mf30_date_of_issue" maxlength="6" size="6" value="" class="mandatory"/>
                                                </div>

                                                <!--MF32-->
                                                <div class="form-row"><span class="label_body">MF32a</span><span class="label">Amount</span>
                                                    <select id="type_mf32_amount_collected" name="type_mf32_amount_collected" class="mandatory">
                                                        <option value="">choose a type</option>
                                                        <option value="a">A - Date, Currency, Amount</option>
                                                        <option value="b">B - Currency - Amount</option>
                                                    </select>
                                                    <div id="div_mf32a">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                                            <input type="text" name="_170_mf32a_date" id="_170_mf32a_date" maxlength="6" minlength="6" size="6" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                                            <input type="text" name="_171_mf32a_currency" id="_171_mf32a_currency" maxlength="3" minlength="3" class="mandatory" size="3" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^a-zA-Z]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                                            <input type="text" name="_172_mf32a_amount" id="_172_mf32a_amount" maxlength="15" minlength="1" size="15" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_172_mf32a_amount');" onblur="cek_koma(this)"/>                                     
                                                        </div>

                                                    </div>
                                                    <div id="div_mf32b">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                                            <input type="text" name="_173_mf32b_currency" id="_173_mf32b_currency" maxlength="3" minlength="3" size="3" class="mandatory" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^a-zA-Z]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                                            <input type="text" name="_174_mf32b_amount" id="_174_mf32b_amount" maxlength="15" minlength="1" size="15" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_172_mf32a_amount');" onblur="cek_koma(this)"/>                                     
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
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
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
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
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
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
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
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_295_of52d_Name_and_Address" id="_295_of52d_Name_and_Address" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_295_of52d_Name_and_Address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- M59/59A -->
                                                <div class="form-row"><span class="label_body">MF59</span><span class="label">Payee</span>
                                                    <select id="type_of59_59a_" name="type_of59_59a_" class="mandatory">
                                                        <option value="">choose a type</option>
                                                        <option value="59">59 - Name and Address</option>
                                                        <option value="59f">59F - Number/Name and Address Details</option>
                                                    </select>
                                                    <div id="div_mf59_">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                            <input type="text" name="_300_mf59_account" id="_300_mf59_account" maxlength="35" size="40" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_mf59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
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
                                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_301_mf59_name_address" id="_301_mf59_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_301_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>         
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
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                    <input type="text" name="_302_mf59f_account" id="_302_mf59f_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_302_mf59f_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
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
                                                    <select id="_303_mf59f_number" name="_303_mf59f_number" class="mandatory">
                                                        <option value=""></option>
                                                        <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_303_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                        <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_303_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                        <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_303_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                <input type="text" name="_304_mf59f_details" id="_304_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_304_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" /> 
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
                                                            <select id="_305_mf59f_number" name="_305_mf59f_number" class="mandatory">
                                                                <option value=""></option>
                                                                <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_305_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                                <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_305_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                                <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_305_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                        <input type="text" name="_306_mf59f_details" id="_306_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_306_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="div_mf59f_3">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 3</span>
                                                            <input type="checkbox" name="name_address_checkbox_3" id="name_address_checkbox_3" />
                                                            <div id="check_mf59f_3">
                                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                                    <select id="_307_mf59f_number" name="_307_mf59f_number" class="mandatory">
                                                                        <option value=""></option>
                                                                        <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_307_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                                <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_307_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                                <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_307_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                        <input type="text" name="_308_mf59f_details" id="_308_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_308_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="div_mf59f_4">
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 4</span>
                                                            <input type="checkbox" name="name_address_checkbox_4" id="name_address_checkbox_4" />
                                                            <div id="check_mf59f_4">
                                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                                    <select id="_309_mf59f_number" name="_309_mf59f_number" class="mandatory">
                                                                        <option value=""></option>
                                                                        <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_309_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                                <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_309_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                                <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_309_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                        <input type="text" name="_310_mf59f_details" id="_310_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
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


<script>
    $(document).ready(function () {
        checkForExistingData();



        let loopCounter = 1;

        // Set maximum allowed loops to 10
        const MAX_LOOPS = 10;

        // Store the base IDs and find the highest ID number
        let baseIdMap = {};
        let highestIdNumber = 0;

        // Find the highest ID number in the original form
        $('#loop-set').find('[id^="_"]').each(function () {
            let id = $(this).attr('id');
            let baseIdMatch = id.match(/^_(\d+)_(.+)$/);
            if (baseIdMatch) {
                let numPart = parseInt(baseIdMatch[1]);
                let namePart = baseIdMatch[2];
                baseIdMap[namePart] = numPart;

                // Keep track of highest numeric ID
                if (numPart > highestIdNumber) {
                    highestIdNumber = numPart;
                }
            }
        });


        // Initialize event handlers for the first form set
        initializeDropdowns($('#loop-set'));

        // Initialize datepickers for the first form set with a small delay
        setTimeout(function () {
            initializeDatepickers($('#loop-set'));
        }, 100);

        initializeCurrencyFormatting($('#loop-set'));


        // Initialize default visibility states
        $('#type_mf32_amount_collected').trigger('change');
        $('#type_of50_payer').trigger('change');
        $('#type_of52_Sender_of_Cash_Letter').trigger('change');
        $('#type_of59_59a_').trigger('change');

        // Hide checkbox content divs initially
        $('div[id^="check_mf59f_"]').hide();
        $('div[id^="check_mf50f_"]').hide();

        // Check if we have pre-generated data
        // We'll use a function to determine if there's data beyond the first loop
        //checkForExistingData();

        // Add button click handler
        $('#renaa').click(function (e) {
            e.preventDefault();

            // Check if we've reached the maximum number of loops
            if (loopCounter >= MAX_LOOPS) {
                alert('Maximum limit of ' + MAX_LOOPS + ' entries reached.');
                return;
            }

            // Increment counter for unique IDs
            loopCounter++;

            // Clone the loop set
            let $newSet = $('#loop-set').clone(true);

            // Update the main container ID
            $newSet.attr('id', 'loop-set-' + loopCounter);

            // Update dropdown IDs
            $newSet.find('select[id^="type_"]').each(function () {
                let oldId = $(this).attr('id');
                let newId = oldId + '_' + loopCounter;
                $(this).attr('id', newId);

                // Also update any labels that point to this ID
                $newSet.find('label[for="' + oldId + '"]').attr('for', newId);
            });

            // Update div IDs
            $newSet.find('div[id^="div_"], div[id^="check_"]').each(function () {
                let oldId = $(this).attr('id');
                if (oldId && oldId !== 'loop-container') {
                    let newId = oldId + '_' + loopCounter;
                    $(this).attr('id', newId);
                }
            });

            // Calculate the offset for incrementing the numeric IDs
            // Each new form set will have IDs starting from (highestIdNumber * loopCounter)
            let idOffset = highestIdNumber * (loopCounter - 1);

            // Update field IDs with incrementing numeric part
            $newSet.find('[id^="_"]').each(function () {
                let oldId = $(this).attr('id');
                let idMatch = oldId.match(/^_(\d+)_(.+)$/);

                if (idMatch) {
                    let numPart = parseInt(idMatch[1]);
                    let namePart = idMatch[2];

                    // Create the new ID with incremented number
                    // Add the offset to ensure IDs are always higher than the highest in the original form
                    let newNum = numPart + idOffset;
                    let newId = '_' + newNum + '_' + namePart;
                    $(this).attr('id', newId);

                    // Update the name attribute too
                    if ($(this).attr('name') === oldId) {
                        $(this).attr('name', newId);
                    }
                }
            });

            // Update all remaining input, select, and textarea elements
            $newSet.find('input, select, textarea').each(function () {
                // Skip elements we've already processed
                if (!$(this).attr('id') || !$(this).attr('id').startsWith('_')) {
                    let oldName = $(this).attr('name');
                    let oldId = $(this).attr('id');

                    if (oldName && !oldName.startsWith('_')) {
                        let newName = oldName + '_' + loopCounter;
                        $(this).attr('name', newName);
                    }

                    if (oldId && !oldId.startsWith('_') && !oldId.startsWith('type_')) {
                        let newId = oldId + '_' + loopCounter;
                        $(this).attr('id', newId);

                        // Also update any labels that point to this ID
                        $newSet.find('label[for="' + oldId + '"]').attr('for', newId);
                    }
                }

                // Clear values for text inputs and textareas
                if ($(this).is('input[type="text"]') || $(this).is('textarea')) {
                    $(this).val('');
                    // Ensure the field is editable
                    $(this).prop('disabled', false);
                    $(this).prop('readonly', false);
                }

                // Uncheck checkboxes
                if ($(this).is('input[type="checkbox"]')) {
                    $(this).prop('checked', false);
                }

                // Reset dropdowns to default
                if ($(this).is('select')) {
                    $(this).val('');
                }
            });

            // Reset dropdown values more explicitly and hide all conditional divs
            $newSet.find('select').each(function () {
                // Reset to first option or empty
                $(this).val('');
            });

            // Hide all conditional divs initially
            $newSet.find('div[id*="div_mf32a"], div[id*="div_mf32b"]').hide();
            $newSet.find('div[id*="div_of50a_"], div[id*="div_mf50f_"], div[id*="div_mf50k_"]').hide();
            $newSet.find('div[id*="div_of52a_"], div[id*="div_of52b_"], div[id*="div_of52d_"]').hide();
            $newSet.find('div[id*="div_mf59_"], div[id*="div_mf59f_"]').hide();
            $newSet.find('div[id*="check_mf59f_"], div[id*="check_mf50f_"]').hide();

            // Append the cloned and modified set to the container
            $newSet.appendTo('#loop-container');

            // Remove any previous event handlers
            $newSet.find('input, select, textarea').off();

            // Reinitialize event handlers for the new set
            initializeDropdowns($newSet);

            // Initialize datepickers for the new set with a small delay
            setTimeout(function () {
                initializeDatepickers($newSet);
            }, 100);

            initializeCurrencyFormatting($newSet);


            // Make sure all form controls are enabled and focus works
            enableFormControls($newSet);

            // Add a visual separator between form sets
            $newSet.prepend('<div class="set-separator" style="border-top: 2px dashed #ccc; margin: 15px 0; padding-top: 15px;"><strong>Entry #' + loopCounter + '</strong></div>');

            // Disable the add button if we've reached the maximum
            if (loopCounter >= MAX_LOOPS) {
                $('#renaa').prop('disabled', true);
                $('#renaa').css('opacity', '0.5');
            }
        });

        // Handler to remove the last added set - Changed to an anchor tag
        $('#renaa').after('<a href="#" id="remove-last-set" style="margin-left: 10px;">Remove Last Set</a>');

        // Handler for remove link
        $('#remove-last-set').on('click', function (e) {
            e.preventDefault();
            if (loopCounter > 1) {
                $('#loop-set-' + loopCounter).remove();
                loopCounter--;

                // Re-enable the add button if we're below the maximum
                if (loopCounter < MAX_LOOPS) {
                    $('#renaa').prop('disabled', false);
                    $('#renaa').css('opacity', '1');
                }
            }
        });
        function checkForExistingData() {
            const idHeaders = $('#id').val();

            if (!idHeaders)
                return;

            $.ajax({
                url: 'SCMf21List',
                type: 'GET',
                data: {id: idHeaders},
                dataType: 'json',
                success: function (data) {
                    // Hitung berapa banyak tag _mf21_ untuk trigger klik #renaa
                    const mf21Tags = data.filter(tag => tag.tagName.includes("_mf21_"));

                    // Trigger klik #renaa sebanyak jumlah mf21 tags - 1 (karena 1 sudah ada)
                    const toTrigger = mf21Tags.length > 1 ? mf21Tags.length - 1 : 0;
                    for (let i = 0; i < toTrigger; i++) {
                        $("#renaa").trigger("click");
                    }

                    // Karena klik #renaa asyncronous, kita tunda isi data input sampai elemen muncul
                    // Bisa pakai setTimeout sederhana (tweak sesuai kebutuhan)
                    setTimeout(() => {
                        fillInputs(data);
                        validate_rule();
                    }, 500);
                },
                error: function (xhr, status, error) {
                    console.error("Gagal ambil data:", error);
                }
            });
        }

        function fillInputs(data) {
            data.forEach(tag => {
                const input = document.getElementById(tag.tagName) || document.querySelector(`[name="${tag.tagName}"]`);
                if (input) {
                    input.value = tag.detail;
                } else {
                    console.warn(`Input dengan id/name ${tag.tagName} tidak ditemukan`);
                }
            });
        }


        // Function to populate a loop with existing data
        function populateLoopData(loopIndex) {
            // The actual implementation depends on how your data is stored
            // For this example, I'll assume you're storing the data in data attributes or hidden fields

            // Get the loop container
            const $loopContainer = $('#loop-set-' + loopIndex);
            if (!$loopContainer.length)
                return;

            // Find all input, select, textarea elements in this loop
            $loopContainer.find('input, select, textarea').each(function () {
                const id = $(this).attr('id');
                if (!id)
                    return;

                // Try to find a matching data element for this field
                // The implementation depends on how your data is stored
                // Example: data might be in <input type="hidden" id="data_2_fieldname" value="value">
                const dataElementId = 'data_' + loopIndex + '_' + id.replace(/^.*_([^_]+)$/, '$1');
                const $dataElement = $('#' + dataElementId);

                if ($dataElement.length) {
                    const value = $dataElement.val();

                    // Set the value appropriately based on element type
                    if ($(this).is('input[type="checkbox"]')) {
                        $(this).prop('checked', value === 'true' || value === '1');
                    } else if ($(this).is('select')) {
                        $(this).val(value);
                        // Trigger change to show/hide conditional sections
                        $(this).trigger('change');
                    } else {
                        $(this).val(value);
                    }
                }
            });

            // Ensure dropdowns trigger their change events to show/hide conditional content
            $loopContainer.find('select[id*="type_"]').each(function () {
                $(this).trigger('change');
            });

            // If there are checkboxes that control visibility of other elements, trigger their change events
            $loopContainer.find('input[type="checkbox"][id*="name_address_checkbox"]').each(function () {
                $(this).trigger('change');
            });
        }
    });

// Function to initialize dropdown change events
    function initializeDropdowns($container) {
        // Handle MF32 dropdown
        $container.find('select[id*="type_mf32_amount_collected"]').on('change', function () {
            let selectedValue = $(this).val();
            let divA = $(this).closest('.form-row').find('div[id*="div_mf32a"]');
            let divB = $(this).closest('.form-row').find('div[id*="div_mf32b"]');

            divA.hide();
            divB.hide();

            if (selectedValue === 'a') {
                divA.show();
            } else if (selectedValue === 'b') {
                divB.show();
            }
        });

        // Handle OF50 dropdown
        $container.find('select[id*="type_of50_payer"]').on('change', function () {
            let selectedValue = $(this).val();
            let formRow = $(this).closest('.form-row');

            // Hide all OF50 related divs in this container
            formRow.find('div[id*="div_of50a_"], div[id*="div_mf50f_"], div[id*="div_mf50k_"]').hide();

            if (selectedValue === 'a') {
                formRow.find('div[id*="div_of50a_"]').show();
            } else if (selectedValue === 'f') {
                formRow.find('div[id*="div_mf50f_"]').show();
            } else if (selectedValue === 'k') {
                formRow.find('div[id*="div_mf50k_"]').show();
            }
        });

        // Handle OF52 dropdown
        $container.find('select[id*="type_of52_Sender_of_Cash_Letter"]').on('change', function () {
            let selectedValue = $(this).val();
            let formRow = $(this).closest('.form-row');

            // Hide all OF52 related divs in this container
            formRow.find('div[id*="div_of52a_"], div[id*="div_of52b_"], div[id*="div_of52d_"]').hide();

            if (selectedValue === 'a') {
                formRow.find('div[id*="div_of52a_"]').show();
            } else if (selectedValue === 'b') {
                formRow.find('div[id*="div_of52b_"]').show();
            } else if (selectedValue === 'd') {
                formRow.find('div[id*="div_of52d_"]').show();
            }
        });

        // Handle MF59 dropdown
        $container.find('select[id*="type_of59_59a_"]').on('change', function () {
            let selectedValue = $(this).val();
            let formRow = $(this).closest('.form-row');

            // Hide all MF59 related divs in this container
            formRow.find('div[id*="div_mf59_"], div[id*="div_mf59f_"]').hide();

            if (selectedValue === '59') {
                formRow.find('div[id*="div_mf59_"]').show();
            } else if (selectedValue === '59f') {
                formRow.find('div[id*="div_mf59f_"]').show();
            }
        });

        // Handle checkboxes for the address details sections
        $container.find('input[type="checkbox"][id*="name_address_checkbox_2"]').on('change', function () {
            if ($(this).is(':checked')) {
                $(this).closest('div').find('div[id*="check_mf59f_2"]').show();
            } else {
                $(this).closest('div').find('div[id*="check_mf59f_2"]').hide();
            }
        });

        $container.find('input[type="checkbox"][id*="name_address_checkbox_3"]').on('change', function () {
            if ($(this).is(':checked')) {
                $(this).closest('div').find('div[id*="check_mf59f_3"]').show();
            } else {
                $(this).closest('div').find('div[id*="check_mf59f_3"]').hide();
            }
        });

        $container.find('input[type="checkbox"][id*="name_address_checkbox_4"]').on('change', function () {
            if ($(this).is(':checked')) {
                $(this).closest('div').find('div[id*="check_mf59f_4"]').show();
            } else {
                $(this).closest('div').find('div[id*="check_mf59f_4"]').hide();
            }
        });

        // Similarly for OF50 checkboxes
        $container.find('input[type="checkbox"][id*="name_address_checkbox_2_50"]').on('change', function () {
            if ($(this).is(':checked')) {
                $(this).closest('div').find('div[id*="check_mf50f_2"]').show();
            } else {
                $(this).closest('div').find('div[id*="check_mf50f_2"]').hide();
            }
        });

        $container.find('input[type="checkbox"][id*="name_address_checkbox_3_50"]').on('change', function () {
            if ($(this).is(':checked')) {
                $(this).closest('div').find('div[id*="check_mf50f_3"]').show();
            } else {
                $(this).closest('div').find('div[id*="check_mf50f_3"]').hide();
            }
        });

        $container.find('input[type="checkbox"][id*="name_address_checkbox_4_50"]').on('change', function () {
            if ($(this).is(':checked')) {
                $(this).closest('div').find('div[id*="check_mf50f_4"]').show();
            } else {
                $(this).closest('div').find('div[id*="check_mf50f_4"]').hide();
            }
        });

        // Trigger change events for all dropdowns to set correct initial state
        $container.find('select[id*="type_mf32_amount_collected"]').trigger('change');
        $container.find('select[id*="type_of50_payer"]').trigger('change');
        $container.find('select[id*="type_of52_Sender_of_Cash_Letter"]').trigger('change');
        $container.find('select[id*="type_of59_59a_"]').trigger('change');
    }

// Function to initialize datepickers for date fields
    function initializeDatepickers($container) {
        // Remove any existing datepicker instances first
        $container.find('input').each(function () {
            if ($(this).hasClass('hasDatepicker')) {
                $(this).datepicker('destroy');
            }
        });

        // Find all input fields and check their ID/name for date patterns
        $container.find('input[type="text"]').each(function () {
            let fieldId = $(this).attr('id') || '';
            let fieldName = $(this).attr('name') || '';

            // Check if ID or name contains the date field patterns
            if (fieldId.includes('mf30_date_of_issue') || fieldName.includes('mf30_date_of_issue') ||
                    fieldId.includes('mf32a_date') || fieldName.includes('mf32a_date')) {

                console.log('Initializing datepicker for field:', fieldId || fieldName); // Debug log

                $(this).datepicker({
                    dateFormat: "ymmdd",
                });
            }
        });

        // Alternative approach using attribute selectors that handle special characters
        try {
            // Use more specific selectors for the exact patterns
            $container.find('input[id*="mf30_date_of_issue"], input[name*="mf30_date_of_issue"]').each(function () {
                if (!$(this).hasClass('hasDatepicker')) {
                    console.log('Found mf30_date_of_issue field:', $(this).attr('id') || $(this).attr('name'));
                    $(this).datepicker({
                        dateFormat: "ymmdd"
                    }, new Date());
                }
            });

            $container.find('input[id*="mf32a_date"], input[name*="mf32a_date"]').each(function () {
                if (!$(this).hasClass('hasDatepicker')) {
                    console.log('Found mf32a_date field:', $(this).attr('id') || $(this).attr('name'));
                    $(this).datepicker({
                        dateFormat: "ymmdd"
                    }, new Date());
                }
            });
        } catch (e) {
            console.error('Error in datepicker selector:', e);
        }
    }

// Function to ensure all form controls are enabled
    function enableFormControls($container) {
        $container.find('input, select, textarea').each(function () {
            $(this).prop('disabled', false);
            $(this).prop('readonly', false);

            // Re-bind focus and click events
            $(this).on('focus click', function (e) {
                e.stopPropagation();
            });
        });
    }

    function initializeCurrencyFormatting($container) {
        // Find all amount input fields in the container
        $container.find('input[id*="_amount"]').each(function () {
            const $input = $(this);
            const inputId = $input.attr('id');
            
            // Create or update the currency display element
            let $currencyDisplay = $input.siblings('.currency-display');
            if ($currencyDisplay.length === 0) {
                $currencyDisplay = $('<span class="currency-display" style="margin-left: 50px; font-size: 10px; color: red;"></span>');
                $input.after($currencyDisplay);
            }

            // Update currency display on input change
            $input.on('input blur', function () {
                updateCurrencyDisplay(this);
            });

            // Initial currency display update
            updateCurrencyDisplay(this);
        });
    }

    // Function to update currency display
    function updateCurrencyDisplay(inputElement) {
        const $input = $(inputElement);
        const value = $input.val();
        const $currencyDisplay = $input.siblings('.currency-display');
        
        if (value && value.trim() !== '') {
            try {
                const number = value.replace(',', '.');
                const numberF = parseFloat(number);
                
                if (!isNaN(numberF)) {
                    const nominal = formatUang(numberF, "");
                    //$currencyDisplay.html(nominal);
                } else {
                   // $currencyDisplay.html('');
                }
            } catch (e) {
                $currencyDisplay.html('');
            }
        } else {
            $currencyDisplay.html('');
        }
    }

    // Currency formatting function
    function formatUang(n, currency) {
        if (isNaN(n)) return '';
        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
    }

    function validate_rule() {
        //mf32_2
        if ($("#_480_mf32a_date").val() != "" || $("#_481_mf32a_currency").val() != "" || $("#_482_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_2").val("a").attr("selected", true);
            $("#div_mf32a_2").show();
            $("#div_mf32b_2").hide();
            $("#_480_mf32a_date").attr("disabled", false);
            $("#_481_mf32a_currency").attr("disabled", false);
            $("#_482_mf32a_amount").attr("disabled", false);
            $("#_483_mf32b_currency").attr("disabled", true);
            $("#_484_mf32b_amount").attr("disabled", true);
        } else if ($("#_483_mf32b_currency").val() != "" || $("#_484_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_2").val("b").attr("selected", true);
            $("#div_mf32a_2").hide();
            $("#div_mf32b_2").show();
            $("#_480_mf32a_date").attr("disabled", true);
            $("#_481_mf32a_currency").attr("disabled", true);
            $("#_482_mf32a_amount").attr("disabled", true);
            $("#_483_mf32b_currency").attr("disabled", false);
            $("#_484_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_2").val("").attr("selected", true);
            $("#div_mf32a_2").hide();
            $("#div_mf32b_2").hide();
        }
     
        //of50_2
        if ($("#_490_of50a_account").val() != "" || $("#_491_of50a_identifier_code").val() != "" || $("#_492_of50a_address").val() != "") {
            $("#type_of50_payer_2").val("a").attr("selected", true);
            $("#div_of50a__2").show();
            $("#div_mf50f__2").hide();
            $("#div_mf50f_2_2").hide();
            $("#div_mf50f_3_2").hide();
            $("#div_mf50f_4_2").hide();
            $("#div_mf50k__2").hide();
            $("#_490_of50a_account").attr("disabled", false);
            $("#_491_of50a_identifier_code").attr("disabled", false);
            $("#_492_of50a_address").attr("disabled", false);
            $("#_493_of50f_account").attr("disabled", true);
            $("#_494_mf50f_number").attr("disabled", true);
            $("#_495_of50f_details").attr("disabled", true);
            $("#_496_of50f_number").attr("disabled", true);
            $("#_497_of50f_details").attr("disabled", true);
            $("#_498_of50f_number").attr("disabled", true);
            $("#check_mf50f_2_2").attr("disabled", true);
            $("#check_mf50f_3_2").attr("disabled", true);
            $("#check_mf50f_4_2").attr("disabled", true);
        } else if ($("#_493_of50f_account").val() != "" || $("#_494_mf50f_number").val() != "" || $("#_495_of50f_details").val() != "") {
            $("#type_of50_payer_2").val("f").attr("selected", true);
            $("#div_of50a__2").hide();
            $("#div_mf50f__2").show();
            $("#div_mf50f_2_2").show();
            $("#div_mf50f_3_2").show();
            $("#div_mf50f_4_2").show();
            $("#div_mf50k__2").hide();
            $("#_490_of50a_account").attr("disabled", true);
            $("#_491_of50a_identifier_code").attr("disabled", true);
            $("#_492_of50a_address").attr("disabled", true);
            $("#_493_of50f_account").attr("disabled", false);
            $("#_494_mf50f_number").attr("disabled", false);
            $("#_495_of50f_details").attr("disabled", false);
        } else if ($("#_502_of50k_account").val() != "" || $("#_503_of50k_name_address").val() != "") {
            $("#type_of50_payer_2").val("k").attr("selected", true);
            $("#div_of50a__2").hide();
            $("#div_mf50f__2").hide();
            $("#div_mf50f_2_2").hide();
            $("#div_mf50f_3_2").hide();
            $("#div_mf50f_4_2").hide();
            $("#div_mf50k__2").show();
            //_502_of50k_account
            $("#_490_of50a_account").attr("disabled", true);
            $("#_491_of50a_identifier_code").attr("disabled", true);
            $("#_492_of50a_address").attr("disabled", true);
            $("#_493_of50f_account").attr("disabled", true);
            $("#_494_mf50f_number").attr("disabled", true);
            $("#_495_of50f_details").attr("disabled", true);
            $("#_502_of50k_account").attr("disabled", false);
            $("#_503_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__2").hide();
            $("#div_mf50f__2").hide();
            $("#div_mf50f_2_2").hide();
            $("#div_mf50f_3_2").hide();
            $("#div_mf50f_4_2").hide();
            $("#div_mf50k__2").hide();
            $("#check_mf50f_2_2").hide();
            $("#check_mf50f_3_2").hide();
            $("#check_mf50f_4_2").hide();

        }

        //of50_2
        if ($("#_496_of50f_number").val() != "" || $("#_497_of50f_details").val() != "") {
            $("#name_address_checkbox_2_50").prop("checked", true);
            $("#check_mf50f_2").show();
        } else {
            $("#name_address_checkbox_2_50").prop("checked", false);
            $("#check_mf50f_2").hide();
        }

        //mf50_3
        if ($("#_498_of50f_number").val() != "" || $("#_499_of50f_details").val() != "") {
            $("#name_address_checkbox_3_50_2").prop("checked", true);
            $("#check_mf50f_3").show();
        } else {
            $("#name_address_checkbox_3_50_2").prop("checked", false);
            $("#check_mf50f_3").hide();
        }

        //mf50_4
        if ($("#_500_of50f_number").val() != "" || $("#_501_of50f_details").val() != "") {
            $("#name_address_checkbox_4_50_2").prop("checked", true);
            $("#check_mf50f_4").show();
        } else {
            $("#name_address_checkbox_4_50_2").prop("checked", false);
            $("#check_mf50f_4").hide();
        }
        
        //mf59_2
        $("#div_mf59f__2").hide();
        $("#div_mf59f_2_2").hide();
        $("#div_mf59f_3_2").hide();
        $("#div_mf59f_4_2").hide();
        $("#_610_mf59_account").attr("disabled", true);
        $("#_611_mf59_name_address").attr("disabled", true);
        $("#_612_mf59f_account").attr("disabled", true);
        $("#_613_mf59f_number").attr("disabled", true);
        $("#_614_mf59f_details").attr("disabled", true);
        $("#_615_mf59f_number").attr("disabled", true);
        $("#_616_mf59f_details").attr("disabled", true);
        $("#_617_mf59f_number").attr("disabled", true);
        $("#_618_mf59f_details").attr("disabled", true);
        $("#_619_mf59f_number").attr("disabled", true);
        $("#_620_mf59f_details").attr("disabled", true);
        $("#name_address_checkbox_2_2").attr("disabled", true);
        $("#name_address_checkbox_3_2").attr("disabled", true);
        $("#name_address_checkbox_4_2").attr("disabled", true);
        $("#type_of59_59a__2").change(function () {
            if ($("#type_of59_59a__2").val() == "59") {
                $("#div_mf59__2").show();
                $("#div_mf59f__2").hide();
                $("#div_mf59f_2_2").hide();
                $("#div_mf59f_3_2").hide();
                $("#div_mf59f_4_2").hide();
                $("#_610_mf59_account").attr("disabled", false);
                $("#_611_mf59_name_address").attr("disabled", false);
                $("#_612_mf59f_account").attr("disabled", true);
                $("#_613_mf59f_number").attr("disabled", true);
                $("#_614_mf59f_details").attr("disabled", true);
                $("#_615_mf59f_number").attr("disabled", true);
                $("#_616_mf59f_details").attr("disabled", true);
                $("#_617_mf59f_number").attr("disabled", true);
                $("#_618_mf59f_details").attr("disabled", true);
                $("#_619_mf59f_number").attr("disabled", true);
                $("#_620_mf59f_details").attr("disabled", true);
                $("#name_address_checkbox_2_2").attr("disabled", true);
                $("#name_address_checkbox_3_2").attr("disabled", true);
                $("#name_address_checkbox_4_2").attr("disabled", true);
            } else if ($("#type_of59_59a__2").val() == "59f") {
                $("#div_mf59__2").hide();
                $("#div_mf59f__2").show();
                $("#div_mf59f_2_2").show();
                $("#div_mf59f_3_2").show();
                $("#div_mf59f_4_2").show();
                $("#_610_mf59_account").attr("disabled", true);
                $("#_611_mf59_name_address").attr("disabled", true);
                $("#_610_mf59_account").prop("required", true);
                $("#_611_mf59_name_address").attr("required", false);
                $("#_612_mf59f_account").attr("disabled", false);
                $("#_613_mf59f_number").attr("disabled", false);
                $("#_614_mf59f_details").attr("disabled", false);
                $("#_615_mf59f_number").attr("disabled", false);
                $("#_616_mf59f_details").attr("disabled", false);
                $("#_617_mf59f_number").attr("disabled", false);
                $("#_618_mf59f_details").attr("disabled", false);
                $("#_619_mf59f_number").attr("disabled", false);
                $("#_620_mf59f_details").attr("disabled", false);
                $("#name_address_checkbox_2_2").attr("disabled", false);
                $("#name_address_checkbox_3_2").attr("disabled", false);
                $("#name_address_checkbox_4_2").attr("disabled", false);
                $("#_619_mf59f_number").prop("required", true);
                $("#_620_mf59f_details").prop("required", true);
            } else {
                $("#div_mf59__2").hide();
                $("#div_mf59f__2").hide();
                $("#div_mf59f_2_2").hide();
                $("#div_mf59f_3_2").hide();
                $("#div_mf59f_4_2").hide();
                $("#_610_mf59_account").attr("disabled", true);
                $("#_611_mf59_name_address").attr("disabled", true);
                $("#_612_mf59f_account").attr("disabled", true);
                $("#_613_mf59f_number").attr("disabled", true);
                $("#_614_mf59f_details").attr("disabled", true);
                $("#_615_mf59f_number").attr("disabled", true);
                $("#_616_mf59f_details").attr("disabled", true);
                $("#_617_mf59f_number").attr("disabled", true);
                $("#_618_mf59f_details").attr("disabled", true);
                $("#_619_mf59f_number").attr("disabled", true);
                $("#_620_mf59f_details").attr("disabled", true);
                $("#name_address_checkbox_2_2").attr("disabled", true);
                $("#name_address_checkbox_3_2").attr("disabled", true);
                $("#name_address_checkbox_4_2").attr("disabled", true);
            }
        });

        //mf59_2
        $("#name_address_checkbox_2_2").hide();
        $("#_615_mf59f_number").prop("required", false);
        $("#_616_mf59f_details").prop("required", false);
        $("#name_address_checkbox_2_2").click(function () {
            if ($("#name_address_checkbox_2_2").is(":checked")) {
                $("#check_mf59f__2").show();
                $("#_615_mf59f_number").prop("required", true);
                $("#_616_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f__2").hide();
                $("#_615_mf59f_number").prop("required", false);
                $("#_616_mf59f_details").prop("required", false);
            }
        });

        //mf59_3
        $("#name_address_checkbox_3_2").hide();
        $("#_617_mf59f_number").prop("required", false);
        $("#_618_mf59f_details").prop("required", false);
        $("#name_address_checkbox_3_2").click(function () {
            if ($("#name_address_checkbox_3_2").is(":checked")) {
                $("#check_mf59f_3_2").show();
                $("#_617_mf59f_number").prop("required", true);
                $("#_618_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_3_2").hide();
                $("#_617_mf59f_number").prop("required", false);
                $("#_618_mf59f_details").prop("required", false);
            }
        });

        //mf59_4
        $("#name_address_checkbox_4_2").hide();
        $("#_619_mf59f_number").prop("required", false);
        $("#_620_mf59f_details").prop("required", false);
        $("#name_address_checkbox_4_2").click(function () {
            if ($("#name_address_checkbox_4_2").is(":checked")) {
                $("#check_mf59f_4_2").show();
                $("#_619_mf59f_number").prop("required", true);
                $("#_620_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_4_2").hide();
                $("#_619_mf59f_number").prop("required", false);
                $("#_620_mf59f_details").prop("required", false);
            }
        });
        
        //of 52a/b/d
        if ($("#_600_of52a_Party_Identifier").val() != "" || $("#_601_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_2").val("a").attr("selected", true);
            $("#div_of52a__2").show();
            $("#div_of52b__2").hide();
            $("#div_of52d__2").hide();
            $("#_600_of52a_Party_Identifier").attr("disabled", false);
            $("#_601_of52a_Identifier_Code").attr("disabled", false);
            $("#_602_of52b_Party_Identifier").attr("disabled", true);
            $("#_603_of52b_Location").attr("disabled", true);
            $("#_604_of52d_Party_Identifier").attr("disabled", true);
            $("#_605_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_602_of52b_Party_Identifier").val() != "" || $("#_603_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_2").val("b").attr("selected", true);
            $("#div_of52a__2").hide();
            $("#div_of52b__2").show();
            $("#div_of52d__2").hide();
            $("#_600_of52a_Party_Identifier").attr("disabled", true);
            $("#_601_of52a_Identifier_Code").attr("disabled", true);
            $("#_602_of52b_Party_Identifier").attr("disabled", false);
            $("#_603_of52b_Location").attr("disabled", false);
            $("#_604_of52d_Party_Identifier").attr("disabled", true);
            $("#_605_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_604_of52d_Party_Identifier").val() != "" || $("#_605_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_2").val("d").attr("selected", true);
            $("#div_of52a__2").hide();
            $("#div_of52b__2").hide();
            $("#div_of52d__2").show();
            $("#_600_of52a_Party_Identifier").attr("disabled", true);
            $("#_601_of52a_Identifier_Code").attr("disabled", true);
            $("#_602_of52b_Party_Identifier").attr("disabled", true);
            $("#_603_of52b_Location").attr("disabled", true);
            $("#_604_of52d_Party_Identifier").attr("disabled", false);
            $("#_605_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_2").val("").attr("selected", true);
            $("#div_of52a__2").hide();
            $("#div_of52b__2").hide();
            $("#div_of52d__2").hide();
        }

        //mf59 /59f_2
        if ($("#_610_mf59_account").val() != "" || $("#_611_mf59_name_address").val() != "") {
            $("#type_of59_59a__2").val("59").attr("selected", true);
            $("#div_mf59__2").show();
            $("#div_mf59f__2").hide();
            $("#div_mf59f_2_2").hide();
            $("#div_mf59f_3_2").hide();
            $("#div_mf59f_4_2").hide();
            $("#_610_mf59_account").attr("disabled", false);
            $("#_611_mf59_name_address").attr("disabled", false);
            $("#_612_mf59f_account").attr("disabled", true);
            $("#_613_mf59f_number").attr("disabled", true);
            $("#_614_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2_2").attr("disabled", true);
            $("#check_mf59f_3_2").attr("disabled", true);
            $("#check_mf59f_4_2").attr("disabled", true);
        } else if ($("#_612_mf59f_account").val() != "" || $("#_613_mf59f_number").val() != "" || $("#_614_mf59f_details").val() != "") {
            $("#type_of59_59a__2").val("59f").attr("selected", true);
            $("#div_mf59__2").hide();
            $("#div_mf59f__2").show();
            $("#div_mf59f_2_2").show();
            $("#div_mf59f_3_2").show();
            $("#div_mf59f_4_2").show();
            $("#_610_mf59_account").attr("disabled", true);
            $("#_611_mf59_name_address").attr("disabled", true);
            $("#_612_mf59f_account").attr("disabled", false);
            $("#_613_mf59f_number").attr("disabled", false);
            $("#_614_mf59f_details").attr("disabled", false);
            $("#check_mf59f_2_2").attr("disabled", false);
            $("#check_mf59f_3_2").attr("disabled", false);
            $("#check_mf59f_4_2").attr("disabled", false);
        } else {
            $("#div_mf59__2").hide();
            $("#div_mf59f__2").hide();
            $("#div_mf59f_2_2").hide();
            $("#div_mf59f_3_2").hide();
            $("#div_mf59f_4_2").hide();
            $("#_610_mf59_account").attr("disabled", true);
            $("#_611_mf59_name_address").attr("disabled", true);
            $("#_612_mf59f_account").attr("disabled", true);
            $("#_613_mf59f_number").attr("disabled", true);
            $("#_614_mf59f_details").attr("disabled", true);
            $("check_mf59f_2_2").attr("disabled", true);
            $("check_mf59f_3_2").attr("disabled", true);
            $("check_mf59f_4_2").attr("disabled", true);
        }

        //mf59f_2
        if ($("#_615_mf59f_number").val() != "" || $("#_616_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_2").prop("checked", true);
            $("#check_mf59f_2").show();
        } else {
            $("#name_address_checkbox_2_2").prop("checked", false);
            $("#check_mf59f_2").hide();
        }

        //mf59f_3
        if ($("#_617_mf59f_number").val() != "" || $("#_618_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_2").prop("checked", true);
            $("#check_mf59f_3").show();
        } else {
            $("#name_address_checkbox_3_2").prop("checked", false);
            $("#check_mf59f_3").hide();
        }
        //mf59f_4
        if ($("#_619_mf59f_number").val() != "" || $("#_620_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_2").prop("checked", true);
            $("#check_mf59f_4").show();
        } else {
            $("#name_address_checkbox_4_2").prop("checked", false);
            $("#check_mf59f_4").hide();
        }

        //loop 3 
        if ($("#_790_mf32a_date").val() != "" || $("#_791_mf32a_currency").val() != "" || $("#_792_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_3").val("a").attr("selected", true);
            $("#div_mf32a_3").show();
            $("#div_mf32b_3").hide();
            $("#_790_mf32a_date").attr("disabled", false);
            $("#_791_mf32a_currency").attr("disabled", false);
            $("#_792_mf32a_amount").attr("disabled", false);
            $("#_793_mf32b_currency").attr("disabled", true);
            $("#_794_mf32b_amount").attr("disabled", true);
        } else if ($("#_793_mf32b_currency").val() != "" || $("#_794_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_3").val("b").attr("selected", true);
            $("#div_mf32a_3").hide();
            $("#div_mf32b_3").show();
            $("#_790_mf32a_date").attr("disabled", true);
            $("#_791_mf32a_currency").attr("disabled", true);
            $("#_792_mf32a_amount").attr("disabled", true);
            $("#_793_mf32b_currency").attr("disabled", false);
            $("#_794_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_3").val("").attr("selected", true);
            $("#div_mf32a_3").hide();
            $("#div_mf32b_3").hide();
        }
        //of50_3
        if ($("#_800_of50a_account").val() != "" || $("#_801_of50a_identifier_code").val() != "" || $("#_802_of50a_address").val() != "") {
            $("#type_of50_payer_3").val("a").attr("selected", true);
            $("#div_of50a__3").show();
            $("#div_mf50f__3").hide();
            $("#div_mf50f_2_3").hide();
            $("#div_mf50f_3_3").hide();
            $("#div_mf50f_4_3").hide();
            $("#div_mf50k__3").hide();
            $("#_800_of50a_account").attr("disabled", false);
            $("#_801_of50a_identifier_code").attr("disabled", false);
            $("#_802_of50a_address").attr("disabled", false);
            $("#_803_of50f_account").attr("disabled", true);
            $("#_804_mf50f_number").attr("disabled", true);
            $("#_805_of50f_details").attr("disabled", true);
            $("#name_adress_checkbox_2_50_3").attr("disabled", true);
            $("#name_adress_checkbox_3_50_3").attr("disabled", true);
            $("#name_adress_checkbox_4_50_3").attr("disabled", true);
        } else if ($("#_803_of50f_account").val() != "" || $("#_804_mf50f_number").val() != "" || $("#_805_of50f_details").val() != "") {
            $("#type_of50_payer_3").val("f").attr("selected", true);
            $("#div_of50a__3").hide();
            $("#div_mf50f__3").show();
            $("#div_mf50f_2_3").show();
            $("#div_mf50f_3_3").show();
            $("#div_mf50f_4_3").show();
            $("#div_mf50k__3").hide();
            $("#_800_of50a_account").attr("disabled", true);
            $("#_801_of50a_identifier_code").attr("disabled", true);
            $("#_802_of50a_address").attr("disabled", true);
            $("#_803_of50f_account").attr("disabled", false);
            $("#_804_mf50f_number").attr("disabled", false);
            $("#_805_of50f_details").attr("disabled", false);
            $("#name_adress_checkbox_2_50_3").attr("disabled", false);
            $("#name_adress_checkbox_3_50_3").attr("disabled", false);
            $("#name_adress_checkbox_4_50_3").attr("disabled", false);
        } else if ($("#_812_of50k_account").val() != "" || $("#_813_of50k_name_address").val() != "") {
            $("#type_of50_payer_3").val("k").attr("selected", true);
            $("#div_of50a__3").hide();
            $("#div_mf50f__3").hide();
            $("#div_mf50f_2_3").hide();
            $("#div_mf50f_3_3").hide();
            $("#div_mf50f_4_3").hide();
            $("#div_mf50k__3").show();
            //_812_of50k_account
            $("#_800_of50a_account").attr("disabled", true);
            $("#_801_of50a_identifier_code").attr("disabled", true);
            $("#_802_of50a_address").attr("disabled", true);
            $("#_803_of50f_account").attr("disabled", true);
            $("#_804_mf50f_number").attr("disabled", true);
            $("#_805_of50f_details").attr("disabled", true);
            $("#_812_of50k_account").attr("disabled", false);
            $("#_813_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__3").hide();
            $("#div_mf50f__3").hide();
            $("#div_mf50f_2_3").hide();
            $("#div_mf50f_3_3").hide();
            $("#div_mf50f_4_3").hide();
            $("#div_mf50k__3").hide();
            $("#name_adress_checkbox_2_50_3").hide();
            $("#name_adress_checkbox_3_50_3").hide();
            $("#name_adress_checkbox_4_50_3").hide();

        }

        //of50_2_3
        if ($("#_806_of50f_number").val() != "" || $("#_807_of50f_details").val() != "") {
            $("#name_adress_checkbox_2_50_3").prop("checked", true);
            $("#check_mf50f_2_3").show();
        } else {
            $("#name_adress_checkbox_2_50_3").prop("checked", false);
            $("#check_mf50f_2_3").hide();
        }

        //mf50_3_3
        if ($("#_808_of50f_number").val() != "" || $("#_809_of50f_details").val() != "") {
            $("#name_adress_checkbox_3_50_3").prop("checked", true);
            $("#check_mf50f_3_3").show();
        } else {
            $("#name_adress_checkbox_3_50_3").prop("checked", false);
            $("#check_mf50f_3_3").hide();
        }

        //mf50_4_3
        if ($("#_810_of50f_number").val() != "" || $("#_811_of50f_details").val() != "") {
            $("#name_adress_checkbox_4_50_3").prop("checked", true);
            $("#check_mf50f_4_3").show();
        } else {
            $("#name_adress_checkbox_4_50_3").prop("checked", false);
            $("#check_mf50f_4_3").hide();
        }

        //of 52a/b/d_3
        if ($("#_910_of52a_Party_Identifier").val() != "" || $("#_911_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_3").val("a").attr("selected", true);
            $("#div_of52a__3").show();
            $("#div_of52b__3").hide();
            $("#div_of52d__3").hide();
            $("#_910_of52a_Party_Identifier").attr("disabled", false);
            $("#_911_of52a_Identifier_Code").attr("disabled", false);
            $("#_912_of52b_Party_Identifier").attr("disabled", true);
            $("#_913_of52b_Location").attr("disabled", true);
            $("#_914_of52d_Party_Identifier").attr("disabled", true);
            $("#_915_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_912_of52b_Party_Identifier").val() != "" || $("#_913_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_3").val("b").attr("selected", true);
            $("#div_of52a__3").hide();
            $("#div_of52b__3").show();
            $("#div_of52d__3").hide();
            $("#_910_of52a_Party_Identifier").attr("disabled", true);
            $("#_911_of52a_Identifier_Code").attr("disabled", true);
            $("#_912_of52b_Party_Identifier").attr("disabled", false);
            $("#_913_of52b_Location").attr("disabled", false);
            $("#_914_of52d_Party_Identifier").attr("disabled", true);
            $("#_915_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_914_of52d_Party_Identifier").val() != "" || $("#_915_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_3").val("d").attr("selected", true);
            $("#div_of52a__3").hide();
            $("#div_of52b__3").hide();
            $("#div_of52d__3").show();
            $("#_910_of52a_Party_Identifier").attr("disabled", true);
            $("#_911_of52a_Identifier_Code").attr("disabled", true);
            $("#_912_of52b_Party_Identifier").attr("disabled", true);
            $("#_913_of52b_Location").attr("disabled", true);
            $("#_914_of52d_Party_Identifier").attr("disabled", false);
            $("#_915_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#div_of52a__3").hide();
            $("#div_of52b__3").hide();
            $("#div_of52d__3").hide();
        }

        //mf59 /59f_3
        if ($("#_920_mf59_account").val() != "" || $("#_921_mf59_name_address").val() != "") {
            $("#type_of59_59a__3").val("59").attr("selected", true);
            $("#div_mf59__3").show();
            $("#div_mf59f__3").hide();
            $("#div_mf59f_2_3").hide();
            $("#div_mf59f_3_3").hide();
            $("#div_mf59f_4_3").hide();
            $("#_920_mf59_account").attr("disabled", false);
            $("#_921_mf59_name_address").attr("disabled", false);
            $("#_922_mf59f_account").attr("disabled", true);
            $("#_923_mf59f_number").attr("disabled", true);
            $("#_924_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_3").attr("disabled", true);
            $("name_address_checkbox_3_3").attr("disabled", true);
            $("name_address_checkbox_4_3").attr("disabled", true);
        } else if ($("#_922_mf59f_account").val() != "" || $("#_923_mf59f_number").val() != "" || $("#_924_mf59f_details").val() != "") {
            $("#type_of59_59a__3").val("59f").attr("selected", true);
            $("#div_mf59__3").hide();
            $("#div_mf59f__3").show();
            $("#div_mf59f_2_3").show();
            $("#div_mf59f_3_3").show();
            $("#div_mf59f_4_3").show();
            $("#_920_mf59_account").attr("disabled", true);
            $("#_921_mf59_name_address").attr("disabled", true);
            $("#_922_mf59f_account").attr("disabled", false);
            $("#_923_mf59f_number").attr("disabled", false);
            $("#_924_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_3").attr("disabled", false);
            $("name_address_checkbox_3_3").attr("disabled", false);
            $("name_address_checkbox_4_3").attr("disabled", false);
        } else {
            $("#div_mf59__3").hide();
            $("#div_mf59f__3").hide();
            $("#div_mf59f_2_3").hide();
            $("#div_mf59f_3_3").hide();
            $("#div_mf59f_4_3").hide();
            $("#_920_mf59_account").attr("disabled", true);
            $("#_921_mf59_name_address").attr("disabled", true);
            $("#_922_mf59f_account").attr("disabled", true);
            $("#_923_mf59f_number").attr("disabled", true);
            $("#_924_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_3").attr("disabled", true);
            $("name_address_checkbox_3_3").attr("disabled", true);
            $("name_address_checkbox_4_3").attr("disabled", true);
        }

        //mf59f_3_2
        if ($("#_925_mf59f_number").val() != "" || $("#_926_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_3").prop("checked", true);
            $("#check_mf59f_2_3").show();
        } else {
            $("#name_address_checkbox_2_3").prop("checked", false);
            $("#check_mf59f_2_3").hide();
        }

        //mf59f_3_3
        if ($("#_927_mf59f_number").val() != "" || $("#_928_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_3").prop("checked", true);
            $("#check_mf59f_3_3").show();
        } else {
            $("#name_address_checkbox_3_3").prop("checked", false);
            $("#check_mf59f_3_3").hide();
        }

        //mf59f_4_3
        if ($("#_929_mf59f_number").val() != "" || $("#_930_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_3").prop("checked", true);
            $("#check_mf59f_4_3").show();
        } else {
            $("#name_address_checkbox_4_3").prop("checked", false);
            $("#check_mf59f_4_3").hide();
        }


        //mf32_4
        if ($("#_1100_mf32a_date").val() != "" || $("#_1101_mf32a_currency").val() != "" || $("#_1102_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_4").val("a").attr("selected", true);
            $("#div_mf32a_4").show();
            $("#div_mf32b_4").hide();
            $("#_1100_mf32a_date").attr("disabled", false);
            $("#_1101_mf32a_currency").attr("disabled", false);
            $("#_1102_mf32a_amount").attr("disabled", false);
            $("#_1103_mf32b_currency").attr("disabled", true);
            $("#_1104_mf32b_amount").attr("disabled", true);
        } else if ($("#_1103_mf32b_currency").val() != "" || $("#_1104_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_4").val("b").attr("selected", true);
            $("#div_mf32a_4").hide();
            $("#div_mf32b_4").show();
            $("#_1100_mf32a_date").attr("disabled", true);
            $("#_1101_mf32a_currency").attr("disabled", true);
            $("#_1102_mf32a_amount").attr("disabled", true);
            $("#_1103_mf32b_currency").attr("disabled", false);
            $("#_1104_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_4").val("").attr("selected", true);
            $("#div_mf32a_4").hide();
            $("#div_mf32b_4").hide();
        }

        //of50_4
        if ($("#_1110_of50a_account").val() != "" || $("#_1111_of50a_identifier_code").val() != "" || $("#_1112_of50a_address").val() != "") {
            $("#type_of50_payer_4").val("a").attr("selected", true);
            $("#div_of50a__4").show();
            $("#div_mf50f__4").hide();
            $("#div_mf50f_2_4").hide();
            $("#div_mf50f_3_4").hide();
            $("#div_mf50f_4_4").hide();
            $("#div_mf50k__4").hide();
            $("#_1110_of50a_account").attr("disabled", false);
            $("#_1111_of50a_identifier_code").attr("disabled", false);
            $("#_1112_of50a_address").attr("disabled", false);
            $("#_1113_of50f_account").attr("disabled", true);
            $("#_1114_mf50f_number").attr("disabled", true);
            $("#_1115_of50f_details ").attr("disabled", true);
            $("#name_adress_checkbox_2_50_4").attr("disabled", true);
            $("#name_adress_checkbox_3_50_4").attr("disabled", true);
            $("#name_adress_checkbox_4_50_4").attr("disabled", true);
        } else if ($("#_1113_of50f_account").val() != "" || $("#_1114_mf50f_number").val() != "" || $("#_1115_of50f_details").val() != "") {
            $("#type_of50_payer_4").val("f").attr("selected", true);
            $("#div_of50a__4").hide();
            $("#div_mf50f__4").show();
            $("#div_mf50f_2_4").show();
            $("#div_mf50f_3_4").show();
            $("#div_mf50f_4_4").show();
            $("#div_mf50k__4").hide();
            $("#_1110_of50a_account").attr("disabled", true);
            $("#_1111_of50a_identifier_code").attr("disabled", true);
            $("#_1112_of50a_address").attr("disabled", true);
            $("#_1113_of50f_account").attr("disabled", false);
            $("#_1114_mf50f_number").attr("disabled", false);
            $("#_1115_of50f_details ").attr("disabled", false);
            $("#name_adress_checkbox_2_50_4").attr("disabled", false);
            $("#name_adress_checkbox_3_50_4").attr("disabled", false);
            $("#name_adress_checkbox_4_50_4").attr("disabled", false);
        } else if ($("#_1122_of50k_account").val() != "" || $("#_1123_of50k_name_address").val() != "") {
            $("#type_of50_payer_4").val("k").attr("selected", true);
            $("#div_of50a__4").hide();
            $("#div_mf50f__4").hide();
            $("#div_mf50f_2_4").hide();
            $("#div_mf50f_3_4").hide();
            $("#div_mf50f_4_4").hide();
            $("#div_mf50k__4").show();
            //_1122_of50k_account
            $("#_1110_of50a_account").attr("disabled", true);
            $("#_1111_of50a_identifier_code").attr("disabled", true);
            $("#_1112_of50a_address").attr("disabled", true);
            $("#_1113_of50f_account").attr("disabled", true);
            $("#_1114_mf50f_number").attr("disabled", true);
            $("#_1115_of50f_details ").attr("disabled", true);
            $("#_1122_of50k_account").attr("disabled", false);
            $("#_1123_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__4").hide();
            $("#div_mf50f__4").hide();
            $("#div_mf50f_2_4").hide();
            $("#div_mf50f_3_4").hide();
            $("#div_mf50f_4_4").hide();
            $("#div_mf50k__4").hide();
            $("#name_adress_checkbox_2_50_4").hide();
            $("#name_adress_checkbox_3_50_4").hide();
            $("#name_adress_checkbox_4_50_4").hide();

        }
        //of50_2_4
        if ($("#_1116_of50f_number").val() != "" || $("#_1117_of50f_details").val() != "") {
            $("#name_adress_checkbox_2_50_4").prop("checked", true);
            $("#check_mf50f_2_4").show();
        } else {
            $("#name_adress_checkbox_2_50_4").prop("checked", false);
            $("#check_mf50f_2_4").hide();
        }

        //mf50_3_4
        if ($("#_1118_of50f_number").val() != "" || $("#_1119_of50f_details").val() != "") {
            $("#name_adress_checkbox_3_50_4").prop("checked", true);
            $("#check_mf50f_3_4").show();
        } else {
            $("#name_adress_checkbox_3_50_4").prop("checked", false);
            $("#check_mf50f_3_4").hide();
        }

        //mf50_4_4
        if ($("#_1120_of50f_number").val() != "" || $("#_1121_of50f_details").val() != "") {
            $("#name_adress_checkbox_4_50_4").prop("checked", true);
            $("#check_mf50f_4_4").show();
        } else {
            $("#name_adress_checkbox_4_50_4").prop("checked", false);
            $("#check_mf50f_4_4").hide();
        }
        //of 52a/b/d_4
        if ($("#_1220_of52a_Party_Identifier").val() != "" || $("#_1221_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_4").val("a").attr("selected", true);
            $("#div_of52a__4").show();
            $("#div_of52b__4").hide();
            $("#div_of52d__4").hide();
            $("#_1220_of52a_Party_Identifier").attr("disabled", false);
            $("#_1221_of52a_Identifier_Code").attr("disabled", false);
            $("#_1222_of52b_Party_Identifier").attr("disabled", true);
            $("#_1223_of52b_Location").attr("disabled", true);
            $("#_1224_of52d_Party_Identifier").attr("disabled", true);
            $("#_1225_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_1222_of52b_Party_Identifier").val() != "" || $("#_1223_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_4").val("b").attr("selected", true);
            $("#div_of52a__4").hide();
            $("#div_of52b__4").show();
            $("#div_of52d__4").hide();
            $("#_1220_of52a_Party_Identifier").attr("disabled", true);
            $("#_1221_of52a_Identifier_Code").attr("disabled", true);
            $("#_1222_of52b_Party_Identifier").attr("disabled", false);
            $("#_1223_of52b_Location").attr("disabled", false);
            $("#_1224_of52d_Party_Identifier").attr("disabled", true);
            $("#_1225_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_1224_of52d_Party_Identifier").val() != "" || $("#_1225_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_4").val("d").attr("selected", true);
            $("#div_of52a__4").hide();
            $("#div_of52b__4").hide();
            $("#div_of52d__4").show();
            $("#_1220_of52a_Party_Identifier").attr("disabled", true);
            $("#_1221_of52a_Identifier_Code").attr("disabled", true);
            $("#_1222_of52b_Party_Identifier").attr("disabled", true);
            $("#_1223_of52b_Location").attr("disabled", true);
            $("#_1224_of52d_Party_Identifier").attr("disabled", false);
            $("#_1225_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_4").val("").attr("selected", true);
            $("#div_of52a__4").hide();
            $("#div_of52b__4").hide();
            $("#div_of52d__4").hide();
        }

        //mf59 /59f_4
        if ($("#_1230_mf59_account").val() != "" || $("#_1231_mf59_name_address").val() != "") {
            $("#type_of59_59a__4").val("59").attr("selected", true);
            $("#div_mf59__4").show();
            $("#div_mf59f__4").hide();
            $("#div_mf59f_2_4").hide();
            $("#div_mf59f_3_4").hide();
            $("#div_mf59f_4_4").hide();
            $("#_1230_mf59_account").attr("disabled", false);
            $("#_1231_mf59_name_address").attr("disabled", false);
            $("#_1232_mf59f_account").attr("disabled", true);
            $("#_1233_mf59f_number").attr("disabled", true);
            $("#_1234_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_4").attr("disabled", true);
            $("name_address_checkbox_3_4").attr("disabled", true);
            $("name_address_checkbox_4_4").attr("disabled", true);
        } else if ($("#_1232_mf59f_account").val() != "" || $("#_1233_mf59f_number").val() != "" || $("#_1234_mf59f_details").val() != "") {
            $("#type_of59_59a__4").val("59f").attr("selected", true);
            $("#div_mf59__4").hide();
            $("#div_mf59f__4").show();
            $("#div_mf59f_2_4").show();
            $("#div_mf59f_3_4").show();
            $("#div_mf59f_4_4").show();
            $("#_1230_mf59_account").attr("disabled", true);
            $("#_1231_mf59_name_address").attr("disabled", true);
            $("#_1232_mf59f_account").attr("disabled", false);
            $("#_1233_mf59f_number").attr("disabled", false);
            $("#_1234_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_4").attr("disabled", false);
            $("name_address_checkbox_3_4").attr("disabled", false);
            $("name_address_checkbox_4_4").attr("disabled", false);
        } else {
            $("#div_mf59__4").hide();
            $("#div_mf59f__4").hide();
            $("#div_mf59f_2_4").hide();
            $("#div_mf59f_3_4").hide();
            $("#div_mf59f_4_4").hide();
            $("#_1230_mf59_account").attr("disabled", true);
            $("#_1231_mf59_name_address").attr("disabled", true);
            $("#_1232_mf59f_account").attr("disabled", true);
            $("#_1233_mf59f_number").attr("disabled", true);
            $("#_1234_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_4").attr("disabled", true);
            $("name_address_checkbox_3_4").attr("disabled", true);
            $("name_address_checkbox_4_4").attr("disabled", true);
        }

        //mf59f_4_2
        if ($("#_1235_mf59f_number").val() != "" || $("#_1236_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_4").prop("checked", true);
            $("#check_mf59f_2_4").show();
        } else {
            $("#name_address_checkbox_2_4").prop("checked", false);
            $("#check_mf59f_2_4").hide();
        }
        //mf59f_3_4
        if ($("#_1237_mf59f_number").val() != "" || $("#_1238_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_4").prop("checked", true);
            $("#check_mf59f_3_4").show();
        } else {
            $("#name_address_checkbox_3_4").prop("checked", false);
            $("#check_mf59f_3_4").hide();
        }
        //mf59f_4_4
        if ($("#_1239_mf59f_number").val() != "" || $("#_1240_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_4").prop("checked", true);
            $("#check_mf59f_4_4").show();
        } else {
            $("#name_address_checkbox_4_4").prop("checked", false);
            $("#check_mf59f_4_4").hide();
        }

        //mf32_5
        if ($("#_1410_mf32a_date").val() != "" || $("#_1411_mf32a_currency").val() != "" || $("#_1412_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_5").val("a").attr("selected", true);
            $("#div_mf32a_5").show();
            $("#div_mf32b_5").hide();
            $("#_1410_mf32a_date").attr("disabled", false);
            $("#_1411_mf32a_currency").attr("disabled", false);
            $("#_1412_mf32a_amount").attr("disabled", false);
            $("#_1413_mf32b_currency").attr("disabled", true);
            $("#_1414_mf32b_amount").attr("disabled", true);
        } else if ($("#_1413_mf32b_currency").val() != "" || $("#_1414_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_5").val("b").attr("selected", true);
            $("#div_mf32a_5").hide();
            $("#div_mf32b_5").show();
            $("#_1410_mf32a_date").attr("disabled", true);
            $("#_1411_mf32a_currency").attr("disabled", true);
            $("#_1412_mf32a_amount").attr("disabled", true);
            $("#_1413_mf32b_currency").attr("disabled", false);
            $("#_1414_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_5").val("").attr("selected", true);
            $("#div_mf32a_5").hide();
            $("#div_mf32b_5").hide();
        }

        //of50_5
        if ($("#_1420_of50a_account").val() != "" || $("#_1421_of50a_identifier_code").val() != "" || $("#_1422_of50a_address").val() != "") {
            $("#type_of50_payer_5").val("a").attr("selected", true);
            $("#div_of50a__5").show();
            $("#div_mf50f__5").hide();
            $("#div_mf50f_2_5").hide();
            $("#div_mf50f_3_5").hide();
            $("#div_mf50f_4_5").hide();
            $("#div_mf50k__5").hide();
            $("#_1420_of50a_account").attr("disabled", false);
            $("#_1421_of50a_identifier_code").attr("disabled", false);
            $("#_1422_of50a_address").attr("disabled", false);
            $("#_1423_of50f_account").attr("disabled", true);
            $("#_1424_mf50f_number").attr("disabled", true);
            $("#_1425_of50f_details").attr("disabled", true);
            $("#name_adress_checkbox_2_50_5").attr("disabled", true);
            $("#name_adress_checkbox_3_50_5").attr("disabled", true);
            $("#name_adress_checkbox_4_50_5").attr("disabled", true);
        } else if ($("#_1423_of50f_account").val() != "" || $("#_1424_mf50f_number").val() != "" || $("#_1425_of50f_details").val() != "") {
            $("#type_of50_payer_5").val("f").attr("selected", true);
            $("#div_of50a__5").hide();
            $("#div_mf50f__5").show();
            $("#div_mf50f_2_5").show();
            $("#div_mf50f_3_5").show();
            $("#div_mf50f_4_5").show();
            $("#div_mf50k__5").hide();
            $("#_1420_of50a_account").attr("disabled", true);
            $("#_1421_of50a_identifier_code").attr("disabled", true);
            $("#_1422_of50a_address").attr("disabled", true);
            $("#_1423_of50f_account").attr("disabled", false);
            $("#_1424_mf50f_number").attr("disabled", false);
            $("#_1425_of50f_details").attr("disabled", false);
            $("#name_adress_checkbox_2_50_5").attr("disabled", false);
            $("#name_adress_checkbox_3_50_5").attr("disabled", false);
            $("#name_adress_checkbox_4_50_5").attr("disabled", false);
        } else if ($("#_1432_of50k_account").val() != "" || $("#_1433_of50k_name_address").val() != "") {
            $("#type_of50_payer_5").val("k").attr("selected", true);
            $("#div_of50a__5").hide();
            $("#div_mf50f__5").hide();
            $("#div_mf50f_2_5").hide();
            $("#div_mf50f_3_5").hide();
            $("#div_mf50f_4_5").hide();
            $("#div_mf50k__5").show();
            //_1432_of50k_account
            $("#_1420_of50a_account").attr("disabled", true);
            $("#_1421_of50a_identifier_code").attr("disabled", true);
            $("#_1422_of50a_address").attr("disabled", true);
            $("#_1423_of50f_account").attr("disabled", true);
            $("#_1424_mf50f_number").attr("disabled", true);
            $("#_1425_of50f_details").attr("disabled", true);
            $("#_1432_of50k_account").attr("disabled", false);
            $("#_1433_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__5").hide();
            $("#div_mf50f__5").hide();
            $("#div_mf50f_2_5").hide();
            $("#div_mf50f_3_5").hide();
            $("#div_mf50f_4_5").hide();
            $("#div_mf50k__5").hide();
            $("#name_adress_checkbox_2_50_5").hide();
            $("#name_adress_checkbox_3_50_5").hide();
            $("#name_adress_checkbox_4_50_5").hide();
        }
        //of50_2_5
        if ($("#_1426_of50f_number").val() != "" || $("#_1427_of50f_details").val() != "") {
            $("#name_adress_checkbox_2_50_5").prop("checked", true);
            $("#check_mf50f_2_5").show();
        } else {
            $("#name_adress_checkbox_2_50_5").prop("checked", false);
            $("#check_mf50f_2_5").hide();
        }
        //mf50_3_5
        if ($("#_1428_of50f_number").val() != "" || $("#_1429_of50f_details").val() != "") {
            $("#name_adress_checkbox_3_50_5").prop("checked", true);
            $("#check_mf50f_3_5").show();
        } else {
            $("#name_adress_checkbox_3_50_5").prop("checked", false);
            $("#check_mf50f_3_5").hide();
        }
        //mf50_4_5
        if ($("#_1430_of50f_number").val() != "" || $("#_1431_of50f_details").val() != "") {
            $("#name_adress_checkbox_4_50_5").prop("checked", true);
            $("#check_mf50f_4_5").show();
        } else {
            $("#name_adress_checkbox_4_50_5").prop("checked", false);
            $("#check_mf50f_4_5").hide();
        }

        //of 52a/b/d_5
        if ($("#_1530_of52a_Party_Identifier").val() != "" || $("#_1531_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_5").val("a").attr("selected", true);
            $("#div_of52a__5").show();
            $("#div_of52b__5").hide();
            $("#div_of52d__5").hide();
            $("#_1530_of52a_Party_Identifier").attr("disabled", false);
            $("#_1531_of52a_Identifier_Code").attr("disabled", false);
            $("#_1532_of52b_Party_Identifier").attr("disabled", true);
            $("#_1533_of52b_Location").attr("disabled", true);
            $("#_1534_of52d_Party_Identifier").attr("disabled", true);
            $("#_1535_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_1532_of52b_Party_Identifier").val() != "" || $("#_1533_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_5").val("b").attr("selected", true);
            $("#div_of52a__5").hide();
            $("#div_of52b__5").show();
            $("#div_of52d__5").hide();
            $("#_1530_of52a_Party_Identifier").attr("disabled", true);
            $("#_1531_of52a_Identifier_Code").attr("disabled", true);
            $("#_1532_of52b_Party_Identifier").attr("disabled", false);
            $("#_1533_of52b_Location").attr("disabled", false);
            $("#_1534_of52d_Party_Identifier").attr("disabled", true);
            $("#_1535_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_1534_of52d_Party_Identifier").val() != "" || $("#_1535_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_5").val("d").attr("selected", true);
            $("#div_of52a__5").hide();
            $("#div_of52b__5").hide();
            $("#div_of52d__5").show();
            $("#_1530_of52a_Party_Identifier").attr("disabled", true);
            $("#_1531_of52a_Identifier_Code").attr("disabled", true);
            $("#_1532_of52b_Party_Identifier").attr("disabled", true);
            $("#_1533_of52b_Location").attr("disabled", true);
            $("#_1534_of52d_Party_Identifier").attr("disabled", false);
            $("#_1535_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_5").val("").attr("selected", true);
            $("#div_of52a__5").hide();
            $("#div_of52b__5").hide();
            $("#div_of52d__5").hide();
        }
        //mf59 /59f_5
        if ($("_1540_mf59_account").val() != "" || $("#_1541_mf59_name_address").val() != "") {
            $("#type_of59_59a__5").val("59").attr("selected", true);
            $("#div_mf59__5").show();
            $("#div_mf59f__5").hide();
            $("#div_mf59f_2_5").hide();
            $("#div_mf59f_3_5").hide();
            $("#div_mf59f_4_5").hide();
            $("#_1540_mf59_account").attr("disabled", false);
            $("#_1541_mf59_name_address").attr("disabled", false);
            $("#_1542_mf59f_account").attr("disabled", true);
            $("#_1543_mf59f_number").attr("disabled", true);
            $("#_1544_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_5").attr("disabled", true);
            $("name_address_checkbox_3_5").attr("disabled", true);
            $("name_address_checkbox_4_5").attr("disabled", true);
        } else if ($("#_1542_mf59f_account").val() != "" || $("#_1543_mf59f_number").val() != "" || $("#_1544_mf59f_details").val() != "") {
            $("#type_of59_59a__5").val("59f").attr("selected", true);
            $("#div_mf59__5").hide();
            $("#div_mf59f__5").show();
            $("#div_mf59f_2_5").show();
            $("#div_mf59f_3_5").show();
            $("#div_mf59f_4_5").show();
            $("#_1540_mf59_account").attr("disabled", true);
            $("#_1541_mf59_name_address").attr("disabled", true);
            $("#_1542_mf59f_account").attr("disabled", false);
            $("#_1543_mf59f_number").attr("disabled", false);
            $("#_1544_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_5").attr("disabled", false);
            $("name_address_checkbox_3_5").attr("disabled", false);
            $("name_address_checkbox_4_5").attr("disabled", false);
        } else {
            $("#div_mf59__5").hide();
            $("#div_mf59f__5").hide();
            $("#div_mf59f_2_5").hide();
            $("#div_mf59f_3_5").hide();
            $("#div_mf59f_4_5").hide();
            $("#_1540_mf59_account").attr("disabled", true);
            $("#_1541_mf59_name_address").attr("disabled", true);
            $("#_1542_mf59f_account").attr("disabled", true);
            $("#_1543_mf59f_number").attr("disabled", true);
            $("#_1544_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_5").attr("disabled", true);
            $("name_address_checkbox_3_5").attr("disabled", true);
            $("name_address_checkbox_4_5").attr("disabled", true);
        }
        //mf59f_5_2
        if ($("#_1545_mf59f_number").val() != "" || $("#_1546_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_5").prop("checked", true);
            $("#check_mf59f_2_5").show();
        } else {
            $("#name_address_checkbox_2_5").prop("checked", false);
            $("#check_mf59f_2_5").hide();
        }
        //mf59f_5_3
        if ($("#_1547_mf59f_number").val() != "" || $("#_1548_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_5").prop("checked", true);
            $("#check_mf59f_3_5").show();
        } else {
            $("#name_address_checkbox_3_5").prop("checked", false);
            $("#check_mf59f_3_5").hide();
        }
        //mf59f_5_4
        if ($("#_1549_mf59f_number").val() != "" || $("#_1550_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_5").prop("checked", true);
            $("#check_mf59f_4_5").show();
        } else {
            $("#name_address_checkbox_4_5").prop("checked", false);
            $("#check_mf59f_4_5").hide();
        }

        //mf32_6
        if ($("#_1720_mf32a_date").val() != "" || $("#_1721_mf32a_currency").val() != "" || $("#_1722_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_6").val("a").attr("selected", true);
            $("#div_mf32a_6").show();
            $("#div_mf32b_6").hide();
            $("#_1720_mf32a_date").attr("disabled", false);
            $("#_1721_mf32a_currency").attr("disabled", false);
            $("#_1722_mf32a_amount").attr("disabled", false);
            $("#_1723_mf32b_currency").attr("disabled", true);
            $("#_1724_mf32b_amount").attr("disabled", true);
        } else if ($("#_1723_mf32b_currency").val() != "" || $("#_1724_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_6").val("b").attr("selected", true);
            $("#div_mf32a_6").hide();
            $("#div_mf32b_6").show();
            $("#_1720_mf32a_date").attr("disabled", true);
            $("#_1721_mf32a_currency").attr("disabled", true);
            $("#_1722_mf32a_amount").attr("disabled", true);
            $("#_1723_mf32b_currency").attr("disabled", false);
            $("#_1724_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_6").val("").attr("selected", true);
            $("#div_mf32a_6").hide();
            $("#div_mf32b_6").hide();
        }

        //of50_6

        if ($("#_1730_of50a_account").val() != "" || $("#_1731_of50a_identifier_code").val() != "" || $("#_1732_of50a_address").val() != "") {
            $("#type_of50_payer_6").val("a").attr("selected", true);
            $("#div_of50a__6").show();
            $("#div_mf50f__6").hide();
            $("#div_mf50f_2_6").hide();
            $("#div_mf50f_3_6").hide();
            $("#div_mf50f_4_6").hide();
            $("#div_mf50k__6").hide();
            $("#_1730_of50a_account").attr("disabled", false);
            $("#_1731_of50a_identifier_code").attr("disabled", false);
            $("#_1732_of50a_address").attr("disabled", false);
            $("#_1733_of50f_account").attr("disabled", true);
            $("#_1734_mf50f_number").attr("disabled", true);
            $("#_1735_of50f_details").attr("disabled", true);
            $("#name_adress_checkbox_2_50_6").attr("disabled", true);
            $("#name_adress_checkbox_3_50_6").attr("disabled", true);
            $("#name_adress_checkbox_4_50_6").attr("disabled", true);
        } else if ($("#_1733_of50f_account").val() != "" || $("#_1734_mf50f_number").val() != "" || $("#_1735_of50f_details").val() != "") {
            $("#type_of50_payer_6").val("f").attr("selected", true);
            $("#div_of50a__6").hide();
            $("#div_mf50f__6").show();
            $("#div_mf50f_2_6").show();
            $("#div_mf50f_3_6").show();
            $("#div_mf50f_4_6").show();
            $("#div_mf50k__6").hide();
            $("#_1730_of50a_account").attr("disabled", true);
            $("#_1731_of50a_identifier_code").attr("disabled", true);
            $("#_1732_of50a_address").attr("disabled", true);
            $("#_1733_of50f_account").attr("disabled", false);
            $("#_1734_mf50f_numberf").attr("disabled", false);
            $("#_1735_of50f_details").attr("disabled", false);
            $("#name_adress_checkbox_2_50_6").attr("disabled", false);
            $("#name_adress_checkbox_3_50_6").attr("disabled", false);
            $("#name_adress_checkbox_4_50_6").attr("disabled", false);
        } else if ($("#_1742_of50k_account").val() != "" || $("#_1743_of50k_name_address").val() != "") {
            $("#type_of50_payer_6").val("k").attr("selected", true);
            $("#div_of50a__6").hide();
            $("#div_mf50f__6").hide();
            $("#div_mf50f_2_6").hide();
            $("#div_mf50f_3_6").hide();
            $("#div_mf50f_4_6").hide();
            $("#div_mf50k__6").show();
            //_1742_of50k_account
            $("#_1730_of50a_account").attr("disabled", true);
            $("#_1731_of50a_identifier_code").attr("disabled", true);
            $("#_1732_of50a_address").attr("disabled", true);
            $("#_1733_of50f_account").attr("disabled", true);
            $("#_1734_mf50f_numberf").attr("disabled", true);
            $("#_1735_of50f_details").attr("disabled", true);
            $("#_1742_of50k_account").attr("disabled", false);
            $("#_1743_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__6").hide();
            $("#div_mf50f__6").hide();
            $("#div_mf50f_2_6").hide();
            $("#div_mf50f_3_6").hide();
            $("#div_mf50f_4_6").hide();
            $("#div_mf50k__6").hide();
            $("#name_adress_checkbox_2_50_6").hide();
            $("#name_adress_checkbox_3_50_6").hide();
            $("#name_adress_checkbox_4_50_6").hide();
        }

        //of50_2_6
        if ($("#_1736_of50f_number").val() != "" || $("#_1737_of50f_details").val() != "") {
            $("#name_adress_checkbox_2_50_6").prop("checked", true);
            $("#check_mf50f_2_6").show();
        } else {
            $("#name_adress_checkbox_2_50_6").prop("checked", false);
            $("#check_mf50f_2_6").hide();
        }
        //mf50_3_6
        if ($("#_1738_of50f_number").val() != "" || $("#_1739_of50f_details").val() != "") {
            $("#name_adress_checkbox_3_50_6").prop("checked", true);
            $("#check_mf50f_3_6").show();
        } else {
            $("#name_adress_checkbox_3_50_6").prop("checked", false);
            $("#check_mf50f_3_6").hide();
        }
        //mf50_4_6
        if ($("#_1740_of50f_number").val() != "" || $("#_1741_of50f_details").val() != "") {
            $("#name_adress_checkbox_4_50_6").prop("checked", true);
            $("#check_mf50f_4_6").show();
        } else {
            $("#name_adress_checkbox_4_50_6").prop("checked", false);
            $("#check_mf50f_4_6").hide();
        }

        //of 52a/b/d_6
        if ($("_1840_of52a_Party_Identifier").val() != "" || $("#_1841_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_6").val("a").attr("selected", true);
            $("#div_of52a__6").show();
            $("#div_of52b__6").hide();
            $("#div_of52d__6").hide();
            $("#_1840_of52a_Party_Identifier").attr("disabled", false);
            $("#_1841_of52a_Identifier_Code").attr("disabled", false);
            $("#_1842_of52b_Party_Identifier").attr("disabled", true);
            $("#_1843_of52b_Identifier_Code").attr("disabled", true);
            $("#_1844_of52d_Party_Identifier").attr("disabled", true);
            $("#_1845_of52d_Identifier_Code").attr("disabled", true);
        } else if ($("#_1842_of52b_Party_Identifier").val() != "" || $("#_1843_of52b_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_6").val("b").attr("selected", true);
            $("#div_of52a__6").hide();
            $("#div_of52b__6").show();
            $("#div_of52d__6").hide();
            $("#_1840_of52a_Party_Identifier").attr("disabled", true);
            $("#_1841_of52a_Identifier_Code").attr("disabled", true);
            $("#_1842_of52b_Party_Identifier").attr("disabled", false);
            $("#_1843_of52b_Identifier_Code").attr("disabled", false);
            $("#_1844_of52d_Party_Identifier").attr("disabled", true);
            $("#_1845_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_1844_of52d_Party_Identifier").val() != "" || $("#_1845_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_6").val("d").attr("selected", true);
            $("#div_of52a__6").hide();
            $("#div_of52b__6").hide();
            $("#div_of52d__6").show();
            $("#_1840_of52a_Party_Identifier").attr("disabled", true);
            $("#_1841_of52a_Identifier_Code").attr("disabled", true);
            $("#_1842_of52b_Party_Identifier").attr("disabled", true);
            $("#_1843_of52b_Identifier_Code").attr("disabled", true);
            $("#_1844_of52d_Party_Identifier").attr("disabled", false);
            $("#_1845_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_6").val("").attr("selected", true);
            $("#div_of52a__6").hide();
            $("#div_of52b__6").hide();
            $("#div_of52d__6").hide();
        }
        //mf59 /59f_6
        if ($("#_1850_mf59_account").val() != "" || $("#_1851_mf59_name_address").val() != "") {
            $("#type_of59_59a__6").val("59").attr("selected", true);
            $("#div_mf59__6").show();
            $("#div_mf59f__6").hide();
            $("#div_mf59f_2_6").hide();
            $("#div_mf59f_3_6").hide();
            $("#div_mf59f_4_6").hide();
            $("#_1850_mf59_account").attr("disabled", false);
            $("#_1851_mf59_name_address").attr("disabled", false);
            $("#_1852_mf59f_account").attr("disabled", true);
            $("#_1853_mf59f_number").attr("disabled", true);
            $("#_1854_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_6").attr("disabled", true);
            $("name_address_checkbox_3_6").attr("disabled", true);
            $("name_address_checkbox_4_6").attr("disabled", true);
        } else if ($("#_1852_mf59f_account").val() != "" || $("#_1853_mf59f_number").val() != "" || $("#_1854_mf59f_details").val() != "") {
            $("#type_of59_59a__6").val("59f").attr("selected", true);
            $("#div_mf59__6").hide();
            $("#div_mf59f__6").show();
            $("#div_mf59f_2_6").show();
            $("#div_mf59f_3_6").show();
            $("#div_mf59f_4_6").show();
            $("#_1850_mf59_account").attr("disabled", true);
            $("#_1851_mf59_name_address").attr("disabled", true);
            $("#_1852_mf59f_account").attr("disabled", false);
            $("#_1853_mf59f_number").attr("disabled", false);
            $("#_1854_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_6").attr("disabled", false);
            $("name_address_checkbox_3_6").attr("disabled", false);
            $("name_address_checkbox_4_6").attr("disabled", false);
        } else {
            $("#div_mf59__6").hide();
            $("#div_mf59f__6").hide();
            $("#div_mf59f_2_6").hide();
            $("#div_mf59f_3_6").hide();
            $("#div_mf59f_4_6").hide();
            $("#_1850_mf59_account").attr("disabled", true);
            $("#_1851_mf59_name_address").attr("disabled", true);
            $("#_1852_mf59f_account").attr("disabled", true);
            $("#_1853_mf59f_number").attr("disabled", true);
            $("#_1854_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_6").attr("disabled", true);
            $("name_address_checkbox_3_6").attr("disabled", true);
            $("name_address_checkbox_4_6").attr("disabled", true);
        }

        //mf59f_6_2
        if ($("#_1855_mf59f_number").val() != "" || $("#_1856_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_6").prop("checked", true);
            $("#check_mf59f_2_6").show();
        } else {
            $("#name_address_checkbox_2_6").prop("checked", false);
            $("#check_mf59f_2_6").hide();
        }
        //mf59f_6_3
        if ($("#_1857_mf59f_number").val() != "" || $("#_1858_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_6").prop("checked", true);
            $("#check_mf59f_3_6").show();
        } else {
            $("#name_address_checkbox_3_6").prop("checked", false);
            $("#check_mf59f_3_6").hide();
        }
        //mf59f_6_4
        if ($("#_1859_mf59f_number").val() != "" || $("#_1860_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_6").prop("checked", true);
            $("#check_mf59f_4_6").show();
        } else {
            $("#name_address_checkbox_4_6").prop("checked", false);
            $("#check_mf59f_4_6").hide();
        }


        //mf32_7
        if ($("#_2030_mf32a_date").val() != "" || $("#_2031_mf32a_currency").val() != "" || $("#_2032_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_7").val("a").attr("selected", true);
            $("#div_mf32a_7").show();
            $("#div_mf32b_7").hide();
            $("#_2030_mf32a_date").attr("disabled", false);
            $("#_2031_mf32a_currency").attr("disabled", false);
            $("#_2032_mf32a_amount").attr("disabled", false);
            $("#_2033_mf32b_currency").attr("disabled", true);
            $("#_2034_mf32b_amount").attr("disabled", true);
        } else if ($("#_2033_mf32b_currency").val() != "" || $("#_2034_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_7").val("b").attr("selected", true);
            $("#div_mf32a_7").hide();
            $("#div_mf32b_7").show();
            $("#_2030_mf32a_date").attr("disabled", true);
            $("#_2031_mf32a_currency").attr("disabled", true);
            $("#_2032_mf32a_amount").attr("disabled", true);
            $("#_2033_mf32b_currency").attr("disabled", false);
            $("#_2034_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_7").val("").attr("selected", true);
            $("#div_mf32a_7").hide();
            $("#div_mf32b_7").hide();
        }

        //of50_7
        if ($("#_2040_of50a_account").val() != "" || $("#_2041_of50a_identifier_code").val() != "" || $("#_2042_of50a_address").val() != "") {
            $("#type_of50_payer_7").val("a").attr("selected", true);
            $("#div_of50a__7").show();
            $("#div_mf50f__7").hide();
            $("#div_mf50f_2_7").hide();
            $("#div_mf50f_3_7").hide();
            $("#div_mf50f_4_7").hide();
            $("#div_mf50k__7").hide();
            $("#_2040_of50a_account").attr("disabled", false);
            $("#_2041_of50a_identifier_code").attr("disabled", false);
            $("#_2042_of50a_address").attr("disabled", false);
            $("#_2043_of50f_account").attr("disabled", true);
            $("#_2044_mf50f_number").attr("disabled", true);
            $("#_2045_of50f_details").attr("disabled", true);
            $("#name_adress_checkbox_2_50_7").attr("disabled", true);
            $("#name_adress_checkbox_3_50_7").attr("disabled", true);
            $("#name_adress_checkbox_4_50_7").attr("disabled", true);
        } else if ($("#_2043_of50f_account").val() != "" || $("#_2044_mf50f_number").val() != "" || $("#_2045_of50f_details").val() != "") {
            $("#type_of50_payer_7").val("f").attr("selected", true);
            $("#div_of50a__7").hide();
            $("#div_mf50f__7").show();
            $("#div_mf50f_2_7").show();
            $("#div_mf50f_3_7").show();
            $("#div_mf50f_4_7").show();
            $("#div_mf50k__7").hide();
            $("#_2040_of50a_account").attr("disabled", true);
            $("#_2041_of50a_identifier_code").attr("disabled", true);
            $("#_2042_of50a_address").attr("disabled", true);
            $("#_2043_of50f_account").attr("disabled", false);
            $("#_2044_mf50f_number").attr("disabled", false);
            $("#_2045_of50f_details").attr("disabled", false);
            $("#name_adress_checkbox_2_50_7").attr("disabled", false);
            $("#name_adress_checkbox_3_50_7").attr("disabled", false);
            $("#name_adress_checkbox_4_50_7").attr("disabled", false);
        } else if ($("#_2052_of50k_account").val() != "" || $("#_2053_of50k_name_address").val() != "") {
            $("#type_of50_payer_7").val("k").attr("selected", true);
            $("#div_of50a__7").hide();
            $("#div_mf50f__7").hide();
            $("#div_mf50f_2_7").hide();
            $("#div_mf50f_3_7").hide();
            $("#div_mf50f_4_7").hide();
            $("#div_mf50k__7").show();
            //_2052_of50k_account
            $("#_2040_of50a_account").attr("disabled", true);
            $("#_2041_of50a_identifier_code").attr("disabled", true);
            $("#_2042_of50a_address").attr("disabled", true);
            $("#_2043_of50f_account").attr("disabled", true);
            $("#_2044_mf50f_number").attr("disabled", true);
            $("#_2045_of50f_details").attr("disabled", true);
            $("#_2052_of50k_account").attr("disabled", false);
            $("#_2053_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__7").hide();
            $("#div_mf50f__7").hide();
            $("#div_mf50f_2_7").hide();
            $("#div_mf50f_3_7").hide();
            $("#div_mf50f_4_7").hide();
            $("#div_mf50k__7").hide();
            $("#name_adress_checkbox_2_50_7").hide();
            $("#name_adress_checkbox_3_50_7").hide();
            $("#name_adress_checkbox_4_50_7").hide();
        }

        //of50_2_7
        if ($("#_2046_of50f_number").val() != "" || $("#_2047_of50f_details").val() != "") {
            $("#name_adress_checkbox_2_50_7").prop("checked", true);
            $("#check_mf50f_2_7").show();
        } else {
            $("#name_adress_checkbox_2_50_7").prop("checked", false);
            $("#check_mf50f_2_7").hide();
        }
        //mf50_3_7
        if ($("#_2048_of50f_number").val() != "" || $("#_2049_of50f_details").val() != "") {
            $("#name_adress_checkbox_3_50_7").prop("checked", true);
            $("#check_mf50f_3_7").show();
        } else {
            $("#name_adress_checkbox_3_50_7").prop("checked", false);
            $("#check_mf50f_3_7").hide();
        }
        //mf50_4_7
        if ($("#_2050_of50f_number").val() != "" || $("#_2051_of50f_details").val() != "") {
            $("#name_adress_checkbox_4_50_7").prop("checked", true);
            $("#check_mf50f_4_7").show();
        } else {
            $("#name_adress_checkbox_4_50_7").prop("checked", false);
            $("#check_mf50f_4_7").hide();
        }

        if ($("#_2150_of52a_Party_Identifier").val() != "" || $("#_2151_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_7").val("a").attr("selected", true);
            $("#div_of52a__7").show();
            $("#div_of52b__7").hide();
            $("#div_of52d__7").hide();
            $("#_2150_of52a_Party_Identifier").attr("disabled", false);
            $("#_2151_of52a_Identifier_Code").attr("disabled", false);
            $("#_2152_of52b_Party_Identifier").attr("disabled", true);
            $("#_2153_of52b_Location").attr("disabled", true);
            $("#_2154_of52d_Party_Identifier").attr("disabled", true);
            $("#_2155_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_2152_of52b_Party_Identifier").val() != "" || $("#_2153_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_7").val("b").attr("selected", true);
            $("#div_of52a__7").hide();
            $("#div_of52b__7").show();
            $("#div_of52d__7").hide();
            $("#_2150_of52a_Party_Identifier").attr("disabled", true);
            $("#_2151_of52a_Identifier_Code").attr("disabled", true);
            $("#_2152_of52b_Party_Identifier").attr("disabled", false);
            $("#_2153_of52b_Location").attr("disabled", false);
            $("#_2154_of52d_Party_Identifier").attr("disabled", true);
            $("#_2155_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_2154_of52d_Party_Identifier").val() != "" || $("#_2155_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_7").val("d").attr("selected", true);
            $("#div_of52a__7").hide();
            $("#div_of52b__7").hide();
            $("#div_of52d__7").show();
            $("#_2150_of52a_Party_Identifier").attr("disabled", true);
            $("#_2151_of52a_Identifier_Code").attr("disabled", true);
            $("#_2152_of52b_Party_Identifier").attr("disabled", true);
            $("#_2153_of52b_Location").attr("disabled", true);
            $("#_2154_of52d_Party_Identifier").attr("disabled", false);
            $("#_2155_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_7").val("").attr("selected", true);
            $("#div_of52a__7").hide();
            $("#div_of52b__7").hide();
            $("#div_of52d__7").hide();
        }

        //mf59 /59f_7
        if ($("#_2160_mf59_account").val() != "" || $("#_2161_mf59_name_address").val() != "") {
            $("#type_of59_59a__7").val("59").attr("selected", true);
            $("#div_mf59__7").show();
            $("#div_mf59f__7").hide();
            $("#div_mf59f_2_7").hide();
            $("#div_mf59f_3_7").hide();
            $("#div_mf59f_4_7").hide();
            $("#_2160_mf59_account").attr("disabled", false);
            $("#_2161_mf59_name_address").attr("disabled", false);
            $("#_2162_mf59f_account").attr("disabled", true);
            $("#_2163_mf59f_number").attr("disabled", true);
            $("#_2164_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_7").attr("disabled", true);
            $("name_address_checkbox_3_7").attr("disabled", true);
            $("name_address_checkbox_4_7").attr("disabled", true);
        } else if ($("#_2162_mf59f_account").val() != "" || $("#_2163_mf59f_number").val() != "" || $("#_2164_mf59f_details").val() != "") {
            $("#type_of59_59a__7").val("59f").attr("selected", true);
            $("#div_mf59__7").hide();
            $("#div_mf59f__7").show();
            $("#div_mf59f_2_7").show();
            $("#div_mf59f_3_7").show();
            $("#div_mf59f_4_7").show();
            $("#_2160_mf59_account").attr("disabled", true);
            $("#_2161_mf59_name_address").attr("disabled", true);
            $("#_2162_mf59f_account").attr("disabled", false);
            $("#_2163_mf59f_number").attr("disabled", false);
            $("#_2164_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_7").attr("disabled", false);
            $("name_address_checkbox_3_7").attr("disabled", false);
        } else {
            $("#div_mf59__7").hide();
            $("#div_mf59f__7").hide();
            $("#div_mf59f_2_7").hide();
            $("#div_mf59f_3_7").hide();
            $("#div_mf59f_4_7").hide();
            $("#_2160_mf59_account").attr("disabled", true);
            $("#_2161_mf59_name_address").attr("disabled", true);
            $("#_2162_mf59f_account").attr("disabled", true);
            $("#_2163_mf59f_number").attr("disabled", true);
            $("#_2164_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_7").attr("disabled", true);
            $("name_address_checkbox_3_7").attr("disabled", true);
            $("name_address_checkbox_4_7").attr("disabled", true);
        }
        //mf59f_7_2
        if ($("#_2165_mf59f_number").val() != "" || $("#_2166_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_7").prop("checked", true);
            $("#check_mf59f_2_7").show();
        } else {
            $("#name_address_checkbox_2_7").prop("checked", false);
            $("#check_mf59f_2_7").hide();
        }
        //mf59f_7_3
        if ($("#_2167_mf59f_number").val() != "" || $("#_2168_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_7").prop("checked", true);
            $("#check_mf59f_3_7").show();
        } else {
            $("#name_address_checkbox_3_7").prop("checked", false);
            $("#check_mf59f_3_7").hide();
        }
        //mf59f_7_4
        if ($("#_2169_mf59f_number").val() != "" || $("#_2170_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_7").prop("checked", true);
            $("#check_mf59f_4_7").show();
        } else {
            $("#name_address_checkbox_4_7").prop("checked", false);
            $("#check_mf59f_4_7").hide();
        }

        if ($("#_2340_mf32a_date").val() != "" || $("#_2341_mf32a_currency").val() != "" || $("#_2342_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_8").val("a").attr("selected", true);
            $("#div_mf32a_8").show();
            $("#div_mf32b_8").hide();
            $("#_2340_mf32a_date").attr("disabled", false);
            $("#_2341_mf32a_currency").attr("disabled", false);
            $("#_2342_mf32a_amount").attr("disabled", false);
            $("#_2343_mf32b_currency").attr("disabled", true);
            $("#_2344_mf32b_amount").attr("disabled", true);
        } else if ($("#_2343_mf32b_currency").val() != "" || $("#_2344_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_8").val("b").attr("selected", true);
            $("#div_mf32a_8").hide();
            $("#div_mf32b_8").show();
            $("#_2340_mf32a_date").attr("disabled", true);
            $("#_2341_mf32a_currency").attr("disabled", true);
            $("#_2342_mf32a_amount").attr("disabled", true);
            $("#_2343_mf32b_currency").attr("disabled", false);
            $("#_2344_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_8").val("").attr("selected", true);
            $("#div_mf32a_8").hide();
            $("#div_mf32b_8").hide();
        }

        //of50_8
        if ($("#_2350_of50a_account").val() != "" || $("#_2351_of50a_identifier_code").val() != "" || $("#_2352_of50a_address").val() != "") {
            $("#type_of50_payer_8").val("a").attr("selected", true);
            $("#div_of50a__8").show();
            $("#div_mf50f__8").hide();
            $("#div_mf50f_2_8").hide();
            $("#div_mf50f_3_8").hide();
            $("#div_mf50f_4_8").hide();
            $("#div_mf50k__8").hide();
            $("#_2350_of50a_account").attr("disabled", false);
            $("#_2351_of50a_identifier_code").attr("disabled", false);
            $("#_2352_of50a_address").attr("disabled", false);
            $("#_2353_of50f_account").attr("disabled", true);
            $("#_2354_mf50f_number").attr("disabled", true);
            $("#_2355_of50f_details").attr("disabled", true);
            $("#name_adress_checkbox_2_50_8").attr("disabled", true);
            $("#name_adress_checkbox_3_50_8").attr("disabled", true);
            $("#name_adress_checkbox_4_50_8").attr("disabled", true);
        } else if ($("#_2353_of50f_account").val() != "" || $("#_2354_mf50f_number").val() != "" || $("#_2355_of50f_details").val() != "") {
            $("#type_of50_payer_8").val("f").attr("selected", true);
            $("#div_of50a__8").hide();
            $("#div_mf50f__8").show();
            $("#div_mf50f_2_8").show();
            $("#div_mf50f_3_8").show();
            $("#div_mf50f_4_8").show();
            $("#div_mf50k__8").hide();
            $("#_2350_of50a_account").attr("disabled", true);
            $("#_2351_of50a_identifier_code").attr("disabled", true);
            $("#_2352_of50a_address").attr("disabled", true);
            $("#_2353_of50f_account").attr("disabled", false);
            $("#_2354_mf50f_number").attr("disabled", false);
            $("#_2355_of50f_details").attr("disabled", false);
            $("#name_adress_checkbox_2_50_8").attr("disabled", false);
            $("#name_adress_checkbox_3_50_8").attr("disabled", false);
            $("#name_adress_checkbox_4_50_8").attr("disabled", false);
        } else if ($("#_2362_of50k_account").val() != "" || $("#_2363_of50k_name_address").val() != "") {
            $("#type_of50_payer_8").val("k").attr("selected", true);
            $("#div_of50a__8").hide();
            $("#div_mf50f__8").hide();
            $("#div_mf50f_2_8").hide();
            $("#div_mf50f_3_8").hide();
            $("#div_mf50f_4_8").hide();
            $("#div_mf50k__8").show();
            //_2362_of50k_account
            $("#_2350_of50a_account").attr("disabled", true);
            $("#_2351_of50a_identifier_code").attr("disabled", true);
            $("#_2352_of50a_address").attr("disabled", true);
            $("#_2353_of50f_account").attr("disabled", true);
            $("#_2354_mf50f_number").attr("disabled", true);
            $("#_2355_of50f_details").attr("disabled", true);
            $("#_2362_of50k_account").attr("disabled", false);
            $("#_2363_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__8").hide();
            $("#div_mf50f__8").hide();
            $("#div_mf50f_2_8").hide();
            $("#div_mf50f_3_8").hide();
            $("#div_mf50f_4_8").hide();
            $("#div_mf50k__8").hide();
            $("#name_adress_checkbox_2_50_8").hide();
            $("#name_adress_checkbox_3_50_8").hide();
            $("#name_adress_checkbox_4_50_8").hide();
        }
        //of50_2_8
        if ($("#_2356_of50f_number").val() != "" || $("#_2357_of50f_details").val() != "") {
            $("#name_adress_checkbox_2_50_8").prop("checked", true);
            $("#check_mf50f_2_8").show();
        } else {
            $("#name_adress_checkbox_2_50_8").prop("checked", false);
            $("#check_mf50f_2_8").hide();
        }
        //mf50_3_8
        if ($("#_2358_of50f_number").val() != "" || $("#_2359_of50f_details").val() != "") {
            $("#name_adress_checkbox_3_50_8").prop("checked", true);
            $("#check_mf50f_3_8").show();
        } else {
            $("#name_adress_checkbox_3_50_8").prop("checked", false);
            $("#check_mf50f_3_8").hide();
        }
        //mf50_4_8
        if ($("#_2360_of50f_number").val() != "" || $("#_2361_of50f_details").val() != "") {
            $("#name_adress_checkbox_4_50_8").prop("checked", true);
            $("#check_mf50f_4_8").show();
        } else {
            $("#name_adress_checkbox_4_50_8").prop("checked", false);
            $("#check_mf50f_4_8").hide();
        }

        //of 52a/b/d_8
        if ($("#_2460_of52a_Party_Identifier").val() != "" || $("#_2461_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_8").val("a").attr("selected", true);
            $("#div_of52a__8").show();
            $("#div_of52b__8").hide();
            $("#div_of52d__8").hide();
            $("#_2460_of52a_Party_Identifier").attr("disabled", false);
            $("#_2461_of52a_Identifier_Code").attr("disabled", false);
            $("#_2462_of52b_Party_Identifier").attr("disabled", true);
            $("#_2463_of52b_Location").attr("disabled", true);
            $("#_2464_of52d_Party_Identifier").attr("disabled", true);
            $("#_2465_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_2462_of52b_Party_Identifier").val() != "" || $("#_2463_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_8").val("b").attr("selected", true);
            $("#div_of52a__8").hide();
            $("#div_of52b__8").show();
            $("#div_of52d__8").hide();
            $("#_2460_of52a_Party_Identifier").attr("disabled", true);
            $("#_2461_of52a_Identifier_Code").attr("disabled", true);
            $("#_2462_of52b_Party_Identifier").attr("disabled", false);
            $("#_2463_of52b_Location").attr("disabled", false);
            $("#_2464_of52d_Party_Identifier").attr("disabled", true);
            $("#_2465_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_2464_of52d_Party_Identifier").val() != "" || $("#_2465_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_8").val("d").attr("selected", true);
            $("#div_of52a__8").hide();
            $("#div_of52b__8").hide();
            $("#div_of52d__8").show();
            $("#_2460_of52a_Party_Identifier").attr("disabled", true);
            $("#_2461_of52a_Identifier_Code").attr("disabled", true);
            $("#_2462_of52b_Party_Identifier").attr("disabled", true);
            $("#_2463_of52b_Location").attr("disabled", true);
            $("#_2464_of52d_Party_Identifier").attr("disabled", false);
            $("#_2465_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_8").val("").attr("selected", true);
            $("#div_of52a__8").hide();
            $("#div_of52b__8").hide();
            $("#div_of52d__8").hide();
        }
        //mf59 /59f_8
        if ($("#_2470_mf59_account").val() != "" || $("#_2471_mf59_name_address").val() != "") {
            $("#type_of59_59a__8").val("59").attr("selected", true);
            $("#div_mf59__8").show();
            $("#div_mf59f__8").hide();
            $("#div_mf59f_2_8").hide();
            $("#div_mf59f_3_8").hide();
            $("#div_mf59f_4_8").hide();
            $("#_2470_mf59_account").attr("disabled", false);
            $("#_2471_mf59_name_address").attr("disabled", false);
            $("#_2472_mf59f_account").attr("disabled", true);
            $("#_2473_mf59f_number").attr("disabled", true);
            $("#_2474_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_8").attr("disabled", true);
            $("name_address_checkbox_3_8").attr("disabled", true);
            $("name_address_checkbox_4_8").attr("disabled", true);
        } else if ($("#_2472_mf59f_account").val() != "" || $("#_2473_mf59f_number").val() != "" || $("#_2474_mf59f_details").val() != "") {
            $("#type_of59_59a__8").val("59f").attr("selected", true);
            $("#div_mf59__8").hide();
            $("#div_mf59f__8").show();
            $("#div_mf59f_2_8").show();
            $("#div_mf59f_3_8").show();
            $("#div_mf59f_4_8").show();
            $("#_2470_mf59_account").attr("disabled", true);
            $("#_2471_mf59_name_address").attr("disabled", true);
            $("#_2472_mf59f_account").attr("disabled", false);
            $("#_2473_mf59f_number").attr("disabled", false);
            $("#_2474_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_8").attr("disabled", false);
            $("name_address_checkbox_3_8").attr("disabled", false);
            $("name_address_checkbox_4_8").attr("disabled", false);
        } else {
            $("#div_mf59__8").hide();
            $("#div_mf59f__8").hide();
            $("#div_mf59f_2_8").hide();
            $("#div_mf59f_3_8").hide();
            $("#div_mf59f_4_8").hide();
            $("#_2470_mf59_account").attr("disabled", true);
            $("#_2471_mf59_name_address").attr("disabled", true);
            $("#_2472_mf59f_account").attr("disabled", true);
            $("#_2473_mf59f_number").attr("disabled", true);
            $("#_2474_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_8").attr("disabled", true);
            $("name_address_checkbox_3_8").attr("disabled", true);
            $("name_address_checkbox_4_8").attr("disabled", true);
        }
        //mf59f_8_2
        if ($("#_2475_mf59f_number").val() != "" || $("#_2476_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_8").prop("checked", true);
            $("#check_mf59f_2_8").show();
        } else {
            $("#name_address_checkbox_2_8").prop("checked", false);
            $("#check_mf59f_2_8").hide();
        }
        //mf59f_8_3
        if ($("#_2477_mf59f_number").val() != "" || $("#_2478_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_8").prop("checked", true);
            $("#check_mf59f_3_8").show();
        } else {
            $("#name_address_checkbox_3_8").prop("checked", false);
            $("#check_mf59f_3_8").hide();
        }
        //mf59f_8_4
        if ($("#_2479_mf59f_number").val() != "" || $("#_2480_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_8").prop("checked", true);
            $("#check_mf59f_4_8").show();
        } else {
            $("#name_address_checkbox_4_8").prop("checked", false);
            $("#check_mf59f_4_8").hide();
        }

        //mf32_9
        if ($("#_2650_mf32a_date").val() != "" || $("#_2651_mf32a_currency").val() != "" || $("#_2652_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_9").val("a").attr("selected", true);
            $("#div_mf32a_9").show();
            $("#div_mf32b_9").hide();
            $("#_2650_mf32a_date").attr("disabled", false);
            $("#_2651_mf32a_currency").attr("disabled", false);
            $("#_2652_mf32a_amount").attr("disabled", false);
            $("#_2653_mf32b_currency").attr("disabled", true);
            $("#_2654_mf32b_amount").attr("disabled", true);
        } else if ($("#_2653_mf32b_currency").val() != "" || $("#_2654_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_9").val("b").attr("selected", true);
            $("#div_mf32a_9").hide();
            $("#div_mf32b_9").show();
            $("#_2650_mf32a_date").attr("disabled", true);
            $("#_2651_mf32a_currency").attr("disabled", true);
            $("#_2652_mf32a_amount").attr("disabled", true);
            $("#_2653_mf32b_currency").attr("disabled", false);
            $("#_2654_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_9").val("").attr("selected", true);
            $("#div_mf32a_9").hide();
            $("#div_mf32b_9").hide();
        }

        if ($("#_2660_of50a_account").val() != "" || $("#_2661_of50a_identifier_code").val() != "" || $("#_2662_of50a_address").val() != "") {
            $("#type_of50_payer_9").val("a").attr("selected", true);
            $("#div_of50a__9").show();
            $("#div_mf50f__9").hide();
            $("#div_mf50f_2_9").hide();
            $("#div_mf50f_3_9").hide();
            $("#div_mf50f_4_9").hide();
            $("#div_mf50k__9").hide();
            $("#_2660_of50a_account").attr("disabled", false);
            $("#_2661_of50a_identifier_code").attr("disabled", false);
            $("#_2662_of50a_address").attr("disabled", false);
            $("#_2663_of50f_account").attr("disabled", true);
            $("#_2664_mf50f_number").attr("disabled", true);
            $("#_2665_of50f_details").attr("disabled", true);
            $("#name_adress_checkbox_2_50_9").attr("disabled", true);
            $("#name_adress_checkbox_3_50_9").attr("disabled", true);
            $("#name_adress_checkbox_4_50_9").attr("disabled", true);
        } else if ($("#_2663_of50f_account").val() != "" || $("#_2664_mf50f_number").val() != "" || $("#_2665_of50f_details").val() != "") {
            $("#type_of50_payer_9").val("f").attr("selected", true);
            $("#div_of50a__9").hide();
            $("#div_mf50f__9").show();
            $("#div_mf50f_2_9").show();
            $("#div_mf50f_3_9").show();
            $("#div_mf50f_4_9").show();
            $("#div_mf50k__9").hide();
            $("#_2660_of50a_account").attr("disabled", true);
            $("#_2661_of50a_identifier_code").attr("disabled", true);
            $("#_2662_of50a_address").attr("disabled", true);
            $("#_2663_of50f_account").attr("disabled", false);
            $("#_2664_mf50f_number").attr("disabled", false);
            $("#_2665_of50f_details").attr("disabled", false);
            $("#name_adress_checkbox_2_50_9").attr("disabled", false);
            $("#name_adress_checkbox_3_50_9").attr("disabled", false);
            $("#name_adress_checkbox_4_50_9").attr("disabled", false);
        } else if ($("#_2672_of50k_account").val() != "" || $("#_2673_of50k_name_address").val() != "") {
            $("#type_of50_payer_9").val("k").attr("selected", true);
            $("#div_of50a__9").hide();
            $("#div_mf50f__9").hide();
            $("#div_mf50f_2_9").hide();
            $("#div_mf50f_3_9").hide();
            $("#div_mf50f_4_9").hide();
            $("#div_mf50k__9").show();
            //_2672_of50k_account
            $("#_2660_of50a_account").attr("disabled", true);
            $("#_2661_of50a_identifier_code").attr("disabled", true);
            $("#_2662_of50a_address").attr("disabled", true);
            $("#_2663_of50f_account").attr("disabled", true);
            $("#_2664_mf50f_number").attr("disabled", true);
            $("#_2665_of50f_details").attr("disabled", true);
            $("#_2672_of50k_account").attr("disabled", false);
            $("#_2673_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__9").hide();
            $("#div_mf50f__9").hide();
            $("#div_mf50f_2_9").hide();
            $("#div_mf50f_3_9").hide();
            $("#div_mf50f_4_9").hide();
            $("#div_mf50k__9").hide();
            $("#name_adress_checkbox_2_50_9").hide();
            $("#name_adress_checkbox_3_50_9").hide();
            $("#name_adress_checkbox_4_50_9").hide();
        }

        //of50_2_9
        if ($("#_2666_of50f_number").val() != "" || $("#_2667_of50f_details").val() != "") {
            $("#name_adress_checkbox_2_50_9").prop("checked", true);
            $("#check_mf50f_2_9").show();
        } else {
            $("#name_adress_checkbox_2_50_9").prop("checked", false);
            $("#check_mf50f_2_9").hide();
        }
        //mf50_3_9
        if ($("#_2668_of50f_number").val() != "" || $("#_2669_of50f_details").val() != "") {
            $("#name_adress_checkbox_3_50_9").prop("checked", true);
            $("#check_mf50f_3_9").show();
        } else {
            $("#name_adress_checkbox_3_50_9").prop("checked", false);
            $("#check_mf50f_3_9").hide();
        }
        //mf50_4_9
        if ($("#_2670_of50f_number").val() != "" || $("#_2671_of50f_details").val() != "") {
            $("#name_adress_checkbox_4_50_9").prop("checked", true);
            $("#check_mf50f_4_9").show();
        } else {
            $("#name_adress_checkbox_4_50_9").prop("checked", false);
            $("#check_mf50f_4_9").hide();
        }

        //of 52a/b/d_9
        if ($("#_2770_of52a_Party_Identifier").val() != "" || $("#_2771_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_9").val("a").attr("selected", true);
            $("#div_of52a__9").show();
            $("#div_of52b__9").hide();
            $("#div_of52d__9").hide();
            $("#_2770_of52a_Party_Identifier").attr("disabled", false);
            $("#_2771_of52a_Identifier_Code").attr("disabled", false);
            $("#_2772_of52b_Party_Identifier").attr("disabled", true);
            $("#_2773_of52b_Location").attr("disabled", true);
            $("#_2774_of52d_Party_Identifier").attr("disabled", true);
            $("#_2775_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_2772_of52b_Party_Identifier").val() != "" || $("#_2773_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_9").val("b").attr("selected", true);
            $("#div_of52a__9").hide();
            $("#div_of52b__9").show();
            $("#div_of52d__9").hide();
            $("#_2770_of52a_Party_Identifier").attr("disabled", true);
            $("#_2771_of52a_Identifier_Code").attr("disabled", true);
            $("#_2772_of52b_Party_Identifier").attr("disabled", false);
            $("#_2773_of52b_Location").attr("disabled", false);
            $("#_2774_of52d_Party_Identifier").attr("disabled", true);
            $("#_2775_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_2774_of52d_Party_Identifier").val() != "" || $("#_2775_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_9").val("d").attr("selected", true);
            $("#div_of52a__9").hide();
            $("#div_of52b__9").hide();
            $("#div_of52d__9").show();
            $("#_2770_of52a_Party_Identifier").attr("disabled", true);
            $("#_2771_of52a_Identifier_Code").attr("disabled", true);
            $("#_2772_of52b_Party_Identifier").attr("disabled", true);
            $("#_2773_of52b_Location").attr("disabled", true);
            $("#_2774_of52d_Party_Identifier").attr("disabled", false);
            $("#_2775_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_9").val("").attr("selected", true);
            $("#div_of52a__9").hide();
            $("#div_of52b__9").hide();
            $("#div_of52d__9").hide();
        }
        //mf59 /59f_9
        if ($("_2780_mf59_account").val() != "" || $("#_2781_mf59_name_address").val() != "") {
            $("#type_of59_59a__9").val("59").attr("selected", true);
            $("#div_mf59__9").show();
            $("#div_mf59f__9").hide();
            $("#div_mf59f_2_9").hide();
            $("#div_mf59f_3_9").hide();
            $("#div_mf59f_4_9").hide();
            $("#_2780_mf59_account").attr("disabled", false);
            $("#_2781_mf59_name_address").attr("disabled", false);
            $("#_2782_mf59f_account").attr("disabled", true);
            $("#_2783_mf59f_number").attr("disabled", true);
            $("#_2784_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_9").attr("disabled", true);
            $("name_address_checkbox_3_9").attr("disabled", true);
            $("name_address_checkbox_4_9").attr("disabled", true);
        } else if ($("#_2782_mf59f_account").val() != "" || $("#_2783_mf59f_number").val() != "" || $("#_2784_mf59f_details").val() != "") {
            $("#type_of59_59a__9").val("59f").attr("selected", true);
            $("#div_mf59__9").hide();
            $("#div_mf59f__9").show();
            $("#div_mf59f_2_9").show();
            $("#div_mf59f_3_9").show();
            $("#div_mf59f_4_9").show();
            $("#_2780_mf59_account").attr("disabled", true);
            $("#_2781_mf59_name_address").attr("disabled", true);
            $("#_2782_mf59f_account").attr("disabled", false);
            $("#_2783_mf59f_number").attr("disabled", false);
            $("#_2784_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_9").attr("disabled", false);
            $("name_address_checkbox_3_9").attr("disabled", false);
            $("name_address_checkbox_4_9").attr("disabled", false);
        } else {
            $("#div_mf59__9").hide();
            $("#div_mf59f__9").hide();
            $("#div_mf59f_2_9").hide();
            $("#div_mf59f_3_9").hide();
            $("#div_mf59f_4_9").hide();
            $("#_2780_mf59_account").attr("disabled", true);
            $("#_2781_mf59_name_address").attr("disabled", true);
            $("#_2782_mf59f_account").attr("disabled", true);
            $("#_2783_mf59f_number").attr("disabled", true);
            $("#_2784_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_9").attr("disabled", true);
            $("name_address_checkbox_3_9").attr("disabled", true);
            $("name_address_checkbox_4_9").attr("disabled", true);
        }
        //mf59f_9_2
        if ($("#_2785_mf59f_number").val() != "" || $("#_2786_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_9").prop("checked", true);
            $("#check_mf59f_2_9").show();
        } else {
            $("#name_address_checkbox_2_9").prop("checked", false);
            $("#check_mf59f_2_9").hide();
        }
        //mf59f_9_3
        if ($("#_2787_mf59f_number").val() != "" || $("#_2788_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_9").prop("checked", true);
            $("#check_mf59f_3_9").show();
        } else {
            $("#name_address_checkbox_3_9").prop("checked", false);
            $("#check_mf59f_3_9").hide();
        }
        //mf59f_9_4
        if ($("#_2789_mf59f_number").val() != "" || $("#_2790_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_9").prop("checked", true);
            $("#check_mf59f_4_9").show();
        } else {
            $("#name_address_checkbox_4_9").prop("checked", false);
            $("#check_mf59f_4_9").hide();
        }

        //mf32_10
        if ($("#_2960_mf32a_date").val() != "" || $("#_2961_mf32a_currency").val() != "" || $("#_2962_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_10").val("a").attr("selected", true);
            $("#div_mf32a_10").show();
            $("#div_mf32b_10").hide();
            $("#_2960_mf32a_date").attr("disabled", false);
            $("#_2961_mf32a_currency").attr("disabled", false);
            $("#_2962_mf32a_amount").attr("disabled", false);
            $("#_2963_mf32b_currency").attr("disabled", true);
            $("#_2964_mf32b_amount").attr("disabled", true);
        } else if ($("#_2963_mf32b_currency").val() != "" || $("#_2964_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_10").val("b").attr("selected", true);
            $("#div_mf32a_10").hide();
            $("#div_mf32b_10").show();
            $("#_2960_mf32a_date").attr("disabled", true);
            $("#_2961_mf32a_currency").attr("disabled", true);
            $("#_2962_mf32a_amount").attr("disabled", true);
            $("#_2963_mf32b_currency").attr("disabled", false);
            $("#_2964_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_10").val("").attr("selected", true);
            $("#div_mf32a_10").hide();
            $("#div_mf32b_10").hide();
        }

        //of50_10
        if ($("#_2970_of50a_account").val() != "" || $("#_2971_of50a_identifier_code").val() != "" || $("#_2972_of50a_address").val() != "") {
            $("#type_of50_payer_10").val("a").attr("selected", true);
            $("#div_of50a__10").show();
            $("#div_mf50f__10").hide();
            $("#div_mf50f_2_10").hide();
            $("#div_mf50f_3_10").hide();
            $("#div_mf50f_4_10").hide();
            $("#div_mf50k__10").hide();
            $("#_2970_of50a_account").attr("disabled", false);
            $("#_2971_of50a_identifier_code").attr("disabled", false);
            $("#_2972_of50a_address").attr("disabled", false);
            $("#_2973_of50f_account").attr("disabled", true);
            $("#_2974_mf50f_number").attr("disabled", true);
            $("#_2975_of50f_details").attr("disabled", true);
            $("#name_adress_checkbox_2_50_10").attr("disabled", true);
            $("#name_adress_checkbox_3_50_10").attr("disabled", true);
            $("#name_adress_checkbox_4_50_10").attr("disabled", true);
        } else if ($("#_2973_of50f_account").val() != "" || $("#_2974_mf50f_number").val() != "" || $("#_2975_of50f_details").val() != "") {
            $("#type_of50_payer_10").val("f").attr("selected", true);
            $("#div_of50a__10").hide();
            $("#div_mf50f__10").show();
            $("#div_mf50f_2_10").show();
            $("#div_mf50f_3_10").show();
            $("#div_mf50f_4_10").show();
            $("#div_mf50k__10").hide();
            $("#_2970_of50a_account").attr("disabled", true);
            $("#_2971_of50a_identifier_code").attr("disabled", true);
            $("#_2972_of50a_address").attr("disabled", true);
            $("#_2973_of50f_account").attr("disabled", false);
            $("#_2974_mf50f_number").attr("disabled", false);
            $("#_2975_of50f_details").attr("disabled", false);
            $("#name_adress_checkbox_2_50_10").attr("disabled", false);
            $("#name_adress_checkbox_3_50_10").attr("disabled", false);
            $("#name_adress_checkbox_4_50_10").attr("disabled", false);
        } else if ($("#_2982_of50k_account").val() != "" || $("#_2983_of50k_name_address").val() != "") {
            $("#type_of50_payer_10").val("k").attr("selected", true);
            $("#div_of50a__10").hide();
            $("#div_mf50f__10").hide();
            $("#div_mf50f_2_10").hide();
            $("#div_mf50f_3_10").hide();
            $("#div_mf50f_4_10").hide();
            $("#div_mf50k__10").show();
            //_2982_of50k_account
            $("#_2970_of50a_account").attr("disabled", true);
            $("#_2971_of50a_identifier_code").attr("disabled", true);
            $("#_2972_of50a_address").attr("disabled", true);
            $("#_2973_of50f_account").attr("disabled", true);
            $("#_2974_mf50f_number").attr("disabled", true);
            $("#_2975_of50f_details").attr("disabled", true);
            $("#_2982_of50k_account").attr("disabled", false);
            $("#_2983_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__10").hide();
            $("#div_mf50f__10").hide();
            $("#div_mf50f_2_10").hide();
            $("#div_mf50f_3_10").hide();
            $("#div_mf50f_4_10").hide();
            $("#div_mf50k__10").hide();
            $("#name_adress_checkbox_2_50_10").hide();
            $("#name_adress_checkbox_3_50_10").hide();
            $("#name_adress_checkbox_4_50_10").hide();
        }
        //of50_2_10
        if ($("#_2976_of50f_number").val() != "" || $("#_2977_of50f_details").val() != "") {
            $("#name_adress_checkbox_2_50_10").prop("checked", true);
            $("#check_mf50f_2_10").show();
        } else {
            $("#name_adress_checkbox_2_50_10").prop("checked", false);
            $("#check_mf50f_2_10").hide();
        }
        //mf50_3_10
        if ($("#_2978_of50f_number").val() != "" || $("#_2979_of50f_details").val() != "") {
            $("#name_adress_checkbox_3_50_10").prop("checked", true);
            $("#check_mf50f_3_10").show();
        } else {
            $("#name_adress_checkbox_3_50_10").prop("checked", false);
            $("#check_mf50f_3_10").hide();
        }
        //mf50_4_10
        if ($("#_2980_of50f_number").val() != "" || $("#_2981_of50f_details").val() != "") {
            $("#name_adress_checkbox_4_50_10").prop("checked", true);
            $("#check_mf50f_4_10").show();
        } else {
            $("#name_adress_checkbox_4_50_10").prop("checked", false);
            $("#check_mf50f_4_10").hide();
        }

        //of 52a/b/d_10
        if ($("#_3080_of52a_Party_Identifier").val() != "" || $("#_3081_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_10").val("a").attr("selected", true);
            $("#div_of52a__10").show();
            $("#div_of52b__10").hide();
            $("#div_of52d__10").hide();
            $("#_3080_of52a_Party_Identifier").attr("disabled", false);
            $("#_3081_of52a_Identifier_Code").attr("disabled", false);
            $("#_3082_of52b_Party_Identifier").attr("disabled", true);
            $("#_3083_of52b_Location").attr("disabled", true);
            $("#_3084_of52d_Party_Identifier").attr("disabled", true);
            $("#_3085_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_3082_of52b_Party_Identifier").val() != "" || $("#_3083_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_10").val("b").attr("selected", true);
            $("#div_of52a__10").hide();
            $("#div_of52b__10").show();
            $("#div_of52d__10").hide();
            $("#_3080_of52a_Party_Identifier").attr("disabled", true);
            $("#_3081_of52a_Identifier_Code").attr("disabled", true);
            $("#_3082_of52b_Party_Identifier").attr("disabled", false);
            $("#_3083_of52b_Location").attr("disabled", false);
            $("#_3084_of52d_Party_Identifier").attr("disabled", true);
            $("#_3085_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_3084_of52d_Party_Identifier").val() != "" || $("#_3085_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_10").val("d").attr("selected", true);
            $("#div_of52a__10").hide();
            $("#div_of52b__10").hide();
            $("#div_of52d__10").show();
            $("#_3080_of52a_Party_Identifier").attr("disabled", true);
            $("#_3081_of52a_Identifier_Code").attr("disabled", true);
            $("#_3082_of52b_Party_Identifier").attr("disabled", true);
            $("#_3083_of52b_Location").attr("disabled", true);
            $("#_3084_of52d_Party_Identifier").attr("disabled", false);
            $("#_3085_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_10").val("").attr("selected", true);
            $("#div_of52a__10").hide();
            $("#div_of52b__10").hide();
            $("#div_of52d__10").hide();
        }
        //mf59 /59f_10
        if ($("#_3090_mf59_account").val() != "" || $("#_3091_mf59_name_address").val() != "") {
            $("#type_of59_59a__10").val("59").attr("selected", true);
            $("#div_mf59__10").show();
            $("#div_mf59f__10").hide();
            $("#div_mf59f_2_10").hide();
            $("#div_mf59f_3_10").hide();
            $("#div_mf59f_4_10").hide();
            $("#_3090_mf59_account").attr("disabled", false);
            $("#_3091_mf59_name_address").attr("disabled", false);
            $("#_3092_mf59f_account").attr("disabled", true);
            $("#_3093_mf59f_number").attr("disabled", true);
            $("#_3094_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_10").attr("disabled", true);
            $("name_address_checkbox_3_10").attr("disabled", true);
            $("name_address_checkbox_4_10").attr("disabled", true);
        } else if ($("#_3092_mf59f_account").val() != "" || $("#_3093_mf59f_number").val() != "" || $("#_3094_mf59f_details").val() != "") {
            $("#type_of59_59a__10").val("59f").attr("selected", true);
            $("#div_mf59__10").hide();
            $("#div_mf59f__10").show();
            $("#div_mf59f_2_10").show();
            $("#div_mf59f_3_10").show();
            $("#div_mf59f_4_10").show();
            $("#_3090_mf59_account").attr("disabled", true);
            $("#_3091_mf59_name_address").attr("disabled", true);
            $("#_3092_mf59f_account").attr("disabled", false);
            $("#_3093_mf59f_number").attr("disabled", false);
            $("#_3094_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_10").attr("disabled", false);
            $("name_address_checkbox_3_10").attr("disabled", false);
            $("name_address_checkbox_4_10").attr("disabled", false);
        } else {
            $("#div_mf59__10").hide();
            $("#div_mf59f__10").hide();
            $("#div_mf59f_2_10").hide();
            $("#div_mf59f_3_10").hide();
            $("#div_mf59f_4_10").hide();
            $("#_3090_mf59_account").attr("disabled", true);
            $("#_3091_mf59_name_address").attr("disabled", true);
            $("#_3092_mf59f_account").attr("disabled", true);
            $("#_3093_mf59f_number").attr("disabled", true);
            $("#_3094_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_10").attr("disabled", true);
            $("name_address_checkbox_3_10").attr("disabled", true);
            $("name_address_checkbox_4_10").attr("disabled", true);
        }
        //mf59f_10_2
        if ($("#_3095_mf59f_number").val() != "" || $("#_3096_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_10").prop("checked", true);
            $("#check_mf59f_2_10").show();
        } else {
            $("#name_address_checkbox_2_10").prop("checked", false);
            $("#check_mf59f_2_10").hide();
        }
        //mf59f_10_3
        if ($("#_3097_mf59f_number").val() != "" || $("#_3098_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_10").prop("checked", true);
            $("#check_mf59f_3_10").show();
        } else {
            $("#name_address_checkbox_3_10").prop("checked", false);
            $("#check_mf59f_3_10").hide();
        }
        //mf59f_10_4
        if ($("#_3099_mf59f_number").val() != "" || $("#_3100_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_10").prop("checked", true);
            $("#check_mf59f_4_10").show();
        } else {
            $("#name_address_checkbox_4_10").prop("checked", false);
            $("#check_mf59f_4_10").hide();
        }

    }

</script>