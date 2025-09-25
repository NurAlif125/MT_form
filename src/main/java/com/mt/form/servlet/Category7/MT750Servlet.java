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

@WebServlet("/MT750Servlet")
public class MT750Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            /* ========== Ambil parameter dari mt750.jsp ========== */
            String mf20 = request.getParameter("_010_mf20_sender_reference");
            String mf21 = request.getParameter("_020_mf21_related_reference");

            String mf32bCurrency = request.getParameter("_030_mf32b_currency");
            String mf32bAmount = request.getParameter("_031_mf32b_amount");

            String of33bCurrency = request.getParameter("_040_of33b_currency");
            String of33bAmount = request.getParameter("_041_of33b_amount");

            String of71d = request.getParameter("_050_of71d_charges_to_be_deducted");
            String of73a = request.getParameter("_060_of73a_charges_to_be_added");

            String of34bCurrency = request.getParameter("_070_of34b_currency");
            String of34bAmount = request.getParameter("_071_of34b_amount");

            String of57aOpt = request.getParameter("_080_of57a_account_with_bank");
            String of57aPartyId = request.getParameter("_081_of57a_party_identifier");
            String of57aBic = request.getParameter("_082_of57a_identifier_code");
            String of57aLocation = request.getParameter("_083_of57a_location");
            String of57aNameAddr = request.getParameter("_084_of57a_name_address");

            String of72z = request.getParameter("_090_of72z_sender_to_receiver_information");
            String mf77j = request.getParameter("_100_mf77j_discrepancies");

            /* ========== Mandatory check ========== */
            if (isEmpty(mf20) || isEmpty(mf21) || isEmpty(mf32bCurrency) || isEmpty(mf32bAmount) || isEmpty(mf77j)) {
                out.println("<script>alert('Mandatory fields MT750 belum lengkap.'); window.history.back();</script>");
                return;
            }

            /* ========== Generate form_id unik ========== */
            String newId = null;
            String sqlNextId =
                    "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                            "FROM mt.mt750_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT750_" + next;
                } else {
                    newId = "MT750_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT750_1";
            }

            /* ========== Column list (sesuai DDL table mt750_message) ========== */
            String columns = "form_id, message_type, " +
                    "_010_mf20_sender_reference, _020_mf21_related_reference, " +
                    "_030_mf32b_currency, _031_mf32b_amount, " +
                    "_040_of33b_currency, _041_of33b_amount, " +
                    "_050_of71d_charges_to_be_deducted, _060_of73a_charges_to_be_added, " +
                    "_070_of34b_currency, _071_of34b_amount, " +
                    "_080_of57a_account_with_bank, _081_of57a_party_identifier, _082_of57a_identifier_code, _083_of57a_location, _084_of57a_name_address, " +
                    "_090_of72z_sender_to_receiver_information, _100_mf77j_discrepancies";

            int paramCount = (int) Arrays.stream(columns.split(","))
                    .map(String::trim).filter(s -> !s.isEmpty()).count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt750_message(" + columns + ") VALUES (" + placeholders + ")";

            /* ========== Simpan ke database ========== */
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "750");

                ps.setString(idx++, mf20);
                ps.setString(idx++, mf21);

                ps.setString(idx++, mf32bCurrency);
                ps.setBigDecimal(idx++, new java.math.BigDecimal(mf32bAmount.replace(",", ".")));

                ps.setString(idx++, of33bCurrency);
                if (!isEmpty(of33bAmount)) {
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(of33bAmount.replace(",", ".")));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, of71d);
                ps.setString(idx++, of73a);

                ps.setString(idx++, of34bCurrency);
                if (!isEmpty(of34bAmount)) {
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(of34bAmount.replace(",", ".")));
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

                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT750 data saved successfully!'); window.location='Category7/mt750.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT750: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
