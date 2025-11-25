<%-- 
    Document   : mt720
    Created on : Aug  2018, 
    Author     : Sri Puji Indrayanti
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt720.jsp" %>
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
        <c:if test="${item == 'MT:720'}">
            <div id="judul">MT 720 Transfer of a Documentary Credit</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" autocomplete="off" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="720" />
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
                           <%--<div class="form-row"><span class="label_body">MF27</span><span class="label">Sequence of Total</span>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Number</span>
                                    <input type="text" name="_010_mf27_number" id="_010_mf27_number" maxlength="1" minlength="1" size="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Total</span>
                                    <input type="text" name="_011_mf27_total" id="_011_mf27_total" maxlength="1" minlength="1" size="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                </div>
                            </div>
                            <hr/>
                            <!-- MF40B -->
                             <div class="form-row"><span class="label_body">MF40B</span><span class="label">Form of Documentay Credit</span>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Type</span>
                                    <select id="_020_mf40b_type" name="_020_mf40b_type">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="IRREVOC TRANS STANDBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf40b_type'}"><c:if test="${item.detail=='IRREVOC TRANS STANDBY'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOC TRANS STANDBY</option>
                                    <option value="IRREVOCABLE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf40b_type'}"><c:if test="${item.detail=='IRREVOCABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE</option>
                                </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                    <select id="_021_mf40b_code" name="_021_mf40b_code">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="ADDING OUR CONFIRMATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf40b_code'}"><c:if test="${item.detail=='ADDING OUR CONFIRMATION'}"> selected="true" </c:if></c:if></c:forEach>>ADDING OUR CONFIRMATION</option>
                                    <option value="WITHOUT OUR CONFIRMATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf40b_code'}"><c:if test="${item.detail=='WITHOUT OUR CONFIRMATION'}"> selected="true" </c:if></c:if></c:forEach>>WITHOUT OUR CONFIRMATION</option>
                                </select>
                                </div>
                            </div>
                            <hr/>

                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Transferring Bank's Reference</span>
                                <input type="text" name="_030_mf20_Transferring_Banks_Reference" id="_030_mf20_Transferring_Banks_Reference" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf20_Transferring_Banks_Reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                           
                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Documentary Credit Number</span>
                                <input type="text" name="_040_mf21_Documentary_Credit_Number" id="_040_mf21_Documentary_Credit_Number" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf21_Documentary_Credit_Number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--MF31C-->
                            <div class="form-row"><span class="label_body">MF31C</span><span class="label">*Date of issue </span>                              
                                <input type="text" name="_050_mf31c_date_of_issue" id="_050_mf31c_date_of_issue" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf31c_date_of_issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--MF40E-->
                            <div class="form-row"><span class="label_body">MF40E</span><span class="label">Applicable Rules</span>                              
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Applicable Rules</span>
                                    <select id="_060_mf40e_applicable_rules" name="_060_mf40e_applicable_rules">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="EUCP LATEST VERSION " <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='EUCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCP LATEST VERSION</option>
                                    <option value="EUCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='EUCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCPURR LATEST VERSION</option>
                                    <option value="ISP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='ISP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>ISP LATEST VERSION</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                    <option value="UCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='UCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCP LATEST VERSION</option>
                                    <option value="UCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='UCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCPURR LATEST VERSION</option>
                                </select>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                    <input type="text" name="_061_mf40e_narrative" id="_061_mf40e_narrative" maxlength="35" minlength="1" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf40e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                </div>
                            </div>
                            <hr/>
                            
                            <!--MF31D-->
                             <div class="form-row"><span class="label_body">MF31D</span><span class="label">Date and Place of Expiry</span>   
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                <input type="text" name="_070_mf31d_date" id="_070_mf31d_date" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf31d_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Place</span>
                                <input type="text" name="_071_mf31d_place" id="_071_mf31d_place" maxlength="29" minlength="1" size="29"value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_mf31d_place'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                             </div>
                            <hr/>

                            <!-- MF52A -->
                            <div class="form-row"><span class="label_body">OF52</span><span class="label">Issuing Bank of the Original Documentary Credit</span>
                                <select id="type_of52_issuing_bank" name="type_of52_issuing_bank">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - Party Identifier - Identifire Code</option>
                                    <option value="d">D - Identifier Code - Name Address</option>
                                </select>
                                <div id="div_of52a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_081_of52a_party_identifier" id="_081_of52a_party_identifier" maxlength="34" minlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_082_of52a_identifier_code" id="_082_of52a_identifier_code" maxlength="11" minlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>

                                </div>
                                <div id="div_of52d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_083_of52d_party_identifier" id="_083_of52d_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_084_of52d_name_address" id="_084_of52d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>

                                </div>
                            </div>
                            <hr/>
                            <!--OF50B-->
                            <div class="form-row"><span class="label_body">OF50B</span><span class="label">Non-Bank Issuer  of the Original Documentary Credit</span>
                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_090_of50b_non_bank" id="_090_of50b_non_bank" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of50b_non_bank'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                           
                            <!--MF50-->
                            <div class="form-row"><span class="label_body">MF50</span><span class="label">*First beneficiary</span>
                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_100_mf50_First_Beneficiary" id="_100_mf50_First_Beneficiary" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf50_First_Beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--MF59-->
                             <div class="form-row"><span class="label_body">MF59</span><span class="label">Second Beneficiary</span>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                <input type="text" name="_110_mf59_Account" id="_110_mf59_Account" maxlength="34" minlength="1" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_mf59_Account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name Address</span>
                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_111_mf59_name_address" id="_111_mf59_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                             </div>
                            <hr/>

                            <!--MF32B-->
                             <div class="form-row"><span class="label_body">MF32B</span><span class="label">Currency Code, Amount</span>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                <input type="text" name="_120_mf32b_currency_code" id="_120_mf32b_currency_code" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_mf32b_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                <input type="text" name="_130_mf32b_amount" id="_130_mf32b_amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_130_mf32b_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(3);
                                    var nominalStylec = nominalStyle.fontcolor("red");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    document.write(nominalStylec);
                                </script>
                            </div>
                             </div>
                            <hr/>
                            
                            <!--MF39A-->
                            <div class="form-row"><span class="label_body">OF39A</span><span class="label">Percentage Credit Amount</span>
                                    <input type="checkbox" name="percentage_credit_amount_checkbox" id="percentage_credit_amount_checkbox" />
                                    <div id="check_of39a">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 1</span>
                                            <input type="text" name="_140_of39a_percentage_credit_amount_tolerance1" id="_140_of39a_percentage_credit_amount_tolerance1" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of39a_percentage_credit_amount_tolerance1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 2</span>
                                            <input type="text" name="_141_of39a_percentage_credit_amount_tolerance2" id="_141_of39a_percentage_credit_amount_tolerance2" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_of39a_percentage_credit_amount_tolerance2'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                            
                            <!--OF39C-->
                            <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_150_of39c_Additional_Amounts_Covered" id="_150_of39c_Additional_Amounts_Covered" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of39c_Additional_Amounts_Covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF41A -->
                            <div class="form-row"><span class="label_body">MF41</span><span class="label">*Available With ... By ..</span>
                                <select id="type_mf41_Available" name="type_mf41_Available">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Identifier Code - Code </option>
                                    <option value="d">D - Name and Address - Code</option>
                                    <!--<option value="d">D - Name and Address</option>-->
                                </select>
                                <div id="div_mf41a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_161_mf41a_party_identifier" id="_161_mf41a_party_identifier" maxlength="11" minlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_mf41a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                         <select id="_162_mf41a_code" name="_162_mf41a_code">
                                            <option value="">CHOOSE A TYPE 
                                            <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_mf41a_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option>
                                            <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_mf41a_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                            <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_mf41a_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                            <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_mf41a_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                            <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_162_mf41a_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                        </select>
                                    </div>           
                                </div>
                                <div id="div_mf41d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_163_mf41d_Name_and_address" id="_163_mf41d_Name_and_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_163_mf41d_Name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                        <select id="_164_mf41d_code" name="_164_mf41d_code">
                                            <option value="">CHOOSE A TYPE</option>
                                            <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_164_mf41d_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option>
                                            <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_164_mf41d_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                            <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_164_mf41d_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                            <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_164_mf41d_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                            <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_164_mf41d_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF42C-->
                            <div class="form-row"><span class="label_body">OF42C</span><span class="label">Drafts at ..</span>
                                <textarea cols="35" rows="3" maxlength="105" wrap="hard" style="resize:none;" name="_170_of42c_drafts_at" id="_170_of42c_drafts_at" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of42c_drafts_at'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            <!-- OF42A -->
                            <div class="form-row"><span class="label_body">OF42</span><span class="label">Drawee</span>
                                <select id="type_of42_drawee" name="type_of42_drawee">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Party Identifire - Identifire Code</option>
                                    <option value="d">D - Party Identifire - Name and Address</option>
                                    <!--<option value="d">D - Name and Address</option>-->
                                </select>
                                <div id="div_of42a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_181_of42a_party_identifier" id="_181_of42a_party_identifier" maxlength="34" minlength="1" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_of42a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_182_of42a_identifier_code" id="_182_of42a_identifier_code" maxlength="11" minlength="8" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_182_of42a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of42d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_183_of42d_party_identifier" id="_183_of42d_party_identifier" maxlength="34" minlength="1" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_183_of42d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_184_of42d_name_address" id="_184_of42d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_184_of42d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>                                   
                            </div>
                            <hr/>
                            
                            <!--OF42M-->
                            <div class="form-row"><span class="label_body">OF42M</span><span class="label">Mixed Payment Details</span>
                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_190_of42m_Mixed_Payment_Details" id="_190_of42m_Mixed_Payment_Details" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of42m_Mixed_Payment_Details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF42P-->
                            <div class="form-row"><span class="label_body">OF42P</span><span class="label">Negotiation/Deferred Payment Details</span>
                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_200_of42p_Negotiation_Deferred_Payment_Details" id="_200_of42p_Negotiation_Deferred_Payment_Details" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of42p_Negotiation_Deferred_Payment_Details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF43P-->
                            <div class="form-row"><span class="label_body">OF43P</span><span class="label">Partial Shipments</span>
                                <select id="_210_of43p_partial_shipment" name="_210_of43p_partial_shipment">
                                    <option value="">choose a type</option>
                                    <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of43p_partial_shipment'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option>
                                    <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of43p_partial_shipment'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                                    <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of43p_partial_shipment'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                                </select>
                            </div>
                            <hr/>
                            
                            <!--OF43T-->
                            <div class="form-row"><span class="label_body">OF43T</span><span class="label">Transhipment</span>
                                 <select id="_220_of43t_transhiment" name="_220_of43t_transhiment">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of43t_transhiment'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option>
                                    <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of43t_transhiment'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                                    <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of43t_transhiment'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                                </select>
                            </div>
                            <hr/>
                            
                            <!--OF44A-->
                            <div class="form-row"><span class="label_body">OF44A</span><span class="label">Place of Taking in Charge/Dispatch from .../Place of Receipt</span>
                                <!--<textarea name="_360_of44a_Place_of_taking_in_charge_dispatch " id="_360_of44a_Place_of_taking_in_charge_dispatch" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_of44a_Place_of_taking_in_charge_dispatch'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>-->
                                <input type="text" name="_230_of44a_place_taking_in_charge_dispatch_from_place_of_receipt" id="_230_of44a_place_taking_in_charge_dispatch_from_place_of_receipt" maxlength="65" minlength="1" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of44a_place_taking_in_charge_dispatch_from_place_of_receipt'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />

                            </div>
                            <hr/>
                            
                            <!--OF44E-->
                            <div class="form-row"><span class="label_body">OF44E</span><span class="label">Port of Loading/Airport of Departure</span>
                                <!--<textarea name="_370_of44e_port_of_loading_airport_of_departure " id="_370_of44e_port_of_loading_airport_of_departure" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_of44e_port_of_loading_airport_of_departure'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>-->
                                <input type="text" name="_240_of44e_Port_of_Loading_Airport_of_Departure" id="_240_of44e_Port_of_Loading_Airport_of_Departure" maxlength="65" minlength="1" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of44e_Port_of_Loading_Airport_of_Departure'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--OF44F-->
                            <div class="form-row"><span class="label_body">OF44F</span><span class="label">Port of Discharge/Airport of Destination</span>
                                <input type="text" name="_250_of44f_Port_of_Discharge_Airport_of_Destination" id="_250_of44f_Port_of_Discharge_Airport_of_Destination" maxlength="65" minlength="1" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of44f_Port_of_Discharge_Airport_of_Destination'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />

                            </div>
                            <hr/>

                            <!--OF44B-->
                            <div class="form-row"><span class="label_body">OF44B</span><span class="label">Place of Final Destination/For Transportation to.../Place of Delivery</span>                             
                                <input type="text" name="_260_of44b_Place_of_Final_Destination_For_Transportation_to_Place_of_Delivery" id="_260_of44b_Place_of_Final_Destination_For_Transportation_to_Place_of_Delivery" maxlength="65" minlength="1" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of44b_Place_of_Final_Destination_For_Transportation_to_Place_of_Delivery'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!--OF44C-->
                            <div class="form-row"><span class="label_body">OF44C</span><span class="label">Latest Date of Shipment</span>

                                <input type="text" name="_270_of44c_Latest_Date_of_Shipment" id="_270_of44c_Latest_Date_of_Shipment" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of44c_Latest_Date_of_Shipment'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>  
                            <hr/>

                            <!--OF44D-->
                            <div class="form-row"><span class="label_body">OF44D</span><span class="label">Shipment Period</span> 
                                <textarea cols="65" rows="6" maxlength="390" wrap="hard" style="resize:none;" name="_280_of44d_Shipment_Period" id="_280_of44d_Shipment_Period" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of44d_Shipment_Period'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF45A-->
                            <div class="form-row"><span class="label_body">OF45A</span><span class="label">Description of Goods and/or Services</span>
                                <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_290_of45a_Description_of_Goods_and_or_Services" id="_290_of45a_Description_of_Goods_and_or_Services" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of45a_Description_of_Goods_and_or_Services'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF46A-->
                            <div class="form-row"><span class="label_body">OF46A</span><span class="label">Documents Required</span>
                                <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_300_of46a_Documents_Required" id="_300_of46a_Documents_Required" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of46a_Documents_Required'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF47A-->
                            <div class="form-row"><span class="label_body">OF47A</span><span class="label">Additional Conditions</span>
                                <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_310_of47a_Additional_Conditions" id="_310_of47a_Additional_Conditions" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of47a_Additional_Conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF49G-->
                            <div class="form-row"><span class="label_body">OF49G</span><span class="label">Special Payment Conditions for Beneficiary</span>
                                <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_320_of49g_Special_Payment_Conditions_for_Beneficiary" id="_320_of49g_Special_Payment_Conditions_for_Beneficiary" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of49g_Special_Payment_Conditions_for_Beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF49H-->
                            <div class="form-row"><span class="label_body">OF49H</span><span class="label">Special Payment Conditions for Receiving Bank</span>
                                <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_330_of49h_Special_Payment_Conditions_for_Receiving_Bank" id="_330_of49h_Special_Payment_Conditions_for_Receiving_Bank" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of49h_Special_Payment_Conditions_for_Receiving_Bank'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF71D-->
                            <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_340_of71Dh_Special_Payment_Conditions_for_Receiving_Bank" id="_340_of71Dh_Special_Payment_Conditions_for_Receiving_Bank" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of71Dh_Special_Payment_Conditions_for_Receiving_Bank'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF48-->
                            <div class="form-row"><span class="label_body">OF48</span><span class="label">Period for Presentation in Days</span>
                                    <input type="checkbox" name="period_for_presentation_in_days_checkbox" id="period_for_presentation_in_days_checkbox" />
                                    <div id="check_of48">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Days</span>
                                            <input type="text" name="_350_of48_Period_for_Presentation_in_Days" id="_350_of48_Period_for_Presentation_in_Days" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_of48_Period_for_Presentation_in_Days'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                            <input type="text" name="_351_of48_Narrative" id="_351_of48_Narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_351_of48_Narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>

                            <!--MF49-->
                            <div class="form-row"><span class="label_body">MF49</span><span class="label">*Confirmation Instructions</span>
                               <select id="_360_mf49_confirmation_instruction" name="_360_mf49_confirmation_instruction">
                                    <option value="">choose a type</option>
                                    <option value="CONFIRM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_mf49_confirmation_instruction'}"><c:if test="${item.detail=='CONFIRM'}"> selected="true" </c:if></c:if></c:forEach>>CONFIRM</option>
                                    <option value="MAY ADD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_mf49_confirmation_instruction'}"><c:if test="${item.detail=='MAY ADD'}"> selected="true" </c:if></c:if></c:forEach>>MAY ADD</option>
                                    <option value="WITHOUT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_360_mf49_confirmation_instruction'}"><c:if test="${item.detail=='WITHOUT'}"> selected="true" </c:if></c:if></c:forEach>>WITHOUT</option>
                                </select>
                            </div>
                            <hr/>

                            <!-- OF58A -->
                            <div class="form-row"><span class="label_body">OF58</span><span class="label">Requested Confirmation Party</span>
                                <select id="type_of58_Requested_Confirmation_Party" name="type_of58_Requested_Confirmation_Party">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Party Identifier - Identifier Code </option>
                                    <option value="d">D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of58a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire</span>
                                        <input type="text" name="_371_of58a_party_identifire" id="_371_of58a_party_identifire" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_371_of58a_party_identifire'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifire code</span>
                                        <input type="text" name="_372_of58a_identifier_code" id="_372_of58a_identifier_code" maxlength="11" minlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_372_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>
                                </div>
                                <div id="div_of58d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire </span>
                                        <input type="text" name="_373_of58d_party_identifire" id="_373_of58d_party_identifire" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_373_of58d_party_identifire'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_374_of58d_name_address" id="_374_of58d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_374_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--OF78-->
                            <div class="form-row"><span class="label_body">OF78</span><span class="label">Instructions to the Paying/Accepting/Negotiating Bank</span>
                                <textarea cols="65" rows="12" maxlength="780" wrap="hard" style="resize:none;" name="_380_of78_Instructions_to_the_Paying" id="_380_of78_Instructions_to_the_Paying" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of78_Instructions_to_the_Paying'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!--OF57A-->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">Advise Through' Bank </span>
                                <select id="type_of57_advise_through_bank" name="type_of57_advise_through_bank">
                                    <option value="">choose a type</option>
                                    <option value="A">A - Party Identifier - Identifire Code</option>
                                    <option value="B">B - Party Identifier - Locations</option>
                                    <option value="D">D - Prty Identifier - Name Address</option>
                                </select>
                                <div id="div_of57a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire</span>
                                        <input type="text" name="_391_of57a_party_identifire" id="_391_of57a_party_identifire" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_391_of57a_party_identifire'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifire code</span>
                                        <input type="text" name="_392_of57a_identifier_code" id="_392_of57a_identifier_code" maxlength="11" minlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_392_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>
                                </div>
                                <div id="div_of57b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier </span>
                                        <input type="text" name="_393_of57b_party_identifire" id="_393_of57b_party_identifire" maxlength="34" minlength="1" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_393_of57b_party_identifire'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_394_of57b_location" id="_394_of57b_location" maxlength="35" minlength="1" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_394_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire </span>
                                        <input type="text" name="_395_of57d_party_identifire" id="_395_of57d_party_identifire" maxlength="37" size="2" minlength="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_395_of57d_party_identifire'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_396_of57d_name_address" id="_396_of57d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_396_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--OF72Z--> 
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_400_of72z_Sender_to_Receiver_Information" id="_400_of72z_Sender_to_Receiver_Information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_of72z_Sender_to_Receiver_Information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>--%>
                           
                        <!-- 1 MF27 Sequence of Total ori-->
                        <div class="form-row"><span class="label_body">MF27</span><span class="label">Sequence of Total</span>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Number</span>
                                <input type="text" name="_010_mf27_number" id="_010_mf27_number" maxlength="1" minlength="1" size="1" class="mandatory" maxlength="3" input_type="MF27 Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Total</span>
                                <input type="text" name="_011_mf27_total" id="_011_mf27_total" maxlength="1" minlength="1" size="1" class="mandatory" maxlength="3" input_type="MF27 Total" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                            </div>
                        </div>
                        <hr/>

                        <!-- 2 MF40B Form of Documentary Credit ori -->
                        <div class="form-row"><span class="label_body">MF40B</span><span class="label">Form of Documentary Credit</span>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Type</span>
                                <select id="_020_mf40b_type" name="_020_mf40b_type" class="mandatory" input_type="MF40B Type" location="Body">
                                <option value="">choose a type</option>
                                <option value="IRREVOC TRANS STANDBY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf40b_type'}"><c:if test="${item.detail=='IRREVOC TRANS STANDBY'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOC TRANS STANDBY</option>
                                <option value="IRREVOCABLE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf40b_type'}"><c:if test="${item.detail=='IRREVOCABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE</option>
                            </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Code</span>
                                <select id="_021_mf40b_code" name="_021_mf40b_code" class="mandatory" input_type="MF40B Code" location="Body">
                                <option value="">choose a type</option>
                                <option value="ADDING OUR CONFIRMATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf40b_code'}"><c:if test="${item.detail=='ADDING OUR CONFIRMATION'}"> selected="true" </c:if></c:if></c:forEach>>ADDING OUR CONFIRMATION</option>
                                <option value="WITHOUT OUR CONFIRMATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf40b_code'}"><c:if test="${item.detail=='WITHOUT OUR CONFIRMATION'}"> selected="true" </c:if></c:if></c:forEach>>WITHOUT OUR CONFIRMATION</option>
                            </select>
                            </div>
                        </div>
                        <hr/>

                        <!-- 3 MF20 Transferring Bank's Reference -->
                        <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Transferring Bank's Reference</span>
                            <input type="text" name="_030_mf20_transferring_bank_reference" id="_030_mf20_transferring_bank_reference" class="mandatory" maxlength="16" onkeypress="avoidSplChars(event)" input_type="MF20 Transferring Bank's Reference" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf20_transferring_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- 4 MF21 Documentary Credit Number -->
                        <div class="form-row"><span class="label_body">MF21</span><span class="label"><a style="color:red;text-decoration:none">*</a>Documentary Credit Number</span>
                            <input type="text" name="_040_mf21_documentary_credit_number" id="_040_mf21_documentary_credit_number" class="mandatory" maxlength="16" input_type="MF21 Documentary Credit Number" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf21_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- 5 MF31C Date of Issue -->
                        <div class="form-row"><span class="label_body">MF31C</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date of Issue</span>
                            <input type="text" name="_050_mf31c_date_of_issue" id="_050_mf31c_date_of_issue" class="mandatory" maxlength="6" placeholder="YYMMDD" input_type="MF31C Date of Issue" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf31c_date_of_issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- 6 MF40E Applicable Rules -->
                        <div class="form-row"><span class="label_body">MF40E</span><span class="label"><a style="color:red;text-decoration:none">*</a>Applicable Rules</span>
                            <select name="_060_mf40e_applicable_rules" id="_060_mf40e_applicable_rules" class="mandatory" input_type="MF40E Applicable Rules" location="Body">
                                <option value="">choose a type</option>
                                <option value="UCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='UCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCP LATEST VERSION</option>
                                <option value="UCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='UCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>UCPURR LATEST VERSION</option>
                                <option value="EUCP LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='EUCP LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCP LATEST VERSION</option>
                                <option value="EUCPURR LATEST VERSION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='EUCPURR LATEST VERSION'}"> selected="true" </c:if></c:if></c:forEach>>EUCPURR LATEST VERSION</option>
                                <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf40e_applicable_rules'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                            </select>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative (if OTHR)</span>
                                <textarea name="_061_mf40e_narrative" id="_061_mf40e_narrative" rows="2" maxlength="35"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf40e_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                        </div>
                        <hr/>

                        <!-- 7 MF31D Date and Place of Expiry -->
                        <div class="form-row"><span class="label_body">MF31D</span><span class="label">Date and Place of Expiry</span>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Date</span>
                                <input type="text" name="_070_mf31d_date_of_expiry" id="_070_mf31d_date_of_expiry" class="mandatory" maxlength="6" placeholder="YYMMDD" input_type="MF31D Date and Place of Expiry" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf31d_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Place</span>
                                <input type="text" name="_071_mf31d_place_of_expiry" id="_071_mf31d_place_of_expiry" class="mandatory" maxlength="29" placeholder="Place" input_type="MF31D Date and Place of Expiry" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_mf31d_place_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <hr/>

                        <!-- 8 OF52a Issuing Bank of the Original Documentary Credit -->
                        <div class="form-row"><span class="label_body">OF52a</span><span class="label">Issuing Bank of the Original Documentary Credit</span>
                            <select id="type_of52_issuing_bank" name="type_of52_issuing_bank" input_type="OF52 Issuing Bank of the Original Documentary Credit" location="Body">
                                <option value="">choose a type</option>
                                <option value="a">A - Party Identifier - Identifier Code</option>
                                <option value="d">D - Identifier Code - Name Address</option>
                            </select>
                            <div id="div_of52a">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_081_of52a_party_identifier" id="_081_of52a_party_identifier" maxlength="34" minlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                    <input type="text" name="_082_of52a_identifier_code" id="_082_of52a_identifier_code" class="mandatory" maxlength="11" minlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                </div>

                            </div>
                            <div id="div_of52d">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_083_of52d_party_identifier" id="_083_of52d_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name Address</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_084_of52d_name_address" id="_084_of52d_name_address" class="mandatory" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>

                            </div>
                        </div>
                        <hr/> 
                        
                        <!-- 9 OF50B-->
                        <div class="form-row"><span class="label_body">OF50B</span><span class="label">Non-Bank Issuer  of the Original Documentary Credit</span>
                            <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_090_of50b_non_bank_issuer_of_the_original_documentary_credit" id="_090_of50b_non_bank_issuer_of_the_original_documentary_credit" input_type="OF50B Non-Bank Issuer  of the Original Documentary Credit" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of50b_non_bank_issuer_of_the_original_documentary_credit'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 10 MF50 First Beneficiary --> 
                        <div class="form-row"><span class="label_body">MF50</span><span class="label"><a style="color:red;text-decoration:none">*</a>First Beneficiary</span>
                            <textarea name="_100_mf50_name_address" id="_100_mf50_name_address" rows="4" class="mandatory" maxlength="140" input_type="MF50 First Beneficiary" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf50_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 11 MF59 Second Beneficiary -->
                        <div class="form-row"><span class="label_body">MF59</span><span class="label">Second Beneficiary</span>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                <input type="text" name="_110_mf59_account" id="_110_mf59_account" maxlength="34" input_type="MF59 Second Beneficiary" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_mf59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name & Address</span>
                                <textarea name="_111_mf59_name_address" id="_111_mf59_name_address" rows="4" class="mandatory" maxlength="140" input_type="MF59 Second Beneficiary" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                        </div>
                        <hr/>

                        <!-- 12 MF32B Currency Code, Amount -->
                        <div class="form-row"><span class="label_body">MF32B</span><span class="label"><a style="color:red;text-decoration:none">*</a>Currency</span>
                            <input type="text" name="_120_mf32b_currency" id="_120_mf32b_currency" class="mandatory" onkeypress="return textonly(event)" maxlength="3" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Currency Code, Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Amount</span>
                            <input type="text" name="_121_mf32b_amount" id="_121_mf32b_amount" class="mandatory" onblur="cek_koma(this);" maxlength="15" onpaste="return false" ondrop="return false" style="text-transform: uppercase;" oninput="this.value = this.value.toUpperCase();" input_type="MF32B Currency Code, Amount" location="Body" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onkeypress="return numbersonly(event, '_120_mf32b_currency');" />
                            <font style="margin-left: 50px"></font>
                            <script>
                                function formatUang(n, currency) {
                                    if (isNaN(n)) { return ""; }
                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                }
                                var number2 = document.getElementById('_121_mf32b_amount').value;
                                if (number2) {
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    if (nominal !== "") {
                                        document.write(nominal.fontsize(2).fontcolor("blue"));
                                    }
                                }
                            </script>
                        </div>
                        <hr/>

                        <!-- 13 OF39A Percentage Credit Amount Tolerance -->
                        <div class="form-row"><span class="label_body">OF39A</span><span class="label">Percentage Credit Amount Tolerance</span>
                            <input type="checkbox" name="percentage_credit_amount_checkbox" id="percentage_credit_amount_checkbox" />
                            <div id="check_of39a">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 1</span>
                                    <input type="text" name="_130_of39a_percentage_credit_amount_tolerance1" id="_130_of39a_percentage_credit_amount_tolerance1" class="mandatory" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of39a_percentage_credit_amount_tolerance1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 2</span>
                                    <input type="text" name="_131_of39a_percentage_credit_amount_tolerance2" id="_131_of39a_percentage_credit_amount_tolerance2" class="mandatory" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_131_of39a_percentage_credit_amount_tolerance2'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>
                        <hr/>

                        <!-- 14 OF39C Additional Amounts Covered -->
                        <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                            <textarea name="_140_of39c_additional_amounts_covered" id="_140_of39c_additional_amounts_covered" rows="4" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of39c_additional_amounts_covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 15 MF41A Available With ... By ... -->
                        <div class="form-row"><span class="label_body">MF41a</span><span class="label"><a style="color:red;text-decoration:none">*</a>Available With ... By ...</span>
                                <select id="type_mf41_available_with_by" name="type_mf41_available_with_by" input_type="MF41 Available With ... By ..." location="Body" class="mandatory">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Identifier Code - Code</option> <!-- - Ordering Customer-->
                                    <option value="d">D - Name and Address - Code</option>
                                </select>
                                <div id="div_mf41a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Identifier Code</span>
                                        <input type="text" name="_151_mf41a_party_identifier" id="_151_mf41a_party_identifier" class="mandatory" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_151_mf41a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Code</span>
                                        <select id="_152_mf41a_code" name="_152_mf41a_code" class="mandatory">
                                            <option value="">choose a code</option>
                                            <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_152_mf41a_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option> <!-- - Ordering Customer-->
                                            <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_152_mf41a_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                            <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_152_mf41a_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                            <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_152_mf41a_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                            <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_152_mf41a_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                        </select>
                                    </div>
                                </div>
                                <div id="div_mf41d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_153_mf41d_name_and_address" id="_153_mf41d_name_and_address" class="mandatory"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_153_mf41d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label"><a style="color:red;text-decoration:none">*</a>Code</span>
                                        <select id="_154_mf41d_code" name="_154_mf41d_code" input_type="MF41A Available, Code" location="Body">
                                            <option value="">CHOOSE A TYPE</option>
                                            <option value="BY ACCEPTANCE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_154_mf41d_code'}"><c:if test="${item.detail=='BY ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>BY ACCEPTANCE</option>
                                            <option value="BY DEF PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_154_mf41d_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                            <option value="BY MIXED PYMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_154_mf41d_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                            <option value="BY NEGOTIATION" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_154_mf41d_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                            <option value="BY PAYMENT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_154_mf41d_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                        <!-- 16 OF42C Drafts at ... -->
                        <div class="form-row"><span class="label_body">OF42C</span><span class="label">Drafts at ...</span>
                            <textarea name="_160_of42c_drafts_at" id="_160_of42c_drafts_at" rows="3" maxlength="105"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of42c_drafts_at'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 17 OF42A Drawee -->
                        <div class="form-row"><span class="label_body">OF42A</span><span class="label">Drawee</span>
                            <select id="type_of42_drawee" name="type_of42_drawee">
                                <option value="">choose a type</option>
                                <option value="a">A - Party Identifier - Identifier Code</option>
                                <option value="d">D - Party Identifier - Name and Address</option>
                            </select>
                            <div id="div_of42a_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_171_of42a_party_identifier" id="_171_of42a_party_identifier" maxlength="34" minlength="1" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of42a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                    <input type="text" name="_172_of42a_identifier_code" id="_172_of42a_identifier_code" maxlength="11" minlength="8" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_of42a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div id="div_of42d_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_173_of42d_party_identifier" id="_173_of42d_party_identifier" maxlength="34" minlength="1" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_of42d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_174_of42d_name_address" id="_174_of42d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_of42d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>
                        </div>
                        <hr/>

                        <!-- 18 OF42M Mixed Payment Details -->
                        <div class="form-row"><span class="label_body">OF42M</span><span class="label">Mixed Payment Details</span>
                            <textarea name="_180_of42m_mixed_payment_details" id="_180_of42m_mixed_payment_details" rows="4" maxlength="140" input_type="OF42M Mixed Payment Details" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of42m_mixed_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 19 OF42P Negotiation/Deferred Payment Details -->
                        <div class="form-row"><span class="label_body">OF42P</span><span class="label">Negotiation/Deferred Payment Details</span>
                            <textarea name="_190_of42p_negotiation_deferred_payment_details" id="_190_of42p_negotiation_deferred_payment_details" rows="4" maxlength="140" input_type="OF42P Negotiation/Deferred Payment Details" location="Body"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of42p_negotiation_deferred_payment_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 20 OF43P Partial Shipments -->
                        <div class="form-row"><span class="label_body">OF43P</span><span class="label">Partial Shipments</span>
                            <select name="_200_of43p_partial_shipments" id="_200_of43p_partial_shipments">
                                <option value="">choose a type</option>
                                <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of43p_partial_shipments'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option>
                                <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of43p_partial_shipments'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                                <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_200_of43p_partial_shipments'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                            </select>
                        </div>
                        <hr/>

                        <!-- 21 OF43T Transhipment -->
                        <div class="form-row"><span class="label_body">OF43T</span><span class="label">Transhipment</span>
                            <select name="_210_of43t_transhipment" id="_210_of43t_transhipment">
                                <option value="">choose a type</option>
                                <option value="ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of43t_transhipment'}"><c:if test="${item.detail=='ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>ALLOWED</option>
                                <option value="CONDITIONAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of43t_transhipment'}"><c:if test="${item.detail=='CONDITIONAL'}"> selected="true" </c:if></c:if></c:forEach>>CONDITIONAL</option>
                                <option value="NOT ALLOWED" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_210_of43t_transhipment'}"><c:if test="${item.detail=='NOT ALLOWED'}"> selected="true" </c:if></c:if></c:forEach>>NOT ALLOWED</option>
                            </select>
                        </div>
                        <hr/>

                        <!-- 22 OF44A Place of Taking in Charge/Dispatch/Receipt -->
                        <div class="form-row"><span class="label_body">OF44A</span><span class="label">Place of Taking in Charge / Dispatch from / Place of Receipt</span>
                            <textarea name="_220_of44a_place_of_taking_in_charge_dispatch_from_place_of_receipt" id="_220_of44a_place_of_taking_in_charge_dispatch_from_place_of_receipt" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_220_of44a_place_of_taking_in_charge_dispatch_from_place_of_receipt'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 23 OF44E Port of Loading / Airport of Departure -->
                        <div class="form-row"><span class="label_body">OF44E</span><span class="label">Port of Loading / Airport of Departure</span>
                            <textarea name="_230_of44e_port_of_loading_airport_of_departure" id="_230_of44e_port_of_loading_airport_of_departure" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_230_of44e_port_of_loading_airport_of_departure'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 24 OF44F Port of Discharge / Airport of Destination -->
                        <div class="form-row"><span class="label_body">OF44F</span><span class="label">Port of Discharge / Airport of Destination</span>
                            <textarea name="_240_of44f_port_of_discharge_airport_of_destination" id="_240_of44f_port_of_discharge_airport_of_destination" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_of44f_port_of_discharge_airport_of_destination'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 25 OF44B Place of Final Destination / Place of Delivery -->
                        <div class="form-row"><span class="label_body">OF44B</span><span class="label">Place of Final Destination / Place of Delivery</span>
                            <textarea name="_250_of44b_place_of_final_destination_for_transportation_to_place_of_delivery" id="_250_of44b_place_of_final_destination_for_transportation_to_place_of_delivery" rows="3" maxlength="140"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_250_of44b_place_of_final_destination_for_transportation_to_place_of_delivery'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 26 OF44C Latest Date of Shipment -->
                        <div class="form-row"><span class="label_body">OF44C</span><span class="label">Latest Date of Shipment</span>
                            <input type="text" name="_260_of44c_latest_date_of_shipment" id="_260_of44c_latest_date_of_shipment" maxlength="6" placeholder="YYMMDD" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_260_of44c_latest_date_of_shipment'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                        </div>
                        <hr/>

                        <!-- 27 OF44D Shipment Period -->
                        <div class="form-row"><span class="label_body">OF44D</span><span class="label">Shipment Period</span>
                            <textarea name="_270_of44d_shipment_period" id="_270_of44d_shipment_period" rows="3" maxlength="390"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_270_of44d_shipment_period'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 28 OF45A Description of Goods and/or Services -->
                        <div class="form-row"><span class="label_body">OF45A</span><span class="label">Description of Goods and/or Services</span>
                            <textarea name="_280_of45a_description_of_goods_and_or_services" id="_280_of45a_description_of_goods_and_or_services" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_280_of45a_description_of_goods_and_or_services'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 29 OF46A Documents Required -->
                        <div class="form-row"><span class="label_body">OF46A</span><span class="label">Documents Required</span>
                            <textarea name="_290_of46a_documents_required" id="_290_of46a_documents_required" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_290_of46a_documents_required'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 30 OF47A Additional Conditions -->
                        <div class="form-row"><span class="label_body">OF47A</span><span class="label">Additional Conditions</span>
                            <textarea name="_300_of47a_additional_conditions" id="_300_of47a_additional_conditions" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of47a_additional_conditions'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 31 OF49G Special Payment Conditions for Beneficiary -->
                        <div class="form-row"><span class="label_body">OF49G</span><span class="label">Special Payment Conditions for Beneficiary</span>
                            <textarea name="_310_of49g_special_payment_conditions_for_beneficiary" id="_310_of49g_special_payment_conditions_for_beneficiary" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of49g_special_payment_conditions_for_beneficiary'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 32 OF49H Special Payment Conditions for Bank Only -->
                        <div class="form-row"><span class="label_body">OF49H</span><span class="label">Special Payment Conditions for Bank Only</span>
                            <textarea name="_320_of49h_special_payment_conditions_for_bank_only" id="_320_of49h_special_payment_conditions_for_bank_only" rows="6" maxlength="6500"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of49h_special_payment_conditions_for_bank_only'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 33 OF71D Charges -->
                        <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                            <textarea name="_330_of71d_charges" id="_330_of71d_charges" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of71d_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 34 OF48 Period for Presentation in Days ori-->
                        <div class="form-row"><span class="label_body">OF48</span><span class="label">Period for Presentation in Days</span>
                            <input type="checkbox" name="period_for_presentation_in_days_checkbox" id="period_for_presentation_in_days_checkbox" />
                            <div id="check_of48">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Days</span>
                                    <input type="text" name="_340_of48_days" id="_340_of48_days" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of48_days'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Narrative</span>
                                    <input type="text" name="_341_of48_narrative" id="_341_of48_narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_341_of48_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                        </div>
                        <hr/>

                        <!-- 35 MF49 Confirmation Instructions -->
                        <div class="form-row"><span class="label_body">MF49</span><span class="label"><a style="color:red;text-decoration:none">*</a>Confirmation Instructions</span>
                            <select id="_350_mf49_confirmation_instructions" name="_350_mf49_confirmation_instructions" class="mandatory" input_type="MF49 Confirmation Instructions" location="Body">
                                <option value="">choose a type</option>
                                <option value="CONFIRM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_mf49_confirmation_instructions'}"><c:if test="${item.detail=='CONFIRM'}"> selected="true" </c:if></c:if></c:forEach>>CONFIRM</option>
                                <option value="MAY ADD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_mf49_confirmation_instructions'}"><c:if test="${item.detail=='MAY ADD'}"> selected="true" </c:if></c:if></c:forEach>>MAY ADD</option>
                                <option value="WITHOUT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_350_mf49_confirmation_instructions'}"><c:if test="${item.detail=='WITHOUT'}"> selected="true" </c:if></c:if></c:forEach>>WITHOUT</option>
                            </select>
                        </div>
                        <hr/>

                        <!-- 36 OF58a Requested Confirmation Party ori-->
                        <div class="form-row"><span class="label_body">OF58a</span><span class="label">Requested Confirmation Party</span>
                            <select id="type_of58_Requested_Confirmation_Party" name="type_of58_Requested_Confirmation_Party">
                                <option value="">choose a type</option>
                                <option value="a">A - Party Identifier - Identifier Code </option>
                                <option value="d">D - Party Identifier - Name and Address</option>
                            </select>
                            <div id="div_of58a_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                    <input type="text" name="_361_of58a_party_identifier" id="_361_of58a_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_361_of58a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier code</span>
                                    <input type="text" name="_362_of58a_identifier_code" id="_362_of58a_identifier_code" maxlength="11" minlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_362_of58a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                </div>
                            </div>
                            <div id="div_of58d_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier </span>
                                    <input type="text" name="_363_of58d_party_identifier" id="_363_of58d_party_identifier" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_363_of58d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_364_of58d_name_address" id="_364_of58d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_364_of58d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>
                        </div>
                        <hr/>

                        <!-- 37 OF78 Instructions to Paying/Accepting/Negotiating Bank -->
                        <div class="form-row"><span class="label_body">OF78</span><span class="label">Instructions to the Paying/Accepting/Negotiating Bank</span>
                            <textarea name="_370_of78_instructions_to_the_paying_accepting_negotiating_bank" id="_370_of78_instructions_to_the_paying_accepting_negotiating_bank" rows="6" maxlength="780"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_370_of78_instructions_to_the_paying_accepting_negotiating_bank'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 38 OF78D Instructions from Intermediary Bank -->
                        <div class="form-row"><span class="label_body">OF78D</span><span class="label">Instructions from Intermediary Bank</span>
                            <textarea name="_380_of78d_instructions_from_transferring_bank" id="_380_of78d_instructions_from_transferring_bank" rows="6" maxlength="780"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_of78d_instructions_from_transferring_bank'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- 39 OF57a Advise Through Bank ori -->
                        <div class="form-row"><span class="label_body">OF57</span><span class="label">Advise Through' Bank </span>
                            <select id="type_of57_advise_through_bank" name="type_of57_advise_through_bank">
                                <option value="">choose a type</option>
                                <option value="A">A - Party Identifier - Identifire Code</option>
                                <option value="B">B - Party Identifier - Locations</option>
                                <option value="D">D - Party Identifier - Name Address</option>
                            </select>
                            <div id="div_of57a">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire</span>
                                    <input type="text" name="_391_of57a_party_identifire" id="_391_of57a_party_identifire" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_391_of57a_party_identifire'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifire code</span>
                                    <input type="text" name="_392_of57a_identifier_code" id="_392_of57a_identifier_code" maxlength="11" minlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_392_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                </div>
                            </div>
                            <div id="div_of57b">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier </span>
                                    <input type="text" name="_393_of57b_party_identifire" id="_393_of57b_party_identifire" maxlength="34" minlength="1" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_393_of57b_party_identifire'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                    <input type="text" name="_394_of57b_location" id="_394_of57b_location" maxlength="35" minlength="1" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_394_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <div id="div_of57d">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire </span>
                                    <input type="text" name="_395_of57d_party_identifire" id="_395_of57d_party_identifire" maxlength="37" size="2" minlength="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_395_of57d_party_identifire'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_396_of57d_name_address" id="_396_of57d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_396_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>
                        </div>
                        <hr/>

                        <!-- 40 OF72Z Sender to Receiver Information -->
                        <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                            <textarea name="_400_of72z_sender_to_receiver_information" id="_400_of72z_sender_to_receiver_information" rows="6" maxlength="210"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_400_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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