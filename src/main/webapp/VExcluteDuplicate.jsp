<%-- 
    Document   : VExcluteDuplicate
    Created on : 9 Oct 2025, 18.38.53
    Author     : isal
--%>

<%@ include file="header.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<!--<script src="js/jquery-3.7.1.min_cdn"></script>-->
<script src="js/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="css/datatables-custom-wf-logs.css">
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:forEach var="item" items="${role}">
    <c:if test="${item == 'ROLE:EXCDUPL'}">
        <div id="isi">
            <div id="judul">
                        <h3 style="text-align:center;">Form Exclude Duplicate</h3>
                <%--<c:forEach var="item" items="${role}">--%>
                    <%--<c:if test="${item == 'USER:LIST'}">--%>
                    Add Exclude Duplicate <a href="SCExcluteDuplicate" class="srb3">Exclude Duplicate List</a>
                    <%--</c:if>--%>
                <%--</c:forEach>--%>
            </div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="VExcluteDuplicate" >
                    <div id="tabs-1" class="formBody">
                        <input type="hidden" id="action" name="action" value="${vdata != null ? 'edit' : ''}" />
                        <input type="hidden" id="id_data" name="id_data" value="${vdata != null ? vdata['id'] : ''}" />
                        <div class="form-row"><span class="labelL">I/O Type</span> 
                            <select name="inp_io_type" id="inp_io_type" required>
        <!--                        <option value="">-- Select Type --</option>
                                <option value="I" <c:if test="${vdata['io_type'] == 'I'}"> selected="true" </c:if> >Outgoing</option>
                                <option value="O" <c:if test="${vdata['io_type'] == 'O'}"> selected="true" </c:if> >Incoming</option>-->
                                <option value="I" >Outgoing</option>
                            </select>
                        </div>
                        <div class="form-row"><span class="labelL">Message Type</span>
                            <input name="inp_msg_type" maxlength="30" id="inp_msg_type" autocomplete="off" required type="text" value="${vdata != null ? vdata['msg_type'] : ''}" 
                            title="input mt only number &#10; if mx full type message" />
                        </div>
                        <div class="form-row"><span class="labelL">Status</span>
                            <label><input type="radio" required id="status_disable" name="inp_isenable" value="0" <c:if test="${vdata['isEnable'] == '0'}"> checked="true" </c:if>  class="margin-chxbox" />Disable </label>
                            &nbsp;&nbsp;
                            <label><input type="radio" required id="status_enable" 
                                    <c:forEach var="item" items="${role}">
                                        <c:if test="${item == 'ADM:MAKER' && sessionScope.role_id != '1'}">
                                            onclick="return false;" style="accent-color: #ccc;" 
                                        </c:if>
                                    </c:forEach>
                                    name="inp_isenable" value="1" 
                                <c:if test="${vdata['isEnable'] == '1'}"> checked="true" </c:if> class="margin-chxbox"/>Enable </label>
                        </div>
                    </div>
                    <div class="form-row-action">
                        <input type="submit" name="submit" id="submit" value="Save" />  
                        <% if(null == request.getParameter("id")) { %>
                            <input type="reset" name="reset" id="reset" value="Reset" />
                        <% } %>
                        <input type="button" name="back" id="back" value="Back" />
                    </div>
                </form>
            </div>
        </div>
    </c:if>
</c:forEach>


    