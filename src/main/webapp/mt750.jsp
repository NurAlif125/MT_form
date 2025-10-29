<%-- 
    Document   : mt750
    Created on : Sep 23, 2025, 10:13:50?AM
    Author     : mslam
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt750.jsp" %>
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
        <c:if test="${item == 'MT:750'}">
            <div id="judul">MT 750 Advice of Discrepancy</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="750" />
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
                                <%--<div class="form-row"><span class="label_body">MF20</span><span class="label">*Sender's Reference</span>
                                    <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF21 -->
                                <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                                    <input type="text" name="_020_mf21_related_reference" id="_020_mf21_related_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF32B -->
                                <div class="form-row"><span class="label_body">MF32B</span><span class="label">*Currency Principal Amount</span>
                                    <input type="text" name="_030_mf32b_currency_principal_amount" id="_030_mf32b_currency_principal_amount" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32b_currency_principal_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                    <input type="text" name="_031_mf32b_amount" id="_031_mf32b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    <font style="margin-left: 50px"></font>
                                    <script langauge="javascript">
                                        function formatUang(n, currency) {
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_031_mf32b_amount').value;
                                        var number2r = number2.replace(',', '.');
                                        var number2F = parseFloat(number2r);
                                        var nominal = formatUang(number2F, "");
                                        var nominalStyle = nominal.fontsize(3);
                                        var nominalStylec = nominalStyle.fontcolor("red");
                                        //var nominalStylecw = nominalStylec.fontWeight("900");
                                        document.write(nominalStylec);
                                    </script>
                                </div>
                                <hr/>
                                
                                <!-- OF33B -->
                                <div class="form-row"><span class="label_body">OF33B</span><span class="label">Additional Amounts</span>
                                    <input type="checkbox" name="additional_amount_checkbox" id="additional_amount_checkbox" />
                                    <div id="check_of33b">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_040_of33b_currency_additional_amount" id="_040_of33b_currency_additional_amount" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of33b_currency_additional_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_041_of33b_amount" id="_041_of33b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <font style="margin-left: 50px"></font>
                                            <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                }
                                                var number2 = document.getElementById('_041_of33b_amount').value;
                                                var number2r = number2.replace(',', '.');
                                                var number2F = parseFloat(number2r);
                                                var nominal = formatUang(number2F, "");
                                                var nominalStyle = nominal.fontsize(3);
                                                var nominalStylec = nominalStyle.fontcolor("red");
                                                //var nominalStylecw = nominalStylec.fontWeight("900");
                                                document.write(nominalStylec);
                                            </script>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF71D -->
                                <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges to be Deducted</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_050_of71d_charges_deducated" id="_050_of71d_charges_deducated"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of71d_charges_deducated'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF73A -->
                                <div class="form-row"><span class="label_body">OF73A</span><span class="label">Charges to be Added</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_060_of73a_charges_added" id="_060_of73a_charges_added"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of73a_charges_added'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF34B -->
                                <div class="form-row"><span class="label_body">OF34B</span><span class="label">Total Amount to be Paid</span>
                                    <input type="checkbox" name="total_amount_paid_checkbox" id="total_amount_paid_checkbox" />
                                    <div id="check_of34b">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_070_of34b_currency_total_amount_paid" id="_070_of34b_currency_total_amount_paid" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of34b_currency_total_amount_paid'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_071_of34b_amount" id="_071_of34b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of34b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <font style="margin-left: 50px"></font>
                                            <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                }
                                                var number2 = document.getElementById('_071_of34b_amount').value;
                                                var number2r = number2.replace(',', '.');
                                                var number2F = parseFloat(number2r);
                                                var nominal = formatUang(number2F, "");
                                                var nominalStyle = nominal.fontsize(3);
                                                var nominalStylec = nominalStyle.fontcolor("red");
                                                //var nominalStylecw = nominalStylec.fontWeight("900");
                                                document.write(nominalStylec);
                                            </script>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF57 -->
                                <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Bank</span>
                                    <select id="type_of57_account_with_bank" name="type_of57_account_with_bank">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="b">B - Party Identifier - Location</option> 
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of57a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_080_of57a_party_identifier" id="_080_of57a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_081_of57a_identifier_code" id="_081_of57a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of57b_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_082_of57b_party_identifier" id="_082_of57b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                            <input type="text" name="_083_of57b_location" id="_083_of57b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of57d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_084_of57d_party_identifier" id="_084_of57d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_085_of57d_name_address" id="_085_of57d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_085_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF72Z -->
                                <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_090_of72z_sender_to_receiver" id="_090_of72z_sender_to_receiver"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of72z_sender_to_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- MF77J -->
                                <div class="form-row"><span class="label_body">MF77J</span><span class="label">*Discrepancies</span>
                                    <textarea cols="50" rows="70" maxlength="3500" wrap="hard" style="resize:none;" name="_100_mf77j_discrepancies" id="_100_mf77j_discrepancies"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf77j_discrepancies'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                        </div>--%>
                        <!-- MF20 Sender's Reference -->
                        <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Sender's Reference</span>
                            <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)" input_type="MF20 Sender's Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF21 Related Reference -->
                        <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Related Reference</span>
                            <input type="text" name="_020_mf21_related_reference" id="_020_mf21_related_reference" class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)" input_type="MF21 Related Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF32B Principal Amount -->
                        <div class="form-row"><span class="label_body">MF32B</span><span class="label">Principal Amount</span></div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                            <input type="text" name="_030_mf32b_currency" id="_030_mf32b_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Principal Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                            <input type="text" name="_031_mf32b_amount" id="_031_mf32b_amount" class="mandatory" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Principal Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_030_mf32b_currency');" />
                            <font style="margin-left: 50px"></font>
                            <script>
                                function formatUang(n, currency) {
                                    if (isNaN(n)) { return ""; }
                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                }
                                var number2 = document.getElementById('_031_mf32b_amount').value;
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

                        <!-- OF33B Additional Amount -->
                        <div class="form-row"><span class="label_body">OF33B</span><span class="label">Additional Amount</span></div>
                            <input type="checkbox" name="additional_amount_checkbox" id="additional_amount_checkbox" />
                                <div id="check_of33b">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_040_of33b_currency" id="_040_of33b_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_041_of33b_amount" id="_041_of33b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    <font style="margin-left: 50px"></font>
                                    <script langauge="javascript">
                                        function formatUang(n, currency) {
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_041_of33b_amount').value;
                                        var number2r = number2.replace(',', '.');
                                        var number2F = parseFloat(number2r);
                                        var nominal = formatUang(number2F, "");
                                        var nominalStyle = nominal.fontsize(3);
                                        var nominalStylec = nominalStyle.fontcolor("red");
                                        //var nominalStylecw = nominalStylec.fontWeight("900");
                                        document.write(nominalStylec);
                                    </script>
                                </div>
                                </div>
                            <hr/>

                        <!-- OF71D Charges to be Deducted -->
                        <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges to be Deducted</span>
                            <textarea name="_050_of71d_charges_to_be_deducted" id="_050_of71d_charges_to_be_deducted" cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" placeholder="/COMM/USD123,45 Commission or narrative text"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of71d_charges_to_be_deducted'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF73A Charges to be Added -->
                        <div class="form-row"><span class="label_body">OF73A</span><span class="label">Charges to be Added</span>
                            <textarea name="_060_of73a_charges_to_be_added" id="_060_of73a_charges_to_be_added" cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" placeholder="/AGENT/EUR100,00 Agent Commission or narrative text"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of73a_charges_to_be_added'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF34B Total Amount to be Paid -->
                        <div class="form-row"><span class="label_body">OF34B</span><span class="label">Total Amount to be Paid</span>
                            <input type="checkbox" name="total_amount_paid_checkbox" id="total_amount_paid_checkbox" />
                            <div id="check_of34b">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" id="_070_of34b_currency" name="_070_of34b_currency" maxlength="3" size="3" style="text-transform:uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of34b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" id="_071_of34b_amount" name="_071_of34b_amount" maxlength="15" size="15" onblur="cek_koma(this);" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of34b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_070_of34b_currency');" />
                                <font style="margin-left: 50px"></font>
                                <script>
                                    function formatUang(n, currency) {
                                        if (isNaN(n)) { return ""; }
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_071_of34b_amount').value;
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
                            <select id="type_of57_account_with_bank" name="type_of57_account_with_bank">
                                <option value="">choose a type</option> 
                                <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                <option value="b">B - Party Identifier - Location</option> 
                                <option value="d">D - Party Identifier - Name and Address</option>
                            </select>
                            <div id="div_of57a_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_080_of57a_party_identifier" id="_080_of57a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                    <input type="text" name="_081_of57a_identifier_code" id="_081_of57a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div id="div_of57b_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_082_of57b_party_identifier" id="_082_of57b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                    <input type="text" name="_083_of57b_location" id="_083_of57b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div id="div_of57d_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_084_of57d_party_identifier" id="_084_of57d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_085_of57d_name_address" id="_085_of57d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_085_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>
                        </div>
                        <hr/>

                        <!-- OF72Z Sender to Receiver Information -->
                        <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                            <textarea name="_090_of72z_sender_to_receiver_information" id="_090_of72z_sender_to_receiver_information" cols="35" rows="6" maxlength="210" wrap="hard" placeholder="/INS/Details of insurance OR narrative text"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- MF77J Discrepancies -->
                        <div class="form-row"><span class="label_body">MF77J</span><span class="label"><a style="color:red;text-decoration:none">*</a>Discrepancies</span>
                            <textarea name="_100_mf77j_discrepancies" id="_100_mf77j_discrepancies" cols="50" rows="70" maxlength="3500" wrap="hard" style="resize:none;" placeholder="/DOCM Invoice missing OR narrative text" class="mandatory" input_type="MF77J Discrepancies" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf77j_discrepancies'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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