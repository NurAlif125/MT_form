<%--
    Document   : mt200
    Created on : Apr 6, 2022, 10:58:00 AM
    Author     : ovasae
--%>

<%@ include file="header.jsp" %>
<script src="js/validate-mt/validate_rule_mt200.js"></script>
<script src="js/validate-mt/validateList_scr.js"></script>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<link rel="stylesheet" type="text/css" href="css/validate.css" />
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

<%
    String cspNonce200 = (request.getAttribute("cspNonce") != null) 
        ? (String) request.getAttribute("cspNonce") 
        : "tHeQTZaKLMY=";
%>

<%
    String createParam = request.getParameter("create");
        if ("true".equalsIgnoreCase(createParam)) {
            session.setAttribute("flag", "");
            session.setAttribute("flagStatus", "");
        }
%>

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:200'}">
            <div id="judul">MT 200 Financial Institution Transfer for its Own Account</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="200" />
                <% Date tgl_today = new java.util.Date();
                    pageContext.setAttribute("tgl_today", tgl_today);%>
                <c:set var="tgl_today" value="${tgl_today}" />
                
                <div class="content-mt">
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
                                        <input type="text" class="mandatory" onkeypress="return textonly(event)" name="_061_mf32a_currency" id="_061_mf32a_currency" maxlength="3" minlength="3" size="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32A Currency" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Amount</span>
                                        <input type="text" class="mandatory" name="_062_mf32a_amount" id="_062_mf32a_amount" onblur="checkZeroAmount(this.id); cek_koma(this);" maxlength="15" input_type="MF32A Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_062_mf32a_amount');" ondrop="return false;" onpaste="return false;" />
                                       <font style="margin-left: 50px"></font>
                                        
                                    </div>
                                    <hr/>

                                    <!-- OF53 -->
                                    <!--Party Identifier-->
                                    <div class="form-row"><span class="label_body">OF53B</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_123_of53b_party_identifier" id="_123_of53b_party_identifier" onblur="cek_slash(this)" maxlength="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_123_of53b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <!--Location-->
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_124_of53b_location" id="_124_of53b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_124_of53b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>

                                    <hr/>

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
                                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_165_of56d_name_address" id="_165_of56d_name_address" input_type="OF56D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_165_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF57 -->
                                    <div class="form-row"><span class="label_body">MF57</span><span class="label"><a style="color:red; text-decoration:none">*</a>Account With Institution</span>
                                        <select class="mandatory" id="type_of57_" name="type_of57_" input_type="MF57 Account With Institution" location="Body">
                                            <option value="">choose a type</option>
                                            <option value="a">A - Account With Inst - Identifier Code</option>
                                            <option value="b">B - Account With Inst - Location</option>
                                            <option value="d">D - Account With Inst - Name and Address</option>
                                        </select>
                                        <div id="div_of57a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_170_of57a_party_identifier" id="_170_of57a_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Identifier Code</span>
                                                <input type="text" name="_171_of57a_identifier_code" id="_171_of57a_identifier_code" maxlength="11" input_type="OF57A Identifier Code" location="Body" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea disabled="true"><c:out value="${receiverBank}" /></textarea>
                                    </div>
                                </div>
                                <div id="div_of57b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_173_of57b_party_identifier" id="_173_of57b_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                <input type="text" name="_174_of57b_location" id="_174_of57b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                        </div>
                                        <div id="div_of57d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_176_of57d_party_identifier" id="_176_of57d_party_identifier" onblur="cek_slash(this)" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_176_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red; text-decoration:none">*</a>Name and Address</span>
                                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_177_of57d_name_address" id="_177_of57d_name_address" input_type="MF57D Name Address" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_177_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>


                                    <!-- OF72 -->
                                    <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                        <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_230_of72_sender_receiver_information" id="_230_of72_sender_receiver_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of72_sender_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        <textarea onkeypress="avoidSplChars(event)" cols="50" rows="6" maxlength="260" style="resize:none; border:none; color:#555; font-size:8px; background:none;" >Sample Input:
/RETN/
/AC04/RETURN 103
/MREF/TRN.205109105
/TEXT/USD 3.200 FROM 'BDINIDJARMT'
//LESS OUR CHGS, SINCE THE BENEF'S
//ACCT IS CLOSED</textarea>
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

<script type="text/javascript" src="js/json-xml-data-tree/data-tree.js"></script>
<script type="text/javascript" src="js/validate-mt/tab-contens-custom.js"></script>
<script type="text/javascript" src="js/custom-currency.js"></script>