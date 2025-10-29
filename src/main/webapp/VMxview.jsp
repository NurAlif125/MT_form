<%-- 
    Document   : VMxview
    Created on : Jul 26, 2023, 3:10:07 PM
    Author     : Baim
--%>
<!--Link CM Header-->
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />  <!-- doesnt need that -->
<script src="js/tabcontent.js" type="text/javascript"></script> <!-- doesnt need that -->
<script src="js/mt.js" type="text/javascript"></script> <!-- Sudah ditambahkan -->
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link rel="stylesheet" href="css/helper.css" type="text/css">
<link type="text/css" href="css/paging/pagingheader.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script> <!-- sudah ditambahkan -->
<script type="text/javascript" src="js/validateDate.js"></script> <!-- Sudah ditambahkan -->






<!--link rell Vmx-->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>
-->
<!--<link rel="stylesheet" href="data-tree.css" />--> 
<link rel="stylesheet" href="js/json-xml-data-tree/data-tree.css" />
<style>
    .scrl {
        position: relative;
        height: 600px;
        overflow: auto;
    }

    .codex-editor__redactor { padding-bottom: 30px !important; } 
</style>
<!--header tab contains-->
<%@include file="header.jsp" %>

<div id="isi">
    <div id="judul"> <h4>MX <c:out value="${message_type}" /> Message</h4></br>
        <input name="messageType" id="messageType" type="hidden" value="<c:out value="${message_type}" />" />
        <input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>" /></div>
    <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
        <ul class="tabs">
            <li><a href="#" rel="view1">MX Full</a></li>
            <c:if test="${fn:containsIgnoreCase(headerById.messageType, 'pacs.008.001') ||  
                          fn:containsIgnoreCase(headerById.messageType, 'pacs.009.001')}">
            <li><a href="#" rel="view2">Essential Field</a></li>
            </c:if>
            <li><a href="#" rel="view3">Comment</a></li>
            <li><a href="#" rel="view4">Histories</a></li>
            <li><a href="#" rel="view5">Log MX Text</a></li>    
            <li><a href="#" rel="view6">Evidence</a></li>
        </ul>

        <!--div MX Full-->
        <div class="tabcontents">
            <div id="view1" class="tab-content">
                <div class="form-row">
                    <c:choose>
                        <c:when test="${empty multiformat_mt or multiformat_mt == null}">
                            <div class="scrl" id="mxfull" name="mxfull" style="overflow-y: scroll; height:440px; margin-left: 5px; padding: 10px;"> <input type="hidden" name="mxview3" id="mxview3" value="<c:out value="${mx_modify}" />"/></div>
                        </c:when>
                        <c:otherwise>
                                <%@include file="VMxFull.jsp" %>

                        </c:otherwise>
                    </c:choose>
                    <input type="hidden" name="cust_curr" id="cust_curr" maxlength="3" value="<c:out value="${headerById.cust_curr}" /> "/>  
                </div>
            </div>
           <c:if test="${fn:containsIgnoreCase(headerById.messageType,'pacs.008.001')}">
                <!--div essential Field-->
                <div id="view2" class="tab-content"> <%@ include file="essential_field_pacs008.jsp" %></div>
            </c:if>
            <c:if test="${fn:containsIgnoreCase(headerById.messageType,'pacs.009.001')}">
                <!--div essential Field-->
                <div id="view2" class="tab-content"> <%@ include file="essential_field_pacs009.jsp" %></div>
            </c:if>
            <!--div Comment-->
            <div id="view3" class="tab-content"> <%@ include file="comment_mt.jsp" %></div>
            <!--div Histoies-->
            <div id="view4" class="tab-content"> <%@ include file="history_mt.jsp" %></div>
            <!--div log mx-->
            <div id="view5" class="tab-content">
                <!--tags MX Original--> 
                <div class="form-row">
                    <%@include file="VMxhistory.jsp" %>
                </div>
            </div>
            <div id="view6" class="tabcontent">
                <%@ include file="evidence_list.jsp" %>
            </div>

            <!--div penutup Mx tab header tab contains-->
        </div>
    </div>
    <form id="form1">
        <%@ include file="button_action.jsp" %>
    </form>
    
