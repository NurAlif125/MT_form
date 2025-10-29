<%--
    Document   : mt985
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt985.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:985'}">
            <div id="judul">MT 985 Status Enquiry</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="985" />
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
                                <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF57 -->
                            <div class="form-row"><span class="label_body">OF57</span><span class="label">Account With Institution</span>
                                <select id="type_of57_" name="type_of57_">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Account With Inst - BIC</option>
                                    <option value="b">B - Account With Inst - Location</option>
                                    <option value="d">D - Account With Inst - Name and Address</option>
                                </select>
                                <div id="div_of57a_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_170_of57a_party_identifier" id="_170_of57a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of57a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_171_of57a_identifier_code" id="_171_of57a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of57a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Address Expansion</span>
                                        <textarea name="_172_of57a_address" id="_172_of57a_address" disabled="true"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_172_of57a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of57b_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_173_of57b_party_identifier" id="_173_of57b_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_173_of57b_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                                        <input type="text" name="_174_of57b_location" id="_174_of57b_location" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_174_of57b_location'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                                <div id="div_of57d_">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_176_of57d_party_identifier" id="_176_of57d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_176_of57d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea name="_177_of57d_name_address" id="_177_of57d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_177_of57d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- MF59 -->
                            <div class="form-row"><span class="label_body">MF59</span><span class="label">Enquired Party - Account</span>
                                <input type="text" name="_180_mf59_account" id="_180_mf59_account" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_180_mf59_account'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                <textarea name="_181_mf59_name_address" id="_181_mf59_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_181_mf59_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- OF75 -->
                            <div class="form-row"><span class="label_body">OF75</span><span class="label">Queries</span>
                                <textarea name="_190_of75_queries" id="_190_of75_queries"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_190_of75_queries'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
