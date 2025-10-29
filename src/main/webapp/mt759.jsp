<%-- 
    Document   : mt759
    Created on : Sep 24, 2025, 9:00:16?AM
    Author     : mslam
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt759.jsp" %>
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
        <c:if test="${item == 'MT:759'}">
            <div id="judul">MT 759 Ancillary Trade Structured Message</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="759" />
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
                                <div class="form-row"><span class="label_body">MF20</span><span class="label">*Transaction Reference Number</span>
                                    <input type="text" name="_020_mf20_transaction_reference_number" id="_020_mf20_transaction_reference_number" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf20_transaction_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF21 -->
                                <div class="form-row"><span class="label_body">OF21</span><span class="label">Related Reference Number</span>
                                    <input type="text" name="_030_of21_related_reference_number" id="_030_of21_related_reference_number" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of21_related_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF22D -->
                                <div class="form-row"><span class="label_body">MF22D</span><span class="label">*Form of Undertaking</span>
                                    <select id="_040_mf22d_form_of_undertaking" name="_040_mf22d_form_of_undertaking">
                                        <option value="">choose a code</option>
                                        <option value="DGAR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='DGAR'}"> selected="true" </c:if></c:if></c:forEach>>Demand guarantee</option> <!-- - Ordering Customer-->
                                        <option value="DOCR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='DOCR'}"> selected="true" </c:if></c:if></c:forEach>>Documentary credit</option>
                                        <option value="STBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='STBY'}"> selected="true" </c:if></c:if></c:forEach>>Standby letter of credit</option>
                                        <option value="UNDK" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='UNDK'}"> selected="true" </c:if></c:if></c:forEach>>Undertaking</option>
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- OF23 -->
                                <div class="form-row"><span class="label_body">OF23</span><span class="label">Undertaking Number</span>
                                    <input type="text" name="_050_of23_undertaking_number" id="_050_of23_undertaking_number" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of23_undertaking_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF52 -->
                                <div class="form-row"><span class="label_body">OF52</span><span class="label">Issuer</span>
                                    <select id="type_of52_issuer" name="type_of52_issuer">
                                        <option value="">choose a type</option>
                                        <option value="a">A - Party Identifier - Identifier Code</option> <!-- - Ordering Customer-->
                                        <option value="d">D - Party Identifier - Name and Address</option>
                                    </select>
                                    <div id="div_of52a_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_060_of52a_party_identifier" id="_060_of52a_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_061_of52a_identifier_code" id="_061_of52a_identifier_code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div id="div_of52d_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_062_of52d_party_identifier" id="_062_of52d_party_identifier" maxlength="34" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_063_of52d_name_address" id="_063_of52d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- MF23H -->
                                <div class="form-row"><span class="label_body">MF23H</span><span class="label">*Function of Message</span>
                                    <select id="_070_mf23h_function_of_message" name="_070_mf23h_function_of_message">
                                        <option value="">choose a code</option>
                                        <option value="CLSVCLOS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='CLSVCLOS'}"> selected="true" </c:if></c:if></c:forEach>>CLSVCLOS</option> 
                                        <option value="CLSVOPEN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='CLSVOPEN'}"> selected="true" </c:if></c:if></c:forEach>>CLSVOPEN</option>
                                        <option value="FRAUDMSG" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='FRAUDMSG'}"> selected="true" </c:if></c:if></c:forEach>>FRAUDMSG</option>
                                        <option value="GENINFAD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='GENINFAD'}"> selected="true" </c:if></c:if></c:forEach>>GENINFAD</option> 
                                        <option value="ISSAMEND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='ISSAMEND'}"> selected="true" </c:if></c:if></c:forEach>>ISSAMEND</option>
                                        <option value="ISSUANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='ISSUANCE'}"> selected="true" </c:if></c:if></c:forEach>>ISSUANCE</option> 
                                        <option value="OTHERFNC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='OTHERFNC'}"> selected="true" </c:if></c:if></c:forEach>>OTHERFNC</option> 
                                        <option value="REIMBURS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REIMBURS'}"> selected="true" </c:if></c:if></c:forEach>>REIMBURS</option> 
                                        <option value="REQAMEND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REQAMEND'}"> selected="true" </c:if></c:if></c:forEach>>REQAMEND</option> 
                                        <option value="REQFINAN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REQFINAN'}"> selected="true" </c:if></c:if></c:forEach>>REQFINAN</option> 
                                        <option value="REQISSUE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REQISSUE'}"> selected="true" </c:if></c:if></c:forEach>>REQISSUE</option> 
                                        <option value="TRANSFER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='TRANSFER'}"> selected="true" </c:if></c:if></c:forEach>>TRANSFER</option> 
                                    </select>
                                </div>
                                <hr/>
                                
                                <!-- MF45D -->
                                <div class="form-row"><span class="label_body">MF45D</span><span class="label">*Narrative</span>
                                    <textarea cols="65" rows="150" maxlength="9750" wrap="hard" style="resize:none;" name="_080_mf45d_narrative" id="_080_mf45d_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf45d_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF23X -->
                                <div class="form-row"><span class="label_body">OF23X</span><span class="label">File Identification Code</span>
                                    <select id="_090_of23x_file_identification_code" name="_090_of23x_file_identification_code">
                                        <option value="">choose a code</option>
                                        <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification_code'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>Courier delivery</option> 
                                        <option value="EMAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification_code'}"><c:if test="${item.detail=='EMAL'}"> selected="true" </c:if></c:if></c:forEach>>Email transfer</option>
                                        <option value="FACT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification_code'}"><c:if test="${item.detail=='FACT'}"> selected="true" </c:if></c:if></c:forEach>>SWIFTNet FileAct</option>
                                        <option value="FAXT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification_code'}"><c:if test="${item.detail=='FAXT'}"> selected="true" </c:if></c:if></c:forEach>>Fax transfer</option>
                                        <option value="HOST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification_code'}"><c:if test="${item.detail=='HOST'}"> selected="true" </c:if></c:if></c:forEach>>Host-to-Host</option>
                                        <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification_code'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>Postal delivery</option>
                                        <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification_code'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>Other delivery channel</option>
                                    </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">File Name or Reference</span>
                                    <input type="text" name="_091_of23x_file_name_or_reference" id="_091_of23x_file_name_or_reference" maxlength="65" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of23x_file_name_or_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
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