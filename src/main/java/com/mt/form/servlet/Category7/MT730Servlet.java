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

@WebServlet("/MT730Servlet")
public class MT730Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // === Ambil parameter dari form mt730.jsp ===
            String mf20 = request.getParameter("_010_mf20_sender_reference");
            String mf21 = request.getParameter("_020_mf21_receiver_reference");
            String of25 = request.getParameter("_030_of25_account_identification");
            String mf30 = request.getParameter("_040_mf30_date_of_message_being_acknowledged");

            String of32aOpt = request.getParameter("_050_of32a_amount_of_charges");
            String of32aDate = request.getParameter("_051_of32a_date");
            String of32aCurrency = request.getParameter("_052_of32a_currency");
            String of32aAmount = request.getParameter("_053_of32a_amount");

            String of57aOpt = request.getParameter("_060_of57a_account_with_bank");
            String of57aPartyId = request.getParameter("_061_of57a_party_identifier");
            String of57aBic = request.getParameter("_062_of57a_identifier_code");
            String of57aNameAddr = request.getParameter("_063_of57a_name_address");

            String of71d = request.getParameter("_070_of71d_charges");
            String of72z = request.getParameter("_080_of72z_sender_to_receiver_information");
            String of79z = request.getParameter("_090_of79z_narrative");

            // === Server-side mandatory check ===
            if (isEmpty(mf20) || isEmpty(mf21) || isEmpty(mf30)) {
                out.println("<script>alert('Mandatory fields MT730 belum lengkap.'); window.history.back();</script>");
                return;
            }

            // === Generate form_id unik untuk MT730 ===
            String newId = null;
            String sqlNextId =
                "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                "FROM mt.mt730_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT730_" + next;
                } else {
                    newId = "MT730_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT730_1";
            }

            // === Column list (sesuai DDL mt730_message) ===
            String columns = "form_id, message_type, " +
                    "_010_mf20_sender_reference, _020_mf21_receiver_reference, " +
                    "_030_of25_account_identification, _040_mf30_date_acknowledged, " +
                    "_050_of32a_option, _051_of32a_date, _052_of32a_currency, _053_of32a_amount, " +
                    "_060_of57a_option, _061_of57a_party_identifier, _062_of57a_identifier_code, _063_of57a_name_address, " +
                    "_070_of71d_charges, _080_of72z_information, _090_of79z_narrative";

            int paramCount = (int) Arrays.stream(columns.split(","))
                    .map(String::trim)
                    .filter(s -> !s.isEmpty())
                    .count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt730_message(" + columns + ") VALUES (" + placeholders + ")";

            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "730");
                ps.setString(idx++, mf20);
                ps.setString(idx++, mf21);
                ps.setString(idx++, of25);
                ps.setString(idx++, mf30);

                ps.setString(idx++, of32aOpt);
                ps.setString(idx++, of32aDate);
                ps.setString(idx++, of32aCurrency);

                if (of32aAmount != null && !of32aAmount.trim().isEmpty()) {
                    String norm = of32aAmount.trim().replace(",", "").replace(" ", "");
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(norm));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, of57aOpt);
                ps.setString(idx++, of57aPartyId);
                ps.setString(idx++, of57aBic);
                ps.setString(idx++, of57aNameAddr);

                ps.setString(idx++, of71d);
                ps.setString(idx++, of72z);
                ps.setString(idx++, of79z);

                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT700 data saved successfully!'); window.location='Category7/mt730.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT730: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
