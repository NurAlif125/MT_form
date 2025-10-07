<%-- 
    Document   : listForms
    Created on : Sep 4, 2025, 3:59:00 PM
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
        .pagination {
            margin-top: 15px;
            text-align: center;
        }
        .pagination a, .pagination strong {
            display: inline-block;
            margin: 0 3px;
            padding: 6px 12px;
            background: #2a7d80;
            color: white;
            border-radius: 6px;
            text-decoration: none;
        }
        .pagination strong {
            background: #388e3c;
            font-weight: bold;
        }
        .pagination a:hover {
            background: #388e3c;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <a class="back-btn" href="../index.jsp">Back</a>
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
                int pageNum = 1;
                final int recordsPerPage = 20;

                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    try {
                        pageNum = Integer.parseInt(pageParam);
                        if (pageNum < 1) pageNum = 1;
                    } catch (NumberFormatException nfe) {
                        pageNum = 1;
                    }
                }

                int start = (pageNum - 1) * recordsPerPage;

                String sql = ""
                  + "SELECT form_id, type, created_at FROM ("
                  + "  SELECT form_id, 'MT700' AS type, created_at FROM mt.mt700_message"
                  + "  UNION ALL SELECT form_id, 'MT701' AS type, created_at FROM mt.mt701_message"
                  + "  UNION ALL SELECT form_id, 'MT707' AS type, created_at FROM mt.mt707_message"
                  + "  UNION ALL SELECT form_id, 'MT708' AS type, created_at FROM mt.mt708_message"
                  + "  UNION ALL SELECT form_id, 'MT710' AS type, created_at FROM mt.mt710_message"
                  + "  UNION ALL SELECT form_id, 'MT711' AS type, created_at FROM mt.mt711_message"
                  + "  UNION ALL SELECT form_id, 'MT720' AS type, created_at FROM mt.mt720_message"
                  + "  UNION ALL SELECT form_id, 'MT730' AS type, created_at FROM mt.mt730_message"
                  + "  UNION ALL SELECT form_id, 'MT734' AS type, created_at FROM mt.mt734_message"
                  + "  UNION ALL SELECT form_id, 'MT740' AS type, created_at FROM mt.mt740_message"
                  + "  UNION ALL SELECT form_id, 'MT742' AS type, created_at FROM mt.mt742_message"
                  + "  UNION ALL SELECT form_id, 'MT747' AS type, created_at FROM mt.mt747_message"
                  + "  UNION ALL SELECT form_id, 'MT750' AS type, created_at FROM mt.mt750_message"
                  + "  UNION ALL SELECT form_id, 'MT752' AS type, created_at FROM mt.mt752_message"
                  + "  UNION ALL SELECT form_id, 'MT754' AS type, created_at FROM mt.mt754_message"
                  + "  UNION ALL SELECT form_id, 'MT756' AS type, created_at FROM mt.mt756_message"
                  + "  UNION ALL SELECT form_id, 'MT759' AS type, created_at FROM mt.mt759_message"
                  + "  UNION ALL SELECT form_id, 'MT760' AS type, created_at FROM mt.mt760_message"
                  + "  UNION ALL SELECT form_id, 'MT761' AS type, created_at FROM mt.mt761_message"
                  + "  UNION ALL SELECT form_id, 'MT767' AS type, created_at FROM mt.mt767_message"
                  + ") AS all_msgs "
                  + "ORDER BY created_at DESC "
                  + "LIMIT " + recordsPerPage + " OFFSET " + start;

                String countSql = ""
                  + "SELECT COUNT(*) AS total FROM ("
                  + "  SELECT form_id FROM mt.mt700_message"
                  + "  UNION ALL SELECT form_id FROM mt.mt701_message"
                  + "  UNION ALL SELECT form_id FROM mt.mt707_message"
                  + "  UNION ALL SELECT form_id FROM mt.mt708_message"
                  + "  UNION ALL SELECT form_id FROM mt.mt710_message"
                  + "  UNION ALL SELECT form_id FROM mt.mt711_message"
                  + "  UNION ALL SELECT form_id FROM mt.mt720_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt730_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt734_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt740_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt742_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt747_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt750_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt752_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt754_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt756_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt759_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt760_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt761_message"      
                  + "  UNION ALL SELECT form_id FROM mt.mt767_message"      
                  + ") AS all_msgs";

                int totalRecords = 0;
                int totalPages = 0;

                try (Connection conn = DatabaseConnection.getConnection();
                     Statement stmt = conn.createStatement();
                     ResultSet rsCount = stmt.executeQuery(countSql)) {
                    if (rsCount.next()) {
                        totalRecords = rsCount.getInt("total");
                        totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
                        if (totalPages < 1) totalPages = 1;
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='4'>Error count: " + e.getMessage() + "</td></tr>");
                }

                try (Connection conn = DatabaseConnection.getConnection();
                     Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery(sql)) {

                    while (rs.next()) {
                        String formId = rs.getString("form_id");
                        String formType = rs.getString("type");
                        java.sql.Timestamp ts = rs.getTimestamp("created_at");
              %>
                  <tr>
                    <td><%= formId %></td>
                    <td><%= formType %></td>
                    <td><%= ts == null ? "-" : new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(ts) %></td>
                    <td><a class="view-btn" href="viewForm.jsp?id=<%= formId %>&type=<%= formType %>">View</a></td>
                  </tr>
              <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
                }
              %>
        </table>
        <div class="pagination">
            <%
                if (totalPages > 1) {
                    int maxButtons = 5;
                    int half = maxButtons / 2;
                    int startPage = Math.max(1, pageNum - half);
                    int endPage = startPage + maxButtons - 1;
                    if (endPage > totalPages) {
                        endPage = totalPages;
                        startPage = Math.max(1, endPage - maxButtons + 1);
                    }
                    if (pageNum > 1) {
            %>
            <a href="listForms.jsp?page=<%= pageNum - 1 %>">Prev</a>
            <%
                    }
                    for (int i = startPage; i <= endPage; i++) {
                        if (i == pageNum) {
            %>
            <strong><%= i %></strong>
            <%
                        } else {
            %>
            <a href="listForms.jsp?page=<%= i %>"><%= i %></a>
            <%
                        }
                    }
                    if (pageNum < totalPages) {
            %>
            <a href="listForms.jsp?page=<%= pageNum + 1 %>">Next</a>
            <%
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
