<%--
    Document  addrole
    Created on Jan 31, 2013, 5:36:52 PM
    Author    Tommy Aji
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_role.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<style>
    .margin-chxbox {
        margin-left: 10px;
        margin-right: 4px;
    }
    #tbl-role td {
        padding: 7px 7px 7px 0px;
    }
    #tbl-role tr:nth-child(even) {
        background-color: #efefef8f;
    }
    #tbl-role {
        border-collapse: collapse;
        width: 100%;
    }
    #tbl-role th, td {
        /* border: 0.5px solid black;  */
        border: 0px solid rgba(0,0,0,0.2); 
        padding: 8px;
        text-align: left;
    }
     #tbl-role th {
        background-color: #f8f8f8ce; 
    }
    #tbl-role tr th {
        color: #87878799;
        text-align: center;
        font-size: 13px;
    }
    input[type=checkbox] {
        cursor: pointer;
    }
    .form-row label {
        cursor: pointer;
    }
</style>

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'ROLE:LIST'}">
            <div id="judul">Add Role
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'ROLE:LIST'}">
                        <a href="SCDataRoleList" class="srb3">Role List</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="tabs-1">
            <form id="form1" name="form1" method="post" action="SCDataRole">
                <input type="hidden" name="role_id" id="role_id" value="${dataRoleById.role_id}" />
                <div id="tabs-1" class="contens-addroles formBody">
                    <div class="form-row">
                        <span class="labelL">Role Name</span>
                        <input type="text" name="role_name" id="role_name" maxlength="255" value="<c:out value='${dataRoleById.role_name}' />" />
                    </div>
                    <div class="form-row"><span class="labelL">Role Enable</span>
                        <input type="checkbox" name="role_enable" id="role_enable"
                            <c:if test="${dataRoleById.role_enable == '1'}"> checked="true" </c:if> 
                            <c:forEach var="item" items="${role}">
                                <c:if test="${item == 'ADM:MAKER' && sessionScope.role_id != '1'}">
                                    onclick="return false;" 
                                    style="accent-color: #ccc;" 
                                </c:if>
                            </c:forEach>
                        />
                    </div>
                    <div class="form-row"><span class="labelL">Role Description</span>
                        <input type="text" name="role_desc" id="role_desc" maxlength="45" value="<c:out value="${dataRoleById.role_desc}" />" />
                    </div>
<!--                    <div class="form-row">
                        <span class="labelL">Type</span>
                        <label>Outgoing & Incoming <input type="radio" name="role_detail" id="role_detail" value="TYPE:OUTGOING_INCOMING" <c:forEach var="item" items="${list}"><c:if test="${item == 'TYPE:OUTGOING_INCOMING'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Outgoing <input type="radio" name="role_detail" id="role_detail" value="TYPE:OUTGOING" <c:forEach var="item" items="${list}"><c:if test="${item == 'TYPE:OUTGOING'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Incoming <input type="radio" name="role_detail" id="role_detail" value="TYPE:INCOMING" <c:forEach var="item" items="${list}"><c:if test="${item == 'TYPE:INCOMING'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>-->
                    
                    <div class="form-row">
                        <span class="labelL">Session timeout</span>
                        <input style=" background-color: #e0e0e0; color: #888; pointer-events: none;" readonly="true" type="text" value="<c:out value='${dataRoleById.timeout}' default='300000'/>" name="timeout" id="timeout" required /> 1 minutes = 1 * 60 * 1000
                    </div>
                    
                    <div class="form-row"><span class="labelL">Source</span>
                        <label><input type="checkbox" name="role_detail" id="role-msg-manual" value="SRC:MANUAL" <c:forEach var="item" items="${list}"><c:if test="${item == 'SRC:MANUAL'}"> checked="true" </c:if></c:forEach> >Manual </label>
                        <!--<label>Upload <input type="checkbox" name="role_detail" id="role_detail" value="SRC:UPLOAD"  /></label>-->
                        <label><input type="checkbox" name="role_detail" id="role-msg-fiorano" value="SRC:FIA" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'SRC:FIA'}"> checked="true" </c:if></c:forEach> >Fiorano </label>
                    </div>

                    <div class="form-row"><span class="labelL">Sub Role</span>
                        <label><input type="checkbox" name="role_detail" id="sub-checker" value="ADM:CHECKER" <c:forEach var="item" items="${list}"><c:if test="${item == 'ADM:CHECKER'}"> checked="true" </c:if></c:forEach> >Checker </label>
                        <label><input type="checkbox" name="role_detail" id="sub-maker" value="ADM:MAKER" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'ADM:MAKER'}"> checked="true" </c:if></c:forEach> >Maker </label>
                    </div>
                    
                    <div class="form-row"><span class="labelL">Role Reference </span>
                        <select name="" id="role-dflt" onchange="selectRole()">
                            <option value="role-0" id="role-0">--- Select Role ---</option>
                            <option value="role-adm-checker" id="role-adm-checker">Admin Checker</option>
                            <option value="role-adm-maker" id="role-adm-maker">Admin Maker</option>
                            <option value="role-user-checker" id="role-user-checker">User Checker</option>
                            <option value="role-user-maker" id="role-user-maker">User Maker</option>
                        </select>
                    </div>
                    
                    <hr>
                    <div class="form-row"></div>
                    
                    <table border="0" id="tbl-role" class="form-row">
                        <tr>
                            <th  style="width: 150px;">Menu</th>
                            <th style="width: 150px;">Sub Menu</th>
                            <th style="width: 250px;">Sub Menu</th>
                            <th>Sub Menu</th>
                        </tr>
<!--                        <tr>
                            <td valign="top">
                                <label class="labelL"><input type="checkbox" name="role_detail" id="menu:master" value="MENU:MASTER" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:MASTER'}"> checked="true" </c:if></c:forEach> >Master </label>
                            </td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="master-fia-path" value="FIAPATHCONF:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'FIAPATHCONF:LIST'}"> checked="true" </c:if></c:forEach> class="margin-chxbox">FIA Path Configuration </label>
                                <br><br>
                                <label><input type="checkbox" name="role_detail" id="master-fia-conf" value="FIACONF:LIST" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FIACONF:LIST'}"> checked="true" </c:if></c:forEach> >FIA Configuration </label>
                                <br><br>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>-->
                        <tr>
                            <td valign="top">
                                <label class="labelL"><input type="checkbox" name="role_detail" id="administrator" value="MENU:ADMINISTRATOR" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:ADMINISTRATOR'}"> checked="true" </c:if></c:forEach> >Administrator</label>
                            </td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="adm-role" value="ROLE:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'ROLE:LIST'}"> checked="true" </c:if></c:forEach> class="margin-chxbox">Role </label>
                                <br><br>
                                <label><input type="checkbox" name="role_detail" id="adm-list" value="USER:LIST" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'USER:LIST'}"> checked="true" </c:if></c:forEach> >User </label>
                                <br><br>
                                <label><input type="checkbox" name="role_detail" id="adm-tiering-limit" value="TIERING_LIMIT:LIST" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'TIERING_LIMIT:LIST'}"> checked="true" </c:if></c:forEach> >Tiering Limit </label>
                                <br><br>
                                <label><input type="checkbox" name="role_detail" id="adm-exclude-duplicate" value="ROLE:EXCDUPL" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'ROLE:EXCDUPL'}"> checked="true" </c:if></c:forEach> >Exclude Duplicate</label>
                                <br><br>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr valign="top">
                            <td>
                                <label><input type="checkbox" name="role_detail" id="duplicate" value="MENU:DUPLICATE" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:DUPLICATE'}"> checked="true" </c:if> </c:forEach> >Duplicate </label>
                            </td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="release-duplicate" value="FLOW:DUPL" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:DUPL'}"> checked="true" </c:if> </c:forEach>>List Duplicate </label>
                                <br><br>
                                <label><input type="checkbox" name="role_detail" id="release-dpl-cnf" value="FLOW:DUPL-CNF" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:DUPL-CNF'}"> checked="true" </c:if> </c:forEach> >Duplicate Confirmation </label>
                                <br><br>
                            </td>
                            <td>
                            </td>
                            <td></td>
                        </tr>
                        <tr valign="top">
                            <td>
                                <label><input type="checkbox" name="role_detail" id="menu-rejected" value="MENU:REJECTED" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:REJECTED'}"> checked="true" </c:if></c:forEach> >Rejected </label>
                            </td>
                            <td></td>
                            <td></td>
                            <td><br><br></td>
                        </tr>
                        <tr valign="top">
                            <td>
                                <label class="labelL"><input type="checkbox" name="role_detail" id="menu-create-msg" value="FLOW:CREATE" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:CREATE'}"> checked="true" </c:if></c:forEach> >Create Message </label>
                            </td>
                            <td><label class="labelL"><input type="checkbox" name="role_detail" id="menu-mt" value="MENU:MT" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:MT'}"> checked="true" </c:if></c:forEach> >MT </label></td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="menu-mt1" value="MSG:CAT1" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MSG:CAT1'}"> checked="true" </c:if></c:forEach> >Message Category 1 </label> 
                            </td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="menu-mt103" value="MT:103" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:103'}"> checked="true" </c:if></c:forEach> >103 </label> 
