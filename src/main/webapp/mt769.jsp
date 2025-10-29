<%-- 
    Document   : mt769
    Created on : Feb 26, 2024, 12:19:44 PM
    Author     : LENOVO
--%>



<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt769.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<!--<link rel="icon" href="images/favicon.ico"/>-->
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:769'}">
            <div id="judul">MT 769 Advice of Reduction or Release</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="769" />
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
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Transaction Reference Number</span>
                                <input type="text" name="_010_mf20_transaction_reference_number" id="_010_mf20_transaction_reference_number" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_transaction_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                                <input type="text" name="_011_mf21_related_reference" id="_011_mf21_related_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF25 -->
                            <div class="form-row"><span class="label_body">OF25</span><span class="label">Account Identification</span>
                                <input type="text" name="_012_of25_account_identification" id="_012_of25_account_identification" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_of25_account_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>      

                             <!-- OF30 -->
                            <div class="form-row"><span class="label_body">OF30</span><span class="label">Date of Reduction or Release</span>
                                <input type="text" name="_013_of30_date_of_reduction" id="_013_of30_date_of_reduction" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_013_of30_date_of_reduction'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                             <!--OF32A-->
                            <div class="form-row"><span class="label_body">OF32</span><span class="label">Amount of charges</span>
                                <select id="type_of32a_" name="type_of32a_">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="b">B - Currency - Amount</option>
                                    <option value="d">D - Date - Currency - Amount</option>
                                </select>
                                <div id="div_of32b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" name="_017_of32b_currency" id="_017_of32b_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_017_of32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_018_of32b_amount" id="_018_of32b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_018_of32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_018_of32b_amount').value;
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
                                <div id="div_of32d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" name="_019_of32d_date" id="_019_of32d_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_019_of32d_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" name="_020_of32d_currency" id="_020_of32d_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of32d_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>                             
                                        <input type="text" name="_020_of32d_amount" id="_020_of32d_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of32d_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_020_of32d_amount').value;
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

                            <!-- OF33B -->
                            <div class="form-row"><span class="label_body">OF33B</span><span class="label">Currency</span>
                                <input type="text" name="_021_of33b_currency" id="_021_of33b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_022_of33b_amount" id="_022_of33b_amount" maxlength="15" onpaste="return false" ondrop="return false" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_022_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" onblur="cek_koma(this)" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_022_of33b_amount').value;
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
                    
                            <!-- OF34B -->
                            <div class="form-row"><span class="label_body">OF34B</span><span class="label">Amount Outstanding</span>
                                <input type="checkbox" name="new_credit_amount_after_amendment_checkbox" id="new_credit_amount_after_amendment_checkbox" />
                                <div id="check_of34b">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" name="_025_of34b_currency" id="_025_of34b_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_025_of34b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_026_of34b_amount" id="_026_of34b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_026_of34b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_026_of34b_amount').value;
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

                            <!-- OF39C -->
                            <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                                <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_030_of39c_amount_specification" id="_030_of39c_amount_specification"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of39c_amount_specification'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                    
                             <!--OF57A-->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Bank</span>
                                <select id="type_of57_" name="type_of57_">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Party Identifier - Identifire Code</option>
                                    <option value="b">B - Party Identifier - Locations</option>
                                    <option value="d">D - Party Identifier - Name Address</option>
                                </select>
                                <div id="div_of57a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire</span>
                                        <input type="text" name="_031_of57a_party_identifier" id="_031_of57a_party_identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifire code</span>
                                        <input type="text" name="_032_of57a_identifier_code" id="_032_of57a_identifier_code" maxlength="11" minlength="8" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />                                     
                                    </div>
                                </div>
                                <div id="div_of57b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier </span>
                                        <input type="text" name="_100_of57b_party_identifier" id="_100_of57b_party_identifier" maxlength="34" minlength="1" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_101_of57b_location" id="_101_of57b_location" maxlength="35" minlength="1" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifire </span>
                                        <input type="text" name="_102_of57d_party_identifier" id="_102_of57d_party_identifier" maxlength="37" size="2" minlength="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_103_of57d_name_and_address" id="_103_of57d_name_and_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_of57d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            
                            <!-- OF71D -->
                            <div class="form-row"><span class="label_body">OF71D</span><span class="label">Charges</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_140_of71d_details_of_charges" id="_140_of71d_details_of_charges"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of71d_details_of_charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                             <!-- OF72Z -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                 <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_145_of72z_sender_to_receiver_information" id="_145_of72z_sender_to_receiver_information"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_145_of72z_sender_to_receiver_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                             <!-- OF23X -->
                            <div class="form-row"><span class="label_body">OF23X</span><span class="label">File Identification Code</span>
                                <select id="_149_of23x_file_identification_code" name="_149_of23x_file_identification_code">
                                    <option value="">choose a code</option>
                                    <option value="COUR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_149_of23x_file_identification_code'}"><c:if test="${item.detail=='COUR'}"> selected="true" </c:if></c:if></c:forEach>>Courier delivery</option> 
                                    <option value="EMAL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_149_of23x_file_identification_code'}"><c:if test="${item.detail=='EMAL'}"> selected="true" </c:if></c:if></c:forEach>>Email transfer</option>
                                    <option value="FACT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_149_of23x_file_identification_code'}"><c:if test="${item.detail=='FACT'}"> selected="true" </c:if></c:if></c:forEach>>SWIFTNet FileAct</option>
                                    <option value="FAXT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_149_of23x_file_identification_code'}"><c:if test="${item.detail=='FAXT'}"> selected="true" </c:if></c:if></c:forEach>>Fax transfer</option>
                                    <option value="HOST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_149_of23x_file_identification_code'}"><c:if test="${item.detail=='HOST'}"> selected="true" </c:if></c:if></c:forEach>>Host-to-Host</option>
                                    <option value="MAIL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_149_of23x_file_identification_code'}"><c:if test="${item.detail=='MAIL'}"> selected="true" </c:if></c:if></c:forEach>>Postal delivery</option>
                                    <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_149_of23x_file_identification_code'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>Other delivery channel</option>
                                </select>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">File Name or Reference</span>
                                <input type="text" name="_151_of23x_file_name_or_reference" id="_151_of23x_file_name_or_reference" maxlength="65" size="65" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_151_of23x_file_name_or_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
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