<%-- 
    Document   : listForms
    Created on : Aug 21, 2025, 9:33:04 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.mt.form.util.DatabaseConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daftar Form MT110 & MT111</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: auto;
            background: #fff;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        }
        .header {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 25px;
            position: relative;
        }
        .back-btn {
            position: absolute;
            left: 0;
            background: #2a7d80;
            color: white;
            padding: 6px 14px;
            text-decoration: none;
            border-radius: 6px;
            transition: 0.2s;
        }
        .back-btn:hover {
            background: #388e3c;
        }
        h2 {
            margin: 0;
            color: #2c3e50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th {
            background: #2a7d80;
            color: white;
            padding: 10px;
            text-align: center;
        }
        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        tr:nth-child(even) {background-color: #f9f9f9;}
        tr:hover {background-color: #f1f1f1;}
        a.view-btn {
            background: #2a7d80;
            color: white;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 6px;
            transition: 0.2s;
        }
        a.view-btn:hover {
            background: #388e3c;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <a class="back-btn" href="../index.jsp">⬅ Back</a>
        <h2>List of Category 1 Messages</h2>
    </div>

    <table>
      <tr>
        <th>ID</th>
        <th>Type</th>
        <th>Date</th>
        <th>Action</th>
      </tr>
    <%
    String sql = ""
        + "SELECT id, 'MT110' AS type, created_at "
        + "FROM mt.mt110_message "
        + "UNION ALL "
        + "SELECT id, 'MT111' AS type, created_at "
        + "FROM mt.mt111_message "
        + "ORDER BY created_at DESC";


    try (Connection conn = DatabaseConnection.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql)) {

    while (rs.next()) {
        String formId = rs.getString("id");
        String formType = rs.getString("type");
    %>
      <tr>
        <td><%= formId %></td>
        <td><%= formType %></td>
        <td><%= rs.getTimestamp("created_at") %></td>
        <td>
            <a class="view-btn" href="viewForm.jsp?id=<%= formId %>&type=<%= formType %>">
                View
            </a>
        </td>
      </tr>
    <%
    }
    } catch (Exception e) {
        out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
    }
    %>
    </table>
</div>
</body>
</html>








