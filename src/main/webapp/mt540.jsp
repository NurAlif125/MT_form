<%-- Document : mt540 Created on : Sep 24, 2025, 10:23:59 AM Author : Ovasae
--%> <%@ taglib prefix="c" uri="jakarta.tags.core" %> <%@ include file
="header.jsp" %>
<script src="js/validate-mt/content/mt540_content.js"></script>
<script src="js/validate-mt/validate_rule_mt540.js"></script>
<script src="js/validate-mt/validateList_scr.js"></script>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link
  href="css/dropdown/themes/flickr.com/default.ultimate.css"
  media="screen"
  rel="stylesheet"
  type="text/css"
/>
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<link href="css/MT.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/displaytag.css" type="text/css" />
<link
  type="text/css"
  href="css/ui-lightness/jquery-ui-1.8.22.custom.css"
  rel="stylesheet"
/>

<div id="isi">
  <c:forEach var="item" items="${role}">
    <c:if test="${item == 'MT:540'}">
      <h2>MT540</h2>
      <ul>
        <c:forEach var="item" items="${tags}">
            <li>Tag: ${item.tagName} - Detail: ${item.detail}</li>
        </c:forEach>
      </ul>

      <div id="judul">MT 540 Receive Free</div>
      <form
        id="form1"
        name="form1"
        method="post"
        ondrop="return false;"
        onpaste="return false;"
        autocomplete="off"
        action="ServletControllerDataTransaksiOutgoing"
        onsubmit="return confirm('Do you want to save this MT data?');"
      >
        <input name="messageType" id="messageType" type="hidden" value="540" />
        <div style="width: 100%; margin: 0 auto; font: 0.85em arial">
          <ul class="tabs">
            <li id="tab-view1"><a href="#" rel="view1">Header</a></li>
            <li id="tab-view2"><a href="#" rel="view2">Body</a></li>
            <li id="tab-view3"><a href="#" rel="view3">Comment</a></li>
            <li id="tab-view4"><a href="#" rel="view4">Histories</a></li>
            <li id="tab-view5"><a href="#" rel="view5">Log MT Text</a></li>
            <li id="tab-view6"><a href="#" rel="view6">MT Relation</a></li>
            <li id="tab-view7">
              <a href="#" rel="view7" id="tabView7">Translation</a>
            </li>
            <li hidden id="tab-validate">
              <a href="#" rel="view8" id="tabView8">Validate</a>
            </li>
          </ul>
          <div class="tabcontents">
            <div id="view1" class="tabcontent">
              <%@include file="header_mt_input.jsp" %>
            </div>
            <div id="view2" class="tabcontent">
                <h2 class="header-title">Mandatory Sequence A General Information</h2>
                <hr />
                <div class="form-row">
                    <span class="label_body">MF16R</span>
                    <span class="label">Start of Block</span>
                    <input
                        id="_000_mf16r_a_"
                        input_type="MF16R "
                        location="Body"
                        name="_000_mf16r_a_"
                        type="hidden"
                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_000_mf16r_a_'}"><c:out value="GENL" /></c:if></c:forEach>"
                    />
                </div>
                <hr />
                <div class="form-row">
                    <span class="label_body">MF20C</span>
                    <span class="label">Sender's Message Reference</span>
                    <input
                        id="_010_mf20c_a_"
                        input_type="MF20C "
                        location="Body"
                        name="_010_mf20c_a_"
                        type="hidden"
                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20c_a_'}"><c:out value=":SEME//" /></c:if></c:forEach>"
                    />
                    <div class="form-row">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Sender reference</span>
                        <input
                            class="mandatory"
                            data-swift="16x"
                            id="_011_mf20c_a_sender_reference"
                            input_type="MF20C Sender Reference"
                            location="Body"
                            maxlength="16"
                            name="_011_mf20c_a_sender_reference"
                            onkeypress="avoidSplChars(event)"
                            type="text"
                            value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf20c_a_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                        />
                    </div>
                </div>
                <hr />
                <div class="form-row">
                    <span class="label_body">MF23G</span>
                    <span class="label">Function of the Message</span>
                    <div class="form-row">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Function</span>
                        <select
                            class="mandatory"
                            id="_020_mf23g_a_function"
                            input_type="MF23G Function"
                            location="Body"
                            name="_020_mf23g_a_function"
                        >
                            <option value=""></option>
                            <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf23g_a_function'}"><c:if test="${item.detail=='CANC'}"> selected="true" </c:if></c:if></c:forEach>>CANC</option>">CANC</option>
                            <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf23g_a_function'}"><c:if test="${item.detail=='NEWM'}"> selected="true" </c:if></c:if></c:forEach>>NEWM</option>">NEWM</option>
                            <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf23g_a_function'}"><c:if test="${item.detail=='PREA'}"> selected="true" </c:if></c:if></c:forEach>>PREA</option>">PREA</option>
                        </select>
                    </div>
                    <div class="form-row">
                        <span class="label_body">&nbsp;</span>
                        <span class="label">Subfunction</span>
                        <select
                            id="_021_mf23g_a_subfunction"
                            input_type="MF23G Subfunction"
                            location="Body"
                            name="_021_mf23g_a_subfunction"
                        >
                            <option value=""></option>
                            <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf23g_a_subfunction'}"><c:if test="${item.detail=='/CODU'}"> selected="true" </c:if></c:if></c:forEach>>/CODU</option>">CODU</option>
                            <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf23g_a_subfunction'}"><c:if test="${item.detail=='/COPY'}"> selected="true" </c:if></c:if></c:forEach>>/COPY</option>">COPY</option>
                            <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf23g_a_subfunction'}"><c:if test="${item.detail=='/DUPL'}"> selected="true" </c:if></c:if></c:forEach>>/DUPL</option>">DUPL</option>
                            <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf23g_a_subfunction'}"><c:if test="${item.detail=='/RECO'}"> selected="true" </c:if></c:if></c:forEach>>/RECO</option>">RECO</option>
                        </select>
                    </div>
                </div>
                <hr />
                <div class="form-row">
                    <span class="label_body">OF98A</span>
                    <span class="label">Preparation Date/Time</span>
                    <input id="check_of98a" name="check_of98a" type="checkbox" />
                    <div id="div_opt_of98a">
                        <select
                            id="type_of98_a"
                            input_type="OF98A Preparation date/time"
                            location="Body"
                            name="type_of98_a"
                        >
                            <option value=""></option>
                            <option value="a">A - A</option>
                            <option value="c">C - Date - Time</option>
                            <option value="e">E - Date - Time - Decimals - UTC Indicator</option>
                        </select>
                        <div id="div_of98a_a">
                            <input
                                id="_030_of98a_a_"
                                input_type="OF98A "
                                location="Body"
                                name="_030_of98a_a_"
                                type="hidden"
                                value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of98a_a_'}"><c:out value=":PREP//" /></c:if></c:forEach>"
                            />
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span>
                                <span class="label">Date</span>
                                <input
                                    class="mandatory"
                                    data-swift="8!n"
                                    id="_031_of98a_a_date"
                                    input_type="OF98A Date"
                                    location="Body"
                                    maxlength="8"
                                    name="_031_of98a_a_date"
                                    oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')"
                                    type="text"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_of98a_a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                />
                            </div>
                        </div>
                        <div id="div_of98c_a">
                            <input
                                id="_032_of98c_a_"
                                input_type="OF98C "
                                location="Body"
                                name="_032_of98c_a_"
                                type="hidden"
                                value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_032_of98c_a_'}"><c:out value=":PREP//" /></c:if></c:forEach>"
                            />
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span>
                                <span class="label">Date</span>
                                <input
                                    class="mandatory"
                                    data-swift="8!n"
                                    id="_033_of98c_a_date"
                                    input_type="OF98C Date"
                                    location="Body"
                                    maxlength="8"
                                    name="_033_of98c_a_date"
                                    oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')"
                                    type="text"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_of98c_a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                />
                            </div>
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span>
                                <span class="label">Time</span>
                                <input
                                    class="mandatory"
                                    data-swift="6!n"
                                    id="_034_of98c_a_time"
                                    input_type="OF98C Time"
                                    location="Body"
                                    maxlength="6"
                                    name="_034_of98c_a_time"
                                    oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')"
                                    type="text"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_034_of98c_a_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                />
                            </div>
                        </div>
                        <div id="div_of98e_a">
                            <input
                                id="_035_of98e_a_"
                                input_type="OF98E "
                                location="Body"
                                name="_035_of98e_a_"
                                type="hidden"
                                value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_035_of98e_a_'}"><c:out value=":PREP//" /></c:if></c:forEach>"
                            />
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span>
                                <span class="label">Date</span>
                                <input
                                    class="mandatory"
                                    data-swift="8!n"
                                    id="_036_of98e_a_date"
                                    input_type="OF98E Date"
                                    location="Body"
                                    maxlength="8"
                                    name="_036_of98e_a_date"
                                    oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')"
                                    type="text"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_036_of98e_a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                />
                            </div>
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span>
                                <span class="label">Time</span>
                                <input
                                    class="mandatory"
                                    data-swift="6!n"
                                    id="_037_of98e_a_time"
                                    input_type="OF98E Time"
                                    location="Body"
                                    maxlength="6"
                                    name="_037_of98e_a_time"
                                    oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')"
                                    type="text"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_037_of98e_a_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                />
                            </div>
                            <input
                                id="_038_of98e_a_"
                                input_type="OF98E "
                                location="Body"
                                name="_038_of98e_a_"
                                type="hidden"
                                value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_038_of98e_a_'}"><c:out value="," /></c:if></c:forEach>"
                            />
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span>
                                <span class="label">Decimals</span>
                                <input
                                    data-swift="3n"
                                    id="_039_of98e_a_decimals"
                                    input_type="OF98E Decimals"
                                    location="Body"
                                    maxlength="3"
                                    name="_039_of98e_a_decimals"
                                    oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')"
                                    type="text"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_039_of98e_a_decimals'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                />
                            </div>
                            <input
                                id="_0310_of98e_a_"
                                input_type="OF98E "
                                location="Body"
                                name="_0310_of98e_a_"
                                type="hidden"
                                value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0310_of98e_a_'}"><c:out value="/" /></c:if></c:forEach>"
                            />
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span>
                                <span class="label">Utc indicator</span>
                                <input
                                    data-swift="[N]2!n[2!n]"
                                    id="_0311_of98e_a_utc_indicator"
                                    input_type="OF98E UTC Indicator"
                                    location="Body"
                                    maxlength="5"
                                    name="_0311_of98e_a_utc_indicator"
                                    onkeypress="avoidSplChars(event)"
                                    type="text"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0311_of98e_a_utc_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                />
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="form-row">
                    <span class="label_body">OF99A</span>
                    <span class="label">Number Count</span>
                    <div id="container_of99a">
                        <button data-id="of99a" onclick="addContainer(this)">
                            Add Field OF99A
                        </button>
                    </div>
                    <div id="template_of99a" style="display: none">
                        <div class="form-row">
                            <span class="label_body">
                                <button class="remove-btn">Remove</button>
                            </span>
                            <span class="label" id="label_count_of99a">Count</span>
                        </div>
                        <select
                            id="type_of99_a"
                            input_type="OF99A Number count"
                            location="Body"
                            name="type_of99_a"
                        >
                            <option value=""></option>
                            <option value="b">B - 3 Digits</option>
                            <option value="c">C - 6 Digits</option>
                        </select>
                        <div id="div_of99b_a">
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span>
                                <span class="label">Qualifier</span>
                                <select
                                    class="mandatory"
                                    id="_040_of99b_a_qualifier"
                                    input_type="OF99B Qualifier"
                                    location="Body"
                                    name="_040_of99b_a_qualifier"
                                >
                                    <option value=""></option>
                                    <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of99b_a_qualifier'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>:SETT//</option>">SETT</option>
                                    <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of99b_a_qualifier'}"><c:if test="${item.detail==':TOSE//'}"> selected="true" </c:if></c:if></c:forEach>>:TOSE//</option>">TOSE</option>
                                </select>
                            </div>
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span>
                                <span class="label">Number</span>
                                <input
                                    class="mandatory"
                                    data-swift="3!n"
                                    id="_041_of99b_a_number"
                                    input_type="OF99B Number"
                                    location="Body"
                                    maxlength="3"
                                    name="_041_of99b_a_number"
                                    oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')"
                                    type="text"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of99b_a_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                />
                            </div>
                        </div>
                        <div id="div_of99c_a">
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span>
                                <span class="label">Qualifier</span>
                                <select
                                    class="mandatory"
                                    id="_042_of99c_a_qualifier"
                                    input_type="OF99C Qualifier"
                                    location="Body"
                                    name="_042_of99c_a_qualifier"
                                >
                                    <option value=""></option>
                                    <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_of99c_a_qualifier'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>:SETT//</option>">SETT</option>
                                    <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_of99c_a_qualifier'}"><c:if test="${item.detail==':TOSE//'}"> selected="true" </c:if></c:if></c:forEach>>:TOSE//</option>">TOSE</option>
                                </select>
                            </div>
                            <div class="form-row">
                                <span class="label_body">&nbsp;</span>
                                <span class="label">Number</span>
                                <input
                                    class="mandatory"
                                    data-swift="6!n"
                                    id="_043_of99c_a_number"
                                    input_type="OF99C Number"
                                    location="Body"
                                    maxlength="6"
                                    name="_043_of99c_a_number"
                                    oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')"
                                    type="text"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_of99c_a_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                />
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <h2 class="header-title">Optional Repetitive Subsequence A1 Linkages</h2>
                <hr />
                <div class="form-row">
                    <span class="label_body">A1</span>
                    <span class="label">Linkages</span>
                    <div id="container_a1">
                        <button data-id="a1" onclick="addContainer(this)">Add Field A1</button>
                    </div>
                    <div id="template_a1" style="display: none">
                        <div class="form-row">
                            <span class="label_body">
                                <button class="remove-btn">Remove</button>
                            </span>
                            <span class="label" id="label_count_a1">Count</span>
                        </div>
                        <div class="form-row">
                            <span class="label_body">MF16R</span>
                            <span class="label">Start of Block</span>
                            <input
                                id="_050_mf16r_a1_"
                                input_type="MF16R "
                                location="Body"
                                name="_050_mf16r_a1_"
                                type="hidden"
                                value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf16r_a1_'}"><c:out value="LINK" /></c:if></c:forEach>"
                            />
                        </div>
                        <div class="form-row">
                            <span class="label_body">OF22F</span>
                            <span class="label">Linkage Type Indicator</span>
                            <input id="check_of22f" name="check_of22f" type="checkbox" />
                            <div id="div_opt_of22f">
                                <input
                                    id="_051_of22f_a1_"
                                    input_type="OF22F "
                                    location="Body"
                                    name="_051_of22f_a1_"
                                    type="hidden"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_051_of22f_a1_'}"><c:out value=":LINK/" /></c:if></c:forEach>"
                                />
                                <div class="form-row">
                                    <span class="label_body">&nbsp;</span>
                                    <span class="label">Data source scheme</span>
                                    <input
                                        data-swift="8c"
                                        id="_052_of22f_a1_data_source_scheme"
                                        input_type="OF22F Data Source Scheme"
                                        location="Body"
                                        maxlength="8"
                                        name="_052_of22f_a1_data_source_scheme"
                                        oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')"
                                        type="text"
                                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of22f_a1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                    />
                                </div>
                                <input
                                    id="_053_of22f_a1_"
                                    input_type="OF22F "
                                    location="Body"
                                    name="_053_of22f_a1_"
                                    type="hidden"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_053_of22f_a1_'}"><c:out value="/" /></c:if></c:forEach>"
                                />
                                <div class="form-row">
                                    <span class="label_body">&nbsp;</span>
                                    <span class="label">Indicator</span>
                                    <input
                                        data-swift="4!c"
                                        id="_054_of22f_a1_indicator"
                                        input_type="OF22F Indicator"
                                        location="Body"
                                        maxlength="4"
                                        name="_054_of22f_a1_indicator"
                                        oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')"
                                        type="text"
                                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of22f_a1_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <span class="label_body">OF13A</span>
                            <span class="label">Linked Message</span>
                            <input id="check_of13a" name="check_of13a" type="checkbox" />
                            <div id="div_opt_of13a">
                                <select
                                    id="type_of13_a1"
                                    input_type="OF13A Linked message"
                                    location="Body"
                                    name="type_of13_a1"
                                >
                                    <option value=""></option>
                                    <option value="a">A - Number ID</option>
                                    <option value="b">B - Data Source Scheme - Number</option>
                                </select>
                                <div id="div_of13a_a1">
                                    <input
                                        id="_055_of13a_a1_"
                                        input_type="OF13A "
                                        location="Body"
                                        name="_055_of13a_a1_"
                                        type="hidden"
                                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_055_of13a_a1_'}"><c:out value=":LINK//" /></c:if></c:forEach>"
                                    />
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Number id</span>
                                        <input
                                            class="mandatory"
                                            data-swift="3!c"
                                            id="_056_of13a_a1_number_id"
                                            input_type="OF13A Number ID"
                                            location="Body"
                                            maxlength="3"
                                            name="_056_of13a_a1_number_id"
                                            oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')"
                                            type="text"
                                            value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_056_of13a_a1_number_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                        />
                                    </div>
                                </div>
                                <div id="div_of13b_a1">
                                    <input
                                        id="_057_of13b_a1_"
                                        input_type="OF13B "
                                        location="Body"
                                        name="_057_of13b_a1_"
                                        type="hidden"
                                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_057_of13b_a1_'}"><c:out value=":LINK/" /></c:if></c:forEach>"
                                    />
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Data source scheme</span>
                                        <input
                                            data-swift="8c"
                                            id="_058_of13b_a1_data_source_scheme"
                                            input_type="OF13B Data Source Scheme"
                                            location="Body"
                                            maxlength="8"
                                            name="_058_of13b_a1_data_source_scheme"
                                            oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')"
                                            type="text"
                                            value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_058_of13b_a1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                        />
                                    </div>
                                    <input
                                        id="_059_of13b_a1_"
                                        input_type="OF13B "
                                        location="Body"
                                        name="_059_of13b_a1_"
                                        type="hidden"
                                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_059_of13b_a1_'}"><c:out value="/" /></c:if></c:forEach>"
                                    />
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Number</span>
                                        <input
                                            data-swift="30x"
                                            id="_0510_of13b_a1_number"
                                            input_type="OF13B Number"
                                            location="Body"
                                            maxlength="30"
                                            name="_0510_of13b_a1_number"
                                            onkeypress="avoidSplChars(event)"
                                            type="text"
                                            value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0510_of13b_a1_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <span class="label_body">MF20A</span>
                            <span class="label">Reference</span>
                            <select
                                class="mandatory"
                                id="type_mf20_a1"
                                input_type="MF20A Qualifier"
                                location="Body"
                                name="type_mf20_a1"
                            >
                                <option value=""></option>
                                <option value="c">C - Qualifier</option>
                                <option value="n">N - Reference</option>
                                <option value="u">U - UTI Reference</option>
                            </select>
                            <div id="div_mf20c_a1">
                                <div class="form-row">
                                    <span class="label_body">&nbsp;</span>
                                    <span class="label">Qualifier</span>
                                    <select
                                        class="mandatory"
                                        id="_0512_mf20c_a1_qualifier"
                                        input_type="MF20C Qualifier"
                                        location="Body"
                                        name="_0512_mf20c_a1_qualifier"
                                    >
                                        <option value=""></option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':POOL//'}"> selected="true" </c:if></c:if></c:forEach>>:POOL//</option>">
                                            POOL
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':PREA//'}"> selected="true" </c:if></c:if></c:forEach>>:PREA//</option>">
                                            PREA
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':PREV//'}"> selected="true" </c:if></c:if></c:forEach>>:PREV//</option>">
                                            PREV
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':RELA//'}"> selected="true" </c:if></c:if></c:forEach>>:RELA//</option>">
                                            RELA
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':TRRF//'}"> selected="true" </c:if></c:if></c:forEach>>:TRRF//</option>">
                                            TRRF
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':COMM//'}"> selected="true" </c:if></c:if></c:forEach>>:COMM//</option>">
                                            COMM
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':COLR//'}"> selected="true" </c:if></c:if></c:forEach>>:COLR//</option>">
                                            COLR
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':CERT//'}"> selected="true" </c:if></c:if></c:forEach>>:CERT//</option>">
                                            CERT
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':CORP//'}"> selected="true" </c:if></c:if></c:forEach>>:CORP//</option>">
                                            CORP
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':CLCI//'}"> selected="true" </c:if></c:if></c:forEach>>:CLCI//</option>">
                                            CLCI
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':CLTR//'}"> selected="true" </c:if></c:if></c:forEach>>:CLTR//</option>">
                                            CLTR
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':PCTI//'}"> selected="true" </c:if></c:if></c:forEach>>:PCTI//</option>">
                                            PCTI
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':TRCI//'}"> selected="true" </c:if></c:if></c:forEach>>:TRCI//</option>">
                                            TRCI
                                        </option>
                                        <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':TCTR//'}"> selected="true" </c:if></c:if></c:forEach>>:TCTR//</option>">
                                            TCTR
                                        </option>
                                    </select>
                                </div>
                                <div class="form-row">
                                    <span class="label_body">&nbsp;</span>
                                    <span class="label">Reference</span>
                                    <input
                                        class="mandatory"
                                        data-swift="16x"
                                        id="_0513_mf20c_a1_reference"
                                        input_type="MF20C Reference"
                                        location="Body"
                                        maxlength="16"
                                        name="_0513_mf20c_a1_reference"
                                        onkeypress="avoidSplChars(event)"
                                        type="text"
                                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0513_mf20c_a1_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                    />
                                </div>
                            </div>
                            <div id="div_mf20n_a1">
                                <input
                                    id="_0514_mf20n_a1_"
                                    input_type="MF20N "
                                    location="Body"
                                    name="_0514_mf20n_a1_"
                                    type="hidden"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0514_mf20n_a1_'}"><c:out value=":NONC//" /></c:if></c:forEach>"
                                />
                                <div class="form-row">
                                    <span class="label_body">&nbsp;</span>
                                    <span class="label">Reference</span>
                                    <input
                                        class="mandatory"
                                        data-swift="35x"
                                        id="_0515_mf20n_a1_reference"
                                        input_type="MF20N Reference"
                                        location="Body"
                                        maxlength="35"
                                        name="_0515_mf20n_a1_reference"
                                        onkeypress="avoidSplChars(event)"
                                        type="text"
                                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0515_mf20n_a1_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                    />
                                </div>
                            </div>
                            <div id="div_mf20u_a1">
                                <input
                                    id="_0516_mf20u_a1_"
                                    input_type="MF20U "
                                    location="Body"
                                    name="_0516_mf20u_a1_"
                                    type="hidden"
                                    value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0516_mf20u_a1_'}"><c:out value=":TRRF//" /></c:if></c:forEach>"
                                />
                                <div class="form-row">
                                    <span class="label_body">&nbsp;</span>
                                    <span class="label">Reference</span>
                                    <input
                                        class="mandatory"
                                        data-swift="52x"
                                        id="_0517_mf20u_a1_reference"
                                        input_type="MF20U Reference"
                                        location="Body"
                                        maxlength="52"
                                        name="_0517_mf20u_a1_reference"
                                        onkeypress="avoidSplChars(event)"
                                        type="text"
                                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0517_mf20u_a1_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <span class="label_body">OF36A</span>
                            <span class="label">Quantity of Financial Instrument</span>
                            <input id="check_of36a" name="check_of36a" type="checkbox" />
                            <div id="div_opt_of36a">
                                <select
                                    id="type_of36_a1"
                                    input_type="OF36A Quantity of financial instrument"
                                    location="Body"
                                    name="type_of36_a1"
                                >
                                    <option value=""></option>
                                    <option value="b">B - Quantity</option>
                                    <option value="d">D - Quantity of Digital Tokens</option>
                                </select>
                                <div id="div_of36b_a1">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Qualifier</span>
                                        <select
                                            class="mandatory"
                                            id="_0519_of36b_a1_qualifier"
                                            input_type="OF36B Qualifier"
                                            location="Body"
                                            name="_0519_of36b_a1_qualifier"
                                        >
                                            <option value=""></option>
                                            <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0519_of36b_a1_qualifier'}"><c:if test="${item.detail==':PAIR/'}"> selected="true" </c:if></c:if></c:forEach>>:PAIR/</option>">
                                                PAIR
                                            </option>
                                            <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0519_of36b_a1_qualifier'}"><c:if test="${item.detail==':TURN/'}"> selected="true" </c:if></c:if></c:forEach>>:TURN/</option>">
                                                TURN
                                            </option>
                                        </select>
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Quantity type code</span>
                                        <select
                                            class="mandatory"
                                            id="_0520_of36b_a1_quantity_type_code"
                                            input_type="OF36B Quantity Type Code"
                                            location="Body"
                                            name="_0520_of36b_a1_quantity_type_code"
                                        >
                                            <option value=""></option>
                                            <option
                                                value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0520_of36b_a1_quantity_type_code'}"><c:if test="${item.detail=='/AMOR/'}"> selected="true" </c:if></c:if></c:forEach>>/AMOR/</option>"
                                            >
                                                AMOR
                                            </option>
                                            <option
                                                value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0520_of36b_a1_quantity_type_code'}"><c:if test="${item.detail=='/FAMT/'}"> selected="true" </c:if></c:if></c:forEach>>/FAMT/</option>"
                                            >
                                                FAMT
                                            </option>
                                            <option
                                                value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0520_of36b_a1_quantity_type_code'}"><c:if test="${item.detail=='/UNIT/'}"> selected="true" </c:if></c:if></c:forEach>>/UNIT/</option>"
                                            >
                                                UNIT
                                            </option>
                                        </select>
                                    </div>
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Quantity</span>
                                        <input
                                            class="mandatory"
                                            data-swift="15d"
                                            id="_0521_of36b_a1_quantity"
                                            input_type="OF36B Quantity"
                                            location="Body"
                                            maxlength="15"
                                            name="_0521_of36b_a1_quantity"
                                            onkeypress="return numbersonly(event);"
                                            type="text"
                                            value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0521_of36b_a1_quantity'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                        />
                                    </div>
                                </div>
                                <div id="div_of36d_a1">
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Qualifier</span>
                                        <select
                                            class="mandatory"
                                            id="_0522_of36d_a1_qualifier"
                                            input_type="OF36D Qualifier"
                                            location="Body"
                                            name="_0522_of36d_a1_qualifier"
                                        >
                                            <option value=""></option>
                                            <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0522_of36d_a1_qualifier'}"><c:if test="${item.detail==':PAIR/'}"> selected="true" </c:if></c:if></c:forEach>>:PAIR/</option>">
                                                PAIR
                                            </option>
                                            <option value="<option value="AMND" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0522_of36d_a1_qualifier'}"><c:if test="${item.detail==':TURN/'}"> selected="true" </c:if></c:if></c:forEach>>:TURN/</option>">
                                                TURN
                                            </option>
                                        </select>
                                    </div>
                                    <input
                                        id="_0523_of36d_a1_"
                                        input_type="OF36D "
                                        location="Body"
                                        name="_0523_of36d_a1_"
                                        type="hidden"
                                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0523_of36d_a1_'}"><c:out value="/DITU/" /></c:if></c:forEach>"
                                    />
                                    <div class="form-row">
                                        <span class="label_body">&nbsp;</span>
                                        <span class="label">Quantity of digital tokens</span>
                                        <input
                                            class="mandatory"
                                            data-swift="30d"
                                            id="_0524_of36d_a1_quantity_of_digital_tokens"
                                            input_type="OF36D Quantity of Digital Tokens"
                                            location="Body"
                                            maxlength="30"
                                            name="_0524_of36d_a1_quantity_of_digital_tokens"
                                            onkeypress="return numbersonly(event);"
                                            type="text"
                                            value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0524_of36d_a1_quantity_of_digital_tokens'}"><c:out value="${item.detail}" /></c:if></c:forEach>"
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <span class="label_body">MF16S</span>
                            <span class="label">End of Block</span>
                            <input
                                id="_0526_mf16s_a1_"
                                input_type="MF16S "
                                location="Body"
                                name="_0526_mf16s_a1_"
                                type="hidden"
                                value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0526_mf16s_a1_'}"><c:out value="LINK" /></c:if></c:forEach>"
                            />
                        </div>
                    </div>
                </div>
                <hr />
                <div class="form-row">
                    <span class="label_body">MF16S</span>
                    <span class="label">End of Block</span>
                    <input
                        id="_060_mf16s_a_end_of_block"
                        input_type="MF16S End of Block"
                        location="Body"
                        name="_060_mf16s_a_end_of_block"
                        type="hidden"
                        value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_060_mf16s_a_end_of_block'}"><c:out value="GENL" /></c:if></c:forEach>"
                    />
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
              <div class="form-row"><%@include file="mt_mx.jsp" %></div>
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