<%--
    Document   : mt942
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt942.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<link href="css/MT.css" rel="stylesheet" type="text/css"/>

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:942'}">
            <div id="judul">MT 942 Interim Transaction Report</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="942" />
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
                                <input type="text" name="_010_mf20_" id="_010_mf20_" maxlength="16" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF21 -->
                            <div class="form-row"><span class="label_body">OF21</span><span class="label">Related Reference</span>
                                <input type="text" name="_011_mf21_" id="_011_mf21_" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf21_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF25 -->
                            <div class="form-row"><span class="label_body">MF25</span><span class="label">*Account Identification</span>
                                <input type="text" name="_012_mf25_" id="_012_mf25_" maxlength="35" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_mf25_'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF28C -->
                            <div class="form-row"><span class="label_body">MF28C</span><span class="label">*(Stat Number)(Seq Number)</span>
                                <input type="text" name="_013_mf28c_statement_sequence_number" id="_013_mf28c_statement_sequence_number" maxlength="11" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_013_mf28c_statement_sequence_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- MF34F -->
                            <div class="form-row"><span class="label_body">MF34F</span><span class="label">Floor Limit Indc - *Currency</span>
                                <input type="text" name="_030_mf34f_currency" id="_030_mf34f_currency" maxlength="3" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf34f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">D/C Mark</span>
                                <input type="text" name="_031_mf34f_mark" id="_031_mf34f_mark" maxlength="1" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_mf34f_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                <input type="text" name="_032_mf34f_amount" id="_032_mf34f_amount" maxlength="15" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_mf34f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF34F -->
                            <div id="of34f">
                                <div class="form-row"><span class="label_body">OF34F</span><span class="label">Credit Floor Limit Indicator</span>
                                    <input type="checkbox" name="credit_floor_limit_inficator_checkbox" id="credit_floor_limit_inficator_checkbox" />
                                    <div id="check_of34f">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                            <input type="text" name="_040_of34f_currency" id="_040_of34f_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of34f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">D/C Mark</span>
                                            <input type="text" name="_041_of34f_mark" id="_041_of34f_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of34f_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                            <input type="text" name="_042_of34f_amount" id="_042_of34f_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_of34f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- MF13D -->
                            <!--Date-->
                            <div class="form-row"><span class="label_body">MF13D</span><span class="label">Date</span>
                                <input type="text" name="_050_mf13d_date" id="_050_mf13d_date" maxlength="6" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf13d_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <!--Time-->
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Time</span>
                                <input type="text" name="_051_mf13d_time" id="_051_mf13d_time" maxlength="4" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_mf13d_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Sign</span>
                                <input type="text" name="_052_mf13d_sign" id="_052_mf13d_sign" maxlength="1" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_mf13d_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">(Sign)(Offset)</span>
                                <input type="text" name="_053_mf13d_offset" id="_053_mf13d_offset" maxlength="4" class="mandatory" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_mf13d_offset'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF61 -->
                            <div class="form-row"><span class="label_body">OF61</span><span class="label">Statement Line</span>
                                    <textarea cols="60" rows="5" name="_072_of61_statement_line" id="_072_of61_statement_line"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of61_statement_line'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            
                            <hr/>
                            
                            <!-- OF86 -->
                            <div class="form-row"><span class="label_body">OF86</span><span class="label">Information to Account Owner</span>
                                <textarea cols="65" rows="6" name="_080_of86_information_to_acc_owner" id="_080_of86_information_to_acc_owner"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of86_information_to_acc_owner'}"><c:out value="${item.detail}" />&#13;</c:if></c:forEach></textarea>
                            </div>
                            
                            <hr/>
                            

                            <!-- OF90D -->
                            <div class="form-row"><span class="label_body">OF90D</span><span class="label">Sum of Entries - Number</span>
                                <input type="text" name="_100_of90d_number" id="_100_of90d_number" maxlength="5" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of90d_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" name="_101_of90d_currency" id="_101_of90d_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of90d_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_102_of90d_amount" id="_102_of90d_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_of90d_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF90C -->
                            <div class="form-row"><span class="label_body">OF90C</span><span class="label">Sum of Entries - Number</span>
                                <input type="text" name="_110_of90c_number" id="_110_of90c_number" maxlength="5" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of90c_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                <input type="text" name="_111_of90c_currency" id="_111_of90c_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_of90c_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                <input type="text" name="_112_of9c_amount" id="_112_of9c_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_112_of9c_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                            </div>
                            <hr/>

                            <!-- OF86 -->
                            <div class="form-row"><span class="label_body">OF86</span><span class="label">Information to Account Owner</span>
                                <textarea name="_120_of86_information" id="_120_of86_information"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_120_of86_information'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                            </div>
                            <hr/>

                        </div>
                        <div id="view3" class="tabcontent">
                            <%@ include file="comment_mt.jsp" %>
                        </div>
                        <%@ include file="special_rate.jsp" %>
                        <%@ include file="button_action.jsp" %>
                    </div>
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>
