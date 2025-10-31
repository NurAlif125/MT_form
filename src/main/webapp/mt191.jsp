<%--
    Document   : mt191
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mtn91.jsp" %>
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
        <c:if test="${item == 'MT:191'}">
            <div id="judul">MT 191 Request for Payment of Charges, Interest and Other Expenses</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="191" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em;">
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
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Transaction Reference Number</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_010_mf20_transaction_reference_number" id="_010_mf20_transaction_reference_number" class="mandatory" maxlength="16" input_type="MF20 Transaction Reference Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_transaction_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Related Reference</span>
                                <input type="text" name="_020_mf21_related_reference" id="_020_mf21_related_reference" class="mandatory" maxlength="16" input_type="MF21" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF32B -->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency Code</span>
                                <%--input type="text" name="_030_mf32b_currency" id="_030_mf32b_currency" class="mandatory" minlength="3" maxlength="3" style="text-transform: uppercase;" input_type="MF32B Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/--%>
                                <input type="text" name="_030_mf32b_currency" id="_030_mf32b_currency" class="mandatory" onkeypress="return textonly(event)" minlength="3" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                                <%--input type="text" name="_031_mf32b_amount" id="_031_mf32b_amount" class="mandatory" maxlength="15" onpaste="return false" ondrop="return false" input_type="MF32B Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_koma(this)" /--%>
                                <input type="text" name="_031_mf32b_amount" id="_031_mf32b_amount" onblur="checkZeroAmount(this.id); cek_koma(this);" class="mandatory" onpaste="return false" ondrop="return false" maxlength="15" input_type="MF32B Amount" location="Body" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_030_mf32b_currency');" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        if (isNaN(n)) {
                                            return "";
                                        }
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_062_mf32a_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(5);
                                    var nominalStylec = nominalStyle.fontcolor("blue");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    if (nominal !== "") {
                                        document.write(nominalStylec);
                                    }
                                </script>
                            </div>
                            <hr/>

                            <!-- OF52 -->
                            <div class="form-row"><span class="label_body">OF52 </span><span class="label">Ordering Institution</span>
                                <select id="type_of52_ordering_institution" name="type_of52_ordering_institution" input_type="OF52A Identifier Code" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Party Identifier - Identifier Code</option>
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of52a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_040_of52a_party_identifier" id="_040_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_041_of52a_identifier_code" id="_041_of52a_identifier_code" maxlength="11" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_042_of52a_address" id="_042_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of52d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_043_of52d_party_identifier" id="_043_of52d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_044_of52d_name_address" id="_044_of52d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_044_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF57 -->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Institution</span>
                                <select id="type_of57_account_with_institution" name="type_of57_account_with_institution">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Party Identifier - Identifier Code</option>
                                    <option value="b">B - Party Identifier - Location</option>
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of57a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_050_of57a_party_identifier" id="_050_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_051_of57a_identifier_code" id="_051_of57a_identifier_code" maxlength="11" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <%--textarea name="_052_of57a_address" id="_052_of57a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of57a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea--%>
                                        <textarea disabled="true"><c:out value="${receiverBank}" /></textarea>
                                    </div>
                                </div>
                                <div id="div_of57b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_053_of57b_party_identifier" id="_053_of57b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_054_of57b_location" id="_054_of57b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_056_of57d_party_identifier" id="_056_of57d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_056_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_057_of57d_name_address" id="_057_of57d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_057_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- MF71B -->
                            <div class="form-row"><span class="label_body">MF71B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Details of Charges</span>
                                <textarea cols="35" rows="6" maxlength="210" class="mandatory" wrap="hard" style="resize:none;" name="_060_mf71b_details_charges" id="_060_mf71b_details_charges" input_type="MF71B" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf71b_details_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF72 -->
                            <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_070_of72_sender_to_receiver_information" id="_070_of72_sender_to_receiver_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of72_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
