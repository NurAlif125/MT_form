<%-- 
    Document   : mt740
    Created on : Aug 14, 2018
    Author     : Andhita Deara
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt740.jsp" %>
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
        <c:if test="${item == 'MT:740'}">
            <div id="judul">MT 740 Authorisation to Reimburse</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="740" />
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
                            <%--<div class="form-row"><span class="label_body">MF20</span><span class="label">*Documentary Credit Number</span>
                                <input type="text" name="_010_mf20_documentary_credit_number" id="_010_mf20_documentary_credit_number" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- OF25 -->
                            <div class="form-row"><span class="label_body">OF25</span><span class="label">Account Identification</span>
                                <input type="text" name="_020_of25_account_identification" id="_020_of25_account_identification" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of25_account_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF40F -->
                            <div class="form-row"><span class="label_body">MF40F</span><span class="label">*Applicable Rules</span>
                                <select id="_030_mf40f_applicable_rules" name="_030_mf40f_applicable_rules">
                                    <option value="">choose a code</option>
                                    <option value="NOTURR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf40f_applicable_rules'}"><c:if test="${item.detail=='NOTURR'}"> selected="true" </c:if></c:if></c:forEach>>NOTURR</option> <!-- - Ordering Customer-->
                                    <option value="URR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf40f_applicable_rules'}"><c:if test="${item.detail=='URR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>URR LATEST VERSION</option>
                                </select>
                            </div>
                            <hr/>

                            <!-- OF31D -->
                            <div class="form-row"><span class="label_body">OF31D</span><span class="label">Date and Place of Expiry</span>
                                <input type="checkbox" name="date_place_of_expiry_checkbox" id="date_place_of_expiry_checkbox" />
                                <div id="check_of31d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" name="_040_of31d_date" id="_040_of31d_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of31d_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Place</span>
                                        <input type="text" name="_041_of31d_place" id="_041_of31d_place" maxlength="29" size="29" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of31d_place'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF58 -->
                            <div class="form-row"><span class="label_body">OF58</span><span class="label">Negotiating Bank</span>
                                <select id="type_of58_negotiating_bank" name="type_of58_negotiating_bank">
                                    <option value="">choose a type</option> 
                                    <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of58a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_050_of58a_party_identifier" id="_050_of58a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_051_of58a_identifier_code" id="_051_of58a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of58d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_052_of58d_party_identifier" id="_052_of58d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_053_of58d_name_address" id="_053_of58d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF59 -->
                            <div class="form-row"><span class="label_body">OF59</span><span class="label">Beneficiary</span>
                                <input type="checkbox" name="beneficiary_checkbox" id="beneficiary_checkbox" />
                                <div id="check_of59">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_060_of59_account" id="_060_of59_account" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_061_of59_name_address" id="_061_of59_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- MF32B -->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label">*Currency Credit Amount</span>
                                <input type="text" name="_070_mf32b_currency_credit_amount" id="_070_mf32b_currency_credit_amount" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf32b_currency_credit_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                <input type="text" name="_071_mf32b_amount" id="_071_mf32b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_071_mf32b_amount').value;
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

                            <!-- OF39A -->
                            <div class="form-row"><span class="label_body">OF39A</span><span class="label">Percentage Credit Amount Tolerance</span>
                                <input type="checkbox" name="percentage_credit_amount_checkbox" id="percentage_credit_amount_checkbox" />
                                <div id="check_of39a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 1</span>
                                        <input type="text" name="_080_of39a_percentage_credit_amount_tolerance1" id="_080_of39a_percentage_credit_amount_tolerance1" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of39a_percentage_credit_amount_tolerance1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 2</span>
                                        <input type="text" name="_081_of39a_percentage_credit_amount_tolerance2" id="_081_of39a_percentage_credit_amount_tolerance2" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of39a_percentage_credit_amount_tolerance2'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF39C -->
                            <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_090_of39c_additional_amount_covered" id="_090_of39c_additional_amount_covered"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of39c_additional_amount_covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- MF41 -->
                            <div class="form-row"><span class="label_body">MF41</span><span class="label">*Available With ... By ...</span>
                                <select id="type_mf41_available_with_by" name="type_mf41_available_with_by">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Identifier Code - Code</option> <!-- - Ordering Customer-->
                                    <option value="d">D - Name and Address - Code</option>
                                </select>
                                <div id="div_mf41a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_100_mf41a_identifier_code" id="_100_mf41a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf41a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                        <select id="_101_mf41a_code" name="_101_mf41a_code">
                                            <option value="">choose a code</option>
                                            <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option> <!-- - Ordering Customer-->
                                            <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                            <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                            <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                            <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                        </select>
                                    </div>
                                </div>
                                <div id="div_mf41d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_102_mf41d_name_address" id="_102_mf41d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_mf41d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                        <select id="_103_mf41d_code" name="_103_mf41d_code">
                                            <option value="">choose a code</option>
                                            <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option> <!-- - Ordering Customer-->
                                            <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                            <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                            <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                            <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF42C -->
                            <div class="form-row"><span class="label_body">OF42C</span><span class="label">Drafts at ...</span>
                                <textarea cols="35" rows="3" maxlength="105" wrap="hard" style="resize:none;" name="_110_of42c_drafts_at" id="_110_of42c_drafts_at"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of42c_drafts_at'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF42 -->
                            <div class="form-row"><span class="label_body">OF42</span><span class="label">Drawee</span>
                                <select id="type_of42_drawee" name="type_of42_drawee">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of42a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_120_of42a_party_identifier" id="_120_of42a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of42a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_121_of42a_identifier_code" id="_121_of42a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_of42a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of42d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_122_of42d_party_identifier" id="_122_of42d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_122_of42d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_123_of42d_name_address" id="_123_of42d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_123_of42d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF42M -->
                            <div class="form-row"><span class="label_body">OF42M</span><span class="label">Mixed Payment Details</span>
                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_130_of42m_mixed_payment_details" id="_130_of42m_mixed_payment_details"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of42m_mixed_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF42P -->
                            <div class="form-row"><span class="label_body">OF42P</span><span class="label">Negotiation/Deferred Payment Details</span>
                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_140_of42p_negotiation_payment_details" id="_140_of42p_negotiation_payment_details"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of42p_negotiation_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF71A -->
                            <div class="form-row"><span class="label_body">OF71A</span><span class="label">Reimbursing Bank's Charges</span>
                                <select id="_150_of71a_applicable_rules" name="_150_of71a_applicable_rules">
                                    <option value="">choose a code</option>
                                    <option value="CLM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of71a_applicable_rules'}"><c:if test="${item.detail=='CLM'}"> selected="true" </c:if></c:if></c:forEach>>Claiming bank's charges</option> <!-- - Ordering Customer-->
                                    <option value="OUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of71a_applicable_rules'}"><c:if test="${item.detail=='OUR'}"> selected="true" </c:if></c:if></c:forEach>>Our charges</option>
                                </select>
                            </div>
                            <hr/>

                            <!-- OF71D -->
                            <div class="form-row"><span class="label_body">OF71D</span><span class="label">Other Charges</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_160_of71d_other_charges" id="_160_of71d_other_charges"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of71d_other_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF72Z -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_170_of72z_sender_to_receiver" id="_170_of72z_sender_to_receiver"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of72z_sender_to_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>--%>
                                
                            <!-- MF20 Documentary Credit Number -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Documentary Credit Number</span>
                                <input type="text" name="_010_mf20_documentary_credit_number" id="_010_mf20_documentary_credit_number" class="mandatory" maxlength="16" input_type="MF20 Documentary Credit Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- OF25 Account Identification -->
                            <div class="form-row"><span class="label_body">OF25</span><span class="label">Account Identification</span>
                                <input type="text" name="_020_of25_account_identification" id="_020_of25_account_identification" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of25_account_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF40F Applicable Rules -->
                            <div class="form-row"><span class="label_body">MF40F</span><span class="label"><a style="color:red;text-decoration:none">*</a>Applicable Rules</span>
                                <select name="_030_mf40f_applicable_rules" id="_030_mf40f_applicable_rules" class="mandatory" input_type="MF40F Applicable Rules" location="Body">
                                    <option value="">choose a code</option>
                                    <option value="NOTURR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf40f_applicable_rules'}"><c:if test="${item.detail=='NOTURR'}"> selected="true" </c:if></c:if></c:forEach>>NOTURR - Not subject to URR</option>
                                    <option value="URR LATEST VERSION"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf40f_applicable_rules'}"><c:if test="${item.detail=='URR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>URR LATEST VERSION</option>
                                </select>
                            </div>
                            <hr/>

                            <!-- OF31D Date and Place of Expiry ori -->
                            <div class="form-row"><span class="label_body">OF31D</span><span class="label">Date and Place of Expiry</span>
                                <input type="checkbox" name="date_place_of_expiry_checkbox" id="date_place_of_expiry_checkbox" />
                                <div id="check_of31d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" name="_040_of31d_date_of_expiry" id="_040_of31d_date_of_expiry" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of31d_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Place</span>
                                        <input type="text" name="_041_of31d_place_of_expiry" id="_041_of31d_place_of_expiry" maxlength="29" size="29" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of31d_place_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF58a Negotiating Bank -->
                            <div class="form-row"><span class="label_body">OF58a</span><span class="label">Negotiating Bank</span>
                                <select id="type_of58_negotiating_bank" name="type_of58_negotiating_bank">
                                    <option value="">choose a type</option> 
                                    <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of58a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_050_of58a_party_identifier" id="_050_of58a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_051_of58a_identifier_code" id="_051_of58a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of58d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_052_of58d_party_identifier" id="_052_of58d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_053_of58d_name_address" id="_053_of58d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>


                            <!-- OF59 Beneficiary -->
                            <div class="form-row"><span class="label_body">OF59</span><span class="label">Beneficiary</span>
                                <input type="checkbox" name="beneficiary_checkbox" id="beneficiary_checkbox"/>
                                <div id="check_of59">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_060_of59_account" id="_060_of59_account" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_061_of59_name_address" id="_061_of59_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- MF32B Credit Amount -->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label">Credit Amount</span></div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                                <input type="text" name="_070_mf32b_currency" id="_070_mf32b_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                                <input type="text" name="_071_mf32b_amount" id="_071_mf32b_amount" class="mandatory" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_070_mf32b_currency');" />
                                <!-- Format nominal (optional visual helper) -->
                                <font style="margin-left: 50px"></font>
                                <script>
                                    function formatUang(n, currency) {
                                        if (isNaN(n)) {
                                            return "";
                                        }
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_071_mf32b_amount').value;
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

                            <!-- OF39A Percentage Credit Amount Tolerance -->
                            <div class="form-row"><span class="label_body">OF39A</span><span class="label">Percentage Credit Amount Tolerance</span>
                                <input type="checkbox" name="percentage_credit_amount_checkbox" id="percentage_credit_amount_checkbox" />
                                <div id="check_of39a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 1</span>
                                        <input type="text" name="_080_of39a_percentage_credit_amount_tolerance1" id="_080_of39a_percentage_credit_amount_tolerance1" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of39a_percentage_credit_amount_tolerance1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 2</span>
                                        <input type="text" name="_081_of39a_percentage_credit_amount_tolerance2" id="_081_of39a_percentage_credit_amount_tolerance2" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of39a_percentage_credit_amount_tolerance2'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF39C Additional Amounts Covered -->
                            <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                                <textarea name="_090_of39c_additional_amounts_covered" id="_090_of39c_additional_amounts_covered" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of39c_additional_amounts_covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- MF41a Available With ... By ... ori -->
                            <div class="form-row"><span class="label_body">MF41a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Available With ... By ...</span>
                                <select id="type_mf41_available_with_by" name="type_mf41_available_with_by" input_type="MF41 Available With ... By ..." location="Body" class="mandatory">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Identifier Code - Code</option> <!-- - Ordering Customer-->
                                    <option value="d">D - Name and Address - Code</option>
                                </select>
                                <div id="div_mf41a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_100_mf41a_identifier_code" id="_100_mf41a_identifier_code" class="mandatory" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf41a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Code</span>
                                        <select id="_101_mf41a_code" name="_101_mf41a_code" class="mandatory">
                                            <option value="">choose a code</option>
                                            <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option> <!-- - Ordering Customer-->
                                            <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                            <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                            <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                            <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf41a_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                        </select>
                                    </div>
                                </div>
                                <div id="div_mf41d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_102_mf41d_name_address" id="_102_mf41d_name_address" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_mf41d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Code</span>
                                        <select id="_103_mf41d_code" name="_103_mf41d_code" class="mandatory">
                                            <option value="">choose a code</option>
                                            <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option> <!-- - Ordering Customer-->
                                            <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                            <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                            <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                            <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_mf41d_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF42C Drafts at ... -->
                            <div class="form-row"><span class="label_body">OF42C</span><span class="label">Drafts at ...</span>
                                <textarea name="_110_of42c_drafts_at" id="_110_of42c_drafts_at" rows="3" maxlength="105"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of42c_drafts_at'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF42a Drawee ori -->
                            <div class="form-row"><span class="label_body">OF42a</span><span class="label">Drawee</span>
                                <select id="type_of42_drawee" name="type_of42_drawee">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of42a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_120_of42a_party_identifier" id="_120_of42a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of42a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_121_of42a_identifier_code" id="_121_of42a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_of42a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of42d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_122_of42d_party_identifier" id="_122_of42d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_122_of42d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_123_of42d_name_address" id="_123_of42d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_123_of42d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF42M Mixed Payment Details -->
                            <div class="form-row"><span class="label_body">OF42M</span><span class="label">Mixed Payment Details</span>
                                <textarea name="_130_of42m_mixed_payment_details" id="_130_of42m_mixed_payment_details" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of42m_mixed_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF42P Negotiation/Deferred Payment Details -->
                            <div class="form-row"><span class="label_body">OF42P</span><span class="label">Negotiation / Deferred Payment Details</span>
                                <textarea name="_140_of42p_negotiation_deferred_payment_details" id="_140_of42p_negotiation_deferred_payment_details" rows="4" maxlength="140" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of42p_negotiation_deferred_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF71A Reimbursing Bank's Charges -->
                            <div class="form-row"><span class="label_body">OF71A</span><span class="label">Reimbursing Bank's Charges</span>
                                <select name="_150_of71a_reimbursing_banks_charges" id="_150_of71a_reimbursing_banks_charges">
                                    <option value="">choose a code</option>
                                    <option value="CLM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of71a_reimbursing_banks_charges'}"><c:if test="${item.detail=='CLM'}"> selected="true" </c:if></c:if></c:forEach>>CLM - Claiming bank's charges</option>
                                    <option value="OUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of71a_reimbursing_banks_charges'}"><c:if test="${item.detail=='OUR'}"> selected="true" </c:if></c:if></c:forEach>>OUR - Our charges</option>
                                </select>
                            </div>
                            <hr/>

                            <!-- OF71D Other Charges -->
                            <div class="form-row"><span class="label_body">OF71D</span><span class="label">Other Charges</span>
                                <textarea name="_160_of71d_other_charges" id="_160_of71d_other_charges" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of71d_other_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF72Z Sender to Receiver Information -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea name="_170_of72z_sender_to_receiver_information" id="_170_of72z_sender_to_receiver_information" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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