<!--                                <label><input type="checkbox" name="role_detail" id="menu-mt110" value="MT:110" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:110'}"> checked="true" </c:if></c:forEach> >110 </label> 
                                <label><input type="checkbox" name="role_detail" id="menu-mt111" value="MT:111" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:111'}"> checked="true" </c:if></c:forEach> >111 </label> 
                                <label><input type="checkbox" name="role_detail" id="menu-mt191" value="MT:191" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:191'}"> checked="true" </c:if></c:forEach> >191 </label> 
                                <label><input type="checkbox" name="role_detail" id="menu-mt192" value="MT:192" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:192'}"> checked="true" </c:if></c:forEach> >192 </label> 
                                <label><input type="checkbox" name="role_detail" id="menu-mt199" value="MT:199" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:199'}"> checked="true" </c:if></c:forEach> >199 </label> -->
                                <br><br>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td></td>
                            <td></td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="menu-mt2" value="MSG:CAT2" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MSG:CAT2'}"> checked="true" </c:if></c:forEach> >Message Category 2 </label>
                            </td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="menu-mt200" value="MT:200" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:200'}"> checked="true" </c:if></c:forEach> >200 </label>
                                <label><input type="checkbox" name="role_detail" id="menu-mt202" value="MT:202" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:202'}"> checked="true" </c:if></c:forEach> >202 </label>
                                <label><input type="checkbox" name="role_detail" id="menu-mt202cov" value="MT:202COV" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:202COV'}"> checked="true" </c:if></c:forEach> >202COV </label>
                                <br><br>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td></td>
                            <td>
                                <label class="labelL"><input type="checkbox" name="role_detail" id="menu-mx" value="MENU:MX" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:MX'}"> checked="true" </c:if></c:forEach>>MX </label>
                            </td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="menu-pacs" value="MENU:PACS" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:PACS'}"> checked="true" </c:if></c:forEach> >Payments Clearing and Settlement </label>
                            </td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="menu-pacs00400109" value="MX:pacs00400109" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00400109'}"> checked="true" </c:if></c:forEach> >PACS.004.001.09 </label>
                                <label><input type="checkbox" name="role_detail" id="menu-pacs00800108" value="MX:pacs00800108" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00800108'}"> checked="true" </c:if></c:forEach> >PACS.008.001.08 </label>
                                <label><input type="checkbox" name="role_detail" id="menu-pacs00900108" value="MX:pacs00900108" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00900108'}"> checked="true" </c:if></c:forEach> >PACS.009.001.08 </label>
                                <label><input type="checkbox" name="role_detail" id="menu-pacs00900108cov" value="MX:pacs00900108cov" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00900108cov'}"> checked="true" </c:if></c:forEach> >PACS.009.001.08COV </label>
                                <label><input type="checkbox" name="role_detail" id="menu-pacs00900108adv" value="MX:pacs00900108adv" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00900108adv'}"> checked="true" </c:if></c:forEach> >PACS.009.001.09ADV </label>
                                <br><br>
                            </td>
                        </tr>
