<%-- 
    Document   : mt
    Created on : Apr 30, 2025, 2:14:57 AM
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
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/editorjs@latest.js"></script>
<script src="js/json-xml-data-tree/data-tree.js"></script>
<link rel="stylesheet" href="js/json-xml-data-tree/data-tree.css" />
<style>
    .scrl {
        position: relative;
        height: 600px;
        overflow: auto;
    }
    .codex-editor__redactor {
        padding-bottom: 30px !important;
    }

</style>
<div id="isi">
    <div id="judul">${headerById.messageType}</div>
    <form id="form1" class="form-mx" name="form1" method="post" action="#">
        <input name="messageType" id="messageType" type="hidden" value="${headerById.messageType}" />
        <input type="hidden" name="id" id="id" value="<%= request.getParameter("id")%>" />
        <div style="width:100%; margin: 0 auto; font: 0.85em arial">
            <div class="tabcontents">
                <div class="tabcontent">
                    <div class="form-row">
                        <div class="form-cols">
                            <h1>MT</h1>
                            <div class=" shadow-sm p-3 bg-body rounded">
                                <input type="hidden" name="mxview2" id="mxview2" value="<c:out value="${textById.final_mt}"/>" />
                                <div style="font-size: 12px;" class="scrl" id="editor">
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row-action container_">
            <div class="btn--group">
                <input type="button" name="back" id="back" value="Back" />
            </div>
        </div>
    </form>
</div>