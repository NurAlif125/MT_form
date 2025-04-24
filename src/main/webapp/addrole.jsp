<%--
    Document  addrole
    Created on Jan 31, 2013, 5:36:52 PM
    Author    Tommy Aji
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_role.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'ROLE:ADD'}">
            <div id="judul">Add Role
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'ROLE:LIST'}">
                        <a href="SCDataRoleList" class="srb3">Role List</a>
                    </c:if>
                </c:forEach>
            </div>
            <form id="form1" name="form1" method="post" action="SCDataRole">
                <input type="hidden" name="role_id" id="role_id" value="${dataRoleById.role_id}" />
                <div id="tabs-1" class="formBody">
                    <div class="form-row">
                        <span class="labelL">Role Name</span>
                        <input type="text" name="role_name" id="role_name" maxlength="255" value="<c:out value='${dataRoleById.role_name}' />" />
                    </div>
                    <div class="form-row"><span class="labelL">Role Enable</span>
                        <input type="checkbox" name="role_enable" id="role_enable" value="1" <c:if test="${dataRoleById.role_enable == '1'}"> checked="true" </c:if> />
                        </div>
                        <div class="form-row"><span class="labelL">Role Description</span>
                            <input type="text" name="role_desc" id="role_desc" maxlength="45" value="<c:out value="${dataRoleById.role_desc}" />" />
                    </div>
                    <div class="form-row">
                        <span class="labelL">Type</span>
                        <label>Outgoing & Incoming <input type="radio" name="role_detail" id="role_detail" value="TYPE:OUTGOING_INCOMING" <c:forEach var="item" items="${list}"><c:if test="${item == 'TYPE:OUTGOING_INCOMING'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Outgoing <input type="radio" name="role_detail" id="role_detail" value="TYPE:OUTGOING" <c:forEach var="item" items="${list}"><c:if test="${item == 'TYPE:OUTGOING'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Incoming <input type="radio" name="role_detail" id="role_detail" value="TYPE:INCOMING" <c:forEach var="item" items="${list}"><c:if test="${item == 'TYPE:INCOMING'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>
                    <div class="form-row"><span class="labelL">Source</span>
                        <label>Manual <input type="checkbox" name="role_detail" id="role_detail" value="SRC:MANUAL" <c:forEach var="item" items="${list}"><c:if test="${item == 'SRC:MANUAL'}"> checked="true" </c:if></c:forEach> /></label>
                        <!--<label>Upload <input type="checkbox" name="role_detail" id="role_detail" value="SRC:UPLOAD" <c:forEach var="item" items="${list}"><c:if test="${item == 'SRC:UPLOAD'}"> checked="true" </c:if></c:forEach> /></label>-->
                        <label>Fiorano <input type="checkbox" name="role_detail" id="role_detail" value="SRC:FIA" <c:forEach var="item" items="${list}"><c:if test="${item == 'SRC:FIA'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>
                    <div class="form-row"><span class="labelL">Flow</span>
                        <label>Reject <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:REJECT" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:REJECT'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Create <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:CREATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:CREATE'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Modify <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:MOD" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:MOD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Verify <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:VER" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:VER'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Authorize <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:AUTH" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:AUTH'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Waiting AML <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:WAITING-AML" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:WAITING-AML'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Modify Convert <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:CVT-MOD" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:CVT-MOD'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Verify Convert <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:CVT-VER" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:CVT-VER'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Resend <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:TEXT" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:TEXT'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>ACK <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:ACK" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:ACK'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>NACK <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:NACK" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:NACK'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Print <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:PRINT" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:PRINT'}"> checked="true" </c:if></c:forEach> /></label>
                        <!--<label>Incoming <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC'}"> checked="true" </c:if></c:forEach> /></label>-->
                        <label>Incoming Transaction <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC'}"> checked="true" </c:if> </c:forEach> /></label>
                    </div>
                    <div class="form-row"><span class="labelL">&nbsp;</span>
                        <label>Incoming Convert <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC-CVT" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-CVT'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Incoming Convert Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:RESEND-CNF" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:RESEND-CNF'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Incoming Reject Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC-REJECT-CNF" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-REJECT-CNF'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Incoming Waiting AML <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:INC-AML" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:INC-AML'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Resend to Channel <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:Un-Settle" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:Un-Settle'}"> checked="true" </c:if> </c:forEach> /></label>
                        <label>Waiting AML Confirmation <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:AML-TERMINATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:AML-TERMINATE'}"> checked="true" </c:if> </c:forEach> /></label>
                    </div>
                    <div class="form-row"><span class="labelL">Menu</span>
                        <label>Dashboard <input type="checkbox" name="role_detail" id="role_detail" value="MENU:DASHBOARD" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:DASHBOARD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Master <input type="checkbox" name="role_detail" id="role_detail" value="MENU:MASTER" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:MASTER'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Duplicate <input type="checkbox" name="role_detail" id="role_detail" value="MENU:DUPLICATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:DUPLICATE'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>List of Transactions <input type="checkbox" name="role_detail" id="role_detail" value="MENU:LIST_TRANSACTIONS" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:LIST_TRANSACTIONS'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Reporting <input type="checkbox" name="role_detail" id="role_detail" value="MENU:REPORTING" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:REPORTING'}"> checked="true" </c:if></c:forEach> /></label>
                        <!--<label>House Keeping <input type="checkbox" name="role_detail" id="role_detail" value="MENU:HOUSEKEEPING" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:HOUSEKEEPING'}"> checked="true" </c:if></c:forEach> /></label>-->
                        <!--<label>Contact <input type="checkbox" name="role_detail" id="role_detail" value="MENU:CONTACT" <c:forEach var="item" items="${list}"><c:if test="${item == 'MENU:CONTACT'}"> checked="true" </c:if></c:forEach> /></label>-->
                            </div>
                            <div class="form-row">
                                <span class="labelL">Session timeout</span>
                                <input type="text" value="${dataRoleById.timeout}" name="timeout" id="timeout" required /> 1 minutes = 1 * 60 * 1000
                    </div>
                    <div class="form-row">
                        <span class="labelL"> Daily Outgoing Transactions</span>
                        <label>List <input type="checkbox" name="role_detail" id="role_detail" value="DOT:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'DOT:LIST'}"> checked="true" </c:if></c:forEach> /></label>
                            </div>
