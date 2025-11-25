<%-- 
    Document   : mt543 
    Created on : Nov 5, 2025, 2:03:41 PM
    Author     : Administrator
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt543.jsp" %>
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
        <c:if test="${item == 'MT:543'}">
            <div id="judul">MT 543 Deliver Against Payment</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="543" />
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
                
                                <h2 class="header-title">Mandatory Sequence A General Information</h2>
              <hr/>
              
                <!-- Field 1: MF16R Start of Block -->
                <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                    <input disabled="disabled" id="_010_mf16r_start_of_block_a" name="_010_mf16r_start_of_block_a" input_type="MF16R Start of Block" location="Body" value="GENL" />
                </div>
                <hr/>
                
                <!-- Field 2: MF20C Sender's Message Reference -->
                <div class="form-row"><span class="label_body">MF20C</span><span class="label">Sender's Message Reference</span>
                    <input type="hidden" id="_020_mf20c_sender_reference_a" name="_020_mf20c_sender_reference_a" input_type="MF20C Sender's Message Reference" location="Body" value=":SEME//" />
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Reference</span>
                        <input type="text" onkeypress="avoidSplChars(event)" name="_021_mf20c_reference_a" id="_021_mf20c_reference_a" class="mandatory" maxlength="16" data-swift="16x" input_type="MF20C Sender Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf20c_reference_a'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                </div>
                <hr/>
                
                <!-- Field 3: MF23G Function of the Message -->
                <div class="form-row"><span class="label_body">MF23G</span><span class="label">Function of the Message</span>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Function</span>
                        <select class="mandatory" id="_030_mf23g_function_of_the_message_a" name="_030_mf23g_function_of_the_message_a" input_type="MF23G Function" location="Body">
                            <option value="">choose a type</option>
                            <option value="CANC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23g_function_of_the_message_a'}"><c:if test="${item.detail=='CANC'}"> selected="true" </c:if></c:if></c:forEach>>CANC</option>
                            <option value="NEWM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23g_function_of_the_message_a'}"><c:if test="${item.detail=='NEWM'}"> selected="true" </c:if></c:if></c:forEach>>NEWM</option>
                            <option value="PREA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf23g_function_of_the_message_a'}"><c:if test="${item.detail=='PREA'}"> selected="true" </c:if></c:if></c:forEach>>PREA</option>
                        </select>
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Subfunction</span>
                        <div id="div_opt_mf23g_subfunction_a">
                            <select id="_031_mf23g_subfunction_a" name="_031_mf23g_subfunction_a" input_type="MF23G Subfunction" location="Body">
                                <option value="">choose a type</option>
                                <option value="/CODU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf23g_subfunction_a'}"><c:if test="${item.detail=='/CODU'}"> selected="true" </c:if></c:if></c:forEach>>CODU</option>
                                <option value="/COPY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf23g_subfunction_a'}"><c:if test="${item.detail=='/COPY'}"> selected="true" </c:if></c:if></c:forEach>>COPY</option>
                                <option value="/DUPL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf23g_subfunction_a'}"><c:if test="${item.detail=='/DUPL'}"> selected="true" </c:if></c:if></c:forEach>>DUPL</option>
                                <option value="/RECO" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf23g_subfunction_a'}"><c:if test="${item.detail=='/RECO'}"> selected="true" </c:if></c:if></c:forEach>>RECO</option>
                            </select>
                        </div>
                    </div>
                </div>
                <hr/>              
                
                <!-- Field 4: OF98A Preparation Date/Time -->
                <div class="form-row"><span class="label_body">OF98A</span><span class="label">Preparation Date/Time</span>
                    <div id="div_opt_of98a_a">
                        <select class="selection_div" disabled="disabled" id="type_of98_a" name="type_of98_a" input_type="OF98A Preparation Date/Time" location="Body">
                            <option value="">choose a type</option>
                            <option value="a">A - Date</option>
                            <option value="c">C - Date Time</option>
                            <option value="e">E - Date Time Decimals UTC Indicator</option>
                        </select>
                        <!-- Option A: Date -->
                        <div id="div_of98a_a">
                            <input type="hidden" disabled="disabled" id="_040_of98a_qualifier_a" name="_040_of98a_qualifier_a" input_type="OF98A Qualifier" location="Body" value=":PREP//" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_041_of98a_date_a" name="_041_of98a_date_a" maxlength="8" input_type="OF98A Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of98a_date_a'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option C: Date Time -->
                        <div id="div_of98c_a">
                            <input type="hidden" disabled="disabled" id="_042_of98c_qualifier_a" name="_042_of98c_qualifier_a" input_type="OF98C Qualifier" location="Body" value=":PREP//" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_043_of98c_date_a" name="_043_of98c_date_a" maxlength="8" input_type="OF98C Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_of98c_date_a'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time</span>
                                <input type="text" class="mandatory" data-swift="6!n" disabled="disabled" id="_044_of98c_time_a" name="_044_of98c_time_a" maxlength="6" input_type="OF98C Time" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_044_of98c_time_a'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option E: Date Time Decimals UTC Indicator -->
                        <div id="div_of98e_a">
                            <input type="hidden" disabled="disabled" id="_045_of98e_qualifier_a" name="_045_of98e_qualifier_a" input_type="OF98E Qualifier" location="Body" value=":PREP//" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_046_of98e_date_a" name="_046_of98e_date_a" maxlength="8" input_type="OF98E Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_046_of98e_date_a'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time</span>
                                <input type="text" class="mandatory" data-swift="6!n" disabled="disabled" id="_047_of98e_time_a" name="_047_of98e_time_a" maxlength="6" input_type="OF98E Time" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_047_of98e_time_a'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Decimals</span>
                                <input type="checkbox" disabled="disabled" id="check_of98e_decimals_a" name="check_of98e_decimals_a" />
                                <div id="div_opt_of98e_decimals_a">
                                    <input type="hidden" disabled="disabled" id="_048_of98e_comma_a" name="_048_of98e_comma_a" input_type="OF98E Comma" location="Body" value="," />
                                    <input type="text" data-swift="3n" disabled="disabled" id="_049_of98e_decimals_a" name="_049_of98e_decimals_a" maxlength="3" input_type="OF98E Decimals" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_049_of98e_decimals_a'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">UTC Indicator</span>
                                <input type="checkbox" disabled="disabled" id="check_of98e_utc_indicator_a" name="check_of98e_utc_indicator_a" />
                                <div id="div_opt_of98e_utc_indicator_a">
                                    <input type="hidden" disabled="disabled" id="_0410_of98e_slash_a" name="_0410_of98e_slash_a" input_type="OF98E Slash" location="Body" value="/" />
                                    <input type="text" data-swift="[N]2!n[2!n]" disabled="disabled" id="_0411_of98e_utc_indicator_a" name="_0411_of98e_utc_indicator_a" maxlength="5" input_type="OF98E UTC Indicator" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0411_of98e_utc_indicator_a'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr/>              
                
                <!-- Field 5: OF99A Number Count -->
                <div class="form-row"><span class="label_body">OF99A</span><span class="label">Number Count</span>
                    <div class="template_container" id="template_of99a_a" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of99a_a">Count</span>
                        </div>
                        <select class="selection_div" disabled="disabled" id="type_of99_a" name="type_of99_a" input_type="OF99A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="b">B - 3 Digits</option>
                            <option value="c">C - 6 Digits</option>
                        </select>
                        <!-- Option B: 3 Digits -->
                        <div id="div_of99b_a">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_050_of99b_qualifier_a" name="_050_of99b_qualifier_a" input_type="OF99B Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":SETT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of99b_qualifier_a'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>SETT</option>
                                    <option value=":TOSE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of99b_qualifier_a'}"><c:if test="${item.detail==':TOSE//'}"> selected="true" </c:if></c:if></c:forEach>>TOSE</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                <input type="text" class="mandatory" data-swift="3!n" disabled="disabled" id="_051_of99b_number_a" name="_051_of99b_number_a" maxlength="3" input_type="OF99B Number" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of99b_number_a'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option C: 6 Digits -->
                        <div id="div_of99c_a">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_052_of99c_qualifier_a" name="_052_of99c_qualifier_a" input_type="OF99C Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":SETT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of99c_qualifier_a'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>SETT</option>
                                    <option value=":TOSE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of99c_qualifier_a'}"><c:if test="${item.detail==':TOSE//'}"> selected="true" </c:if></c:if></c:forEach>>TOSE</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                <input type="text" class="mandatory" data-swift="6!n" disabled="disabled" id="_053_of99c_number_a" name="_053_of99c_number_a" maxlength="6" input_type="OF99C Number" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of99c_number_a'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                    <div id="container_of99a_a">
                        <input type="button" class="cust-btn" value="Add Field OF99A" onclick="addContainer(this)" data-id="of99a_a" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of99a_a">0</span>, Max: <span class="max_val" id="max_occ_of99a_a">2</span>, Count: <span class="count_val" id="cur_occ_of99a_a">0</span></span>
                    </div>
                </div>
                <hr/>              
              
                <!-- Subsequence A1 Linkages -->
                <div class="form-row">
                    <h2 class="header-title">Optional Repetitive Subsequence A1 Linkages</h2>
                    <hr/>
                
                    <span class="label_body">A1</span><span class="label">Linkages</span>
                    <div class="template_container" id="template_a1" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_a1">Count</span>
                        </div>
                        
                        <!-- Field 6: MF16R Start of Block -->
                        <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                            <input disabled="disabled" id="_060_mf16r_start_of_block_a1" name="_060_mf16r_start_of_block_a1" input_type="MF16R Start of Block" location="Body" value="LINK" />
                        </div>

                        <!-- Field 7: OF22F Linkage Type Indicator -->
                        <div class="form-row"><span class="label_body">OF22F</span><span class="label">Linkage Type Indicator</span>
                            <input type="checkbox" class="checkbox_div" disabled="disabled" id="check_of22f_a1" name="check_of22f_a1" />
                            <div id="div_opt_of22f_a1">
                                <input type="hidden" disabled="disabled" id="_070_of22f_qualifier_a1" name="_070_of22f_qualifier_a1" input_type="OF22F Qualifier" location="Body" value=":LINK/" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                    <div id="div_opt_of22f_data_source_scheme_a1">
                                        <input type="text" data-swift="8c" disabled="disabled" id="_071_of22f_data_source_scheme_a1" name="_071_of22f_data_source_scheme_a1" maxlength="8" input_type="OF22F Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of22f_data_source_scheme_a1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <input type="hidden" disabled="disabled" id="_072_of22f_slash_a1" name="_072_of22f_slash_a1" input_type="OF22F Slash" location="Body" value="/" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Indicator</span>
                                    <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_073_of22f_indicator_a1" name="_073_of22f_indicator_a1" maxlength="4" input_type="OF22F Indicator" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of22f_indicator_a1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>
                                
                        <!-- Field 8: OF13A Linked Message -->
                        <div class="form-row"><span class="label_body">OF13A</span><span class="label">Linked Message</span>
                            <div id="div_opt_of13a_a1">
                                <select disabled="disabled" class="selection_div" id="type_of13_a1" name="type_of13_a1" input_type="OF13A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Number ID</option>
                                    <option value="b">B - Data Source Scheme Number</option>
                                </select>
                                <!-- Option A: Number ID -->
                                <div id="div_of13a_a1">
                                    <input type="hidden" disabled="disabled" id="_080_of13a_qualifier_a1" name="_080_of13a_qualifier_a1" input_type="OF13A Qualifier" location="Body" value=":LINK//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number ID</span>
                                        <input type="text" class="mandatory" data-swift="3!c" id="_081_of13a_number_id_a1" name="_081_of13a_number_id_a1" maxlength="3" input_type="OF13A Number ID" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of13a_number_id_a1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option B: Data Source Scheme Number -->
                                <div id="div_of13b_a1">
                                    <input type="hidden" disabled="disabled" id="_082_of13b_qualifier_a1" name="_082_of13b_qualifier_a1" input_type="OF13B Qualifier" location="Body" value=":LINK/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>   
                                        <div id="div_opt_of13b_data_source_scheme_a1">
                                            <input type="text" data-swift="8c" id="_083_of13b_data_source_scheme_a1" name="_083_of13b_data_source_scheme_a1" maxlength="8" input_type="OF13B Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of13b_data_source_scheme_a1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_084_of13b_slash_a1" name="_084_of13b_slash_a1" input_type="OF13B Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                        <div id="div_opt_of13b_number_a1">
                                            <input type="text" data-swift="30x" id="_085_of13b_number_a1" name="_085_of13b_number_a1" maxlength="30" input_type="OF13B Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_085_of13b_number_a1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            
                        <!-- Field 9: MF20A Reference -->
                        <div class="form-row"><span class="label_body">MF20A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Reference</span>
                            <select class="selection_div mandatory" disabled="disabled" id="type_mf20_a1" name="type_mf20_a1" input_type="MF20A Type" location="Body">
                                <option value="">choose a type</option>
                                <option value="c">C - Qualifier Reference</option>
                                <option value="n">N - Reference</option>
                                <option value="u">U - UTI Reference</option>
                            </select>
                            <!-- Option C: Qualifier Reference -->
                            <div id="div_mf20c_a1">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                    <select class="mandatory" disabled="disabled" id="_090_mf20c_qualifier_a1" name="_090_mf20c_qualifier_a1" input_type="MF20C Qualifier" location="Body">
                                        <option value="">choose a type</option>
                                        <option value=":POOL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':POOL//'}"> selected="true" </c:if></c:if></c:forEach>>POOL</option>
                                        <option value=":PREA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':PREA//'}"> selected="true" </c:if></c:if></c:forEach>>PREA</option>
                                        <option value=":PREV//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':PREV//'}"> selected="true" </c:if></c:if></c:forEach>>PREV</option>
                                        <option value=":RELA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':RELA//'}"> selected="true" </c:if></c:if></c:forEach>>RELA</option>
                                        <option value=":TRRF//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':TRRF//'}"> selected="true" </c:if></c:if></c:forEach>>TRRF</option>
                                        <option value=":COMM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':COMM//'}"> selected="true" </c:if></c:if></c:forEach>>COMM</option>
                                        <option value=":COLR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':COLR//'}"> selected="true" </c:if></c:if></c:forEach>>COLR</option>
                                        <option value=":CERT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':CERT//'}"> selected="true" </c:if></c:if></c:forEach>>CERT</option>
                                        <option value=":CORP//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':CORP//'}"> selected="true" </c:if></c:if></c:forEach>>CORP</option>
                                        <option value=":CLCI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':CLCI//'}"> selected="true" </c:if></c:if></c:forEach>>CLCI</option>
                                        <option value=":CLTR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':CLTR//'}"> selected="true" </c:if></c:if></c:forEach>>CLTR</option>
                                        <option value=":PCTI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':PCTI//'}"> selected="true" </c:if></c:if></c:forEach>>PCTI</option>
                                        <option value=":TRCI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':TRCI//'}"> selected="true" </c:if></c:if></c:forEach>>TRCI</option>
                                        <option value=":TCTR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf20c_qualifier_a1'}"><c:if test="${item.detail==':TCTR//'}"> selected="true" </c:if></c:if></c:forEach>>TCTR</option>
                                    </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Reference</span>
                                    <input type="text" class="mandatory" data-swift="16x" disabled="disabled" id="_091_mf20c_reference_a1" name="_091_mf20c_reference_a1" maxlength="16" input_type="MF20C Reference" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_mf20c_reference_a1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <!-- Option N: Reference -->
                            <div id="div_mf20n_a1">
                                <input type="hidden" disabled="disabled" id="_092_mf20n_qualifier_a1" name="_092_mf20n_qualifier_a1" input_type="MF20N Qualifier" location="Body" value=":NONC//" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Reference</span>
                                    <input type="text" class="mandatory" data-swift="35x" disabled="disabled" id="_093_mf20n_reference_a1" name="_093_mf20n_reference_a1" maxlength="35" input_type="MF20N Reference" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_mf20n_reference_a1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <!-- Option U: UTI Reference -->
                            <div id="div_mf20u_a1">
                                <input type="hidden" disabled="disabled" id="_094_mf20u_qualifier_a1" name="_094_mf20u_qualifier_a1" input_type="MF20U Qualifier" location="Body" value=":TRRF//" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">UTI Reference</span>
                                    <input type="text" class="mandatory" data-swift="52x" disabled="disabled" id="_095_mf20u_reference_a1" name="_095_mf20u_reference_a1" maxlength="52" input_type="MF20U UTI Reference" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_095_mf20u_reference_a1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>
                                
                        <!-- Field 10: OF36A Quantity of Financial Instrument -->
                        <div class="form-row"><span class="label_body">OF36A</span><span class="label">Quantity of Financial Instrument</span>
                            <div id="div_opt_of36a_a1">
                                <select class="selection_div" disabled="disabled" id="type_of36_a1" name="type_of36_a1" input_type="OF36A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="b">B - Quantity</option>
                                    <option value="d">D - Quantity of Digital Tokens</option>
                                </select>
                                <!-- Option B: Quantity -->
                                <div id="div_of36b_a1">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_100_of36b_qualifier_a1" name="_100_of36b_qualifier_a1" input_type="OF36B Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":PAIR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of36b_qualifier_a1'}"><c:if test="${item.detail==':PAIR/'}"> selected="true" </c:if></c:if></c:forEach>>PAIR</option>
                                            <option value=":TURN/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of36b_qualifier_a1'}"><c:if test="${item.detail==':TURN/'}"> selected="true" </c:if></c:if></c:forEach>>TURN</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity Type Code</span>
                                        <select class="mandatory" disabled="disabled" id="_101_of36b_quantity_type_code_a1" name="_101_of36b_quantity_type_code_a1" input_type="OF36B Quantity Type Code" location="Body">
                                            <option value="">choose a type</option>
                                            <option value="/AMOR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of36b_quantity_type_code_a1'}"><c:if test="${item.detail=='/AMOR/'}"> selected="true" </c:if></c:if></c:forEach>>AMOR</option>
                                            <option value="/FAMT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of36b_quantity_type_code_a1'}"><c:if test="${item.detail=='/FAMT/'}"> selected="true" </c:if></c:if></c:forEach>>FAMT</option>
                                            <option value="/UNIT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of36b_quantity_type_code_a1'}"><c:if test="${item.detail=='/UNIT/'}"> selected="true" </c:if></c:if></c:forEach>>UNIT</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity</span>
                                        <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_102_of36b_quantity_a1" name="_102_of36b_quantity_a1" maxlength="15" input_type="OF36B Quantity" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_of36b_quantity_a1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option D: Quantity of Digital Tokens -->
                                <div id="div_of36d_a1">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_103_of36d_qualifier_a1" name="_103_of36d_qualifier_a1" input_type="OF36D Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":PAIR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_of36d_qualifier_a1'}"><c:if test="${item.detail==':PAIR/'}"> selected="true" </c:if></c:if></c:forEach>>PAIR</option>
                                            <option value=":TURN/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_of36d_qualifier_a1'}"><c:if test="${item.detail==':TURN/'}"> selected="true" </c:if></c:if></c:forEach>>TURN</option>
                                        </select>
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_104_of36d_quantity_type_code_a1" name="_104_of36d_quantity_type_code_a1" input_type="OF36D Quantity Type Code" location="Body" value="/DITU/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity of Digital Tokens</span>
                                        <input type="text" class="mandatory" data-swift="30d" disabled="disabled" id="_105_of36d_quantity_a1" name="_105_of36d_quantity_a1" maxlength="30" input_type="OF36D Quantity of Digital Tokens" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_105_of36d_quantity_a1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                        </div>                                        
              	
                        <!-- Field 11: MF16S End of Block -->
                        <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                            <input disabled="disabled" id="_110_mf16s_end_of_block_a1" name="_110_mf16s_end_of_block_a1" input_type="MF16S End of Block" location="Body" value="LINK" />
                        </div>
                    </div>

                    <div id="container_a1">
                        <input type="button" class="cust-btn" value="Add Field A1" onclick="addTemplateContainer(this)" data-id="a1" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_a1">0</span>, Max: <span class="max_val" id="max_occ_a1">unbounded</span>, Count: <span class="count_val" id="cur_occ_a1">0</span></span>
                    </div>

                    <h2 class="header-title">End of Subsequence A1 Linkages</h2>
                </div>
                <hr/>
              
                <!-- Field 12: MF16S End of Block -->
                <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                    <input disabled="disabled" id="_120_mf16s_end_of_block_a" name="_120_mf16s_end_of_block_a" input_type="MF16S End of Block" location="Body" value="GENL" />
                </div>
                <hr/>

                <h2 class="header-title">End of Sequence A General Information</h2>            
            
                <h2 class="header-title">Mandatory Sequence B Trade Details</h2>
                <hr/>
                
                <!-- Field 13: MF16R Start of Block -->
                <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                    <input disabled="disabled" id="_130_mf16r_start_of_block_b" name="_130_mf16r_start_of_block_b" input_type="MF16R Start of Block" location="Body" value="TRADDET" />
                </div>
                <hr/>
                
                <!-- Field 14: OF94A Place -->
                <div class="form-row"><span class="label_body">OF94A</span><span class="label">Place</span>
                    <div class="template_container" id="template_of94a_b" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of94a_b">Count</span>
                        </div>
                        <select class="selection_div" disabled="disabled" id="type_of94_b" name="type_of94_b" input_type="OF94A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="b">B - Data Source Scheme Place Code Narrative</option>
                            <option value="h">H - Identifier Code</option>
                            <option value="l">L - Legal Entity Identifier</option>
                        </select>
                        <!-- Option B: Data Source Scheme Place Code Narrative -->
                        <div id="div_of94b_b">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_140_of94b_qualifier_b" name="_140_of94b_qualifier_b" input_type="OF94B Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":TRAD/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of94b_qualifier_b'}"><c:if test="${item.detail==':TRAD/'}"> selected="true" </c:if></c:if></c:forEach>>TRAD</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                <input disabled="disabled" id="check_of94b_data_source_scheme_b" name="check_of94b_data_source_scheme_b" type="checkbox" />
                                <div id="div_opt_of94b_data_source_scheme_b">
                                    <input type="text" data-swift="8c" disabled="disabled" id="_141_of94b_data_source_scheme_b" name="_141_of94b_data_source_scheme_b" maxlength="8" input_type="OF94B Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_of94b_data_source_scheme_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <input type="hidden" disabled="disabled" id="_142_of94b_slash_b" name="_142_of94b_slash_b" input_type="OF94B Slash" location="Body" value="/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Place Code</span>
                                <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_143_of94b_place_code_b" name="_143_of94b_place_code_b" maxlength="4" input_type="OF94B Place Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_143_of94b_place_code_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                <input disabled="disabled" id="check_of94b_narrative_b" name="check_of94b_narrative_b" type="checkbox" />
                                <div id="div_opt_of94b_narrative_b">
                                    <input type="hidden" disabled="disabled" id="_144_of94b_slash2_b" name="_144_of94b_slash2_b" input_type="OF94B Slash" location="Body" value="/" />
                                    <input type="text" data-swift="30x" disabled="disabled" id="_145_of94b_narrative_b" name="_145_of94b_narrative_b" maxlength="30" input_type="OF94B Narrative" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_145_of94b_narrative_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>
                        <!-- Option H: Identifier Code -->
                        <div id="div_of94h_b">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_146_of94b_qualifier_b" name="_146_of94b_qualifier_b" input_type="OF94B Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":CLEA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_146_of94l_qualifier_b'}"><c:if test="${item.detail==':CLEA//'}"> selected="true" </c:if></c:if></c:forEach>>CLEA</option>
                                </select>
                            </div>
                            <input type="hidden" disabled="disabled" id="_147_of94h_qualifier_b" name="_147_of94h_qualifier_b" input_type="OF94H Qualifier" location="Body" value=":CLEA/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                <input type="text" class="mandatory" data-swift="4!a2!a2!c[3!c]" disabled="disabled" id="_148_of94h_identifier_code_b" name="_148_of94h_identifier_code_b" maxlength="11" input_type="OF94H Identifier Code" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_148_of94h_identifier_code_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option L: Legal Entity Identifier -->
                        <div id="div_of94l_b">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_149_of94l_qualifier_b" name="_149_of94l_qualifier_b" input_type="OF94L Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":CLEA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_149_of94l_qualifier_b'}"><c:if test="${item.detail==':CLEA//'}"> selected="true" </c:if></c:if></c:forEach>>CLEA</option>
                                    <option value=":TRAD//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_149_of94l_qualifier_b'}"><c:if test="${item.detail==':TRAD//'}"> selected="true" </c:if></c:if></c:forEach>>TRAD</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Legal Entity Identifier</span>
                                <input type="text" class="mandatory" data-swift="18!c2!n" disabled="disabled" id="_14010_of94l_legal_entity_identifier_b" name="_14010_of94l_legal_entity_identifier_b" maxlength="20" input_type="OF94L Legal Entity Identifier" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_14010_of94l_legal_entity_identifier_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                    <div id="container_of94a_b">
                        <input type="button" class="cust-btn" value="Add Field OF94A" onclick="addContainer(this)" data-id="of94a_b" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of94a_b">0</span>, Max: <span class="max_val" id="max_occ_of94a_b">-</span>, Count: <span class="count_val" id="cur_occ_of94a_b">0</span></span>
                    </div>
                </div>
                <hr/>
              
                <!-- Field 15: MF98A Date/Time -->
                <div class="form-row"><span class="label_body">MF98A</span><span class="label">Date/Time</span>
                    <div class="template_container" id="template_mf98a_b" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_mf98a_b">Count</span>
                        </div>
                        <select class="selection_div" disabled="disabled" class="mandatory" id="type_mf98_b" name="type_mf98_b" input_type="MF98A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="a">A - Date</option>
                            <option value="b">B - Data Source Scheme Date Code</option>
                            <option value="c">C - Date Time</option>
                            <option value="e">E - Date Time Decimals UTC Indicator</option>
                        </select>
                        <!-- Option A: Date -->
                        <div id="div_mf98a_b">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_150_mf98a_qualifier_b" name="_150_mf98a_qualifier_b" input_type="MF98A Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":SETT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_mf98a_qualifier_b'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>SETT</option>
                                    <option value=":TRAD//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_mf98a_qualifier_b'}"><c:if test="${item.detail==':TRAD//'}"> selected="true" </c:if></c:if></c:forEach>>TRAD</option>
                                    <option value=":ADEL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_mf98a_qualifier_b'}"><c:if test="${item.detail==':ADEL//'}"> selected="true" </c:if></c:if></c:forEach>>ADEL</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_1501_mf98a_date_b" name="_1501_mf98a_date_b" maxlength="8" input_type="MF98A Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1501_mf98a_date_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option B: Data Source Scheme Date Code -->
                        <div id="div_mf98b_b">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_1502_mf98b_qualifier_b" name="_1502_mf98b_qualifier_b" input_type="MF98B Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":SETT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1502_mf98b_qualifier_b'}"><c:if test="${item.detail==':SETT/'}"> selected="true" </c:if></c:if></c:forEach>>SETT</option>
                                    <option value=":TRAD/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1502_mf98b_qualifier_b'}"><c:if test="${item.detail==':TRAD/'}"> selected="true" </c:if></c:if></c:forEach>>TRAD</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                <input disabled="disabled" id="check_mf98b_data_source_scheme_b" name="check_mf98b_data_source_scheme_b" type="checkbox" />
                                <div id="div_opt_mf98b_data_source_scheme_b">
                                    <input type="text" data-swift="8c" disabled="disabled" id="_1503_mf98b_data_source_scheme_b" name="_1503_mf98b_data_source_scheme_b" maxlength="8" input_type="MF98B Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1503_mf98b_data_source_scheme_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <input type="hidden" disabled="disabled" id="_1504_mf98b_slash_b" name="_1504_mf98b_slash_b" input_type="MF98B Slash" location="Body" value="/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date Code</span>
                                <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_1505_mf98b_date_code_b" name="_1505_mf98b_date_code_b" maxlength="4" input_type="MF98B Date Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1505_mf98b_date_code_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option C: Date Time -->
                        <div id="div_mf98c_b">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_1506_mf98c_qualifier_b" name="_1506_mf98c_qualifier_b" input_type="MF98C Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":SETT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1506_mf98c_qualifier_b'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>SETT</option>
                                    <option value=":TRAD//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1506_mf98c_qualifier_b'}"><c:if test="${item.detail==':TRAD//'}"> selected="true" </c:if></c:if></c:forEach>>TRAD</option>
                                    <option value=":ADEL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1506_mf98c_qualifier_b'}"><c:if test="${item.detail==':ADEL//'}"> selected="true" </c:if></c:if></c:forEach>>ADEL</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_1507_mf98c_date_b" name="_1507_mf98c_date_b" maxlength="8" input_type="MF98C Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1507_mf98c_date_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time</span>
                                <input type="text" class="mandatory" data-swift="6!n" disabled="disabled" id="_1508_mf98c_time_b" name="_1508_mf98c_time_b" maxlength="6" input_type="MF98C Time" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1508_mf98c_time_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option E: Date Time Decimals UTC Indicator -->
                        <div id="div_mf98e_b">
                            <input type="hidden" disabled="disabled" id="_1509_mf98e_qualifier_b" name="_1509_mf98e_qualifier_b" input_type="MF98E Qualifier" location="Body" value=":TRAD//" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_15010_mf98e_date_b" name="_15010_mf98e_date_b" maxlength="8" input_type="MF98E Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_15010_mf98e_date_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time</span>
                                <input type="text" class="mandatory" data-swift="6!n" disabled="disabled" id="_15011_mf98e_time_b" name="_15011_mf98e_time_b" maxlength="6" input_type="MF98E Time" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_15011_mf98e_time_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Decimals</span>
                                <input disabled="disabled" id="check_mf98e_decimals_b" name="check_mf98e_decimals_b" type="checkbox" />
                                <div id="div_opt_mf98e_decimals_b">
                                    <input type="hidden" disabled="disabled" id="_15012_mf98e_comma_b" name="_15012_mf98e_comma_b" input_type="MF98E Comma" location="Body" value="," />
                                    <input type="text" data-swift="3n" disabled="disabled" id="_15013_mf98e_decimals_b" name="_15013_mf98e_decimals_b" maxlength="3" input_type="MF98E Decimals" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_15013_mf98e_decimals_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">UTC Indicator</span>
                                <input disabled="disabled" id="check_mf98e_utc_indicator_b" name="check_mf98e_utc_indicator_b" type="checkbox" />
                                <div id="div_opt_mf98e_utc_indicator_b">
                                    <input type="hidden" disabled="disabled" id="_15014_mf98e_slash_b" name="_15014_mf98e_slash_b" input_type="MF98E Slash" location="Body" value="/" />
                                    <input type="text" data-swift="[N]2!n[2!n]" disabled="disabled" id="_15015_mf98e_utc_indicator_b" name="_15015_mf98e_utc_indicator_b" maxlength="5" input_type="MF98E UTC Indicator" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_15015_mf98e_utc_indicator_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="container_mf98a_b">
                        <input type="button" class="cust-btn" value="Add Field MF98A" onclick="addContainer(this)" data-id="mf98a_b" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_mf98a_b">1</span>, Max: <span class="max_val" id="max_occ_mf98a_b">3</span>, Count: <span class="count_val" id="cur_occ_mf98a_b">0</span></span>
                    </div>
                </div>
                <hr/>

                <!-- Field 16: OF90A Deal Price -->
                <div class="form-row"><span class="label_body">OF90A</span><span class="label">Deal Price</span>
                    <div id="div_opt_of90a_b">
                        <select class="selection_div" disabled="disabled" id="type_of90_b" name="type_of90_b" input_type="OF90A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="a">A - Percentage Type Code Sign Price</option>
                            <option value="b">B - Amount Type Code Currency Price</option>
                        </select>
                        <!-- Option A: Percentage Type Code Sign Price -->
                        <div id="div_of90a_b">
                            <input disabled="disabled" id="_160_of90a_qualifier_b" name="_160_of90a_qualifier_b" input_type="OF90A Qualifier" location="Body" value=":DEAL/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Percentage Type Code</span>
                                <select class="mandatory" disabled="disabled" id="_1601_of90a_percentage_type_code_b" name="_1601_of90a_percentage_type_code_b" input_type="OF90A Percentage Type Code" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="/DISC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1601_of90a_percentage_type_code_b'}"><c:if test="${item.detail=='/DISC/'}"> selected="true" </c:if></c:if></c:forEach>>DISC</option>
                                    <option value="/PRCT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1601_of90a_percentage_type_code_b'}"><c:if test="${item.detail=='/PRCT/'}"> selected="true" </c:if></c:if></c:forEach>>PRCT</option>
                                    <option value="/PREM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1601_of90a_percentage_type_code_b'}"><c:if test="${item.detail=='/PREM/'}"> selected="true" </c:if></c:if></c:forEach>>PREM</option>
                                    <option value="/YIEL/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1601_of90a_percentage_type_code_b'}"><c:if test="${item.detail=='/YIEL/'}"> selected="true" </c:if></c:if></c:forEach>>YIEL</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sign</span>
                                <input disabled="disabled" id="check_of90a_sign_b" name="check_of90a_sign_b" type="checkbox" />
                                <div id="div_opt_of90a_sign_b">
                                    <input type="text" data-swift="N" disabled="disabled" id="_1602_of90a_sign_b" name="_1602_of90a_sign_b" maxlength="1" input_type="OF90A Sign" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1602_of90a_sign_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Price</span>
                                <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_1603_of90a_price_b" name="_1603_of90a_price_b" maxlength="15" input_type="OF90A Price" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1603_of90a_price_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option B: Amount Type Code Currency Price -->
                        <div id="div_of90b_b">
                            <input disabled="disabled" id="_1604_of90b_qualifier_b" name="_1604_of90b_qualifier_b" input_type="OF90B Qualifier" location="Body" value=":DEAL/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount Type Code</span>
                                <select class="mandatory" disabled="disabled" id="_1605_of90b_amount_type_code_b" name="_1605_of90b_amount_type_code_b" input_type="OF90B Amount Type Code" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="/ACTU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1605_of90b_amount_type_code_b'}"><c:if test="${item.detail=='/ACTU/'}"> selected="true" </c:if></c:if></c:forEach>>ACTU</option>
                                    <option value="/DISC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1605_of90b_amount_type_code_b'}"><c:if test="${item.detail=='/DISC/'}"> selected="true" </c:if></c:if></c:forEach>>DISC</option>
                                    <option value="/NEGA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1605_of90b_amount_type_code_b'}"><c:if test="${item.detail=='/NEGA/'}"> selected="true" </c:if></c:if></c:forEach>>NEGA</option>
                                    <option value="/PREM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1605_of90b_amount_type_code_b'}"><c:if test="${item.detail=='/PREM/'}"> selected="true" </c:if></c:if></c:forEach>>PREM</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" class="mandatory" data-swift="3!a" disabled="disabled" id="_1606_of90b_currency_b" name="_1606_of90b_currency_b" maxlength="3" input_type="OF90B Currency" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1606_of90b_currency_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Price</span>
                                <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_1607_of90b_price_b" name="_1607_of90b_price_b" maxlength="15" input_type="OF90B Price" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1607_of90b_price_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                </div>
                <hr/>
              
                <!-- Field 17: OF99A Number of Days Accrued -->
                <div class="form-row"><span class="label_body">OF99A</span><span class="label">Number of Days Accrued</span>
                    <input class="checkbox_div" id="check_of99a_b" name="check_of99a_b" type="checkbox" />
                    <div id="div_opt_of99a_b">
                        <input type="hidden" disabled="disabled" id="_170_of99a_qualifier_b" name="_170_of99a_qualifier_b" input_type="OF99A Qualifier" location="Body" value=":DAAC//" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sign</span>         
                            <div id="div_opt_of99a_sign_b">
                                <input type="text" data-swift="N" disabled="disabled" id="_1701_of99a_sign_b" name="_1701_of99a_sign_b" maxlength="1" input_type="OF99A Sign" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1701_of99a_sign_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                            <input type="text" class="mandatory" data-swift="3!n" disabled="disabled" id="_1702_of99a_number_b" name="_1702_of99a_number_b" maxlength="3" input_type="OF99A Number" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1702_of99a_number_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                </div>
                <hr/>
              
                <!-- Field 18: MF35B Identification of the Financial Instrument -->
                <div class="form-row"><span class="label_body">MF35B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identification of the Financial Instrument</span>
                    <input type="hidden" id="_180_mf35b_isin_prefix_b" name="_180_mf35b_isin_prefix_b" input_type="MF35B ISIN Prefix" location="Body" value="ISIN " />
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identification of Security</span>
                        <input type="text" class="mandatory" data-swift="12!c" id="_1801_mf35b_identification_of_security_b" name="_1801_mf35b_identification_of_security_b" maxlength="12" input_type="MF35B Identification of Security" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1801_mf35b_identification_of_security_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Description of Security</span>
                        <input id="check_mf35b_description_of_security_b" name="check_mf35b_description_of_security_b" type="checkbox" />
                        <div id="div_opt_mf35b_description_of_security_b">
                            <textarea cols="35" rows="4" data-swift="4*35x" id="_1802_mf35b_description_of_security_b" name="_1802_mf35b_description_of_security_b" input_type="MF35B Description of Security" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1802_mf35b_description_of_security_b'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                </div>
                <hr/>
              
                <!-- Subsequence B1 Financial Instrument Attributes -->
                <div class="form-row">
                    <h2 class="header-title">Optional Subsequence B1 Financial Instrument Attributes</h2>
                    <hr/>
                    
                <!-- Field 19: MF16R Start of Block -->
                <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                    <input disabled="disabled" id="_190_mf16r_start_of_block_b1" name="_190_mf16r_start_of_block_b1" input_type="MF16R Start of Block" location="Body" value="FIA" />
                </div>
                
                <!-- Field 20: OF94B Place of Listing -->
                <div class="form-row"><span class="label_body">OF94B</span><span class="label">Place of Listing</span>
                    <input class="checkbox_div" id="check_of94b_b1" name="check_of94b_b1" type="checkbox" />
                    <div id="div_opt_of94b_b1">
                        <input type="hidden" disabled="disabled" id="_200_of94b_qualifier_b1" name="_200_of94b_qualifier_b1" input_type="OF94B Qualifier" location="Body" value=":PLIS/" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                            <input id="check_of94b_data_source_scheme_b1" name="check_of94b_data_source_scheme_b1" type="checkbox" />
                            <div id="div_opt_of94b_data_source_scheme_b1">
                                <input type="text" data-swift="8c" disabled="disabled" id="_2001_of94b_data_source_scheme_b1" name="_2001_of94b_data_source_scheme_b1" maxlength="8" input_type="OF94B Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2001_of94b_data_source_scheme_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <input type="hidden" disabled="disabled" id="_2002_of94b_slash_b1" name="_2002_of94b_slash_b1" input_type="OF94B Slash" location="Body" value="/" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Place Code</span>
                            <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_2003_of94b_place_code_b1" name="_2003_of94b_place_code_b1" maxlength="4" input_type="OF94B Place Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2003_of94b_place_code_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <input type="hidden" disabled="disabled" id="_2004_of94b_slash2_b1" name="_2004_of94b_slash2_b1" input_type="OF94B Slash" location="Body" value="/" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                            <input type="text" class="mandatory" data-swift="30x" disabled="disabled" id="_2005_of94b_narrative_b1" name="_2005_of94b_narrative_b1" maxlength="30" input_type="OF94B Narrative" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2005_of94b_narrative_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                </div>
                
                <!-- Field 21: OF22F Indicator (Repetitive) -->
                <div class="form-row"><span class="label_body">OF22F</span><span class="label">Indicator</span>
                    <div class="template_container" id="template_of22f_b1" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of22f_b1">Count</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                            <select class="mandatory" disabled="disabled" id="_210_of22f_qualifier_b1" name="_210_of22f_qualifier_b1" input_type="OF22F Qualifier" location="Body">
                                <option value="">choose a type</option>
                                <option value=":MICO/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of22f_qualifier_b1'}"><c:if test="${item.detail==':MICO/'}"> selected="true" </c:if></c:if></c:forEach>>MICO</option>
                                <option value=":FORM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of22f_qualifier_b1'}"><c:if test="${item.detail==':FORM/'}"> selected="true" </c:if></c:if></c:forEach>>FORM</option>
                                <option value=":PFRE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of22f_qualifier_b1'}"><c:if test="${item.detail==':PFRE/'}"> selected="true" </c:if></c:if></c:forEach>>PFRE</option>
                                <option value=":PAYS/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of22f_qualifier_b1'}"><c:if test="${item.detail==':PAYS/'}"> selected="true" </c:if></c:if></c:forEach>>PAYS</option>
                                <option value=":CFRE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of22f_qualifier_b1'}"><c:if test="${item.detail==':CFRE/'}"> selected="true" </c:if></c:if></c:forEach>>CFRE</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                            <input disabled="disabled" id="check_of22f_data_source_scheme_b1" name="check_of22f_data_source_scheme_b1" type="checkbox" />
                            <div id="div_opt_of22f_data_source_scheme_b1">
                                <input type="text" data-swift="8c" disabled="disabled" id="_2101_of22f_data_source_scheme_b1" name="_2101_of22f_data_source_scheme_b1" maxlength="8" input_type="OF22F Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2101_of22f_data_source_scheme_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <input type="hidden" disabled="disabled" id="_2102_of22f_slash_b1" name="_2102_of22f_slash_b1" input_type="OF22F Slash" location="Body" value="/" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Indicator</span>
                            <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_2103_of22f_indicator_b1" name="_2103_of22f_indicator_b1" maxlength="4" input_type="OF22F Indicator" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2103_of22f_indicator_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="container_of22f_b1">
                        <input type="button" class="cust-btn" value="Add Field OF22F" onclick="addContainer(this)" data-id="of22f_b1" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of22f_b1">0</span>, Max: <span class="max_val" id="max_occ_of22f_b1">5</span>, Count: <span class="count_val" id="cur_occ_of22f_b1">0</span></span>
                    </div>
                </div>
                        
                <!-- Field 22: OF12A Type of Financial Instrument (Repetitive) -->
                <div class="form-row"><span class="label_body">OF12A</span><span class="label">Type of Financial Instrument</span>
                    <div class="template_container" id="template_of12a_b1" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of12a_b1">Count</span>
                        </div>
                        <select class="selection_div" disabled="disabled" id="type_of12_b1" name="type_of12_b1" input_type="OF12A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="a">A - Data Source Scheme Instrument Code or Description</option>
                            <option value="b">B - Data Source Scheme Instrument Type Code</option>
                            <option value="c">C - CFI Code</option>
                        </select>
                        <!-- Option A: Data Source Scheme Instrument Code or Description -->
                        <div id="div_of12a_b1">
                            <input type="hidden" disabled="disabled" id="_220_of12a_qualifier_b1" name="_220_of12a_qualifier_b1" input_type="OF12A Qualifier" location="Body" value=":CLAS/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                <input disabled="disabled" id="check_of12a_data_source_scheme_b1" name="check_of12a_data_source_scheme_b1" type="checkbox" />
                                <div id="div_opt_of12a_data_source_scheme_b1">
                                    <input type="text" data-swift="8c" disabled="disabled" id="_2201_of12a_data_source_scheme_b1" name="_2201_of12a_data_source_scheme_b1" maxlength="8" input_type="OF12A Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2201_of12a_data_source_scheme_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <input type="hidden" disabled="disabled" id="_2202_of12a_slash_b1" name="_2202_of12a_slash_b1" input_type="OF12A Slash" location="Body" value="/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Instrument Code or Description</span>
                                <input type="text" class="mandatory" data-swift="30x" disabled="disabled" id="_2203_of12a_instrument_code_b1" name="_2203_of12a_instrument_code_b1" maxlength="30" input_type="OF12A Instrument Code or Description" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2203_of12a_instrument_code_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option B: Data Source Scheme Instrument Type Code -->
                        <div id="div_of12b_b1">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_2204_of12b_qualifier_b1" name="_2204_of12b_qualifier_b1" input_type="OF12B Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":OPST//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2204_of12b_qualifier_b1'}"><c:if test="${item.detail==':OPST//'}"> selected="true" </c:if></c:if></c:forEach>>OPST</option>
                                    <option value=":OPTI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2204_of12b_qualifier_b1'}"><c:if test="${item.detail==':OPTI//'}"> selected="true" </c:if></c:if></c:forEach>>OPTI</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                <input disabled="disabled" id="check_of12b_data_source_scheme_b1" name="check_of12b_data_source_scheme_b1" type="checkbox" />
                                <div id="div_opt_of12b_data_source_scheme_b1">
                                    <input type="text" data-swift="8c" disabled="disabled" id="_2205_of12b_data_source_scheme_b1" name="_2205_of12b_data_source_scheme_b1" maxlength="8" input_type="OF12B Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2205_of12b_data_source_scheme_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <input type="hidden" disabled="disabled" id="_2206_of12b_slash_b1" name="_2206_of12b_slash_b1" input_type="OF12B Slash" location="Body" value="/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Instrument Type Code</span>
                                <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_2207_of12b_instrument_type_code_b1" name="_2207_of12b_instrument_type_code_b1" maxlength="4" input_type="OF12B Instrument Type Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2207_of12b_instrument_type_code_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option C: CFI Code -->
                        <div id="div_of12c_b1">
                            <input type="hidden" disabled="disabled" id="_2208_of12c_qualifier_b1" name="_2208_of12c_qualifier_b1" input_type="OF12C Qualifier" location="Body" value=":CLAS/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">CFI Code</span>
                                <input type="text" class="mandatory" data-swift="6!c" disabled="disabled" id="_2209_of12c_cfi_code_b1" name="_2209_of12c_cfi_code_b1" maxlength="6" input_type="OF12C CFI Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2209_of12c_cfi_code_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                    <div id="container_of12a_b1">
                        <input type="button" class="cust-btn" value="Add Field OF12A" onclick="addContainer(this)" data-id="of12a_b1" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of12a_b1">0</span>, Max: <span class="max_val" id="max_occ_of12a_b1">3</span>, Count: <span class="count_val" id="cur_occ_of12a_b1">0</span></span>
                    </div>
                </div>
                        
                <!-- Field 23: OF11A Currency of Denomination -->
                <div class="form-row"><span class="label_body">OF11A</span><span class="label">Currency of Denomination</span>
                    <div id="div_opt_of11a_b1">
                        <input type="hidden" disabled="disabled" id="_230_of11a_qualifier_b1" name="_230_of11a_qualifier_b1" input_type="OF11A Qualifier" location="Body" value=":DENO//" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency Code</span>
                            <div id="div_opt_of11a_currency_code_b1">
                                <input type="text" data-swift="3!a" id="_2301_of11a_currency_code_b1" name="_2301_of11a_currency_code_b1" maxlength="3" input_type="OF11A Currency Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2301_of11a_currency_code_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                </div>
                            
                <!-- Field 24: OF98A Date/Time (Repetitive) -->
                <div class="form-row"><span class="label_body">OF98A</span><span class="label">Date/Time</span>
                    <div class="template_container" id="template_of98a_b1" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of98a_b1">Count</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                            <select class="mandatory" disabled="disabled" id="_240_of98a_qualifier_b1" name="_240_of98a_qualifier_b1" input_type="OF98A Qualifier" location="Body">
                                <option value="">choose a type</option>
                                <option value=":COUP//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of98a_qualifier_b1'}"><c:if test="${item.detail==':COUP//'}"> selected="true" </c:if></c:if></c:forEach>>COUP</option>
                                <option value=":EXPI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of98a_qualifier_b1'}"><c:if test="${item.detail==':EXPI//'}"> selected="true" </c:if></c:if></c:forEach>>EXPI</option>
                                <option value=":FRNR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of98a_qualifier_b1'}"><c:if test="${item.detail==':FRNR//'}"> selected="true" </c:if></c:if></c:forEach>>FRNR</option>
                                <option value=":MATU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of98a_qualifier_b1'}"><c:if test="${item.detail==':MATU//'}"> selected="true" </c:if></c:if></c:forEach>>MATU</option>
                                <option value=":ISSU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of98a_qualifier_b1'}"><c:if test="${item.detail==':ISSU//'}"> selected="true" </c:if></c:if></c:forEach>>ISSU</option>
                                <option value=":CALD//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of98a_qualifier_b1'}"><c:if test="${item.detail==':CALD//'}"> selected="true" </c:if></c:if></c:forEach>>CALD</option>
                                <option value=":PUTT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of98a_qualifier_b1'}"><c:if test="${item.detail==':PUTT//'}"> selected="true" </c:if></c:if></c:forEach>>PUTT</option>
                                <option value=":DDTE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of98a_qualifier_b1'}"><c:if test="${item.detail==':DDTE//'}"> selected="true" </c:if></c:if></c:forEach>>DDTE</option>
                                <option value=":FCOU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of98a_qualifier_b1'}"><c:if test="${item.detail==':FCOU//'}"> selected="true" </c:if></c:if></c:forEach>>FCOU</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                            <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_2401_of98a_date_b1" name="_2401_of98a_date_b1" maxlength="8" input_type="OF98A Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2401_of98a_date_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="container_of98a_b1">
                        <input type="button" class="cust-btn" value="Add Field OF98A" onclick="addContainer(this)" data-id="of98a_b1" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of98a_b1">0</span>, Max: <span class="max_val" id="max_occ_of98a_b1">9</span>, Count: <span class="count_val" id="cur_occ_of98a_b1">0</span></span>
                    </div>
                </div>
                            
                <!-- Field 25: OF92A Rate (Repetitive) -->
                <div class="form-row"><span class="label_body">OF92A</span><span class="label">Rate</span>
                    <div class="template_container" id="template_of92a_b1" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of92a_b1">Count</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                            <select class="mandatory" disabled="disabled" id="_250_of92a_qualifier_b1" name="_250_of92a_qualifier_b1" input_type="OF92A Qualifier" location="Body">
                                <option value="">choose a type</option>
                                <option value=":PRFC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of92a_qualifier_b1'}"><c:if test="${item.detail==':PRFC//'}"> selected="true" </c:if></c:if></c:forEach>>PRFC</option>
                                <option value=":CUFC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of92a_qualifier_b1'}"><c:if test="${item.detail==':CUFC//'}"> selected="true" </c:if></c:if></c:forEach>>CUFC</option>
                                <option value=":NWFC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of92a_qualifier_b1'}"><c:if test="${item.detail==':NWFC//'}"> selected="true" </c:if></c:if></c:forEach>>NWFC</option>
                                <option value=":INTR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of92a_qualifier_b1'}"><c:if test="${item.detail==':INTR//'}"> selected="true" </c:if></c:if></c:forEach>>INTR</option>
                                <option value=":NXRT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of92a_qualifier_b1'}"><c:if test="${item.detail==':NXRT//'}"> selected="true" </c:if></c:if></c:forEach>>NXRT</option>
                                <option value=":INDX//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of92a_qualifier_b1'}"><c:if test="${item.detail==':INDX//'}"> selected="true" </c:if></c:if></c:forEach>>INDX</option>
                                <option value=":YTMR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of92a_qualifier_b1'}"><c:if test="${item.detail==':YTMR//'}"> selected="true" </c:if></c:if></c:forEach>>YTMR</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sign</span>
                            <input disabled="disabled" id="check_of92a_sign_b1" name="check_of92a_sign_b1" type="checkbox" />
                            <div id="div_opt_of92a_sign_b1">
                                <input type="text" data-swift="N" disabled="disabled" id="_2501_of92a_sign_b1" name="_2501_of92a_sign_b1" maxlength="1" input_type="OF92A Sign" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2501_of92a_sign_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Rate</span>
                            <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_2502_of92a_rate_b1" name="_2502_of92a_rate_b1" maxlength="15" input_type="OF92A Rate" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2502_of92a_rate_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="container_of92a_b1">
                        <input type="button" class="cust-btn" value="Add Field OF92A" onclick="addContainer(this)" data-id="of92a_b1" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of92a_b1">0</span>, Max: <span class="max_val" id="max_occ_of92a_b1">7</span>, Count: <span class="count_val" id="cur_occ_of92a_b1">0</span></span>
                    </div>
                </div>
                        
                <!-- Field 26: OF13A Number Identification (Repetitive) -->
                <div class="form-row"><span class="label_body">OF13A</span><span class="label">Number Identification</span>
                    <div class="template_container" id="template_of13a_b1" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of13a_b1">Count</span>
                        </div>
                        <select class="selection_div" disabled="disabled" id="type_of13_b1" name="type_of13_b1" input_type="OF13A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="a">A - Number Id</option>
                            <option value="b">B - Data Source Scheme Number</option>
                        </select>
                        <!-- Option A: Number Id -->
                        <div id="div_of13a_b1">
                            <input type="hidden" disabled="disabled" id="_260_of13a_qualifier_b1" name="_260_of13a_qualifier_b1" input_type="OF13A Qualifier" location="Body" value=":COUP//" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number Id</span>
                                <input type="text" class="mandatory" data-swift="3!c" disabled="disabled" id="_2601_of13a_number_id_b1" name="_2601_of13a_number_id_b1" maxlength="3" input_type="OF13A Number Id" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2601_of13a_number_id_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option B: Data Source Scheme Number -->
                        <div id="div_of13b_b1">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_2602_of13b_qualifier_b1" name="_2602_of13b_qualifier_b1" input_type="OF13B Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":COUP/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2602_of13b_qualifier_b1'}"><c:if test="${item.detail==':COUP/'}"> selected="true" </c:if></c:if></c:forEach>>COUP</option>
                                    <option value=":POOL/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2602_of13b_qualifier_b1'}"><c:if test="${item.detail==':POOL/'}"> selected="true" </c:if></c:if></c:forEach>>POOL</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                <input disabled="disabled" id="check_of13b_data_source_scheme_b1" name="check_of13b_data_source_scheme_b1" type="checkbox" />
                                <div id="div_opt_of13b_data_source_scheme_b1">
                                    <input type="text" data-swift="8c" disabled="disabled" id="_2603_of13b_data_source_scheme_b1" name="_2603_of13b_data_source_scheme_b1" maxlength="8" input_type="OF13B Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2603_of13b_data_source_scheme_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <input type="hidden" disabled="disabled" id="_2604_of13b_slash_b1" name="_2604_of13b_slash_b1" input_type="OF13B Slash" location="Body" value="/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                <input type="text" class="mandatory" data-swift="30x" disabled="disabled" id="_2605_of13b_number_b1" name="_2605_of13b_number_b1" maxlength="30" input_type="OF13B Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2605_of13b_number_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                    <div id="container_of13a_b1">
                        <input type="button" class="cust-btn" value="Add Field OF13A" onclick="addContainer(this)" data-id="of13a_b1" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of13a_b1">0</span>, Max: <span class="max_val" id="max_occ_of13a_b1">2</span>, Count: <span class="count_val" id="cur_occ_of13a_b1">0</span></span>
                    </div>
                </div>
                        
                <!-- Field 27: OF17B Flag (Repetitive) -->
                <div class="form-row"><span class="label_body">OF17B</span><span class="label">Flag</span>
                    <div class="template_container" id="template_of17b_b1" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of17b_b1">Count</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                            <select class="mandatory" disabled="disabled" id="_270_of17b_qualifier_b1" name="_270_of17b_qualifier_b1" input_type="OF17B Qualifier" location="Body">
                                <option value="">choose a type</option>
                                <option value=":FRNF//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of17b_qualifier_b1'}"><c:if test="${item.detail==':FRNF//'}"> selected="true" </c:if></c:if></c:forEach>>FRNF</option>
                                <option value=":CALL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of17b_qualifier_b1'}"><c:if test="${item.detail==':CALL//'}"> selected="true" </c:if></c:if></c:forEach>>CALL</option>
                                <option value=":PUTT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of17b_qualifier_b1'}"><c:if test="${item.detail==':PUTT//'}"> selected="true" </c:if></c:if></c:forEach>>PUTT</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Flag</span>
                            <select class="mandatory" disabled="disabled" id="_2701_of17b_flag_b1" name="_2701_of17b_flag_b1" input_type="OF17B Flag" location="Body">
                                <option value="">choose a type</option>
                                <option value="N" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2701_of17b_flag_b1'}"><c:if test="${item.detail=='N'}"> selected="true" </c:if></c:if></c:forEach>>N</option>
                                <option value="Y" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2701_of17b_flag_b1'}"><c:if test="${item.detail=='Y'}"> selected="true" </c:if></c:if></c:forEach>>Y</option>
                            </select>
                        </div>
                    </div>
                    <div id="container_of17b_b1">
                        <input type="button" class="cust-btn" value="Add Field OF17B" onclick="addContainer(this)" data-id="of17b_b1" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of17b_b1">0</span>, Max: <span class="max_val" id="max_occ_of17b_b1">3</span>, Count: <span class="count_val" id="cur_occ_of17b_b1">0</span></span>
                    </div>
                </div>
                            
                <!-- Field 28: OF90A Price (Repetitive) -->
                <div class="form-row"><span class="label_body">OF90A</span><span class="label">Price</span>
                    <div class="template_container" id="template_of90a_b1" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of90a_b1">Count</span>
                        </div>
                        <select class="selection_div" disabled="disabled" id="type_of90_b1" name="type_of90_b1" input_type="OF90A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="a">A - Percentage Type Code Sign Price</option>
                            <option value="b">B - Amount Type Code Currency Price</option>
                        </select>
                        <!-- Option A: Percentage Type Code Sign Price -->
                        <div id="div_of90a_b1">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_280_of90a_qualifier_b1" name="_280_of90a_qualifier_b1" input_type="OF90A Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":INDC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of90a_qualifier_b1'}"><c:if test="${item.detail==':INDC//'}"> selected="true" </c:if></c:if></c:forEach>>INDC</option>
                                    <option value=":MRKT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of90a_qualifier_b1'}"><c:if test="${item.detail==':MRKT//'}"> selected="true" </c:if></c:if></c:forEach>>MRKT</option>
                                    <option value=":EXER//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of90a_qualifier_b1'}"><c:if test="${item.detail==':EXER//'}"> selected="true" </c:if></c:if></c:forEach>>EXER</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Percentage Type Code</span>
                                <select class="mandatory" disabled="disabled" id="_2801_of90a_percentage_type_code_b1" name="_2801_of90a_percentage_type_code_b1" input_type="OF90A Percentage Type Code" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="/DISC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2801_of90a_percentage_type_code_b1'}"><c:if test="${item.detail=='/DISC/'}"> selected="true" </c:if></c:if></c:forEach>>DISC</option>
                                    <option value="/PRCT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2801_of90a_percentage_type_code_b1'}"><c:if test="${item.detail=='/PRCT/'}"> selected="true" </c:if></c:if></c:forEach>>PRCT</option>
                                    <option value="/PREM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2801_of90a_percentage_type_code_b1'}"><c:if test="${item.detail=='/PREM/'}"> selected="true" </c:if></c:if></c:forEach>>PREM</option>
                                    <option value="/YIEL/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2801_of90a_percentage_type_code_b1'}"><c:if test="${item.detail=='/YIEL/'}"> selected="true" </c:if></c:if></c:forEach>>YIEL</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sign</span>
                                <input disabled="disabled" id="check_of90a_sign_b1" name="check_of90a_sign_b1" type="checkbox" />
                                <div id="div_opt_of90a_sign_b1">
                                    <input type="text" data-swift="N" disabled="disabled" id="_2802_of90a_sign_b1" name="_2802_of90a_sign_b1" maxlength="1" input_type="OF90A Sign" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2802_of90a_sign_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Price</span>
                                <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_2803_of90a_price_b1" name="_2803_of90a_price_b1" maxlength="15" input_type="OF90A Price" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2803_of90a_price_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option B: Amount Type Code Currency Price -->
                        <div id="div_of90b_b1">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_2804_of90b_qualifier_b1" name="_2804_of90b_qualifier_b1" input_type="OF90B Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":INDC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2804_of90b_qualifier_b1'}"><c:if test="${item.detail==':INDC//'}"> selected="true" </c:if></c:if></c:forEach>>INDC</option>
                                    <option value=":MRKT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2804_of90b_qualifier_b1'}"><c:if test="${item.detail==':MRKT//'}"> selected="true" </c:if></c:if></c:forEach>>MRKT</option>
                                    <option value=":EXER//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2804_of90b_qualifier_b1'}"><c:if test="${item.detail==':EXER//'}"> selected="true" </c:if></c:if></c:forEach>>EXER</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount Type Code</span>
                                <select class="mandatory" disabled="disabled" id="_2805_of90b_amount_type_code_b1" name="_2805_of90b_amount_type_code_b1" input_type="OF90B Amount Type Code" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="/ACTU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2805_of90b_amount_type_code_b1'}"><c:if test="${item.detail=='/ACTU/'}"> selected="true" </c:if></c:if></c:forEach>>ACTU</option>
                                    <option value="/DISC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2805_of90b_amount_type_code_b1'}"><c:if test="${item.detail=='/DISC/'}"> selected="true" </c:if></c:if></c:forEach>>DISC</option>
                                    <option value="/PREM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2805_of90b_amount_type_code_b1'}"><c:if test="${item.detail=='/PREM/'}"> selected="true" </c:if></c:if></c:forEach>>PREM</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" class="mandatory" data-swift="3!a" disabled="disabled" id="_2806_of90b_currency_b1" name="_2806_of90b_currency_b1" maxlength="3" input_type="OF90B Currency" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2806_of90b_currency_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Price</span>
                                <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_2807_of90b_price_b1" name="_2807_of90b_price_b1" maxlength="15" input_type="OF90B Price" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2807_of90b_price_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                    <div id="container_of90a_b1">
                        <input type="button" class="cust-btn" value="Add Field OF90A" onclick="addContainer(this)" data-id="of90a_b1" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of90a_b1">0</span>, Max: <span class="max_val" id="max_occ_of90a_b1">2</span>, Count: <span class="count_val" id="cur_occ_of90a_b1">0</span></span>
                    </div>
                </div>
                            
                <!-- Field 29: OF36A Quantity of Financial Instrument (Repetitive) -->
                <div class="form-row"><span class="label_body">OF36A</span><span class="label">Quantity of Financial Instrument</span>
                    <div class="template_container" id="template_of36a_b1" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of36a_b1">Count</span>
                        </div>
                        <select class="selection_div" disabled="disabled" id="type_of36_b1" name="type_of36_b1" input_type="OF36A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="b">B - Quantity</option>
                            <option value="d">D - Quantity of Digital Tokens</option>
                        </select>
                        <!-- Option B: Quantity -->
                        <div id="div_of36b_b1">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_290_of36b_qualifier_b1" name="_290_of36b_qualifier_b1" input_type="OF36B Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":MINO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of36b_qualifier_b1'}"><c:if test="${item.detail==':MINO//'}"> selected="true" </c:if></c:if></c:forEach>>MINO</option>
                                    <option value=":SIZE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of36b_qualifier_b1'}"><c:if test="${item.detail==':SIZE//'}"> selected="true" </c:if></c:if></c:forEach>>SIZE</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity Type Code</span>
                                <select class="mandatory" disabled="disabled" id="_2901_of36b_quantity_type_code_b1" name="_2901_of36b_quantity_type_code_b1" input_type="OF36B Quantity Type Code" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="/AMOR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2901_of36b_quantity_type_code_b1'}"><c:if test="${item.detail=='/AMOR/'}"> selected="true" </c:if></c:if></c:forEach>>AMOR</option>
                                    <option value="/FAMT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2901_of36b_quantity_type_code_b1'}"><c:if test="${item.detail=='/FAMT/'}"> selected="true" </c:if></c:if></c:forEach>>FAMT</option>
                                    <option value="/UNIT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2901_of36b_quantity_type_code_b1'}"><c:if test="${item.detail=='/UNIT/'}"> selected="true" </c:if></c:if></c:forEach>>UNIT</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity</span>
                                <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_2902_of36b_quantity_b1" name="_2902_of36b_quantity_b1" maxlength="15" input_type="OF36B Quantity" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2902_of36b_quantity_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option D: Quantity of Digital Tokens -->
                        <div id="div_of36d_b1">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_2903_of36d_qualifier_b1" name="_2903_of36d_qualifier_b1" input_type="OF36D Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":MINO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2903_of36d_qualifier_b1'}"><c:if test="${item.detail==':MINO//'}"> selected="true" </c:if></c:if></c:forEach>>MINO</option>
                                    <option value=":SIZE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2903_of36d_qualifier_b1'}"><c:if test="${item.detail==':SIZE//'}"> selected="true" </c:if></c:if></c:forEach>>SIZE</option>
                                </select>
                            </div>
                            <input type="hidden" disabled="disabled" id="_2904_of36d_quantity_type_code_b1" name="_2904_of36d_quantity_type_code_b1" input_type="OF36D Quantity Type Code" location="Body" value="/DITU/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity of Digital Tokens</span>
                                <input type="text" class="mandatory" data-swift="30d" disabled="disabled" id="_2905_of36d_quantity_b1" name="_2905_of36d_quantity_b1" maxlength="30" input_type="OF36D Quantity of Digital Tokens" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2905_of36d_quantity_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                    <div id="container_of36a_b1">
                        <input type="button" class="cust-btn" value="Add Field OF36A" onclick="addContainer(this)" data-id="of36a_b1" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of36a_b1">0</span>, Max: <span class="max_val" id="max_occ_of36a_b1">2</span>, Count: <span class="count_val" id="cur_occ_of36a_b1">0</span></span>
                    </div>
                </div>
                            
                <!-- Field 30: OF35B Identification of the Financial Instrument (Repetitive) -->
                <div class="form-row"><span class="label_body">OF35B</span><span class="label">Identification of the Financial Instrument</span>
                    <div class="template_container" id="template_of35b_b1" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of35b_b1">Count</span>
                        </div>
                        <input type="hidden" disabled="disabled" id="_300_of35b_isin_prefix_b1" name="_300_of35b_isin_prefix_b1" input_type="OF35B ISIN Prefix" location="Body" value="ISIN " />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identification of Security</span>
                            <input type="text" class="mandatory" data-swift="12!c" disabled="disabled" id="_3001_of35b_identification_of_security_b1" name="_3001_of35b_identification_of_security_b1" maxlength="12" input_type="OF35B Identification of Security" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3001_of35b_identification_of_security_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Description of Security</span>
                            <input disabled="disabled" id="check_of35b_description_of_security_b1" name="check_of35b_description_of_security_b1" type="checkbox" />
                            <div id="div_opt_of35b_description_of_security_b1">
                                <textarea cols="35" rows="4" data-swift="4*35x" disabled="disabled" id="_3002_of35b_description_of_security_b1" name="_3002_of35b_description_of_security_b1" input_type="OF35B Description of Security" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3002_of35b_description_of_security_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                        </div>
                    </div>
                    <div id="container_of35b_b1">
                        <input type="button" class="cust-btn" value="Add Field OF35B" onclick="addContainer(this)" data-id="of35b_b1" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of35b_b1">0</span>, Max: <span class="max_val" id="max_occ_of35b_b1">-</span>, Count: <span class="count_val" id="cur_occ_of35b_b1">0</span></span>
                    </div>
                </div>
                            
                <!-- Field 31: OF70E Financial Instrument Attribute Narrative -->
                <div class="form-row"><span class="label_body">OF70E</span><span class="label">Financial Instrument Attribute Narrative</span>     
                    <div id="div_opt_of70e_b1">
                        <input type="hidden" disabled="disabled" id="_310_of70e_qualifier_b1" name="_310_of70e_qualifier_b1" input_type="OF70E Qualifier" location="Body" value=":FIAN//" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                            <div id="div_opt_of70e_narrative_b1">
                                <textarea cols="35" rows="10" data-swift="10*35x" disabled="disabled" id="_3101_of70e_narrative_b1" name="_3101_of70e_narrative_b1" input_type="OF70E Narrative" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3101_of70e_narrative_b1'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                     
                <!-- Field 32: MF16S End of Block -->
                <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                    <input disabled="disabled" id="_320_mf16s_end_of_block_b1" name="_320_mf16s_end_of_block_b1" input_type="MF16S End of Block" location="Body" value="FIA" />
                </div>

                    <h2 class="header-title">End of Subsequence B1 Financial Instrument Attributes</h2>
                </div>
                <hr/>
                            
                <!-- Field 33: OF22F Indicator (Repetitive) -->
                <div class="form-row"><span class="label_body">OF22F</span><span class="label">Indicator</span>
                    <div class="template_container" id="template_of22f_b" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of22f_b">Count</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                            <select class="mandatory" disabled="disabled" id="_330_of22f_qualifier_b" name="_330_of22f_qualifier_b" input_type="OF22F Qualifier" location="Body">
                                <option value="">choose a type</option>
                                <option value=":PROC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of22f_qualifier_b'}"><c:if test="${item.detail==':PROC/'}"> selected="true" </c:if></c:if></c:forEach>>PROC</option>
                                <option value=":RPOR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of22f_qualifier_b'}"><c:if test="${item.detail==':RPOR/'}"> selected="true" </c:if></c:if></c:forEach>>RPOR</option>
                                <option value=":PRIR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of22f_qualifier_b'}"><c:if test="${item.detail==':PRIR/'}"> selected="true" </c:if></c:if></c:forEach>>PRIR</option>
                                <option value=":BORR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of22f_qualifier_b'}"><c:if test="${item.detail==':BORR/'}"> selected="true" </c:if></c:if></c:forEach>>BORR</option>
                                <option value=":TTCO/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of22f_qualifier_b'}"><c:if test="${item.detail==':TTCO/'}"> selected="true" </c:if></c:if></c:forEach>>TTCO</option>
                                <option value=":INCA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of22f_qualifier_b'}"><c:if test="${item.detail==':INCA/'}"> selected="true" </c:if></c:if></c:forEach>>INCA</option>
                                <option value=":TRCA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of22f_qualifier_b'}"><c:if test="${item.detail==':TRCA/'}"> selected="true" </c:if></c:if></c:forEach>>TRCA</option>
                                <option value=":PRIC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of22f_qualifier_b'}"><c:if test="${item.detail==':PRIC/'}"> selected="true" </c:if></c:if></c:forEach>>PRIC</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                            <input disabled="disabled" id="check_of22f_data_source_scheme_b" name="check_of22f_data_source_scheme_b" type="checkbox" />
                            <div id="div_opt_of22f_data_source_scheme_b">
                                <input type="text" data-swift="8c" disabled="disabled" id="_3301_of22f_data_source_scheme_b" name="_3301_of22f_data_source_scheme_b" maxlength="8" input_type="OF22F Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3301_of22f_data_source_scheme_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <input type="hidden" disabled="disabled" id="_3302_of22f_slash_b" name="_3302_of22f_slash_b" input_type="OF22F Slash" location="Body" value="/" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Indicator</span>
                            <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_3303_of22f_indicator_b" name="_3303_of22f_indicator_b" maxlength="4" input_type="OF22F Indicator" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3303_of22f_indicator_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="container_of22f_b">
                        <input type="button" class="cust-btn" value="Add Field OF22F" onclick="addContainer(this)" data-id="of22f_b" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of22f_b">0</span>, Max: <span class="max_val" id="max_occ_of22f_b">-</span>, Count: <span class="count_val" id="cur_occ_of22f_b">0</span></span>
                    </div>
                </div>
                <hr/>
              
                <!-- Field 34: OF11A Currency to Buy -->
                <div class="form-row"><span class="label_body">OF11A</span><span class="label">Currency to Buy</span>
                    <div id="div_opt_of11a_b">
                        <input type="hidden" disabled="disabled" id="_340_of11a_qualifier_b" name="_340_of11a_qualifier_b" input_type="OF11A Qualifier" location="Body" value=":FXIB//" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency Code</span>
                            <div id="div_opt_of11a_currency_code_b">
                                <input type="text" data-swift="3!a" disabled="disabled" id="_3401_of11a_currency_code_b" name="_3401_of11a_currency_code_b" maxlength="3" input_type="OF11A Currency Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3401_of11a_currency_code_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                </div>
                <hr/>
                
                <!-- Field 35: OF25D Status Code (Repetitive) -->
                <div class="form-row"><span class="label_body">OF25D</span><span class="label">Status Code</span>
                    <div class="template_container" id="template_of25d_b" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of25d_b">Count</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                            <select class="mandatory" disabled="disabled" id="_350_of25d_qualifier_b" name="_350_of25d_qualifier_b" input_type="OF25D Qualifier" location="Body">
                                <option value="">choose a type</option>
                                <option value=":MTCH/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_of25d_qualifier_b'}"><c:if test="${item.detail==':MTCH/'}"> selected="true" </c:if></c:if></c:forEach>>MTCH</option>
                                <option value=":AFFM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_of25d_qualifier_b'}"><c:if test="${item.detail==':AFFM/'}"> selected="true" </c:if></c:if></c:forEach>>AFFM</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                            <input disabled="disabled" id="check_of25d_data_source_scheme_b" name="check_of25d_data_source_scheme_b" type="checkbox" />
                            <div id="div_opt_of25d_data_source_scheme_b">
                                <input type="text" data-swift="8c" disabled="disabled" id="_3501_of25d_data_source_scheme_b" name="_3501_of25d_data_source_scheme_b" maxlength="8" input_type="OF25D Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3501_of25d_data_source_scheme_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <input type="hidden" disabled="disabled" id="_3502_of25d_slash_b" name="_3502_of25d_slash_b" input_type="OF25D Slash" location="Body" value="/" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Status Code</span>
                            <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_3503_of25d_status_code_b" name="_3503_of25d_status_code_b" maxlength="4" input_type="OF25D Status Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3503_of25d_status_code_b'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="container_of25d_b">
                        <input type="button" class="cust-btn" value="Add Field OF25D" onclick="addContainer(this)" data-id="of25d_b" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of25d_b">0</span>, Max: <span class="max_val" id="max_occ_of25d_b">2</span>, Count: <span class="count_val" id="cur_occ_of25d_b">0</span></span>
                    </div>
                </div>
                <hr/>
              
                <!-- Field 36: OF70E Narrative (Repetitive) -->
                <div class="form-row"><span class="label_body">OF70E</span><span class="label">Narrative</span>
                    <div class="template_container" id="template_of70e_b" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of70e_b">Count</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                            <select class="mandatory" disabled="disabled" id="_360_of70e_qualifier_b" name="_360_of70e_qualifier_b" input_type="OF70E Qualifier" location="Body">
                                <option value="">choose a type</option>
                                <option value=":FXIN//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of70e_qualifier_b'}"><c:if test="${item.detail==':FXIN//'}"> selected="true" </c:if></c:if></c:forEach>>FXIN</option>
                                <option value=":SPRO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of70e_qualifier_b'}"><c:if test="${item.detail==':SPRO//'}"> selected="true" </c:if></c:if></c:forEach>>SPRO</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                            <textarea class="mandatory" cols="35" rows="10" data-swift="10*35x" disabled="disabled" id="_3601_of70e_narrative_b" name="_3601_of70e_narrative_b" input_type="OF70E Narrative" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3601_of70e_narrative_b'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                    <div id="container_of70e_b">
                        <input type="button" class="cust-btn" value="Add Field OF70E" onclick="addContainer(this)" data-id="of70e_b" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of70e_b">0</span>, Max: <span class="max_val" id="max_occ_of70e_b">2</span>, Count: <span class="count_val" id="cur_occ_of70e_b">0</span></span>
                    </div>
                </div>
                <hr/>
              
                <!-- Field 37: MF16S End of Block -->
                <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                    <input disabled="disabled" id="_370_mf16s_end_of_block_b" name="_370_mf16s_end_of_block_b" input_type="MF16S End of Block" location="Body" value="TRADDET" />
                </div>
                <hr/>
                
                <h2 class="header-title">End of Sequence B Trade Details</h2>            

                <h2 class="header-title">Mandatory Sequence C Financial Instrument/Account</h2>
                <hr/>  
              
                <!-- Field 38: MF16R Start of Block -->
                <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                    <input disabled="disabled" id="_380_mf16r_start_of_block_c" name="_380_mf16r_start_of_block_c" input_type="MF16R Start of Block" location="Body" value="FIAC" />
                </div>
                <hr/>
                
                <!-- Field 39: MF36A Quantity of Financial Instrument to be Settled -->
                <div class="form-row"><span class="label_body">MF36A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Quantity of Financial Instrument to be Settled</span>
                    <div class="template_container" id="template_mf36a_c" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_mf36a_c">Count</span>
                        </div>
                        <select class="selection_div" disabled="disabled" id="type_mf36_c" name="type_mf36_c" class="mandatory" input_type="MF36A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="b">B - Quantity</option>
                            <option value="d">D - Quantity of Digital Tokens</option>
                        </select>
                        <!-- Option B: Quantity -->
                        <div id="div_mf36b_c">
                            <input type="hidden" disabled="disabled" id="_390_mf36b_qualifier_c" name="_390_mf36b_qualifier_c" input_type="MF36B Qualifier" location="Body" value=":SETT/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity Type Code</span>
                                <select class="mandatory" disabled="disabled" id="_3901_mf36b_quantity_type_code_c" name="_3901_mf36b_quantity_type_code_c" class="mandatory" input_type="MF36B Quantity Type Code" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="/AMOR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3901_mf36b_quantity_type_code_c'}"><c:if test="${item.detail=='/AMOR/'}"> selected="true" </c:if></c:if></c:forEach>>AMOR</option>
                                    <option value="/FAMT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3901_mf36b_quantity_type_code_c'}"><c:if test="${item.detail=='/FAMT/'}"> selected="true" </c:if></c:if></c:forEach>>FAMT</option>
                                    <option value="/UNIT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3901_mf36b_quantity_type_code_c'}"><c:if test="${item.detail=='/UNIT/'}"> selected="true" </c:if></c:if></c:forEach>>UNIT</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity</span>
                                <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_3902_mf36b_quantity_c" name="_3902_mf36b_quantity_c" maxlength="15" class="mandatory" input_type="MF36B Quantity" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3902_mf36b_quantity_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option D: Quantity of Digital Tokens -->
                        <div id="div_mf36d_c">
                            <input type="hidden" disabled="disabled" id="_3903_mf36d_qualifier_c" name="_3903_mf36d_qualifier_c" input_type="MF36D Qualifier" location="Body" value=":SETT/" />
                            <input type="hidden" disabled="disabled" id="_3904_mf36d_quantity_type_code_c" name="_3904_mf36d_quantity_type_code_c" class="mandatory" input_type="MF36D Quantity Type Code" location="Body" value="/DITU/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity of Digital Tokens</span>
                                <input type="text" class="mandatory" data-swift="30d" disabled="disabled" id="_3905_mf36d_quantity_c" name="_3905_mf36d_quantity_c" maxlength="30" class="mandatory" input_type="MF36D Quantity of Digital Tokens" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3905_mf36d_quantity_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                    <div id="container_mf36a_c">
                        <input type="button" class="cust-btn" value="Add Field MF36A" onclick="addContainer(this)" data-id="mf36a_c" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_mf36a_c">1</span>, Max: <span class="max_val" id="max_occ_mf36a_c">-</span>, Count: <span class="count_val" id="cur_occ_mf36a_c">0</span></span>
                    </div>
                </div>
                <hr/>
              
                <!-- Field 40: OF70D Denomination Choice -->
                <div class="form-row"><span class="label_body">OF70D</span><span class="label">Denomination Choice</span>
                    <div id="div_opt_of70d_c">
                        <input type="hidden" disabled="disabled" id="_400_of70d_qualifier_c" name="_400_of70d_qualifier_c" input_type="OF70D Qualifier" location="Body" value=":DENC//" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                            <textarea class="mandatory" cols="35" rows="6" data-swift="6*35x" disabled="disabled" id="_4001_of70d_narrative_c" name="_4001_of70d_narrative_c" input_type="OF70D Narrative" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4001_of70d_narrative_c'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                </div>
                <hr/>
              
                <!-- Field 41: OF13B Certificate Number -->
                <div class="form-row"><span class="label_body">OF13B</span><span class="label">Certificate Number</span>
                    <div class="template_container" id="template_of13b_c" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of13b_c">Count</span>
                        </div>
                        <input type="hidden" disabled="disabled" id="_410_of13b_qualifier_c" name="_410_of13b_qualifier_c" input_type="OF13B Qualifier" location="Body" value=":CERT/" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                            <div id="div_opt_of13b_data_source_scheme_c">
                                <input type="text" data-swift="8c" disabled="disabled" id="_4101_of13b_data_source_scheme_c" name="_4101_of13b_data_source_scheme_c" maxlength="8" input_type="OF13B Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4101_of13b_data_source_scheme_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <input type="hidden" disabled="disabled" id="_4102_of13b_slash_c" name="_4102_of13b_slash_c" input_type="OF13B Slash" location="Body" value="/" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                            <input type="text" class="mandatory" data-swift="30x" disabled="disabled" id="_4103_of13b_number_c" name="_4103_of13b_number_c" maxlength="30" input_type="OF13B Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4103_of13b_number_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="container_of13b_c">
                        <input type="button" class="cust-btn" value="Add Field OF13B" onclick="addContainer(this)" data-id="of13b_c" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of13b_c">0</span>, Max: <span class="max_val" id="max_occ_of13b_c">-</span>, Count: <span class="count_val" id="cur_occ_of13b_c">0</span></span>
                    </div>
                </div>
                <hr/>
              
                <!-- Field 42: OF95A Party -->
                <div class="form-row"><span class="label_body">OF95A</span><span class="label">Party</span>
                    <div class="template_container" id="template_of95a_c" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of95a_c">Count</span>
                        </div>
                        <select class="selection_div" disabled="disabled" id="type_of95_c" name="type_of95_c" input_type="OF95A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="l">L - Legal Entity Identifier</option>
                            <option value="p">P - Identifier Code</option>
                            <option value="r">R - Data Source Scheme - Proprietary Code</option>
                        </select>
                        <!-- Option L: Legal Entity Identifier -->
                        <div id="div_of95l_c">
                            <input type="hidden" disabled="disabled" id="_420_of95l_qualifier_c" name="_420_of95l_qualifier_c" input_type="OF95R Qualifier" location="Body" value=":ALTE//" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Legal Entity Identifier</span>
                                <input type="text" class="mandatory" data-swift="18!c2!n" disabled="disabled" id="_4201_of95l_legal_entity_identifier_c" name="_4201_of95l_legal_entity_identifier_c" maxlength="20" input_type="OF95L Legal Entity Identifier" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4201_of95l_legal_entity_identifier_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option P: Identifier Code -->
                        <div id="div_of95p_c">
                            <input type="hidden" disabled="disabled" id="_4202_of95p_qualifier_c" name="_4202_of95p_qualifier_c" input_type="OF95P Qualifier" location="Body" value=":ACOW//" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                <input type="text" class="mandatory" data-swift="4!a2!a2!c[3!c]" disabled="disabled" id="_4203_of95p_identifier_code_c" name="_4203_of95p_identifier_code_c" maxlength="11" input_type="OF95P Identifier Code" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4203_of95p_identifier_code_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option R: Data Source Scheme - Proprietary Code -->
                        <div id="div_of95r_c">
                            <input type="hidden" disabled="disabled" id="_4204_of95r_qualifier_c" name="_4204_of95r_qualifier_c" input_type="OF95R Qualifier" location="Body" value=":ACOW/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                <input type="text" class="mandatory" data-swift="8c" disabled="disabled" id="_4205_of95r_data_source_scheme_c" name="_4205_of95r_data_source_scheme_c" maxlength="8" input_type="OF95R Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4205_of95r_data_source_scheme_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <input type="hidden" disabled="disabled" id="_4206_of95r_slash_c" name="_4206_of95r_slash_c" input_type="OF95R Slash" location="Body" value="/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Proprietary Code</span>
                                <input type="text" class="mandatory" data-swift="34x" disabled="disabled" id="_4207_of95r_proprietary_code_c" name="_4207_of95r_proprietary_code_c" maxlength="34" input_type="OF95R Proprietary Code" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4207_of95r_proprietary_code_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                    <div id="container_of95a_c">
                        <input type="button" class="cust-btn" value="Add Field OF95A" onclick="addContainer(this)" data-id="of95a_c" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of95a_c">0</span>, Max: <span class="max_val" id="max_occ_of95a_c">2</span>, Count: <span class="count_val" id="cur_occ_of95a_c">0</span></span>
                    </div>
                </div>
                <hr/>
              
                <!-- Field 43: MF97A Account -->
                <div class="form-row"><span class="label_body">MF97A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Account</span>
                    <div class="template_container" id="template_mf97a_c" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_mf97a_c">Count</span>
                        </div>
                        <select class="selection_div mandatory" disabled="disabled" id="type_mf97_c" name="type_mf97_c" input_type="MF97A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="a">A - Account Number</option>
                            <option value="b">B - Data Source Scheme - Account Type Code - Account Number</option>
                            <option value="d">D - Data Source Scheme - Identification of Blockchain or Wallet</option>
                            <option value="e">E - International Bank Account Number</option>
                        </select>
                        <!-- Option A: Account Number -->
                        <div id="div_mf97a_c">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory" disabled="disabled" id="_430_mf97a_qualifier_c" name="_430_mf97a_qualifier_c" input_type="MF97A Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":CASH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_mf97a_qualifier_c'}"><c:if test="${item.detail==':CASH//'}"> selected="true" </c:if></c:if></c:forEach>>CASH</option>
                                    <option value=":SAFE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_mf97a_qualifier_c'}"><c:if test="${item.detail==':SAFE//'}"> selected="true" </c:if></c:if></c:forEach>>SAFE</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account Number</span>
                                <input type="text" class="mandatory" data-swift="35x" disabled="disabled" id="_4301_mf97a_account_number_c" name="_4301_mf97a_account_number_c" maxlength="35" input_type="MF97A Account Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4301_mf97a_account_number_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option B: Data Source Scheme - Account Type Code - Account Number -->
                        <div id="div_mf97b_c">
                            <input type="hidden" disabled="disabled" id="_4302_mf97b_qualifier_c" name="_4302_mf97b_qualifier_c" input_type="MF97B Qualifier" location="Body" value=":SAFE/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                <div id="div_opt_mf97b_data_source_scheme_c">
                                    <input type="text" data-swift="8c" disabled="disabled" id="_4303_mf97b_data_source_scheme_c" name="_4303_mf97b_data_source_scheme_c" maxlength="8" input_type="MF97B Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4303_mf97b_data_source_scheme_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <input type="hidden" disabled="disabled" id="_4304_mf97b_slash_c" name="_4304_mf97b_slash_c" input_type="MF97B Slash" location="Body" value="/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account Type Code</span>
                                <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_4305_mf97b_account_type_code_c" name="_4305_mf97b_account_type_code_c" maxlength="4" input_type="MF97B Account Type Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4305_mf97b_account_type_code_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <input type="hidden" disabled="disabled" id="_4306_mf97b_slash2_c" name="_4306_mf97b_slash2_c" input_type="MF97B Slash" location="Body" value="/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account Number</span>
                                <input type="text" class="mandatory" data-swift="35x" disabled="disabled" id="_4307_mf97b_account_number_c" name="_4307_mf97b_account_number_c" maxlength="35" input_type="MF97B Account Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4307_mf97b_account_number_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option D: Data Source Scheme - Identification of Blockchain or Wallet -->
                        <div id="div_mf97d_c">
                            <input type="hidden" disabled="disabled" id="_4308_mf97d_qualifier_c" name="_4308_mf97d_qualifier_c" input_type="MF97D Qualifier" location="Body" value=":BCAW/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                <input type="checkbox" disabled="disabled" id="check_mf97d_data_source_scheme_c" name="check_mf97d_data_source_scheme_c" />
                                <div id="div_opt_mf97d_data_source_scheme_c">
                                    <input type="text" data-swift="8c" disabled="disabled" id="_4309_mf97d_data_source_scheme_c" name="_4309_mf97d_data_source_scheme_c" maxlength="8" input_type="MF97D Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4309_mf97d_data_source_scheme_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <input type="hidden" disabled="disabled" id="_43010_mf97d_slash_c" name="_43010_mf97d_slash_c" input_type="MF97D Slash" location="Body" value="/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identification of Blockchain or Wallet</span>
                                <input type="text" class="mandatory" data-swift="140x" disabled="disabled" id="_43011_mf97d_blockchain_wallet_c" name="_43011_mf97d_blockchain_wallet_c" maxlength="140" input_type="MF97D Identification of Blockchain or Wallet" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_43011_mf97d_blockchain_wallet_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option E: International Bank Account Number -->
                        <div id="div_mf97e_c">
                            <input type="hidden" disabled="disabled" id="_43012_mf97e_qualifier_c" name="_43012_mf97e_qualifier_c" input_type="MF97E Qualifier" location="Body" value=":CASH//" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">International Bank Account Number</span>
                                <input type="text" class="mandatory" data-swift="34x" disabled="disabled" id="_43013_mf97e_account_number_c" name="_43013_mf97e_account_number_c" maxlength="34" input_type="MF97E Account Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_43013_mf97e_account_number_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                    <div id="container_mf97a_c">
                        <input type="button" class="cust-btn" value="Add Field MF97A" onclick="addContainer(this)" data-id="mf97a_c" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_mf97a_c">1</span>, Max: <span class="max_val" id="max_occ_mf97a_c">2</span>, Count: <span class="count_val" id="cur_occ_mf97a_c">0</span></span>
                    </div>
                </div>
                <hr/>
              
                <!-- Field 44: OF94A Place of Safekeeping -->
                <div class="form-row"><span class="label_body">OF94A</span><span class="label">Place of Safekeeping</span>
                    <div class="template_container" id="template_of94a_c" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_of94a_c">Count</span>
                        </div>
                        <select class="selection_div" disabled="disabled" id="type_of94_c" name="type_of94_c" input_type="OF94A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="b">B - Data Source Scheme - Place Code - Narrative</option>
                            <option value="c">C - Country Code</option>
                            <option value="f">F - Place Code - Identifier Code</option>
                            <option value="l">L - Legal Entity Identifier</option>
                            <option value="t">T - Digital Ledger Identifier</option>
                        </select>
                        <!-- Option B: Data Source Scheme - Place Code - Narrative -->
                        <div id="div_of94b_c">
                            <input type="hidden" disabled="disabled" id="_440_of94b_qualifier_c" name="_440_of94b_qualifier_c" input_type="OF94B Qualifier" location="Body" value=":SAFE/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                <input type="checkbox" disabled="disabled" id="check_of94b_data_source_scheme_c" name="check_of94b_data_source_scheme_c" />
                                <div id="div_opt_of94b_data_source_scheme_c">
                                    <input type="text" data-swift="8c" disabled="disabled" id="_4401_of94b_data_source_scheme_c" name="_4401_of94b_data_source_scheme_c" maxlength="8" input_type="OF94B Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4401_of94b_data_source_scheme_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <input type="hidden" disabled="disabled" id="_4402_of94b_slash_c" name="_4402_of94b_slash_c" input_type="OF94B Slash" location="Body" value="/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Place Code</span>
                                <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_4403_of94b_place_code_c" name="_4403_of94b_place_code_c" maxlength="4" input_type="OF94B Place Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4403_of94b_place_code_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                <div id="div_opt_of94b_narrative_c">
                                    <input type="hidden" disabled="disabled" id="_4404_of94b_slash2_c" name="_4404_of94b_slash2_c" input_type="OF94B Slash" location="Body" value="/" />
                                    <input type="text" data-swift="30x" disabled="disabled" id="_4405_of94b_narrative_c" name="_4405_of94b_narrative_c" maxlength="30" input_type="OF94B Narrative" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4405_of94b_narrative_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>
                        <!-- Option C: Country Code -->
                        <div id="div_of94c_c">
                            <input type="hidden" disabled="disabled" id="_4406_of94c_qualifier_c" name="_4406_of94c_qualifier_c" input_type="OF94C Qualifier" location="Body" value=":SAFE//" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Country Code</span>
                                <input type="text" class="mandatory" data-swift="2!a" disabled="disabled" id="_4407_of94c_country_code_c" name="_4407_of94c_country_code_c" maxlength="2" input_type="OF94C Country Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4407_of94c_country_code_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option F: Place Code - Identifier Code -->
                        <div id="div_of94f_c">
                            <input type="hidden" disabled="disabled" id="_4408_of94f_qualifier_c" name="_4408_of94f_qualifier_c" input_type="OF94F Qualifier" location="Body" value=":SAFE//" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Place Code</span>
                                <select class="mandatory" disabled="disabled" id="_4409_of94f_place_code_c" name="_4409_of94f_place_code_c" input_type="OF94F Place Code" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="CUST/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4409_of94f_place_code_c'}"><c:if test="${item.detail=='CUST/'}"> selected="true" </c:if></c:if></c:forEach>>CUST</option>
                                    <option value="ICSD/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4409_of94f_place_code_c'}"><c:if test="${item.detail=='ICSD/'}"> selected="true" </c:if></c:if></c:forEach>>ICSD</option>
                                    <option value="NCSD/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4409_of94f_place_code_c'}"><c:if test="${item.detail=='NCSD/'}"> selected="true" </c:if></c:if></c:forEach>>NCSD</option>
                                    <option value="SHHE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4409_of94f_place_code_c'}"><c:if test="${item.detail=='SHHE/'}"> selected="true" </c:if></c:if></c:forEach>>SHHE</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                <input type="text" class="mandatory" data-swift="4!a2!a2!c[3!c]" disabled="disabled" id="_44010_of94f_identifier_code_c" name="_44010_of94f_identifier_code_c" maxlength="11" input_type="OF94F Identifier Code" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_44010_of94f_identifier_code_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option L: Legal Entity Identifier -->
                        <div id="div_of94l_c">
                            <input type="hidden" disabled="disabled" id="_44011_of94l_qualifier_c" name="_44011_of94l_qualifier_c" input_type="OF94L Qualifier" location="Body" value=":SAFE//" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Legal Entity Identifier</span>
                                <input type="text" class="mandatory" data-swift="18!c2!n" disabled="disabled" id="_44012_of94l_legal_entity_identifier_c" name="_44012_of94l_legal_entity_identifier_c" maxlength="20" input_type="OF94L Legal Entity Identifier" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_44012_of94l_legal_entity_identifier_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <!-- Option T: Digital Ledger Identifier -->
                        <div id="div_of94t_c">
                            <input type="hidden" disabled="disabled" id="_44013_of94t_qualifier_c" name="_44013_of94t_qualifier_c" input_type="OF94T Qualifier" location="Body" value=":SAFE//" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Digital Ledger Identifier</span>
                                <input type="text" class="mandatory" data-swift="9!x" disabled="disabled" id="_44014_of94t_digital_ledger_identifier_c" name="_44014_of94t_digital_ledger_identifier_c" maxlength="9" input_type="OF94T Digital Ledger Identifier" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_44014_of94t_digital_ledger_identifier_c'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                    <div id="container_of94a_c">
                        <input type="button" class="cust-btn" value="Add Field OF94A" onclick="addContainer(this)" data-id="of94a_c" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_of94a_c">0</span>, Max: <span class="max_val" id="max_occ_of94a_c">-</span>, Count: <span class="count_val" id="cur_occ_of94a_c">0</span></span>
                    </div>
                </div>
                <hr/>
                
                <!-- Mandatory Repetitive Subsequence C1 Quantity Breakdown -->
                <div class="form-row">
                    <h2 class="header-title">Mandatory Repetitive Subsequence C1 Quantity Breakdown</h2>
                    <hr/>

                    <span class="label_body">C1</span><span class="label">Quantity Breakdown</span>
                    <div class="template_container" id="template_c1" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_c1">Count</span>
                        </div>                    
                
                        <!-- Field 45: MF16R Start of Block -->
                        <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                            <input disabled="disabled" id="_450_mf16r_start_of_block_c1" name="_450_mf16r_start_of_block_c1" input_type="MF16R Start of Block" location="Body" value="BREAK" />
                        </div>

                        <!-- Field 46: OF13B Lot Number -->
                        <div class="form-row"><span class="label_body">OF13B</span><span class="label">Lot Number</span>
                            <input type="checkbox" class="checkbox_div" disabled="disabled" id="check_of13b_c1" name="check_of13b_c1" />
                            <div id="div_opt_of13b_c1">
                                <input type="hidden" disabled="disabled" id="_460_of13b_qualifier_c1" name="_460_of13b_qualifier_c1" input_type="OF13B Qualifier" location="Body" value=":LOTS/" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                    <div id="div_opt_of13b_data_source_scheme_c1">
                                        <input type="text" data-swift="8c" disabled="disabled" id="_4601_of13b_data_source_scheme_c1" name="_4601_of13b_data_source_scheme_c1" maxlength="8" input_type="OF13B Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4601_of13b_data_source_scheme_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <input type="hidden" disabled="disabled" id="_4602_of13b_slash_c1" name="_4602_of13b_slash_c1" input_type="OF13B Slash" location="Body" value="/" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                    <input type="text" class="mandatory" data-swift="30x" disabled="disabled" id="_4603_of13b_number_c1" name="_4603_of13b_number_c1" maxlength="30" input_type="OF13B Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4603_of13b_number_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>

                        <!-- Field 47: OF36A Quantity of Financial Instrument In The Lot -->
                        <div class="form-row"><span class="label_body">OF36A</span><span class="label">Quantity of Financial Instrument In The Lot</span>
                            <input type="checkbox" class="checkbox_div" disabled="disabled" id="check_of36a_c1" name="check_of36a_c1" />
                            <div id="div_opt_of36a_c1">
                                <select class="selection_div" disabled="disabled" id="type_of36_c1" name="type_of36_c1" input_type="OF36A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="b">B - Quantity</option>
                                    <option value="d">D - Quantity of Digital Tokens</option>
                                </select>
                                <!-- Option B: Quantity -->
                                <div id="div_of36b_c1">
                                    <input type="hidden" disabled="disabled" id="_470_of36b_qualifier_c1" name="_470_of36b_qualifier_c1" input_type="OF36B Qualifier" location="Body" value=":LOTS/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity Type Code</span>
                                        <select class="mandatory" disabled="disabled" id="_4701_of36b_quantity_type_code_c1" name="_4701_of36b_quantity_type_code_c1" input_type="OF36B Quantity Type Code" location="Body">
                                            <option value="">choose a type</option>
                                            <option value="/AMOR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4701_of36b_quantity_type_code_c1'}"><c:if test="${item.detail=='/AMOR/'}"> selected="true" </c:if></c:if></c:forEach>>AMOR</option>
                                            <option value="/FAMT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4701_of36b_quantity_type_code_c1'}"><c:if test="${item.detail=='/FAMT/'}"> selected="true" </c:if></c:if></c:forEach>>FAMT</option>
                                            <option value="/UNIT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4701_of36b_quantity_type_code_c1'}"><c:if test="${item.detail=='/UNIT/'}"> selected="true" </c:if></c:if></c:forEach>>UNIT</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity</span>
                                        <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_4702_of36b_quantity_c1" name="_4702_of36b_quantity_c1" maxlength="15" input_type="OF36B Quantity" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4702_of36b_quantity_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option D: Quantity of Digital Tokens -->
                                <div id="div_of36d_c1">
                                    <input type="hidden" disabled="disabled" id="_4703_of36d_qualifier_c1" name="_4703_of36d_qualifier_c1" input_type="OF36D Qualifier" location="Body" value=":LOTS/" />
                                    <input type="hidden" disabled="disabled" id="_4704_of36d_quantity_type_code_c1" name="_4704_of36d_quantity_type_code_c1" input_type="OF36D Quantity Type Code" location="Body" value="/DITU/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity of Digital Tokens</span>
                                        <input type="text" class="mandatory" data-swift="30d" disabled="disabled" id="_4705_of36d_quantity_c1" name="_4705_of36d_quantity_c1" maxlength="30" input_type="OF36D Quantity of Digital Tokens" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4705_of36d_quantity_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Field 48: OF98A Lot Date/Time -->
                        <div class="form-row"><span class="label_body">OF98A</span><span class="label">Lot Date/Time</span>
                            <input type="checkbox" class="checkbox_div" disabled="disabled" id="check_of98a_c1" name="check_of98a_c1" />
                            <div id="div_opt_of98a_c1">
                                <select class="selection_div" disabled="disabled" id="type_of98_c1" name="type_of98_c1" input_type="OF98A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Date</option>
                                    <option value="c">C - Date - Time</option>
                                    <option value="e">E - Date - Time - Decimals - UTC Indicator</option>
                                </select>
                                <!-- Option A: Date -->
                                <div id="div_of98a_c1">
                                    <input type="hidden" disabled="disabled" id="_480_of98a_qualifier_c1" name="_480_of98a_qualifier_c1" input_type="OF98A Qualifier" location="Body" value=":LOTS//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_4801_of98a_date_c1" name="_4801_of98a_date_c1" maxlength="8" input_type="OF98A Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4801_of98a_date_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option C: Date - Time -->
                                <div id="div_of98c_c1">
                                    <input type="hidden" disabled="disabled" id="_4802_of98c_qualifier_c1" name="_4802_of98c_qualifier_c1" input_type="OF98C Qualifier" location="Body" value=":LOTS//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_4803_of98c_date_c1" name="_4803_of98c_date_c1" maxlength="8" input_type="OF98C Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4803_of98c_date_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time</span>
                                        <input type="text" class="mandatory" data-swift="6!n" disabled="disabled" id="_4804_of98c_time_c1" name="_4804_of98c_time_c1" maxlength="6" input_type="OF98C Time" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4804_of98c_time_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option E: Date - Time - Decimals - UTC Indicator -->
                                <div id="div_of98e_c1">
                                    <input type="hidden" disabled="disabled" id="_4805_of98e_qualifier_c1" name="_4805_of98e_qualifier_c1" input_type="OF98E Qualifier" location="Body" value=":LOTS//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_4806_of98e_date_c1" name="_4806_of98e_date_c1" maxlength="8" input_type="OF98E Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4806_of98e_date_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time</span>
                                        <input type="text" class="mandatory" data-swift="6!n" disabled="disabled" id="_4807_of98e_time_c1" name="_4807_of98e_time_c1" maxlength="6" input_type="OF98E Time" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4807_of98e_time_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Decimals</span>
                                        <input type="checkbox" class="template_selection" disabled="disabled" id="check_of98e_decimals_c1" name="check_of98e_decimals_c1" />
                                        <div id="div_opt_of98e_decimals_c1">
                                            <input type="hidden" disabled="disabled" id="_4808_of98e_comma_c1" name="_4808_of98e_comma_c1" input_type="OF98E Comma" location="Body" value="," />
                                            <input type="text" data-swift="3n" disabled="disabled" id="_4809_of98e_decimals_c1" name="_4809_of98e_decimals_c1" maxlength="3" input_type="OF98E Decimals" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4809_of98e_decimals_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">UTC Indicator</span>
                                        <input type="checkbox" class="template_selection" disabled="disabled" id="check_of98e_utc_indicator_c1" name="check_of98e_utc_indicator_c1" />
                                        <div id="div_opt_of98e_utc_indicator_c1">
                                            <input type="hidden" disabled="disabled" id="_48010_of98e_slash_c1" name="_48010_of98e_slash_c1" input_type="OF98E Slash" location="Body" value="/" />
                                            <input type="text" data-swift="[N]2!n[2!n]" disabled="disabled" id="_48011_of98e_utc_indicator_c1" name="_48011_of98e_utc_indicator_c1" maxlength="5" input_type="OF98E UTC Indicator" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_48011_of98e_utc_indicator_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Field 49: OF90A Book/Lot Price -->
                        <div class="form-row"><span class="label_body">OF90A</span><span class="label">Book/Lot Price</span>
                            <input type="checkbox" class="checkbox_div" disabled="disabled" id="check_of90a_c1" name="check_of90a_c1" />
                            <div id="div_opt_of90a_c1">
                                <select class="selection_div" disabled="disabled" id="type_of90_c1" name="type_of90_c1" input_type="OF90A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Percentage Type Code - Sign - Price</option>
                                    <option value="b">B - Amount Type Code - Currency Code - Price</option>
                                </select>
                                <!-- Option A: Percentage Type Code - Sign - Price -->
                                <div id="div_of90a_c1">
                                    <input type="hidden" disabled="disabled" id="_490_of90a_qualifier_c1" name="_490_of90a_qualifier_c1" input_type="OF90A Qualifier" location="Body" value=":LOTS/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Percentage Type Code</span>
                                        <select class="mandatory" disabled="disabled" id="_4901_of90a_percentage_type_code_c1" name="_4901_of90a_percentage_type_code_c1" input_type="OF90A Percentage Type Code" location="Body">
                                            <option value="">choose a type</option>
                                            <option value="/DISC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4901_of90a_percentage_type_code_c1'}"><c:if test="${item.detail=='/DISC/'}"> selected="true" </c:if></c:if></c:forEach>>DISC</option>
                                            <option value="/PRCT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4901_of90a_percentage_type_code_c1'}"><c:if test="${item.detail=='/PRCT/'}"> selected="true" </c:if></c:if></c:forEach>>PRCT</option>
                                            <option value="/PREM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4901_of90a_percentage_type_code_c1'}"><c:if test="${item.detail=='/PREM/'}"> selected="true" </c:if></c:if></c:forEach>>PREM</option>
                                            <option value="/YIEL/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4901_of90a_percentage_type_code_c1'}"><c:if test="${item.detail=='/YIEL/'}"> selected="true" </c:if></c:if></c:forEach>>YIEL</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sign</span>
                                        <input type="checkbox" class="template_selection" disabled="disabled" id="check_of90a_sign_c1" name="check_of90a_sign_c1" />
                                        <div id="div_opt_of90a_sign_c1">
                                            <input type="text" data-swift="N" disabled="disabled" id="_4902_of90a_sign_c1" name="_4902_of90a_sign_c1" maxlength="1" input_type="OF90A Sign" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4902_of90a_sign_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Price</span>
                                        <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_4903_of90a_price_c1" name="_4903_of90a_price_c1" maxlength="15" input_type="OF90A Price" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4903_of90a_price_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option B: Amount Type Code - Currency Code - Price -->
                                <div id="div_of90b_c1">
                                    <input type="hidden" disabled="disabled" id="_4904_of90b_qualifier_c1" name="_4904_of90b_qualifier_c1" input_type="OF90B Qualifier" location="Body" value=":LOTS/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount Type Code</span>
                                        <select class="mandatory" disabled="disabled" id="_4905_of90b_amount_type_code_c1" name="_4905_of90b_amount_type_code_c1" input_type="OF90B Amount Type Code" location="Body">
                                            <option value="">choose a type</option>
                                            <option value="/ACTU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4905_of90b_amount_type_code_c1'}"><c:if test="${item.detail=='/ACTU/'}"> selected="true" </c:if></c:if></c:forEach>>ACTU</option>
                                            <option value="/DISC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4905_of90b_amount_type_code_c1'}"><c:if test="${item.detail=='/DISC/'}"> selected="true" </c:if></c:if></c:forEach>>DISC</option>
                                            <option value="/PREM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4905_of90b_amount_type_code_c1'}"><c:if test="${item.detail=='/PREM/'}"> selected="true" </c:if></c:if></c:forEach>>PREM</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" class="mandatory" data-swift="3!a" disabled="disabled" id="_4906_of90b_currency_c1" name="_4906_of90b_currency_c1" maxlength="3" input_type="OF90B Currency" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4906_of90b_currency_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Price</span>
                                        <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_4907_of90b_price_c1" name="_4907_of90b_price_c1" maxlength="15" input_type="OF90B Price" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4907_of90b_price_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Field 50: OF22F Type of Price Indicator -->
                        <div class="form-row"><span class="label_body">OF22F</span><span class="label">Type of Price Indicator</span>
                            <input type="checkbox" class="checkbox_div" disabled="disabled" id="check_of22f_c1" name="check_of22f_c1" />
                            <div id="div_opt_of22f_c1">
                                <input type="hidden" disabled="disabled" id="_500_of22f_qualifier_c1" name="_500_of22f_qualifier_c1" input_type="OF22F Qualifier" location="Body" value=":PRIC/" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                    <input type="checkbox" class="template_selection" disabled="disabled" id="check_of22f_data_source_scheme_c1" name="check_of22f_data_source_scheme_c1" />
                                    <div id="div_opt_of22f_data_source_scheme_c1">
                                        <input type="text" data-swift="8c" disabled="disabled" id="_5001_of22f_data_source_scheme_c1" name="_5001_of22f_data_source_scheme_c1" maxlength="8" input_type="OF22F Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5001_of22f_data_source_scheme_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <input type="hidden" disabled="disabled" id="_5002_of22f_slash_c1" name="_5002_of22f_slash_c1" input_type="OF22F Slash" location="Body" value="/" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Indicator</span>
                                    <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_5003_of22f_indicator_c1" name="_5003_of22f_indicator_c1" maxlength="4" input_type="OF22F Indicator" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5003_of22f_indicator_c1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>

                        <!-- Field 51: MF16S End of Block -->
                        <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                            <input disabled="disabled" id="_510_mf16s_end_of_block_c1" name="_510_mf16s_end_of_block_c1" input_type="MF16S End of Block" location="Body" value="BREAK" />
                        </div>
                    </div>
                    <div id="container_c1">
                        <input type="button" class="cust-btn" value="Add Field C1" onclick="addTemplateContainer(this)" data-id="c1" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_c1">0</span>, Max: <span class="max_val" id="max_occ_c1">-</span>, Count: <span class="count_val" id="cur_occ_c1">0</span></span>
                    </div>            
                            
                    <h2 class="header-title">End of Subsequence C1 Quantity Breakdown</h2>
                </div>
                <hr/>

                <!-- Field 52: MF16S End of Block -->
                <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                    <input disabled="disabled" id="_520_mf16s_end_of_block_c" name="_520_mf16s_end_of_block_c" input_type="MF16S End of Block" location="Body" value="FIAC" />
                </div>
                <hr/>
                
                <h2 class="header-title">End of Sequence C Financial Instrument/Account</h2>

                <h2 class="header-title">Optional Sequence D Two Leg Transaction Details</h2>
                <hr/>

                <input class="checkbox_sequence" id="check_d" name="check_d" type="checkbox"/>
                <div id="div_opt_d">                            
                            
                <!-- Field 53: MF16R Start of Block -->
                <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                    <input disabled="disabled" id="_530_mf16r_d_start_of_block" name="_530_mf16r_d_start_of_block" input_type="MF16R Start of Block" location="Body" value="REPO"/>
                </div>
                <hr/>
                
                <!-- Field 54: OF98A Date/Time -->
                <div class="form-row"><span class="label_body">OF98A</span><span class="label">Date/Time</span>
                    <div class="template_container" id="template_of98a_d" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input class="cust-btn remove-btn template_selection" disabled="disabled" type="button" value="Remove"/>
                            </span>
                            <span class="label" id="label_count_of98a_d">Count</span>
                        </div>
                        <select class="selection_div template_selection" disabled="disabled" id="type_of98_d" name="type_of98_d" input_type="OF98A Type" location="Body">
                            <option value="">choose a type</option>
                            <option value="a">A - Date</option>
                            <option value="b">B - Data Source Scheme Date Code</option>
                            <option value="c">C - Date Time</option>
                        </select>
                        <!-- Option A: Date -->
                        <div id="div_of98a_d">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory template_selection" disabled="disabled" id="_540_of98a_qualifier_d" name="_540_of98a_qualifier_d" input_type="OF98A Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":TERM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_540_of98a_qualifier_d'}"><c:if test="${item.detail==':TERM//'}"> selected="true" </c:if></c:if></c:forEach>>TERM</option>
                                    <option value=":RERA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_540_of98a_qualifier_d'}"><c:if test="${item.detail==':RERA//'}"> selected="true" </c:if></c:if></c:forEach>>RERA</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                <input class="mandatory template_selection" data-swift="8!n" disabled="disabled" id="_5401_of98a_date_d" name="_5401_of98a_date_d" maxlength="8" input_type="OF98A Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5401_of98a_date_d'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                        </div>
                        <!-- Option B: Data Source Scheme Date Code -->
                        <div id="div_of98b_d">
                            <input type="hidden" disabled="disabled" id="_5402_of98b_qualifier_d" name="_5402_of98b_qualifier_d" input_type="OF98B Qualifier" location="Body" value=":TERM/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                <input class="template_selection" disabled="disabled" id="check_of98b_data_source_scheme_d" name="check_of98b_data_source_scheme_d" type="checkbox"/>
                                <div id="div_opt_of98b_data_source_scheme_d">
                                    <input class="template_selection" data-swift="8c" disabled="disabled" id="_5403_of98b_data_source_scheme_d" name="_5403_of98b_data_source_scheme_d" maxlength="8" input_type="OF98B Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5403_of98b_data_source_scheme_d'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                            </div>
                            <input type="hidden" disabled="disabled" id="_5404_of98b_slash_d" name="_5404_of98b_slash_d" input_type="OF98B Slash" location="Body" value="/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date Code</span>
                                <input class="mandatory template_selection" data-swift="4!c" disabled="disabled" id="_5405_of98b_date_code_d" name="_5405_of98b_date_code_d" maxlength="4" input_type="OF98B Date Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5405_of98b_date_code_d'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                        </div>
                        <!-- Option C: Date Time -->
                        <div id="div_of98c_d">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory template_selection" disabled="disabled" id="_5406_of98c_qualifier_d" name="_5406_of98c_qualifier_d" input_type="OF98C Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":TERM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5406_of98c_qualifier_d'}"><c:if test="${item.detail==':TERM//'}"> selected="true" </c:if></c:if></c:forEach>>TERM</option>
                                    <option value=":RERA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5406_of98c_qualifier_d'}"><c:if test="${item.detail==':RERA//'}"> selected="true" </c:if></c:if></c:forEach>>RERA</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                <input class="mandatory template_selection" data-swift="8!n" disabled="disabled" id="_5407_of98c_date_d" name="_5407_of98c_date_d" maxlength="8" input_type="OF98C Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5407_of98c_date_d'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time</span>
                                <input class="mandatory template_selection" data-swift="6!n" disabled="disabled" id="_5408_of98c_time_d" name="_5408_of98c_time_d" maxlength="6" input_type="OF98C Time" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5408_of98c_time_d'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                        </div>
                    </div>
                    <div id="container_of98a_d">
                        <input class="cust-btn template_selection" data-count="0" data-id="of98a_d" onclick="addContainer(this)" type="button" value="Add Field OF98A"/>
                        <span class="label">Min: <span class="min_val" id="min_occ_of98a_d">0</span>, Max: <span class="max_val" id="max_occ_of98a_d">2</span>, Count: <span class="count_val" id="cur_occ_of98a_d">0</span></span>
                    </div>
                </div>
                <hr/>                
                                    
                <!-- Field 55: OF22F Indicator -->
                <div class="form-row"><span class="label_body">OF22F</span><span class="label">Indicator</span>
                    <div class="template_container" id="template_of22f_d" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input class="cust-btn remove-btn template_selection" disabled="disabled" type="button" value="Remove"/>
                            </span>
                            <span class="label" id="label_count_of22f_d">Count</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                            <select class="mandatory template_selection" disabled="disabled" id="_550_of22f_d_qualifier" name="_550_of22f_d_qualifier" input_type="OF22F Qualifier" location="Body">
                                <option value="">choose a type</option>
                                <option value=":RERT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_550_of22f_d_qualifier'}"><c:if test="${item.detail==':RERT/'}"> selected="true" </c:if></c:if></c:forEach>>RERT</option>
                                <option value=":MICO/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_550_of22f_d_qualifier'}"><c:if test="${item.detail==':MICO/'}"> selected="true" </c:if></c:if></c:forEach>>MICO</option>
                                <option value=":REVA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_550_of22f_d_qualifier'}"><c:if test="${item.detail==':REVA/'}"> selected="true" </c:if></c:if></c:forEach>>REVA</option>
                                <option value=":LEGA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_550_of22f_d_qualifier'}"><c:if test="${item.detail==':LEGA/'}"> selected="true" </c:if></c:if></c:forEach>>LEGA</option>
                                <option value=":OMAT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_550_of22f_d_qualifier'}"><c:if test="${item.detail==':OMAT/'}"> selected="true" </c:if></c:if></c:forEach>>OMAT</option>
                                <option value=":INTR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_550_of22f_d_qualifier'}"><c:if test="${item.detail==':INTR/'}"> selected="true" </c:if></c:if></c:forEach>>INTR</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                            <input class="template_selection" disabled="disabled" id="check_of22f_data_source_scheme_d" name="check_of22f_data_source_scheme_d" type="checkbox"/>
                            <div id="div_opt_of22f_data_source_scheme_d">
                                <input class="template_selection" data-swift="8c" disabled="disabled" id="_5501_of22f_d_data_source_scheme" name="_5501_of22f_d_data_source_scheme" maxlength="8" input_type="OF22F Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5501_of22f_d_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                        </div>
                        <input class="template_selection" disabled="disabled" id="_5502_of22f_d_slash" name="_5502_of22f_d_slash" input_type="OF22F Slash" location="Body" type="hidden" value="/"/>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Indicator</span>
                            <input class="mandatory template_selection" data-swift="4!c" disabled="disabled" id="_5503_of22f_d_indicator" name="_5503_of22f_d_indicator" maxlength="4" input_type="OF22F Indicator" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5503_of22f_d_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                        </div>
                    </div>
                    <div id="container_of22f_d">
                        <input class="cust-btn template_selection" data-count="0" data-id="of22f_d" onclick="addContainer(this)" type="button" value="Add Field OF22F"/>
                        <span class="label">Min: <span class="min_val" id="min_occ_of22f_d">0</span>, Max: <span class="max_val" id="max_occ_of22f_d">6</span>, Count: <span class="count_val" id="cur_occ_of22f_d">0</span></span>
                    </div>
                </div>
                <hr/>
                
                <!-- Field 56: OF20C Reference -->
                <div class="form-row"><span class="label_body">OF20C</span><span class="label">Reference</span>
                    <div class="template_container" id="template_of20c_d" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input class="cust-btn remove-btn template_selection" disabled="disabled" type="button" value="Remove"/>
                            </span>
                            <span class="label" id="label_count_of20c_d">Count</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                            <select class="mandatory template_selection" disabled="disabled" id="_560_of20c_d_qualifier" name="_560_of20c_d_qualifier" input_type="OF20C Qualifier" location="Body">
                                <option value="">choose a type</option>
                                <option value=":SECO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_560_of20c_d_qualifier'}"><c:if test="${item.detail==':SECO//'}"> selected="true" </c:if></c:if></c:forEach>>SECO</option>
                                <option value=":REPO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_560_of20c_d_qualifier'}"><c:if test="${item.detail==':REPO//'}"> selected="true" </c:if></c:if></c:forEach>>REPO</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Reference</span>
                            <input class="template_selection" disabled="disabled" id="check_of20c_reference_d" name="check_of20c_reference_d" type="checkbox"/>
                            <div id="div_opt_of20c_reference_d">
                                <input class="template_selection" data-swift="16x" disabled="disabled" id="_5601_of20c_d_reference" name="_5601_of20c_d_reference" maxlength="16" input_type="OF20C Reference" location="Body" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5601_of20c_d_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                        </div>
                    </div>
                    <div id="container_of20c_d">
                        <input class="cust-btn template_selection" data-count="0" data-id="of20c_d" onclick="addContainer(this)" type="button" value="Add Field OF20C"/>
                        <span class="label">Min: <span class="min_val" id="min_occ_of20c_d">0</span>, Max: <span class="max_val" id="max_occ_of20c_d">2</span>, Count: <span class="count_val" id="cur_occ_of20c_d">0</span></span>
                    </div>
                </div>
                <hr/>
                
                <!-- Field 57: OF92A Rate -->
                <div class="form-row"><span class="label_body">OF92A</span><span class="label">Rate</span>
                    <div class="template_container" id="template_of92a_d" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input class="cust-btn remove-btn template_selection" disabled="disabled" type="button" value="Remove"/>
                            </span>
                            <span class="label" id="label_count_of92a_d">Count</span>
                        </div>
                        <select class="selection_div template_selection" disabled="disabled" id="type_of92_d" name="type_of92_d" input_type="OF92A Rate" location="Body">
                            <option value="">choose a type</option>
                            <option value="a">A - Sign - Rate</option>
                            <option value="c">C - Data Source Scheme - Rate Name</option>
                        </select>
                        <!-- Option A: Sign - Rate -->
                        <div id="div_of92a_d">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory template_selection" disabled="disabled" id="_570_of92a_d_qualifier" name="_570_of92a_d_qualifier" input_type="OF92A Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":REPO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_570_of92a_d_qualifier'}"><c:if test="${item.detail==':REPO//'}"> selected="true" </c:if></c:if></c:forEach>>REPO</option>
                                    <option value=":RSPR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_570_of92a_d_qualifier'}"><c:if test="${item.detail==':RSPR//'}"> selected="true" </c:if></c:if></c:forEach>>RSPR</option>
                                    <option value=":PRIC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_570_of92a_d_qualifier'}"><c:if test="${item.detail==':PRIC//'}"> selected="true" </c:if></c:if></c:forEach>>PRIC</option>           
                                    <option value=":SLMG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_570_of92a_d_qualifier'}"><c:if test="${item.detail==':SLMG//'}"> selected="true" </c:if></c:if></c:forEach>>SLMG</option>
                                    <option value=":SHAI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_570_of92a_d_qualifier'}"><c:if test="${item.detail==':SHAI//'}"> selected="true" </c:if></c:if></c:forEach>>SHAI</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sign</span>
                                <input class="template_selection" disabled="disabled" id="check_of92a_sign_d" name="check_of92a_sign_d" type="checkbox"/>
                                <div id="div_opt_of92a_sign_d">
                                    <input class="template_selection" data-swift="N" disabled="disabled" id="_5701_of92a_d_sign" name="_5701_of92a_d_sign" maxlength="1" input_type="OF92A Sign" location="Body" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5701_of92a_d_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Rate</span>
                                <input class="mandatory template_selection" data-swift="15d" disabled="disabled" id="_5702_of92a_d_rate" name="_5702_of92a_d_rate" maxlength="15" input_type="OF92A Rate" location="Body" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5702_of92a_d_rate'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                        </div>
                        <!-- Option C: Data Source Scheme - Rate Name -->
                        <div id="div_of92c_d">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                <select class="mandatory template_selection" disabled="disabled" id="_5703_of92c_d_qualifier" name="_5703_of92c_d_qualifier" input_type="OF92C Qualifier" location="Body">
                                    <option value="">choose a type</option>
                                    <option value=":VASU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5703_of92c_d_qualifier'}"><c:if test="${item.detail==':VASU/'}"> selected="true" </c:if></c:if></c:forEach>>VASU</option>
                                    <option value=":PRIC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5703_of92c_d_qualifier'}"><c:if test="${item.detail==':PRIC/'}"> selected="true" </c:if></c:if></c:forEach>>PRIC</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                <div id="div_opt_of92c_data_source_scheme_d">
                                    <input class="template_selection" data-swift="8c" disabled="disabled" id="_5704_of92c_d_data_source_scheme" name="_5704_of92c_d_data_source_scheme" maxlength="8" input_type="OF92C Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5704_of92c_d_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                            </div>
                            <input class="template_selection" disabled="disabled" id="_5705_of92c_d_slash" name="_5705_of92c_d_slash" input_type="OF92C Slash" location="Body" type="hidden" value="/"/>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Rate Name</span>
                                <input class="mandatory template_selection" data-swift="24x" disabled="disabled" id="_5706_of92c_d_rate_name" name="_5706_of92c_d_rate_name" maxlength="24" input_type="OF92C Rate Name" location="Body" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5706_of92c_d_rate_name'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                        </div>
                    </div>
                    <div id="container_of92a_d">
                        <input class="cust-btn template_selection" data-count="0" data-id="of92a_d" onclick="addContainer(this)" type="button" value="Add Field OF92A"/>
                        <span class="label">Min: <span class="min_val" id="min_occ_of92a_d">0</span>, Max: <span class="max_val" id="max_occ_of92a_d">6</span>, Count: <span class="count_val" id="cur_occ_of92a_d">0</span></span>
                    </div>
                </div>
                <hr/>
                
                <!-- Field 58: OF99B Number Count -->
                <div class="form-row"><span class="label_body">OF99B</span><span class="label">Number Count</span>
                    <div class="template_container" id="template_of99b_d" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input class="cust-btn remove-btn template_selection" disabled="disabled" type="button" value="Remove"/>
                            </span>
                            <span class="label" id="label_count_of99b_d">Count</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                            <select class="mandatory template_selection" disabled="disabled" id="_580_of99b_d_qualifier" name="_580_of99b_d_qualifier" input_type="OF99B Qualifier" location="Body">
                                <option value="">choose a type</option>
                                <option value=":CADE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_580_of99b_d_qualifier'}"><c:if test="${item.detail==':CADE//'}"> selected="true" </c:if></c:if></c:forEach>>CADE</option>
                                <option value=":TOCO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_580_of99b_d_qualifier'}"><c:if test="${item.detail==':TOCO//'}"> selected="true" </c:if></c:if></c:forEach>>TOCO</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                            <input class="mandatory template_selection" data-swift="3!n" disabled="disabled" id="_5801_of99b_d_number" name="_5801_of99b_d_number" maxlength="3" input_type="OF99B Number" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5801_of99b_d_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                        </div>
                    </div>
                    <div id="container_of99b_d">
                        <input class="cust-btn template_selection" data-count="0" data-id="of99b_d" onclick="addContainer(this)" type="button" value="Add Field OF99B"/>
                        <span class="label">Min: <span class="min_val" id="min_occ_of99b_d">0</span>, Max: <span class="max_val" id="max_occ_of99b_d">2</span>, Count: <span class="count_val" id="cur_occ_of99b_d">0</span></span>
                    </div>
                </div>
                <hr/>
                
                <!-- Field 59: OF19A Amount -->
                <div class="form-row"><span class="label_body">OF19A</span><span class="label">Amount</span>
                    <div class="template_container" id="template_of19a_d" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input class="cust-btn remove-btn template_selection" disabled="disabled" type="button" value="Remove"/>
                            </span>
                            <span class="label" id="label_count_of19a_d">Count</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                            <select class="mandatory template_selection" disabled="disabled" id="_590_of19a_qualifier_d" name="_590_of19a_qualifier_d" input_type="OF19A Qualifier" location="Body">
                                <option value="">choose a type</option>
                                <option value=":FORF//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_590_of19a_qualifier_d'}"><c:if test="${item.detail==':FORF//'}"> selected="true" </c:if></c:if></c:forEach>>FORF</option>
                                <option value=":TRTE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_590_of19a_qualifier_d'}"><c:if test="${item.detail==':TRTE//'}"> selected="true" </c:if></c:if></c:forEach>>TRTE</option>
                                <option value=":REPP//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_590_of19a_qualifier_d'}"><c:if test="${item.detail==':REPP//'}"> selected="true" </c:if></c:if></c:forEach>>REPP</option>
                                <option value=":ACRU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_590_of19a_qualifier_d'}"><c:if test="${item.detail==':ACRU//'}"> selected="true" </c:if></c:if></c:forEach>>ACRU</option>
                                <option value=":DEAL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_590_of19a_qualifier_d'}"><c:if test="${item.detail==':DEAL//'}"> selected="true" </c:if></c:if></c:forEach>>DEAL</option>
                                <option value=":TAPC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_590_of19a_qualifier_d'}"><c:if test="${item.detail==':TAPC//'}"> selected="true" </c:if></c:if></c:forEach>>TAPC</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sign</span>
                            <input class="template_selection" disabled="disabled" id="check_of19a_sign_d" name="check_of19a_sign_d" type="checkbox"/>
                            <div id="div_opt_of19a_sign_d">
                                <input class="template_selection" data-swift="N" disabled="disabled" id="_5901_of19a_sign_d" name="_5901_of19a_sign_d" maxlength="1" input_type="OF19A Sign" location="Body" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5901_of19a_sign_d'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency Code</span>
                            <input class="mandatory template_selection" data-swift="3!a" disabled="disabled" id="_5902_of19a_currency_code_d" name="_5902_of19a_currency_code_d" maxlength="3" input_type="OF19A Currency Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5902_of19a_currency_code_d'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                            <input class="mandatory template_selection" data-swift="15d" disabled="disabled" id="_5903_of19a_amount_d" name="_5903_of19a_amount_d" maxlength="15" input_type="OF19A Amount" location="Body" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_5903_of19a_amount_d'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                        </div>
                    </div>
                    <div id="container_of19a_d">
                        <input class="cust-btn template_selection" data-count="0" data-id="of19a_d" onclick="addContainer(this)" type="button" value="Add Field OF19A"/>
                        <span class="label">Min: <span class="min_val" id="min_occ_of19a_d">0</span>, Max: <span class="max_val" id="max_occ_of19a_d">6</span>, Count: <span class="count_val" id="cur_occ_of19a_d">0</span></span>
                    </div>
                </div>
                <hr/>
                                
                <!-- Field 60: OF70C Second Leg Narrative -->
                <div class="form-row"><span class="label_body">OF70C</span><span class="label">Second Leg Narrative</span>
                    <div id="div_opt_of70c_d">
                        <input class="template_selection" disabled="disabled" id="_600_of70c_d_qualifier" name="_600_of70c_d_qualifier" input_type="OF70C Qualifier" location="Body" type="hidden" value=":SECO/"/>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                            <textarea class="mandatory template_selection" cols="35" data-swift="4*35x" disabled="disabled" id="_6001_of70c_d_narrative" name="_6001_of70c_d_narrative" input_type="OF70C Narrative" location="Body" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6001_of70c_d_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                    </div>
                </div>
                <hr/>                
                
                <!-- Field 61: MF16S End of Block -->
                <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                    <input class="template_selection" disabled="disabled" id="_610_mf16s_d_end_of_block" name="_610_mf16s_d_end_of_block" input_type="MF16S End of Block" location="Body" value="REPO"/>
                </div>
                <hr/>
                
                </div>
                <h2 class="header-title">End of Sequence D Two Leg Transaction Details</h2>
                
                <h2 class="header-title">Mandatory Sequence E Settlement Details</h2>
                <hr/>                            
                            
                <!-- Field 62: MF16R Start of Block -->
                <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                    <input disabled="disabled" id="_620_mf16r_e_start_of_block" name="_620_mf16r_e_start_of_block" input_type="MF16R Start of Block" location="Body" value="SETDET" />
                </div>
                <hr/>
              
                <!-- Field 63: MF22F Indicator -->
                <div class="form-row"><span class="label_body">MF22F</span><span class="label"><a style="color:red;text-decoration:none">*</a>Indicator</span>
                    <div class="template_container" id="template_mf22f_e" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_mf22f_e">Count</span>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Qualifier</span>
                            <select class="mandatory" disabled="disabled" id="_630_mf22f_e_qualifier" name="_630_mf22f_e_qualifier" input_type="MF22F Qualifier" location="Body">
                                <option value="">choose a type</option>
                                <option value=":STCO/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':STCO/'}"> selected="true" </c:if></c:if></c:forEach>>STCO</option>
                                <option value=":SETR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':SETR/'}"> selected="true" </c:if></c:if></c:forEach>>SETR</option>
                                <option value=":TRCA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':TRCA/'}"> selected="true" </c:if></c:if></c:forEach>>TRCA</option>
                                <option value=":STAM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':STAM/'}"> selected="true" </c:if></c:if></c:forEach>>STAM</option>
                                <option value=":RTGS/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':RTGS/'}"> selected="true" </c:if></c:if></c:forEach>>RTGS</option>
                                <option value=":REGT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':REGT/'}"> selected="true" </c:if></c:if></c:forEach>>REGT</option>
                                <option value=":BENE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':BENE/'}"> selected="true" </c:if></c:if></c:forEach>>BENE</option>
                                <option value=":CASY/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':CASY/'}"> selected="true" </c:if></c:if></c:forEach>>CASY</option>
                                <option value=":DBNM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':DBNM/'}"> selected="true" </c:if></c:if></c:forEach>>DBNM</option>
                                <option value=":TCPI/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':TCPI/'}"> selected="true" </c:if></c:if></c:forEach>>TCPI</option>
                                <option value=":MACL/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':MACL/'}"> selected="true" </c:if></c:if></c:forEach>>MACL</option>
                                <option value=":FXCX/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':FXCX/'}"> selected="true" </c:if></c:if></c:forEach>>FXCX</option>
                                <option value=":BLOC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':BLOC/'}"> selected="true" </c:if></c:if></c:forEach>>BLOC</option>
                                <option value=":REST/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':REST/'}"> selected="true" </c:if></c:if></c:forEach>>REST</option>
                                <option value=":SETS/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':SETS/'}"> selected="true" </c:if></c:if></c:forEach>>SETS</option>
                                <option value=":NETT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':NETT/'}"> selected="true" </c:if></c:if></c:forEach>>NETT</option>
                                <option value=":CCPT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':CCPT/'}"> selected="true" </c:if></c:if></c:forEach>>CCPT</option>
                                <option value=":RTRN/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':RTRN/'}"> selected="true" </c:if></c:if></c:forEach>>RTRN</option>
                                <option value=":LEOG/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':LEOG/'}"> selected="true" </c:if></c:if></c:forEach>>LEOG</option>
                                <option value=":COLA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':COLA/'}"> selected="true" </c:if></c:if></c:forEach>>COLA</option>
                                <option value=":TRAK/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':TRAK/'}"> selected="true" </c:if></c:if></c:forEach>>TRAK</option>
                                <option value=":REPT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':REPT/'}"> selected="true" </c:if></c:if></c:forEach>>REPT</option>
                                <option value=":COLE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':COLE/'}"> selected="true" </c:if></c:if></c:forEach>>COLE</option>
                                <option value=":SSBT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':SSBT/'}"> selected="true" </c:if></c:if></c:forEach>>SSBT</option>
                                <option value=":CSBT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_mf22f_e_qualifier'}"><c:if test="${item.detail==':CSBT/'}"> selected="true" </c:if></c:if></c:forEach>>CSBT</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Data Source Scheme</span>
                            <input disabled="disabled" id="check_mf22f_data_source_scheme_e" name="check_mf22f_data_source_scheme_e" type="checkbox" />
                            <div id="div_opt_mf22f_data_source_scheme_e">
                                <input type="text" data-swift="8c" disabled="disabled" id="_6301_mf22f_e_data_source_scheme" name="_6301_mf22f_e_data_source_scheme" maxlength="8" input_type="MF22F Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6301_mf22f_e_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <input type="hidden" disabled="disabled" id="_6302_mf22f_e_slash" name="_6302_mf22f_e_slash" input_type="MF22F Slash" location="Body" value="/" />
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Indicator</span>
                            <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_6303_mf22f_e_indicator" name="_6303_mf22f_e_indicator" maxlength="4" input_type="MF22F Indicator" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6303_mf22f_e_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                    </div>
                    <div id="container_mf22f_e">
                        <input type="button" class="cust-btn" value="Add Field MF22F" onclick="addContainer(this)" data-id="mf22f_e" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_mf22f_e">1</span>, Max: <span class="max_val" id="max_occ_mf22f_e">-</span>, Count: <span class="count_val" id="cur_occ_mf22f_e">0</span></span>
                    </div>
                </div>
                <hr/>
              
                <!-- Mandatory Repetitive Subsequence E1 Settlement Parties -->
                <div class="form-row">
                    <h2 class="header-title">Mandatory Repetitive Subsequence E1 Settlement Parties</h2>
                    <hr/>

                    <span class="label_body">E1</span><span class="label">Settlement Parties</span>
                    <div class="template_container" id="template_e1" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_e1">Count</span>
                        </div>
              
                        <!-- Field 64: MF16R Start of Block -->
                        <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                            <input disabled="disabled" id="_640_mf16r_e1_start_of_block" name="_640_mf16r_e1_start_of_block" input_type="MF16R Start of Block" location="Body" value="SETPRTY" />
                        </div>
                        
                        <!-- Field 65: MF95A Party -->
                        <div class="form-row"><span class="label_body">MF95A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Party</span>
                            <div class="template_container template_seq_div_rep" id="template_mf95a_e1" style="display:none;">
                                <div class="form-row">
                                    <span class="label_body">
                                        <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                                    </span>
                                    <span class="label" id="label_count_mf95a_e1">Count</span>
                                </div>
                                <select class="selection_div mandatory" disabled="disabled" class="mandatory" id="type_mf95_e1" name="type_mf95_e1" input_type="MF95A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="c">C - Country Code</option>
                                    <option value="d">D - Digital Ledger Identifier</option>
                                    <option value="l">L - Legal Entity Identifier</option>
                                    <option value="p">P - Identifier Code</option>
                                    <option value="q">Q - Name and Address</option>
                                    <option value="r">R - Data Source Scheme - Proprietary Code</option>
                                    <option value="s">S - Data Source Scheme - Type of ID - Country Code - Alternate ID</option>
                                </select>
                                <!-- Option C: Country Code -->
                                <div id="div_mf95c_e1">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_650_mf95c_e1_qualifier" name="_650_mf95c_e1_qualifier" input_type="MF95C Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":PSET//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_650_mf95c_e1_qualifier'}"><c:if test="${item.detail==':PSET//'}"> selected="true" </c:if></c:if></c:forEach>>PSET</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Country Code</span>
                                        <input type="text" class="mandatory" data-swift="2!a" disabled="disabled" id="_6501_mf95c_e1_country_code" name="_6501_mf95c_e1_country_code" maxlength="2" input_type="MF95C Country Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6501_mf95c_e1_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option D: Digital Ledger Identifier -->
                                <div id="div_mf95d_e1">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_6502_mf95d_e1_qualifier" name="_6502_mf95d_e1_qualifier" input_type="MF95D Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":PSET//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6502_mf95d_e1_qualifier'}"><c:if test="${item.detail==':PSET//'}"> selected="true" </c:if></c:if></c:forEach>>PSET</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Digital Ledger Identifier</span>
                                        <input type="text" class="mandatory" data-swift="9!x" disabled="disabled" id="_6503_mf95d_e1_digital_ledger_identifier" name="_6503_mf95d_e1_digital_ledger_identifier" maxlength="9" input_type="MF95D Digital Ledger Identifier" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6503_mf95d_e1_digital_ledger_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option L: Legal Entity Identifier -->
                                <div id="div_mf95l_e1">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_6504_mf95l_e1_qualifier" name="_6504_mf95l_e1_qualifier" input_type="MF95L Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":BUYR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6504_mf95l_e1_qualifier'}"><c:if test="${item.detail==':BUYR//'}"> selected="true" </c:if></c:if></c:forEach>>BUYR</option>
                                            <option value=":DEAG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6504_mf95l_e1_qualifier'}"><c:if test="${item.detail==':DEAG//'}"> selected="true" </c:if></c:if></c:forEach>>DEAG</option>
                                            <option value=":DECU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6504_mf95l_e1_qualifier'}"><c:if test="${item.detail==':DECU//'}"> selected="true" </c:if></c:if></c:forEach>>DECU</option>
                                            <option value=":DEI1//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6504_mf95l_e1_qualifier'}"><c:if test="${item.detail==':DEI1//'}"> selected="true" </c:if></c:if></c:forEach>>DEI1</option>
                                            <option value=":DEI2//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6504_mf95l_e1_qualifier'}"><c:if test="${item.detail==':DEI2//'}"> selected="true" </c:if></c:if></c:forEach>>DEI2</option>
                                            <option value=":REAG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6504_mf95l_e1_qualifier'}"><c:if test="${item.detail==':REAG//'}"> selected="true" </c:if></c:if></c:forEach>>REAG</option>
                                            <option value=":RECU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6504_mf95l_e1_qualifier'}"><c:if test="${item.detail==':RECU//'}"> selected="true" </c:if></c:if></c:forEach>>RECU</option>
                                            <option value=":REI1//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6504_mf95l_e1_qualifier'}"><c:if test="${item.detail==':REI1//'}"> selected="true" </c:if></c:if></c:forEach>>REI1</option>
                                            <option value=":REI2//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6504_mf95l_e1_qualifier'}"><c:if test="${item.detail==':REI2//'}"> selected="true" </c:if></c:if></c:forEach>>REI2</option>
                                            <option value=":SELL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6504_mf95l_e1_qualifier'}"><c:if test="${item.detail==':SELL//'}"> selected="true" </c:if></c:if></c:forEach>>SELL</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Legal Entity Identifier</span>
                                        <input type="text" class="mandatory" data-swift="18!c2!n" disabled="disabled" id="_6505_mf95l_e1_legal_entity_identifier" name="_6505_mf95l_e1_legal_entity_identifier" maxlength="20" input_type="MF95L Legal Entity Identifier" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6505_mf95l_e1_legal_entity_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option P: Identifier Code -->
                                <div id="div_mf95p_e1">
                                    <input type="hidden" disabled="disabled" id="_6506_mf95p_e1_qualifier" name="_6506_mf95p_e1_qualifier" input_type="MF95P Qualifier" location="Body" value=":ALTE/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" class="mandatory" data-swift="4!a2!a2!c[3!c]" disabled="disabled" id="_6507_mf95p_e1_identifier_code" name="_6507_mf95p_e1_identifier_code" maxlength="11" input_type="MF95P Identifier Code" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6507_mf95p_e1_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option Q: Name and Address -->
                                <div id="div_mf95q_e1">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_6508_mf95q_e1_qualifier" name="_6508_mf95q_e1_qualifier" input_type="MF95Q Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":BUYR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6508_mf95q_e1_qualifier'}"><c:if test="${item.detail==':BUYR//'}"> selected="true" </c:if></c:if></c:forEach>>BUYR</option>
                                            <option value=":DEAG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6508_mf95q_e1_qualifier'}"><c:if test="${item.detail==':DEAG//'}"> selected="true" </c:if></c:if></c:forEach>>DEAG</option>
                                            <option value=":DECU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6508_mf95q_e1_qualifier'}"><c:if test="${item.detail==':DECU//'}"> selected="true" </c:if></c:if></c:forEach>>DECU</option>
                                            <option value=":DEI1//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6508_mf95q_e1_qualifier'}"><c:if test="${item.detail==':DEI1//'}"> selected="true" </c:if></c:if></c:forEach>>DEI1</option>
                                            <option value=":DEI2//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6508_mf95q_e1_qualifier'}"><c:if test="${item.detail==':DEI2//'}"> selected="true" </c:if></c:if></c:forEach>>DEI2</option>
                                            <option value=":PSET//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6508_mf95q_e1_qualifier'}"><c:if test="${item.detail==':PSET//'}"> selected="true" </c:if></c:if></c:forEach>>PSET</option>
                                            <option value=":REAG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6508_mf95q_e1_qualifier'}"><c:if test="${item.detail==':REAG//'}"> selected="true" </c:if></c:if></c:forEach>>REAG</option>
                                            <option value=":RECU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6508_mf95q_e1_qualifier'}"><c:if test="${item.detail==':RECU//'}"> selected="true" </c:if></c:if></c:forEach>>RECU</option>
                                            <option value=":REI1//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6508_mf95q_e1_qualifier'}"><c:if test="${item.detail==':REI1//'}"> selected="true" </c:if></c:if></c:forEach>>REI1</option>
                                            <option value=":REI2//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6508_mf95q_e1_qualifier'}"><c:if test="${item.detail==':REI2//'}"> selected="true" </c:if></c:if></c:forEach>>REI2</option>
                                            <option value=":SELL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6508_mf95q_e1_qualifier'}"><c:if test="${item.detail==':SELL//'}"> selected="true" </c:if></c:if></c:forEach>>SELL</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea class="mandatory" cols="35" rows="4" data-swift="4*35x" disabled="disabled" id="_6509_mf95q_e1_name_and_address" name="_6509_mf95q_e1_name_and_address" input_type="MF95Q Name and Address" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6509_mf95q_e1_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <!-- Option R: Data Source Scheme - Proprietary Code -->
                                <div id="div_mf95r_e1">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_6510_mf95r_e1_qualifier" name="_6510_mf95r_e1_qualifier" input_type="MF95R Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":BUYR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6510_mf95r_e1_qualifier'}"><c:if test="${item.detail==':BUYR/'}"> selected="true" </c:if></c:if></c:forEach>>BUYR</option>
                                            <option value=":DEAG/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6510_mf95r_e1_qualifier'}"><c:if test="${item.detail==':DEAG/'}"> selected="true" </c:if></c:if></c:forEach>>DEAG</option>
                                            <option value=":DECU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6510_mf95r_e1_qualifier'}"><c:if test="${item.detail==':DECU/'}"> selected="true" </c:if></c:if></c:forEach>>DECU</option>
                                            <option value=":DEI1/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6510_mf95r_e1_qualifier'}"><c:if test="${item.detail==':DEI1/'}"> selected="true" </c:if></c:if></c:forEach>>DEI1</option>
                                            <option value=":DEI2/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6510_mf95r_e1_qualifier'}"><c:if test="${item.detail==':DEI2/'}"> selected="true" </c:if></c:if></c:forEach>>DEI2</option>
                                            <option value=":REAG/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6510_mf95r_e1_qualifier'}"><c:if test="${item.detail==':REAG/'}"> selected="true" </c:if></c:if></c:forEach>>REAG</option>
                                            <option value=":RECU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6510_mf95r_e1_qualifier'}"><c:if test="${item.detail==':RECU/'}"> selected="true" </c:if></c:if></c:forEach>>RECU</option>
                                            <option value=":REI1/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6510_mf95r_e1_qualifier'}"><c:if test="${item.detail==':REI1/'}"> selected="true" </c:if></c:if></c:forEach>>REI1</option>
                                            <option value=":REI2/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6510_mf95r_e1_qualifier'}"><c:if test="${item.detail==':REI2/'}"> selected="true" </c:if></c:if></c:forEach>>REI2</option>
                                            <option value=":SELL/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6510_mf95r_e1_qualifier'}"><c:if test="${item.detail==':SELL/'}"> selected="true" </c:if></c:if></c:forEach>>SELL</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                        <input type="text" class="mandatory" data-swift="8c" disabled="disabled" id="_6511_mf95r_e1_data_source_scheme" name="_6511_mf95r_e1_data_source_scheme" maxlength="8" input_type="MF95R Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6511_mf95r_e1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_6512_mf95r_e1_slash" name="_6512_mf95r_e1_slash" input_type="MF95R Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Proprietary Code</span>
                                        <input type="text" class="mandatory" data-swift="34x" disabled="disabled" id="_6513_mf95r_e1_proprietary_code" name="_6513_mf95r_e1_proprietary_code" maxlength="34" input_type="MF95R Proprietary Code" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6513_mf95r_e1_proprietary_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option S: Data Source Scheme - Type of ID - Country Code - Alternate ID -->
                                <div id="div_mf95s_e1">
                                    <input type="hidden" disabled="disabled" id="_6514_mf95s_e1_qualifier" name="_6514_mf95s_e1_qualifier" input_type="MF95S Qualifier" location="Body" value=":ALTE/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                        <input type="checkbox" class="template_selection" disabled="disabled" id="check_mf95s_data_source_scheme_e1" name="check_mf95s_data_source_scheme_e1" />
                                        <div id="div_opt_mf95s_data_source_scheme_e1">
                                            <input type="text" data-swift="8c" disabled="disabled" id="_6515_mf95s_e1_data_source_scheme" name="_6515_mf95s_e1_data_source_scheme" maxlength="8" input_type="MF95S Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6515_mf95s_e1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_6516_mf95s_e1_slash1" name="_6516_mf95s_e1_slash1" input_type="MF95S Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Type of ID</span>
                                        <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_6517_mf95s_e1_type_of_id" name="_6517_mf95s_e1_type_of_id" maxlength="4" input_type="MF95S Type of ID" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6517_mf95s_e1_type_of_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_6518_mf95s_e1_slash2" name="_6518_mf95s_e1_slash2" input_type="MF95S Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Country Code</span>
                                        <input type="text" class="mandatory" data-swift="2!a" disabled="disabled" id="_6519_mf95s_e1_country_code" name="_6519_mf95s_e1_country_code" maxlength="2" input_type="MF95S Country Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6519_mf95s_e1_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_6520_mf95s_e1_slash3" name="_6520_mf95s_e1_slash3" input_type="MF95S Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Alternate ID</span>
                                        <input type="text" class="mandatory" data-swift="30x" disabled="disabled" id="_6521_mf95s_e1_alternate_id" name="_6521_mf95s_e1_alternate_id" maxlength="30" input_type="MF95S Alternate ID" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6521_mf95s_e1_alternate_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <div class="container_seq_rep_div" id="container_mf95a_e1">
                                <input type="button" class="cust-btn" value="Add Field MF95A" onclick="addSeqRepContainer(this)" data-id="mf95a_e1" data-count="0" disabled="disabled" />
                                <span class="label">Min: <span class="min_val" id="min_occ_mf95a_e1">1</span>, Max: <span class="max_val" id="max_occ_mf95a_e1">-</span>, Count: <span class="count_val" id="cur_occ_mf95a_e1">0</span></span>
                            </div>
                        </div>
                        
                        <!-- Field 66: OF97A Account -->
                        <div class="form-row"><span class="label_body">OF97A</span><span class="label">Account</span>
                            <input type="checkbox" class="checkbox_div" disabled="disabled" id="check_of97a_e1" name="check_of97a_e1" />
                            <div id="div_opt_of97a_e1">
                                <select class="selection_div" disabled="disabled" id="type_of97_e1" name="type_of97_e1" input_type="OF97A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Account Number</option>
                                    <option value="b">B - Data Source Scheme - Account Type Code - Account Number</option>
                                    <option value="d">D - Data Source Scheme - Identification of Blockchain or Wallet</option>
                                </select>
                                <!-- Option A: Account Number -->
                                <div id="div_of97a_e1">
                                    <input type="hidden" disabled="disabled" id="_660_of97a_e1_qualifier" name="_660_of97a_e1_qualifier" input_type="OF97A Qualifier" location="Body" value=":SAFE//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account Number</span>
                                        <input type="text" class="mandatory" data-swift="35x" disabled="disabled" id="_6601_of97a_e1_account_number" name="_6601_of97a_e1_account_number" maxlength="35" input_type="OF97A Account Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6601_of97a_e1_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option B: Data Source Scheme - Account Type Code - Account Number -->
                                <div id="div_of97b_e1">
                                    <input type="hidden" disabled="disabled" id="_6602_of97b_e1_qualifier" name="_6602_of97b_e1_qualifier" input_type="OF97B Qualifier" location="Body" value=":SAFE/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                        <div id="div_opt_of97b_data_source_scheme_e1">
                                            <input type="text" data-swift="8c" disabled="disabled" id="_6603_of97b_e1_data_source_scheme" name="_6603_of97b_e1_data_source_scheme" maxlength="8" input_type="OF97B Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6603_of97b_e1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_6604_of97b_e1_slash1" name="_6604_of97b_e1_slash1" input_type="OF97B Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account Type Code</span>
                                        <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_6605_of97b_e1_account_type_code" name="_6605_of97b_e1_account_type_code" maxlength="4" input_type="OF97B Account Type Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6605_of97b_e1_account_type_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_6606_of97b_e1_slash2" name="_6606_of97b_e1_slash2" input_type="OF97B Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account Number</span>
                                        <input type="text" class="mandatory" data-swift="35x" disabled="disabled" id="_6607_of97b_e1_account_number" name="_6607_of97b_e1_account_number" maxlength="35" input_type="OF97B Account Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6607_of97b_e1_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option D: Data Source Scheme - Identification of Blockchain or Wallet -->
                                <div id="div_of97d_e1">
                                    <input type="hidden" disabled="disabled" id="_6608_of97d_e1_qualifier" name="_6608_of97d_e1_qualifier" input_type="OF97D Qualifier" location="Body" value=":BCAW/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                        <div id="div_opt_of97d_data_source_scheme_e1">
                                            <input type="text" data-swift="8c" disabled="disabled" id="_6609_of97d_e1_data_source_scheme" name="_6609_of97d_e1_data_source_scheme" maxlength="8" input_type="OF97D Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6609_of97d_e1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_6610_of97d_e1_slash" name="_6610_of97d_e1_slash" input_type="OF97D Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identification of Blockchain or Wallet</span>
                                        <input type="text" class="mandatory" data-swift="140x" disabled="disabled" id="_6611_of97d_e1_blockchain_wallet" name="_6611_of97d_e1_blockchain_wallet" maxlength="140" input_type="OF97D Identification of Blockchain or Wallet" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6611_of97d_e1_blockchain_wallet'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                        </div>              		
                                    
                        <!-- Field 67: OF98A Processing Date/Time -->
                        <div class="form-row"><span class="label_body">OF98A</span><span class="label">Processing Date/Time</span>
                            <input type="checkbox" class="checkbox_div" disabled="disabled" id="check_of98a_e1" name="check_of98a_e1" />
                            <div id="div_opt_of98a_e1">
                                <select class="selection_div" disabled="disabled" id="type_of98_e1" name="type_of98_e1" input_type="OF98A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Date</option>
                                    <option value="c">C - Date - Time</option>
                                </select>
                                <!-- Option A: Date -->
                                <div id="div_of98a_e1">
                                    <input type="hidden" disabled="disabled" id="_670_of98a_e1_qualifier" name="_670_of98a_e1_qualifier" input_type="OF98A Qualifier" location="Body" value=":PROC//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_6701_of98a_e1_date" name="_6701_of98a_e1_date" maxlength="8" input_type="OF98A Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6701_of98a_e1_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option C: Date - Time -->
                                <div id="div_of98c_e1">
                                    <input type="hidden" disabled="disabled" id="_6702_of98c_e1_qualifier" name="_6702_of98c_e1_qualifier" input_type="OF98C Qualifier" location="Body" value=":PROC//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_6703_of98c_e1_date" name="_6703_of98c_e1_date" maxlength="8" input_type="OF98C Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6703_of98c_e1_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time</span>
                                        <input type="text" class="mandatory" data-swift="6!n" disabled="disabled" id="_6704_of98c_e1_time" name="_6704_of98c_e1_time" maxlength="6" input_type="OF98C Time" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6704_of98c_e1_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                        </div>
                                    
                        <!-- Field 68: OF20C Processing Reference -->
                        <div class="form-row"><span class="label_body">OF20C</span><span class="label">Processing Reference</span>
                            <input type="checkbox" class="checkbox_div" disabled="disabled" id="check_of20c_e1" name="check_of20c_e1" />
                            <div id="div_opt_of20c_e1">
                                <input type="hidden" disabled="disabled" id="_680_of20c_e1_qualifier" name="_680_of20c_e1_qualifier" input_type="OF20C Qualifier" location="Body" value=":PROC//" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Reference</span>
                                    <input type="text" class="mandatory" data-swift="16x" disabled="disabled" id="_6801_of20c_e1_reference" name="_6801_of20c_e1_reference" maxlength="16" input_type="OF20C Reference" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6801_of20c_e1_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>
                                    
                        <!-- Field 69: OF70A Narrative -->
                        <div class="form-row"><span class="label_body">OF70A</span><span class="label">Narrative</span>
                            <div class="template_container template_seq_div_rep" id="template_of70a_e1" style="display:none;">
                                <div class="form-row">
                                    <span class="label_body">
                                        <input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
                                    </span>
                                    <span class="label" id="label_count_of70a_e1">Count</span>
                                </div>
                                <select class="selection_div" disabled="disabled" id="type_of70_e1" name="type_of70_e1" input_type="OF70A Narrative" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="c">C - Narrative</option>
                                    <option value="d">D - Narrative</option>
                                    <option value="e">E - Narrative</option>
                                </select>
                                <!-- Option C: Narrative -->
                                <div id="div_of70c_e1">
                                    <input disabled="disabled" id="_690_of70c_e1_prefix" name="_690_of70c_e1_prefix" input_type="OF70C Prefix" location="Body" type="hidden" value=":PACO//"/>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                        <textarea class="mandatory" cols="35" data-swift="4*35x" disabled="disabled" id="_6901_of70c_e1_narrative" name="_6901_of70c_e1_narrative" input_type="OF70C Narrative" location="Body" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6901_of70c_e1_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <!-- Option D: Narrative -->
                                <div id="div_of70d_e1">
                                    <input disabled="disabled" id="_6902_of70d_e1_prefix" name="_6902_of70d_e1_prefix" input_type="OF70D Prefix" location="Body" type="hidden" value=":REGI//"/>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                        <textarea class="mandatory" cols="35" data-swift="6*35x" disabled="disabled" id="_6903_of70d_e1_narrative" name="_6903_of70d_e1_narrative" input_type="OF70D Narrative" location="Body" rows="6"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6903_of70d_e1_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <!-- Option E: Narrative -->
                                <div id="div_of70e_e1">
                                    <input disabled="disabled" id="_6904_of70e_e1_prefix" name="_6904_of70e_e1_prefix" input_type="OF70E Prefix" location="Body" type="hidden" value=":DECL//"/>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                        <textarea class="mandatory" cols="35" data-swift="10*35x" disabled="disabled" id="_6905_of70e_e1_narrative" name="_6905_of70e_e1_narrative" input_type="OF70E Narrative" location="Body" rows="10"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_6905_of70e_e1_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="container_seq_rep_div" id="container_of70a_e1">
                                <input class="cust-btn" data-count="0" data-id="of70a_e1" disabled="disabled" onclick="addSeqRepContainer(this)" type="button" value="Add Field OF70A"/>
                                <span class="label">Min: <span class="min_val" id="min_occ_of70a_e1">0</span>, Max: <span class="max_val" id="max_occ_of70a_e1">3</span>, Count: <span class="count_val" id="cur_occ_of70a_e1">0</span></span>
                            </div>
                        </div>
                                
                        <!-- Field 70: MF16S End of Block -->
                        <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                            <input disabled="disabled" id="_700_mf16s_e1_end_of_block" name="_700_mf16s_e1_end_of_block" input_type="MF16S End of Block" location="Body" value="SETPRTY"/>
                        </div>
                    </div>
                    <div id="container_e1">
                        <input class="cust-btn" data-count="0" data-id="e1" onclick="addTemplateContainer(this)" type="button" value="Add Field E1"/>
                        <span class="label">Min: <span class="min_val" id="min_occ_e1">1</span>, Max: <span class="max_val" id="max_occ_e1">-</span>, Count: <span class="count_val" id="cur_occ_e1">0</span></span>
                    </div>

                    <h2 class="header-title">End of Subsequence E1 Settlement Parties</h2>
                </div>
                <hr/>
                                    
                <!-- Optional Repetitive Subsequence E2 Cash Parties -->
                <div class="form-row">
                    <h2 class="header-title">Optional Repetitive Subsequence E2 Cash Parties</h2>
                    <hr/>

                    <span class="label_body">E2</span><span class="label">Cash Parties</span>
                    <div class="template_container" id="template_e2" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input class="remove-btn" disabled="disabled" type="button" value="Remove"/>
                            </span>
                            <span class="label" id="label_count_e2">Count</span>
                        </div>
              
                        <!-- Field 71: MF16R Start of Block -->
                        <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                            <input disabled="disabled" id="_710_mf16r_e2_start_of_block" name="_710_mf16r_e2_start_of_block" input_type="MF16R Start of Block" location="Body" value="CSHPRTY"/>
                        </div>

                        <!-- Field 72: MF95A Party -->
                        <div class="form-row"><span class="label_body">MF95A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Party</span>
                            <div class="template_container template_seq_div_rep" id="template_mf95a_e2" style="display:none;">
                                <div class="form-row">
                                    <span class="label_body">
                                        <input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
                                    </span>
                                    <span class="label" id="label_count_mf95a_e2">Count</span>
                                </div>
                                <select class="selection_div mandatory" disabled="disabled" class="mandatory" id="type_mf95_e2" name="type_mf95_e2" input_type="MF95A Party" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="l">L - Legal Entity Identifier</option>
                                    <option value="p">P - Identifier Code</option>
                                    <option value="q">Q - Name and Address</option>
                                    <option value="r">R - Qualifier - Data Source Scheme - Proprietary Code</option>
                                    <option value="s">S - Data Source Scheme - Type of ID - Country Code - Alternate ID</option>
                                </select>
                                <!-- Option L: Legal Entity Identifier -->
                                <div id="div_mf95l_e2">
                                    <input disabled="disabled" id="_720_mf95l_e2_prefix" name="_720_mf95l_e2_prefix" input_type="MF95L Prefix" location="Body" type="hidden" value=":ALTE//"/>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Legal Entity Identifier</span>
                                        <input class="mandatory" data-swift="18!c2!n" disabled="disabled" id="_7201_mf95l_e2_legal_entity_identifier" name="_7201_mf95l_e2_legal_entity_identifier" maxlength="20" input_type="MF95L Legal Entity Identifier" location="Body" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7201_mf95l_e2_legal_entity_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                                <!-- Option P: Identifier Code -->
                                <div id="div_mf95p_e2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_7202_mf95p_e2_qualifier" name="_7202_mf95p_e2_qualifier" input_type="MF95P Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":ACCW//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7202_mf95p_e2_qualifier'}"><c:if test="${item.detail==':ACCW//'}"> selected="true" </c:if></c:if></c:forEach>>ACCW</option>
                                            <option value=":BENM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7202_mf95p_e2_qualifier'}"><c:if test="${item.detail==':BENM//'}"> selected="true" </c:if></c:if></c:forEach>>BENM</option>
                                            <option value=":DEBT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7202_mf95p_e2_qualifier'}"><c:if test="${item.detail==':DEBT//'}"> selected="true" </c:if></c:if></c:forEach>>DEBT</option>
                                            <option value=":INTM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7202_mf95p_e2_qualifier'}"><c:if test="${item.detail==':INTM//'}"> selected="true" </c:if></c:if></c:forEach>>INTM</option>
                                            <option value=":PAYE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7202_mf95p_e2_qualifier'}"><c:if test="${item.detail==':PAYE//'}"> selected="true" </c:if></c:if></c:forEach>>PAYE</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input class="mandatory" data-swift="4!a2!a2!c[3!c]" disabled="disabled" id="_7203_mf95p_e2_identifier_code" name="_7203_mf95p_e2_identifier_code" maxlength="11" input_type="MF95P Identifier Code" location="Body" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7203_mf95p_e2_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                                <!-- Option Q: Name and Address -->
                                <div id="div_mf95q_e2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_7204_mf95q_e2_qualifier" name="_7204_mf95q_e2_qualifier" input_type="MF95Q Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":ACCW//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7204_mf95q_e2_qualifier'}"><c:if test="${item.detail==':ACCW//'}"> selected="true" </c:if></c:if></c:forEach>>ACCW</option>
                                            <option value=":BENM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7204_mf95q_e2_qualifier'}"><c:if test="${item.detail==':BENM//'}"> selected="true" </c:if></c:if></c:forEach>>BENM</option>
                                            <option value=":DEBT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7204_mf95q_e2_qualifier'}"><c:if test="${item.detail==':DEBT//'}"> selected="true" </c:if></c:if></c:forEach>>DEBT</option>
                                            <option value=":INTM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7204_mf95q_e2_qualifier'}"><c:if test="${item.detail==':INTM//'}"> selected="true" </c:if></c:if></c:forEach>>INTM</option>
                                            <option value=":PAYE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7204_mf95q_e2_qualifier'}"><c:if test="${item.detail==':PAYE//'}"> selected="true" </c:if></c:if></c:forEach>>PAYE</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea class="mandatory" cols="35" data-swift="4*35x" disabled="disabled" id="_7205_mf95q_e2_name_and_address" name="_7205_mf95q_e2_name_and_address" input_type="MF95Q Name and Address" location="Body" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7205_mf95q_e2_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <!-- Option R: Data Source Scheme - Proprietary Code -->
                                <div id="div_mf95r_e2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_7206_mf95r_e2_qualifier" name="_7206_mf95r_e2_qualifier" input_type="MF95R Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":ACCW/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7206_mf95r_e2_qualifier'}"><c:if test="${item.detail==':ACCW/'}"> selected="true" </c:if></c:if></c:forEach>>ACCW</option>
                                            <option value=":BENM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7206_mf95r_e2_qualifier'}"><c:if test="${item.detail==':BENM/'}"> selected="true" </c:if></c:if></c:forEach>>BENM</option>
                                            <option value=":DEBT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7206_mf95r_e2_qualifier'}"><c:if test="${item.detail==':DEBT/'}"> selected="true" </c:if></c:if></c:forEach>>DEBT</option>
                                            <option value=":INTM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7206_mf95r_e2_qualifier'}"><c:if test="${item.detail==':INTM/'}"> selected="true" </c:if></c:if></c:forEach>>INTM</option>
                                            <option value=":PAYE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7206_mf95r_e2_qualifier'}"><c:if test="${item.detail==':PAYE/'}"> selected="true" </c:if></c:if></c:forEach>>PAYE</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                        <input class="mandatory" data-swift="8c" disabled="disabled" id="_7207_mf95r_e2_data_source_scheme" name="_7207_mf95r_e2_data_source_scheme" maxlength="8" input_type="MF95R Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7207_mf95r_e2_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <input disabled="disabled" id="_7208_mf95r_e2_slash" name="_7208_mf95r_e2_slash" input_type="MF95R Slash" location="Body" type="hidden" value="/"/>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Proprietary Code</span>
                                        <input class="mandatory" data-swift="34x" disabled="disabled" id="_7209_mf95r_e2_proprietary_code" name="_7209_mf95r_e2_proprietary_code" maxlength="34" input_type="MF95R Proprietary Code" location="Body" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7209_mf95r_e2_proprietary_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                                <!-- Option S: Data Source Scheme - Type of ID - Country Code - Alternate ID -->
                                <div id="div_mf95s_e2">
                                    <input disabled="disabled" id="_72010_mf95s_e2_prefix" name="_72010_mf95s_e2_prefix" input_type="MF95S Prefix" location="Body" type="hidden" value=":ALTE/"/>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                        <input class="template_selection" disabled="disabled" id="check_mf95s_data_source_scheme_e2" name="check_mf95s_data_source_scheme_e2" type="checkbox"/>
                                        <div id="div_opt_mf95s_data_source_scheme_e2">
                                            <input data-swift="8c" disabled="disabled" id="_72011_mf95s_e2_data_source_scheme" name="_72011_mf95s_e2_data_source_scheme" maxlength="8" input_type="MF95S Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_72011_mf95s_e2_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                        </div>
                                    </div>
                                    <input disabled="disabled" id="_72012_mf95s_e2_slash1" name="_72012_mf95s_e2_slash1" input_type="MF95S Slash" location="Body" type="hidden" value="/"/>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Type of ID</span>
                                        <input class="mandatory" data-swift="4!c" disabled="disabled" id="_72013_mf95s_e2_type_of_id" name="_72013_mf95s_e2_type_of_id" maxlength="4" input_type="MF95S Type of ID" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_72013_mf95s_e2_type_of_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <input disabled="disabled" id="_72014_mf95s_e2_slash2" name="_72014_mf95s_e2_slash2" input_type="MF95S Slash" location="Body" type="hidden" value="/"/>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Country Code</span>
                                        <input class="mandatory" data-swift="2!a" disabled="disabled" id="_72015_mf95s_e2_country_code" name="_72015_mf95s_e2_country_code" maxlength="2" input_type="MF95S Country Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_72015_mf95s_e2_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <input disabled="disabled" id="_72016_mf95s_e2_slash3" name="_72016_mf95s_e2_slash3" input_type="MF95S Slash" location="Body" type="hidden" value="/"/>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Alternate ID</span>
                                        <input class="mandatory" data-swift="30x" disabled="disabled" id="_72017_mf95s_e2_alternate_id" name="_72017_mf95s_e2_alternate_id" maxlength="30" input_type="MF95S Alternate ID" location="Body" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_72017_mf95s_e2_alternate_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="container_seq_rep_div" id="container_mf95a_e2">
                                <input class="cust-btn" data-count="0" data-id="mf95a_e2" disabled="disabled" onclick="addSeqRepContainer(this)" type="button" value="Add Field MF95A"/>
                                <span class="label">Min: <span class="min_val" id="min_occ_mf95a_e2">1</span>, Max: <span class="max_val" id="max_occ_mf95a_e2">-</span>, Count: <span class="count_val" id="cur_occ_mf95a_e2">0</span></span>
                            </div>
                        </div>
                    
                        <!-- Field 73: OF97A Account -->
                        <div class="form-row"><span class="label_body">OF97A</span><span class="label">Account</span>
                            <div class="template_container template_seq_div_rep" id="template_of97a_e2" style="display:none;">
                                <div class="form-row">
                                    <span class="label_body">
                                        <input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
                                    </span>
                                    <span class="label" id="label_count_of97a_e2">Count</span>
                                </div>
                                <select class="selection_div" disabled="disabled" id="type_of97_e2" name="type_of97_e2" input_type="OF97A Account" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Account Number</option>
                                    <option value="d">D - Data Source Scheme - Identification of Blockchain or Wallet</option>
                                    <option value="e">E - International Bank Account Number</option>
                                </select>
                                <!-- Option A: Account Number -->
                                <div id="div_of97a_e2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_730_of97a_e2_qualifier" name="_730_of97a_e2_qualifier" input_type="OF97A Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":CASH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_730_of97a_e2_qualifier'}"><c:if test="${item.detail==':CASH//'}"> selected="true" </c:if></c:if></c:forEach>>CASH</option>
                                            <option value=":CHAR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_730_of97a_e2_qualifier'}"><c:if test="${item.detail==':CHAR//'}"> selected="true" </c:if></c:if></c:forEach>>CHAR</option>
                                            <option value=":COMM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_730_of97a_e2_qualifier'}"><c:if test="${item.detail==':COMM//'}"> selected="true" </c:if></c:if></c:forEach>>COMM</option>
                                            <option value=":TAXE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_730_of97a_e2_qualifier'}"><c:if test="${item.detail==':TAXE//'}"> selected="true" </c:if></c:if></c:forEach>>TAXE</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account Number</span>
                                        <input class="mandatory" data-swift="35x" disabled="disabled" id="_7301_of97a_e2_account_number" name="_7301_of97a_e2_account_number" maxlength="35" input_type="OF97A Account Number" location="Body" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7301_of97a_e2_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                                <!-- Option D: Data Source Scheme - Identification of Blockchain or Wallet -->
                                <div id="div_of97d_e2">
                                    <input disabled="disabled" id="_7302_of97d_e2_prefix" name="_7302_of97d_e2_prefix" input_type="OF97D Prefix" location="Body" type="hidden" value=":BCCW/"/>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                        <div id="div_opt_of97d_data_source_scheme_e2">
                                            <input data-swift="8c" disabled="disabled" id="_7303_of97d_e2_data_source_scheme" name="_7303_of97d_e2_data_source_scheme" maxlength="8" input_type="OF97D Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7303_of97d_e2_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                        </div>
                                    </div>
                                    <input disabled="disabled" id="_7304_of97d_e2_slash" name="_7304_of97d_e2_slash" input_type="OF97D Slash" location="Body" type="hidden" value="/"/>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identification of Blockchain or Wallet</span>
                                        <input class="mandatory" data-swift="140x" disabled="disabled" id="_7305_of97d_e2_blockchain_wallet" name="_7305_of97d_e2_blockchain_wallet" maxlength="140" input_type="OF97D Identification of Blockchain or Wallet" location="Body" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7305_of97d_e2_blockchain_wallet'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                                <!-- Option E: International Bank Account Number -->
                                <div id="div_of97e_e2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_7306_of97e_e2_qualifier" name="_7306_of97e_e2_qualifier" input_type="OF97E Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":CASH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7306_of97e_e2_qualifier'}"><c:if test="${item.detail==':CASH//'}"> selected="true" </c:if></c:if></c:forEach>>CASH</option>
                                            <option value=":CHAR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7306_of97e_e2_qualifier'}"><c:if test="${item.detail==':CHAR//'}"> selected="true" </c:if></c:if></c:forEach>>CHAR</option>
                                            <option value=":COMM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7306_of97e_e2_qualifier'}"><c:if test="${item.detail==':COMM//'}"> selected="true" </c:if></c:if></c:forEach>>COMM</option>
                                            <option value=":TAXE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7306_of97e_e2_qualifier'}"><c:if test="${item.detail==':TAXE//'}"> selected="true" </c:if></c:if></c:forEach>>TAXE</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">International Bank Account Number</span>
                                        <input class="mandatory" data-swift="34x" disabled="disabled" id="_7307_of97e_e2_account_number" name="_7307_of97e_e2_account_number" maxlength="34" input_type="OF97E Account Number" location="Body" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7307_of97e_e2_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="container_seq_rep_div" id="container_of97a_e2">
                                <input class="cust-btn" data-count="0" data-id="of97a_e2" disabled="disabled" onclick="addSeqRepContainer(this)" type="button" value="Add Field OF97A"/>
                                <span class="label">Min: <span class="min_val" id="min_occ_of97a_e2">0</span>, Max: <span class="max_val" id="max_occ_of97a_e2">4</span>, Count: <span class="count_val" id="cur_occ_of97a_e2">0</span></span>
                            </div>
                        </div>                        

                        <!-- Field 74: OF70A Narrative -->
                        <div class="form-row"><span class="label_body">OF70A</span><span class="label">Narrative</span>
                            <div class="template_container template_seq_div_rep" id="template_of70a_e2" style="display:none;">
                                <div class="form-row">
                                    <span class="label_body">
                                        <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                                    </span>
                                    <span class="label" id="label_count_of70a_e2">Count</span>
                                </div>
                                <select class="selection_div" disabled="disabled" id="type_of70_e2" name="type_of70_e2" input_type="OF70A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="c">C - Narrative</option>
                                    <option value="e">E - Narrative</option>
                                </select>
                                <!-- Option C: Narrative -->
                                <div id="div_of70c_e2">
                                    <input type="hidden" disabled="disabled" id="_740_of70c_e2_qualifier" name="_740_of70c_e2_qualifier" input_type="OF70C Qualifier" location="Body" value=":PACO//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                        <textarea class="mandatory" cols="35" rows="4" data-swift="4*35x" disabled="disabled" id="_7401_of70c_e2_narrative" name="_7401_of70c_e2_narrative" input_type="OF70C Narrative" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7401_of70c_e2_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <!-- Option E: Narrative -->
                                <div id="div_of70e_e2">
                                    <input type="hidden" disabled="disabled" id="_7402_of70e_e2_qualifier" name="_7402_of70e_e2_qualifier" input_type="OF70E Qualifier" location="Body" value=":DECL//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                        <textarea class="mandatory" cols="35" rows="10" data-swift="10*35x" disabled="disabled" id="_7403_of70e_e2_narrative" name="_7403_of70e_e2_narrative" input_type="OF70E Narrative" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7403_of70e_e2_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="container_seq_rep_div" id="container_of70a_e2">
                                <input type="button" class="cust-btn" value="Add Field OF70A" onclick="addSeqRepContainer(this)" data-id="of70a_e2" data-count="0" disabled="disabled" />
                                <span class="label">Min: <span class="min_val" id="min_occ_of70a_e2">0</span>, Max: <span class="max_val" id="max_occ_of70a_e2">2</span>, Count: <span class="count_val" id="cur_occ_of70a_e2">0</span></span>
                            </div>
                        </div>
                                    
                        <!-- Field 75: MF16S End of Block -->
                        <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                            <input disabled="disabled" id="_750_mf16s_e2_end_of_block" name="_750_mf16s_e2_end_of_block" input_type="MF16S End of Block" location="Body" value="CSHPRTY" />
                        </div>
                    </div>
                    <div id="container_e2">
                        <input type="button" class="cust-btn" value="Add Field E2" onclick="addTemplateContainer(this)" data-id="e2" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_e2">0</span>, Max: <span class="max_val" id="max_occ_e2">-</span>, Count: <span class="count_val" id="cur_occ_e2">0</span></span>
                    </div>

                <h2 class="header-title">End of Subsequence E2 Cash Parties</h2>
                </div>
                <hr/>
                                    
                <!-- Optional Repetitive Subsequence E3 Amounts -->
                <div class="form-row">
                    <h2 class="header-title">Optional Repetitive Subsequence E3 Amounts</h2>
                    <hr/>

                    <span class="label_body">E3</span><span class="label">Amounts</span>
                    <div class="template_container" id="template_e3" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_e3">Count</span>
                        </div>

                        <!-- Field 76: MF16R Start of Block -->
                        <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                            <input disabled="disabled" id="_760_mf16r_e3_start_of_block" name="_760_mf16r_e3_start_of_block" input_type="MF16R Start of Block" location="Body" value="AMT" />
                        </div>                

                        <!-- Field 77: OF17B Flag -->
                        <div class="form-row"><span class="label_body">OF17B</span><span class="label">Flag</span>
                            <div class="template_container template_seq_div_rep" id="template_of17b_e3" style="display:none;">
                                <div class="form-row">
                                    <span class="label_body">
                                        <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                                    </span>
                                    <span class="label" id="label_count_of17b_e3">Count</span>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                    <select class="mandatory" disabled="disabled" id="_770_of17b_e3_qualifier" name="_770_of17b_e3_qualifier" input_type="OF17B Qualifier" location="Body">
                                        <option value="">choose a type</option>
                                        <option value=":ACRU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_770_of17b_e3_qualifier'}"><c:if test="${item.detail==':ACRU//'}"> selected="true" </c:if></c:if></c:forEach>>ACRU</option>
                                        <option value=":STAM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_770_of17b_e3_qualifier'}"><c:if test="${item.detail==':STAM//'}"> selected="true" </c:if></c:if></c:forEach>>STAM</option>
                                        <option value=":EXEC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_770_of17b_e3_qualifier'}"><c:if test="${item.detail==':EXEC//'}"> selected="true" </c:if></c:if></c:forEach>>EXEC</option>
                                        <option value=":RSCH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_770_of17b_e3_qualifier'}"><c:if test="${item.detail==':RSCH//'}"> selected="true" </c:if></c:if></c:forEach>>RSCH</option>
                                    </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Flag</span>
                                    <select class="mandatory" disabled="disabled" id="_7701_of17b_e3_flag" name="_7701_of17b_e3_flag" input_type="OF17B Flag" location="Body">
                                        <option value="">choose a type</option>
                                        <option value="N" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7701_of17b_e3_flag'}"><c:if test="${item.detail=='N'}"> selected="true" </c:if></c:if></c:forEach>>N</option>
                                        <option value="Y" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7701_of17b_e3_flag'}"><c:if test="${item.detail=='Y'}"> selected="true" </c:if></c:if></c:forEach>>Y</option>
                                    </select>
                                </div>
                            </div>
                            <div class="container_seq_rep_div" id="container_of17b_e3">
                                <input type="button" class="cust-btn" value="Add Field OF17B" onclick="addSeqRepContainer(this)" data-id="of17b_e3" data-count="0" disabled="disabled" />
                                <span class="label">Min: <span class="min_val" id="min_occ_of17b_e3">0</span>, Max: <span class="max_val" id="max_occ_of17b_e3">4</span>, Count: <span class="count_val" id="cur_occ_of17b_e3">0</span></span>
                            </div>
                        </div>
                        
                        <!-- Field 78: MF19A Amount -->
                        <div class="form-row"><span class="label_body">MF19A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                            <div class="template_container template_seq_div_rep" id="template_mf19a_e3" style="display:none;">
                                <div class="form-row">
                                    <span class="label_body">
                                        <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                                    </span>
                                    <span class="label" id="label_count_mf19a_e3">Count</span>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                    <select class="mandatory" disabled="disabled" id="_780_mf19a_e3_qualifier" name="_780_mf19a_e3_qualifier" input_type="MF19A Qualifier" location="Body">
                                        <option value="">choose a type</option>
                                        <option value=":ACRU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':ACRU//'}"> selected="true" </c:if></c:if></c:forEach>>ACRU</option>
                                        <option value=":ANTO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':ANTO//'}"> selected="true" </c:if></c:if></c:forEach>>ANTO</option>
                                        <option value=":CHAR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':CHAR//'}"> selected="true" </c:if></c:if></c:forEach>>CHAR</option>
                                        <option value=":COUN//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':COUN//'}"> selected="true" </c:if></c:if></c:forEach>>COUN</option>
                                        <option value=":DEAL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':DEAL//'}"> selected="true" </c:if></c:if></c:forEach>>DEAL</option>
                                        <option value=":EXEC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':EXEC//'}"> selected="true" </c:if></c:if></c:forEach>>EXEC</option>
                                        <option value=":ISDI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':ISDI//'}"> selected="true" </c:if></c:if></c:forEach>>ISDI</option>
                                        <option value=":LADT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':LADT//'}"> selected="true" </c:if></c:if></c:forEach>>LADT</option>
                                        <option value=":LEVY//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':LEVY//'}"> selected="true" </c:if></c:if></c:forEach>>LEVY</option>
                                        <option value=":LOCL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':LOCL//'}"> selected="true" </c:if></c:if></c:forEach>>LOCL</option>
                                        <option value=":LOCO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':LOCO//'}"> selected="true" </c:if></c:if></c:forEach>>LOCO</option>
                                        <option value=":MARG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':MARG//'}"> selected="true" </c:if></c:if></c:forEach>>MARG</option>
                                        <option value=":OTHR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':OTHR//'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                        <option value=":REGF//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':REGF//'}"> selected="true" </c:if></c:if></c:forEach>>REGF</option>
                                        <option value=":SETT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>SETT</option>
                                        <option value=":SHIP//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':SHIP//'}"> selected="true" </c:if></c:if></c:forEach>>SHIP</option>
                                        <option value=":SPCN//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':SPCN//'}"> selected="true" </c:if></c:if></c:forEach>>SPCN</option>
                                        <option value=":STAM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':STAM//'}"> selected="true" </c:if></c:if></c:forEach>>STAM</option>
                                        <option value=":STEX//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':STEX//'}"> selected="true" </c:if></c:if></c:forEach>>STEX</option>
                                        <option value=":TRAN//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':TRAN//'}"> selected="true" </c:if></c:if></c:forEach>>TRAN</option>
                                        <option value=":TRAX//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':TRAX//'}"> selected="true" </c:if></c:if></c:forEach>>TRAX</option>
                                        <option value=":VATA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':VATA//'}"> selected="true" </c:if></c:if></c:forEach>>VATA</option>
                                        <option value=":WITH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':WITH//'}"> selected="true" </c:if></c:if></c:forEach>>WITH</option>   
                                        <option value=":COAX//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':COAX//'}"> selected="true" </c:if></c:if></c:forEach>>COAX</option>
                                        <option value=":ACCA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':ACCA//'}"> selected="true" </c:if></c:if></c:forEach>>ACCA</option>
                                        <option value=":RSCH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':RSCH//'}"> selected="true" </c:if></c:if></c:forEach>>RSCH</option>
                                        <option value=":NTWK//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':NTWK//'}"> selected="true" </c:if></c:if></c:forEach>>NTWK</option>
                                        <option value=":RESU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':RESU//'}"> selected="true" </c:if></c:if></c:forEach>>RESU</option>
                                        <option value=":OCMT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_780_mf19a_e3_qualifier'}"><c:if test="${item.detail==':OCMT//'}"> selected="true" </c:if></c:if></c:forEach>>OCMT</option>
                                    </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sign</span>
                                    <input type="checkbox" class="template_selection" disabled="disabled" id="check_mf19a_sign_e3" name="check_mf19a_sign_e3" />
                                    <div id="div_opt_mf19a_sign_e3">
                                        <input type="text" data-swift="N" disabled="disabled" id="_7801_mf19a_e3_sign" name="_7801_mf19a_e3_sign" maxlength="1" input_type="MF19A Sign" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7801_mf19a_e3_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency Code</span>
                                    <input type="text" class="mandatory" data-swift="3!a" disabled="disabled" id="_7802_mf19a_e3_currency_code" name="_7802_mf19a_e3_currency_code" maxlength="3" input_type="MF19A Currency Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7802_mf19a_e3_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_7803_mf19a_e3_amount" name="_7803_mf19a_e3_amount" maxlength="15" input_type="MF19A Amount" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7803_mf19a_e3_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div class="container_seq_rep_div" id="container_mf19a_e3">
                                <input type="button" class="cust-btn" value="Add Field MF19A" onclick="addSeqRepContainer(this)" data-id="mf19a_e3" data-count="0" disabled="disabled" />
                                <span class="label">Min: <span class="min_val" id="min_occ_mf19a_e3">1</span>, Max: <span class="max_val" id="max_occ_mf19a_e3">3</span>, Count: <span class="count_val" id="cur_occ_mf19a_e3">0</span></span>
                            </div>
                        </div>
                                    
                        <!-- Field 79: OF98A Value Date/Time -->
                        <div class="form-row"><span class="label_body">OF98A</span><span class="label">Value Date/Time</span>
                            <div id="div_opt_of98a_e3">
                                <select class="selection_div" disabled="disabled" id="type_of98_e3" name="type_of98_e3" input_type="OF98A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Date</option>
                                    <option value="c">C - Date Time</option>
                                </select>
                                <!-- Option A: Date -->
                                <div id="div_of98a_e3">
                                    <input type="hidden" disabled="disabled" id="_790_of98a_e3_qualifier" name="_790_of98a_e3_qualifier" input_type="OF98A Qualifier" location="Body" value=":VALU//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_7901_of98a_e3_date" name="_7901_of98a_e3_date" maxlength="8" input_type="OF98A Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7901_of98a_e3_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option C: Date Time -->
                                <div id="div_of98c_e3">
                                    <input type="hidden" disabled="disabled" id="_7902_of98c_e3_qualifier" name="_7902_of98c_e3_qualifier" input_type="OF98C Qualifier" location="Body" value=":VALU//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" class="mandatory" data-swift="8!n" disabled="disabled" id="_7903_of98c_e3_date" name="_7903_of98c_e3_date" maxlength="8" input_type="OF98C Date" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7903_of98c_e3_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time</span>
                                        <input type="text" class="mandatory" data-swift="6!n" disabled="disabled" id="_7904_of98c_e3_time" name="_7904_of98c_e3_time" maxlength="6" input_type="OF98C Time" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_7904_of98c_e3_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Field 80: OF92B Exchange Rate -->
                        <div class="form-row"><span class="label_body">OF92B</span><span class="label">Exchange Rate</span>
                            <input type="checkbox" class="checkbox_div" disabled="disabled" id="check_of92b_e3" name="check_of92b_e3" />
                            <div id="div_opt_of92b_e3">
                                <input type="hidden" disabled="disabled" id="_800_of92b_e3_qualifier" name="_800_of92b_e3_qualifier" input_type="OF92B Qualifier" location="Body" value=":EXCH//" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">First Currency Code</span>
                                    <input type="text" class="mandatory" data-swift="3!a" disabled="disabled" id="_8001_of92b_e3_first_currency_code" name="_8001_of92b_e3_first_currency_code" maxlength="3" input_type="OF92B First Currency Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8001_of92b_e3_first_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <input type="hidden" disabled="disabled" id="_8002_of92b_e3_slash" name="_8002_of92b_e3_slash" input_type="OF92B Slash" location="Body" value="/" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Second Currency Code</span>
                                    <input type="text" class="mandatory" data-swift="3!a" disabled="disabled" id="_8003_of92b_e3_second_currency_code" name="_8003_of92b_e3_second_currency_code" maxlength="3" input_type="OF92B Second Currency Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8003_of92b_e3_second_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <input type="hidden" disabled="disabled" id="_8004_of92b_e3_slash2" name="_8004_of92b_e3_slash2" input_type="OF92B Slash" location="Body" value="/" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Rate</span>
                                    <input type="text" class="mandatory" data-swift="15d" disabled="disabled" id="_8005_of92b_e3_rate" name="_8005_of92b_e3_rate" maxlength="15" input_type="OF92B Rate" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8005_of92b_e3_rate'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>                                

                        <!-- Field 81: MF16S End of Block -->
                        <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                            <input disabled="disabled" id="_810_mf16s_e3_end_of_block" name="_810_mf16s_e3_end_of_block" input_type="MF16S End of Block" location="Body" value="AMT" />
                        </div>
                    </div>
                    <div id="container_e3">
                        <input type="button" class="cust-btn" value="Add Field E3" onclick="addTemplateContainer(this)" data-id="e3" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_e3">0</span>, Max: <span class="max_val" id="max_occ_e3">-</span>, Count: <span class="count_val" id="cur_occ_e3">0</span></span>
                    </div>

                    <h2 class="header-title">End of Subsequence E3 Amounts</h2>
                </div>
                <hr/>
                                
                <!-- Optional Subsequence E4 Digital Network Fee -->
                <div class="form-row">
                    <h2 class="header-title">Optional Subsequence E4 Digital Network Fee</h2>
                    <hr/>

                    <input type="checkbox" class="checkbox_sequence" id="check_e4" name="check_e4" />
                    <div id="div_opt_e4">
              
                        <!-- Field 82: MF16R Start of Block -->
                        <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                            <input disabled="disabled" id="_820_mf16r_e4_start_of_block" name="_820_mf16r_e4_start_of_block" input_type="MF16R Start of Block" location="Body" value="NTWKFEE" />
                        </div>
        
                        <!-- Field 83: MF35B Identification of the Financial Instrument -->
                        <div class="form-row"><span class="label_body">MF35B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identification of the Financial Instrument</span>
                            <input type="hidden" disabled="disabled" id="_830_mf35b_e4_isin_prefix" name="_830_mf35b_e4_isin_prefix" input_type="MF35B ISIN Prefix" location="Body" value="ISIN " />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identification of Security</span>
                                <input type="text" class="mandatory" data-swift="12!c" disabled="disabled" id="_8301_mf35b_e4_identification_of_security" name="_8301_mf35b_e4_identification_of_security" maxlength="12" input_type="MF35B Identification of Security" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8301_mf35b_e4_identification_of_security'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Description of Security</span>
                                <input type="checkbox" disabled="disabled" id="check_mf35b_description_of_security_e4" name="check_mf35b_description_of_security_e4" />
                                <div id="div_opt_mf35b_description_of_security_e4">
                                    <textarea cols="35" rows="4" data-swift="4*35x" disabled="disabled" id="_8302_mf35b_e4_description_of_security" name="_8302_mf35b_e4_description_of_security" input_type="MF35B Description of Security" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8302_mf35b_e4_description_of_security'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Field 84: MF36D Quantity of Digital Asset for the Network Fee -->
                        <div class="form-row"><span class="label_body">MF36D</span><span class="label"><a style="color:red;text-decoration:none">*</a>Quantity of Digital Asset for the Network Fee</span>
                            <input type="hidden" disabled="disabled" id="_840_mf36d_e4_qualifier" name="_840_mf36d_e4_qualifier" input_type="MF36D Qualifier" location="Body" value=":NTWK/" />
                            <input type="hidden" disabled="disabled" id="_8401_mf36d_e4_quantity_type_code" name="_8401_mf36d_e4_quantity_type_code" input_type="MF36D Quantity Type Code" location="Body" value="/DITU/" />
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Quantity of Digital Tokens</span>
                                <input type="text" class="mandatory" data-swift="30d" disabled="disabled" id="_8402_mf36d_e4_quantity_of_digital_tokens" name="_8402_mf36d_e4_quantity_of_digital_tokens" maxlength="30" input_type="MF36D Quantity of Digital Tokens" location="Body" onkeypress="return numbersonly(event);" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8402_mf36d_e4_quantity_of_digital_tokens'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                                
                        <!-- Field 85: MF16S End of Block -->
                        <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                            <input disabled="disabled" id="_850_mf16s_e4_end_of_block" name="_850_mf16s_e4_end_of_block" input_type="MF16S End of Block" location="Body" value="NTWKFEE" />
                        </div>
                    </div>

                    <h2 class="header-title">End of Subsequence E4 Digital Network Fee</h2>
                </div>
                <hr/>
                 
                <!-- Field 86: MF16S End of Block -->
                <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                    <input disabled="disabled" id="_860_mf16s_e_end_of_block" name="_860_mf16s_e_end_of_block" input_type="MF16S End of Block" location="Body" value="SETDET" />
                </div>
                <hr/>

                <h2 class="header-title">End of Sequence E Settlement Details</h2>             

                <h2 class="header-title">Optional Repetitive Sequence F Other Parties</h2>
                <hr/>

                <div class="form-row"><span class="label_body">F</span><span class="label">Optional Repetitive Sequence F Other Parties</span>
                    <div class="template_container" id="template_f" style="display:none;">
                        <div class="form-row">
                            <span class="label_body">
                                <input type="button" class="remove-btn" disabled="disabled" value="Remove" />
                            </span>
                            <span class="label" id="label_count_f">Count</span>
                        </div>                            

                        <!-- Field 87: MF16R Start of Block -->
                        <div class="form-row"><span class="label_body">MF16R</span><span class="label">Start of Block</span>
                            <input disabled="disabled" id="_870_mf16r_f_start_of_block" name="_870_mf16r_f_start_of_block" input_type="MF16R Start of Block" location="Body" value="OTHRPRTY" />
                        </div>
              
                        <!-- Field 88: MF95A Party -->
                        <div class="form-row"><span class="label_body">MF95A</span><span class="label"><a style="color:red;text-decoration:none">*</a>Party</span>
                            <div class="template_container template_seq_div_rep" id="template_mf95a_f" style="display:none;">
                                <div class="form-row">
                                    <span class="label_body">
                                        <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                                    </span>
                                    <span class="label" id="label_count_mf95a_f">Count</span>
                                </div>
                                <select class="selection_div mandatory" disabled="disabled" class="mandatory" id="type_mf95_f" name="type_mf95_f" input_type="MF95A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="c">C - Country Code</option>
                                    <option value="l">L - Legal Entity Identifier</option>
                                    <option value="p">P - Identifier Code</option>
                                    <option value="q">Q - Name and Address</option>
                                    <option value="r">R - Data Source Scheme - Proprietary Code</option>
                                    <option value="s">S - Data Source Scheme - Type of ID - Country Code - Alternate ID</option>
                                </select>
                                <!-- Option C: Country Code -->
                                <div id="div_mf95c_f">
                                    <input type="hidden" disabled="disabled" id="_880_mf95c_f_qualifier" name="_880_mf95c_f_qualifier" input_type="MF95C Qualifier" location="Body" value=":INVE//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Country Code</span>
                                        <input type="text" class="mandatory" data-swift="2!a" disabled="disabled" id="_8801_mf95c_f_country_code" name="_8801_mf95c_f_country_code" maxlength="2" input_type="MF95C Country Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8801_mf95c_f_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option L: Legal Entity Identifier -->
                                <div id="div_mf95l_f">
                                    <input type="hidden" disabled="disabled" id="_8802_mf95l_f_qualifier" name="_8802_mf95l_f_qualifier" input_type="MF95L Qualifier" location="Body" value=":ALTE//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Legal Entity Identifier</span>
                                        <input type="text" class="mandatory" data-swift="18!c2!n" disabled="disabled" id="_8803_mf95l_f_legal_entity_identifier" name="_8803_mf95l_f_legal_entity_identifier" maxlength="20" input_type="MF95L Legal Entity Identifier" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8803_mf95l_f_legal_entity_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option P: Identifier Code -->
                                <div id="div_mf95p_f">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_8804_mf95p_f_qualifier" name="_8804_mf95p_f_qualifier" input_type="MF95P Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":EXCH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8804_mf95p_f_qualifier'}"><c:if test="${item.detail==':EXCH//'}"> selected="true" </c:if></c:if></c:forEach>>EXCH</option>
                                            <option value=":MEOR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8804_mf95p_f_qualifier'}"><c:if test="${item.detail==':MEOR//'}"> selected="true" </c:if></c:if></c:forEach>>MEOR</option>
                                            <option value=":MERE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8804_mf95p_f_qualifier'}"><c:if test="${item.detail==':MERE//'}"> selected="true" </c:if></c:if></c:forEach>>MERE</option>
                                            <option value=":TRRE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8804_mf95p_f_qualifier'}"><c:if test="${item.detail==':TRRE//'}"> selected="true" </c:if></c:if></c:forEach>>TRRE</option>
                                            <option value=":INVE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8804_mf95p_f_qualifier'}"><c:if test="${item.detail==':INVE//'}"> selected="true" </c:if></c:if></c:forEach>>INVE</option>
                                            <option value=":VEND//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8804_mf95p_f_qualifier'}"><c:if test="${item.detail==':VEND//'}"> selected="true" </c:if></c:if></c:forEach>>VEND</option>
                                            <option value=":QFIN//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8804_mf95p_f_qualifier'}"><c:if test="${item.detail==':QFIN//'}"> selected="true" </c:if></c:if></c:forEach>>QFIN</option>
                                            <option value=":TRAG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8804_mf95p_f_qualifier'}"><c:if test="${item.detail==':TRAG//'}"> selected="true" </c:if></c:if></c:forEach>>TRAG</option>
                                            <option value=":BRKR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8804_mf95p_f_qualifier'}"><c:if test="${item.detail==':BRKR//'}"> selected="true" </c:if></c:if></c:forEach>>BRKR</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" class="mandatory" data-swift="4!a2!a2!c[3!c]" disabled="disabled" id="_8805_mf95p_f_identifier_code" name="_8805_mf95p_f_identifier_code" maxlength="11" input_type="MF95P Identifier Code" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8805_mf95p_f_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option Q: Name and Address -->
                                <div id="div_mf95q_f">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_8806_mf95q_f_qualifier" name="_8806_mf95q_f_qualifier" input_type="MF95Q Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":EXCH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8806_mf95q_f_qualifier'}"><c:if test="${item.detail==':EXCH//'}"> selected="true" </c:if></c:if></c:forEach>>EXCH</option>
                                            <option value=":MEOR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8806_mf95q_f_qualifier'}"><c:if test="${item.detail==':MEOR//'}"> selected="true" </c:if></c:if></c:forEach>>MEOR</option>
                                            <option value=":MERE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8806_mf95q_f_qualifier'}"><c:if test="${item.detail==':MERE//'}"> selected="true" </c:if></c:if></c:forEach>>MERE</option>
                                            <option value=":TRRE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8806_mf95q_f_qualifier'}"><c:if test="${item.detail==':TRRE//'}"> selected="true" </c:if></c:if></c:forEach>>TRRE</option>
                                            <option value=":INVE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8806_mf95q_f_qualifier'}"><c:if test="${item.detail==':INVE//'}"> selected="true" </c:if></c:if></c:forEach>>INVE</option>
                                            <option value=":VEND//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8806_mf95q_f_qualifier'}"><c:if test="${item.detail==':VEND//'}"> selected="true" </c:if></c:if></c:forEach>>VEND</option>
                                            <option value=":QFIN//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8806_mf95q_f_qualifier'}"><c:if test="${item.detail==':QFIN//'}"> selected="true" </c:if></c:if></c:forEach>>QFIN</option>
                                            <option value=":TRAG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8806_mf95q_f_qualifier'}"><c:if test="${item.detail==':TRAG//'}"> selected="true" </c:if></c:if></c:forEach>>TRAG</option>
                                            <option value=":BRKR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8806_mf95q_f_qualifier'}"><c:if test="${item.detail==':BRKR//'}"> selected="true" </c:if></c:if></c:forEach>>BRKR</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea class="mandatory" cols="35" rows="4" data-swift="4*35x" disabled="disabled" id="_8807_mf95q_f_name_and_address" name="_8807_mf95q_f_name_and_address" input_type="MF95Q Name and Address" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8807_mf95q_f_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <!-- Option R: Data Source Scheme - Proprietary Code -->
                                <div id="div_mf95r_f">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Qualifier</span>
                                        <select class="mandatory" disabled="disabled" id="_8808_mf95r_f_qualifier" name="_8808_mf95r_f_qualifier" input_type="MF95R Qualifier" location="Body">
                                            <option value="">choose a type</option>
                                            <option value=":EXCH/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8808_mf95r_f_qualifier'}"><c:if test="${item.detail==':EXCH/'}"> selected="true" </c:if></c:if></c:forEach>>EXCH</option>
                                            <option value=":MEOR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8808_mf95r_f_qualifier'}"><c:if test="${item.detail==':MEOR/'}"> selected="true" </c:if></c:if></c:forEach>>MEOR</option>
                                            <option value=":MERE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8808_mf95r_f_qualifier'}"><c:if test="${item.detail==':MERE/'}"> selected="true" </c:if></c:if></c:forEach>>MERE</option>
                                            <option value=":TRRE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8808_mf95r_f_qualifier'}"><c:if test="${item.detail==':TRRE/'}"> selected="true" </c:if></c:if></c:forEach>>TRRE</option>
                                            <option value=":INVE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8808_mf95r_f_qualifier'}"><c:if test="${item.detail==':INVE/'}"> selected="true" </c:if></c:if></c:forEach>>INVE</option>
                                            <option value=":VEND/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8808_mf95r_f_qualifier'}"><c:if test="${item.detail==':VEND/'}"> selected="true" </c:if></c:if></c:forEach>>VEND</option>
                                            <option value=":QFIN/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8808_mf95r_f_qualifier'}"><c:if test="${item.detail==':QFIN/'}"> selected="true" </c:if></c:if></c:forEach>>QFIN</option>
                                            <option value=":TRAG/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8808_mf95r_f_qualifier'}"><c:if test="${item.detail==':TRAG/'}"> selected="true" </c:if></c:if></c:forEach>>TRAG</option>
                                            <option value=":BRKR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8808_mf95r_f_qualifier'}"><c:if test="${item.detail==':BRKR/'}"> selected="true" </c:if></c:if></c:forEach>>BRKR</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                        <input type="text" class="mandatory" data-swift="8c" disabled="disabled" id="_8809_mf95r_f_data_source_scheme" name="_8809_mf95r_f_data_source_scheme" maxlength="8" input_type="MF95R Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8809_mf95r_f_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_88010_mf95r_f_slash" name="_88010_mf95r_f_slash" input_type="MF95R Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Proprietary Code</span>
                                        <input type="text" class="mandatory" data-swift="34x" disabled="disabled" id="_88011_mf95r_f_proprietary_code" name="_88011_mf95r_f_proprietary_code" maxlength="34" input_type="MF95R Proprietary Code" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_88011_mf95r_f_proprietary_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option S: Data Source Scheme - Type of ID - Country Code - Alternate ID -->
                                <div id="div_mf95s_f">
                                    <input type="hidden" disabled="disabled" id="_88012_mf95s_f_qualifier" name="_88012_mf95s_f_qualifier" input_type="MF95S Qualifier" location="Body" value=":ALTE/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                        <input type="checkbox" class="template_selection" disabled="disabled" id="check_mf95s_data_source_scheme_f" name="check_mf95s_data_source_scheme_f" />
                                        <div id="div_opt_mf95s_data_source_scheme_f">
                                            <input type="text" data-swift="8c" disabled="disabled" id="_88013_mf95s_f_data_source_scheme" name="_88013_mf95s_f_data_source_scheme" maxlength="8" input_type="MF95S Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_88013_mf95s_f_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_88014_mf95s_f_slash1" name="_88014_mf95s_f_slash1" input_type="MF95S Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Type of ID</span>
                                        <input type="text" class="mandatory" data-swift="4!c" disabled="disabled" id="_88015_mf95s_f_type_of_id" name="_88015_mf95s_f_type_of_id" maxlength="4" input_type="MF95S Type of ID" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_88015_mf95s_f_type_of_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_88016_mf95s_f_slash2" name="_88016_mf95s_f_slash2" input_type="MF95S Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Country Code</span>
                                        <input type="text" class="mandatory" data-swift="2!a" disabled="disabled" id="_88017_mf95s_f_country_code" name="_88017_mf95s_f_country_code" maxlength="2" input_type="MF95S Country Code" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_88017_mf95s_f_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_88018_mf95s_f_slash3" name="_88018_mf95s_f_slash3" input_type="MF95S Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Alternate ID</span>
                                        <input type="text" class="mandatory" data-swift="30x" disabled="disabled" id="_88019_mf95s_f_alternate_id" name="_88019_mf95s_f_alternate_id" maxlength="30" input_type="MF95S Alternate ID" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_88019_mf95s_f_alternate_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <div class="container_seq_rep_div" id="container_mf95a_f">
                                <input type="button" class="cust-btn" value="Add Field MF95A" onclick="addSeqRepContainer(this)" data-id="mf95a_f" data-count="0" disabled="disabled" />
                                <span class="label">Min: <span class="min_val" id="min_occ_mf95a_f">1</span>, Max: <span class="max_val" id="max_occ_mf95a_f">-</span>, Count: <span class="count_val" id="cur_occ_mf95a_f">0</span></span>
                            </div>
                        </div>

                        <!-- Field 89: OF97A Account -->
                        <div class="form-row"><span class="label_body">OF97A</span><span class="label">Account</span>
                            <div id="div_opt_of97a_f">
                                <select class="selection_div" disabled="disabled" id="type_of97_f" name="type_of97_f" input_type="OF97A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Account Number</option>
                                    <option value="d">D - Data Source Scheme - Identification of Blockchain or Wallet</option>
                                </select>
                                <!-- Option A: Account Number -->
                                <div id="div_of97a_f">
                                    <input type="hidden" disabled="disabled" id="_890_of97a_f_qualifier" name="_890_of97a_f_qualifier" input_type="OF97A Qualifier" location="Body" value=":SAFE//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account Number</span>
                                        <input type="text" class="mandatory" data-swift="35x" disabled="disabled" id="_8901_of97a_f_account_number" name="_8901_of97a_f_account_number" maxlength="35" input_type="OF97A Account Number" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8901_of97a_f_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <!-- Option D: Data Source Scheme - Identification of Blockchain or Wallet -->
                                <div id="div_of97d_f">
                                    <input type="hidden" disabled="disabled" id="_8902_of97d_f_qualifier" name="_8902_of97d_f_qualifier" input_type="OF97D Qualifier" location="Body" value=":BCAW/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Data Source Scheme</span>
                                        <div id="div_opt_of97d_data_source_scheme_f">
                                            <input type="text" data-swift="8c" disabled="disabled" id="_8903_of97d_f_data_source_scheme" name="_8903_of97d_f_data_source_scheme" maxlength="8" input_type="OF97D Data Source Scheme" location="Body" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8903_of97d_f_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                    <input type="hidden" disabled="disabled" id="_8904_of97d_f_slash" name="_8904_of97d_f_slash" input_type="OF97D Slash" location="Body" value="/" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identification of Blockchain or Wallet</span>
                                        <input type="text" class="mandatory" data-swift="140x" disabled="disabled" id="_8905_of97d_f_blockchain_wallet" name="_8905_of97d_f_blockchain_wallet" maxlength="140" input_type="OF97D Identification of Blockchain or Wallet" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_8905_of97d_f_blockchain_wallet'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                        </div>
                                    
                        <!-- Field 90: OF70A Narrative -->
                        <div class="form-row"><span class="label_body">OF70A</span><span class="label">Narrative</span>
                            <div class="template_container template_seq_div_rep" id="template_of70a_f" style="display:none;">
                                <div class="form-row">
                                    <span class="label_body">
                                        <input type="button" class="cust-btn remove-btn" disabled="disabled" value="Remove" />
                                    </span>
                                    <span class="label" id="label_count_of70a_f">Count</span>
                                </div>
                                <select class="selection_div" disabled="disabled" id="type_of70_f" name="type_of70_f" input_type="OF70A Type" location="Body">
                                    <option value="">choose a type</option>
                                    <option value="c">C - Narrative</option>
                                    <option value="d">D - Narrative</option>
                                    <option value="e">E - Narrative</option>
                                </select>
                                <!-- Option C: Narrative -->
                                <div id="div_of70c_f">
                                    <input type="hidden" disabled="disabled" id="_900_of70c_f_qualifier" name="_900_of70c_f_qualifier" input_type="OF70C Qualifier" location="Body" value=":PACO//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                        <textarea class="mandatory" cols="35" rows="4" data-swift="4*35x" disabled="disabled" id="_9001_of70c_f_narrative" name="_9001_of70c_f_narrative" input_type="OF70C Narrative" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_9001_of70c_f_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <!-- Option D: Narrative -->
                                <div id="div_of70d_f">
                                    <input type="hidden" disabled="disabled" id="_9002_of70d_f_qualifier" name="_9002_of70d_f_qualifier" input_type="OF70D Qualifier" location="Body" value=":REGI//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                        <textarea class="mandatory" cols="35" rows="6" data-swift="6*35x" disabled="disabled" id="_9003_of70d_f_narrative" name="_9003_of70d_f_narrative" input_type="OF70D Narrative" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_9003_of70d_f_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <!-- Option E: Narrative -->
                                <div id="div_of70e_f">
                                    <input type="hidden" disabled="disabled" id="_9004_of70e_f_qualifier" name="_9004_of70e_f_qualifier" input_type="OF70E Qualifier" location="Body" value=":DECL//" />
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                        <textarea class="mandatory" cols="35" rows="10" data-swift="10*35x" disabled="disabled" id="_9005_of70e_f_narrative" name="_9005_of70e_f_narrative" input_type="OF70E Narrative" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_9005_of70e_f_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="container_seq_rep_div" id="container_of70a_f">
                                <input type="button" class="cust-btn" value="Add Field OF70A" onclick="addSeqRepContainer(this)" data-id="of70a_f" data-count="0" disabled="disabled" />
                                <span class="label">Min: <span class="min_val" id="min_occ_of70a_f">0</span>, Max: <span class="max_val" id="max_occ_of70a_f">3</span>, Count: <span class="count_val" id="cur_occ_of70a_f">0</span></span>
                            </div>
                        </div>
                                    
                        <!-- Field 91: OF20C Processing Reference -->
                        <div class="form-row"><span class="label_body">OF20C</span><span class="label">Processing Reference</span>
                            <input type="checkbox" class="checkbox_div" disabled="disabled" id="check_of20c_f" name="check_of20c_f" />
                            <div id="div_opt_of20c_f">
                                <input type="hidden" disabled="disabled" id="_910_of20c_f_qualifier" name="_910_of20c_f_qualifier" input_type="OF20C Qualifier" location="Body" value=":PROC//" />
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Reference</span>
                                    <input type="text" class="mandatory" data-swift="16x" disabled="disabled" id="_9101_of20c_f_reference" name="_9101_of20c_f_reference" maxlength="16" input_type="OF20C Reference" location="Body" onkeypress="avoidSplChars(event)" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_9101_of20c_f_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>
                                    
                        <!-- Field 92: MF16S End of Block -->
                        <div class="form-row"><span class="label_body">MF16S</span><span class="label">End of Block</span>
                            <input disabled="disabled" id="_920_mf16s_f_end_of_block" name="_920_mf16s_f_end_of_block" input_type="MF16S End of Block" location="Body" value="OTHRPRTY" />
                        </div>
                    </div>
                    <div id="container_f">
                        <input type="button" class="cust-btn" value="Add Field F" onclick="addTemplateContainer(this)" data-id="f" data-count="0" />
                        <span class="label">Min: <span class="min_val" id="min_occ_f">0</span>, Max: <span class="max_val" id="max_occ_f">-</span>, Count: <span class="count_val" id="cur_occ_f">0</span></span>
                    </div>
                </div>

                <h2 class="header-title">End of Sequence F Other Parties</h2>              

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