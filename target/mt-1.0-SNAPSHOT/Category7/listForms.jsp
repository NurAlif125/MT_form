<%-- 
    Document   : listForms
    Created on : Sep 4, 2025, 3:59:00 PM
    Author     : mslam
--%>

<%-- 
    Document   : listForms (Category7)
    Created on : Sep 05, 2025
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.mt.form.util.DatabaseConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daftar Form MT700, MT701, MT707, MT711</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
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
        <h2>List of Category 7 Messages</h2>
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
        + "SELECT id, 'MT700' AS type, created_at FROM mt.mt700_message "
        + "UNION ALL "
        + "SELECT id, 'MT701' AS type, created_at FROM mt.mt701_message "
        + "UNION ALL "
        + "SELECT id, 'MT707' AS type, created_at FROM mt.mt707_message "
        + "UNION ALL "
        + "SELECT id, 'MT711' AS type, created_at FROM mt.mt711_message "
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

