<%--
    Document   : mt900
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt900.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:900'}">
            <div id="judul">MT 900 Confirmation of Debit</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="900" />
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
                                <input type="text" name="_010_mf20_" id="_010_mf20_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                                <input type="text" name="_011_mf21_" id="_011_mf21_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf21_'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF25 -->
                            <div class="form-row"><span class="label_body">MF25</span><span class="label">*Account Identification</span>
                                <input type="text" name="_012_mf25_" id="_012_mf25_" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_mf25_'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF32A -->
                            <div class="form-row"><span class="label_body">MF32A</span><span class="label">*Value Date</span>
                                <input type="text" name="_013_mf32a_date" id="_013_mf32a_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_013_mf32a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency Code</span>
                                <input type="text" name="_014_mf32a_currency" id="_014_mf32a_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_014_mf32a_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                <input type="text" name="_015_mf32a_amount" id="_015_mf32a_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_015_mf32a_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- OF52 -->
                            <div class="form-row"><span class="label_body">OF52</span><span class="label">Ordering Institution</span>
                                <select id="type_of52" name="type_of52">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Ordering Institution - BIC</option>
                                    <option value="d">D - Ordering Institution - Name and Address</option>
                                </select>
                                <div id="div_of52a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_016_of52a_party_identifier" id="_016_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_016_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_017_of52a_identifier_code" id="_017_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_017_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_018_of52a_address" id="_018_of52a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_018_of52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of52d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_019_of52d_party_identifier" id="_019_of52d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_019_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea name="_020_of52d_name_address" id="_020_of52d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF72 -->
                            <div class="form-row"><span class="label_body">OF72</span><span class="label">Sender to Receiver Information</span>
                                <textarea name="_021_of72_" id="_021_of72_" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_of72_'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
