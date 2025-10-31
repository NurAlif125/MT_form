<%-- 
    Document   : mt705
    Created on : Aug 2018
    Author     : Sri Puji Indrayanti
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt705.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:705'}">
            <div id="judul">MT 705 Pre-Advice of a Documentary Credit</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="705" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li><a href="#" rel="view1">Header</a></li>
                        <li><a href="#" rel="view2">Body</a></li>
                        <li><a href="#" rel="view3">Comment</a></li>
                        <li><a href="#" rel="view4">Histories</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">

                            <!-- MF40A -->
                            <div class="form-row"><span class="label_body">MF40A</span><span class="label">Form of Documentay Credit</span>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Type</span>
                                    <select id="_010_mf40a_type" name="_010_mf40a_type">
                                        <option value="">CHOOSE A TYPE</option>
                                        <option value="IRREVOCABLE"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf40a_type'}"><c:if test="${item.detail=='IRREVOCABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE</option>
                                        <option value="IRREVOCABLE TRANSFERABLE"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf40a_type'}"><c:if test="${item.detail=='IRREVOCABLE TRANSFERABLE'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE TRABSFERABLE</option>
                                        <option value="IRREVOCABLE STANBY"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf40a_type'}"><c:if test="${item.detail=='IRREVOCABLE STANBY'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOCABLE STANBY</option>
                                        <option value="IRREVOC TRANS STANBY"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf40a_type'}"><c:if test="${item.detail=='IRREVOC TRANS STANBY'}"> selected="true" </c:if></c:if></c:forEach>>IRREVOC TRANS STANBY</option>
                                    </select>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--MF20-->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Documentary Credit Number</span>
                                <input type="text" name="_020_mf20_documentary_credit_number" id="_020_mf20_documentary_credit_number" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf20_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--MF31D-->
                            <div class="form-row"><span class="label_body">MF31D</span><span class="label">Date And Place of Expiry</span>                              
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                    <input type="text" name="_030_mf31d_date" id="_030_mf31d_date" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf31d_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Place</span>
                                    <input type="text" name="_031_mf31d_place" id="_031_mf31d_place" maxlength="29"  minlength="1" size="29"value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf31d_place'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <hr/>
                            
                            <!--MF50-->
                            <div class="form-row"><span class="label_body">MF50</span><span class="label">*Applicant</span>
                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_040_mf50_applicant" id="_040_mf50_applicant" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf50_applicant'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--MF59-->
                            <div class="form-row"><span class="label_body">MF59</span><span class="label">Beneficiary</span>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                                    <input type="text" name="_050_mf59_Account" id="_050_mf59_Account" maxlength="34" minlength="1" size="34" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf59_Account'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name Address</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_051_mf59_name_address" id="_051_mf59_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                            </div>
                            <hr/>

                            <!--MF32B-->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label">Curency Code Amount</span>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                    <input type="text" name="_060_mf32b_currency_code" id="_060_mf32b_currency_code" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf32b_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                    <input type="text" name="_061_mf32b_amount" id="_061_mf32b_amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF39A-->
                            <div class="form-row"><span class="label_body">OF39A</span><span class="label">Percentage Credit Amount</span>
                                <input type="checkbox" name="percentage_credit_amount_checkbox" id="percentage_credit_amount_checkbox" />
                                <div id="check_of39a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 1</span>
                                        <input type="text" name="_070_of39a_tolerance1" id="_070_of39a_tolerance1" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of39a_tolerance1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 2</span>
                                        <input type="text" name="_071_of39a_tolerance2" id="_071_of39a_tolerance2" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of39a_tolerance2'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF39-->
                            <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_080_of39c_Additional_Amounts_Covered" id="_080_of39c_Additional_Amounts_Covered" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of39c_Additional_Amounts_Covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF41-->
                            <div class="form-row"><span class="label_body">OF41</span><span class="label">Available With ... By ..</span>
                                <select id="type_of41_Available" name="type_of41_Available">
                                    <option value="">choose a type</option>
                                    <!--                                        - Sender's Correspondent-->
                                    <option value="a">A - Identifier Code - Code </option>
                                    <option value="d">D - Name and Address - Code</option>
                                    <!--<option value="d">D - Name and Address</option>-->
                                </select>
                                <div id="div_of41a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_091_of41a_identifier_code" id="_091_of41a_identifier_code" maxlength="11" minlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of41a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Code</span>
                                        <select id="_092_of41a_code" name="_092_of41a_code">
                                            <option value="">CHOOSE A TYPE 
                                            <option value="ACCEPTANCE"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of41a_code'}"><c:if test="${item.detail=='ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>ACCEPTANCE</option>
                                            <option value="BY DEF PAYMENT"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of41a_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                            <option value="BY MIXED PYMT"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of41a_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                            <option value="BY NEGOTIATION"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of41a_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                            <option value="BY PAYMENT"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_of41a_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>

                                        </select>
                                    </div>           
                                </div>
                                <div id="div_of41d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_093_of41d_Name_and_address" id="_093_of41d_Name_and_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_of41d_Name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Code</span>
                                        <select id="_094_of41d_code" name="_094_of41d_code">
                                            <option value="">CHOOSE A TYPE</option>
                                            <option value="ACCEPTANCE"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of41d_code'}"><c:if test="${item.detail=='ACCEPTANCE'}"> selected="true" </c:if></c:if></c:forEach>>ACCEPTANCE</option>
                                            <option value="BY DEF PAYMENT"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of41d_code'}"><c:if test="${item.detail=='BY DEF PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY DEF PAYMENT</option>
                                            <option value="BY MIXED PYMT"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of41d_code'}"><c:if test="${item.detail=='BY MIXED PYMT'}"> selected="true" </c:if></c:if></c:forEach>>BY MIXED PYMT</option>
                                            <option value="BY NEGOTIATION"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of41d_code'}"><c:if test="${item.detail=='BY NEGOTIATION'}"> selected="true" </c:if></c:if></c:forEach>>BY NEGOTIATION</option>
                                            <option value="BY PAYMENT"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_094_of41d_code'}"><c:if test="${item.detail=='BY PAYMENT'}"> selected="true" </c:if></c:if></c:forEach>>BY PAYMENT</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF44-->
                            <div class="form-row"><span class="label_body">OF44A</span><span class="label">Place of Taking in Charge/Dispatch from .../Place of Receipt</span>
                                <input type="text" name="_100_of44a_place_taking_in_charge_dispatch_from_place_of_receipt" id="_100_of44a_place_taking_in_charge_dispatch_from_place_of_receipt" maxlength="65" minlength="1" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of44a_place_taking_in_charge_dispatch_from_place_of_receipt'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF44E-->
                            <div class="form-row"><span class="label_body">OF44E</span><span class="label">Port of Loading/Airport of Departure</span>
                                <input type="text" name="_110_of44e_Port_of_Loading_Airport_of_Departure" id="_110_of44e_Port_of_Loading_Airport_of_Departure" maxlength="65" minlength="1" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of44e_Port_of_Loading_Airport_of_Departure'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF44F-->
                            <div class="form-row"><span class="label_body">OF44F</span><span class="label">Port of Discharge/Airport of Destination</span>
                                <input type="text" name="_120_of44f_port_of_discharge_airport_of_destination" id="_120_of44f_port_of_discharge_airport_of_destination" maxlength="65" minlength="1" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of44f_port_of_discharge_airport_of_destination'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF44B-->
                            <div class="form-row"><span class="label_body">OF44B</span><span class="label">Place of Final Destination/For Transportation to.../Place of Delivery</span>                             
                                <input type="text" name="_130_of44b_Place_of_Final_Destination_For_Transportation_to_Place_of_Delivery" id="_130_of44b_Place_of_Final_Destination_For_Transportation_to_Place_of_Delivery" maxlength="65" minlength="1" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_130_of44b_Place_of_Final_Destination_For_Transportation_to_Place_of_Delivery'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF44C-->
                            <div class="form-row"><span class="label_body">OF44C</span><span class="label">Latest Date of Shipment</span>
                                <input type="text" name="_140_of44c_Latest_Date_of_Shipment" id="_140_of44c_Latest_Date_of_Shipment" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of44c_Latest_Date_of_Shipment'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>  
                            <hr/>
                            
                            <!--OF44D-->
                            <div class="form-row"><span class="label_body">OF44D</span><span class="label">Shipment Period</span>
                                <textarea cols="65" rows="6" maxlength="390" wrap="hard" style="resize:none;" name="_150_of44d_Shipment_Period" id="_150_of44d_Shipment_Period" rows="6" cols="65"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_150_of44d_Shipment_Period'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>  
                            <hr/>
                            
                            <!--OF45A-->
                            <div class="form-row"><span class="label_body">OF45A</span><span class="label">Description of Goods and/or Services</span>
                                <textarea cols="65" rows="100" maxlength="6500" wrap="hard" style="resize:none;" name="_160_of45a_Description_of_Goods_and_or_Services" id="_160_of45a_Description_of_Goods_and_or_Services" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of45a_Description_of_Goods_and_or_Services'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF57-->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">Advise Through' Bank </span>
                                <select id="type_of57_advise_through_bank" name="type_of57_advise_through_bank">
                                    <option value="">choose a type</option>
                                    <option value="A">A - Party Identifier - Identifire Code</option>
                                    <option value="B">B - Party Identifier - Locations</option>
                                    <option value="D">D - Prty Identifier - Name Address</option>
                                </select>
                                <div id="div_of57a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire</span>
                                        <input type="text" name="_171_of57a_party_identifire" id="_171_of57a_party_identifire" maxlength="34" minlength="1" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of57a_party_identifire'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifire code</span>
                                        <input type="text" name="_172_of57a_identifier_code" id="_172_of57a_identifier_code" maxlength="34" minlength="1" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire </span>
                                        <input type="text" name="_173_of57b_party_identifire" id="_173_of57b_party_identifire" maxlength="34" minlength="1" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_of57b_party_identifire'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_174_of57b_location" id="_174_of57b_location" maxlength="35" minlength="1" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire </span>
                                        <input type="text" name="_175_of57d_party_identifire" id="_175_of57d_party_identifire" maxlength="34" size="1" minlength="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_175_of57d_party_identifire'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_176_of57d_name_address" id="_176_of57d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_176_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                            <!--OF79Z-->
                            <div class="form-row"><span class="label_body">OF79Z</span><span class="label">Narrative</span>
                                <textarea cols="50" rows="35" maxlength="1750" wrap="hard" style="resize:none;" name="_180_of79z_narrative" id="_180_of79z_narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_of79z_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!--OF72Z-->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_190_of72z_Sender_to_Receiver_Information" id="_190_of72z_Sender_to_Receiver_Information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of72z_Sender_to_Receiver_Information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

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