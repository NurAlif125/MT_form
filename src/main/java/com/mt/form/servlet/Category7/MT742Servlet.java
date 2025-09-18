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

@WebServlet("/MT742Servlet")
public class MT742Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            /* ========== Ambil parameter dari mt742.jsp ========== */
            String mf20 = request.getParameter("_010_mf20_claiming_bank_reference");
            String mf21 = request.getParameter("_020_mf21_documentary_credit_number");
            String of31c = request.getParameter("_030_of31c_date_of_issue");

            String mf52aOpt = request.getParameter("_040_mf52a_issuing_bank");
            String mf52aPartyId = request.getParameter("_041_mf52a_party_identifier");
            String mf52aBic = request.getParameter("_042_mf52a_identifier_code");
            String mf52aNameAddr = request.getParameter("_043_mf52a_name_address");

            String mf32bCurrency = request.getParameter("_050_mf32b_currency");
            String mf32bAmount = request.getParameter("_051_mf32b_amount");

            String of33bCurrency = request.getParameter("_060_of33b_currency");
            String of33bAmount = request.getParameter("_061_of33b_amount");

            String of71d = request.getParameter("_070_of71d_charges");

            String mf34aOpt = request.getParameter("_080_mf34a_total_amount_claimed");
            String mf34aDate = request.getParameter("_081_mf34a_date");
            String mf34aCurrency = request.getParameter("_082_mf34a_currency");
            String mf34aAmount = request.getParameter("_083_mf34a_amount");

            String of57aOpt = request.getParameter("_090_of57a_account_with_bank");
            String of57aPartyId = request.getParameter("_091_of57a_party_identifier");
            String of57aBic = request.getParameter("_092_of57a_identifier_code");
            String of57aNameAddr = request.getParameter("_093_of57a_name_address");

            String of58aOpt = request.getParameter("_100_of58a_beneficiary_bank");
            String of58aPartyId = request.getParameter("_101_of58a_party_identifier");
            String of58aBic = request.getParameter("_102_of58a_identifier_code");
            String of58aNameAddr = request.getParameter("_103_of58a_name_address");

            String of72z = request.getParameter("_110_of72z_sender_to_receiver_information");

            /* ========== Mandatory server-side check ========== */
            if (isEmpty(mf20) || isEmpty(mf21) || isEmpty(mf32bCurrency) || isEmpty(mf32bAmount) ||
                isEmpty(mf34aOpt) || isEmpty(mf34aCurrency) || isEmpty(mf34aAmount)) {
                out.println("<script>alert('Mandatory fields MT742 belum lengkap.'); window.history.back();</script>");
                return;
            }

            /* ========== Generate form_id unik untuk MT742 ========== */
            String newId = null;
            String sqlNextId =
                    "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                    "FROM mt.mt742_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT742_" + next;
                } else {
                    newId = "MT742_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT742_1";
            }

            /* ========== Column list (harus sesuai DDL table mt742_message) ========== */
            String columns = "form_id, message_type, " +
                    "_010_mf20_claiming_bank_reference, _020_mf21_documentary_credit_number, _030_of31c_date_of_issue, " +
                    "_040_mf52a_issuing_bank, _041_mf52a_party_identifier, _042_mf52a_identifier_code, _043_mf52a_name_address, " +
                    "_050_mf32b_currency, _051_mf32b_amount, " +
                    "_060_of33b_currency, _061_of33b_amount, " +
                    "_070_of71d_charges, " +
                    "_080_mf34a_total_amount_claimed, _081_mf34a_date, _082_mf34a_currency, _083_mf34a_amount, " +
                    "_090_of57a_account_with_bank, _091_of57a_party_identifier, _092_of57a_identifier_code, _093_of57a_name_address, " +
                    "_100_of58a_beneficiary_bank, _101_of58a_party_identifier, _102_of58a_identifier_code, _103_of58a_name_address, " +
                    "_110_of72z_sender_to_receiver_information";

            int paramCount = (int) Arrays.stream(columns.split(","))
                    .map(String::trim).filter(s -> !s.isEmpty()).count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt742_message(" + columns + ") VALUES (" + placeholders + ")";

            /* ========== Simpan ke database ========== */
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "742");

                ps.setString(idx++, mf20);
                ps.setString(idx++, mf21);
                ps.setString(idx++, of31c);

                ps.setString(idx++, mf52aOpt);
                ps.setString(idx++, mf52aPartyId);
                ps.setString(idx++, mf52aBic);
                ps.setString(idx++, mf52aNameAddr);

                ps.setString(idx++, mf32bCurrency);

                if (!isEmpty(mf32bAmount)) {
                    String norm = mf32bAmount.trim().replace(",", "").replace(" ", "");
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(norm));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, of33bCurrency);
                if (!isEmpty(of33bAmount)) {
                    String norm = of33bAmount.trim().replace(",", "").replace(" ", "");
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(norm));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, of71d);

                ps.setString(idx++, mf34aOpt);
                ps.setString(idx++, mf34aDate);
                ps.setString(idx++, mf34aCurrency);

                if (!isEmpty(mf34aAmount)) {
                    String norm = mf34aAmount.trim().replace(",", "").replace(" ", "");
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(norm));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, of57aOpt);
                ps.setString(idx++, of57aPartyId);
                ps.setString(idx++, of57aBic);
                ps.setString(idx++, of57aNameAddr);

                ps.setString(idx++, of58aOpt);
                ps.setString(idx++, of58aPartyId);
                ps.setString(idx++, of58aBic);
                ps.setString(idx++, of58aNameAddr);

                ps.setString(idx++, of72z);

                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT700 data saved successfully!'); window.location='Category7/mt742.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT742: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
