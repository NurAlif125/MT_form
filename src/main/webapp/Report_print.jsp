<%--
    Document   : Report_print.jsp
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<%@ page import="java.util.*"%>
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
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript">
    $(window).load(function () {
        $('#slider').nivoSlider();
    });
</script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:REPORTING'}">
            <div id="judul">Transaction Report</div>
            <form id="form1" name="form1" method="post" action="#" target="_blank">
                <% Date tgl_today = new java.util.Date();
                            pageContext.setAttribute("tgl_today", tgl_today);%>
                <c:set var="tgl_today" value="${tgl_today}" />

                <div id="tabs-1" class="formBody">
                    <!--dikomen karena membuat ambigu pada tombol juga ada incoming sama outgoing-->
                    <div class="form-row"><span class="labelL2">I/O</span>
                        <select name="io_type" id="io_type">
                            <option value="IO">All</option>
                            <option value="I">Outgoing</option>
                            <option value="O">Incoming</option>
                        </select>
                    </div>
                    <div class="form-row"><span class="labelL2">Filter</span>
                        <select name="filter_msg" id="filter_msg">
                            <option value="">All</option>
                            <option value="1">Swift Go</option>
                            <option value="0">Non Swift Go</option>
                        </select>
                    </div>
                    <div class="form-row"><span class="labelL2">MT</span>
                        <input type="text" name="mt_type" id="mt_type" value="" size="3" />
                    </div>
                    <div class="form-row"><span class="labelL2">Date From</span>
                        <input type="text" name="date_from" id="date_from" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />" size="10" />
                    </div>
                    <div class="form-row"><span class="labelL2">Date End</span>
                        <input type="text" name="date_end" id="date_end" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />" size="10" />
                    </div>
                    <div class="form-row"><span class="labelL2">Currency</span>
                        <input type="text" name="cust_curr" id="cust_curr" value="" size="3" />
                    </div>
                    <div class="form-row"><span class="labelL2">Value Date From</span>
                        <input type="text" name="value_date" id="value_date" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${tgl_today}' />" size="10" />
                    </div>
                    <div class="form-row"><span class="labelL2">Value Date End</span>
                        <input type="text" name="value_date_end" id="value_date_end" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${tgl_today}' />" size="10" />
                    </div>
                    <div class="form-row"><span class="labelL2">Status</span>
                        <jsp:scriptlet>
                                    //String[] flags = new String[]{"MOD", "VER", "AUTH", "TEXT", "ACK", "NACK", "RACK" ,"INC-OK", "INC-NOK", "INC-ROK", "INC-WAIT" };
                                    String[] flags = new String[]{"MOD", "VER", "AUTH", "TEXT", "INC-OK", "INC-NOK", "ACK", "NACK", "INC-WAIT", "INC-STL", "INC-RSTL", "INC-HOLD", "INC-INV", "INC-RTR", "INC-CNF", "INC-ADJ", "INC-SPOK", "INC-NSTP", "INC-SPRT", "REJECT"};
                                    //String[] flags = new String[]{"ACK", "NACK", "INC-OK", "INC-NOK" };
                                    pageContext.setAttribute("flags", flags);
                        </jsp:scriptlet>
                        <select name="flag" id="flag">
                            <option value="">ALL</option>
                            <c:forEach var="data" items="${pageScope.flags}">
                                <option value="${data}" >${data}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <!--                <div class="form-row"><span class="labelL2">&nbsp;</span>-->
                <div class="form-row-action">
                    <!--                    <input type="button" name="print_pdf_out" id="print_pdf_out" value="PrintPDF Outgoing" />
                                        <input type="button" name="print_pdf_in" id="print_pdf_in" value="PrintPDF Incoming" />-->
                    <input type="button" name="print_pdf" id="print_pdf" value="View PDF" />
                    <input type="button" name="print_xls" id="print_xls" value="View XLS" />
                    <input type="button" name="print_csv" id="print_csv" value="View CSV" />
                    <input type="reset" name="reset" id="reset" value="Reset" />
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>
<!--<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>-->