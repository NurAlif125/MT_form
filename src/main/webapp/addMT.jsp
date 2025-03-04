<%--
    Document   : VDataMT.jsp
    Created on : 20180731 9.39
    Author     : Azan
--%>

<%@ include file="header.jsp" %>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT_QUEUE:ADD'}">
            <div id="judul">Add Message Type
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'MT_QUEUE:LIST'}">
                        <a href="SCDataMTList" class="srb3">Message Type List</a>
                    </c:if>
                </c:forEach>
            </div>

            <form id="form1" name="form1" method="post" action="SCDataMT">
                <input type="hidden" name="id" id="id" value="${dataMTById.id}" />
                <div id="tabs-1" class="formBody">
                    <div class="form-row"><span class="labelL">MT</span>
                        <input type="text" name="mt" id="mt" maxlength="15" size="15" required="required" value="<c:out value="${dataMTById.mt}" />" />
                    </div>
                    <div class="form-row"><span class="labelL">Detail</span>
                        <input type="text" name="detail" id="detail" maxlength="255" size="100" value="<c:out value="${dataMTById.detail}" />" />
                    </div>
                    <div class="form-row"><span class="labelL">Queue</span>
                        <c:if test="${dataMTById.queue == '1'}">
                            <input type="radio" name="queue" value="1" checked="checked"> Modification &nbsp;
                            <input type="radio" name="queue" value="2"> Verification &nbsp;
                            <input type="radio" name="queue" value="3"> Authorization &nbsp;
                        </c:if>
                        <c:if test="${dataMTById.queue == '2'}">
                            <input type="radio" name="queue" value="1"> Modification &nbsp;
                            <input type="radio" name="queue" value="2" checked="checked"> Verification &nbsp;
                            <input type="radio" name="queue" value="3"> Authorization &nbsp;
                        </c:if>
                        <c:if test="${dataMTById.queue == '3'}">
                            <input type="radio" name="queue" value="1"> Modification &nbsp;
                            <input type="radio" name="queue" value="2"> Verification &nbsp;
                            <input type="radio" name="queue" value="3" checked="checked"> Authorization &nbsp;
                        </c:if>
                        <c:if test="${dataMTById.queue == null}">
                            <input type="radio" name="queue" required="required" value="1"> Modification &nbsp;
                            <input type="radio" name="queue" value="2"> Verification &nbsp;
                            <input type="radio" name="queue" value="3"> Authorization &nbsp;
                        </c:if>
                    </div>
                </div>
                <div class="form-row-action">
                    <input type="submit" name="submit" id="submit" value="Save" />
                    <input type="reset" name="reset" id="reset" value="Reset" />
                    <input type="button" name="back" id="back" value="Back" />
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>
<!--<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>-->