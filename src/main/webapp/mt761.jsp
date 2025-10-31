<%-- 
    Document   : mt761
    Created on : Oct 1, 2025, 10:11:41?AM
    Author     : mslam
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt761.jsp" %>
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
        <c:if test="${item == 'MT:761'}">
            <div id="judul">MT 761 Issue of a Demand Guarantee/Standby Letter of Credit</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="761" />
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

                            <!--MF27 Sequence of Total-->
                            <!--Number-->
                            <div class="form-row"><span class="label_body">MF27</span><span class="label"><a style="color:red;text-decoration:none">*</a>Number</span>                                
                                <input type="text" onkeypress="avoidSplChars(event)" name="_010_mf27_number" id="_010_mf27_number" class="mandatory" maxlength="1" size="1" input_type="MF27 Sequence of Total" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--Total-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Total</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_011_mf27_total" id="_011_mf27_total" class="mandatory" maxlength="1" size="1" input_type="MF27 Sequence of Total" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--MF20 Undertaking Number-->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Undertaking Number</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_020_mf20_undertaking_number" id="_020_mf20_undertaking_number" class="mandatory" maxlength="16" input_type="MF20 Undertaking Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf20_undertaking_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--MF52a Issuer-->
                            <div class="form-row"><span class="label_body">MF52a </span><span class="label"><a style="color:red;text-decoration:none">*</a>Issuer</span>
                                <select id="_030_mf52a_issuer" name="_030_mf52a_issuer" class="mandatory" input_type="MF52a Issuer" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_mf52a_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_031_mf52a_party_identifier" id="_031_mf52a_party_identifier" maxlength="35" input_type="MF52a Issuer" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_032_mf52a_identifier_code" id="_032_mf52a_identifier_code" maxlength="11" class="mandatory" input_type="MF52a Issuer" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_mf52d_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_033_mf52d_party_identifier" id="_033_mf52d_party_identifier" maxlength="35" input_type="MF52a Issuer" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_mf52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_034_mf52d_name_address" id="_034_mf52d_name_address" input_type="MF52a Issuer" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_034_mf52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>        
                                    
                            <!--OF77U Undertaking Terms and Conditions-->
                            <div class="form-row"><span class="label_body">OF77U</span><span class="label">Undertaking Terms and Conditions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="150" maxlength="9750" style="resize:none;" name="_040_of77u_undertaking_terms_and_conditions" id="_040_of77u_undertaking_terms_and_conditions" input_type="OF77U Undertaking Terms and Conditions" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of77u_undertaking_terms_and_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF77L Requested Local Undertaking Terms and Conditions-->
                            <div class="form-row"><span class="label_body">OF77L</span><span class="label">Requested Local Undertaking Terms and Conditions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="150" maxlength="9750" style="resize:none;" name="_050_of77l_requested_local_undertaking_terms_and_conditions" id="_050_of77l_requested_local_undertaking_terms_and_conditions" input_type="OF77L Requested Local Undertaking Terms and Conditions" location="Body" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of77l_requested_local_undertaking_terms_and_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
