<%-- 
    Document   : mt103
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : Tommy Aji
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt103.jsp" %>
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
        <c:if test="${item == 'MT:103'}">
            <div id="judul">MT 103 Single Customer Credit Transfer</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="103" />
                <% Date tgl_today = new java.util.Date();
                    pageContext.setAttribute("tgl_today", tgl_today);%>
                <c:set var="tgl_today" value="${tgl_today}" />

                <div style="width: 100%; margin: 0 auto; font: 0.85em;">
                    <ul class="tabs">
                        <li id="tab-view1"><a href="#" rel="view1">Header</a></li>
                        <li id="tab-view2"><a href="#" rel="view2">Body</a></li>
                        <li id="tab-view3"><a href="#" rel="view3">Comment</a></li>
                        <li id="tab-view4"><a href="#" rel="view4">Histories</a></li>
                        <li id="tab-view5"><a href="#" rel="view5">Log MT Text</a></li>
                        <li id="tab-view6"><a href="#" rel="view6">MT Relation</a></li>
                        <li  id="tab-view7"><a href="#" rel="view7" id="tabView7">Translation</a></li>
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
                                <input type="text" onkeypress="avoidSplChars(event)" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" class="mandatory" maxlength="16" input_type="MF20 Sender Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- MF23B -->
                                    <div class="form-row"><span class="label_body">MF23B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Bank Operation Code</span>
                                <%--<input type="text" name="_030_mf23b_bank_code" id="_030_mf23b_bank_code" maxlength="4" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23b_bank_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />--%>
                                <select id="_030_mf23b_bank_code" name="_030_mf23b_bank_code" class="mandatory" input_type="MF23B Bank Code" location="Body" >
                                    <option value="">choose a code</option>
                                    <option value="CRED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23b_bank_code'}"><c:if test="${item.detail=='CRED'}"> selected="true" </c:if></c:if></c:forEach>>CRED - Normal Credit Transfer</option> <!-- - Ordering Customer-->
                                    <option value="CRTS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23b_bank_code'}"><c:if test="${item.detail=='CRTS'}"> selected="true" </c:if></c:if></c:forEach>>CRTS - Test Message</option>
                                    <option value="SPAY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23b_bank_code'}"><c:if test="${item.detail=='SPAY'}"> selected="true" </c:if></c:if></c:forEach>>SPAY - SWIFTPay</option>
                                    <option value="SPRI" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23b_bank_code'}"><c:if test="${item.detail=='SPRI'}"> selected="true" </c:if></c:if></c:forEach>>SPRI - Prioritty</option>
                                    <option value="SSTD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23b_bank_code'}"><c:if test="${item.detail=='SSTD'}"> selected="true" </c:if></c:if></c:forEach>>SSTD - Standard</option>
                                            </select>
                                        </div>
                                        <hr/>

                                        <!-- OF23E -->
                                        <div class="form-row"><span class="label_body">OF23E</span><span class="label">Instr Code (Add Information)</span>
                                            <input type="button" name="_040_of23e_add" id="_040_of23e_add" value="Add" />
                                            <input type="button" name="_041_of23e_remove" id="_041_of23e_remove" value="Remove" />
                                        </div>
                                        <div id="div_of23e_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                                <input type="text" name="_042_of23e_code" id="_042_of23e_code" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_of23e_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF26T -->
                                    <div class="form-row"><span class="label_body">OF26T</span><span class="label">Transaction Type Code</span>
                                        <!--<input type="checkbox" name="transaction_type_code_checkbox" id="transaction_type_code_checkbox" />-->
                                        <!--<div id="check_of26t">-->
                                        <!--<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>-->
                                        <input type="text" name="_050_of26t_code" id="_050_of26t_code" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of26t_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <!--</div>-->
                                        <!--</div>-->
                                    </div>
                                    <hr/>

                            <%--                            <div class="form-row"><span class="label_body">OF29A</span><span class="label"> Contact Information </span>
                                                            <input type="checkbox" name="contact_information_checkbox" id="contact_information_checkbox" />
                                                            <div id="check_of29a">
                                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_250_of29a_contact_information" id="_250_of29a_contact_information"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of29a_contact_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                                </div>
                                                            </div>
                                                        </div>--%>


                            <!-- MF32A -->
                            <%--                            <div class="form-row"><span class="label_body">MF32A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Value Date</span>
                                                            <input type="text" name="_060_mf32a_date" id="_060_mf32a_date" class="mandatory" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                        </div>--%>

                            <div class="form-row"><span class="label_body">MF32A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Value Date</span>
                                <%--<input type="text" name="_060_mf32a_date" id="_060_mf32a_date" class="mandatory" maxlength="6" value="<c:choose><c:when test = "${item.tagName == null}"><fmt:formatDate pattern='yyMMdd' value='${tgl_today}' /></c:when><c:otherwise><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach></c:otherwise></c:choose>" size="6" />--%>
                                <c:choose>
                                    <c:when test = "${headerById.id_headers == null}">
                                        <input type="text" name="_060_mf32a_date" id="_060_mf32a_date" class="mandatory" maxlength="6" value="<fmt:formatDate pattern='yyMMdd' value='${tgl_today}' />" />
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" name="_060_mf32a_date" id="_060_mf32a_date" class="mandatory" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency Code</span>
                                <input type="text" name="_061_mf32a_currency" id="_061_mf32a_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" input_type="MF32A Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>                             
                                        <input type="text" name="_062_mf32a_amount" id="_062_mf32a_amount" class="mandatory" onpaste="return false" ondrop="return false" maxlength="15" input_type="MF32A Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_061_mf32a_currency');" onblur="cek_koma(this)" />
                                        <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                if (isNaN(n)) {
                                                    return "";
                                                }
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_062_mf32a_amount').value;
                                            var number2r = number2.replace(',', '.');
                                            var number2F = parseFloat(number2r);
                                            var nominal = formatUang(number2F, "");
                                            var nominalStyle = nominal.fontsize(2);
                                            var nominalStylec = nominalStyle.fontcolor("red");
                                            //var nominalStylecw = nominalStylec.fontWeight("900");
                                            if (nominal !== "") {
                                                document.write(nominalStylec);
                                            }
                                        </script>
                                    </div>
                                    <hr/>

                                    <!-- OF33B -->
                                    <div class="form-row"><span class="label_body">OF33B</span><span class="label">Currency</span>
                                        <input type="text" name="_070_of33b_currency" id="_070_of33b_currency" onkeypress="return textonly(event)" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_072_of33b_amount" id="_072_of33b_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_070_of33b_currency');" onblur="cek_koma(this)" />
                                        <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                if (isNaN(n)) {
                                                    return "";
                                                }
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_072_of33b_amount').value;
                                            var number2r = number2.replace(',', '.');
                                            var number2F = parseFloat(number2r);
                                            var nominal = formatUang(number2F, "");
                                            var nominalStyle = nominal.fontsize(2);
                                            var nominalStylec = nominalStyle.fontcolor("red");
                                            //var nominalStylecw = nominalStylec.fontWeight("900");
                                            if (nominal !== "") {
                                                document.write(nominalStylec);
                                            }
                                        </script>
                                    </div>
                                    <hr/>

                                    <!-- OF36 -->
                                    <div class="form-row"><span class="label_body">OF36</span><span class="label">Exchange Rate</span>
                                        <input type="text" name="_080_of36_rate" id="_080_of36_rate" maxlength="12" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of36_rate'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- MF50 -->
                                    <div class="form-row"><span class="label_body">MF50</span><span class="label"><a style="color:red; text-decoration:none">*</a>Ordering Customer</span>
                                        <select id="type_mf50_ordering_customer" name="type_mf50_ordering_customer" class="mandatory" input_type="MF50 Ordering Customer" location="Body">
                                            <option value="">choose a type</option>
                                            <option value="a">A - BIC</option>
                                            <option value="f">F - Number/Name and Address Details</option>
                                            <option value="k">K - Name and Address</option>
                                        </select>
                                        <div id="div_mf50a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                <input type="text" name="_090_mf50a_account" id="_090_mf50a_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf50a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                                <input type="text" name="_091_mf50a_identifier_code" id="_091_mf50a_identifier_code" input_type="MF50a Identifier Code" location="Body" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_mf50a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_092_mf50a_address" id="_092_mf50a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_mf50a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <!--20200709-->
                                        <div id="div_mf50f_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                <input type="text" name="_093_mf50f_account" id="_093_mf50f_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_mf50f_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                <select id="_094_mf50f_number" name="_094_mf50f_number" class="mandatory">
                                                    <option value=""></option>
                                                    <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_mf50f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                            <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_mf50f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                            <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_mf50f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                            <option value="4" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_mf50f_number'}"><c:if test="${item.detail=='4'}"> selected="true" </c:if></c:if></c:forEach>>4</option>
                                            <option value="5" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_mf50f_number'}"><c:if test="${item.detail=='5'}"> selected="true" </c:if></c:if></c:forEach>>5</option>
                                            <option value="6" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_mf50f_number'}"><c:if test="${item.detail=='6'}"> selected="true" </c:if></c:if></c:forEach>>6</option>
                                            <option value="7" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_mf50f_number'}"><c:if test="${item.detail=='7'}"> selected="true" </c:if></c:if></c:forEach>>7</option>
                                            <option value="8" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_mf50f_number'}"><c:if test="${item.detail=='8'}"> selected="true" </c:if></c:if></c:forEach>>8</option>
                                                    </select>
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                    <input type="text" name="_095_mf50f_details" id="_095_mf50f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_095_mf50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                        <div id="div_mf50f_2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 2</span>
                                                <input type="checkbox" name="name_address_checkbox_2_50" id="name_address_checkbox_2_50" />
                                                <div id="check_mf50f_2">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                        <select id="_096_mf50f_number" name="_096_mf50f_number" class="mandatory">
                                                            <option value=""></option>
                                                            <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_mf50f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                    <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_mf50f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                    <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_mf50f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                    <option value="4" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_mf50f_number'}"><c:if test="${item.detail=='4'}"> selected="true" </c:if></c:if></c:forEach>>4</option>
                                                    <option value="5" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_mf50f_number'}"><c:if test="${item.detail=='5'}"> selected="true" </c:if></c:if></c:forEach>>5</option>
                                                    <option value="6" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_mf50f_number'}"><c:if test="${item.detail=='6'}"> selected="true" </c:if></c:if></c:forEach>>6</option>
                                                    <option value="7" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_mf50f_number'}"><c:if test="${item.detail=='7'}"> selected="true" </c:if></c:if></c:forEach>>7</option>
                                                    <option value="8" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_mf50f_number'}"><c:if test="${item.detail=='8'}"> selected="true" </c:if></c:if></c:forEach>>8</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                            <input type="text" name="_097_mf50f_details" id="_097_mf50f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_097_mf50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="div_mf50f_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 3</span>
                                                <input type="checkbox" name="name_address_checkbox_3_50" id="name_address_checkbox_3_50" />
                                                <div id="check_mf50f_3">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                        <select id="_098_mf50f_number" name="_098_mf50f_number" class="mandatory">
                                                            <option value=""></option>
                                                            <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_098_mf50f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                    <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_098_mf50f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                    <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_098_mf50f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                    <option value="4" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_098_mf50f_number'}"><c:if test="${item.detail=='4'}"> selected="true" </c:if></c:if></c:forEach>>4</option>
                                                    <option value="5" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_098_mf50f_number'}"><c:if test="${item.detail=='5'}"> selected="true" </c:if></c:if></c:forEach>>5</option>
                                                    <option value="6" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_098_mf50f_number'}"><c:if test="${item.detail=='6'}"> selected="true" </c:if></c:if></c:forEach>>6</option>
                                                    <option value="7" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_098_mf50f_number'}"><c:if test="${item.detail=='7'}"> selected="true" </c:if></c:if></c:forEach>>7</option>
                                                    <option value="8" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_098_mf50f_number'}"><c:if test="${item.detail=='8'}"> selected="true" </c:if></c:if></c:forEach>>8</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                            <input type="text" name="_099_mf50f_details" id="_099_mf50f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_099_mf50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="div_mf50f_4">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 4</span>
                                                <input type="checkbox" name="name_address_checkbox_4_50" id="name_address_checkbox_4_50" />
                                                <div id="check_mf50f_4">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                        <select id="_100_mf50f_number" name="_100_mf50f_number" class="mandatory">
                                                            <option value=""></option>
                                                            <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf50f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                    <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf50f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                    <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf50f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                    <option value="4" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf50f_number'}"><c:if test="${item.detail=='4'}"> selected="true" </c:if></c:if></c:forEach>>4</option>
                                                    <option value="5" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf50f_number'}"><c:if test="${item.detail=='5'}"> selected="true" </c:if></c:if></c:forEach>>5</option>
                                                    <option value="6" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf50f_number'}"><c:if test="${item.detail=='6'}"> selected="true" </c:if></c:if></c:forEach>>6</option>
                                                    <option value="7" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf50f_number'}"><c:if test="${item.detail=='7'}"> selected="true" </c:if></c:if></c:forEach>>7</option>
                                                    <option value="8" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf50f_number'}"><c:if test="${item.detail=='8'}"> selected="true" </c:if></c:if></c:forEach>>8</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                            <input type="text" name="_101_mf50f_details" id="_101_mf50f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="div_mf50k_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                <input type="text" name="_105_mf50k_account" id="_105_mf50k_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_105_mf50k_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_106_mf50k_name_address" id="_106_mf50k_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_106_mf50k_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF51A -->
                                    <div class="form-row"><span class="label_body">OF51A</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_107_of51a_party_identifier" id="_107_of51a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_107_of51a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_108_of51a_identifier_code" id="_108_of51a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_108_of51a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_109_of51a_address" id="_109_of51a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_109_of51a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>

                                    <!-- OF52 -->
                                    <div class="form-row"><span class="label_body">OF52 </span><span class="label">Ordering Institution</span>
                                        <select id="type_of52_" name="type_of52_">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Ordering Institution - BIC</option>
                                            <option value="d">D - Ordering Institution - Name and Address</option>
                                        </select>
                                        <div id="div_of52a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_110_of52a_party_identifier" id="_110_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                                <input type="text" name="_111_of52a_identifier_code" id="_111_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_112_of52a_address" id="_112_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_112_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of52d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_113_of52d_party_identifier" id="_113_of52d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_113_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_114_of52d_name_address" id="_114_of52d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_114_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
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
                                                <input type="text" name="_121_of53a_identifier_code" id="_121_of53a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
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
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_126_of53d_name_address" id="_126_of53d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_126_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
                                                <input type="text" name="_131_of54a_identifier_code" id="_131_of54a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_131_of54a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
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
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_136_of54d_name_address" id="_136_of54d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_136_of54d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF55 -->
                                    <div class="form-row"><span class="label_body">OF55</span><span class="label">Third Reimbursement Institution</span>
                                        <select id="type_of55_" name="type_of55_">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Third Reimbursement Inst - BIC</option>
                                            <option value="b">B - Third Reimbursement Inst - Location</option>
                                            <option value="d">D - Third Reimbursement Inst - Name and Address</option>
                                        </select>
                                        <div id="div_of55a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_140_of55a_party_identifier" id="_140_of55a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of55a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                                <input type="text" name="_141_of55a_identifier_code" id="_141_of55a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_of55a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_142_of55a_address" id="_142_of55a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_142_of55a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of55b_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_143_of55b_party_identifier" id="_143_of55b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_143_of55b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                <input onkeypress="avoidSplChars(event)" type="text" name="_144_of55b_location" id="_144_of55b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_144_of55b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                        <div id="div_of55d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_145_of55d_party_identifier" id="_145_of55d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_145_of55d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_146_of55d_name_address" id="_146_of55d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_146_of55d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF56 -->
                                    <div class="form-row"><span class="label_body">OF56</span><span class="label">Intermediary Institution</span>
                                        <select id="type_of56_" name="type_of56_">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Intermediary Inst - BIC</option>
                                            <option value="c">C - Intermediary Inst - Institution</option>
                                            <option value="d">D - Intermediary Inst - Name and Address</option>
                                        </select>
                                        <div id="div_of56a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_160_of56a_party_identifier" id="_160_of56a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                                <input type="text" name="_161_of56a_identifier_code" id="_161_of56a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_162_of56a_address" id="_162_of56a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_of56a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of56c_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Party Identifier</span>
                                                <input type="text" onkeypress="avoidSplChars(event)" name="_163_of56c_party_identifier" id="_163_of56c_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_163_of56c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                        </div>
                                        <div id="div_of56d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_164_of56d_party_identifier" id="_164_of56d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_164_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_165_of56d_name_address" id="_165_of56d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_165_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>



                                    <!-- OF57 -->
                                    <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Institution</span>
                                        <select id="type_of57_" name="type_of57_">
                                            <option value="">choose a type</option>
                                            <!--                                         - Account With Inst-->
                                            <option value="a">A - BIC</option>
                                            <option value="b">B - Location</option>
                                            <option value="c">C - Institution</option>
                                            <option value="d">D - Name and Address</option>
                                        </select>
                                        <div id="div_of57a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_170_of57a_party_identifier" id="_170_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                                <input type="text" name="_171_of57a_identifier_code" id="_171_of57a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea disabled="true"><c:out value="${receiverBank}" /></textarea>
                                    </div>
                                </div>
                                <div id="div_of57b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_173_of57b_party_identifier" id="_173_of57b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                <input type="text" onkeypress="avoidSplChars(event)" name="_174_of57b_location" id="_174_of57b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                        <div id="div_of57c_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Party Identifier</span>
                                                <input type="text" onkeypress="avoidSplChars(event)" name="_175_of57c_party_identifier" id="_175_of57c_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_175_of57c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                        </div>
                                        <div id="div_of57d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_176_of57d_party_identifier" id="_176_of57d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_176_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_177_of57d_name_address" id="_177_of57d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_177_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- M59/59A -->
                                    <div class="form-row"><span class="label_body">MF59</span><span class="label"><a style="color:red; text-decoration:none">*</a>Beneficiary Customer</span>
                                        <select id="type_of59_59a_" name="type_of59_59a_" class="mandatory" input_type="Of59A Beneficiary Customer" location="Body">
                                            <option value="">choose a type</option>
                                            <option value="59">59 - Name and Address</option>
                                            <option value="59a">59A - BIC</option>
                                            <option value="59f">59F - Number/Name and Address Details</option>
                                        </select>
                                        <div id="div_mf59_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                <input type="text" name="_180_mf59_account" id="_180_mf59_account" maxlength="35" size="40" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_mf59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                    <% if (session.getAttribute("flagStatus").equals("INC-WAIT") || session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
                                    <c:if test="${headerById.komentar=='Not Found'}">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">New Account</span>
                                            <input type="text" name="acc_adj" id="acc_adj" maxlength="35" size="35" style="background-color: yellow" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_mf59_account'}"><c:out value="${item.info}" /></c:if></c:forEach>" onblur="cek_slash(this)">
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
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" input_type="_181_mf59_name_address" location="Body" name="_181_mf59_name_address" id="_181_mf59_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>         
                                            </div>
                                    <% if (session.getAttribute("flagStatus").equals("INC-WAIT") || session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
                                    <c:if test="${headerById.komentar=='Not Found'}">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">New Name</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none; background-color: yellow" name="nm_adj" id="nm_adj"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_mf59_name_address'}"><c:out value="${item.info}" /></c:if></c:forEach></textarea>
                                                </div>
                                    </c:if>
                                    <% }%>
                                </div>
                                <div id="div_mf59a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_182_mf59a_account" id="_182_mf59a_account" maxlength="35" size="40" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_182_mf59a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                                <input type="text" name="_183_mf59a_identifier_code" id="_183_mf59a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_183_mf59a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea cols="33" rows="4" maxlength="132" style="resize:none;" name="_184_mf59a_address" id="_184_mf59a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_mf59a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <!--20200416-->
                                        <div id="div_mf59f_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                <input type="text" name="_185_mf59f_account" id="_185_mf59f_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_185_mf59f_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                    <% if (session.getAttribute("flagStatus").equals("INC-WAIT") || session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
                                    <c:if test="${headerById.komentar=='Not Found'}">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">New Account</span>
                                            <input type="text" name="acc_adj_f" id="acc_adj_f" maxlength="35" size="35" style="background-color: yellow" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_185_mf59f_account'}"><c:out value="${item.info}" /></c:if></c:forEach>" onblur="cek_slash(this)">
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
                                        <select id="_186_mf59f_number" name="_186_mf59f_number" class="mandatory">
                                            <option value=""></option>
                                            <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_186_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                            <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_186_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                            <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_186_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                    </select>
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                    <input type="text" name="_187_mf59f_details" id="_187_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_187_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" /> 
                                            </div>
                                    <% if (session.getAttribute("flagStatus").equals("INC-WAIT") || session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
                                    <c:if test="${headerById.komentar=='Not Found'}">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">New Name</span>
                                            <input type="text" name="nm_adj_f" id="nm_adj_f" maxlength="33" style="background-color: yellow" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_187_mf59f_details'}"><c:out value="${item.info}" /></c:if></c:forEach>" /> 
                                                </div>
                                    </c:if>
                                    <% }%>
                                </div>
                                <div id="div_mf59f_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 2</span>
                                        <input type="checkbox" name="name_address_checkbox_2" id="name_address_checkbox_2" />
                                        <div id="check_mf59f_2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                <select id="_188_mf59f_number" name="_188_mf59f_number" class="mandatory">
                                                    <option value=""></option>
                                                    <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_188_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                    <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_188_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                    <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_188_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                            <input type="text" name="_189_mf59f_details" id="_189_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_189_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="div_mf59f_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 3</span>
                                                <input type="checkbox" name="name_address_checkbox_3" id="name_address_checkbox_3" />
                                                <div id="check_mf59f_3">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                        <select id="_190_mf59f_number" name="_190_mf59f_number" class="mandatory">
                                                            <option value=""></option>
                                                            <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                    <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                    <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                            <input type="text" name="_191_mf59f_details" id="_191_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_191_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="div_mf59f_4">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 4</span>
                                                <input type="checkbox" name="name_address_checkbox_4" id="name_address_checkbox_4" />
                                                <div id="check_mf59f_4">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                        <select id="_192_mf59f_number" name="_192_mf59f_number" class="mandatory">
                                                            <option value=""></option>
                                                            <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_192_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                    <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_192_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                    <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_192_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                            <input type="text" name="_193_mf59f_details" id="_193_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_193_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>


                                    <!--<legend>Other Information</legend>-->
                                    <!-- OF70 -->
                                    <div class="form-row"><span class="label_body">OF70</span><span class="label">Remittance Information</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_200_of70_remittance_information" id="_200_of70_remittance_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of70_remittance_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>

                                    <!-- OF71A -->
                                    <div class="form-row"><span class="label_body">MF71A</span><span class="label"><a style="color:red; text-decoration:none">*</a>Details of Charges</span>
                                        <select id="_210_of71a_details_charges" name="_210_of71a_details_charges" class="mandatory" input_type="MF71A Detail Charges" location="Body">
                                            <option value="">choose a code</option>
                                            <option value="OUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of71a_details_charges'}"><c:if test="${item.detail=='OUR'}"> selected="true" </c:if></c:if></c:forEach>>OUR</option> <!-- - Ordering Customer-->
                                    <option value="BEN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of71a_details_charges'}"><c:if test="${item.detail=='BEN'}"> selected="true" </c:if></c:if></c:forEach>>BEN</option>
                                    <option value="SHA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of71a_details_charges'}"><c:if test="${item.detail=='SHA'}"> selected="true" </c:if></c:if></c:forEach>>SHA</option>
                                            </select>
                                <%--<input type="text" name="_200_of71a_details_charges" id="_200_of71a_details_charges" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of71a_details_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />--%>
                            </div>
                            <hr/>

                            <!-- OF71F_1 -->
                            <div id="of71">
                                <div class="form-row"><span class="label_body">OF71F</span><span class="label">Sender's Charges 1</span>
                                    <input type="checkbox" name="sender_chargers_1_checkbox" id="sender_chargers_1_checkbox" />
                                    <div id="check_of71f_1">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_220_of71f_currency" id="_220_of71f_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of71f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                                    <input type="text" name="_221_of71f_amount" id="_221_of71f_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_221_of71f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_220_of71f_currency');" onblur="cek_koma(this)" />
                                                    <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                                    <font style="margin-left: 50px"></font>
                                                    <script langauge="javascript">
                                                        function formatUang(n, currency) {
                                                            if (isNaN(n)) {
                                                                return "";
                                                            }
                                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                        }
                                                        var number2 = document.getElementById('_221_of71f_amount').value;
                                                        var number2r = number2.replace(',', '.');
                                                        var number2F = parseFloat(number2r);
                                                        var nominal = formatUang(number2F, "");
                                                        var nominalStyle = nominal.fontsize(2);
                                                        var nominalStylec = nominalStyle.fontcolor("red");
                                                        //var nominalStylecw = nominalStylec.fontWeight("900");
                                                        if (nominal !== "") {
                                                            document.write(nominalStylec);
                                                        }
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- OF71F_2 -->
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sender's Charges 2</span>
                                            <input type="checkbox" name="sender_chargers_2_checkbox" id="sender_chargers_2_checkbox" />
                                            <div id="check_of71f_2">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                                    <input type="text" name="_222_of71f_currency" id="_222_of71f_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_222_of71f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                                    <input type="text" name="_223_of71f_amount" id="_223_of71f_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_223_of71f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_222_of71f_currency');" onblur="cek_koma(this)" />
                                                    <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                                    <font style="margin-left: 50px"></font>
                                                    <script langauge="javascript">
                                                        function formatUang(n, currency) {
                                                            if (isNaN(n)) {
                                                                return "";
                                                            }
                                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                        }
                                                        var number2 = document.getElementById('_223_of71f_amount').value;
                                                        var number2r = number2.replace(',', '.');
                                                        var number2F = parseFloat(number2r);
                                                        var nominal = formatUang(number2F, "");
                                                        var nominalStyle = nominal.fontsize(2);
                                                        var nominalStylec = nominalStyle.fontcolor("red");
                                                        //var nominalStylecw = nominalStylec.fontWeight("900");
                                                        if (nominal !== "") {
                                                            document.write(nominalStylec);
                                                        }
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- OF71F_3 -->
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sender's Charges 3</span>
                                            <input type="checkbox" name="sender_chargers_3_checkbox" id="sender_chargers_3_checkbox" />
                                            <div id="check_of71f_3">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                                    <input type="text" name="_224_of71f_currency" id="_224_of71f_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_224_of71f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                                    <input type="text" name="_225_of71f_amount" id="_225_of71f_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_225_of71f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_224_of71f_currency');" onblur="cek_koma(this)" />
                                                    <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                                    <font style="margin-left: 50px"></font>
                                                    <script langauge="javascript">
                                                        function formatUang(n, currency) {
                                                            if (isNaN(n)) {
                                                                return "";
                                                            }
                                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                        }
                                                        var number2 = document.getElementById('_225_of71f_amount').value;
                                                        var number2r = number2.replace(',', '.');
                                                        var number2F = parseFloat(number2r);
                                                        var nominal = formatUang(number2F, "");
                                                        var nominalStyle = nominal.fontsize(2);
                                                        var nominalStylec = nominalStyle.fontcolor("red");
                                                        //var nominalStylecw = nominalStylec.fontWeight("900");
                                                        if (nominal !== "") {
                                                            document.write(nominalStylec);
                                                        }
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- OF71F_4 -->
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sender's Charges 4</span>
                                            <input type="checkbox" name="sender_chargers_4_checkbox" id="sender_chargers_4_checkbox" />
                                            <div id="check_of71f_4">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                                    <input type="text" name="_226_of71f_currency" id="_226_of71f_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_226_of71f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                                    <input type="text" name="_227_of71f_amount" id="_227_of71f_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_227_of71f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_226_of71f_currency');" onblur="cek_koma(this)" />
                                                    <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                                    <font style="margin-left: 50px"></font>
                                                    <script langauge="javascript">
                                                        function formatUang(n, currency) {
                                                            if (isNaN(n)) {
                                                                return "";
                                                            }
                                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                        }
                                                        var number2 = document.getElementById('_227_of71f_amount').value;
                                                        var number2r = number2.replace(',', '.');
                                                        var number2F = parseFloat(number2r);
                                                        var nominal = formatUang(number2F, "");
                                                        var nominalStyle = nominal.fontsize(2);
                                                        var nominalStylec = nominalStyle.fontcolor("red");
                                                        //var nominalStylecw = nominalStylec.fontWeight("900");
                                                        if (nominal !== "") {
                                                            document.write(nominalStylec);
                                                        }
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- OF71F_5 -->
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sender's Charges 5</span>
                                            <input type="checkbox" name="sender_chargers_5_checkbox" id="sender_chargers_5_checkbox" />
                                            <div id="check_of71f_5">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                                    <input type="text" name="_228_of71f_currency" id="_228_of71f_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_228_of71f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                                    <input type="text" name="_229_of71f_amount" id="_229_of71f_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_229_of71f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_228_of71f_currency');" onblur="cek_koma(this)" />
                                                    <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                                    <font style="margin-left: 50px"></font>
                                                    <script langauge="javascript">
                                                        function formatUang(n, currency) {
                                                            if (isNaN(n)) {
                                                                return "";
                                                            }
                                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                        }
                                                        var number2 = document.getElementById('_229_of71f_amount').value;
                                                        var number2r = number2.replace(',', '.');
                                                        var number2F = parseFloat(number2r);
                                                        var nominal = formatUang(number2F, "");
                                                        var nominalStyle = nominal.fontsize(2);
                                                        var nominalStylec = nominalStyle.fontcolor("red");
                                                        //var nominalStylecw = nominalStylec.fontWeight("900");
                                                        if (nominal !== "") {
                                                            document.write(nominalStylec);
                                                        }
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                        <hr/>
                                    </div>

                                    <!-- OF71G -->
                                    <div class="form-row"><span class="label_body">OF71G</span><span class="label">Currency</span>
                                        <input type="text" name="_230_of71g_currency" id="_230_of71g_currency" onkeypress="return textonly(event)" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of71g_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_231_of71g_amount" id="_231_of71g_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_231_of71g_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_koma(this)" />
                                        <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                if (isNaN(n)) {
                                                    return "";
                                                }
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_231_of71g_amount').value;
                                            var number2r = number2.replace(',', '.');
                                            var number2F = parseFloat(number2r);
                                            var nominal = formatUang(number2F, "");
                                            var nominalStyle = nominal.fontsize(2);
                                            var nominalStylec = nominalStyle.fontcolor("red");
                                            //var nominalStylecw = nominalStylec.fontWeight("900");
                                            if (nominal !== "") {
                                                document.write(nominalStylec);
                                            }
                                        </script>
                                    </div>
                                    <hr/>

                                    <!-- OF72 -->
                                    <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_240_of72_sender_receiver_information" id="_240_of72_sender_receiver_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of72_sender_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>

                                    <!-- OF77B -->
                                    <div class="form-row"><span class="label_body">OF77B</span><span class="label">Regulatory Reporting</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="3" maxlength="105" style="resize:none;" name="_241_of77b_regulatory_reporting" id="_241_of77b_regulatory_reporting" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_241_of77b_regulatory_reporting'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>

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