<!--                        <tr valign="top">
                            <td></td>
                            <td></td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="menu-camt" value="MENU:CAMT" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:CAMT'}"> checked="true" </c:if></c:forEach> >Cash Management </label>
                            </td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="menu-camt05300108" value="MX:camt05300108" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt05300108'}"> checked="true" </c:if></c:forEach> />CAMT.053.001.08 </label>
                                <label><input type="checkbox" name="role_detail" id="menu-camt05500108" value="MX:camt05500108" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt05500108'}"> checked="true" </c:if></c:forEach> />CAMT.055.001.08 </label>
                                <label><input type="checkbox" name="role_detail" id="menu-camt05600108" value="MX:camt05600108" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt05600108'}"> checked="true" </c:if></c:forEach> />CAMT.056.001.08 </label>
                                <label><input type="checkbox" name="role_detail" id="menu-camt10600102" value="MX:camt10600102" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt10600102'}"> checked="true" </c:if></c:forEach> />CAMT.106.001.02 </label>
                                <label><input type="checkbox" name="role_detail" id="menu-camt10700101" value="MX:camt10700101" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt10700101'}"> checked="true" </c:if></c:forEach> />CAMT.107.001.01 </label>
                                <br><br>
                                <label><input type="checkbox" name="role_detail" id="menu-camt10800101" value="MX:camt10800101" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt10800101'}"> checked="true" </c:if></c:forEach> />CAMT.108.001.01 </label>  
                                <label><input type="checkbox" name="role_detail" id="menu-camt11000101" value="MX:camt11000101" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt11000101'}"> checked="true" </c:if></c:forEach> />CAMT.110.001.01 </label>  
                                <label><input type="checkbox" name="role_detail" id="menu-camt11100101" value="MX:camt11100101" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt11100101'}"> checked="true" </c:if></c:forEach> />CAMT.111.001.01 </label>  
                                <br><br>
                            </td>
                        </tr>-->
                        <tr>
                            <td rowspan="" valign="top">
                                <label><input type="checkbox" name="role_detail" id="menu-process" value="MENU:PROCESS" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:PROCESS'}"> checked="true" </c:if></c:forEach> >Process</label>
                            </td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="menu-msg-list" value="MENU:LIST_TRANSACTIONS" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:LIST_TRANSACTIONS'}"> checked="true" </c:if></c:forEach> >Message List </label>
                                <br><br>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td valign="top">
                                <label><input type="checkbox" name="role_detail" id="menu-incoming" value="TYPE:INCOMING" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'TYPE:INCOMING'}"> checked="true" </c:if></c:forEach> >Incoming </label>
                            </td>
                            <td colspan="2"> 
                                <label><input type="checkbox" name="role_detail" id="menu-inc-cvt" value="FLOW:INC-CVT" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-CVT'}"> checked="true" </c:if></c:forEach> >Incoming Convert </label>
                                <label><input type="checkbox" name="role_detail" id="menu-inc-resend-cnf" value="FLOW:RESEND-CNF" class="margin-chxbox"  <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:RESEND-CNF'}"> checked="true" </c:if></c:forEach> >Incoming Convert Confirmation </label>
                                <label><input type="checkbox" name="role_detail" id="menu-inc-aml" value="FLOW:INC-AML" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-AML'}"> checked="true" </c:if></c:forEach> >Incoming Reject AML </label>
                                <label><input type="checkbox" name="role_detail" id="menu-aml-term-in" value="FLOW:AML-TERMINATE-IN" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:AML-TERMINATE-IN'}"> checked="true" </c:if></c:forEach> >Incoming Reject AML Confirmation </label>
                                <label><input type="checkbox" name="role_detail" id="menu-inc-aml-failed" value="FLOW:INC-AML-FAILED" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-AML-FAILED'}"> checked="true" </c:if></c:forEach> >Incoming Resend to AML </label>
                                <br><br>
                                <label><input type="checkbox" name="role_detail" id="menu-aml-failed-cnf" value="FLOW:INC-AML-FAILED-CNF" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-AML-FAILED-CNF'}"> checked="true" </c:if></c:forEach> >Incoming Resend to AML Confirmation </label>
                                <label><input type="checkbox" name="role_detail" id="menu-unsettle-inc" value="FLOW:UNSETTLE-INC" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:UNSETTLE-INC'}"> checked="true" </c:if></c:forEach> >Incoming Resend to Channel </label>
                                <label><input type="checkbox" name="role_detail" id="menu-inc-resend-cnf" value="FLOW:INC-RESEND-CNF" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-RESEND-CNF'}"> checked="true" </c:if></c:forEach> >Incoming Resend to Channel Confirmation </label>
                                <label><input type="checkbox" name="role_detail" id="menu-settle" value="FLOW:SETTLE" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:SETTLE'}"> checked="true" </c:if></c:forEach> >Incoming Settle </label>
                                <br><br>
                            </td>
                            <td></td>
                        </tr>
                        <tr valign="top">
                            <td></td>
                            <td valign="top">
                                <label><input type="checkbox" name="role_detail" id="menu-outgoing" value="TYPE:OUTGOING" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'TYPE:OUTGOING'}"> checked="true" </c:if></c:forEach> >Outgoing </label>
                            </td>
                            <td colspan="2"> 
                                <label><input type="checkbox" name="role_detail" id="menu-mod" value="FLOW:MOD" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:MOD'}"> checked="true" </c:if></c:forEach> >Modification </label>
                                <label><input type="checkbox" name="role_detail" id="menu-ver" value="FLOW:VER" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:VER'}"> checked="true" </c:if></c:forEach> >Verification </label>
                                <label><input type="checkbox" name="role_detail" id="menu-auth" value="FLOW:AUTH" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:AUTH'}"> checked="true" </c:if></c:forEach> >Authorize </label>
                                <label><input type="checkbox" name="role_detail" id="menu-fia-failed" value="FLOW:FIA-FAILED" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:FIA-FAILED'}"> checked="true" </c:if></c:forEach> >Failed to Send to FIA </label>
                                <label><input type="checkbox" name="role_detail" id="menu-fia-failed-cnf" value="FLOW:FIA-FAILED-CNF" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:FIA-FAILED-CNF'}"> checked="true" </c:if></c:forEach> >Failed to Send to FIA Confirmation </label>
                                <br><br>
                                <label><input type="checkbox" name="role_detail" id="menu-unsettle-out" value="FLOW:UNSETTLE-OUT" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:UNSETTLE-OUT'}"> checked="true" </c:if></c:forEach> >Failed to Send to SAA </label>
                                <label><input type="checkbox" name="role_detail" id="menu-wait-saa-cnf" value="FLOW:WAITING-SAA-CNF" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:WAITING-SAA-CNF'}"> checked="true" </c:if></c:forEach> >Failed to Send to SAA Confirmation </label>
                                <label><input type="checkbox" name="role_detail" id="menu-wait-aml" value="FLOW:WAITING-AML" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:WAITING-AML'}"> checked="true" </c:if></c:forEach> >Reject AML </label>
                                <label><input type="checkbox" name="role_detail" id="menu-aml-term-out" value="FLOW:AML-TERMINATE-OUT" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:AML-TERMINATE-OUT'}"> checked="true" </c:if></c:forEach> >Reject AML Confirmation </label>
                                <br><br>
                                <label><input type="checkbox" name="role_detail" id="menu-aml-failed" value="FLOW:AML-FAILED" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:AML-FAILED'}"> checked="true" </c:if></c:forEach> >Failed to Send to AML </label>
                                <label><input type="checkbox" name="role_detail" id="menu-aml-failed-cnf" value="FLOW:AML-FAILED-CNF" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:AML-FAILED-CNF'}"> checked="true" </c:if></c:forEach> >Failed to Send to AML Confirmation </label>
                                <label><input type="checkbox" name="role_detail" id="menu-cvt-mod" value="FLOW:CVT-MOD" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:CVT-MOD'}"> checked="true" </c:if></c:forEach> >Modify Convert </label>
                                <label><input type="checkbox" name="role_detail" id="menu-cvt-ver" value="FLOW:CVT-VER" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:CVT-VER'}"> checked="true" </c:if></c:forEach> >Verify Convert </label>
                                <label><input type="checkbox" name="role_detail" id="menu-ack" value="FLOW:ACK" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:ACK'}"> checked="true" </c:if></c:forEach> >ACK </label>
                                <label><input type="checkbox" name="role_detail" id="menu-nack" value="FLOW:NACK" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:NACK'}"> checked="true" </c:if></c:forEach> >NACK </label>
                                <br><br>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <label><input type="checkbox" name="role_detail" id="menu-reporting" value="MENU:REPORTING" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:REPORTING'}"> checked="true" </c:if></c:forEach> >Reporting </label>
                            </td>
                            <td>
                                <label><input type="checkbox" name="role_detail" id="report-transaction" value="MENU:REPORT-TRX" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:REPORT-TRX'}"> checked="true" </c:if></c:forEach> >Transaction </label>
                                <br><br>
                                <label><input type="checkbox" name="role_detail" id="report-user" value="MENU:REPORT-USER" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:REPORT-USER'}"> checked="true" </c:if></c:forEach> >User </label>
                                <br><br>
                                <label><input type="checkbox" name="role_detail" id="report-audit-trail-user" value="MENU:REPORT-AUDIT-USER" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:REPORT-AUDIT-USER'}"> checked="true" </c:if></c:forEach> >Audit Trail User </label>
                                <br><br>
                                <label><input type="checkbox" name="role_detail" id="report-audit-trail-transaction" value="MENU:REPORT-AUDIT-TRX" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:REPORT-AUDIT-TRX'}"> checked="true" </c:if></c:forEach> >Audit Trail Transaction </label>
                            </td>
                            <td valign="top"></td>
                            <td></td>
                        </tr>
                        <tr >
                            <td>
                                <label><input type="checkbox" name="role_detail" id="menu-workflowlogs" value="MENU:WORKFLOW-LOGS" class="margin-chxbox" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:WORKFLOW-LOGS'}"> checked="true" </c:if></c:forEach> >Workflow Logs </label>
                            </td>
                            <td></td>
                            <td valign="top"></td>
                            <td></td>
                        </tr>
                    </table>

                    
                    <hr>
                    <hr>
                    
                    <!--=====================================================-->
                    
