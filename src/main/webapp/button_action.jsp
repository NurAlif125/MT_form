<%-- 
    Document   : button_action
    Update on  : Sept 16, 2015, 9:28:00 PM
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<link rel="stylesheet" href="css/button_action.css" type="text/css" />

<div class="form-row-action container_">
    <div class="btn--group">
        <c:set var="renderedButtonSave" value="false" scope="page" />
        <c:forEach var="item" items="${role}">
            <% if (request.getParameter("id") != null && session.getAttribute("isDuplicate").equals("0")) {%>
            <% if (session.getAttribute("flagFilter") == null) {%>
            <% } else { %>
            <% if (session.getAttribute("flagStatus").equals("NACK")) {%>
            <c:if test="${item == 'FLOW:NACK'}">
                
            </c:if>
            <% }%>
            <% if (session.getAttribute("flagStatus").equals("ACK")) {%>
            <c:if test="${item == 'FLOW:ACK'}">
               
            </c:if>
            <% }%>
            <% if (session.getAttribute("flagStatus").equals("INC-WAIT")) {%>
            <c:if test="${item == 'FLOW:INC'}">
                <% if (session.getAttribute("messageType").equals("103") || session.getAttribute("messageType").equals("pacs.008.001.08")) {%>
                <c:if test="${headerById.komentar=='Not Found'}">
                    <input type="button" name="saveAcc" id="saveAcc" value="Save" />
                </c:if>  
                <c:if test="${headerById.komentar=='Account name does not match'}">
                    <input type="button" name="verifyACC" id="verifyACC" value="Adjustment Name" />
                    <input type="button" name="push_release" id="push_release" value="Push Release" /> 
                </c:if>
                <input type="button" name="recheck" id="recheck" value="Recheck" />
                <input type="button" name="investigate" id="investigate" value="Investigate" />
                <input type="button" name="retur" id="retur" value="Retur" />

                <input type="button" name="sendTEXT" id="sendTEXT" value="Receive MT" />
                <% }%>
                <% if (session.getAttribute("messageType").equals("101") || session.getAttribute("messageType").equals("202") || session.getAttribute("messageType").equals("200")) {%>
                <c:forEach var="itemInc" items="${role}">
                    <c:if test="${itemInc == 'FLOW:INCM'}">
                        <input type="button" name="incoming_ok" id="incoming_ok" value="Receive MT" />
                    </c:if>
                </c:forEach>
                <% }%>
            </c:if>
            <c:if test="${item == 'FLOW:REJECT'}">
            </c:if>
            <% if (session.getAttribute("messageType").equals("202") || session.getAttribute("messageType").equals("200")) {%>
            <c:if test="${item == 'FLOW:RETUR'}">
                <input type="button" name="retur299" id="retur299" value="Retur" />
            </c:if>
            <% }%>
            <% }%>
            
            <% if (session.getAttribute("flagStatus").equals("INC-CVT")) {%>
            <c:if test="${item == 'FLOW:INC-CVT'}">
                <input type="button" name="resend2cvt_in" id="resend2cvt_in" value="Resend to Convert" />
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("RESEND-CNF")) {%>
            <c:if test="${item == 'FLOW:RESEND-CNF'}">
                <input type="button" name="approve_cvt_resend" id="approve_cvt_resend" value="Approve" />
                <input type="button" name="reject_inc_cvt" id="reject_inc_cvt" value="Reject" />
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("WAITING-AML") && "O".equals(session.getAttribute("io_typeStatus")) ) { %>
            <c:if test="${item == 'FLOW:INC-AML'}">
                <input type="button" name="reject_inc_wait_aml" id="reject_inc_wait_aml" value="Reject" />
            </c:if>
            <% }%>
            
            <% if (session.getAttribute("flagStatus").equals("INC-CVT-CNF")) { %>
            <c:if test="${item == 'FLOW:INC-CVT-CNF'}">
                <input type="button" name="reject_inc_cvt" id="reject_inc_cvt" value="Reject" />
            </c:if>
            <% } %>

            <% if (session.getAttribute("flagStatus").equals("AML-TERMINATE-IN")) {%>
            <c:if test="${item == 'FLOW:AML-TERMINATE-IN'}">
                <input type="button" name="reject_true_acc_in" id="reject_true_acc_in" value="Approve" />
                <input type="button" name="reject_inc_aml" id="reject_inc_aml" value="Reject" />
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("AML-FAILED") && "O".equals(session.getAttribute("io_typeStatus"))) {%>
            <c:if test="${item == 'FLOW:INC-AML-FAILED'}">
                <input type="button" name="resend2aml_in" id="resend2aml_in" value="Resend to AML" />
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("INC-AML-FAILED-CNF")) {%>
            <c:if test="${item == 'FLOW:INC-AML-FAILED-CNF'}">
                <input type="button" name="approve_resend_aml_in" id="approve_resend_aml_in" value="Approve" />
                <input type="button" name="reject_inc_aml_failed" id="reject_inc_aml_failed" value="Reject" />
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("UNSETTLE-INC")) {%>
            <c:if test="${item == 'FLOW:UNSETTLE-INC'}">
                <input type="button" name="approve_resend_aml_in" id="resend2channel_in" value="Resend to Channel" />
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("INC-RESEND-CNF")) {%>
            <c:if test="${item == 'FLOW:INC-RESEND-CNF'}">
                <input type="button" name="approve_inc_resend" id="approve_inc_resend" value="Approve" />
                <input type="button" name="reject_unsettle_inc" id="reject_unsettle_inc" value="Reject" />
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("SETTLE")) {%>
            <c:if test="${item == 'FLOW:SETTLE'}">
               
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("MOD")) {%>
            <c:if test="${item == 'FLOW:MOD'}">
               
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("INC-STL")) {%>
            <c:if test="${item == 'FLOW:INC'}">
                <input type="button" name="reSendTEXT" id="reSendTEXT" value="Reactivate MT" />
                <input type="button" name="retur" id="retur" value="Retur" />
            </c:if>
            <% }%>
            <% if (session.getAttribute("flagStatus").equals("INC-HOLD")) {%>
            <% if (session.getAttribute("messageType").equals("101")) {%>
            <c:if test="${item == 'FLOW:INC'}">
                <c:forEach var="itemInc" items="${role}">
                    <c:if test="${itemInc == 'FLOW:INCM'}">
                        <input type="button" name="incWait" id="incWait" value="INC-WAIT" />
                    </c:if>
                </c:forEach>
            </c:if>
            <% }%>
            <% if (session.getAttribute("messageType").equals("202") || session.getAttribute("messageType").equals("200")) {%>
            <c:if test="${item == 'FLOW:RETUR'}">
                <input type="button" name="retur299" id="retur299" value="Retur" />
            </c:if>
            <% }%>
            <% }%>
            <% if (session.getAttribute("flagStatus").equals("MOD")) {%>
            <c:if test="${item == 'FLOW:CREATE'}">
                <input type="hidden" name="flag" id="flag" value="VER" />
                <input type="hidden" name="action_type" id="action_type" value="save" />
                <input type="submit" name="submit_mt" id="submit_mt" value="Save" />
                <script>
                    const nodeIsGenerator = document.getElementById("generator-farras");
                    const nodeReceiverInstitution = document.getElementById("receiver_institution");
                    const nodeLogicalTerminal = document.getElementById("sender_logical_terminal");

                    console.log(nodeReceiverInstitution);
                    console.log(nodeLogicalTerminal);

                    if (nodeIsGenerator) {
                        const nodeForm = document.getElementById("form1");

                        nodeForm.addEventListener("submit", function (e) {
                            e.preventDefault();

                            if (!confirm("Do you want to save this MX?")) {
                                return;
                            }
                            
                            const inputs = nodeForm.querySelectorAll("input[type='text'], textarea");
                            inputs.forEach(input => {
                                if (input.value && input.value.length > 0) {
                                    let val = input.value;
                                    val = val
                                        .replace(/&/g, "&amp;")
                                        .replace(/</g, "&lt;")
                                        .replace(/>/g, "&gt;");
                                    input.value = val;
                                }
                            });

                            const xml = htmlToXML(nodeForm);
                            console.log(xml);
                            
                            inputs.forEach(input => {
                                if (input.value && input.value.length > 0) {
                                    let val = input.value;
                                    val = val
                                        .replace(/&lt;/g, "<")
                                        .replace(/&gt;/g, ">")
                                        .replace(/&amp;/g, "&");
                                    input.value = val;
                                }
                            });

                            const existingInputs = document.getElementsByName("dataXML");
                            existingInputs.forEach(input => input.parentNode.removeChild(input));

                            // buat element untuk menampung data XML
                            const hiddenInput = document.createElement("input");
                            hiddenInput.setAttribute("id", "dataXML");
                            hiddenInput.setAttribute("name", "dataXML");
                            hiddenInput.setAttribute("type", "hidden");
                            hiddenInput.setAttribute("value", xml);
                            nodeForm.appendChild(hiddenInput);
                            
                            const sender = $('#sender_logical_terminal').val();
                            const receiver = $('#receiver_institution').val();
                            const messType = $('#messageType').val();
                            
                            console.log("Input dataXML telah ditambahkan:", hiddenInput);
                            
                            document.getElementById("errorInformationTable").innerHTML = '';
                            
                            kirimData(xml, sender, receiver, messType);

                            $("#tab-view-validate").removeAttr("hidden");
                            $("#view1, #view2").css("display", "none");
                            $("#view8").css("display", "block");
                            $('#tab-view1').removeClass("selected").removeAttr('class');
                            $('#tab-view2').removeClass("selected").removeAttr('class');
                            $('#tab-validate').addClass("selected");
                        });
                        console.log("Ini XML");

                        function kirimData(input, sender, receiver, messType) {
                            fetch("SCValidateMX", {
                                method: "POST",
                                headers: {
                                    "Content-Type": "application/x-www-form-urlencoded"
                                },
                                body: "dataXML=" + encodeURIComponent(input) + "&sender=" + encodeURIComponent(sender) + "&receiver=" + encodeURIComponent(receiver) + "&messageType=" + encodeURIComponent(messType)
                            })
                                    .then(response => response.text())
                                    .then(data => {
                                        if (data.trim() === "null" || data.trim() === "") {
                                            console.log("Data kosong, form akan dikirim...");
                                            nodeForm.submit();
                                        } else {
                                            validateHeader();
                                            document.getElementById("errorInformationTable").innerHTML += data;
                                            console.log(data);
                                            clickFocusValidate();
                                        }
                                    })
                                    .catch(error => console.error("Error:", error));
                        }
                    } else {
                        console.log("Ini MT");
                    }
                </script>
            </c:if>
            <%}%>
            <% if (session.getAttribute("flagStatus").equals("CVT-MOD")) {%>
            <c:if test="${item == 'FLOW:CREATE'}">
                <c:set var="renderedButtonSave" value="true" scope="page" />
            </c:if>
            <c:if test="${item == 'FLOW:CVT-MOD'}">
                <c:if test="${not renderedButtonSave}">
                    <input type="submit" name="submit_mt" id="submit_mt" value="Save" />
                </c:if>
            </c:if>   
            <%}%>
            <% String msgType = (String) session.getAttribute("messageType"); %>
            <% //if (session.getAttribute("flagStatus").equals("CVT-MOD") && (msgType.contains("pacs") || msgType.contains("PACS")) ) {%>
            <% if (session.getAttribute("flagStatus").equals("CVT-MOD") ) {%>
            <c:if test="${item == 'FLOW:CREATE'}">
                <input type="hidden" name="flag" id="flag" value="CVT-VER" />
                <input type="hidden" name="action_type" id="action_type" value="save" />
                <input type="submit" name="submit_mt" id="submit_mt" value="Save" />
                <script type="text/javascript" src="js/saveMX2.js"></script>
            </c:if>

            <% String msgTypes = (String) session.getAttribute("messageType"); %>
            <% //if (session.getAttribute("flagStatus").equals("CVT-MOD") && (!msgTypes.contains("pacs") || !msgTypes.contains("PACS")) ) {%>
            <% if (session.getAttribute("flagStatus").equals("CVT-MOD")){%>
            <c:if test="${item == 'FLOW:CVT-MOD'}">
               
            </c:if>
            <%}%>
            <%}%>

            <%--OUTGOING (BUTTON PADA SEBELAH KIRI)--%>
            <% if (session.getAttribute("flagStatus").equals("VER")) {%>
            <c:if test="${item == 'FLOW:VER'}">
                <input type="button" name="reject" id="reject_true" value="Reject" />
                <input type="button" name="modified" id="modified" value="Modify" />
                <input type="button" name="authorized" id="authorized" value="Authorize" />
               
            </c:if>
            <%}%>

            <% if (session.getAttribute("flagStatus").equals("AUTH")) {%>
            <c:if test="${item == 'FLOW:AUTH'}">
                
            </c:if>
            <%}%>

            <% if (session.getAttribute("flagStatus").equals("FIA-FAILED")) { %>
            <c:if test="${item == 'FLOW:FIA-FAILED'}">
                <input type="button" name="ResendFIA" id="ResendFIA" value="Resend to FIA" />
               
            </c:if>
            <% }%>


            <% if (session.getAttribute("flagStatus").equals("UNSETTLE-OUT")) {%>
            <c:if test="${item == 'FLOW:UNSETTLE-OUT'}">
                <input type="button" name="resend2saa" id="resend2saa" value="Resend to SAA" />
                
            </c:if>
            <%}%>

            <% if (session.getAttribute("flagStatus").equals("WAITING-SAA-CNF")) { %>
            <c:if test="${item == 'FLOW:WAITING-SAA-CNF'}">
                <input type="button" name="approve_wait_saa_resend" id="approve_wait_saa_resend" value="Approve" />
                <input type="button" name="reject_saa_cnf" id="reject_saa_cnf" value="Reject" />
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("WAITING-AML") && "I".equals(session.getAttribute("io_typeStatus")) ) { %>
            <c:if test="${item == 'FLOW:WAITING-AML'}">
                <input type="button" name="reject_wait_aml" id="reject_wait_aml" value="Reject" />
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("AML-TERMINATE-OUT")) { %>
            <c:if test="${item == 'FLOW:AML-TERMINATE-OUT'}">
                <input type="button" name="reject" id="reject_true" value="Approve" />
                <input type="button" name="reject_wait_aml_out" id="reject_wait_aml_out" value="Reject" />
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("AML-FAILED") && "I".equals(session.getAttribute("io_typeStatus"))) { %>
            <c:if test="${item == 'FLOW:AML-FAILED'}">
                <input type="button" name="resend2aml_out" id="resend2aml_out" value="Resend to AML" />
                
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("AML-FAILED-CNF")) { %>
            <c:if test="${item == 'FLOW:AML-FAILED-CNF'}">
                <input type="button" name="approve_aml_resend" id="approve_aml_resend" value="Approve" />
                <input type="button" name="reject_aml_failed" id="reject_aml_failed" value="Reject" />
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("CVT-VER")) {%>
            <c:if test="${item == 'FLOW:CVT-VER'}">
                <input type="button" name="approve_cvt_ver_resend" id="approve_cvt_ver_resend" value="Approve" />
                <input type="button" name="reject_cvt_mod" id="reject_cvt_mod" value="Reject" />
            </c:if>
            <%}%>

            <% if (session.getAttribute("flagStatus").equals("DUPL-CNF")) { 
                if (session.getAttribute("userEntry").equals("SRC:MANUAL")) {%>
            <c:if test="${item == 'FLOW:DUPL-CNF'}">
                <input type="button" name="authorized" id="approve_dupl_cnf" value="Approve" />
                <input type="button" name="reject" id="reject_dpl_cnf" value="Reject" />
            </c:if>
            <% } else if (session.getAttribute("userEntry").equals("SRC:FIA")) { %>
            <c:if test="${item == 'FLOW:DUPL-CNF'}">
                <input type="button" name="duplResend" id="duplResend" value="Approve" />
                <input type="button" name="reject" id="reject_dpl_cnf" value="Reject" />
            </c:if>
            <% }
              } %>

            <% if (session.getAttribute("flagStatus").equals("AUTH")) {%>
            <c:if test="${item == 'FLOW:TEXT'}">
            </c:if>
            <c:if test="${item == 'FLOW:REJECT'}">
            </c:if>
            <%}%>
            <% if (session.getAttribute("flagStatus").equals("INC-NOK")) {%>
            <c:if test="${item == 'FLOW:INC'}">
                <% if (session.getAttribute("messageType").equals("103")) {%>
                <input type="button" name="search_cover" id="search_cover" value="Search Cover" />
                <% }%>  

                <input type="button" name="recheck" id="recheck" value="Recheck" />

            </c:if>
            <% }%>


            <% if (session.getAttribute("flagStatus").equals("INC-OK")) {%>
            <c:if test="${item == 'FLOW:INC'}">
                <% if (session.getAttribute("messageType").equals("103") || session.getAttribute("messageType").equals("pacs.008.001.08")) {%>
                <input type="button" name="push_release" id="push_release" value="Push Release" /> 
                <input type="button" name="search_cover" id="search_cover" value="Search Cover" />
                <% }%>
                <input type="button" name="reject" id="reject" value="Reject" />
            </c:if>
            <% if (session.getAttribute("messageType").equals("101") || session.getAttribute("messageType").equals("200") || session.getAttribute("messageType").equals("202")) {%>
            <c:if test="${item == 'FLOW:INCS'}">
                <input type="button" name="incoming_settle" id="incoming_settle" value="INC-STL" />
            </c:if>
            <% }%>
            <% }%>

            <% // if (session.getAttribute("flagStatus").equals("INC-STL")) {%>
            <% // }%>
            <% if (session.getAttribute("flagStatus").equals("INC-INV")) {%>
            <c:if test="${item == 'FLOW:INC'}">
                <c:if test="${headerById.komentar=='NAMA BERBEDA SAAT INQUIRY REKENING'}">
                    <input type="button" name="verifyACC" id="verifyACC" value="Adjustment Name" />
                    <input type="button" name="sendTEXT" id="sendTEXT" value="Receive MT" />
                </c:if>
            </c:if>
            <c:if test="${item == 'FLOW:RETUR'}">
                <input type="button" name="returinv" id="returinv" value="Retur" />
            </c:if>
            <% }%>
            <%-- <% if (!(((String) session.getAttribute("flagStatus")).equals("REJECT") || ((String) session.getAttribute("flagStatus")).equals("CVT-MOD") || ((String) session.getAttribute("flagStatus")).equals("TEXT") || ((String) session.getAttribute("flagStatus")).equals("MOD") || ((String) session.getAttribute("flagStatus")).equals("INC-NOK") || ((String) session.getAttribute("flagStatus")).equals("INC-OK") || ((String) session.getAttribute("flagStatus")).equals("AUTH") || ((String) session.getAttribute("flagStatus")).equals("ACK") || ((String) session.getAttribute("flagStatus")).equals("NACK") || ((String) session.getAttribute("flagStatus")).equals("INC") || ((String) session.getAttribute("flagStatus")).equals("INC-WAIT") || ((String) session.getAttribute("flagStatus")).equals("RACK") || ((String) session.getAttribute("flagStatus")).equals("INC-ROK") || ((String) session.getAttribute("flagStatus")).equals("INC-NSTP") || ((String) session.getAttribute("flagStatus")).equals("INC-SPRT") )) {%>
            <c:if test="${item == 'FLOW:REJECT'}">
            </c:if>
            <% }%> --%>
            <% if (session.getAttribute("flagStatus").equals("INC-NSTP")) {%>
            <c:if test="${item == 'FLOW:INC'}">
                <input type="button" name="saveRate" id="saveRate" value="Save" />
            </c:if>
            <c:if test="${item == 'FLOW:REJECT'}">
                <input type="button" name="reject" id="reject" value="Reject" />
            </c:if>
            <% if (session.getAttribute("messageType").equals("202") || session.getAttribute("messageType").equals("200")) {%>
            <c:if test="${item == 'FLOW:RETUR'}">
                <input type="button" name="retur299" id="retur299" value="Retur" />
            </c:if>
            <% }%>    
            <% }%>
            <% if (session.getAttribute("flagStatus").equals("INC-SPRT")) {%>
            <c:if test="${item == 'FLOW:INC'}">
                <input type="button" name="acceptSPRT" id="acceptSPRT" value="Approve Special Rate" />
                <input type="button" name="rejectSPRT" id="rejectSPRT" value="Reject Special Rate" />
            </c:if>
            <c:if test="${item == 'FLOW:REJECT'}">
                <input type="button" name="reject" id="reject" value="Reject" />
            </c:if>
            <% if (session.getAttribute("messageType").equals("202") || session.getAttribute("messageType").equals("200")) {%>
            <c:if test="${item == 'FLOW:RETUR'}">
                <input type="button" name="retur299" id="retur299" value="Retur" />
            </c:if>
            <% }%>
            <% }%>
            <% }%>
            <c:if test="${item == 'FLOW:PRINT'}">

                <c:choose>
                    <c:when test="${headerById.networktype== 'MT'}">
                    </c:when>
                    <c:when test="${headerById.networktype=='MX' && fn:containsIgnoreCase(headerById.messageType,'pacs.008.001')||fn:containsIgnoreCase(headerById.messageType,'pacs.009.001')||fn:containsIgnoreCase(headerById.messageType,'pacs.004.001')}">
                    </c:when>
                </c:choose>

            </c:if>
            <% } else if (request.getParameter("id") != null && session.getAttribute("isDuplicate").equals("1")) {%>
            <% if (session.getAttribute("flagStatus").equals("DUPL")) {%>
            <% if (session.getAttribute("flagFilter") == null) {%>
            <% } else { %>
            <c:if test="${item == 'FLOW:DUPL'}">
                <input type="button" name="releaseDupl" id="releaseDupl" value="Release" />
            </c:if>
            <% } }%>
            <% } else {%>
            <% if (request.getParameter("id") == null) { %>
            <c:if test="${item == 'FLOW:CREATE'}">
                <input type="hidden" name="action_type" id="action_type" value="save" />
                <input type="submit" name="submit_mt" id="submit_mt" value="Save" />
                <script type="text/javascript" src="js/saveMX3.js"></script>
                <% if ((request.getParameter("idlt") == null) ) {%>
                <c:forEach var="itemF" items="${role}">
                    <c:if test="${itemF == 'FLOW:LTCREATE'}">
                    </c:if>
                </c:forEach>    
                <% } %>
            </c:if>
            <% } %>
            <% } %>
            <% if (session.getAttribute("flagStatus").equals("ACK") || session.getAttribute("flagStatus").equals("RACK")) {%>
            <c:if test="${item == 'FLOW:RACK'}">
                <input type="button" name="RACK" id="RACK" value="Resend ACK" />
            </c:if>
            <% } %>
            <% if (session.getAttribute("flagStatus").equals("INC-OK") || session.getAttribute("flagStatus").equals("INC-ROK")) {%>
            <c:if test="${item == 'FLOW:INC-ROK'}">
                <input type="button" name="INC-ROK" id="INC-ROK" value="Resend INC-OK" />
            </c:if>
            <% } %>
            <% if (session.getAttribute("flagStatus").equals("ACK") || session.getAttribute("flagStatus").equals("INC-OK") || session.getAttribute("flagStatus").equals("RACK") || session.getAttribute("flagStatus").equals("INC-ROK")) {%>
            <c:if test="${item == 'FLOW:DELHIS'}"> 
                <input type="button" name="DELHIS" id="DELHIS" value="Delete Journal History" />
            </c:if>
            <% } %>

            <% if (session.getAttribute("flagStatus").equals("FIA-FAILED-CNF")) { %>
            <c:if test="${item == 'FLOW:FIA-FAILED-CNF'}">
                <input type="button" name="ApproveFIA" id="ApproveFIA" value="Approve" />
                <input type="button" name="reject_fia_failed" id="reject_fia_failed" value="Reject" />
            </c:if>
            <% }%>
        </c:forEach>   
        <% if (request.getParameter("id") != null) {%>
        <div id="grp_btn_printed">
           <c:choose>
               <c:when test="${headerById.networktype== 'MT'}">
                   <input type="button" name="printed" id="printed" value="Print" />
               </c:when>
               <c:when test="${headerById.networktype=='MX' && fn:containsIgnoreCase(headerById.messageType,'pacs.008.001')||fn:containsIgnoreCase(headerById.messageType,'pacs.009.001')||fn:containsIgnoreCase(headerById.messageType,'pacs.004.001')}">
                   <input type="hidden" name="messageType" id="messageType" value="${headerById.messageType}"/> 
                   <input type="button" name="printedmx" id="printedmx" value="Print" />
               </c:when>
           </c:choose>
        </div>
       <% } %>
        <input type="button" name="back" id="back" value="Back" />
    </div>

    <%--=======================================================================================================================--%>

    <%--POSISI BUTTON SEBELAH KANAN--%>
    <div class="btn--group"> 
        <c:forEach var="item" items="${role}">

            <% if (session.getAttribute("flagStatus").equals("INC-RESEND-CNF")) {%>
            <c:if test="${item == 'FLOW:INC-RESEND-CNF'}">
                <!--<input type="button" name="printed" id="printed" value="Print" / //>-->
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("VER")) {%>
            <c:if test="${item == 'FLOW:VER'}">
            </c:if>
            <% }%>

            <% if (session.getAttribute("flagStatus").equals("AUTH")) {%>
            <c:if test="${item == 'FLOW:AUTH'}">
            </c:if>
            <%}%>

            <% if (session.getAttribute("flagStatus").equals("CVT-MOD")) {%>
            <c:if test="${item == 'FLOW:CVT-MOD'}">
            </c:if>
            <%}%>

            <% if (session.getAttribute("flagStatus").equals("CVT-VER")) {%>
            <c:if test="${item == 'FLOW:CVT-VER'}">
            </c:if>
            <%}%> 

            <% if (request.getParameter("id") != null) {%>
            <% if (session.getAttribute("flagStatus").equals("MOD")) {%>
            <c:if test="${item == 'FLOW:MOD'}">
                <input type="button" name="validate" id="btn-validate" value="Validate" />
            </c:if>
            <% } else if (session.getAttribute("flagStatus").equals("CVT-MOD")) { %>
            <c:if test="${item == 'FLOW:CVT-MOD'}">
                <input type="button" name="validate" id="btn-validate" value="Validate" />
            </c:if>
            <% } %>
            <% } else { %>
            <c:if test="${item == 'FLOW:CREATE'}">
                <input type="button" name="validate" id="btn-validate" value="Validate" />
            </c:if>
            <% } %>
        </c:forEach>

        <% if (!session.getAttribute("flagStatus").equals("MOD") && !session.getAttribute("flagStatus").equals("CVT-MOD") && !session.getAttribute("flagStatus").equals("") ) {%>
            <script type="text/javascript" src="js/readonly.js"></script>
        <% } %>

        <% if (request.getParameter("id") != null) {%>
        <input type="button" name="btn-export" id="btn-export" value="Export" />
        <% } %>
        
    </div>
</div>

<script>
    window.addEventListener("DOMContentLoaded", function() {
      var elById = document.getElementById("_010_mf20_sender_reference");
      var elByName = document.getElementById("msgid");
      var btnDiv = document.getElementById("grp_btn_printed");

      if (!elById && !elByName) {
        btnDiv.style.display = "none"; // sembunyikan
      } else {
        btnDiv.style.display = ""; // tampilkan
      }
    });
</script>