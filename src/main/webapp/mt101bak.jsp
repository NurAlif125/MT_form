<%-- 
    Document   : mt101
    Created on : Sep 13, 2021, 11:52:16 AM
    Author     : Ovase
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt101.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
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
        <c:if test="${item == 'MT:101'}">
            <div id="judul">MT 101 Request for Transfer</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="101" />
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
                            <!--MAN A-->
                            <h2 class="header-title">Mandatory Sequence A General Information</h2>
                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sender's Reference</span>
                                <input type="text" name="_010_mf20_senders_reference" id="_010_mf20_senders_reference" class="mandatory" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_senders_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF21R -->
                            <div class="form-row"><span class="label_body">OF21R</span><span class="label">Customer Specified Reference </span>
                                <input type="text" name="_020_of21r_customer_specified_reference" id="_020_of21r_customer_specified_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of21r_customer_specified_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!--MF28D Message Index/Total-->                            
                            <!-- Message Index -->
                            <div class="form-row"><span class="label_body">MF28D</span><span class="label">*Message Index</span>                                
                                <input type="text" onkeypress="avoidSplChars(event)" name="_030_mf28d_message_index" id="_030_mf28d_message_index" class="mandatory" maxlength="5" size="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf28d_message_index'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!-- Total -->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Total</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_031_mf28d_total" id="_031_mf28d_total" class="mandatory" maxlength="5" size="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf28d_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- OF50A Instructing Party-->
                            <div class="form-row"><span class="label_body">OF50a</span><span class="label">Instructing Party </span>
                                <select id="type_of50a_instructing_party" name="type_of50a_instructing_party">
                                    <option value="">choose a type</option>
                                    <option value="c">C - BIC</option>
                                    <option value="l">L - Party Identifier</option>
                                </select>
                                <div id="div_of50c_identifier_code">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_041_of50c_identifier_code" id="_041_of50c_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of50c_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of50l_party_identifier">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_042_mf50l_party_identifier" id="_042_mf50l_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf50l_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF50A Ordering Customer-->
                            <div class="form-row"><span class="label_body">OF50a</span><span class="label">Ordering Customer </span>
                                <select id="type_of50a_ordering_customer" name="type_of50a_ordering_customer">
                                    <option value="">choose a type</option>
                                    <option value="f">F - Number/ Name and Address</option>
                                    <option value="g">G - BIC</option>
                                    <option value="h">H - Name and Address</option>
                                </select>
                                <div id="div_of50f_ordering_customer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_050_of50f_party_identifier" id="_050_of50f_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of50f_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_051_of50f_name_address" id="_051_of50f_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of50f_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of50g_ordering_customer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_052_of50g_beneficiary" id="_052_of50g_beneficiary" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of50g_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_053_of50g_identifier_code" id="_053_of50g_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of50g_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_056_of50g_address" id="_056_of50g_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_056_of50g_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of50h_ordering_customer">
                                    <!--Account-->
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_054_of50h_beneficiary" id="_054_of50h_beneficiary" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of50h_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <!--Name and Address-->
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_055_of50h_name_address" id="_055_of50h_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_055_of50h_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF52A  Account Servicing Institution--> 
                            <div class="form-row"><span class="label_body">OF52a </span><span class="label">Account Servicing Institution</span>
                                <select id="type_of52a_account_servicing_institution" name="type_of52a_account_servicing_institution"">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="c">C - Party Identifier</option>
                                </select>
                                <div id="div_of52a_account_servicing_institution">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_060_of52a_party_identifier" id="_060_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_061_of52a_identifier_code" id="_061_of52a_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_062_of52a_address" id="_062_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of52c_account_servicing_institution">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_063_of52c_party_identifier" id="_063_of52c_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of52c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF51A Sending Institution-->
                            <div class="form-row"><span class="label_body">OF51A</span><span class="label">Party Identifier</span>
                                <input type="text" name="_070_of51a_party_identifier" id="_070_of51a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of51a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_071_of51a_identifier_code" id="_071_of51a_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of51a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--MF30 Requested Execution Date--> 
                            <div class="form-row"><span class="label_body">MF30</span><span class="label">*Requested Execution Date</span>
                                <input type="text" name="_080_mf30_requested_execution_date" id="value_date" class ="mandatory" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf30_requested_execution_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                           
                            <!--OF25 Authorisation-->
                            <div class="form-row"><span class="label_body">OF25</span><span class="label"><a style="color:red;text-decoration:none">*</a>Authorisation</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="1" maxlength="35" style="resize:none;" name="_090_of25_authorisation" id="_090_of25_authorisation"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of25_authorisation'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            
                            <!--END A-->
                            <h2 class="header-credit">End of Sequence A General Information</h2>
                            
                            <!--MAN B-->
                            <h2 class="header-title">Mandatory Repetitive Sequence B Transaction Details</h2>
                            
                            <!--MF21 Transaction Reference-->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">Transaction Reference</span>
                                <input type="button" name="_100_mf21_add" id="_100_mf21_add" value="Add" />
                                <input type="button" name="_100_mf21_remove" id="_100_mf21_remove" value="Remove" />
                            </div>
                            <div id="div_mf21_transaction_reference">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                    <%--textarea cols="60" rows="5" name="_102_mf21_transaction_reference" id="_102_mf21_transaction_reference"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_mf21_transaction_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea--%>
                                    <input type="text" onkeypress="avoidSplChars(event)" name="_102_mf21_transaction_reference" id="_102_mf21_transaction_reference" class="mandatory" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_mf21_transaction_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF21F F/X Deal Reference-->
                            <div class="form-row"><span class="label_body">OF21F</span><span class="label">F/X Deal Reference</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_110_of21f_deal_reference" id="_110_of21f_deal_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of21f_deal_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            
                            <!--OF23E Instruction Code-->
                                <!--Instruction Code-->
                            <div class="form-row"><span class="label_body">OF23E</span><span class="label">Instruction Code</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_120_of23e_instructing_code" id="_120_of23e_instructing_code" maxlength="4" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of23e_instructing_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                                <!--Additional Information-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Additional Information</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="30" rows="1" maxlength="30" style="resize:none;" name="_121_of23e_narrative" id="_121_of23e_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_of23e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                             <!--MF32B Currency/Transaction Amount-->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                                <input type="text" name="_130_mf32b_currency" id="_130_mf32b_currency" maxlength="3" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>                             
                                <input type="text" name="_131_mf32b_amount" id="_131_mf32b_amount" class="mandatory" onpaste="return false" ondrop="return false" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_131_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_130_mf32b_currency');" onblur="cek_koma(this)" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_131_mf32b_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(2);
                                    var nominalStylec = nominalStyle.fontcolor("red");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    document.write(nominalStylec);
                                </script>
                            </div>
                            <hr/>
                            
                             <!--OF50a Instructing Party-->
                            <div class="form-row"><span class="label_body">OF50a</span><span class="label">Instructing Party </span>
                                <select id="type_of50a_instructing_party_2" name="type_of50a_instructing_party_2">
                                    <option value="">choose a type</option>
                                    <option value="c">C - BIC</option>
                                    <option value="l">L - Party Identifier</option>
                                </select>
                                <div id="div_of50c_identifier_code_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_141_of50c_identifier_code" id="_141_of50c_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_of50c_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of50l_party_identifier_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_142_mf50l_party_identifier" id="_142_mf50l_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_142_mf50l_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF50a Ordering Customer-->
                            <div class="form-row"><span class="label_body">OF50a</span><span class="label">Ordering Customer </span>
                                <select id="type_of50a_ordering_customer_2" name="type_of50a_ordering_customer">
                                    <option value="">choose a type</option>
                                    <option value="f">F - Number/ Name and Address</option>
                                    <option value="g">G - BIC</option>
                                    <option value="h">H - Name and Address</option>
                                </select>
                                <div id="div_of50f_ordering_customer_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_150_of50f_party_identifier" id="_150_of50f_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of50f_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_151_of50f_name_address" id="_151_of50f_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_151_of50f_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of50g_ordering_customer_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_152_of50g_beneficiary" id="_152_of50g_beneficiary" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_152_of50g_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_153_of50g_identifier_code" id="_153_of50g_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_153_of50g_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_156_of50g_address" id="_156_of50g_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_156_of50g_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of50h_ordering_customer_2">
                                    <!--Account-->
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_154_of50h_beneficiary" id="_154_of50h_beneficiary" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_154_of50h_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <!--Name and Address-->
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_155_of50h_name_address" id="_155_of50h_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_155_of50h_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF52a Account Servicing Institution-->
                            <div class="form-row"><span class="label_body">OF52a </span><span class="label">Account Servicing Institution</span>
                                <select id="type_of52a_account_servicing_institution_2" name="type_of52a_account_servicing_institution"">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="c">C - Party Identifier</option>
                                </select>
                                <div id="div_of52a_account_servicing_institution_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_160_of52a_party_identifier" id="_160_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_161_of52a_identifier_code" id="_161_of52a_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_162_of52a_address" id="_162_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of52c_account_servicing_institution_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_163_of52c_party_identifier" id="_163_of52c_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_163_of52c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF56a Intermediary-->
                            <div class="form-row"><span class="label_body">OF56a </span><span class="label">Intermediary</span>
                                <select id="type_of56a_intermediary" name="type_of56a_intermediary">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="c">C - Party Identifier</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_of56a_intermediary">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_170_of56a_party_identifier" id="_170_of56a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_171_of56a_identifier_code" id="_171_of56a_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_172_of56a_address" id="_172_of56a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_of56a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of56c_intermediary">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_173_of56c_party_identifier" id="_173_of56c_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_of56c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                </div>
                                <div id="div_of56d_intermediary">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_174_of56d_party_identifier" id="_174_of56d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_175_of56d_name_address" id="_175_of56d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_175_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                                    
                            <!--OF57A Account With Institution-->
                            <div class="form-row"><span class="label_body">OF57a </span><span class="label">Account With Institution</span>
                                <select id="type_of57a_account_with_institution" name="type_of57a_account_with_institution">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="c">C - Party Identifier</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_of57a_account_with_institution">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_180_of57a_party_identifier" id="_180_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_181_of57a_identifier_code" id="_181_of57a_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_182_of57a_address" id="_182_of57a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_182_of57a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of57c_account_with_institution">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_183_of57c_party_identifier" id="_183_of57c_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_183_of57c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                </div>
                                <div id="div_of57d_account_with_institution">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_184_of57d_party_identifier" id="_184_of57d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_185_of57d_name_address" id="_185_of57d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_185_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--MF59A Beneficiary-->
                            <div class="form-row"><span class="label_body">MF59</span><span class="label">Beneficiary Customer</span>
                                <select id="type_of59_59a_" name="type_of59_59a_">
                                    <option value="">choose a type</option>
                                    <option value="59">59 - Name and Address</option>
                                    <option value="59a">59A - BIC</option>
                                    <option value="59f">59F - Number/Name and Address Details</option>
                                </select>
                                        <!--No letter option-->
                                    <div id="div_mf59_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                            <input type="text" name="_190_mf59_account" id="_190_mf59_account" maxlength="35" size="40" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_mf59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_191_mf59_name_address" id="_191_mf59_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_191_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        <% if (session.getAttribute("flagStatus").equals("INC-NOK") || session.getAttribute("flagStatus").equals("INC-WAIT")) {%>
                                        <span> Nama Dari Core:${nama_core}</span>
                                        <% }%>
                                        </div>
                                    </div>
                                        <!--Option A-->
                                    <div id="div_mf59a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                            <input type="text" name="_192_mf59a_account" id="_192_mf59a_account" maxlength="35" size="40" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_192_mf59a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                            <input type="text" name="_193_mf59a_identifier_code" id="_193_mf59a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_193_mf59a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                            <textarea cols="33" rows="4" maxlength="132" style="resize:none;" name="_194_mf59a_address" id="_194_mf59a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_194_mf59a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                        <!--Option F--> 
                                    <div id="div_mf59f_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                            <input type="text" name="_195_mf59f_account" id="_195_mf59f_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_195_mf59f_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                            <select id="_196_mf59f_number" name="_196_mf59f_number" class="mandatory">
                                                <option value=""></option>
                                                <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_196_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_196_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_196_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                            <input type="text" name="_197_mf59f_details" id="_197_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_197_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <% if (session.getAttribute("flagStatus").equals("INC-NOK") || session.getAttribute("flagStatus").equals("INC-WAIT")) {%>
                                            <span> Nama Dari Core:${nama_core}</span>
                                            <% }%>
                                        </div>
                                    </div>
                                        <!--detail 2-->
                                    <div id="div_mf59f_2">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 2</span>
                                            <input type="checkbox" name="name_address_checkbox_2" id="name_address_checkbox_2" />
                                            <div id="check_mf59f_2">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                    <select id="_198_mf59f_number" name="_198_mf59f_number" class="mandatory">
                                                        <option value=""></option>
                                                        <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_198_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                        <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_198_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                        <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_198_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                                <input type="text" name="_199_mf59f_details" id="_199_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_199_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>
                                                        <!--detail 3-->
                                        <div id="div_mf59f_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 3</span>
                                                <input type="checkbox" name="name_address_checkbox_3" id="name_address_checkbox_3" />
                                                <div id="check_mf59f_3">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                        <select id="_200_mf59f_number" name="_200_mf59f_number" class="mandatory">
                                                            <option value=""></option>
                                                            <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                            <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                            <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                            <input type="text" name="_201_mf59f_details" id="_201_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_201_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                                    <!--detail 4-->
                                        <div id="div_mf59f_4">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 4</span>
                                                <input type="checkbox" name="name_address_checkbox_4" id="name_address_checkbox_4" />
                                                <div id="check_mf59f_4">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                        <select id="_202_mf59f_number" name="_202_mf59f_number" class="mandatory">
                                                            <option value=""></option>
                                                            <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_202_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                            <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_202_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                            <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_202_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                            <input type="text" name="_203_mf59f_details" id="_203_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_203_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end of the line-->
                            <hr/>

                            <!--OF70 Remittance Information-->
                            <div class="form-row"><span class="label_body">OF70</span><span class="label">Remittance Information</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_210_of70_remittance_information" id="_210_of70_remittance_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of70_remittance_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                                   
                            <!--OF77B: Regulatory Reporting-->
                            <div class="form-row"><span class="label_body">OF77B</span><span class="label">Regulatory Reporting</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="3" maxlength="105" style="resize:none;" name="_220_of77b_regulatory_reporting" id="_220_of77b_regulatory_reporting" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of77b_regulatory_reporting'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF33B Currency/Original Ordered Amount-->
                            <div class="form-row"><span class="label_body">OF33B</span><span class="label">Currency</span>
                                <input type="text" name="_230_of33b_currency" id="_230_of33b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_232_of33b_amount" id="_232_of33b_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_232_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_koma(this)" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_232_of33b_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(2);
                                    var nominalStylec = nominalStyle.fontcolor("red");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    document.write(nominalStylec);
                                </script>
                            </div>
                            <hr/>
                            
                            <!--MF71A Details of Charges-->
                            <div class="form-row"><span class="label_body">OF71A</span><span class="label">Details of Charges</span>
                                <select id="_240_mf71a_details_charges" name="_240_mf71a_details_charges" class="mandatory">
                                    <option value="">choose a code</option>
                                    <option value="BEN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_mf71a_details_charges'}"><c:if test="${item.detail=='BEN'}"> selected="true" </c:if></c:if></c:forEach>>BEN</option>
                                    <option value="OUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_mf71a_details_charges'}"><c:if test="${item.detail=='OUR'}"> selected="true" </c:if></c:if></c:forEach>>OUR</option>
                                    <option value="SHA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_mf71a_details_charges'}"><c:if test="${item.detail=='SHA'}"> selected="true" </c:if></c:if></c:forEach>>SHA</option>
                                </select>
                            </div>
                            <hr/>
                            
                            <!--OF25A Charges Account-->
                            <div class="form-row"><span class="label_body">OF25A</span><span class="label">Account</span>
                                <input type="text" name="_250_of25a_account" id="_250_of25a_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of25a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                            </div>
                            <hr/>
                            
                            <!--OF36 Exchange Rate-->
                            <div class="form-row"><span class="label_body">OF36</span><span class="label">Exchange Rate</span>
                                <input type="text" name="_260_of36_rate" id="_260_of36_rate" maxlength="12" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of36_rate'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            
                            <h2 class="header-credit">End of Sequence B Transaction Details</h2>
                            
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