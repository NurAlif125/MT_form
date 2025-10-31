<%-- 
    Document   : mt896
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mtn96.jsp" %>
<%@ include file="banner_image.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<c:forEach var="item" items="${role}">
    <c:if test="${item == 'MT:896'}">
        <div id="tabs">
            <!-- Tabs -->
            <h3>MT 896 Answers</h3>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="896" />
                <ul>
                    <li><a href="#tabs-1">Header</a></li>
                    <li><a href="#tabs-2">Body</a></li>
                    <li><a href="#tabs-3">Comment</a></li>
                </ul>
                <div id="tabs-1">
                    <%@ include file="header_mt.jsp" %>
                </div>
                <div id="tabs-2">
                    <!-- MF20 -->
                    <div class="form-row"><span class="label_body">MF20</span><span class="label">*Transaction Reference Number</span>
                        <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF21 -->
                    <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                        <input type="text" name="_011_mf21_" id="_011_mf21_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf21_'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                    </div>
                    <hr/>

                    <!-- MF76 -->
                    <div class="form-row"><span class="label_body">MF76</span><span class="label">*Answers</span>
                        <textarea name="_012_mf76_" id="_012_mf76_"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_mf76_'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF77A -->
                    <div class="form-row"><span class="label_body">OF77A</span><span class="label">Narrative</span>
                        <textarea name="_013_of77a_" id="_013_of77a_"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_013_of77a_'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OF11 -->
                    <div class="form-row"><span class="label_body">OF11</span><span class="label">MT and Date</span>
                        <select id="type_of11" name="type_of11">
                            <option value="">choose a type</option>
                            <option value="r">R - MT and Date of the Original Message</option>
                            <option value="s">S - MT and Date of the Original Message</option>
                        </select>
                        <div id="div_of11r_">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*MT Number</span>
                                <input type="text" name="_014_of11r_mt_number" id="_014_of11r_mt_number" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_014_of11r_mt_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                <input type="text" name="_015_of11r_date" id="_015_of11r_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_015_of11r_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Session Number(ISN)</span>
                                <input type="text" name="_016_of11r_session_number" id="_016_of11r_session_number" maxlength="10" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_016_of11r_session_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                        <div id="div_of11s_">
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*MT Number</span>
                                <input type="text" name="_017_of11s_mt_number" id="_017_of11s_mt_number" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_017_of11s_mt_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                <input type="text" name="_018_of11s_date" id="_018_of11s_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_018_of11s_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Session Number(ISN)</span>
                                <input type="text" name="_019_of11s_session_number" id="_019_of11s_session_number" maxlength="10" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_019_of11s_session_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF79 -->
                    <div class="form-row"><span class="label_body">OF79</span><span class="label">Narrative Description of the Original Message to Which the Answer Relates</span>
                        <textarea name="_020_of79_narrative" id="_020_of79_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_of79_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>

                    <!-- OMSG -->
                    <div class="form-row"><span class="label_body">OMSG</span><span class="label">&nbsp;</span>
                        <textarea name="_021_of11r_omsg" id="_021_of11r_omsg"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_of11r_omsg'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                    </div>
                    <hr/>
                </div>
                <div id="tabs-3">
                    <%@ include file="comment_mt.jsp" %>
                </div>
                <%@ include file="button_action.jsp" %>
                <br/><br/>
            </form>
        </div>
    </c:if>
</c:forEach>
<%@ include file="footer_1.jsp" %>