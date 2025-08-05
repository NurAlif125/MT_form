<%-- 
    Document   : mt111
    Created on : Jun 16, 2025, 09:47:25 AM
    Author     : athiya
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt111.jsp" %>
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
        <c:if test="${item == 'MT:111'}">
            <div id="judul">MT 111 Request for Stop Payment of a Cheque</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="111" />
                <% Date tgl_today = new java.util.Date();
                    pageContext.setAttribute("tgl_today", tgl_today);%>
                <c:set var="tgl_today" value="${tgl_today}" />

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

                        <!-- MF20, MF21, MF30, MF32a, OF52a, OF59, OF75                           
                        ---- MF20 Sender's Reference (done)
                        ---- MF21 Cheque Number (done)
                        ---- MF30 Date of Issue (done)
                        ---- MF32a Amount: blank, F32A - Date - Currency - Amount, F32B - Currency - Amount

                        ---- OF52a Drawer Bank: blank, F52A - Party Identifier - Identifier Code, F52B - Party Identifier - Location, F52D - Party Identifier - Name and Address
                        ---- OF59 Payee - Account - Name and Address
                        ---- OF75 Queries-->
                        
                        <!-- MF20 -->
                        <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Sender's Reference</span>
                            <input type="text" onkeypress="avoidSplChars(event)" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" class="mandatory" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- MF21 -->
                        <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Cheque Number</span>
                            <input type="text" name="_020_mf21_chequenumber" id="_020_mf21_chequenumber" class="mandatory" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_chequenumber'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>
                        
                        <!-- MF30 -->
                        <div class="form-row"><span class="label_body">MF30</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Issue</span>
                            <c:choose>
                                <c:when test = "${headerById.id_headers == null}">
                                    <input type="text" name="_030_mf30_date" id="_030_mf30_date" class="mandatory" maxlength="6" value="<fmt:formatDate pattern='yyMMdd' value='${tgl_today}' />" />
                                </c:when>
                                <c:otherwise>
                                    <input type="text" name="_030_mf30_date" id="_030_mf30_date" class="mandatory" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf30_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <hr/>
                        
                        <!-- MF32A -->
                        <div class="form-row"><span class="label_body">MF32a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                            <select id="type_mf32_" name="type_mf32_" class="mandatory">
                                <option value="">choose a type </option>
                                <option value="32a">F32A - Date - Currency - Amount</option>
                                <option value="32b">F32B - Currency - Amount</option>
                            </select>
                        
                            <div id="mf32a_group" style="display: none;">
                            <!-- Date -->
                            <div class="form-row"><span class="label_body">MF32A</span>
                                <span class="label">Date</span>
                                <c:choose>
                                    <c:when test = "${headerById.id_headers == null}">
                                        <input type="text" name="_040_mf32a_date" id="_040_mf32a_date" class="mandatory" maxlength="6" value="<fmt:formatDate pattern='yyMMdd' value='' />" />
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" name="_040_mf32a_date" id="_040_mf32a_date" class="mandatory" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <!-- Currency -->
                            <div class="form-row"><span class="label_body">&nbsp;</span>
                                <span class="label">Currency</span>
                                <input type="text" name="_041_mf32a_currency" id="_041_mf32a_currency" class="mandatory" minlength="3" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^a-zA-Z]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!-- Amount -->
                            <div class="form-row"><span class="label_body">&nbsp;</span>
                                <span class="label">Amount</span>                             
                                <input type="text" name="_042_mf32a_amount" id="_042_mf32a_amount" class="mandatory" onpaste="return false" ondrop="return false" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_041_mf32a_currency');" onblur="cek_koma(this)" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                function formatUang(n, currency) {
                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                }
                                    var number2 = document.getElementById('_042_mf32a_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(2);
                                    var nominalStylec = nominalStyle.fontcolor("red");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    document.write(nominalStylec);
                                </script>
                            </div>
                        </div>
                        
                        <!-- MF32B -->
                        <div id="mf32b_group" style="display: none;">
                            <div class="form-row"><span class="label_body">MF32B</span>
                                <span class="label">Currency</span>
                                <input type="text" name="_043_mf32b_currency" id="_043_mf32b_currency" class="mandatory" minlength="3" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.replace(/[^a-zA-Z]/g,'').toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span>
                                <span class="label">Amount</span>
                                <input type="text" name="_044_mf32b_amount" id="_044_mf32b_amount" class="mandatory" onpaste="return false" ondrop="return false" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_044_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_043_mf32b_currency');" onblur="cek_koma(this)" />
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                function formatUang(n, currency) {
                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                }
                                    var number2 = document.getElementById('_044_mf32b_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(2);
                                    var nominalStylec = nominalStyle.fontcolor("red");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    document.write(nominalStylec);
                                </script>
                            </div>
                        </div>
                            </div>
                        <hr/>
                        
                        <!-- OF52A -->
                        <div class="form-row"><span class="label_body">OF52a</span><span class="label">Drawer Bank</span>
                            <select id="type_of52_52a_" name="type_of52_52a_">
                                <option value="">choose a type</option>
                                <option value="52a">F52A - Party Identifier - Identifier Code</option>
                                <option value="52b">F52B - Party Identifier - Location</option>
                                <option value="52d">F52D - Party Identifier - Name and Address</option>
                            </select>
                            
                            <div id="div_of52a_seq_b" style="display: none;">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_050_of52a_party_identifier" id="_050_of52a_party_identifier" maxlength="37" pattern="^(/([A-Z]/)?.{0,34})?$" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                    <input type="text" name="_051_of52a_identifier_code" id="_051_of52a_identifier_code" maxlength="11" pattern="^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div id="div_of52b_seq_b" style="display: none;">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_052_of52b_party_identifier" id="_052_of52b_party_identifier" maxlength="37" pattern="^(/([A-Z]/)?.{0,34})?$" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of52b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)"/>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                    <input type="text" name="_053_of52b_location" id="_053_of52b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of52b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div id="div_of52d_seq_b" style="display: none;">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_054_of52d_party_identifier" id="_054_of52d_party_identifier" maxlength="37" pattern="^(/([A-Z]/)?.{0,34})?$" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)"/>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                    <textarea name="_055_of52d_address" id="_055_of52d_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_055_of52d_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>                
                        </div>
                        <hr/>
                       
                        <!-- OF59 -->
                        <div class="form-row"><span class="label_body">OF59</span><span class="label">Beneficiary</span>
                            <input type="checkbox" name="beneficiary_checkbox" id="beneficiary_checkbox" />
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
                        
                        <!-- OF75 -->
                        <div class="form-row"><span class="label_body">OF75</span><span class="label">Queries</span>
                            <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_070_of75_queries" id="_070_of75_queries"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of75_queries'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    
                    <%-- comment: template dari SAA
                          <div id="view3" class="tabcontent">
                        <%@ include file="network_mt.jsp" %>
                    </div--%>
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