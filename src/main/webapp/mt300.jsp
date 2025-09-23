<%-- 
    Document   : mt300
    Created on : Jun 14, 2019, 10:23:59 AM
    Author     : Ovasae
--%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file ="header.jsp" %>
<script src="js/validate-mt/content/mt300_content.js"></script>
<script src="js/validate-mt/validate_rule_mt300.js"></script>
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
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:300'}">
            <div id="judul">MT 300 Foreign Exchange Confirmation</div>
            <form id="form1" name="form1" method="post" ondrop="return false;" onpaste="return false;" autocomplete="off" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="300" />
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
                            <%@include file="header_mt_input.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <!--MAN A-->
                            <h2 class="header-title">Mandatory Sequence A General Information</h2>
                            <!--MF15A-->
                            <div class="form-row"><span class="label_body">MF15A</span><span class="label">New Sequence A</span>
                                <input name="_009_mf15a_" type="hidden" value="" />
                            </div>
                            <hr/>
                            <!--MF20-->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">Sender's Reference</span>
                                <input type="text" onkeypress="avoidSplChars(event)" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" input_type="MF20 Sender Reference" location="Body" class ="mandatory" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--OF21-->
                            <div class="form-row"><span class="label_body">OF21</span><span class="label">Related Reference</span>
                                <input type="checkbox" name="related_reference_checkbox" id="related_reference_checkbox" />
                                <div id="check_of21">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                        <input type="text" onkeypress="avoidSplChars(event)" name="_020_of21_related_reference" id="_020_of21_related_reference" input_type="OF21 Related Reference" location="Body" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--MF22A-->
                            <div class="form-row"><span class="label_body">MF22A</span><span class="label">Type of Operation</span>
                                <select name="_030_mf22a_type_of_operation" id="_030_mf22a_type_of_operation" input_type="MF22A Type Of Operation" location="Body" class ="mandatory">
                                    <!--<option value=""></option>-->
                                    <option value=""></option>
                                    <option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_type_of_operation'}"><c:if test="${item.detail=='AMND'}"> selected="true" </c:if></c:if></c:forEach>>AMND</option>
                                    <option value="CANC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_type_of_operation'}"><c:if test="${item.detail=='CANC'}"> selected="true" </c:if></c:if></c:forEach>>CANC</option>
                                    <option value="DUPL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_type_of_operation'}"><c:if test="${item.detail=='DUPL'}"> selected="true" </c:if></c:if></c:forEach>>DUPL</option>
                                    <option value="EXOP" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_type_of_operation'}"><c:if test="${item.detail=='EXOP'}"> selected="true" </c:if></c:if></c:forEach>>EXOP</option>
                                    <option value="NEWT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_type_of_operation'}"><c:if test="${item.detail=='NEWT'}"> selected="true" </c:if></c:if></c:forEach>>NEWT</option>
                                    <option value="OTHER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf22a_type_of_operation'}"><c:if test="${item.detail=='OTHER'}"> selected="true" </c:if></c:if></c:forEach>>OTHER</option>
                                </select>
                            </div>
                            <hr/>
                            <!--OF94A-->
                            <div class="form-row"><span class="label_body">OF94A</span><span class="label">Scope of Operation</span>
                                <input type="checkbox" name="scope_of_operation_checkbox" id="scope_of_operation_checkbox" />
                                <div id="check_of94a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                        <select name="_040_of94a_scope_of_operation" id="_040_of94a_scope_of_operation" input_type="OF94A Scope Of Operation" location="Body">
                                            <option value=""></option>
                                            <option value="AGNT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of94a_scope_of_operation'}"><c:if test="${item.detail=='AGNT'}"> selected="true" </c:if></c:if></c:forEach>>AGNT</option>
                                            <option value="BILA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of94a_scope_of_operation'}"><c:if test="${item.detail=='BILA'}"> selected="true" </c:if></c:if></c:forEach>>BILA</option>
                                            <option value="BROK" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of94a_scope_of_operation'}"><c:if test="${item.detail=='BROK'}"> selected="true" </c:if></c:if></c:forEach>>BROK</option>
                                            <option value="OTHER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of94a_scope_of_operation'}"><c:if test="${item.detail=='OTHER'}"> selected="true" </c:if></c:if></c:forEach>>OTHER</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--MF22C-->
                            <div class="form-row"><span class="label_body">MF22C</span><span class="label">Common Reference</span>
                                <input type="text" name="_045_mf22c_common_reference" id="_045_mf22c_common_reference" input_type="MF22C Common Reference" location="Body" class ="mandatory" maxlength="16" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_045_mf22c_common_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--OF17T-->
                            <div class="form-row"><span class="label_body">OF17T</span><span class="label">Block Trade Indicator</span>
                                <input type="checkbox" name="block_trade_indicator_checkbox" id="block_trade_indicator_checkbox" />
                                <div id="check_of17t">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                        <select name="_050_of17t_block_trade_indicator" id="_050_of17t_block_trade_indicator" input_type="OF17T Block Trade Indicator" location="Body">
                                            <option value=""></option>
                                            <option value="N" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of17t_block_trade_indicator'}"><c:if test="${item.detail=='N'}"> selected="true" </c:if></c:if></c:forEach>>N</option>
                                            <option value="Y" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of17t_block_trade_indicator'}"><c:if test="${item.detail=='Y'}"> selected="true" </c:if></c:if></c:forEach>>Y</option>
                                            <option value="OTHER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of17t_block_trade_indicator'}"><c:if test="${item.detail=='OTHER'}"> selected="true" </c:if></c:if></c:forEach>>OTHER</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF17U-->
                            <div class="form-row"><span class="label_body">OF17U</span><span class="label">Split Settlement Indicator</span>
                                <input type="checkbox" name="split_settlement_indicator_checkbox" id="split_settlement_indicator_checkbox" />
                                <div id="check_of17u">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                        <select name="_060_of17u_split_settlement_indicator" id="_060_of17u_split_settlement_indicator" input_type="OF17U Split Settlement Indicator" location="Body">
                                            <option value=""></option>
                                            <option value="N" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of17u_split_settlement_indicator'}"><c:if test="${item.detail=='N'}"> selected="true" </c:if></c:if></c:forEach>>N</option>
                                            <option value="Y" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of17u_split_settlement_indicator'}"><c:if test="${item.detail=='Y'}"> selected="true" </c:if></c:if></c:forEach>>Y</option>
                                            <option value="OTHER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of17u_split_settlement_indicator'}"><c:if test="${item.detail=='OTHER'}"> selected="true" </c:if></c:if></c:forEach>>OTHER</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF17I-->
                            <div class="form-row"><span class="label_body">OF17I</span><span class="label">Payment versus Payment Settlement Indicator</span>
                                <input type="checkbox" name="payment_versus_payment_settlement_indicator_checkbox" id="payment_versus_payment_settlement_indicator_checkbox" />
                                <div id="check_of17i">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                        <select name="_065_of17i_payment_versus_payment_settlement_indicator" id="_065_of17i_payment_versus_payment_settlement_indicator" input_type="OF17I Payment Versus Payment Settlement Indicator" location="Body">
                                            <option value=""></option>
                                            <option value="N" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of17i_payment_versus_payment_settlement_indicator'}"><c:if test="${item.detail=='N'}"> selected="true" </c:if></c:if></c:forEach>>N</option>
                                            <option value="Y" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of17i_payment_versus_payment_settlement_indicator'}"><c:if test="${item.detail=='Y'}"> selected="true" </c:if></c:if></c:forEach>>Y</option>
                                            <option value="OTHER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of17i_payment_versus_payment_settlement_indicator'}"><c:if test="${item.detail=='OTHER'}"> selected="true" </c:if></c:if></c:forEach>>OTHER</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--MF82-->
                            <div class="form-row"><span class="label_body">MF82</span><span class="label">Party A</span>
                                <select name="type_mf82_" id="type_mf82_" input_type="MF82 Party A" location="Body" class ="mandatory">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="j">J - Party Identification</option>
                                </select>
                                <div id="div_mf82_a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_071_mf82a_party_identifier" id="_071_mf82a_party_identifier" input_type="MF82A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_mf82a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_072_mf82a_identifier_code" id="_072_mf82a_identifier_code" input_type="MF82A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_mf82a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_073_mf82a_address" id="_073_mf82a_address" input_type="MF82A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_mf82a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_mf82_d">
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                		<input type="text" name="_074_mf82d_party_identifier" id="_074_mf82d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_074_mf82d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                	</div>
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                		<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_075_mf82d_name_address" id="_075_mf82d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_075_mf82d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                	</div>
                                </div>
                                <div id="div_mf82_j">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_076_mf82j_party_identification" id="_076_mf82j_party_identification" input_type="MF82J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_076_mf82j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--MF87-->
                            <div class="form-row"><span class="label_body">MF87</span><span class="label">Party B</span>
                                <select id="type_mf87_" name="type_mf87_" input_type="MF87 Party B" location="Body" class ="mandatory">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="j">J - Party Identification</option>
                                </select>
                                <div id="div_mf87_a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_081_mf87a_party_identifier" id="_081_mf87a_party_identifier" input_type="MF87A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_mf87a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_082_mf87a_identifier_code" id="_082_mf87a_identifier_code" input_type="MF87A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_mf87a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_083_mf87a_address" id="_083_mf87a_address" input_type="MF87A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf87a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_mf87_d">
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                		<input type="text" name="_084_mf87d_party_identifier" id="_084_mf87d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_mf87d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                	</div>
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                		<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_085_mf87d_name_address" id="_085_mf87d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_085_mf87d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                	</div>
                                </div>
                                <div id="div_mf87_j">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_086_mf87j_party_identification" id="_086_mf87j_party_identification" input_type="MF87J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_086_mf87j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF83-->
                            <div class="form-row"><span class="label_body">OF83</span><span class="label">Fund or Instructing Party</span>
                                <input type="checkbox" name="fund_or_instructing_party_checkbox" id="fund_or_instructing_party_checkbox" />
                                <div id="check_of83">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                        <select name="type_of83_" id="type_of83_" input_type="OF83 Fund or Instructing Party" location="Body">
                                            <option value=""></option>
                                            <option value="a">A - BIC</option>
                                            <option value="j">J - Party Identification</option>
                                        </select>
                                        <div id="div_of83_a">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                <input type="text" name="_091_of83a_party_identifier" id="_091_of83a_party_identifier" input_type="OF83A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of83a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                <input type="text" name="_092_of83a_identifier_code" id="_092_of83a_identifier_code" input_type="OF83A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of83a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                <textarea name="_093_of83a_address" id="_093_of83a_address" input_type="OF83A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of83a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                        <div id="div_of83_d">
                                        	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        		<input type="text" name="_094_of83d_party_identifier" id="_094_of83d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of83d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        	</div>
                                        	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        		<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_095_of83d_name_address" id="_095_of83d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_095_of83d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        	</div>
                                        </div>
                                        <div id="div_of83_j">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_096_of83j_party_identification" id="_096_of83j_party_identification" input_type="OF83J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_of83j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--OF77H-->
                            <div class="form-row"><span class="label_body">OF77H</span><span class="label">Type, Date, Version of the Agreement</span>
                                <input type="checkbox" name="type_date_version_checkbox" id="type_date_version_checkbox" input_type="Type, Date, Version of the Agreement" location="Body" />
                                <div id="check_of77h">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Type of Agreement</span>
                                        <select name="_097_of77h_type_of_agreement" id="_097_of77h_type_of_agreement" input_type="OF77H Type Of Agreement" location="Body" class="mandatory">
                                            <option value=""></option>
                                            <option value="AFB" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_097_of77h_type_of_agreement'}"><c:if test="${item.detail=='AFB'}"> selected="true" </c:if></c:if></c:forEach>>AFB</option>
                                            <option value="DERV" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_097_of77h_type_of_agreement'}"><c:if test="${item.detail=='DERV'}"> selected="true" </c:if></c:if></c:forEach>>DERV</option>
                                            <option value="FBF" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_097_of77h_type_of_agreement'}"><c:if test="${item.detail=='FBF'}"> selected="true" </c:if></c:if></c:forEach>>FBF</option>
                                            <option value="FEOMA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_097_of77h_type_of_agreement'}"><c:if test="${item.detail=='FEOMA'}"> selected="true" </c:if></c:if></c:forEach>>FEOMA</option>
                                            <option value="ICOM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_097_of77h_type_of_agreement'}"><c:if test="${item.detail=='ICOM'}"> selected="true" </c:if></c:if></c:forEach>>ICOM</option>
                                            <option value="IFEMA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_097_of77h_type_of_agreement'}"><c:if test="${item.detail=='IFEMA'}"> selected="true" </c:if></c:if></c:forEach>>IFEMA</option>
                                            <option value="ISDA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_097_of77h_type_of_agreement'}"><c:if test="${item.detail=='ISDA'}"> selected="true" </c:if></c:if></c:forEach>>ISDA</option>
                                            <option value="ISDACN" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_097_of77h_type_of_agreement'}"><c:if test="${item.detail=='ISDACN'}"> selected="true" </c:if></c:if></c:forEach>>ISDACN</option>
                                            <option value="OTHER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_097_of77h_type_of_agreement'}"><c:if test="${item.detail=='OTHER'}"> selected="true" </c:if></c:if></c:forEach>>OTHER</option>
                                        </select>
                                        <br/>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date (YYYYMMDD)</span>
                                            <input type="text" name="_098_of77h_date" id="_098_of77h_date" input_type="OF77H Date" location="Body" maxlength="8" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_098_of77h_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event);" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Version</span>
                                            <input type="text" name="_099_of77h_version" id="_099_of77h_version" input_type="OF77H Version" location="Body" maxlength="4" size="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_099_of77h_version'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event);" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF77D-->
                            <div class="form-row"><span class="label_body">OF77D</span><span class="label">Terms and Conditions</span>
                                <input type="checkbox" name="terms_and_conditions_checkbox" id="terms_and_conditions_checkbox" />
                                <div id="check_of77d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_100_of77d_terms_and_conditions" id="_100_of77d_terms_and_conditions" input_type="OF77D Terms And Conditions" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of77d_terms_and_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF14C-->
                            <div class="form-row"><span class="label_body">OF14C</span><span class="label">Year of Definitions</span>
                                <input type="checkbox" name="year_of_definitions_checkbox" id="year_of_definitions_checkbox" />
                                <div id="check_of14c">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                        <input type="text" name="_101_of14c_year_of_definitions" id="_101_of14c_year_of_definitions" input_type="OF14C Year Of Definitions" location="Body" maxlength="4" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of14c_year_of_definitions'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event);" />
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF17F-->
                            <div class="form-row"><span class="label_body">OF17F</span><span class="label"> Non-Deliverable Indicator</span>
                                <input type="checkbox" name="non-deliverable_indicator_checkbox" id="deliverable_indicator_checkbox" />
                                <div id="check_of17f">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                        <select name="_102_of17f_non_deliverable_indicator" id="_102_of17f_non_deliverable_indicator" input_type="OF17F Non Deliverable Indicator" location="Body">
                                            <option value=""></option>
                                            <option value="N" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_of17f_non_deliverable_indicator'}"><c:if test="${item.detail=='N'}"> selected="true" </c:if></c:if></c:forEach>>N</option>
                                            <option value="Y" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_of17f_non_deliverable_indicator'}"><c:if test="${item.detail=='Y'}"> selected="true" </c:if></c:if></c:forEach>>Y</option>
                                            <option value="OTHER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_of17f_non_deliverable_indicator'}"><c:if test="${item.detail=='OTHER'}"> selected="true" </c:if></c:if></c:forEach>>OTHER</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF17O-->
                            <div class="form-row"><span class="label_body">OF17O</span><span class="label">NDF Open Indicator</span>
                                <input type="checkbox" name="NDF_open_indicator_checkbox" id="NDF_open_indicator_checkbox" />
                                <div id="check_of17o">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                        <select name="_103_of17o_ndf_open_indicator" id="_103_of17o_ndf_open_indicator" input_type="OF17O Ndf Open Indicator" location="Body">
                                            <option value=""></option>
                                            <option value="N" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_of17o_ndf_open_indicator'}"><c:if test="${item.detail=='N'}"> selected="true" </c:if></c:if></c:forEach>>N</option>
                                            <option value="Y" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_of17o_ndf_open_indicator'}"><c:if test="${item.detail=='Y'}"> selected="true" </c:if></c:if></c:forEach>>Y</option>
                                            <option value="OTHER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_of17o_ndf_open_indicator'}"><c:if test="${item.detail=='OTHER'}"> selected="true" </c:if></c:if></c:forEach>>OTHER</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF32E-->
                            <div class="form-row"><span class="label_body">OF32E</span><span class="label">Settlement Currency</span>
                                <input type="checkbox" name="settlement_currency_checkbox" id="settlement_currency_checkbox" />
                                <div id="check_of32e">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                        <input type="text" name="_104_of32e_currency" id="_104_of32e_currency" input_type="OF32E Currency" location="Body" maxlength="3" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_104_of32e_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return textonly(event);" />
                                        <c:forEach var="item" items="${tags}">
                                            <c:if test="${item.tagName=='_104_of32e_currency'}">
                                                <c:set var="_104_of32e_currency" scope="request" value="${item.detail}" />
                                            </c:if>
                                        </c:forEach>
                                        <%--
                                        <select name="_104_of32e_currency" id="_104_of32e_currency" input_type="OF32E Currency" location="Body">
                                            <option value=""></option>
                                            <c:forEach var="item" items="${dataCurrList}">
                                                <option value="${item.code}" <c:if test="${_104_of32e_currency==item.code}"> selected="true" </c:if>>${item.code}</option>
                                            </c:forEach>
                                        </select>
                                        --%>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF30U-->
                            <div class="form-row"><span class="label_body">OF30U</span><span class="label">Valuation Date (YYYYMMDD)</span>
                                <input type="checkbox" name="valuation_date_checkbox" id="valuation_date_checkbox" />
                                <div id="check_of30u">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                        <input type="text" name="_105_of30u_valuation_date" id="_105_of30u_valuation_date" input_type="OF30U Valuation Date" location="Body" maxlength="8" size="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_105_of30u_valuation_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event);" />
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF14S-->
                            <div class="form-row"><span class="label_body">OF14S</span><span class="label">Settlement Rate Source</span>
                                <input type="checkbox" name="settlement_rate_source_checkbox" id="settlement_rate_source_checkbox" />
                                <div id="check_of14s">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">OCC 1</span>
                                        <input type="checkbox" name="occ_1_chexbox" id="occ_1_chexbox" />
                                        <div id="check_ofcc1">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Rate Resource</span>
                                                <input type="text" name="_106_of14s_rate_source" id="_106_of14s_rate_source" input_type="OF14S Rate Source" location="Body" maxlength="5" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_106_of14s_rate_source'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time and Location</span>
                                                <input type="checkbox" name="time_and_location_I_checkbox" id="time_and_location_I_checkbox" />
                                                <div id="check_oftl_I">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time</span>
                                                        <input type="text" name="_107_of14s_time" id="_107_of14s_time" input_type="OF14S Time" location="Body" maxlength="4" size="4" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_107_of14s_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event);" />
                                                    </div>
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                        <input type="text" name="_108_of14s_location" id="_108_of14s_location" input_type="OF14S Location" location="Body" maxlength="4" size="4" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_108_of14s_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return textonly(event);" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">OCC 2</span>
                                        <input type="checkbox" name="occ_2_checkbox" id="occ_2_checkbox" />
                                        <div id="check_ofcc2">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Rate Resource</span>
                                                <input type="text" name="_109_of14s_rate_resource" id="_109_of14s_rate_resource" input_type="OF14S Rate Resource" location="Body" maxlength="5" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_109_of14s_rate_resource'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time and Location</span>
                                                <input type="checkbox" name="time_and_location_II_checkbox" id="time_and_location_II_checkbox" />
                                                <div id="check_oftl_II">
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time</span>
                                                        <input type="text" name="_110_of14s_time" id="_110_of14s_time" input_type="OF14S Time" location="Body" maxlength="4" size="4" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of14s_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event);" />
                                                    </div>
                                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                        <input type="text" name="_111_of14s_location" id="_111_of14s_location" input_type="OF14S Location" location="Body" maxlength="4" size="4" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_of14s_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return textonly(event);" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF21A-->
                            <div class="form-row"><span class="label_body">OF21A</span><span class="label">Reference to Opening Confirmation</span>
                                <input type="text" onkeypress="avoidSplChars(event)"  maxlength="16" name="_112_of21a_reference_to_opening_confirmation" id="_112_of21a_reference_to_opening_confirmation" input_type="OF21A Reference To Opening Confirmation" location="Body" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_112_of21a_reference_to_opening_confirmation'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--OF14E-->
                            <div class="form-row"><span class="label_body">OF14E</span><span class="label">Clearing or Settlement Session</span>
                                <input type="text" onkeypress="avoidSplChars(event)" maxlength="35" name="_113_of14e_clearing_or_settlement_session" id="_113_of14e_clearing_or_settlement_session" input_type="OF14E Clearing Or Settlement Session" location="Body" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_113_of14e_clearing_or_settlement_session'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--<hr/>-->
                            <!--Man A end-->
                            <!--Man B-->
                            <h2 class="header-title">Mandatory Sequence B Transaction Details</h2>
                            <!--MF15B-->
                            <div class="form-row"><span class="label_body">MF15B</span><span class="label">New Sequence B</span>
                                <input name="_119_mf15b_" type="hidden" value="" />
                            </div>
                            <hr/>
                            <!--MF30T-->
                            <div class="form-row"><span class="label_body">MF30T</span><span class="label">*Trade Date (YYYYMMDD)</span>
                                <input type="text" name="_120_mf30t_trade_date" id="_120_mf30t_trade_date" input_type="MF30T Trade Date" location="Body" class ="mandatory" maxlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_mf30t_trade_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--MF30V-->
                            <div class="form-row"><span class="label_body">MF30V</span><span class="label">*Value Date (YYYYMMDD)</span>
                                <input type="text" name="_130_mf30v_value_date" id="_130_mf30v_value_date" input_type="MF30V Value Date" location="Body" class ="mandatory" maxlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_mf30v_value_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--MF36-->
                            <div class="form-row"><span class="label_body">MF36</span><span class="label">Exchange Rate</span>
                                <input type="text" name="_140_mf36_exchange_rate" id="_140_mf36_exchange_rate" input_type="MF36 Exchange Rate" location="Body" class ="mandatory"  maxlength="16" onkeypress="return numbersonly(event, '_140_mf36_exchange_rate');" onblur="checkZeroAmount(this.id); cek_koma(this);" ondrop="return false;" onpaste="return false;" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_mf36_exchange_rate'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            <!--OF39M-->
                            <div class="form-row"><span class="label_body">OF39M</span><span class="label">Payment Clearing Center</span>
                                <input type="text" name="_150_of39m_payment_clearing_center" id="_150_of39m_payment_clearing_center" input_type="OF39M Payment Clearing Center" location="Body" maxlength="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of39m_payment_clearing_center'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <!--<hr/>-->
                            <!--end Man B-->
                            <!--Man B1-->
                            <h2 class="header-title">Mandatory Subsequence B1 Amount Bought</h2>
                            <input name="_159_mf15b1_" type="hidden" value="" />
                            <!--MF32B-->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label">Currency Code</span>
                                <input type="text" name="_160_mf32b_currency" id="_160_mf32b_currency" input_type="MF32B Currency" location="Body" class ="mandatory" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName=='_160_mf32b_currency'}">
                                        <c:set var="_160_mf32b_currency" scope="request" value="${item.detail}" />
                                    </c:if>
                                </c:forEach>
                                <%--
                                <select name="_160_mf32b_currency" id="_160_mf32b_currency" input_type="MF32B Currency" location="Body" class="mandatory">
                                    <option value="">choose a currency</option>
                                    <c:forEach var="item" items="${dataCurrList}">
                                        <option value="${item.code}" <c:if test="${_160_mf32b_currency==item.code}"> selected="true" </c:if>>${item.code}</option>
                                    </c:forEach>
                                </select>
                                --%>
                            </div>
                            <!--Amount-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_161_mf32b_amount" id="_161_mf32b_amount" input_type="MF32B Amount" location="Body" class ="mandatory" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_161_mf32b_amount');" onblur="checkZeroAmount(this.id); cek_koma(this);" ondrop="return false;" onpaste="return false;" />
                                <font style="margin-left: 50px"></font>
                                <!--
                                <script language="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_161_mf32b_amount').value;
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
                            <!--OF53-->
                            <div class="form-row"><span class="label_body"> OF53 </span><span class="label">Delivery Agent</span>
                                <select name="type_of53_" id="type_of53_" input_type="OF53 Delivery Agent" location="Body">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="j">J - Party Identification</option>
                                </select>
                                <div id="div_of53_a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_171_of53a_party_identifier" id="_171_of53a_party_identifier" input_type="OF53A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_172_of53a_identifier_code" id="_172_of53a_identifier_code" input_type="OF53A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_173_of53a_address" id="_173_of53a_address" input_type="OF53A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_of53a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of53_d">
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                		<input type="text" name="_174_of53d_party_identifier" id="_174_of53d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                	</div>
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                		<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_175_of53d_name_address" id="_175_of53d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_175_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                	</div>
                                </div>
                                <div id="div_of53_j">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" style="resize:none;" maxlength="200" name="_176_of53j_party_identification" id="_176_of53j_party_identification" input_type="OF53J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_176_of53j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF56-->
                            <div class="form-row"><span class="label_body"> OF56 </span><span class="label">Intermediary </span>
                                <select id="type_of56_" name="type_of56_" input_type="OF56 Intermediary" location="Body">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="j">J - Party Identification </option>
                                </select>
                                <div id="div_of56_a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_181_of56a_party_identifier" id="_181_of56a_party_identifier" input_type="OF56A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_182_of56a_identifier_code" id="_182_of56a_identifier_code" input_type="OF56A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_182_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expension</span>
                                        <textarea name="_183_of56a_address" id="_183_of56a_address" input_type="OF56A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_183_of56a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of56_d">
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                		<input type="text" name="_184_of56d_party_identifier" id="_184_of56d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                	</div>
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                		<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_185_of56d_name_address" id="_185_of56d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_185_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                	</div>
                                </div>
                                <div id="div_of56_j">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_186_of56j_party_identification" id="_186_of56j_party_identification" input_type="OF56J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_186_of56j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--MF57-->
                            <div class="form-row"><span class="label_body"> MF57 </span><span class="label">Receiving Agent</span>
                                <select id="type_mf57_" name="type_mf57_" input_type="MF57 Receiving Agent" location="Body" class ="mandatory">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="j">J - Party Identification</option>
                                </select>
                                <div id="div_mf57_a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_191_mf57a_party_identifier" id="_191_mf57a_party_identifier" input_type="MF57A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_191_mf57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_192_mf57a_identifier_code" id="_192_mf57a_identifier_code" input_type="MF57A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_192_mf57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expension</span>
                                        <textarea name="_193_mf57a_addresss" id="_193_mf57a_addresss" input_type="MF57A Addresss" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_193_mf57a_addresss'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_mf57_d">
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                		<input type="text" name="_194_mf57d_party_identifier" id="_194_mf57d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_194_mf57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                	</div>
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                		<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_195_mf57d_name_address" id="_195_mf57d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_195_mf57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                	</div>
                                </div>
                                <div id="div_mf57_j">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_196_mf57j_party_identification" id="_196_mf57j_party_identification" input_type="MF57J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_196_mf57j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <!--<hr/>-->
                            <!--end Man B-->
                            <!--Man B2-->
                            <h2 class="header-title">Mandatory Subsequence B2 Amount Sold</h2>
                            <input name="_199_mf15b2_" type="hidden" value="" />
                            <!--MF33B-->
                            <div class="form-row"><span class="label_body">MF33B</span><span class="label">Currency Code</span>
                                <input type="text" name="_200_mf33b_currency" id="_200_mf33b_currency" input_type="MF33B Currency" location="Body" class ="mandatory" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_mf33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                <c:forEach var="item" items="${tags}">
                                    <c:if test="${item.tagName=='_200_mf33b_currency'}">
                                        <c:set var="_200_mf33b_currency" scope="request" value="${item.detail}" />
                                    </c:if>
                                </c:forEach>
                                <%--
                                <select name="_200_mf33b_currency" id="_200_mf33b_currency" input_type="MF33B Currency" location="Body" class="mandatory">
                                    <option value="">choose a currency</option>
                                    <c:forEach var="item" items="${dataCurrList}">
                                        <option value="${item.code}" <c:if test="${_200_mf33b_currency==item.code}"> selected="true" </c:if>>${item.code}</option>
                                    </c:forEach>
                                </select>
                                --%>
                            </div>
                            <!--Amount-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_201_mf33b_amount" id="_201_mf33b_amount" input_type="MF33B Amount" location="Body" class ="mandatory" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_201_mf33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_201_mf33b_amount');" onblur="checkZeroAmount(this.id); cek_koma(this);" ondrop="return false;" onpaste="return false;" />
                                <font style="margin-left: 50px"></font>
                                <!--
                                <script language="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_201_mf33b_amount').value;
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
                            <!--OF53-->
                            <div class="form-row"><span class="label_body"> OF53 </span><span class="label">Delivery Agent</span>
                                <select name="type_of53_b2" id="type_of53_b2" input_type="OF53 B2 Delivery Agent" location="Body">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="j">J - Party Identification</option>
                                </select>
                                <div id="div_of53_a_b2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_211_of53a_party_identifier" id="_211_of53a_party_identifier" input_type="OF53A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_211_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_212_of53a_identifier_code" id="_212_of53a_identifier_code" input_type="OF53A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_212_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_213_of53a_address" id="_213_of53a_address" input_type="OF53A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_213_of53a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of53_d_b2">
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                		<input type="text" name="_214_of53d_party_identifier" id="_214_of53d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_214_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                	</div>
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                		<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_215_of53d_name_address" id="_215_of53d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_215_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                	</div>
                                </div>
                                <div id="div_of53_j_b2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_216_of53j_party_identification" id="_216_of53j_party_identification" input_type="OF53J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_216_of53j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF56-->
                            <div class="form-row"><span class="label_body"> OF56 </span><span class="label">Intermediary</span>
                                <select id="type_of56_b2" name="type_of56_b2" input_type="OF56 B2 Intermediary" location="Body">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="j">J - Party Identification </option>
                                </select>
                                <div id="div_of56_a_b2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_221_of56a_party_identifier" id="_221_of56a_party_identifier" input_type="OF56A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_221_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_222_of56a_identifier_code" id="_222_of56a_identifier_code" input_type="OF56A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_222_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expension</span>
                                        <textarea name="_223_of56a_address" id="_223_of56a_address" input_type="OF56A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_223_of56a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of56_d_b2">
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                		<input type="text" name="_224_of56d_party_identifier" id="_224_of56d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_224_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                	</div>
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                		<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_225_of56d_name_address" id="_225_of56d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_225_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                	</div>
                                </div>
                                <div id="div_of56_j_b2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_226_of56j_party_identification" id="_226_of56j_party_identification" input_type="OF56J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_226_of56j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--MF57-->
                            <div class="form-row"><span class="label_body"> MF57 </span><span class="label">Receiving Agent</span>
                                <select id="type_mf57_b2" name="type_mf57_b2" input_type="MF57 B2 Receiving Agent" location="Body" class ="mandatory">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="j">J - Party Identification</option>
                                </select>
                                <div id="div_mf57_a_b2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_231_mf57a_party_identifier" id="_231_mf57a_party_identifier" input_type="MF57A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_231_mf57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_232_mf57a_identifier_code" id="_232_mf57a_identifier_code" input_type="MF57A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_232_mf57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expension</span>
                                        <textarea name="_233_mf57a_addresss" id="_233_mf57a_addresss" input_type="MF57A Addresss" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_233_mf57a_addresss'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_mf57_d_b2">
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                		<input type="text" name="_234_mf57d_party_identifier" id="_234_mf57d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_234_mf57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                	</div>
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                		<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_235_mf57d_name_address" id="_235_mf57d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_235_mf57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                	</div>
                                </div>
                                <div id="div_mf57_j_b2">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_236_mf57j_party_identification" id="_236_mf57j_party_identification" input_type="MF57J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_236_mf57j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <!--OF58-->
                            <div class="form-row"><span class="label_body"> OF58 </span><span class="label">Beneficiary Institution</span>
                                <select id="type_of58_" name="type_of58_" input_type="OF58 Beneficiary Institution" location="Body">
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="j">J - Party Identification</option>
                                </select>
                                <div id="div_of58_a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_241_of58a_party_identifier" id="_241_of58a_party_identifier" input_type="OF58A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_241_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_242_of58a_identifier_code" id="_242_of58a_identifier_code" input_type="OF58A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_242_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_243_of58a_address" id="_243_of58a_address" input_type="OF58A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_243_of58a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of58_d">
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                		<input type="text" name="_244_of58d_party_identifier" id="_244_of58d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_244_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                	</div>
                                	<div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                		<textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_245_of58d_name_address" id="_245_of58d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_245_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                	</div>
                                </div>
                                <div id="div_of58_j">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                        <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_246_of58j_party_identification" id="_246_of58j_party_identification" input_type="OF58J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_246_of58j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <!--<hr/>-->
                            <!-- end Man B2 -->
                            <!-- Man C -->
                            <h2 class="header-title">
                                <label class="optsel">
                                    <input type="checkbox" name="seq_C_checkbox" id="seq_C_checkbox" />
                                </label>Optional Sequence C Optional General Information
                            </h2>
                            <div id="check_seq_c">
                                <!--OF15C-->
                                <div class="form-row"><span class="label_body">MF15C</span><span class="label"> New Sequence C </span>
                                    <input name="_249_mf15c_" type="hidden" value="" />
                                </div>
                                <hr/>
                                <!--OF29A-->
                                <div class="form-row"><span class="label_body">OF29A</span><span class="label"> Contact Information </span>
                                    <input type="checkbox" name="contact_information_checkbox" id="contact_information_checkbox" />
                                    <div id="check_of29a">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_250_of29a_contact_information" id="_250_of29a_contact_information" input_type="OF29A Contact Information" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of29a_contact_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <!--OF24D-->
                                <div class="form-row"><span class="label_body">OF24D</span><span class="label">Dealing Method</span>
                                    <input type="checkbox" name="dealing_method_checkbox" id="dealing_method_checkbox" />
                                    <div id="check_of24d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                            <select name="_260_of24d_dealing_method" id="_260_of24d_dealing_method" input_type="OF24D Dealing Method" location="Body" class="mandatory">
                                                <option value=""></option>
                                                <option value="BROK" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of24d_dealing_method'}"><c:if test="${item.detail=='BROK'}"> selected="true" </c:if></c:if></c:forEach>>BROK</option>
                                                <option value="ELEC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of24d_dealing_method'}"><c:if test="${item.detail=='ELEC'}"> selected="true" </c:if></c:if></c:forEach>>ELEC</option>
                                                <option value="FAXT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of24d_dealing_method'}"><c:if test="${item.detail=='FAXT'}"> selected="true" </c:if></c:if></c:forEach>>FAXT</option>
                                                <option value="PHON" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of24d_dealing_method'}"><c:if test="${item.detail=='PHON'}"> selected="true" </c:if></c:if></c:forEach>>PHON</option>
                                                <option value="TELX" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of24d_dealing_method'}"><c:if test="${item.detail=='TELX'}"> selected="true" </c:if></c:if></c:forEach>>TELX</option>
                                                <option value="OTHER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of24d_dealing_method'}"><c:if test="${item.detail=='OTHER'}"> selected="true" </c:if></c:if></c:forEach>>OTHER</option>
                                            </select>
                                        </div>
                                        <!--<br/>-->
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Additional Information</span>
                                            <input type="text" onkeypress="avoidSplChars(event)" id="_261_of24d_additional_information" name="_261_of24d_additional_information" input_type="OF24D Additional Information" location="Body" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_261_of24d_additional_information'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <!--OF84-->
                                <div class="form-row"><span class="label_body">OF84</span><span class="label">Dealing Branch Party A</span>
                                    <input type="checkbox" name="dealing_branch_party_A_checkbox" id="dealing_branch_party_A_checkbox" />
                                    <div id="check_of84">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                            <select name="type_of84_" id="type_of84_" input_type="OF84 Dealing Branch Party A" location="Body">
                                                <option value=""></option>
                                                <option value="a">A - BIC</option>
                                                <option value="b">B - Location</option>
                                                <option value="d">D - Name & Address</option>
                                                <option value="j">J - Party Identification</option>
                                            </select>
                                            <div id="div_of84_a">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_271_of84a_party_identifier" id="_271_of84a_party_identifier" input_type="OF84A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_271_of84a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                    <input type="text" name="_272_of84a_identifier_code" id="_272_of84a_identifier_code" input_type="OF84A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_272_of84a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                    <textarea name="_273_of84a_address" id="_273_of84a_address" input_type="OF84A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_273_of84a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                            <div id="div_of84_b">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_274_of84b_party_identifier" id="_274_of84b_party_identifier" input_type="OF84B Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_274_of84b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                    <%--<textarea name="_275_of84b_location" id="_275_of84b_location" input_type="OF84B Location" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_275_of84b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>--%>
                                                    <input type="text" onkeypress="avoidSplChars(event)" name="_275_of84b_location" id="_275_of84b_location" input_type="OF84B Location" location="Body" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_275_of84b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>
                                            </div>
                                            <div id="div_of84_d">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_276_of84d_party_identifier" id="_276_of84d_party_identifier" input_type="OF84D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_276_of84d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)"  />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_277_of84d_name_and_address" id="_277_of84d_name_and_address" input_type="OF84D Name And Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_277_of84d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                            <div id="div_of84_j">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                    <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_278_of84j_party_identification" id="_278_of84j_party_identification" input_type="OF84J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_278_of84j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <!--OF85-->
                                <div class="form-row"><span class="label_body">OF85</span><span class="label">Dealing Branch Party B</span>
                                    <input type="checkbox" name="dealing_branch_party_B_checkbox" id="dealing_branch_party_B_checkbox" />
                                    <div id="check_of85">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                            <select name="type_of85_" id="type_of85_" input_type="OF85 Dealing Branch Party B" location="Body">
                                                <option value=""></option>
                                                <option value="a">A - BIC</option>
                                                <option value="b">B - Location</option>
                                                <option value="d">D - Name & Address</option>
                                                <option value="j">J - Party Identification</option>
                                            </select>
                                            <div id="div_of85_a">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_281_of85a_party_identifier" id="_281_of85a_party_identifier" input_type="OF85A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_281_of85a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                                    <input type="text" name="_282_of85a_identifier_code" id="_282_of85a_identifier_code" input_type="OF85A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_282_of85a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                    <textarea name="_283_of85a_address" id="_283_of85a_address" input_type="OF85A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_283_of85a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                            <div id="div_of85_b">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_284_of85b_party_identifier" id="_284_of85b_party_identifier" input_type="OF85B Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_284_of85b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                                    <%--<textarea name="_285_of85b_location" id="_285_of85b_location" input_type="OF85B Location" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_285_of85b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>--%>
                                                    <input type="text" onkeypress="avoidSplChars(event)" name="_285_of85b_location" id="_285_of85b_location" input_type="OF85B Location" location="Body" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_285_of85b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>
                                            </div>
                                            <div id="div_of85_d">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_286_of85d_party_identifier" id="_286_of85d_party_identifier" input_type="OF85D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_286_of85d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_287_of85d_name_and_address" id="_287_of85d_name_and_address" input_type="OF85D Name And Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_287_of85d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                            <div id="div_of85_j">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                    <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_288_of85j_party_identification" id="_288_of85j_party_identification" input_type="OF85J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_288_of85j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <!--OF88-->
                                <div class="form-row"><span class="label_body">OF88</span><span class="label">Broker Identification</span>
                                    <input type="checkbox" name="broker_identification_checkbox" id="broker_identification_checkbox" />
                                    <div id="check_of88">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                            <select name="type_of88_" id="type_of88_" input_type="OF88 Broker Identification" location="Body">
                                                <option value=""></option>
                                                <option value="a">A - BIC</option>
                                                <option value="d">D - Name & Address</option>
                                                <option value="j">J - Party Identification</option>
                                            </select>
                                            <div id="div_of88_a">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_291_of88a_party_identifier" id="_291_of88a_party_identifier" input_type="OF88A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_291_of88a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                                    <input type="text" name="_292_of88a_identifier_code" id="_292_of88a_identifier_code" input_type="OF88A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_292_of88a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                                    <textarea name="_293_of88a_address" id="_293_of88a_address" input_type="OF88A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_293_of88a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                            <div id="div_of88_d">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                                    <input type="text" name="_294_of88d_party_identifier" id="_294_of88d_party_identifier" input_type="OF88D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_294_of88d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                                </div>
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                                    <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_295_of88d_name_and_address" id="_295_of88d_name_and_address" input_type="OF88D Name And Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_295_of88d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                            <div id="div_of88_j">
                                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                                    <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_296_of88j_party_identification" id="_296_of88j_party_identification" input_type="OF88J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_296_of88j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <!--OF71F-->
                                <div class="form-row"><span class="label_body">OF71F</span><span class="label">Broker's Commission</span>
                                    <input type="checkbox" name="broker_commission_checkbox" id="broker_commission_checkbox" />
                                    <div id="check_of71f">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency Code</span>
                                            <input type="text" name="_300_of71f_currency" id="_300_of71f_currency" input_type="OF71F Currency" location="Body" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of71f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <c:forEach var="item" items="${tags}">
                                                <c:if test="${item.tagName=='_300_of71f_currency'}">
                                                    <c:set var="_300_of71f_currency" scope="request" value="${item.detail}" />
                                                </c:if>
                                            </c:forEach>
                                            <%--
                                            <select name="_300_of71f_currency" id="_300_of71f_currency" input_type="OF71F Currency" location="Body" class="mandatory">
                                                <option value=""></option>
                                                <c:forEach var="item" items="${dataCurrList}">
                                                    <option value="${item.code}" <c:if test="${_300_of71f_currency==item.code}"> selected="true" </c:if>>${item.code}</option>
                                                </c:forEach>
                                            </select>
                                            --%>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_301_of71f_amount" id="_301_of71f_amount" input_type="OF71F Amount" location="Body" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_301_of71f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_301_of71f_amount');" onblur="checkZeroAmount(this.id); cek_koma(this);" ondrop="return false;" onpaste="return false;" />
                                            <font style="margin-left: 50px"></font>
                                            <!--
                                            <script language="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                }
                                                var number2 = document.getElementById('_301_of71f_amount').value;
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
                                    </div>
                                </div>
                                <hr/>
                                <!--OF26H-->
                                <div class="form-row"><span class="label_body">OF26H</span><span class="label">Counterparty's Reference</span>
                                    <input type="checkbox" name="counterparty_reference_checkbox" id="counterparty_reference_checkbox" />
                                    <div id="check_of26h">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                            <input type="text" onkeypress="avoidSplChars(event)" name="_310_of26h_counterpartys_reference" id="_310_of26h_counterpartys_reference" input_type="OF26H Counterpartys Reference" location="Body" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of26h_counterpartys_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <!--OF21G-->
                                <div class="form-row"><span class="label_body">OF21G</span><span class="label">Broker's Reference</span>
                                    <input type="checkbox" name="brokers_reference_checkbox" id="brokers_reference_checkbox" />
                                    <div id="check_of21g">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                            <input type="text" onkeypress="avoidSplChars(event)" name="_320_of21g_brokers_reference" id="_320_of21g_brokers_reference" input_type="OF21G Brokers Reference" location="Body" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of21g_brokers_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <!--OF72-->
                                <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                    <input type="checkbox" name="sender_to_receiver_information_checkbox" id="sender_to_receiver_information_checkbox" />
                                    <div id="check_of72">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Code</span>
                                            <input type="text" name="_330_of72_code" id="_330_of72_code" input_type="OF72 Code" location="Body" maxlength="8" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of72_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                            <input type="text" onkeypress="avoidSplChars(event)" name="_331_of72_narrative" id="_331_of72_narrative" input_type="OF72 Narrative" location="Body" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_331_of72_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <!--<hr/>-->
                            </div>
                            <!-- end Man B2 -->
                            <!-- Man D -->
                            <h2 class="header-title">
                                <label class="optsel">
                                    <input type="checkbox" name="seq_D_checkbox" id="seq_D_checkbox" />
                                </label>Optional Sequence D Split Settlement Details
                            </h2>
                            <div id="check_seq_d">
                                <!--MF15D-->
                                <div class="form-row"><span class="label_body">MF15D</span><span class="label">New Sequence</span>
                                    <input name="_349_mf15d_" type="hidden" value="" />
                                </div>
                                <hr/>
                                <!--MF17A-->
                                <div class="form-row"><span class="label_body">MF17A</span><span class="label">Buy (Sell) Indicator</span>
                                    <select name="_350_mf17a_buy_sell_indicator" id="_350_mf17a_buy_sell_indicator" input_type="MF17A Buy Sell Indicator" location="Body" class ="mandatory">
                                        <option value=""></option>
                                        <option value="N" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_mf17a_buy_sell_indicator'}"><c:if test="${item.detail=='N'}"> selected="true" </c:if></c:if></c:forEach>>N</option>
                                        <option value="Y" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_mf17a_buy_sell_indicator'}"><c:if test="${item.detail=='Y'}"> selected="true" </c:if></c:if></c:forEach>>Y</option>
                                        <option value="OTHER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_mf17a_buy_sell_indicator'}"><c:if test="${item.detail=='OTHER'}"> selected="true" </c:if></c:if></c:forEach>>OTHER</option>
                                    </select>
                                </div>
                                <hr/>
                                <!--MF32B-->
                                <!--Currency-->
                                <div class="form-row"><span class="label_body">MF32B</span><span class="label">Currency Code</span>
                                    <input type="text" name="_360_mf32b_currency" id="_360_mf32b_currency" input_type="MF32B Currency" location="Body" class ="mandatory" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    <c:forEach var="item" items="${tags}">
                                        <c:if test="${item.tagName=='_360_mf32b_currency'}">
                                            <c:set var="_360_mf32b_currency" scope="request" value="${item.detail}" />
                                        </c:if>
                                    </c:forEach>
                                    <%--
                                    <select name="_360_mf32b_currency" id="_360_mf32b_currency" input_type="MF32B Currency" location="Body" class="mandatory">
                                        <option value="">choose a currency</option>
                                        <c:forEach var="item" items="${dataCurrList}">
                                            <option value="${item.code}" <c:if test="${_360_mf32b_currency==item.code}"> selected="true" </c:if>>${item.code}</option>
                                        </c:forEach>
                                    </select>
                                    --%>
                                </div>
                                <!--Amount-->
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_361_mf32b_amount" id="_361_mf32b_amount" input_type="MF32B Amount" location="Body" class ="mandatory" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_361_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_361_mf32b_amount');" onblur="checkZeroAmount(this.id); cek_koma(this);" ondrop="return false;" onpaste="return false;" />
                                    <font style="margin-left: 50px"></font>
                                    <!--
                                    <script language="javascript">
                                        function formatUang(n, currency) {
                                            return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                        }
                                        var number2 = document.getElementById('_361_mf32b_amount').value;
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
                                <!--OF53-->
                                <div class="form-row"><span class="label_body"> OF53 </span><span class="label">Delivery Agent</span>
                                    <select name="type_of53_d" id="type_of53_d" input_type="OF53 D Delivery Agent" location="Body">
                                        <option value=""></option>
                                        <option value="a">A - BIC</option>
                                        <option value="d">D - Name & Address</option>
                                        <option value="j">J - Party Identification</option>
                                    </select>
                                    <div id="div_of53_a_d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_371_of53a_party_identifier" id="_371_of53a_party_identifier" input_type="OF53A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_371_of53a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_372_of53a_identifier_code" id="_372_of53a_identifier_code" input_type="OF53A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_372_of53a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                            <textarea name="_373_of53a_address" id="_373_of53a_address" input_type="OF53A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_373_of53a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                    <div id="div_of53_d_d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_374_of53d_party_identifier" id="_374_of53d_party_identifier" input_type="OF53D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_374_of53d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" type="text" name="_375_of53d_name_address" id="_375_of53d_name_address" input_type="OF53D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_375_of53d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                    <div id="div_of53_j_d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_376_of53j_party_identification" id="_376_of53j_party_identification" input_type="OF53J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_376_of53j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <!--OF56-->
                                <div class="form-row"><span class="label_body"> OF56 </span><span class="label">Intermediary</span>
                                    <select id="type_of56_d" name="type_of56_d" input_type="OF56 D Intermediary" location="Body">
                                        <option value=""></option>
                                        <option value="a">A - BIC</option>
                                        <option value="d">D - Name & Address</option>
                                        <option value="j">J - Party Identification </option>
                                    </select>
                                    <div id="div_of56_a_d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_381_of56a_party_identifier" id="_381_of56a_party_identifier" input_type="OF56A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_381_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_382_of56a_identifier_code" id="_382_of56a_identifier_code" input_type="OF56A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_382_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expension</span>
                                            <textarea name="_383_of56a_address" id="_383_of56a_address" input_type="OF56A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_383_of56a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                    <div id="div_of56_d_d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_384_of56d_party_identifier" id="_384_of56d_party_identifier" input_type="OF56D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_384_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_385_of56d_name_address" id="_385_of56d_name_address" input_type="OF56D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_385_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                    <div id="div_of56_j_d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_386_of56j_party_identification" id="_386_of56j_party_identification" input_type="OF56J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_386_of56j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <!--MF57-->
                                <div class="form-row"><span class="label_body"> MF57 </span><span class="label">Receiving Agent</span>
                                    <select id="type_mf57_d" name="type_mf57_d" input_type="MF57 D Receiving Agent" location="Body" class ="mandatory">
                                        <option value=""></option>
                                        <option value="a">A - BIC</option>
                                        <option value="d">D - Name & Address</option>
                                        <option value="j">J - Party Identification</option>
                                    </select>
                                    <div id="div_mf57_a_d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_391_mf57a_party_identifier" id="_391_mf57a_party_identifier" input_type="MF57A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_391_mf57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_392_mf57a_identifier_code" id="_392_mf57a_identifier_code" input_type="MF57A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_392_mf57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expension</span>
                                            <textarea name="_393_mf57a_addresss" id="_393_mf57a_addresss" input_type="MF57A Addresss" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_393_mf57a_addresss'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                    <div id="div_mf57_d_d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_394_mf57d_party_identifier" id="_394_mf57d_party_identifier" input_type="MF57D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_394_mf57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_395_mf57d_name_address" id="_395_mf57d_name_address" input_type="MF57D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_395_mf57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                    <div id="div_mf57_j_d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_396_mf57j_party_identification" id="_396_mf57j_party_identification" input_type="MF57J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_396_mf57j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <!--OF58-->
                                <div class="form-row"><span class="label_body"> OF58 </span><span class="label">Beneficiary Institution</span>
                                    <select id="type_of58_d" name="type_of58_d" input_type="OF58 D Beneficiary Institution" location="Body">
                                        <option value=""></option>
                                        <option value="a">A - BIC</option>
                                        <option value="d">D - Name & Address</option>
                                        <option value="j">J - Party Identification</option>
                                    </select>
                                    <div id="div_of58_a_d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_401_of58a_party_identifier" id="_401_of58a_party_identifier" input_type="OF58A Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_401_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                            <input type="text" name="_402_of58a_identifier_code" id="_402_of58a_identifier_code" input_type="OF58A Identifier Code" location="Body" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_402_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                            <textarea name="_403_of58a_address" id="_403_of58a_address" input_type="OF58A Address" location="Body" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_403_of58a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                    <div id="div_of58_d_d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                            <input type="text" name="_404_of58d_party_identifier" id="_404_of58d_party_identifier" input_type="OF58D Party Identifier" location="Body" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_404_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_slash(this)" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_405_of58d_name_address" id="_405_of58d_name_address" input_type="OF58D Name Address" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_405_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                    <div id="div_of58_j_d">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identification</span>
                                            <textarea onkeypress="avoidSplChars(event)" cols="40" rows="5" maxlength="200" style="resize:none;" name="_406_of58j_party_identification" id="_406_of58j_party_identification" input_type="OF58J Party Identification" location="Body" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_406_of58j_party_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <!--MF16A-->
                                <div class="form-row"><span class="label_body">MF16A</span><span class="label">Number of Settlements</span>
                                    <input type="text" name="_410_mf16a_number_of_settlements" id="_410_mf16a_number_of_settlements" input_type="MF16A Number Of Settlements" location="Body" class ="mandatory" maxlength="5" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_410_mf16a_number_of_settlements'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_210_of71f_currency');" />
                                </div>
                                <hr/>
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