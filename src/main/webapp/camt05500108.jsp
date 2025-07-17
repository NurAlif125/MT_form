<%-- 
    Document   : camt05500108
    Created on : Feb 17, 2025, 4:04:03 PM
    Author     : rafli
--%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<style type="text/css">
    
    [hidden] {
        display: none;
    }
    section {
        margin: 5px;
    }
    label {
        display: block;
    }
    label > span {
        float: left;
        margin-right: 5px;
        min-width: 200px;
        font-size: 13px;
    }
    button[type='submit']:before {
        content: "OK";
    }
    button.add:before {
        content: "+ ";
    }
    button.remove:before {
        content: "-";
    }
    input[data-xsd2html2xml-duration='days'] + span:after {
        content: " (days)";
    }
    input[data-xsd2html2xml-duration='minutes'] + span:after {
        content: " (minutes)";
    }
    fieldset {
        width: 99%;
        border-color: #2e8085;
        border-radius: 5px;
    }
    button[class="add"], [class="remove"]{
        all: revert;
        cursor: pointer;
        background-color: transparent;
        color: #2e8085;
        border: 1px solid #2e8085;
        border-radius: 0.25rem
    }
    button[class="add"]:hover, [class="remove"]:hover{
        all: revert;
        cursor: pointer;
        background-color: #2e8085;
        color: white;
        border: 1px solid #2e8085;
        border-radius: 0.25rem
    }
    input[type="text"] {
        all: revert;
        width: 30%; /* w-full */
        padding: 0.25rem; /* p-2 */
        color: #111827; /* text-gray-900 */
        border: 1px solid #d1d5db; /* border border-gray-300 */
        border-radius: 0.5rem; /* rounded-lg */
        font-size: 13px;
    }
    input[type="text"]:focus {
        outline: none;
        border-color: #3b82f6; /* focus:border-blue-500 */
        box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
    }
    input[type="number"] {
        all: revert;
        width: 30%; /* w-full */
        padding: 0.25rem; /* p-2 */
        color: #111827; /* text-gray-900 */
        border: 1px solid #d1d5db; /* border border-gray-300 */
        border-radius: 0.5rem; /* rounded-lg */
        font-size: 13px;
    }
    input[type="number"]:focus {
        outline: none;
        border-color: #3b82f6; /* focus:border-blue-500 */
        box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
    }
    input[type="time"] {
        all: revert;
        width: 30%; /* w-full */
        padding: 0.25rem; /* p-2 */
        color: #111827; /* text-gray-900 */
        border: 1px solid #d1d5db; /* border border-gray-300 */
        border-radius: 0.5rem; /* rounded-lg */
        font-size: 13px;
    }
    input[type="time"]:focus {
        outline: none;
        border-color: #3b82f6; /* focus:border-blue-500 */
        box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
    }
    input[required="required"] {
        background-color: #DEFCF9;
    }
    input[disabled="disabled"] {
        background-color: #ECCFD1;
    }
    input[data-xsd2html2xml-description="BICFI"] {
        text-transform: uppercase;
    }
    input[data-xsd2html2xml-description="Currency"] {
        text-transform: uppercase;
    }
    input[data-xsd2html2xml-description="AnyBIC"] {
        text-transform: uppercase;
    }
</style>
<script src="js/flatpickr.js"></script>
<link rel="stylesheet" href="css/flatpickr.css">
<meta id="generator-farras" name="generator" content="XSD2HTML2XML v3: https://github.com/MichielCM/xsd2html2xml" data-xsd2html2xml-source='<c:out value='${dataIsoXML}' />'/>
<script src="js/xml2html_rule.js" type="text/javascript"></script>
<%
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
    String formattedDate = sdf.format(new java.util.Date());
    pageContext.setAttribute("tgl_today", formattedDate);
%>
<c:set var="tgl_today" value="${tgl_today}" />

