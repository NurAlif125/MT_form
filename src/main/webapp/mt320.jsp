<%-- 
    Document   : mt320
    Created on : Jun 11, 2019, 1:53:50 PM
    Author     : Ovasae
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file ="header.jsp" %> 
<script src="js/validate-mt/content/mt320_content.js"></script>
<script src="js/validate-mt/validate_rule_mt320.js"></script>
<script src="js/validate-mt/validateList_scr.js"></script>
<link rel="stylesheet" type="text/css" href="css/validate_case.css"/>
<script src="js/tabcontent.js" type="text/javascript"></script>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css"/>
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css"/>
<link href="css/tabcontent.css" rel="stylesheet" type="text/css"/>
<link href="css/MT.css" rel="stylesheet" type="text/css"/>
<link rel="icon" href="images/favicon.ico"/>
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<div id="isi">
    <script>
        $(document).ready(function () {
            var referrer = document.referrer;
            var page = referrer.split(page[1]);
        }
        );
    </script>
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:320'}">
            <div id="judul">MT 320 Fixed Loan/Deposit Confirmation</div>
            <form id="form1" name="form1" method="post" ondrop="return false;" onpaste="return false;" autocomplete="off" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input type="hidden" name="urlhist" id="urlhist"/>
                <input name="messageType" id="messageType" type="hidden" value="320"/>
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li id="tab-view1"><a href="#" rel="view1">Header</a></li>
                        <li id="tab-view2"><a href="#" rel="view2">Body</a></li>
                        <li id="tab-view3"><a href="#" rel="view3">Comment</a></li>
                        <li id="tab-view4"><a href="#" rel="view4">Histories</a></li>
                        <li id="tab-view5"><a href="#" rel="view5">Log MT Text</a></li>
                        <li id="tab-view6"><a href="#" rel="view6">MT Relation</a></li>
                        <li  id="tab-view7"><a href="#" rel="view7" id="tabView7">Translation</a></li>
                        <li hidden id="tab-validate"><a href="#" rel="view8" id="tabView8">Validate</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file= "header_mt_input.jsp"  %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <!--Man A-->
                            <h2 class="header-title">Mandatory Sequence A</h2>
                            <!--MF15A-->
                            <div class="form-row"><span class="label_body">MF15A</span><span class="label">New Sequence</span>
                                <input name="_009_mf15a_" type="hidden" value="" />
                            </div>
                            <hr/>
                            <!--MF20-->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sender's Reference</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" input_type="MF20 Sender Reference" location="Body" class ="mandatory" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>
                                    <!--OF21-->
                                    <div class="form-row"><span class="label_body">OF21</span><span class="label">Related Reference</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_020_of21_related_reference" id="_020_of21_related_reference" input_type="OF21 Related Reference" location="Body" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>
                                    <!--MF22A-->
                                    <div class="form-row"><span class="label_body">MF22A</span><span class="label">*Type of Operation</span>
                                        <select name="_030_mf22a_type_of_operation" id="_030_mf22a_type_of_operation" input_type="MF22A Type Of Operation" location="Body" class ="mandatory">
                                            <option value=""></option>
                                            <option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_type_of_operation'}"><c:if test="${item.detail=='AMND'}"> selected="true" </c:if></c:if></c:forEach>>AMND</option>
                                    <option value="CANC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_type_of_operation'}"><c:if test="${item.detail=='CANC'}"> selected="true" </c:if></c:if></c:forEach>>CANC</option>
                                    <option value="DUPL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_type_of_operation'}"><c:if test="${item.detail=='DUPL'}"> selected="true" </c:if></c:if></c:forEach>>DUPL</option>
                                    <option value="NEWT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_type_of_operation'}"><c:if test="${item.detail=='NEWT'}"> selected="true" </c:if></c:if></c:forEach>>NEWT</option>
                                            </select>
                                        </div>
                                        <hr/>
                                        <!--OF94A-->
                                        <div class="form-row"><span class="label_body">OF94A</span><span class="label">Scope of Operation</span>
                                            <!--<input type="checkbox" name="scope_of_operation_checkbox" id="scope_of_operation_checkbox" />-->
                                            <!--<div id="check_of94a">-->
                                            <select name="_040_of94a_scope_of_operation" id="_040_of94a_scope_of_operation" input_type="OF94A Scope Of Operation" location="Body">
                                                <option value=""></option>
                                                <option value="AGNT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of94a_scope_of_operation'}"><c:if test="${item.detail=='AGNT'}"> selected="true" </c:if></c:if></c:forEach>>AGNT</option>
                                    <option value="BILA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of94a_scope_of_operation'}"><c:if test="${item.detail=='BILA'}"> selected="true" </c:if></c:if></c:forEach>>BILA</option>
                                    <option value="BROK" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of94a_scope_of_operation'}"><c:if test="${item.detail=='BROK'}"> selected="true" </c:if></c:if></c:forEach>>BROK</option>
                                            </select>
                                            <!--</div>-->
                                        </div>
                                        <hr/>
                                        <!--MF22B-->
                                        <div class="form-row"><span class="label_body">MF22B</span><span class="label">*Type of Event</span>
                                            <select name="_050_mf22b_type_of_event" id="_050_mf22b_type_of_event" input_type="MF22B Type Of Event" location="Body" class ="mandatory">
                                                <option value=""></option>
                                                <option value="CONF" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf22b_type_of_event'}"><c:if test="${item.detail=='CONF'}"> selected="true" </c:if></c:if></c:forEach>>CONF</option>
                                    <option value="MATU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf22b_type_of_event'}"><c:if test="${item.detail=='MATU'}"> selected="true" </c:if></c:if></c:forEach>>MATU</option>
                                    <option value="ROLL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf22b_type_of_event'}"><c:if test="${item.detail=='ROLL'}"> selected="true" </c:if></c:if></c:forEach>>ROLL</option>
                                            </select>
                                        </div>
                                        <hr/>
                                        <!--MF22C-->
                                        <div class="form-row"><span class="label_body">MF22C</span><span class="label">*Common Reference</span>
                                            <input type="text" name="_060_mf22c_common_reference" id="_060_mf22c_common_reference" input_type="MF22C Common Reference" location="Body" class ="mandatory" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf22c_common_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>
                                    <!--OF21N-->
                                    <div class="form-row"><span class="label_body">OF21N</span><span class="label">Contract Number Party A</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_070_of21n_contract_number_party_a" id="_070_of21n_contract_number_party_a" input_type="OF21N Contract Number Party A" location="Body" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of21n_contract_number_party_a'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>
                                    <!--MF82-->
                                    <div class="form-row"><span class="label_body">MF82</span><span class="label">Party A</span>
                                        <select id="type_mf82_" name="type_mf82_" input_type="MF82 Party A" location="Body" class ="mandatory">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_mf82a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_070_mf82a_party_identifier" id="_070_mf82a_party_identifier" input_type="MF82A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf82a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_071_mf82a_identifier_code" id="_071_mf82a_identifier_code" input_type="MF82A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_mf82a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_072_mf82a_address" id="_072_mf82a_address" input_type="MF82A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_mf82a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_mf82d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_073_mf82d_party_identifier" id="_073_mf82d_party_identifier" input_type="MF82D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_mf82d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_074_mf82d_name_address" id="_074_mf82d_name_address" input_type="MF82D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_074_mf82d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_mf82j_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_075_mf82j_party_identification" id="_075_mf82j_party_identification" input_type="MF82J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_075_mf82j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--MF87-->
                                    <div class="form-row"><span class="label_body">MF87</span><span class="label">Party B</span>
                                        <select id="type_mf87_" name="type_mf87_" input_type="MF87 Party B" location="Body" class ="mandatory">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_mf87a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_080_mf87a_party_identifier" id="_080_mf87a_party_identifier" input_type="MF87A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf87a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_081_mf87a_identifier_code" id="_081_mf87a_identifier_code" input_type="MF87A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_mf87a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_082_mf87a_address" id="_082_mf87a_address" input_type="MF87A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_mf87a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_mf87d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_083_mf87d_party_identifier" id="_083_mf87d_party_identifier" input_type="MF87D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf87d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_084_mf87d_name_address" id="_084_mf87d_name_address" input_type="MF87D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_mf87d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_mf87j_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_085_mf87j_party_identification" id="_085_mf87j_party_identification" input_type="MF87J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_085_mf87j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--OF83-->
                                    <div class="form-row"><span class="label_body">OF83</span><span class="label">Fund or Instructing Party</span>
                                        <select name="type_of83_" id="type_of83_" input_type="OF83 Fund or Instructing Party" location="Body">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_of83a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_090_of83a_party_identifier" id="_090_of83a_party_identifier" input_type="OF83A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of83a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                <input type="text" name="_091_of83a_identifier_code" id="_091_of83a_identifier_code" input_type="OF83A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of83a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expension</span>
                                                <textarea name="_092_of83a_address" id="_092_of83a_address" input_type="OF83A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of83a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of83d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_093_of83d_party_identifier" id="_093_of83d_party_identifier" input_type="OF83D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of83d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_094_of83d_name_address" id="_094_of83d_name_address" input_type="OF83D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of83d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of83j_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_095_of83j_party_identification" id="_095_of83j_party_identification" input_type="OF83J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_095_of83j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--OF77D-->
                                    <div class="form-row"><span class="label_body">OF77D</span><span class="label">Terms and Conditions</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_100_of77_terms_and_conditions" id="_100_of77_terms_and_conditions"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of77_terms_and_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <!--<hr/>-->
                                    <!--Man A end-->
                                    <!--Man B-->
                                    <h2 class="header-title">Mandatory Sequence B</h2>
                                    <!--MF15B-->
                                    <div class="form-row"><span class="label_body">MF15B</span><span class="label">New Sequence</span>
                                        <input name="_109_mf15b_" type="hidden" value="" />
                                    </div>
                                    <hr/>
                                    <!--MF17R-->
                                    <div class="form-row"><span class="label_body">MF17R</span><span class="label">Party A's Role</span>
                                        <select name="_110_mf17r_party_as_role" id="_110_mf17r_party_as_role" input_type="MF17R Party As Role" location="Body" class ="mandatory">
                                            <option value=""></option>
                                            <option value="B" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_mf17r_party_as_role'}"><c:if test="${item.detail=='B'}"> selected="true" </c:if></c:if></c:forEach>>B</option>
                                    <option value="L" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_mf17r_party_as_role'}"><c:if test="${item.detail=='L'}"> selected="true" </c:if></c:if></c:forEach>>L</option>
                                            </select>
                                        </div>
                                        <hr/>
                                        <!--MF30T-->
                                        <div class="form-row"><span class="label_body">MF30T</span><span class="label">*Trade Date</span>
                                            <input type="text" name="_120_mf30t_trade_date" id="_120_mf30t_trade_date" input_type="MF30T Trade Date" location="Body" class ="mandatory" maxlength="8" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_mf30t_trade_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>
                                    <!--MF30V-->
                                    <div class="form-row"><span class="label_body">MF30V</span><span class="label">*Value Date</span>
                                        <input type="text" name="_130_mf30v_value_date" id="_130_mf30v_value_date" input_type="MF30V Value Date" location="Body" class ="mandatory" maxlength="8" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_mf30v_value_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>
                                    <!--MF30P-->
                                    <div class="form-row"><span class="label_body">MF30P</span><span class="label">*Maturity Date</span>
                                        <input type="text" name="_140_mf30p_maturity_date" id="_140_mf30p_maturity_date" input_type="MF30P Maturity Date" location="Body" class ="mandatory" maxlength="8" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_mf30p_maturity_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>
                                    <!--MF32B-->
                                    <div class="form-row"><span class="label_body">MF32B</span><span class="label">*Currency Code</span>
                                <input type="text" name="_150_mf32b_currency" id="_150_mf32b_currency" input_type="MF32B Currency" location="Body" class ="mandatory" maxlength="3" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return textonly(event);" />
                                <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName=='_150_mf32b_currency'}">
                                        <c:set var="_150_mf32b_currency" scope="request" value="${item.detail}" />
                                    </c:if>
                                </c:forEach>
                                <%--
                                <select name="_150_mf32b_currency" id="_150_mf32b_currency" input_type="MF32B Currency" location="Body" class="mandatory">
                                    <option value=""></option>
                                    <c:forEach var="item" items="${dataCurrList}">
                                        <option value="${item.code}" <c:if test="${_150_mf32b_currency==item.code}"> selected="true" </c:if>>${item.code}</option>
                                    </c:forEach>
                                </select>
                                --%>
                            </div>
                            <!--Amount-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                <input type="text" name="_151_mf32b_amount" id="_151_mf32b_amount" input_type="MF32B Amount" location="Body" class ="mandatory" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_151_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_150_mf32b_currency');" onblur="cek_koma(this)" ondrop="return false;" onpaste="return false;" />
                                        <font style="margin-left: 50px"></font>
                                        <!--
                                        <script language="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_151_mf32b_amount').value;
                                            var number2r = number2.replace(',', '.');
                                            var number2F = parseFloat(number2r, "");
                                            var nominal = formatUang(number2F, "");
                                            var nominalStyle = nominal.fontsize(3);
                                            var nominalStylec = nominalStyle.fontcolor("green");
                                            //                                    var nominalStylecw = nominalStylec.fontWeight("900");
                                            document.write(nominalStylec);
                                        </script>
                                        -->
                                    </div>
                                    <hr/>
                                    <!--OF32H-->
                                    <div class="form-row"><span class="label_body">OF32H</span><span class="label">Amount to be Settled</span>
                                        <input type="checkbox" name="amount_to_be_settled_checkbox" id="amount_to_be_settled_checkbox" />
                                        <div id="check_of32h">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sign</span>
                                                <input type="text" name="_160_of32h_sign" id="_160_of32h_sign" input_type="OF32H Sign" location="Body" maxlength="1" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of32h_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" name="_161_of32h_currency" id="_161_of32h_currency" input_type="OF32H Currency" location="Body" maxlength="3" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_of32h_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return textonly(event);" />
                                        <c:forEach var="item" items="${tags}">
                                            <c:if test="${item.tagName=='_161_of32h_currency'}">
                                                <c:set var="_161_of32h_currency" scope="request" value="${item.detail}" />
                                            </c:if>
                                        </c:forEach>
                                        <%--
                                        <select name="_161_of32h_currency" id="_161_of32h_currency" input_type="OF32H Currency" location="Body" class="mandatory">
                                            <option value=""></option>
                                            <c:forEach var="item" items="${dataCurrList}">
                                                <option value="${item.code}" <c:if test="${_161_of32h_currency==item.code}"> selected="true" </c:if>>${item.code}</option>
                                            </c:forEach>
                                        </select>
                                        --%>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_162_of32h_amount" id="_162_of32h_amount" input_type="OF32H Amount" location="Body" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_of32h_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_161_of32h_currency');" onblur="cek_koma(this)" ondrop="return false;" onpaste="return false;" />
                                                <font style="margin-left: 50px"></font>
                                                <!--
                                                <script langauge="javascript">
                                                    function formatUang(n, currency) {
                                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                    }
                                                    var number2 = document.getElementById('_162_of32h_amount').value;
                                                    var number2r = number2.replace(',', '.');
                                                    var number2F = parseFloat(number2r);
                                                    var nominal = formatUang(number2F, "");
                                                    var nominalStyle = nominal.fontsize(3);
                                                    var nominalStylec = nominalStyle.fontcolor("green");
                                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                                    document.write(nominalStylec);
                                                </script>
                                                -->
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--OF30X-->
                                    <div class="form-row"><span class="label_body">OF30X</span><span class="label"> Next Interest Due Date</span>
                                        <input type="text" name="_170_of30x_next_interest_due_date" id="_170_of30x_next_interest_due_date" input_type="OF30X Next Interest Due Date" location="Body" maxlength="8" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of30x_next_interest_due_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>
                                    <!--MF34E-->
                                    <div class="form-row"><span class="label_body">MF34E</span><span class="label">Sign</span>
                                        <input type="text" name="_180_mf34e_sign" id="_180_mf34e_sign" input_type="MF34E Sign" location="Body" maxlength="1" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_mf34e_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                <input type="text" name="_181_mf34e_currency" id="_181_mf34e_currency" input_type="MF34E Currency" location="Body" class ="mandatory" maxlength="3" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_mf34e_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return textonly(event);" />
                                <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName=='_181_mf34e_currency'}">
                                        <c:set var="_181_mf34e_currency" scope="request" value="${item.detail}" />
                                    </c:if>
                                </c:forEach>
                                <%--
                                <select name="_181_mf34e_currency" id="_181_mf34e_currency" input_type="MF34E Currency" location="Body" class="mandatory">
                                    <option value=""></option>
                                    <c:forEach var="item" items="${dataCurrList}">
                                        <option value="${item.code}" <c:if test="${_181_mf34e_currency==item.code}"> selected="true" </c:if>>${item.code}</option>
                                    </c:forEach>
                                </select>
                                --%>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                <input type="text" name="_182_mf34e_amount" id="_182_mf34e_amount" input_type="MF34E Amount" location="Body" class ="mandatory" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_182_mf34e_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_181_mf34e_currency');" onblur="cek_koma(this)" ondrop="return false;" onpaste="return false;"  />
                                    </div>
                                    <hr/>
                                    <!--MF37G-->
                                    <!--Sign-->
                                    <div class="form-row"><span class="label_body">MF37G</span><span class="label">Sign</span>
                                        <input type="text" name="_190_mf37g_sign" id="_190_mf37g_sign" input_type="MF37G Sign" location="Body" maxlength="1" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_mf37g_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <!--Rate-->
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Rate</span>
                                        <input type="text" name="_191_mf37g_rate" id="_191_mf37g_rate" input_type="MF37G Rate" location="Body" class ="mandatory" maxlength="12" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_191_mf37g_rate'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_191_mf37g_rate');" onblur="cek_koma(this)" ondrop="return false;" onpaste="return false;"/>
                                    </div>
                                    <hr/>
                                    <!--MF14D-->
                                    <div class="form-row"><span class="label_body">MF14D</span><span class="label">*Day Count Fraction</span>
                                        <select name="_200_mf14d_day_count_fraction" id="_200_mf14d_day_count_fraction" input_type="MF14D Day Count Fraction" location="Body" class ="mandatory">
                                            <option value=""></option>
                                            <option value="30E/360" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_mf14d_day_count_fraction'}"><c:if test="${item.detail=='30E/360'}"> selected="true" </c:if></c:if></c:forEach>>30E/360</option>
                                    <option value="360/360" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_mf14d_day_count_fraction'}"><c:if test="${item.detail=='360/360'}"> selected="true" </c:if></c:if></c:forEach>>360/360</option>
                                    <option value="ACT/360" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_mf14d_day_count_fraction'}"><c:if test="${item.detail=='ACT/360'}"> selected="true" </c:if></c:if></c:forEach>>ACT/360</option>
                                    <option value="ACT/365" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_mf14d_day_count_fraction'}"><c:if test="${item.detail=='ACT/365'}"> selected="true" </c:if></c:if></c:forEach>>ACT/365</option>
                                    <option value="AFI/365" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_mf14d_day_count_fraction'}"><c:if test="${item.detail=='AFI/365'}"> selected="true" </c:if></c:if></c:forEach>>AFI/365</option>
                                            </select>
                                        </div>
                                        <hr/>
                                        <!--OF30F-->
                                        <div class="form-row"><span class="label_body">OF30F</span><span class="label">Last Day of the First Interest Period</span>
                                            <input type="text" name="_210_of30f_last_day_of_the_first_interest_period" id="_210_of30f_last_day_of_the_first_interest_period" input_type="OF30F Last Day Of The First Interest Period" location="Body" maxlength="8" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of30f_last_day_of_the_first_interest_period'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>
                                    <!--OF38J-->
                                    <div class="form-row"><span class="label_body">OF38J</span><span class="label">Number of Days</span>
                                        <input type="checkbox" name="number_of_days_checkbox" id="number_of_days_checkbox" />
                                        <div id="check_of38j">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Indicator</span>
                                                <select name="_220_of38j_number_of_days" id="_220_of38j_number_of_days" input_type="OF38J Number Of Days" location="Body">
                                                    <option value=""></option>
                                                    <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of38j_number_of_days'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>D</option>
                                            <option value="M" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of38j_number_of_days'}"><c:if test="${item.detail=='M'}"> selected="true" </c:if></c:if></c:forEach>>M</option>
                                                    </select>
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number</span>
                                                    <input type="text" id="_221_of38j_number" name="_221_of38j_number" input_type="OF38J Number" location="Body" maxlength="3" size="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_221_of38j_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_210_of71f_currency');" />
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--OF39M-->
                                    <div class="form-row"><span class="label_body">OF39M</span><span class="label">Payment Clearing Centre</span>
                                        <input type="text" id="_230_of39m_payment_clearing_centre" name="_230_of39m_payment_clearing_centre" input_type="OF39M Payment Clearing Centre" location="Body" maxlength="2" size="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of39m_payment_clearing_centre'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <!--<hr/>-->
                                    <!--man B end-->
                                    <!--Man C-->
                                    <h2 class="header-title">Mandatory Sequence C</h2>
                                    <!--15C-->
                                    <div class="form-row"><span class="label_body">MF15C</span><span class="label">New Sequence</span>
                                        <input name="_239_mf15c_" type="hidden" value="" />
                                    </div>
                                    <hr/>
                                    <!--OF53-->
                                    <div class="form-row"><span class="label_body">OF53</span><span class="label">Delivery Agent</span>
                                        <select name="type_of53_" id="type_of53_" input_type="OF53 Delivery Agent" location="Body">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_of53a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_240_of53a_party_identifier" id="_240_of53a_party_identifier" input_type="OF53A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_241_of53a_identifier_code" id="_241_of53a_identifier_code" input_type="OF53A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_241_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_242_of53a_address" id="_242_of53a_address" input_type="OF53A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_242_of53a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of53d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_243_of53d_party_identifier" id="_243_of53d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_243_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_244_of53d_name_address" id="_244_of53d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_244_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of53j_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_245_of53j_party_identification" id="_245_of53j_party_identification" input_type="OF53J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_245_of53j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--OF86-->
                                    <div class="form-row"><span class="label_body">OF86</span><span class="label">Intermediary 2</span>
                                        <select name="type_of86_" id="type_of86_" input_type="OF86 Intermediary 2" location="Body">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_of86a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_250_of86a_party_identifier" id="_250_of86a_party_identifier" input_type="OF86A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of86a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_251_of86a_identifier_code" id="_251_of86a_identifier_code" input_type="OF86A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_251_of86a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_252_of86a_address" id="_252_of86a_address" input_type="OF86A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_252_of86a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of86d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_253_of86d_party_identifier" id="_253_of86d_party_identifier" input_type="OF86D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_253_of86d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_254_of86d_name_address" id="_254_of86d_name_address" input_type="OF86D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_254_of86d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of86j_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_255_of86j_party_identification" id="_255_of86j_party_identification" input_type="OF86J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_255_of86j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--OF56-->
                                    <div class="form-row"><span class="label_body">OF56</span><span class="label">Intermediary</span>
                                        <select name="type_of56_" id="type_of56_" input_type="OF56 Intermediary" location="Body">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_of56a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_260_of56a_party_identifier" id="_260_of56a_party_identifier" input_type="OF56A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_261_of56a_identifier_code" id="_261_of56a_identifier_code" input_type="OF56A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_261_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_262_of56a_address" id="_262_of56a_address" input_type="OF56A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_262_of56a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of56d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_263_of56d_party_identifier" id="_263_of56d_party_identifier" input_type="OF56D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_263_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_264_of56d_name_address" id="_264_of56d_name_address" input_type="OF56D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_264_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of56j_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_265_of56j_party_identification" id="_265_of56j_party_identification" input_type="OF56J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_265_of56j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--MF57-->
                                    <div class="form-row"><span class="label_body">MF57</span><span class="label">Receiving Agent </span>
                                        <select name="type_mf57_" id="type_mf57_" input_type="MF57 Receiving Agent" location="Body" class ="mandatory">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_mf57a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_270_mf57a_party_identifier" id="_270_mf57a_party_identifier" input_type="MF57A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_mf57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_271_mf57a_identifier_code" id="_271_mf57a_identifier_code" input_type="MF57A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_271_mf57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_272_mf57a_address" id="_272_mf57a_address" input_type="MF57A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_272_mf57a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_mf57d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_273_mf57d_party_identifier" id="_273_mf57d_party_identifier" input_type="MF57D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_273_mf57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_274_mf57d_name_address" id="_274_mf57d_name_address" input_type="MF57D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_274_mf57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_mf57j_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_275_mf57j_party_identification" id="_275_mf57j_party_identification" input_type="MF57J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_275_mf57j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--OF58-->
                                    <div class="form-row"><span class="label_body">OF58</span><span class="label">Beneficiary Institution</span>
                                        <select name="type_of58_" id="type_of58_" input_type="OF58 Beneficiary Institution" location="Body">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_of58a_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_280_of58a_party_identifier" id="_280_of58a_party_identifier" input_type="OF58A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_281_of58a_identifier_code" id="_281_of58a_identifier_code" input_type="OF58A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_281_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_282_of58a_address" id="_282_of58a_address" input_type="OF58A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_282_of58a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of58d_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_283_of58d_party_identifier" id="_283_of58d_party_identifier" input_type="OF58D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_283_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_284_of58d_name_address" id="_284_of58d_name_address" input_type="OF58D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_284_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of58j_">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_285_of58j_party_identification" id="_285_of58j_party_identification" input_type="OF58J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_285_of58j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <!--<hr/>-->
                                    <!--man C end-->
                                    <!--Man D-->
                                    <h2 class="header-title">Mandatory Sequence D</h2>
                                    <!--15D-->
                                    <div class="form-row"><span class="label_body">MF15D</span><span class="label">New Sequence</span>
                                        <input name="_289_mf15d_" type="hidden" value="" />
                                    </div>
                                    <hr/>
                                    <!--OF53-->
                                    <div class="form-row"><span class="label_body">OF53</span><span class="label">Delivery Agent</span>
                                        <select name="type_of53_d" id="type_of53_d" input_type="OF53 D Delivery Agent" location="Body">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_of53a_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_290_of53a_party_identifier" id="_290_of53a_party_identifier" input_type="OF53A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_291_of53a_identifier_code" id="_291_of53a_identifier_code" input_type="OF53A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_291_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_292_of53a_address" id="_292_of53a_address" input_type="OF53A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_292_of53a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of53d_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_293_of53d_party_identifier" id="_293_of53d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_293_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_294_of53d_name_address" id="_294_of53d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_294_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of53j_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_295_of53j_party_identification" id="_295_of53j_party_identification" input_type="OF53J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_295_of53j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--OF86-->
                                    <div class="form-row"><span class="label_body">OF86</span><span class="label">Intermediary 2</span>
                                        <select name="type_of86_d" id="type_of86_d" input_type="OF86 D Intermediary 2" location="Body">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_of86a_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_300_of86a_party_identifier" id="_300_of86a_party_identifier" input_type="OF86A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of86a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_301_of86a_identifier_code" id="_301_of86a_identifier_code" input_type="OF86A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_301_of86a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_302_of86a_address" id="_302_of86a_address" input_type="OF86A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_302_of86a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of86d_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_303_of86d_party_identifier" id="_303_of86d_party_identifier" input_type="OF86D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_303_of86d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_304_of86d_name_address" id="_304_of86d_name_address" input_type="OF86D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_304_of86d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of86j_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_305_of86j_party_identification" id="_305_of86j_party_identification" input_type="OF86J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_305_of86j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--OF56-->
                                    <div class="form-row"><span class="label_body">OF56</span><span class="label">Intermediary</span>
                                        <select name="type_of56_d" id="type_of56_d" input_type="OF56 D Intermediary 2" location="Body">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_of56a_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_310_of56a_party_identifier" id="_310_of56a_party_identifier" input_type="OF56A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_311_of56a_identifier_code" id="_311_of56a_identifier_code" input_type="OF56A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_311_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_312_of56a_address" id="_312_of56a_address" input_type="OF56A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_312_of56a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of56d_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_313_of56d_party_identifier" id="_313_of56d_party_identifier" input_type="OF56D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_313_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_314_of56d_name_address" id="_314_of56d_name_address" input_type="OF56D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_314_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of56j_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_315_of56j_party_identification" id="_315_of56j_party_identification" input_type="OF56J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_315_of56j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--MF57-->
                                    <div class="form-row"><span class="label_body">MF57</span><span class="label">Receiving Agent </span>
                                        <select name="type_mf57_d" id="type_mf57_d" input_type="MF57 D Receiving Agent" location="Body" class ="mandatory">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_mf57a_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_320_mf57a_party_identifier" id="_320_mf57a_party_identifier" input_type="MF57A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_mf57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_321_mf57a_identifier_code" id="_321_mf57a_identifier_code" input_type="MF57A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_321_mf57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_322_mf57a_address" id="_322_mf57a_address" input_type="MF57A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_322_mf57a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_mf57d_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_323_mf57d_party_identifier" id="_323_mf57d_party_identifier" input_type="MF57D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_323_mf57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_324_mf57d_name_address" id="_324_mf57d_name_address" input_type="MF57D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_324_mf57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_mf57j_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_325_mf57j_party_identification" id="_325_mf57j_party_identification" input_type="MF57J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_325_mf57j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <!--OF58-->
                                    <div class="form-row"><span class="label_body">OF58</span><span class="label">Beneficiary Institution</span>
                                        <select name="type_of58_d" id="type_of58_d" input_type="OF58 D Beneficiary Institution" location="Body">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="d">D - Name & Address</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_of58a_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_330_of58a_party_identifier" id="_330_of58a_party_identifier" input_type="OF58A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_331_of58a_identifier_code" id="_331_of58a_identifier_code" input_type="OF58A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_331_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_332_of58a_address" id="_332_of58a_address" input_type="OF58A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_332_of58a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of58d_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_333_of58d_party_identifier" id="_333_of58d_party_identifier" input_type="OF58D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_333_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_334_of58d_name_address" id="_334_of58d_name_address" input_type="OF58D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_334_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of58j_d">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_335_of58j_party_identification" id="_335_of58j_party_identification" input_type="OF58J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_335_of58j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <h2 class="header-title">
                                        <label class="optsel">
                                            <input type="checkbox" name="seq_F_checkbox" id="seq_F_checkbox" />
                                        </label>Optional Sequence F Settlement Instructions for Interests Payable by Party B
                                    </h2>
                                    <div id="check_seq_f">
                                        <!--15F-->
                                        <div class="form-row"><span class="label_body">MF15F</span><span class="label">New Sequence</span>
                                            <input name="_339_mf15f_" type="hidden" value="" />
                                        </div>
                                        <hr/>
                                        <!--MF57-->
                                        <div class="form-row"><span class="label_body">MF57</span><span class="label">Receiving Agent </span>
                                            <select name="type_mf57_f" id="type_mf57_f" input_type="MF57 F Receiving Agent" location="Body" class ="mandatory">
                                                <option value=""></option>
                                                <option value="a">A - BIC</option>
                                                <option value="d">D - Name & Address</option>
                                                <option value="j">J - Party Identification</option>
                                            </select>
                                            <div id="div_mf57a_f">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_370_mf57a_party_identifier" id="_370_mf57a_party_identifier" input_type="MF57A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_mf57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_371_mf57a_identifier_code" id="_371_mf57a_identifier_code" input_type="MF57A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_371_mf57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                    <textarea name="_372_mf57a_address" id="_372_mf57a_address" input_type="MF57A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_372_mf57a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                            <div id="div_mf57d_f">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_373_mf57d_party_identifier" id="_373_mf57d_party_identifier" input_type="MF57D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_373_mf57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_374_mf57d_name_address" id="_374_mf57d_name_address" input_type="MF57D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_374_mf57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                            <div id="div_mf57j_f">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                    <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_375_mf57j_party_identification" id="_375_mf57j_party_identification" input_type="MF57J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_375_mf57j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <h2 class="header-title">
                                        <label class="optsel">
                                            <input type="checkbox" name="seq_H_checkbox" id="seq_H_checkbox" />
                                        </label>Optional Sequence H Additional Information
                                    </h2>
                                    <div id="check_seq_h">
                                        <!--15H-->
                                        <div class="form-row"><span class="label_body">MF15H</span><span class="label">New Sequence</span>
                                            <input name="_389_mf15h_" type="hidden" value="" />
                                        </div>
                                        <hr/>
                                        <!--OF88-->
                                        <div class="form-row"><span class="label_body">OF88</span><span class="label">Broker Identification</span>
                                            <select name="type_of88_" id="type_of88_" input_type="OF88 Broker Identification" location="Body">
                                                <option value=""></option>
                                                <option value="a">A - BIC</option>
                                                <option value="d">D - Name & Address</option>
                                                <option value="j">J - Party Identification</option>
                                            </select>
                                            <div id="div_of88_a">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_390_of88a_party_identifier" id="_390_of88a_party_identifier" input_type="OF88A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_390_of88a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                            <input type="text" name="_391_of88a_identifier_code" id="_391_of88a_identifier_code" input_type="OF88A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_391_of88a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                    <textarea name="_392_of88a_address" id="_392_of88a_address" input_type="OF88A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_392_of88a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                            <div id="div_of88_d">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_393_of88d_party_identifier" id="_393_of88d_party_identifier" input_type="OF88D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_393_of88d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_394_of88d_name_and_address" id="_394_of88d_name_and_address" input_type="OF88D Name And Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_394_of88d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                            <div id="div_of88_j">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                    <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_395_of88j_party_identification" id="_395_of88j_party_identification" input_type="OF88J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_395_of88j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        <div id="view3" class="tabcontent">
                            <%@include file="comment_mt.jsp" %>
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
<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>