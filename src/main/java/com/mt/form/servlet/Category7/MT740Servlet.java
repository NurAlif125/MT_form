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

@WebServlet("/MT740Servlet")
public class MT740Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            /* ========== Ambil parameter dari mt740.jsp ========== */
            String mf20 = request.getParameter("_010_mf20_documentary_credit_number");
            String of25 = request.getParameter("_020_of25_account_identification");
            String mf40f = request.getParameter("_030_mf40f_applicable_rules");

            String of31dDate = request.getParameter("_040_of31d_date_of_expiry");
            String of31dPlace = request.getParameter("_041_of31d_place_of_expiry");

            String of58aOpt = request.getParameter("_050_of58a_negotiating_bank");
            String of58aPartyId = request.getParameter("_051_of58a_party_identifier");
            String of58aBic = request.getParameter("_052_of58a_identifier_code");
            String of58aNameAddr = request.getParameter("_053_of58a_name_address");

            String of59Account = request.getParameter("_060_of59_account");
            String of59NameAddr = request.getParameter("_061_of59_name_address");

            String mf32bCurrency = request.getParameter("_070_mf32b_currency");
            String mf32bAmount = request.getParameter("_071_mf32b_amount");

            String of39aPlus = request.getParameter("_080_of39a_plus");
            String of39aMinus = request.getParameter("_081_of39a_minus");
            String of39c = request.getParameter("_090_of39c_additional_amounts_covered");

            String mf41aOpt = request.getParameter("_100_mf41a_available_with_by");
            String mf41aBic = request.getParameter("_101_mf41a_identifier_code");
            String mf41aNameAddr = request.getParameter("_102_mf41a_name_address");
            String mf41aCode = request.getParameter("_103_mf41a_code");

            String of42c = request.getParameter("_110_of42c_drafts_at");

            String of42aOpt = request.getParameter("_120_of42a_drawee");
            String of42aBic = request.getParameter("_121_of42a_identifier_code");
            String of42aNameAddr = request.getParameter("_122_of42a_name_address");

            String of42m = request.getParameter("_130_of42m_mixed_payment_details");
            String of42p = request.getParameter("_140_of42p_negotiation_deferred_payment_details");

            String of71a = request.getParameter("_150_of71a_reimbursing_banks_charges");
            String of71d = request.getParameter("_160_of71d_other_charges");
            String of72z = request.getParameter("_170_of72z_sender_to_receiver_information");

            /* ========== Mandatory server-side check ========== */
            if (isEmpty(mf20) || isEmpty(mf40f) || isEmpty(mf32bCurrency) || isEmpty(mf32bAmount)) {
                out.println("<script>alert('Mandatory fields MT740 belum lengkap.'); window.history.back();</script>");
                return;
            }

            /* ========== Generate form_id unik untuk MT740 ========== */
            String newId = null;
            String sqlNextId =
                    "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                    "FROM mt.mt740_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT740_" + next;
                } else {
                    newId = "MT740_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT740_1";
            }

            /* ========== Column list (harus sesuai DDL table mt740_message) ========== */
            String columns = "form_id, message_type, " +
                    "_010_mf20_documentary_credit_number, _020_of25_account_identification, " +
                    "_030_mf40f_applicable_rules, _040_of31d_date_of_expiry, _041_of31d_place_of_expiry, " +
                    "_050_of58a_option, _051_of58a_party_identifier, _052_of58a_identifier_code, _053_of58a_name_address, " +
                    "_060_of59_account, _061_of59_name_address, " +
                    "_070_mf32b_currency, _071_mf32b_amount, " +
                    "_080_of39a_plus, _081_of39a_minus, _090_of39c_additional_amounts, " +
                    "_100_mf41a_option, _101_mf41a_identifier_code, _102_mf41a_name_address, _103_mf41a_code, " +
                    "_110_of42c_drafts, _120_of42a_option, _121_of42a_identifier_code, _122_of42a_name_address, " +
                    "_130_of42m_mixed_payment, _140_of42p_negotiation_details, " +
                    "_150_of71a_charges, _160_of71d_other_charges, _170_of72z_information";

            int paramCount = (int) Arrays.stream(columns.split(","))
                    .map(String::trim).filter(s -> !s.isEmpty()).count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt740_message(" + columns + ") VALUES (" + placeholders + ")";

            /* ========== Simpan ke database ========== */
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "740");
                ps.setString(idx++, mf20);
                ps.setString(idx++, of25);
                ps.setString(idx++, mf40f);
                ps.setString(idx++, of31dDate);
                ps.setString(idx++, of31dPlace);

                ps.setString(idx++, of58aOpt);
                ps.setString(idx++, of58aPartyId);
                ps.setString(idx++, of58aBic);
                ps.setString(idx++, of58aNameAddr);

                ps.setString(idx++, of59Account);
                ps.setString(idx++, of59NameAddr);

                ps.setString(idx++, mf32bCurrency);

                if (mf32bAmount != null && !mf32bAmount.trim().isEmpty()) {
                    String norm = mf32bAmount.trim().replace(",", "").replace(" ", "");
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(norm));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                // === OF39A Percentage Credit Amount Tolerance ===
                if (of39aPlus != null && !of39aPlus.trim().isEmpty()) {
                    ps.setInt(idx++, Integer.parseInt(of39aPlus.trim()));
                } else {
                    ps.setNull(idx++, java.sql.Types.INTEGER);
                }

                if (of39aMinus != null && !of39aMinus.trim().isEmpty()) {
                    ps.setInt(idx++, Integer.parseInt(of39aMinus.trim()));
                } else {
                    ps.setNull(idx++, java.sql.Types.INTEGER);
                }
                
                ps.setString(idx++, of39c);

                ps.setString(idx++, mf41aOpt);
                ps.setString(idx++, mf41aBic);
                ps.setString(idx++, mf41aNameAddr);
                ps.setString(idx++, mf41aCode);

                ps.setString(idx++, of42c);

                ps.setString(idx++, of42aOpt);
                ps.setString(idx++, of42aBic);
                ps.setString(idx++, of42aNameAddr);

                ps.setString(idx++, of42m);
                ps.setString(idx++, of42p);

                ps.setString(idx++, of71a);
                ps.setString(idx++, of71d);
                ps.setString(idx++, of72z);

                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT700 data saved successfully!'); window.location='Category7/mt740.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT740: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
