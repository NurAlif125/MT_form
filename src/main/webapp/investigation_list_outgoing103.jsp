<%--
    Document  addcharges
    Created on Jan 31, 2013, 5:36:52 PM
    Author    hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link rel="stylesheet" href="css/helper.css" type="text/css">
<link href="css/MT.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:199'}">
            <div id="message">
                <span class="style1">
                    <div align="center">
                        <c:out value="${errorMsg}"/>
                    </div>
                </span>
            </div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="SCInvesitvationOutgoing103">
                    <input type="hidden" name="action" id="action" value="submit" />
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL3">Refference</span>
                            <input autocomplete="off" auto required type="text" name="refference" id="refference" maxlength="16" oninput="this.value = this.value.toUpperCase()" value="<c:out value="${refference}" />"/>
                        </div>
                        <div class="form-row"><span class="labelL3">Receiver (BIC 11)</span>
                            <input autocomplete="off" required type="text" name="receiver" id="receiver" minlength="11" maxlength="11"  oninput="this.value = this.value.toUpperCase()" value="<c:out value="${receiver}" />"/>
                        </div>
                        <div class="form-row"><span class="labelL3">Date Value</span>
                            <input autocomplete="off" required type="text" name="dateValue" id="dateValue" value="<c:out value="${dateValue}" />"/>
                        </div>
                        <div class="form-row"><span class="labelL3">Currency</span>
                            <input autocomplete="off" required type="text" name="currency" id="currency" maxlength="3" minlength="3" oninput="this.value = this.value.toUpperCase()" value="<c:out value="${currency}" />"/>
                        </div>
                    </div>
                    <!--                <div class="form-row"><span class="labelL2">&nbsp;</span>-->
                    <div class="form-row-action">
                        <input type="submit" name="submit" id="submit" value="Save" />
                        <input type="reset" name="reset" id="reset" value="Reset" />
                        <input type="button" name="back" id="back" value="Back" />
                    </div>

                </form>
                <div id="dialog"></div>
            </div>
        </c:if>
    </c:forEach>
</div>
<!--<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>-->