<%-- 
    Document   : mt103
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : Abdul Rojak
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt400.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:400'}">
            <div id="judul">MT 400 Advice of Payment</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="400" />
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

                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sending Bank TRN</span>
                                <input type="text" name="_010_mf20_sending_bank_trn" id="_010_mf20_sending_bank_trn" maxlength="16" minlength ="1" size="16"value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sending_bank_trn'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF23B -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*related Reference</span>
                                <input type="text" name="_020_mf21_related_reference" id="_020_mf21_related_reference" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--MF32-->
                            <div class="form-row"><span class="label_body">MF32</span><span class="label">Amount Collected</span>
                                <select id="type_mf32_amount_collected" name="type_mf32_amount_collected">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - Date, Currency, Amount</option>
                                    <option value="b">B - Currency - Amount</option>
                                    <option value="k">K - Days Month - Number of Days Months - Code - Currency - Amount</option>
                                </select>
                                <div id="div_mf32a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" name="_031_mf32a_date" id="_031_mf32a_date" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" name="_032_mf32a_currency" id="_032_mf32a_currency" maxlength="3" minlength="3" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_033_mf32a_amount" id="_033_mf32a_amount" maxlength="15" minlength="1" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>

                                </div>
                                <div id="div_mf32b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" name="_034_mf32b_currency" id="_034_mf32b_currency" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_034_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_035_mf32b_amount" id="_035_mf32b_amount" maxlength="15" minlength="1" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>
                                </div>

                                <div id="div_mf32k">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*DaysMonth</span>
                                        <select id="_036_mf32k_daysmonth" name="_036_mf32k_daysmonth">
                                            <option value=""></option>
                                            <option value="days">DAYS</option>
                                            <option value="month">MONTH</option>
                                        </select>
                                    </div>
                               
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*NumberOfDaysMonth</span>
                                    <input type="text" name="_037_mf32k_numberofdaysmonth" id="_037_mf32k_numberofdaysmonth" maxlength="2" minlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_037_mf32k_numberofdaysmonth'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>

                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                    <select id="_038_mf32k_code" name="_038_mf32k_code">
                                        <option value=""></option>
                                        <option value="days">DAYS</option>
                                        <option value="month">MONTH</option>
                                    </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                    <input type="text" name="_039_mf32k_currency" id="_039_mf32k_currency" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_039_mf32k_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                    <input type="text" name="_040_mf32k_amount" id="_040_mf32k_amount" maxlength="15" minlength="1" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf32k_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                     </div>
                            </div>
                            <hr/>

                            <!--mf33A-->
                            <div class="form-row"><span class="label_body">MF33A</span><span class="label">Proceeds Remitted</span>
                                <select id="type_mf33a_a_proceeds_remitted" name="type_mf33a_a_proceeds_remitted">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - Date, Currency, Amount</option>
                                </select>
                                <div id="div_mf33a_a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" name="_041_mf33a_a_date" id="_041_mf33a_a_date" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_mf33a_a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" name="_042_mf33a_a_currency" id="_042_mf33a_a_currency" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf33a_a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_043_mf33a_a_amount" id="_043_mf33a_a_amount" maxlength="15" minlength="1" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_mf33a_a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--of52-->
                            <div class="form-row"><span class="label_body">OF52</span><span class="label">Ordering Bank</span>
                                <select id="type_of52_ordering_bank" name="type_of52_ordering_bank">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - Party Identifier - Identifier Code</option>
                                    <option value="d">D - Party Identifier - Name and Address </option>
                                </select>
                                <div id="div_of52a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_051_of52a_party_identifier" id="_051_of52a_party_identifier" maxlength="34" size ="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_052_of52a_identifier_code" id="_052_of52a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>
                                </div>
                                <div id="div_of52d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_053_of52d_party_identifier" id="_053_of52d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                         <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_054_of52d_name_address" id="_054_of52d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>

                                </div>
                            </div>
                            <hr/>

                            <!--of53A-->
                            <div class="form-row"><span class="label_body">OF53</span><span class="label">Senders Correspondent</span>
                                <select id="type_of53_senders_correspondent" name="type_of53_senders_correspondent">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - party Identifier - Identifier Code</option>
                                    <option value="b">B - Party Identifier - Location </option>
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of53a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_061_of53a_party_identifier" id="_061_of53a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_062_of53a_Identifier_code" id="_062_of53a_Identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of53a_Identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>
                                </div>
                                <div id="div_of53b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_063_of53b_party_identifier" id="_063_of53b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of53b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_064_of53b_location" id="_064_of53b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of53b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>
                                </div>
                                <div id="div_of53d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_065_of53d_party_identifier" id="_065_of53d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name And Address</span>
                                       <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_066_of53d_name_address" id="_066_of53d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_066_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <hr/>

                                <!--OF54-->
                                <div class="form-row"><span class="label_body">OF54</span><span class="label">Receiver's Correspondent</span>
                                    <select id="type_of54_receiver_correspondent" name="type_of54_receiver_correspondent">
                                        <option value="">CHOOSE A TYPE</option>
                                        <option value="a">A - party Identifier - Identifier Code</option>
                                        <option value="b">B - Party Identifier - Location </option>
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of54a">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_071_of54a_party_identifier" id="_071_of54a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_072_of54a_Identifier_code" id="_072_of54a_Identifier_code" maxlength="11" size="11"  value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of54a_Identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                        </div>
                                    </div>
                                    <div id="div_of54b">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_073_of54b_party_identifier" id="_073_of54b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of54b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                            <input type="text" name="_074_of54b_location" id="_074_of54b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_074_of54b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                        </div>
                                    </div>
                                    <div id="div_of54d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_075_of54d_party_identifier" id="_075_of54d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_075_of54d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name And Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_076_of54d_name_address" id="_076_of54d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_076_of54d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!--of57-->
                                    <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Bank</span>
                                        <select id="type_of57_account_with_bank" name="type_of57_account_with_bank">
                                            <option value="">CHOOSE A TYPE</option>
                                            <option value="a">A - Party Identifier - Identifier Code</option>
                                            <option value="d">D - Party Identifier - Name and Address </option>
                                        </select>
                                        <div id="div_of57a">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_081_of57a_party_identifier" id="_081_of57a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_082_of57a_identifier_code" id="_082_of57a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                            </div>
                                        </div>
                                        <div id="div_of57d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_083_of57d_party_identifier" id="_083_of57d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_084_of57d_name_address" id="_084_of57d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!--OF58-->
                                    <div class="form-row"><span class="label_body">OF58</span><span class="label">Beneficiary Bank</span>
                                        <select id="type_of58_beneficiary_bank" name="type_of58_beneficiary_bank">
                                            <option value="">CHOOSE A TYPE</option>
                                            <option value="a">A - party Identifier - Identifier Code</option>
                                            <option value="b">B - Party Identifier - Location </option>
                                            <option value="d">D - Party Identifier - Name and Address</option>
                                        </select>
                                        <div id="div_of58a">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_091_of58a_party_identifier" id="_091_of58a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_092_of58a_Identifier_code" id="_092_of58a_Identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of58a_Identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                            </div>
                                        </div>
                                        <div id="div_of58b">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_093_of58b_party_identifier" id="_093_of58b_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of58b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                <input type="text" name="_094_of58b_location" id="_094_of58b_location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of58b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                            </div>
                                        </div>
                                        <div id="div_of58d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_095_of58d_party_identifier" id="_095_of58d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_095_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name And Address</span>
                                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_096_of58d_name_address" id="_096_of58d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <hr/>

                                        <!--OF71B-->
                                        <div class="form-row"><span class="label_body">OF71B</span><span class="label">Details of Charges</span>
                                            <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_100_of71b_details_of_charges" id="_100_of71b_details_of_charges" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of71b_details_of_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                        <hr/>
                                        <!--OF72-->
                                        <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                            <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_110_of72_sender_receiver" id="_110_of72_sender_receiver" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of72_sender_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                        <hr/>

                                        <!--OF73-->
                                        <div class="form-row"><span class="label_body">OF73</span><span class="label">Details of Amounts Added</span>
                                            <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_120_of73_details_amounts_added" id="_120_of73_details_amounts_added" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of73_details_amounts_added'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
                            </div>
                            <%@ include file="button_action.jsp" %>
                            </form>
                            </c:if>
                            </c:forEach>
                        </div>
                        <div id="kaki">
                            <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
                        </div>