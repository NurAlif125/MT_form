<%--
    Document   : mt300
    Created on : Jun 14, 2019, 10:23:59 AM
    Author     : Ovasae
--%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file ="header.jsp" %>

<script src="js/tabcontent.js" type="text/javascript"></script>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css"/>
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css"/>
<link href="css/tabcontent.css" rel="stylesheet" type="text/css"/>
<link href="css/MT.css" rel="stylesheet" type="text/css"/>
<link rel="icon" href="images/favicon.ico"/>
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />

<link href="css/validate.css" rel="stylesheet" type="text/css"/>

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:775'}">
            <h2>MT775</h2>
            <ul>
            <c:forEach var="item" items="${tags}">
                <li>Tag: ${item.tagName} - Detail: ${item.detail}</li>
            </c:forEach>
            </ul>

            <div id="judul">MT 775 Amendment to a Demand Guarantee/Standby Letter of Credit</div>
            <form id="form1" name="form1" method="post" ondrop="return false;" onpaste="return false;" autocomplete="off" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="775" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li id="tab-view1"><a href="#" rel="view1">Header</a></li>
                        <li id="tab-view2"><a href="#" rel="view2">Body</a></li>
                        <li id="tab-view3"><a href="#" rel="view3">Comment</a></li>
                        <li id="tab-view4"><a href="#" rel="view4">Histories</a></li>
                        <li id="tab-view5"><a href="#" rel="view5">Log MT Text</a></li>
                        <li id="tab-view6"><a href="#" rel="view6">MT Relation</a></li>
                        <li  id="tab-view7"><a href="#" rel="view7" id="tabView7">Translation</a></li>
                        <li hidden id="tab-validate"><a href="#" rel="view8" id="tabView8">Validate</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@include file="header_mt_input.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <div class="form-row">
                                <span class="label_body">MF27</span>
                                <span class="label">Sequence of Total</span>
                                <div class="form-row">
                                    <span class="label_body">&nbsp;</span>
                                    <span class="label">Number</span>
                                    <input
                                        class="mandatory"
                                        data-swift="1!n"
                                        id="_000_mf27_number"
                                        input_type="MF27 Number"
                                        location="Body"
                                        maxlength="1"
                                        name="_000_mf27_number"
                                        oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')"
                                        type="text"
                                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_000_mf27_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                    />
                                </div>
                                <input
                                    id="_001_mf27_"
                                    input_type="MF27 "
                                    location="Body"
                                    name="_001_mf27_"
                                    type="hidden"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_001_mf27_'}"><c:out value="/" /></c:if></c:forEach>"
                                />
                                <div class="form-row">
                                    <span class="label_body">&nbsp;</span>
                                    <span class="label">Total</span>
                                    <input
                                        class="mandatory"
                                        data-swift="1!n"
                                        id="_002_mf27_total"
                                        input_type="MF27 Total"
                                        location="Body"
                                        maxlength="1"
                                        name="_002_mf27_total"
                                        oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')"
                                        type="text"
                                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_002_mf27_total'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                    />
                                </div>
                            </div>
                            <hr />
                            <div class="form-row">
                                <span class="label_body">MF20</span>
                                <span class="label">Undertaking Number</span>
                                <input
                                    class="mandatory"
                                    data-swift="16x"
                                    id="_010_mf20_sender_reference"
                                    input_type="MF20 Sender Reference"
                                    location="Body"
                                    maxlength="16"
                                    name="_010_mf20_sender_reference"
                                    onkeypress="avoidSplChars(event)"
                                    type="text"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                />
                            </div>
                            <hr />
                            <div class="form-row">
                                <span class="label_body">MF21</span>
                                <span class="label">Related Reference</span>
                                <input
                                    class="mandatory"
                                    data-swift="16x"
                                    id="_020_mf21_related_reference"
                                    input_type="MF21 Related Reference"
                                    location="Body"
                                    maxlength="16"
                                    name="_020_mf21_related_reference"
                                    onkeypress="avoidSplChars(event)"
                                    type="text"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                />
                            </div>
                            <hr />
                            <div class="form-row">
                                <span class="label_body">MF26E</span>
                                <span class="label">Number of Amendment</span>
                                <input
                                    class="mandatory"
                                    data-swift="3n"
                                    id="_030_mf26e_number_of_amandement"
                                    input_type="MF26E Number of Amandement"
                                    location="Body"
                                    maxlength="3"
                                    name="_030_mf26e_number_of_amandement"
                                    oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')"
                                    type="text"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf26e_number_of_amandement'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                />
                            </div>
                            <hr />
                            <div class="form-row">
                                <span class="label_body">MF52A</span>
                                <span class="label">Issuer</span>
                                <select
                                    class="mandatory"
                                    id="type_mf52_"
                                    input_type="MF52A Issuer"
                                    location="Body"
                                    name="type_mf52_"
                                >
                                    <option value=""></option>
                                    <option value="a">A - BIC</option>
                                    <option value="d">D - Party Identification</option>
                                </select>
                                <div id="div_mf52a_">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Party identifier</span>
                                        <input
                                            class="mandatory"
                                            data-swift="[/1!a][/34x]"
                                            id="_040_mf52a_party_identifier"
                                            input_type="MF52A Party Identifier"
                                            location="Body"
                                            maxlength="16"
                                            name="_040_mf52a_party_identifier"
                                            onblur="cek_slash(this)"
                                            type="text"
                                            value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                        />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Identifier code</span>
                                        <input
                                            class="mandatory"
                                            data-swift="4!a2!a2!c[3!c]"
                                            id="_041_mf52a_identifier_code"
                                            input_type="MF52A Identifier Code"
                                            location="Body"
                                            maxlength="11"
                                            name="_041_mf52a_identifier_code"
                                            type="text"
                                            value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_mf52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                        />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Address</span>
                                        <textarea
                                            class="mandatory"
                                            id="_042_mf52a_address"
                                            input_type="MF52A Address"
                                            location="Body"
                                            name="_042_mf52a_address"
                                        ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf52a_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea
                                        >
                                    </div>
                                </div>
                                <div id="div_mf52d_">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Party identifier</span>
                                        <input
                                            class="mandatory"
                                            data-swift="[/1!a][/34x]"
                                            id="_043_mf52d_party_identifier"
                                            input_type="MF52D Party Identifier"
                                            location="Body"
                                            maxlength="16"
                                            name="_043_mf52d_party_identifier"
                                            onblur="cek_slash(this)"
                                            type="text"
                                            value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_mf52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                        />
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Name and address</span>
                                        <textarea
                                            class="mandatory"
                                            cols="40"
                                            data-swift="5*35x"
                                            id="_044_mf52d_name_and_address"
                                            input_type="MF52D Name and Address"
                                            location="Body"
                                            maxlength="200"
                                            name="_044_mf52d_name_and_address"
                                            rows="5"
                                        ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_044_mf52d_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea
                                        >
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class="form-row">
                                <span class="label_body">OF77U</span>
                                <span class="label">Other Amendments to Undertaking</span>
                                <input id="check_of77u" name="check_of77u" type="checkbox" />
                                <div id="div_opt_of77u">
                                    <textarea
                                        class="mandatory"
                                        cols="65"
                                        data-swift="150*65z"
                                        id="_050_of77u_undertaking_narrative"
                                        input_type="OF77U Undertaking Narrative"
                                        location="Body"
                                        name="_050_of77u_undertaking_narrative"
                                        rows="10"
                                    ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_of77u_undertaking_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea
                                    >
                                </div>
                            </div>
                            <hr />
                            <div class="form-row">
                                <span class="label_body">OF77L</span>
                                <span class="label">Other Amendments to Local Undertaking</span>
                                <input id="check_of77l" name="check_of77l" type="checkbox" />
                                <div id="div_opt_of77l">
                                    <textarea
                                        class="mandatory"
                                        cols="65"
                                        data-swift="150*65z"
                                        id="_060_of77l_local_undertaking_narrative"
                                        input_type="OF77L Local Undertaking Narrative"
                                        location="Body"
                                        name="_060_of77l_local_undertaking_narrative"
                                        rows="10"
                                    ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_of77l_local_undertaking_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea
                                    >
                                </div>
                            </div>
                            <hr />
                        </div>
                        <div id="view3" class="tabcontent">
                            <%@include file="comment_mt.jsp" %>
                        </div>
                        <div id="view4" class="tabcontent">
                            <%@ include file="history_mt.jsp" %>
                        </div>
                        <div id="view5" class="tabcontent">
                            <%@ include file="logTrx_mt.jsp" %>
                        </div>
                        <div id="view6" class="tabcontent">
                            <%@ include file="relation_mt.jsp" %>
                        </div>
                        <div id="view7" class="tab-content">
                            <div class="form-row">
                                <%@include file="mt_mx.jsp" %>
                            </div>
                        </div>
                        <div id="view8" class="tabcontent">
                            <div id="error-container"></div>
                        </div>
                    </div>
                </div>
                <%@ include file="button_action.jsp" %>
            </form>
        </c:if>
    </c:forEach>
</div>

<script src="js/validate-mt/content/mt775_content.js"></script>
<script src="js/validate-mt/base_validator_mt.js"></script>
<script src="js/validate-mt/validateList_scr.js"></script>
<link rel="stylesheet" type="text/css" href="css/validate_case.css"/>