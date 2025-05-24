<%-- 
    Document   : button_action
    Update on  : Sept 16, 2015, 9:28:00 PM
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<style>
    .container_ {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
        
    .btn--group {
        display: flex;
        gap: 5px;
    }
</style>

<div class="form-row-action container_">
    <div class="btn--group">
    <c:set var="renderedButtonSave" value="false" scope="page" />
    <c:forEach var="item" items="${role}">
        <% if (request.getParameter("id") != null) {%>
        <% if (session.getAttribute("flagFilter") == null) {%>
        <% } else { %>
        <% if (session.getAttribute("flagStatus").equals("NACK")) {%>
            <c:if test="${item == 'FLOW:NACK'}">
                <!-- <input type="button" name="modified" id="modified" value="Modify" /> -->
                <input type="button" name="printed" id="printed" value="Print" />
            </c:if>
        <% }%>
        <% if (session.getAttribute("flagStatus").equals("ACK")) {%>
            <c:if test="${item == 'FLOW:ACK'}">
                <!-- <input type="button" name="modified" id="modified" value="Modify" /> -->
                <input type="button" name="printed" id="printed" value="Print" />
            </c:if>
        <% }%>
        <% if (session.getAttribute("flagStatus").equals("INC-WAIT")) {%>
        <c:if test="${item == 'FLOW:INC'}">
            <% if (session.getAttribute("messageType").equals("103") || session.getAttribute("messageType").equals("pacs.008.001.08")) {%>
            <%--<c:if test="${headerById.komentar!='NAMA BERBEDA SAAT INQUIRY REKENING'}">--%>
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
            <%--c:forEach var="itemInc" items="${role}">
                <c:if test="${itemInc == 'FLOW:RETUR'}">
                    <input type="button" name="retur" id="retur" value="Retur" />
                </c:if>
            </c:forEach--%>

            <input type="button" name="sendTEXT" id="sendTEXT" value="Receive MT" />
            <% }%>
            <% if (session.getAttribute("messageType").equals("101") || session.getAttribute("messageType").equals("202") || session.getAttribute("messageType").equals("200")) {%>
            <c:forEach var="itemInc" items="${role}">
                <c:if test="${itemInc == 'FLOW:INCM'}">
                    <input type="button" name="incoming_ok" id="incoming_ok" value="Receive MT" />
                </c:if>
            </c:forEach>
            <% }%>
            <!--101 end here-->
        </c:if>
        <c:if test="${item == 'FLOW:REJECT'}">
            <!--<input type="button" name="reject" id="reject" value="Reject" />-->
        </c:if>
        <% if (session.getAttribute("messageType").equals("202") || session.getAttribute("messageType").equals("200")) {%>
        <c:if test="${item == 'FLOW:RETUR'}">
            <input type="button" name="retur299" id="retur299" value="Retur" />
        </c:if>
        <% }%>
        <% }%>
        <!--INC-WAIT end here-->
        
        <!--INCOMING-->
        <% if (session.getAttribute("flagStatus").equals("INC-CVT")) {%>
        <c:if test="${item == 'FLOW:INC'}">
            <input type="button" name="resend2cvt" id="resend2cvt" value="Resend to Convert" />
        </c:if>
        <% }%>

        <% if (session.getAttribute("flagStatus").equals("INC-ADJ")) {%>
        <c:if test="${item == 'FLOW:INC'}">
            <input type="button" name="approveADJ" id="approveADJ" value="Approve Adjustment" />
            <input type="button" name="rejectADJ" id="rejectADJ" value="Reject Adjustment" />
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
                var nodeIsGenerator = document.getElementById("generator-farras")

                var nodeReceiverInstitution = document.getElementById("receiver_institution")
                var nodeLogicalTerminal = document.getElementById("sender_logical_terminal")

                console.log(nodeReceiverInstitution)
                console.log(nodeLogicalTerminal)

                if (nodeIsGenerator) {
                    var nodeForm = document.getElementById("form1")

                    nodeForm.addEventListener("submit", function (e) {
                        console.log("testing")
                        e.preventDefault()
                        
                        if (!confirm("Do you want to save this MX?")) {
                            return; 
                        }
                        
                        var xml = htmlToXML(nodeForm)
                        console.log(xml)

                        var existingInputs = document.getElementsByName("dataXML")
                        existingInputs.forEach(input => input.parentNode.removeChild(input))

                        // buat element untuk menampung data XML
                        var input = document.createElement("input")

                        input.setAttribute("id", "dataXML")
                        input.setAttribute("name", "dataXML")
                        input.setAttribute("type", "hidden")
                        input.setAttribute("value", xml)
                        nodeForm.appendChild(input)
                        let sender = $('#sender_logical_terminal').val();
                        let receiver = $('#receiver_institution').val();
                        let messType = $('#messageType').val();
                        console.log("Input dataXML telah ditambahkan:", input)
                        document.getElementById("errorInformationTable").innerHTML= '';
                        kirimData(xml, sender, receiver, messType)
                        
                        $("#tab-view-validate").removeAttr("hidden");
                        $("#view1, #view2").css("display", "none");
                        $("#view7").css("display", "block");
                        $('#tab-view1').removeClass("selected").removeAttr('class');
                        $('#tab-view2').removeClass("selected").removeAttr('class');
                        $('#tab-validate').addClass("selected");
                    })
                    console.log("Ini XML")

                    function kirimData(input, sender, receiver, messType) {
                        fetch("SCValidateMX", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/x-www-form-urlencoded"
                            },
                            body: "dataXML=" + encodeURIComponent(input)+ "&sender="+encodeURIComponent(sender)+"&receiver="+encodeURIComponent(receiver)+"&messageType="+encodeURIComponent(messType)
                        })
                        .then(response => response.text())
                        .then(data => {
                            if (data.trim() === "null" || data.trim() === "") {
                                console.log("Data kosong, form akan dikirim...")
                                nodeForm.submit()
                            } else {
                                validateHeader();
                                document.getElementById("errorInformationTable").innerHTML += data;
                                console.log(data)         
                                clickFocusValidate();
                            }
                        })
                        .catch(error => console.error("Error:", error))
                    }
                } else {
                    console.log("Ini MT")
                }
            </script>
        </c:if>
        <%--<c:if test="${item == 'FLOW:VER'}">
            <input type="button" name="verified" id="verified" value="Verifiy" />
        </c:if>--%>
        <%}%>
        <% if (session.getAttribute("flagStatus").equals("CVT-MOD")) {%>
            <c:if test="${item == 'FLOW:CREATE'}">
                <c:set var="renderedButtonSave" value="true" scope="page" />
            </c:if>
            <c:if test="${item == 'FLOW:CVT-MOD'}">
                <c:if test="${not renderedButtonSave}">
                    <input type="submit" name="submit_mt" id="submit_mt" value="Save" />
                </c:if>
                <input type="button" name="printed" id="printed" value="Print" />
            </c:if>   
        <%}%>
        <% if (session.getAttribute("flagStatus").equals("CVT-MOD")) {%>
        <c:if test="${item == 'FLOW:CREATE'}">
            <input type="hidden" name="flag" id="flag" value="CVT-VER" />
            <input type="hidden" name="action_type" id="action_type" value="save" />
            <input type="submit" name="submit_mt" id="submit_mt" value="Save" />
            <script>
                var nodeIsGenerator = document.getElementById("generator-farras")

                var nodeReceiverInstitution = document.getElementById("receiver_institution")
                var nodeLogicalTerminal = document.getElementById("sender_logical_terminal")

                console.log(nodeReceiverInstitution)
                console.log(nodeLogicalTerminal)

                if (nodeIsGenerator) {
                    var nodeForm = document.getElementById("form1")

                    nodeForm.addEventListener("submit", function (e) {
                        console.log("testing")
                        e.preventDefault()
                        
                        if (!confirm("Do you want to save this MX?")) {
                            return; // user klik "Batal", keluar tanpa menyimpan
                        }
                        var xml = htmlToXML(nodeForm)
                        console.log(xml)

                        var existingInputs = document.getElementsByName("dataXML")
                        existingInputs.forEach(input => input.parentNode.removeChild(input))

                        // buat element untuk menampung data XML
                        var input = document.createElement("input")

                        input.setAttribute("id", "dataXML")
                        input.setAttribute("name", "dataXML")
                        input.setAttribute("type", "hidden")
                        input.setAttribute("value", xml)
                        nodeForm.appendChild(input)
                        let sender = $('#sender_logical_terminal').val();
                        let receiver = $('#receiver_institution').val();
                        let messType = $('#messageType').val();
                        console.log("Input dataXML telah ditambahkan:", input)
                        document.getElementById("errorInformationTable").innerHTML= '';
                        kirimData(xml, sender, receiver, messType)
                        
                        $("#tab-view-validate").removeAttr("hidden");
                        $("#view1, #view2").css("display", "none");
                        $("#view7").css("display", "block");
                        $('#tab-view1').removeClass("selected").removeAttr('class');
                        $('#tab-view2').removeClass("selected").removeAttr('class');
                        $('#tab-validate').addClass("selected");
                    })
                    console.log("Ini XML")

                    function kirimData(input, sender, receiver, messType) {
                        fetch("SCValidateMX", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/x-www-form-urlencoded"
                            },
                            body: "dataXML=" + encodeURIComponent(input)+ "&sender="+encodeURIComponent(sender)+"&receiver="+encodeURIComponent(receiver)+"&messageType="+encodeURIComponent(messType)
                        })
                        .then(response => response.text())
                        .then(data => {
                            if (data.trim() === "null" || data.trim() === "") {
                                console.log("Data kosong, form akan dikirim...")
                                nodeForm.submit()
                            } else {
                                validateHeader();
                                document.getElementById("errorInformationTable").innerHTML += data;
                                console.log(data)         
                                clickFocusValidate();
                            }
                        })
                        .catch(error => console.error("Error:", error))
                    }
                } else {
                    console.log("Ini MT")
                }
            </script>
        </c:if>
        
        <%--<c:if test="${item == 'FLOW:VER'}">
            <input type="button" name="verified" id="verified" value="Verifiy" />
        </c:if>--%>
        <%}%>
        <!--OUTGOING (BUTTON PADA SEBELAH KIRI)-->
        <% if (session.getAttribute("flagStatus").equals("VER")) {%>
            <c:if test="${item == 'FLOW:VER'}">
                <input type="button" name="reject" id="reject_true" value="Reject" />
                <input type="button" name="modified" id="modified" value="Modify" />
                <input type="button" name="authorized" id="authorized" value="Authorize" />
            </c:if>
        <%}%>
        
        <% if (session.getAttribute("flagStatus").equals("FIA-FAILED")) { %>
            <c:if test="${item == 'FLOW:FIA-FAILED'}">
                <input type="button" name="ResendFIA" id="ResendFIA" value="Resend to FIA" />
                <input type="button" name="printed" id="printed" value="Print" />
            </c:if>
        <% }%>
        
        <% if (session.getAttribute("flagStatus").equals("FIA-FAILED-CNF")) { %>
            <c:if test="${item == 'FLOW:FIA-FAILED-CNF'}">
                <input type="button" name="approve_fia" id="approve_fia" value="Approve" />
                <input type="button" name="reject" id="reject_true" value="Reject" />
            </c:if>
        <% }%>
        
        <% if (session.getAttribute("flagStatus").equals("UNSETTLE-OUT")) {%>
            <c:if test="${item == 'FLOW:UNSETTLE-OUT'}">
                <input type="button" name="resend2saa" id="resend2saa" value="Resend to SAA" />
                <input type="button" name="printed" id="printed" value="Print" />
            </c:if>
        <%}%>
        
        <% if (session.getAttribute("flagStatus").equals("WAITING-SAA-CNF")) { %>
            <c:if test="${item == 'FLOW:WAITING-SAA-CNF'}">
                <input type="button" name="approve_wait_saa_resend" id="approve_wait_saa_resend" value="Approve" />
                <input type="button" name="reject_saa_cnf" id="reject_saa_cnf" value="Reject" />
            </c:if>
        <% }%>
        
        <% if (session.getAttribute("flagStatus").equals("WAITING-AML")) { %>
            <c:if test="${item == 'FLOW:WAITING-AML'}">
                <input type="button" name="reject_wait_aml" id="reject_wait_aml" value="Reject" />
            </c:if>
        <% }%>
        
        <% if (session.getAttribute("flagStatus").equals("AML-TERMINATE-OUT")) { %>
            <c:if test="${item == 'FLOW:AML-TERMINATE-OUT'}">
                <input type="button" name="reject_wait_aml" id="approve_aml_reject" value="Approve" />
                <input type="button" name="reject_wait_aml" id="reject_wait_aml_out" value="Reject" />
            </c:if>
        <% }%>
        
        <% if (session.getAttribute("flagStatus").equals("AML-FAILED")) { %>
            <c:if test="${item == 'FLOW:AML-FAILED'}">
                <input type="button" name="resend2aml" id="resend2aml" value="Resend to AML" />
                <input type="button" name="printed" id="printed" value="Print" />
            </c:if>
        <% }%>
        
        <% if (session.getAttribute("flagStatus").equals("AML-FAILED-CNF")) { %>
            <c:if test="${item == 'FLOW:AML-FAILED-CNF'}">
                <input type="button" name="reject_wait_aml" id="approve_aml_resend" value="Approve" />
                <input type="button" name="reject_wait_aml" id="reject_aml_failed" value="Reject" />
            </c:if>
        <% }%>
        
        
        
        <% if (session.getAttribute("flagStatus").equals("CVT-VER")) {%>
        <c:if test="${item == 'FLOW:AUTH'}">
            <input type="button" name="authorized" id="authorized" value="Authorize" />
        </c:if>
        <%}%>
        <% if (session.getAttribute("flagStatus").equals("AUTH")) {%>
        <c:if test="${item == 'FLOW:TEXT'}">
            <input type="button" name="generated" id="generated" value="Resend" />
            <!--<input type="button" name="reject" id="reject" value="Complete" />-->
        </c:if>
        <!--here we go...!-->
        <!--20230302-->
        <c:if test="${item == 'FLOW:REJECT'}">
            <!--<input type="button" name="reject" id="reject" value="Reject" />-->
        </c:if>
        <%}%>
        <% if (session.getAttribute("flagStatus").equals("INC-NOK")) {%>
        <c:if test="${item == 'FLOW:INC'}">
            <% if (session.getAttribute("messageType").equals("103")) {%>
            <input type="button" name="search_cover" id="search_cover" value="Search Cover" /> <!-- 20191231 ditambah search cover -->
            <% }%>  
            <input type="button" name="reject" id="reject" value="Reject" />
            <input type="button" name="recheck" id="recheck" value="Recheck" />

        </c:if>
        <% }%>
        <% if (session.getAttribute("flagStatus").equals("INC-STLHOLD")) {%>
        <c:if test="${item == 'FLOW:INC'}">
            <% if (session.getAttribute("messageType").equals("103")) {%>
            <input type="button" name="search_cover" id="search_cover" value="Search Cover" /> <!-- 20191231 ditambah search cover -->
            <% }%>  
            <input type="button" name="reject" id="reject" value="Reject" />


            <input type="button" name="manual_settle" id="manual_settle" value="Manual Settle" /> 

        </c:if>
        <% }%>

        <% if (session.getAttribute("flagStatus").equals("INC-STLHOLD-CNF")) {%>
        <c:if test="${item == 'FLOW:INC'}">
            <% if (session.getAttribute("messageType").equals("103")) {%>
            <input type="button" name="search_cover" id="search_cover" value="Search Cover" /> <!-- 20191231 ditambah search cover -->
            <% }%>  
            <!--            <input type="button" name="reject" id="reject" value="Reject" />
                        <input type="button" name="recheck" id="recheck" value="Recheck" />
                        <input type="button" name="manual_settle" id="manual_settle" value="Manual Settle" />-->
            <input type="button" name="approve_settle" id="approve_settle" value="Approve" /> 
            <input type="button" name="reject_settle" id="reject_settle" value="Reject Settle" /> 


        </c:if>
        <% }%>


        <% if (session.getAttribute("flagStatus").equals("INC-OK")) {%>
        <c:if test="${item == 'FLOW:INC'}">
            <% if (session.getAttribute("messageType").equals("103") || session.getAttribute("messageType").equals("pacs.008.001.08")) {%>

            <!--    2024-12-16 : Farras, Menambahkan push release untukt ransaksi tertentu yg ada di INC-OK
            karena tidak perlu menunggu cover dana-->
            <input type="button" name="push_release" id="push_release" value="Push Release" /> 

            <input type="button" name="search_cover" id="search_cover" value="Search Cover" /> <!-- 20191231 ditambah search cover -->

            <!--<input type="button" name="investigate" id="investigate" value="Investigate" />  2024-12-23 kebutuhan untuk nanya jika statement belum datang -->
            <!--<input type="button" name="retur" id="retur" value="Retur" />-->
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
        <%--<c:if test="${item == 'FLOW:INC'}">--%>
        <!--<input type="button" name="getConfirm" id="getConfirm" value="Send Confirmation" />-->
        <%--</c:if>--%>
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
        <!-- <% if (!(((String) session.getAttribute("flagStatus")).equals("REJECT") || ((String) session.getAttribute("flagStatus")).equals("CVT-MOD") || ((String) session.getAttribute("flagStatus")).equals("TEXT") || ((String) session.getAttribute("flagStatus")).equals("MOD") || ((String) session.getAttribute("flagStatus")).equals("INC-NOK") || ((String) session.getAttribute("flagStatus")).equals("INC-OK") || ((String) session.getAttribute("flagStatus")).equals("AUTH") || ((String) session.getAttribute("flagStatus")).equals("ACK") || ((String) session.getAttribute("flagStatus")).equals("NACK") || ((String) session.getAttribute("flagStatus")).equals("INC") || ((String) session.getAttribute("flagStatus")).equals("INC-WAIT") || ((String) session.getAttribute("flagStatus")).equals("RACK") || ((String) session.getAttribute("flagStatus")).equals("INC-ROK") || ((String) session.getAttribute("flagStatus")).equals("INC-NSTP") || ((String) session.getAttribute("flagStatus")).equals("INC-SPRT") )) {%>
        <c:if test="${item == 'FLOW:REJECT'}">
            <input type="button" name="reject" id="reject" value="Reject" hidden />
        </c:if>
        <% }%> -->
        <!--INC-NSTP-->
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
        <!--INC-NSTP-->
        <!--INC-SPRT-->
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
        <!--INC-SPRT-->
        <% }%>
        <c:if test="${item == 'FLOW:PRINT'}">

            <c:choose>
                <c:when test="${headerById.networktype== null}">
                    <!--<input type="button" name="printed" id="printed" value="Print" />-->
                    <!--<input type="button" name="printedmx" id="printedmx" value="Print" />-->
                </c:when>
                <c:when test="${headerById.networktype== 'MT'}">
                    <!--<input type="button" name="printed" id="printed" value="Print" />-->
                </c:when>
                <c:when test="${headerById.networktype=='MX' && fn:containsIgnoreCase(headerById.messageType,'pacs.008.001')||fn:containsIgnoreCase(headerById.messageType,'pacs.009.001')}">
                    <input type="hidden" name="messageType" id="messageType" value="${headerById.messageType}"/> 
                    <input type="button" name="printedmx" id="printedmx" value="Print" />
                </c:when>
            </c:choose>

        </c:if>
        <% } else {%>
        <c:if test="${item == 'FLOW:CREATE'}">
            <input type="hidden" name="action_type" id="action_type" value="save" />
            <input type="submit" name="submit_mt" id="submit_mt" value="Save" />
            <script>
                var nodeIsGenerator = document.getElementById("generator-farras")

                var nodeReceiverInstitution = document.getElementById("receiver_institution")
                var nodeLogicalTerminal = document.getElementById("sender_logical_terminal")

                console.log(nodeReceiverInstitution)
                console.log(nodeLogicalTerminal)

                if (nodeIsGenerator) {
                    var nodeForm = document.getElementById("form1")

                    nodeForm.addEventListener("submit", function (e) {
                        console.log("testing")
                        e.preventDefault()
                        if (!confirm("Do you want to save this MX?")) {
                            return; 
                        }
                        var xml = htmlToXML(nodeForm)
                        console.log(xml)

                        var existingInputs = document.getElementsByName("dataXML")
                        existingInputs.forEach(input => input.parentNode.removeChild(input))

                        // buat element untuk menampung data XML
                        var input = document.createElement("input")

                        input.setAttribute("id", "dataXML")
                        input.setAttribute("name", "dataXML")
                        input.setAttribute("type", "hidden")
                        input.setAttribute("value", xml)
                        nodeForm.appendChild(input)
                        let sender = $('#sender_logical_terminal').val();
                        let receiver = $('#receiver_institution').val();
                        let messType = $('#messageType').val();
                        console.log("Input dataXML telah ditambahkan:", input)
                        document.getElementById("errorInformationTable").innerHTML= '';
                        kirimData(xml, sender, receiver, messType)
                        
                        $("#tab-view-validate").removeAttr("hidden");
                        $("#view1, #view2").css("display", "none");
                        $("#view7").css("display", "block");
                        $('#tab-view1').removeClass("selected").removeAttr('class');
                        $('#tab-view2').removeClass("selected").removeAttr('class');
                        $('#tab-validate').addClass("selected");
                    })
                    console.log("Ini XML")

                    function kirimData(input, sender, receiver, messType) {
                        fetch("SCValidateMX", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/x-www-form-urlencoded"
                            },
                            body: "dataXML=" + encodeURIComponent(input)+ "&sender="+encodeURIComponent(sender)+"&receiver="+encodeURIComponent(receiver)+"&messageType="+encodeURIComponent(messType)
                        })
                        .then(response => response.text())
                        .then(data => {
                            if (data.trim() === "null" || data.trim() === "") {
                                console.log("Data kosong, form akan dikirim...")
                                nodeForm.submit()
                            } else {
                                validateHeader();
                                document.getElementById("errorInformationTable").innerHTML += data;
                                console.log(data)         
                                clickFocusValidate();
                            }
                        })
                        .catch(error => console.error("Error:", error))
                    }
                } else {
                    console.log("Ini MT")
                }
            </script>
                  <% if ((request.getParameter("idlt") == null) ) {%>
            <c:forEach var="itemF" items="${role}">
                <c:if test="${itemF == 'FLOW:LTCREATE'}">
                    <!--<input type="button" name="submit_template" id="submit_template" value="Save As Template" />-->
                </c:if>
            </c:forEach>    
            <% } %>
        </c:if>
        <% } %>
        <!--20180417 untuk resend ack dan incominig-->
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
        <!-- ... existing code ... -->
        <% if (session.getAttribute("flagStatus").equals("INC-RTR")) {%>
        <c:if test="${item == 'FLOW:INC'}">
            <input type="button" name="retur" id="retur" value="Retur" />
        </c:if>
        <% }%>
        <!-- ... existing code ... -->
        <!--end 20180417-->
        <% if (session.getAttribute("flagStatus").equals("AML-FAILED-CNF")) { %>
            <c:if test="${item == 'FLOW:AML-FAILED-CNF'}">
                <input type="button" name="approve_aml" id="approve_aml" value="Approve" />
                <input type="button" name="reject" id="reject_true" value="Reject" />
            </c:if>
        <% }%>        

        <% if (session.getAttribute("flagStatus").equals("FIA-FAILED")) { %>
            <c:if test="${item == 'FLOW:FIA-FAILED'}">
                <input type="button" name="ResendFIA" id="ResendFIA" value="Resend to FIA" />
                <input type="button" name="printed" id="printed" value="Print" />
            </c:if>
        <% }%>
        
        <% if (session.getAttribute("flagStatus").equals("FIA-FAILED-CNF")) { %>
            <c:if test="${item == 'FLOW:FIA-FAILED-CNF'}">
                <input type="button" name="ApproveFIA" id="ApproveFIA" value="Approve" />
                <input type="button" name="reject" id="reject_true" value="Reject" />
            </c:if>
        <% }%>


             <% if ((request.getParameter("idlt") != null) ) {%>
        <c:if test="${item == 'FLOW:LTUPDATE'}">
            <input type="hidden" id="idlt" name="idlt" value="${param.idlt}" />
            <input type="button" name="save_template_edit" id="save_template_edit" value="Save Edit Template" />
        </c:if>
        <% } %>

    </c:forEach>      
        <input type="button" name="back" id="back" value="Back" />
    </div>
    
    <!--POSISI BUTTON SEBELAH KANAN-->
    <div class="btn--group">
        <c:forEach var="item" items="${role}">
            <% if (session.getAttribute("flagStatus").equals("VER")) {%>
            <c:if test="${sessionScope.sub_role_user == '1'}">
                <input type="button" name="printed" id="printed" value="Print" />
                <input type="button" name="export" id="btn-export" value="Export" />
            </c:if>
        <% }%>
        
         <% if (session.getAttribute("flagStatus").equals("FIA-FAILED")) { %>
            <c:if test="${item == 'FLOW:FIA-FAILED'}">
                <input type="button" name="printed" id="printed" value="Print" />
            </c:if>
        <% }%>
            
            <% if (request.getParameter("id") != null) {%>
            <% if (session.getAttribute("flagStatus").equals("MOD")) {%>
            <c:if test="${item == 'FLOW:MOD'}">
                <input type="button" name="validate" id="btn-validate" value="Validate" />
                <!--<input type="button" name="submit_template" id="submit_template" value="Save As Template">-->
            </c:if>
            <% } else if (session.getAttribute("flagStatus").equals("CVT-MOD")) { %>
            <c:if test="${item == 'FLOW:CVT-MOD'}">
                <input type="button" name="validate" id="btn-validate" value="Validate" />
                <!--<input type="button" name="submit_template" id="submit_template" value="Save As Template">-->
            </c:if>
            <% } %>
            <% } else { %>
            <c:if test="${item == 'FLOW:CREATE'}">
                <input type="button" name="validate" id="btn-validate" value="Validate" />
                <!--<input type="button" name="submit_template" id="submit_template" value="Save As Template">-->
            </c:if>
            <% } %>
        </c:forEach>
        
        <!--<input type="button" name="export" id="btn-export" value="Export" />-->
        
    </div>
    

</div>