<!--                    <div class="form-row"><span class="labelL">Source</span>
                        <label>Manual <input type="checkbox" name="role_detail" id="role_detail" value="SRC:MANUAL" <c:forEach var="item" items="${list}"><c:if test="${item == 'SRC:MANUAL'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Upload <input type="checkbox" name="role_detail" id="role_detail" value="SRC:UPLOAD" <c:forEach var="item" items="${list}"><c:if test="${item == 'SRC:UPLOAD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Fiorano <input type="checkbox" name="role_detail" id="role_detail" value="SRC:FIA" <c:forEach var="item" items="${list}"><c:if test="${item == 'SRC:FIA'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>-->
<!--                    <div class="form-row"><span class="labelL">Flow</span>
                        <label>Reject <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:REJECT" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:REJECT'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Create <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:CREATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:CREATE'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Modify <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:MOD" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:MOD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Verify <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:VER" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:VER'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Authorize <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:AUTH" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:AUTH'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Failed to Send to FIA <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:FIA-FAILED" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:FIA-FAILED'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Failed to Send to FIA Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:FIA-FAILED-CNF" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:FIA-FAILED-CNF'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Failed to Send to SAA <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:UNSETTLE-OUT" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:UNSETTLE-OUT'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Failed to Send to SAA Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:WAITING-SAA-CNF" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:WAITING-SAA-CNF'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Reject AML <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:WAITING-AML" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:WAITING-AML'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Reject AML Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:AML-TERMINATE-OUT" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:AML-TERMINATE-OUT'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>-->
<!--                    <div class="form-row"><span class="labelL">&nbsp;</span>  
                        <label>Failed to Send to AML <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:AML-FAILED" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:AML-FAILED'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Failed to Send to AML Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:AML-FAILED-CNF" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:AML-FAILED-CNF'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Modify Convert <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:CVT-MOD" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:CVT-MOD'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Verify Convert <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:CVT-VER" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:CVT-VER'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Resend <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:TEXT" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:TEXT'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>ACK <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:ACK" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:ACK'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>NACK <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:NACK" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:NACK'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Print <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:PRINT" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:PRINT'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Incoming <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Incoming Transaction <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC'}"> checked="true" </c:if> </c:forEach> /></label>
                     </div>-->
<!--                    <div class="form-row"><span class="labelL">&nbsp;</span>
                        <label>Incoming Convert <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC-CVT" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-CVT'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Incoming Convert Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:RESEND-CNF" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:RESEND-CNF'}"> checked="true" </c:if> </c:forEach> /></label>
                    </div>-->
<!--                    <div class="form-row"><span class="labelL">&nbsp;</span>
                        <label>Incoming Reject AML <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC-AML" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-AML'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Incoming Reject AML Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:AML-TERMINATE-IN" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:AML-TERMINATE-IN'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Incoming Reject Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC-REJECT-CNF" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-REJECT-CNF'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Incoming Resend to AML <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC-AML-FAILED" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-AML-FAILED'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Incoming Resend to AML Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC-AML-FAILED-CNF" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-AML-FAILED-CNF'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Incoming Resend to Channel <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:UNSETTLE-INC" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:UNSETTLE-INC'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Incoming Resend to Channel Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC-RESEND-CNF" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-RESEND-CNF'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Incoming Un Settle <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:Un-Settle" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:Un-Settle'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Incoming Settle <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:SETTLE" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:SETTLE'}"> checked="true" </c:if> </c:forEach> /></label>
                    </div>-->
<!--                    <div class="form-row"><span class="labelL">&nbsp;</span>
                        <label>Release Duplicate <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:DUPL" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:DUPL'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Release Duplicate Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:DUPL-CNF" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:DUPL-CNF'}"> checked="true" </c:if> </c:forEach> /></label>
                    </div> -->
<!--                    <div class="form-row"><span class="labelL">Menu</span>
                        <label>Dashboard <input type="checkbox" name="role_detail" id="role_detail" value="MENU:DASHBOARD" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:DASHBOARD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Administrator <input type="checkbox" name="role_detail" id="role_detail" value="MENU:MASTER" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:MASTER'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Duplicate <input type="checkbox" name="role_detail" id="role_detail" value="MENU:DUPLICATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:DUPLICATE'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Rejected <input type="checkbox" name="role_detail" id="role_detail" value="MENU:REJECTED" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:REJECTED'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>List of Transactions <input type="checkbox" name="role_detail" id="role_detail" value="MENU:LIST_TRANSACTIONS" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:LIST_TRANSACTIONS'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Reporting <input type="checkbox" name="role_detail" id="role_detail" value="MENU:REPORTING" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:REPORTING'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>House Keeping <input type="checkbox" name="role_detail" id="role_detail" value="MENU:HOUSEKEEPING" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:HOUSEKEEPING'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Contact <input type="checkbox" name="role_detail" id="role_detail" value="MENU:CONTACT" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:CONTACT'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>-->
<!--                    <div class="form-row">
                        <span class="labelL">Session timeout</span>
                        <input style=" background-color: #e0e0e0; color: #888; pointer-events: none;" readonly="true" type="text" value="<c:out value='${dataRoleById.timeout}' default='300000'/>" name="timeout" id="timeout" required /> 1 minutes = 1 * 60 * 1000
                    </div>-->
<!--                    <div class="form-row">
                        <span class="labelL"> Daily Outgoing Transactions</span>
                        <label>List <input type="checkbox" name="role_detail" id="role_detail" value="DOT:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'DOT:LIST'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>-->
<!--                    <div class="form-row">
                        <span class="labelL">Message Queue</span>
                        <label>List <input type="checkbox" name="role_detail" id="role_detail" value="MT_QUEUE:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT_QUEUE:LIST'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Add <input type="checkbox" name="role_detail" id="role_detail" value="MT_QUEUE:ADD" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT_QUEUE:ADD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>View <input type="checkbox" name="role_detail" id="role_detail" value="MT_QUEUE:VIEW" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT_QUEUE:VIEW'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Update <input type="checkbox" name="role_detail" id="role_detail" value="MT_QUEUE:UPDATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT_QUEUE:UPDATE'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>-->
