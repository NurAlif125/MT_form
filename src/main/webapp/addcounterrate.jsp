<%-- 
    Document   : addcounterrate
    Created on : Aug 17, 2023, 10:25:22 PM
    Author     : baim
--%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="header.jsp" %>
<%@ include file="rule/validateList_scr.jsp" %>
<%--<%@ include file="rule/validate_counterrate.jsp"%>--%> 
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link rel="stylesheet" href="css/helper.css" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script>
    function onlyLetters(event) {
        var input = event.target.value;
        var letters = /^[A-Za-z]+$/;

        if (!input.match(letters)) {
            event.target.value = input.replace(/[^A-Za-z]/g, '');
        }
    }
    function validateInput(event) {
        var input = event.target.value;
        var letters = /^[A-Za-z]+$/;
        // Menghapus karakter selain angka
        event.target.value = input.value.replace(/[^0-9]/g, '');

//function onlynum(event) {
//  input.value = input.value.replace(/[^0-9]/g, ''); // Menghapus karakter selain angka
    }
    function convertToUpperCase(event) {
        var input = event.target.value;
        event.target.value = input.toUpperCase();
    }
</script>
<div id="isi">
    <% Date tgl_today = new java.util.Date();
        pageContext.setAttribute("tgl_today", tgl_today);%>
    <c:set var="tgl_today" value="${tgl_today}" />
    <c:forEach var="item" items="${role}"><c:if test="${item == 'CTR:ADD'}">
            <div id="judul">  <%if (request.getParameter("id") == null) {%>                     
                Add Counter Rate<% } else { %> View Counter Rate <% }%>
                <c:forEach var="item" items="${role}">                  
                    <c:if test="${item == 'CTR:LIST'}"> 
                        <a href="CounterRateList" class="srb3">Counter Rate List</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="message">
                <span class="style1">
                    <div align="center">
                        <c:out value="${errorMsg}"/>
                    </div>
                </span>
            </div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="SCDataCounterRate">
                    <input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>" />
                    <div id="tabs-1" class="formBody">

                        <div class="form-row"><span class="labelL3" >Currency <b style="color: red">*</b></span>
                            <input type="text" name="currency" id="currency" maxlength="3" minlength="3" autocomplete="off"oninput="convertToUpperCase(event);onlyLetters(event)" required="true" value="<c:out value="${CounterRatebyId.currency}" />" />
                        </div>
                        <div class="form-row"><span class="labelL3">Against Currency<b style="color: red">*</b></span>
                            <input type="text" name="against_currency" id="against_currency" maxlength="3" minlength="3" oninput=" convertToUpperCase(event);onlyLetters(event)" autocomplete="off" required="true"  value="<c:out value="${CounterRatebyId.against_currency}" />" />
                        </div>

                        <div class="form-row"><span class="labelL3">Date</span>
                            <input type="text" name="tanggal" id="tanggal" value="<c:choose><c:when test="${CounterRatebyId.tanggal==null}"><fmt:formatDate pattern="yyyy-MM-dd" value="${tgl_today}" /></c:when><c:otherwise><c:out value="${CounterRatebyId.tanggal}"/></c:otherwise></c:choose>"> 
                                </div>

                                <div class="form-row"><span class="labelL3">TC BUY</span>
                                        <input type="text" name="tc_buy" id="tc_buy" maxlength="20" minlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"autocomplete="off" value="<c:out value="${CounterRatebyId.tc_buy}" />" />
                        </div>

                        <div class="form-row"><span class="labelL3">TT BUY</span>
                            <input type="text" name="tt_buy" id="tt_buy" maxlength="20"  minlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" autocomplete="off" required="true"  value="<c:out value="${CounterRatebyId.tt_buy}" />" />
                        </div>
                        <div class="form-row"><span class="labelL3">TT SELL</span>
                            <input type="text" name="tt_sell" id="tt_sell" maxlength="20" minlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" autocomplete="off" required="true"  value="<c:out value="${CounterRatebyId.tt_sell}" />" />
                        </div>

                        <div class="form-row"><span class="labelL3">TC SELL</span>
                            <input type="text" name="tc_sell" id="tc_sell" maxlength="20" minlength="3 "oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" autocomplete="off" value="<c:out value="${CounterRatebyId.tc_sell}" />" />
                        </div>

                        <div class="form-row"><span class="labelL3">Update By</span>
                            <input type="text" name="update_by" id="update_by" maxlength="50" autocomplete="off" readonly="true" value="<c:out value="${CounterRatebyId.update_by}" />" />
                        </div>

                        <div class="form-row"><span class="labelL3">Update Date</span>
                            <input type="text" name="update_date" id="update_date" maxlength="20" autocomplete="off" readonly="true" value="<c:out value="${CounterRatebyId.update_date}" />" />
                        </div>
                    </div>
                    <div class="form-row-action">
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'CTR:ADD'}">                       
                                <%if (request.getParameter("id") == null) {%>                     
                                <input type="submit" name="submit" id="submit" value="Save" />
                                <%}%> </c:if></c:forEach>
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'CTR:UPDATE'}">                        
                                <%if (request.getParameter("id") == null) {
                             } else {%>    
                                <input type="submit" name="submit" id="submit" value="Update" />
                                <input type="submit" name="delete" id="delete" value="Delete" />
                                <%}%> </c:if></c:forEach>
                                <input type="button" name="back" id="back" value="Back" />
                                <input type="reset" name="reset" id="reset" value="Reset" />
                                <div class="form-row-action-right"> 
                                </div>
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
