<%--
    Document   : mt490
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mtn90.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:490'}">
            <div id="judul">MT 490 Advice of Charges, Interest and Other Adjustments</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="490" />
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
                                <input type="text" name="_010_mf20_Transaction_Reference_Number" id="_010_mf20_Transaction_Reference_Number" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_Transaction_Reference_Number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF21 -->
                            <div class="form-row"><span class="label_body">OF21</span><span class="label">*Related Reference</span>
                                <input type="text" name="_020_mf21_Related_Reference" id="_020_mf21_Related_Reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_Related_Reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF25 -->
                            <div class="form-row"><span class="label_body">MF25</span><span class="label">*Account Identification</span>
                                <input type="text" name="_030_mf25_Account_Identification" id="_030_mf25_Account_Identification" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf25_Account_Identification'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF32 -->
                            <div class="form-row"><span class="label_body">MF32</span><span class="label">*Value Date, Currency Code, Amount</span>
                                <select id="type_mf32_" name="type_mf32_">
                                    <option value="">choose a type</option>
                                    <option value="c">C - Value Date, Currency Code, Amount</option>
                                    <option value="d">D - Value Date, Currency Code, Amount</option>
                                </select>
                                <div id="div_mf32c_">
                                    <div class="form-row"><span class="label_body">MF32C</span><span class="label">*Value Date</span>
                                        <input type="text" name="_040_mf32c_Date" id="_040_mf32c_Date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf32c_Date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                        <input type="text" name="_041_mf32c_Currency" id="_041_mf32c_Currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_mf32c_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_042_mf32c_Amount" id="_042_mf32c_Amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf32c_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                                <div id="div_mf32d_">
                                    <div class="form-row"><span class="label_body">MF32D</span><span class="label">*Value Date</span>
                                        <input type="text" name="_043_mf32d_Date" id="_043_mf32d_Date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_mf32d_Date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                        <input type="text" name="_044_mf32d_Currency" id="_044_mf32d_Currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_044_mf32d_Currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                        <input type="text" name="_045_mf32d_Amount" id="_045_mf32d_Amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_045_mf32d_Amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF52 -->
                            <div class="form-row"><span class="label_body">OF52 </span><span class="label">Ordering Institution</span>
                                <select id="type_of52_" name="type_of52_">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Ordering Institution - BIC</option>
                                    <option value="d">D - Ordering Institution - Name and Address</option>
                                </select>
                                <div id="div_of52a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_050_mf52a_Party_Identifier" id="_050_mf52a_Party_Identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf52a_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_051_mf52a_Identifier_Code" id="_051_mf52a_Identifier_Code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_mf52a_Identifier_Code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_054_mf52a_Address_expansion" id="_054_mf52a_Address_expansion" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_mf52a_Address_expansion'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of52d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_052_mf52d_Party_Identifier" id="_052_mf52d_Party_Identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_mf52d_Party_Identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_053_mf52d_Name_and_Address" id="_053_mf52d_Name_and_Address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_mf52d_Name_and_Address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- MF71B -->
                            <div class="form-row"><span class="label_body">MF71B</span><span class="label">*Details of Charges</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_060_mf71b_Details_Of_Charges" id="_060_mf71b_Details_Of_Charges"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf71b_Details_Of_Charges'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF72 -->
                            <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                <textarea cols="35" rows="6" maxlength="210" wrap="hard" style="resize:none;" name="_070_of72_Sender_To_Receiver_Information" id="_070_of72_Sender_To_Receiver_Information"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of72_Sender_To_Receiver_Information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                        </div>
                        <div id="view3" class="tabcontent">
                            <%@ include file="comment_mt.jsp" %>
                        </div>
                        <%@ include file="button_action.jsp" %>
                    </div>
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>
