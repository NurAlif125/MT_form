<%-- 
    Document   : mt708
    Created on : Aug 15, 2018
    Author     : Andhita Deara
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt708.jsp" %>
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
        <c:if test="${item == 'MT:708'}">
            <div id="judul">MT 708 Amendment to a Documentary Credit (Continuation)</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="708" />
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
                            
                                <!-- MF27 -->
                                <div class="form-row"><span class="label_body">MF27</span><span class="label">*Number</span>
                                    <input type="text" name="_010_mf27_number" id="_010_mf27_number" maxlength="1" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" /> 
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Total</span>
                                    <input type="text" name="_011_mf27_total" id="_011_mf27_total" maxlength="8" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                            
                                <!-- MF20 -->
                                <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sender's Reference</span>
                                    <input type="text" name="_020_mf20_sender_reference" id="_020_mf20_sender_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF23 -->
                                <div class="form-row"><span class="label_body">MF23</span><span class="label">*Issuing Bank's Reference</span>
                                    <input type="text" name="_030_mf23_issuing_bank_reference" id="_030_mf23_issuing_bank_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23_issuing_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF26E -->
                                <div class="form-row"><span class="label_body">MF26E</span><span class="label">*Number of Amendment</span>
                                    <input type="text" name="_040_mf26e_number_of_amendment" id="_040_mf26e_number_of_amendment" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf26e_number_of_amendment'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                
                                <!-- MF30 -->
                                <div class="form-row"><span class="label_body">MF30</span><span class="label">*Date of Amendment</span>
                                    <input type="text" name="_050_mf30_date_of_amendment" id="_050_mf30_date_of_amendment" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf30_date_of_amendment'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                
                                <!-- OF45B -->
                                <div class="form-row"><span class="label_body">OF45B</span><span class="label">Description of Goods and/or Services Code</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_060_of45b_description_of_services_narrative" id="_060_of45b_description_of_services_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of45b_description_of_services_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF46B -->
                                <div class="form-row"><span class="label_body">OF46B</span><span class="label">Documents Required</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_070_of46b_documents_require_narrative" id="_070_of46b_documents_require_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of46b_documents_require_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>   
                                </div>
                                <hr/>
                                
                                <!-- OF47B -->
                                <div class="form-row"><span class="label_body">OF47B</span><span class="label">Additional Conditions</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_080_of47b_additional_conditions_narrative" id="_080_of47b_additional_conditions_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of47b_additional_conditions_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>   
                                </div>
                                <hr/>
                                
                                <!-- OF49M -->
                                <div class="form-row"><span class="label_body">OF49M</span><span class="label">Special Payment Conditions for Beneficiary</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_090_of49m_payment_for_beneficiary_narrative" id="_090_of49m_payment_for_beneficiary_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of49m_payment_for_beneficiary_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>   
                                </div>
                                <hr/>
                                
                                <!-- OF49N -->
                                <div class="form-row"><span class="label_body">OF49N</span><span class="label">Special Payment Conditions for Receiving Bank</span>
                                    <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_100_of49n_payment_for_receiving_bank_narrative" id="_100_of49n_payment_for_receiving_bank_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of49n_payment_for_receiving_bank_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>   
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