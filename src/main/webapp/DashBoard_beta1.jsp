<%-- 
    Document   : DashBoard_beta1
    Created on : Jul 20, 2020, 3:43:04 PM
    Author     : LT440
--%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link rel="stylesheet" href="css/helper.css" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>


<script type="text/javascript">
    $(function () {
    <%DBconnection dbConn = new DBconnection();%>
    <%DBHeader dbh = new DBHeader(dbConn.getConnection());%>

    <%DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");%>
    <%Date date = new Date();%>
    <%String tanggal1 = request.getParameter("date_from");%>
    <%String tanggal2 = request.getParameter("date_end");
       %>

    });
</script>

<div id="isi">
    <div id="judul">Dashboard</div>
    <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
        <ul class="tabs">
            <li><a href="#" rel="view1">Daily Outgoing Transactions</a></li>
            <li><a href="#" rel="view2">Daily Transactions</a></li>
            <li><a href="#" rel="view3">Yearly Transactions</a></li>
        </ul>
        <div class="tabcontents">
            <div id="view1" class="tabcontent">
                <%@ include file="DashBoard.jsp" %>
            </div>
            <div id="view2" class="tabcontent">
                <%@ include file="DailyTransactions.jsp" %>
            </div>
            <%--            <div id="view3" class="tabcontent">
                            <%@ include file="yearly_transactions.jsp" %>
            </div>--%>


        </div>
    </div>
</div>