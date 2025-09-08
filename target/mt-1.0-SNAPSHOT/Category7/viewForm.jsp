<%-- 
    Document   : viewForm
    Created on : Sep 8, 2025, 11:04:58 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.mt.form.util.DatabaseConnection" %>
<%@ page import="com.mt.form.model.SimpleTag" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String formId = request.getParameter("id");
    String type   = request.getParameter("type");
    String mode   = request.getParameter("mode"); 
    if (mode == null) mode = "view"; // default view

    Map<String, String> data = new HashMap<>();
    List<SimpleTag> tags = new ArrayList<>();

    try (Connection conn = DatabaseConnection.getConnection()) {
        String tableName = "";
        if ("MT700".equalsIgnoreCase(type)) {
            tableName = "mt.mt700_message";
        } else if ("MT701".equalsIgnoreCase(type)) {
            tableName = "mt.mt701_message";
        } else if ("MT707".equalsIgnoreCase(type)) {
            tableName = "mt.mt707_message";
        } else if ("MT711".equalsIgnoreCase(type)) {
            tableName = "mt.mt711_message";
        }

        if (!tableName.isEmpty()) {
            String sql = "SELECT * FROM " + tableName + " WHERE form_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, formId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        ResultSetMetaData meta = rs.getMetaData();
                        for (int i = 1; i <= meta.getColumnCount(); i++) {
                            String col = meta.getColumnName(i);
                            String val = rs.getString(i);
                            data.put(col, val);

                            tags.add(new SimpleTag(col, val));
                        }
                    }
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    request.setAttribute("mode", mode);
    request.setAttribute("data", data);
    request.setAttribute("tags", tags);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Form ${type}</title>
    <style>
        input[readonly], textarea[readonly], select[disabled] {
            background-color: #f0f0f0;
            color: #333;
        }
    </style>
</head>
<body>
    <h2>View ${type} - ${formId}</h2>


    <pre>
    Form ID: <%= formId %>
    Type: <%= type %>
    Data size: <%= data.size() %>
    Tags size: <%= tags.size() %>
    </pre>

    <c:choose>
        <c:when test="${fn:toUpperCase(type) eq 'MT700'}">
            <jsp:include page="mt700.jsp" />
        </c:when>
        <c:when test="${fn:toUpperCase(type) eq 'MT701'}">
            <jsp:include page="mt701.jsp" />
        </c:when>
        <c:when test="${fn:toUpperCase(type) eq 'MT707'}">
            <jsp:include page="mt707.jsp" />
        </c:when>
        <c:when test="${fn:toUpperCase(type) eq 'MT711'}">
            <jsp:include page="mt711.jsp" />
        </c:when>
    </c:choose>

    <div class="footer">
        <c:if test="${mode eq 'view'}">
            <button onclick="window.location.href='${type.toLowerCase()}.jsp?mode=edit&id=${formId}'">
                Edit
            </button>
        </c:if>
        <button onclick="window.location.href='listForms.jsp'">Back</button>
    </div>

    <script>
        const mode = "<%= mode %>";
        if (mode === "view") {
            document.querySelectorAll("input, textarea").forEach(el => el.setAttribute("readonly", "true"));
            document.querySelectorAll("select").forEach(el => el.setAttribute("disabled", "true"));
            document.querySelectorAll("button[type=submit]").forEach(el => el.style.display = "none");
        }
    </script>
</body>
</html>