</div>
<% if (session.getAttribute("flagStatus").equals("INC-AML")) {%>
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-wrapper">
        <div class="modal-head">
            <span class="close">&times;</span>
        </div>
        <div class="modal-content">
            <form action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Are you sure?')">
                <table class="modal-table">
                    <tr>
                        <th colspan="6">Please enter the reason why this transaction OK to release</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="messageType" id="messageType" value="<c:out value="${message_type}" />" />
                            <input type="hidden" name="flag" id="flag" value="INC-CLNEVD" />
                            <input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>" />
                            <textarea rows="5" cols="50" name="user_reason" required="true"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="submit" value="Ok to Release" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<div id="myModal2" class="modal">
    <!-- Modal content -->
    <div class="modal-wrapper">
        <div class="modal-head">
            <span class="close2">&times;</span>
        </div>
        <div class="modal-content">
            <form action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Are you sure?')">
                <table class="modal-table">
                    <tr>
                        <th colspan="6">Please enter the reason why this transaction <b style="color:red;">Not OK</b> to release</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="messageType" id="messageType" value="<c:out value="${message_type}" />" />
                            <input type="hidden" name="flag" id="flag" value="INC-BLOCK" />
                            <input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>" />
                            <textarea rows="5" cols="50" name="user_reason" required="true"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="submit" value="Not Ok to Release" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<% } %>
<% if (session.getAttribute("flagStatus").equals("INC-CLNHLD")) {%>
<div id="myModal3" class="modal">
    <!-- Modal content -->
    <div class="modal-wrapper">
        <div class="modal-head">
            <span class="close3">&times;</span>
        </div>
        <div class="modal-content">
            <form action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Are you sure?')">
                <table class="modal-table">
                    <tr>
                        <th colspan="6">Please enter the reason why this transaction returned to BD/CCS</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="messageType" id="messageType" value="<c:out value="${message_type}" />" />
                            <input type="hidden" name="flag" id="flag" value="INC-CLNEVD" />
                            <input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>" />
                            <textarea rows="5" cols="50" name="user_reason" required="true"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="submit" value="Return to BD/CCS" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<% }%>
<% if (session.getAttribute("flagStatus").equals("INC-AML")) {%>
<script>
    // Get the modal
    var modal = document.getElementById("myModal");
    var modal2 = document.getElementById("myModal2");

    // Get the button that opens the modal
    var btn = document.getElementById("setAMLCLEANEVDForm");
    var btn2 = document.getElementById("setAMLBLOCKForm");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    var span2 = document.getElementsByClassName("close2")[0];

    // When the user clicks the button, open the modal 
    btn.onclick = function () {
        modal.style.display = "block";
//        document.getElementById('acc_rej').innerHTML = "Please enter the reason why this transaction ok to release";
//        document.getElementById('flag').value = "INC-CLNEVD";
    }
    
    btn2.onclick = function () {
        modal2.style.display = "block";
//        document.getElementById('acc_rej').innerHTML = "Please enter the reason why this transaction not ok to release";
//        document.getElementById('flag').value = "INC-BLOCK";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }
    
    span2.onclick = function () {
        modal2.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
        if (event.target == modal2) {
            modal2.style.display = "none";
        }
    }
</script>
<% } %>
<% if (session.getAttribute("flagStatus").equals("INC-CLNHLD")) {%>
<script>
    // Get the modal
    var modal3 = document.getElementById("myModal3");

    // Get the button that opens the modal
    var btn3 = document.getElementById("returnCLNEVD");

    // Get the <span> element that closes the modal
    var span3 = document.getElementsByClassName("close3")[0];

    // When the user clicks the button, open the modal 
  
    btn3.onclick = function () {
        modal3.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal

    span3.onclick = function () {
        modal3.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal3) {
            modal3.style.display = "none";
        }
    }
</script>
<% }%>
<!--Script Alamat JS--> 
<!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>-->
<script type="text/javascript" src="js/json-xml-data-tree/data-tree.js"></script>
<script>
    var xmldat = document.getElementById("mxview3").value;
    new DataTree({
        xml: xmldat,
        container: '#mxfull',
        attrs: 'show',
        startExpanded: true
    });
</script>
