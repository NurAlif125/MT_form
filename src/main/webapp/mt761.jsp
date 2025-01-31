<%-- 
    Document   : mt761
    Created on : Jun 14, 2021, 2:02:58 PM
    Author     : Ovasae
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt761.jsp" %>
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
        <c:if test="${item == 'MT:761'}">
            <div id="judul">MT 761 Issue of a Demand Guarantee/Standby Letter of Credit</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="761" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li><a href="#" rel="view1">Header</a></li>
                        <li><a href="#" rel="view2">Body</a></li>
                        <li><a href="#" rel="view3">Comment</a></li>
                        <li><a href="#" rel="view4">Histories</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt_input.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                             <!--MF27 Sequence of Total-->
                            <!--Number-->
                            <div class="form-row"><span class="label_body">MF27</span><span class="label">*Number</span>                                
                                <input type="text" onkeypress="avoidSplChars(event)" name="_010_mf27_number" id="_010_mf27_number" class="mandatory" maxlength="1" size="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--Total-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Total</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_011_mf27_total" id="_011_mf27_total" class="mandatory" maxlength="1" size="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--MF20 Undertaking Number-->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Undertaking Number</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_020_mf20_undertaking_number" id="_020_mf20_undertaking_number" class="mandatory" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf20_undertaking_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--MF52a Issuer-->
                            <div class="form-row"><span class="label_body">MF52a </span><span class="label">Issuer</span>
                                <select id="type_mf52a_issuer" name="type_mf52a_issuer" class="mandatory">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_mf52a_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_030_mf52a_party_identifier" id="_030_mf52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_031_mf52a_identifier_code" id="_031_mf52a_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_032_mf52a_address" id="_032_mf52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_mf52d_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_033_mf52d_party_identifier" id="_033_mf52d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_mf52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_034_mf52d_name_address" id="_034_mf52d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_034_mf52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <!--OF77U Undertaking Terms and Conditions-->
                            <div class="form-row"><span class="label_body">OF77U</span><span class="label">Undertaking Terms and Conditions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="150" maxlength="9750" style="resize:none;" name="_040_of77u_undertaking_terms_and_conditions" id="_040_of77u_undertaking_terms_and_conditions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of77u_undertaking_terms_and_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!--OF77L Requested Local Undertaking Terms and Conditions-->
                            <div class="form-row"><span class="label_body">OF77L</span><span class="label">Requested Local Undertaking Terms and Conditions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="150" maxlength="9750" style="resize:none;" name="_050_of77l_requested_local_undertaking_terms_and_conditions" id="_050_of77l_requested_local_undertaking_terms_and_conditions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of77l_requested_local_undertaking_terms_and_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>
