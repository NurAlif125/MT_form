<%-- 
    Document   : user_login_report
    Created on : Nov 10, 2017, 12:28:41 PM
    Author     : AplDev2
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
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
</script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:REPORTING'}">
            <div id="judul">Audit Trail Report</div>
            <form id="form1" name="form1" method="post" action="SCPrintUserLogin" target="_blank">
                <% Date tgl_today = new java.util.Date();
                            pageContext.setAttribute("tgl_today", tgl_today);%>
                <c:set var="tgl_today" value="${tgl_today}" />

                <div id="tabs-1" class="formBody">
                    <div class="form-row"><span class="labelL2">User ID</span>
                        <input type="text" name="user_id" id="user_id" value="" size="10" />
                    </div>
                    <div class="form-row"><span class="labelL2">Date From</span>
                        <input type="text" name="date_from" id="date_from" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />" size="10" />
                    </div>
                    <div class="form-row"><span class="labelL2">Date End</span>
                        <input type="text" name="date_end" id="date_end" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" />" size="10" />
                    </div>
                </div>
                <div class="form-row-action">
                    <input type="submit" name="print" id="print" value="View" />
                    <input type="reset" name="reset" id="reset" value="Reset" />
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>
