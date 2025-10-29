<%-- 
    Document   : mt103
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt742.jsp" %>
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
        <c:if test="${item == 'MT:742'}">
            <div id="judul">MT 742 Reimbursement Claim</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="742" />
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
                            <%--<div class="form-row"><span class="label_body">MF20</span><span class="label">*Claiming Bank's Reference</span>
                                <input type="text" name="_010_mf20_Claiming_Banks_Reference" id="_010_mf20_Claiming_Banks_Reference" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_Claiming_Banks_Reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Documentary Credit Number</span>
                                <input type="text" name="_020_mf21_Documentary_Credit_Number" id="_020_mf21_Documentary_Credit_Number" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_Documentary_Credit_Number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- OF31C -->
                            <div class="form-row"><span class="label_body">OF31C</span><span class="label">Date of Issue</span>
                                <input type="text" name="_030_of31c_Date_of_Issue" id="_030_of31c_Date_of_Issue" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of31c_Date_of_Issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF52A -->
                            <div class="form-row"><span class="label_body">MF52 </span><span class="label">*Issuing Bank</span>
                                <select id="type_mf52_Issuing_Bank" name="type_mf52_Issuing_Bank">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Identifier Code</option>
                                    <option value="d">D - Name and Address</option>
                                </select>
                                <div id="div_mf52a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_040_mf52a_Party_Identifier" id="_040_mf52a_Party_Identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf52a_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_041_mf52a_Identifier_Code" id="_041_mf52a_Identifier_Code" maxlength="11" minlength="8" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_mf52a_Identifier_Code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_mf52d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_042_mf52d_Party_Identifier" id="_042_mf52d_Party_Identifier" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf52d_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_043_mf52d_Name_and_Address" id="_043_mf52d_Name_and_Address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_mf52d_Name_and_Address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- MF32B -->
                            <div class="form-row"><span class="label_body">MF32</span><span class="label">*Principal Amount Claimed</span>
                                <select id="type_mf32_Principal_Amount_Claimed" name="type_mf32_Principal_Amount_Claimed">
                                    <option value="">choose a type</option>
                                    <option value="b">B - Amount</option>
                                </select>
                                <div id="div_mf32b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                        <input type="text" name="_050_mf32b_Currency" id="_050_mf32b_Currency" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf32b_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_051_mf32b_Amount" id="_051_mf32b_Amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_mf32b_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_051_mf32b_Amount').value;
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

                            <!-- OF33B -->
                            <div class="form-row"><span class="label_body">OF33B</span><span class="label">Additional Amount Claimed as Allowed for in Excess of Principal Amount</span>
                                <input type="checkbox" name="Additional_Amount_Claimed_Checkbox" id="Additional_Amount_Claimed_Checkbox" />
                                <div id="check_of33b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency Code</span>
                                        <input type="text" name="_060_of33b_Currency" id="_060_of33b_Currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of33b_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_061_of33b_Amount" id="_061_of33b_Amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of33b_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_061_of33b_Amount').value;
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
                            <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_070_of71d_Charges" id="_070_of71d_Charges" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of71d_Charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- MF34A -->
                            <div class="form-row"><span class="label_body">MF34</span><span class="label">*Total Amount Claimed</span>
                                <select id="type_mf34a_Total_Amount_Claimed" name="type_mf34a_Total_Amount_Claimed">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Date - Currency - Amount</option>
                                    <option value="b">B - Currency - Amount</option>
                                </select>
                                <div id="div_mf34a_a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                        <input type="text" name="_080_mf34a_Date" id="_080_mf34a_Date" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf34a_Date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                        <input type="text" name="_081_mf34a_Currency" id="_081_mf34a_Currency" maxlength="3" minlength="3" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_mf34a_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_082_mf34a_Amount" id="_082_mf34a_Amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_mf34a_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_082_mf34a_Amount').value;
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
                                <div id="div_mf34a_b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                        <input type="text" name="_083_mf34b_Currency" id="_083_mf34b_Currency" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf34b_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_084_mf34b_Amount" id="_084_mf34b_Amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_mf34b_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_084_mf34b_Amount').value;
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

                            <!-- OF57A -->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">*Account With Bank</span>
                                <select id="type_of57_Account_With_Bank" name="type_of57_Account_With_Bank">
                                    <option value="">choose a type</option>
                                    <option value="a">OF57A - Party Identifier - Identifier Code</option>
                                    <option value="b">OF57B - Party Identifier - Location</option>
                                    <option value="d">OF57D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of57a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_090_of57a_party_identifier" id="_090_of57a_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_091_of57a_identifier_code" id="_091_of57a_identifier_code" maxlength="11" minlength="8" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_092_of57b_party_identifier" id="_092_of57b_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_093_of57b_location" id="_093_of57b_location" maxlength="35" minlength="1" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_094_of57d_party_identifier" id="_094_of57d_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_095_of57d_name_and_address" id="_095_of57d_name_and_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_095_of57d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF58A -->
                            <div class="form-row"><span class="label_body">OF58</span><span class="label">*Issuing Bank</span>
                                <select id="type_of58_Issuing_Bank" name="type_of58_Issuing_Bank">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Identifier Code</option>
                                    <option value="d">D - Name and Address</option>
                                </select>
                                <div id="div_of58a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_100_of58a_party_identifier" id="_100_of58a_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_101_of58a_identifier_code" id="_101_of58a_identifier_code" maxlength="11" minlength="8" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of58d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_102_of58d_party_identifier" id="_102_of58d_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name_and_Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_103_of58d_name_and_address" id="_103_of58d_name_and_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_of58d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF72Z -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_110_of72z_Sender_to_Receiver_Information" id="_110_of72z_Sender_to_Receiver_Information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of72z_Sender_to_Receiver_Information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>--%>
                            
                            <!-- MF20 Claiming Bank's Reference -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Claiming Bank's Reference</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_010_mf20_claiming_bank_reference" id="_010_mf20_claiming_bank_reference" class="mandatory" maxlength="16" input_type="MF20 Claiming Bank's Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_claiming_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF21 Documentary Credit Number -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Documentary Credit Number</span>
                                <input type="text" name="_020_mf21_documentary_credit_number" id="_020_mf21_documentary_credit_number" class="mandatory" maxlength="16" input_type="MF21 Documentary Credit Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/> 

                            <!-- OF31C Date of Issue -->
                            <div class="form-row"><span class="label_body">OF31C</span><span class="label">Date of Issue</span>
                                <input type="text" name="_030_of31c_date_of_issue" id="_030_of31c_date_of_issue" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of31c_date_of_issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF52a Issuing Bank ori-->
                            <div class="form-row"><span class="label_body">MF52a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Issuing Bank</span>
                                <select id="type_mf52_Issuing_Bank" name="type_mf52_Issuing_Bank" input_type="MF52A Issuing Bank" location="Body" class="mandatory">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Identifier Code</option>
                                    <option value="d">D - Name and Address</option>
                                </select>
                                <div id="div_mf52a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_040_mf52a_Party_Identifier" id="_040_mf52a_Party_Identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf52a_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_041_mf52a_Identifier_Code" id="_041_mf52a_Identifier_Code" class="mandatory" maxlength="11" minlength="8" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_mf52a_Identifier_Code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_mf52d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_042_mf52d_Party_Identifier" id="_042_mf52d_Party_Identifier" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf52d_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_043_mf52d_Name_and_Address" id="_043_mf52d_Name_and_Address" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_mf52d_Name_and_Address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- MF32B Principal Amount Claimed -->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Principal Amount Claimed</span></div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" name="_050_mf32b_currency" id="_050_mf32b_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Principal Amount Claimed" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>

                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_051_mf32b_amount" id="_051_mf32b_amount" class="mandatory" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Principal Amount Claimed" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_050_mf32b_currency');" />
                                <font style="margin-left: 50px"></font>
                                <script>
                                    function formatUang(n, currency) {
                                        if (isNaN(n)) {
                                            return "";
                                        }
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_051_mf32b_amount').value;
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

                            <!-- OF33B Additional Amount Claimed as Allowed for in Excess of Principal Amount -->
                            <div class="form-row"><span class="label_body">OF33B</span><span class="label">Additional Amount Claimed as Allowed for in Excess of Principal Amount</span>
                                <input type="checkbox" name="Additional_Amount_Claimed_Checkbox" id="Additional_Amount_Claimed_Checkbox" />
                                <div id="check_of33b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency Code</span>
                                        <input type="text" name="_060_of33b_currency" id="_060_of33b_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_061_of33b_amount" id="_061_of33b_amount" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_060_of33b_currency');" />
                                        <font style="margin-left: 50px"></font>
                                        <script>
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_061_of33b_amount').value;
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

                            <!-- OF71D Charges -->
                            <div class="form-row"><span class="label_body">OF71D</span><span class="label">Other Charges</span>
                                <textarea name="_070_of71d_charges" id="_070_of71d_charges" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of71d_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- MF34a Total Amount Claimed ori -->
                            <div class="form-row"><span class="label_body">MF34a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Total Amount Claimed</span>
                                <select id="type_mf34a_Total_Amount_Claimed" name="type_mf34a_Total_Amount_Claimed" input_type="MF34A Total Amount Claimed" location="Body" class="mandatory">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Date - Currency - Amount</option>
                                    <option value="b">B - Currency - Amount</option>
                                </select>
                                <div id="div_mf34a_a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date</span>
                                        <input type="text" name="_080_mf34a_Date" id="_080_mf34a_Date" placeholder="YYMMDD" maxlength="6" minlength="6" size="6" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf34a_Date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                                        <input type="text" name="_081_mf34a_Currency" id="_081_mf34a_Currency" maxlength="3" minlength="3" size="6" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_mf34a_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                                        <input type="text" name="_082_mf34a_Amount" id="_082_mf34a_Amount" class="mandatory" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF34A Total Amount Claimed" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_mf34a_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_081_mf34a_Currency');" />
                                        <font style="margin-left: 50px"></font>
                                        <script>
                                            function formatUang(n, currency) {
                                                if (isNaN(n)) {
                                                    return "";
                                                }
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_082_mf34a_Amount').value;
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
                                <div id="div_mf34a_b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                                        <input type="text" name="_083_mf34b_Currency" id="_083_mf34b_Currency" class="mandatory" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf34b_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                                        <input type="text" name="_084_mf34b_Amount" id="_084_mf34b_Amount" class="mandatory" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF34A Total Amount Claimed" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_mf34b_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_083_mf34b_Currency');" />
                                        <font style="margin-left: 50px"></font>
                                        <script>
                                            function formatUang(n, currency) {
                                                if (isNaN(n)) {
                                                    return "";
                                                }
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_084_mf34b_Amount').value;
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
                            <div class="form-row"><span class="label_body">OF57a</span><span class="label">Account With Bank</span>
                                <select id="type_of57_Account_With_Bank" name="type_of57_Account_With_Bank">
                                    <option value="">choose a type</option>
                                    <option value="a">OF57A - Party Identifier - Identifier Code</option>
                                    <option value="b">OF57B - Party Identifier - Location</option>
                                    <option value="d">OF57D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of57a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_090_of57a_party_identifier" id="_090_of57a_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_091_of57a_identifier_code" id="_091_of57a_identifier_code" maxlength="11" minlength="8" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_092_of57b_party_identifier" id="_092_of57b_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_093_of57b_location" id="_093_of57b_location" maxlength="35" minlength="1" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_094_of57d_party_identifier" id="_094_of57d_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_095_of57d_name_and_address" id="_095_of57d_name_and_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_095_of57d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF58a Beneficiary Bank ori-->
                            <div class="form-row"><span class="label_body">OF58a</span><span class="label">Beneficiary Bank</span>
                                <select id="type_of58_Issuing_Bank" name="type_of58_Issuing_Bank">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Identifier Code</option>
                                    <option value="d">D - Name and Address</option>
                                </select>
                                <div id="div_of58a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_100_of58a_party_identifier" id="_100_of58a_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_101_of58a_identifier_code" id="_101_of58a_identifier_code" maxlength="11" minlength="8" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of58d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_102_of58d_party_identifier" id="_102_of58d_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_103_of58d_name_and_address" id="_103_of58d_name_and_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_of58d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF72Z Sender to Receiver Information -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea name="_110_of72z_sender_to_receiver_information" id="_110_of72z_sender_to_receiver_information" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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