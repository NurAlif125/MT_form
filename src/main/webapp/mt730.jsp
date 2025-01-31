<%-- 
    Document   : mt103
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt730.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:730'}">
            <div id="judul">MT 730 Acknowledgement</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="730" />
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

                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sender's Reference</span>
                                <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <%-- OF13C -->
                            <div class="form-row"><span class="label_body">OF13C</span><span class="label">(Code)(Time indic)(Sign)(Time off)</span>
                                <input type="button" name="_020_of13c_add" id="_020_of13c_add" value="Add" />
                                <input type="button" name="_021_of13c_remove" id="_021_of13c_remove" value="Remove" />
                            </div>
                            <div id="div_of13c_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                    <input type="text" name="_022_of13c_code" id="_022_of13c_code" maxlength="19" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_022_of13c_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                            </div>
                            <hr/>--%>

                            <!-- MF23B -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Receiver Reference</span>
                                <input type="text" name="_020_mf21_receiver_reference" id="_020_mf21_receiver_reference" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_receiver_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- OF26T -->
                            <div class="form-row"><span class="label_body">OF25</span><span class="label">Account Identification</span>
                                <input type="text" name="_030_of25_account_identification" id="_030_of25_account_identification" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of25_account_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <div class="form-row"><span class="label_body">MF30</span><span class="label">*Date of message being Acknowledged</span>
                                <input type="text" name="_040_mf30_date_of_message_being_acknowledge" id="_040_mf30_date_of_message_being_acknowledge" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf30_date_of_message_being_acknowledge'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!--OF32A-->
                            <div class="form-row"><span class="label_body">OF32</span><span class="label">Amount of charges</span>
                                <select id="type_of32a_amount_of_charges" name="type_of32a_amount_of_charges">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="b">B - Currency - Amount</option>
                                    <option value="d">D - Date - Currency - Amount</option>
                                </select>
                                <div id="div_mf32b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" name="_051_of32b_currency" id="_051_of32b_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_052_of32b_amount" id="_052_of32b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_052_of32b_amount').value;
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
                                <div id="div_mf32d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" name="_053_of32d_date" id="_053_of32d_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of32d_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" name="_054_of32d_currency" id="_054_of32d_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of32d_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>                             
                                        <input type="text" name="_055_of32d_amount" id="_055_of32d_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_055_of32d_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_055_of32d_amount').value;
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
                            </div>
                            <hr/>

                            <!--OF57-->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Bank</span>
                                <select id="type_of57_request_confirmation_party" name="type_of57_request_confirmation_party">
                                    <option value="">CHOOSE A TYPE </option>
                                    <!--                                        - Sender's Correspondent-->
                                    <option value="a">A - Identifire Code - Code </option>
                                    <option value="d">D - Name and Address - Code</option>
                                    <!--<option value="d">D - Name and Address</option>-->
                                </select>
                                <div id="div_of57a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_061_of57a_party_identifier" id="_061_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code</span>
                                        <input type="text" name="_062_of57a_identifier_code" id="_062_of57a_identifier_code" maxlength="14" minlength="1" size="14" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>           
                                </div>
                                <div id="div_of57d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_063_of57d_party_identifier" id="_063_of57d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_064_of57d_name_and_address" id="_064_of57d_name_and_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of57d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_070_of71d_Special_Payment_Conditions_for_Receiving_Bank" id="_070_of71d_Special_Payment_Conditions_for_Receiving_Bank" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of71d_Special_Payment_Conditions_for_Receiving_Bank'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                             <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_080_of72z_sender_to_receiver_information" id="_080_of72z_sender_to_receiver_information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <div class="form-row"><span class="label_body">OF79Z</span><span class="label">Narrative</span>
                                <textarea cols="50" rows="35" maxlength="1750" wrap="hard" style="resize:none;" name="_090_of79z_Narrative" id="_090_of79z_Narrative" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of79z_Narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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