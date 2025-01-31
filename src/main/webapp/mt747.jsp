<%-- 
    Document   : mt747
    Created on : Aug 8, 2018
    Author     : Andhita Deara
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt747.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:747'}">
            <div id="judul">MT 747 Amendment to an Authorisation to Reimburse</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="747" />
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
                                <div class="form-row"><span class="label_body">MF20</span><span class="label">*Documentary Credit Number</span>
                                    <input type="text" name="_010_mf20_documentary_credit_number" id="_010_mf20_documentary_credit_number" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_documentary_credit_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF21 -->
                                <div class="form-row"><span class="label_body">OF21</span><span class="label">Reimbursing Bank's Reference</span>
                                    <input type="text" name="_020_of21_reimbursing_bank_reference" id="_020_of21_reimbursing_bank_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of21_reimbursing_bank_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- MF30 -->
                                <div class="form-row"><span class="label_body">MF30</span><span class="label">*Date of the Original Authorisation to Reimburse</span>
                                    <input type="text" name="_030_mf30_date_of_authorisation_to_reimburse" id="_030_mf30_date_of_authorisation_to_reimburse" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf30_date_of_authorisation_to_reimburse'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF31E -->
                                <div class="form-row"><span class="label_body">OF31E</span><span class="label">New Date of Expiry</span>
                                    <input type="text" name="_040_of31e_new_date_of_expiry" id="_040_of31e_new_date_of_expiry" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of31e_new_date_of_expiry'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                </div>
                                <hr/>
                                
                                <!-- OF32B -->
                                <div class="form-row"><span class="label_body">OF32B</span><span class="label">Increase of Documentary Credit Amount</span>
                                    <input type="checkbox" name="increase_documentary_credit_amount_checkbox" id="increase_documentary_credit_amount_checkbox" />
                                    <div id="check_of32b">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_050_of32b_currency" id="_050_of32b_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_051_of32b_amount" id="_051_of32b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <font style="margin-left: 50px"></font>
                                            <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                }
                                                var number2 = document.getElementById('_051_of32b_amount').value;
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
                                <div class="form-row"><span class="label_body">OF33B</span><span class="label">Decrease of Documentary Credit Amount</span>
                                    <input type="checkbox" name="decrease_documentary_credit_amount_checkbox" id="decrease_documentary_credit_amount_checkbox" />
                                    <div id="check_of33b">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_060_of33b_currency" id="_060_of33b_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of33b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_061_of33b_amount" id="_061_of33b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_of33b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <font style="margin-left: 50px"></font>
                                            <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                }
                                                var number2 = document.getElementById('_061_of33b_amount').value;
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
                                
                                <!-- OF34B -->
                                <div class="form-row"><span class="label_body">OF34B</span><span class="label">New Documentary Credit Amount After Amendment</span>
                                    <input type="checkbox" name="new_credit_amount_after_amendment_checkbox" id="new_credit_amount_after_amendment_checkbox" />
                                    <div id="check_of34b">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_070_of34b_currency" id="_070_of34b_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of34b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_071_of34b_amount" id="_071_of34b_amount" maxlength="15" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of34b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <font style="margin-left: 50px"></font>
                                            <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                }
                                                var number2 = document.getElementById('_071_of34b_amount').value;
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
                                
                                <!-- OF39A -->
                                <div class="form-row"><span class="label_body">OF39A</span><span class="label">Percentage Credit Amount Tolerance</span>
                                    <input type="checkbox" name="percentage_credit_amount_checkbox" id="percentage_credit_amount_checkbox" />
                                    <div id="check_of39a">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 1</span>
                                            <input type="text" name="_080_of39a_percentage_credit_amount_tolerance1" id="_080_of39a_percentage_credit_amount_tolerance1" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of39a_percentage_credit_amount_tolerance1'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Tolerance 2</span>
                                            <input type="text" name="_081_of39a_percentage_credit_amount_tolerance2" id="_081_of39a_percentage_credit_amount_tolerance2" maxlength="2" size="2" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of39a_percentage_credit_amount_tolerance2'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- OF39C -->
                                <div class="form-row"><span class="label_body">OF39C</span><span class="label">Additional Amounts Covered</span>
                                    <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_090_of39c_additional_amount_covered" id="_090_of39c_additional_amount_covered"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of39c_additional_amount_covered'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF72Z -->
                                <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                    <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_100_of72z_sender_to_receiver" id="_100_of72z_sender_to_receiver"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of72z_sender_to_receiver'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                </div>
                                <hr/>
                                
                                <!-- OF77 -->
                                <div class="form-row"><span class="label_body">OF77</span><span class="label">Narrative</span>
                                    <textarea cols="35" rows="20" maxlength="700" wrap="hard" style="resize:none;" name="_110_of77_narrative" id="_110_of77_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of77_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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