<%-- 
    Document   : camt10700101
    Created on : Feb 17, 2025, 4:13:20 PM
    Author     : rafli
--%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<link rel="stylesheet" type="text/css" href="css/MX.css" />
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

<section>
    <fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Document" data-xsd2html2xml-xpath="/Document">
        <legend>Document</legend>
        <section>
            <fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                data-xsd2html2xml-type="element" data-xsd2html2xml-name="ChqPresntmntNtfctn"
                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn">
                <legend>ChqPresntmntNtfctn</legend>
                <section>
                    <fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="GrpHdr"
                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/GrpHdr">
                        <legend>GroupHeader</legend>
                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="MsgId"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/GrpHdr/MsgId"><input type="text"
                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                    required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+" maxlength="16"
                                    data-xsd2html2xml-primitive="string"
                                    data-xsd2html2xml-description="MessageIdentification"><span>MessageIdentification</span></label>
                        </section>
                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="CreDtTm"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/GrpHdr/CreDtTm"><input
                                    type="datetime-local"
                                    onchange='if (this.value) { this.setAttribute("value", (this.value.match(/.*\d\d:\d\d:\d\d/) ? this.value : this.value.concat(":00"))); } else { this.removeAttribute("value"); };'
                                    required="required" pattern=".*(\+|-)((0[0-9])|(1[0-4])):[0-5][0-9]" step="1"
                                    data-xsd2html2xml-primitive="datetime"
                                    data-xsd2html2xml-description="CreationDateTime"><span>CreationDateTime</span></label>
                        </section>
                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="NbOfChqs"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/GrpHdr/NbOfChqs"><select
                                    onchange='this.childNodes.forEach(function(o) { if (o.nodeType == Node.ELEMENT_NODE) o.removeAttribute("selected"); }); this.children[this.selectedIndex].setAttribute("selected","selected");'
                                    required="required" data-xsd2html2xml-description="NumberOfCheques">
                                    <option value="1">1</option>
                                </select><span>NumberOfCheques</span></label></section>
                    </fieldset>
                </section>
                <section>
                    <fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Chq"
                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq">
                        <legend>Cheque</legend>
                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="InstrId"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/InstrId"><input type="text"
                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                    required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+" maxlength="35"
                                    data-xsd2html2xml-primitive="string"
                                    data-xsd2html2xml-description="InstructionIdentification"><span>InstructionIdentification</span></label>
                        </section>
                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="ChqNb"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/ChqNb"><input type="text"
                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                    required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+" maxlength="16"
                                    data-xsd2html2xml-primitive="string"
                                    data-xsd2html2xml-description="ChequeNumber"><span>ChequeNumber</span></label>
                        </section>
                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="IsseDt"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/IsseDt"><input type="date"
                                    onchange='if (this.value) { this.setAttribute("value", this.value.replace(/\s+/g, " ").trim()); } else { this.removeAttribute("value"); };'
                                    required="required" pattern=".{0,}" data-xsd2html2xml-primitive="date"
                                    data-xsd2html2xml-description="IssueDate"><span>IssueDate</span></label></section>
                        <section><label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="StlDt"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/StlDt"><input type="date"
                                    onchange='if (this.value) { this.setAttribute("value", this.value.replace(/\s+/g, " ").trim()); } else { this.removeAttribute("value"); };'
                                    required="required" pattern=".{0,}" data-xsd2html2xml-primitive="date"
                                    data-xsd2html2xml-description="StaleDate"><span>StaleDate<button type="button"
                                        class="remove"
                                        onclick="clickRemoveButton(this);"></button></span></label><button type="button"
                                class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1"
                                onclick="clickAddButton(this);">StaleDate</button></section>
                        <section>
                            <fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Amt"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Amt">
                                <legend>Amount</legend>
                                <label data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                    data-xsd2html2xml-type="content" data-xsd2html2xml-name="Amt"
                                    data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Amt"><input type="number"
                                        onchange='if (this.value) { this.setAttribute("value", this.value.replace(/\s+/g, " ").trim()); } else { this.removeAttribute("value"); };'
                                        required="required" min="0" step="0.1" pattern="[-]?{0,}"
                                        data-xsd2html2xml-primitive="decimal"
                                        data-xsd2html2xml-description="Amount"><span>Amount</span></label><label
                                    data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                    data-xsd2html2xml-type="attribute" data-xsd2html2xml-name="Ccy"
                                    data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Amt/@Ccy"><input
                                        type="text"
                                        onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                        required="required" pattern="[A-Z]{3,3}" data-xsd2html2xml-primitive="string"
                                        data-xsd2html2xml-description="Currency"><span>Currency</span></label>
                            </fieldset>
                        </section>
                        <section>
                            <fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="ValDt"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/ValDt">
                                <legend>ValueDate<button type="button" class="remove"
                                        onclick="clickRemoveButton(this);"></button>
                                </legend>
                                <label><input type="radio" name="id1" required="required"
                                        onclick="clickRadioInput(this, 'id1');"
                                        data-xsd2html2xml-description="1"><span>1</span></label>
                                <section data-xsd2html2xml-choice="true"><label
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Dt"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/ValDt/Dt"><input
                                            type="date"
                                            onchange='if (this.value) { this.setAttribute("value", this.value.replace(/\s+/g, " ").trim()); } else { this.removeAttribute("value"); };'
                                            required="required" pattern=".{0,}" data-xsd2html2xml-primitive="date"
                                            data-xsd2html2xml-description="Date"><span>Date</span></label></section>
                            </fieldset>
                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1"
                                onclick="clickAddButton(this);">ValueDate</button>
                        </section>
                        <section>
                            <fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Pyer"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer">
                                <legend>Payer</legend>
                                <section><label
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Nm"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Nm"><input
                                            type="text"
                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                            required="required"
                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                            maxlength="140" data-xsd2html2xml-primitive="string"
                                            data-xsd2html2xml-description="Name"><span>Name</span></label></section>
                                <section>
                                    <fieldset
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstlAdr"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr">
                                        <legend>PostalAddress</legend>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Dept"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/Dept"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="70" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Department"><span>Department<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">Department</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="SubDept"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/SubDept"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="70" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="SubDepartment"><span>SubDepartment<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">SubDepartment</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="StrtNm"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/StrtNm"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="70" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="StreetName"><span>StreetName<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">StreetName</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="BldgNb"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/BldgNb"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="16" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="BuildingNumber"><span>BuildingNumber<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">BuildingNumber</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="BldgNm"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/BldgNm"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="BuildingName"><span>BuildingName<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">BuildingName</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Flr"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/Flr"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="70" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Floor"><span>Floor<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Floor</button>
                                        </section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstBx"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/PstBx"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="16" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="PostBox"><span>PostBox<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">PostBox</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Room"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/Room"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="70" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Room"><span>Room<button type="button"
                                                        class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Room</button>
                                        </section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstCd"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/PstCd"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="16" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="PostCode"><span>PostCode<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">PostCode</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="TwnNm"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/TwnNm"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="TownName"><span>TownName<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">TownName</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="TwnLctnNm"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/TwnLctnNm"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="TownLocationName"><span>TownLocationName<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">TownLocationName</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="DstrctNm"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/DstrctNm"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="DistrictName"><span>DistrictName<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">DistrictName</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="CtrySubDvsn"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/CtrySubDvsn"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="CountrySubDivision"><span>CountrySubDivision<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">CountrySubDivision</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Ctry"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/Ctry"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required" pattern="[A-Z]{2,2}"
                                                    data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Country"><span>Country<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">Country</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="AdrLine"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/PstlAdr/AdrLine"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="70" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="AddressLine"><span>AddressLine<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="3"
                                                onclick="clickAddButton(this);">AddressLine</button></section>
                                    </fieldset>
                                </section>
                                <section>
                                    <fieldset
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id">
                                        <legend>Identification<button type="button" class="remove"
                                                onclick="clickRemoveButton(this);"></button>
                                        </legend>
                                        <label><input type="radio" name="id2" required="required"
                                                onclick="clickRadioInput(this, 'id2');"
                                                data-xsd2html2xml-description="1"><span>1</span></label>
                                        <section data-xsd2html2xml-choice="true">
                                            <fieldset
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgId"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/OrgId">
                                                <legend>OrganisationIdentification</legend>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="AnyBIC"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/OrgId/AnyBIC"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[A-Z0-9]{4,4}[A-Z]{2,2}[A-Z0-9]{2,2}([A-Z0-9]{3,3}){0,1}"
                                                            data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="AnyBIC"><span>AnyBIC<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">AnyBIC</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="LEI"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/OrgId/LEI"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required" pattern="[A-Z0-9]{18,18}[0-9]{2,2}"
                                                            data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="LEI"><span>LEI<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">LEI</button></section>
                                                <section>
                                                    <fieldset
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Othr"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/OrgId/Othr">
                                                        <legend>Other<button type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button>
                                                        </legend>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Id"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/OrgId/Othr/Id"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Identification"><span>Identification</span></label>
                                                        </section>
                                                        <section>
                                                            <fieldset
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="SchmeNm"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/OrgId/Othr/SchmeNm">
                                                                <legend>SchemeName<button type="button" class="remove"
                                                                        onclick="clickRemoveButton(this);"></button>
                                                                </legend>
                                                                <label><input type="radio" name="id3"
                                                                        required="required"
                                                                        onclick="clickRadioInput(this, 'id3');"
                                                                        data-xsd2html2xml-description="1"><span>1</span></label>
                                                                <section data-xsd2html2xml-choice="true"><label
                                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                        data-xsd2html2xml-type="element"
                                                                        data-xsd2html2xml-name="Cd"
                                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/OrgId/Othr/SchmeNm/Cd"><input
                                                                            type="text"
                                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                            required="required" maxlength="4"
                                                                            pattern=".{1,4}"
                                                                            data-xsd2html2xml-primitive="string"
                                                                            data-xsd2html2xml-description="Code"><span>Code</span></label>
                                                                </section><label><input type="radio" name="id3"
                                                                        required="required"
                                                                        onclick="clickRadioInput(this, 'id3');"
                                                                        data-xsd2html2xml-description="2"><span>2</span></label>
                                                                <section data-xsd2html2xml-choice="true"><label
                                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                        data-xsd2html2xml-type="element"
                                                                        data-xsd2html2xml-name="Prtry"
                                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/OrgId/Othr/SchmeNm/Prtry"><input
                                                                            type="text"
                                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                            required="required"
                                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                            maxlength="35"
                                                                            data-xsd2html2xml-primitive="string"
                                                                            data-xsd2html2xml-description="Proprietary"><span>Proprietary</span></label>
                                                                </section>
                                                            </fieldset>
                                                            <button type="button" class="add" data-xsd2html2xml-min="0"
                                                                data-xsd2html2xml-max="1"
                                                                onclick="clickAddButton(this);">SchemeName</button>
                                                        </section>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Issr"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/OrgId/Othr/Issr"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Issuer"><span>Issuer<button
                                                                        type="button" class="remove"
                                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                                data-xsd2html2xml-max="1"
                                                                onclick="clickAddButton(this);">Issuer</button>
                                                        </section>
                                                    </fieldset>
                                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="2"
                                                        onclick="clickAddButton(this);">Other</button>
                                                </section>
                                            </fieldset>
                                        </section><label><input type="radio" name="id2" required="required"
                                                onclick="clickRadioInput(this, 'id2');"
                                                data-xsd2html2xml-description="2"><span>2</span></label>
                                        <section data-xsd2html2xml-choice="true">
                                            <fieldset
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="PrvtId"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/PrvtId">
                                                <legend>PrivateIdentification</legend>
                                                <section>
                                                    <fieldset
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element"
                                                        data-xsd2html2xml-name="DtAndPlcOfBirth"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/PrvtId/DtAndPlcOfBirth">
                                                        <legend>DateAndPlaceOfBirth<button type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button>
                                                        </legend>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="BirthDt"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/PrvtId/DtAndPlcOfBirth/BirthDt"><input
                                                                    type="date"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value.replace(/\s+/g, " ").trim()); } else { this.removeAttribute("value"); };'
                                                                    required="required" pattern=".{0,}"
                                                                    data-xsd2html2xml-primitive="date"
                                                                    data-xsd2html2xml-description="BirthDate"><span>BirthDate</span></label>
                                                        </section>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="PrvcOfBirth"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/PrvtId/DtAndPlcOfBirth/PrvcOfBirth"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="ProvinceOfBirth"><span>ProvinceOfBirth<button
                                                                        type="button" class="remove"
                                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                                data-xsd2html2xml-max="1"
                                                                onclick="clickAddButton(this);">ProvinceOfBirth</button>
                                                        </section>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="CityOfBirth"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/PrvtId/DtAndPlcOfBirth/CityOfBirth"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="CityOfBirth"><span>CityOfBirth</span></label>
                                                        </section>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="CtryOfBirth"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/PrvtId/DtAndPlcOfBirth/CtryOfBirth"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required" pattern="[A-Z]{2,2}"
                                                                    data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="CountryOfBirth"><span>CountryOfBirth</span></label>
                                                        </section>
                                                    </fieldset>
                                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">DateAndPlaceOfBirth</button>
                                                </section>
                                                <section>
                                                    <fieldset
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Othr"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/PrvtId/Othr">
                                                        <legend>Other<button type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button>
                                                        </legend>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Id"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/PrvtId/Othr/Id"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Identification"><span>Identification</span></label>
                                                        </section>
                                                        <section>
                                                            <fieldset
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="SchmeNm"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/PrvtId/Othr/SchmeNm">
                                                                <legend>SchemeName<button type="button" class="remove"
                                                                        onclick="clickRemoveButton(this);"></button>
                                                                </legend>
                                                                <label><input type="radio" name="id4"
                                                                        required="required"
                                                                        onclick="clickRadioInput(this, 'id4');"
                                                                        data-xsd2html2xml-description="1"><span>1</span></label>
                                                                <section data-xsd2html2xml-choice="true"><label
                                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                        data-xsd2html2xml-type="element"
                                                                        data-xsd2html2xml-name="Cd"
                                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/PrvtId/Othr/SchmeNm/Cd"><input
                                                                            type="text"
                                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                            required="required" maxlength="4"
                                                                            pattern=".{1,4}"
                                                                            data-xsd2html2xml-primitive="string"
                                                                            data-xsd2html2xml-description="Code"><span>Code</span></label>
                                                                </section><label><input type="radio" name="id4"
                                                                        required="required"
                                                                        onclick="clickRadioInput(this, 'id4');"
                                                                        data-xsd2html2xml-description="2"><span>2</span></label>
                                                                <section data-xsd2html2xml-choice="true"><label
                                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                        data-xsd2html2xml-type="element"
                                                                        data-xsd2html2xml-name="Prtry"
                                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/PrvtId/Othr/SchmeNm/Prtry"><input
                                                                            type="text"
                                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                            required="required"
                                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                            maxlength="35"
                                                                            data-xsd2html2xml-primitive="string"
                                                                            data-xsd2html2xml-description="Proprietary"><span>Proprietary</span></label>
                                                                </section>
                                                            </fieldset>
                                                            <button type="button" class="add" data-xsd2html2xml-min="0"
                                                                data-xsd2html2xml-max="1"
                                                                onclick="clickAddButton(this);">SchemeName</button>
                                                        </section>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Issr"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/Id/PrvtId/Othr/Issr"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Issuer"><span>Issuer<button
                                                                        type="button" class="remove"
                                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                                data-xsd2html2xml-max="1"
                                                                onclick="clickAddButton(this);">Issuer</button>
                                                        </section>
                                                    </fieldset>
                                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="2"
                                                        onclick="clickAddButton(this);">Other</button>
                                                </section>
                                            </fieldset>
                                        </section>
                                    </fieldset>
                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                        data-xsd2html2xml-max="1"
                                        onclick="clickAddButton(this);">Identification</button>
                                </section>
                                <section><label
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="CtryOfRes"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyer/CtryOfRes"><input
                                            type="text"
                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                            required="required" pattern="[A-Z]{2,2}"
                                            data-xsd2html2xml-primitive="string"
                                            data-xsd2html2xml-description="CountryOfResidence"><span>CountryOfResidence<button
                                                type="button" class="remove"
                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                        type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1"
                                        onclick="clickAddButton(this);">CountryOfResidence</button></section>
                            </fieldset>
                        </section>
                        <section>
                            <fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="PyerAcct"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct">
                                <legend>PayerAccount<button type="button" class="remove"
                                        onclick="clickRemoveButton(this);"></button>
                                </legend>
                                <section>
                                    <fieldset
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Id">
                                        <legend>Identification<button type="button" class="remove"
                                                onclick="clickRemoveButton(this);"></button>
                                        </legend>
                                        <label><input type="radio" name="id5" required="required"
                                                onclick="clickRadioInput(this, 'id5');"
                                                data-xsd2html2xml-description="1"><span>1</span></label>
                                        <section data-xsd2html2xml-choice="true"><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="IBAN"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Id/IBAN"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required" pattern="[A-Z]{2,2}[0-9]{2,2}[a-zA-Z0-9]{1,30}"
                                                    data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="IBAN"><span>IBAN</span></label>
                                        </section><label><input type="radio" name="id5" required="required"
                                                onclick="clickRadioInput(this, 'id5');"
                                                data-xsd2html2xml-description="2"><span>2</span></label>
                                        <section data-xsd2html2xml-choice="true">
                                            <fieldset
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Othr"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Id/Othr">
                                                <legend>Other</legend>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Id/Othr/Id"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="([0-9a-zA-Z\-\?:\(\)\.,'\+ ]([0-9a-zA-Z\-\?:\(\)\.,'\+ ]*(/[0-9a-zA-Z\-\?:\(\)\.,'\+ ])?)*)"
                                                            maxlength="34" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="Identification"><span>Identification</span></label>
                                                </section>
                                                <section>
                                                    <fieldset
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element"
                                                        data-xsd2html2xml-name="SchmeNm"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Id/Othr/SchmeNm">
                                                        <legend>SchemeName<button type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button>
                                                        </legend>
                                                        <label><input type="radio" name="id6" required="required"
                                                                onclick="clickRadioInput(this, 'id6');"
                                                                data-xsd2html2xml-description="1"><span>1</span></label>
                                                        <section data-xsd2html2xml-choice="true"><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Cd"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Id/Othr/SchmeNm/Cd"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required" maxlength="4" pattern=".{1,4}"
                                                                    data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Code"><span>Code</span></label>
                                                        </section><label><input type="radio" name="id6"
                                                                required="required"
                                                                onclick="clickRadioInput(this, 'id6');"
                                                                data-xsd2html2xml-description="2"><span>2</span></label>
                                                        <section data-xsd2html2xml-choice="true"><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Prtry"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Id/Othr/SchmeNm/Prtry"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Proprietary"><span>Proprietary</span></label>
                                                        </section>
                                                    </fieldset>
                                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">SchemeName</button>
                                                </section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Issr"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Id/Othr/Issr"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                            maxlength="35" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="Issuer"><span>Issuer<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">Issuer</button></section>
                                            </fieldset>
                                        </section>
                                    </fieldset>
                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                        data-xsd2html2xml-max="1"
                                        onclick="clickAddButton(this);">Identification</button>
                                </section>
                                <section>
                                    <fieldset
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Tp"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Tp">
                                        <legend>Type<button type="button" class="remove"
                                                onclick="clickRemoveButton(this);"></button>
                                        </legend>
                                        <label><input type="radio" name="id7" required="required"
                                                onclick="clickRadioInput(this, 'id7');"
                                                data-xsd2html2xml-description="1"><span>1</span></label>
                                        <section data-xsd2html2xml-choice="true"><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cd"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Tp/Cd"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required" maxlength="4" pattern=".{1,4}"
                                                    data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Code"><span>Code</span></label>
                                        </section><label><input type="radio" name="id7" required="required"
                                                onclick="clickRadioInput(this, 'id7');"
                                                data-xsd2html2xml-description="2"><span>2</span></label>
                                        <section data-xsd2html2xml-choice="true"><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Prtry"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Tp/Prtry"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Proprietary"><span>Proprietary</span></label>
                                        </section>
                                    </fieldset>
                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                        data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Type</button>
                                </section>
                                <section><label
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Ccy"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Ccy"><input
                                            type="text"
                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                            required="required" pattern="[A-Z]{3,3}"
                                            data-xsd2html2xml-primitive="string"
                                            data-xsd2html2xml-description="Currency"><span>Currency<button type="button"
                                                class="remove"
                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                        type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1"
                                        onclick="clickAddButton(this);">Currency</button></section>
                                <section><label
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Nm"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Nm"><input
                                            type="text"
                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                            required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+" maxlength="70"
                                            data-xsd2html2xml-primitive="string"
                                            data-xsd2html2xml-description="Name"><span>Name<button type="button"
                                                class="remove"
                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                        type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1"
                                        onclick="clickAddButton(this);">Name</button></section>
                                <section>
                                    <fieldset
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Prxy"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Prxy">
                                        <legend>Proxy<button type="button" class="remove"
                                                onclick="clickRemoveButton(this);"></button>
                                        </legend>
                                        <section>
                                            <fieldset
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Tp"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Prxy/Tp">
                                                <legend>Type<button type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button>
                                                </legend>
                                                <label><input type="radio" name="id8" required="required"
                                                        onclick="clickRadioInput(this, 'id8');"
                                                        data-xsd2html2xml-description="1"><span>1</span></label>
                                                <section data-xsd2html2xml-choice="true"><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cd"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Prxy/Tp/Cd"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required" maxlength="4" pattern=".{1,4}"
                                                            data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="Code"><span>Code</span></label>
                                                </section><label><input type="radio" name="id8" required="required"
                                                        onclick="clickRadioInput(this, 'id8');"
                                                        data-xsd2html2xml-description="2"><span>2</span></label>
                                                <section data-xsd2html2xml-choice="true"><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Prtry"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Prxy/Tp/Prtry"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                            maxlength="35" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="Proprietary"><span>Proprietary</span></label>
                                                </section>
                                            </fieldset>
                                            <button type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Type</button>
                                        </section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/PyerAcct/Prxy/Id"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="320" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Identification"><span>Identification</span></label>
                                        </section>
                                    </fieldset>
                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                        data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Proxy</button>
                                </section>
                            </fieldset>
                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1"
                                onclick="clickAddButton(this);">PayerAccount</button>
                        </section>
                        <section>
                            <fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="DrwrAgt"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt">
                                <legend>DrawerAgent<button type="button" class="remove"
                                        onclick="clickRemoveButton(this);"></button>
                                </legend>
                                <section>
                                    <fieldset
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="FinInstnId"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId">
                                        <legend>FinancialInstitutionIdentification</legend>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="BICFI"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/BICFI"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[A-Z0-9]{4,4}[A-Z]{2,2}[A-Z0-9]{2,2}([A-Z0-9]{3,3}){0,1}"
                                                    data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="BICFI"><span>BICFI<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1" onclick="clickAddButton(this);">BICFI</button>
                                        </section>
                                        <section>
                                            <fieldset
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="ClrSysMmbId"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/ClrSysMmbId">
                                                <legend>ClearingSystemMemberIdentification<button type="button"
                                                        class="remove" onclick="clickRemoveButton(this);"></button>
                                                </legend>
                                                <section>
                                                    <fieldset
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element"
                                                        data-xsd2html2xml-name="ClrSysId"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/ClrSysMmbId/ClrSysId">
                                                        <legend>ClearingSystemIdentification</legend>
                                                        <label><input type="radio" name="id9" required="required"
                                                                onclick="clickRadioInput(this, 'id9');"
                                                                data-xsd2html2xml-description="1"><span>1</span></label>
                                                        <section data-xsd2html2xml-choice="true"><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Cd"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/ClrSysMmbId/ClrSysId/Cd"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required" maxlength="5" pattern=".{1,5}"
                                                                    data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Code"><span>Code</span></label>
                                                        </section>
                                                    </fieldset>
                                                </section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="MmbId"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/ClrSysMmbId/MmbId"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                            maxlength="28" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="MemberIdentification"><span>MemberIdentification</span></label>
                                                </section>
                                            </fieldset>
                                            <button type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">ClearingSystemMemberIdentification</button>
                                        </section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="LEI"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/LEI"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required" pattern="[A-Z0-9]{18,18}[0-9]{2,2}"
                                                    data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="LEI"><span>LEI<button type="button"
                                                        class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1" onclick="clickAddButton(this);">LEI</button>
                                        </section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Nm"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/Nm"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="140" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Name"><span>Name<button type="button"
                                                        class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Name</button>
                                        </section>
                                        <section>
                                            <fieldset
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstlAdr"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr">
                                                <legend>PostalAddress<button type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button>
                                                </legend>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Dept"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/Dept"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="70" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="Department"><span>Department<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">Department</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element"
                                                        data-xsd2html2xml-name="SubDept"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/SubDept"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="70" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="SubDepartment"><span>SubDepartment<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">SubDepartment</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="StrtNm"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/StrtNm"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="70" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="StreetName"><span>StreetName<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">StreetName</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="BldgNb"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/BldgNb"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="16" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="BuildingNumber"><span>BuildingNumber<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">BuildingNumber</button>
                                                </section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="BldgNm"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/BldgNm"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="35" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="BuildingName"><span>BuildingName<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">BuildingName</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Flr"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/Flr"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="70" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="Floor"><span>Floor<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">Floor</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstBx"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/PstBx"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="16" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="PostBox"><span>PostBox<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">PostBox</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Room"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/Room"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="70" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="Room"><span>Room<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">Room</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstCd"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/PstCd"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="16" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="PostCode"><span>PostCode<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">PostCode</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="TwnNm"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/TwnNm"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="35" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="TownName"><span>TownName<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">TownName</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element"
                                                        data-xsd2html2xml-name="TwnLctnNm"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/TwnLctnNm"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="35" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="TownLocationName"><span>TownLocationName<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">TownLocationName</button>
                                                </section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element"
                                                        data-xsd2html2xml-name="DstrctNm"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/DstrctNm"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="35" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="DistrictName"><span>DistrictName<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">DistrictName</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element"
                                                        data-xsd2html2xml-name="CtrySubDvsn"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/CtrySubDvsn"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="35" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="CountrySubDivision"><span>CountrySubDivision<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">CountrySubDivision</button>
                                                </section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Ctry"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/Ctry"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required" pattern="[A-Z]{2,2}"
                                                            data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="Country"><span>Country<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">Country</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element"
                                                        data-xsd2html2xml-name="AdrLine"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgt/FinInstnId/PstlAdr/AdrLine"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                            maxlength="70" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="AddressLine"><span>AddressLine<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="3"
                                                        onclick="clickAddButton(this);">AddressLine</button></section>
                                            </fieldset>
                                            <button type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">PostalAddress</button>
                                        </section>
                                    </fieldset>
                                </section>
                            </fieldset>
                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1"
                                onclick="clickAddButton(this);">DrawerAgent</button>
                        </section>
                        <section>
                            <fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="DrwrAgtAcct"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct">
                                <legend>DrawerAgentAccount<button type="button" class="remove"
                                        onclick="clickRemoveButton(this);"></button>
                                </legend>
                                <section>
                                    <fieldset
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Id">
                                        <legend>Identification<button type="button" class="remove"
                                                onclick="clickRemoveButton(this);"></button>
                                        </legend>
                                        <label><input type="radio" name="id10" required="required"
                                                onclick="clickRadioInput(this, 'id10');"
                                                data-xsd2html2xml-description="1"><span>1</span></label>
                                        <section data-xsd2html2xml-choice="true"><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="IBAN"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Id/IBAN"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required" pattern="[A-Z]{2,2}[0-9]{2,2}[a-zA-Z0-9]{1,30}"
                                                    data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="IBAN"><span>IBAN</span></label>
                                        </section><label><input type="radio" name="id10" required="required"
                                                onclick="clickRadioInput(this, 'id10');"
                                                data-xsd2html2xml-description="2"><span>2</span></label>
                                        <section data-xsd2html2xml-choice="true">
                                            <fieldset
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Othr"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Id/Othr">
                                                <legend>Other</legend>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Id/Othr/Id"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="([0-9a-zA-Z\-\?:\(\)\.,'\+ ]([0-9a-zA-Z\-\?:\(\)\.,'\+ ]*(/[0-9a-zA-Z\-\?:\(\)\.,'\+ ])?)*)"
                                                            maxlength="34" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="Identification"><span>Identification</span></label>
                                                </section>
                                                <section>
                                                    <fieldset
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element"
                                                        data-xsd2html2xml-name="SchmeNm"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Id/Othr/SchmeNm">
                                                        <legend>SchemeName<button type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button>
                                                        </legend>
                                                        <label><input type="radio" name="id11" required="required"
                                                                onclick="clickRadioInput(this, 'id11');"
                                                                data-xsd2html2xml-description="1"><span>1</span></label>
                                                        <section data-xsd2html2xml-choice="true"><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Cd"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Id/Othr/SchmeNm/Cd"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required" maxlength="4" pattern=".{1,4}"
                                                                    data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Code"><span>Code</span></label>
                                                        </section><label><input type="radio" name="id11"
                                                                required="required"
                                                                onclick="clickRadioInput(this, 'id11');"
                                                                data-xsd2html2xml-description="2"><span>2</span></label>
                                                        <section data-xsd2html2xml-choice="true"><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Prtry"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Id/Othr/SchmeNm/Prtry"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Proprietary"><span>Proprietary</span></label>
                                                        </section>
                                                    </fieldset>
                                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">SchemeName</button>
                                                </section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Issr"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Id/Othr/Issr"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                            maxlength="35" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="Issuer"><span>Issuer<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">Issuer</button></section>
                                            </fieldset>
                                        </section>
                                    </fieldset>
                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                        data-xsd2html2xml-max="1"
                                        onclick="clickAddButton(this);">Identification</button>
                                </section>
                                <section>
                                    <fieldset
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Tp"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Tp">
                                        <legend>Type<button type="button" class="remove"
                                                onclick="clickRemoveButton(this);"></button>
                                        </legend>
                                        <label><input type="radio" name="id12" required="required"
                                                onclick="clickRadioInput(this, 'id12');"
                                                data-xsd2html2xml-description="1"><span>1</span></label>
                                        <section data-xsd2html2xml-choice="true"><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cd"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Tp/Cd"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required" maxlength="4" pattern=".{1,4}"
                                                    data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Code"><span>Code</span></label>
                                        </section><label><input type="radio" name="id12" required="required"
                                                onclick="clickRadioInput(this, 'id12');"
                                                data-xsd2html2xml-description="2"><span>2</span></label>
                                        <section data-xsd2html2xml-choice="true"><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Prtry"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Tp/Prtry"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Proprietary"><span>Proprietary</span></label>
                                        </section>
                                    </fieldset>
                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                        data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Type</button>
                                </section>
                                <section><label
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Ccy"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Ccy"><input
                                            type="text"
                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                            required="required" pattern="[A-Z]{3,3}"
                                            data-xsd2html2xml-primitive="string"
                                            data-xsd2html2xml-description="Currency"><span>Currency<button type="button"
                                                class="remove"
                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                        type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1"
                                        onclick="clickAddButton(this);">Currency</button></section>
                                <section><label
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Nm"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Nm"><input
                                            type="text"
                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                            required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+" maxlength="70"
                                            data-xsd2html2xml-primitive="string"
                                            data-xsd2html2xml-description="Name"><span>Name<button type="button"
                                                class="remove"
                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                        type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1"
                                        onclick="clickAddButton(this);">Name</button></section>
                                <section>
                                    <fieldset
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Prxy"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Prxy">
                                        <legend>Proxy<button type="button" class="remove"
                                                onclick="clickRemoveButton(this);"></button>
                                        </legend>
                                        <section>
                                            <fieldset
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Tp"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Prxy/Tp">
                                                <legend>Type<button type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button>
                                                </legend>
                                                <label><input type="radio" name="id13" required="required"
                                                        onclick="clickRadioInput(this, 'id13');"
                                                        data-xsd2html2xml-description="1"><span>1</span></label>
                                                <section data-xsd2html2xml-choice="true"><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Cd"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Prxy/Tp/Cd"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required" maxlength="4" pattern=".{1,4}"
                                                            data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="Code"><span>Code</span></label>
                                                </section><label><input type="radio" name="id13" required="required"
                                                        onclick="clickRadioInput(this, 'id13');"
                                                        data-xsd2html2xml-description="2"><span>2</span></label>
                                                <section data-xsd2html2xml-choice="true"><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Prtry"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Prxy/Tp/Prtry"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required" pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                            maxlength="35" data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="Proprietary"><span>Proprietary</span></label>
                                                </section>
                                            </fieldset>
                                            <button type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Type</button>
                                        </section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/DrwrAgtAcct/Prxy/Id"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="320" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Identification"><span>Identification</span></label>
                                        </section>
                                    </fieldset>
                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                        data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Proxy</button>
                                </section>
                            </fieldset>
                            <button type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1"
                                onclick="clickAddButton(this);">DrawerAgentAccount</button>
                        </section>
                        <section>
                            <fieldset data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Pyee"
                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee">
                                <legend>Payee</legend>
                                <section><label
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Nm"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Nm"><input
                                            type="text"
                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                            required="required"
                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                            maxlength="140" data-xsd2html2xml-primitive="string"
                                            data-xsd2html2xml-description="Name"><span>Name</span></label></section>
                                <section>
                                    <fieldset
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstlAdr"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr">
                                        <legend>PostalAddress</legend>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Dept"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/Dept"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="70" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Department"><span>Department<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">Department</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="SubDept"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/SubDept"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="70" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="SubDepartment"><span>SubDepartment<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">SubDepartment</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="StrtNm"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/StrtNm"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="70" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="StreetName"><span>StreetName<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">StreetName</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="BldgNb"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/BldgNb"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="16" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="BuildingNumber"><span>BuildingNumber<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">BuildingNumber</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="BldgNm"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/BldgNm"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="BuildingName"><span>BuildingName<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">BuildingName</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Flr"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/Flr"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="70" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Floor"><span>Floor<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Floor</button>
                                        </section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstBx"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/PstBx"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="16" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="PostBox"><span>PostBox<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">PostBox</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Room"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/Room"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="70" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Room"><span>Room<button type="button"
                                                        class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1" onclick="clickAddButton(this);">Room</button>
                                        </section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="PstCd"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/PstCd"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="16" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="PostCode"><span>PostCode<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">PostCode</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="TwnNm"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/TwnNm"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required" maxlength="35" pattern=".{1,35}"
                                                    data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="TownName"><span>TownName<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">TownName</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="TwnLctnNm"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/TwnLctnNm"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="TownLocationName"><span>TownLocationName<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">TownLocationName</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="DstrctNm"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/DstrctNm"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="DistrictName"><span>DistrictName<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">DistrictName</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="CtrySubDvsn"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/CtrySubDvsn"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="CountrySubDivision"><span>CountrySubDivision<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">CountrySubDivision</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="Ctry"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/Ctry"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required" pattern="[A-Z]{2,2}"
                                                    data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="Country"><span>Country<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="1"
                                                onclick="clickAddButton(this);">Country</button></section>
                                        <section><label
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="AdrLine"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/PstlAdr/AdrLine"><input
                                                    type="text"
                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                    required="required"
                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                    maxlength="70" data-xsd2html2xml-primitive="string"
                                                    data-xsd2html2xml-description="AddressLine"><span>AddressLine<button
                                                        type="button" class="remove"
                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                data-xsd2html2xml-max="3"
                                                onclick="clickAddButton(this);">AddressLine</button></section>
                                    </fieldset>
                                </section>
                                <section>
                                    <fieldset
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Id"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id">
                                        <legend>Identification<button type="button" class="remove"
                                                onclick="clickRemoveButton(this);"></button>
                                        </legend>
                                        <label><input type="radio" name="id14" required="required"
                                                onclick="clickRadioInput(this, 'id14');"
                                                data-xsd2html2xml-description="1"><span>1</span></label>
                                        <section data-xsd2html2xml-choice="true">
                                            <fieldset
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="OrgId"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/OrgId">
                                                <legend>OrganisationIdentification</legend>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="AnyBIC"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/OrgId/AnyBIC"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required"
                                                            pattern="[A-Z0-9]{4,4}[A-Z]{2,2}[A-Z0-9]{2,2}([A-Z0-9]{3,3}){0,1}"
                                                            data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="AnyBIC"><span>AnyBIC<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">AnyBIC</button></section>
                                                <section><label
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="LEI"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/OrgId/LEI"><input
                                                            type="text"
                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                            required="required" pattern="[A-Z0-9]{18,18}[0-9]{2,2}"
                                                            data-xsd2html2xml-primitive="string"
                                                            data-xsd2html2xml-description="LEI"><span>LEI<button
                                                                type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                                        type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">LEI</button></section>
                                                <section>
                                                    <fieldset
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Othr"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/OrgId/Othr">
                                                        <legend>Other<button type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button>
                                                        </legend>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Id"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/OrgId/Othr/Id"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Identification"><span>Identification</span></label>
                                                        </section>
                                                        <section>
                                                            <fieldset
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="SchmeNm"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/OrgId/Othr/SchmeNm">
                                                                <legend>SchemeName<button type="button" class="remove"
                                                                        onclick="clickRemoveButton(this);"></button>
                                                                </legend>
                                                                <label><input type="radio" name="id15"
                                                                        required="required"
                                                                        onclick="clickRadioInput(this, 'id15');"
                                                                        data-xsd2html2xml-description="1"><span>1</span></label>
                                                                <section data-xsd2html2xml-choice="true"><label
                                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                        data-xsd2html2xml-type="element"
                                                                        data-xsd2html2xml-name="Cd"
                                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/OrgId/Othr/SchmeNm/Cd"><input
                                                                            type="text"
                                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                            required="required" maxlength="4"
                                                                            pattern=".{1,4}"
                                                                            data-xsd2html2xml-primitive="string"
                                                                            data-xsd2html2xml-description="Code"><span>Code</span></label>
                                                                </section><label><input type="radio" name="id15"
                                                                        required="required"
                                                                        onclick="clickRadioInput(this, 'id15');"
                                                                        data-xsd2html2xml-description="2"><span>2</span></label>
                                                                <section data-xsd2html2xml-choice="true"><label
                                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                        data-xsd2html2xml-type="element"
                                                                        data-xsd2html2xml-name="Prtry"
                                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/OrgId/Othr/SchmeNm/Prtry"><input
                                                                            type="text"
                                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                            required="required"
                                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                            maxlength="35"
                                                                            data-xsd2html2xml-primitive="string"
                                                                            data-xsd2html2xml-description="Proprietary"><span>Proprietary</span></label>
                                                                </section>
                                                            </fieldset>
                                                            <button type="button" class="add" data-xsd2html2xml-min="0"
                                                                data-xsd2html2xml-max="1"
                                                                onclick="clickAddButton(this);">SchemeName</button>
                                                        </section>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Issr"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/OrgId/Othr/Issr"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Issuer"><span>Issuer<button
                                                                        type="button" class="remove"
                                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                                data-xsd2html2xml-max="1"
                                                                onclick="clickAddButton(this);">Issuer</button>
                                                        </section>
                                                    </fieldset>
                                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="2"
                                                        onclick="clickAddButton(this);">Other</button>
                                                </section>
                                            </fieldset>
                                        </section><label><input type="radio" name="id14" required="required"
                                                onclick="clickRadioInput(this, 'id14');"
                                                data-xsd2html2xml-description="2"><span>2</span></label>
                                        <section data-xsd2html2xml-choice="true">
                                            <fieldset
                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                data-xsd2html2xml-type="element" data-xsd2html2xml-name="PrvtId"
                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/PrvtId">
                                                <legend>PrivateIdentification</legend>
                                                <section>
                                                    <fieldset
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element"
                                                        data-xsd2html2xml-name="DtAndPlcOfBirth"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/PrvtId/DtAndPlcOfBirth">
                                                        <legend>DateAndPlaceOfBirth<button type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button>
                                                        </legend>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="BirthDt"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/PrvtId/DtAndPlcOfBirth/BirthDt"><input
                                                                    type="date"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value.replace(/\s+/g, " ").trim()); } else { this.removeAttribute("value"); };'
                                                                    required="required" pattern=".{0,}"
                                                                    data-xsd2html2xml-primitive="date"
                                                                    data-xsd2html2xml-description="BirthDate"><span>BirthDate</span></label>
                                                        </section>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="PrvcOfBirth"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/PrvtId/DtAndPlcOfBirth/PrvcOfBirth"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="ProvinceOfBirth"><span>ProvinceOfBirth<button
                                                                        type="button" class="remove"
                                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                                data-xsd2html2xml-max="1"
                                                                onclick="clickAddButton(this);">ProvinceOfBirth</button>
                                                        </section>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="CityOfBirth"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/PrvtId/DtAndPlcOfBirth/CityOfBirth"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ !#$%&amp;\*=^_`\{\|\}~&quot;;&lt;&gt;@\[\\\]]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="CityOfBirth"><span>CityOfBirth</span></label>
                                                        </section>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="CtryOfBirth"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/PrvtId/DtAndPlcOfBirth/CtryOfBirth"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required" pattern="[A-Z]{2,2}"
                                                                    data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="CountryOfBirth"><span>CountryOfBirth</span></label>
                                                        </section>
                                                    </fieldset>
                                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="1"
                                                        onclick="clickAddButton(this);">DateAndPlaceOfBirth</button>
                                                </section>
                                                <section>
                                                    <fieldset
                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="Othr"
                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/PrvtId/Othr">
                                                        <legend>Other<button type="button" class="remove"
                                                                onclick="clickRemoveButton(this);"></button>
                                                        </legend>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Id"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/PrvtId/Othr/Id"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Identification"><span>Identification</span></label>
                                                        </section>
                                                        <section>
                                                            <fieldset
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="SchmeNm"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/PrvtId/Othr/SchmeNm">
                                                                <legend>SchemeName<button type="button" class="remove"
                                                                        onclick="clickRemoveButton(this);"></button>
                                                                </legend>
                                                                <label><input type="radio" name="id16"
                                                                        required="required"
                                                                        onclick="clickRadioInput(this, 'id16');"
                                                                        data-xsd2html2xml-description="1"><span>1</span></label>
                                                                <section data-xsd2html2xml-choice="true"><label
                                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                        data-xsd2html2xml-type="element"
                                                                        data-xsd2html2xml-name="Cd"
                                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/PrvtId/Othr/SchmeNm/Cd"><input
                                                                            type="text"
                                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                            required="required" maxlength="4"
                                                                            pattern=".{1,4}"
                                                                            data-xsd2html2xml-primitive="string"
                                                                            data-xsd2html2xml-description="Code"><span>Code</span></label>
                                                                </section><label><input type="radio" name="id16"
                                                                        required="required"
                                                                        onclick="clickRadioInput(this, 'id16');"
                                                                        data-xsd2html2xml-description="2"><span>2</span></label>
                                                                <section data-xsd2html2xml-choice="true"><label
                                                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                        data-xsd2html2xml-type="element"
                                                                        data-xsd2html2xml-name="Prtry"
                                                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/PrvtId/Othr/SchmeNm/Prtry"><input
                                                                            type="text"
                                                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                            required="required"
                                                                            pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                            maxlength="35"
                                                                            data-xsd2html2xml-primitive="string"
                                                                            data-xsd2html2xml-description="Proprietary"><span>Proprietary</span></label>
                                                                </section>
                                                            </fieldset>
                                                            <button type="button" class="add" data-xsd2html2xml-min="0"
                                                                data-xsd2html2xml-max="1"
                                                                onclick="clickAddButton(this);">SchemeName</button>
                                                        </section>
                                                        <section><label
                                                                data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                                                data-xsd2html2xml-type="element"
                                                                data-xsd2html2xml-name="Issr"
                                                                data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/Id/PrvtId/Othr/Issr"><input
                                                                    type="text"
                                                                    onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                                                    required="required"
                                                                    pattern="[0-9a-zA-Z/\-\?:\(\)\.,'\+ ]+"
                                                                    maxlength="35" data-xsd2html2xml-primitive="string"
                                                                    data-xsd2html2xml-description="Issuer"><span>Issuer<button
                                                                        type="button" class="remove"
                                                                        onclick="clickRemoveButton(this);"></button></span></label><button
                                                                type="button" class="add" data-xsd2html2xml-min="0"
                                                                data-xsd2html2xml-max="1"
                                                                onclick="clickAddButton(this);">Issuer</button>
                                                        </section>
                                                    </fieldset>
                                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                                        data-xsd2html2xml-max="2"
                                                        onclick="clickAddButton(this);">Other</button>
                                                </section>
                                            </fieldset>
                                        </section>
                                    </fieldset>
                                    <button type="button" class="add" data-xsd2html2xml-min="0"
                                        data-xsd2html2xml-max="1"
                                        onclick="clickAddButton(this);">Identification</button>
                                </section>
                                <section><label
                                        data-xsd2html2xml-namespace="urn:iso:std:iso:20022:tech:xsd:camt.107.001.01"
                                        data-xsd2html2xml-type="element" data-xsd2html2xml-name="CtryOfRes"
                                        data-xsd2html2xml-xpath="/Document/ChqPresntmntNtfctn/Chq/Pyee/CtryOfRes"><input
                                            type="text"
                                            onchange='if (this.value) { this.setAttribute("value", this.value); } else { this.removeAttribute("value"); };'
                                            required="required" pattern="[A-Z]{2,2}"
                                            data-xsd2html2xml-primitive="string"
                                            data-xsd2html2xml-description="CountryOfResidence"><span>CountryOfResidence<button
                                                type="button" class="remove"
                                                onclick="clickRemoveButton(this);"></button></span></label><button
                                        type="button" class="add" data-xsd2html2xml-min="0" data-xsd2html2xml-max="1"
                                        onclick="clickAddButton(this);">CountryOfResidence</button></section>
                            </fieldset>
                        </section>
                    </fieldset>
                </section>
            </fieldset>
        </section>
    </fieldset>
</section>
<script type="text/javascript" src="js/MX.js"></script>