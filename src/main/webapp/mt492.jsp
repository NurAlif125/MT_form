<%-- 
    Document   : mt492
    Created on : Aug 16, 2018
    Author     : Andhita Deara
--%>


<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt492.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:492'}">
            <div id="judul">MT 492 Request for Cancellation</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="492" />
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
                                <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">*Related Reference</span>
                                <input type="text" name="_020_mf21_related_reference" id="_020_mf21_related_reference" maxlength="16" size="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF11S -->
                            <div class="form-row"><span class="label_body">MF11S</span><span class="label">*MT Number</span>
                                <input type="text" name="_030_mf11s_mt_number" id="_030_mf11s_mt_number" maxlength="3" size="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf11s_mt_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                <input type="text" name="_031_mf11s_date" id="_031_mf11s_date" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf11s_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Session Number - ISN</span>
                                <input type="checkbox" name="session_number_isn_checkbox" id="session_number_isn_checkbox" />
                                <div id="check_mf11s">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Session Number</span>
                                        <input type="text" name="_032_mf11s_session_number" id="_032_mf11s_session_number" maxlength="4" size="4" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf11s_session_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*ISN</span>
                                        <input type="text" name="_033_mf11s_isn" id="_033_mf11s_isn" maxlength="6" size="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_mf11s_isn'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF79 -->
                            <div class="form-row"><span class="label_body">OF79</span><span class="label">Narrative Description of the Original Message</span>
                                <textarea cols="50" rows="35" maxlength="1750" wrap="hard" style="resize:none;" name="_040_of79_narrative_description_original_message" id="_040_of79_narrative_description_original_message"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of79_narrative_description_original_message'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                            <!-- NOTAG -->
                            <div class="form-row"><span class="label_body">NOTAG</span><span class="label">Copy of at least the Mandatory Fields of the Original Message</span>
                                <textarea name="_050_notag_copy_of_mandatory_ori_msg" id="_050_notag_copy_of_mandatory_ori_msg"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_notag_copy_of_mandatory_ori_msg'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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
<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>