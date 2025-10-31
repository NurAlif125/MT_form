<%@ include file="header.jsp" %>
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<div id="isi">
    <div id="judul">Housekeeping</div>
    <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
        <ul class="tabs">
            <c:forEach var="item" items="${role}">
                <c:if test="${item == 'HOUSEKEEPING:LIVE'}">
                    <li><a href="#" rel="view1">Database Live</a></li>
                </c:if>
            </c:forEach>
            <c:forEach var="item" items="${role}">
                <c:if test="${item == 'HOUSEKEEPING:BACKUP'}">
                    <li><a href="#" rel="view2">Database Backup</a></li>
                </c:if>
            </c:forEach>
            <c:forEach var="item" items="${role}">
                <c:if test="${item == 'HOUSEKEEPING:ARCHIVING'}">
                    <li><a href="#" rel="view3">Database Archive</a></li>
                </c:if>
            </c:forEach>
            <c:forEach var="item" items="${role}">
                <c:if test="${item == 'HOUSEKEEPING:RESTORE'}">
                    <li><a href="#" rel="view4">Database Restore</a></li>
                </c:if>
            </c:forEach>
        </ul>
        <div class="tabcontents">
            <c:forEach var="item" items="${role}">
                <c:if test="${item == 'HOUSEKEEPING:LIVE'}">
                    <div id="view1" class="tabcontent">
                        Script for database live
                    </div>
                </c:if>
            </c:forEach>
            <c:forEach var="item" items="${role}">
                <c:if test="${item == 'HOUSEKEEPING:BACKUP'}">
                    <div id="view2" class="tabcontent">
                        Script for database backup
                    </div>
                </c:if>
            </c:forEach>
            <c:forEach var="item" items="${role}">
                <c:if test="${item == 'HOUSEKEEPING:ARCHIVING'}">
                    <div id="view3" class="tabcontent">
                        Script for database archive
                    </div>
                </c:if>
            </c:forEach>
            <c:forEach var="item" items="${role}">
                <c:if test="${item == 'HOUSEKEEPING:RESTORE'}">
                    <div id="view4" class="tabcontent">
                        Script for database restore
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

</div>

