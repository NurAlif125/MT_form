<%-- 
    Document   : mt744
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt744.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:744'}">
            <div id="judul">MT 744 Notice of Non-Conforming Reimbursement Claim</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="744" />
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
                                <input type="text" name="_010_mf20_Senders_Reference" id="_010_mf20_Senders_Reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_Senders_Reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Claiming Bank's Reference </span>
                                <input type="text" name="_020_mf21_Claiming_Banks_Reference" id="_020_mf21_Claiming_Banks_Reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_Claiming_Banks_Reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!-- MF52A -->
                            <div class="form-row"><span class="label_body">MF52 </span><span class="label">*Issuing Bank</span>
                                <select id="type_mf52_Issuing_Bank" name="type_mf52_Issuing_Bank">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Identifier Code</option>
                                    <option value="d">D - Name and Address</option>
                                </select>
                                <div id="div_mf52a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_030_mf52a_Party_Identifier" id="_030_mf52a_Party_Identifier" maxlength="37" minlength="2" size="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf52a_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_031_mf52a_Identifier_Code" id="_031_mf52a_Identifier_Code" maxlength="11" minlength="8" size="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf52a_Identifier_Code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_mf52d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_032_mf52d_Party_Identifier" id="_032_mf52d_Party_Identifier" maxlength="35" minlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf52d_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_033_mf52d_Name_and_Address" id="_033_mf52d_Name_and_Address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_mf52d_Name_and_Address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            
                             <!-- MF21A -->
                            <div class="form-row"><span class="label_body">MF21A</span><span class="label">*Documentary Credit Number</span>
                                <input type="text" name="_040_mf21a_Documentary_Credit_Number" id="_040_mf21a_Documentary_Credit_Number" maxlength="16" minlength="1" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf21a_Documentary_Credit_Number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!-- OF31C -->
                            <div class="form-row"><span class="label_body">OF31C</span><span class="label">Date of Issue</span>
                                <input type="text" name="_050_of31c_Date_of_Issue" id="_050_of31c_Date_of_Issue" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of31c_Date_of_Issue'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!-- MF34A -->
                            <div class="form-row"><span class="label_body">MF34</span><span class="label">*Total Amount Claimed</span>
                                <select id="type_mf34a_Total_Amount_Claimed" name="type_mf34a_Total_Amount_Claimed">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Date - Currency - Amount</option>
                                    <option value="b">B - Currency - Amount</option>
                                </select>
                                <div id="div_mf34a_a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                        <input type="text" name="_060_mf34a_Date" id="_060_mf34a_Date" maxlength="6" minlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf34a_Date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                        <input type="text" name="_061_mf34a_Currency" id="_061_mf34a_Currency" maxlength="3" minlength="3" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf34a_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_062_mf34a_Amount" id="_062_mf34a_Amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_mf34a_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_062_mf34a_Amount').value;
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
                                <div id="div_mf34a_b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                        <input type="text" name="_063_mf34b_Currency" id="_063_mf34b_Currency" maxlength="3" minlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_mf34b_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_064_mf34b_Amount" id="_064_mf34b_Amount" maxlength="15" minlength="2" size="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_mf34b_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        <font style="margin-left: 50px"></font>
                                        <script langauge="javascript">
                                                function formatUang(n, currency) {
                                                    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                            }
                                            var number2 = document.getElementById('_064_mf34b_Amount').value;
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
                            
                            <!-- MF73R -->
                            <div class="form-row"><span class="label_body">MF73</span><span class="label">*Reason for Non-Payment</span>
                                <select id="type_mf73_Reason_for_Non_Payment" name="type_mf73_Reason_for_Non_Payment">
                                    <option value="">choose a type</option>
                                    <option value="r">R - Narrative</option>
                                </select>
                                <div id="div_mf73r_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                        <select id="_070_mf73r_Code" name="_070_mf73r_Code">
                                            <option value="">choose a code</option>
                                            <option value="DIFF" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf73r_Code'}"><c:if test="${item.detail=='DIFF'}"> selected="true" </c:if></c:if></c:forEach>>DIFF</option> <!-- - Ordering Customer-->
                                            <option value="DUPL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf73r_Code'}"><c:if test="${item.detail=='DUPL'}"> selected="true" </c:if></c:if></c:forEach>>DUPL</option>
                                            <option value="INSU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf73r_Code'}"><c:if test="${item.detail=='INSU'}"> selected="true" </c:if></c:if></c:forEach>>INSU</option>
                                            <option value="NAUT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf73r_Code'}"><c:if test="${item.detail=='NAUT'}"> selected="true" </c:if></c:if></c:forEach>>NAUT</option>
                                            <option value="OTHR" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf73r_Code'}"><c:if test="${item.detail=='OTHR'}"> selected="true" </c:if></c:if></c:forEach>>OTHR</option>
                                            <option value="OVER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf73r_Code'}"><c:if test="${item.detail=='OVER'}"> selected="true" </c:if></c:if></c:forEach>>OVER</option>
                                            <option value="REFE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf73r_Code'}"><c:if test="${item.detail=='REFE'}"> selected="true" </c:if></c:if></c:forEach>>REFE</option>
                                            <option value="TTNA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf73r_Code'}"><c:if test="${item.detail=='TTNA'}"> selected="true" </c:if></c:if></c:forEach>>TTNA</option>
                                            <option value="WINF" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf73r_Code'}"><c:if test="${item.detail=='WINF'}"> selected="true" </c:if></c:if></c:forEach>>WINF</option>
                                            <option value="XAMT" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_mf73r_Code'}"><c:if test="${item.detail=='XAMT'}"> selected="true" </c:if></c:if></c:forEach>>XAMT</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Narrative</span>                             
                                        <input type="text" name="_071_mf73r_Narrative" id="_071_mf73r_Narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_mf73r_Narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <hr/> 

                              <!-- MF73S -->
                            <div class="form-row"><span class="label_body">MF73S</span><span class="label">*Disposal of Reimbursement Claim</span>
                                <select id="type_mf73_Disposal_of_Reimbursement_Claim" name="type_mf73_Disposal_of_Reimbursement_Claim">
                                    <option value="">choose a type</option>
                                    <option value="s"> S - Narrative </option>
                                </select>
                                <div id="div_mf73s_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Code</span>
                                        <select id="_080_mf73s_Code" name="_080_mf73s_Code">
                                            <option value="">choose a code</option>
                                            <option value="CANC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf73s_Code'}"><c:if test="${item.detail=='CANC'}"> selected="true" </c:if></c:if></c:forEach>>CANC</option> <!-- - Ordering Customer-->
                                            <option value="HOLD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf73s_Code'}"><c:if test="${item.detail=='HOLD'}"> selected="true" </c:if></c:if></c:forEach>>HOLD</option>
                                            <option value="RETD" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_mf73s_Code'}"><c:if test="${item.detail=='RETD'}"> selected="true" </c:if></c:if></c:forEach>>RETD</option>
                                        </select>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Narrative</span>                             
                                        <input type="text" name="_081_mf73s_Narrative" id="_081_mf73s_Narrative" maxlength="35" size="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_mf73s_Narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                            </div>
                            <hr/> 
                            
                             <!-- OF71D -->
                            <div class="form-row"><span class="label_body">OF71D</span><span class="label">Reimbursing Bank's Charges</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_090_of71d_Reimbursing_Banks_Charges" id="_090_of71_Reimbursing_Banks_Charges" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_of71_Reimbursing_Banks_Charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>
                            
                             <!-- OF72Z -->
                            <div class="form-row"><span class="label_body">OF72Z</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_091_of72z_Sender_to_Receiver_Information" id="_091_of72z_Sender_to_Receiver_Information" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_of72z_Sender_to_Receiver_Information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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