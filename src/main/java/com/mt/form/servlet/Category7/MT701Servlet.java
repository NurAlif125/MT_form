package com.mt.form.servlet.Category7;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/MT701Servlet")
public class MT701Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // === Koneksi PostgreSQL ===
    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/mt_forms";
    private static final String JDBC_USER = "postgres";
    private static final String JDBC_PASS = "123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            // === Paksa load driver PostgreSQL ===
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException e) {
                out.println("<script>alert('PostgreSQL Driver tidak ditemukan: " + e.getMessage() + "'); window.history.back();</script>");
                return;
            }

            // === Ambil parameter dari JSP (MT701) ===
            String seqTotal = request.getParameter("_010_mf27_sequence_of_total");
            String creditNumber = request.getParameter("_020_mf20_documentary_credit_number");
            String descGoods = request.getParameter("_030_of45a_description");
            String docsRequired = request.getParameter("_040_of46a_documents");
            String addConditions = request.getParameter("_050_of47a_additional_conditions");
            String specialPayBenef = request.getParameter("_060_of49g_special_payment_beneficiary");
            String specialPayBank = request.getParameter("_070_of49h_special_payment_bank");

            // === Basic validation (server-side mandatory fields) ===
            if (isEmpty(seqTotal) || isEmpty(creditNumber)) {
                out.println("<script>alert('Mandatory fields MT701 belum lengkap.'); window.history.back();</script>");
                return;
            }

            // === Generate custom ID untuk MT701 ===
            String newId = null;
            String prefix = "MT701";
            String sqlNextId = "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                               "FROM mt.mt701_message";
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT701_" + next;
                } else {
                    newId = "MT701_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT701_1";
            }

            // === Query Insert ===
            String sql = "INSERT INTO mt.mt701_message(" +
                    "form_id, message_type, mf27_sequence_of_total, mf20_documentary_credit_number, " +
                    "of45a_description, of46a_documents, of47a_additional_conditions, " +
                    "of49g_special_payment_beneficiary, of49h_special_payment_bank" +
                    ") VALUES (?,?,?,?,?,?,?,?,?)";

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "701");
                ps.setString(idx++, seqTotal);
                ps.setString(idx++, creditNumber);
                ps.setString(idx++, descGoods);
                ps.setString(idx++, docsRequired);
                ps.setString(idx++, addConditions);
                ps.setString(idx++, specialPayBenef);
                ps.setString(idx++, specialPayBank);

                ps.executeUpdate();
                out.println("<script>alert('MT701 data saved successfully!'); window.location='mt701.jsp';</script>");
                
                response.sendRedirect("Category7/mt701.jsp");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT701: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
