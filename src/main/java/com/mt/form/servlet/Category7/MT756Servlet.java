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

@WebServlet("/MT756Servlet")
public class MT756Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            /* ========== Ambil parameter dari mt756.jsp ========== */
            String mf20 = request.getParameter("_010_mf20_sender_reference");
            String mf21 = request.getParameter("_020_mf21_presenting_banks_reference");

            String mf32bCurrency = request.getParameter("_030_mf32b_currency");
            String mf32bAmount = request.getParameter("_031_mf32b_amount");

            String mf33aDate = request.getParameter("_040_mf33a_date");
            String mf33aCurrency = request.getParameter("_041_mf33a_currency");
            String mf33aAmount = request.getParameter("_042_mf33a_amount");

            String opt53a = request.getParameter("_050_of53a_senders_correspondent");
            String of53aPartyId = request.getParameter("_051_of53a_party_identifier");
            String of53aIdentifier = request.getParameter("_052_of53a_identifier_code");
            String of53aLocation = request.getParameter("_053_of53a_location");
            String of53aNameAddr = request.getParameter("_054_of53a_name_address");

            String opt54a = request.getParameter("_060_of54a_receivers_correspondent");
            String of54aPartyId = request.getParameter("_061_of54a_party_identifier");
            String of54aIdentifier = request.getParameter("_062_of54a_identifier_code");
            String of54aLocation = request.getParameter("_063_of54a_location");
            String of54aNameAddr = request.getParameter("_064_of54a_name_address");

            String of72z = request.getParameter("_070_of72z_sender_to_receiver_information");
            String of79z = request.getParameter("_080_of79z_narrative");

            /* ========== Mandatory check ========== */
            if (isEmpty(mf20) || isEmpty(mf21)
                    || isEmpty(mf32bCurrency) || isEmpty(mf32bAmount)
                    || isEmpty(mf33aDate) || isEmpty(mf33aCurrency) || isEmpty(mf33aAmount)) {
                out.println("<script>alert('Mandatory fields MT756 belum lengkap.'); window.history.back();</script>");
                return;
            }

            /* ========== Generate form_id unik ========== */
            String newId = null;
            String sqlNextId =
                    "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                            "FROM mt.mt756_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT756_" + next;
                } else {
                    newId = "MT756_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT756_1";
            }

            /* ========== Column list (sesuai DDL table mt756_message) ========== */
            String columns = "form_id, message_type, " +
                    "_010_mf20_sender_reference, _020_mf21_presenting_banks_reference, " +
                    "_030_mf32b_currency, _031_mf32b_amount, " +
                    "_040_mf33a_date, _041_mf33a_currency, _042_mf33a_amount, " +
                    "_050_of53a_senders_correspondent, _051_of53a_party_identifier, _052_of53a_identifier_code, _053_of53a_location, _054_of53a_name_address, " +
                    "_060_of54a_receivers_correspondent, _061_of54a_party_identifier, _062_of54a_identifier_code, _063_of54a_location, _064_of54a_name_address, " +
                    "_070_of72z_sender_to_receiver_information, _080_of79z_narrative";

            int paramCount = (int) Arrays.stream(columns.split(","))
                    .map(String::trim).filter(s -> !s.isEmpty()).count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt756_message(" + columns + ") VALUES (" + placeholders + ")";

            /* ========== Simpan ke database ========== */
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "756");

                ps.setString(idx++, mf20);
                ps.setString(idx++, mf21);

                ps.setString(idx++, mf32bCurrency);
                ps.setBigDecimal(idx++, new java.math.BigDecimal(mf32bAmount.replace(",", ".")));

                ps.setString(idx++, mf33aDate);
                ps.setString(idx++, mf33aCurrency);
                ps.setBigDecimal(idx++, new java.math.BigDecimal(mf33aAmount.replace(",", ".")));

                ps.setString(idx++, opt53a);
                ps.setString(idx++, of53aPartyId);
                ps.setString(idx++, of53aIdentifier);
                ps.setString(idx++, of53aLocation);
                ps.setString(idx++, of53aNameAddr);

                ps.setString(idx++, opt54a);
                ps.setString(idx++, of54aPartyId);
                ps.setString(idx++, of54aIdentifier);
                ps.setString(idx++, of54aLocation);
                ps.setString(idx++, of54aNameAddr);

                ps.setString(idx++, of72z);
                ps.setString(idx++, of79z);

                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT756 data saved successfully!'); window.location='Category7/mt756.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT756: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
