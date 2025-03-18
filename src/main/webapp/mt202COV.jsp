<%-- 
    Document   : mt202COV
    Created on : Jun 16, 2022, 11:46:24 AM
    Author     : ovasae
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt202COV.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/mt.js" type="text/javascript"></script>
<script src="js/tabcontent.js" type="text/javascript"></script>
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
        <c:if test="${item == 'MT:202COV'}">
            <div id="judul">MT 202 COV General Financial Institution Transfer</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="202" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li id="tab-view1"><a href="#" rel="view1">Header</a></li>
                        <li id="tab-view2"><a href="#" rel="view2">Body</a></li>
                        <li id="tab-view3"><a href="#" rel="view3">Comment</a></li>
                        <li id="tab-view4"><a href="#" rel="view4">Histories</a></li>
                        <li id="tab-view5"><a href="#" rel="view5">Log MT Text</a></li>
                        <li hidden style="display:none;" id="tab-validate"><a href="#" rel="view6" id="tabView6">Validate</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt_input.jsp" %>
                            <%@ include file="special_rate.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            
                            <!--MAN A-->
                            <h2 class="header-title">Mandatory Sequence A General Information</h2>
                            
                            <!--MF20-->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red; text-decoration:none">*</a>Transaction Reference Number</span>
                                <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" input_type="MF20 Sender Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>
                            
                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red; text-decoration:none">*</a>Related Reference</span>
                                <input type="text" name="_011_mf21_" id="_011_mf21_" maxlength="16" input_type="MF21 Releated Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf21_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
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
                            <div class="form-row"><span class="label_body">MF32A</span><span class="label"><a style="color:red; text-decoration:none">*</a>Value Date</span>
                                <input type="text" name="_060_mf32a_date" id="_060_mf32a_date" maxlength="6" input_type="MF32A Date" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Currency Code</span>
                                <input type="text" name="_061_mf32a_currency" id="_061_mf32a_currency" maxlength="3" input_type="MF32A Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Amount</span>
                                <input type="text" name="_062_mf32a_amount" id="_062_mf32a_amount" maxlength="15" input_type="MF32A Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_061_mf32a_currency');" onblur="cek_koma(this)"  ondrop="return false;" onpaste="return false;" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151007-->    
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_062_mf32a_amount').value;
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
                            
                            <!-- OF52 -->
                            <div class="form-row"><span class="label_body">OF52 </span><span class="label">Ordering Institution</span>
                                <select id="type_of52_" name="type_of52_">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Ordering Institution - BIC</option>
                                    <option value="d">D - Ordering Institution - Name and Address</option>
                                </select>
                                <div id="div_of52a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_110_of52a_party_identifier" id="_110_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_111_of52a_identifier_code" id="_111_of52a_identifier_code" maxlength="11" input_type="Of52A Identifier Code" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_112_of52a_address" id="_112_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_112_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of52d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_113_of52d_party_identifier" id="_113_of52d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_113_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_114_of52d_name_address" id="_114_of52d_name_address" input_type="OF52D Name Address" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_114_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!-- OF53 -->
                            <div class="form-row"><span class="label_body">OF53</span><span class="label">Sender's Correspondent</span>
                                <select id="type_of53_" name="type_of53_">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Sender's Correspondent - BIC</option>
                                    <option value="b">B - Sender's Correspondent - Location</option>
                                    <option value="d">D - Sender's Correspondent - Name and Address</option>
                                </select>
                                <div id="div_of53a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_120_of53a_party_identifier" id="_120_of53a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_121_of53a_identifier_code" id="_121_of53a_identifier_code" maxlength="11" input_type="MF53A Identifier Code" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea disabled="true"><c:out value="${senderBank}" /></textarea>
                                    </div>
                                </div>
                                <div id="div_of53b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_123_of53b_party_identifier" id="_123_of53b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_123_of53b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_124_of53b_location" id="_124_of53b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_124_of53b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                                <div id="div_of53d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_125_of53d_party_identifier" id="_125_of53d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_125_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_126_of53d_name_address" id="_126_of53d_name_address" input_type="OF53D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_126_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF54 -->
                            <div class="form-row"><span class="label_body">OF54</span><span class="label">Receiver's Correspondent</span>
                                <select id="type_of54_" name="type_of54_">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Receiver's Correspondent - BIC</option>
                                    <option value="b">B - Receiver's Correspondent - Location</option>
                                    <option value="d">D - Receiver's Correspondent - Name and Address</option>
                                </select>
                                <div id="div_of54a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_130_of54a_party_identifier" id="_130_of54a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of54a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_131_of54a_identifier_code" id="_131_of54a_identifier_code" maxlength="11" input_type="OF54A Identifier Code" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_131_of54a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_132_of54a_address" id="_132_of54a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_132_of54a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of54b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_133_of54b_party_identifier" id="_133_of54b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_133_of54b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_134_of54b_location" id="_134_of54b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_134_of54b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                                <div id="div_of54d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_135_of54d_party_identifier" id="_135_of54d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_135_of54d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_136_of54d_name_address" id="_136_of54d_name_address" input_type="OF54D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_136_of54d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF56 -->
                            <div class="form-row"><span class="label_body">OF56</span><span class="label">Intermediary Institution</span>
                                <select id="type_of56_" name="type_of56_">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Intermediary Inst - BIC</option>
                                    <option value="d">D - Intermediary Inst - Name and Address</option>
                                </select>
                                <div id="div_of56a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_160_of56a_party_identifier" id="_160_of56a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_161_of56a_identifier_code" id="_161_of56a_identifier_code" maxlength="11" input_type="OF56A Identifier Code" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_162_of56a_address" id="_162_of56a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_of56a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of56d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_164_of56d_party_identifier" id="_164_of56d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_164_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_165_of56d_name_address" id="_165_of56d_name_address" input_type="OF56D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_165_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!-- OF57 -->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Institution</span>
                                <select id="type_of57_" name="type_of57_">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Account With Inst - BIC</option>
                                    <option value="b">B - Account With Inst - Location</option>
                                    <option value="d">D - Account With Inst - Name and Address</option>
                                </select>
                                <div id="div_of57a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_170_of57a_party_identifier" id="_170_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_171_of57a_identifier_code" id="_171_of57a_identifier_code" maxlength="11" input_type="OF57A Identifier Code" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea disabled="true"><c:out value="${receiverBank}" /></textarea>
                                    </div>
                                </div>
                                <div id="div_of57b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_173_of57b_party_identifier" id="_173_of57b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_174_of57b_location" id="_174_of57b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                                <div id="div_of57d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_176_of57d_party_identifier" id="_176_of57d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_176_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_177_of57d_name_address" id="_177_of57d_name_address" input_type="OF57D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_177_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!-- OF58 -->
                            <div class="form-row"><span class="label_body">OF58</span><span class="label">Beneficiary Institution</span>
                                <select id="type_of58_" name="type_of58_">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Beneficiary Inst - BIC</option>
                                    <option value="d">D - Beneficiary Inst - Name and Address</option>
                                </select>
                                <div id="div_of58a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_180_of58a_party_identifier" id="_180_of58a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_181_of58a_identifier_code" id="_181_of58a_identifier_code" maxlength="11" input_type="OF58A Identifier Code" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea disabled="true"><c:out value="${receiverBank}" /></textarea>
                                    </div>
                                </div>
                                <div id="div_of58d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_183_of58d_party_identifier" id="_183_of58d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_183_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_184_of58d_name_address" id="_184_of58d_name_address" input_type="OF58D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!-- OF72 -->
                            <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_230_of72_sender_receiver_information" id="_230_of72_sender_receiver_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of72_sender_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <h2 class="header-credit">End of Sequence A General Information</h2>
                            
                            <h2 class="header-title">Mandatory Sequence B Underlying Customer Credit Transfer Details</h2>
                            
                            <!-- MF50 -->
                            <div class="form-row"><span class="label_body">MF50</span><span class="label">Ordering Customer</span>
                                <select id="type_mf50_ordering_customer" name="type_mf50_ordering_customer" class="mandatory" input_type="MF50 Ordering Customer" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="f">F - Number/Name and Address Details</option>
                                    <option value="k">K - Name and Address</option>
                                </select>
                                <div id="div_mf50a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_240_mf50a_account" id="_240_mf50a_account" maxlength="35" input_type="MF50A Account" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_mf50a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_241_mf50a_identifier_code" id="_241_mf50a_identifier_code" maxlength="11" input_type="MF50A Identifier Code" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_241_mf50a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_242_mf50a_address" id="_242_mf50a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_242_mf50a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <!--20200709-->
                                <div id="div_mf50f_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_243_mf50f_account" id="_243_mf50f_account" input_type="MF50F Account" location="Body" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_243_mf50f_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                        <select id="_244_mf50f_number" name="_244_mf50f_number" class="mandatory" input_type="MF50F Number" location="Body">
                                            <option value=""></option>
                                            <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_244_mf50f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                            <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_244_mf50f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                            <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_244_mf50f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                            <option value="4" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_244_mf50f_number'}"><c:if test="${item.detail=='4'}"> selected="true" </c:if></c:if></c:forEach>>4</option>
                                            <option value="5" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_244_mf50f_number'}"><c:if test="${item.detail=='5'}"> selected="true" </c:if></c:if></c:forEach>>5</option>
                                            <option value="6" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_244_mf50f_number'}"><c:if test="${item.detail=='6'}"> selected="true" </c:if></c:if></c:forEach>>6</option>
                                            <option value="7" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_244_mf50f_number'}"><c:if test="${item.detail=='7'}"> selected="true" </c:if></c:if></c:forEach>>7</option>
                                            <option value="8" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_244_mf50f_number'}"><c:if test="${item.detail=='8'}"> selected="true" </c:if></c:if></c:forEach>>8</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                        <input type="text" name="_245_mf50f_details" id="_245_mf50f_details" maxlength="33" class="mandatory" input_type="MF50F Details" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_245_mf50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_mf50f_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 2</span>
                                        <input type="checkbox" name="name_address_checkbox_2_50" id="name_address_checkbox_2_50" />
                                        <div id="check_mf50f_2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                <select id="_246_mf50f_number" name="_246_mf50f_number" class="mandatory">
                                                    <option value=""></option>
                                                    <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_246_mf50f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                    <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_246_mf50f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                    <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_246_mf50f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                    <option value="4" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_246_mf50f_number'}"><c:if test="${item.detail=='4'}"> selected="true" </c:if></c:if></c:forEach>>4</option>
                                                    <option value="5" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_246_mf50f_number'}"><c:if test="${item.detail=='5'}"> selected="true" </c:if></c:if></c:forEach>>5</option>
                                                    <option value="6" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_246_mf50f_number'}"><c:if test="${item.detail=='6'}"> selected="true" </c:if></c:if></c:forEach>>6</option>
                                                    <option value="7" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_246_mf50f_number'}"><c:if test="${item.detail=='7'}"> selected="true" </c:if></c:if></c:forEach>>7</option>
                                                    <option value="8" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_246_mf50f_number'}"><c:if test="${item.detail=='8'}"> selected="true" </c:if></c:if></c:forEach>>8</option>
                                                </select>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                <input type="text" name="_247_mf50f_details" id="_247_mf50f_details" maxlength="33" class="mandatory" input_type="MF50F Details" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_247_mf50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_mf50f_3">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 3</span>
                                        <input type="checkbox" name="name_address_checkbox_3_50" id="name_address_checkbox_3_50" />
                                        <div id="check_mf50f_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                <select id="_248_mf50f_number" name="_248_mf50f_number" class="mandatory" input_type="MF50F Number" location="Body">
                                                    <option value=""></option>
                                                    <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_248_mf50f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                    <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_248_mf50f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                    <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_248_mf50f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                    <option value="4" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_248_mf50f_number'}"><c:if test="${item.detail=='4'}"> selected="true" </c:if></c:if></c:forEach>>4</option>
                                                    <option value="5" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_248_mf50f_number'}"><c:if test="${item.detail=='5'}"> selected="true" </c:if></c:if></c:forEach>>5</option>
                                                    <option value="6" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_248_mf50f_number'}"><c:if test="${item.detail=='6'}"> selected="true" </c:if></c:if></c:forEach>>6</option>
                                                    <option value="7" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_248_mf50f_number'}"><c:if test="${item.detail=='7'}"> selected="true" </c:if></c:if></c:forEach>>7</option>
                                                    <option value="8" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_248_mf50f_number'}"><c:if test="${item.detail=='8'}"> selected="true" </c:if></c:if></c:forEach>>8</option>
                                                </select>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                <input type="text" name="_249_mf50f_details" id="_249_mf50f_details" maxlength="33" class="mandatory" input_type="MF50F Details" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_249_mf50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_mf50f_4">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 4</span>
                                        <input type="checkbox" name="name_address_checkbox_4_50" id="name_address_checkbox_4_50" />
                                        <div id="check_mf50f_4">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                <select id="_250_mf50f_number" name="_250_mf50f_number" class="mandatory">
                                                    <option value=""></option>
                                                    <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_mf50f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                    <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_mf50f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                    <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_mf50f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                    <option value="4" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_mf50f_number'}"><c:if test="${item.detail=='4'}"> selected="true" </c:if></c:if></c:forEach>>4</option>
                                                    <option value="5" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_mf50f_number'}"><c:if test="${item.detail=='5'}"> selected="true" </c:if></c:if></c:forEach>>5</option>
                                                    <option value="6" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_mf50f_number'}"><c:if test="${item.detail=='6'}"> selected="true" </c:if></c:if></c:forEach>>6</option>
                                                    <option value="7" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_mf50f_number'}"><c:if test="${item.detail=='7'}"> selected="true" </c:if></c:if></c:forEach>>7</option>
                                                    <option value="8" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_mf50f_number'}"><c:if test="${item.detail=='8'}"> selected="true" </c:if></c:if></c:forEach>>8</option>
                                                </select>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                <input type="text" name="_251_mf50f_details" id="_251_mf50f_details" maxlength="33" class="mandatory" input_type="MF50F Details" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_251_mf50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_mf50k_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_255_mf50k_account" id="_255_mf50k_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_255_mf50k_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_256_mf50k_name_address" id="_256_mf50k_name_address" input_type="MF50K Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_256_mf50k_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF52 Seq B-->
                            <div class="form-row"><span class="label_body">OF52 </span><span class="label">Ordering Institution</span>
                                <select id="type_of52_2" name="type_of52_2">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Ordering Institution - BIC</option>
                                    <option value="d">D - Ordering Institution - Name and Address</option>
                                </select>
                                <div id="div_of52a_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_260_of52a_party_identifier" id="_260_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_261_of52a_identifier_code" id="_261_of52a_identifier_code" maxlength="11" input_type="OF52A Identifier Code" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_261_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_262_of52a_address" id="_262_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_262_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of52d_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_263_of52d_party_identifier" id="_263_of52d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_263_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_264_of52d_name_address" id="_264_of52d_name_address" input_type="OF52D Name Address" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_264_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF56 Intermediary Institution-->
                            <div class="form-row"><span class="label_body">OF56</span><span class="label">Intermediary Institution</span>
                                <select id="type_of56_2" name="type_of56_2">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Intermediary Inst - BIC</option>
                                    <option value="c">C - Intermediary Inst - Party Identifier</option>
                                    <option value="d">D - Intermediary Inst - Name and Address</option>
                                </select>
                                <div id="div_of56a_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_270_of56a_party_identifier" id="_270_of56a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_271_of56a_identifier_code" id="_271_of56a_identifier_code" maxlength="11" input_type="OF56A Identifier Code" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_271_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_272_of56a_address" id="_272_of56a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_272_of56a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of56c_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_273_of56c_party_identifier" id="_273_of56c_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_273_of56c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
				</div>
                                <div id="div_of56d_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_274_of56d_party_identifier" id="_274_of56d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_274_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_275_of56d_name_address" id="_275_of56d_name_address" input_type="OF56D Number" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_275_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF57 Sequence B-->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Institution</span>
                                <select id="type_of57_2" name="type_of57_2" class="mandatory">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="b">B - Location</option>
                                    <option value="c">C - Institution</option>
                                    <option value="d">D - Name and Address</option>
                                </select>
                                <div id="div_of57a_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_280_of57a_party_identifier" id="_280_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_281_of57a_identifier_code" id="_281_of57a_identifier_code" maxlength="11" input_type="OF57A Identifier Code" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_281_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea disabled="true"><c:out value="${receiverBank}" /></textarea>
                                    </div>
                                </div>
                                <div id="div_of57b_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_283_of57b_party_identifier" id="_283_of57b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_283_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_284_of57b_location" id="_284_of57b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_284_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57c_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Party Identifier</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_285_of57c_party_identifier" id="_285_of57c_party_identifier" maxlength="35" input_type="OF57C Party Identifier" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_285_of57c_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                </div>
                                <div id="div_of57d_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_286_of57d_party_identifier" id="_286_of57d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_286_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_287_of57d_name_address" id="_287_of57d_name_address" input_type="OF57D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_287_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--MF59-->
                            <div class="form-row"><span class="label_body">MF59</span><span class="label">Beneficiary Customer</span>
                                <select id="type_of59_59a_" name="type_of59_59a_" class="mandatory">
                                    <option value="">choose a type</option>
                                    <option value="59">59 - Name and Address</option>
                                    <option value="59a">59A - BIC</option>
                                    <option value="59f">59F - Number/Name and Address Details</option>
                                </select>
                                <div id="div_mf59_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_290_mf59_account" id="_290_mf59_account" maxlength="35" size="40" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_mf59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <% if (session.getAttribute("flagStatus").equals("INC-WAIT") || session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
                                    <c:if test="${headerById.komentar=='Not Found'}">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">New Account</span>
                                            <input type="text" name="acc_adj" id="acc_adj" maxlength="35" size="35" style="background-color: yellow" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_mf59_account'}"><c:out value="${item.info}" /></c:if></c:forEach>" onblur="cek_slash(this)">
                                        </div>
                                    </c:if>
                                    <% }%>
                                    <% if (session.getAttribute("flagStatus").equals("INC-NOK") || session.getAttribute("flagStatus").equals("INC-WAIT")) {%>
                                    <c:if test="${headerById.komentar!='Not Found'}">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name from Core</span><span style="color: red; font-size: 13px">${nama_core}</span> 
                                        </div>
                                    </c:if>
                                    <% }%>
                                    <% if (session.getAttribute("flagStatus").equals("INC-NSTP") || session.getAttribute("flagStatus").equals("INC-SPRT")) {%>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Customer Currency</span><span style="color: red; font-size: 13px">${headerById.cust_curr}</span> 
                                    </div>
                                    <% }%>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_291_mf59_name_address" id="_291_mf59_name_address" input_type="MF59 Name Address" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_291_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>         
                                    </div>
                                    <% if (session.getAttribute("flagStatus").equals("INC-WAIT") || session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
                                    <c:if test="${headerById.komentar=='Not Found'}">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">New Name</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none; background-color: yellow" name="nm_adj" id="nm_adj"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_291_mf59_name_address'}"><c:out value="${item.info}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </c:if>
                                    <% }%>
                                </div>
                                <div id="div_mf59a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_292_mf59a_account" id="_292_mf59a_account" maxlength="35" size="40" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_292_mf59a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_293_mf59a_identifier_code" id="_293_mf59a_identifier_code" maxlength="11" input_type="MF59A Identifier Code" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_293_mf59a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea cols="33" rows="4" maxlength="132" style="resize:none;" name="_294_mf59a_address" id="_294_mf59a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_294_mf59a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <!--20200416-->
                                <div id="div_mf59f_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_295_mf59f_account" id="_295_mf59f_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_295_mf59f_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <% if (session.getAttribute("flagStatus").equals("INC-WAIT") || session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
                                    <c:if test="${headerById.komentar=='Not Found'}">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">New Account</span>
                                            <input type="text" name="acc_adj_f" id="acc_adj_f" maxlength="35" size="35" style="background-color: yellow" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_295_mf59f_account'}"><c:out value="${item.info}" /></c:if></c:forEach>" onblur="cek_slash(this)">
                                        </div>
                                    </c:if>
                                    <% }%>
                                    <% if (session.getAttribute("flagStatus").equals("INC-NOK") || session.getAttribute("flagStatus").equals("INC-WAIT")) {%>
                                    <c:if test="${headerById.komentar!='Not Found'}">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name from Core</span><span style="color: red; font-size: 13px">${nama_core}</span> 
                                        </div>
                                    </c:if>
                                    <% }%>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                        <select id="_296_mf59f_number" name="_296_mf59f_number" class="mandatory" input_type="MF59F Number" location="Body">
                                            <option value=""></option>
                                            <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_296_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                            <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_296_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                            <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_296_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                        <input type="text" name="_297_mf59f_details" id="_297_mf59f_details" maxlength="33" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_297_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" /> 
                                    </div>
                                    <% if (session.getAttribute("flagStatus").equals("INC-WAIT") || session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
                                    <c:if test="${headerById.komentar=='Not Found'}">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">New Name</span>
                                            <input type="text" name="nm_adj_f" id="nm_adj_f" maxlength="33" style="background-color: yellow" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_297_mf59f_details'}"><c:out value="${item.info}" /></c:if></c:forEach>" /> 
                                        </div>
                                    </c:if>
                                    <% }%>
                                </div>
                                <div id="div_mf59f_2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 2</span>
                                        <input type="checkbox" name="name_address_checkbox_2" id="name_address_checkbox_2" />
                                        <div id="check_mf59f_2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                <select id="_298_mf59f_number" name="_298_mf59f_number" class="mandatory">
                                                    <option value=""></option>
                                                    <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_298_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                    <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_298_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                    <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_298_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                </select>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                <input type="text" name="_299_mf59f_details" id="_299_mf59f_details" maxlength="33" class="mandatory" input_type="MF59F Details" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_299_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_mf59f_3">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 3</span>
                                        <input type="checkbox" name="name_address_checkbox_3" id="name_address_checkbox_3" />
                                        <div id="check_mf59f_3">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                <select id="_300_mf59f_number" name="_300_mf59f_number" class="mandatory" input_type="MF59F Number" location="Body">
                                                    <option value=""></option>
                                                    <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                    <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                    <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                </select>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                <input type="text" name="_301_mf59f_details" id="_301_mf59f_details" maxlength="33" class="mandatory" input_type="MF59F Details" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_301_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div_mf59f_4">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Name and Address Details 4</span>
                                        <input type="checkbox" name="name_address_checkbox_4" id="name_address_checkbox_4" />
                                        <div id="check_mf59f_4">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                <select id="_302_mf59f_number" name="_302_mf59f_number" class="mandatory">
                                                    <option value=""></option>
                                                    <option value="1" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_302_mf59f_number'}"><c:if test="${item.detail=='1'}"> selected="true" </c:if></c:if></c:forEach>>1</option>
                                                    <option value="2" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_302_mf59f_number'}"><c:if test="${item.detail=='2'}"> selected="true" </c:if></c:if></c:forEach>>2</option>
                                                    <option value="3" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_302_mf59f_number'}"><c:if test="${item.detail=='3'}"> selected="true" </c:if></c:if></c:forEach>>3</option>
                                                </select>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                                <input type="text" name="_303_mf59f_details" id="_303_mf59f_details" maxlength="33" class="mandatory" input_type="MF59F Details" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_303_mf59f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!-- OF70 -->
                            <div class="form-row"><span class="label_body">OF70</span><span class="label">Remittance Information</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_310_of70_remittance_information" id="_310_of70_remittance_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of70_remittance_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!-- OF72 Sequence B -->
                            <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_320_of72_sender_receiver_information" id="_320_of72_sender_receiver_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of72_sender_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!-- OF33B -->
                            <div class="form-row"><span class="label_body">OF33B</span><span class="label">Currency</span>
                                <input type="text" name="_070_of33b_currency" id="_070_of33b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_072_of33b_amount" id="_072_of33b_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_070_of33b_currency');" onblur="cek_koma(this)" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_072_of33b_amount').value;
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
                            <div id="error-container"></div>
                        </div>
                    </div>
                </div>
                <%@ include file="button_action.jsp" %>
            </form>
        </c:if>
    </c:forEach>
</div>