<!--                    <div class="form-row">
                        <span class="labelL">Message Queue</span>
                        <label>List <input type="checkbox" name="role_detail" id="role_detail" value="MT_QUEUE:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT_QUEUE:LIST'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Add <input type="checkbox" name="role_detail" id="role_detail" value="MT_QUEUE:ADD" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT_QUEUE:ADD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>View <input type="checkbox" name="role_detail" id="role_detail" value="MT_QUEUE:VIEW" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT_QUEUE:VIEW'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Update <input type="checkbox" name="role_detail" id="role_detail" value="MT_QUEUE:UPDATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT_QUEUE:UPDATE'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>-->
                    <div class="form-row">
                        <span class="labelL">BIC</span>
                        <label>List <input type="checkbox" name="role_detail" id="role_detail" value="MEMBER_CODE:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'MEMBER_CODE:LIST'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Add <input type="checkbox" name="role_detail" id="role_detail" value="MEMBER_CODE:ADD" <c:forEach var="item" items="${list}"><c:if test="${item == 'MEMBER_CODE:ADD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>View <input type="checkbox" name="role_detail" id="role_detail" value="MEMBER_CODE:VIEW" <c:forEach var="item" items="${list}"><c:if test="${item == 'MEMBER_CODE:VIEW'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Update <input type="checkbox" name="role_detail" id="role_detail" value="MEMBER_CODE:UPDATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'MEMBER_CODE:UPDATE'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>
                    <div class="form-row">
                        <span class="labelL">User</span>
                        <label>List <input type="checkbox" name="role_detail" id="role_detail" value="USER:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'USER:LIST'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Add <input type="checkbox" name="role_detail" id="role_detail" value="USER:ADD" <c:forEach var="item" items="${list}"><c:if test="${item == 'USER:ADD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>View <input type="checkbox" name="role_detail" id="role_detail" value="USER:VIEW" <c:forEach var="item" items="${list}"><c:if test="${item == 'USER:VIEW'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Update <input type="checkbox" name="role_detail" id="role_detail" value="USER:UPDATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'USER:UPDATE'}"> checked="true" </c:if></c:forEach> /></label>
                    </div><div class="form-row"><span class="labelL">Role</span>
                        <label>List <input type="checkbox" name="role_detail" id="role_detail" value="ROLE:LIST" <c:forEach var="item" items="${list}"><c:if test="${item == 'ROLE:LIST'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Add <input type="checkbox" name="role_detail" id="role_detail" value="ROLE:ADD" <c:forEach var="item" items="${list}"><c:if test="${item == 'ROLE:ADD'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>View <input type="checkbox" name="role_detail" id="role_detail" value="ROLE:VIEW" <c:forEach var="item" items="${list}"><c:if test="${item == 'ROLE:VIEW'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Update <input type="checkbox" name="role_detail" id="role_detail" value="ROLE:UPDATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'ROLE:UPDATE'}"> checked="true" </c:if></c:forEach> /></label>
                    </div>
                    <div class="form-row"><span class="labelL">Message Category 1</span>
                        <!-- <label>101 <input type="checkbox" name="role_detail" id="role_detail" value="MT:101" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:101'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <%--<label>102 <input type="checkbox" name="role_detail" id="role_detail" value="MT:102" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:102'}"> checked="true" </c:if></c:forEach> /></label>--%> -->
                        <label>103 <input type="checkbox" name="role_detail" id="role_detail" value="MT:103" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:103'}"> checked="true" </c:if></c:forEach> /></label>
                        <!-- <label>190 <input type="checkbox" name="role_detail" id="role_detail" value="MT:190" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:190'}"> checked="true" </c:if></c:forEach> /></label> -->
                         <!--<label>191 <input type="checkbox" name="role_detail" id="role_detail" value="MT:191" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:191'}"> checked="true" </c:if></c:forEach> /></label>--> 
                        <!-- <label>192 <input type="checkbox" name="role_detail" id="role_detail" value="MT:192" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:192'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>195 <input type="checkbox" name="role_detail" id="role_detail" value="MT:195" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:195'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>196 <input type="checkbox" name="role_detail" id="role_detail" value="MT:196" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:196'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>198 <input type="checkbox" name="role_detail" id="role_detail" value="MT:198" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:198'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>199 <input type="checkbox" name="role_detail" id="role_detail" value="MT:199" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:199'}"> checked="true" </c:if></c:forEach> /></label> -->

                            </div>
                            
                         <!--MT 2XX-->
                        <!--<div class="form-row"><span class="labelL">Message Category 2</span>-->
                        <!--<label>200 <input type="checkbox" name="role_detail" id="role_detail" value="MT:200" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:200'}"> checked="true" </c:if></c:forEach> /></label>-->
                        <!--<label>202 <input type="checkbox" name="role_detail" id="role_detail" value="MT:202" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:202'}"> checked="true" </c:if></c:forEach> /></label>-->

                        <!--<label>202COV <input type="checkbox" name="role_detail" id="role_detail" value="MT:202COV" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:202COV'}"> checked="true" </c:if></c:forEach> /></label>-->
                        <!--<label>210 <input type="checkbox" name="role_detail" id="role_detail" value="MT:210" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:210'}"> checked="true" </c:if></c:forEach> /></label>--> 
                        <!-- <label>290 <input type="checkbox" name="role_detail" id="role_detail" value="MT:290" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:290'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>291 <input type="checkbox" name="role_detail" id="role_detail" value="MT:291" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:291'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>292 <input type="checkbox" name="role_detail" id="role_detail" value="MT:292" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:292'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>295 <input type="checkbox" name="role_detail" id="role_detail" value="MT:295" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:295'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>296 <input type="checkbox" name="role_detail" id="role_detail" value="MT:296" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:296'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>298 <input type="checkbox" name="role_detail" id="role_detail" value="MT:298" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:298'}"> checked="true" </c:if></c:forEach> /></label> -->
                        <!-- <label>299 <input type="checkbox" name="role_detail" id="role_detail" value="MT:299" <c:forEach var="item" items="${list}"><c:if test="${item == 'MT:299'}"> checked="true" </c:if></c:forEach> /></label> -->
                            <!--</div>-->
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

                        <div class="form-row"><span class="labelL">Payment Clearing and Settlement</span>
                        <!--<label>PACS.004.001.09 <input type="checkbox" name="role_detail" id="role_detail" value="MX:pacs00400109" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00400109'}"> checked="true" </c:if></c:forEach> /></label>-->
                        <label>PACS.008.001.08 <input type="checkbox" name="role_detail" id="role_detail" value="MX:pacs00800108" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00800108'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>PACS.009.001.08 <input type="checkbox" name="role_detail" id="role_detail" value="MX:pacs00900108" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00900108'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>PACS.009.001.08COV <input type="checkbox" name="role_detail" id="role_detail" value="MX:pacs00900108cov" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00900108cov'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>PACS.009.001.09ADV <input type="checkbox" name="role_detail" id="role_detail" value="MX:pacs00900108adv" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:pacs00900108adv'}"> checked="true" </c:if></c:forEach> /></label>
                        </div>
                </div> 
                        <!-- <div class="form-row"><span class="labelL">Cash Management</span>
                        <label>CAMT.053.001.08 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt05300108" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt05300108'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>CAMT.055.001.08 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt05500108" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt05500108'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>CAMT.056.001.08 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt05600108" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt05600108'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>CAMT.107.001.01 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt10700101" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt10700101'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>CAMT.108.001.01 <input type="checkbox" name="role_detail" id="role_detail" value="MX:camt10800101" <c:forEach var="item" items="${list}"><c:if test="${item == 'MX:camt10800101'}"> checked="true" </c:if></c:forEach> /></label>
                        </div> -->
                            <!-- <div class="form-row">
                                <span class="labelL">List Template</span>
                                <label>Create <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:LTCREATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:LTCREATE'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Update <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:LTUPDATE" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:LTUPDATE'}"> checked="true" </c:if></c:forEach> /></label>
                        <label>Disable <input type="checkbox" name="role_detail" id="role_detail" value="FLOW:LTDELETE" <c:forEach var="item" items="${list}"><c:if test="${item == 'FLOW:LTDELETE'}"> checked="true" </c:if></c:forEach> /></label>
                            </div> -->

                        </div>
                        <!--                <div class="form-row"><span class="labelL">&nbsp;</span>-->
                        <div class="form-row-action" style="margin:0 12px 0 12px;">
                            <input type="submit" name="submit" id="submit" value="Save" />
                            <%if(request.getParameter("role_id")==null){}else{%>
                                <input type="button" name="delete_role" id="delete_role" value="Disable Permanent" />
                            <%}%>
                            <!--<input type="button" name="delete_role" id="delete_role" value="Delete" />-->
                            <input type="reset" name="reset" id="reset" value="Reset" />
                            <input type="button" name="back" id="back" value="Back" />
                        </div>
                    </form>
        </c:if>
    </c:forEach>
</div>
<!--<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>-->