<!--                    <div class="form-row">
                        <span class="labelL">BIC</span>
                        <label>List <input type="checkbox" name="role_detail" id="role_detail" value="MEMBER_CODE:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'MEMBER_CODE:LIST'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Add <input type="checkbox" name="role_detail" id="role_detail" value="MEMBER_CODE:ADD" <c:forEach var="item" items="${list}"><c:if test="${item == 'MEMBER_CODE:ADD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>View <input type="checkbox" name="role_detail" id="role_detail" value="MEMBER_CODE:VIEW" <c:forEach var="item" items="${list}"><c:if test="${item == 'MEMBER_CODE:VIEW'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Update <input type="checkbox" name="role_detail" id="role_detail" value="MEMBER_CODE:UPDATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'MEMBER_CODE:UPDATE'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Approval <input type="checkbox" name="role_detail" id="role_detail" value="MEMBER_CODE:APPROVAL" <c:forEach var="item" items="${list}"><c:if test="${item == 'MEMBER_CODE:APPROVAL'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>-->

<!--                    <div class="form-row">
                        <span class="labelL">FIA Config</span>
                        <label>List <input type="checkbox" name="role_detail" id="role_detail" value="FIACONF:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'FIACONF:LIST'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Add <input type="checkbox" name="role_detail" id="role_detail" value="FIACONF:ADD" <c:forEach var="item" items="${list}"><c:if test="${item == 'FIACONF:ADD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>View <input type="checkbox" name="role_detail" id="role_detail" value="FIACONF:VIEW" <c:forEach var="item" items="${list}"><c:if test="${item == 'FIACONF:VIEW'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Update <input type="checkbox" name="role_detail" id="role_detail" value="FIACONF:UPDATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'FIACONF:UPDATE'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Approval <input type="checkbox" name="role_detail" id="role_detail" value="FIACONF:APPROVAL" <c:forEach var="item" items="${list}"><c:if test="${item == 'FIACONF:APPROVAL'}"> checked="true" </c:if></c:forEach></label>
                    </div>      
                    <div class="form-row">
                        <span class="labelL">FIA Path Config</span>
                        <label>List <input type="checkbox" name="role_detail" id="role_detail" value="FIAPATHCONF:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'FIAPATHCONF:LIST'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Add <input type="checkbox" name="role_detail" id="role_detail" value="FIAPATHCONF:ADD" <c:forEach var="item" items="${list}"><c:if test="${item == 'FIAPATHCONF:ADD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>View <input type="checkbox" name="role_detail" id="role_detail" value="FIAPATHCONF:VIEW" <c:forEach var="item" items="${list}"><c:if test="${item == 'FIAPATHCONF:VIEW'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Update <input type="checkbox" name="role_detail" id="role_detail" value="FIAPATHCONF:UPDATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'FIAPATHCONF:UPDATE'}"> checked="true" </c:if></c:forEach> /></label>
                    </div> -->
<!--                    <div class="form-row">
                        <span class="labelL">User</span>
                        <label>List <input type="checkbox" name="role_detail" id="role_detail" value="USER:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'USER:LIST'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Add <input type="checkbox" name="role_detail" id="role_detail" value="USER:ADD" <c:forEach var="item" items="${list}"><c:if test="${item == 'USER:ADD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>View <input type="checkbox" name="role_detail" id="role_detail" value="USER:VIEW" <c:forEach var="item" items="${list}"><c:if test="${item == 'USER:VIEW'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Update <input type="checkbox" name="role_detail" id="role_detail" value="USER:UPDATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'USER:UPDATE'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>User Disable Permanent List <input type="checkbox" name="role_detail" id="role_detail" value="USER:DISABLEPERMANENT" <c:forEach var="item" items="${list}"><c:if test="${item == 'USER:DISABLEPERMANENT'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>-->
<!--                    <div class="form-row"><span class="labelL">Role</span>
                        <label>List <input type="checkbox" name="role_detail" id="role_detail" value="ROLE:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'ROLE:LIST'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Add <input type="checkbox" name="role_detail" id="role_detail" value="ROLE:ADD" <c:forEach var="item" items="${list}"><c:if test="${item == 'ROLE:ADD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>View <input type="checkbox" name="role_detail" id="role_detail" value="ROLE:VIEW" <c:forEach var="item" items="${list}"><c:if test="${item == 'ROLE:VIEW'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Update <input type="checkbox" name="role_detail" id="role_detail" value="ROLE:UPDATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'ROLE:UPDATE'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Role Disable Permanent List <input type="checkbox" name="role_detail" id="role_detail" value="ROLE:DISABLEPERMANENT" <c:forEach var="item" items="${list}"><c:if test="${item == 'ROLE:DISABLEPERMANENT'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>-->
<!--                    <div class="form-row"><span class="labelL">Exclude Duplicate</span>
                        <label>Master Exclude Duplicate <input type="checkbox" name="role_detail" id="role_detail" value="ROLE:EXCDUPL" <c:forEach var="item" items="${list}"><c:if test="${item == 'ROLE:EXCDUPL'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>-->
<!--                    <div class="form-row"><span class="labelL">Message Category 1</span>
                         <label>101 <input type="checkbox" name="role_detail" id="role_detail" value="MT:101" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:101'}"> checked="true" </c:if></c:forEach> /></label> 
                         <%--<label>102 <input type="checkbox" name="role_detail" id="role_detail" value="MT:102" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:102'}"> checked="true" </c:if></c:forEach> /></label>--%> 
                        <label>103 <input type="checkbox" name="role_detail" id="role_detail" value="MT:103" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:103'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>110 <input type="checkbox" name="role_detail" id="role_detail" value="MT:110" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:110'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>111 <input type="checkbox" name="role_detail" id="role_detail" value="MT:111" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:111'}"> checked="true" </c:if></c:forEach> /></label>
                        <!-- <label>190 <input type="checkbox" name="role_detail" id="role_detail" value="MT:190" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:190'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <label>191 <input type="checkbox" name="role_detail" id="role_detail" value="MT:191" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:191'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>192 <input type="checkbox" name="role_detail" id="role_detail" value="MT:192" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:192'}"> checked="true" </c:if></c:forEach> /></label>
                        <!-- <label>195 <input type="checkbox" name="role_detail" id="role_detail" value="MT:195" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:195'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>196 <input type="checkbox" name="role_detail" id="role_detail" value="MT:196" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:196'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>198 <input type="checkbox" name="role_detail" id="role_detail" value="MT:198" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:198'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <label>199 <input type="checkbox" name="role_detail" id="role_detail" value="MT:199" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:199'}"> checked="true" </c:if></c:forEach> /></label>

                    </div>
                            
                    <!--MT 2XX-->
                    <div class="form-row"><span class="labelL">Message Category 2</span>
                        <label>200 <input type="checkbox" name="role_detail" id="role_detail" value="MT:200" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:200'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>202 <input type="checkbox" name="role_detail" id="role_detail" value="MT:202" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:202'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>202COV <input type="checkbox" name="role_detail" id="role_detail" value="MT:202COV" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:202COV'}"> checked="true" </c:if></c:forEach> /></label>
                        <!--<label>210 <input type="checkbox" name="role_detail" id="role_detail" value="MT:210" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:210'}"> checked="true" </c:if></c:forEach> /></label>--> 
                        <!-- <label>290 <input type="checkbox" name="role_detail" id="role_detail" value="MT:290" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:290'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>291 <input type="checkbox" name="role_detail" id="role_detail" value="MT:291" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:291'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>292 <input type="checkbox" name="role_detail" id="role_detail" value="MT:292" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:292'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>295 <input type="checkbox" name="role_detail" id="role_detail" value="MT:295" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:295'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>296 <input type="checkbox" name="role_detail" id="role_detail" value="MT:296" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:296'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>298 <input type="checkbox" name="role_detail" id="role_detail" value="MT:298" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:298'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <label>299 <input type="checkbox" name="role_detail" id="role_detail" value="MT:299" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:299'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>
                    
                    <!--MT 3XX-->
                    <div class="form-row"><span class="labelL">Message Category 3</span>
                        <label>300 <input type="checkbox" name="role_detail" id="role_detail" value="MT:300" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:300'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>320 <input type="checkbox" name="role_detail" id="role_detail" value="MT:320" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:320'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>
                    
                    <!--MT 4XX-->
                    <div class="form-row"><span class="labelL">Message Category 3</span>
                        <label>400 <input type="checkbox" name="role_detail" id="role_detail" value="MT:400" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:400'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>412 <input type="checkbox" name="role_detail" id="role_detail" value="MT:412" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:412'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>499 <input type="checkbox" name="role_detail" id="role_detail" value="MT:499" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:499'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>
                    
                    <!-- MT 7XX-->
                    <div class="form-row"><span class="labelL">Message Category 7</span>
                        <label>700 <input type="checkbox" name="role_detail" id="role_detail" value="MT:700" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:700'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>701 <input type="checkbox" name="role_detail" id="role_detail" value="MT:701" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:701'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>707 <input type="checkbox" name="role_detail" id="role_detail" value="MT:707" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:707'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>708 <input type="checkbox" name="role_detail" id="role_detail" value="MT:708" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:708'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>710 <input type="checkbox" name="role_detail" id="role_detail" value="MT:710" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:710'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>711 <input type="checkbox" name="role_detail" id="role_detail" value="MT:711" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:711'}"> checked="true" </c:if></c:forEach> /></label>
                        
                        <label>720 <input type="checkbox" name="role_detail" id="role_detail" value="MT:720" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:720'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>730 <input type="checkbox" name="role_detail" id="role_detail" value="MT:730" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:730'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>734 <input type="checkbox" name="role_detail" id="role_detail" value="MT:734" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:734'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>740 <input type="checkbox" name="role_detail" id="role_detail" value="MT:740" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:740'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>742 <input type="checkbox" name="role_detail" id="role_detail" value="MT:742" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:742'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>747 <input type="checkbox" name="role_detail" id="role_detail" value="MT:747" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:747'}"> checked="true" </c:if></c:forEach> /></label>
                        
                        <label>750 <input type="checkbox" name="role_detail" id="role_detail" value="MT:750" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:750'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>752 <input type="checkbox" name="role_detail" id="role_detail" value="MT:752" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:752'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>754 <input type="checkbox" name="role_detail" id="role_detail" value="MT:754" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:754'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>756 <input type="checkbox" name="role_detail" id="role_detail" value="MT:756" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:756'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>759 <input type="checkbox" name="role_detail" id="role_detail" value="MT:759" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:759'}"> checked="true" </c:if></c:forEach> /></label>
                        
                        <label>760 <input type="checkbox" name="role_detail" id="role_detail" value="MT:760" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:760'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>761 <input type="checkbox" name="role_detail" id="role_detail" value="MT:761" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:761'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>767 <input type="checkbox" name="role_detail" id="role_detail" value="MT:767" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:767'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>799 <input type="checkbox" name="role_detail" id="role_detail" value="MT:799" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:799'}"> checked="true" </c:if></c:forEach> /></label>
                    
                    </div>
                    
                    <!--MT 9XX-->
                    <div class="form-row"><span class="labelL">Message Category 9</span>
                        <label>940 <input type="checkbox" name="role_detail" id="role_detail" value="MT:940" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:940'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>950 <input type="checkbox" name="role_detail" id="role_detail" value="MT:950" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:950'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>
                    
                            <!--<div class="form-row">
                                                                 <div class="form-row"><span class="labelL">Message Category 3</span>
                                                                     <label>300 <input type="checkbox" name="role_detail" id="role_detail" value="MT:300" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:300'}"> checked="true" </c:if></c:forEach> /></label>
                                                             <label>320 <input type="checkbox" name="role_detail" id="role_detail" value="MT:320" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:320'}"> checked="true" </c:if></c:forEach> /></label>
                                                                 </div>-->
                            <!-- <%--<span class="labelL">Message Category  3</span>
                    <label>390 <input type="checkbox" name="role_detail" id="role_detail" value="MT:390" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:390'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>391 <input type="checkbox" name="role_detail" id="role_detail" value="MT:391" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:391'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>392 <input type="checkbox" name="role_detail" id="role_detail" value="MT:392" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:392'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>395 <input type="checkbox" name="role_detail" id="role_detail" value="MT:395" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:395'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>396 <input type="checkbox" name="role_detail" id="role_detail" value="MT:396" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:396'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>398 <input type="checkbox" name="role_detail" id="role_detail" value="MT:398" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:398'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>399 <input type="checkbox" name="role_detail" id="role_detail" value="MT:399" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:399'}"> checked="true" </c:if></c:forEach> /></label>
                    <br/>--%> -->
                    <!--<span class="labelL">Message Category 4</span>-->
<!--                        <label>400 <input type="checkbox" name="role_detail" id="role_detail" value="MT:400" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:400'}"> checked="true" </c:if></c:forEach> /></label>
                <label>410 <input type="checkbox" name="role_detail" id="role_detail" value="MT:410" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:410'}"> checked="true" </c:if></c:forEach> /></label>
                <label>412 <input type="checkbox" name="role_detail" id="role_detail" value="MT:412" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:412'}"> checked="true" </c:if></c:forEach> /></label>
                <label>416 <input type="checkbox" name="role_detail" id="role_detail" value="MT:416" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:416'}"> checked="true" </c:if></c:forEach> /></label>
                <label>420 <input type="checkbox" name="role_detail" id="role_detail" value="MT:420" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:420'}"> checked="true" </c:if></c:forEach> /></label>
                <label>422 <input type="checkbox" name="role_detail" id="role_detail" value="MT:422" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:422'}"> checked="true" </c:if></c:forEach> /></label>
                <label>430 <input type="checkbox" name="role_detail" id="role_detail" value="MT:430" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:430'}"> checked="true" </c:if></c:forEach> /></label>
                <label>456 <input type="checkbox" name="role_detail" id="role_detail" value="MT:456" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:456'}"> checked="true" </c:if></c:forEach> /></label>
                <label>490 <input type="checkbox" name="role_detail" id="role_detail" value="MT:490" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:490'}"> checked="true" </c:if></c:forEach> /></label>
                <label>491 <input type="checkbox" name="role_detail" id="role_detail" value="MT:491" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:491'}"> checked="true" </c:if></c:forEach> /></label>
                <label>492 <input type="checkbox" name="role_detail" id="role_detail" value="MT:492" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:492'}"> checked="true" </c:if></c:forEach> /></label>-->
                    <%--<label>496 <input type="checkbox" name="role_detail" id="role_detail" value="MT:496" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:496'}"> checked="true" </c:if></c:forEach> /></label>--%>
<!--                        <label>499 <input type="checkbox" name="role_detail" id="role_detail" value="MT:499" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:499'}"> checked="true" </c:if></c:forEach> /></label>
                </div>-->
                            <!-- <div class="form-row">
                                <span class="labelL">Message Category 7</span>
                                <label>700 <input type="checkbox" name="role_detail" id="role_detail" value="MT:700" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:700'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>701 <input type="checkbox" name="role_detail" id="role_detail" value="MT:701" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:701'}"> checked="true" </c:if></c:forEach> /></label>
                    <%--<label>705 <input type="checkbox" name="role_detail" id="role_detail" value="MT:705" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:705'}"> checked="true" </c:if></c:forEach> /></label>
                    --%><label>707 <input type="checkbox" name="role_detail" id="role_detail" value="MT:707" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:707'}"> checked="true" </c:if></c:forEach> /></label>
                    <%--<label>708 <input type="checkbox" name="role_detail" id="role_detail" value="MT:708" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:708'}"> checked="true" </c:if></c:forEach> /></label>
                    --%><label>710 <input type="checkbox" name="role_detail" id="role_detail" value="MT:710" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:710'}"> checked="true" </c:if></c:forEach> /></label>
                    <%--<label>711 <input type="checkbox" name="role_detail" id="role_detail" value="MT:711" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:711'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>720 <input type="checkbox" name="role_detail" id="role_detail" value="MT:720" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:720'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>721 <input type="checkbox" name="role_detail" id="role_detail" value="MT:721" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:721'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>730 <input type="checkbox" name="role_detail" id="role_detail" value="MT:730" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:730'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>732 <input type="checkbox" name="role_detail" id="role_detail" value="MT:732" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:732'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>734 <input type="checkbox" name="role_detail" id="role_detail" value="MT:734" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:734'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>740 <input type="checkbox" name="role_detail" id="role_detail" value="MT:740" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:740'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>742 <input type="checkbox" name="role_detail" id="role_detail" value="MT:742" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:742'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>744 <input type="checkbox" name="role_detail" id="role_detail" value="MT:744" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:744'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>747 <input type="checkbox" name="role_detail" id="role_detail" value="MT:747" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:747'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>750 <input type="checkbox" name="role_detail" id="role_detail" value="MT:750" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:750'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>752 <input type="checkbox" name="role_detail" id="role_detail" value="MT:752" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:752'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>754 <input type="checkbox" name="role_detail" id="role_detail" value="MT:754" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:754'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>756 <input type="checkbox" name="role_detail" id="role_detail" value="MT:756" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:756'}"> checked="true" </c:if></c:forEach> /></label>
                    <label>759 <input type="checkbox" name="role_detail" id="role_detail" value="MT:759" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:759'}"> checked="true" </c:if></c:forEach> /></label>
