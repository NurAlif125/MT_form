<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--20220118-->
<% if (session.getAttribute("flagFilter") == null) {%>
<% if (session.getAttribute("flagStatus").equals("NACK")) {%>
<c:if test="${item == 'FLOW:MOD'}">
    <input type="button" name="modified" id="modified" value="Modify" />
</c:if>
<% }%>
<% } else { %>
<% if (session.getAttribute("flagStatus").equals("INC-WAIT")) {%>
<c:if test="${item == 'FLOW:INC'}">
    <input type="button" name="verifyACC" id="verifyACC" value="Adjustment Name" />
    <input type="button" name="investigate" id="investigate" value="Investigate" />
    <input type="button" name="sendTEXT" id="sendTEXT" value="Send Message to Core" />
    <input type="button" name="reject" id="reject" value="Reject" />
</c:if>
<c:if test="${item == 'FLOW:RETUR'}">
    <input type="button" name="retur" id="retur" value="Retur" />
</c:if>
<% }%>
<% if (session.getAttribute("flagStatus").equals("INC-STL")) {%>
<c:if test="${item == 'FLOW:INC'}">
    <input type="button" name="reSendTEXT" id="reSendTEXT" value="Resend Message" />
</c:if>
<% }%>
<% if (session.getAttribute("flagStatus").equals("MOD")) {%>
<c:if test="${item == 'FLOW:CREATE'}">
    <c:choose>
        <c:when test="${fn:contains(headerById.komentar, 'cant find the corresponding nostro') || fn:contains(headerById.komentar, 'cannot find country code')}">
            <input type="hidden" name="flag" id="flag" value="MOD_RPR" />
            <input type="submit" name="modrepair" id="modrepair" value="Mod Repair" />
            <script>
                $('#modrepair').click(function () {
                    var answer = confirm('Do you want to repair this Message?');
                    return answer;
                });
            </script>
        </c:when>
        <c:otherwise>
            <input type="hidden" name="flag" id="flag" value="VER" />
            <c:if test="${headerById.networktype=='MT'}">
                <input type="submit" name="submit_mt" id="submit_mt" value="Save" />
            </c:if>
            <c:if test="${headerById.networktype=='MX'}">
                <input type="submit" name="submit_mx" id="submit_mx" value="Save" />
                <script>
                    var nodeIsGenerator = document.getElementById("generator-farras")

                    var nodeReceiverInstitution = document.getElementById("receiver_institution")
                    var nodeLogicalTerminal = document.getElementById("sender_logical_terminal")

                    console.log(nodeReceiverInstitution)
                    console.log(nodeLogicalTerminal)

                    if (nodeIsGenerator) {
                        var nodeForm = document.getElementById("form1")

                        nodeForm.addEventListener("submit", function (e) {
                            console.log("Ini ada di mod")
                            e.preventDefault()
                            var xml = htmlToXML(nodeForm)

                            // buat element untuk menampung data XML
                            var input = document.createElement("input")

                            input.setAttribute("name", "dataXML")
                            input.setAttribute("value", xml)
                            nodeForm.appendChild(input)

                            // disini untuk append child receiver dan logical terminal
                            nodeForm.appendChild(nodeReceiverInstitution)
                            nodeForm.appendChild(nodeLogicalTerminal)

                            nodeForm.submit()
                        })
                        console.log("Ini XML")
                    } else {
                        console.log("Ini MT")
                    }
                </script>
                <!--20231008 dikomen supaya semua disave dulu untuk memastikan field mandatory terisi-->
                <!--<input type="button" name="verified" id="verified" value="Verify" />--> 
            </c:if>
        </c:otherwise>
    </c:choose>
</c:if>
<%}%>
<% if (session.getAttribute("flagStatus").equals("VER")) {%>
<c:if test="${item == 'FLOW:AUTH'}">
    <input type="button" name="authorized" id="authorized" value="Authorize" />
</c:if>
<%}%>
<% if (session.getAttribute("flagStatus").equals("AUTH")) {%>
<c:if test="${item == 'FLOW:TEXT'}">
    <input type="button" name="generated" id="generated" value="Resend" />
</c:if>
<%}%>
<% if (session.getAttribute("flagStatus").equals("INC-NOK")) {%>
<c:if test="${item == 'FLOW:INC'}">
    <input type="button" name="incoming_settle" id="incoming_settle" value="Incoming Settle" />
    <input type="button" name="search_cover" id="search_cover" value="Search Cover" /> <!-- 20191231 ditambah search cover -->
    <input type="button" name="reject" id="reject" value="Reject" />
</c:if>
<% }%>
<% if (session.getAttribute("flagStatus").equals("INC-OK")) {%>
<c:if test="${item == 'FLOW:INC'}">
    <input type="button" name="incoming_settle" id="incoming_settle" value="Incoming Settle" />
    <input type="button" name="search_cover" id="search_cover" value="Search Cover" /> <!-- 20191231 ditambah search cover -->
    <input type="button" name="reject" id="reject" value="Reject" />
</c:if>
<% if (session.getAttribute("flagStatus").equals("INC-STLHOLD")) {%>
<c:if test="${item == 'FLOW:INC'}">
<!--    <input type="button" name="verifyACC" id="verifyACC" value="Adjustment Name" />
    <input type="button" name="sendTEXT" id="sendTEXT" value="Send Message to Core" />-->
    <input type="button" name="manual_settle" id="manual_settle" value="Manual Settle" />

</c:if>
<% }%>
<% if (session.getAttribute("flagStatus").equals("VER")) {%>
<c:if test="${item == 'FLOW:MOD'}">
    <input type="button" name="modified" id="modified" value="Modify" />
</c:if>
<% }%>
<% if (session.getAttribute("flagStatus").equals("INC-INV")) {%>
<c:if test="${item == 'FLOW:INC'}">
    <input type="button" name="verifyACC" id="verifyACC" value="Adjustment Name" />
    <input type="button" name="sendTEXT" id="sendTEXT" value="Send Message to Core" />
</c:if>
<c:if test="${item == 'FLOW:RETUR'}">
    <input type="button" name="returinv" id="returinv" value="Retur" />
</c:if>
<% }%>
<% if (!(((String) session.getAttribute("flagStatus")).equals("REJECT") || ((String) session.getAttribute("flagStatus")).equals("TEXT") || ((String) session.getAttribute("flagStatus")).equals("RETURNED") || ((String) session.getAttribute("flagStatus")).equals("INC-NOK") || ((String) session.getAttribute("flagStatus")).equals("INC-OK") || ((String) session.getAttribute("flagStatus")).equals("INC-HOLD") || ((String) session.getAttribute("flagStatus")).equals("AUTH") || ((String) session.getAttribute("flagStatus")).equals("ACK") || ((String) session.getAttribute("flagStatus")).equals("NACK") || ((String) session.getAttribute("flagStatus")).equals("INC") || ((String) session.getAttribute("flagStatus")).equals("INC-WAIT") || ((String) session.getAttribute("flagStatus")).equals("RACK") || ((String) session.getAttribute("flagStatus")).equals("INC-ROK") || ((String) session.getAttribute("flagStatus")).equals("INC-STL") || ((String) session.getAttribute("flagStatus")).equals("INC-CNF"))) {%>
<c:if test="${item == 'FLOW:REJECT'}">
    <input type="button" name="reject" id="reject" value="Reject" />
</c:if>
<% }%>
<% }%>
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
<% }%>
<!--end 20180417-->