package com.mt.form.servlet.Category7;

import com.mt.form.util.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Arrays;
import java.util.Collections;

@WebServlet("/MT734Servlet")
public class MT734Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // === Ambil parameter dari form mt734.jsp ===
            String mf20 = request.getParameter("_010_mf20_sender_trn");
            String mf21 = request.getParameter("_020_mf21_presenting_bank_reference");

            String mf32aDate = request.getParameter("_030_mf32a_date");
            String mf32aCurrency = request.getParameter("_031_mf32a_currency");
            String mf32aAmount = request.getParameter("_032_mf32a_amount");

            String of73a = request.getParameter("_040_of73A_charges_claimed");

            String of33aOpt = request.getParameter("_050_of33a_total_amount_claimed");
            String of33aDate = request.getParameter("_051_of33a_date");
            String of33aCurrency = request.getParameter("_052_of33a_currency");
            String of33aAmount = request.getParameter("_053_of33a_amount");

            String of57aOpt = request.getParameter("_060_of57a_account_with_bank");
            String of57aPartyId = request.getParameter("_061_of57a_party_identifier");
            String of57aBic = request.getParameter("_062_of57a_identifier_code");
            String of57aLocation = request.getParameter("_063_of57a_location");
            String of57aNameAddr = request.getParameter("_064_of57a_name_address");

            String of72z = request.getParameter("_070_of72z_sender_to_receiver_information");
            String mf77j = request.getParameter("_080_mf77j_discrepancies");
            String mf77b = request.getParameter("_090_mf77b_disposal_of_documents");

            // === Server-side mandatory check ===
            if (isEmpty(mf20) || isEmpty(mf21) ||
                isEmpty(mf32aDate) || isEmpty(mf32aCurrency) || isEmpty(mf32aAmount) ||
                isEmpty(mf77j) || isEmpty(mf77b)) {
                out.println("<script>alert('Mandatory fields MT734 belum lengkap.'); window.history.back();</script>");
                return;
            }

            // === Generate form_id unik untuk MT734 ===
            String newId = null;
            String sqlNextId =
                "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                "FROM mt.mt734_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT734_" + next;
                } else {
                    newId = "MT734_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT734_1";
            }

            // === Column list (sesuai DDL mt734_message) ===
            String columns = "form_id, message_type, " +
                    "_010_mf20_sender_trn, _020_mf21_presenting_bank_reference, " +
                    "_030_mf32a_date, _031_mf32a_currency, _032_mf32a_amount, " +
                    "_040_of73A_charges_claimed, " +
                    "_050_of33a_option, _051_of33a_date, _052_of33a_currency, _053_of33a_amount, " +
                    "_060_of57a_option, _061_of57a_party_identifier, _062_of57a_identifier_code, _063_of57a_location, _064_of57a_name_address, " +
                    "_070_of72z_information, _080_mf77j_discrepancies, _090_mf77b_disposal";

            int paramCount = (int) Arrays.stream(columns.split(","))
                    .map(String::trim)
                    .filter(s -> !s.isEmpty())
                    .count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt734_message(" + columns + ") VALUES (" + placeholders + ")";

            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "734");
                ps.setString(idx++, mf20);
                ps.setString(idx++, mf21);

                ps.setString(idx++, mf32aDate);
                ps.setString(idx++, mf32aCurrency);
                if (!isEmpty(mf32aAmount)) {
                    String norm = mf32aAmount.trim().replace(",", "").replace(" ", "");
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(norm));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, of73a);

                ps.setString(idx++, of33aOpt);
                ps.setString(idx++, of33aDate);
                ps.setString(idx++, of33aCurrency);
                if (!isEmpty(of33aAmount)) {
                    String norm = of33aAmount.trim().replace(",", "").replace(" ", "");
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(norm));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, of57aOpt);
                ps.setString(idx++, of57aPartyId);
                ps.setString(idx++, of57aBic);
                ps.setString(idx++, of57aLocation);
                ps.setString(idx++, of57aNameAddr);

                ps.setString(idx++, of72z);
                ps.setString(idx++, mf77j);
                ps.setString(idx++, mf77b);

                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT700 data saved successfully!'); window.location='Category7/mt734.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT734: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
