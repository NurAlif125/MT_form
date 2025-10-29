<%--
    Document   : mt940
    Created on : Mei 21, 2019
    Author     : Andhita Deara
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt940.jsp" %>
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
        <c:if test="${item == 'MT:940'}">
            <div id="judul">MT 940 Customer Statement Message</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="940" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em;">
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
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Transaction Reference Number</span>
                                <input type="text" name="_010_mf20_transaction_reference_number" id="_010_mf20_transaction_reference_number" class="mandatory" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_transaction_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF21 -->
                            <div class="form-row"><span class="label_body">OF21</span><span class="label">Related Reference</span>
                                <input type="text" name="_020_of21_related_reference" id="_020_of21_related_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF25 -->
                            <div class="form-row"><span class="label_body">MF25</span><span class="label"><a style="color:red;text-decoration:none">*</a>Account Identification</span>
                                <select id="type_mf25_account_identification" name="type_mf25_account_identification" class="mandatory">
                                    <option value="">choose a type</option>
                                    <option value="f25">F25 - Account</option>
                                    <option value="f25p">F25P - Account - Identifier Code</option>
                                </select>
                                <div id="div_mf25_first_account_identification">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Account</span>
                                        <input type="text" name="_030_mf25_account" id="_030_mf25_account" class="mandatory" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf25_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                                <div id="div_mf25p_intermediate_account_identification">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Account</span>
                                        <input type="text" name="_031_mf25p_account" id="_031_mf25p_account" class="mandatory" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf25p_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_032_mf25p_identifier_code" id="_032_mf25p_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf25p_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- MF28C -->
                            <div class="form-row"><span class="label_body">MF28C</span><span class="label"><a style="color:red;text-decoration:none">*</a>Statement Number/Sequence Number</span>
                                <input type="text" name="_040_mf28c_statement_sequence_number" id="_040_mf28c_statement_sequence_number" class="mandatory" maxlength="10" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf28c_statement_sequence_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF60 -->
                            <div class="form-row"><span class="label_body">MF60</span><span class="label"><a style="color:red;text-decoration:none">*</a>Opening Balance</span>
                                <select id="type_mf60_opening_balance" name="type_mf60_opening_balance" class="mandatory">
                                    <option value="">choose a type</option>
                                    <option value="f">F - First Opening Balance</option>
                                    <option value="m">M - Intermediate Opening Balance</option>
                                </select>
                                <div id="div_mf60f_first_opening_balance" class="inline-fields">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>D/C Mark</span>
                                        <input type="text" name="_050_mf60f_dc_mark" id="_050_mf60f_dc_mark" class="mandatory" maxlength="1" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^DCdc]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf60f_dc_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date</span>
                                        <c:choose>
                                            <c:when test = "${headerById.id_headers == null}">
                                                <input type="text" name="_051_mf60f_date" id="_051_mf60f_date" class="mandatory" maxlength="6" value="<fmt:formatDate pattern='yyMMdd' value='${tgl_today}' />" />
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" name="_051_mf60f_date" id="_051_mf60f_date" class="mandatory" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_mf60f_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                                        <%--input type="text" name="_052_mf60f_currency" id="_052_mf60f_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF60F Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_mf60f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" /--%>
                                        <input type="text" name="_052_mf60f_currency" id="_052_mf60f_currency" class="mandatory" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^a-zA-Z]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_mf60f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                                        <input type="text" name="_053_mf60f_amount" id="_053_mf60f_amount" class="mandatory" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_mf60f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_052_mf60f_currency');" onblur="cek_koma(this)" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                if (isNaN(n)) {
                                                    return "";
                                                }
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_053_mf60f_amount').value;
                                            var number2r = number2.replace(',', '.');
                                            var number2F = parseFloat(number2r);
                                            var nominal = formatUang(number2F, "");
                                            var nominalStyle = nominal.fontsize(5);
                                            var nominalStylec = nominalStyle.fontcolor("blue");
                                            //var nominalStylecw = nominalStylec.fontWeight("900");
                                            if (nominal !== "") {
                                                document.write(nominalStylec);
                                            }
                                        </script>
                                    </div>
                                </div>
                                <div id="div_mf60m_intermediate_opening_balance">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>D/C Mark</span>
                                        <input type="text" name="_054_mf60m_dc_mark" id="_054_mf60m_dc_mark" class="mandatory" maxlength="1" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^DCdc]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_mf60m_dc_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date</span>
                                        <c:choose>
                                            <c:when test = "${headerById.id_headers == null}">
                                                <input type="text" name="_055_mf60m_date" id="_055_mf60m_date" class="mandatory" maxlength="6" value="<fmt:formatDate pattern='yyMMdd' value='${tgl_today}' />" />
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" name="_055_mf60m_date" id="_055_mf60m_date" class="mandatory" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_055_mf60m_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                                        <input type="text" name="_056_mf60m_currency" id="_056_mf60m_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF60M Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_056_mf60m_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                                        <input type="text" name="_057_mf60m_amount" id="_057_mf60m_amount" class="mandatory" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_057_mf60m_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_056_mf60m_currency');" onblur="cek_koma(this)" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                if (isNaN(n)) {
                                                    return "";
                                                }
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_057_mf60m_amount').value;
                                            var number2r = number2.replace(',', '.');
                                            var number2F = parseFloat(number2r);
                                            var nominal = formatUang(number2F, "");
                                            var nominalStyle = nominal.fontsize(5);
                                            var nominalStylec = nominalStyle.fontcolor("blue");
                                            //var nominalStylecw = nominalStylec.fontWeight("900");
                                            if (nominal !== "") {
                                                document.write(nominalStylec);
                                            }                                            
                                        </script>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF61 --> 
                            <div class="form-row"><span class="label_body">OF61</span><span class="label">Statement Line</span>
                                <input type="button" name="_060_of61_add" id="_060_of61_add" value="Add" />
                                <input type="button" name="_061_of61_remove" id="_061_of61_remove" value="Remove" />
                            </div>

                            <%--<c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName=='_062_of61_statement_line'}">
                                    <div id="div_of61_statement_line">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                            <textarea cols="60" rows="5" name="_062_of61_statement_line" id="_062_of61_statement_line">
                                                <c:out value="${item.detail}" />
                                            </textarea>
                                        </div>
                                    </div>
                                    <hr/>
                                </c:if>
                            </c:forEach>--%>

                            <div id="div_of61_statement_line">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                    <textarea cols="60" rows="5" name="_062_of61_statement_line" id="_062_of61_statement_line"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of61_statement_line'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF86 -->
                            <div class="form-row"><span class="label_body">OF86</span><span class="label">Information to Account Owner</span>
                                <textarea cols="65" rows="6" name="_071_of86_information_to_acc_owner" id="_071_of86_information_to_acc_owner"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of86_information_to_acc_owner'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- MF62 -->
                            <div class="form-row"><span class="label_body">MF62</span><span class="label"><a style="color:red;text-decoration:none">*</a>Closing Balance (Booked Funds)</span>
                                <select id="type_mf62_closing_balance" name="type_mf62_closing_balance" class="mandatory">
                                    <option value="">choose a type</option>
                                    <option value="f">F - Closing Balance (Booked Funds)</option>
                                    <option value="m">M - Closing Balance (Booked Funds)</option>
                                </select>
                                <div id="div_of62f_closing_balance">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>D/C Mark</span>
                                        <input type="text" name="_080_mf62f_dc_mark" id="_080_mf62f_dc_mark" class="mandatory" maxlength="1" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^DCdc]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf62f_dc_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date</span>
                                        <c:choose>
                                            <c:when test = "${headerById.id_headers == null}">
                                                <input type="text" name="_081_mf62f_date" id="_081_mf62f_date" class="mandatory" maxlength="6" value="<fmt:formatDate pattern='yyMMdd' value='${tgl_today}' />" />
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" name="_081_mf62f_date" id="_081_mf62f_date" class="mandatory" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_mf62f_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                                        <input type="text" name="_082_mf62f_currency" id="_082_mf62f_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF62F Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_mf62f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                                        <input type="text" name="_083_mf62f_amount" id="_083_mf62f_amount" class="mandatory" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf62f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_082_mf62f_currency');" onblur="cek_koma(this)" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                if (isNaN(n)) {
                                                    return "";
                                                }
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_083_mf62f_amount').value;
                                            var number2r = number2.replace(',', '.');
                                            var number2F = parseFloat(number2r);
                                            var nominal = formatUang(number2F, "");
                                            var nominalStyle = nominal.fontsize(5);
                                            var nominalStylec = nominalStyle.fontcolor("blue");
                                            //var nominalStylecw = nominalStylec.fontWeight("900");
                                            if (nominal !== "") {
                                                document.write(nominalStylec);
                                            }                                               
                                        </script>
                                    </div>
                                </div>
                                <div id="div_of62m_closing_balance">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>D/C Mark</span>
                                        <input type="text" name="_084_mf62m_dc_mark" id="_084_mf62m_dc_mark" class="mandatory" maxlength="1" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^DCdc]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_mf62m_dc_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date</span>
                                        <c:choose>
                                            <c:when test = "${headerById.id_headers == null}">
                                                <input type="text" name="_085_mf62m_date" id="_085_mf62m_date" class="mandatory" maxlength="6" value="<fmt:formatDate pattern='yyMMdd' value='${tgl_today}' />" />
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" name="_085_mf62m_date" id="_085_mf62m_date" class="mandatory" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_085_mf62m_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                                        <input type="text" name="_086_mf62m_currency" id="_086_mf62m_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF62M Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_086_mf62m_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                                        <input type="text" name="_087_mf62m_amount" id="_087_mf62m_amount" class="mandatory" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_087_mf62m_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_086_mf62m_currency');" onblur="cek_koma(this)" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                if (isNaN(n)) {
                                                    return "";
                                                }
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_087_mf62m_amount').value;
                                            var number2r = number2.replace(',', '.');
                                            var number2F = parseFloat(number2r);
                                            var nominal = formatUang(number2F, "");
                                            var nominalStyle = nominal.fontsize(5);
                                            var nominalStylec = nominalStyle.fontcolor("blue");
                                            //var nominalStylecw = nominalStylec.fontWeight("900");
                                            if (nominal !== "") {
                                                document.write(nominalStylec);
                                            }                                             
                                        </script>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!-- OF64 -->                                    
                            <div class="form-row"><span class="label_body">OF64</span><span class="label">Closing Available Balance (Available Funds)</span>
                                <input type="checkbox" name="available_funds_checkbox" id="available_funds_checkbox" />
                                <div id="check_of64">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>D/C Mark</span>
                                        <input type="text" name="_090_of64_available_funds_dc_mark" id="_090_of64_available_funds_dc_mark" class="mandatory" maxlength="1" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^DCdc]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of64_available_funds_dc_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date</span>
                                        <c:choose>
                                            <c:when test = "${headerById.id_headers == null}">
                                                <input type="text" name="_091_of64_available_funds_date" id="_091_of64_available_funds_date" class="mandatory" maxlength="6" value="<fmt:formatDate pattern='yyMMdd' value='${tgl_today}' />" />
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" name="_091_of64_available_funds_date" id="_091_of64_available_funds_date" class="mandatory" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of64_available_funds_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </c:otherwise>
                                        </c:choose>
                                    </div>                                    
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                                        <input type="text" name="_092_of64_available_funds_currency" id="_092_of64_available_funds_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="OF64 Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of64_available_funds_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                                        <input type="text" name="_093_of64_available_funds_amount" id="_093_of64_available_funds_amount" class="mandatory" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of64_available_funds_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                if (isNaN(n)) {
                                                    return "";
                                                }
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_093_of64_available_funds_amount').value;
                                            var number2r = number2.replace(',', '.');
                                            var number2F = parseFloat(number2r);
                                            var nominal = formatUang(number2F, "");
                                            var nominalStyle = nominal.fontsize(5);
                                            var nominalStylec = nominalStyle.fontcolor("blue");
                                            //var nominalStylecw = nominalStylec.fontWeight("900");
                                            if (nominal !== "") {
                                                document.write(nominalStylec);
                                            }                                                              
                                        </script>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF65 -->
                            <div class="form-row"><span class="label_body">OF65</span><span class="label">Forward Available Balance</span>
                                <input type="button" name="_100_of65_add" id="_100_of65_add" value="Add" />
                                <input type="button" name="_101_of65_remove" id="_101_of65_remove" value="Remove" />
                            </div>
                            <div id="div_of65_forward_available_balance">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">D/C Mark</span>
                                    <input type="text" name="_102_of65_dc_mark" id="_102_of65_dc_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_of65_dc_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                    <input type="text" name="_103_of65_date" id="_103_of65_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_of65_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_104_of65_currency" id="_104_of65_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_104_of65_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_105_of65_amount" id="_105_of65_amount" maxlength="15"  onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_105_of65_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    <font style="margin-left: 50px"></font>
                                    <script langauge="javascript">
                                        function formatUang(n, currency) {
                                            if (isNaN(n)) {
                                                return "";
                                            }
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_105_of65_amount').value;
                                        var number2r = number2.replace(',', '.');
                                        var number2F = parseFloat(number2r);
                                        var nominal = formatUang(number2F, "");
                                        var nominalStyle = nominal.fontsize(5);
                                        var nominalStylec = nominalStyle.fontcolor("blue");
                                        //var nominalStylecw = nominalStylec.fontWeight("900");
                                        if (nominal !== "") {
                                            document.write(nominalStylec);
                                        }
                                    </script>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF86 --> <!--maxlength-->
                            <div class="form-row"><span class="label_body">OF86</span><span class="label">Information to Account Owner</span>
                                <textarea cols="50" rows="5" name="_110_of86_information" id="_110_of86_information"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of86_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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

