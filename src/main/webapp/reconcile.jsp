<%--
    Document   : Report_print.jsp
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<%@ include file="rule/validate_recon.jsp" %>

<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:REPORTING'}">
            <div id="judul">Reconcile Report</div>
            <form id="form1" name="form1" method="post" action="#" target="_blank">
                <% Date tgl_today = new java.util.Date();
                    pageContext.setAttribute("tgl_today", tgl_today);%>
                <c:set var="tgl_today" value="${tgl_today}" />

                <div id="tabs-1" class="formBody">
                    <div class="form-row"><span class="labelL2">I/O</span>
                        <select name="io_type" id="io_type">
                            <option value="IO">All</option>
                            <option value="I">Outgoing</option>
                            <option value="O">Incoming</option>
                        </select>
                    </div>
                    <div class="form-row"><span class="labelL2">Filter</span>
                        <select name="filter_msg" id="filter_msg">
                            <option value="" disabled selected>Select</option>
                            <option value="1">Spectrum</option>
                            <option value="2">Systrade</option>
                            <option value="3">Host</option>
                            <option value="4">Interbank</option>
                        </select>
                    </div>
                    <div class="form-row"><span class="labelL2">Date From</span>
                        <input type="text" name="date_from" id="date_from" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${tgl_today}' />" size="6" placeholder="YYYY-MM-DD" />
                    </div>
                    <div class="form-row"><span class="labelL2">Date End</span>
                        <input type="text" name="date_end" id="date_end" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${tgl_today}' />" size="6" placeholder="YYYY-MM-DD" />
                    </div>
                    <div class="form-row">
                        <span class="labelL2">Nostro/ Correspondent</span>
                        <select name="nostro" id="nostro">
                            <option value="">Select</option>
                            <c:forEach var="item" items="${dataNosRecon}">
                                <option value="${item.swift_code}" 
                                        <c:if test="${item.swift_code == param.f_swiftCode}"> selected="true" </c:if>>
                                    ${item.swift_code}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-row"><span class="labelL2">Currency</span>
                        <input type="text" name="cust_curr" id="cust_curr" value="" size="3" />
                    </div>
                    <div class="form-row"><span class="labelL2">Value Date From</span>
                        <input type="text" name="value_date" id="value_date" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${tgl_today}' />" size="6" />
                    </div>
                    <div class="form-row"><span class="labelL2">Value Date End</span>
                        <input type="text" name="value_date_end" id="value_date_end" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${tgl_today}' />" size="6" />
                    </div>
                    <div class="form-row"><span class="labelL2">No Reff</span>
                        <input type="text" name="no_reff" id="no_reff" value="" size="10" />
                    </div>
                </div>
                <div class="form-row-action">
                    <input type="button" name="print_recon" id="print_recon" value="Print Recon" />
                    <input type="reset" name="reset" id="reset" value="Reset" />
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>