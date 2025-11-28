<%-- 
    Document   : mt210
    Created on : Oct 1, 2025, 10:22:13?AM
    Author     : mslam
--%>
                            
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt210.jsp" %>
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
        <c:if test="${item == 'MT:210'}">
            <div id="judul">MT 210 Notice to Receieve</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="210" />
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

                        <!-- MF20 Transaction Reference Number -->
                        <div class="form-row">
                            <span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Transaction Reference Number</span>
                            <input type="text" name="_010_mf20_transactions_reference_number" id="_010_mf20_transactions_reference_number" maxlength="16" class="mandatory" input_type="MF20 Transaction Reference Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_transactions_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- OF25 Account Identification -->
                        <div class="form-row">
                            <span class="label_body">OF25</span><span class="label">Account Identification</span>
                            <input type="text" name="_020_of25_account_identification" id="_020_of25_account_identification" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of25_account_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- MF30 Value Date -->
                        <div class="form-row">
                            <span class="label_body">MF30</span><span class="label"><a style="color:red;text-decoration:none">*</a>Value Date</span>
                            <input type="text" name="_030_mf30_value_date" id="_030_mf30_value_date" maxlength="6" class="mandatory" input_type="MF30 Value Date" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf30_value_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                    <!-- Loop Container -->
                    <input type="hidden" id="setCount" name="setCount" value="1"/>

                    <div id="loop-container">
                        <!-- First Loop Set -->
                        <div class="set-box" data-index="0" id="loop-set">
                            <div class="loop-header">Set #1</div>
                            
                            <!-- MF21 Related Reference -->
                            <div class="form-row">
                                <span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Related Reference</span>
                                <input type="text" name="_040_mf21_related_references" id="_040_mf21_related_references" maxlength="16" class="mandatory" input_type="MF21 Related Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf21_related_references'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF32B Currency Code, Amount -->
                            <div class="form-row">
                                <span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency Code</span>
                                <input type="text" name="_050_mf32b_currency" id="_050_mf32b_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Currency Code Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>                            
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>                             
                                <input type="text" name="_051_mf32b_amount" id="_051_mf32b_amount" class="mandatory" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Currency Code Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_051_mf32b_amount');" />
                                <font style="margin-left: 50px"></font>
                                <script>
                                    function formatUang(n, currency) {
                                        if (isNaN(n)) { return ""; }
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

                            <!-- OF50a Ordering Customer -->
                            <div class="form-row">
                                <span class="label_body">OF50a</span><span class="label">Ordering Customer</span>
                                <select id="_060_of50a_ordering_customer" name="_060_of50a_ordering_customer">
                                    <option value="">choose a type</option>
                                    <option value="a">No Letter - Name and Address</option> 
                                    <option value="c">C - Identifier Code</option>
                                    <option value="f">F - Party Identifier - Name and Address</option>
                                </select>

                                <!-- Option A: Name and Address -->
                                <div id="div_of50_ordering_customer" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_061_of50a_name_address" id="_061_of50a_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of50a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>

                                <!-- Option C: Identifier Code -->
                                <div id="div_of50c_ordering_customer" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_062_of50c_identifier_code" id="_062_of50c_identifier_code" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of50c_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>

                                <!-- Option F: Party Identifier -->
                                <div id="div_of50f_ordering_customer" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_063_of50f_party_identifier" id="_063_of50f_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of50f_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <div class="form-row">
                                            <span class="label_body">&nbsp;</span><span class="label">Number</span>
                                            <select id="_064_of50f_number" name="_064_of50f_number">
                                                <option value="">CHOOSE A TYPE</option>
                                                <option value="ARNU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='ARNU'}"> selected="true" </c:if></c:if></c:forEach>>ARNU - Alien Registration Number</option>
                                                <option value="CCPT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='CCPT'}"> selected="true" </c:if></c:if></c:forEach>>CCPT - Passport Number</option>
                                                <option value="CUST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='CUST'}"> selected="true" </c:if></c:if></c:forEach>>CUST - Customer Identification Number</option>
                                                <option value="DRLC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='DRLC'}"> selected="true" </c:if></c:if></c:forEach>>DRLC - Driver's Licence Number</option>
                                                <option value="EMPL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='EMPL'}"> selected="true" </c:if></c:if></c:forEach>>EMPL - Employer Number</option>
                                                <option value="NIDN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='NIDN'}"> selected="true" </c:if></c:if></c:forEach>>NIDN - National Identity Number</option>
                                                <option value="SOSE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='SOSE'}"> selected="true" </c:if></c:if></c:forEach>>SOSE - Social Security Number</option>
                                                <option value="TXID" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of50f_number'}"><c:if test="${item.detail=='TXID'}"> selected="true" </c:if></c:if></c:forEach>>TXID - Tax Identification Number</option>
                                            </select>
                                        </div>
                                        <div class="form-row">
                                            <span class="label_body">&nbsp;</span><span class="label">Details</span>
                                            <input type="text" name="_065_of50f_details" id="_065_of50f_details" maxlength="33" minlength="1" size="33" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>        
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF52A Ordering Institution -->
                            <div class="form-row">
                                <span class="label_body">OF52A</span><span class="label">Ordering Institution</span>
                                <select id="_070_of52A_ordering_institution" name="_070_of52A_ordering_institution">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Ordering Institution - BIC</option>
                                    <option value="d">D - Ordering Institution - Name and Address</option>
                                </select>

                                <!-- Option A: BIC -->
                                <div id="div_of52a_ordering_institution" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_071_of52a_party_identifier" id="_071_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_072_of52a_identifier_code" id="_072_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>

                                <!-- Option D: Name and Address -->
                                <div id="div_of52d_ordering_institution" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_073_of52d_party_identifier" id="_073_of52d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_074_of52d_name_address" id="_074_of52d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_074_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF56a Intermediary -->
                            <div class="form-row">
                                <span class="label_body">OF56A</span><span class="label">Intermediary Institution</span>
                                <select id="_080_of56a_intermediary" name="_080_of56a_intermediary">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Party Identifier - Identifier Code</option>
                                    <option value="d">D - Party Identifier - name and address</option>
                                </select>

                                <!-- Option A: Identifier Code -->
                                <div id="div_of56a_intermediary" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_081_of56a_party_identifier" id="_081_of56a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_082_of56a_identifier_code" id="_082_of56a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>

                                <!-- Option D: Name and Address -->
                                <div id="div_of56d_intermediary" style="display:none;">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_083_of56d_party_identifier" id="_083_of56d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_084_of56d_name_address" id="_084_of56d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                        </div>
                    </div>

                    <!-- Add/Remove Loop Buttons -->
                    <div style="margin-top: 15px;">
                        <span id="addSet" class="action-link" style="cursor:pointer; color:blue; text-decoration:underline;">Add Loop</span>
                        <span id="removeSet" class="action-link" style="cursor:pointer; color:red; text-decoration:underline;">Remove Last Set</span>
                    </div>

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