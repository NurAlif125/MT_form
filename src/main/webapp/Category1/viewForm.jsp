<%-- 
    Document   : viewForm
    Created on : Aug 21, 2025, 1:30:21 PM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.mt.form.util.DatabaseConnection" %>
<%
    String id = request.getParameter("id");
    String formType = request.getParameter("type");

    if (id == null || id.isEmpty() || formType == null || formType.isEmpty()) {
        out.println("<p style='color:red'>Parameter tidak lengkap. (id=" + id + ", type=" + formType + ")</p>");
        out.println("<button onclick=\"window.location.href='listForms.jsp'\">Back</button>");
        return;
    }

    ResultSet rs = null;
    Connection conn = null;
    PreparedStatement ps = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View <%=formType%> Form</title>
  <style>
    body{font-family:Arial,sans-serif;background:#f7fbfc;padding:16px;}
    h2{margin:0 0 10px 0}
    .form-container{border:1px solid #cdd3d5;border-radius:6px;overflow:hidden;background:#fff;margin-bottom:20px;}
    .form-body{padding:14px}
    .form-row{display:flex;align-items:center;gap:12px;margin:8px 0}
    .label_body{width:80px;font-weight:bold;color:#57656b}
    .label{width:220px;text-align:right;color:#33434a}
    input,textarea{padding:6px;border:1px solid #98a6ad;border-radius:4px;background:#f0f0f0;color:#333;width:300px}
    textarea{resize:vertical;height:60px}
    hr{border:none;border-top:1px solid #e4ecef;margin:10px 0}
    .section-title{margin:14px 0 8px 0;font-size:15px;color:#1b3942;font-weight:bold}
    .loop-header{font-weight:bold;margin:8px 0 6px 0;color:#1f4c56}
    .set-box{border:1px dashed #bdd3d9;padding:10px;border-radius:6px;background:#fbfeff;margin-bottom:10px}
    .footer{padding:12px;background:#2a7d80;display:flex;gap:10px}
    .footer button{padding:8px 18px;border:1px solid #aaa;border-radius:6px;background:#eef0f1;color:#000;font-weight:bold;cursor:pointer}
    .footer button:hover{background:#e0e0e0}
  </style>
</head>
<body>
<%
    try {
        conn = DatabaseConnection.getConnection();

        if ("MT110".equalsIgnoreCase(formType)) {
            ps = conn.prepareStatement("SELECT * FROM mt.mt110_message WHERE id = ?");
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
%>
<%-- VIEW MT110 --%>
<div class="form-container">
  <div class="form-body">
    <h2>MT 110 Advice of Cheque(s)</h2>

    <div class="section-title">Header</div>

    <!-- :20: -->
    <div class="form-row">
      <span class="label_body">MF20</span>
      <span class="label">*Sender's Reference</span>
      <input type="text" value="<%= rs.getString("sender_ref") != null ? rs.getString("sender_ref") : "" %>" readonly>
    </div>
    <hr>

    <!-- :53a: Sender's Correspondent -->
    <div class="form-row">
      <span class="label_body">OF53a</span>
      <span class="label">Sender's Correspondent</span>
      <input type="text" value="<%= rs.getString("sender_correspondent") != null ? rs.getString("sender_correspondent") : "choose a type" %>" readonly>
    </div>
    <hr>

    <!-- :54a: Receiver's Correspondent -->
    <div class="form-row">
      <span class="label_body">OF54a</span>
      <span class="label">Receiver's Correspondent</span>
      <input type="text" value="<%= rs.getString("receiver_correspondent") != null ? rs.getString("receiver_correspondent") : "choose a type" %>" readonly>
    </div>
    <hr>

    <!-- :72: Sender to Receiver Info -->
    <div class="form-row">
      <span class="label_body">OF72</span>
      <span class="label">Sender to Receiver Information</span>
      <textarea readonly><%= rs.getString("sender_to_receiver") != null ? rs.getString("sender_to_receiver") : "" %></textarea>
    </div>

    <div class="section-title">Cheque Items</div>
    <%
      PreparedStatement psItems = conn.prepareStatement("SELECT * FROM mt.mt110_items WHERE mt110_id = ?");
      psItems.setString(1, id);
      ResultSet rsItems = psItems.executeQuery();

      while (rsItems.next()) {
    %>
    <div class="set-box">
      <div class="loop-header">Cheque Item</div>

      <!-- :21: Cheque Number -->
      <div class="form-row">
        <span class="label_body">MF21</span>
        <span class="label">*Cheque Number</span>
        <input type="text" value="<%= rsItems.getString("cheque_number") %>" readonly>
      </div>

      <!-- :30: Date of Issue -->
      <div class="form-row">
        <span class="label_body">MF30</span>
        <span class="label">*Date of Issue yyyy-mm-dd</span>
        <input type="text" value="<%= rsItems.getDate("date_of_issue") %>" readonly>
      </div>

    <!-- :32a: Amount -->
    <div class="form-row">
      <span class="label_body">MF32a</span>
      <span class="label">*Amount</span>
      <select disabled>
        <%
          String amtOpt = rsItems.getString("amount_option"); // untuk mt110_items
          // kalau di MT111 ganti jadi rs.getString("amount_option")
          if ("A".equals(amtOpt)) { 
        %>
          <option>F32A - Date - Currency - Amount</option>
        <% } else if ("B".equals(amtOpt)) { %>
          <option>F32B - Currency - Amount</option>
        <% } else { %>
          <option>choose a type</option>
        <% } %>
      </select>
    </div>

    <% if ("A".equals(amtOpt)) { %>
      <!-- Sub input F32A -->
      <div class="form-row" style="margin-left:40px">
        <span class="label">Date</span>
        <input type="text" value="<%= rsItems.getDate("value_date") %>" readonly>
      </div>
      <div class="form-row" style="margin-left:40px">
        <span class="label">Currency</span>
        <input type="text" value="<%= rsItems.getString("currency") %>" readonly>
      </div>
      <div class="form-row" style="margin-left:40px">
        <span class="label">Amount</span>
        <input type="text" value="<%= rsItems.getBigDecimal("amount") %>" readonly>
      </div>
    <% } else if ("B".equals(amtOpt)) { %>
      <!-- Sub input F32B -->
      <div class="form-row" style="margin-left:40px">
        <span class="label">Currency</span>
        <input type="text" value="<%= rsItems.getString("currency") %>" readonly>
      </div>
      <div class="form-row" style="margin-left:40px">
        <span class="label">Amount</span>
        <input type="text" value="<%= rsItems.getBigDecimal("amount") %>" readonly>
      </div>
    <% } %>

    <!-- :50a: Payer -->
    <div class="form-row">
      <span class="label_body">OF50a</span>
      <span class="label">Payer</span>
      <select disabled>
        <option><%= rsItems.getString("payer_type") != null ? rsItems.getString("payer_type") : "choose a type" %></option>
      </select>
    </div>
    <% if (rsItems.getString("payer_type") != null) { %>
      <div class="form-row" style="margin-left:40px">
        <span class="label">Name and Address</span>
        <textarea readonly><%= rsItems.getString("payer_nameaddr") != null ? rsItems.getString("payer_nameaddr") : "" %></textarea>
      </div>
    <% } %>

    <!-- :52a: Drawer Bank -->
    <div class="form-row">
      <span class="label_body">OF52a</span>
      <span class="label">Drawer Bank</span>
      <select disabled>
        <option><%= rsItems.getString("drawer_type") != null ? rsItems.getString("drawer_type") : "choose a type" %></option>
      </select>
    </div>
    <% if (rsItems.getString("drawer_type") != null) { %>
      <div class="form-row" style="margin-left:40px">
        <span class="label">Name and Address</span>
        <textarea readonly><%= rsItems.getString("drawer_nameaddr") != null ? rsItems.getString("drawer_nameaddr") : "" %></textarea>
      </div>
    <% } %>

    <!-- :59a: Payee -->
    <div class="form-row">
      <span class="label_body">MF59a</span>
      <span class="label">*Payee</span>
      <select disabled>
        <option><%= rsItems.getString("payee_type") != null ? "No letter option - Name & Address" : "choose a type" %></option>
      </select>
    </div>
    <% if (rsItems.getString("payee_type") != null) { %>
      <div class="form-row" style="margin-left:40px">
        <span class="label">Name and Address</span>
        <textarea readonly><%= rsItems.getString("payee_nameaddr") != null ? rsItems.getString("payee_nameaddr") : "" %></textarea>
      </div>
    <% } %>
    </div>
    <%
      }
      rsItems.close();
      psItems.close();
    %>
  </div>
  <div class="footer">
    <button onclick="window.location.href='listForms.jsp'">Back</button>
    <button onclick="window.location.href='mt110.jsp?id=<%= id %>'">Edit</button>
  </div>
</div>  
    <%
            } else {
                out.println("<p style='color:red'> Data tidak ditemukan untuk ID: " + id + "</p>");
            }
        } else if ("MT111".equalsIgnoreCase(formType)) {
            ps = conn.prepareStatement("SELECT * FROM mt.mt111_message WHERE id = ?");
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
    %>
    <!-- VIEW MT111 -->
    <div class="form-container">
      <div class="form-body">
        <h2>MT 111 Request for Stop Payment of a Cheque</h2>

        <!-- :20: Sender's Reference -->
        <div class="form-row">
          <span class="label_body">MF20</span>
          <span class="label">*Sender's Reference</span>
          <input type="text" value="<%= rs.getString("sender_ref") %>" readonly>
        </div>
        <hr>

        <!-- :21: Cheque Number -->
        <div class="form-row">
          <span class="label_body">MF21</span>
          <span class="label">*Cheque Number</span>
          <input type="text" value="<%= rs.getString("cheque_number") %>" readonly>
        </div>
        <hr>

        <!-- :30: Date of Issue -->
        <div class="form-row">
          <span class="label_body">MF30</span>
          <span class="label">*Date of Issue</span>
          <input type="text" value="<%= rs.getDate("date_of_issue") %>" readonly>
        </div>
        <hr>

        <!-- :32a: Amount -->
        <div class="form-row">
          <span class="label_body">MF32a</span>
          <span class="label">*Amount</span>
          <select disabled>
            <%
              String amtOpt = rs.getString("amount_option");
              if ("A".equals(amtOpt)) {
            %>
              <option>F32A - Date - Currency - Amount</option>
            <% } else if ("B".equals(amtOpt)) { %>
              <option>F32B - Currency - Amount</option>
            <% } else { %>
              <option>choose a type</option>
            <% } %>
          </select>
        </div>

        <% if ("A".equals(amtOpt)) { %>
          <!-- Sub input F32A -->
          <div class="form-row" style="margin-left:40px">
            <span class="label">Date</span>
            <input type="text" value="<%= rs.getDate("value_date") %>" readonly>
          </div>
          <div class="form-row" style="margin-left:40px">
            <span class="label">Currency</span>
            <input type="text" value="<%= rs.getString("currency") %>" readonly>
          </div>
          <div class="form-row" style="margin-left:40px">
            <span class="label">Amount</span>
            <input type="text" value="<%= rs.getBigDecimal("amount") %>" readonly>
          </div>
        <% } else if ("B".equals(amtOpt)) { %>
          <!-- Sub input F32B -->
          <div class="form-row" style="margin-left:40px">
            <span class="label">Currency</span>
            <input type="text" value="<%= rs.getString("currency") %>" readonly>
          </div>
          <div class="form-row" style="margin-left:40px">
            <span class="label">Amount</span>
            <input type="text" value="<%= rs.getBigDecimal("amount") %>" readonly>
          </div>
        <% } %>
        <hr>

        <!-- :52a: Drawer Bank -->
        <div class="form-row">
          <span class="label_body">OF52a</span>
          <span class="label">Drawer Bank</span>
          <select disabled>
            <option><%= rs.getString("drawer_bank_bic") != null 
                        || rs.getString("drawer_bank_party_identifier") != null
                        || rs.getString("drawer_bank_location") != null
                        || rs.getString("drawer_bank_name_addr") != null 
                        ? "52a - Drawer Bank" : "choose a type" %></option>
          </select>
        </div>

        <% if (rs.getString("drawer_bank_bic") != null 
            || rs.getString("drawer_bank_party_identifier") != null
            || rs.getString("drawer_bank_location") != null
            || rs.getString("drawer_bank_name_addr") != null) { %>
          <div class="form-row" style="margin-left:40px">
            <span class="label">BIC</span>
            <input type="text" value="<%= rs.getString("drawer_bank_bic") %>" readonly>
          </div>
          <div class="form-row" style="margin-left:40px">
            <span class="label">Party Identifier</span>
            <input type="text" value="<%= rs.getString("drawer_bank_party_identifier") %>" readonly>
          </div>
          <div class="form-row" style="margin-left:40px">
            <span class="label">Location</span>
            <input type="text" value="<%= rs.getString("drawer_bank_location") %>" readonly>
          </div>
          <div class="form-row" style="margin-left:40px">
            <span class="label">Name & Address</span>
            <textarea readonly><%= rs.getString("drawer_bank_name_addr") %></textarea>
          </div>
        <% } %>
        <hr>

        <!-- :59: Beneficiary -->
        <div class="form-row">
          <span class="label_body">OF59</span>
          <span class="label">Beneficiary</span>
          <input type="checkbox" disabled 
            <%= (rs.getString("payee_account") != null 
                || rs.getString("payee_name") != null 
                || rs.getString("payee_addr1") != null) ? "checked" : "" %> />
        </div>

        <% 
           boolean hasBeneficiary = (rs.getString("payee_account") != null 
                                  || rs.getString("payee_name") != null 
                                  || rs.getString("payee_addr1") != null);
           if (hasBeneficiary) {
        %>
          <div class="form-row" style="margin-left:40px">
            <span class="label">Account</span>
            <input type="text" value="<%= rs.getString("payee_account") != null ? rs.getString("payee_account") : "" %>" readonly>
          </div>
          <div class="form-row" style="margin-left:40px">
            <span class="label">Name and Address</span>
            <textarea readonly><%= rs.getString("payee_name") != null ? rs.getString("payee_name") : "" %>
        <%= rs.getString("payee_addr1") != null ? rs.getString("payee_addr1") : "" %></textarea>
          </div>
          <div class="form-row" style="margin-left:40px">
            <span class="label">Country</span>
            <input type="text" value="<%= rs.getString("payee_country") != null ? rs.getString("payee_country") : "" %>" readonly>
          </div>
        <% } %>
        <hr>

        <!-- :75: Queries -->
        <div class="form-row">
          <span class="label_body">OF75</span>
          <span class="label">Queries</span>
          <textarea readonly><%= rs.getString("queries_text") %></textarea>
        </div>
      </div>

      <div class="footer">
        <button onclick="window.location.href='listForms.jsp'">⬅ Back</button>
        <button onclick="window.location.href='mt111.jsp?id=<%= id %>'">✏ Edit</button>
      </div>
    </div>
<%
            } else {
                out.println("<p style='color:red'>Data tidak ditemukan untuk ID: " + id + "</p>");
            }
        }
    } catch (Exception e) {
        out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (ps != null) try { ps.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
</body>
</html>
