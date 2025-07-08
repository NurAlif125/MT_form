<%--
    Document   : mt202
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : Sri Puji Indrayanti
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt202.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
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
        <c:if test="${item == 'MT:202'}">
            <div id="judul">MT 202 General Financial Institution Transfer</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="202" />
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
                            <%@ include file="header_mt_input.jsp" %>
                            <%@ include file="special_rate.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red; text-decoration:none">*</a>Transaction Reference Number</span>
                                <input type="text" class="mandatory" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" input_type="MF20 Sender Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <hr/>

                                    <!-- MF21 -->
                                    <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red; text-decoration:none">*</a>Related Reference</span>
                                        <input type="text" class="mandatory" name="_011_mf21_" id="_011_mf21_" maxlength="16" input_type="MF21" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf21_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <hr/>

                                    <!-- OF13C -->
                                    <div class="form-row"><span class="label_body">OF13C</span><span class="label">(Code)(Time indic)(Sign)(Time off)</span>
                                        <input type="button" name="_020_of13c_add" id="_020_of13c_add" value="Add" />
                                        <input type="button" name="_021_of13c_remove" id="_021_of13c_remove" value="Remove" />
                                    </div>
                                    <div id="div_of13c_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                            <input type="text" name="_022_of13c_code" id="_022_of13c_code" maxlength="19" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_022_of13c_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- MF32A -->
                                    <div class="form-row"><span class="label_body">MF32A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Value Date</span>
                                    <c:choose>
                                    <c:when test = "${headerById.id_headers == null}">
                                        <input type="text" name="_060_mf32a_date" id="_060_mf32a_date" class="mandatory" maxlength="6" value="<fmt:formatDate pattern='yyMMdd' value='${tgl_today}' />" />
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" name="_060_mf32a_date" id="_060_mf32a_date" class="mandatory" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </c:otherwise>
                                    </c:choose>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Currency Code</span>
                                        <input type="text" class="mandatory" name="_061_mf32a_currency" id="_061_mf32a_currency" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32a Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Amount</span>
                                        <input type="text" class="mandatory" name="_062_mf32a_amount" id="_062_mf32a_amount" maxlength="15" input_type="MF32a Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_061_mf32a_currency');" onblur="cek_koma(this)"  ondrop="return false;" onpaste="return false;" />
                                        <!--//untuk menampilkan uang dalam block ditambahkan pada 20151007-->    
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
                                        <select id="type_of52_" name="type_of52_">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Ordering Institution - Identifier Code</option>
                                            <option value="d">D - Ordering Institution - Name and Address</option>
                                        </select>
                                        <div id="div_of52a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_110_of52a_party_identifier" id="_110_of52a_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_111_of52a_identifier_code" id="_111_of52a_identifier_code" maxlength="11" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_112_of52a_address" id="_112_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_112_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of52d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_113_of52d_party_identifier" id="_113_of52d_party_identifier" onblur="cek_slash(this)" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_113_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_114_of52d_name_address" id="_114_of52d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_114_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF53 -->
                                    <div class="form-row"><span class="label_body">OF53</span><span class="label">Sender's Correspondent</span>
                                        <select id="type_of53_" name="type_of53_">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Sender's Correspondent - Identifier Code</option>
                                            <option value="b">B - Sender's Correspondent - Location</option>
                                            <option value="d">D - Sender's Correspondent - Name and Address</option>
                                        </select>
                                        <div id="div_of53a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_120_of53a_party_identifier" id="_120_of53a_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_121_of53a_identifier_code" id="_121_of53a_identifier_code" maxlength="11" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea disabled="true"><c:out value="${senderBank}" /></textarea>
                                    </div>
                                </div>
                                <div id="div_of53b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_123_of53b_party_identifier" id="_123_of53b_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_123_of53b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                <input type="text" name="_124_of53b_location" id="_124_of53b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_124_of53b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                        </div>
                                        <div id="div_of53d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_125_of53d_party_identifier" id="_125_of53d_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_125_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_126_of53d_name_address" id="_126_of53d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_126_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF54 -->
                                    <div class="form-row"><span class="label_body">OF54</span><span class="label">Receiver's Correspondent</span>
                                        <select id="type_of54_" name="type_of54_">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Receiver's Correspondent - Identifier Code</option>
                                            <option value="b">B - Receiver's Correspondent - Location</option>
                                            <option value="d">D - Receiver's Correspondent - Name and Address</option>
                                        </select>
                                        <div id="div_of54a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_130_of54a_party_identifier" id="_130_of54a_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_131_of54a_identifier_code" id="_131_of54a_identifier_code" maxlength="11" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_131_of54a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_132_of54a_address" id="_132_of54a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_132_of54a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of54b_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_133_of54b_party_identifier" id="_133_of54b_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_133_of54b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                <input type="text" name="_134_of54b_location" id="_134_of54b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_134_of54b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                        </div>
                                        <div id="div_of54d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_135_of54d_party_identifier" id="_135_of54d_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_135_of54d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_136_of54d_name_address" id="_136_of54d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_136_of54d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF56 -->
                                    <div class="form-row"><span class="label_body">OF56</span><span class="label">Intermediary Institution</span>
                                        <select id="type_of56_" name="type_of56_">
                                            <option value="" <% if("true".equals(request.getParameter("create"))) { out.write("selected='selected'"); }%> >choose a type</option>
                                            <option value="a">A - Intermediary Inst - Identifier Code</option>
                                            <option value="d">D - Intermediary Inst - Name and Address</option>
                                        </select>
                                        <div id="div_of56a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_160_of56a_party_identifier" id="_160_of56a_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Identifier Code</span>
                                                <input type="text" name="_161_of56a_identifier_code" id="_161_of56a_identifier_code" maxlength="11" input_type="56A Identifier Code" location="Body" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_162_of56a_address" id="_162_of56a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_of56a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of56d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_164_of56d_party_identifier" id="_164_of56d_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_164_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Name and Address</span>
                                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_165_of56d_name_address" id="_165_of56d_name_address" input_type="56D Name and Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_165_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF57 -->
                                    <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Institution</span>
                                        <select id="type_of57_" name="type_of57_">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Account With Inst - Identifier Code</option>
                                            <option value="b">B - Account With Inst - Location</option>
                                            <option value="d">D - Account With Inst - Name and Address</option>
                                        </select>
                                        <div id="div_of57a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_170_of57a_party_identifier" id="_170_of57a_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label" input_type="OF37a Identifire Code" location="Body">*Identifier Code</span>
                                                <input type="text" name="_171_of57a_identifier_code" id="_171_of57a_identifier_code" maxlength="11" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea disabled="true"><c:out value="${receiverBank}" /></textarea>
                                    </div>
                                </div>
                                <div id="div_of57b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_173_of57b_party_identifier" id="_173_of57b_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                <input type="text" name="_174_of57b_location" id="_174_of57b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                        </div>
                                        <div id="div_of57d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_176_of57d_party_identifier" id="_176_of57d_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_176_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_177_of57d_name_address" id="_177_of57d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_177_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF58 -->
                                    <div class="form-row"><span class="label_body">MF58</span><span class="label"><a style="color:red; text-decoration:none">*</a>Beneficiary Institution</span>
                                        <select class="mandatory" id="type_of58_" name="type_of58_" input_type="Of58" location="Body" input_type="MF58 Beneficiary Institution" location="Body">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Beneficiary Inst - Identifier Code</option>
                                            <option value="d">D - Beneficiary Inst - Name and Address</option>
                                        </select>
                                        <div id="div_of58a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_180_of58a_party_identifier" id="_180_of58a_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Identifier Code</span>
                                                <input type="text" name="_181_of58a_identifier_code" id="_181_of58a_identifier_code" maxlength="11" input_type="MF58a Identifire Code" location="Body" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea disabled="true"><c:out value="${receiverBank}" /></textarea>
                                    </div>
                                </div>
                                <div id="div_of58d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_183_of58d_party_identifier" id="_183_of58d_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_183_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_184_of58d_name_address" id="_184_of58d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF72 -->
                                    <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                        <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_230_of72_sender_receiver_information" id="_230_of72_sender_receiver_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of72_sender_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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

