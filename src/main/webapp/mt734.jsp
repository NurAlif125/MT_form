<%-- 
    Document   : mt103
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt734.jsp" %>
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
        <c:if test="${item == 'MT:734'}">
            <div id="judul">MT 734 Advice of Refusal</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="734" />
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
                            <%--<div class="form-row"><span class="label_body">MF20</span><span class="label">*Sender's TRN</span>
                                <input type="text" name="_010_mf20_Senders_TRN" id="_010_mf20_Senders_TRN" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_Senders_TRN'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Presenting Bank's Reference</span>
                                <input type="text" name="_020_mf21_Presenting_Banks_Reference" id="_020_mf21_Presenting_Banks_Reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_Presenting_Banks_Reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF32A -->
                            <div class="form-row"><span class="label_body">MF32A</span><span class="label">*Date and Amount of Utilisation </span>
                                <input type="text" name="_030_mf32a_date" id="_030_mf32a_date" maxlength="6" minlength="6" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                <input type="text" name="_031_mf32a_currency" id="_031_mf32a_currency" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>                             
                                <input type="text" name="_032_mf32a_amount" id="_032_mf32a_amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_032_mf32a_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(5);
                                    ar nominalStylec = nominalStyle.fontcolor("red");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    document.write(nominalStylec);
                                </script>
                            </div>
                            <hr/>

                            <!-- OF73A -->
                            <div class="form-row"><span class="label_body">OF73A</span><span class="label">Charges Claimed</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_040_of73a_Charges_Claimed" id="_040_of73a_Charges_Claimed" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of73a_Charges_Claimed'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF33A -->
                            <div class="form-row"><span class="label_body">OF33A</span><span class="label">Total Amount Claimed</span>
                                <select id="type_of33a_Total_Amount_Claimed" name="type_of33a_Total_Amount_Claimed">
                                    <option value="">choose a type</option>
                                    <option value="A">F33A - Date - Currency - Amount </option>
                                    <option value="B">F33B - Currency - Amount </option>
                                </select>
                                <div id="div_of33a_a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                        <input type="text" name="_050_of33a_Date" id="_050_of33a_Date" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of33a_Date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                        <input type="text" name="_051_of33a_Currency" id="_051_of33a_Currency" maxlength="3" minlength="3" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of33a_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_052_of33a_Amount" id="_052_of33a_Amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of33a_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of33a_b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                        <input type="text" name="_053_of33b_Currency" id="_053_of33b_Currency" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of33b_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_054_of33b_Amount" id="_054_of33b_Amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of33b_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF57A -->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Bank</span>
                                <select id="type_of57a_Account_With_Bank" name="type_of57a_Account_With_Bank">
                                    <option value="">choose a type</option>
                                    <option value="A">OF57A - Party Identifier - Identifier Code</option>
                                    <option value="B">OF57B - Party Identifier - Location</option>
                                    <option value="D">OF57D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of57a_a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_060_of57a_Party_Identifier" id="_060_of57a_Party_Identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of57a_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_061_of57a_Identifier_Code" id="_061_of57a_Identifier_Code" maxlength="11" minlength="8" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of57a_Identifier_Code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57a_b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_062_of57b_Party_Identifier" id="_062_of57b_Party_Identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of57b_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_063_of57b_Location" id="_063_of57b_Location" maxlength="35" minlength="1" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of57b_Location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57a_d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_064_of57d_Party_Identifier" id="_064_of57d_Party_Identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of57d_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_065_of57d_Name_and_Address" id="_065_of57d_Name_and_Address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of57d_Name_and_Address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF72Z -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_070_of72z_Sender_to_Receiver_Information" id="_070_of72z_Sender_to_Receiver_Information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of72z_Sender_to_Receiver_Information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- MF77J -->
                            <div class="form-row"><span class="label_body">MF77J</span><span class="label">Discrepancies</span>
                                <textarea cols="50" rows="70" maxlength="3500" wrap="hard" style="resize:none;" name="_080_mf77j_Discrepancies" id="_080_mf77j_Discrepancies" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf77j_Discrepancies'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- MF77B -->
                            <div class="form-row"><span class="label_body">MF77B</span><span class="label">Disposal of Documents</span>
                                <textarea cols="35" rows="3" maxlength="105" wrap="hard" style="resize:none;" name="_090_mf77b_Disposal_of_Documents" id="_090_mf77b_Disposal_of_Documents" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf77b_Disposal_of_Documents'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>--%>
                            
                        <!-- MF20 Sender's TRN -->
                        <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Sender's TRN</span>
                            <input type="text" name="_010_mf20_sender_trn" id="_010_mf20_sender_trn" class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)" input_type="MF20 Sender's TRN" location="Body" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_010_mf20_sender_trn"}'><c:out value='${item.detail}'/></c:if></c:forEach>"/>
                        </div>
                        <hr/>

                        <!-- MF21 Presenting Bank's Reference -->
                        <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Presenting Bank's Reference</span>
                            <input type="text" name="_020_mf21_presenting_bank_reference" id="_020_mf21_presenting_bank_reference" class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)" input_type="MF21 Presenting Bank's Reference" location="Body" value="<c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_020_mf21_presenting_bank_reference"}'><c:out value='${item.detail}'/></c:if></c:forEach>"/>
                        </div>
                        <hr/>

                        <!-- MF32A Date and Amount of Utilisation ori-->
                        <div class="form-row"><span class="label_body">MF32A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date and Amount of Utilisation</span>
                            <input type="text" name="_030_mf32a_date" id="_030_mf32a_date" class="mandatory" placeholder="YYMMDD" maxlength="6" minlength="6" size="16" input_type="MF32 Date and Amount of Utilisation" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency Code</span>
                            <input type="text" name="_031_mf32a_currency" id="_031_mf32a_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32A Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>                             
                            <input type="text" name="_032_mf32a_amount" id="_032_mf32a_amount" class="mandatory" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32A Date and Amount of Utilisation" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_031_mf32a_currency');" />
                            <font style="margin-left: 50px"></font>
                            <script>
                                function formatUang(n, currency) {
                                    if (isNaN(n)) {
                                        return "";
                                    }
                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                }
                                var number2 = document.getElementById('_032_mf32a_amount').value;
                                if (number2) {
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    if (nominal !== "") {
                                        document.write(nominal.fontsize(2).fontcolor("blue"));
                                    }
                                }
                            </script>
                        </div>
                        <hr/>
                        
                        <!-- OF73A -->
                        <div class="form-row"><span class="label_body">OF73A</span><span class="label">Charges Claimed</span>
                            <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_040_of73a_charges_claimed" id="_040_of73a_charges_claimed" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of73a_charges_claimed'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>
                            
                        <!-- OF33a Total Amount Claimed ori-->
                        <div class="form-row"><span class="label_body">OF33A</span><span class="label">Total Amount Claimed</span>
                            <select id="type_of33a_Total_Amount_Claimed" name="type_of33a_Total_Amount_Claimed">
                                <option value="">choose a type</option>
                                <option value="A">F33A - Date - Currency - Amount </option>
                                <option value="B">F33B - Currency - Amount </option>
                            </select>
                            <div id="div_of33a_a_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                    <input type="text" name="_050_of33a_date" id="_050_of33a_date" placeholder="YYMMDD" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of33a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_051_of33a_currency" id="_051_of33a_currency" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of33a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_052_of33a_amount" id="_052_of33a_amount" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of33a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_051_of33a_currency');" />
                                    <font style="margin-left: 50px"></font>
                                    <script>
                                        function formatUang(n, currency) {
                                            if (isNaN(n)) {
                                                return "";
                                            }
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_054_of33b_amount').value;
                                        if (number2) {
                                            var number2r = number2.replace(',', '.');
                                            var number2F = parseFloat(number2r);
                                            var nominal = formatUang(number2F, "");
                                            if (nominal !== "") {
                                                document.write(nominal.fontsize(2).fontcolor("blue"));
                                            }
                                        }
                                    </script>
                                </div>
                            </div>
                            <div id="div_of33a_b_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_053_of33b_currency" id="_053_of33b_currency" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_054_of33b_amount" id="_054_of33b_amount" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_053_of33b_currency');" />
                                    <font style="margin-left: 50px"></font>
                                    <script>
                                        function formatUang(n, currency) {
                                            if (isNaN(n)) {
                                                return "";
                                            }
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_054_of33b_amount').value;
                                        if (number2) {
                                            var number2r = number2.replace(',', '.');
                                            var number2F = parseFloat(number2r);
                                            var nominal = formatUang(number2F, "");
                                            if (nominal !== "") {
                                                document.write(nominal.fontsize(2).fontcolor("blue"));
                                            }
                                        }
                                    </script>
                                </div>
                            </div>
                        </div>
                        <hr/>

                        <!-- OF57a Account With Bank -->
                        <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Bank</span>
                            <select id="type_of57a_Account_With_Bank" name="type_of57a_Account_With_Bank">
                                <option value="">choose a type</option>
                                <option value="A">OF57A - Party Identifier - Identifier Code</option>
                                <option value="B">OF57B - Party Identifier - Location</option>
                                <option value="D">OF57D - Party Identifier - Name and Address</option>
                            </select>
                            <div id="div_of57a_a_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_060_of57a_Party_Identifier" id="_060_of57a_Party_Identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of57a_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                    <input type="text" name="_061_of57a_Identifier_Code" id="_061_of57a_Identifier_Code" maxlength="11" minlength="8" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of57a_Identifier_Code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div id="div_of57a_b_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_062_of57b_Party_Identifier" id="_062_of57b_Party_Identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of57b_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                    <input type="text" name="_063_of57b_Location" id="_063_of57b_Location" maxlength="35" minlength="1" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of57b_Location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div id="div_of57a_d_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_064_of57d_Party_Identifier" id="_064_of57d_Party_Identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of57d_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_065_of57d_Name_and_Address" id="_065_of57d_Name_and_Address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of57d_Name_and_Address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>
                        </div>
                        <hr/>

                        <!-- OF72Z Sender to Receiver Information -->
                        <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                            <textarea name="_070_of72z_sender_to_receiver_information" id="_070_of72z_sender_to_receiver_information" rows="6" maxlength="210"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_070_of72z_sender_to_receiver_information"}'><c:out value='${item.detail}' /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- MF77J Discrepancies -->
                        <div class="form-row"><span class="label_body">MF77J</span><span class="label"><a style="color:red;text-decoration:none">*</a>Discrepancies</span>
                            <textarea name="_080_mf77j_discrepancies" id="_080_mf77j_discrepancies" rows="6" maxlength="3500" class="mandatory" input_type="MF77J Discrepancies" location="Body"><c:forEach var='item' items='${tags}'><c:if test='${item.tagName eq "_080_mf77j_discrepancies"}'><c:out value='${item.detail}'/></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- MF77B Disposal of Documents -->
                        <div class="form-row"><span class="label_body">MF77B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Disposal of Documents</span>
                            <textarea cols="35" rows="3" maxlength="105" wrap="hard" class="mandatory" style="resize:none;" name="_090_mf77b_disposal_of_documents" id="_090_mf77b_disposal_of_documents" input_type="MF77B Disposal of Documents" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf77b_disposal_of_documents'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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