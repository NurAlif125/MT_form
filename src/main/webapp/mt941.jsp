<%--
    Document   : mt941
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt941.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:941'}">
            <div id="judul">MT 941 Balance Report</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="941" />
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
                                <input type="text" name="_010_mf20_" id="_010_mf20_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">Related Reference</span>
                                <input type="text" name="_011_mf21_" id="_011_mf21_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf21_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF25 -->
                            <div class="form-row"><span class="label_body">MF25</span><span class="label">*Account Identification</span>
                                <input type="text" name="_012_mf25_" id="_012_mf25_" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_mf25_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF28 -->
                            <div class="form-row"><span class="label_body">MF28</span><span class="label">*(Stat Number)(Seq Number)</span>
                                <input type="text" name="_013_mf28_statement_sequence_number" id="_013_mf28_statement_sequence_number" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_013_mf28_statement_sequence_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF13D -->
                            <div class="form-row"><span class="label_body">OF13D</span><span class="label">Indication - (Date)(Time)</span>
                                <input type="text" name="_020_of13d_date_time" id="_020_of13d_date_time" maxlength="10" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of13d_date_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">(Sign)(Offset)</span>
                                <input type="text" name="_021_of13d_sign_offset" id="_021_of13d_sign_offset" maxlength="5" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_of13d_sign_offset'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF60F -->
                            <div class="form-row"><span class="label_body">OF60F</span><span class="label">Opening Balance - D/C Mark</span>
                                <input type="text" name="_030_of60f_mark" id="_030_of60f_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of60f_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                <input type="text" name="_031_of60f_date" id="_031_of60f_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_of60f_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" name="_032_of60f_currency" id="_032_of60f_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_of60f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_033_of60f_amount" id="_033_of60f_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_of60f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF90D -->
                            <div class="form-row"><span class="label_body">OF90D</span><span class="label">Sum of Entries - Number</span>
                                <input type="text" name="_040_of90d_number" id="_040_of90d_number" maxlength="5" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of90d_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" name="_041_of90d_currency" id="_041_of90d_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of90d_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_042_of90d_amount" id="_042_of90d_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_of90d_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF90C -->
                            <div class="form-row"><span class="label_body">OF90C</span><span class="label">Sum of Entries - Number</span>
                                <input type="text" name="_050_of90c_number" id="_050_of90c_number" maxlength="5" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of90c_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" name="_051_of90c_currency" id="_051_of90c_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of90c_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_052_of9c_amount" id="_052_of9c_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of9c_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF62F -->
                            <div class="form-row"><span class="label_body">MF62F</span><span class="label">Booked Funds - D/C Mark</span>
                                <input type="text" name="_060_mf62f_mark" id="_060_mf62f_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf62f_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                <input type="text" name="_061_mf62f_date" id="_061_mf62f_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf62f_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" name="_062_mf62f_currency" id="_062_mf62f_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_mf62f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_063_mf62f_amount" id="_063_mf62f_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_mf62f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF64 -->
                            <div class="form-row"><span class="label_body">OF64</span><span class="label">Available Funds - D/C Mark</span>
                                <input type="text" name="_070_of64_mark" id="_070_of64_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of64_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                <input type="text" name="_071_of64_date" id="_071_of64_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of64_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" name="_072_of64_currency" id="_072_of64_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of64_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_073_of64_amount" id="_073_of64_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of64_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF65 -->
                            <div class="form-row"><span class="label_body">OF65</span><span class="label">Forward Available Balance</span>
                                <input type="button" name="_070_of65_add" id="_070_of65_add" value="Add" />
                                <input type="button" name="_071_of65_remove" id="_071_of65_remove" value="Remove" />
                            </div>
                            <div id="div_of65_">
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">D/C Mark</span>
                                    <input type="text" name="_072_of65_mark" id="_072_of65_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of65_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                    <input type="text" name="_073_of65_date" id="_073_of65_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of65_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                    <input type="text" name="_074_of65_currency" id="_074_of65_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_074_of65_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                    <input type="text" name="_075_of65_amount" id="_075_of65_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_075_of65_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF86 -->
                            <div class="form-row"><span class="label_body">OF86</span><span class="label">Information to Account Owner</span>
                                <textarea name="_080_of86_information" id="_080_of86_information"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of86_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
