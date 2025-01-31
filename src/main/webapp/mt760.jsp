<%-- 
    Document   : mt760
    Created on : Jun 14, 2021, 2:02:40 PM
    Author     : Ovasae
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt760.jsp" %>
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
        <c:if test="${item == 'MT:760'}">
            <div id="judul">MT 760 Issue of a Demand Guarantee/Standby Guarantee/Standby Letter of Credit</div>
            <%--<form id="form1" name="form1" method="post" ondrop="return false;" onpaste="return false;" autocomplete="off" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">--%>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="760" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li><a href="#" rel="view1">Header</a></li>
                        <li><a href="#" rel="view2">Body</a></li>
                        <li><a href="#" rel="view3">Comment</a></li>
                        <li><a href="#" rel="view4">Histories</a></li>
                        <li><a href="#" rel="view5">Log MT Text</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt_input.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <!--MAN A-->
                            <h2 class="header-title">Mandatory Sequence A General Information</h2>
                            <!--MF15A New Sequence-->
                            <div class="form-row"><span class="label_body">MF15A</span><span class="label">New Sequence</span>
                                <input name="_009_mf15a_" type="hidden" value="" />
                            </div>
                            <!--<hr/>-->
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
                            <!--MF22A Purpose of Message-->
                            <div class="form-row"><span class="label_body">MF22A</span><span class="label">*Purpose of Message</span>
                                <select name="_020_mf22a_purpose_of_message" id="_020_mf22a_purpose_of_message" class="mandatory">
                                    <option value=""></option>
                                    <option value="ACNF" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ACNF'}"> selected="true" </c:if></c:if></c:forEach>>ACNF</option>
                                    <option value="ADVI" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ADVI'}"> selected="true" </c:if></c:if></c:forEach>>ADVI</option>
                                    <option value="ICCO" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ICCO'}"> selected="true" </c:if></c:if></c:forEach>>ICCO</option>
                                    <option value="ISCO" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ISCO'}"> selected="true" </c:if></c:if></c:forEach>>ISCO</option>
                                    <option value="ISSU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf22a_purpose_of_message'}"><c:if test="${item.detail=='ISSU'}"> selected="true" </c:if></c:if></c:forEach>>ISSU</option>
                                </select>
                            </div>
                            <hr/>
                            <!--OF72Z Sender to Receiver Information -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_030_of72Z_sender_receiver_information" id="_030_of72Z_sender_receiver_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of72Z_sender_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!--OF23X File Identification-->
                            <!--<div class="form-row"><span class="label_body">OF23X</span><span class="label">&nbsp;</span>-->
                            <div class="form-row"><span class="label_body">OF23X</span><span class="label">Codes</span>
                                <select name="_040_of23x_file_identification" id="_040_of23x_file_identification">
                                    <option value=""></option>
                                    <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of23x_file_identification'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>COUR</option>
                                    <option value="EMAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of23x_file_identification'}"><c:if test="${item.detail=='EMAL'}"> selected="true" </c:if></c:if></c:forEach>>EMAL</option>
                                    <option value="FACT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of23x_file_identification'}"><c:if test="${item.detail=='FACT'}"> selected="true" </c:if></c:if></c:forEach>>FACT</option>
                                    <option value="FAXT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of23x_file_identification'}"><c:if test="${item.detail=='FAXT'}"> selected="true" </c:if></c:if></c:forEach>>FAXT</option>
                                    <option value="HOST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of23x_file_identification'}"><c:if test="${item.detail=='HOST'}"> selected="true" </c:if></c:if></c:forEach>>HOST</option>
                                    <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of23x_file_identification'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>MAIL</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of23x_file_identification'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Usage Rules</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_041_of23x_file_identification" id="_041_of23x_file_identification" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of23x_file_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--</div>-->
                            <h2 class="header-credit">End of Sequence A General Information</h2>
                            <!--MAN B-->
                            <h2 class="header-title">Mandatory Sequence B Undertaking Details</h2>
                            <!--MF15B New Sequence-->
                            <div class="form-row"><span class="label_body">MF15B</span><span class="label">New Sequence</span>
                                <input name="_049_mf15b_" type="hidden" value="" />
                            </div>
                            <!--MF20 Undertaking Number-->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Undertaking Number</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_050_mf20_undertaking_number" id="_050_mf20_undertaking_number" class="mandatory" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf20_undertaking_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--MF30 Date of Issue-->
                            <div class="form-row"><span class="label_body">MF30</span><span class="label">*Date of Issue</span>
                                <input type="text" name="_060_mf30_date_of_issue" id="value_date" class ="mandatory" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf30_date_of_issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--MF22D Form of Undertaking-->
                            <div class="form-row"><span class="label_body">MF22D</span><span class="label">*Form of Undertaking</span>
                                <select name="_070_mf22d_form_of_undertaking" id="_070_mf22d_form_of_undertaking" class="mandatory">
                                    <option value=""></option>
                                    <option value="DGAR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='DGAR'}"> selected="true" </c:if></c:if></c:forEach>>DGAR</option>
                                    <option value="STBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='STBY'}"> selected="true" </c:if></c:if></c:forEach>>STBY</option>
                                </select>
                            </div>
                            <hr/>
                            <!--MF40C Applicable Rules-->
                            <!--Codes-->
                            <div class="form-row"><span class="label_body">MF40C</span><span class="label">*Type</span>
                                <select name="_080_mf40c_type" id="_080_mf40c_type" class="mandatory">
                                    <option value=""></option>
                                    <option value="ISPR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf40c_type'}"><c:if test="${item.detail=='ISPR'}"> selected="true" </c:if></c:if></c:forEach>>ISPR</option>
                                    <option value="NONE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf40c_type'}"><c:if test="${item.detail=='NONE'}"> selected="true" </c:if></c:if></c:forEach>>NONE</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf40c_type'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                    <option value="UCPR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf40c_type'}"><c:if test="${item.detail=='UCPR'}"> selected="true" </c:if></c:if></c:forEach>>UCPR</option>
                                    <option value="URDG" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf40c_type'}"><c:if test="${item.detail=='URDG'}"> selected="true" </c:if></c:if></c:forEach>>URDG</option>
                                </select>
                            </div>
                            <!--Narrative if choose OTHR-->
                            <!--If Type is OTHR, then Narrative may be present, otherwise Narrative is not allowed-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                <input type="text" name="_081_mf40c_narrative" id="_081_mf40c_narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_mf40c_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--MF23B Expiry Type-->
                            <div class="form-row"><span class="label_body">MF23B</span><span class="label">*Type</span>
                                <select name="_090_mf23b_type" id="_090_mf23b_type" class="mandatory">
                                    <option value=""></option>
                                    <option value="COND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf23b_type'}"><c:if test="${item.detail=='COND'}"> selected="true" </c:if></c:if></c:forEach>>COND</option>
                                    <option value="FIXD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf23b_type'}"><c:if test="${item.detail=='FIXD'}"> selected="true" </c:if></c:if></c:forEach>>FIXD</option>
                                    <option value="OPEN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf23b_type'}"><c:if test="${item.detail=='OPEN'}"> selected="true" </c:if></c:if></c:forEach>>OPEN</option>
                                </select>
                            </div>
                            <hr/>
                            <!--OF31E Date of Expiry-->
                            <div class="form-row"><span class="label_body">OF31E</span><span class="label">Date of Expiry</span>
                                <input type="text" name="_100_of31e_date_of_expiry" id="value_date_2" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of31e_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--OF35G Expiry Condition/Event-->
                            <div class="form-row"><span class="label_body">OF35G</span><span class="label">Expiry Condition/Event</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_110_of35g_expiry_condition_event" id="_110_of35g_expiry_condition_event" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of35g_expiry_condition_event'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!--OF50 Applicant-->
                            <div class="form-row"><span class="label_body">OF50</span><span class="label">Applicant</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_120_of50_applicant" id="_120_of50_applicant" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of50_applicant'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!--OF51 Obligor/Instructing Party-->
                            <div class="form-row"><span class="label_body">OF51</span><span class="label">Obligor/Instructing Party</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_130_of51_obligor_instructing_party" id="_130_of51_obligor_instructing_party" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of51_obligor_instructing_party'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
                                        <input type="text" name="_140_mf52a_party_identifier" id="_140_mf52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_mf52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_141_mf52a_identifier_code" id="_141_mf52a_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_mf52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_142_mf52a_address" id="_142_mf52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_142_mf52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_mf52d_issuer">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_143_mf52d_party_identifier" id="_143_mf52d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_143_mf52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_144_mf52d_name_address" id="_144_mf52d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_144_mf52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--MF59a Beneficiary-->
                            <div class="form-row"><span class="label_body">MF59a</span><span class="label">Beneficiary</span>
                                <select id="type_of59a_beneficiary" name="type_of59a_beneficiary" class="mandatory">
                                    <option value=""></option>
                                    <option value="no">Name and Address</option>
                                    <option value="a">A - BIC</option>
                                </select>
                                <div id="div_mf59no_beneficiary">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_150_mf59_beneficiary" id="_150_mf59_beneficiary" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_mf59_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="33" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_151_mf59_name_address" id="_151_mf59_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_151_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_mf59a_beneficiary">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_152_mf59a_party_identifier" id="_152_mf59a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_152_mf59a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_153_mf59a_identifier_code" id="_153_mf59a_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_153_mf59a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_154_mf59a_address" id="_154_mf59a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_154_mf59a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF56a Advising Bank-->
                            <div class="form-row"><span class="label_body">OF56a</span><span class="label">Advising Bank</span>
                                <select id="type_of56a_advising_bank" name="type_of56a_advising_bank">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_of56a_advising_bank">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_160_of56a_party_identifier" id="_160_of56a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_161_of56a_identifier_code" id="_161_of56a_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_162_of56a_address" id="_162_of56a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_of56a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of56d_advising_bank">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_163_of56d_party_identifier" id="_163_of56d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_163_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_164_of56d_name_address" id="_164_of56d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_164_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF23 Advising Bank Reference-->
                            <div class="form-row"><span class="label_body">OF23</span><span class="label">Advising Bank Reference</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_170_of23_advising_bank_reference" id="_170_of23_advising_bank_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of23_advising_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--OF57a 'Advise Through' Bank-->
                            <div class="form-row"><span class="label_body">OF57a</span><span class="label">Advise Through Bank</span>
                                <select id="type_of57a_advise_through_bank" name="type_of57a_advise_through_bank">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_of57a_advise_through_bank">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_180_of57a_party_identifier" id="_180_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_181_of57a_identifier_code" id="_181_of57a_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_182_of57a_address" id="_182_of57a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_182_of57a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of57d_advise_through_bank">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_183_of57d_party_identifier" id="_183_of57d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_183_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_184_of57d_name_address" id="_184_of57d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--MF32B Undertaking Amount-->
                            <!--currency-->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label">Currency</span>
                                <input type="text" name="_190_mf32b_currency" id="_190_mf32b_currency" maxlength="3" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--amount-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>                             
                                <input type="text" name="_191_mf32b_amount" id="_191_mf32b_amount" class="mandatory" onpaste="return false" ondrop="return false" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_191_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_190_mf32b_currency');" onblur="cek_koma(this)" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_191_mf32b_amount').value;
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
                            <!--OF39D Additional Amount Information-->
                            <div class="form-row"><span class="label_body">OF39D</span><span class="label">Additional Amount Information</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_200_of39d_additional_amount_information" id="_200_of39d_additional_amount_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of39d_additional_amount_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!--OF41a Available With...-->
                            <div class="form-row"><span class="label_body">OF41a</span><span class="label">Available With</span>
                                <select id="type_of41a_available_with" name="type_of41a_available_with">
                                    <option value=""></option>
                                    <option value="f">F - BIC</option>
                                    <option value="g">G - Name & Address</option>
                                </select>
                                <div id="div_of41f_avaliable_with">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_210_of41f_identifier_code" id="_210_of41f_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of41f_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_211_of41f_address" id="_211_of41f_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_211_of41f_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of41g_avaliable_with">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_212_of41g_name_address" id="_212_of41g_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_212_of41g_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF71D Charges-->
                            <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_220_of71D_charges" id="_220_of71D_charges" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of71D_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!--OF45C Document and Presentation Instructions-->
                            <div class="form-row"><span class="label_body">OF45C</span><span class="label">Document and Presentation Instructions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="100" maxlength="6500" style="resize:none;" name="_230_of45c_document_and_presentation_instructions" id="_230_of45c_document_and_presentation_instructions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of45c_document_and_presentation_instructions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!--MF77U Undertaking Terms and Conditions-->
                            <div class="form-row"><span class="label_body">MF77U</span><span class="label">Undertaking Terms and Conditions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="150" maxlength="9750" name="_240_of77u_undertaking_terms_and_conditions" id="_240_of77u_undertaking_terms_and_conditions" class="mandatory" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of77u_undertaking_terms_and_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!--OF49 Confirmation Instructions-->
                            <div class="form-row"><span class="label_body">OF49</span><span class="label">Confirmation Instructions</span>
                                <select name="_250_of49_type" id="_250_of49_type">
                                    <option value=""></option>
                                    <option value="CONFIRM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of49_type'}"><c:if test="${item.detail=='CONFIRM'}"> selected="true" </c:if></c:if></c:forEach>>CONFIRM</option>
                                    <option value="MAY ADD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of49_type'}"><c:if test="${item.detail=='MAY ADD'}"> selected="true" </c:if></c:if></c:forEach>>MAY ADD</option>
                                    <option value="WITHOUT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of49_type'}"><c:if test="${item.detail=='WITHOUT'}"> selected="true" </c:if></c:if></c:forEach>>WITHOUT</option>
                                </select>
                            </div>
                            <hr/>
                            <!--OF58a Requested Confirmation Party-->
                            <div class="form-row"><span class="label_body">OF58a</span><span class="label">Requested Confirmation Party</span>
                                <select id="type_of58a_requested_confirmation_party" name="type_of58a_requested_confirmation_party">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name & Address</option>
                                </select>
                                <div id="div_of58a_requested_confirmation_party">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_260_of58a_party_identifier" id="_260_of58a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_261_of58a_identifier_code" id="_261_of58a_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_261_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_262_of58a_address" id="_262_of58a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_262_of58a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of58d_requested_confirmation_party">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_263_of58d_party_identifier" id="_263_of58d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_263_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_264_of58d_name_address" id="_264_of58d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_264_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF44H Governing Law and/or Place of Jurisdiction-->
                            <!--country code-->
                            <div class="form-row"><span class="label_body">OF44H</span><span class="label">Country Code</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_270_of44h_country_code" id="_270_of44h_country_code" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of44h_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--narrative-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                <!--<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_271_of44h_narrative" id="_271_of44h_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_271_of44h_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>-->
                                <input type="text" onkeypress="avoidSplChars(event)" name="_271_of44h_narrative" id="_271_of44h_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_271_of44h_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--OF23F Automatic Extension Period--> 
                            <div class="form-row"><span class="label_body">OF23F</span><span class="label">Automatic Extension Period</span>
                                <select name="_280_of23f_type" id="_280_of23f_type">
                                    <option value=""></option>
                                    <option value="DAYS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of23f_type'}"><c:if test="${item.detail=='DAYS'}"> selected="true" </c:if></c:if></c:forEach>>DAYS</option>
                                    <option value="ONEY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of23f_type'}"><c:if test="${item.detail=='ONEY'}"> selected="true" </c:if></c:if></c:forEach>>ONEY</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of23f_type'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                </select>
                            </div>
                            <!--details-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                <!--<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_281_of23f_narrative" id="_281_of23f_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_281_of23f_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>-->
                                <input type="text" onkeypress="avoidSplChars(event)" name="_281_of23f_narrative" id="_281_of23f_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_281_of23f_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--OF78 Automatic Extension Non-Extension Notification-->
                            <div class="form-row"><span class="label_body">OF78</span><span class="label">Automatic Extension Non-Extension Notification</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_290_of78_automatic_extension_non_extension_notification" id="_290_of78_automatic_extension_non_extension_notification" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of78_automatic_extension_non_extension_notification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!--OF26E Automatic Extension Notification Period-->
                            <div class="form-row"><span class="label_body">OF26E</span><span class="label">Automatic Extension Notification Period</span>                                
                                <input type="text" onkeypress="avoidSplChars(event)" name="_300_of26e_automatic_extension_notification_period" id="_300_of26e_automatic_extension_notification_period" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of26e_automatic_extension_notification_period'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--OF31S Automatic Extension Final Expiry Date-->
                            <div class="form-row"><span class="label_body">OF31S</span><span class="label">Automatic Extension Final Expiry Date</span>
                                <input type="text" name="_310_of31s_automatic_extension_final_expiry_date" id="value_date_3" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of31s_automatic_extension_final_expiry_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--OF48B Demand Indicator-->
                            <div class="form-row"><span class="label_body">OF48B</span><span class="label">Demand Indicator</span>
                                <select name="_320_of48b_type" id="_320_of48b_type">
                                    <option value=""></option>
                                    <option value="NMLT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of48b_type'}"><c:if test="${item.detail=='NMLT'}"> selected="true" </c:if></c:if></c:forEach>>NMLT</option>
                                    <option value="NMPT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of48b_type'}"><c:if test="${item.detail=='NMPT'}"> selected="true" </c:if></c:if></c:forEach>>NMPT</option>
                                    <option value="NPRT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of48b_type'}"><c:if test="${item.detail=='NPRT'}"> selected="true" </c:if></c:if></c:forEach>>NPRT</option>
                                </select>
                            </div>
                            <hr/>
                            <!--OF48D Transfer Indicator-->
                            <div class="form-row"><span class="label_body">OF48D</span><span class="label">Transfer Indicator</span>
                                <select name="_330_of48d_type" id="_330_of48d_type">
                                    <option value=""></option>
                                    <option value="TRAN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of48d_type'}"><c:if test="${item.detail=='TRAN'}"> selected="true" </c:if></c:if></c:forEach>>TRAN</option>
                                </select>
                            </div>
                            <hr/>
                            <!--OF39E Transfer Conditions-->
                            <div class="form-row"><span class="label_body">OF39E</span><span class="label">Transfer Conditions</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_340_of39e_transfer_conditions" id="_340_of39e_transfer_conditions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of39e_transfer_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!--OF45L Underlying Transaction Details-->
                            <div class="form-row"><span class="label_body">OF45L</span><span class="label">Underlying Transaction Details</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="65" rows="50" maxlength="3250" style="resize:none;" name="_350_of45l_underlying_transaction_details" id="_350_of45l_underlying_transaction_details" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_of45l_underlying_transaction_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!--OF24E Delivery of Original Undertaking-->
                            <!--Code-->
                            <div class="form-row"><span class="label_body">OF24E</span><span class="label">Delivery of Original Undertaking</span>
                                <select name="_360_of24e_type" id="_360_of24e_type">
                                    <option value=""></option>
                                    <option value="COLL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of24e_type'}"><c:if test="${item.detail=='COLL'}"> selected="true" </c:if></c:if></c:forEach>>COLL</option>
                                    <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of24e_type'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>COUR</option>
                                    <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of24e_type'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>MAIL</option>
                                    <option value="MESS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of24e_type'}"><c:if test="${item.detail=='MESS'}"> selected="true" </c:if></c:if></c:forEach>>MESS</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of24e_type'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                    <option value="REGM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of24e_type'}"><c:if test="${item.detail=='REGM'}"> selected="true" </c:if></c:if></c:forEach>>REGM</option>
                                </select>
                            </div>
                            <!--Additional Information-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Additional Information</span>
                                <!--<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_361_of24e_narrative" id="_361_of24e_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_361_of24e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>-->
                                <input type="text" onkeypress="avoidSplChars(event)" name="_361_of24e_narrative" id="_361_of24e_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_361_of24e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--OF24G Delivery To/Collection By-->
                            <!--Code-->
                            <div class="form-row"><span class="label_body">OF24G</span><span class="label">Delivery To/Collection By</span>
                                <select name="_370_of24g_type" id="_370_of24g_type">
                                    <option value=""></option>
                                    <option value="BENE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_of24g_type'}"><c:if test="${item.detail=='BENE'}"> selected="true" </c:if></c:if></c:forEach>>BENE</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_of24g_type'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                </select>
                            </div>
                            <!--Name and Address-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_371_of24g_name_and_address" id="_371_of24g_name_and_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_371_of24g_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <h2 class="header-credit">End of Sequence B Undertaking Details</h2>
                            <!--OPT C-->
                            <!--<h2 class="header-title">Optional Sequence C Local Undertaking Details</h2>-->
                            <h2 class="header-title">
                                <label class="optsel">
                                    <input type="checkbox" name="seq_C_checkbox" id="seq_C_checkbox" />
                                </label>Optional Sequence C Local Undertaking Details
                            </h2>
                            <div id="check_seq_c">
                                <!--MF15C New Sequence-->
                                <div class="form-row"><span class="label_body">MF15C</span><span class="label">New Sequence</span>
                                    <input name="_379_mf15c_" type="hidden" value="" />
                                </div>
                                <!--OF31C Requested Date of Issue-->
                                <div class="form-row"><span class="label_body">OF31C</span><span class="label">Requested Date of Issue </span>
                                    <input type="text" name="_380_of31c_requested_date_of_issue" id="value_date_4" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of31c_requested_date_of_issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                <!--MF22D Form of Undertaking-->
                                <div class="form-row"><span class="label_body">MF22D</span><span class="label">Form of Undertaking</span>
                                    <select name="_390_mf22d_type" id="_390_mf22d_form_of_undertaking" class="mandatory">
                                        <option value=""></option>
                                        <option value="DEPU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='DEPU'}"> selected="true" </c:if></c:if></c:forEach>>DEPU</option>
                                        <option value="DGAR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='DGAR'}"> selected="true" </c:if></c:if></c:forEach>>DGAR</option>
                                        <option value="STBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_mf22d_form_of_undertaking'}"><c:if test="${item.detail=='STBY'}"> selected="true" </c:if></c:if></c:forEach>>STBY</option>
                                    </select>
                                </div>
                                <hr/>
                                <!--MF40C Applicable Rules-->
                                <!--Codes-->
                                <div class="form-row"><span class="label_body">MF40C</span><span class="label">*Type</span>
                                    <select name="_400_mf40c_type" id="_400_mf40c_type" class="mandatory">
                                        <option value=""></option>
                                        <option value="ISPR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_mf40c_type'}"><c:if test="${item.detail=='ISPR'}"> selected="true" </c:if></c:if></c:forEach>>ISPR</option>
                                        <option value="NONE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_mf40c_type'}"><c:if test="${item.detail=='NONE'}"> selected="true" </c:if></c:if></c:forEach>>NONE</option>
                                        <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_mf40c_type'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                        <option value="UCPR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_mf40c_type'}"><c:if test="${item.detail=='UCPR'}"> selected="true" </c:if></c:if></c:forEach>>UCPR</option>
                                        <option value="URDG" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_mf40c_type'}"><c:if test="${item.detail=='URDG'}"> selected="true" </c:if></c:if></c:forEach>>URDG</option>
                                    </select>
                                </div>
                                <!--Narrative if choose OTHR-->
                                <!--If Type is OTHR, then Narrative may be present, otherwise Narrative is not allowed-->
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                    <input type="text" name="_401_mf40c_narrative" id="_401_mf40c_narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_401_mf40c_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                <!--OF22K Type of Undertaking-->
                                <div class="form-row"><span class="label_body">OF22K</span><span class="label">Type of Undertaking</span>
                                    <select name="_410_of22k_type" id="_410_of22k_type">
                                        <option value=""></option>
                                        <option value="APAY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='APAY'}"> selected="true" </c:if></c:if></c:forEach>>APAY</option>
                                        <option value="BILL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='BILL'}"> selected="true" </c:if></c:if></c:forEach>>BILL</option>
                                        <option value="CUST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='CUST'}"> selected="true" </c:if></c:if></c:forEach>>CUST</option>
                                        <option value="DPAY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='DPAY'}"> selected="true" </c:if></c:if></c:forEach>>DPAY</option>
                                        <option value="INSU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='INSU'}"> selected="true" </c:if></c:if></c:forEach>>INSU</option>
                                        <option value="JUDI" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='JUDI'}"> selected="true" </c:if></c:if></c:forEach>>JUDI</option>
                                        <option value="LEAS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='LEAS'}"> selected="true" </c:if></c:if></c:forEach>>LEAS</option>
                                        <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                        <option value="PAYM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='PAYM'}"> selected="true" </c:if></c:if></c:forEach>>PAYM</option>
                                        <option value="PERF" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='PERF'}"> selected="true" </c:if></c:if></c:forEach>>PERF</option>
                                        <option value="RETN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='RETN'}"> selected="true" </c:if></c:if></c:forEach>>RETN</option>
                                        <option value="SHIP" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='SHIP'}"> selected="true" </c:if></c:if></c:forEach>>SHIP</option>
                                        <option value="TEND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='TEND'}"> selected="true" </c:if></c:if></c:forEach>>TEND</option>
                                        <option value="WARR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_of22k_type'}"><c:if test="${item.detail=='WARR'}"> selected="true" </c:if></c:if></c:forEach>>WARR</option>
                                    </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                    <input type="text" onkeypress="avoidSplChars(event)" name="_411_of22k_type_narrative" id="_411_of22k_type_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_411_of22k_type_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                <!--MF23B Expiry Type-->
                                <div class="form-row"><span class="label_body">MF23B</span><span class="label">Expiry Type</span>
                                    <select name="_420_mf23b_type" id="_420_mf23b_type" class="mandatory">
                                        <option value=""></option>
                                        <option value="COND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_mf23b_type'}"><c:if test="${item.detail=='COND'}"> selected="true" </c:if></c:if></c:forEach>>COND</option>
                                        <option value="FIXD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_mf23b_type'}"><c:if test="${item.detail=='FIXD'}"> selected="true" </c:if></c:if></c:forEach>>FIXD</option>
                                        <option value="OPEN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_420_mf23b_type'}"><c:if test="${item.detail=='OPEN'}"> selected="true" </c:if></c:if></c:forEach>>OPEN</option>
                                    </select>
                                </div>
                                <hr/>
                                <!--OF31E Date of Expiry-->
                                <div class="form-row"><span class="label_body">OF31E</span><span class="label">Date of Expiry</span>
                                    <input type="text" name="_430_of31e_date_of_expiry" id="value_date_10" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_of31e_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                <!--OF35G Expiry Condition/Event-->
                                <div class="form-row"><span class="label_body">OF35G</span><span class="label">Expiry Condition/Event</span>
                                    <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_430_of35G_expiry_condition_events" id="_430_of35G_expiry_condition_events" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_430_of35G_expiry_condition_events'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                <!--MF50 Applicant-->
                                <div class="form-row"><span class="label_body">MF50</span><span class="label"><a style="color:red;text-decoration:none">*</a>Applicant</span>
                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_440_of50_applicant" id="_440_of50_applicant"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_440_of50_applicant'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                <!--OF51 Obligor/Instructing Party-->
                                <div class="form-row"><span class="label_body">OF51</span><span class="label">Name and Address</span>
                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_450_of51_obligor_instructing_party" id="_450_of51_obligor_instructing_party"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_450_of51_obligor_instructing_party'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                <!--OF52a Issuer-->
                                <div class="form-row"><span class="label_body">OF52a </span><span class="label">Issuer</span>
                                    <select id="type_of52a_issuer" name="type_of52a_issuer"">
                                        <option value=""></option>
                                        <option value="a">A - BIC</option>
                                        <option value="d">D - Name & Address</option>
                                    </select>
                                    <div id="div_of52a_issuer">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_460_of52a_party_identifier" id="_460_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_460_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                            <input type="text" onkeypress="avoidSplChars(event)" name="_461_of52a_identifier_code" id="_461_of52a_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_461_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                            <textarea name="_462_of52a_address" id="_462_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_462_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                    <div id="div_of52d_issuer">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_463_of52d_party_identifier" id="_463_of52d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_463_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_464_of52d_name_address" id="_464_of52d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_464_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <!--MF59 Beneficiary-->
                                <!--Account-->
                                <div class="form-row"><span class="label_body">MF59</span><span class="label">Account</span>
                                    <input type="text" name="_470_mf59_beneficiary" id="_470_mf59_beneficiary" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_470_mf59_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                </div>
                                <!--Name and Address-->
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_471_mf59_name_address" id="_471_mf59_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_471_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>

                                <!--MF32B Undertaking Amount-->
                                <!--currency-->
                                <div class="form-row"><span class="label_body">MF32B</span><span class="label">Currency</span>
                                    <input type="text" name="_480_mf32b_currency_760" id="_480_mf32b_currency_760" maxlength="3" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_480_mf32b_currency_760'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <!--amount-->
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>                             
                                    <input type="text" name="_481_mf32b_amount_760" id="_481_mf32b_amount_760" class="mandatory" onpaste="return false" ondrop="return false" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_481_mf32b_amount_760'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_481_mf32b_amount_760');" onblur="cek_koma(this)" />
                                    <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                    <font style="margin-left: 50px"></font>
                                    <script langauge="javascript">
                                        function formatUang(n, currency) {
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_481_mf32b_amount_760').value;
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
                                <!--OF39D Additional Amount Information-->
                                <div class="form-row"><span class="label_body">OF39D</span><span class="label">Additional Amount Information</span>
                                    <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_490_of39d_additional_amount_information" id="_490_of39d_additional_amount_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_490_of39d_additional_amount_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <!--OF41a Available With...-->
                                <div class="form-row"><span class="label_body">OF41a</span><span class="label">Available With</span>
                                    <select id="type_of41a_available_with_2" name="type_of41a_available_with_2">
                                        <option value=""></option>
                                        <option value="f">F - BIC</option>
                                        <option value="g">G - Name & Address</option>
                                    </select>
                                    <div id="div_of41f_avaliable_with_2">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                            <input type="text" onkeypress="avoidSplChars(event)" name="_500_of41f_identifier_code" id="_500_of41f_identifier_code" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_500_of41f_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                            <textarea name="_501_of41f_address" id="_501_of41f_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_501_of41f_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                    <div id="div_of41g_avaliable_with_2">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" class="mandatory" style="resize:none;" name="_502_of41g_name_address" id="_502_of41g_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_502_of41g_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <!--OF71D Charges-->
                                <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_510_of71D_charges" id="_510_of71D_charges" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_510_of71D_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                <!--OF45C Document and Presentation Instructions-->
                                <div class="form-row"><span class="label_body">OF45C</span><span class="label">Document and Presentation Instructions</span>
                                    <textarea onkeypress="avoidSplChars(event)" cols="65" rows="100" maxlength="6500" style="resize:none;" name="_520_of45c_document_and_presentation_instructions" id="_520_of45c_document_and_presentation_instructions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_520_of45c_document_and_presentation_instructions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                <!--OF77L Requested Local Undertaking Terms and Conditions-->
                                <div class="form-row"><span class="label_body">OF77L</span><span class="label">Requested Local Undertaking Terms and Conditions</span>
                                    <textarea onkeypress="avoidSplChars(event)" cols="65" rows="150" maxlength="9750" name="_530_of77l_requested_local_undertaking_terms_and_conditions" id="_530_of77l_requested_local_undertaking_terms_and_conditions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_530_of77l_requested_local_undertaking_terms_and_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                <!--OF22Y Standard Wording Required-->
                                <div class="form-row"><span class="label_body">OF22Y</span><span class="label">Standard Wording Required</span>
                                    <select name="_540_of22y_standard_wording_required" id="_540_of22y_standard_wording_required">
                                        <option value=""></option>
                                        <option value="STND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_540_of22y_standard_wording_required'}"><c:if test="${item.detail=='STND'}"> selected="true" </c:if></c:if></c:forEach>>STND</option>
                                    </select>
                                </div>
                                <hr/>
                                <!--OF40D Standard Wording Requested Language-->
                                <div class="form-row"><span class="label_body">OF40D</span><span class="label">Standard Wording Requested Language</span>                                
                                    <input type="text" onkeypress="avoidSplChars(event)" name="_550_of40d_standard_wording_reqested_language" id="_550_of40d_standard_wording_reqested_language" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_550_of40d_standard_wording_reqested_language'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                <!--OF44H Governing Law and/or Place of Jurisdiction-->
                                <!--country code-->
                                <div class="form-row"><span class="label_body">OF44H</span><span class="label">Country Code</span>
                                    <input type="text" onkeypress="avoidSplChars(event)" name="_560_of44h_country_code" id="_560_of44h_country_code" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_560_of44h_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <!--narrative-->
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                    <!--<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_561_of44h_narrative" id="_561_of44h_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_561_of44h_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>-->
                                    <input type="text" onkeypress="avoidSplChars(event)" name="_561_of44h_narrative" id="_561_of44h_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_561_of44h_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <!--OF23F Automatic Extension Period-->
                                <div class="form-row"><span class="label_body">OF23F</span><span class="label">Automatic Extension Period</span>
                                    <select name="_570_of23f_automatic_extension_period" id="_570_of23f_automatic_extension_period">
                                        <option value=""></option>
                                        <option value="DAYS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_570_of23f_automatic_extension_period'}"><c:if test="${item.detail=='DAYS'}"> selected="true" </c:if></c:if></c:forEach>>DAYS</option>
                                        <option value="ONEY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_570_of23f_automatic_extension_period'}"><c:if test="${item.detail=='ONEY'}"> selected="true" </c:if></c:if></c:forEach>>ONEY</option>
                                        <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_570_of23f_automatic_extension_period'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                    </select>
                                </div>
                                <!--details-->
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Details</span>
                                    <!--<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_571_of23f_narrative" id="_571_of23f_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_571_of23f_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>-->
                                    <input type="text" onkeypress="avoidSplChars(event)" name="_571_of23f_narrative" id="_571_of23f_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_571_of23f_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                <!--OF78 Automatic Extension Non-Extension Notification-->
                                <div class="form-row"><span class="label_body">OF78</span><span class="label">Automatic Extension Non-Extension Notification</span>
                                    <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_580_of78_automatic_extension_non_extenstion_notification" id="_580_of78_automatic_extension_non_extenstion_notification" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_580_of78_automatic_extension_non_extenstion_notification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                <!--OF26E Automatic Extension Notification Period-->
                                <div class="form-row"><span class="label_body">OF26E</span><span class="label">Automatic Extension Notification Period</span>                                
                                    <input type="text" onkeypress="avoidSplChars(event)" name="_590_of26e_automatic_extension_notification_period" id="_590_of26e_automatic_extension_notification_period" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_590_of26e_automatic_extension_notification_period'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <!--OF31S Automatic Extension Final Expiry Date-->
                                <div class="form-row"><span class="label_body">OF31S</span><span class="label">Automatic Extension Final Expiry Date</span>
                                    <input type="text" name="_600_of31s_automatic_extension_final_expiry_date" id="value_date_5" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_600_of31s_automatic_extension_final_expiry_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <!--OF48B Demand Indicator-->
                                <div class="form-row"><span class="label_body">OF48B</span><span class="label">Demand Indicator</span>
                                    <select name="_610_of48b_type" id="_610_of48b_type">
                                        <option value=""></option>
                                        <option value="NMLT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_610_of48b_type'}"><c:if test="${item.detail=='NMLT'}"> selected="true" </c:if></c:if></c:forEach>>NMLT</option>
                                        <option value="NMPT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_610_of48b_type'}"><c:if test="${item.detail=='NMPT'}"> selected="true" </c:if></c:if></c:forEach>>NMPT</option>
                                        <option value="NPRT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_610_of48b_type'}"><c:if test="${item.detail=='NPRT'}"> selected="true" </c:if></c:if></c:forEach>>NPRT</option>
                                    </select>
                                </div>
                                <!--OF48D Transfer Indicator-->
                                <div class="form-row"><span class="label_body">OF48D</span><span class="label">Transfer Indicator</span>
                                    <select name="_620_of48d_type" id="_620_of48d_type">
                                        <option value=""></option>
                                        <option value="TRAN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_620_of48d_type'}"><c:if test="${item.detail=='TRAN'}"> selected="true" </c:if></c:if></c:forEach>>TRAN</option>
                                    </select>
                                </div>
                                <hr/>
                                <!--OF39E Transfer Conditions-->
                                <div class="form-row"><span class="label_body">OF39E</span><span class="label">Transfer Conditions</span>
                                    <textarea onkeypress="avoidSplChars(event)" cols="65" rows="12" maxlength="780" style="resize:none;" name="_630_of39e_transfer_conditions" id="_630_of39e_transfer_conditions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_630_of39e_transfer_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                <!--OF45L Underlying Transaction Details-->
                                <div class="form-row"><span class="label_body">OF45L</span><span class="label">Underlying Transaction Details</span>
                                    <textarea onkeypress="avoidSplChars(event)" cols="65" rows="50" maxlength="3250" style="resize:none;" name="_640_of45l_underlying_transaction_details" id="_640_of45l_underlying_transaction_details" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_640_of45l_underlying_transaction_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                <!--OF24E Delivery of Local Undertaking--> 
                                <!--Code-->
                                <div class="form-row"><span class="label_body">OF24E</span><span class="label">Delivery of Original Undertaking</span>
                                    <select name="_650_of24e_type" id="_650_of24e_type">
                                        <option value=""></option>
                                        <option value="COLL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_650_of24e_type'}"><c:if test="${item.detail=='COLL'}"> selected="true" </c:if></c:if></c:forEach>>COLL</option>
                                        <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_650_of24e_type'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>COUR</option>
                                        <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_650_of24e_type'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>MAIL</option>
                                        <option value="MESS" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_650_of24e_type'}"><c:if test="${item.detail=='MESS'}"> selected="true" </c:if></c:if></c:forEach>>MESS</option>
                                        <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_650_of24e_type'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                        <option value="REGM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_650_of24e_type'}"><c:if test="${item.detail=='REGM'}"> selected="true" </c:if></c:if></c:forEach>>REGM</option>
                                    </select>
                                </div>
                                <!--Additional Information-->
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Additional Information</span>
                                    <!--<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_651_of24e_narrative" id="_651_of24e_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_651_of24e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>-->
                                    <input type="text" onkeypress="avoidSplChars(event)" name="_651_of24e_narrative" id="_651_of24e_narrative" maxlength="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_651_of24e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                <!--OF24G Delivery To/Collection By-->
                                <!--Code-->
                                <div class="form-row"><span class="label_body">OF24G</span><span class="label">Delivery To/Collection By</span>
                                    <select name="_660_of24g_type" id="_660_of24g_type">
                                        <option value=""></option>
                                        <option value="BENE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_660_of24g_type'}"><c:if test="${item.detail=='BENE'}"> selected="true" </c:if></c:if></c:forEach>>BENE</option>
                                        <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_660_of24g_type'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                    </select>
                                </div>
                                <!--Name and Address-->
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_661_of24g_name_and_address" id="_661_of24g_name_and_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_661_of24g_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>

                            <h2 class="header-credit">End of Sequence C Local Undertaking Details</h2>
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