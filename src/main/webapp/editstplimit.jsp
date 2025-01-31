<%-- 
    Document   : editapplimit
    Created on : Apr 11, 2018, 4:15:37 PM
    Author     : AplDev2
--%>

<%@ include file="header.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'STP_LIMIT:UPDATE'}">
            <div id="judul">Update STP Limit
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'STP_LIMIT:LIST'}">
                        <a href="SCSTPLimitList" class="srb3">STP Limit List</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="SCSTPLimit">
                    <input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>" />
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL2">Currency</span>
                            <input type="text" disabled="disabled" name="currency" id="currency" maxlength="3" size="3" value="<c:out value="${dataLimitById.currency}" />" />
                        </div>
                        <div class="form-row"><span class="labelL2">Limit</span>
                            <input type="text" name="limit" id="limit" maxlength="18" oninput="fu()" value="<c:out value="${dataLimitById.limit}" />" />
                            <span id="show"></span>
                        </div>
                        <script language="javascript">
                            function formatUang(n, currency) {
                                return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                            }
                            function fu(){
                                
                            var number2 = document.getElementById('limit').value;
                            var number2r = number2.replace(',', '.');
                            var number2F = parseFloat(number2r);
                            var nominal = formatUang(number2F, "");
                            var nominalStyle = nominal.fontsize(3);
                            var nominalStylec = nominalStyle.fontcolor("green");
                            document.getElementById("show").innerHTML = nominalStylec;
                            }
                        </script>
                        <div class="form-row"><span class="labelL2">Update By</span>
                            <input type="text" disabled="disabled" name="updateby" id="updateby" maxlength="50" value="<c:out value="${dataLimitById.updateBy}" />" />
                        </div>
                        <div class="form-row"><span class="labelL2">Update Date</span>
                            <input type="text" disabled="disabled"  name="tanggalupdate" id="tanggalupdate" maxlength="30" value="<c:out value="${dataLimitById.tanggal}" />" />
                        </div>
                    </div>
                    <div class="form-row-action">
                        <input type="submit" name="submit" id="submit" value="Save" />
                        <input type="reset" name="reset" id="reset" value="Reset" />
                        <input type="button" name="back" id="back" value="Back" />
                    </div>
                </form>
            </div>
        </c:if>
    </c:forEach>
</div>