<section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Document" data-xsd2html2xml-xpath="/Document">
        <legend>Document</legend>
        <section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CstmrPmtCxlReq" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq">
                <legend>CstmrPmtCxlReq <a style="color:red;text-decoration:none">*</a></legend>
                <section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Assgnmt" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt">
                        <legend>Assignment <a style="color:red;text-decoration:none">*</a></legend>
                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Id"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value);
            } else {
                this.removeAttribute("value");
            }
            ;' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+" maxlength="35" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Identification"><span>Identification <a style="color:red;text-decoration:none">*</a></span></label></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Assgnr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgnr">
                                <legend>Assigner <a style="color:red;text-decoration:none">*</a></legend>
                                <label><input type="radio" name="id1" required="required" onclick="clickRadioInput(this, 'id1');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Agt" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgnr/Agt">
                                        <legend>Agent <a style="color:red;text-decoration:none">*</a></legend>
                                        <section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="FinInstnId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgnr/Agt/FinInstnId">
                                                <legend>FinancialInstitutionIdentification <a style="color:red;text-decoration:none">*</a></legend>
                                                <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="BICFI" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgnr/Agt/FinInstnId/BICFI"><input type="text" onblur="formatBICFI(this);" maxlength="12" maxlength="12" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value");
            }
            ;' required="required" pattern="[A-Z0-9]{4,4}[A-Z]{2,2}[A-Z0-9]{2,2}([A-Z0-9]{3,3}){0,1}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="BICFI"><span>BICFI <a style="color:red;text-decoration:none">*</a></span></label></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="ClrSysMmbId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgnr/Agt/FinInstnId/ClrSysMmbId">
                                                        <legend>ClearingSystemMemberIdentification<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                        </legend>
                                                        <section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="ClrSysId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgnr/Agt/FinInstnId/ClrSysMmbId/ClrSysId">
                                                                <legend>ClearingSystemIdentification</legend>
                                                                <label><input type="radio" name="id2" required="required" onclick="clickRadioInput(this, 'id2');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cd" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgnr/Agt/FinInstnId/ClrSysMmbId/ClrSysId/Cd"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="5" pattern=".{1,5}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Code"><span>Code</span></label></section>
                                                            </fieldset></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="MmbId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgnr/Agt/FinInstnId/ClrSysMmbId/MmbId"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+" maxlength="28" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="MemberIdentification"><span>MemberIdentification</span></label></section>
                                                    </fieldset>
                                                    <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">ClearingSystemMemberIdentification</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="LEI" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgnr/Agt/FinInstnId/LEI"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[A-Z0-9]{18,18}[0-9]{2,2}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="LEI"><span>LEI<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">LEI</button></section>
                                            </fieldset></section>
                                    </fieldset></section>
                            </fieldset></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Assgne" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgne">
                                <legend>Assignee <a style="color:red;text-decoration:none">*</a></legend>
                                <label><input type="radio" name="id3" required="required" onclick="clickRadioInput(this, 'id3');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Agt" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgne/Agt">
                                        <legend>Agent <a style="color:red;text-decoration:none">*</a></legend>
                                        <section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="FinInstnId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId">
                                                <legend>FinancialInstitutionIdentification <a style="color:red;text-decoration:none">*</a></legend>
                                                <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="BICFI" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/BICFI"><input type="text" onblur="formatBICFI(this);" maxlength="12" maxlength="12" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[A-Z0-9]{4,4}[A-Z]{2,2}[A-Z0-9]{2,2}([A-Z0-9]{3,3}){0,1}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="BICFI"><span>BICFI<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">BICFI</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="ClrSysMmbId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/ClrSysMmbId">
                                                        <legend>ClearingSystemMemberIdentification<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                        </legend>
                                                        <section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="ClrSysId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/ClrSysMmbId/ClrSysId">
                                                                <legend>ClearingSystemIdentification</legend>
                                                                <label><input type="radio" name="id4" required="required" onclick="clickRadioInput(this, 'id4');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cd" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/ClrSysMmbId/ClrSysId/Cd"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="5" pattern=".{1,5}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Code"><span>Code</span></label></section>
                                                            </fieldset></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="MmbId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/ClrSysMmbId/MmbId"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+" maxlength="28" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="MemberIdentification"><span>MemberIdentification</span></label></section>
                                                    </fieldset>
                                                    <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">ClearingSystemMemberIdentification</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="LEI" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/LEI"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[A-Z0-9]{18,18}[0-9]{2,2}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="LEI"><span>LEI<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">LEI</button></section>
                                            </fieldset></section>
                                    </fieldset></section>
                            </fieldset></section><c:choose><c:when test = "${headerById.id_headers == null}"><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CreDtTm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/CreDtTm"><input type="text" value="${tgl_today}" class="datetime-local" onchange='if (this.value) {
                this.setAttribute("value", (this.value.match(/.*\d\d:\d\d:\d\d/) ? this.value : this.value.concat(":00"))); } else {
                this.removeAttribute("value"); };' required="required" step="1" data-xsd2html2xml-primitive="datetime" data-xsd2html2xml-description="CreationDateTime"><span>CreationDateTime <a style="color:red;text-decoration:none">*</a></span></label></section></c:when><c:otherwise><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CreDtTm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Assgnmt/CreDtTm"><input type="text" class="datetime-local" onchange='if (this.value) {
                this.setAttribute("value", (this.value.match(/.*\d\d:\d\d:\d\d/) ? this.value : this.value.concat(":00"))); } else {
                this.removeAttribute("value"); };' required="required" step="1" data-xsd2html2xml-primitive="datetime" data-xsd2html2xml-description="CreationDateTime"><span>CreationDateTime <a style="color:red;text-decoration:none">*</a></span></label></section></c:otherwise></c:choose>
                    </fieldset></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Undrlyg" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg">
                        <legend>Underlying <a style="color:red;text-decoration:none">*</a></legend>
                        <section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgnlPmtInfAndCxl" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl">
                                <legend>OriginalPaymentInformationAndCancellation <a style="color:red;text-decoration:none">*</a></legend>
                                <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgnlPmtInfId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlPmtInfId"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value");
            };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="OriginalPaymentInformationIdentification"><span>OriginalPaymentInformationIdentification <a style="color:red;text-decoration:none">*</a></span></label></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgnlGrpInf" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlGrpInf">
                                        <legend>OriginalGroupInformation <a style="color:red;text-decoration:none">*</a></legend>
                                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgnlMsgId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlGrpInf/OrgnlMsgId"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="OriginalMessageIdentification"><span>OriginalMessageIdentification <a style="color:red;text-decoration:none">*</a></span></label></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgnlMsgNmId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlGrpInf/OrgnlMsgNmId"><input type="text" onchange='if (this.value) {
                            this.setAttribute("value", this.value); } else {
                            this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="OriginalMessageNameIdentification"><span>OriginalMessageNameIdentification <a style="color:red;text-decoration:none">*</a></span></label></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgnlCreDtTm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlGrpInf/OrgnlCreDtTm"><input type="text" class="datetime-local" onchange='if (this.value) {
                                        this.setAttribute("value", (this.value.match(/.*\d\d:\d\d:\d\d/) ? this.value : this.value.concat(":00"))); } else {
                                        this.removeAttribute("value"); };' required="required" step="1" data-xsd2html2xml-primitive="datetime" data-xsd2html2xml-description="OriginalCreationDateTime"><span>OriginalCreationDateTime<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">OriginalCreationDateTime</button></section>
                                    </fieldset></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="TxInf" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf">
                                        <legend>TransactionInformation <a style="color:red;text-decoration:none">*</a></legend>
                                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CxlId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlId"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="CancellationIdentification"><span>CancellationIdentification<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">CancellationIdentification</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Case" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case">
                                                <legend>Case <a style="color:red;text-decoration:none">*</a></legend>
                                                <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Id"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+" maxlength="16" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Identification"><span>Identification <a style="color:red;text-decoration:none">*</a></span></label></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cretr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr">
                                                        <legend>Creator <a style="color:red;text-decoration:none">*</a></legend>
                                                        <label><input type="radio" name="id5" required="required" onclick="clickRadioInput(this, 'id5');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Pty" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty">
                                                                <legend>Party</legend>
                                                                <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Nm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Nm"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="140" pattern=".{1,140}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Name"><span>Name<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Name</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstlAdr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr">
                                                                        <legend>PostalAddress<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                        </legend>
                                                                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Dept" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/Dept"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="70" pattern=".{1,70}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Department"><span>Department<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Department</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="SubDept" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/SubDept"><input type="text" onchange='if (this.value) {
                            this.setAttribute("value", this.value); } else {
                            this.removeAttribute("value"); };' required="required" maxlength="70" pattern=".{1,70}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="SubDepartment"><span>SubDepartment<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">SubDepartment</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="StrtNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/StrtNm"><input type="text" onchange='if (this.value) {
                                        this.setAttribute("value", this.value);
                                    } else {
                                        this.removeAttribute("value"); };' required="required" maxlength="70" pattern=".{1,70}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="StreetName"><span>StreetName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">StreetName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="BldgNb" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/BldgNb"><input type="text" onchange='if (this.value) {
                                                    this.setAttribute("value", this.value);
                                                } else {
                                                    this.removeAttribute("value");
                                                }
                                                ;' required="required" maxlength="16" pattern=".{1,16}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="BuildingNumber"><span>BuildingNumber<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">BuildingNumber</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="BldgNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/BldgNm"><input type="text" onchange='if (this.value) {
                                                            this.setAttribute("value", this.value); } else {
                                                            this.removeAttribute("value");
                                                        }
                                                        ;' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="BuildingName"><span>BuildingName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">BuildingName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Flr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/Flr"><input type="text" onchange='if (this.value) {
                                                                    this.setAttribute("value", this.value); } else {
                                                                    this.removeAttribute("value"); };' required="required" maxlength="70" pattern=".{1,70}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Floor"><span>Floor<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Floor</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstBx" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/PstBx"><input type="text" onchange='if (this.value) {
                                                                                this.setAttribute("value", this.value); } else {
                                                                                this.removeAttribute("value"); };' required="required" maxlength="16" pattern=".{1,16}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="PostBox"><span>PostBox<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">PostBox</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Room" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/Room"><input type="text" onchange='if (this.value) {
                                                                                            this.setAttribute("value", this.value); } else {
                                                                                            this.removeAttribute("value"); };' required="required" maxlength="70" pattern=".{1,70}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Room"><span>Room<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Room</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstCd" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/PstCd"><input type="text" onchange='if (this.value) {
                                                                                                        this.setAttribute("value", this.value);
                                                                                                    } else {
                                                                                                        this.removeAttribute("value");
                                                                                                    }
                                                                                                    ;' required="required" maxlength="16" pattern=".{1,16}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="PostCode"><span>PostCode<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">PostCode</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="TwnNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/TwnNm"><input type="text" onchange='if (this.value) {
                                                                                                                this.setAttribute("value", this.value); } else {
                                                                                                                this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="TownName"><span>TownName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">TownName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="TwnLctnNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/TwnLctnNm"><input type="text" onchange='if (this.value) {
                                                                                                                            this.setAttribute("value", this.value); } else {
                                                                                                                            this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="TownLocationName"><span>TownLocationName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">TownLocationName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="DstrctNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/DstrctNm"><input type="text" onchange='if (this.value) {
                                                                                                                                        this.setAttribute("value", this.value);
                                                                                                                                    } else {
                                                                                                                                        this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="DistrictName"><span>DistrictName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">DistrictName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CtrySubDvsn" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/CtrySubDvsn"><input type="text" onchange='if (this.value) {
                                                                                                                                                    this.setAttribute("value", this.value);
                                                                                                                                                } else {
                                                                                                                                                    this.removeAttribute("value");
                                                                                                                                                }
                                                                                                                                                ;' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="CountrySubDivision"><span>CountrySubDivision<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">CountrySubDivision</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Ctry" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/Ctry"><input type="text" onchange='if (this.value) {
                                                                                                                                                            this.setAttribute("value", this.value); } else {
                                                                                                                                                            this.removeAttribute("value"); };' required="required" pattern="[A-Z]{2,2}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Country"><span>Country<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Country</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="AdrLine" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/AdrLine"><input type="text" onchange='if (this.value) {
                                                                                                                                                                        this.setAttribute("value", this.value); } else {
                                                                                                                                                                        this.removeAttribute("value"); };' required="required" maxlength="70" pattern=".{1,70}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="AddressLine"><span>AddressLine<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="3" onclick="clickAddButton(this);">AddressLine</button></section>
                                                                    </fieldset>
                                                                    <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">PostalAddress</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id">
                                                                        <legend>Identification<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                        </legend>
                                                                        <label><input type="radio" name="id6" required="required" onclick="clickRadioInput(this, 'id6');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/OrgId">
                                                                                <legend>OrganisationIdentification</legend>
                                                                                <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="AnyBIC" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/OrgId/AnyBIC"><input type="text" onblur="formatBICFI(this);" maxlength="12" minlength="12" onchange='if (this.value) {
                this.setAttribute("value", this.value);
            } else {
                this.removeAttribute("value");
            }
            ;' required="required" pattern="[A-Z0-9]{4,4}[A-Z]{2,2}[A-Z0-9]{2,2}([A-Z0-9]{3,3}){0,1}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="AnyBIC"><span>AnyBIC<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">AnyBIC</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="LEI" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/OrgId/LEI"><input type="text" onchange='if (this.value) {
                        this.setAttribute("value", this.value); } else {
                        this.removeAttribute("value"); };' required="required" pattern="[A-Z0-9]{18,18}[0-9]{2,2}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="LEI"><span>LEI<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">LEI</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Othr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/OrgId/Othr">
                                                                                        <legend>Other<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                                        </legend>
                                                                                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/OrgId/Othr/Id"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Identification"><span>Identification</span></label></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="SchmeNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/OrgId/Othr/SchmeNm">
                                                                                                <legend>SchemeName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                                                </legend>
                                                                                                <label><input type="radio" name="id7" required="required" onclick="clickRadioInput(this, 'id7');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cd" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/OrgId/Othr/SchmeNm/Cd"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="4" pattern=".{1,4}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Code"><span>Code</span></label></section><label><input type="radio" name="id7" required="required" onclick="clickRadioInput(this, 'id7');" data-xsd2html2xml-description="2"><span>2</span></label><section data-xsd2html2xml-choice="true"><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Prtry" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/OrgId/Othr/SchmeNm/Prtry"><input type="text" onchange='if (this.value) {
                            this.setAttribute("value", this.value); } else {
                            this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Proprietary"><span>Proprietary</span></label></section>
                                                                                            </fieldset>
                                                                                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">SchemeName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Issr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/OrgId/Othr/Issr"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value);
            } else {
                this.removeAttribute("value");
            }
            ;' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Issuer"><span>Issuer<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Issuer</button></section>
                                                                                    </fieldset>
                                                                                    <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="2" onclick="clickAddButton(this);">Other</button></section>
                                                                            </fieldset></section><label><input type="radio" name="id6" required="required" onclick="clickRadioInput(this, 'id6');" data-xsd2html2xml-description="2"><span>2</span></label><section data-xsd2html2xml-choice="true"><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PrvtId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/PrvtId">
                                                                                <legend>PrivateIdentification</legend>
                                                                                <section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="DtAndPlcOfBirth" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/PrvtId/DtAndPlcOfBirth">
                                                                                        <legend>DateAndPlaceOfBirth<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                                        </legend>
                                                                                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="BirthDt" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/PrvtId/DtAndPlcOfBirth/BirthDt"><input type="date" onchange='if (this.value) {
                this.setAttribute("value", this.value.replace(/\s+/g, " ").trim()); } else {
                this.removeAttribute("value"); }
            ;' required="required" pattern=".{0,}" data-xsd2html2xml-primitive="date" data-xsd2html2xml-description="BirthDate"><span>BirthDate</span></label></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PrvcOfBirth" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/PrvtId/DtAndPlcOfBirth/PrvcOfBirth"><input type="text" onchange='if (this.value) {
                        this.setAttribute("value", this.value); } else {
                        this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="ProvinceOfBirth"><span>ProvinceOfBirth<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">ProvinceOfBirth</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CityOfBirth" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/PrvtId/DtAndPlcOfBirth/CityOfBirth"><input type="text" onchange='if (this.value) {
                                    this.setAttribute("value", this.value); } else {
                                    this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="CityOfBirth"><span>CityOfBirth</span></label></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CtryOfBirth" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/PrvtId/DtAndPlcOfBirth/CtryOfBirth"><input type="text" onchange='if (this.value) {
                                                this.setAttribute("value", this.value); } else {
                                                this.removeAttribute("value");
                                            }
                                            ;' required="required" pattern="[A-Z]{2,2}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="CountryOfBirth"><span>CountryOfBirth</span></label></section>
                                                                                    </fieldset>
                                                                                    <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">DateAndPlaceOfBirth</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Othr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/PrvtId/Othr">
                                                                                        <legend>Other<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                                        </legend>
                                                                                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/PrvtId/Othr/Id"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Identification"><span>Identification</span></label></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="SchmeNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/PrvtId/Othr/SchmeNm">
                                                                                                <legend>SchemeName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                                                </legend>
                                                                                                <label><input type="radio" name="id8" required="required" onclick="clickRadioInput(this, 'id8');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cd" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/PrvtId/Othr/SchmeNm/Cd"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); }
            ;' required="required" maxlength="4" pattern=".{1,4}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Code"><span>Code</span></label></section><label><input type="radio" name="id8" required="required" onclick="clickRadioInput(this, 'id8');" data-xsd2html2xml-description="2"><span>2</span></label><section data-xsd2html2xml-choice="true"><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Prtry" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/PrvtId/Othr/SchmeNm/Prtry"><input type="text" onchange='if (this.value) {
                        this.setAttribute("value", this.value); } else {
                        this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Proprietary"><span>Proprietary</span></label></section>
                                                                                            </fieldset>
                                                                                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">SchemeName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Issr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/Id/PrvtId/Othr/Issr"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Issuer"><span>Issuer<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Issuer</button></section>
                                                                                    </fieldset>
                                                                                    <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="2" onclick="clickAddButton(this);">Other</button></section>
                                                                            </fieldset></section>
                                                                    </fieldset>
                                                                    <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Identification</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CtryOfRes" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/CtryOfRes"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[A-Z]{2,2}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="CountryOfResidence"><span>CountryOfResidence<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">CountryOfResidence</button></section>
                                                            </fieldset></section><label><input type="radio" name="id5" required="required" onclick="clickRadioInput(this, 'id5');" data-xsd2html2xml-description="2"><span>2</span></label><section data-xsd2html2xml-choice="true"><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Agt" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt">
                                                                <legend>Agent</legend>
                                                                <section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="FinInstnId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId">
                                                                        <legend>FinancialInstitutionIdentification</legend>
                                                                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="BICFI" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/BICFI"><input type="text" onblur="formatBICFI(this);" minlength="12" maxlength="12" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[A-Z0-9]{4,4}[A-Z]{2,2}[A-Z0-9]{2,2}([A-Z0-9]{3,3}){0,1}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="BICFI"><span>BICFI<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">BICFI</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="ClrSysMmbId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/ClrSysMmbId">
                                                                                <legend>ClearingSystemMemberIdentification<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                                </legend>
                                                                                <section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="ClrSysId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/ClrSysMmbId/ClrSysId">
                                                                                        <legend>ClearingSystemIdentification</legend>
                                                                                        <label><input type="radio" name="id9" required="required" onclick="clickRadioInput(this, 'id9');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cd" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/ClrSysMmbId/ClrSysId/Cd"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value);
            } else {
                this.removeAttribute("value");
            }
            ;' required="required" maxlength="5" pattern=".{1,5}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Code"><span>Code</span></label></section>
                                                                                    </fieldset></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="MmbId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/ClrSysMmbId/MmbId"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+" maxlength="28" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="MemberIdentification"><span>MemberIdentification</span></label></section>
                                                                            </fieldset>
                                                                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">ClearingSystemMemberIdentification</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="LEI" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/LEI"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[A-Z0-9]{18,18}[0-9]{2,2}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="LEI"><span>LEI<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">LEI</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Nm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/Nm"><input type="text" onchange='if (this.value) {
                            this.setAttribute("value", this.value); } else {
                            this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="140" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Name"><span>Name<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Name</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstlAdr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr">
                                                                                <legend>PostalAddress<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                                </legend>
                                                                                <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Dept" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/Dept"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="70" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Department"><span>Department<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Department</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="SubDept" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/SubDept"><input type="text" onchange='if (this.value) {
                            this.setAttribute("value", this.value); } else {
                            this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="70" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="SubDepartment"><span>SubDepartment<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">SubDepartment</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="StrtNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/StrtNm"><input type="text" onchange='if (this.value) {
                                        this.setAttribute("value", this.value); } else {
                                        this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="70" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="StreetName"><span>StreetName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">StreetName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="BldgNb" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/BldgNb"><input type="text" onchange='if (this.value) {
                                                    this.setAttribute("value", this.value); } else {
                                                    this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="16" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="BuildingNumber"><span>BuildingNumber<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">BuildingNumber</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="BldgNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/BldgNm"><input type="text" onchange='if (this.value) {
                                                                this.setAttribute("value", this.value); } else {
                                                                this.removeAttribute("value");
                                                            }
                                                            ;' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="35" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="BuildingName"><span>BuildingName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">BuildingName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Flr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/Flr"><input type="text" onchange='if (this.value) {
                                                                        this.setAttribute("value", this.value);
                                                                    } else {
                                                                        this.removeAttribute("value");
                                                                    }
                                                                    ;' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="70" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Floor"><span>Floor<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Floor</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstBx" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/PstBx"><input type="text" onchange='if (this.value) {
                                                                                this.setAttribute("value", this.value); } else {
                                                                                this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="16" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="PostBox"><span>PostBox<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">PostBox</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Room" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/Room"><input type="text" onchange='if (this.value) {
                                                                                            this.setAttribute("value", this.value); } else {
                                                                                            this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="70" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Room"><span>Room<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Room</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstCd" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/PstCd"><input type="text" onchange='if (this.value) {
                                                                                                        this.setAttribute("value", this.value); } else {
                                                                                                        this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="16" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="PostCode"><span>PostCode<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">PostCode</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="TwnNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/TwnNm"><input type="text" onchange='if (this.value) {
                                                                                                                    this.setAttribute("value", this.value); } else {
                                                                                                                    this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="35" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="TownName"><span>TownName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">TownName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="TwnLctnNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/TwnLctnNm"><input type="text" onchange='if (this.value) {
                                                                                                                                this.setAttribute("value", this.value); } else {
                                                                                                                                this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="35" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="TownLocationName"><span>TownLocationName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">TownLocationName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="DstrctNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/DstrctNm"><input type="text" onchange='if (this.value) {
                                                                                                                                            this.setAttribute("value", this.value);
                                                                                                                                        } else {
                                                                                                                                            this.removeAttribute("value");
                                                                                                                                        }
                                                                                                                                        ;' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="35" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="DistrictName"><span>DistrictName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">DistrictName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CtrySubDvsn" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/CtrySubDvsn"><input type="text" onchange='if (this.value) {
                                                                                                                                                    this.setAttribute("value", this.value); } else {
                                                                                                                                                    this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="35" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="CountrySubDivision"><span>CountrySubDivision<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">CountrySubDivision</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Ctry" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/Ctry"><input type="text" onchange='if (this.value) {
                                                                                                                                                                this.setAttribute("value", this.value); } else {
                                                                                                                                                                this.removeAttribute("value"); };' required="required" pattern="[A-Z]{2,2}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Country"><span>Country<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Country</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="AdrLine" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/AdrLine"><input type="text" onchange='if (this.value) {
                                                                                                                                                                            this.setAttribute("value", this.value); } else {
                                                                                                                                                                            this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+" maxlength="70" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="AddressLine"><span>AddressLine<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="3" onclick="clickAddButton(this);">AddressLine</button></section>
                                                                            </fieldset>
                                                                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">PostalAddress</button></section>
                                                                    </fieldset></section>
                                                            </fieldset></section>
                                                    </fieldset></section>
                                            </fieldset></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgnlInstrId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlInstrId"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="OriginalInstructionIdentification"><span>OriginalInstructionIdentification<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">OriginalInstructionIdentification</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgnlEndToEndId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlEndToEndId"><input type="text" onchange='if (this.value) {
                            this.setAttribute("value", this.value); } else {
                            this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="OriginalEndToEndIdentification"><span>OriginalEndToEndIdentification <a style="color:red;text-decoration:none">*</a></span></label></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgnlUETR" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlUETR"><input type="text" id="UETR" onchange='if (this.value) {
                                        this.setAttribute("value", this.value); } else {
                                        this.removeAttribute("value"); };' required="required" pattern="[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="OriginalUETR"><button type="button" onclick="generateuetr()">Generate</button><span>OriginalUETR <a style="color:red;text-decoration:none">*</a></span></label></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgnlInstdAmt" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlInstdAmt">
                                                <legend>OriginalInstructedAmount <a style="color:red;text-decoration:none">*</a></legend>
                                                <label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="content" data-xsd2html2xml-name="OrgnlInstdAmt" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlInstdAmt"><input type="number" onchange='if (this.value) {
                this.setAttribute("value", this.value.replace(/\s+/g, " ").trim()); } else {
                this.removeAttribute("value"); };' required="required" min="0" step="0.1" pattern="[-]?{0,}" data-xsd2html2xml-primitive="decimal" data-xsd2html2xml-description="OriginalInstructedAmount"><span>OriginalInstructedAmount <a style="color:red;text-decoration:none">*</a></span></label><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="attribute" data-xsd2html2xml-name="Ccy" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlInstdAmt/@Ccy"><input type="text" onkeypress="return textonly(event)" onchange='if (this.value) {
                            this.setAttribute("value", this.value);
                        } else {
                            this.removeAttribute("value");
                        }
                        ;' required="required" pattern="[A-Z]{3,3}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Currency"><span>Currency <a style="color:red;text-decoration:none">*</a></span></label>
                                            </fieldset></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgnlReqdExctnDt" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlReqdExctnDt">
                                                <legend>OriginalRequestedExecutionDate<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                </legend>
                                                <label><input type="radio" name="id10" required="required" onclick="clickRadioInput(this, 'id10');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Dt" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlReqdExctnDt/Dt"><input type="text" class="date" onchange='if (this.value) {
                this.setAttribute("value", this.value.replace(/\s+/g, " ").trim());
            } else {
                this.removeAttribute("value");
            }
            ;' required="required" pattern=".{0,}" data-xsd2html2xml-primitive="date" data-xsd2html2xml-description="Date"><span>Date</span></label></section><label><input type="radio" name="id10" required="required" onclick="clickRadioInput(this, 'id10');" data-xsd2html2xml-description="2"><span>2</span></label><section data-xsd2html2xml-choice="true"><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="DtTm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlReqdExctnDt/DtTm"><input type="text" class="datetime-local" onchange='if (this.value) {
                        this.setAttribute("value", (this.value.match(/.*\d\d:\d\d:\d\d/) ? this.value : this.value.concat(":00"))); } else {
                        this.removeAttribute("value"); };' required="required" step="1" data-xsd2html2xml-primitive="datetime" data-xsd2html2xml-description="DateTime"><span>DateTime</span></label></section>
                                            </fieldset>
                                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">OriginalRequestedExecutionDate</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgnlReqdColltnDt" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlReqdColltnDt"><input type="text" class="date" onchange='if (this.value) {
                this.setAttribute("value", this.value.replace(/\s+/g, " ").trim());
            } else {
                this.removeAttribute("value");
            }
            ;' required="required" pattern=".{0,}" data-xsd2html2xml-primitive="date" data-xsd2html2xml-description="OriginalRequestedCollectionDate"><span>OriginalRequestedCollectionDate<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">OriginalRequestedCollectionDate</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CxlRsnInf" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf">
                                                <legend>CancellationReasonInformation <a style="color:red;text-decoration:none">*</a></legend>
                                                <section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Orgtr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr">
                                                        <legend>Originator<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                        </legend>
                                                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Nm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Nm"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="140" pattern=".{1,140}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Name"><span>Name<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Name</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstlAdr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr">
                                                                <legend>PostalAddress<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                </legend>
                                                                <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Dept" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/Dept"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="70" pattern=".{1,70}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Department"><span>Department<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Department</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="SubDept" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/SubDept"><input type="text" onchange='if (this.value) {
                            this.setAttribute("value", this.value);
                        } else {
                            this.removeAttribute("value");
                        }
                        ;' required="required" maxlength="70" pattern=".{1,70}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="SubDepartment"><span>SubDepartment<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">SubDepartment</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="StrtNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/StrtNm"><input type="text" onchange='if (this.value) {
                                    this.setAttribute("value", this.value); } else {
                                    this.removeAttribute("value");
                                }
                                ;' required="required" maxlength="70" pattern=".{1,70}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="StreetName"><span>StreetName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">StreetName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="BldgNb" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/BldgNb"><input type="text" onchange='if (this.value) {
                                            this.setAttribute("value", this.value);
                                        } else {
                                            this.removeAttribute("value");
                                        }
                                        ;' required="required" maxlength="16" pattern=".{1,16}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="BuildingNumber"><span>BuildingNumber<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">BuildingNumber</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="BldgNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/BldgNm"><input type="text" onchange='if (this.value) {
                                                    this.setAttribute("value", this.value); } else {
                                                    this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="BuildingName"><span>BuildingName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">BuildingName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Flr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/Flr"><input type="text" onchange='if (this.value) {
                                                                this.setAttribute("value", this.value);
                                                            } else {
                                                                this.removeAttribute("value");
                                                            }
                                                            ;' required="required" maxlength="70" pattern=".{1,70}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Floor"><span>Floor<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Floor</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstBx" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/PstBx"><input type="text" onchange='if (this.value) {
                                                                        this.setAttribute("value", this.value); } else {
                                                                        this.removeAttribute("value"); };' required="required" maxlength="16" pattern=".{1,16}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="PostBox"><span>PostBox<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">PostBox</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Room" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/Room"><input type="text" onchange='if (this.value) {
                                                                                    this.setAttribute("value", this.value); } else {
                                                                                    this.removeAttribute("value"); };' required="required" maxlength="70" pattern=".{1,70}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Room"><span>Room<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Room</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstCd" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/PstCd"><input type="text" onchange='if (this.value) {
                                                                                                this.setAttribute("value", this.value); } else {
                                                                                                this.removeAttribute("value"); };' required="required" maxlength="16" pattern=".{1,16}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="PostCode"><span>PostCode<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">PostCode</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="TwnNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/TwnNm"><input type="text" onchange='if (this.value) {
                                                                                                            this.setAttribute("value", this.value); } else {
                                                                                                            this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="TownName"><span>TownName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">TownName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="TwnLctnNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/TwnLctnNm"><input type="text" onchange='if (this.value) {
                                                                                                                        this.setAttribute("value", this.value); } else {
                                                                                                                        this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="TownLocationName"><span>TownLocationName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">TownLocationName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="DstrctNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/DstrctNm"><input type="text" onchange='if (this.value) {
                                                                                                                                    this.setAttribute("value", this.value); } else {
                                                                                                                                    this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="DistrictName"><span>DistrictName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">DistrictName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CtrySubDvsn" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/CtrySubDvsn"><input type="text" onchange='if (this.value) {
                                                                                                                                                this.setAttribute("value", this.value); } else {
                                                                                                                                                this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="CountrySubDivision"><span>CountrySubDivision<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">CountrySubDivision</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Ctry" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/Ctry"><input type="text" onchange='if (this.value) {
                                                                                                                                                            this.setAttribute("value", this.value); } else {
                                                                                                                                                            this.removeAttribute("value"); };' required="required" pattern="[A-Z]{2,2}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Country"><span>Country<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Country</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="AdrLine" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/AdrLine"><input type="text" onchange='if (this.value) {
                                                                                                                                                                        this.setAttribute("value", this.value); } else {
                                                                                                                                                                        this.removeAttribute("value"); };' required="required" maxlength="70" pattern=".{1,70}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="AddressLine"><span>AddressLine<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="3" onclick="clickAddButton(this);">AddressLine</button></section>
                                                            </fieldset>
                                                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">PostalAddress</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id">
                                                                <legend>Identification<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                </legend>
                                                                <label><input type="radio" name="id11" required="required" onclick="clickRadioInput(this, 'id11');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/OrgId">
                                                                        <legend>OrganisationIdentification</legend>
                                                                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="AnyBIC" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/OrgId/AnyBIC"><input type="text" onblur="formatBICFI(this);" maxlength="12" minlength="12" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[A-Z0-9]{4,4}[A-Z]{2,2}[A-Z0-9]{2,2}([A-Z0-9]{3,3}){0,1}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="AnyBIC"><span>AnyBIC<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">AnyBIC</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="LEI" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/OrgId/LEI"><input type="text" onchange='if (this.value) {
                            this.setAttribute("value", this.value); } else {
                            this.removeAttribute("value"); };' required="required" pattern="[A-Z0-9]{18,18}[0-9]{2,2}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="LEI"><span>LEI<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">LEI</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Othr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/OrgId/Othr">
                                                                                <legend>Other<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                                </legend>
                                                                                <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/OrgId/Othr/Id"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Identification"><span>Identification</span></label></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="SchmeNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/OrgId/Othr/SchmeNm">
                                                                                        <legend>SchemeName<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                                        </legend>
                                                                                        <label><input type="radio" name="id12" required="required" onclick="clickRadioInput(this, 'id12');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cd" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/OrgId/Othr/SchmeNm/Cd"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="4" pattern=".{1,4}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Code"><span>Code</span></label></section>
                                                                                    </fieldset>
                                                                                    <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">SchemeName</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Issr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/OrgId/Othr/Issr"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Issuer"><span>Issuer<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Issuer</button></section>
                                                                            </fieldset>
                                                                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="2" onclick="clickAddButton(this);">Other</button></section>
                                                                    </fieldset></section><label><input type="radio" name="id11" required="required" onclick="clickRadioInput(this, 'id11');" data-xsd2html2xml-description="2"><span>2</span></label><section data-xsd2html2xml-choice="true"><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PrvtId" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/PrvtId">
                                                                        <legend>PrivateIdentification</legend>
                                                                        <section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="DtAndPlcOfBirth" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/PrvtId/DtAndPlcOfBirth">
                                                                                <legend>DateAndPlaceOfBirth<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                                </legend>
                                                                                <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="BirthDt" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/PrvtId/DtAndPlcOfBirth/BirthDt"><input type="date" onchange='if (this.value) {
                this.setAttribute("value", this.value.replace(/\s+/g, " ").trim()); } else {
                this.removeAttribute("value"); };' required="required" pattern=".{0,}" data-xsd2html2xml-primitive="date" data-xsd2html2xml-description="BirthDate"><span>BirthDate</span></label></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="PrvcOfBirth" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/PrvtId/DtAndPlcOfBirth/PrvcOfBirth"><input type="text" onchange='if (this.value) {
                            this.setAttribute("value", this.value);
                        } else {
                            this.removeAttribute("value");
                        }
                        ;' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="ProvinceOfBirth"><span>ProvinceOfBirth<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">ProvinceOfBirth</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CityOfBirth" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/PrvtId/DtAndPlcOfBirth/CityOfBirth"><input type="text" onchange='if (this.value) {
                                    this.setAttribute("value", this.value); } else {
                                    this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="CityOfBirth"><span>CityOfBirth</span></label></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CtryOfBirth" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/PrvtId/DtAndPlcOfBirth/CtryOfBirth"><input type="text" onchange='if (this.value) {
                                                this.setAttribute("value", this.value); } else {
                                                this.removeAttribute("value"); };' required="required" pattern="[A-Z]{2,2}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="CountryOfBirth"><span>CountryOfBirth</span></label></section>
                                                                            </fieldset>
                                                                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">DateAndPlaceOfBirth</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Othr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/PrvtId/Othr">
                                                                                <legend>Other<button type="button" class="remove" onclick="clickRemoveButton(this);"></button>
                                                                                </legend>
                                                                                <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/PrvtId/Othr/Id"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Identification"><span>Identification</span></label></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="SchmeNm" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/PrvtId/Othr/SchmeNm">
                                                                                        <legend>SchemeName</legend>
                                                                                        <label><input type="radio" name="id13" required="required" onclick="clickRadioInput(this, 'id13');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cd" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/PrvtId/Othr/SchmeNm/Cd"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" maxlength="4" pattern=".{1,4}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Code"><span>Code</span></label></section>
                                                                                    </fieldset></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Issr" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/Id/PrvtId/Othr/Issr"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value);
            } else {
                this.removeAttribute("value");
            }
            ;' required="required" maxlength="35" pattern=".{1,35}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="Issuer"><span>Issuer<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Issuer</button></section>
                                                                            </fieldset>
                                                                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="2" onclick="clickAddButton(this);">Other</button></section>
                                                                    </fieldset></section>
                                                            </fieldset>
                                                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Identification</button></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="CtryOfRes" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/CtryOfRes"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[A-Z]{2,2}" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="CountryOfResidence"><span>CountryOfResidence<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">CountryOfResidence</button></section>
                                                    </fieldset>
                                                    <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Originator</button></section><section><fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Rsn" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Rsn">
                                                        <legend>Reason <a style="color:red;text-decoration:none">*</a></legend>
                                                        <label><input type="radio" name="id14" required="required" onclick="clickRadioInput(this, 'id14');" data-xsd2html2xml-description="1"><span>1</span></label><section data-xsd2html2xml-choice="true"><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cd" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Rsn/Cd"><select onchange='this.childNodes.forEach(function (o) {
                if (o.nodeType == Node.ELEMENT_NODE)
                    o.removeAttribute("selected"); }); this.children[this.selectedIndex].setAttribute("selected", "selected");' required="required" data-xsd2html2xml-description="Code"><option value="DUPL">DuplicatePayment</option>
                                                                    <option value="CUTA">CancelUponUnableToApply</option>
                                                                    <option value="UPAY">UnduePayment</option>
                                                                    <option value="CUST">RequestedByCustomer</option>
                                                                    <option value="CURR">IncorrectCurrency</option>
                                                                    <option value="AGNT">IncorrectAgent</option>
                                                                    <option value="TECH">TechnicalProblem</option>
                                                                    <option value="FRAD">FraudulentOrigin</option>
                                                                    <option value="AM09">IncorrectAmount</option>
                                                                    <option value="NARR">Narrative</option></select><span>Code <a style="color:red;text-decoration:none">*</a></span></label></section>
                                                    </fieldset></section><section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.055.001.08" data-xsd2html2xml-type="element" data-xsd2html2xml-name="AddtlInf" data-xsd2html2xml-xpath="/Document/CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/AddtlInf"><input type="text" onchange='if (this.value) {
                this.setAttribute("value", this.value); } else {
                this.removeAttribute("value"); };' required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+" maxlength="105" data-xsd2html2xml-primitive="string" data-xsd2html2xml-description="AdditionalInformation"><span>AdditionalInformation<button type="button" class="remove" onclick="clickRemoveButton(this);"></button></span></label><button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="2" onclick="clickAddButton(this);">AdditionalInformation</button></section>
                                            </fieldset></section>
                                    </fieldset></section>
                            </fieldset></section>
                    </fieldset></section>
            </fieldset></section>
    </fieldset></section>
