<%--
    Document   : mt102
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt102.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:102'}">
            <div id="judul">MT 102 Multiple Customer Credit Transfer</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="102" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li><a href="#" rel="view1">Header</a></li>
                        <li><a href="#" rel="view2">Body</a></li>
                        <li><a href="#" rel="view3">Comment</a></li>
                        <li><a href="#" rel="view4">Histories</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <h2>Mandatory Sequence A General Information</h2>
                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sender's Reference</span>
                                <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- MF23 -->
                                    <div class="form-row"><span class="label_body">MF23</span><span class="label">*Bank Operation Code</span>
                                        <input type="text" name="_011_mf23_" id="_011_mf23_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf23_'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- OF26T -->
                                    <div class="form-row"><span class="label_body">OF26T</span><span class="label">Transaction Type Code</span>
                                        <input type="text" name="_028_of26t_transaction_type_code" id="_028_of26t_transaction_type_code" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_028_of26t_transaction_type_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- OF71A -->
                                    <div class="form-row"><span class="label_body">OF71A</span><span class="label">Details of Charges</span>
                                        <input type="text" name="_030_of71a_details_charges" id="_030_of71a_details_charges" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of71a_details_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <h2>End of Sequence A General Information</h2>
                                    <hr/>

                                    <h2>Mandatory Repetitive Sequence B Transaction Details</h2>
                                    <hr/>

                                    <!-- MF21 -->
                                    <div class="form-row"><span class="label_body">MF21</span><span class="label">*Transaction Reference</span>
                                        <input type="text" name="_040_mf21_" id="_040_mf21_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf21_'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- MF32B -->
                                    <div class="form-row"><span class="label_body">MF32B</span><span class="label">*Transaction Currency</span>
                                        <input type="text" name="_041_mf32b_currency" id="_041_mf32b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_042_mf32b_amount" id="_042_mf32b_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- OF50 -->
                                    <div class="form-row"><span class="label_body">OF50</span><span class="label">Ordering Customer</span>
                                        <select id="type_of50_seq_b" name="type_of50_seq_b">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Ordering Customer - BIC</option>
                                            <option value="f">F - Ordering Customer - ID</option>
                                            <option value="k">K - Ordering Customer - Name and Address</option>
                                        </select>
                                        <div id="div_of50a_seq_b">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                <input type="text" name="_050_of50a_account" id="_050_of50a_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of50a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_051_of50a_identifier_code" id="_051_of50a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of50a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_052_of50a_address" id="_052_of50a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of50a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of50f_seq_b">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identifier</span>
                                                <input type="text" name="_053_of50f_party_identifier" id="_053_of50f_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of50f_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea name="_054_of50f_name_address" id="_054_of50f_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of50f_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of50k_seq_b">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                <input type="text" name="_055_of50k_account" id="_055_of50k_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_055_of50k_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea name="_056_of50k_name_address" id="_056_of50k_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_056_of50k_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF52 -->
                                    <div class="form-row"><span class="label_body">OF52</span><span class="label">Ordering Institution</span>
                                        <select id="type_of52_seq_b" name="type_of52_seq_b">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Ordering Institution - BIC</option>
                                            <option value="b">B - Ordering Institution - Location</option>
                                            <option value="c">C - Ordering Institution</option>
                                        </select>
                                        <div id="div_of52a_seq_b">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_060_of52a_party_identifier" id="_060_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_061_of52a_identifier_code" id="_061_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_062_of52a_address" id="_062_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of52b_seq_b">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_063_of52b_party_identifier" id="_063_of52b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of52b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                <input type="text" name="_064_of52b_location" id="_064_of52b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of52b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                        <div id="div_of52c_seq_b">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identifier</span>
                                                <input type="text" name="_065_of52c_party_identifier" id="_065_of52c_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of52c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF57 -->
                                    <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Institution</span>
                                        <select id="type_of57_seq_b" name="type_of57_seq_b">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Account With Institution - BIC</option>
                                            <option value="c">C - Account With Institution</option>
                                        </select>
                                        <div id="div_of57a_seq_b">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_070_of57a_party_identifier" id="_070_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_071_of57a_identifier_code" id="_071_of57a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_072_of57a_address" id="_072_of57a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of57a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of57c_seq_b">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identifier</span>
                                                <input type="text" name="_073_of57c_party_identifier" id="_073_of57c_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of57c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- M59/59A -->
                                    <div class="form-row"><span class="label_body">M59/59A</span><span class="label">Beneficiary Customer</span>
                                        <select id="type_of59_59a_seq_b" name="type_of59_59a_seq_b">
                                            <option value="">choose a type</option>
                                            <option value="59">1 - Field 59</option>
                                            <option value="59a">2 - Field 59A</option>
                                        </select>
                                        <div id="div_mf59_seq_b">
                                            <div class="form-row"><span class="label_body">MF59</span><span class="label">Account</span>
                                                <input type="text" name="_080_mf59_account" id="_080_mf59_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea name="_081_mf59_name_address" id="_081_mf59_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_mf59a_seq_b">
                                            <div class="form-row"><span class="label_body">MF59A</span><span class="label">Account</span>
                                                <input type="text" name="_082_mf59a_account" id="_082_mf59a_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_mf59a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_083_mf59a_identifier_code" id="_083_mf59a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf59a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_084_mf59a_address" id="_084_mf59a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_mf59a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF70 -->
                                    <div class="form-row"><span class="label_body">OF70</span><span class="label">Remittance Information</span>
                                        <textarea name="_090_of70_remittance_information" id="_090_of70_remittance_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of70_remittance_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>

                                    <!-- OF77B -->
                                    <div class="form-row"><span class="label_body">OF77B</span><span class="label">Regulatory Reporting</span>
                                        <textarea name="_092_of77b_regulatory_reporting" id="_092_of77b_regulatory_reporting" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of77b_regulatory_reporting'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>
                                    <!-- sequence 2 -->
                                    <!-- MF21 -->
                                    <div class="form-row"><span class="label_body">MF21</span><span class="label">*Transaction Reference</span>
                                        <input type="text" name="_100_mf21_" id="_100_mf21_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf21_'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- MF32B -->
                                    <div class="form-row"><span class="label_body">MF32B</span><span class="label">*Transaction Currency</span>
                                        <input type="text" name="_101_mf32b_currency" id="_101_mf32b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_102_mf32b_amount" id="_102_mf32b_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- OF50 -->
                                    <div class="form-row"><span class="label_body">OF50</span><span class="label">Ordering Customer</span>
                                        <select id="type_of50_seq_b_2" name="type_of50_seq_b_2">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Ordering Customer - BIC</option>
                                            <option value="f">F - Ordering Customer - ID</option>
                                            <option value="k">K - Ordering Customer - Name and Address</option>
                                        </select>
                                        <div id="div_of50a_seq_b_2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                <input type="text" name="_110_of50a_account" id="_110_of50a_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of50a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_111_of50a_identifier_code" id="_111_of50a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_of50a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_112_of50a_address" id="_112_of50a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_112_of50a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of50f_seq_b_2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identifier</span>
                                                <input type="text" name="_113_of50f_party_identifier" id="_113_of50f_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_113_of50f_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea name="_114_of50f_name_address" id="_114_of50f_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_114_of50f_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of50k_seq_b_2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                <input type="text" name="_115_of50k_account" id="_115_of50k_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_115_of50k_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea name="_116_of50k_name_address" id="_116_of50k_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_116_of50k_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF52 -->
                                    <div class="form-row"><span class="label_body">OF52</span><span class="label">Ordering Institution</span>
                                        <select id="type_of52_seq_b_2" name="type_of52_seq_b_2">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Ordering Institution - BIC</option>
                                            <option value="b">B - Ordering Institution - Location</option>
                                            <option value="c">C - Ordering Institution</option>
                                        </select>
                                        <div id="div_of52a_seq_b_2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_120_of52a_party_identifier" id="_120_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_121_of52a_identifier_code" id="_121_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_122_of52a_address" id="_122_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_122_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of52b_seq_b_2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_123_of52b_party_identifier" id="_123_of52b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_123_of52b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                <input type="text" name="_124_of52b_location" id="_124_of52b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_124_of52b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                        <div id="div_of52c_seq_b_2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identifier</span>
                                                <input type="text" name="_125_of52c_party_identifier" id="_125_of52c_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_125_of52c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF57 -->
                                    <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Institution</span>
                                        <select id="type_of57_seq_b_2" name="type_of57_seq_b_2">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Account With Institution - BIC</option>
                                            <option value="c">C - Account With Institution</option>
                                        </select>
                                        <div id="div_of57a_seq_b_2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_130_of57a_party_identifier" id="_130_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_131_of57a_identifier_code" id="_131_of57a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_131_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_132_of57a_address" id="_132_of57a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_132_of57a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of57c_seq_b_2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identifier</span>
                                                <input type="text" name="_133_of57c_party_identifier" id="_133_of57c_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_133_of57c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- M59/59A -->
                                    <div class="form-row"><span class="label_body">M59/59A</span><span class="label">Beneficiary Customer</span>
                                        <select id="type_of59_59a_seq_b_2" name="type_of59_59a_seq_b_2">
                                            <option value="">choose a type</option>
                                            <option value="59">1 - Field 59</option>
                                            <option value="59a">2 - Field 59A</option>
                                        </select>
                                        <div id="div_mf59_seq_b_2">
                                            <div class="form-row"><span class="label_body">MF59</span><span class="label">Account</span>
                                                <input type="text" name="_140_mf59_account" id="_140_mf59_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_mf59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea name="_141_mf59_name_address" id="_141_mf59_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_mf59a_seq_b_2">
                                            <div class="form-row"><span class="label_body">MF59A</span><span class="label">Account</span>
                                                <input type="text" name="_142_mf59a_account" id="_142_mf59a_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_142_mf59a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_143_mf59a_identifier_code" id="_143_mf59a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_143_mf59a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_144_mf59a_address" id="_144_mf59a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_144_mf59a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF70 -->
                                    <div class="form-row"><span class="label_body">OF70</span><span class="label">Remittance Information</span>
                                        <textarea name="_150_of70_remittance_information" id="_150_of70_remittance_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of70_remittance_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>

                                    <!-- OF77B -->
                                    <div class="form-row"><span class="label_body">OF77B</span><span class="label">Regulatory Reporting</span>
                                        <textarea name="_152_of77b_regulatory_reporting" id="_152_of77b_regulatory_reporting" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_152_of77b_regulatory_reporting'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>
                                    <!-- end s2 -->
                                    
                                    <!-- sequence 3 -->
                                    <!-- MF21 -->
                                    <div class="form-row"><span class="label_body">MF21</span><span class="label">*Transaction Reference</span>
                                        <input type="text" name="_160_mf21_" id="_160_mf21_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_mf21_'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- MF32B -->
                                    <div class="form-row"><span class="label_body">MF32B</span><span class="label">*Transaction Currency</span>
                                        <input type="text" name="_161_mf32b_currency" id="_161_mf32b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_162_mf32b_amount" id="_162_mf32b_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- OF50 -->
                                    <div class="form-row"><span class="label_body">OF50</span><span class="label">Ordering Customer</span>
                                        <select id="type_of50_seq_b_3" name="type_of50_seq_b_3">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Ordering Customer - BIC</option>
                                            <option value="f">F - Ordering Customer - ID</option>
                                            <option value="k">K - Ordering Customer - Name and Address</option>
                                        </select>
                                        <div id="div_of50a_seq_b_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                <input type="text" name="_170_of50a_account" id="_170_of50a_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of50a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_171_of50a_identifier_code" id="_171_of50a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of50a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_172_of50a_address" id="_172_of50a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_of50a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of50f_seq_b_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identifier</span>
                                                <input type="text" name="_173_of50f_party_identifier" id="_173_of50f_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_of50f_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea name="_174_of50f_name_address" id="_174_of50f_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_of50f_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of50k_seq_b_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                                <input type="text" name="_175_of50k_account" id="_175_of50k_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_175_of50k_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea name="_176_of50k_name_address" id="_176_of50k_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_176_of50k_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF52 -->
                                    <div class="form-row"><span class="label_body">OF52</span><span class="label">Ordering Institution</span>
                                        <select id="type_of52_seq_b_3" name="type_of52_seq_b_3">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Ordering Institution - BIC</option>
                                            <option value="b">B - Ordering Institution - Location</option>
                                            <option value="c">C - Ordering Institution</option>
                                        </select>
                                        <div id="div_of52a_seq_b_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_180_of52a_party_identifier" id="_180_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_181_of52a_identifier_code" id="_181_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_182_of52a_address" id="_182_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_182_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of52b_seq_b_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_183_of52b_party_identifier" id="_183_of52b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_183_of52b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                <input type="text" name="_184_of52b_location" id="_184_of52b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_of52b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                        <div id="div_of52c_seq_b_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identifier</span>
                                                <input type="text" name="_185_of52c_party_identifier" id="_185_of52c_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_185_of52c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF57 -->
                                    <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Institution</span>
                                        <select id="type_of57_seq_b_3" name="type_of57_seq_b_3">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Account With Institution - BIC</option>
                                            <option value="c">C - Account With Institution</option>
                                        </select>
                                        <div id="div_of57a_seq_b_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_190_of57a_party_identifier" id="_190_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_191_of57a_identifier_code" id="_191_of57a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_191_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_192_of57a_address" id="_192_of57a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_192_of57a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of57c_seq_b_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identifier</span>
                                                <input type="text" name="_193_of57c_party_identifier" id="_193_of57c_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_193_of57c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- M59/59A -->
                                    <div class="form-row"><span class="label_body">M59/59A</span><span class="label">Beneficiary Customer</span>
                                        <select id="type_of59_59a_seq_b_3" name="type_of59_59a_seq_b_3">
                                            <option value="">choose a type</option>
                                            <option value="59">1 - Field 59</option>
                                            <option value="59a">2 - Field 59A</option>
                                        </select>
                                        <div id="div_mf59_seq_b_3">
                                            <div class="form-row"><span class="label_body">MF59</span><span class="label">Account</span>
                                                <input type="text" name="_200_mf59_account" id="_200_mf59_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_mf59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea name="_201_mf59_name_address" id="_201_mf59_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_201_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_mf59a_seq_b_3">
                                            <div class="form-row"><span class="label_body">MF59A</span><span class="label">Account</span>
                                                <input type="text" name="_202_mf59a_account" id="_202_mf59a_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_202_mf59a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_203_mf59a_identifier_code" id="_203_mf59a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_203_mf59a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_204_mf59a_address" id="_204_mf59a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_204_mf59a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF70 -->
                                    <div class="form-row"><span class="label_body">OF70</span><span class="label">Remittance Information</span>
                                        <textarea name="_210_of70_remittance_information" id="_210_of70_remittance_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of70_remittance_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>

                                    <!-- OF77B -->
                                    <div class="form-row"><span class="label_body">OF77B</span><span class="label">Regulatory Reporting</span>
                                        <textarea name="_212_of77b_regulatory_reporting" id="_212_of77b_regulatory_reporting" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_212_of77b_regulatory_reporting'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>
                                    <!-- end s3 -->

                                    <h2>End of Mandatory Repetitive Sequence B Transaction Details</h2>
                                    <hr/>

                                    <h2>Mandatory Sequence C Settlement Details</h2>
                                    <hr/>

                                    <!-- MF32A -->
                                    <div class="form-row"><span class="label_body">MF32A</span><span class="label">*Value Date</span>
                                        <input type="text" name="_300_mf32a_date" id="_300_mf32a_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                        <input type="text" name="_301_mf32a_currency" id="_301_mf32a_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_301_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_302_mf32a_amount" id="_302_mf32a_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_302_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    <!--//untuk menampilkan uang dalam block ditambahkan pada 20151007-->      
                                    <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_302_mf32a_amount').value;
                                            var number2r = number2.replace(',', '.');
                                            var number2F = parseFloat(number2r);
                                            var nominal = formatUang(number2F, "");
                                            var nominalStyle = nominal.fontsize(5);
                                            var nominalStylec = nominalStyle.fontcolor("red");
                                            //var nominalStylecw = nominalStylec.fontWeight("900");
                                            document.write(nominalStylec);
                                        </script>
                                    </div>
                                    <hr/>

                                    <!-- OF53 -->
                                    <div class="form-row"><span class="label_body">OF53</span><span class="label">Sender's Correspondent</span>
                                        <select id="type_of53_seq_c" name="type_of53_seq_c">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Sender's Correspondent - BIC</option>
                                            <option value="c">C - Sender's Correspondent - Account</option>
                                        </select>
                                        <div id="div_of53a_seq_c">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_310_of53a_party_identifier" id="_310_of53a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_311_of53a_identifier_code" id="_311_of53a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_311_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_312_of53a_address" id="_312_of53a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_312_of53a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of53c_seq_c">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Account</span>
                                                <input type="text" name="_313_of53c_account" id="_313_of53c_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_313_of53c_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF54A -->
                                    <div class="form-row"><span class="label_body">OF54A</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_320_of54a_party_identifier" id="_320_of54a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_321_of54a_identifier_code" id="_321_of54a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_321_of54a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_322_of54a_address" id="_322_of54a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_322_of54a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>

                                    <!-- OF72 -->
                                    <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                        <textarea name="_330_of72_sender_receiver_information" id="_330_of72_sender_receiver_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of72_sender_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <hr/>

                                </div>
                                <div id="view3" class="tabcontent">
                            <%@ include file="comment_mt.jsp" %>
                        </div>
                        <div id="view4" class="tabcontent">
                            <%@ include file="history_mt.jsp" %>
                        </div>
                                                
                    </div>
                </div>
                        <%@ include file="button_action.jsp" %>
            </form>
        </c:if>
    </c:forEach>    
</div>
