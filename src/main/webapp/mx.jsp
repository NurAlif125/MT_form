<%-- 
    Document   : mx
    Created on : Apr 29, 2025, 11:14:14 PM
    Author     : rafli
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<script src="js/mt.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/helper.css" media="screen" type="text/css" />
<link rel="stylesheet" href="css/dropdown/dropdown.css" media="screen" type="text/css" />
<link rel="stylesheet" href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" type="text/css" />
<link rel="stylesheet" href="css/tabcontent.css" type="text/css" />
<link rel="stylesheet" href="css/displaytag.css" type="text/css" />
<link rel="stylesheet" href="css/helper.css" type="text/css" />
<link rel="stylesheet" href="css/data-tree.css" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link rel="stylesheet" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/validateDate.js"></script>
<div id="isi">
    <div id="judul">${headerById.messageType}</div>
    <form id="form1" class="form-mx" name="form1" method="post" action="#">
        <input name="messageType" id="messageType" type="hidden" value="${headerById.messageType}" />
        <input type="hidden" name="id" id="id" value="<%= request.getParameter("id")%>" />
        <div style="width:100%; margin: 0 auto; font: 0.85em arial">
            <ul class="tabs">
                <li><a href="#" rel="view3">MX Full</a></li>
                <li><a href="#" rel="view5">Comment</a></li>
                <li><a href="#" rel="view6">Histories</a></li>
            </ul>
            <div class="tabcontents">
                <div id="view3" class="tabcontent">
                    <div class="form-row">
                        <div class="form-cols">
                            <div class="blok-mx">
                                <input type="hidden" name="hiddenmxfull" id="hiddenmxfull" value="<c:out value='${textById.final_mt}'/>" />
                                <div name="mxfull" id="mxfull" style="overflow-y: scroll; height:440px; margin-left: 5px; padding: 10px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="view5" class="tabcontent">
                    <%@ include file="comment_mt.jsp" %>
                </div>
                <div id="view6" class="tabcontent">
                    <%@ include file="history_mt.jsp" %>
                </div>
            </div>
        </div>
        <div class="form-row-action container_">
            <div class="btn--group">
                <%@ include file="button_action.jsp" %>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="js/data-tree.js"></script>
<script type="text/javascript" src="js/fullMX.js"></script>