<label>799 <input type="checkbox" name="role_detail" id="role_detail" value="MT:799" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:799'}"> checked="true" </c:if></c:forEach> /></label--%>
                <label>760 <input type="checkbox" name="role_detail" id="role_detail" value="MT:760" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:760'}"> checked="true" </c:if></c:forEach> /></label>
                <label>761 <input type="checkbox" name="role_detail" id="role_detail" value="MT:761" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:761'}"> checked="true" </c:if></c:forEach> /></label>
                <label>765 <input type="checkbox" name="role_detail" id="role_detail" value="MT:765" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:765'}"> checked="true" </c:if></c:forEach> /></label>
                <label>767 <input type="checkbox" name="role_detail" id="role_detail" value="MT:767" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:767'}"> checked="true" </c:if></c:forEach> /></label>
                <label>769 <input type="checkbox" name="role_detail" id="role_detail" value="MT:769" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:769'}"> checked="true" </c:if></c:forEach> /></label>
                <label>799 <input type="checkbox" name="role_detail" id="role_detail" value="MT:799" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:799'}"> checked="true" </c:if></c:forEach> /></label>
                    </div> -->

                            <!-- <div class="form-row"><span class="labelL">Message Category 9</span>
                                                <label>900 <input type="checkbox" name="role_detail" id="role_detail" value="MT:900" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:900'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>910 <input type="checkbox" name="role_detail" id="role_detail" value="MT:910" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:910'}"> checked="true" </c:if></c:forEach> /></label>
                                            <label>920 <input type="checkbox" name="role_detail" id="role_detail" value="MT:920" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:920'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>940 <input type="checkbox" name="role_detail" id="role_detail" value="MT:940" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:940'}"> checked="true" </c:if></c:forEach> /></label>
                                            <label>941 <input type="checkbox" name="role_detail" id="role_detail" value="MT:941" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:941'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>942 <input type="checkbox" name="role_detail" id="role_detail" value="MT:942" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:942'}"> checked="true" </c:if></c:forEach> /></label>  
                        <label>950 <input type="checkbox" name="role_detail" id="role_detail" value="MT:950" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:950'}"> checked="true" </c:if></c:forEach> /></label>
                            </div><div class="form-row"><span class="labelL">&nbsp;</span>

                                                    <label>985 <input type="checkbox" name="role_detail" id="role_detail" value="MT:985" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:985'}"> checked="true" </c:if></c:forEach> /></label>
                                                    <label>986 <input type="checkbox" name="role_detail" id="role_detail" value="MT:986" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:986'}"> checked="true" </c:if></c:forEach> /></label>
                                                    <label>990 <input type="checkbox" name="role_detail" id="role_detail" value="MT:990" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:990'}"> checked="true" </c:if></c:forEach> /></label>
                                                    <label>991 <input type="checkbox" name="role_detail" id="role_detail" value="MT:991" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:991'}"> checked="true" </c:if></c:forEach> /></label>
                                                    <label>992 <input type="checkbox" name="role_detail" id="role_detail" value="MT:992" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:992'}"> checked="true" </c:if></c:forEach> /></label>
                                                    <label>995 <input type="checkbox" name="role_detail" id="role_detail" value="MT:995" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:995'}"> checked="true" </c:if></c:forEach> /></label>
                                                    <label>996 <input type="checkbox" name="role_detail" id="role_detail" value="MT:996" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:996'}"> checked="true" </c:if></c:forEach> /></label>

                                                    <label>998 <input type="checkbox" name="role_detail" id="role_detail" value="MT:998" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:998'}"> checked="true" </c:if></c:forEach> /></label>--%>
                        <!--<label>999 <input type="checkbox" name="role_detail" id="role_detail" value="MT:999" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:999'}"> checked="true" </c:if></c:forEach> /></label>-->
                            <!--</div>-->

