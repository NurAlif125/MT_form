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

@WebServlet("/MT754Servlet")
public class MT754Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            /* ========== Ambil parameter dari mt754.jsp ========== */
            String mf20 = request.getParameter("_010_mf20_sender_reference");
            String mf21 = request.getParameter("_020_mf21_related_reference");

            String opt32a = request.getParameter("_030_mf32a_principal_amount_paid_accepted_negotiated");
            String mf32aDate = request.getParameter("_031_mf32a_date");
            String mf32aCurrency = request.getParameter("_032_mf32a_currency");
            String mf32aAmount = request.getParameter("_033_mf32a_amount");

            String of33bCurrency = request.getParameter("_040_of33b_currency");
            String of33bAmount = request.getParameter("_041_of33b_amount");

            String of71d = request.getParameter("_050_of71d_charges_deducted");
            String of73a = request.getParameter("_060_of73a_charges_added");

            String opt34a = request.getParameter("_070_of34a_total_amount_claimed");
            String of34aDate = request.getParameter("_071_of34a_date");
            String of34aCurrency = request.getParameter("_072_of34a_currency");
            String of34aAmount = request.getParameter("_073_of34a_amount");

            String opt53a = request.getParameter("_080_of53a_reimbursing_bank");
            String of53aPartyId = request.getParameter("_081_of53a_party_identifier");
            String of53aIdentifier = request.getParameter("_082_of53a_identifier_code");
            String of53aLocation = request.getParameter("_083_of53a_location");
            String of53aNameAddr = request.getParameter("_084_of53a_name_address");

            String opt57a = request.getParameter("_090_of57a_account_with_bank");
            String of57aPartyId = request.getParameter("_091_of57a_party_identifier");
            String of57aIdentifier = request.getParameter("_092_of57a_identifier_code");
            String of57aLocation = request.getParameter("_093_of57a_location");
            String of57aNameAddr = request.getParameter("_094_of57a_name_address");

            String opt58a = request.getParameter("_100_of58a_beneficiary_bank");
            String of58aPartyId = request.getParameter("_101_of58a_party_identifier");
            String of58aIdentifier = request.getParameter("_102_of58a_identifier_code");
            String of58aNameAddr = request.getParameter("_103_of58a_name_address");

            String of72z = request.getParameter("_110_of72z_sender_to_receiver_information");
            String of77 = request.getParameter("_120_of77_narrative");

            /* ========== Mandatory check ========== */
            // Mandatory check
            if (isEmpty(mf20) || isEmpty(mf21) 
                    || isEmpty(opt32a) 
                    || isEmpty(mf32aCurrency) || isEmpty(mf32aAmount)) {
                out.println("<script>alert('Mandatory fields MT754 belum lengkap.'); window.history.back();</script>");
                return;
            }

            // Kalau option 32a = A, maka date juga wajib
            if ("A".equals(opt32a) && isEmpty(mf32aDate)) {
                out.println("<script>alert('Tanggal 32a wajib diisi untuk Option A.'); window.history.back();</script>");
                return;
            }

            /* ========== Generate form_id unik ========== */
            String newId = null;
            String sqlNextId =
                    "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                            "FROM mt.mt754_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT754_" + next;
                } else {
                    newId = "MT754_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT754_1";
            }

            /* ========== Column list (sesuai DDL table mt754_message) ========== */
            String columns = "form_id, message_type, " +
                    "_010_mf20_sender_reference, _020_mf21_related_reference, " +
                    "_030_mf32a_principal_amount_paid_accepted_negotiated, _031_mf32a_date, _032_mf32a_currency, _033_mf32a_amount, " +
                    "_040_of33b_currency, _041_of33b_amount, " +
                    "_050_of71d_charges_deducted, _060_of73a_charges_added, " +
                    "_070_of34a_total_amount_claimed, _071_of34a_date, _072_of34a_currency, _073_of34a_amount, " +
                    "_080_of53a_reimbursing_bank, _081_of53a_party_identifier, _082_of53a_identifier_code, _083_of53a_location, _084_of53a_name_address, " +
                    "_090_of57a_account_with_bank, _091_of57a_party_identifier, _092_of57a_identifier_code, _093_of57a_location, _094_of57a_name_address, " +
                    "_100_of58a_beneficiary_bank, _101_of58a_party_identifier, _102_of58a_identifier_code, _103_of58a_name_address, " +
                    "_110_of72z_sender_to_receiver_information, _120_of77_narrative";

            int paramCount = (int) Arrays.stream(columns.split(","))
                    .map(String::trim).filter(s -> !s.isEmpty()).count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt754_message(" + columns + ") VALUES (" + placeholders + ")";

            /* ========== Simpan ke database ========== */
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "754");

                ps.setString(idx++, mf20);
                ps.setString(idx++, mf21);

                ps.setString(idx++, opt32a);
                ps.setString(idx++, mf32aDate);
                ps.setString(idx++, mf32aCurrency);
                ps.setBigDecimal(idx++, new java.math.BigDecimal(mf32aAmount.replace(",", ".")));

                ps.setString(idx++, of33bCurrency);
                if (!isEmpty(of33bAmount)) {
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(of33bAmount.replace(",", ".")));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, of71d);
                ps.setString(idx++, of73a);

                ps.setString(idx++, opt34a);
                ps.setString(idx++, of34aDate);
                ps.setString(idx++, of34aCurrency);
                if (!isEmpty(of34aAmount)) {
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(of34aAmount.replace(",", ".")));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, opt53a);
                ps.setString(idx++, of53aPartyId);
                ps.setString(idx++, of53aIdentifier);
                ps.setString(idx++, of53aLocation);
                ps.setString(idx++, of53aNameAddr);

                ps.setString(idx++, opt57a);
                ps.setString(idx++, of57aPartyId);
                ps.setString(idx++, of57aIdentifier);
                ps.setString(idx++, of57aLocation);
                ps.setString(idx++, of57aNameAddr);

                ps.setString(idx++, opt58a);
                ps.setString(idx++, of58aPartyId);
                ps.setString(idx++, of58aIdentifier);
                ps.setString(idx++, of58aNameAddr);

                ps.setString(idx++, of72z);
                ps.setString(idx++, of77);

                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT754 data saved successfully!'); window.location='Category7/mt754.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT754: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
