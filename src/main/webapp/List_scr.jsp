<%--
    Document   : List_scr.jsp
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<%@ page import="java.util.*" %>
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link rel="stylesheet" href="css/helper.css" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<div id="isi">
    <!-- Tabs -->
    <div id="judul">List Search</div>
    <form id="form1" name="form1" method="post" action="controllerHeaders?find=yes">
        <% Date tgl_today = new java.util.Date();
            pageContext.setAttribute("tgl_today", tgl_today); %>
        <c:set var="tgl_today" value="${tgl_today}" />

        <div id="tabs-1" class="formBody">
            <div class="form-row"><span class="labelL">Database</span>
                <select name="db_type" id="db_type">
                    <option value="live">Live</option>
                    <c:forEach var="item" items="${role}">
                        <c:if test="${item == 'HOUSEKEEPING:ARCHIVING'}">
                            <option value="backup">Archive</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="form-row"><span class="labelL">I/O</span>
                <select name="io_type" id="io_type">
                    <c:forEach var="item" items="${role}">
                        <c:if test="${item == 'TYPE:OUTGOING_INCOMING'}">
                            <option value="IO">All</option>
                            <option value="O">Incoming</option>
                            <option value="I">Outgoing</option>
                        </c:if>
                        <c:if test="${item == 'TYPE:INCOMING'}">
                            <option value="O">Incoming</option>
                        </c:if>
                        <c:if test="${item == 'TYPE:OUTGOING'}">
                            <option value="I">Outgoing</option>
                        </c:if>
                    </c:forEach> 
                </select>
            </div>
            <div class="form-row"><span class="labelL">Sender Logical Terminal</span>
                <input type="text" name="sender_logical_terminal" id="sender_logical_terminal" maxlength="12" /> [ex.INDOIDJAXXXX]
            </div>
            <div class="form-row"><span class="labelL">Receiver Institution</span>
                <input type="text" name="receiver_institution" id="receiver_institution" maxlength="12" /> [ex.INDOIDJAXXXX]
            </div>
<!--//ditambahkan pada 20151102 By Azan-->
<!--            <div class="form-row"><span class="labelL">Sender</span>
                <input type="text" name="sender_bank" id="sender_bank" maxlength="12" /> [ex.SPXAIDJAXXX]
            </div>
            <div class="form-row"><span class="labelL">Receiver</span>
                <input type="text" name="receiver_bank" id="receiver_bank" maxlength="12" /> [ex.SPXAIDJAXXX]
            </div>-->
            <!--end of tambahan 20151102-->
            <div class="form-row"><span class="labelL">MT</span>
                <input type="text" name="mt_type" id="mt_type" maxlength="3" size="3" /> [ex.103]
            </div>
            <div class="form-row"><span class="labelL">Date From</span>
                <input type="text" name="date_from" id="date_from" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${tgl_today}' />" size="10" /> [ex.2013-31-01]
            </div>
            <div class="form-row"><span class="labelL">Date End</span>
                <input type="text" name="date_end" id="date_end" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${tgl_today}' />" size="10" /> [ex.2013-31-01]
            </div>
            <!--// ditambahkan parameter INC-XXX pada 20151001 by Azan-->
            <div class="form-row"><span class="labelL">Status</span>
                <% if (session.getAttribute("flagFilter") == null) { %>
                    <%
                        String[] flags = new String[]{"MOD", "VER", "AUTH", "FIA-FAILED", "FIA-FAILED-CNF", "FIA-RESEND", "UNSETTLE-OUT", "WAITING-SAA-CNF", "WAITING-SAA-RESEND",
                            "WAITING-AML", "AML-TERMINATE-OUT", "REJECT", "AML-FAILED", "AML-FAILED-CNF", "AML-RESEND", "CVT-MOD", "CVT-VER", "CVT-VER-RESEND",
                            "ACK", "NACK", "INC-CVT", "RESEND-CNF", "INC-CVT-RESEND", "INC-AML", "AML-TERMINATE-IN", "INC-AML-FAILED", "INC-AML-FAILED-CNF", "INC-AML-RESEND",
                        "UNSETTLE-INC", "INC-RESEND-CNF", "INC-RESEND", "SETTLE"};
                        pageContext.setAttribute("flags", flags);
                    %>
                    <select name="status" id="status">
                        <option value="">ALL</option>
                        <c:forEach var="data" items="${pageScope.flags}">
                            <option value="${data}">${data}</option>
                        </c:forEach>
                    </select>
                <% } else { %>
                    <select name="status" id="status" readonly="true">
                        <option value="<%= session.getAttribute("flag") %>"><%= session.getAttribute("flag") %></option>
                    </select>
                <% } %>
            </div>
            <div class="form-row"><span class="labelL">Sender's Reference</span>
                <input type="text" name="sender_reference" id="sender_reference" /> [ex.Ref0001]
            </div>
            <!--// ditambahkan rel_reference pada 20151001 by Azan-->
            <div class="form-row"><span class="labelL">Related Reference</span>
                <input type="text" name="rel_reference" id="rel_reference" /> [ex.RelRef0001]
            </div>
            <div class="form-row"><span class="labelL">Currency Code</span>
                <input type="text" name="currency_code" id="currency_code" size="3" /> [ex.IDR]
            </div>
            <div class="form-row"><span class="labelL">Amount</span>
                <input type="text" name="amount" id="amount" /> [ex.1000,05]
            </div>
        </div>
        <div class="form-row-action">
            <input type="submit" name="search" id="search" value="Search" />
            <input type="reset" name="reset" id="reset" value="Reset" />
            <input type="button" name="back" id="back" value="Back" />
        </div>
    </form>
</div>
