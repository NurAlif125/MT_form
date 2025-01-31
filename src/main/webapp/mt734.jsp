<%-- 
    Document   : mt103
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt734.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:734'}">
            <div id="judul">MT 734 Advice of Refusal</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="734" />
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
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sender's TRN</span>
                                <input type="text" name="_010_mf20_Senders_TRN" id="_010_mf20_Senders_TRN" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_Senders_TRN'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Presenting Bank's Reference</span>
                                <input type="text" name="_020_mf21_Presenting_Banks_Reference" id="_020_mf21_Presenting_Banks_Reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_Presenting_Banks_Reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF32A -->
                            <div class="form-row"><span class="label_body">MF32A</span><span class="label">*Date and Amount of Utilisation </span>
                                <input type="text" name="_030_mf32a_date" id="_030_mf32a_date" maxlength="6" minlength="6" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                <input type="text" name="_031_mf32a_currency" id="_031_mf32a_currency" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>                             
                                <input type="text" name="_032_mf32a_amount" id="_032_mf32a_amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_032_mf32a_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(5);
                                    ar nominalStylec = nominalStyle.fontcolor("red");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    document.write(nominalStylec);
                                </script>
                            </div>
                            <hr/>

                            <!-- OF73A -->
                            <div class="form-row"><span class="label_body">OF73A</span><span class="label">Charges Claimed</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_040_of73a_Charges_Claimed" id="_040_of73a_Charges_Claimed" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of73a_Charges_Claimed'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF33A -->
                            <div class="form-row"><span class="label_body">OF33A</span><span class="label">Total Amount Claimed</span>
                                <select id="type_of33a_Total_Amount_Claimed" name="type_of33a_Total_Amount_Claimed">
                                    <option value="">choose a type</option>
                                    <option value="A">F33A - Date - Currency - Amount </option>
                                    <option value="B">F33B - Currency - Amount </option>
                                </select>
                                <div id="div_of33a_a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                        <input type="text" name="_050_of33a_Date" id="_050_of33a_Date" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of33a_Date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                        <input type="text" name="_051_of33a_Currency" id="_051_of33a_Currency" maxlength="3" minlength="3" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of33a_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_052_of33a_Amount" id="_052_of33a_Amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of33a_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of33a_b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                        <input type="text" name="_053_of33b_Currency" id="_053_of33b_Currency" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of33b_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_054_of33b_Amount" id="_054_of33b_Amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of33b_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF57A -->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Bank</span>
                                <select id="type_of57a_Account_With_Bank" name="type_of57a_Account_With_Bank">
                                    <option value="">choose a type</option>
                                    <option value="A">OF57A - Party Identifier - Identifier Code</option>
                                    <option value="B">OF57B - Party Identifier - Location</option>
                                    <option value="D">OF57D - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of57a_a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_060_of57a_Party_Identifier" id="_060_of57a_Party_Identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of57a_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_061_of57a_Identifier_Code" id="_061_of57a_Identifier_Code" maxlength="11" minlength="8" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of57a_Identifier_Code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57a_b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_062_of57b_Party_Identifier" id="_062_of57b_Party_Identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_of57b_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_063_of57b_Location" id="_063_of57b_Location" maxlength="35" minlength="1" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_of57b_Location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of57a_d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_064_of57d_Party_Identifier" id="_064_of57d_Party_Identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_of57d_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_065_of57d_Name_and_Address" id="_065_of57d_Name_and_Address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_of57d_Name_and_Address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF72Z -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_070_of72z_Sender_to_Receiver_Information" id="_070_of72z_Sender_to_Receiver_Information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of72z_Sender_to_Receiver_Information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- MF77J -->
                            <div class="form-row"><span class="label_body">MF77J</span><span class="label">Discrepancies</span>
                                <textarea cols="50" rows="70" maxlength="3500" wrap="hard" style="resize:none;" name="_080_mf77j_Discrepancies" id="_080_mf77j_Discrepancies" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf77j_Discrepancies'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- MF77B -->
                            <div class="form-row"><span class="label_body">MF77B</span><span class="label">Disposal of Documents</span>
                                <textarea cols="35" rows="3" maxlength="105" wrap="hard" style="resize:none;" name="_090_mf77b_Disposal_of_Documents" id="_090_mf77b_Disposal_of_Documents" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf77b_Disposal_of_Documents'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                        </div>
                        <div id="view3" class="tabcontent">
                            <%@ include file="comment_mt.jsp" %>
                        </div>
                        <div id="view4" class="tabcontent">
                            <%@ include file="history_mt.jsp" %>
                        </div>
                        <%@ include file="button_action.jsp" %>
                    </div>
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>
<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>