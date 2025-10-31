<%-- 
    Document   : mt103
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt456.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:456'}">
            <div id="judul">MT 456  Date and Face Amount of Financial Document</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="456" />
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

                            <!-- OF25 -->
                            <div class="form-row"><span class="label_body">OF25</span><span class="label">*Account Identification</span>
                                <input type="text" name="_010_of25_Account_Identification" id="_010_of25_Account_Identification" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_of25_Account_Identification'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- OF52A -->
                            <div class="form-row"><span class="label_body">OF52A</span><span class="label">*Sender of Cash Letter</span>
                                <select id="type_of52_Sender_of_Cash_Letter" name="type_of52_Sender_of_Cash_Letter">
                                    <option value="">choose a type</option>
                                    <option value="a">A - additional information</option>
                                    <option value="b">B - continuation of additional information</option>
                                    <option value="d">D - additional information</option>
                                </select>
                                <div id="div_of52a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_020_of52a_Party_Identifier" id="_020_of52a_Party_Identifier" maxlength="37" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of52a_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_021_of52a_Identifier_Code" id="_021_of52a_Identifier_Code" maxlength="11" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_of52a_Identifier_Code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of52b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_022_of52b_Party_Identifier" id="_022_of52b_Party_Identifier" maxlength="37" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_022_of52b_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_023_of52b_Location" id="_023_of52b_Location" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_023_of52b_Location'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of52d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_024_of52d_Party_Identifier" id="_024_of52d_Party_Identifier" maxlength="37" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_024_of52d_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_025_of52d_Name_and_Address" id="_025_of52d_Name_and_Address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_025_of52d_Name_and_Address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF72 -->
                            <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender of Cash Letter</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_030_of72_Sender_of_Cash_Letter" id="_030_of72_Sender_of_Cash_Letter" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of72_Sender_of_Cash_Letter'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- MF2O -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Transaction_Reference_Number</span>
                                <input type="text" name="_040_mf20_Transaction_Reference_Number" id="_040_mf20_Transaction_Reference_Number" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf20_Transaction_Reference_Number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                                <input type="text" name="_050_mf21_Related_Reference" id="_050_mf21_Related_Reference" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf21_Related_Reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF32A -->
                            <div class="form-row"><span class="label_body">MF32A</span><span class="label">*Date and Face Amount of Financial Document</span>
                                <select id="type_mf32a_Date_and_Face_Amount_of_Financial_Document" name="type_mf32a_Date_and_Face_Amount_of_Financial_Document">
                                    <option value="">choose a type</option>
                                    <option value="A">A - Date - Currency - Amount</option>
                                    <option value="B">B - Currency - Amount</option>
                                </select>
                                <div id="div_mf32a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Value Date</span>
                                        <input type="text" name="_060_mf32a_date" id="_060_mf32a_date" maxlength="6" minlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                        <input type="text" name="_061_mf32a_currency" id="_061_mf32a_currency" maxlength="3" minlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>                             
                                        <input type="text" name="_062_mf32a_amount" id="_062_mf32a_amount" maxlength="15"  minlength="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_mf32b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                        <input type="text" name="_063_mf32b_currency" id="_063_mf32b_currency" maxlength="3" minlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>                             
                                        <input type="text" name="_064_mf32b_amount" id="_064_mf32b_amount" maxlength="15" minlength="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_064_mf32b_amount').value;
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

                            <!-- MF33D -->
                            <div class="form-row"><span class="label_body">MF33D</span><span class="label">*Total Amount Debited</span>
                                <select id="type_mf33_Total_Amount_Debited" name="type_mf33_Total_Amount_Debited">
                                    <option value="">choose a type</option>
                                    <option value="d">D - Amount</option>
                                </select>
                                <div id="div_mf33d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Value Date</span>
                                        <input type="text" name="_070_mf33d_date" id="_070_mf33d_date" maxlength="6" minlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf33d_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                        <input type="text" name="_071_mf33d_currency" id="_071_mf33d_currency" maxlength="3" minlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_mf33d_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>                             
                                        <input type="text" name="_072_mf33d_amount" id="_072_mf33d_amount" maxlength="15" minlength="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_mf33d_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_072_mf33d_amount').value;
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

                            <!-- OF71B -->
                            <div class="form-row"><span class="label_body">OF71B</span><span class="label">Fee</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_080_of71b_Fee" id="_080_of71b_Fee" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of71b_Fee'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- MF77A -->
                            <div class="form-row"><span class="label_body">MF77A</span><span class="label">*Reason for Dishonour</span>
                                <textarea cols="35" rows="20" maxlength="700" wrap="hard" style="resize:none;" name="_090_mf77a_Reason_for_Dishonour" id="_090_mf77a_Reason_for_Dishonour" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf77a_Reason_for_Dishonour'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- MF77D -->
                            <div class="form-row"><span class="label_body">MF77D</span><span class="label">*Details of Dishonoured Item</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_100_mf77d_Details_of_Dishonoured_Item" id="_100_mf77d_Details_of_Dishonoured_Item" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_mf77d_Details_of_Dishonoured_Item'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF72 -->
                            <div class="form-row"><span class="label_body">OF72</span><span class="label">*Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_110_of72_Sender_to_Receiver_Information" id="_110_of72_Sender_to_Receiver_Information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of72_Sender_to_Receiver_Information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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