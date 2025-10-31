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

                                <!-- MF27 Sequence of Total -->
                                <div class="form-row"><span class="label_body">MF27</span><span class="label"><a style="color:red;text-decoration:none">*</a>Number</span>
                                    <input type="text" name="_010_mf27_number" id="_010_mf27_number" class="mandatory" maxlength="1" size="1" input_type="MF27 Sequence of Total" location="Body" onkeypress="return numbersonly(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Total</span>
                                    <input type="text" name="_011_mf27_total" id="_011_mf27_total" class="mandatory" maxlength="1" size="1" input_type="MF27 Sequence of Total" location="Body" onkeypress="return numbersonly(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF20 Transaction Reference Number -->
                                <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Transaction Reference Number</span>
                                    <input type="text" name="_020_mf20_transaction_reference_number" id="_020_mf20_transaction_reference_number" class="mandatory" maxlength="16" input_type="MF20 Transaction Reference Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf20_transaction_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- OF21 Related Reference Number -->
                                <div class="form-row"><span class="label_body">OF21</span><span class="label">Related Reference Number</span>
                                    <input type="text" name="_030_of21_related_reference_number" id="_030_of21_related_reference_number" maxlength="16" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of21_related_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- MF22D Form of Undertaking -->
                                <div class="form-row"><span class="label_body">MF22D</span><span class="label"><a style="color:red;text-decoration:none">*</a>Form of Undertaking</span>
                                    <select name="_040_mf22d_form_of_undertaking" id="_040_mf22d_form_of_undertaking" class="mandatory" input_type="MF22D Form of Undertaking" location="Body">
                                        <option value="">choose a type</option>
                                        <option value="DGAR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='DGAR'}"> selected="true" </c:if></c:if></c:forEach>>DGAR - Demand Guarantee</option>
                                        <option value="DOCR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='DOCR'}"> selected="true" </c:if></c:if></c:forEach>>DOCR - Documentary Credit</option>
                                        <option value="STBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='STBY'}"> selected="true" </c:if></c:if></c:forEach>>STBY - Standby Letter of Credit</option>
                                        <option value="UNDK" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='UNDK'}"> selected="true" </c:if></c:if></c:forEach>>UNDK - Undertaking</option>
                                    </select>
                                </div>
                                <hr/>

                                <!-- OF23 Undertaking Number -->
                                <div class="form-row"><span class="label_body">OF23</span><span class="label">Undertaking Number</span>
                                    <input type="text" name="_050_of23_undertaking_number" id="_050_of23_undertaking_number" maxlength="16" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of23_undertaking_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>

                                <!-- OF52a Issuer -->
                                <div class="form-row"><span class="label_body">OF52a</span><span class="label">Issuer</span>
                                    <select id="_060_of52a_issuer" name="_060_of52a_issuer">
                                        <option value="">choose a type</option>
                                        <option value="a" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of52a_issuer'}"><c:if test="${item.detail=='A'}"> selected="true" </c:if></c:if></c:forEach>>Option A (BIC)</option>
                                        <option value="d" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of52a_issuer'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>Option D (Name &amp; Address)</option>
                                    </select>
                                </div>

                                <div id="div_060_of52a_A" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_061_of52a_party_identifier" name="_061_of52a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                                        <input type="text" id="_062_of52a_identifier_code" name="_062_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>

                                <div id="div_060_of52a_D" style="display:none;">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" id="_063_of52a_party_identifier" name="_063_of52a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name &amp; Address</span>
                                        <textarea id="_064_of52a_name_address" name="_064_of52a_name_address" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of52a_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <hr/>

                                <!-- MF23H Function of Message --> 
                                <div class="form-row"><span class="label_body">MF23H</span><span class="label"><a style="color:red;text-decoration:none">*</a>Function of Message</span>
                                    <select name="_070_mf23h_function_of_message" id="_070_mf23h_function_of_message" class="mandatory" input_type="MF23H Function of Message" location="Body">
                                        <option value="">choose a type</option>
                                        <option value="CLSVCLOS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='CLSVCLOS'}"> selected="true" </c:if></c:if></c:forEach>>CLSVCLOS - Closing of Service Call</option>
                                        <option value="CLSVOPEN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='CLSVOPEN'}"> selected="true" </c:if></c:if></c:forEach>>CLSVOPEN - Opening of Service Call</option>
                                        <option value="FRAUDMSG" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='FRAUDMSG'}"> selected="true" </c:if></c:if></c:forEach>>FRAUDMSG - Fraud Attempt</option>
                                        <option value="GENINFAD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='GENINFAD'}"> selected="true" </c:if></c:if></c:forEach>>GENINFAD - General Info</option>
                                        <option value="ISSAMEND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='ISSAMEND'}"> selected="true" </c:if></c:if></c:forEach>>ISSAMEND - Amend Free-form Undertaking</option>
                                        <option value="ISSUANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='ISSUANCE'}"> selected="true" </c:if></c:if></c:forEach>>ISSUANCE - Issue Free-form Undertaking</option>
                                        <option value="OTHERFNC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='OTHERFNC'}"> selected="true" </c:if></c:if></c:forEach>>OTHERFNC - Other Request</option>
                                        <option value="PREDENOT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='PREDENOT'}"> selected="true" </c:if></c:if></c:forEach>>PREDENOT - Pre-debit Notification</option>
                                        <option value="REIMBURS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REIMBURS'}"> selected="true" </c:if></c:if></c:forEach>>REIMBURS - Reimbursement Request</option>
                                        <option value="REQAMEND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REQAMEND'}"> selected="true" </c:if></c:if></c:forEach>>REQAMEND - Request to Amend</option>
                                        <option value="REQFINAN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REQFINAN'}"> selected="true" </c:if></c:if></c:forEach>>REQFINAN - Financing Request</option>
                                        <option value="REQISSUE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REQISSUE'}"> selected="true" </c:if></c:if></c:forEach>>REQISSUE - Request to Issue</option>
                                        <option value="REXTMATU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='REXTMATU'}"> selected="true" </c:if></c:if></c:forEach>>REXTMATU - Request Maturity Change</option>
                                        <option value="TRANSFER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf23h_function_of_message'}"><c:if test="${item.detail=='TRANSFER'}"> selected="true" </c:if></c:if></c:forEach>>TRANSFER - Transfer of Undertaking</option>
                                    </select>
                                </div>
                                <hr/>

                                <!-- MF45D Narrative --> 
                                <div class="form-row"><span class="label_body">MF45D</span><span class="label"><a style="color:red;text-decoration:none">*</a>Narrative</span>
                                    <textarea name="_080_mf45d_narrative" id="_080_mf45d_narrative" rows="6" maxlength="9750" class="mandatory" input_type="MF45D Narrative" location="Body" onkeypress="return avoidSplCharsNarrative(event)"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf45d_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!-- OF23X File Identification -->
                                <div class="form-row"><span class="label_body">OF23X</span><span class="label">File Identification</span>
                                    <select name="_090_of23x_file_identification" id="_090_of23x_file_identification">
                                        <option value="">choose a code</option>
                                        <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>COUR - Courier delivery</option>
                                        <option value="EMAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='EMAL'}"> selected="true" </c:if></c:if></c:forEach>>EMAL - Email transfer</option>
                                        <option value="FACT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='FACT'}"> selected="true" </c:if></c:if></c:forEach>>FACT - SWIFTNet FileAct</option>
                                        <option value="FAXT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='FAXT'}"> selected="true" </c:if></c:if></c:forEach>>FAXT - Fax transfer</option>
                                        <option value="HOST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='HOST'}"> selected="true" </c:if></c:if></c:forEach>>HOST - Host-to-Host</option>
                                        <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>MAIL - Postal delivery</option>
                                        <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of23x_file_identification'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR - Other delivery channel</option>
                                    </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">File Name or Reference</span>
                                    <input type="text" name="_091_of23x_file_name" id="_091_of23x_file_name" maxlength="65" placeholder="Filename or reference" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of23x_file_name'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
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