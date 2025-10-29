<%-- 
    Document   : mt103
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt422.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:422'}">
            <div id="judul">MT 422 Advice of Fate and Request for Instructions</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="422" />
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
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Sending Bank's TRN</span>
                                <input type="text" name="_010_mf20_Sending_Banks_TRN" id="_010_mf20_Sending_Banks_TRN" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_Sending_Banks_TRN'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                                <input type="text" name="_020_mf21_Related_Reference" id="_020_mf21_Related_Reference" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_Related_Reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!-- OF32 -->
                            <div class="form-row"><span class="label_body">OF32</span><span class="label">Amount of Collection</span>
                                <select id="type_of32_amount_collected" name="type_of32_amount_collected">
                                    <option value="">CHOOSE A TYPE</option>
                                    <option value="a">A - Date, Currency, Amount</option>
                                    <option value="b">B - Currency - Amount</option>
                                    <option value="k">K - Days Month - Number of Days Months - Code - Currency - Amount</option>
                                </select>
                                <div id="div_of32a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" name="_031_of32a_Date" id="_031_of32a_Date" maxlength="6" minlength="6" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_of32a_Date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" name="_032_of32a_Currency" id="_032_of32a_Currency" maxlength="3" minlength="3" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_of32a_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_033_of32a_Amount" id="_033_of32a_Amount" maxlength="15" minlength="2" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_of32a_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_033_of32a_Amount').value;
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
                                <div id="div_of32b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" name="_034_of32b_Currency" id="_034_of32b_Currency" maxlength="3" minlength="3" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_034_of32b_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_035_of32b_Amount" id="_035_of32b_Amount" maxlength="15" minlength="2" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_of32b_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                            function formatUang(n, currency) {
                                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_035_of32b_Amount').value;
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
                                 <div id="div_of32k_">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Day/Month</span>
                                            <select id="_036_of32k_day_month" name="_036_of32k_day_month">
                                                <option value="">choose a code</option>
                                                <option value="D" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_036_of32k_day_month'}"><c:if test="${item.detail=='D'}"> selected="true" </c:if></c:if></c:forEach>>D (Days)</option>
                                                <option value="M" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_036_of32k_day_month'}"><c:if test="${item.detail=='M'}"> selected="true" </c:if></c:if></c:forEach>>M (Months)</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Number of Days/Months</span>
                                            <input type="text" name="_037_of32k_number_of_days_months" id="_037_of32k_number_of_days_months" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_037_of32k_number_of_days_months'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Code</span>
                                            <select id="_038_of32k_code" name="_038_of32k_code">
                                                <option value="">choose a code</option>
                                                <option value="BE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_of32k_code'}"><c:if test="${item.detail=='BE'}"> selected="true" </c:if></c:if></c:forEach>>BE</option>
                                                <option value="CC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_of32k_code'}"><c:if test="${item.detail=='CC'}"> selected="true" </c:if></c:if></c:forEach>>CC</option>
                                                <option value="FD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_of32k_code'}"><c:if test="${item.detail=='FD'}"> selected="true" </c:if></c:if></c:forEach>>FD</option>
                                                <option value="FP" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_of32k_code'}"><c:if test="${item.detail=='FP'}"> selected="true" </c:if></c:if></c:forEach>>FP</option>
                                                <option value="GA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_of32k_code'}"><c:if test="${item.detail=='GA'}"> selected="true" </c:if></c:if></c:forEach>>GA</option>
                                                <option value="ID" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_of32k_code'}"><c:if test="${item.detail=='ID'}"> selected="true" </c:if></c:if></c:forEach>>ID</option>
                                                <option value="ST" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_of32k_code'}"><c:if test="${item.detail=='ST'}"> selected="true" </c:if></c:if></c:forEach>>ST</option>
                                                <option value="TD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_of32k_code'}"><c:if test="${item.detail=='TD'}"> selected="true" </c:if></c:if></c:forEach>>TD</option>
                                                <option value="XX" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_of32k_code'}"><c:if test="${item.detail=='XX'}"> selected="true" </c:if></c:if></c:forEach>>XX</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_039_of32k_currency" id="_039_of32k_currency" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_039_of32k_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_040_of32k_amount" id="_040_of32k_amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of32k_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                            <font style="margin-left: 50px"></font>
                                            <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                                }
                                                var number2 = document.getElementById('_040_of32k_amount').value;
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

                            <!-- OF72 -->
                            <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_050_of72_Sender_to_Receiver_Information" id="_050_of72_Sender_to_Receiver_Information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of72_Sender_to_Receiver_Information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                            <!-- OF75 -->
                            <div class="form-row"><span class="label_body">OF75</span><span class="label">Queries</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_060_of75_Queries" id="_060_of75_Queries" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of75_Queries'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                             <!-- OF76 -->
                            <div class="form-row"><span class="label_body">OF76</span><span class="label">Answers</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_060_of76_Answers" id="_060_of76_Answers" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of76_Answers'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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