<%-- 
    Document   : mt103
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : Abdul Rojak
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file ="header.jsp" %>
<script src="js/validate-mt/content/mt400_content.js"></script>
<script src="js/validate-mt/validate_rule_mt400.js"></script>
<script src="js/validate-mt/validateList_scr.js"></script>
<link rel="stylesheet" type="text/css" href="css/validate_case.css"/>
<script src="js/tabcontent.js" type="text/javascript"></script>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css"/>
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css"/>
<link href="css/tabcontent.css" rel="stylesheet" type="text/css"/>
<link href="css/MT.css" rel="stylesheet" type="text/css"/>
<link rel="icon" href="images/favicon.ico"/>
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:400'}">
            <div id="judul">MT 400 Advice of Payment</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="400" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
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
                        </div>
                        <div id="view2" class="tabcontent">
                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sending Bank TRN</span>
                                <input type="text" name="_010_mf20_sending_bank_trn" id="_010_mf20_sending_bank_trn" input_type="MF20 Sending Bank Trn" location="Body" maxlength="16" minlength ="1" size="16"value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sending_bank_trn'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF23B -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*related Reference</span>
                                <input type="text" name="_020_mf21_related_reference" id="_020_mf21_related_reference" input_type="MF21 Related Reference" location="Body" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--MF32-->
                            <div class="form-row"><span class="label_body">MF32</span><span class="label">Amount Collected</span>
                                <select id="type_mf32_amount_collected" name="type_mf32_amount_collected" input_type="MF32 Amount Collected" location="Body">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - Date, Currency, Amount</option>
                                    <option value="b">B - Currency - Amount</option>
                                    <option value="k">K - Days Month - Number of Days Months - Code - Currency - Amount</option>
                                </select>

                                <div id="div_mf32a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                    <input type="text" name="_031_mf32a_date" id="_031_mf32a_date" input_type="MF32A Date" location="Body" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_032_mf32a_currency" id="_032_mf32a_currency" input_type="MF32A Currency" location="Body" maxlength="3" minlength="3" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_033_mf32a_amount" id="_033_mf32a_amount" input_type="MF32A Amount" location="Body" maxlength="15" minlength="1" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_033_mf32a_amount');" onblur="checkZeroAmount(this.id); cek_koma(this);" ondrop="return false;" onpaste="return false;"/>
                                    </div>
                                </div>

                                <div id="div_mf32b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_034_mf32b_currency" id="_034_mf32b_currency" input_type="MF32B Currency" location="Body" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_034_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_035_mf32b_amount" id="_035_mf32b_amount" input_type="MF32B Amount" location="Body" maxlength="15" minlength="1" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_035_mf32b_amount');" onblur="checkZeroAmount(this.id); cek_koma(this);" ondrop="return false;" onpaste="return false;"/>
                                    </div>
                                </div>

                                <div id="div_mf32k">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*DaysMonth</span>
                                    <select id="_036_mf32k_daysmonth" name="_036_mf32k_daysmonth" input_type="MF32K Days/month" location="Body">
                                        <option value=""></option>
                                        <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_036_mf32k_daysmonth'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>DAYS</option>
                                        <option value="M" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_036_mf32k_daysmonth'}"><c:if test="${item.detail=='M'}"> selected="true" </c:if></c:if></c:forEach>>MONTH</option>
                                    </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*NumberOfDaysMonth</span>
                                        <input type="text" name="_037_mf32k_numberofdaysmonth" id="_037_mf32k_numberofdaysmonth" input_type="MF32K Number Days/Month" location="Body" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_037_mf32k_numberofdaysmonth'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                    <select id="_038_mf32k_code" name="_038_mf32k_code" input_type="MF32K Code" location="Body">
                                        <option value=""></option>
                                        <option value="BE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='BE'}"> selected="true" </c:if></c:if></c:forEach>>BE</option>
                                        <option value="CC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='CC'}"> selected="true" </c:if></c:if></c:forEach>>CC</option>
                                        <option value="FD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='FD'}"> selected="true" </c:if></c:if></c:forEach>>FD</option>
                                        <option value="FP" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='FP'}"> selected="true" </c:if></c:if></c:forEach>>FP</option>
                                        <option value="GA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='GA'}"> selected="true" </c:if></c:if></c:forEach>>GA</option>
                                        <option value="ID" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='ID'}"> selected="true" </c:if></c:if></c:forEach>>ID</option>
                                        <option value="ST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='ST'}"> selected="true" </c:if></c:if></c:forEach>>ST</option>
                                        <option value="TD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='TD'}"> selected="true" </c:if></c:if></c:forEach>>TD</option>
                                        <option value="XX" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_mf32k_code'}"><c:if test="${item.detail=='XX'}"> selected="true" </c:if></c:if></c:forEach>>XX</option>
                                    </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                    <input type="text" name="_039_mf32k_currency" id="_039_mf32k_currency" input_type="MF32K Currency" location="Body" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_039_mf32k_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                    <input type="text" name="_040_mf32k_amount" id="_040_mf32k_amount" input_type="MF32K Amount" location="Body" maxlength="15" minlength="1" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf32k_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_040_mf32k_amount');" onblur="checkZeroAmount(this.id); cek_koma(this);" ondrop="return false;" onpaste="return false;"/>
                                </div>
                                </div>
                            </div>
                            <hr/>

                            <!--mf33A-->
                            <div class="form-row"><span class="label_body">MF33A</span><span class="label">Proceeds Remitted</span>
                                <select id="type_mf33a_a_proceeds_remitted" name="type_mf33a_a_proceeds_remitted" input_type="MF33A A Proceeds Remitted" location="Body">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - Date, Currency, Amount</option>
                                </select>
                                <div id="div_mf33a_a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                    <input type="text" name="_041_mf33a_a_date" id="_041_mf33a_a_date" input_type="MF33A A Date" location="Body" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_mf33a_a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_042_mf33a_a_currency" id="_042_mf33a_a_currency" input_type="MF33A A Currency" location="Body" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf33a_a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_043_mf33a_a_amount" id="_043_mf33a_a_amount" input_type="MF33A A Amount" location="Body" maxlength="15" minlength="1" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_mf33a_a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_043_mf33a_a_amount');" onblur="checkZeroAmount(this.id); cek_koma(this);" ondrop="return false;" onpaste="return false;"/>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--of52-->
                            <div class="form-row"><span class="label_body">OF52</span><span class="label">Ordering Bank</span>
                                <select id="type_of52_ordering_bank" name="type_of52_ordering_bank" input_type="OF52 Ordering Bank" location="Body">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - Party Identifier - Identifier Code</option>
                                    <option value="d">D - Party Identifier - Name and Address </option>
                                </select>

                                <div id="div_of52a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_051_of52a_party_identifier" id="_051_of52a_party_identifier" input_type="OF52A Party Identifier" location="Body" maxlength="34" size ="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                    <input type="text" name="_052_of52a_identifier_code" id="_052_of52a_identifier_code" input_type="OF52A Identifier Code" location="Body" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>

                                <div id="div_of52d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_053_of52d_party_identifier" id="_053_of52d_party_identifier" input_type="OF52D Party Identifier" location="Body" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                     <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_054_of52d_name_address" id="_054_of52d_name_address" input_type="OF52D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--of53A-->
                            <div class="form-row"><span class="label_body">OF53</span><span class="label">Senders Correspondent</span>
                                <select id="type_of53_senders_correspondent" name="type_of53_senders_correspondent" input_type="OF53 Senders Correspondent" location="Body">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - party Identifier - Identifier Code</option>
                                    <option value="b">B - Party Identifier - Location </option>
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of53a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_061_of53a_party_identifier" id="_061_of53a_party_identifier" input_type="OF53A Party Identifier" location="Body" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                    <input type="text" name="_062_of53a_Identifier_code" id="_062_of53a_Identifier_code" input_type="OF53A Identifier Code" location="Body" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of53a_Identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of53b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_063_of53b_party_identifier" id="_063_of53b_party_identifier" input_type="OF53B Party Identifier" location="Body" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of53b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                    <input type="text" name="_064_of53b_location" id="_064_of53b_location" input_type="OF53B Location" location="Body" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of53b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of53d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_065_of53d_party_identifier" id="_065_of53d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name And Address</span>
                                       <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_066_of53d_name_address" id="_066_of53d_name_address" input_type="OF53D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_066_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF54-->
                            <div class="form-row"><span class="label_body">OF54</span><span class="label">Receiver's Correspondent</span>
                                <select id="type_of54_receiver_correspondent" name="type_of54_receiver_correspondent" input_type="OF54 Receiver's Correspondent" location="Body">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - party Identifier - Identifier Code</option>
                                    <option value="b">B - Party Identifier - Location </option>
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of54a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_071_of54a_party_identifier" id="_071_of54a_party_identifier" input_type="OF54A Party Identifier" location="Body" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_072_of54a_Identifier_code" id="_072_of54a_Identifier_code" input_type="OF54A Identifier Code" location="Body" maxlength="11" size="11"  value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of54a_Identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    </div>
                                    <div id="div_of54b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_073_of54b_party_identifier" id="_073_of54b_party_identifier" input_type="OF54B Party Identifier" location="Body" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of54b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_074_of54b_location" id="_074_of54b_location" input_type="OF54B Location" location="Body" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_074_of54b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    </div>
                                    <div id="div_of54d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_075_of54d_party_identifier" id="_075_of54d_party_identifier" input_type="OF54D Party Identifier" location="Body" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_075_of54d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name And Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_076_of54d_name_address" id="_076_of54d_name_address" input_type="OF54D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_076_of54d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--of57-->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Bank</span>
                                <select id="type_of57_account_with_bank" name="type_of57_account_with_bank" input_type="OF57 Account With Bank" location="Body">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - Party Identifier - Identifier Code</option>
                                    <option value="d">D - Party Identifier - Name and Address </option>
                                </select>
                                <div id="div_of57a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_081_of57a_party_identifier" id="_081_of57a_party_identifier" input_type="OF57A Party Identifier" location="Body" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_082_of57a_identifier_code" id="_082_of57a_identifier_code" input_type="OF57A Identifier Code" location="Body" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_083_of57d_party_identifier" id="_083_of57d_party_identifier" input_type="OF57D Party Identifier" location="Body" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_084_of57d_name_address" id="_084_of57d_name_address" input_type="OF57D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--OF58-->
                            <div class="form-row"><span class="label_body">OF58</span><span class="label">Beneficiary Bank</span>
                                <select id="type_of58_beneficiary_bank" name="type_of58_beneficiary_bank" input_type="OF58 BENEFICIARY BANK" location="Body">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - party Identifier - Identifier Code</option>
                                    <option value="b">B - Party Identifier - Location </option>
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>

                                <div id="div_of58a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_091_of58a_party_identifier" id="_091_of58a_party_identifier" input_type="OF58A Party Identifier" location="Body" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_092_of58a_Identifier_code" id="_092_of58a_Identifier_code" input_type="OF58A Identifier Code" location="Body" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of58a_Identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>

                                <div id="div_of58b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_093_of58b_party_identifier" id="_093_of58b_party_identifier" input_type="OF58B Party Identifier" location="Body" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of58b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_094_of58b_location" id="_094_of58b_location" input_type="OF58B Location" location="Body" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of58b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>

                                <div id="div_of58d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_095_of58d_party_identifier" id="_095_of58d_party_identifier" input_type="OF58D Party Identifier" location="Body" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_095_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name And Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_096_of58d_name_address" id="_096_of58d_name_address" input_type="OF58D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--OF71B-->
                            <div class="form-row"><span class="label_body">OF71B</span><span class="label">Details of Charges</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_100_of71b_details_of_charges" id="_100_of71b_details_of_charges" input_type="OF71B Details Of Charges" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of71b_details_of_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!--OF72-->
                            <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_110_of72_sender_receiver" id="_110_of72_sender_receiver" input_type="OF72 Sender Receiver" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of72_sender_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF73-->
                            <div class="form-row"><span class="label_body">OF73</span><span class="label">Details of Amounts Added</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_120_of73_details_amounts_added" id="_120_of73_details_amounts_added" input_type="OF73 Details Amounts Added" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of73_details_amounts_added'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                        </div>
                        <div id="view3" class="tabcontent">
                            <%@include file="comment_mt.jsp" %>
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
            </div>
            <%@ include file="button_action.jsp" %>
        </form>
    </c:if>
    </c:forEach>
</div>
<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>