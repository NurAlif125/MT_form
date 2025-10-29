<%-- 
    Document   : mt756
    Created on : Sep 24, 2025, 9:00:08?AM
    Author     : mslam
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt756.jsp" %>
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
        <c:if test="${item == 'MT:756'}">
            <div id="judul">MT 756 Advice of Reimbursement or Payment</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="756" />
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
                                <div class="form-row"><span class="label_body">MF21</span><span class="label">*Presenting Bank's Reference</span>
                                    <input type="text" name="_020_mf21_presenting_bank_reference" id="_020_mf21_presenting_bank_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_presenting_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF32B -->
                                <div class="form-row"><span class="label_body">MF32B</span><span class="label">*Total Amount Claimed Currency</span>
                                    <input type="text" name="_030_mf32b_total_amount_claimed_currency" id="_030_mf32b_total_amount_claimed_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32b_total_amount_claimed_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
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
                                
                                <!-- MF33A -->
                                <div class="form-row"><span class="label_body">MF33A</span><span class="label">*Amount Reimbursed or Paid Date</span>
                                    <input type="text" name="_040_mf33a_amount_reimbursed_date" id="_040_mf33a_amount_reimbursed_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf33a_amount_reimbursed_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                    <input type="text" name="_041_mf33a_currency" id="_041_mf33a_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_mf33a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                    <input type="text" name="_042_mf33a_amount" id="_042_mf33a_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf33a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    <font style="margin-left: 50px"></font>
                                    <script langauge="javascript">
                                        function formatUang(n, currency) {
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_042_mf33a_amount').value;
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
                                
                                <!-- OF53 -->
                                <div class="form-row"><span class="label_body">OF53</span><span class="label">Sender's Correspondent</span>
                                    <select id="type_of53_sender_correspondent" name="type_of53_sender_correspondent">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Party Identifier - Identifier Code</option>
                                        <option value="b">B - Party Identifier - Location</option> 
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of53a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_050_of53a_party_identifier" id="_050_of53a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_051_of53a_identifier_code" id="_051_of53a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of53b_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_052_of53b_party_identifier" id="_052_of53b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of53b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                            <input type="text" name="_053_of53b_location" id="_053_of53b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of53b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of53d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_054_of53d_party_identifier" id="_054_of53d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_055_of53d_name_address" id="_055_of53d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_055_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF54 -->
                                <div class="form-row"><span class="label_body">OF54</span><span class="label">Receiver's Correspondent</span>
                                    <select id="type_of54_receiver_correspondent" name="type_of54_receiver_correspondent">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Party Identifier - Identifier Code</option> 
                                        <option value="b">B - Party Identifier - Location</option> 
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of54a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_060_of54a_party_identifier" id="_060_of54a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_061_of54a_identifier_code" id="_061_of54a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of54a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of54b_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_062_of54b_party_identifier" id="_062_of54b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of54b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                            <input type="text" name="_063_of54b_location" id="_063_of54b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of54b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of54d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_064_of54d_party_identifier" id="_064_of54d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of54d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_065_of54d_name_address" id="_065_of54d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of54d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF72Z -->
                                <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_070_of72z_sender_to_receiver" id="_070_of72z_sender_to_receiver"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of72z_sender_to_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF79Z -->
                                <div class="form-row"><span class="label_body">OF79Z</span><span class="label">Narrative</span>
                                    <textarea cols="50" rows="35" maxlength="1750" wrap="hard" style="resize:none;" name="_080_of79z_narrative" id="_080_of79z_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of79z_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>--%>
                                
                            <!-- MF20 Sender's Reference -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Sender's Reference</span>
                                <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" class="mandatory" maxlength="16" size="16" onkeypress="avoidSplChars(event)" input_type="MF20 Sender's Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF21 Presenting Bank's Reference -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Presenting Bank's Reference</span>
                                <input type="text" name="_020_mf21_presenting_banks_reference" id="_020_mf21_presenting_banks_reference" class="mandatory" maxlength="16" size="16" onkeypress="avoidSplChars(event)" input_type="MF21 Presenting Bank's Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_presenting_banks_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF32B Total Amount Claimed -->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Total Amount Claimed</span>
                                <input type="text" name="_030_mf32b_total_amount_claimed_currency" id="_030_mf32b_total_amount_claimed_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32b_total_amount_claimed_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
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

                            <!-- MF33A Amount Reimbursed or Paid -->
                            <div class="form-row"><span class="label_body">MF33A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount Reimbursed or Paid</span>
                                <input type="text" name="_040_mf33a_amount_reimbursed_date" id="_040_mf33a_amount_reimbursed_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf33a_amount_reimbursed_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                <input type="text" name="_041_mf33a_currency" id="_041_mf33a_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_mf33a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                <input type="text" name="_042_mf33a_amount" id="_042_mf33a_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf33a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_042_mf33a_amount').value;
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

                            <!-- OF53a Sender's Correspondent -->
                            <div class="form-row"><span class="label_body">OF53a</span><span class="label">Sender's Correspondent</span>
                                <select id="type_of53_sender_correspondent" name="type_of53_sender_correspondent">
                                    <option value="">choose a type</option> 
                                    <option value="a">A - Party Identifier - Identifier Code</option>
                                    <option value="b">B - Party Identifier - Location</option> 
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of53a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_050_of53a_party_identifier" id="_050_of53a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_051_of53a_identifier_code" id="_051_of53a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of53b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_052_of53b_party_identifier" id="_052_of53b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of53b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_053_of53b_location" id="_053_of53b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of53b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of53d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_054_of53d_party_identifier" id="_054_of53d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_055_of53d_name_address" id="_055_of53d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_055_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF54a Receiver's Correspondent -->
                            <div class="form-row"><span class="label_body">OF54a</span><span class="label">Receiver's Correspondent</span>
                                <select id="type_of54_receiver_correspondent" name="type_of54_receiver_correspondent">
                                    <option value="">choose a type</option> 
                                    <option value="a">A - Party Identifier - Identifier Code</option> 
                                    <option value="b">B - Party Identifier - Location</option> 
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of54a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_060_of54a_party_identifier" id="_060_of54a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_061_of54a_identifier_code" id="_061_of54a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of54a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of54b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_062_of54b_party_identifier" id="_062_of54b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of54b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_063_of54b_location" id="_063_of54b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of54b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of54d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_064_of54d_party_identifier" id="_064_of54d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of54d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_065_of54d_name_address" id="_065_of54d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of54d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/> 

                            <!-- OF72Z Sender to Receiver Information -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea name="_070_of72z_sender_to_receiver_information" id="_070_of72z_sender_to_receiver_information" cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF79Z Narrative -->
                            <div class="form-row"><span class="label_body">OF79Z</span><span class="label">Narrative</span>
                                <textarea name="_080_of79z_narrative" id="_080_of79z_narrative" cols="50" rows="35" maxlength="1750" wrap="hard" style="resize:none;"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of79z_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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