<script>
    flatpickr(".datetime-local", {
        enableTime: true,
        enableSeconds: true,
        dateFormat: "Y-m-d\TH:i:S",
        time_24hr: true,
        minuteIncrement: 1,
    });
    flatpickr(".date", {
        dateFormat: "Y-m-d",
        enableTime: false
    });
    flatpickr(".time", {
        enableTime: true,
        enableSeconds: true,
        dateFormat: "H:i:S",
        time_24hr: true,
        minuteIncrement: 1,
        noCalendar: true,
        utc: true
    });
    function generateUUID() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
    }
    function generateuetr() {
        const uuid = generateUUID();
        const inputField = document.getElementById("UETR");
        inputField.value = uuid;
        inputField.setAttribute("value", uuid);
    }

    function textonly(e) {
        var code;
        if (!e)
            var e = window.event;
        if (e.keyCode)
            code = e.keyCode;
        else if (e.which)
            code = e.which;
        var character = String.fromCharCode(code);

        var AllowRegex = /^[\ba-zA-Z\s-]$/;
        if (AllowRegex.test(character))
            return true;
        return false;
    }

    document.addEventListener("DOMContentLoaded", function () {
        const statusInput = document.getElementById("status"); // Ambil elemen status
        const form = document.getElementById("form1"); // Ambil elemen form

        if ((statusInput && statusInput.value === "INC" && form) || (statusInput && statusInput.value === "VER" && form) || (statusInput && statusInput.value === "AUTH" && form) || (statusInput && statusInput.value === "CVT-VER" && form) || (statusInput && statusInput.value === "WAITING-AML" && form) || (statusInput && statusInput.value === "REJECT" && form) || (statusInput && statusInput.value === "RESEND" && form)) {
            const allInputs = form.elements; // Ambil semua elemen dalam form sekali saja
            for (let input of allInputs) {
                if (input.tagName === "SELECT" || input.tagName === "BUTTON") {
                    input.disabled = true;
                } else {
                    input.readOnly = true;
                }
            }
        }
    });

    function formatBICFI(input) {
        input.value = input.value.toUpperCase();
        let value = input.value.trim();
        if (value.length === 12) {
            const part1 = value.substring(0, 8);
            const part2 = value.substring(9, 12);
            const newValue = part1 + part2;
            newValue.toUpperCase();
            input.value = newValue;
            console.log("BICFI setelah diproses:", newValue);
        } else if (value.length > 0) {
            alert('BICFI must be 12 characters (contoh: BDINIDJAXXXX)');
        }
    }

    function validateAmount(input) {
        let value = input.value.trim().replace(',', '.');
        if (value && parseFloat(value) === 0) {
            alert('Amount must not be Zero (0)');
        }
    }
</script>