<!--                        <div class="form-row"><span class="labelL">Payment Clearing and Settlement</span>
                        <label>PACS.004.001.09 <input type="checkbox" name="role_detail" id="role_detail" value="MX:pacs00400109" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00400109'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>PACS.008.001.08 <input type="checkbox" name="role_detail" id="role_detail" value="MX:pacs00800108" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00800108'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>PACS.009.001.08 <input type="checkbox" name="role_detail" id="role_detail" value="MX:pacs00900108" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00900108'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>PACS.009.001.08COV <input type="checkbox" name="role_detail" id="role_detail" value="MX:pacs00900108cov" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00900108cov'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>PACS.009.001.09ADV <input type="checkbox" name="role_detail" id="role_detail" value="MX:pacs00900108adv" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00900108adv'}"> checked="true" </c:if></c:forEach> /></label>
                        </div>-->
<!--                        <div class="form-row"><span class="labelL">Cash Management</span>
                        <label>CAMT.053.001.08 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt05300108" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt05300108'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>CAMT.055.001.08 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt05500108" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt05500108'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>CAMT.056.001.08 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt05600108" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt05600108'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>CAMT.106.001.02 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt10600102" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt10600102'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>CAMT.107.001.01 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt10700101" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt10700101'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>CAMT.108.001.01 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt10800101" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt10800101'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>CAMT.110.001.01 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt11000101" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt11000101'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>CAMT.111.001.01 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt11100101" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt11100101'}"> checked="true" </c:if></c:forEach> /></label>
                        </div>
                </div> 
                            <!-- <div class="form-row">
                                <span class="labelL">List Template</span>
                                <label>Create <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:LTCREATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:LTCREATE'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Update <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:LTUPDATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:LTUPDATE'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Disable <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:LTDELETE" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:LTDELETE'}"> checked="true" </c:if></c:forEach> /></label>
                            </div> -->

                        <!--</div>-->
                        <!--                <div class="form-row"><span class="labelL">&nbsp;</span>-->
                        <c:set var="roleID" value="${param.role_id != null ? param.role_id : ''}" />
                        <div class="form-row-action">
                        <c:choose>
                            <c:when test="${sessionScope.role_id == '1'}">
                                <input type="submit" name="submit" id="submit" value="Save" />
                                <c:forEach var="item" items="${role}">
                                <c:if test="${(item == 'ADM:CHECKER' && not empty param.role_id)}">
                                        <input type="button" name="delete_role" id="delete_role" value="Disable Permanent" />
                                </c:if>
                            </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${roleID == '1' && sessionScope.role_id != '1'}">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="submit" name="submit" id="submit" value="Save" />
                                        <c:forEach var="item" items="${role}">
                                            <c:if test="${(item == 'ADM:CHECKER' && not empty param.role_id)}">
                                                    <input type="button" name="delete_role" id="delete_role" value="Disable Permanent" />
                                            </c:if>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                            
                            <c:forEach var="item" items="${role}">
                                <c:if test="${(item == 'ADM:CHECKER' && not empty param.role_id)}">
                                        <!--<input type="button" name="delete_role" id="delete_role" value="Disable Permanent" />-->
                                </c:if>
                            </c:forEach>
                                        
                            <% if(null == request.getParameter("role_id")) { %>
                                <input type="reset" name="reset" id="reset" value="Reset" />
                            <% } %>
                            <input type="button" name="back" id="back" value="Back" />
                        </div>
                    </form>
            <div id="dialog"></div>
        </div>
        </c:if>
    </c:forEach>
