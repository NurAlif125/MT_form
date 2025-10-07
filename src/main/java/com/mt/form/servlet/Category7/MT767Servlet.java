package com.mt.form.servlet.Category7;

import com.mt.form.util.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Arrays;
import java.util.Collections;

/**
 * Servlet untuk menyimpan data form MT767
 * Author: mslam
 * Date: Oct 2025
 */
@WebServlet("/MT767Servlet")
public class MT767Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // ===== Sequence A - General Info =====
            String f27Number = request.getParameter("_020_mf27_number");
            String f27Total = request.getParameter("_021_mf27_total");
            String f21 = request.getParameter("_030_mf21_related_reference");
            String f22a = request.getParameter("_040_mf22a_purpose_of_message");

            // ===== Sequence B - Undertaking Details =====
            String f20 = request.getParameter("_090_mf20_undertaking_number");
            String f26e = request.getParameter("_100_mf26e_number_of_amendment");
            String f30 = request.getParameter("_110_mf30_date_of_amendment");

            String opt52a = request.getParameter("_120_mf52a_issuer");
            String f52aPartyId = request.getParameter("_121_mf52a_party_identifier");
            String f52aCode = request.getParameter("_122_mf52a_identifier_code");
            String f52dPartyId = request.getParameter("_123_mf52d_party_identifier");
            String f52dNameAddr = request.getParameter("_124_mf52d_name_address");

            String f32bCurrency = request.getParameter("_140_of32b_currency");
            String f32bAmount = request.getParameter("_141_of32b_amount");
            String f33bCurrency = request.getParameter("_150_of33b_currency");
            String f33bAmount = request.getParameter("_151_of33b_amount");

            String f23b = request.getParameter("_160_of23b_expiry_type");
            String f31e = request.getParameter("_170_of31e_date_of_expiry");
            String f35g = request.getParameter("_180_of35g_expiry_conditions_event");

            String f59a = request.getParameter("_190_of59a_beneficiary");
            String f59aAcc = request.getParameter("_191_of59a_account");
            String f59aNameAddr = request.getParameter("_192_of59a_name_address");
            String f59aAcc2 = request.getParameter("_193_of59a_account");
            String f59aCode = request.getParameter("_194_of59a_identifier_code");

            String f23 = request.getParameter("_130_of23_advising_bank_reference");
            String f24e = request.getParameter("_210_of24e_delivery_of_amendment_to_undertaking");
            String f24eNarrative = request.getParameter("_211_of24e_narrative");
            String f24g = request.getParameter("_220_of24g_delivery_to_collection_by");
            String f24gNarrative = request.getParameter("_221_of24g_narrative");

            String f77l = request.getParameter("_200_of77l_other_amandments_to_local_undertaking");

            // ===== Sequence C (optional) =====
            String seqCChecked = request.getParameter("check_seq_C");
            String f32bCurrC = request.getParameter("_240_of32b_currency");
            String f32bAmtC = request.getParameter("_241_of32b_amount");
            String f33bCurrC = request.getParameter("_250_of33b_currency");
            String f33bAmtC = request.getParameter("_251_of33b_amount");
            String f23bC = request.getParameter("_260_of23b_expiry_type");
            String f31eC = request.getParameter("_270_of31e_date_of_expiry");
            String f35gC = request.getParameter("_280_of35g_expiry_conditions_event");
            String f59C = request.getParameter("_290_of59_beneficiary");
            String f59CNameAddr = request.getParameter("_291_of59_name_address");
            String f77lC = request.getParameter("_300_of77l_other_amandments_to_local_undertaking");
            String f24eC = request.getParameter("_310_of24e_delivery_of_amendment_to_undertaking");
            String f24eNarrC = request.getParameter("_311_of24e_narrative");
            String f24gC = request.getParameter("_320_of24g_delivery_to_collection_by");
            String f24gNarrC = request.getParameter("_321_of24g_narrative");

            /* ======================================================
             *  VALIDASI FIELD MANDATORY
             * ====================================================== */
            if (isEmpty(f27Number) || isEmpty(f27Total) || isEmpty(f21) || isEmpty(f22a)
                    || isEmpty(f20) || isEmpty(f26e) || isEmpty(f30) || isEmpty(opt52a)) {
                out.println("<script>alert('Mandatory fields MT767 belum lengkap.'); window.history.back();</script>");
                return;
            }

            /* ======================================================
             *  GENERATE form_id UNIK
             * ====================================================== */
            String newId;
            String sqlNextId =
                    "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                            "FROM mt.mt767_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    newId = "MT767_" + rs.getInt("next_id");
                } else {
                    newId = "MT767_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT767_1";
            }

            /* ======================================================
             *  SIMPAN KE DATABASE
             * ====================================================== */

            String columns = "form_id, message_type, " +
                    "_020_mf27_number, _021_mf27_total, _030_mf21_related_reference, _040_mf22a_purpose_of_message, " +
                    "_090_mf20_undertaking_number, _100_mf26e_number_of_amendment, _110_mf30_date_of_amendment, " +
                    "_120_mf52a_issuer, _121_mf52a_party_identifier, _122_mf52a_identifier_code, _123_mf52d_party_identifier, _124_mf52d_name_address, " +
                    "_140_of32b_currency, _141_of32b_amount, _150_of33b_currency, _151_of33b_amount, " +
                    "_160_of23b_expiry_type, _170_of31e_date_of_expiry, _180_of35g_expiry_conditions_event, " +
                    "_190_of59a_beneficiary, _191_of59a_account, _192_of59a_name_address, _193_of59a_account, _194_of59a_identifier_code, " +
                    "_130_of23_advising_bank_reference, _210_of24e_delivery_of_amendment_to_undertaking, _211_of24e_narrative, " +
                    "_220_of24g_delivery_to_collection_by, _221_of24g_narrative, _200_of77l_other_amandments_to_local_undertaking, " +
                    "_240_of32b_currency, _241_of32b_amount, _250_of33b_currency, _251_of33b_amount, " +
                    "_260_of23b_expiry_type, _270_of31e_date_of_expiry, _280_of35g_expiry_conditions_event, " +
                    "_290_of59_beneficiary, _291_of59_name_address, _300_of77l_other_amandments_to_local_undertaking, " +
                    "_310_of24e_delivery_of_amendment_to_undertaking, _311_of24e_narrative, _320_of24g_delivery_to_collection_by, _321_of24g_narrative";

            int paramCount = (int) Arrays.stream(columns.split(",")).map(String::trim).filter(s -> !s.isEmpty()).count();
            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));

            String sql = "INSERT INTO mt.mt767_message(" + columns + ") VALUES (" + placeholders + ")";

            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "767");

                ps.setString(idx++, f27Number);
                ps.setString(idx++, f27Total);
                ps.setString(idx++, f21);
                ps.setString(idx++, f22a);

                ps.setString(idx++, f20);
                ps.setString(idx++, f26e);
                ps.setString(idx++, f30);

                ps.setString(idx++, opt52a);
                ps.setString(idx++, f52aPartyId);
                ps.setString(idx++, f52aCode);
                ps.setString(idx++, f52dPartyId);
                ps.setString(idx++, f52dNameAddr);

                ps.setString(idx++, f32bCurrency);
                setBigDecimalOrNull(ps, idx++, f32bAmount);
                ps.setString(idx++, f33bCurrency);
                setBigDecimalOrNull(ps, idx++, f33bAmount);

                ps.setString(idx++, f23b);
                ps.setString(idx++, f31e);
                ps.setString(idx++, f35g);

                ps.setString(idx++, f59a);
                ps.setString(idx++, f59aAcc);
                ps.setString(idx++, f59aNameAddr);
                ps.setString(idx++, f59aAcc2);
                ps.setString(idx++, f59aCode);

                ps.setString(idx++, f23);
                ps.setString(idx++, f24e);
                ps.setString(idx++, f24eNarrative);
                ps.setString(idx++, f24g);
                ps.setString(idx++, f24gNarrative);
                ps.setString(idx++, f77l);

                ps.setString(idx++, f32bCurrC);
                setBigDecimalOrNull(ps, idx++, f32bAmtC);
                ps.setString(idx++, f33bCurrC);
                setBigDecimalOrNull(ps, idx++, f33bAmtC);

                ps.setString(idx++, f23bC);
                ps.setString(idx++, f31eC);
                ps.setString(idx++, f35gC);
                ps.setString(idx++, f59C);
                ps.setString(idx++, f59CNameAddr);
                ps.setString(idx++, f77lC);
                ps.setString(idx++, f24eC);
                ps.setString(idx++, f24eNarrC);
                ps.setString(idx++, f24gC);
                ps.setString(idx++, f24gNarrC);

                ps.executeUpdate();
                out.println("<script>alert('MT767 data saved successfully!'); window.location='Category7/mt767.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT767: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    /* Utility functions */
    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }

    private void setBigDecimalOrNull(PreparedStatement ps, int idx, String val) throws java.sql.SQLException {
        if (val != null && !val.trim().isEmpty()) {
            ps.setBigDecimal(idx, new BigDecimal(val.replace(",", "")));
        } else {
            ps.setNull(idx, java.sql.Types.NUMERIC);
        }
    }
}
