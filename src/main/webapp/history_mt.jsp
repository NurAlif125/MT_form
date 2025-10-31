<%-- 
    Document   : history_mt
    Created on : Jan 6, 2014, 7:52:28 PM
    Author     : M Abdul Hadi
--%>

<div class="form-row"><span class="label_sub"><b>MT/MX Histories</b></span></div>
<div class="form-row"><span class="label"></span>
    <c:forEach var="item" items="${header_status}">
        <c:out value="${item.status_tanggal}"/> : <c:out value="${item.status_header}"/> : <c:out value="${item.user_login}"/> : <c:out value="${item.ip_access}"/> : <c:out value="${item.comp_name}"/><br/>
    </c:forEach>
</div>
<hr/>