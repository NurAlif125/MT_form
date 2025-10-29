<%-- 
    Document   : mt752
    Created on : Sep 23, 2025, 10:13:50?AM
    Author     : mslam
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt752.jsp" %>
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
        <c:if test="${item == 'MT:752'}">
            <div id="judul">MT 752 Authorisation to Pay, Accept or Negotiate</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="752" />
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
                                
                                <!-- MF21 -->
                                <div class="form-row"><span class="label_body">MF21</span><span class="label">*Presenting Bank's Reference</span>
                                    <input type="text" name="_020_mf21_presenting_bank_reference" id="_020_mf21_presenting_bank_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_presenting_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF23 -->
                                <div class="form-row"><span class="label_body">MF23</span><span class="label">*Further Identification</span>
                                    <select id="_030_mf23_further_identification" name="_030_mf23_further_identification">
                                        <option value="">choose a code</option>
                                        <option value="ACCEPT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='ACCEPT'}"> selected="true" </c:if></c:if></c:forEach>>ACCEPT</option>
                                        <option value="DEBIT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='DEBIT'}"> selected="true" </c:if></c:if></c:forEach>>DEBIT</option>
                                        <option value="NEGOTIATE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='NEGOTIATE'}"> selected="true" </c:if></c:if></c:forEach>>NEGOTIATE</option>
                                        <option value="REIMBURSE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='REIMBURSE'}"> selected="true" </c:if></c:if></c:forEach>>REIMBURSE</option>
                                        <option value="REMITTED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='REMITTED'}"> selected="true" </c:if></c:if></c:forEach>>REMITTED</option>
                                        <option value="SEE79Z" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='SEE79Z'}"> selected="true" </c:if></c:if></c:forEach>>SEE79Z</option>
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- MF30 -->
                                <div class="form-row"><span class="label_body">MF30</span><span class="label">*Date of Advice of Discrepancy or Mailing</span>
                                    <input type="text" name="_040_mf30_date_of_advice" id="_040_mf30_date_of_advice" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf30_date_of_advice'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF32B -->
                                <div class="form-row"><span class="label_body">OF32B</span><span class="label">Total Amount Advised</span>
                                    <input type="checkbox" name="total_amount_advised_checkbox" id="total_amount_advised_checkbox" />
                                    <div id="check_of32b">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_050_of32b_total_amount_advised_currency" id="_050_of32b_total_amount_advised_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of32b_total_amount_advised_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_051_of32b_amount" id="_051_of32b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <font style="margin-left: 50px"></font>
                                            <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                }
                                                var number2 = document.getElementById('_051_of32b_amount').value;
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
                                <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges Deducted</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_060_of71d_charges_deducated" id="_060_of71d_charges_deducated"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of71d_charges_deducated'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF33 -->
                                <div class="form-row"><span class="label_body">OF33</span><span class="label">Net Amount</span>
                                    <select id="type_of33_net_amount" name="type_of33_net_amount">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Date - Currency - Amount</option>
                                        <option value="b">B - Currency - Amount</option> 
                                    </select>
                                    <div id="div_of33a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                            <input type="text" name="_070_of33a_date" id="_070_of33a_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of33a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_071_of33a_currency" id="_071_of33a_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of33a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_072_of33a_amount" id="_072_of33a_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of33a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <font style="margin-left: 50px"></font>
                                            <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                }
                                                var number2 = document.getElementById('_072_of33a_amount').value;
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
                                    <div id="div_of33b_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_073_of33b_currency" id="_073_of33b_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_074_of33b_amount" id="_074_of33b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_074_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <font style="margin-left: 50px"></font>
                                            <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                }
                                                var number2 = document.getElementById('_074_of33b_amount').value;
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
                                
                                <!-- OF53 -->
                                <div class="form-row"><span class="label_body">OF53</span><span class="label">Sender's Correspondent</span>
                                    <select id="type_of53_sender_correspondent" name="type_of53_sender_correspondent">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="b">B - Party Identifier - Location</option> 
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of53a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_080_of53a_party_identifier" id="_080_of53a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_081_of53a_identifier_code" id="_081_of53a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of53b_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_082_of53b_party_identifier" id="_082_of53b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of53b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                            <input type="text" name="_083_of53b_location" id="_083_of53b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of53b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of53d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_084_of53d_party_identifier" id="_084_of53d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_085_of53d_name_address" id="_085_of53d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_085_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
                                            <input type="text" name="_090_of54a_party_identifier" id="_090_of54a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_091_of54a_identifier_code" id="_091_of54a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of54a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of54b_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_092_of54b_party_identifier" id="_092_of54b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of54b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                            <input type="text" name="_093_of54b_location" id="_093_of54b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of54b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of54d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_094_of54d_party_identifier" id="_094_of54d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of54d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_095_of54d_name_address" id="_095_of54d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_095_of54d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF72Z -->
                                <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_100_of72z_sender_to_receiver" id="_100_of72z_sender_to_receiver"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of72z_sender_to_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF79Z -->
                                <div class="form-row"><span class="label_body">OF79Z</span><span class="label">Narrative</span>
                                    <textarea cols="50" rows="35" maxlength="1750" wrap="hard" style="resize:none;" name="_110_of79z_narrative" id="_110_of79z_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of79z_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>--%>
                        <!-- MF20 Documentary Credit Number --> 
                        <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Documentary Credit Number</span>
                            <input type="text" name="_010_mf20_documentary_credit_number" id="_010_mf20_documentary_credit_number" class="mandatory" maxlength="16" size="16" input_type="MF20 Documentary Credit Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF21 Presenting Bank's Reference -->
                        <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Presenting Bank's Reference</span>
                            <input type="text" name="_020_mf21_presenting_bank_reference" id="_020_mf21_presenting_bank_reference" class="mandatory" maxlength="16" size="16" input_type="MF21 Presenting Bank's Reference" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_presenting_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- MF23 Further Identification -->
                        <div class="form-row"><span class="label_body">MF23</span><span class="label"><a style="color:red;text-decoration:none">*</a>Further Identification</span>
                            <select name="_030_mf23_further_identification" id="_030_mf23_further_identification" class="mandatory" input_type="MF23 Further Identification" location="Body">
                                <option value="">choose a type</option>
                                <option value="ACCEPT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='ACCEPT'}"> selected="true" </c:if></c:if></c:forEach>>ACCEPT - Conveys an authorisation to accept a draft</option>
                                <option value="DEBIT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='DEBIT'}"> selected="true" </c:if></c:if></c:forEach>>DEBIT - Conveys an authorisation to debit the account of the issuing bank</option>
                                <option value="NEGOTIATE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='NEGOTIATE'}"> selected="true" </c:if></c:if></c:forEach>>NEGOTIATE - Conveys an authorisation to negotiate the documents with discrepancies</option>
                                <option value="REIMBURSE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='REIMBURSE'}"> selected="true" </c:if></c:if></c:forEach>>REIMBURSE - Conveys an authorisation to claim reimbursement</option>
                                <option value="REMITTED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='REMITTED'}"> selected="true" </c:if></c:if></c:forEach>>REMITTED - Is used to pay the presenting bank</option>
                                <option value="SEE79Z" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_further_identification'}"><c:if test="${item.detail=='SEE79Z'}"> selected="true" </c:if></c:if></c:forEach>>SEE79Z - Conveys an authorisation (mixture or special version)</option> 
                            </select>
                        </div>
                        <hr/>

                        <!-- MF30 Date of Advice of Discrepancy or Mailing -->
                        <div class="form-row"><span class="label_body">MF30</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Advice of Discrepancy or Mailing</span>
                            <input type="text" name="_040_mf30_date_of_advice_of_discrepancy_or_mailing" id="_040_mf30_date_of_advice_of_discrepancy_or_mailing" class="mandatory" maxlength="6" size="6" placeholder="YYMMDD" input_type="MF30 Date of Advice of Discrepancy or Mailing" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf30_date_of_advice_of_discrepancy_or_mailing'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF32B Total Amount Advised -->
                        <div class="form-row"><span class="label_body">OF32B</span><span class="label">Total Amount Advised</span>
                            <input type="checkbox" name="total_amount_advised_checkbox" id="total_amount_advised_checkbox" />
                            <div id="check_of32b">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_050_of32b_currency" id="_050_of32b_currency" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_051_of32b_amount" id="_051_of32b_amount" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_050_of32b_currency');" />
                                <font style="margin-left: 50px"></font>
                                <script>
                                    function formatUang(n, currency) {
                                        if (isNaN(n)) { return ""; }
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_051_of32b_amount').value;
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

                        <!-- OF71D Charges Deducted -->
                        <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges Deducted</span>
                            <textarea name="_060_of71d_charges_deducted" id="_060_of71d_charges_deducted" cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of71d_charges_deducted'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF33a Net Amount -->
                        <div class="form-row"><span class="label_body">OF33a</span><span class="label">Net Amount</span>
                            <select id="type_of33_net_amount" name="type_of33_net_amount">
                                <option value="">choose a type</option> 
                                <option value="a">A - Date - Currency - Amount</option>
                                <option value="b">B - Currency - Amount</option> 
                            </select>
                            
                            <div id="div_of33a_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                    <input type="text" name="_070_of33a_date" id="_070_of33a_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of33a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_071_of33a_currency" id="_071_of33a_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of33a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_072_of33a_amount" id="_072_of33a_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of33a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    <font style="margin-left: 50px"></font>
                                    <script langauge="javascript">
                                        function formatUang(n, currency) {
                                            if (isNaN(n)) { return ""; }
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_072_of33a_amount').value;
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
                            <div id="div_of33b_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_073_of33b_currency" id="_073_of33b_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_074_of33b_amount" id="_074_of33b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_074_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    <font style="margin-left: 50px"></font>
                                    <script langauge="javascript">
                                        function formatUang(n, currency) {
                                            if (isNaN(n)) { return ""; }
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_074_of33b_amount').value;
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

                        <!-- OF53a Sender's Correspondent -->
                        <div class="form-row"><span class="label_body">OF53a</span><span class="label">Sender's Correspondent</span>
                            <select id="type_of53_sender_correspondent" name="type_of53_sender_correspondent">
                                <option value="">choose a type</option> 
                                <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                <option value="b">B - Party Identifier - Location</option> 
                                <option value="d">D - Party Identifier - Name and Address</option>
                            </select>  
                            <div id="div_of53a_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_080_of53a_party_identifier" id="_080_of53a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                    <input type="text" name="_081_of53a_identifier_code" id="_081_of53a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div id="div_of53b_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_082_of53b_party_identifier" id="_082_of53b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of53b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                    <input type="text" name="_083_of53b_location" id="_083_of53b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of53b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div id="div_of53d_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_084_of53d_party_identifier" id="_084_of53d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_085_of53d_name_address" id="_085_of53d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_085_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
                                    <input type="text" name="_090_of54a_party_identifier" id="_090_of54a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                    <input type="text" name="_091_of54a_identifier_code" id="_091_of54a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of54a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div id="div_of54b_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_092_of54b_party_identifier" id="_092_of54b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of54b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                    <input type="text" name="_093_of54b_location" id="_093_of54b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of54b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div id="div_of54d_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_094_of54d_party_identifier" id="_094_of54d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of54d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_095_of54d_name_address" id="_095_of54d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_095_of54d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>
                        </div>
                        <hr/>

                        <!-- OF72Z Sender to Receiver Information -->
                        <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                            <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_100_of72z_sender_to_receiver" id="_100_of72z_sender_to_receiver"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of72z_sender_to_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF79Z Narrative -->
                        <div class="form-row"><span class="label_body">OF79Z</span><span class="label">Narrative</span>
                            <textarea name="_110_of79z_narrative" id="_110_of79z_narrative" cols="50" rows="35" maxlength="1750" wrap="hard" style="resize:none;"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of79z_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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