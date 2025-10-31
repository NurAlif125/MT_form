<%-- 
    Document   : mt765
    Created on : Feb 27, 2024, 5:46:20 PM
    Author     : LENOVO
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt765.jsp" %>

<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<!--<link rel="icon" href="images/favicon.ico"/>-->
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:765'}">
            <div id="judul">MT 765 Guarantee/Standby Letter of Credit Demand</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="765" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li><a href="#" rel="view1">Header</a></li>
                        <li><a href="#" rel="view2">Body</a></li>
                        <li><a href="#" rel="view3">Comment</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            
                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Transaction Reference Number</span>
                                <input type="text" name="_010_mf20_transaction_reference_number" id="_010_mf20_transaction_reference_number" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_transaction_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                                <input type="text" name="_011_mf21_related_reference" id="_011_mf21_related_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>
                            
                             <!-- OF23 -->
                            <div class="form-row"><span class="label_body">OF23</span><span class="label">Beneficiary Reference Number</span>
                                <input type="text" name="_012_of23_beneficiary_reference_number" id="_012_of23_beneficiary_reference_number" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_of23_beneficiary_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                             <!-- MF52 -->
                            <div class="form-row"><span class="label_body">MF52 </span><span class="label">Issuer</span>
                                <select id="type_mf52_issuing_bank" name="type_mf52_issuing_bank">
                                    <option value="">choose a type</option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Name and Address</option>
                                </select>
                                <div id="div_mf52a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_020_mf52a_party_identifier" id="_020_mf52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_021_mf52a_identifier_code" id="_021_mf52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                     <!-- 
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_112_mf52a_address" id="_112_mf52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_112_mf52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                     -->
                                </div>
                                <div id="div_mf52d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_022_mf52d_party_identifier" id="_022_mf52d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_022_mf52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea name="_023_mf52d_name_and_address" id="_023_mf52d_name_and_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_023_mf52d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                             <!-- M59/59A -->
                            <div class="form-row"><span class="label_body">OF59</span><span class="label">Beneficiary Customer</span>
                                <select id="type_of59_59a_seq_b" name="type_of59_59a_seq_b">
                                    <option value="">choose a type</option>
                                    <option value="59">1 - Field 59</option>
                                    <option value="59a">2 - Field 59A</option>
                                </select>
                                <div id="div_of59_seq_b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_025_of59_account" id="_025_of59_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_025_of59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea name="_026_of59a_name_and_address" id="_026_of59a_name_and_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_026_of59a_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of59a_seq_b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                        <input type="text" name="_030_of59a_account" id="_030_of59a_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of59a_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_031_of59a_identifier_code" id="_031_of59a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_of59a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <!---
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_084_of59a_address" id="_084_of59a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of59a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    -->
                                </div>
                            </div>
                            <hr/>
                            
                            <!-- OF31L -->
                            <div class="form-row"><span class="label_body">OF31L</span><span class="label">Date of Demand</span>
                                <input type="text" name="_040_of31l_date_of_demand" id="_040_of31l_date_of_demand" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of31l_date_of_demand'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!-- MF22G -->
                            <div class="form-row"><span class="label_body">MF22G</span><span class="label">*Demand Type</span>
                                <select id="_050_mf22g_demand_type" name="_050_mf22g_demand_type">
                                    <option value="">choose a code</option>
                                    <option value="PAEX" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf22g_demand_type'}"><c:if test="${item.detail=='PAEX'}"> selected="true" </c:if></c:if></c:forEach>>Pay or extend</option> <!-- - Ordering Customer-->
                                    <option value="PAYM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf22g_demand_type'}"><c:if test="${item.detail=='PAYM'}"> selected="true" </c:if></c:if></c:forEach>>Pay only</option>                                 
                                </select>
                            </div>
                            <hr/>
                            
                            <!-- MF32B -->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label">*Transaction Currency</span>
                                <input type="text" name="_056_mf32b_currency" id="_056_mf32b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_056_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                <input type="text" name="_057_mf32b_amount" id="_057_mf32b_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_057_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!-- OF78 -->
                            <div class="form-row"><span class="label_body">OF78</span><span class="label">Additional Amount Information</span>
                                <textarea cols="65" rows="12" maxlength="780" wrap="hard" style="resize:none;" name="_060_of78_additional_amount_information" id="_060_of78_additional_amount_information"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of78_additional_amount_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!-- OF49A -->
                             <div class="form-row"><span class="label_body">OF49A </span><span class="label">Code</span>
                                <select id="_065_of49a_code" name="_065_of49a_code">
                                    <option value="COMP" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of49a_code'}"><c:if test="${item.detail=='COMP'}"> selected="true" </c:if></c:if></c:forEach>>COMP</option> 
                                    <option value="INCP" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of49a_code'}"><c:if test="${item.detail=='INCP'}"> selected="true" </c:if></c:if></c:forEach>>INCP</option> 
                                </select>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Text</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="4" maxlength="140" style="resize:none;" name="_066_of49a_narrative" id="_066_of49a_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_066_of49a_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                             <!--OF77-->
                            <div class="form-row"><span class="label_body">OF77</span><span class="label">Presentation Completion Details</span>
                                <textarea onkeypress="avoidSplChars(event)" cols="35" rows="6" maxlength="210" style="resize:none;" name="_070_of77_presentation_completion_details" id="_070_of77_presentation_completion_details"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of77_presentation_completion_details'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                             <!-- OF31E -->
                            <div class="form-row"><span class="label_body">OF31E</span><span class="label">Requested New Date of Expiry</span>
                                <input type="text" name="_120_of31e_Date" id="_120_of31e_Date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of31e_Date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!-- OF31R -->
                            <div class="form-row"><span class="label_body">OF31R</span><span class="label">Requested New Date of Expiry of Local Undertaking</span>
                                <input type="text" name="_130_of31r_Date" id="_130_of31r_Date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of31r_Date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF56A-->
                            <div class="form-row"><span class="label_body">OF56</span><span class="label">Intermediary </span>
                                <select id="type_of56_" name="type_of56_">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Party Identifier - Identifire Code</option>
                                    <option value="b">B - Party Identifier - Locations</option>
                                    <option value="d">D - Party Identifier - Name Address</option>
                                </select>
                                <div id="div_of56a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire</span>
                                        <input type="text" name="_086_of56a_party_identifier" id="_086_of56a_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_086_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifire code</span>
                                        <input type="text" name="_087_of56a_identifier_code" id="_087_of56a_identifier_code" maxlength="11" minlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_087_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>
                                </div>
                                <div id="div_of56b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier </span>
                                        <input type="text" name="_090_of56b_party_identifier" id="_090_of56b_party_identifier" maxlength="34" minlength="1" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of56b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_091_of56b_location" id="_091_of56b_location" maxlength="35" minlength="1" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of56b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of56d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire </span>
                                        <input type="text" name="_096_of56d_party_identifier" id="_096_of56d_party_identifier" maxlength="37" size="2" minlength="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_097_of56d_name_and_address" id="_097_of56d_name_and_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_097_of56d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF57A-->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Institution </span>
                                <select id="type_of57_" name="type_of57_">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Party Identifier - Identifire Code</option>
                                    <option value="b">B - Party Identifier - Locations</option>
                                    <option value="d">D - Party Identifier - Name Address</option>
                                </select>
                                <div id="div_of57a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire</span>
                                        <input type="text" name="_100_of57a_party_identifier" id="_100_of57a_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifire code</span>
                                        <input type="text" name="_101_of57a_identifier_code" id="_101_of57a_identifier_code" maxlength="11" minlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>
                                </div>
                                <div id="div_of57b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier </span>
                                        <input type="text" name="_106_of57b_party_identifier" id="_106_of57b_party_identifier" maxlength="34" minlength="1" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_106_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_107_of57b_location" id="_107_of57b_location" maxlength="35" minlength="1" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_107_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire </span>
                                        <input type="text" name="_110_of57d_party_identifier" id="_110_of57d_party_identifier" maxlength="37" size="2" minlength="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_111_of57d_name_and_address" id="_111_of57d_name_and_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_of57d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                             <!-- OF72Z -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                 <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_116_of72z_sender_to_receiver_information" id="_116_of72z_sender_to_receiver_information"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_116_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                             <!-- OF23X -->
                            <div class="form-row"><span class="label_body">OF23X</span><span class="label">File Identification Code</span>
                                <select id="_120_of23x_file_identification_code" name="_120_of23x_file_identification_code">
                                    <option value="">choose a code</option>
                                    <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of23x_file_identification_code'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>Courier delivery</option> 
                                    <option value="EMAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of23x_file_identification_code'}"><c:if test="${item.detail=='EMAL'}"> selected="true" </c:if></c:if></c:forEach>>Email transfer</option>
                                    <option value="FACT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of23x_file_identification_code'}"><c:if test="${item.detail=='FACT'}"> selected="true" </c:if></c:if></c:forEach>>SWIFTNet FileAct</option>
                                    <option value="FAXT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of23x_file_identification_code'}"><c:if test="${item.detail=='FAXT'}"> selected="true" </c:if></c:if></c:forEach>>Fax transfer</option>
                                    <option value="HOST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of23x_file_identification_code'}"><c:if test="${item.detail=='HOST'}"> selected="true" </c:if></c:if></c:forEach>>Host-to-Host</option>
                                    <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of23x_file_identification_code'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>Postal delivery</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of23x_file_identification_code'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>Other delivery channel</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">File Name or Reference</span>
                                <input type="text" name="_121_of23x_file_name_or_reference" id="_121_of23x_file_name_or_reference" maxlength="65" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_of23x_file_name_or_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
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