<%-- 
    Document   : mt707
    Created on : Jul 19, 2018
    Author     : Andhita Deara
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt707.jsp" %>
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
        <c:if test="${item == 'MT:707'}">
            <div id="judul">MT 707 Amendment to a Documentary Credit</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="707" />
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
                            
                                <%--<!-- MF27 -->
                                <div class="form-row"><span class="label_body">MF27</span><span class="label">*Number</span>
                                    <input type="text" name="_010_mf27_number" id="_010_mf27_number" maxlength="1" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Total</span>
                                    <input type="text" name="_011_mf27_total" id="_011_mf27_total" maxlength="8" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF20 -->
                                <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sender's Reference</span>
                                    <input type="text" name="_020_mf20_sender_reference" id="_020_mf20_sender_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF21 -->
                                <div class="form-row"><span class="label_body">MF21</span><span class="label">*Receiver's Reference</span>
                                    <input type="text" name="_030_mf21_receivers_reference" id="_030_mf21_receivers_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf21_receivers_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF23 -->
                                <div class="form-row"><span class="label_body">MF23</span><span class="label">*Issuing Bank's Reference</span>
                                    <input type="text" name="_040_mf23_issuing_bank_reference" id="_040_mf23_issuing_bank_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf23_issuing_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- OF52 -->
                                <div class="form-row"><span class="label_body">OF52</span><span class="label">Issuing Bank</span>
                                    <select id="type_of52_issuing_bank" name="type_of52_issuing_bank">
                                        <option value="">choose a type</option>
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of52a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_050_of52a_party_identifier" id="_050_of52a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_051_of52a_identifier_code" id="_051_of52a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of52d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_052_of52d_party_identifier" id="_052_of52d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_053_of52d_name_address" id="_053_of52d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>

                                <!-- OF50B -->
                                <div class="form-row"><span class="label_body">OF50B</span><span class="label">Name and Address Non-Bank Issuer</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_060_of50b_name_address_nonbank_issuer" id="_060_of50b_name_address_nonbank_issuer"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of50b_name_address_nonbank_issuer'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- MF31C -->
                                <div class="form-row"><span class="label_body">MF31C</span><span class="label">*Date of Issue</span>
                                    <input type="text" name="_070_mf31c_date_of_issue" id="_070_mf31c_date_of_issue" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf31c_date_of_issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                
                                <!-- MF26E -->
                                <div class="form-row"><span class="label_body">MF26E</span><span class="label">*Number of Amendment</span>
                                    <input type="text" name="_080_mf26e_number_of_amendment" id="_080_mf26e_number_of_amendment" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf26e_number_of_amendment'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                
                                <!-- MF30 -->
                                <div class="form-row"><span class="label_body">MF30</span><span class="label">*Date of Amendment</span>
                                    <input type="text" name="_090_mf30_date_of_amendment" id="_090_mf30_date_of_amendment" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf30_date_of_amendment'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>

                                <!-- MF22A -->
                                <div class="form-row"><span class="label_body">MF22A</span><span class="label">*Purpose of Message</span>
                                    <select id="_100_mf22a_purpose_of_message" name="_100_mf22a_purpose_of_message">
                                        <option value="">choose a code</option>
                                        <option value="ACNF" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ACNF'}"> selected="true" </c:if></c:if></c:forEach>>ACNF</option> <!-- - Ordering Customer-->
                                        <option value="ADVI" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ADVI'}"> selected="true" </c:if></c:if></c:forEach>>ADVI</option>
                                        <option value="ISSU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ISSU'}"> selected="true" </c:if></c:if></c:forEach>>ISSU</option>
                                    </select>
                                </div>
                                <hr/>

                                <!-- OF23S -->
                                <div class="form-row"><span class="label_body">OF23S</span><span class="label">Cancellation Request</span>
                                    <select id="_110_of23s_cancellation_request" name="_110_of23s_cancellation_request">
                                        <option value="">choose a code</option>
                                        <option value="CANCEL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of23s_cancellation_request'}"><c:if test="${item.detail=='CANCEL'}"> selected="true" </c:if></c:if></c:forEach>>CANCEL</option> <!-- - Ordering Customer-->
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- OF40A -->
                                <div class="form-row"><span class="label_body">OF40A</span><span class="label">Form of Documentary Credit</span>
                                    <select id="_120_of40a_form_of_documentary_credit" name="_120_of40a_form_of_documentary_credit">
                                        <option value="">choose a code</option>
                                        <option value="IRREVOCABLE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of40a_form_of_documentary_credit'}"><c:if test="${item.detail=='IRREVOCABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE</option> <!-- - Ordering Customer-->
                                        <option value="IRREVOCABLE TRANSFERABLE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of40a_form_of_documentary_credit'}"><c:if test="${item.detail=='IRREVOCABLE TRANSFERABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE TRANSFERABLE</option>
                                        <option value="IRREVOCABLE STANDBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of40a_form_of_documentary_credit'}"><c:if test="${item.detail=='IRREVOCABLE STANDBY'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE STANDBY</option>
                                        <option value="IRREVOC TRANS STANDBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of40a_form_of_documentary_credit'}"><c:if test="${item.detail=='IRREVOC TRANS STANDBY'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOC TRANS STANDBY</option>
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- OF40E -->
                                <div class="form-row"><span class="label_body">OF40E</span><span class="label">Applicable Rules</span>
                                    <select id="_130_of40e_applicable_rules" name="_130_of40e_applicable_rules">
                                        <option value="">choose a code</option>
                                        <option value="EUCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='EUCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCP LATEST VERSION</option> <!-- - Ordering Customer-->
                                        <option value="EUCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='EUCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCPURR LATEST VERSION</option>
                                        <option value="ISP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='ISP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>ISP LATEST VERSION</option>
                                        <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                        <option value="UCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='UCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCP LATEST VERSION</option>
                                        <option value="UCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='UCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCPURR LATEST VERSION</option>
                                    </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                    <input type="text" name="_131_of40e_narrative" id="_131_of40e_narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_131_of40e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF31D -->
                                <div class="form-row"><span class="label_body">OF31D</span><span class="label">Date of Expiry</span>
                                    <input type="text" name="_140_of31d_date_of_expiry" id="_140_of31d_date_of_expiry" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of31d_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Place of Expiry</span>
                                    <input type="text" name="_141_of31d_place_of_expiry" id="_141_of31d_place_of_expiry" maxlength="29" size="29" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_of31d_place_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF50 -->
                                <div class="form-row"><span class="label_body">OF50</span><span class="label">Name and Address Changed Applicant Details</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_150_of50_name_address_changed_applicant" id="_150_of50_name_address_changed_applicant"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of50_name_address_changed_applicant'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF59 -->
                                <div class="form-row"><span class="label_body">OF59</span><span class="label">Account Beneficiary</span>
                                    <input type="text" name="_160_of59_account_beneficiary" id="_160_of59_account_beneficiary" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of59_account_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address Beneficiary</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_161_of59_name_address_beneficiary" id="_161_of59_name_address_beneficiary"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_of59_name_address_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF32B -->
                                <div class="form-row"><span class="label_body">OF32B</span><span class="label">Increase of Documentary Credit Amount</span>
                                    <input type="checkbox" name="increase_of_credit_amount_checkbox" id="increase_of_credit_amount_checkbox" />
                                    <div id="check_of32b">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_170_of32b_currency_increase_of_credit_amount" id="_170_of32b_currency_increase_of_credit_amount" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of32b_currency_increase_of_credit_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_171_of32b_amount_increase_of_credit_amount" id="_171_of32b_amount_increase_of_credit_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of32b_amount_increase_of_credit_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <font style="margin-left: 50px"></font>
                                            <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                }
                                                var number2 = document.getElementById('_171_of32b_amount_increase_of_credit_amount').value;
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
                                <div class="form-row"><span class="label_body">OF33B</span><span class="label">Decrease of Documentary Credit Amount</span>
                                    <input type="checkbox" name="decrease_of_credit_amount_checkbox" id="decrease_of_credit_amount_checkbox" />
                                    <div id="check_of33b">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_180_of33b_currency_decrease_of_credit_amount" id="_180_of33b_currency_decrease_of_credit_amount" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of33b_currency_decrease_of_credit_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_181_of33b_amount_increase_of_credit_amount" id="_181_of33b_amount_increase_of_credit_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_of33b_amount_increase_of_credit_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <font style="margin-left: 50px"></font>
                                            <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                }
                                                var number2 = document.getElementById('_181_of33b_amount_increase_of_credit_amount').value;
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
                                
                                <!-- OF39A -->
                                <div class="form-row"><span class="label_body">OF39A</span><span class="label">Percentage Credit Amount</span>
                                    <input type="checkbox" name="percentage_credit_amount_checkbox" id="percentage_credit_amount_checkbox" />
                                    <div id="check_of39a">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 1</span>
                                            <input type="text" name="_190_of39a_percentage_credit_amount_tolerance1" id="_190_of39a_percentage_credit_amount_tolerance1" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of39a_percentage_credit_amount_tolerance1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 2</span>
                                            <input type="text" name="_191_of39a_percentage_credit_amount_tolerance2" id="_191_of39a_percentage_credit_amount_tolerance2" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_191_of39a_percentage_credit_amount_tolerance2'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                        
                                <!-- OF39C -->
                                <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_200_of39c_additional_amount_covered" id="_200_of39c_additional_amount_covered"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of39c_additional_amount_covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF41 -->
                                <div class="form-row"><span class="label_body">OF41</span><span class="label">Available With ... By ...</span>
                                    <select id="type_of41_available_with_by" name="type_of41_available_with_by">
                                        <option value="">choose a type</option>
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of41a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_210_of41a_identifier_code" id="_210_of41a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of41a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Code</span>
                                            <select id="_211_of41a_code" name="_211_of41a_code">
                                                <option value="">choose a code</option>
                                                <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_211_of41a_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option> <!-- - Ordering Customer-->
                                                <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_211_of41a_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                                <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_211_of41a_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                                <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_211_of41a_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                                <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_211_of41a_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="div_of41d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_212_of41d_name_address" id="_212_of41d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_212_of41d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Code</span>
                                            <select id="_213_of41d_code" name="_213_of41d_code">
                                                <option value="">choose a code</option>
                                                <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_213_of41d_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option> <!-- - Ordering Customer-->
                                                <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_213_of41d_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                                <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_213_of41d_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                                <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_213_of41d_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                                <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_213_of41d_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF42C -->
                                <div class="form-row"><span class="label_body">OF42C</span><span class="label">Drafts at ...</span>
                                    <textarea cols="35" rows="3" maxlength="105" wrap="hard" style="resize:none;" name="_220_of42c_drafts_at" id="_220_of42c_drafts_at"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of42c_drafts_at'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
                                            <input type="text" name="_230_of42a_party_identifier" id="_230_of42a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of42a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_231_of42a_identifier_code" id="_231_of42a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_231_of42a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of42d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_232_of42d_party_identifier" id="_232_of42d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_232_of42d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_233_of42d_name_address" id="_233_of42d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_233_of42d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF42M -->
                                <div class="form-row"><span class="label_body">OF42M</span><span class="label">Mixed Payment Details</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_240_of42m_mixed_payment_details" id="_240_of42m_mixed_payment_details"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of42m_mixed_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF42P -->
                                <div class="form-row"><span class="label_body">OF42P</span><span class="label">Negotiation/Deferred Payment Details</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_250_of42p_negotiation_payment_details" id="_250_of42p_negotiation_payment_details"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of42p_negotiation_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF43P -->
                                <div class="form-row"><span class="label_body">OF43P</span><span class="label">Partial Shipments Code</span>
                                    <select id="_260_of43p_partial_shipments_code" name="_260_of43p_partial_shipments_code">
                                        <option value="">choose a code</option>
                                        <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of43p_partial_shipments_code'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option> <!-- - Ordering Customer-->
                                        <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of43p_partial_shipments_code'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                                        <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of43p_partial_shipments_code'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- OF43T -->
                                <div class="form-row"><span class="label_body">OF43T</span><span class="label">Transhipment Code</span>
                                    <select id="_270_of43t_transhipment_code" name="_270_of43t_transhipment_code">
                                        <option value="">choose a code</option>
                                        <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of43t_transhipment_code'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option> <!-- - Ordering Customer-->
                                        <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of43t_transhipment_code'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                                        <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of43t_transhipment_code'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- OF44A -->
                                <div class="form-row"><span class="label_body">OF44A</span><span class="label">Place of Taking in Charge/Dispatch from .../Place of Receipt</span>
                                    <input type="text" name="_280_of44a_place_of_receipt" id="_280_of44a_place_of_receipt" maxlength="65" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of44a_place_of_receipt'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF44E -->
                                <div class="form-row"><span class="label_body">OF44E</span><span class="label">Port of Loading/Airport of Departure</span>
                                    <input type="text" name="_290_of44e_port_of_loading" id="_290_of44e_port_of_loading" maxlength="65" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of44e_port_of_loading'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF44F -->
                                <div class="form-row"><span class="label_body">OF44F</span><span class="label">Port of Discharge/Airport of Destination</span>
                                    <input type="text" name="_300_of44f_port_of_discharge" id="_300_of44f_port_of_discharge" maxlength="65" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of44f_port_of_discharge'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF44B -->
                                <div class="form-row"><span class="label_body">OF44B</span><span class="label">Place of Final Destination/For Transportation to .../Place of Delivery</span>
                                    <input type="text" name="_310_of44b_place_of_delivery" id="_310_of44b_place_of_delivery" maxlength="65" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of44b_place_of_delivery'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF44C -->
                                <div class="form-row"><span class="label_body">OF44C</span><span class="label">Latest Date of Shipment</span>
                                    <input type="text" name="_320_of44c_latest_date_of_shipment" id="_320_of44c_latest_date_of_shipment" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of44c_latest_date_of_shipment'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF44D -->
                                <div class="form-row"><span class="label_body">OF44D</span><span class="label">Shipment Period</span>
                                    <textarea cols="65" rows="6" maxlength="390" wrap="hard" style="resize:none;" name="_330_of44d_shipment_period" id="_330_of44d_shipment_period"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of44d_shipment_period'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF45B -->
                                <div class="form-row"><span class="label_body">OF45B</span><span class="label">Description of Goods and/or Services</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_340_of45b_description_of_services_narrative" id="_340_of45b_description_of_services_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of45b_description_of_services_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF46B -->
                                <div class="form-row"><span class="label_body">OF46B</span><span class="label">Documents Required</span>
                                     <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_350_of46b_documents_require_narrative" id="_350_of46b_documents_require_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_of46b_documents_require_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                    
                                <!-- OF47B -->
                                <div class="form-row"><span class="label_body">OF47B</span><span class="label">Additional Conditions</span> 
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_360_of47b_additional_conditions" id="_360_of47b_additional_conditions"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of47b_additional_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>   
                                </div>
                                <hr/>
                                    
                                <!-- OF49M -->
                                <div class="form-row"><span class="label_body">OF49M</span><span class="label">Special Payment Conditions for Beneficiary</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_370_of49m_payment_for_beneficiary" id="_370_of49m_payment_for_beneficiary"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_of49m_payment_for_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>      
                                </div>
                                <hr/>
                                
                                <!-- OF49N -->
                                <div class="form-row"><span class="label_body">OF49N</span><span class="label">Special Payment Conditions for Receiving Bank</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_380_of49n_payment_for_receiving_bank" id="_380_of49n_payment_for_receiving_bank"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of49n_payment_for_receiving_bank'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF71D -->
                                <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_390_of71d_charges" id="_390_of71d_charges"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_of71d_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF71N -->
                                <div class="form-row"><span class="label_body">OF71N</span><span class="label">Amendment Charge Payable By Code</span>
                                    <select id="_400_of71n_amendment_charge_code" name="_400_of71n_amendment_charge_code">
                                        <option value="">choose a code</option>
                                        <option value="APPL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_of71n_amendment_charge_code'}"><c:if test="${item.detail=='APPL'}"> selected="true" </c:if></c:if></c:forEach>>Applicant</option> 
                                        <option value="BENE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_of71n_amendment_charge_code'}"><c:if test="${item.detail=='BENE'}"> selected="true" </c:if></c:if></c:forEach>>Beneficiary</option>
                                        <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_of71n_amendment_charge_code'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>Other Party</option>
                                    </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amendment Charge Payable By Narrative</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_401_of71n_amendment_charge_narrative" id="_401_of71n_amendment_charge_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_401_of71n_amendment_charge_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF48 -->
                                <div class="form-row"><span class="label_body">OF48</span><span class="label">Period for Presentation in Days</span>
                                    <input type="text" name="_410_of48_period_for_presentation_in_days" id="_410_of48_period_for_presentation_in_days" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of48_period_for_presentation_in_days'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                    <input type="text" name="_411_of48_narrative" id="_411_of48_narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_411_of48_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF49 -->
                                <div class="form-row"><span class="label_body">OF49</span><span class="label">Confirmation Instructions</span>
                                    <select id="_420_of49_confirmation_instructions" name="_420_of49_confirmation_instructions">
                                        <option value="">choose a code</option>
                                        <option value="CONFIRM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_of49_confirmation_instructions'}"><c:if test="${item.detail=='CONFIRM'}"> selected="true" </c:if></c:if></c:forEach>>CONFIRM</option> <!-- - Ordering Customer-->
                                        <option value="MAY ADD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_of49_confirmation_instructions'}"><c:if test="${item.detail=='MAY ADD'}"> selected="true" </c:if></c:if></c:forEach>>MAY ADD</option>
                                        <option value="WITHOUT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_of49_confirmation_instructions'}"><c:if test="${item.detail=='WITHOUT'}"> selected="true" </c:if></c:if></c:forEach>>WITHOUT</option>
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- OF58 -->
                                <div class="form-row"><span class="label_body">OF58</span><span class="label">Requested Confirmation Party</span>
                                    <select id="type_of58_request_confirmation_party" name="type_of58_request_confirmation_party">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of58a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_430_of58a_party_identifier" id="_430_of58a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_431_of58a_identifier_code" id="_431_of58a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_431_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of58d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_432_of58d_party_identifier" id="_432_of58d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_432_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_433_of58d_name_address" id="_433_of58d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_433_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF53 -->
                                <div class="form-row"><span class="label_body">OF53</span><span class="label">Reimbursing Bank</span>
                                    <select id="type_of53_reimbursing_bank" name="type_of53_reimbursing_bank">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of53a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_440_of53a_party_identifier" id="_440_of53a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_441_of53a_identifier_code" id="_441_of53a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_441_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of53d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_442_of53d_party_identifier" id="_442_of53d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_442_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_443_of53d_name_address" id="_443_of53d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_443_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF78 -->
                                <div class="form-row"><span class="label_body">OF78</span><span class="label">Instructions to the Paying/Accepting/Negotiating Bank</span>
                                    <textarea cols="65" rows="12" maxlength="780" wrap="hard" style="resize:none;" name="_450_of78_instructions_of_paying" id="_450_of78_instructions_of_paying"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_450_of78_instructions_of_paying'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF57 -->
                                <div class="form-row"><span class="label_body">OF57</span><span class="label">'Advise Through' Bank</span>
                                    <select id="type_of57_advise_through_bank" name="type_of57_advise_through_bank">
                                        <option value="">choose a type</option> 
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="b">B - Party Identifier - Location</option> 
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of57a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_460_of57a_party_identifier" id="_460_of57a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_460_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_461_of57a_identifier_code" id="_461_of57a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_461_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of57b_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_462_of57b_party_identifier" id="_462_of57b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_462_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                            <input type="text" name="_463_of57b_location" id="_463_of57b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_463_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of57d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_464_of57d_party_identifier" id="_464_of57d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_464_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_465_of57d_name_address" id="_465_of57d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_465_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF72Z -->
                                <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_460_of72z_sender_to_receiver" id="_460_of72z_sender_to_receiver"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_460_of72z_sender_to_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>--%>
                                <!-- MF27 Sequence of Total -->
                                <div class="form-row"><span class="label_body">MF27</span><span class="label"><a style="color:red;text-decoration:none">*</a>Number</span>                                
                                    <input type="text" onkeypress="avoidSplChars(event)" name="_010_mf27_number" id="_010_mf27_number" class="mandatory" maxlength="1" size="1" input_type="MF27 Sequence of Total" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Total</span>
                                    <input type="text" onkeypress="avoidSplChars(event)" name="_011_mf27_total" id="_011_mf27_total" class="mandatory" maxlength="1" size="1" input_type="MF27 Sequence of Total" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF20 Sender's Reference -->
                                <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Sender's Reference</span>
                                    <input type="text" input_type="MF20 Sender Reference" location="Body" name="_020_mf20_sender_reference" id="_020_mf20_sender_reference" class="mandatory" onkeypress="avoidSplChars(event)" maxlength="16" minlength="1" pattern="[0-9a-zA-Z/\-?:().,\'\+ ]{1,16}" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                                              

                                <!-- MF21 Receiver's Reference -->
                                <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Receiver's Reference</span>
                                    <input type="text" name="_030_mf21_receiver_reference" id="_030_mf21_receiver_reference" class="mandatory" input_type="MF21 Receiver's Reference" location="Body" maxlength="16" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf21_receiver_reference'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF23 Issuing Bank's Reference -->
                                <div class="form-row"><span class="label_body">MF23</span><span class="label"><a style="color:red;text-decoration:none">*</a>Issuing Bank's Reference</span>
                                    <input type="text" name="_040_mf23_issuing_bank_reference" id="_040_mf23_issuing_bank_reference" class="mandatory" input_type="MF23 Issuing Bank's Reference" location="Body" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf23_issuing_bank_reference'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- OF52a Issuing Bank -->
                                <div class="form-row"><span class="label_body">OF52a</span><span class="label">Issuing Bank</span>
                                    <select id="type_of52_issuing_bank" name="type_of52_issuing_bank" input_type="OF52a Issuing Bank" location="Body">
                                        <option value="">choose a type</option>
                                        <option value="A">Option A (BIC)</option>
                                        <option value="D">Option D (Name &amp; Address)</option>
                                    </select>
                                </div>

                                <div id="div_050_of52a_A" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_051_of52a_party_identifier" name="_051_of52a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of52a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                                        <input type="text" id="_052_of52a_identifier_code" name="_052_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of52a_identifier_code'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                    </div>
                                </div>

                                <div id="div_050_of52a_D" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_053_of52a_party_identifier" name="_053_of52a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of52a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                                        <textarea id="_054_of52a_name_address" name="_054_of52a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of52a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <hr/>

                                <!-- OF50B Non-Bank Issuer -->
                                <div class="form-row"><span class="label_body">OF50B</span><span class="label">Non-Bank Issuer</span>
                                    <textarea name="_060_of50b_non_bank_issuer" id="_060_of50b_non_bank_issuer" rows="4" maxlength="140" input_type="OF50B Non-Bank Issuer" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of50b_non_bank_issuer'}"><c:out value="${item.detail}"/></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- MF31C Date of Issue -->
                                <div class="form-row"><span class="label_body">MF31C</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Issue</span>
                                    <input type="text" name="_070_mf31c_date_of_issue" id="_070_mf31c_date_of_issue" class="mandatory" input_type="MF31C Date of Issue" location="Body" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf31c_date_of_issue'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF26E Number of Amendment -->
                                <div class="form-row"><span class="label_body">MF26E</span><span class="label"><a style="color:red;text-decoration:none">*</a>Number of Amendment</span>
                                    <input type="text" name="_080_mf26e_number_of_amendment" id="_080_mf26e_number_of_amendment" class="mandatory" input_type="MF26E Number of Amendment" location="Body" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf26e_number_of_amendment'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF30 Date of Amendment -->
                                <div class="form-row"><span class="label_body">MF30</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Amendment</span>
                                    <input type="text" name="_090_mf30_date_of_amendment" id="_090_mf30_date_of_amendment" class="mandatory" input_type="MF30 Date of Amendment" location="Body" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf30_date_of_amendment'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF22A Purpose of Message -->
                                <div class="form-row"><span class="label_body">MF22A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Purpose of Message</span>
                                    <select name="_100_mf22a_purpose_of_message" id="_100_mf22a_purpose_of_message" class="mandatory" input_type="MF22A Purpose of Message" location="Body">
                                        <option value="">choose a type</option>
                                        <option value="ACNF" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ACNF'}"> selected="true" </c:if></c:if></c:forEach>>ACNF - Advice &amp; Confirmation</option>
                                        <option value="ADVI" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ADVI'}"> selected="true" </c:if></c:if></c:forEach>>ADVI - Advice</option>
                                        <option value="ISSU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ISSU'}"> selected="true" </c:if></c:if></c:forEach>>ISSU - Issuance</option>
                                    </select>
                                </div>
                                <hr/>

                                <!-- OF23S Cancellation Request -->
                                <div class="form-row"><span class="label_body">OF23S</span><span class="label">Cancellation Request</span>
                                    <select name="_110_of23s_cancellation_request" id="_110_of23s_cancellation_request">
                                        <option value="">choose a type</option>
                                        <option value="CANCEL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of23s_cancellation_request'}"><c:if test="${item.detail=='CANCEL'}"> selected="true" </c:if></c:if></c:forEach>>CANCEL - Request to cancel the instrument</option>
                                    </select>
                                </div>
                                <hr/>

                                <!-- OF40A Form of Documentary Credit -->
                                <div class="form-row"><span class="label_body">OF40A</span><span class="label">Form of Documentary Credit</span>
                                    <select name="_120_of40a_form_of_documentary_credit" id="_120_of40a_form_of_documentary_credit">
                                        <option value="">choose a type</option>
                                        <option value="IRREVOCABLE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of40a_form_of_documentary_credit'}"><c:if test="${item.detail=='IRREVOCABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE</option>
                                        <option value="IRREVOCABLE TRANSFERABLE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of40a_form_of_documentary_credit'}"><c:if test="${item.detail=='IRREVOCABLE TRANSFERABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE TRANSFERABLE</option>
                                    </select>
                                </div>
                                <hr/>

                                <!-- OF40E Applicable Rules -->
                                <div class="form-row"><span class="label_body">OF40E</span><span class="label">Applicable Rules</span>
                                    <select name="_130_of40e_applicable_rules" id="_130_of40e_applicable_rules">
                                        <option value="">choose a type</option>
                                        <option value="UCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='UCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCP LATEST VERSION</option>
                                        <option value="UCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='UCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCPURR LATEST VERSION</option>
                                        <option value="EUCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='EUCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCP LATEST VERSION</option>
                                        <option value="EUCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='EUCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCPURR LATEST VERSION</option>
                                        <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of40e_applicable_rules'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR - Other (must specify Narrative)</option>
                                    </select>
                                </div>

                                <div id="div_130_of40e_narrative" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative (if OTHR)</span>
                                        <textarea name="_131_of40e_narrative" id="_131_of40e_narrative" rows="2" maxlength="35"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_131_of40e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <hr/>

                                <!-- OF31D Date and Place of Expiry -->
                                <div class="form-row"><span class="label_body">OF31D</span><span class="label">Date of Expiry</span>
                                    <input type="text" name="_140_of31d_date_of_expiry" id="_140_of31d_date_of_expiry" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of31d_date_of_expiry'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Place of Expiry</span>
                                    <input type="text" name="_141_of31d_place_of_expiry" id="_141_of31d_place_of_expiry" maxlength="29" placeholder="Place" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_of31d_place_of_expiry'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- OF50 Changed Applicant Details -->
                                <div class="form-row"><span class="label_body">OF50</span><span class="label">Changed Applicant Details</span>
                                    <textarea name="_150_of50_changed_applicant_details" id="_150_of50_changed_applicant_details" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of50_changed_applicant_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF59 Beneficiary -->
                                <div class="form-row"><span class="label_body">OF59</span><span class="label">Beneficiary</span>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                    <input type="text" name="_160_of59_account" id="_160_of59_account" maxlength="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)"/>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                    <textarea name="_161_of59_name_address" id="_161_of59_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_of59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF32B Increase of Documentary Credit Amount -->
                                <div class="form-row"><span class="label_body">OF32B</span><span class="label">Increase of Documentary Credit Amount</span>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_170_of32b_currency" id="_170_of32b_currency" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_171_of32b_amount" id="_171_of32b_amount" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_170_of32b_currency');" />
                                    <font style="margin-left: 50px"></font>
                                    <script>
                                        function formatUang(n, currency) {
                                            if (isNaN(n)) { return ""; }
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_171_of32b_amount').value;
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
                                

                                <!-- OF33B Decrease of Documentary Credit Amount -->                            
                                <div class="form-row"><span class="label_body">OF33B</span><span class="label">Decrease of Documentary Credit Amount</span>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_180_of33b_currency" id="_180_of33b_currency" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_181_of33b_amount" id="_181_of33b_amount" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_180_of33b_currency');" />
                                    <font style="margin-left: 50px"></font>
                                    <script>
                                        function formatUang(n, currency) {
                                            if (isNaN(n)) { return ""; }
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_181_of33b_amount').value;
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
                                            <input type="text" name="_190_of39a_percentage_credit_amount_tolerance1" id="_190_of39a_percentage_credit_amount_tolerance1" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of39a_percentage_credit_amount_tolerance1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 2</span>
                                            <input type="text" name="_191_of39a_percentage_credit_amount_tolerance2" id="_191_of39a_percentage_credit_amount_tolerance2" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_191_of39a_percentage_credit_amount_tolerance2'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>

                                <!-- OF39C Additional Amounts Covered -->
                                <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                                    <textarea name="_200_of39c_additional_amounts_covered" id="_200_of39c_additional_amounts_covered" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of39c_additional_amounts_covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF41a Available With ... By ... -->
                                <div class="form-row"><span class="label_body">OF41a</span><span class="label">Available With ... By ...</span>
                                        <select id="type_of41_available_with_by" name="type_of41_available_with_by">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Identifier Code - Code</option> <!-- - Ordering Customer-->
                                            <option value="d">D - Name and Address - Code</option>
                                        </select>
                                        <div id="div_of41a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_211_of41a_party_identifier" id="_211_mf41a_party_identifier" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_211_of41a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Code</span>
                                                <select id="_212_of41a_code" name="_212_of41a_code">
                                                    <option value="">choose a code</option>
                                                    <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_212_of41a_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option> <!-- - Ordering Customer-->
                                                    <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_212_of41a_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                                    <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_212_of41a_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                                    <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_212_of41a_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                                    <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_212_of41a_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div id="div_of41d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_213_of41d_name_and_address" id="_213_of41d_name_and_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_213_of41d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Code</span>
                                                <select id="_214_of41d_code" name="_214_of41d_code">
                                                    <option value="">choose a type</option>
                                                    <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_214_of41d_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option>
                                                    <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_214_of41d_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                                    <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_214_of41d_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                                    <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_214_of41d_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                                    <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_214_of41d_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                <!-- OF42C Drafts at ... -->
                                <div class="form-row"><span class="label_body">OF42C</span><span class="label">Drafts at ...</span>
                                    <textarea name="_220_of42c_drafts_at" id="_220_of42c_drafts_at" rows="3" maxlength="105"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of42c_drafts_at'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF42a Drawee -->
                                <div class="form-row"><span class="label_body">OF42a</span><span class="label">Drawee</span>
                                    <select id="_230_of42a_drawee" name="_230_of42a_drawee">
                                        <option value="">choose a type</option>
                                        <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of42a_drawee'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (Identifier Code)</option>
                                        <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of42a_drawee'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                                    </select>
                                </div>
                                <div id="div_230_of42a_A" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_231_of42a_party_identifier" name="_231_of42a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_231_of42a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                                        <input type="text" id="_232_of42a_identifier_code" name="_232_of42a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_232_of42a_identifier_code'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_230_of42a_D" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_233_of42a_party_identifier" name="_233_of42a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_233_of42a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                                        <textarea id="_234_of42a_name_address" name="_234_of42a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_234_of42a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <hr/>

                                <!-- OF42M Mixed Payment Details -->
                                <div class="form-row"><span class="label_body">OF42M</span><span class="label">Mixed Payment Details</span>
                                    <textarea name="_240_of42m_mixed_payment_details" id="_240_of42m_mixed_payment_details" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of42m_mixed_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF42P Negotiation/Deferred Payment Details -->
                                <div class="form-row"><span class="label_body">OF42P</span><span class="label">Negotiation / Deferred Payment Details</span>
                                    <textarea name="_250_of42p_negotiation_deferred_payment_details" id="_250_of42p_negotiation_deferred_payment_details" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of42p_negotiation_deferred_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF43P Partial Shipments -->
                                <div class="form-row"><span class="label_body">OF43P</span><span class="label">Partial Shipments</span>
                                    <select id="_260_of43p_partial_shipments" name="_260_of43p_partial_shipments">
                                        <option value="">choose a type</option>
                                        <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of43p_partial_shipments'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option>
                                        <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of43p_partial_shipments'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                                        <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of43p_partial_shipments'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                                    </select>
                                </div>
                                <hr/>

                                <!-- OF43T Transhipment -->
                                <div class="form-row"><span class="label_body">OF43T</span><span class="label">Transhipment</span>
                                    <select id="_270_of43t_transhipment" name="_270_of43t_transhipment">
                                        <option value="">choose a type</option>
                                        <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of43t_transhipment'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option>
                                        <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of43t_transhipment'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                                        <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of43t_transhipment'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                                    </select>
                                </div>
                                <hr/>

                                <!-- OF44A Place of Taking in Charge / Dispatch from / Place of Receipt -->
                                <div class="form-row"><span class="label_body">OF44A</span><span class="label">Place of Taking in Charge / Dispatch from / Place of Receipt</span>
                                    <textarea name="_280_of44a_place_taking_in_charge_dispatch_from_place_of_receipt" id="_280_of44a_place_taking_in_charge_dispatch_from_place_of_receipt" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of44a_place_taking_in_charge_dispatch_from_place_of_receipt'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF44E Port of Loading / Airport of Departure -->
                                <div class="form-row"><span class="label_body">OF44E</span><span class="label">Port of Loading / Airport of Departure</span>
                                    <textarea name="_290_of44e_port_of_loading_airport_of_departure" id="_290_of44e_port_of_loading_airport_of_departure" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of44e_port_of_loading_airport_of_departure'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF44F Port of Discharge / Airport of Destination -->
                                <div class="form-row"><span class="label_body">OF44F</span><span class="label">Port of Discharge / Airport of Destination</span>
                                    <textarea name="_300_of44f_port_of_discharge_airport_of_destination" id="_300_of44f_port_of_discharge_airport_of_destination" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of44f_port_of_discharge_airport_of_destination'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF44B Place of Final Destination / For Transportation to / Place of Delivery -->
                                <div class="form-row"><span class="label_body">OF44B</span><span class="label">Place of Final Destination / For Transportation to / Place of Delivery</span>
                                    <textarea name="_310_of44b_place_of_final_destination_for_transportation_to_place_of_delivery" id="_310_of44b_place_of_final_destination_for_transportation_to_place_of_delivery" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of44b_place_of_final_destination_for_transportation_to_place_of_delivery'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF44C Latest Date of Shipment -->
                                <div class="form-row"><span class="label_body">OF44C</span><span class="label">Latest Date of Shipment</span>
                                    <input type="text" name="_320_of44c_latest_date_of_shipment" id="_320_of44c_latest_date_of_shipment" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of44c_latest_date_of_shipment'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- OF44D Shipment Period -->
                                <div class="form-row"><span class="label_body">OF44D</span><span class="label">Shipment Period</span>
                                    <textarea name="_330_of44d_shipment_period" id="_330_of44d_shipment_period" rows="6" maxlength="390"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of44d_shipment_period'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF45B Description of Goods and/or Services -->
                                <div class="form-row"><span class="label_body">OF45B</span><span class="label">Description of Goods and/or Services</span>
                                    <textarea name="_340_of45b_description_of_goods_and_or_services" id="_340_of45b_description_of_goods_and_or_services" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of45b_description_of_goods_and_or_services'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF46B Documents Required -->
                                <div class="form-row"><span class="label_body">OF46B</span><span class="label">Documents Required</span>
                                    <textarea name="_350_of46b_documents_required" id="_350_of46b_documents_required" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_of46b_documents_required'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF47B Additional Conditions -->
                                <div class="form-row"><span class="label_body">OF47B</span><span class="label">Additional Conditions</span>
                                    <textarea name="_360_of47b_additional_conditions" id="_360_of47b_additional_conditions" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of47b_additional_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF49M Special Payment Conditions for Beneficiary -->
                                <div class="form-row"><span class="label_body">OF49M</span><span class="label">Special Payment Conditions for Beneficiary</span>
                                    <textarea name="_370_of49m_special_payment_conditions_for_beneficiary" id="_370_of49m_special_payment_conditions_for_beneficiary" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_of49m_special_payment_conditions_for_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF49N Special Payment Conditions for Bank Only -->
                                <div class="form-row"><span class="label_body">OF49N</span><span class="label">Special Payment Conditions for Bank Only</span>
                                    <textarea name="_380_of49n_special_payment_conditions_for_bank_only" id="_380_of49n_special_payment_conditions_for_bank_only" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of49n_special_payment_conditions_for_bank_only'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF71D Charges -->
                                <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                                    <textarea name="_390_of71d_charges" id="_390_of71d_charges" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_of71d_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF71N Amendment Charge Payable By -->
                                <div class="form-row"><span class="label_body">OF71N</span><span class="label">Amendment Charge Payable By</span>
                                    <select id="_400_of71n_charge_code" name="_400_of71n_charge_code">
                                        <option value="">choose a type</option>
                                        <option value="APPL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_of71n_charge_code'}"><c:if test="${item.detail=='APPL'}"> selected="true" </c:if></c:if></c:forEach>>APPL - Applicant</option>
                                        <option value="BENE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_of71n_charge_code'}"><c:if test="${item.detail=='BENE'}"> selected="true" </c:if></c:if></c:forEach>>BENE - Beneficiary</option>
                                        <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_of71n_charge_code'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR - Other Party</option>
                                    </select>
                                </div>
                                <div id="div_400_of71n_narrative" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative (only if OTHR)</span>
                                        <textarea name="_401_of71n_narrative" id="_401_of71n_narrative" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_401_of71n_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <hr/>

                                <!-- OF48 Period for Presentation in Days -->
                                <div class="form-row"><span class="label_body">OF48</span><span class="label">Period for Presentation in Days</span>
                                    <input type="text" id="_410_of48_days" name="_410_of48_days" maxlength="3" placeholder="Number of days" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of48_days'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                    <input type="text" id="_411_of48_narrative" name="_411_of48_narrative" maxlength="35" placeholder="e.g. from invoice date" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_411_of48_narrative'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- OF49 Confirmation Instructions -->
                                <div class="form-row"><span class="label_body">OF49</span><span class="label">Confirmation Instructions</span>
                                    <select id="_420_of49_confirmation_instructions" name="_420_of49_confirmation_instructions">
                                        <option value="">choose a type</option>
                                        <option value="CONFIRM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_of49_confirmation_instructions'}"><c:if test="${item.detail=='CONFIRM'}"> selected="true" </c:if></c:if></c:forEach>>CONFIRM - Confirmation requested</option>
                                        <option value="MAY ADD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_of49_confirmation_instructions'}"><c:if test="${item.detail=='MAY ADD'}"> selected="true" </c:if></c:if></c:forEach>>MAY ADD - Confirmation may be added</option>
                                        <option value="WITHOUT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_of49_confirmation_instructions'}"><c:if test="${item.detail=='WITHOUT'}"> selected="true" </c:if></c:if></c:forEach>>WITHOUT - No confirmation requested</option>
                                    </select>
                                </div>
                                <hr/>

                                <!-- OF58a Requested Confirmation Party -->
                                <div class="form-row"><span class="label_body">OF58a</span><span class="label">Requested Confirmation Party</span>
                                    <select id="_430_of58a_requested_confirmation_party" name="_430_of58a_requested_confirmation_party">
                                        <option value="">choose a type</option>
                                        <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_of58a_requested_confirmation_party'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                                        <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_of58a_requested_confirmation_party'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                                    </select>
                                </div>
                                <div id="div_430_of58a_A" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_431_of58a_party_identifier" name="_431_of58a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_431_of58a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                                        <input type="text" id="_432_of58a_identifier_code" name="_432_of58a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_432_of58a_identifier_code'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_430_of58a_D" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_433_of58a_party_identifier" name="_433_of58a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_433_of58a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                                        <textarea id="_434_of58a_name_address" name="_434_of58a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_434_of58a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <hr/>

                                <!-- OF53a Reimbursing Bank -->
                                <div class="form-row"><span class="label_body">OF53a</span><span class="label">Reimbursing Bank</span>
                                    <select id="_440_of53a_reimbursing_bank" name="_440_of53a_reimbursing_bank">
                                        <option value="">choose a type</option>
                                        <option value="A" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of53a_reimbursing_bank'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                                        <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of53a_reimbursing_bank'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                                    </select>
                                </div>
                                <div id="div_440_of53a_A" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_441_of53a_party_identifier" name="_441_of53a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_441_of53a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                                        <input type="text" id="_442_of53a_identifier_code" name="_442_of53a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_442_of53a_identifier_code'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_440_of53a_D" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_443_of53a_party_identifier" name="_443_of53a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_443_of53a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                                        <textarea id="_444_of53a_name_address" name="_444_of53a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_444_of53a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <hr/>

                                <!-- OF78 Instructions to the Paying/Accepting/Negotiating Bank -->
                                <div class="form-row"><span class="label_body">OF78</span><span class="label">Instructions to the Paying/Accepting/Negotiating Bank</span>
                                    <textarea name="_450_of78_instructions_to_the_paying_accepting_negotiating_bank" id="_450_of78_instructions_to_the_paying_accepting_negotiating_bank" rows="12" maxlength="780"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_450_of78_instructions_to_the_paying_accepting_negotiating_bank'}"><c:out value="${item.detail}"/></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF57a 'Advise Through' Bank -->
                                <div class="form-row"><span class="label_body">OF57a</span><span class="label">'Advise Through' Bank</span>
                                    <select id="type_of57a_issuing_bank" name="type_of57a_issuing_bank">
                                        <option value="">choose a type</option>
                                        <option value="A">Option A (BIC)</option>
                                        <option value="B">Option B (Location)</option>
                                        <option value="D">Option D (Name &amp; Address)</option>
                                    </select>
                                </div>
                                <div id="div_460_of57a_A" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_461_of57a_party_identifier" name="_461_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_461_of57a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                                        <input type="text" id="_462_of57a_identifier_code" name="_462_of57a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_462_of57a_identifier_code'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_460_of57a_B" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_463_of57a_party_identifier" name="_463_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_463_of57a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" id="_464_of57a_location" name="_464_of57a_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_464_of57a_location'}"><c:out value="${item.detail}"/></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_460_of57a_D" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_465_of57a_party_identifier" name="_465_of57a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_465_of57a_party_identifier'}"><c:out value="${item.detail}"/></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                                        <textarea id="_466_of57a_name_address" name="_466_of57a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_466_of57a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <hr/>

                                <!-- OF72Z Sender to Receiver Information -->
                                <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                    <textarea name="_470_of72z_sender_to_receiver_information" id="_470_of72z_sender_to_receiver_information" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_470_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}"/></c:if></c:forEach></textarea>
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