</div>
<!--<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>-->

<c:if test="${sessionScope.role_id != '1'}">
    <script> //if klau bukan super admin tampilkan script ini
        const checker = document.getElementById('sub-checker');
        const maker = document.getElementById('sub-maker');
    
        checker.addEventListener('change', function() {
            if (this.checked) maker.checked = false;
        });
    
        maker.addEventListener('change', function() {
            if (this.checked) checker.checked = false;
        });
    </script>
</c:if>
    
    
<script>
    
    document.addEventListener("DOMContentLoaded", function () {
//        selectRole();
    });
    
    function selectAdminMaker() {
        const adminMaker = [
            { id: "sub-maker" },
            { id: "administrator" },
            { id: "adm-role" },
            { id: "adm-list" },
            { id: "adm-tiering-limit" },
            { id: "adm-exclude-duplicate" },
            { id: "menu-rejected" },
            { id: "menu-mt103" },
            { id: "menu-mt200" },
            { id: "menu-mt202" },
            { id: "menu-mt202cov" },
            { id: "menu-pacs00400109" },
            { id: "menu-pacs00800108" },
            { id: "menu-pacs00900108" },
            { id: "menu-pacs00900108cov" },
            { id: "menu-pacs00900108adv" },
            { id: "menu-process" },
            { id: "menu-msg-list" },
            { id: "menu-reporting" },
            { id: "report-transaction" },
            { id: "report-user" },
            { id: "report-audit-trail-user" },
            { id: "report-audit-trail-transaction" },
        ];

        adminMaker.forEach(item => selectMenu(item.id));
    }

    function selectAdminChecker() {
        const adminChecker = [
            { id: "sub-checker" },
            { id: "administrator" },
            { id: "adm-role" },
            { id: "adm-list" },
            { id: "adm-tiering-limit" },
            { id: "adm-exclude-duplicate" },
            { id: "menu-rejected" },
            { id: "menu-mt103" },
            { id: "menu-mt200" },
            { id: "menu-mt202" },
            { id: "menu-mt202cov" },
            { id: "menu-pacs00400109" },
            { id: "menu-pacs00800108" },
            { id: "menu-pacs00900108" },
            { id: "menu-pacs00900108cov" },
            { id: "menu-pacs00900108adv" },
            { id: "menu-process" },
            { id: "menu-msg-list" },
            { id: "menu-reporting" },
            { id: "report-transaction" },
            { id: "report-user" },
            { id: "report-audit-trail-user" },
            { id: "report-audit-trail-transaction" },
        ];

        adminChecker.forEach(item => selectMenu(item.id));
    }

    function selectUserChecker() {
        const userChecker = [
            { id: "role-msg-manual" },
            { id: "role-msg-fiorano" },
            { id: "duplicate" },
            { id: "release-dpl-cnf" },
            { id: "menu-rejected" },
            { id: "menu-mt103" },
            { id: "menu-mt200" },
            { id: "menu-mt202" },
            { id: "menu-mt202cov" },
            { id: "menu-pacs00400109" },
            { id: "menu-pacs00800108" },
            { id: "menu-pacs00900108" },
            { id: "menu-pacs00900108cov" },
            { id: "menu-pacs00900108adv" },
            { id: "menu-process" },
            { id: "menu-msg-list" },
            { id: "menu-incoming" },
            { id: "menu-inc-resend-cnf" },
            { id: "menu-aml-term-in" },
            { id: "menu-aml-failed-cnf" },
            { id: "menu-inc-resend-cnf" },
            { id: "menu-settle" },
            { id: "menu-outgoing" },
            { id: "menu-ver" },
            { id: "menu-auth" },
            { id: "menu-fia-failed-cnf" },
            { id: "menu-wait-saa-cnf" },
            { id: "menu-aml-term-out" },
            { id: "menu-aml-failed-cnf" },
            { id: "menu-cvt-ver" },
            { id: "menu-ack" },
            { id: "menu-nack" },
            { id: "menu-reporting" },
            { id: "report-transaction" },
        ];

        userChecker.forEach(item => selectMenu(item.id));
    }
    
    
    function selectUserMaker() {
        const userMaker = [
            { id: "role-msg-manual" },
            { id: "role-msg-fiorano" },
            { id: "duplicate" },
            { id: "release-duplicate" },
            { id: "menu-rejected" },
            { id: "menu-create-msg" },
            { id: "menu-mt" },
            { id: "menu-mt1" },
            { id: "menu-mt103" },
            { id: "menu-mt2" },
            { id: "menu-mt200" },
            { id: "menu-mt202" },
            { id: "menu-mt202cov" },
            { id: "menu-mx" },
            { id: "menu-pacs" },
            { id: "menu-pacs00400109" },
            { id: "menu-pacs00800108" },
            { id: "menu-pacs00900108" },
            { id: "menu-pacs00900108cov" },
            { id: "menu-pacs00900108adv" },
            { id: "menu-process" },
            { id: "menu-msg-list" },
            { id: "menu-incoming" },
            { id: "menu-inc-cvt" },
            { id: "menu-inc-aml" },
            { id: "menu-inc-aml-failed" },
            { id: "menu-unsettle-inc" },
            { id: "menu-settle" },
            { id: "menu-outgoing" },
            { id: "menu-mod" },
            { id: "menu-fia-failed" },
            { id: "menu-unsettle-out" },
            { id: "menu-wait-aml" },
            { id: "menu-aml-failed" },
            { id: "menu-cvt-mod" },
            { id: "menu-ack" },
            { id: "menu-nack" },
            { id: "menu-reporting" },
            { id: "report-transaction" },
        ];

//        userMaker.forEach(selectMenu);
        userMaker.forEach(item => selectMenu(item.id));
    }


    function resetcheck() {
        document.querySelectorAll('input[type=checkbox]').forEach(cb => cb.checked = false);
        document.querySelectorAll('input[type=radio]').forEach(rb => rb.checked = false);
    }

    function selectMenu(elementId) {
        const elmen = document.getElementById(elementId);
        if (elmen) {  
            elmen.checked = true;
        } else {
            console.log("Element not found:", elementId);
        }
    }
    

    
    
    
    function selectRole() {
        let role_dflt = document.getElementById("role-dflt").value;

        resetcheck();
        
        if (role_dflt == "role-0") {
            resetcheck();
        }

        if(role_dflt == "role-adm-checker") {
            selectAdminChecker();
        } else if (role_dflt == "role-adm-maker") {
            selectAdminMaker();
        } else if (role_dflt == "role-user-checker") {
            selectUserChecker();
        } else if (role_dflt == "role-user-maker") {
            selectUserMaker();
        }

    }
</script>