<%-- Document : mt540 Created on : Sep 24, 2025, 10:23:59 AM Author : Arsyad --%>

<%@ include file="header.jsp" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<link rel="stylesheet" type="text/css" href="css/validate.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link rel="stylesheet" href="css/helper.css" type="text/css">
<link href="css/MT.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>

<%
    String createParam = request.getParameter("create");
        if ("true".equalsIgnoreCase(createParam)) {
            session.setAttribute("flag", "");
            session.setAttribute("flagStatus", "");
        }
%>

<script>
const mtTagDict = {};
const mtTagKeyList = [];
<c:forEach var="item" items="${tags}">
mtTagKeyList.push("<c:out value='${item.tagName}'/>")
mtTagDict["<c:out value='${item.tagName}'/>"] = `<c:out value='${item.detail}'/>`;
</c:forEach>
</script>

<script src="js/validate-mt/content/mt540_content.js"></script>
<script src="js/validate-mt/base_validator_mt.js"></script>
<script src="js/validate-mt/validateList_scr.js"></script>

<link href="css/base_multiple_mt.css" rel="stylesheet" type="text/css"/>

<div id="isi">
  <c:forEach var="item" items="${role}">
    <c:if test="${item == 'MT:540'}">
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
              <h2 class="header-title">
              	Mandatory Sequence A General Information
              </h2>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF16R</span>
              	<span class="label">Start of Block</span>
              	<input id="_000_mf16r_a_" input_type="MF16R " location="Body" name="_000_mf16r_a_" type="hidden" value="GENL"/>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF20C</span>
              	<span class="label">Sender's Message Reference</span>
              	<input id="_010_mf20c_a_" input_type="MF20C " location="Body" name="_010_mf20c_a_" type="hidden" value=":SEME//"/>
              	<div class="form-row">
              		<span class="label_body">&nbsp;</span>
              		<span class="label">Sender reference</span>
              		<input class="mandatory" data-swift="16x" id="_011_mf20c_a_sender_reference" input_type="MF20C Sender Reference" location="Body" maxlength="16" name="_011_mf20c_a_sender_reference" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_mf20c_a_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF23G</span>
              	<span class="label">Function of the Message</span>
              	<div class="form-row">
              		<span class="label_body">&nbsp;</span>
              		<span class="label">Function</span>
              		<select class="mandatory" id="_020_mf23g_a_function" input_type="MF23G Function" location="Body" name="_020_mf23g_a_function">
              			<option value="">	</option>
              			<option value="CANC" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf23g_a_function'}"><c:if test="${item.detail=='CANC'}"> selected="true" </c:if></c:if></c:forEach>>
              				CANC
              			</option>
              			<option value="NEWM" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf23g_a_function'}"><c:if test="${item.detail=='NEWM'}"> selected="true" </c:if></c:if></c:forEach>>
              				NEWM
              			</option>
              			<option value="PREA" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf23g_a_function'}"><c:if test="${item.detail=='PREA'}"> selected="true" </c:if></c:if></c:forEach>>
              				PREA
              			</option>
              		</select>
              	</div>
              	<div class="form-row">
              		<span class="label_body">&nbsp;</span>
              		<span class="label">Subfunction</span>
              		<input id="check_mf23g_subfunction_a" name="check_mf23g_subfunction_a" type="checkbox"/>
              		<div id="div_opt_mf23g_subfunction_a">
              			<select id="_021_mf23g_a_subfunction" input_type="MF23G Subfunction" location="Body" name="_021_mf23g_a_subfunction">
              				<option value="">	</option>
              				<option value="/CODU" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf23g_a_subfunction'}"><c:if test="${item.detail=='/CODU'}"> selected="true" </c:if></c:if></c:forEach>>
              					CODU
              				</option>
              				<option value="/COPY" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf23g_a_subfunction'}"><c:if test="${item.detail=='/COPY'}"> selected="true" </c:if></c:if></c:forEach>>
              					COPY
              				</option>
              				<option value="/DUPL" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf23g_a_subfunction'}"><c:if test="${item.detail=='/DUPL'}"> selected="true" </c:if></c:if></c:forEach>>
              					DUPL
              				</option>
              				<option value="/RECO" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_021_mf23g_a_subfunction'}"><c:if test="${item.detail=='/RECO'}"> selected="true" </c:if></c:if></c:forEach>>
              					RECO
              				</option>
              			</select>
              		</div>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF98A</span>
              	<span class="label">Preparation Date/Time</span>
              	<input class="checkbox_div" id="check_of98a_a" name="check_of98a_a" type="checkbox"/>
              	<div id="div_opt_of98a_a">
              		<select class="selection_div" disabled="disabled" id="type_of98_a" input_type="OF98A Preparation date/time" location="Body" name="type_of98_a">
              			<option value="">	</option>
              			<option value="a">A - Date</option>
              			<option value="c">C - Date - Time</option>
              			<option value="e">E - Date - Time - Decimals - UTC Indicator</option>
              		</select>
              		<div id="div_of98a_a">
              			<input disabled="disabled" id="_030_of98a_a_" input_type="OF98A " location="Body" name="_030_of98a_a_" type="hidden" value=":PREP//"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Date</span>
              				<input class="mandatory" data-swift="8!n" disabled="disabled" id="_031_of98a_a_date" input_type="OF98A Date" location="Body" maxlength="8" name="_031_of98a_a_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_031_of98a_a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_of98c_a">
              			<input disabled="disabled" id="_032_of98c_a_" input_type="OF98C " location="Body" name="_032_of98c_a_" type="hidden" value=":PREP//"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Date</span>
              				<input class="mandatory" data-swift="8!n" disabled="disabled" id="_033_of98c_a_date" input_type="OF98C Date" location="Body" maxlength="8" name="_033_of98c_a_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_033_of98c_a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Time</span>
              				<input class="mandatory" data-swift="6!n" disabled="disabled" id="_034_of98c_a_time" input_type="OF98C Time" location="Body" maxlength="6" name="_034_of98c_a_time" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_034_of98c_a_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_of98e_a">
              			<input disabled="disabled" id="_035_of98e_a_" input_type="OF98E " location="Body" name="_035_of98e_a_" type="hidden" value=":PREP//"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Date</span>
              				<input class="mandatory" data-swift="8!n" disabled="disabled" id="_036_of98e_a_date" input_type="OF98E Date" location="Body" maxlength="8" name="_036_of98e_a_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_036_of98e_a_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Time</span>
              				<input class="mandatory" data-swift="6!n" disabled="disabled" id="_037_of98e_a_time" input_type="OF98E Time" location="Body" maxlength="6" name="_037_of98e_a_time" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_037_of98e_a_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Decimals</span>
              				<input disabled="disabled" id="check_of98e_decimals_a" name="check_of98e_decimals_a" type="checkbox"/>
              				<div id="div_opt_of98e_decimals_a">
              					<input data-swift="3n" disabled="disabled" id="_039_of98e_a_decimals" input_type="OF98E Decimals" location="Body" maxlength="3" name="_039_of98e_a_decimals" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_039_of98e_a_decimals'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					<input disabled="disabled" id="_038_of98e_a_" input_type="OF98E " location="Body" name="_038_of98e_a_" type="hidden" value=","/>
              				</div>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Utc indicator</span>
              				<input disabled="disabled" id="check_of98e_utc_indicator_a" name="check_of98e_utc_indicator_a" type="checkbox"/>
              				<div id="div_opt_of98e_utc_indicator_a">
              					<input data-swift="[N]2!n[2!n]" disabled="disabled" id="_0311_of98e_a_utc_indicator" input_type="OF98E UTC Indicator" location="Body" maxlength="5" name="_0311_of98e_a_utc_indicator" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0311_of98e_a_utc_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					<input disabled="disabled" id="_0310_of98e_a_" input_type="OF98E " location="Body" name="_0310_of98e_a_" type="hidden" value="/"/>
              				</div>
              			</div>
              		</div>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF99A</span>
              	<span class="label">Number Count</span>
              	<div class="template_container" id="template_of99a_a" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_of99a_a">Count</span>
              		</div>
              		<select class="selection_div" disabled="disabled" id="type_of99_a" input_type="OF99A Number count" location="Body" name="type_of99_a">
              			<option value="">	</option>
              			<option value="b">B - 3 Digits</option>
              			<option value="c">C - 6 Digits</option>
              		</select>
              		<div id="div_of99b_a">
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_040_of99b_a_qualifier" input_type="OF99B Qualifier" location="Body" name="_040_of99b_a_qualifier">
              					<option value="">	</option>
              					<option value=":SETT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of99b_a_qualifier'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>
              						SETT
              					</option>
              					<option value=":TOSE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_of99b_a_qualifier'}"><c:if test="${item.detail==':TOSE//'}"> selected="true" </c:if></c:if></c:forEach>>
              						TOSE
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Number</span>
              				<input class="mandatory" data-swift="3!n" disabled="disabled" id="_041_of99b_a_number" input_type="OF99B Number" location="Body" maxlength="3" name="_041_of99b_a_number" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_of99b_a_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_of99c_a">
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_042_of99c_a_qualifier" input_type="OF99C Qualifier" location="Body" name="_042_of99c_a_qualifier">
              					<option value="">	</option>
              					<option value=":SETT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_of99c_a_qualifier'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>
              						SETT
              					</option>
              					<option value=":TOSE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_of99c_a_qualifier'}"><c:if test="${item.detail==':TOSE//'}"> selected="true" </c:if></c:if></c:forEach>>
              						TOSE
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Number</span>
              				<input class="mandatory" data-swift="6!n" disabled="disabled" id="_043_of99c_a_number" input_type="OF99C Number" location="Body" maxlength="6" name="_043_of99c_a_number" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_of99c_a_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              	</div>
              	<div id="container_of99a_a">
              		<input class="cust-btn" data-count="0" data-id="of99a_a" onclick="addContainer(this)" type="button" value="Add Field OF99A"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_of99a_a">0</span>, Max: <span class="max_val" id="max_occ_of99a_a">2</span>, Count: <span class="count_val" id="cur_occ_of99a_a">0</span>
              		</span>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<h2 class="header-title">
              		Optional Repetitive Subsequence A1 Linkages
              	</h2>
              	<hr/>
              	<span class="label_body">A1</span>
              	<span class="label">Linkages</span>
              	<div class="template_container" id="template_a1" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_a1">Count</span>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16R</span>
              			<span class="label">Start of Block</span>
              			<input disabled="disabled" id="_050_mf16r_a1_" input_type="MF16R " location="Body" name="_050_mf16r_a1_" type="hidden" value="LINK"/>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF22F</span>
              			<span class="label">Linkage Type Indicator</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of22f_a1" name="check_of22f_a1" type="checkbox"/>
              			<div id="div_opt_of22f_a1">
              				<input disabled="disabled" id="_051_of22f_a1_" input_type="OF22F " location="Body" name="_051_of22f_a1_" type="hidden" value=":LINK/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Data source scheme</span>
              					<input class="template_selection" disabled="disabled" id="check_of22f_data_source_scheme_a1" name="check_of22f_data_source_scheme_a1" type="checkbox"/>
              					<div id="div_opt_of22f_data_source_scheme_a1">
              						<input data-swift="8c" disabled="disabled" id="_052_of22f_a1_data_source_scheme" input_type="OF22F Data Source Scheme" location="Body" maxlength="8" name="_052_of22f_a1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of22f_a1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<input disabled="disabled" id="_053_of22f_a1_" input_type="OF22F " location="Body" name="_053_of22f_a1_" type="hidden" value="/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Indicator</span>
              					<input class="mandatory" data-swift="4!c" disabled="disabled" id="_054_of22f_a1_indicator" input_type="OF22F Indicator" location="Body" maxlength="4" name="_054_of22f_a1_indicator" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_054_of22f_a1_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF13A</span>
              			<span class="label">Linked Message</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of13a_a1" name="check_of13a_a1" type="checkbox"/>
              			<div id="div_opt_of13a_a1">
              				<select class="selection_div" disabled="disabled" id="type_of13_a1" input_type="OF13A Linked message" location="Body" name="type_of13_a1">
              					<option value="">	</option>
              					<option value="a">A - Number ID</option>
              					<option value="b">B - Data Source Scheme - Number</option>
              				</select>
              				<div id="div_of13a_a1">
              					<input disabled="disabled" id="_055_of13a_a1_" input_type="OF13A " location="Body" name="_055_of13a_a1_" type="hidden" value=":LINK//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Number id</span>
              						<input class="mandatory" data-swift="3!c" disabled="disabled" id="_056_of13a_a1_number_id" input_type="OF13A Number ID" location="Body" maxlength="3" name="_056_of13a_a1_number_id" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_056_of13a_a1_number_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_of13b_a1">
              					<input disabled="disabled" id="_057_of13b_a1_" input_type="OF13B " location="Body" name="_057_of13b_a1_" type="hidden" value=":LINK/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Data source scheme</span>
              						<input class="template_selection" disabled="disabled" id="check_of13b_data_source_scheme_a1" name="check_of13b_data_source_scheme_a1" type="checkbox"/>
              						<div id="div_opt_of13b_data_source_scheme_a1">
              							<input data-swift="8c" disabled="disabled" id="_058_of13b_a1_data_source_scheme" input_type="OF13B Data Source Scheme" location="Body" maxlength="8" name="_058_of13b_a1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_058_of13b_a1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              						</div>
              					</div>
              					<input disabled="disabled" id="_059_of13b_a1_" input_type="OF13B " location="Body" name="_059_of13b_a1_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Number</span>
              						<input class="template_selection" disabled="disabled" id="check_of13b_number_a1" name="check_of13b_number_a1" type="checkbox"/>
              						<div id="div_opt_of13b_number_a1">
              							<input data-swift="30x" disabled="disabled" id="_0510_of13b_a1_number" input_type="OF13B Number" location="Body" maxlength="30" name="_0510_of13b_a1_number" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0510_of13b_a1_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              						</div>
              					</div>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF20A</span>
              			<span class="label">Reference</span>
              			<select class="selection_div mandatory" disabled="disabled" id="type_mf20_a1" input_type="MF20A Qualifier" location="Body" name="type_mf20_a1">
              				<option value="">	</option>
              				<option value="c">C - Qualifier</option>
              				<option value="n">N - Reference</option>
              				<option value="u">U - UTI Reference</option>
              			</select>
              			<div id="div_mf20c_a1">
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Qualifier</span>
              					<select class="mandatory" disabled="disabled" id="_0512_mf20c_a1_qualifier" input_type="MF20C Qualifier" location="Body" name="_0512_mf20c_a1_qualifier">
              						<option value="">	</option>
              						<option value=":POOL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':POOL//'}"> selected="true" </c:if></c:if></c:forEach>>
              							POOL
              						</option>
              						<option value=":PREA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':PREA//'}"> selected="true" </c:if></c:if></c:forEach>>
              							PREA
              						</option>
              						<option value=":PREV//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':PREV//'}"> selected="true" </c:if></c:if></c:forEach>>
              							PREV
              						</option>
              						<option value=":RELA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':RELA//'}"> selected="true" </c:if></c:if></c:forEach>>
              							RELA
              						</option>
              						<option value=":TRRF//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':TRRF//'}"> selected="true" </c:if></c:if></c:forEach>>
              							TRRF
              						</option>
              						<option value=":COMM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':COMM//'}"> selected="true" </c:if></c:if></c:forEach>>
              							COMM
              						</option>
              						<option value=":COLR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':COLR//'}"> selected="true" </c:if></c:if></c:forEach>>
              							COLR
              						</option>
              						<option value=":CERT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':CERT//'}"> selected="true" </c:if></c:if></c:forEach>>
              							CERT
              						</option>
              						<option value=":CORP//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':CORP//'}"> selected="true" </c:if></c:if></c:forEach>>
              							CORP
              						</option>
              						<option value=":CLCI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':CLCI//'}"> selected="true" </c:if></c:if></c:forEach>>
              							CLCI
              						</option>
              						<option value=":CLTR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':CLTR//'}"> selected="true" </c:if></c:if></c:forEach>>
              							CLTR
              						</option>
              						<option value=":PCTI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':PCTI//'}"> selected="true" </c:if></c:if></c:forEach>>
              							PCTI
              						</option>
              						<option value=":TRCI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':TRCI//'}"> selected="true" </c:if></c:if></c:forEach>>
              							TRCI
              						</option>
              						<option value=":TCTR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0512_mf20c_a1_qualifier'}"><c:if test="${item.detail==':TCTR//'}"> selected="true" </c:if></c:if></c:forEach>>
              							TCTR
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Reference</span>
              					<input class="mandatory" data-swift="16x" disabled="disabled" id="_0513_mf20c_a1_reference" input_type="MF20C Reference" location="Body" maxlength="16" name="_0513_mf20c_a1_reference" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0513_mf20c_a1_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div id="div_mf20n_a1">
              				<input disabled="disabled" id="_0514_mf20n_a1_" input_type="MF20N " location="Body" name="_0514_mf20n_a1_" type="hidden" value=":NONC//"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Reference</span>
              					<input class="mandatory" data-swift="3x5" disabled="disabled" id="_0515_mf20n_a1_reference" input_type="MF20N Reference" location="Body" maxlength="35" name="_0515_mf20n_a1_reference" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0515_mf20n_a1_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div id="div_mf20u_a1">
              				<input disabled="disabled" id="_0516_mf20u_a1_" input_type="MF20U " location="Body" name="_0516_mf20u_a1_" type="hidden" value=":TRRF//"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Reference</span>
              					<input class="mandatory" data-swift="52x" disabled="disabled" id="_0517_mf20u_a1_reference" input_type="MF20U Reference" location="Body" maxlength="52" name="_0517_mf20u_a1_reference" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0517_mf20u_a1_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF36A</span>
              			<span class="label">Quantity of Financial Instrument</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of36a_a1" name="check_of36a_a1" type="checkbox"/>
              			<div id="div_opt_of36a_a1">
              				<select class="selection_div" disabled="disabled" id="type_of36_a1" input_type="OF36A Quantity of financial instrument" location="Body" name="type_of36_a1">
              					<option value="">	</option>
              					<option value="b">B - Quantity</option>
              					<option value="d">D - Quantity of Digital Tokens</option>
              				</select>
              				<div id="div_of36b_a1">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_0519_of36b_a1_qualifier" input_type="OF36B Qualifier" location="Body" name="_0519_of36b_a1_qualifier">
              							<option value="">	</option>
              							<option value=":PAIR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0519_of36b_a1_qualifier'}"><c:if test="${item.detail==':PAIR/'}"> selected="true" </c:if></c:if></c:forEach>>
              								PAIR
              							</option>
              							<option value=":TURN/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0519_of36b_a1_qualifier'}"><c:if test="${item.detail==':TURN/'}"> selected="true" </c:if></c:if></c:forEach>>
              								TURN
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Quantity type code</span>
              						<select class="mandatory" disabled="disabled" id="_0520_of36b_a1_quantity_type_code" input_type="OF36B Quantity Type Code" location="Body" name="_0520_of36b_a1_quantity_type_code">
              							<option value="">	</option>
              							<option value="/AMOR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0520_of36b_a1_quantity_type_code'}"><c:if test="${item.detail=='/AMOR/'}"> selected="true" </c:if></c:if></c:forEach>>
              								AMOR
              							</option>
              							<option value="/FAMT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0520_of36b_a1_quantity_type_code'}"><c:if test="${item.detail=='/FAMT/'}"> selected="true" </c:if></c:if></c:forEach>>
              								FAMT
              							</option>
              							<option value="/UNIT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0520_of36b_a1_quantity_type_code'}"><c:if test="${item.detail=='/UNIT/'}"> selected="true" </c:if></c:if></c:forEach>>
              								UNIT
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Quantity</span>
              						<input class="mandatory" data-swift="15d" disabled="disabled" id="_0521_of36b_a1_quantity" input_type="OF36B Quantity" location="Body" maxlength="15" name="_0521_of36b_a1_quantity" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0521_of36b_a1_quantity'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_of36d_a1">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_0522_of36d_a1_qualifier" input_type="OF36D Qualifier" location="Body" name="_0522_of36d_a1_qualifier">
              							<option value="">	</option>
              							<option value=":PAIR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0522_of36d_a1_qualifier'}"><c:if test="${item.detail==':PAIR/'}"> selected="true" </c:if></c:if></c:forEach>>
              								PAIR
              							</option>
              							<option value=":TURN/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0522_of36d_a1_qualifier'}"><c:if test="${item.detail==':TURN/'}"> selected="true" </c:if></c:if></c:forEach>>
              								TURN
              							</option>
              						</select>
              					</div>
              					<input disabled="disabled" id="_0523_of36d_a1_" input_type="OF36D " location="Body" name="_0523_of36d_a1_" type="hidden" value="/DITU/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Quantity of digital tokens</span>
              						<input class="mandatory" data-swift="30d" disabled="disabled" id="_0524_of36d_a1_quantity_of_digital_tokens" input_type="OF36D Quantity of Digital Tokens" location="Body" maxlength="30" name="_0524_of36d_a1_quantity_of_digital_tokens" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0524_of36d_a1_quantity_of_digital_tokens'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16S</span>
              			<span class="label">End of Block</span>
              			<input disabled="disabled" id="_0526_mf16s_a1_" input_type="MF16S " location="Body" name="_0526_mf16s_a1_" type="hidden" value="LINK"/>
              		</div>
              	</div>
              	<div id="container_a1">
              		<input class="cust-btn" data-count="0" data-id="a1" onclick="addTemplateContainer(this)" type="button" value="Add Field A1"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_a1">0</span>, Max: <span class="max_val" id="max_occ_a1">0</span>, Count: <span class="count_val" id="cur_occ_a1">0</span>
              		</span>
              	</div>
              	<h2 class="header-title">
              		End of Subsequence A1 Linkages
              	</h2>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF16S</span>
              	<span class="label">End of Block</span>
              	<input id="_060_mf16s_a_end_of_block" input_type="MF16S End of Block" location="Body" name="_060_mf16s_a_end_of_block" type="hidden" value="GENL"/>
              </div>
              <hr/>
              <h2 class="header-title">
              	End of Sequence A General Information
              </h2>
              <h2 class="header-title">
              	Mandatory Sequence B Trade Details
              </h2>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF16R</span>
              	<span class="label">Start of Block</span>
              	<input id="_070_mf16r_b_start_of_block" input_type="MF16R Start of Block" location="Body" name="_070_mf16r_b_start_of_block" type="hidden" value="TRADDET"/>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF94A</span>
              	<span class="label">Place</span>
              	<div class="template_container" id="template_of94a_b" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_of94a_b">Count</span>
              		</div>
              		<select class="selection_div" disabled="disabled" id="type_of94_b" input_type="OF94A Place" location="Body" name="type_of94_b">
              			<option value="">	</option>
              			<option value="b">B - Data Source Scheme - Place Code - Narrative</option>
              			<option value="h">H - Identifier Code</option>
              			<option value="l">L - Legal Entity Identifier</option>
              		</select>
              		<div id="div_of94b_b">
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_080_of94b_b_qualifier" input_type="OF94B Qualifier" location="Body" name="_080_of94b_b_qualifier">
              					<option value="">	</option>
              					<option value=":TRAD/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of94b_b_qualifier'}"><c:if test="${item.detail==':TRAD/'}"> selected="true" </c:if></c:if></c:forEach>>
              						TRAD
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Data source scheme</span>
              				<input disabled="disabled" id="check_of94b_data_source_scheme_b" name="check_of94b_data_source_scheme_b" type="checkbox"/>
              				<div id="div_opt_of94b_data_source_scheme_b">
              					<input data-swift="8c" disabled="disabled" id="_081_of94b_b_data_source_scheme" input_type="OF94B Data Source Scheme" location="Body" maxlength="8" name="_081_of94b_b_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of94b_b_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<input disabled="disabled" id="_082_of94b_b_" input_type="OF94B " location="Body" name="_082_of94b_b_" type="hidden" value="/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Place code</span>
              				<input class="mandatory" data-swift="4!c" disabled="disabled" id="_083_of94b_b_place_code" input_type="OF94B Place Code" location="Body" maxlength="4" name="_083_of94b_b_place_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_of94b_b_place_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Narrative</span>
              				<input disabled="disabled" id="check_of94b_narrative_b" name="check_of94b_narrative_b" type="checkbox"/>
              				<div id="div_opt_of94b_narrative_b">
              					<input data-swift="30x" disabled="disabled" id="_085_of94b_b_narrative" input_type="OF94B Narrative" location="Body" maxlength="30" name="_085_of94b_b_narrative" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_085_of94b_b_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					<input disabled="disabled" id="_084_of94b_b_" input_type="OF94B " location="Body" name="_084_of94b_b_" type="hidden" value="/"/>
              				</div>
              			</div>
              		</div>
              		<div id="div_of94h_b">
              			<input disabled="disabled" id="_086_of94h_b_" input_type="OF94H " location="Body" name="_086_of94h_b_" type="hidden" value=":CLEA/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Identifier code</span>
              				<input class="mandatory" data-swift="4!a2!a2!c[3!c]" disabled="disabled" id="_087_of94h_b_identifier_code" input_type="OF94H Identifier Code" location="Body" maxlength="11" name="_087_of94h_b_identifier_code" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_087_of94h_b_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_of94l_b">
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_088_of94l_b_qualifier" input_type="OF94L Qualifier" location="Body" name="_088_of94l_b_qualifier">
              					<option value="">	</option>
              					<option value=":CLEA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_088_of94l_b_qualifier'}"><c:if test="${item.detail==':CLEA//'}"> selected="true" </c:if></c:if></c:forEach>>
              						CLEA
              					</option>
              					<option value=":TRAD//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_088_of94l_b_qualifier'}"><c:if test="${item.detail==':TRAD//'}"> selected="true" </c:if></c:if></c:forEach>>
              						TRAD
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Legal entity identifier</span>
              				<input class="mandatory" data-swift="18!c2!n" disabled="disabled" id="_089_of94l_b_legal_entity_identifier" input_type="OF94L Legal Entity Identifier" location="Body" maxlength="20" name="_089_of94l_b_legal_entity_identifier" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_089_of94l_b_legal_entity_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              	</div>
              	<div id="container_of94a_b">
              		<input class="cust-btn" data-count="0" data-id="of94a_b" onclick="addContainer(this)" type="button" value="Add Field OF94A"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_of94a_b">0</span>, Max: <span class="max_val" id="max_occ_of94a_b">0</span>, Count: <span class="count_val" id="cur_occ_of94a_b">0</span>
              		</span>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF98A</span>
              	<span class="label">Preparation Date/Time</span>
              	<div class="template_container" id="template_mf98a_b" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_mf98a_b">Count</span>
              		</div>
              		<select class="selection_div" disabled="disabled" id="type_mf98_b" input_type="MF98A Preparation date/time" location="Body" name="type_mf98_b">
              			<option value="">	</option>
              			<option value="a">A - Date</option>
              			<option value="b">B - Data Source Scheme - Date Code</option>
              			<option value="c">C - Date - Time</option>
              			<option value="e">E - Date - Time - Decimals - UTC Indicator</option>
              		</select>
              		<div id="div_mf98a_b">
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_090_mf98a_b_qualifier" input_type="MF98A Qualifier" location="Body" name="_090_mf98a_b_qualifier">
              					<option value="">	</option>
              					<option value=":SETT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf98a_b_qualifier'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>
              						SETT
              					</option>
              					<option value=":TRAD//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf98a_b_qualifier'}"><c:if test="${item.detail==':TRAD//'}"> selected="true" </c:if></c:if></c:forEach>>
              						TRAD
              					</option>
              					<option value=":ADEL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf98a_b_qualifier'}"><c:if test="${item.detail==':ADEL//'}"> selected="true" </c:if></c:if></c:forEach>>
              						ADEL
              					</option>
              					<option value=":CERT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_090_mf98a_b_qualifier'}"><c:if test="${item.detail==':CERT//'}"> selected="true" </c:if></c:if></c:forEach>>
              						CERT
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Date</span>
              				<input class="mandatory" data-swift="8!n" disabled="disabled" id="_091_mf98a_b_date" input_type="MF98A Date" location="Body" maxlength="8" name="_091_mf98a_b_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_091_mf98a_b_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_mf98b_b">
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_092_mf98b_b_qualifier" input_type="MF98B Qualifier" location="Body" name="_092_mf98b_b_qualifier">
              					<option value="">	</option>
              					<option value=":SETT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_mf98b_b_qualifier'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>
              						SETT
              					</option>
              					<option value=":TRAD//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_092_mf98b_b_qualifier'}"><c:if test="${item.detail==':TRAD//'}"> selected="true" </c:if></c:if></c:forEach>>
              						TRAD
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Data source scheme</span>
              				<input disabled="disabled" id="check_mf98b_data_source_scheme_b" name="check_mf98b_data_source_scheme_b" type="checkbox"/>
              				<div id="div_opt_mf98b_data_source_scheme_b">
              					<input data-swift="8c" disabled="disabled" id="_093_mf98b_b_data_source_scheme" input_type="MF98B Data Source Scheme" location="Body" maxlength="8" name="_093_mf98b_b_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_093_mf98b_b_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<input disabled="disabled" id="_094_mf98b_b_" input_type="MF98B " location="Body" name="_094_mf98b_b_" type="hidden" value="/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Date code</span>
              				<input class="mandatory" data-swift="4!c" disabled="disabled" id="_095_mf98b_b_date_code" input_type="MF98B Date Code" location="Body" maxlength="4" name="_095_mf98b_b_date_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_095_mf98b_b_date_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_mf98c_b">
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_096_mf98c_b_qualifier" input_type="MF98C Qualifier" location="Body" name="_096_mf98c_b_qualifier">
              					<option value="">	</option>
              					<option value=":SETT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_mf98c_b_qualifier'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>
              						SETT
              					</option>
              					<option value=":TRAD//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_mf98c_b_qualifier'}"><c:if test="${item.detail==':TRAD//'}"> selected="true" </c:if></c:if></c:forEach>>
              						TRAD
              					</option>
              					<option value=":ADEL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_mf98c_b_qualifier'}"><c:if test="${item.detail==':ADEL//'}"> selected="true" </c:if></c:if></c:forEach>>
              						ADEL
              					</option>
              					<option value=":CERT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_096_mf98c_b_qualifier'}"><c:if test="${item.detail==':CERT//'}"> selected="true" </c:if></c:if></c:forEach>>
              						CERT
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Date</span>
              				<input class="mandatory" data-swift="8!n" disabled="disabled" id="_097_mf98c_b_date" input_type="MF98C Date" location="Body" maxlength="8" name="_097_mf98c_b_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_097_mf98c_b_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Time</span>
              				<input class="mandatory" data-swift="6!n" disabled="disabled" id="_098_mf98c_b_time" input_type="MF98C Time" location="Body" maxlength="6" name="_098_mf98c_b_time" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_098_mf98c_b_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_mf98e_b">
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_099_mf98e_b_qualifier" input_type="MF98E Qualifier" location="Body" name="_099_mf98e_b_qualifier">
              					<option value="">	</option>
              					<option value=":TRAD//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_099_mf98e_b_qualifier'}"><c:if test="${item.detail==':TRAD//'}"> selected="true" </c:if></c:if></c:forEach>>
              						TRAD
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Date</span>
              				<input class="mandatory" data-swift="8!n" disabled="disabled" id="_0910_mf98e_b_date" input_type="MF98E Date" location="Body" maxlength="8" name="_0910_mf98e_b_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0910_mf98e_b_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Time</span>
              				<input class="mandatory" data-swift="6!n" disabled="disabled" id="_0911_mf98e_b_time" input_type="MF98E Time" location="Body" maxlength="6" name="_0911_mf98e_b_time" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0911_mf98e_b_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Decimals</span>
              				<input disabled="disabled" id="check_mf98e_decimals_b" name="check_mf98e_decimals_b" type="checkbox"/>
              				<div id="div_opt_mf98e_decimals_b">
              					<input data-swift="3n" disabled="disabled" id="_0913_mf98e_b_decimals" input_type="MF98E Decimals" location="Body" maxlength="3" name="_0913_mf98e_b_decimals" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0913_mf98e_b_decimals'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					<input disabled="disabled" id="_0912_mf98e_b_" input_type="MF98E " location="Body" name="_0912_mf98e_b_" type="hidden" value=","/>
              				</div>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Utc indicator</span>
              				<input disabled="disabled" id="check_mf98e_utc_indicator_b" name="check_mf98e_utc_indicator_b" type="checkbox"/>
              				<div id="div_opt_mf98e_utc_indicator_b">
              					<input data-swift="[N]2!n[2!n]" disabled="disabled" id="_0915_mf98e_b_utc_indicator" input_type="MF98E UTC Indicator" location="Body" maxlength="5" name="_0915_mf98e_b_utc_indicator" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_0915_mf98e_b_utc_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					<input disabled="disabled" id="_0914_mf98e_b_" input_type="MF98E " location="Body" name="_0914_mf98e_b_" type="hidden" value="/"/>
              				</div>
              			</div>
              		</div>
              	</div>
              	<div id="container_mf98a_b">
              		<input class="cust-btn" data-count="0" data-id="mf98a_b" onclick="addContainer(this)" type="button" value="Add Field MF98A"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_mf98a_b">1</span>, Max: <span class="max_val" id="max_occ_mf98a_b">4</span>, Count: <span class="count_val" id="cur_occ_mf98a_b">0</span>
              		</span>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF90A</span>
              	<span class="label">Deal Price</span>
              	<input class="checkbox_div" id="check_of90a_b" name="check_of90a_b" type="checkbox"/>
              	<div id="div_opt_of90a_b">
              		<select class="selection_div" disabled="disabled" id="type_of90_b" input_type="OF90A Deal price" location="Body" name="type_of90_b">
              			<option value="">	</option>
              			<option value="a">A - Percentage Type Code - Sign - Price</option>
              			<option value="b">B - Amount Type Code - Currency Code - Price</option>
              		</select>
              		<div id="div_of90a_b">
              			<input disabled="disabled" id="_100_of90a_b_" input_type="OF90A " location="Body" name="_100_of90a_b_" type="hidden" value=":DEAL/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Percentage type code</span>
              				<select class="mandatory" disabled="disabled" id="_101_of90a_b_percentage_type_code" input_type="OF90A Percentage Type Code" location="Body" name="_101_of90a_b_percentage_type_code">
              					<option value="">	</option>
              					<option value="/DISC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of90a_b_percentage_type_code'}"><c:if test="${item.detail=='/DISC/'}"> selected="true" </c:if></c:if></c:forEach>>
              						DISC
              					</option>
              					<option value="/PRCT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of90a_b_percentage_type_code'}"><c:if test="${item.detail=='/PRCT/'}"> selected="true" </c:if></c:if></c:forEach>>
              						PRCT
              					</option>
              					<option value="/PREM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of90a_b_percentage_type_code'}"><c:if test="${item.detail=='/PREM/'}"> selected="true" </c:if></c:if></c:forEach>>
              						PREM
              					</option>
              					<option value="/YIEL/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of90a_b_percentage_type_code'}"><c:if test="${item.detail=='/YIEL/'}"> selected="true" </c:if></c:if></c:forEach>>
              						YIEL
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Sign</span>
              				<input disabled="disabled" id="check_of90a_sign_b" name="check_of90a_sign_b" type="checkbox"/>
              				<div id="div_opt_of90a_sign_b">
              					<input data-swift="N" disabled="disabled" id="_102_of90a_b_sign" input_type="OF90A Sign" location="Body" maxlength="1" name="_102_of90a_b_sign" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_of90a_b_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Price</span>
              				<input class="mandatory" data-swift="15d" disabled="disabled" id="_103_of90a_b_price" input_type="OF90A Price" location="Body" maxlength="15" name="_103_of90a_b_price" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_of90a_b_price'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_of90b_b">
              			<input disabled="disabled" id="_104_of90b_b_" input_type="OF90B " location="Body" name="_104_of90b_b_" type="hidden" value=":DEAL/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Amount type code</span>
              				<select class="mandatory" disabled="disabled" id="_105_of90b_b_amount_type_code" input_type="OF90B Amount Type Code" location="Body" name="_105_of90b_b_amount_type_code">
              					<option value="">	</option>
              					<option value="/ACTU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_105_of90b_b_amount_type_code'}"><c:if test="${item.detail=='/ACTU/'}"> selected="true" </c:if></c:if></c:forEach>>
              						ACTU
              					</option>
              					<option value="/DISC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_105_of90b_b_amount_type_code'}"><c:if test="${item.detail=='/DISC/'}"> selected="true" </c:if></c:if></c:forEach>>
              						DISC
              					</option>
              					<option value="/NEGA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_105_of90b_b_amount_type_code'}"><c:if test="${item.detail=='/NEGA/'}"> selected="true" </c:if></c:if></c:forEach>>
              						NEGA
              					</option>
              					<option value="/PREM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_105_of90b_b_amount_type_code'}"><c:if test="${item.detail=='/PREM/'}"> selected="true" </c:if></c:if></c:forEach>>
              						PREM
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Currency</span>
              				<input class="mandatory" data-swift="3!a" disabled="disabled" id="_106_of90b_b_currency" input_type="OF90B Currency" location="Body" maxlength="3" name="_106_of90b_b_currency" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_106_of90b_b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Price</span>
              				<input class="mandatory" data-swift="15d" disabled="disabled" id="_107_of90b_b_price" input_type="OF90B Price" location="Body" maxlength="15" name="_107_of90b_b_price" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_107_of90b_b_price'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF99A</span>
              	<span class="label">Number of Days Accrued</span>
              	<input class="checkbox_div" id="check_of99a_b" name="check_of99a_b" type="checkbox"/>
              	<div id="div_opt_of99a_b">
              		<input disabled="disabled" id="_110_of99a_b_qualifier" input_type="OF99A Qualifier" location="Body" name="_110_of99a_b_qualifier" type="hidden" value=":DAAC//"/>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Sign</span>
              			<input disabled="disabled" id="check_of99a_sign_b" name="check_of99a_sign_b" type="checkbox"/>
              			<div id="div_opt_of99a_sign_b">
              				<input data-swift="N" disabled="disabled" id="_111_of99a_b_sign" input_type="OF99A Sign" location="Body" maxlength="1" name="_111_of99a_b_sign" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_of99a_b_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Number</span>
              			<input class="mandatory" data-swift="3!d" disabled="disabled" id="_112_of99a_b_number" input_type="OF99A Number" location="Body" maxlength="3" name="_112_of99a_b_number" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_112_of99a_b_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              		</div>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF35B</span>
              	<span class="label">Identification of the Financial Instrument</span>
              	<input id="_120_mf35b_b_" input_type="MF35B " location="Body" name="_120_mf35b_b_" type="hidden" value="ISIN "/>
              	<div class="form-row">
              		<span class="label_body">&nbsp;</span>
              		<span class="label">Identification of security</span>
              		<input class="mandatory" data-swift="12!c" id="_121_mf35b_b_identification_of_security" input_type="MF35B Identification of Security" location="Body" maxlength="12" name="_121_mf35b_b_identification_of_security" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_121_mf35b_b_identification_of_security'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              	</div>
              	<div class="form-row">
              		<span class="label_body">&nbsp;</span>
              		<span class="label">Description of security</span>
              		<input id="check_mf35b_description_of_security_b" name="check_mf35b_description_of_security_b" type="checkbox"/>
              		<div id="div_opt_mf35b_description_of_security_b">
              			<textarea cols="35" data-swift="4*35x" id="_122_mf35b_b_description_of_security" input_type="MF35B Description of Security" location="Body" name="_122_mf35b_b_description_of_security" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_122_mf35b_b_description_of_security'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              		</div>
              	</div>
              </div>
              <hr/>
              <div>
              	<h2 class="header-title">
              		Mandatory Subsequence B1 Financial Instrument Attributes
              	</h2>
              	<hr/>
              	<div class="form-row">
              		<span class="label_body">MF16R</span>
              		<span class="label">Start of Block</span>
              		<input id="_130_mf16r_b1_start_of_block" input_type="MF16R Start of Block" location="Body" name="_130_mf16r_b1_start_of_block" type="hidden" value="FIA"/>
              	</div>
              	<div class="form-row">
              		<span class="label_body">OF94B</span>
              		<span class="label">Place of Listing</span>
              		<input class="checkbox_div" id="check_of94b_b1" name="check_of94b_b1" type="checkbox"/>
              		<div id="div_opt_of94b_b1">
              			<input disabled="disabled" id="_131_of94b_b1_" input_type="OF94B " location="Body" name="_131_of94b_b1_" type="hidden" value=":PLIS/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Data source scheme</span>
              				<input disabled="disabled" id="check_of94b_data_source_scheme_b1" name="check_of94b_data_source_scheme_b1" type="checkbox"/>
              				<div id="div_opt_of94b_data_source_scheme_b1">
              					<input data-swift="8c" disabled="disabled" id="_132_of94b_b1_data_source_scheme" input_type="OF94B Data Source Scheme" location="Body" maxlength="8" name="_132_of94b_b1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_132_of94b_b1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<input disabled="disabled" id="_133_of94b_b1_" input_type="OF94B " location="Body" name="_133_of94b_b1_" type="hidden" value="/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Place code</span>
              				<input class="mandatory" data-swift="4!c" disabled="disabled" id="_134_of94b_b1_place_code" input_type="OF94B Place Code" location="Body" maxlength="4" name="_134_of94b_b1_place_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_134_of94b_b1_place_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<input disabled="disabled" id="_135_of94b_b1_" input_type="OF94B " location="Body" name="_135_of94b_b1_" type="hidden" value="/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Narrative</span>
              				<input class="mandatory" data-swift="30x" disabled="disabled" id="_136_of94b_b1_narrative" input_type="OF94B Narrative" location="Body" maxlength="30" name="_136_of94b_b1_narrative" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_136_of94b_b1_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              	</div>
              	<div class="form-row">
              		<span class="label_body">OF22F</span>
              		<span class="label">Indicator</span>
              		<div class="template_container" id="template_of22f_b1" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" id="label_count_of22f_b1">Count</span>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_137_of22f_b1_qualifier" input_type="OF22F Qualifier" location="Body" name="_137_of22f_b1_qualifier">
              					<option value="">	</option>
              					<option value=":MICO/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_137_of22f_b1_qualifier'}"><c:if test="${item.detail==':MICO/'}"> selected="true" </c:if></c:if></c:forEach>>
              						MICO
              					</option>
              					<option value=":FORM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_137_of22f_b1_qualifier'}"><c:if test="${item.detail==':FORM/'}"> selected="true" </c:if></c:if></c:forEach>>
              						FORM
              					</option>
              					<option value=":PFRE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_137_of22f_b1_qualifier'}"><c:if test="${item.detail==':PFRE/'}"> selected="true" </c:if></c:if></c:forEach>>
              						PFRE
              					</option>
              					<option value=":PAYS/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_137_of22f_b1_qualifier'}"><c:if test="${item.detail==':PAYS/'}"> selected="true" </c:if></c:if></c:forEach>>
              						PAYS
              					</option>
              					<option value=":CFRE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_137_of22f_b1_qualifier'}"><c:if test="${item.detail==':CFRE/'}"> selected="true" </c:if></c:if></c:forEach>>
              						CFRE
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Data source scheme</span>
              				<input disabled="disabled" id="check_of22f_data_source_scheme_b1" name="check_of22f_data_source_scheme_b1" type="checkbox"/>
              				<div id="div_opt_of22f_data_source_scheme_b1">
              					<input data-swift="8c" disabled="disabled" id="_138_of22f_b1_data_source_scheme" input_type="OF22F Data Source Scheme" location="Body" maxlength="8" name="_138_of22f_b1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_138_of22f_b1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<input disabled="disabled" id="_139_of22f_b1_" input_type="OF22F " location="Body" name="_139_of22f_b1_" type="hidden" value="/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Indicator</span>
              				<input class="mandatory" data-swift="4!c" disabled="disabled" id="_1310_of22f_b1_indicator" input_type="OF22F Indicator" location="Body" maxlength="4" name="_1310_of22f_b1_indicator" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1310_of22f_b1_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="container_of22f_b1">
              			<input class="cust-btn" data-count="0" data-id="of22f_b1" onclick="addContainer(this)" type="button" value="Add Field OF22F"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of22f_b1">0</span>, Max: <span class="max_val" id="max_occ_of22f_b1">5</span>, Count: <span class="count_val" id="cur_occ_of22f_b1">0</span>
              			</span>
              		</div>
              	</div>
              	<div class="form-row">
              		<span class="label_body">OF12A</span>
              		<span class="label">Type of Financial Instrument</span>
              		<div class="template_container" id="template_of12a_b1" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" id="label_count_of12a_b1">Count</span>
              			</div>
              			<select class="selection_div" disabled="disabled" id="type_of12_b1" input_type="OF12A Type of financial instrument" location="Body" name="type_of12_b1">
              				<option value="">	</option>
              				<option value="a">A - Data Source Scheme - Instrument Code or Description</option>
              				<option value="b">B - Data Source Scheme - Instrument Type Code</option>
              				<option value="c">C - CFI Code</option>
              			</select>
              			<div id="div_of12a_b1">
              				<input disabled="disabled" id="_1311_of12a_b1_" input_type="OF12A " location="Body" name="_1311_of12a_b1_" type="hidden" value=":CLAS/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Data source scheme</span>
              					<input disabled="disabled" id="check_of12a_data_source_scheme_b1" name="check_of12a_data_source_scheme_b1" type="checkbox"/>
              					<div id="div_opt_of12a_data_source_scheme_b1">
              						<input data-swift="8c" disabled="disabled" id="_1312_of12a_b1_data_source_scheme" input_type="OF12A Data Source Scheme" location="Body" maxlength="8" name="_1312_of12a_b1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1312_of12a_b1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<input disabled="disabled" id="_1313_of12a_b1_" input_type="OF12A " location="Body" name="_1313_of12a_b1_" type="hidden" value="/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Instrument code or description</span>
              					<input class="mandatory" data-swift="30x" disabled="disabled" id="_1314_of12a_b1_instrument_code_or_description" input_type="OF12A Instrument Code or Description" location="Body" maxlength="30" name="_1314_of12a_b1_instrument_code_or_description" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1314_of12a_b1_instrument_code_or_description'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div id="div_of12b_b1">
              				<input disabled="disabled" id="_1315_of12b_b1_" input_type="OF12B " location="Body" name="_1315_of12b_b1_" type="hidden" value=":CLAS/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Data source scheme</span>
              					<input disabled="disabled" id="check_of12b_data_source_scheme_b1" name="check_of12b_data_source_scheme_b1" type="checkbox"/>
              					<div id="div_opt_of12b_data_source_scheme_b1">
              						<input data-swift="8c" disabled="disabled" id="_1316_of12b_b1_data_source_scheme" input_type="OF12B Data Source Scheme" location="Body" maxlength="8" name="_1316_of12b_b1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1316_of12b_b1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<input disabled="disabled" id="_1317_of12b_b1_" input_type="OF12B " location="Body" name="_1317_of12b_b1_" type="hidden" value="/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Instrument code or description</span>
              					<input class="mandatory" data-swift="4!c" disabled="disabled" id="_1318_of12b_b1_instrument_code_or_description" input_type="OF12B Instrument Code or Description" location="Body" maxlength="4" name="_1318_of12b_b1_instrument_code_or_description" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1318_of12b_b1_instrument_code_or_description'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div id="div_of12c_b1">
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Qualifier</span>
              					<select class="mandatory" disabled="disabled" id="_1319_of12c_b1_qualifier" input_type="OF12C Qualifier" location="Body" name="_1319_of12c_b1_qualifier">
              						<option value="">	</option>
              						<option value=":OPST//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1319_of12c_b1_qualifier'}"><c:if test="${item.detail==':OPST//'}"> selected="true" </c:if></c:if></c:forEach>>
              							OPST
              						</option>
              						<option value=":OPTI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1319_of12c_b1_qualifier'}"><c:if test="${item.detail==':OPTI//'}"> selected="true" </c:if></c:if></c:forEach>>
              							OPTI
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Cfi code</span>
              					<input class="mandatory" data-swift="6!c" disabled="disabled" id="_1320_of12c_b1_cfi_code" input_type="OF12C CFI Code" location="Body" maxlength="6" name="_1320_of12c_b1_cfi_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1320_of12c_b1_cfi_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div id="container_of12a_b1">
              			<input class="cust-btn" data-count="0" data-id="of12a_b1" onclick="addContainer(this)" type="button" value="Add Field OF12A"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of12a_b1">0</span>, Max: <span class="max_val" id="max_occ_of12a_b1">3</span>, Count: <span class="count_val" id="cur_occ_of12a_b1">0</span>
              			</span>
              		</div>
              	</div>
              	<div class="form-row">
              		<span class="label_body">OF11A</span>
              		<span class="label">Currency of Denomination</span>
              		<input class="checkbox_div" id="check_of11a_b1" name="check_of11a_b1" type="checkbox"/>
              		<div id="div_opt_of11a_b1">
              			<input disabled="disabled" id="_1322_of11a_b1_" input_type="OF11A " location="Body" name="_1322_of11a_b1_" type="hidden" value=":DENO//"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Currency code</span>
              				<input disabled="disabled" id="check_of11a_currency_code_b1" name="check_of11a_currency_code_b1" type="checkbox"/>
              				<div id="div_opt_of11a_currency_code_b1">
              					<input data-swift="3!c" disabled="disabled" id="_1323_of11a_b1_currency_code" input_type="OF11A Currency Code" location="Body" maxlength="3" name="_1323_of11a_b1_currency_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1323_of11a_b1_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              	</div>
              	<div class="form-row">
              		<span class="label_body">OF98A</span>
              		<span class="label">Date/Time</span>
              		<div class="template_container" id="template_of98a_b1" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" id="label_count_of98a_b1">Count</span>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_1324_of98a_b1_qualifier" input_type="OF98A Qualifier" location="Body" name="_1324_of98a_b1_qualifier">
              					<option value="">	</option>
              					<option value=":COUP//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1324_of98a_b1_qualifier'}"><c:if test="${item.detail==':COUP//'}"> selected="true" </c:if></c:if></c:forEach>>
              						COUP
              					</option>
              					<option value=":EXPI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1324_of98a_b1_qualifier'}"><c:if test="${item.detail==':EXPI//'}"> selected="true" </c:if></c:if></c:forEach>>
              						EXPI
              					</option>
              					<option value=":FRNR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1324_of98a_b1_qualifier'}"><c:if test="${item.detail==':FRNR//'}"> selected="true" </c:if></c:if></c:forEach>>
              						FRNR
              					</option>
              					<option value=":MATU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1324_of98a_b1_qualifier'}"><c:if test="${item.detail==':MATU//'}"> selected="true" </c:if></c:if></c:forEach>>
              						MATU
              					</option>
              					<option value=":ISSU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1324_of98a_b1_qualifier'}"><c:if test="${item.detail==':ISSU//'}"> selected="true" </c:if></c:if></c:forEach>>
              						ISSU
              					</option>
              					<option value=":CALD//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1324_of98a_b1_qualifier'}"><c:if test="${item.detail==':CALD//'}"> selected="true" </c:if></c:if></c:forEach>>
              						CALD
              					</option>
              					<option value=":PUTT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1324_of98a_b1_qualifier'}"><c:if test="${item.detail==':PUTT//'}"> selected="true" </c:if></c:if></c:forEach>>
              						PUTT
              					</option>
              					<option value=":DDTE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1324_of98a_b1_qualifier'}"><c:if test="${item.detail==':DDTE//'}"> selected="true" </c:if></c:if></c:forEach>>
              						DDTE
              					</option>
              					<option value=":FCOU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1324_of98a_b1_qualifier'}"><c:if test="${item.detail==':FCOU//'}"> selected="true" </c:if></c:if></c:forEach>>
              						FCOU
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Date</span>
              				<input class="mandatory" data-swift="8!n" disabled="disabled" id="_1325_of98a_b1_date" input_type="OF98A Date" location="Body" maxlength="8" name="_1325_of98a_b1_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1325_of98a_b1_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="container_of98a_b1">
              			<input class="cust-btn" data-count="0" data-id="of98a_b1" onclick="addContainer(this)" type="button" value="Add Field OF98A"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of98a_b1">0</span>, Max: <span class="max_val" id="max_occ_of98a_b1">9</span>, Count: <span class="count_val" id="cur_occ_of98a_b1">0</span>
              			</span>
              		</div>
              	</div>
              	<div class="form-row">
              		<span class="label_body">OF92A</span>
              		<span class="label">Rate</span>
              		<div class="template_container" id="template_of92a_b1" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" id="label_count_of92a_b1">Count</span>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_1326_of92a_b1_qualifier" input_type="OF92A Qualifier" location="Body" name="_1326_of92a_b1_qualifier">
              					<option value="">	</option>
              					<option value=":PRFC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1326_of92a_b1_qualifier'}"><c:if test="${item.detail==':PRFC//'}"> selected="true" </c:if></c:if></c:forEach>>
              						PRFC
              					</option>
              					<option value=":CUFC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1326_of92a_b1_qualifier'}"><c:if test="${item.detail==':CUFC//'}"> selected="true" </c:if></c:if></c:forEach>>
              						CUFC
              					</option>
              					<option value=":NWFC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1326_of92a_b1_qualifier'}"><c:if test="${item.detail==':NWFC//'}"> selected="true" </c:if></c:if></c:forEach>>
              						NWFC
              					</option>
              					<option value=":INTR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1326_of92a_b1_qualifier'}"><c:if test="${item.detail==':INTR//'}"> selected="true" </c:if></c:if></c:forEach>>
              						INTR
              					</option>
              					<option value=":NXRT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1326_of92a_b1_qualifier'}"><c:if test="${item.detail==':NXRT//'}"> selected="true" </c:if></c:if></c:forEach>>
              						NXRT
              					</option>
              					<option value=":INDX//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1326_of92a_b1_qualifier'}"><c:if test="${item.detail==':INDX//'}"> selected="true" </c:if></c:if></c:forEach>>
              						INDX
              					</option>
              					<option value=":YTMR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1326_of92a_b1_qualifier'}"><c:if test="${item.detail==':YTMR//'}"> selected="true" </c:if></c:if></c:forEach>>
              						YTMR
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Sign</span>
              				<input disabled="disabled" id="check_of92a_sign_b1" name="check_of92a_sign_b1" type="checkbox"/>
              				<div id="div_opt_of92a_sign_b1">
              					<input data-swift="N" disabled="disabled" id="_1327_of92a_b1_sign" input_type="OF92A Sign" location="Body" maxlength="1" name="_1327_of92a_b1_sign" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1327_of92a_b1_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Rate</span>
              				<input class="mandatory" data-swift="15d" disabled="disabled" id="_1328_of92a_b1_rate" input_type="OF92A Rate" location="Body" maxlength="15" name="_1328_of92a_b1_rate" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1328_of92a_b1_rate'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="container_of92a_b1">
              			<input class="cust-btn" data-count="0" data-id="of92a_b1" onclick="addContainer(this)" type="button" value="Add Field OF92A"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of92a_b1">0</span>, Max: <span class="max_val" id="max_occ_of92a_b1">7</span>, Count: <span class="count_val" id="cur_occ_of92a_b1">0</span>
              			</span>
              		</div>
              	</div>
              	<div class="form-row">
              		<span class="label_body">OF13A</span>
              		<span class="label">Number Identification</span>
              		<div class="template_container" id="template_of13a_b1" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" id="label_count_of13a_b1">Count</span>
              			</div>
              			<select class="selection_div" disabled="disabled" id="type_of13_b1" input_type="OF13A Number identification" location="Body" name="type_of13_b1">
              				<option value="">	</option>
              				<option value="a">A - Number Id</option>
              				<option value="b">B - Qualifier - Data Source Scheme - Number</option>
              			</select>
              			<div id="div_of13a_b1">
              				<input disabled="disabled" id="_1329_of13a_b1_" input_type="OF13A " location="Body" name="_1329_of13a_b1_" type="hidden" value=":COUP//"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Number id</span>
              					<input class="mandatory" data-swift="3!c" disabled="disabled" id="_1330_of13a_b1_number_id" input_type="OF13A Number Id" location="Body" maxlength="3" name="_1330_of13a_b1_number_id" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1330_of13a_b1_number_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div id="div_of13b_b1">
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Qualifier</span>
              					<select class="mandatory" disabled="disabled" id="_1331_of13b_b1_qualifier" input_type="OF13B Qualifier" location="Body" name="_1331_of13b_b1_qualifier">
              						<option value="">	</option>
              						<option value=":COUP//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1331_of13b_b1_qualifier'}"><c:if test="${item.detail==':COUP//'}"> selected="true" </c:if></c:if></c:forEach>>
              							COUP
              						</option>
              						<option value=":POOL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1331_of13b_b1_qualifier'}"><c:if test="${item.detail==':POOL//'}"> selected="true" </c:if></c:if></c:forEach>>
              							POOL
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Data source scheme</span>
              					<input disabled="disabled" id="check_of13b_data_source_scheme_b1" name="check_of13b_data_source_scheme_b1" type="checkbox"/>
              					<div id="div_opt_of13b_data_source_scheme_b1">
              						<input data-swift="8c" disabled="disabled" id="_1332_of13b_b1_data_source_scheme" input_type="OF13B Data Source Scheme" location="Body" maxlength="8" name="_1332_of13b_b1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1332_of13b_b1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<input disabled="disabled" id="_1333_of13b_b1_" input_type="OF13B " location="Body" name="_1333_of13b_b1_" type="hidden" value="/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Number</span>
              					<input class="mandatory" data-swift="30x" disabled="disabled" id="_1334_of13b_b1_number" input_type="OF13B Number" location="Body" maxlength="30" name="_1334_of13b_b1_number" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1334_of13b_b1_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div id="container_of13a_b1">
              			<input class="cust-btn" data-count="0" data-id="of13a_b1" onclick="addContainer(this)" type="button" value="Add Field OF13A"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of13a_b1">0</span>, Max: <span class="max_val" id="max_occ_of13a_b1">2</span>, Count: <span class="count_val" id="cur_occ_of13a_b1">0</span>
              			</span>
              		</div>
              	</div>
              	<div class="form-row">
              		<span class="label_body">OF17B</span>
              		<span class="label">Flag</span>
              		<div class="template_container" id="template_of17b_b1" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" id="label_count_of17b_b1">Count</span>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_1336_of17b_b1_qualifier" input_type="OF17B Qualifier" location="Body" name="_1336_of17b_b1_qualifier">
              					<option value="">	</option>
              					<option value=":FRNF//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1336_of17b_b1_qualifier'}"><c:if test="${item.detail==':FRNF//'}"> selected="true" </c:if></c:if></c:forEach>>
              						FRNF
              					</option>
              					<option value=":CALL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1336_of17b_b1_qualifier'}"><c:if test="${item.detail==':CALL//'}"> selected="true" </c:if></c:if></c:forEach>>
              						CALL
              					</option>
              					<option value=":PUTT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1336_of17b_b1_qualifier'}"><c:if test="${item.detail==':PUTT//'}"> selected="true" </c:if></c:if></c:forEach>>
              						PUTT
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Flag</span>
              				<select class="mandatory" disabled="disabled" id="_1337_of17b_b1_flag" input_type="OF17B Flag" location="Body" name="_1337_of17b_b1_flag">
              					<option value="">	</option>
              					<option value="N" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1337_of17b_b1_flag'}"><c:if test="${item.detail=='N'}"> selected="true" </c:if></c:if></c:forEach>>
              						N
              					</option>
              					<option value="Y" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1337_of17b_b1_flag'}"><c:if test="${item.detail=='Y'}"> selected="true" </c:if></c:if></c:forEach>>
              						Y
              					</option>
              				</select>
              			</div>
              		</div>
              		<div id="container_of17b_b1">
              			<input class="cust-btn" data-count="0" data-id="of17b_b1" onclick="addContainer(this)" type="button" value="Add Field OF17B"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of17b_b1">0</span>, Max: <span class="max_val" id="max_occ_of17b_b1">3</span>, Count: <span class="count_val" id="cur_occ_of17b_b1">0</span>
              			</span>
              		</div>
              	</div>
              	<div class="form-row">
              		<span class="label_body">OF90A</span>
              		<span class="label">Price</span>
              		<div class="template_container" id="template_of90a_b1" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" id="label_count_of90a_b1">Count</span>
              			</div>
              			<select class="selection_div" disabled="disabled" id="type_of90_b1" input_type="OF90A Price" location="Body" name="type_of90_b1">
              				<option value="">	</option>
              				<option value="a">A - Percentage Type Code - Sign - Price</option>
              				<option value="b">B - Amount Type Code - Currency Code - Price</option>
              			</select>
              			<div id="div_of90a_b1">
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Qualifier</span>
              					<select class="mandatory" disabled="disabled" id="_1338_of90a_b1_qualifier" input_type="OF90A Qualifier" location="Body" name="_1338_of90a_b1_qualifier">
              						<option value="">	</option>
              						<option value=":INDC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1338_of90a_b1_qualifier'}"><c:if test="${item.detail==':INDC//'}"> selected="true" </c:if></c:if></c:forEach>>
              							INDC
              						</option>
              						<option value=":MRKT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1338_of90a_b1_qualifier'}"><c:if test="${item.detail==':MRKT//'}"> selected="true" </c:if></c:if></c:forEach>>
              							MRKT
              						</option>
              						<option value=":EXER//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1338_of90a_b1_qualifier'}"><c:if test="${item.detail==':EXER//'}"> selected="true" </c:if></c:if></c:forEach>>
              							EXER
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Percentage type code</span>
              					<select class="mandatory" disabled="disabled" id="_1339_of90a_b1_percentage_type_code" input_type="OF90A Percentage Type Code" location="Body" name="_1339_of90a_b1_percentage_type_code">
              						<option value="">	</option>
              						<option value="DISC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1339_of90a_b1_percentage_type_code'}"><c:if test="${item.detail=='DISC/'}"> selected="true" </c:if></c:if></c:forEach>>
              							DISC
              						</option>
              						<option value="PRCT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1339_of90a_b1_percentage_type_code'}"><c:if test="${item.detail=='PRCT/'}"> selected="true" </c:if></c:if></c:forEach>>
              							PRCT
              						</option>
              						<option value="PREM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1339_of90a_b1_percentage_type_code'}"><c:if test="${item.detail=='PREM/'}"> selected="true" </c:if></c:if></c:forEach>>
              							PREM
              						</option>
              						<option value="YIEL/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1339_of90a_b1_percentage_type_code'}"><c:if test="${item.detail=='YIEL/'}"> selected="true" </c:if></c:if></c:forEach>>
              							YIEL
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Sign</span>
              					<input disabled="disabled" id="check_of90a_sign_b1" name="check_of90a_sign_b1" type="checkbox"/>
              					<div id="div_opt_of90a_sign_b1">
              						<input data-swift="N" disabled="disabled" id="_1340_of90a_b1_sign" input_type="OF90A Sign" location="Body" maxlength="1" name="_1340_of90a_b1_sign" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1340_of90a_b1_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Price</span>
              					<input class="mandatory" data-swift="15d" disabled="disabled" id="_1341_of90a_b1_price" input_type="OF90A Price" location="Body" maxlength="15" name="_1341_of90a_b1_price" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1341_of90a_b1_price'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div id="div_of90b_b1">
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Qualifier</span>
              					<select class="mandatory" disabled="disabled" id="_1342_of90b_b1_qualifier" input_type="OF90B Qualifier" location="Body" name="_1342_of90b_b1_qualifier">
              						<option value="">	</option>
              						<option value=":INDC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1342_of90b_b1_qualifier'}"><c:if test="${item.detail==':INDC//'}"> selected="true" </c:if></c:if></c:forEach>>
              							INDC
              						</option>
              						<option value=":MRKT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1342_of90b_b1_qualifier'}"><c:if test="${item.detail==':MRKT//'}"> selected="true" </c:if></c:if></c:forEach>>
              							MRKT
              						</option>
              						<option value=":EXER//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1342_of90b_b1_qualifier'}"><c:if test="${item.detail==':EXER//'}"> selected="true" </c:if></c:if></c:forEach>>
              							EXER
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Amount type code</span>
              					<select class="mandatory" disabled="disabled" id="_1343_of90b_b1_amount_type_code" input_type="OF90B Amount Type Code" location="Body" name="_1343_of90b_b1_amount_type_code">
              						<option value="">	</option>
              						<option value="ACTU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1343_of90b_b1_amount_type_code'}"><c:if test="${item.detail=='ACTU/'}"> selected="true" </c:if></c:if></c:forEach>>
              							ACTU
              						</option>
              						<option value="DISC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1343_of90b_b1_amount_type_code'}"><c:if test="${item.detail=='DISC/'}"> selected="true" </c:if></c:if></c:forEach>>
              							DISC
              						</option>
              						<option value="PREM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1343_of90b_b1_amount_type_code'}"><c:if test="${item.detail=='PREM/'}"> selected="true" </c:if></c:if></c:forEach>>
              							PREM
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Currency code</span>
              					<input class="mandatory" data-swift="3!a" disabled="disabled" id="_1344_of90b_b1_currency_code" input_type="OF90B Currency Code" location="Body" maxlength="3" name="_1344_of90b_b1_currency_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1344_of90b_b1_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Price</span>
              					<input class="mandatory" data-swift="15d" disabled="disabled" id="_1345_of90b_b1_price" input_type="OF90B Price" location="Body" maxlength="15" name="_1345_of90b_b1_price" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1345_of90b_b1_price'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div id="container_of90a_b1">
              			<input class="cust-btn" data-count="0" data-id="of90a_b1" onclick="addContainer(this)" type="button" value="Add Field OF90A"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of90a_b1">0</span>, Max: <span class="max_val" id="max_occ_of90a_b1">2</span>, Count: <span class="count_val" id="cur_occ_of90a_b1">0</span>
              			</span>
              		</div>
              	</div>
              	<div class="form-row">
              		<span class="label_body">OF36A</span>
              		<span class="label">Quantity of Financial Instrument</span>
              		<div class="template_container" id="template_of36a_b1" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" id="label_count_of36a_b1">Count</span>
              			</div>
              			<select class="selection_div" disabled="disabled" id="type_of36_b1" input_type="OF36A Quantity of financial instrument" location="Body" name="type_of36_b1">
              				<option value="">	</option>
              				<option value="b">B - Quantity</option>
              				<option value="d">D - Quantity of Digital Tokens</option>
              			</select>
              			<div id="div_of36b_b1">
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Qualifier</span>
              					<select class="mandatory" disabled="disabled" id="_1347_of36b_b1_qualifier" input_type="OF36B Qualifier" location="Body" name="_1347_of36b_b1_qualifier">
              						<option value="">	</option>
              						<option value=":MINO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1347_of36b_b1_qualifier'}"><c:if test="${item.detail==':MINO//'}"> selected="true" </c:if></c:if></c:forEach>>
              							MINO
              						</option>
              						<option value=":SIZE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1347_of36b_b1_qualifier'}"><c:if test="${item.detail==':SIZE//'}"> selected="true" </c:if></c:if></c:forEach>>
              							SIZE
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Quantity type code</span>
              					<select class="mandatory" disabled="disabled" id="_1348_of36b_b1_quantity_type_code" input_type="OF36B Quantity Type Code" location="Body" name="_1348_of36b_b1_quantity_type_code">
              						<option value="">	</option>
              						<option value="AMOR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1348_of36b_b1_quantity_type_code'}"><c:if test="${item.detail=='AMOR/'}"> selected="true" </c:if></c:if></c:forEach>>
              							AMOR
              						</option>
              						<option value="FAMT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1348_of36b_b1_quantity_type_code'}"><c:if test="${item.detail=='FAMT/'}"> selected="true" </c:if></c:if></c:forEach>>
              							FAMT
              						</option>
              						<option value="UNIT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1348_of36b_b1_quantity_type_code'}"><c:if test="${item.detail=='UNIT/'}"> selected="true" </c:if></c:if></c:forEach>>
              							UNIT
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Quantity</span>
              					<input class="mandatory" data-swift="15d" disabled="disabled" id="_1349_of36b_b1_quantity" input_type="OF36B Quantity" location="Body" maxlength="15" name="_1349_of36b_b1_quantity" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1349_of36b_b1_quantity'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div id="div_of36d_b1">
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Qualifier</span>
              					<select class="mandatory" disabled="disabled" id="_1350_of36d_b1_qualifier" input_type="OF36D Qualifier" location="Body" name="_1350_of36d_b1_qualifier">
              						<option value="">	</option>
              						<option value=":MINO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1350_of36d_b1_qualifier'}"><c:if test="${item.detail==':MINO//'}"> selected="true" </c:if></c:if></c:forEach>>
              							MINO
              						</option>
              						<option value=":SIZE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1350_of36d_b1_qualifier'}"><c:if test="${item.detail==':SIZE//'}"> selected="true" </c:if></c:if></c:forEach>>
              							SIZE
              						</option>
              					</select>
              				</div>
              				<input disabled="disabled" id="_1351_of36d_b1_" input_type="OF36D " location="Body" name="_1351_of36d_b1_" type="hidden" value="DITU/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Quantity of digital tokens</span>
              					<input class="mandatory" data-swift="30d" disabled="disabled" id="_1352_of36d_b1_quantity_of_digital_tokens" input_type="OF36D Quantity of Digital Tokens" location="Body" maxlength="30" name="_1352_of36d_b1_quantity_of_digital_tokens" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1352_of36d_b1_quantity_of_digital_tokens'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div id="container_of36a_b1">
              			<input class="cust-btn" data-count="0" data-id="of36a_b1" onclick="addContainer(this)" type="button" value="Add Field OF36A"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of36a_b1">0</span>, Max: <span class="max_val" id="max_occ_of36a_b1">2</span>, Count: <span class="count_val" id="cur_occ_of36a_b1">0</span>
              			</span>
              		</div>
              	</div>
              	<div class="form-row">
              		<span class="label_body">OF35B</span>
              		<span class="label">Identification of the Financial Instrument</span>
              		<div class="template_container" id="template_of35b_b1" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" id="label_count_of35b_b1">Count</span>
              			</div>
              			<input disabled="disabled" id="_1354_of35b_b1_" input_type="OF35B " location="Body" name="_1354_of35b_b1_" type="hidden" value="ISIN "/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Identification of security</span>
              				<input class="mandatory" data-swift="12!c" disabled="disabled" id="_1355_of35b_b1_identification_of_security" input_type="OF35B Identification of Security" location="Body" maxlength="12" name="_1355_of35b_b1_identification_of_security" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1355_of35b_b1_identification_of_security'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Description of security</span>
              				<input disabled="disabled" id="check_of35b_description_of_security_b1" name="check_of35b_description_of_security_b1" type="checkbox"/>
              				<div id="div_opt_of35b_description_of_security_b1">
              					<textarea cols="35" data-swift="4*35x" disabled="disabled" id="_1356_of35b_b1_description_of_security" input_type="OF35B Description of Security" location="Body" name="_1356_of35b_b1_description_of_security" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1356_of35b_b1_description_of_security'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              				</div>
              			</div>
              		</div>
              		<div id="container_of35b_b1">
              			<input class="cust-btn" data-count="0" data-id="of35b_b1" onclick="addContainer(this)" type="button" value="Add Field OF35B"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of35b_b1">0</span>, Max: <span class="max_val" id="max_occ_of35b_b1">0</span>, Count: <span class="count_val" id="cur_occ_of35b_b1">0</span>
              			</span>
              		</div>
              	</div>
              	<div class="form-row">
              		<span class="label_body">OF70E</span>
              		<span class="label">Financial Instrument Attribute Narrative</span>
              		<input class="checkbox_div" id="check_of70e_b1" name="check_of70e_b1" type="checkbox"/>
              		<div id="div_opt_of70e_b1">
              			<input disabled="disabled" id="_1357_of70e_b1_" input_type="OF70E " location="Body" name="_1357_of70e_b1_" type="hidden" value=":FIAN//"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Narrative</span>
              				<input disabled="disabled" id="check_of70e_narrative_b1" name="check_of70e_narrative_b1" type="checkbox"/>
              				<div id="div_opt_of70e_narrative_b1">
              					<textarea cols="35" data-swift="10*35x" id="_1358_of70e_b1_narrative" input_type="OF70E Narrative" location="Body" name="_1358_of70e_b1_narrative" rows="10"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_1358_of70e_b1_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              				</div>
              			</div>
              		</div>
              	</div>
              	<div class="form-row">
              		<span class="label_body">MF16S</span>
              		<span class="label">End of Block</span>
              		<input id="_1359_mf16s_b1_end_of_block" input_type="MF16S End of Block" location="Body" name="_1359_mf16s_b1_end_of_block" type="hidden" value="FIA"/>
              	</div>
              	<h2 class="header-title">
              		End of Subsequence B1 Financial Instrument Attributes
              	</h2>
              	<hr/>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF22F</span>
              	<span class="label">Indicator</span>
              	<div class="template_container" id="template_of22f_b" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_of22f_b">Count</span>
              		</div>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Qualifier</span>
              			<select class="mandatory" disabled="disabled" id="_140_of22f_b_qualifier" input_type="OF22F Qualifier" location="Body" name="_140_of22f_b_qualifier">
              				<option value="">	</option>
              				<option value=":PROC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of22f_b_qualifier'}"><c:if test="${item.detail==':PROC/'}"> selected="true" </c:if></c:if></c:forEach>>
              					PROC
              				</option>
              				<option value=":RPOR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of22f_b_qualifier'}"><c:if test="${item.detail==':RPOR/'}"> selected="true" </c:if></c:if></c:forEach>>
              					RPOR
              				</option>
              				<option value=":PRIR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of22f_b_qualifier'}"><c:if test="${item.detail==':PRIR/'}"> selected="true" </c:if></c:if></c:forEach>>
              					PRIR
              				</option>
              				<option value=":BORR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of22f_b_qualifier'}"><c:if test="${item.detail==':BORR/'}"> selected="true" </c:if></c:if></c:forEach>>
              					BORR
              				</option>
              				<option value=":TTCO/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of22f_b_qualifier'}"><c:if test="${item.detail==':TTCO/'}"> selected="true" </c:if></c:if></c:forEach>>
              					TTCO
              				</option>
              				<option value=":INCA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of22f_b_qualifier'}"><c:if test="${item.detail==':INCA/'}"> selected="true" </c:if></c:if></c:forEach>>
              					INCA
              				</option>
              				<option value=":TRCA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of22f_b_qualifier'}"><c:if test="${item.detail==':TRCA/'}"> selected="true" </c:if></c:if></c:forEach>>
              					TRCA
              				</option>
              				<option value=":PRIC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_140_of22f_b_qualifier'}"><c:if test="${item.detail==':PRIC/'}"> selected="true" </c:if></c:if></c:forEach>>
              					PRIC
              				</option>
              			</select>
              		</div>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Data source scheme</span>
              			<input disabled="disabled" id="check_of22f_data_source_scheme_b" name="check_of22f_data_source_scheme_b" type="checkbox"/>
              			<div id="div_opt_of22f_data_source_scheme_b">
              				<input data-swift="8c" disabled="disabled" id="_141_of22f_b_data_source_scheme" input_type="OF22F Data Source Scheme" location="Body" maxlength="8" name="_141_of22f_b_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_141_of22f_b_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<input disabled="disabled" id="_142_of22f_b_" input_type="OF22F " location="Body" name="_142_of22f_b_" type="hidden" value="/"/>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Indicator</span>
              			<input class="mandatory" data-swift="4!c" disabled="disabled" id="_143_of22f_b_indicator" input_type="OF22F Indicator" location="Body" maxlength="4" name="_143_of22f_b_indicator" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_143_of22f_b_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              		</div>
              	</div>
              	<div id="container_of22f_b">
              		<input class="cust-btn" data-count="0" data-id="of22f_b" onclick="addContainer(this)" type="button" value="Add Field OF22F"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_of22f_b">0</span>, Max: <span class="max_val" id="max_occ_of22f_b">0</span>, Count: <span class="count_val" id="cur_occ_of22f_b">0</span>
              		</span>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF11A</span>
              	<span class="label">Currency to Sell</span>
              	<input class="checkbox_div" id="check_of11a_b" name="check_of11a_b" type="checkbox"/>
              	<div id="div_opt_of11a_b">
              		<input disabled="disabled" id="_150_of11a_b_" input_type="OF11A " location="Body" name="_150_of11a_b_" type="hidden" value=":FXIS//"/>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Currency code</span>
              			<input disabled="disabled" id="check_of11a_currency_code_b" name="check_of11a_currency_code_b" type="checkbox"/>
              			<div id="div_opt_of11a_currency_code_b">
              				<input data-swift="3!a" disabled="disabled" id="_151_of11a_b_currency_code" input_type="OF11A Currency Code" location="Body" maxlength="3" name="_151_of11a_b_currency_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_151_of11a_b_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF25D</span>
              	<span class="label">Status Code</span>
              	<div class="template_container" id="template_of25d_b" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_of25d_b">Count</span>
              		</div>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Qualifier</span>
              			<select class="mandatory" disabled="disabled" id="_160_of25d_b_qualifier" input_type="OF25D Qualifier" location="Body" name="_160_of25d_b_qualifier">
              				<option value="">	</option>
              				<option value=":MTCH/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of25d_b_qualifier'}"><c:if test="${item.detail==':MTCH/'}"> selected="true" </c:if></c:if></c:forEach>>
              					MTCH
              				</option>
              				<option value=":AFFM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_160_of25d_b_qualifier'}"><c:if test="${item.detail==':AFFM/'}"> selected="true" </c:if></c:if></c:forEach>>
              					AFFM
              				</option>
              			</select>
              		</div>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Data source scheme</span>
              			<input disabled="disabled" id="check_of25d_data_source_scheme_b" name="check_of25d_data_source_scheme_b" type="checkbox"/>
              			<div id="div_opt_of25d_data_source_scheme_b">
              				<input data-swift="8c" disabled="disabled" id="_161_of25d_b_data_source_scheme" input_type="OF25D Data Source Scheme" location="Body" maxlength="8" name="_161_of25d_b_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_161_of25d_b_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<input disabled="disabled" id="_162_of25d_b_" input_type="OF25D " location="Body" name="_162_of25d_b_" type="hidden" value="/"/>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Status code</span>
              			<input class="mandatory" data-swift="4!c" disabled="disabled" id="_163_of25d_b_status_code" input_type="OF25D Status Code" location="Body" maxlength="4" name="_163_of25d_b_status_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_163_of25d_b_status_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              		</div>
              	</div>
              	<div id="container_of25d_b">
              		<input class="cust-btn" data-count="0" data-id="of25d_b" onclick="addContainer(this)" type="button" value="Add Field OF25D"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_of25d_b">0</span>, Max: <span class="max_val" id="max_occ_of25d_b">2</span>, Count: <span class="count_val" id="cur_occ_of25d_b">0</span>
              		</span>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF70E</span>
              	<span class="label">Narrative</span>
              	<div class="template_container" id="template_of70e_b" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_of70e_b">Count</span>
              		</div>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Qualifier</span>
              			<select class="mandatory" disabled="disabled" id="_170_of70e_b_qualifier" input_type="OF70E Qualifier" location="Body" name="_170_of70e_b_qualifier">
              				<option value="">	</option>
              				<option value=":FXIN//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of70e_b_qualifier'}"><c:if test="${item.detail==':FXIN//'}"> selected="true" </c:if></c:if></c:forEach>>
              					FXIN
              				</option>
              				<option value=":SPRO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_170_of70e_b_qualifier'}"><c:if test="${item.detail==':SPRO//'}"> selected="true" </c:if></c:if></c:forEach>>
              					SPRO
              				</option>
              			</select>
              		</div>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Narrative</span>
              			<textarea class="mandatory" cols="35" data-swift="10*35x" disabled="disabled" id="_171_of70e_b_narrative" input_type="OF70E Narrative" location="Body" name="_171_of70e_b_narrative" rows="10"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_171_of70e_b_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              		</div>
              	</div>
              	<div id="container_of70e_b">
              		<input class="cust-btn" data-count="0" data-id="of70e_b" onclick="addContainer(this)" type="button" value="Add Field OF70E"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_of70e_b">0</span>, Max: <span class="max_val" id="max_occ_of70e_b">2</span>, Count: <span class="count_val" id="cur_occ_of70e_b">0</span>
              		</span>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF16S</span>
              	<span class="label">End of Block</span>
              	<input id="_180_mf16s_b_end_of_block" input_type="MF16S End of Block" location="Body" name="_180_mf16s_b_end_of_block" type="hidden" value="TRADDET"/>
              </div>
              <hr/>
              <h2 class="header-title">
              	End of Sequence B Trade Details
              </h2>
              <h2 class="header-title">
              	Mandatory Sequence C Financial Instrument/Account
              </h2>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF16R</span>
              	<span class="label">Start of Block</span>
              	<input id="_190_mf16r_c_start_of_block" input_type="MF16R Start of Block" location="Body" name="_190_mf16r_c_start_of_block" type="hidden" value="FIAC"/>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF36A</span>
              	<span class="label">Quantity of Financial Instrument to be Settled</span>
              	<div class="template_container" id="template_mf36a_c" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_mf36a_c">Count</span>
              		</div>
              		<select class="selection_div" disabled="disabled" id="type_mf36_c" input_type="MF36A Quantity of financial instrument to be settled" location="Body" name="type_mf36_c">
              			<option value="">	</option>
              			<option value="b">B - Quantity</option>
              			<option value="d">D - Quantity of Digital Tokens</option>
              		</select>
              		<div id="div_mf36b_c">
              			<input disabled="disabled" id="_200_mf36b_c_" input_type="MF36B " location="Body" name="_200_mf36b_c_" type="hidden" value=":SETT/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Quantity type code</span>
              				<select class="mandatory" disabled="disabled" id="_201_mf36b_c_quantity_type_code" input_type="MF36B Quantity Type Code" location="Body" name="_201_mf36b_c_quantity_type_code">
              					<option value="">	</option>
              					<option value="/AMOR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_201_mf36b_c_quantity_type_code'}"><c:if test="${item.detail=='/AMOR/'}"> selected="true" </c:if></c:if></c:forEach>>
              						AMOR
              					</option>
              					<option value="/FAMT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_201_mf36b_c_quantity_type_code'}"><c:if test="${item.detail=='/FAMT/'}"> selected="true" </c:if></c:if></c:forEach>>
              						FAMT
              					</option>
              					<option value="/UNIT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_201_mf36b_c_quantity_type_code'}"><c:if test="${item.detail=='/UNIT/'}"> selected="true" </c:if></c:if></c:forEach>>
              						UNIT
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Quantity</span>
              				<input class="mandatory" data-swift="15d" disabled="disabled" id="_202_mf36b_c_quantity" input_type="MF36B Quantity" location="Body" maxlength="15" name="_202_mf36b_c_quantity" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_202_mf36b_c_quantity'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_mf36d_c">
              			<input disabled="disabled" id="_203_mf36d_c_" input_type="MF36D " location="Body" name="_203_mf36d_c_" type="hidden" value=":SETT/"/>
              			<input disabled="disabled" id="_204_mf36d_c_" input_type="MF36D " location="Body" name="_204_mf36d_c_" type="hidden" value="/DITU/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Quantity of digital tokens</span>
              				<input class="mandatory" data-swift="30d" disabled="disabled" id="_205_mf36d_c_quantity_of_digital_tokens" input_type="MF36D Quantity of Digital Tokens" location="Body" maxlength="30" name="_205_mf36d_c_quantity_of_digital_tokens" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_205_mf36d_c_quantity_of_digital_tokens'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              	</div>
              	<div id="container_mf36a_c">
              		<input class="cust-btn" data-count="0" data-id="mf36a_c" onclick="addContainer(this)" type="button" value="Add Field MF36A"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_mf36a_c">1</span>, Max: <span class="max_val" id="max_occ_mf36a_c">0</span>, Count: <span class="count_val" id="cur_occ_mf36a_c">0</span>
              		</span>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF70D</span>
              	<span class="label">Denomination Choice</span>
              	<input class="checkbox_div" id="check_of70d_c" name="check_of70d_c" type="checkbox"/>
              	<div id="div_opt_of70d_c">
              		<input disabled="disabled" id="_210_of70d_c_" input_type="OF70D " location="Body" name="_210_of70d_c_" type="hidden" value=":DENC/"/>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Narrative</span>
              			<textarea class="mandatory" cols="35" data-swift="6*35x" id="_211_of70d_c_narrative" input_type="OF70D Narrative" location="Body" name="_211_of70d_c_narrative" rows="6"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_211_of70d_c_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              		</div>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF13B</span>
              	<span class="label">Certificate Number</span>
              	<div class="template_container" id="template_of13b_c" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_of13b_c">Count</span>
              		</div>
              		<input disabled="disabled" id="_220_of13b_c_" input_type="OF13B " location="Body" name="_220_of13b_c_" type="hidden" value=":CERT/"/>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Data source scheme</span>
              			<input disabled="disabled" id="check_of13b_data_source_scheme_c" name="check_of13b_data_source_scheme_c" type="checkbox"/>
              			<div id="div_opt_of13b_data_source_scheme_c">
              				<input data-swift="8c" disabled="disabled" id="_221_of13b_c_data_source_scheme" input_type="OF13B Data Source Scheme" location="Body" maxlength="8" name="_221_of13b_c_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_221_of13b_c_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<input disabled="disabled" id="_222_of13b_c_" input_type="OF13B " location="Body" name="_222_of13b_c_" type="hidden" value="/"/>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Number</span>
              			<input class="mandatory" data-swift="30x" disabled="disabled" id="_223_of13b_c_number" input_type="OF13B Number" location="Body" maxlength="30" name="_223_of13b_c_number" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_223_of13b_c_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              		</div>
              	</div>
              	<div id="container_of13b_c">
              		<input class="cust-btn" data-count="0" data-id="of13b_c" onclick="addContainer(this)" type="button" value="Add Field OF13B"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_of13b_c">0</span>, Max: <span class="max_val" id="max_occ_of13b_c">0</span>, Count: <span class="count_val" id="cur_occ_of13b_c">0</span>
              		</span>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF95A</span>
              	<span class="label">Party</span>
              	<div class="template_container" id="template_of95a_c" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_of95a_c">Count</span>
              		</div>
              		<select class="selection_div" disabled="disabled" id="type_of95_c" input_type="OF95A Party" location="Body" name="type_of95_c">
              			<option value="">	</option>
              			<option value="l">L - Legal Entity Identifier</option>
              			<option value="p">P - Identifier Code</option>
              			<option value="r">R - Data Source Scheme - Proprietary Code</option>
              		</select>
              		<div id="div_of95l_c">
              			<input disabled="disabled" id="_230_of95l_c_" input_type="OF95L " location="Body" name="_230_of95l_c_" type="hidden" value=":ALTE/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Legal entity identifier</span>
              				<input class="mandatory" data-swift="18!c2!n" disabled="disabled" id="_231_of95l_c_legal_entity_identifier" input_type="OF95L Legal Entity Identifier" location="Body" maxlength="20" name="_231_of95l_c_legal_entity_identifier" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_231_of95l_c_legal_entity_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_of95p_c">
              			<input disabled="disabled" id="_232_of95p_c_" input_type="OF95P " location="Body" name="_232_of95p_c_" type="hidden" value=":ACOW//"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Identifier code</span>
              				<input class="mandatory" data-swift="4!a2!a2!c[3!c]" disabled="disabled" id="_233_of95p_c_identifier_code" input_type="OF95P Identifier Code" location="Body" maxlength="11" name="_233_of95p_c_identifier_code" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_233_of95p_c_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_of95r_c">
              			<input disabled="disabled" id="_234_of95r_c_" input_type="OF95R " location="Body" name="_234_of95r_c_" type="hidden" value=":ACOW/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Data source scheme</span>
              				<input class="mandatory" data-swift="8c" disabled="disabled" id="_235_of95r_c_data_source_scheme" input_type="OF95R Data Source Scheme" location="Body" maxlength="8" name="_235_of95r_c_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_235_of95r_c_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<input disabled="disabled" id="_236_of95r_c_" input_type="OF95R " location="Body" name="_236_of95r_c_" type="hidden" value="/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Proprietary code</span>
              				<input class="mandatory" data-swift="34x" disabled="disabled" id="_237_of95r_c_proprietary_code" input_type="OF95R Proprietary Code" location="Body" maxlength="34" name="_237_of95r_c_proprietary_code" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_237_of95r_c_proprietary_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              	</div>
              	<div id="container_of95a_c">
              		<input class="cust-btn" data-count="0" data-id="of95a_c" onclick="addContainer(this)" type="button" value="Add Field OF95A"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_of95a_c">0</span>, Max: <span class="max_val" id="max_occ_of95a_c">2</span>, Count: <span class="count_val" id="cur_occ_of95a_c">0</span>
              		</span>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF97A</span>
              	<span class="label">Account</span>
              	<div class="template_container" id="template_mf97a_c" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_mf97a_c">Count</span>
              		</div>
              		<select class="selection_div mandatory" disabled="disabled" id="type_mf97_c" input_type="MF97A Account" location="Body" name="type_mf97_c">
              			<option value="">	</option>
              			<option value="a">A - Account Number</option>
              			<option value="b">B - Data Source Scheme - Account Type Code - Account Number</option>
              			<option value="d">D - Data Source Scheme - Identification of Blockchain or Wallet</option>
              			<option value="e">E - International Bank Account Number</option>
              		</select>
              		<div id="div_mf97a_c">
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_240_mf97a_c_qualifier" input_type="MF97A Qualifier" location="Body" name="_240_mf97a_c_qualifier">
              					<option value="">	</option>
              					<option value=":SAFE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_mf97a_c_qualifier'}"><c:if test="${item.detail==':SAFE//'}"> selected="true" </c:if></c:if></c:forEach>>
              						SAFE
              					</option>
              					<option value=":CASH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_mf97a_c_qualifier'}"><c:if test="${item.detail==':CASH//'}"> selected="true" </c:if></c:if></c:forEach>>
              						CASH
              					</option>
              					<option value=":REGI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_240_mf97a_c_qualifier'}"><c:if test="${item.detail==':REGI//'}"> selected="true" </c:if></c:if></c:forEach>>
              						REGI
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Account number</span>
              				<input class="mandatory" data-swift="30x" disabled="disabled" id="_241_mf97a_c_account_number" input_type="MF97A Account Number" location="Body" maxlength="30" name="_241_mf97a_c_account_number" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_241_mf97a_c_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_mf97b_c">
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_242_mf97b_c_qualifier" input_type="MF97B Qualifier" location="Body" name="_242_mf97b_c_qualifier">
              					<option value="">	</option>
              					<option value=":SAFE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_242_mf97b_c_qualifier'}"><c:if test="${item.detail==':SAFE/'}"> selected="true" </c:if></c:if></c:forEach>>
              						SAFE
              					</option>
              					<option value=":REGI/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_242_mf97b_c_qualifier'}"><c:if test="${item.detail==':REGI/'}"> selected="true" </c:if></c:if></c:forEach>>
              						REGI
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Data source scheme</span>
              				<input disabled="disabled" id="check_mf97b_data_source_scheme_c" name="check_mf97b_data_source_scheme_c" type="checkbox"/>
              				<div id="div_opt_mf97b_data_source_scheme_c">
              					<input data-swift="8c" disabled="disabled" id="_243_mf97b_c_data_source_scheme" input_type="MF97B Data Source Scheme" location="Body" maxlength="8" name="_243_mf97b_c_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_243_mf97b_c_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<input disabled="disabled" id="_244_mf97b_c_" input_type="MF97B " location="Body" name="_244_mf97b_c_" type="hidden" value="/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Account type code</span>
              				<input class="mandatory" data-swift="4!c" disabled="disabled" id="_245_mf97b_c_account_type_code" input_type="MF97B Account Type Code" location="Body" maxlength="4" name="_245_mf97b_c_account_type_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_245_mf97b_c_account_type_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<input disabled="disabled" id="_246_mf97b_c_" input_type="MF97B " location="Body" name="_246_mf97b_c_" type="hidden" value="/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Account number</span>
              				<input class="mandatory" data-swift="35x" disabled="disabled" id="_247_mf97b_c_account_number" input_type="MF97B Account Number" location="Body" maxlength="35" name="_247_mf97b_c_account_number" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_247_mf97b_c_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_mf97d_c">
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory" disabled="disabled" id="_248_mf97d_c_qualifier" input_type="MF97D Qualifier" location="Body" name="_248_mf97d_c_qualifier">
              					<option value="">	</option>
              					<option value=":BCAW/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_248_mf97d_c_qualifier'}"><c:if test="${item.detail==':BCAW/'}"> selected="true" </c:if></c:if></c:forEach>>
              						BCAW
              					</option>
              					<option value=":BCCW/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_248_mf97d_c_qualifier'}"><c:if test="${item.detail==':BCCW/'}"> selected="true" </c:if></c:if></c:forEach>>
              						BCCW
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Data source scheme</span>
              				<input disabled="disabled" id="check_mf97d_data_source_scheme_c" name="check_mf97d_data_source_scheme_c" type="checkbox"/>
              				<div id="div_opt_mf97d_data_source_scheme_c">
              					<input data-swift="8c" disabled="disabled" id="_249_mf97d_c_data_source_scheme" input_type="MF97D Data Source Scheme" location="Body" maxlength="8" name="_249_mf97d_c_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_249_mf97d_c_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<input disabled="disabled" id="_2410_mf97d_c_" input_type="MF97D " location="Body" name="_2410_mf97d_c_" type="hidden" value="/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Identification of blockchain or wallet</span>
              				<input class="mandatory" data-swift="140x" disabled="disabled" id="_2411_mf97d_c_identification_of_blockchain_or_wallet" input_type="MF97D Identification of Blockchain or Wallet" location="Body" maxlength="140" name="_2411_mf97d_c_identification_of_blockchain_or_wallet" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2411_mf97d_c_identification_of_blockchain_or_wallet'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_mf97e_c">
              			<input disabled="disabled" id="_2412_mf97e_c_" input_type="MF97E " location="Body" name="_2412_mf97e_c_" type="hidden" value=":CASH//"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Account number</span>
              				<input class="mandatory" data-swift="30x" disabled="disabled" id="_2413_mf97e_c_account_number" input_type="MF97E Account Number" location="Body" maxlength="30" name="_2413_mf97e_c_account_number" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2413_mf97e_c_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              	</div>
              	<div id="container_mf97a_c">
              		<input class="cust-btn" data-count="0" data-id="mf97a_c" onclick="addContainer(this)" type="button" value="Add Field MF97A"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_mf97a_c">1</span>, Max: <span class="max_val" id="max_occ_mf97a_c">3</span>, Count: <span class="count_val" id="cur_occ_mf97a_c">0</span>
              		</span>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">OF94A</span>
              	<span class="label">Place of Safekeeping</span>
              	<div class="template_container" id="template_of94a_c" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_of94a_c">Count</span>
              		</div>
              		<select class="selection_div" disabled="disabled" id="type_of94_c" input_type="OF94A Place of safekeeping" location="Body" name="type_of94_c">
              			<option value="">	</option>
              			<option value="b">B - Data Source Scheme - Place Code - Narrative</option>
              			<option value="c">C - Country Code</option>
              			<option value="f">F - Place Code - Identifier Code</option>
              			<option value="l">L - Legal Entity Identifier</option>
              			<option value="t">T - Digital Ledger Identifier</option>
              		</select>
              		<div id="div_of94b_c">
              			<input disabled="disabled" id="_250_of94b_c_" input_type="OF94B " location="Body" name="_250_of94b_c_" type="hidden" value=":SAFE/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Data source scheme</span>
              				<input disabled="disabled" id="check_of94b_data_source_scheme_c" name="check_of94b_data_source_scheme_c" type="checkbox"/>
              				<div id="div_opt_of94b_data_source_scheme_c">
              					<input data-swift="8c" disabled="disabled" id="_251_of94b_c_data_source_scheme" input_type="OF94B Data Source Scheme" location="Body" maxlength="8" name="_251_of94b_c_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_251_of94b_c_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<input disabled="disabled" id="_252_of94b_c_" input_type="OF94B " location="Body" name="_252_of94b_c_" type="hidden" value="/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Place code</span>
              				<input class="mandatory" data-swift="4!c" disabled="disabled" id="_253_of94b_c_place_code" input_type="OF94B Place Code" location="Body" maxlength="4" name="_253_of94b_c_place_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_253_of94b_c_place_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<input disabled="disabled" id="_254_of94b_c_" input_type="OF94B " location="Body" name="_254_of94b_c_" type="hidden" value="/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Narrative</span>
              				<input class="mandatory" data-swift="30x" disabled="disabled" id="_255_of94b_c_narrative" input_type="OF94B Narrative" location="Body" maxlength="30" name="_255_of94b_c_narrative" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_255_of94b_c_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_of94c_c">
              			<input disabled="disabled" id="_256_of94c_c_" input_type="OF94C " location="Body" name="_256_of94c_c_" type="hidden" value=":SAFE//"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Country code</span>
              				<input class="mandatory" data-swift="2!a" disabled="disabled" id="_257_of94c_c_country_code" input_type="OF94C Country Code" location="Body" maxlength="2" name="_257_of94c_c_country_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_257_of94c_c_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_of94f_c">
              			<input disabled="disabled" id="_258_of94f_c_" input_type="OF94F " location="Body" name="_258_of94f_c_" type="hidden" value=":SAFE//"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Place code</span>
              				<select class="mandatory" disabled="disabled" id="_259_of94f_c_place_code" input_type="OF94F Place Code" location="Body" name="_259_of94f_c_place_code">
              					<option value="">	</option>
              					<option value="CUST/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_259_of94f_c_place_code'}"><c:if test="${item.detail=='CUST/'}"> selected="true" </c:if></c:if></c:forEach>>
              						CUST
              					</option>
              					<option value="ICSD/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_259_of94f_c_place_code'}"><c:if test="${item.detail=='ICSD/'}"> selected="true" </c:if></c:if></c:forEach>>
              						ICSD
              					</option>
              					<option value="NCSD/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_259_of94f_c_place_code'}"><c:if test="${item.detail=='NCSD/'}"> selected="true" </c:if></c:if></c:forEach>>
              						NCSD
              					</option>
              					<option value="SHHE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_259_of94f_c_place_code'}"><c:if test="${item.detail=='SHHE/'}"> selected="true" </c:if></c:if></c:forEach>>
              						SHHE
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Identifier code</span>
              				<input class="mandatory" data-swift="4!a2!a2!c[3!c]" disabled="disabled" id="_2510_of94f_c_identifier_code" input_type="OF94F Identifier Code" location="Body" maxlength="11" name="_2510_of94f_c_identifier_code" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2510_of94f_c_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_of94l_c">
              			<input disabled="disabled" id="_2511_of94l_c_" input_type="OF94L " location="Body" name="_2511_of94l_c_" type="hidden" value=":SAFE//"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Legal entity identifier</span>
              				<input class="mandatory" data-swift="18!c2!n" disabled="disabled" id="_2512_of94l_c_legal_entity_identifier" input_type="OF94L Legal Entity Identifier" location="Body" maxlength="20" name="_2512_of94l_c_legal_entity_identifier" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2512_of94l_c_legal_entity_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div id="div_of94t_c">
              			<input disabled="disabled" id="_2513_of94t_c_" input_type="OF94T " location="Body" name="_2513_of94t_c_" type="hidden" value=":SAFE//"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Digital ledger identifier</span>
              				<input class="mandatory" data-swift="9!x" disabled="disabled" id="_2514_of94t_c_digital_ledger_identifier" input_type="OF94T Digital Ledger Identifier" location="Body" maxlength="9" name="_2514_of94t_c_digital_ledger_identifier" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2514_of94t_c_digital_ledger_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              	</div>
              	<div id="container_of94a_c">
              		<input class="cust-btn" data-count="0" data-id="of94a_c" onclick="addContainer(this)" type="button" value="Add Field OF94A"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_of94a_c">1</span>, Max: <span class="max_val" id="max_occ_of94a_c">0</span>, Count: <span class="count_val" id="cur_occ_of94a_c">0</span>
              		</span>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<h2 class="header-title">
              		Mandatory Repetitive Subsequence C1 Quantity Breakdown
              	</h2>
              	<hr/>
              	<span class="label_body">C1</span>
              	<span class="label">Quantity Breakdown</span>
              	<div class="template_container" id="template_c1" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_c1">Count</span>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16R</span>
              			<span class="label">Start of Block</span>
              			<input disabled="disabled" id="_260_mf16r_c1_start_of_block" input_type="MF16R Start of Block" location="Body" name="_260_mf16r_c1_start_of_block" type="hidden" value="BREAK"/>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF13B</span>
              			<span class="label">Lot Number</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of13b_c1" name="check_of13b_c1" type="checkbox"/>
              			<div id="div_opt_of13b_c1">
              				<input disabled="disabled" id="_261_of13b_c1_" input_type="OF13B " location="Body" name="_261_of13b_c1_" type="hidden" value=":LOTS/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Data source scheme</span>
              					<input class="template_selection" disabled="disabled" id="check_of13b_data_source_scheme_c1" name="check_of13b_data_source_scheme_c1" type="checkbox"/>
              					<div id="div_opt_of13b_data_source_scheme_c1">
              						<input data-swift="8c" disabled="disabled" id="_262_of13b_c1_data_source_scheme" input_type="OF13B Data Source Scheme" location="Body" maxlength="8" name="_262_of13b_c1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_262_of13b_c1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<input disabled="disabled" id="_263_of13b_c1_" input_type="OF13B " location="Body" name="_263_of13b_c1_" type="hidden" value="/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Narrative</span>
              					<input class="mandatory" data-swift="30x" disabled="disabled" id="_264_of13b_c1_narrative" input_type="OF13B Narrative" location="Body" maxlength="30" name="_264_of13b_c1_narrative" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_264_of13b_c1_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF36A</span>
              			<span class="label">Quantity of Financial Instrument In The Lot</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of36a_c1" name="check_of36a_c1" type="checkbox"/>
              			<div id="div_opt_of36a_c1">
              				<select class="selection_div" disabled="disabled" id="type_of36_c1" input_type="OF36A Quantity of financial instrument in the lot" location="Body" name="type_of36_c1">
              					<option value="">	</option>
              					<option value="b">B - Quantity</option>
              					<option value="d">D - Quantity of Digital Tokens</option>
              				</select>
              				<div id="div_of36b_c1">
              					<input disabled="disabled" id="_265_of36b_c1_" input_type="OF36B " location="Body" name="_265_of36b_c1_" type="hidden" value=":LOTS/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Quantity type code</span>
              						<select class="mandatory" disabled="disabled" id="_266_of36b_c1_quantity_type_code" input_type="OF36B Quantity Type Code" location="Body" name="_266_of36b_c1_quantity_type_code">
              							<option value="">	</option>
              							<option value="/AMOR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_266_of36b_c1_quantity_type_code'}"><c:if test="${item.detail=='/AMOR/'}"> selected="true" </c:if></c:if></c:forEach>>
              								AMOR
              							</option>
              							<option value="/FAMT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_266_of36b_c1_quantity_type_code'}"><c:if test="${item.detail=='/FAMT/'}"> selected="true" </c:if></c:if></c:forEach>>
              								FAMT
              							</option>
              							<option value="/UNIT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_266_of36b_c1_quantity_type_code'}"><c:if test="${item.detail=='/UNIT/'}"> selected="true" </c:if></c:if></c:forEach>>
              								UNIT
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Quantity</span>
              						<input class="mandatory" data-swift="15d" disabled="disabled" id="_267_of36b_c1_quantity" input_type="OF36B Quantity" location="Body" maxlength="15" name="_267_of36b_c1_quantity" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_267_of36b_c1_quantity'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_of36d_c1">
              					<input disabled="disabled" id="_268_of36d_c1_" input_type="OF36D " location="Body" name="_268_of36d_c1_" type="hidden" value=":LOTS/"/>
              					<input disabled="disabled" id="_269_of36d_c1_" input_type="OF36D " location="Body" name="_269_of36d_c1_" type="hidden" value="/DITU/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Quantity of digital tokens</span>
              						<input class="mandatory" data-swift="30d" disabled="disabled" id="_2610_of36d_c1_quantity_of_digital_tokens" input_type="OF36D Quantity of Digital Tokens" location="Body" maxlength="30" name="_2610_of36d_c1_quantity_of_digital_tokens" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2610_of36d_c1_quantity_of_digital_tokens'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF98A</span>
              			<span class="label">Lot Date/Time</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of98a_c1" name="check_of98a_c1" type="checkbox"/>
              			<div id="div_opt_of98a_c1">
              				<select class="selection_div" disabled="disabled" id="type_of98_c1" input_type="OF98A Preparation date/time" location="Body" name="type_of98_c1">
              					<option value="">	</option>
              					<option value="a">A - Date</option>
              					<option value="c">C - Date - Time</option>
              					<option value="e">E - Date - Time - Decimals - UTC Indicator</option>
              				</select>
              				<div id="div_of98a_c1">
              					<input disabled="disabled" id="_2612_of98a_c1_" input_type="OF98A " location="Body" name="_2612_of98a_c1_" type="hidden" value=":PREP//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Date</span>
              						<input class="mandatory" data-swift="8!n" disabled="disabled" id="_2613_of98a_c1_date" input_type="OF98A Date" location="Body" maxlength="8" name="_2613_of98a_c1_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2613_of98a_c1_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_of98c_c1">
              					<input disabled="disabled" id="_2614_of98c_c1_" input_type="OF98C " location="Body" name="_2614_of98c_c1_" type="hidden" value=":PREP//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Date</span>
              						<input class="mandatory" data-swift="8!n" disabled="disabled" id="_2615_of98c_c1_date" input_type="OF98C Date" location="Body" maxlength="8" name="_2615_of98c_c1_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2615_of98c_c1_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Time</span>
              						<input class="mandatory" data-swift="6!n" disabled="disabled" id="_2616_of98c_c1_time" input_type="OF98C Time" location="Body" maxlength="6" name="_2616_of98c_c1_time" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2616_of98c_c1_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_of98e_c1">
              					<input disabled="disabled" id="_2617_of98e_c1_" input_type="OF98E " location="Body" name="_2617_of98e_c1_" type="hidden" value=":PREP//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Date</span>
              						<input class="mandatory" data-swift="8!n" disabled="disabled" id="_2618_of98e_c1_date" input_type="OF98E Date" location="Body" maxlength="8" name="_2618_of98e_c1_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2618_of98e_c1_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Time</span>
              						<input class="mandatory" data-swift="6!n" disabled="disabled" id="_2619_of98e_c1_time" input_type="OF98E Time" location="Body" maxlength="6" name="_2619_of98e_c1_time" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2619_of98e_c1_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Decimals</span>
              						<input class="template_selection" disabled="disabled" id="check_of98e_decimals_c1" name="check_of98e_decimals_c1" type="checkbox"/>
              						<div id="div_opt_of98e_decimals_c1">
              							<input data-swift="3n" disabled="disabled" id="_2621_of98e_c1_decimals" input_type="OF98E Decimals" location="Body" maxlength="3" name="_2621_of98e_c1_decimals" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2621_of98e_c1_decimals'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              							<input disabled="disabled" id="_2620_of98e_c1_" input_type="OF98E " location="Body" name="_2620_of98e_c1_" type="hidden" value=","/>
              						</div>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Utc indicator</span>
              						<input class="template_selection" disabled="disabled" id="check_of98e_utc_indicator_c1" name="check_of98e_utc_indicator_c1" type="checkbox"/>
              						<div id="div_opt_of98e_utc_indicator_c1">
              							<input data-swift="[N]2!n[2!n]" disabled="disabled" id="_2623_of98e_c1_utc_indicator" input_type="OF98E UTC Indicator" location="Body" maxlength="5" name="_2623_of98e_c1_utc_indicator" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2623_of98e_c1_utc_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              							<input disabled="disabled" id="_2622_of98e_c1_" input_type="OF98E " location="Body" name="_2622_of98e_c1_" type="hidden" value="/"/>
              						</div>
              					</div>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF90A</span>
              			<span class="label">Book/Lot Price</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of90a_c1" name="check_of90a_c1" type="checkbox"/>
              			<div id="div_opt_of90a_c1">
              				<select class="selection_div" disabled="disabled" id="type_of90_c1" input_type="OF90A Book/lot price" location="Body" name="type_of90_c1">
              					<option value="">	</option>
              					<option value="a">A - Percentage Type Code - Sign - Price</option>
              					<option value="b">B - Amount Type Code - Currency Code - Price</option>
              				</select>
              				<div id="div_of90a_c1">
              					<input disabled="disabled" id="_2625_of90a_c1_" input_type="OF90A " location="Body" name="_2625_of90a_c1_" type="hidden" value=":LOTS/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Percentage type code</span>
              						<select class="mandatory" disabled="disabled" id="_2626_of90a_c1_percentage_type_code" input_type="OF90A Percentage Type Code" location="Body" name="_2626_of90a_c1_percentage_type_code">
              							<option value="">	</option>
              							<option value="/DISC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2626_of90a_c1_percentage_type_code'}"><c:if test="${item.detail=='/DISC/'}"> selected="true" </c:if></c:if></c:forEach>>
              								DISC
              							</option>
              							<option value="/PRCT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2626_of90a_c1_percentage_type_code'}"><c:if test="${item.detail=='/PRCT/'}"> selected="true" </c:if></c:if></c:forEach>>
              								PRCT
              							</option>
              							<option value="/PREM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2626_of90a_c1_percentage_type_code'}"><c:if test="${item.detail=='/PREM/'}"> selected="true" </c:if></c:if></c:forEach>>
              								PREM
              							</option>
              							<option value="/YIEL/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2626_of90a_c1_percentage_type_code'}"><c:if test="${item.detail=='/YIEL/'}"> selected="true" </c:if></c:if></c:forEach>>
              								YIEL
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Sign</span>
              						<input class="template_selection" disabled="disabled" id="check_of90a_sign_c1" name="check_of90a_sign_c1" type="checkbox"/>
              						<div id="div_opt_of90a_sign_c1">
              							<input data-swift="N" disabled="disabled" id="_2627_of90a_c1_sign" input_type="OF90A Sign" location="Body" maxlength="1" name="_2627_of90a_c1_sign" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2627_of90a_c1_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              						</div>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Price</span>
              						<input class="mandatory" data-swift="15d" disabled="disabled" id="_2628_of90a_c1_price" input_type="OF90A Price" location="Body" maxlength="15" name="_2628_of90a_c1_price" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2628_of90a_c1_price'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_of90b_c1">
              					<input disabled="disabled" id="_2629_of90b_c1_" input_type="OF90B " location="Body" name="_2629_of90b_c1_" type="hidden" value=":LOTS/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Amount type code</span>
              						<select class="mandatory" disabled="disabled" id="_2630_of90b_c1_amount_type_code" input_type="OF90B Amount Type Code" location="Body" name="_2630_of90b_c1_amount_type_code">
              							<option value="">	</option>
              							<option value="/ACTU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2630_of90b_c1_amount_type_code'}"><c:if test="${item.detail=='/ACTU/'}"> selected="true" </c:if></c:if></c:forEach>>
              								ACTU
              							</option>
              							<option value="/DISC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2630_of90b_c1_amount_type_code'}"><c:if test="${item.detail=='/DISC/'}"> selected="true" </c:if></c:if></c:forEach>>
              								DISC
              							</option>
              							<option value="/NEGA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2630_of90b_c1_amount_type_code'}"><c:if test="${item.detail=='/NEGA/'}"> selected="true" </c:if></c:if></c:forEach>>
              								NEGA
              							</option>
              							<option value="/PREM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2630_of90b_c1_amount_type_code'}"><c:if test="${item.detail=='/PREM/'}"> selected="true" </c:if></c:if></c:forEach>>
              								PREM
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Currency</span>
              						<input class="mandatory" data-swift="3!a" disabled="disabled" id="_2631_of90b_c1_currency" input_type="OF90B Currency" location="Body" maxlength="3" name="_2631_of90b_c1_currency" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2631_of90b_c1_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Price</span>
              						<input class="mandatory" data-swift="15d" disabled="disabled" id="_2632_of90b_c1_price" input_type="OF90B Price" location="Body" maxlength="15" name="_2632_of90b_c1_price" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2632_of90b_c1_price'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF22F</span>
              			<span class="label">Type of Price Indicator</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of22f_c1" name="check_of22f_c1" type="checkbox"/>
              			<div id="div_opt_of22f_c1">
              				<input disabled="disabled" id="_2634_of22f_c1_" input_type="OF22F " location="Body" name="_2634_of22f_c1_" type="hidden" value=":PRIC/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Data source scheme</span>
              					<input class="template_selection" disabled="disabled" id="check_of22f_data_source_scheme_c1" name="check_of22f_data_source_scheme_c1" type="checkbox"/>
              					<div id="div_opt_of22f_data_source_scheme_c1">
              						<input data-swift="8c" disabled="disabled" id="_2635_of22f_c1_data_source_scheme" input_type="OF22F Data Source Scheme" location="Body" maxlength="8" name="_2635_of22f_c1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2635_of22f_c1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<input disabled="disabled" id="_2636_of22f_c1_" input_type="OF22F " location="Body" name="_2636_of22f_c1_" type="hidden" value="/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Indicator</span>
              					<input class="mandatory" data-swift="4!c" disabled="disabled" id="_2637_of22f_c1_indicator" input_type="OF22F Indicator" location="Body" maxlength="4" name="_2637_of22f_c1_indicator" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_2637_of22f_c1_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16S</span>
              			<span class="label">End of Block</span>
              			<input disabled="disabled" id="_2638_mf16s_c1_end_of_block" input_type="MF16S End of Block" location="Body" name="_2638_mf16s_c1_end_of_block" type="hidden" value="BREAK"/>
              		</div>
              	</div>
              	<div id="container_c1">
              		<input class="cust-btn" data-count="0" data-id="c1" onclick="addTemplateContainer(this)" type="button" value="Add Field C1"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_c1">1</span>, Max: <span class="max_val" id="max_occ_c1">0</span>, Count: <span class="count_val" id="cur_occ_c1">0</span>
              		</span>
              	</div>
              	<h2 class="header-title">
              		End of Subsequence C1 Quantity Breakdown
              	</h2>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF16S</span>
              	<span class="label">End of Block</span>
              	<input id="_270_mf16s_c_end_of_block" input_type="MF16S End of Block" location="Body" name="_270_mf16s_c_end_of_block" type="hidden" value="FIAC"/>
              </div>
              <hr/>
              <h2 class="header-title">
              	End of Sequence C Financial Instrument/Account
              </h2>
              <h2 class="header-title">
              	Optional Sequence D Two Leg Transaction Details
              </h2>
              <hr/>
              <input class="checkbox_sequence" id="check_d" name="check_d" type="checkbox"/>
              <div id="div_opt_d">
              	<div class="form-row">
              		<span class="label_body">MF16R</span>
              		<span class="label">Start of Block</span>
              		<input class="template_selection" disabled="disabled" id="_280_mf16r_d_start_of_block" input_type="MF16R Start of Block" location="Body" name="_280_mf16r_d_start_of_block" type="hidden" value="REPO"/>
              	</div>
              	<hr/>
              	<div class="form-row">
              		<span class="label_body">OF98A</span>
              		<span class="label">Date/Time</span>
              		<div class="template_container" disabled="disabled" id="template_of98a_d" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn template_selection" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" disabled="disabled" id="label_count_of98a_d">Count</span>
              			</div>
              			<select class="selection_div template_selection" disabled="disabled" id="type_of98_d" input_type="OF98A Date/time" location="Body" name="type_of98_d">
              				<option value="">	</option>
              				<option value="a">A - Date</option>
              				<option value="c">C - Date - Time</option>
              			</select>
              			<div disabled="disabled" id="div_of98a_d">
              				<input class="template_selection" disabled="disabled" id="_290_of98a_d_" input_type="OF98A " location="Body" name="_290_of98a_d_" type="hidden" value=":PREP//"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Date</span>
              					<input class="mandatory template_selection" data-swift="8!n" disabled="disabled" id="_291_of98a_d_date" input_type="OF98A Date" location="Body" maxlength="8" name="_291_of98a_d_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_291_of98a_d_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div disabled="disabled" id="div_of98c_d">
              				<input class="template_selection" disabled="disabled" id="_292_of98c_d_" input_type="OF98C " location="Body" name="_292_of98c_d_" type="hidden" value=":PREP//"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Date</span>
              					<input class="mandatory template_selection" data-swift="8!n" disabled="disabled" id="_293_of98c_d_date" input_type="OF98C Date" location="Body" maxlength="8" name="_293_of98c_d_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_293_of98c_d_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Time</span>
              					<input class="mandatory template_selection" data-swift="6!n" disabled="disabled" id="_294_of98c_d_time" input_type="OF98C Time" location="Body" maxlength="6" name="_294_of98c_d_time" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_294_of98c_d_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div disabled="disabled" id="container_of98a_d">
              			<input class="cust-btn template_selection" data-count="0" data-id="of98a_d" onclick="addContainer(this)" type="button" value="Add Field OF98A"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of98a_d">0</span>, Max: <span class="max_val" id="max_occ_of98a_d">2</span>, Count: <span class="count_val" id="cur_occ_of98a_d">0</span>
              			</span>
              		</div>
              	</div>
              	<hr/>
              	<div class="form-row">
              		<span class="label_body">OF22F</span>
              		<span class="label">Indicator</span>
              		<div class="template_container" disabled="disabled" id="template_of22f_d" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn template_selection" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" disabled="disabled" id="label_count_of22f_d">Count</span>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory template_selection" disabled="disabled" id="_300_of22f_d_qualifier" input_type="OF22F Qualifier" location="Body" name="_300_of22f_d_qualifier">
              					<option value="">	</option>
              					<option value=":RERT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of22f_d_qualifier'}"><c:if test="${item.detail==':RERT/'}"> selected="true" </c:if></c:if></c:forEach>>
              						RERT
              					</option>
              					<option value=":MICO/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of22f_d_qualifier'}"><c:if test="${item.detail==':MICO/'}"> selected="true" </c:if></c:if></c:forEach>>
              						MICO
              					</option>
              					<option value=":REVA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of22f_d_qualifier'}"><c:if test="${item.detail==':REVA/'}"> selected="true" </c:if></c:if></c:forEach>>
              						REVA
              					</option>
              					<option value=":LEGA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of22f_d_qualifier'}"><c:if test="${item.detail==':LEGA/'}"> selected="true" </c:if></c:if></c:forEach>>
              						LEGA
              					</option>
              					<option value=":OMAT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of22f_d_qualifier'}"><c:if test="${item.detail==':OMAT/'}"> selected="true" </c:if></c:if></c:forEach>>
              						OMAT
              					</option>
              					<option value=":INTR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_300_of22f_d_qualifier'}"><c:if test="${item.detail==':INTR/'}"> selected="true" </c:if></c:if></c:forEach>>
              						INTR
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Data source scheme</span>
              				<input class="template_selection" disabled="disabled" id="check_of22f_data_source_scheme_d" name="check_of22f_data_source_scheme_d" type="checkbox"/>
              				<div disabled="disabled" id="div_opt_of22f_data_source_scheme_d">
              					<input class="template_selection" data-swift="8c" disabled="disabled" id="_301_of22f_d_data_source_scheme" input_type="OF22F Data Source Scheme" location="Body" maxlength="8" name="_301_of22f_d_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_301_of22f_d_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<input class="template_selection" disabled="disabled" id="_302_of22f_d_" input_type="OF22F " location="Body" name="_302_of22f_d_" type="hidden" value="/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Indicator</span>
              				<input class="mandatory template_selection" data-swift="4!c" disabled="disabled" id="_303_of22f_d_indicator" input_type="OF22F Indicator" location="Body" maxlength="4" name="_303_of22f_d_indicator" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_303_of22f_d_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div disabled="disabled" id="container_of22f_d">
              			<input class="cust-btn template_selection" data-count="0" data-id="of22f_d" onclick="addContainer(this)" type="button" value="Add Field OF22F"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of22f_d">0</span>, Max: <span class="max_val" id="max_occ_of22f_d">6</span>, Count: <span class="count_val" id="cur_occ_of22f_d">0</span>
              			</span>
              		</div>
              	</div>
              	<hr/>
              	<div class="form-row">
              		<span class="label_body">OF20C</span>
              		<span class="label">Reference</span>
              		<div class="template_container" disabled="disabled" id="template_of20c_d" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn template_selection" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" disabled="disabled" id="label_count_of20c_d">Count</span>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory template_selection" disabled="disabled" id="_310_of20c_d_qualifier" input_type="OF20C Qualifier" location="Body" name="_310_of20c_d_qualifier">
              					<option value="">	</option>
              					<option value=":SECO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of20c_d_qualifier'}"><c:if test="${item.detail==':SECO//'}"> selected="true" </c:if></c:if></c:forEach>>
              						SECO
              					</option>
              					<option value=":REPO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_310_of20c_d_qualifier'}"><c:if test="${item.detail==':REPO//'}"> selected="true" </c:if></c:if></c:forEach>>
              						REPO
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Reference</span>
              				<input class="template_selection" disabled="disabled" id="check_of20c_reference_d" name="check_of20c_reference_d" type="checkbox"/>
              				<div disabled="disabled" id="div_opt_of20c_reference_d">
              					<input class="template_selection" data-swift="16x" disabled="disabled" id="_311_of20c_d_reference" input_type="OF20C Reference" location="Body" maxlength="16" name="_311_of20c_d_reference" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_311_of20c_d_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div disabled="disabled" id="container_of20c_d">
              			<input class="cust-btn template_selection" data-count="0" data-id="of20c_d" onclick="addContainer(this)" type="button" value="Add Field OF20C"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of20c_d">0</span>, Max: <span class="max_val" id="max_occ_of20c_d">2</span>, Count: <span class="count_val" id="cur_occ_of20c_d">0</span>
              			</span>
              		</div>
              	</div>
              	<hr/>
              	<div class="form-row">
              		<span class="label_body">OF92A</span>
              		<span class="label">Rate</span>
              		<div class="template_container" disabled="disabled" id="template_of92a_d" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn template_selection" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" disabled="disabled" id="label_count_of92a_d">Count</span>
              			</div>
              			<select class="selection_div template_selection" disabled="disabled" id="type_of92_d" input_type="OF92A Rate" location="Body" name="type_of92_d">
              				<option value="">	</option>
              				<option value="a">A - Sign - Rate</option>
              				<option value="c">C - Data Source Scheme - Rate Name</option>
              			</select>
              			<div disabled="disabled" id="div_of92a_d">
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Qualifier</span>
              					<select class="mandatory template_selection" disabled="disabled" id="_320_of92a_d_qualifier" input_type="OF92A Qualifier" location="Body" name="_320_of92a_d_qualifier">
              						<option value="">	</option>
              						<option value=":PRIC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of92a_d_qualifier'}"><c:if test="${item.detail==':PRIC//'}"> selected="true" </c:if></c:if></c:forEach>>
              							PRIC
              						</option>
              						<option value=":REPO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of92a_d_qualifier'}"><c:if test="${item.detail==':REPO//'}"> selected="true" </c:if></c:if></c:forEach>>
              							REPO
              						</option>
              						<option value=":RSPR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of92a_d_qualifier'}"><c:if test="${item.detail==':RSPR//'}"> selected="true" </c:if></c:if></c:forEach>>
              							RSPR
              						</option>
              						<option value=":SHAI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of92a_d_qualifier'}"><c:if test="${item.detail==':SHAI//'}"> selected="true" </c:if></c:if></c:forEach>>
              							SHAI
              						</option>
              						<option value=":SLMG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of92a_d_qualifier'}"><c:if test="${item.detail==':SLMG//'}"> selected="true" </c:if></c:if></c:forEach>>
              							SLMG
              						</option>
              						<option value=":VASU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_320_of92a_d_qualifier'}"><c:if test="${item.detail==':VASU//'}"> selected="true" </c:if></c:if></c:forEach>>
              							VASU
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Sign</span>
              					<input class="template_selection" disabled="disabled" id="check_of92a_sign_d" name="check_of92a_sign_d" type="checkbox"/>
              					<div disabled="disabled" id="div_opt_of92a_sign_d">
              						<input class="template_selection" data-swift="N" disabled="disabled" id="_321_of92a_d_sign" input_type="OF92A Sign" location="Body" maxlength="1" name="_321_of92a_d_sign" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_321_of92a_d_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Rate</span>
              					<input class="mandatory template_selection" data-swift="15d" disabled="disabled" id="_322_of92a_d_rate" input_type="OF92A Rate" location="Body" maxlength="15" name="_322_of92a_d_rate" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_322_of92a_d_rate'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div disabled="disabled" id="div_of92c_d">
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Qualifier</span>
              					<select class="mandatory template_selection" disabled="disabled" id="_323_of92c_d_qualifier" input_type="OF92C Qualifier" location="Body" name="_323_of92c_d_qualifier">
              						<option value="">	</option>
              						<option value=":PRIC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_323_of92c_d_qualifier'}"><c:if test="${item.detail==':PRIC/'}"> selected="true" </c:if></c:if></c:forEach>>
              							PRIC
              						</option>
              						<option value=":REPO/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_323_of92c_d_qualifier'}"><c:if test="${item.detail==':REPO/'}"> selected="true" </c:if></c:if></c:forEach>>
              							REPO
              						</option>
              						<option value=":RSPR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_323_of92c_d_qualifier'}"><c:if test="${item.detail==':RSPR/'}"> selected="true" </c:if></c:if></c:forEach>>
              							RSPR
              						</option>
              						<option value=":SHAI/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_323_of92c_d_qualifier'}"><c:if test="${item.detail==':SHAI/'}"> selected="true" </c:if></c:if></c:forEach>>
              							SHAI
              						</option>
              						<option value=":SLMG/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_323_of92c_d_qualifier'}"><c:if test="${item.detail==':SLMG/'}"> selected="true" </c:if></c:if></c:forEach>>
              							SLMG
              						</option>
              						<option value=":VASU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_323_of92c_d_qualifier'}"><c:if test="${item.detail==':VASU/'}"> selected="true" </c:if></c:if></c:forEach>>
              							VASU
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Data source scheme</span>
              					<input class="template_selection" disabled="disabled" id="check_of92c_data_source_scheme_d" name="check_of92c_data_source_scheme_d" type="checkbox"/>
              					<div disabled="disabled" id="div_opt_of92c_data_source_scheme_d">
              						<input class="template_selection" data-swift="8c" disabled="disabled" id="_324_of92c_d_data_source_scheme" input_type="OF92C Data Source Scheme" location="Body" maxlength="8" name="_324_of92c_d_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_324_of92c_d_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<input class="template_selection" disabled="disabled" id="_325_of92c_d_" input_type="OF92C " location="Body" name="_325_of92c_d_" type="hidden" value="/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Indicator</span>
              					<input class="mandatory template_selection" data-swift="4!c" disabled="disabled" id="_326_of92c_d_indicator" input_type="OF92C Indicator" location="Body" maxlength="4" name="_326_of92c_d_indicator" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_326_of92c_d_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div disabled="disabled" id="container_of92a_d">
              			<input class="cust-btn template_selection" data-count="0" data-id="of92a_d" onclick="addContainer(this)" type="button" value="Add Field OF92A"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of92a_d">0</span>, Max: <span class="max_val" id="max_occ_of92a_d">6</span>, Count: <span class="count_val" id="cur_occ_of92a_d">0</span>
              			</span>
              		</div>
              	</div>
              	<hr/>
              	<div class="form-row">
              		<span class="label_body">OF99B</span>
              		<span class="label">Number Count</span>
              		<div class="template_container" disabled="disabled" id="template_of99b_d" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn template_selection" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" disabled="disabled" id="label_count_of99b_d">Count</span>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory template_selection" disabled="disabled" id="_330_of99b_d_qualifier" input_type="OF99B Qualifier" location="Body" name="_330_of99b_d_qualifier">
              					<option value="">	</option>
              					<option value=":CADE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of99b_d_qualifier'}"><c:if test="${item.detail==':CADE//'}"> selected="true" </c:if></c:if></c:forEach>>
              						CADE
              					</option>
              					<option value=":TOCO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_330_of99b_d_qualifier'}"><c:if test="${item.detail==':TOCO//'}"> selected="true" </c:if></c:if></c:forEach>>
              						TOCO
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Number</span>
              				<input class="mandatory template_selection" data-swift="3!n" disabled="disabled" id="_331_of99b_d_number" input_type="OF99B Number" location="Body" maxlength="3" name="_331_of99b_d_number" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_331_of99b_d_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div disabled="disabled" id="container_of99b_d">
              			<input class="cust-btn template_selection" data-count="0" data-id="of99b_d" onclick="addContainer(this)" type="button" value="Add Field OF99B"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of99b_d">0</span>, Max: <span class="max_val" id="max_occ_of99b_d">2</span>, Count: <span class="count_val" id="cur_occ_of99b_d">0</span>
              			</span>
              		</div>
              	</div>
              	<hr/>
              	<div class="form-row">
              		<span class="label_body">OF19A</span>
              		<span class="label">Amount</span>
              		<div class="template_container" disabled="disabled" id="template_of19a_d" style="display:none;">
              			<div class="form-row">
              				<span class="label_body">
              					<input class="cust-btn remove-btn template_selection" disabled="disabled" type="button" value="Remove"/>
              				</span>
              				<span class="label" disabled="disabled" id="label_count_of19a_d">Count</span>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Qualifier</span>
              				<select class="mandatory template_selection" disabled="disabled" id="_340_of19a_d_qualifier" input_type="OF19A Qualifier" location="Body" name="_340_of19a_d_qualifier">
              					<option value="">	</option>
              					<option value=":FORF/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of19a_d_qualifier'}"><c:if test="${item.detail==':FORF/'}"> selected="true" </c:if></c:if></c:forEach>>
              						FORF
              					</option>
              					<option value=":TRTE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of19a_d_qualifier'}"><c:if test="${item.detail==':TRTE/'}"> selected="true" </c:if></c:if></c:forEach>>
              						TRTE
              					</option>
              					<option value=":REPP/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of19a_d_qualifier'}"><c:if test="${item.detail==':REPP/'}"> selected="true" </c:if></c:if></c:forEach>>
              						REPP
              					</option>
              					<option value=":ACRU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of19a_d_qualifier'}"><c:if test="${item.detail==':ACRU/'}"> selected="true" </c:if></c:if></c:forEach>>
              						ACRU
              					</option>
              					<option value=":DEAL/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of19a_d_qualifier'}"><c:if test="${item.detail==':DEAL/'}"> selected="true" </c:if></c:if></c:forEach>>
              						DEAL
              					</option>
              					<option value=":TAPC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_340_of19a_d_qualifier'}"><c:if test="${item.detail==':TAPC/'}"> selected="true" </c:if></c:if></c:forEach>>
              						TAPC
              					</option>
              				</select>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Sign</span>
              				<input class="template_selection" disabled="disabled" id="check_of19a_sign_d" name="check_of19a_sign_d" type="checkbox"/>
              				<div disabled="disabled" id="div_opt_of19a_sign_d">
              					<input class="template_selection" data-swift="N" disabled="disabled" id="_341_of19a_d_sign" input_type="OF19A Sign" location="Body" maxlength="1" name="_341_of19a_d_sign" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_341_of19a_d_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Currency code</span>
              				<input class="mandatory template_selection" data-swift="3!a" disabled="disabled" id="_342_of19a_d_currency_code" input_type="OF19A Currency Code" location="Body" maxlength="3" name="_342_of19a_d_currency_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_342_of19a_d_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Price</span>
              				<input class="mandatory template_selection" data-swift="15d" disabled="disabled" id="_343_of19a_d_price" input_type="OF19A Price" location="Body" maxlength="15" name="_343_of19a_d_price" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_343_of19a_d_price'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div disabled="disabled" id="container_of19a_d">
              			<input class="cust-btn template_selection" data-count="0" data-id="of19a_d" onclick="addContainer(this)" type="button" value="Add Field OF19A"/>
              			<span class="label">
              				Min: <span class="min_val" id="min_occ_of19a_d">0</span>, Max: <span class="max_val" id="max_occ_of19a_d">6</span>, Count: <span class="count_val" id="cur_occ_of19a_d">0</span>
              			</span>
              		</div>
              	</div>
              	<hr/>
              	<div class="form-row">
              		<span class="label_body">OF70C</span>
              		<span class="label">Second Leg Narrative</span>
              		<input class="checkbox_div template_selection" disabled="disabled" id="check_of70c_d" name="check_of70c_d" type="checkbox"/>
              		<div disabled="disabled" id="div_opt_of70c_d">
              			<input class="template_selection" disabled="disabled" id="_350_of70c_d_" input_type="OF70C " location="Body" name="_350_of70c_d_" type="hidden" value=":SECO/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Narrative</span>
              				<textarea class="mandatory template_selection" cols="35" data-swift="4*35x" disabled="disabled" id="_351_of70c_d_narrative" input_type="OF70C Narrative" location="Body" name="_351_of70c_d_narrative" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_351_of70c_d_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              			</div>
              		</div>
              	</div>
              	<hr/>
              	<div class="form-row">
              		<span class="label_body">MF16S</span>
              		<span class="label">End of Block</span>
              		<input class="template_selection" disabled="disabled" id="_360_mf16s_d_end_of_block" input_type="MF16S End of Block" location="Body" name="_360_mf16s_d_end_of_block" type="hidden" value="REPO"/>
              	</div>
              	<hr/>
              </div>
              <h2 class="header-title">
              	End of Sequence D Two Leg Transaction Details
              </h2>
              <h2 class="header-title">
              	Mandatory Sequence E Settlement Details
              </h2>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF16R</span>
              	<span class="label">Start of Block</span>
              	<input id="_370_mf16r_e_start_of_block" input_type="MF16R Start of Block" location="Body" name="_370_mf16r_e_start_of_block" type="hidden" value="SETDET"/>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF22F</span>
              	<span class="label">Indicator</span>
              	<div class="template_container" id="template_mf22f_e" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_mf22f_e">Count</span>
              		</div>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Qualifier</span>
              			<select class="mandatory" disabled="disabled" id="_380_mf22f_e_qualifier" input_type="MF22F Qualifier" location="Body" name="_380_mf22f_e_qualifier">
              				<option value="">	</option>
              				<option value=":STCO/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':STCO/'}"> selected="true" </c:if></c:if></c:forEach>>
              					STCO
              				</option>
              				<option value=":SETR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':SETR/'}"> selected="true" </c:if></c:if></c:forEach>>
              					SETR
              				</option>
              				<option value=":TRCA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':TRCA/'}"> selected="true" </c:if></c:if></c:forEach>>
              					TRCA
              				</option>
              				<option value=":STAM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':STAM/'}"> selected="true" </c:if></c:if></c:forEach>>
              					STAM
              				</option>
              				<option value=":RTGS/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':RTGS/'}"> selected="true" </c:if></c:if></c:forEach>>
              					RTGS
              				</option>
              				<option value=":REGT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':REGT/'}"> selected="true" </c:if></c:if></c:forEach>>
              					REGT
              				</option>
              				<option value=":BENE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':BENE/'}"> selected="true" </c:if></c:if></c:forEach>>
              					BENE
              				</option>
              				<option value=":CASY/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':CASY/'}"> selected="true" </c:if></c:if></c:forEach>>
              					CASY
              				</option>
              				<option value=":DBNM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':DBNM/'}"> selected="true" </c:if></c:if></c:forEach>>
              					DBNM
              				</option>
              				<option value=":TCPI/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':TCPI/'}"> selected="true" </c:if></c:if></c:forEach>>
              					TCPI
              				</option>
              				<option value=":MACL/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':MACL/'}"> selected="true" </c:if></c:if></c:forEach>>
              					MACL
              				</option>
              				<option value=":FXCX/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':FXCX/'}"> selected="true" </c:if></c:if></c:forEach>>
              					FXCX
              				</option>
              				<option value=":BLOC/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':BLOC/'}"> selected="true" </c:if></c:if></c:forEach>>
              					BLOC
              				</option>
              				<option value=":REST/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':REST/'}"> selected="true" </c:if></c:if></c:forEach>>
              					REST
              				</option>
              				<option value=":SETS/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':SETS/'}"> selected="true" </c:if></c:if></c:forEach>>
              					SETS
              				</option>
              				<option value=":NETT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':NETT/'}"> selected="true" </c:if></c:if></c:forEach>>
              					NETT
              				</option>
              				<option value=":CCPT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':CCPT/'}"> selected="true" </c:if></c:if></c:forEach>>
              					CCPT
              				</option>
              				<option value=":LEOG/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':LEOG/'}"> selected="true" </c:if></c:if></c:forEach>>
              					LEOG
              				</option>
              				<option value=":COLA/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':COLA/'}"> selected="true" </c:if></c:if></c:forEach>>
              					COLA
              				</option>
              				<option value=":TRAK/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':TRAK/'}"> selected="true" </c:if></c:if></c:forEach>>
              					TRAK
              				</option>
              				<option value=":REPT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':REPT/'}"> selected="true" </c:if></c:if></c:forEach>>
              					REPT
              				</option>
              				<option value=":COLE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':COLE/'}"> selected="true" </c:if></c:if></c:forEach>>
              					COLE
              				</option>
              				<option value=":SSBT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':SSBT/'}"> selected="true" </c:if></c:if></c:forEach>>
              					SSBT
              				</option>
              				<option value=":CSBT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_380_mf22f_e_qualifier'}"><c:if test="${item.detail==':CSBT/'}"> selected="true" </c:if></c:if></c:forEach>>
              					CSBT
              				</option>
              			</select>
              		</div>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Data source scheme</span>
              			<input disabled="disabled" id="check_mf22f_data_source_scheme_e" name="check_mf22f_data_source_scheme_e" type="checkbox"/>
              			<div id="div_opt_mf22f_data_source_scheme_e">
              				<input data-swift="8c" disabled="disabled" id="_381_mf22f_e_data_source_scheme" input_type="MF22F Data Source Scheme" location="Body" maxlength="8" name="_381_mf22f_e_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_381_mf22f_e_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<input disabled="disabled" id="_382_mf22f_e_" input_type="MF22F " location="Body" name="_382_mf22f_e_" type="hidden" value="/"/>
              		<div class="form-row">
              			<span class="label_body">&nbsp;</span>
              			<span class="label">Indicator</span>
              			<input class="mandatory" data-swift="4!c" disabled="disabled" id="_383_mf22f_e_indicator" input_type="MF22F Indicator" location="Body" maxlength="4" name="_383_mf22f_e_indicator" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_383_mf22f_e_indicator'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              		</div>
              	</div>
              	<div id="container_mf22f_e">
              		<input class="cust-btn" data-count="0" data-id="mf22f_e" onclick="addContainer(this)" type="button" value="Add Field MF22F"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_mf22f_e">1</span>, Max: <span class="max_val" id="max_occ_mf22f_e">0</span>, Count: <span class="count_val" id="cur_occ_mf22f_e">0</span>
              		</span>
              	</div>
              </div>
              <hr/>
              <div class="form-row">
              	<h2 class="header-title">
              		Mandatory Repetitive Subsequence E1 Settlement Parties
              	</h2>
              	<hr/>
              	<span class="label_body">E1</span>
              	<span class="label">Settlement Parties</span>
              	<div class="template_container" id="template_e1" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_e1">Count</span>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16R</span>
              			<span class="label">Start of Block</span>
              			<input disabled="disabled" id="_390_mf16r_e1_start_of_block" input_type="MF16R Start of Block" location="Body" name="_390_mf16r_e1_start_of_block" type="hidden" value="SETPRTY"/>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF95A</span>
              			<span class="label">Party</span>
              			<div class="template_container template_seq_div_rep" id="template_mf95a_e1" style="display:none;">
              				<div class="form-row">
              					<span class="label_body">
              						<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              					</span>
              					<span class="label" id="label_count_mf95a_e1">Count</span>
              				</div>
              				<select class="selection_div mandatory" disabled="disabled" id="type_mf95_e1" input_type="MF95A Party" location="Body" name="type_mf95_e1">
              					<option value="">	</option>
              					<option value="c">C - Country Code</option>
              					<option value="d">D - Digital Ledger Identifier</option>
              					<option value="l">L - Legal Entity Identifier</option>
              					<option value="p">P - Identifier Code</option>
              					<option value="q">Q - Name and Address</option>
              					<option value="r">R - Data Source Scheme - Proprietary Code</option>
              					<option value="s">S - Data Source Scheme - Type of ID - Country Code - Alternate ID</option>
              				</select>
              				<div id="div_mf95c_e1">
              					<input disabled="disabled" id="_391_mf95c_e1_" input_type="MF95C " location="Body" name="_391_mf95c_e1_" type="hidden" value=":PSET//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Country code</span>
              						<input class="mandatory" data-swift="2!a" disabled="disabled" id="_392_mf95c_e1_country_code" input_type="MF95C Country Code" location="Body" maxlength="2" name="_392_mf95c_e1_country_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_392_mf95c_e1_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_mf95d_e1">
              					<input disabled="disabled" id="_393_mf95d_e1_" input_type="MF95D " location="Body" name="_393_mf95d_e1_" type="hidden" value=":PSET//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Digital ledger identifier</span>
              						<input class="mandatory" data-swift="9!x" disabled="disabled" id="_394_mf95d_e1_digital_ledger_identifier" input_type="MF95D Digital Ledger Identifier" location="Body" maxlength="9" name="_394_mf95d_e1_digital_ledger_identifier" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_394_mf95d_e1_digital_ledger_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_mf95l_e1">
              					<input disabled="disabled" id="_395_mf95l_e1_" input_type="MF95L " location="Body" name="_395_mf95l_e1_" type="hidden" value=":ALTE//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Legal entity identifier</span>
              						<input class="mandatory" data-swift="18!c2!n" disabled="disabled" id="_396_mf95l_e1_legal_entity_identifier" input_type="MF95L Legal Entity Identifier" location="Body" maxlength="20" name="_396_mf95l_e1_legal_entity_identifier" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_396_mf95l_e1_legal_entity_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_mf95p_e1">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_397_mf95p_e1_qualifier" input_type="MF95P Qualifier" location="Body" name="_397_mf95p_e1_qualifier">
              							<option value="">	</option>
              							<option value=":BUYR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_397_mf95p_e1_qualifier'}"><c:if test="${item.detail==':BUYR//'}"> selected="true" </c:if></c:if></c:forEach>>
              								BUYR
              							</option>
              							<option value=":DEAG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_397_mf95p_e1_qualifier'}"><c:if test="${item.detail==':DEAG//'}"> selected="true" </c:if></c:if></c:forEach>>
              								DEAG
              							</option>
              							<option value=":DECU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_397_mf95p_e1_qualifier'}"><c:if test="${item.detail==':DECU//'}"> selected="true" </c:if></c:if></c:forEach>>
              								DECU
              							</option>
              							<option value=":DEI1//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_397_mf95p_e1_qualifier'}"><c:if test="${item.detail==':DEI1//'}"> selected="true" </c:if></c:if></c:forEach>>
              								DEI1
              							</option>
              							<option value=":DEI2//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_397_mf95p_e1_qualifier'}"><c:if test="${item.detail==':DEI2//'}"> selected="true" </c:if></c:if></c:forEach>>
              								DEI2
              							</option>
              							<option value=":PSET//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_397_mf95p_e1_qualifier'}"><c:if test="${item.detail==':PSET//'}"> selected="true" </c:if></c:if></c:forEach>>
              								PSET
              							</option>
              							<option value=":REAG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_397_mf95p_e1_qualifier'}"><c:if test="${item.detail==':REAG//'}"> selected="true" </c:if></c:if></c:forEach>>
              								REAG
              							</option>
              							<option value=":RECU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_397_mf95p_e1_qualifier'}"><c:if test="${item.detail==':RECU//'}"> selected="true" </c:if></c:if></c:forEach>>
              								RECU
              							</option>
              							<option value=":REI1//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_397_mf95p_e1_qualifier'}"><c:if test="${item.detail==':REI1//'}"> selected="true" </c:if></c:if></c:forEach>>
              								REI1
              							</option>
              							<option value=":REI2//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_397_mf95p_e1_qualifier'}"><c:if test="${item.detail==':REI2//'}"> selected="true" </c:if></c:if></c:forEach>>
              								REI2
              							</option>
              							<option value=":SELL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_397_mf95p_e1_qualifier'}"><c:if test="${item.detail==':SELL//'}"> selected="true" </c:if></c:if></c:forEach>>
              								SELL
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Identifier code</span>
              						<input class="mandatory" data-swift="4!a2!a2!c[3!c]" disabled="disabled" id="_398_mf95p_e1_identifier_code" input_type="MF95P Identifier Code" location="Body" maxlength="11" name="_398_mf95p_e1_identifier_code" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_398_mf95p_e1_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_mf95q_e1">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_399_mf95q_e1_qualifier" input_type="MF95Q Qualifier" location="Body" name="_399_mf95q_e1_qualifier">
              							<option value="">	</option>
              							<option value=":BUYR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_399_mf95q_e1_qualifier'}"><c:if test="${item.detail==':BUYR//'}"> selected="true" </c:if></c:if></c:forEach>>
              								BUYR
              							</option>
              							<option value=":DEAG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_399_mf95q_e1_qualifier'}"><c:if test="${item.detail==':DEAG//'}"> selected="true" </c:if></c:if></c:forEach>>
              								DEAG
              							</option>
              							<option value=":DECU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_399_mf95q_e1_qualifier'}"><c:if test="${item.detail==':DECU//'}"> selected="true" </c:if></c:if></c:forEach>>
              								DECU
              							</option>
              							<option value=":DEI1//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_399_mf95q_e1_qualifier'}"><c:if test="${item.detail==':DEI1//'}"> selected="true" </c:if></c:if></c:forEach>>
              								DEI1
              							</option>
              							<option value=":DEI2//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_399_mf95q_e1_qualifier'}"><c:if test="${item.detail==':DEI2//'}"> selected="true" </c:if></c:if></c:forEach>>
              								DEI2
              							</option>
              							<option value=":PSET//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_399_mf95q_e1_qualifier'}"><c:if test="${item.detail==':PSET//'}"> selected="true" </c:if></c:if></c:forEach>>
              								PSET
              							</option>
              							<option value=":REAG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_399_mf95q_e1_qualifier'}"><c:if test="${item.detail==':REAG//'}"> selected="true" </c:if></c:if></c:forEach>>
              								REAG
              							</option>
              							<option value=":RECU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_399_mf95q_e1_qualifier'}"><c:if test="${item.detail==':RECU//'}"> selected="true" </c:if></c:if></c:forEach>>
              								RECU
              							</option>
              							<option value=":REI1//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_399_mf95q_e1_qualifier'}"><c:if test="${item.detail==':REI1//'}"> selected="true" </c:if></c:if></c:forEach>>
              								REI1
              							</option>
              							<option value=":REI2//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_399_mf95q_e1_qualifier'}"><c:if test="${item.detail==':REI2//'}"> selected="true" </c:if></c:if></c:forEach>>
              								REI2
              							</option>
              							<option value=":SELL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_399_mf95q_e1_qualifier'}"><c:if test="${item.detail==':SELL//'}"> selected="true" </c:if></c:if></c:forEach>>
              								SELL
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Name and address</span>
              						<textarea class="mandatory" cols="35" data-swift="4*35x" disabled="disabled" id="_3910_mf95q_e1_name_and_address" input_type="MF95Q Name and Address" location="Body" name="_3910_mf95q_e1_name_and_address" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3910_mf95q_e1_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              					</div>
              				</div>
              				<div id="div_mf95r_e1">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_3911_mf95r_e1_qualifier" input_type="MF95R Qualifier" location="Body" name="_3911_mf95r_e1_qualifier">
              							<option value="">	</option>
              							<option value=":BUYR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3911_mf95r_e1_qualifier'}"><c:if test="${item.detail==':BUYR/'}"> selected="true" </c:if></c:if></c:forEach>>
              								BUYR
              							</option>
              							<option value=":DEAG/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3911_mf95r_e1_qualifier'}"><c:if test="${item.detail==':DEAG/'}"> selected="true" </c:if></c:if></c:forEach>>
              								DEAG
              							</option>
              							<option value=":DECU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3911_mf95r_e1_qualifier'}"><c:if test="${item.detail==':DECU/'}"> selected="true" </c:if></c:if></c:forEach>>
              								DECU
              							</option>
              							<option value=":DEI1/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3911_mf95r_e1_qualifier'}"><c:if test="${item.detail==':DEI1/'}"> selected="true" </c:if></c:if></c:forEach>>
              								DEI1
              							</option>
              							<option value=":DEI2/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3911_mf95r_e1_qualifier'}"><c:if test="${item.detail==':DEI2/'}"> selected="true" </c:if></c:if></c:forEach>>
              								DEI2
              							</option>
              							<option value=":REAG/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3911_mf95r_e1_qualifier'}"><c:if test="${item.detail==':REAG/'}"> selected="true" </c:if></c:if></c:forEach>>
              								REAG
              							</option>
              							<option value=":RECU/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3911_mf95r_e1_qualifier'}"><c:if test="${item.detail==':RECU/'}"> selected="true" </c:if></c:if></c:forEach>>
              								RECU
              							</option>
              							<option value=":REI1/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3911_mf95r_e1_qualifier'}"><c:if test="${item.detail==':REI1/'}"> selected="true" </c:if></c:if></c:forEach>>
              								REI1
              							</option>
              							<option value=":REI2/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3911_mf95r_e1_qualifier'}"><c:if test="${item.detail==':REI2/'}"> selected="true" </c:if></c:if></c:forEach>>
              								REI2
              							</option>
              							<option value=":SELL/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3911_mf95r_e1_qualifier'}"><c:if test="${item.detail==':SELL/'}"> selected="true" </c:if></c:if></c:forEach>>
              								SELL
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Data source scheme</span>
              						<input class="mandatory" data-swift="8c" disabled="disabled" id="_3912_mf95r_e1_data_source_scheme" input_type="MF95R Data Source Scheme" location="Body" maxlength="8" name="_3912_mf95r_e1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3912_mf95r_e1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<input disabled="disabled" id="_3913_mf95r_e1_" input_type="MF95R " location="Body" name="_3913_mf95r_e1_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Proprietary code</span>
              						<input class="mandatory" data-swift="34x" disabled="disabled" id="_3914_mf95r_e1_proprietary_code" input_type="MF95R Proprietary Code" location="Body" maxlength="34" name="_3914_mf95r_e1_proprietary_code" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3914_mf95r_e1_proprietary_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_mf95s_e1">
              					<input disabled="disabled" id="_3915_mf95s_e1_" input_type="MF95S " location="Body" name="_3915_mf95s_e1_" type="hidden" value=":ALTE/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Data source scheme</span>
              						<input class="template_selection" disabled="disabled" id="check_mf95s_data_source_scheme_e1" name="check_mf95s_data_source_scheme_e1" type="checkbox"/>
              						<div id="div_opt_mf95s_data_source_scheme_e1">
              							<input data-swift="8c" disabled="disabled" id="_3916_mf95s_e1_data_source_scheme" input_type="MF95S Data Source Scheme" location="Body" maxlength="8" name="_3916_mf95s_e1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3916_mf95s_e1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              						</div>
              					</div>
              					<input disabled="disabled" id="_3917_mf95s_e1_" input_type="MF95S " location="Body" name="_3917_mf95s_e1_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Type of id</span>
              						<input class="mandatory" data-swift="4!c" disabled="disabled" id="_3918_mf95s_e1_type_of_id" input_type="MF95S Type of ID" location="Body" maxlength="4" name="_3918_mf95s_e1_type_of_id" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3918_mf95s_e1_type_of_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<input disabled="disabled" id="_3919_mf95s_e1_" input_type="MF95S " location="Body" name="_3919_mf95s_e1_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Country code</span>
              						<input class="mandatory" data-swift="2!a" disabled="disabled" id="_3920_mf95s_e1_country_code" input_type="MF95S Country Code" location="Body" maxlength="2" name="_3920_mf95s_e1_country_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3920_mf95s_e1_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<input disabled="disabled" id="_3921_mf95s_e1_" input_type="MF95S " location="Body" name="_3921_mf95s_e1_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Alternate id</span>
              						<input class="mandatory" data-swift="30x" disabled="disabled" id="_3922_mf95s_e1_alternate_id" input_type="MF95S Alternate ID" location="Body" maxlength="30" name="_3922_mf95s_e1_alternate_id" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3922_mf95s_e1_alternate_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              			</div>
              			<div class="container_seq_rep_div" id="container_mf95a_e1">
              				<input class="cust-btn" data-count="0" data-id="mf95a_e1" disabled="disabled" onclick="addSeqRepContainer(this)" type="button" value="Add Field MF95A"/>
              				<span class="label">
              					Min: <span class="min_val" id="min_occ_mf95a_e1">1</span>, Max: <span class="max_val" id="max_occ_mf95a_e1">0</span>, Count: <span class="count_val" id="cur_occ_mf95a_e1">0</span>
              				</span>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF97A</span>
              			<span class="label">Account</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of97a_e1" name="check_of97a_e1" type="checkbox"/>
              			<div id="div_opt_of97a_e1">
              				<select class="selection_div" disabled="disabled" id="type_of97_e1" input_type="OF97A Account" location="Body" name="type_of97_e1">
              					<option value="">	</option>
              					<option value="a">A - Account Number</option>
              					<option value="b">B - Data Source Scheme - Account Type Code - Account Number</option>
              					<option value="d">D - Data Source Scheme - Identification of Blockchain or Wallet</option>
              				</select>
              				<div id="div_of97a_e1">
              					<input disabled="disabled" id="_3924_of97a_e1_" input_type="OF97A " location="Body" name="_3924_of97a_e1_" type="hidden" value=":SAFE//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Account number</span>
              						<input class="mandatory" data-swift="35x" disabled="disabled" id="_3925_of97a_e1_account_number" input_type="OF97A Account Number" location="Body" maxlength="35" name="_3925_of97a_e1_account_number" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3925_of97a_e1_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_of97b_e1">
              					<input disabled="disabled" id="_3926_of97b_e1_" input_type="OF97B " location="Body" name="_3926_of97b_e1_" type="hidden" value=":SAFE/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Data source scheme</span>
              						<input class="template_selection" disabled="disabled" id="check_of97b_data_source_scheme_e1" name="check_of97b_data_source_scheme_e1" type="checkbox"/>
              						<div id="div_opt_of97b_data_source_scheme_e1">
              							<input data-swift="8c" disabled="disabled" id="_3927_of97b_e1_data_source_scheme" input_type="OF97B Data Source Scheme" location="Body" maxlength="8" name="_3927_of97b_e1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3927_of97b_e1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              						</div>
              					</div>
              					<input disabled="disabled" id="_3928_of97b_e1_" input_type="OF97B " location="Body" name="_3928_of97b_e1_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Account type code</span>
              						<input class="mandatory" data-swift="4!c" disabled="disabled" id="_3929_of97b_e1_account_type_code" input_type="OF97B Account Type Code" location="Body" maxlength="4" name="_3929_of97b_e1_account_type_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3929_of97b_e1_account_type_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<input disabled="disabled" id="_3930_of97b_e1_" input_type="OF97B " location="Body" name="_3930_of97b_e1_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Account number</span>
              						<input class="mandatory" data-swift="35x" disabled="disabled" id="_3931_of97b_e1_account_number" input_type="OF97B Account Number" location="Body" maxlength="35" name="_3931_of97b_e1_account_number" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3931_of97b_e1_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_of97d_e1">
              					<input disabled="disabled" id="_3932_of97d_e1_" input_type="OF97D " location="Body" name="_3932_of97d_e1_" type="hidden" value=":BCAW/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Data source scheme</span>
              						<input class="template_selection" disabled="disabled" id="check_of97d_data_source_scheme_e1" name="check_of97d_data_source_scheme_e1" type="checkbox"/>
              						<div id="div_opt_of97d_data_source_scheme_e1">
              							<input data-swift="8c" disabled="disabled" id="_3933_of97d_e1_data_source_scheme" input_type="OF97D Data Source Scheme" location="Body" maxlength="8" name="_3933_of97d_e1_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3933_of97d_e1_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              						</div>
              					</div>
              					<input disabled="disabled" id="_3934_of97d_e1_" input_type="OF97D " location="Body" name="_3934_of97d_e1_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Identification of blockchain or wallet</span>
              						<input class="mandatory" data-swift="140x" disabled="disabled" id="_3935_of97d_e1_identification_of_blockchain_or_wallet" input_type="OF97D Identification of Blockchain or Wallet" location="Body" maxlength="140" name="_3935_of97d_e1_identification_of_blockchain_or_wallet" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3935_of97d_e1_identification_of_blockchain_or_wallet'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF98A</span>
              			<span class="label">Processing Date/Time</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of98a_e1" name="check_of98a_e1" type="checkbox"/>
              			<div id="div_opt_of98a_e1">
              				<select class="selection_div" disabled="disabled" id="type_of98_e1" input_type="OF98A Processing date/time" location="Body" name="type_of98_e1">
              					<option value="">	</option>
              					<option value="a">A - Date</option>
              					<option value="c">C - Date - Time</option>
              				</select>
              				<div id="div_of98a_e1">
              					<input disabled="disabled" id="_3937_of98a_e1_" input_type="OF98A " location="Body" name="_3937_of98a_e1_" type="hidden" value=":PROC//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Date</span>
              						<input class="mandatory" data-swift="8!n" disabled="disabled" id="_3938_of98a_e1_date" input_type="OF98A Date" location="Body" maxlength="8" name="_3938_of98a_e1_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3938_of98a_e1_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_of98c_e1">
              					<input disabled="disabled" id="_3939_of98c_e1_" input_type="OF98C " location="Body" name="_3939_of98c_e1_" type="hidden" value=":PROC//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Date</span>
              						<input class="mandatory" data-swift="8!n" disabled="disabled" id="_3940_of98c_e1_date" input_type="OF98C Date" location="Body" maxlength="8" name="_3940_of98c_e1_date" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3940_of98c_e1_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Time</span>
              						<input class="mandatory" data-swift="6!n" disabled="disabled" id="_3941_of98c_e1_time" input_type="OF98C Time" location="Body" maxlength="6" name="_3941_of98c_e1_time" oninput="this.value = this.value.toUpperCase().replace(/[^0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3941_of98c_e1_time'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF20C</span>
              			<span class="label">Processing Reference</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of20c_e1" name="check_of20c_e1" type="checkbox"/>
              			<div id="div_opt_of20c_e1">
              				<input disabled="disabled" id="_3943_of20c_e1_" input_type="OF20C " location="Body" name="_3943_of20c_e1_" type="hidden" value=":PROC//"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Reference</span>
              					<input class="mandatory" data-swift="16x" disabled="disabled" id="_3944_of20c_e1_reference" input_type="OF20C Reference" location="Body" maxlength="16" name="_3944_of20c_e1_reference" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3944_of20c_e1_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF70A</span>
              			<span class="label">Narrative</span>
              			<div class="template_container template_seq_div_rep" id="template_of70a_e1" style="display:none;">
              				<div class="form-row">
              					<span class="label_body">
              						<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              					</span>
              					<span class="label" id="label_count_of70a_e1">Count</span>
              				</div>
              				<select class="selection_div" disabled="disabled" id="type_of70_e1" input_type="OF70A Narrative" location="Body" name="type_of70_e1">
              					<option value="">	</option>
              					<option value="c">C - Narrative</option>
              					<option value="d">D - Narrative</option>
              					<option value="e">E - Narrative</option>
              				</select>
              				<div id="div_of70c_e1">
              					<input disabled="disabled" id="_3945_of70c_e1_" input_type="OF70C " location="Body" name="_3945_of70c_e1_" type="hidden" value=":PACO//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Narrative</span>
              						<textarea class="mandatory" cols="35" data-swift="4*35x" disabled="disabled" id="_3946_of70c_e1_narrative" input_type="OF70C Narrative" location="Body" name="_3946_of70c_e1_narrative" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3946_of70c_e1_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              					</div>
              				</div>
              				<div id="div_of70d_e1">
              					<input disabled="disabled" id="_3947_of70d_e1_" input_type="OF70D " location="Body" name="_3947_of70d_e1_" type="hidden" value=":REGI//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Narrative</span>
              						<textarea class="mandatory" cols="35" data-swift="6*35x" disabled="disabled" id="_3948_of70d_e1_narrative" input_type="OF70D Narrative" location="Body" name="_3948_of70d_e1_narrative" rows="6"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3948_of70d_e1_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              					</div>
              				</div>
              				<div id="div_of70e_e1">
              					<input disabled="disabled" id="_3949_of70e_e1_" input_type="OF70E " location="Body" name="_3949_of70e_e1_" type="hidden" value=":DECL//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Narrative</span>
              						<textarea class="mandatory" cols="35" data-swift="10*35x" disabled="disabled" id="_3950_of70e_e1_narrative" input_type="OF70E Narrative" location="Body" name="_3950_of70e_e1_narrative" rows="10"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_3950_of70e_e1_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              					</div>
              				</div>
              			</div>
              			<div class="container_seq_rep_div" id="container_of70a_e1">
              				<input class="cust-btn" data-count="0" data-id="of70a_e1" disabled="disabled" onclick="addSeqRepContainer(this)" type="button" value="Add Field OF70A"/>
              				<span class="label">
              					Min: <span class="min_val" id="min_occ_of70a_e1">0</span>, Max: <span class="max_val" id="max_occ_of70a_e1">3</span>, Count: <span class="count_val" id="cur_occ_of70a_e1">0</span>
              				</span>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16S</span>
              			<span class="label">End of Block</span>
              			<input disabled="disabled" id="_3952_mf16s_e1_end_of_block" input_type="MF16S End of Block" location="Body" name="_3952_mf16s_e1_end_of_block" type="hidden" value="SETPRTY"/>
              		</div>
              	</div>
              	<div id="container_e1">
              		<input class="cust-btn" data-count="0" data-id="e1" onclick="addTemplateContainer(this)" type="button" value="Add Field E1"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_e1">1</span>, Max: <span class="max_val" id="max_occ_e1">0</span>, Count: <span class="count_val" id="cur_occ_e1">0</span>
              		</span>
              	</div>
              	<h2 class="header-title">
              		End of Subsequence E1 Settlement Parties
              	</h2>
              </div>
              <hr/>
              <div class="form-row">
              	<h2 class="header-title">
              		Optional Repetitive Subsequence E2 Cash Parties
              	</h2>
              	<hr/>
              	<span class="label_body">E2</span>
              	<span class="label">Cash Parties</span>
              	<div class="template_container" id="template_e2" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_e2">Count</span>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16R</span>
              			<span class="label">Start of Block</span>
              			<input disabled="disabled" id="_400_mf16r_e2_start_of_block" input_type="MF16R Start of Block" location="Body" name="_400_mf16r_e2_start_of_block" type="hidden" value="CSHPRTY"/>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF95A</span>
              			<span class="label">Party</span>
              			<div class="template_container template_seq_div_rep" id="template_mf95a_e2" style="display:none;">
              				<div class="form-row">
              					<span class="label_body">
              						<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              					</span>
              					<span class="label" id="label_count_mf95a_e2">Count</span>
              				</div>
              				<select class="selection_div mandatory" disabled="disabled" id="type_mf95_e2" input_type="MF95A Party" location="Body" name="type_mf95_e2">
              					<option value="">	</option>
              					<option value="l">L - Legal Entity Identifier</option>
              					<option value="p">P - Identifier Code</option>
              					<option value="q">Q - Name and Address</option>
              					<option value="r">R - Qualifier - Data Source Scheme - Proprietary Code</option>
              					<option value="s">S - Data Source Scheme - Type of ID - Country Code - Alternate ID</option>
              				</select>
              				<div id="div_mf95l_e2">
              					<input disabled="disabled" id="_401_mf95l_e2_" input_type="MF95L " location="Body" name="_401_mf95l_e2_" type="hidden" value=":ALTE//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Legal entity identifier</span>
              						<input class="mandatory" data-swift="18!c2!n" disabled="disabled" id="_402_mf95l_e2_legal_entity_identifier" input_type="MF95L Legal Entity Identifier" location="Body" maxlength="20" name="_402_mf95l_e2_legal_entity_identifier" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_402_mf95l_e2_legal_entity_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_mf95p_e2">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_403_mf95p_e2_qualifier" input_type="MF95P Qualifier" location="Body" name="_403_mf95p_e2_qualifier">
              							<option value="">	</option>
              							<option value=":ACCW//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_403_mf95p_e2_qualifier'}"><c:if test="${item.detail==':ACCW//'}"> selected="true" </c:if></c:if></c:forEach>>
              								ACCW
              							</option>
              							<option value=":BENM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_403_mf95p_e2_qualifier'}"><c:if test="${item.detail==':BENM//'}"> selected="true" </c:if></c:if></c:forEach>>
              								BENM
              							</option>
              							<option value=":DEBT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_403_mf95p_e2_qualifier'}"><c:if test="${item.detail==':DEBT//'}"> selected="true" </c:if></c:if></c:forEach>>
              								DEBT
              							</option>
              							<option value=":INTM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_403_mf95p_e2_qualifier'}"><c:if test="${item.detail==':INTM//'}"> selected="true" </c:if></c:if></c:forEach>>
              								INTM
              							</option>
              							<option value=":PAYE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_403_mf95p_e2_qualifier'}"><c:if test="${item.detail==':PAYE//'}"> selected="true" </c:if></c:if></c:forEach>>
              								PAYE
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Identifier code</span>
              						<input class="mandatory" data-swift="4!a2!a2!c[3!c]" disabled="disabled" id="_404_mf95p_e2_identifier_code" input_type="MF95P Identifier Code" location="Body" maxlength="11" name="_404_mf95p_e2_identifier_code" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_404_mf95p_e2_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_mf95q_e2">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_405_mf95q_e2_qualifier" input_type="MF95Q Qualifier" location="Body" name="_405_mf95q_e2_qualifier">
              							<option value="">	</option>
              							<option value=":ACCW//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_405_mf95q_e2_qualifier'}"><c:if test="${item.detail==':ACCW//'}"> selected="true" </c:if></c:if></c:forEach>>
              								ACCW
              							</option>
              							<option value=":BENM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_405_mf95q_e2_qualifier'}"><c:if test="${item.detail==':BENM//'}"> selected="true" </c:if></c:if></c:forEach>>
              								BENM
              							</option>
              							<option value=":DEBT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_405_mf95q_e2_qualifier'}"><c:if test="${item.detail==':DEBT//'}"> selected="true" </c:if></c:if></c:forEach>>
              								DEBT
              							</option>
              							<option value=":INTM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_405_mf95q_e2_qualifier'}"><c:if test="${item.detail==':INTM//'}"> selected="true" </c:if></c:if></c:forEach>>
              								INTM
              							</option>
              							<option value=":PAYE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_405_mf95q_e2_qualifier'}"><c:if test="${item.detail==':PAYE//'}"> selected="true" </c:if></c:if></c:forEach>>
              								PAYE
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Name and address</span>
              						<textarea class="mandatory" cols="35" data-swift="4*35x" disabled="disabled" id="_406_mf95q_e2_name_and_address" input_type="MF95Q Name and Address" location="Body" name="_406_mf95q_e2_name_and_address" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_406_mf95q_e2_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              					</div>
              				</div>
              				<div id="div_mf95r_e2">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_407_mf95r_e2_qualifier" input_type="MF95R Qualifier" location="Body" name="_407_mf95r_e2_qualifier">
              							<option value="">	</option>
              							<option value=":ACCW/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_407_mf95r_e2_qualifier'}"><c:if test="${item.detail==':ACCW/'}"> selected="true" </c:if></c:if></c:forEach>>
              								ACCW
              							</option>
              							<option value=":BENM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_407_mf95r_e2_qualifier'}"><c:if test="${item.detail==':BENM/'}"> selected="true" </c:if></c:if></c:forEach>>
              								BENM
              							</option>
              							<option value=":DEBT/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_407_mf95r_e2_qualifier'}"><c:if test="${item.detail==':DEBT/'}"> selected="true" </c:if></c:if></c:forEach>>
              								DEBT
              							</option>
              							<option value=":INTM/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_407_mf95r_e2_qualifier'}"><c:if test="${item.detail==':INTM/'}"> selected="true" </c:if></c:if></c:forEach>>
              								INTM
              							</option>
              							<option value=":PAYE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_407_mf95r_e2_qualifier'}"><c:if test="${item.detail==':PAYE/'}"> selected="true" </c:if></c:if></c:forEach>>
              								PAYE
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Data source scheme</span>
              						<input class="mandatory" data-swift="8c" disabled="disabled" id="_408_mf95r_e2_data_source_scheme" input_type="MF95R Data Source Scheme" location="Body" maxlength="8" name="_408_mf95r_e2_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_408_mf95r_e2_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<input disabled="disabled" id="_409_mf95r_e2_" input_type="MF95R " location="Body" name="_409_mf95r_e2_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Proprietary code</span>
              						<input class="mandatory" data-swift="34x" disabled="disabled" id="_4010_mf95r_e2_proprietary_code" input_type="MF95R Proprietary Code" location="Body" maxlength="34" name="_4010_mf95r_e2_proprietary_code" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4010_mf95r_e2_proprietary_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_mf95s_e2">
              					<input disabled="disabled" id="_4011_mf95s_e2_" input_type="MF95S " location="Body" name="_4011_mf95s_e2_" type="hidden" value=":ALTE/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Data source scheme</span>
              						<input class="template_selection" disabled="disabled" id="check_mf95s_data_source_scheme_e2" name="check_mf95s_data_source_scheme_e2" type="checkbox"/>
              						<div id="div_opt_mf95s_data_source_scheme_e2">
              							<input data-swift="8c" disabled="disabled" id="_4012_mf95s_e2_data_source_scheme" input_type="MF95S Data Source Scheme" location="Body" maxlength="8" name="_4012_mf95s_e2_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4012_mf95s_e2_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              						</div>
              					</div>
              					<input disabled="disabled" id="_4013_mf95s_e2_" input_type="MF95S " location="Body" name="_4013_mf95s_e2_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Type of id</span>
              						<input class="mandatory" data-swift="4!c" disabled="disabled" id="_4014_mf95s_e2_type_of_id" input_type="MF95S Type of ID" location="Body" maxlength="4" name="_4014_mf95s_e2_type_of_id" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4014_mf95s_e2_type_of_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<input disabled="disabled" id="_4015_mf95s_e2_" input_type="MF95S " location="Body" name="_4015_mf95s_e2_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Country code</span>
              						<input class="mandatory" data-swift="2!a" disabled="disabled" id="_4016_mf95s_e2_country_code" input_type="MF95S Country Code" location="Body" maxlength="2" name="_4016_mf95s_e2_country_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4016_mf95s_e2_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<input disabled="disabled" id="_4017_mf95s_e2_" input_type="MF95S " location="Body" name="_4017_mf95s_e2_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Alternate id</span>
              						<input class="mandatory" data-swift="30x" disabled="disabled" id="_4018_mf95s_e2_alternate_id" input_type="MF95S Alternate ID" location="Body" maxlength="30" name="_4018_mf95s_e2_alternate_id" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4018_mf95s_e2_alternate_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              			</div>
              			<div class="container_seq_rep_div" id="container_mf95a_e2">
              				<input class="cust-btn" data-count="0" data-id="mf95a_e2" disabled="disabled" onclick="addSeqRepContainer(this)" type="button" value="Add Field MF95A"/>
              				<span class="label">
              					Min: <span class="min_val" id="min_occ_mf95a_e2">1</span>, Max: <span class="max_val" id="max_occ_mf95a_e2">0</span>, Count: <span class="count_val" id="cur_occ_mf95a_e2">0</span>
              				</span>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF97A</span>
              			<span class="label">Account</span>
              			<div class="template_container template_seq_div_rep" id="template_of97a_e2" style="display:none;">
              				<div class="form-row">
              					<span class="label_body">
              						<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              					</span>
              					<span class="label" id="label_count_of97a_e2">Count</span>
              				</div>
              				<select class="selection_div" disabled="disabled" id="type_of97_e2" input_type="OF97A Account" location="Body" name="type_of97_e2">
              					<option value="">	</option>
              					<option value="a">A - Account Number</option>
              					<option value="d">D - Data Source Scheme - Identification of Blockchain or Wallet</option>
              					<option value="e">E - International Bank Account Number</option>
              				</select>
              				<div id="div_of97a_e2">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_4020_of97a_e2_qualifier" input_type="OF97A Qualifier" location="Body" name="_4020_of97a_e2_qualifier">
              							<option value="">	</option>
              							<option value=":CASH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4020_of97a_e2_qualifier'}"><c:if test="${item.detail==':CASH//'}"> selected="true" </c:if></c:if></c:forEach>>
              								CASH
              							</option>
              							<option value=":CHAR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4020_of97a_e2_qualifier'}"><c:if test="${item.detail==':CHAR//'}"> selected="true" </c:if></c:if></c:forEach>>
              								CHAR
              							</option>
              							<option value=":COMM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4020_of97a_e2_qualifier'}"><c:if test="${item.detail==':COMM//'}"> selected="true" </c:if></c:if></c:forEach>>
              								COMM
              							</option>
              							<option value=":TAXE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4020_of97a_e2_qualifier'}"><c:if test="${item.detail==':TAXE//'}"> selected="true" </c:if></c:if></c:forEach>>
              								TAXE
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Account number</span>
              						<input class="mandatory" data-swift="35x" disabled="disabled" id="_4021_of97a_e2_account_number" input_type="OF97A Account Number" location="Body" maxlength="35" name="_4021_of97a_e2_account_number" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4021_of97a_e2_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_of97d_e2">
              					<input disabled="disabled" id="_4022_of97d_e2_" input_type="OF97D " location="Body" name="_4022_of97d_e2_" type="hidden" value=":BCCW/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Data source scheme</span>
              						<input class="template_selection" disabled="disabled" id="check_of97d_data_source_scheme_e2" name="check_of97d_data_source_scheme_e2" type="checkbox"/>
              						<div id="div_opt_of97d_data_source_scheme_e2">
              							<input data-swift="8c" disabled="disabled" id="_4023_of97d_e2_data_source_scheme" input_type="OF97D Data Source Scheme" location="Body" maxlength="8" name="_4023_of97d_e2_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4023_of97d_e2_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              						</div>
              					</div>
              					<input disabled="disabled" id="_4024_of97d_e2_" input_type="OF97D " location="Body" name="_4024_of97d_e2_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Identification of blockchain or wallet</span>
              						<input class="mandatory" data-swift="140x" disabled="disabled" id="_4025_of97d_e2_identification_of_blockchain_or_wallet" input_type="OF97D Identification of Blockchain or Wallet" location="Body" maxlength="140" name="_4025_of97d_e2_identification_of_blockchain_or_wallet" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4025_of97d_e2_identification_of_blockchain_or_wallet'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_of97e_e2">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_4026_of97e_e2_qualifier" input_type="OF97E Qualifier" location="Body" name="_4026_of97e_e2_qualifier">
              							<option value="">	</option>
              							<option value=":CASH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4026_of97e_e2_qualifier'}"><c:if test="${item.detail==':CASH//'}"> selected="true" </c:if></c:if></c:forEach>>
              								CASH
              							</option>
              							<option value=":CHAR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4026_of97e_e2_qualifier'}"><c:if test="${item.detail==':CHAR//'}"> selected="true" </c:if></c:if></c:forEach>>
              								CHAR
              							</option>
              							<option value=":COMM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4026_of97e_e2_qualifier'}"><c:if test="${item.detail==':COMM//'}"> selected="true" </c:if></c:if></c:forEach>>
              								COMM
              							</option>
              							<option value=":TAXE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4026_of97e_e2_qualifier'}"><c:if test="${item.detail==':TAXE//'}"> selected="true" </c:if></c:if></c:forEach>>
              								TAXE
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Account number</span>
              						<input class="mandatory" data-swift="34x" disabled="disabled" id="_4027_of97e_e2_account_number" input_type="OF97E Account Number" location="Body" maxlength="34" name="_4027_of97e_e2_account_number" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4027_of97e_e2_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              			</div>
              			<div class="container_seq_rep_div" id="container_of97a_e2">
              				<input class="cust-btn" data-count="0" data-id="of97a_e2" disabled="disabled" onclick="addSeqRepContainer(this)" type="button" value="Add Field OF97A"/>
              				<span class="label">
              					Min: <span class="min_val" id="min_occ_of97a_e2">0</span>, Max: <span class="max_val" id="max_occ_of97a_e2">4</span>, Count: <span class="count_val" id="cur_occ_of97a_e2">0</span>
              				</span>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF70A</span>
              			<span class="label">Narrative</span>
              			<div class="template_container template_seq_div_rep" id="template_of70a_e2" style="display:none;">
              				<div class="form-row">
              					<span class="label_body">
              						<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              					</span>
              					<span class="label" id="label_count_of70a_e2">Count</span>
              				</div>
              				<select class="selection_div" disabled="disabled" id="type_of70_e2" input_type="OF70A Narrative" location="Body" name="type_of70_e2">
              					<option value="">	</option>
              					<option value="c">C - Narrative</option>
              					<option value="e">E - Narrative</option>
              				</select>
              				<div id="div_of70c_e2">
              					<input disabled="disabled" id="_4029_of70c_e2_" input_type="OF70C " location="Body" name="_4029_of70c_e2_" type="hidden" value=":PACO//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Narrative</span>
              						<textarea class="mandatory" cols="35" data-swift="4*35x" disabled="disabled" id="_4030_of70c_e2_narrative" input_type="OF70C Narrative" location="Body" name="_4030_of70c_e2_narrative" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4030_of70c_e2_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              					</div>
              				</div>
              				<div id="div_of70e_e2">
              					<input disabled="disabled" id="_4031_of70e_e2_" input_type="OF70E " location="Body" name="_4031_of70e_e2_" type="hidden" value=":DECL//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Narrative</span>
              						<textarea class="mandatory" cols="35" data-swift="10*35x" disabled="disabled" id="_4032_of70e_e2_narrative" input_type="OF70E Narrative" location="Body" name="_4032_of70e_e2_narrative" rows="10"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4032_of70e_e2_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              					</div>
              				</div>
              			</div>
              			<div class="container_seq_rep_div" id="container_of70a_e2">
              				<input class="cust-btn" data-count="0" data-id="of70a_e2" disabled="disabled" onclick="addSeqRepContainer(this)" type="button" value="Add Field OF70A"/>
              				<span class="label">
              					Min: <span class="min_val" id="min_occ_of70a_e2">0</span>, Max: <span class="max_val" id="max_occ_of70a_e2">2</span>, Count: <span class="count_val" id="cur_occ_of70a_e2">0</span>
              				</span>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16S</span>
              			<span class="label">End of Block</span>
              			<input disabled="disabled" id="_4034_mf16s_e2_end_of_block" input_type="MF16S End of Block" location="Body" name="_4034_mf16s_e2_end_of_block" type="hidden" value="CSHPRTY"/>
              		</div>
              	</div>
              	<div id="container_e2">
              		<input class="cust-btn" data-count="0" data-id="e2" onclick="addTemplateContainer(this)" type="button" value="Add Field E2"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_e2">0</span>, Max: <span class="max_val" id="max_occ_e2">0</span>, Count: <span class="count_val" id="cur_occ_e2">0</span>
              		</span>
              	</div>
              	<h2 class="header-title">
              		End of Subsequence E2 Cash Parties
              	</h2>
              </div>
              <hr/>
              <div class="form-row">
              	<h2 class="header-title">
              		Optional Repetitive Subsequence E3 Amounts
              	</h2>
              	<hr/>
              	<span class="label_body">E3</span>
              	<span class="label">Amounts</span>
              	<div class="template_container" id="template_e3" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="remove-btn" disabled="disabled" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_e3">Count</span>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16R</span>
              			<span class="label">Start of Block</span>
              			<input disabled="disabled" id="_410_mf16r_e3_start_of_block" input_type="MF16R Start of Block" location="Body" name="_410_mf16r_e3_start_of_block" type="hidden" value="AMT"/>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF17B</span>
              			<span class="label">Flag</span>
              			<div class="template_container template_seq_div_rep" id="template_of17b_e3" style="display:none;">
              				<div class="form-row">
              					<span class="label_body">
              						<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              					</span>
              					<span class="label" id="label_count_of17b_e3">Count</span>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Qualifier</span>
              					<select class="mandatory" disabled="disabled" id="_411_of17b_e3_qualifier" input_type="OF17B Qualifier" location="Body" name="_411_of17b_e3_qualifier">
              						<option value="">	</option>
              						<option value=":ACRU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_411_of17b_e3_qualifier'}"><c:if test="${item.detail==':ACRU//'}"> selected="true" </c:if></c:if></c:forEach>>
              							ACRU
              						</option>
              						<option value=":STAM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_411_of17b_e3_qualifier'}"><c:if test="${item.detail==':STAM//'}"> selected="true" </c:if></c:if></c:forEach>>
              							STAM
              						</option>
              						<option value=":EXEC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_411_of17b_e3_qualifier'}"><c:if test="${item.detail==':EXEC//'}"> selected="true" </c:if></c:if></c:forEach>>
              							EXEC
              						</option>
              						<option value=":RSCH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_411_of17b_e3_qualifier'}"><c:if test="${item.detail==':RSCH//'}"> selected="true" </c:if></c:if></c:forEach>>
              							RSCH
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Flag</span>
              					<select class="mandatory" disabled="disabled" id="_412_of17b_e3_flag" input_type="OF17B Flag" location="Body" name="_412_of17b_e3_flag">
              						<option value="">	</option>
              						<option value="N" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_412_of17b_e3_flag'}"><c:if test="${item.detail=='N'}"> selected="true" </c:if></c:if></c:forEach>>
              							N
              						</option>
              						<option value="Y" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_412_of17b_e3_flag'}"><c:if test="${item.detail=='Y'}"> selected="true" </c:if></c:if></c:forEach>>
              							Y
              						</option>
              					</select>
              				</div>
              			</div>
              			<div class="container_seq_rep_div" id="container_of17b_e3">
              				<input class="cust-btn" data-count="0" data-id="of17b_e3" disabled="disabled" onclick="addSeqRepContainer(this)" type="button" value="Add Field OF17B"/>
              				<span class="label">
              					Min: <span class="min_val" id="min_occ_of17b_e3">0</span>, Max: <span class="max_val" id="max_occ_of17b_e3">4</span>, Count: <span class="count_val" id="cur_occ_of17b_e3">0</span>
              				</span>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF19A</span>
              			<span class="label">Amount</span>
              			<div class="template_container template_seq_div_rep" id="template_mf19a_e3" style="display:none;">
              				<div class="form-row">
              					<span class="label_body">
              						<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              					</span>
              					<span class="label" id="label_count_mf19a_e3">Count</span>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Qualifier</span>
              					<select class="mandatory" disabled="disabled" id="_413_mf19a_e3_qualifier" input_type="MF19A Qualifier" location="Body" name="_413_mf19a_e3_qualifier">
              						<option value="">	</option>
              						<option value=":ACRU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':ACRU//'}"> selected="true" </c:if></c:if></c:forEach>>
              							ACRU
              						</option>
              						<option value=":CHAR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':CHAR//'}"> selected="true" </c:if></c:if></c:forEach>>
              							CHAR
              						</option>
              						<option value=":COUN//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':COUN//'}"> selected="true" </c:if></c:if></c:forEach>>
              							COUN
              						</option>
              						<option value=":DEAL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':DEAL//'}"> selected="true" </c:if></c:if></c:forEach>>
              							DEAL
              						</option>
              						<option value=":EXEC//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':EXEC//'}"> selected="true" </c:if></c:if></c:forEach>>
              							EXEC
              						</option>
              						<option value=":ISDI//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':ISDI//'}"> selected="true" </c:if></c:if></c:forEach>>
              							ISDI
              						</option>
              						<option value=":LADT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':LADT//'}"> selected="true" </c:if></c:if></c:forEach>>
              							LADT
              						</option>
              						<option value=":LEVY//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':LEVY//'}"> selected="true" </c:if></c:if></c:forEach>>
              							LEVY
              						</option>
              						<option value=":LOCL//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':LOCL//'}"> selected="true" </c:if></c:if></c:forEach>>
              							LOCL
              						</option>
              						<option value=":LOCO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':LOCO//'}"> selected="true" </c:if></c:if></c:forEach>>
              							LOCO
              						</option>
              						<option value=":MARG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':MARG//'}"> selected="true" </c:if></c:if></c:forEach>>
              							MARG
              						</option>
              						<option value=":OTHR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':OTHR//'}"> selected="true" </c:if></c:if></c:forEach>>
              							OTHR
              						</option>
              						<option value=":REGF//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':REGF//'}"> selected="true" </c:if></c:if></c:forEach>>
              							REGF
              						</option>
              						<option value=":SETT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':SETT//'}"> selected="true" </c:if></c:if></c:forEach>>
              							SETT
              						</option>
              						<option value=":SHIP//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':SHIP//'}"> selected="true" </c:if></c:if></c:forEach>>
              							SHIP
              						</option>
              						<option value=":SPCN//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':SPCN//'}"> selected="true" </c:if></c:if></c:forEach>>
              							SPCN
              						</option>
              						<option value=":STAM//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':STAM//'}"> selected="true" </c:if></c:if></c:forEach>>
              							STAM
              						</option>
              						<option value=":STEX//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':STEX//'}"> selected="true" </c:if></c:if></c:forEach>>
              							STEX
              						</option>
              						<option value=":TRAN//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':TRAN//'}"> selected="true" </c:if></c:if></c:forEach>>
              							TRAN
              						</option>
              						<option value=":TRAX//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':TRAX//'}"> selected="true" </c:if></c:if></c:forEach>>
              							TRAX
              						</option>
              						<option value=":VATA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':VATA//'}"> selected="true" </c:if></c:if></c:forEach>>
              							VATA
              						</option>
              						<option value=":WITH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':WITH//'}"> selected="true" </c:if></c:if></c:forEach>>
              							WITH
              						</option>
              						<option value=":ANTO//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':ANTO//'}"> selected="true" </c:if></c:if></c:forEach>>
              							ANTO
              						</option>
              						<option value=":BOOK//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':BOOK//'}"> selected="true" </c:if></c:if></c:forEach>>
              							BOOK
              						</option>
              						<option value=":COAX//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':COAX//'}"> selected="true" </c:if></c:if></c:forEach>>
              							COAX
              						</option>
              						<option value=":ACCA//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':ACCA//'}"> selected="true" </c:if></c:if></c:forEach>>
              							ACCA
              						</option>
              						<option value=":RSCH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':RSCH//'}"> selected="true" </c:if></c:if></c:forEach>>
              							RSCH
              						</option>
              						<option value=":NTWK//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':NTWK//'}"> selected="true" </c:if></c:if></c:forEach>>
              							NTWK
              						</option>
              						<option value=":RESU//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':RESU//'}"> selected="true" </c:if></c:if></c:forEach>>
              							RESU
              						</option>
              						<option value=":OCMT//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_413_mf19a_e3_qualifier'}"><c:if test="${item.detail==':OCMT//'}"> selected="true" </c:if></c:if></c:forEach>>
              							OCMT
              						</option>
              					</select>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Sign</span>
              					<input class="template_selection" disabled="disabled" id="check_mf19a_sign_e3" name="check_mf19a_sign_e3" type="checkbox"/>
              					<div id="div_opt_mf19a_sign_e3">
              						<input data-swift="N" disabled="disabled" id="_414_mf19a_e3_sign" input_type="MF19A Sign" location="Body" maxlength="1" name="_414_mf19a_e3_sign" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_414_mf19a_e3_sign'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Currency code</span>
              					<input class="mandatory" data-swift="3!a" disabled="disabled" id="_415_mf19a_e3_currency_code" input_type="MF19A Currency Code" location="Body" maxlength="3" name="_415_mf19a_e3_currency_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_415_mf19a_e3_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Amount</span>
              					<input class="mandatory" data-swift="15d" disabled="disabled" id="_416_mf19a_e3_amount" input_type="MF19A Amount" location="Body" maxlength="15" name="_416_mf19a_e3_amount" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_416_mf19a_e3_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              			<div class="container_seq_rep_div" id="container_mf19a_e3">
              				<input class="cust-btn" data-count="0" data-id="mf19a_e3" disabled="disabled" onclick="addSeqRepContainer(this)" type="button" value="Add Field MF19A"/>
              				<span class="label">
              					Min: <span class="min_val" id="min_occ_mf19a_e3">1</span>, Max: <span class="max_val" id="max_occ_mf19a_e3">4</span>, Count: <span class="count_val" id="cur_occ_mf19a_e3">0</span>
              				</span>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF92B</span>
              			<span class="label">Exchange Rate</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of92b_e3" name="check_of92b_e3" type="checkbox"/>
              			<div id="div_opt_of92b_e3">
              				<input disabled="disabled" id="_417_of92b_e3_" input_type="OF92B " location="Body" name="_417_of92b_e3_" type="hidden" value=":EXCH//"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">First currency code</span>
              					<input class="mandatory" data-swift="3!a" disabled="disabled" id="_418_of92b_e3_first_currency_code" input_type="OF92B First Currency Code" location="Body" maxlength="3" name="_418_of92b_e3_first_currency_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_418_of92b_e3_first_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              				<input disabled="disabled" id="_419_of92b_e3_" input_type="OF92B " location="Body" name="_419_of92b_e3_" type="hidden" value="/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Second currency code</span>
              					<input class="mandatory" data-swift="3!a" disabled="disabled" id="_4110_of92b_e3_second_currency_code" input_type="OF92B Second Currency Code" location="Body" maxlength="3" name="_4110_of92b_e3_second_currency_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4110_of92b_e3_second_currency_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              				<input disabled="disabled" id="_4111_of92b_e3_" input_type="OF92B " location="Body" name="_4111_of92b_e3_" type="hidden" value="/"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Rate</span>
              					<input class="mandatory" data-swift="15d" disabled="disabled" id="_4112_of92b_e3_rate" input_type="OF92B Rate" location="Body" maxlength="15" name="_4112_of92b_e3_rate" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4112_of92b_e3_rate'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16S</span>
              			<span class="label">End of Block</span>
              			<input disabled="disabled" id="_4113_mf16s_e3_end_of_block" input_type="MF16S End of Block" location="Body" name="_4113_mf16s_e3_end_of_block" type="hidden" value="AMT"/>
              		</div>
              	</div>
              	<div id="container_e3">
              		<input class="cust-btn" data-count="0" data-id="e3" onclick="addTemplateContainer(this)" type="button" value="Add Field E3"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_e3">0</span>, Max: <span class="max_val" id="max_occ_e3">0</span>, Count: <span class="count_val" id="cur_occ_e3">0</span>
              		</span>
              	</div>
              	<h2 class="header-title">
              		End of Subsequence E3 Amounts
              	</h2>
              </div>
              <hr/>
              <div>
              	<h2 class="header-title">
              		Optional Subsequence E4 Digital Network Fee
              	</h2>
              	<hr/>
              	<input class="checkbox_sequence" id="check_e4" name="check_e4" type="checkbox"/>
              	<div id="div_opt_e4">
              		<div class="form-row">
              			<span class="label_body">MF16R</span>
              			<span class="label">Start of Block</span>
              			<input disabled="disabled" id="_420_mf16r_e4_start_of_block" input_type="MF16R Start of Block" location="Body" name="_420_mf16r_e4_start_of_block" type="hidden" value="NTWKFEE"/>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF35B</span>
              			<span class="label">Identification of the Financial Instrument</span>
              			<input disabled="disabled" id="_421_mf35b_e4_" input_type="MF35B " location="Body" name="_421_mf35b_e4_" type="hidden" value="ISIN "/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Identification of security</span>
              				<input class="mandatory" data-swift="12!c" disabled="disabled" id="_422_mf35b_e4_identification_of_security" input_type="MF35B Identification of Security" location="Body" maxlength="12" name="_422_mf35b_e4_identification_of_security" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_422_mf35b_e4_identification_of_security'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Description of security</span>
              				<input disabled="disabled" id="check_mf35b_description_of_security_e4" name="check_mf35b_description_of_security_e4" type="checkbox"/>
              				<div id="div_opt_mf35b_description_of_security_e4">
              					<textarea cols="35" data-swift="4*35x" disabled="disabled" id="_423_mf35b_e4_description_of_security" input_type="MF35B Description of Security" location="Body" name="_423_mf35b_e4_description_of_security" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_423_mf35b_e4_description_of_security'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF36D</span>
              			<span class="label">Quantity of Digital Asset for the Network Fee</span>
              			<input disabled="disabled" id="_424_mf36d_e4_" input_type="MF36D " location="Body" name="_424_mf36d_e4_" type="hidden" value=":NTWK//DITU/"/>
              			<div class="form-row">
              				<span class="label_body">&nbsp;</span>
              				<span class="label">Quantity of digital tokens</span>
              				<input class="mandatory" data-swift="30d" disabled="disabled" id="_425_mf36d_e4_quantity_of_digital_tokens" input_type="MF36D Quantity of Digital Tokens" location="Body" maxlength="30" name="_425_mf36d_e4_quantity_of_digital_tokens" onkeypress="return numbersonly(event);" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_425_mf36d_e4_quantity_of_digital_tokens'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16S</span>
              			<span class="label">End of Block</span>
              			<input disabled="disabled" id="_426_mf16s_e4_end_of_block" input_type="MF16S End of Block" location="Body" name="_426_mf16s_e4_end_of_block" type="hidden" value="NTWKFEE"/>
              		</div>
              	</div>
              	<h2 class="header-title">
              		End of Subsequence E4 Digital Network Fee
              	</h2>
              	<hr/>
              </div>
              <hr/>
              <div class="form-row">
              	<span class="label_body">MF16S</span>
              	<span class="label">End of Block</span>
              	<input id="_430_mf16s_e_end_of_block" input_type="MF16S End of Block" location="Body" name="_430_mf16s_e_end_of_block" type="hidden" value="SETDET"/>
              </div>
              <hr/>
              <h2 class="header-title">
              	End of Sequence E Settlement Details
              </h2>
              <h2 class="header-title">
              	Optional Repetitive Sequence F Other Parties
              </h2>
              <hr/>
              <div class="form-row">
              	<span class="label_body">F</span>
              	<span class="label">Optional Repetitive Sequence F Other Parties</span>
              	<div class="template_container" id="template_f" style="display:none;">
              		<div class="form-row">
              			<span class="label_body">
              				<input class="remove-btn" type="button" value="Remove"/>
              			</span>
              			<span class="label" id="label_count_f">Count</span>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16R</span>
              			<span class="label">Start of Block</span>
              			<input disabled="disabled" id="_440_mf16r_f_start_of_block" input_type="MF16R Start of Block" location="Body" name="_440_mf16r_f_start_of_block" type="hidden" value="OTHRPRTY"/>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF95A</span>
              			<span class="label">Party</span>
              			<div class="template_container template_seq_div_rep" id="template_mf95a_f" style="display:none;">
              				<div class="form-row">
              					<span class="label_body">
              						<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              					</span>
              					<span class="label" id="label_count_mf95a_f">Count</span>
              				</div>
              				<select class="selection_div mandatory" disabled="disabled" id="type_mf95_f" input_type="MF95A Party" location="Body" name="type_mf95_f">
              					<option value="">	</option>
              					<option value="c">C - Country Code</option>
              					<option value="l">L - Legal Entity Identifier</option>
              					<option value="p">P - Identifier Code</option>
              					<option value="q">Q - Name and Address</option>
              					<option value="r">R - Qualifier - Data Source Scheme - Proprietary Code</option>
              					<option value="s">S - Data Source Scheme - Type of ID - Country Code - Alternate ID</option>
              				</select>
              				<div id="div_mf95c_f">
              					<input disabled="disabled" id="_450_mf95c_f_" input_type="MF95C " location="Body" name="_450_mf95c_f_" type="hidden" value=":INVE//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Country code</span>
              						<input class="mandatory" data-swift="2!a" disabled="disabled" id="_451_mf95c_f_country_code" input_type="MF95C Country Code" location="Body" maxlength="2" name="_451_mf95c_f_country_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_451_mf95c_f_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_mf95l_f">
              					<input disabled="disabled" id="_452_mf95l_f_" input_type="MF95L " location="Body" name="_452_mf95l_f_" type="hidden" value=":ALTE//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Legal entity identifier</span>
              						<input class="mandatory" data-swift="18!c2!n" disabled="disabled" id="_453_mf95l_f_legal_entity_identifier" input_type="MF95L Legal Entity Identifier" location="Body" maxlength="20" name="_453_mf95l_f_legal_entity_identifier" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_453_mf95l_f_legal_entity_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_mf95p_f">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_454_mf95p_f_qualifier" input_type="MF95P Qualifier" location="Body" name="_454_mf95p_f_qualifier">
              							<option value="">	</option>
              							<option value=":EXCH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_454_mf95p_f_qualifier'}"><c:if test="${item.detail==':EXCH//'}"> selected="true" </c:if></c:if></c:forEach>>
              								EXCH
              							</option>
              							<option value=":MEOR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_454_mf95p_f_qualifier'}"><c:if test="${item.detail==':MEOR//'}"> selected="true" </c:if></c:if></c:forEach>>
              								MEOR
              							</option>
              							<option value=":MERE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_454_mf95p_f_qualifier'}"><c:if test="${item.detail==':MERE//'}"> selected="true" </c:if></c:if></c:forEach>>
              								MERE
              							</option>
              							<option value=":TRRE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_454_mf95p_f_qualifier'}"><c:if test="${item.detail==':TRRE//'}"> selected="true" </c:if></c:if></c:forEach>>
              								TRRE
              							</option>
              							<option value=":INVE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_454_mf95p_f_qualifier'}"><c:if test="${item.detail==':INVE//'}"> selected="true" </c:if></c:if></c:forEach>>
              								INVE
              							</option>
              							<option value=":VEND//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_454_mf95p_f_qualifier'}"><c:if test="${item.detail==':VEND//'}"> selected="true" </c:if></c:if></c:forEach>>
              								VEND
              							</option>
              							<option value=":TRAG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_454_mf95p_f_qualifier'}"><c:if test="${item.detail==':TRAG//'}"> selected="true" </c:if></c:if></c:forEach>>
              								TRAG
              							</option>
              							<option value=":BRKR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_454_mf95p_f_qualifier'}"><c:if test="${item.detail==':BRKR//'}"> selected="true" </c:if></c:if></c:forEach>>
              								BRKR
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Identifier code</span>
              						<input class="mandatory" data-swift="4!a2!a2!c[3!c]" disabled="disabled" id="_455_mf95p_f_identifier_code" input_type="MF95P Identifier Code" location="Body" maxlength="11" name="_455_mf95p_f_identifier_code" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_455_mf95p_f_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_mf95q_f">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_456_mf95q_f_qualifier" input_type="MF95Q Qualifier" location="Body" name="_456_mf95q_f_qualifier">
              							<option value="">	</option>
              							<option value=":EXCH//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_456_mf95q_f_qualifier'}"><c:if test="${item.detail==':EXCH//'}"> selected="true" </c:if></c:if></c:forEach>>
              								EXCH
              							</option>
              							<option value=":MEOR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_456_mf95q_f_qualifier'}"><c:if test="${item.detail==':MEOR//'}"> selected="true" </c:if></c:if></c:forEach>>
              								MEOR
              							</option>
              							<option value=":MERE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_456_mf95q_f_qualifier'}"><c:if test="${item.detail==':MERE//'}"> selected="true" </c:if></c:if></c:forEach>>
              								MERE
              							</option>
              							<option value=":TRRE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_456_mf95q_f_qualifier'}"><c:if test="${item.detail==':TRRE//'}"> selected="true" </c:if></c:if></c:forEach>>
              								TRRE
              							</option>
              							<option value=":INVE//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_456_mf95q_f_qualifier'}"><c:if test="${item.detail==':INVE//'}"> selected="true" </c:if></c:if></c:forEach>>
              								INVE
              							</option>
              							<option value=":VEND//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_456_mf95q_f_qualifier'}"><c:if test="${item.detail==':VEND//'}"> selected="true" </c:if></c:if></c:forEach>>
              								VEND
              							</option>
              							<option value=":TRAG//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_456_mf95q_f_qualifier'}"><c:if test="${item.detail==':TRAG//'}"> selected="true" </c:if></c:if></c:forEach>>
              								TRAG
              							</option>
              							<option value=":BRKR//" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_456_mf95q_f_qualifier'}"><c:if test="${item.detail==':BRKR//'}"> selected="true" </c:if></c:if></c:forEach>>
              								BRKR
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Name and address</span>
              						<textarea class="mandatory" cols="35" data-swift="4*35x" disabled="disabled" id="_457_mf95q_f_name_and_address" input_type="MF95Q Name and Address" location="Body" name="_457_mf95q_f_name_and_address" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_457_mf95q_f_name_and_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              					</div>
              				</div>
              				<div id="div_mf95r_f">
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Qualifier</span>
              						<select class="mandatory" disabled="disabled" id="_458_mf95r_f_qualifier" input_type="MF95R Qualifier" location="Body" name="_458_mf95r_f_qualifier">
              							<option value="">	</option>
              							<option value=":EXCH/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_458_mf95r_f_qualifier'}"><c:if test="${item.detail==':EXCH/'}"> selected="true" </c:if></c:if></c:forEach>>
              								EXCH
              							</option>
              							<option value=":MEOR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_458_mf95r_f_qualifier'}"><c:if test="${item.detail==':MEOR/'}"> selected="true" </c:if></c:if></c:forEach>>
              								MEOR
              							</option>
              							<option value=":MERE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_458_mf95r_f_qualifier'}"><c:if test="${item.detail==':MERE/'}"> selected="true" </c:if></c:if></c:forEach>>
              								MERE
              							</option>
              							<option value=":TRRE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_458_mf95r_f_qualifier'}"><c:if test="${item.detail==':TRRE/'}"> selected="true" </c:if></c:if></c:forEach>>
              								TRRE
              							</option>
              							<option value=":INVE/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_458_mf95r_f_qualifier'}"><c:if test="${item.detail==':INVE/'}"> selected="true" </c:if></c:if></c:forEach>>
              								INVE
              							</option>
              							<option value=":VEND/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_458_mf95r_f_qualifier'}"><c:if test="${item.detail==':VEND/'}"> selected="true" </c:if></c:if></c:forEach>>
              								VEND
              							</option>
              							<option value=":TRAG/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_458_mf95r_f_qualifier'}"><c:if test="${item.detail==':TRAG/'}"> selected="true" </c:if></c:if></c:forEach>>
              								TRAG
              							</option>
              							<option value=":BRKR/" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_458_mf95r_f_qualifier'}"><c:if test="${item.detail==':BRKR/'}"> selected="true" </c:if></c:if></c:forEach>>
              								BRKR
              							</option>
              						</select>
              					</div>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Data source scheme</span>
              						<input class="mandatory" data-swift="8c" disabled="disabled" id="_459_mf95r_f_data_source_scheme" input_type="MF95R Data Source Scheme" location="Body" maxlength="8" name="_459_mf95r_f_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_459_mf95r_f_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<input disabled="disabled" id="_4510_mf95r_f_" input_type="MF95R " location="Body" name="_4510_mf95r_f_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Proprietary code</span>
              						<input class="mandatory" data-swift="34x" disabled="disabled" id="_4511_mf95r_f_proprietary_code" input_type="MF95R Proprietary Code" location="Body" maxlength="34" name="_4511_mf95r_f_proprietary_code" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4511_mf95r_f_proprietary_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_mf95s_f">
              					<input disabled="disabled" id="_4512_mf95s_f_" input_type="MF95S " location="Body" name="_4512_mf95s_f_" type="hidden" value=":ALTE/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Data source scheme</span>
              						<input class="template_selection" disabled="disabled" id="check_mf95s_data_source_scheme_f" name="check_mf95s_data_source_scheme_f" type="checkbox"/>
              						<div id="div_opt_mf95s_data_source_scheme_f">
              							<input data-swift="8c" disabled="disabled" id="_4513_mf95s_f_data_source_scheme" input_type="MF95S Data Source Scheme" location="Body" maxlength="8" name="_4513_mf95s_f_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4513_mf95s_f_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              						</div>
              					</div>
              					<input disabled="disabled" id="_4514_mf95s_f_" input_type="MF95S " location="Body" name="_4514_mf95s_f_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Type of id</span>
              						<input class="mandatory" data-swift="4!c" disabled="disabled" id="_4515_mf95s_f_type_of_id" input_type="MF95S Type of ID" location="Body" maxlength="4" name="_4515_mf95s_f_type_of_id" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4515_mf95s_f_type_of_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<input disabled="disabled" id="_4516_mf95s_f_" input_type="MF95S " location="Body" name="_4516_mf95s_f_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Country code</span>
              						<input class="mandatory" data-swift="2!a" disabled="disabled" id="_4517_mf95s_f_country_code" input_type="MF95S Country Code" location="Body" maxlength="2" name="_4517_mf95s_f_country_code" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4517_mf95s_f_country_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              					<input disabled="disabled" id="_4518_mf95s_f_" input_type="MF95S " location="Body" name="_4518_mf95s_f_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Alternate id</span>
              						<input class="mandatory" data-swift="30x" disabled="disabled" id="_4519_mf95s_f_alternate_id" input_type="MF95S Alternate ID" location="Body" maxlength="30" name="_4519_mf95s_f_alternate_id" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_4519_mf95s_f_alternate_id'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              			</div>
              			<div class="container_seq_rep_div" id="container_mf95a_f">
              				<input class="cust-btn" data-count="0" data-id="mf95a_f" disabled="disabled" onclick="addSeqRepContainer(this)" type="button" value="Add Field MF95A"/>
              				<span class="label">
              					Min: <span class="min_val" id="min_occ_mf95a_f">1</span>, Max: <span class="max_val" id="max_occ_mf95a_f">0</span>, Count: <span class="count_val" id="cur_occ_mf95a_f">0</span>
              				</span>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF97A</span>
              			<span class="label">Account</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of97a_f" name="check_of97a_f" type="checkbox"/>
              			<div id="div_opt_of97a_f">
              				<select class="selection_div" disabled="disabled" id="type_of97_f" input_type="OF97A Account" location="Body" name="type_of97_f">
              					<option value="">	</option>
              					<option value="a">A - Account Number</option>
              					<option value="d">D - Data Source Scheme - Identification of Blockchain or Wallet</option>
              				</select>
              				<div id="div_of97a_f">
              					<input disabled="disabled" id="_460_of97a_f_" input_type="OF97A " location="Body" name="_460_of97a_f_" type="hidden" value=":SAFE//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Account number</span>
              						<input class="mandatory" data-swift="35x" disabled="disabled" id="_461_of97a_f_account_number" input_type="OF97A Account Number" location="Body" maxlength="35" name="_461_of97a_f_account_number" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_461_of97a_f_account_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              				<div id="div_of97d_f">
              					<input disabled="disabled" id="_462_of97d_f_" input_type="OF97D " location="Body" name="_462_of97d_f_" type="hidden" value=":BCAW//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Data source scheme</span>
              						<input class="template_selection" disabled="disabled" id="check_of97d_data_source_scheme_f" name="check_of97d_data_source_scheme_f" type="checkbox"/>
              						<div id="div_opt_of97d_data_source_scheme_f">
              							<input data-swift="8c" disabled="disabled" id="_463_of97d_f_data_source_scheme" input_type="OF97D Data Source Scheme" location="Body" maxlength="8" name="_463_of97d_f_data_source_scheme" oninput="this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '')" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_463_of97d_f_data_source_scheme'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              						</div>
              					</div>
              					<input disabled="disabled" id="_464_of97d_f_" input_type="OF97D " location="Body" name="_464_of97d_f_" type="hidden" value="/"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Identification of blockchain or wallet</span>
              						<input class="mandatory" data-swift="140x" disabled="disabled" id="_465_of97d_f_identification_of_blockchain_or_wallet" input_type="OF97D Identification of Blockchain or Wallet" location="Body" maxlength="140" name="_465_of97d_f_identification_of_blockchain_or_wallet" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_465_of97d_f_identification_of_blockchain_or_wallet'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              					</div>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF70A</span>
              			<span class="label">Narrative</span>
              			<div class="template_container template_seq_div_rep" id="template_of70a_f" style="display:none;">
              				<div class="form-row">
              					<span class="label_body">
              						<input class="cust-btn remove-btn" disabled="disabled" type="button" value="Remove"/>
              					</span>
              					<span class="label" id="label_count_of70a_f">Count</span>
              				</div>
              				<select class="selection_div" disabled="disabled" id="type_of70_f" input_type="OF70A Narrative" location="Body" name="type_of70_f">
              					<option value="">	</option>
              					<option value="c">C - Narrative</option>
              					<option value="d">D - Narrative</option>
              					<option value="e">E - Narrative</option>
              				</select>
              				<div id="div_of70c_f">
              					<input disabled="disabled" id="_470_of70c_f_" input_type="OF70C " location="Body" name="_470_of70c_f_" type="hidden" value=":PACO//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Narrative</span>
              						<textarea class="mandatory" cols="35" data-swift="4*35x" disabled="disabled" id="_471_of70c_f_narrative" input_type="OF70C Narrative" location="Body" name="_471_of70c_f_narrative" rows="4"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_471_of70c_f_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              					</div>
              				</div>
              				<div id="div_of70d_f">
              					<input disabled="disabled" id="_472_of70d_f_" input_type="OF70D " location="Body" name="_472_of70d_f_" type="hidden" value=":REGI//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Narrative</span>
              						<textarea class="mandatory" cols="35" data-swift="6*35x" disabled="disabled" id="_473_of70d_f_narrative" input_type="OF70D Narrative" location="Body" name="_473_of70d_f_narrative" rows="6"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_473_of70d_f_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              					</div>
              				</div>
              				<div id="div_of70e_f">
              					<input disabled="disabled" id="_474_of70e_f_" input_type="OF70E " location="Body" name="_474_of70e_f_" type="hidden" value=":DECL//"/>
              					<div class="form-row">
              						<span class="label_body">&nbsp;</span>
              						<span class="label">Narrative</span>
              						<textarea class="mandatory" cols="35" data-swift="10*35x" disabled="disabled" id="_475_of70e_f_narrative" input_type="OF70E Narrative" location="Body" name="_475_of70e_f_narrative" rows="10"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_475_of70e_f_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
              					</div>
              				</div>
              			</div>
              			<div class="container_seq_rep_div" id="container_of70a_f">
              				<input class="cust-btn" data-count="0" data-id="of70a_f" disabled="disabled" onclick="addSeqRepContainer(this)" type="button" value="Add Field OF70A"/>
              				<span class="label">
              					Min: <span class="min_val" id="min_occ_of70a_f">0</span>, Max: <span class="max_val" id="max_occ_of70a_f">3</span>, Count: <span class="count_val" id="cur_occ_of70a_f">0</span>
              				</span>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">OF20C</span>
              			<span class="label">Processing Reference</span>
              			<input class="checkbox_div" disabled="disabled" id="check_of20c_f" name="check_of20c_f" type="checkbox"/>
              			<div id="div_opt_of20c_f">
              				<input disabled="disabled" id="_480_of20c_f_" input_type="OF20C " location="Body" name="_480_of20c_f_" type="hidden" value=":PROC//"/>
              				<div class="form-row">
              					<span class="label_body">&nbsp;</span>
              					<span class="label">Reference</span>
              					<input class="mandatory" data-swift="16x" disabled="disabled" id="_481_of20c_f_reference" input_type="OF20C Reference" location="Body" maxlength="16" name="_481_of20c_f_reference" onkeypress="avoidSplChars(event)" type="text" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_481_of20c_f_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
              				</div>
              			</div>
              		</div>
              		<div class="form-row">
              			<span class="label_body">MF16S</span>
              			<span class="label">End of Block</span>
              			<input disabled="disabled" id="_490_mf16s_f_end_of_block" input_type="MF16S End of Block" location="Body" name="_490_mf16s_f_end_of_block" type="hidden" value="OTHRPRTY"/>
              		</div>
              	</div>
              	<div id="container_f">
              		<input class="cust-btn" data-count="0" data-id="f" onclick="addTemplateContainer(this)" type="button" value="Add Field F"/>
              		<span class="label">
              			Min: <span class="min_val" id="min_occ_f">0</span>, Max: <span class="max_val" id="max_occ_f">0</span>, Count: <span class="count_val" id="cur_occ_f">0</span>
              		</span>
              	</div>
              </div>
              <h2 class="header-title">
              	End of Sequence F Other Parties
              </h2>

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

<script type="text/javascript" src="js/json-xml-data-tree/data-tree.js"></script>
<script type="text/javascript" src="js/validate-mt/tab-contens-custom.js"></script>
<script type="text/javascript" src="js/custom-currency.js"></script>