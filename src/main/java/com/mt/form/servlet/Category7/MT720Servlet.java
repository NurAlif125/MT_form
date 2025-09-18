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
import java.util.Collections;
import java.util.Arrays;

@WebServlet("/MT720Servlet")
public class MT720Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // === Ambil parameter dari form mt720.jsp ===
            String mf27 = request.getParameter("_010_mf27_sequence_of_total");
            String mf40bType = request.getParameter("_020_mf40b_type");
            String mf40bCode = request.getParameter("_021_mf40b_code");
            String mf20 = request.getParameter("_030_mf20_transferring_bank_reference");
            String mf21 = request.getParameter("_040_mf21_documentary_credit_number");

            String mf31c = request.getParameter("_050_mf31c_date_of_issue");
            String mf40e = request.getParameter("_060_mf40e_applicable_rules");
            String mf40eNarr = request.getParameter("_061_mf40e_narrative");
            String mf31dDate = request.getParameter("_070_mf31d_date_of_expiry");
            String mf31dPlace = request.getParameter("_071_mf31d_place_of_expiry");

            String of52aOpt = request.getParameter("_080_of52a_issuing_bank_of_the_original_documentary_credit");
            String of52aBic = request.getParameter("_081_of52a_identifier_code");
            String of52aName = request.getParameter("_082_of52a_name_address");

            String of50b = request.getParameter("_090_of50b_non_bank_issuer_of_the_original_documentary_credit");

            String mf50Name = request.getParameter("_100_mf50_name_address");

            String of59Acc = request.getParameter("_110_mf59_account");
            String mf59Name = request.getParameter("_111_mf59_name_address");

            String mf32bCcy = request.getParameter("_120_mf32b_currency");
            String mf32bAmt = request.getParameter("_121_mf32b_amount");

            String of39aPlus = request.getParameter("_130_of39a_tolerance_plus");
            String of39aMinus = request.getParameter("_131_of39a_tolerance_minus");

            String of39c = request.getParameter("_140_of39c_additional_amounts_covered");

            String mf41aOpt = request.getParameter("_150_mf41a_available_with_by");
            String mf41aBic = request.getParameter("_151_mf41a_identifier_code");
            String mf41aName = request.getParameter("_152_mf41a_name_address");
            String mf41aBy = request.getParameter("_153_mf41a_by");

            String of42c = request.getParameter("_160_of42c_drafts_at");
            String of42aOpt = request.getParameter("_170_of42a_drawee");
            String of42aBic = request.getParameter("_171_of42a_identifier_code");
            String of42aName = request.getParameter("_172_of42d_name_and_address");

            String of42m = request.getParameter("_180_of42m_mixed_payment_details");
            String of42p = request.getParameter("_190_of42p_negotiation_deferred_payment_details");

            String of43p = request.getParameter("_200_of43p_partial_shipments");
            String of43t = request.getParameter("_210_of43t_transhipment");

            String of44a = request.getParameter("_220_of44a_place_of_taking_in_charge_dispatch_from_place_of_receipt");
            String of44e = request.getParameter("_230_of44e_port_of_loading_airport_of_departure");
            String of44f = request.getParameter("_240_of44f_port_of_discharge_airport_of_destination");
            String of44b = request.getParameter("_250_of44b_place_of_final_destination_for_transportation_to_place_of_delivery");

            String of44c = request.getParameter("_260_of44c_latest_date_of_shipment");
            String of44d = request.getParameter("_270_of44d_shipment_period");

            String of45a = request.getParameter("_280_of45a_description_of_goods_and_or_services");
            String of46a = request.getParameter("_290_of46a_documents_required");
            String of47a = request.getParameter("_300_of47a_additional_conditions");
            String of49g = request.getParameter("_310_of49g_special_payment_conditions_for_beneficiary");
            String of49h = request.getParameter("_320_of49h_special_payment_conditions_for_bank_only");

            String of71d = request.getParameter("_330_of71d_charges");
            String of48Days = request.getParameter("_340_of48_days");
            String of48Narr = request.getParameter("_341_of48_narrative");
            String of49 = request.getParameter("_350_mf49_confirmation_instructions");

            String of58aOpt = request.getParameter("_360_of58a_requested_confirmation_party");
            String of58aBic = request.getParameter("_361_of58a_bic");
            String of58aName = request.getParameter("_362_of58a_name_address");

            String of78 = request.getParameter("_370_of78_instructions_to_the_paying_accepting_negotiating_bank");
            String of78d = request.getParameter("_380_of78d_instructions_from_transferring_bank");

            String of57aOpt = request.getParameter("_390_of57a_advise_through_bank");
            String of57aBic = request.getParameter("_391_of57a_bic");
            String of57aLocation = request.getParameter("_392_of57a_location");
            String of57aName = request.getParameter("_393_of57a_name_address");

            String of72z = request.getParameter("_400_of72z_sender_to_receiver_information");

            // === Server-side mandatory check ===
            if (isEmpty(mf27) || isEmpty(mf40bType) || isEmpty(mf40bCode) || isEmpty(mf20) || isEmpty(mf21) ||
                isEmpty(mf31c) || isEmpty(mf40e) || isEmpty(mf31dDate) || isEmpty(mf31dPlace) ||
                isEmpty(mf50Name) || isEmpty(mf59Name) || isEmpty(mf32bCcy) || isEmpty(mf32bAmt) ||
                isEmpty(mf41aOpt) || isEmpty(mf41aBy) || isEmpty(of49)) {
                out.println("<script>alert('Mandatory fields MT720 belum lengkap.'); window.history.back();</script>");
                return;
            }

            // === Generate custom form_id untuk MT720 ===
            String newId = null;
            String sqlNextId =
                "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                "FROM mt.mt720_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT720_" + next;
                } else {
                    newId = "MT720_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT720_1";
            }

            // === Column list (sinkron dengan DDL & JSP) ===
            String columns = "form_id, message_type, " +
                    "_010_mf27_sequence_of_total, _020_mf40b_type, _021_mf40b_code, " +
                    "_030_mf20_transferring_bank_reference, _040_mf21_documentary_credit_number, " +
                    "_050_mf31c_date_of_issue, _060_mf40e_applicable_rules, _061_mf40e_narrative, " +
                    "_070_mf31d_date_of_expiry, _071_mf31d_place_of_expiry, " +
                    "_080_of52a_option, _081_of52a_identifier_code, _082_of52a_name_address, " +
                    "_090_of50b_non_bank_issuer, " +
                    "_100_mf50_name_address, _110_mf59_account, _111_mf59_name_address, " +
                    "_120_mf32b_currency, _121_mf32b_amount, _130_of39a_tolerance_plus, _131_of39a_tolerance_minus, " +
                    "_140_of39c_additional_amounts, " +
                    "_150_mf41a_option, _151_mf41a_identifier_code, _152_mf41a_name_address, _153_mf41a_by, " +
                    "_160_of42c_drafts, _170_of42a_option, _171_of42a_identifier_code, _172_of42a_name_address, " +
                    "_180_of42m_mixed_payment, _190_of42p_deferred_payment, _200_of43p_partial_shipments, _210_of43t_transhipment, " +
                    "_220_of44a_place_dispatch, _230_of44e_port_loading, _240_of44f_port_discharge, _250_of44b_final_destination, " +
                    "_260_of44c_latest_date, _270_of44d_shipment_period, " +
                    "_280_of45a_description, _290_of46a_documents, _300_of47a_conditions, " +
                    "_310_of49g_special_beneficiary, _320_of49h_special_bank, " +
                    "_330_of71d_charges, _340_of48_days, _341_of48_narrative, _350_mf49_confirmation, " +
                    "_360_of58a_option, _361_of58a_bic, _362_of58a_name_address, " +
                    "_370_of78_instructions, _380_of78d_instructions_from_transferring, " +
                    "_390_of57a_option, _391_of57a_bic, _392_of57a_location, _393_of57a_name_address, " +
                    "_400_of72z_sender_to_receiver_information";

            int paramCount = (int) Arrays.stream(columns.split(","))
                                         .map(String::trim)
                                         .filter(s -> !s.isEmpty())
                                         .count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt720_message(" + columns + ") VALUES (" + placeholders + ")";

            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "720");
                ps.setString(idx++, mf27);
                ps.setString(idx++, mf40bType);
                ps.setString(idx++, mf40bCode);
                ps.setString(idx++, mf20);
                ps.setString(idx++, mf21);
                ps.setString(idx++, mf31c);
                ps.setString(idx++, mf40e);
                ps.setString(idx++, mf40eNarr);
                ps.setString(idx++, mf31dDate);
                ps.setString(idx++, mf31dPlace);
                ps.setString(idx++, of52aOpt);
                ps.setString(idx++, of52aBic);
                ps.setString(idx++, of52aName);
                ps.setString(idx++, of50b);
                ps.setString(idx++, mf50Name);
                ps.setString(idx++, of59Acc);
                ps.setString(idx++, mf59Name);
                ps.setString(idx++, mf32bCcy);

                // Amount (numeric)
                if (mf32bAmt != null && !mf32bAmt.trim().isEmpty()) {
                    String norm = mf32bAmt.trim().replace(",", "").replace(" ", "");
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(norm));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                // Percent tolerances
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
                ps.setString(idx++, mf41aName);
                ps.setString(idx++, mf41aBy);
                ps.setString(idx++, of42c);
                ps.setString(idx++, of42aOpt);
                ps.setString(idx++, of42aBic);
                ps.setString(idx++, of42aName);
                ps.setString(idx++, of42m);
                ps.setString(idx++, of42p);
                ps.setString(idx++, of43p);
                ps.setString(idx++, of43t);
                ps.setString(idx++, of44a);
                ps.setString(idx++, of44e);
                ps.setString(idx++, of44f);
                ps.setString(idx++, of44b);
                ps.setString(idx++, of44c);
                ps.setString(idx++, of44d);
                ps.setString(idx++, of45a);
                ps.setString(idx++, of46a);
                ps.setString(idx++, of47a);
                ps.setString(idx++, of49g);
                ps.setString(idx++, of49h);
                ps.setString(idx++, of71d);
                ps.setString(idx++, of48Days);
                ps.setString(idx++, of48Narr);
                ps.setString(idx++, of49);
                ps.setString(idx++, of58aOpt);
                ps.setString(idx++, of58aBic);
                ps.setString(idx++, of58aName);
                ps.setString(idx++, of78);
                ps.setString(idx++, of78d);
                ps.setString(idx++, of57aOpt);
                ps.setString(idx++, of57aBic);
                ps.setString(idx++, of57aLocation);
                ps.setString(idx++, of57aName);
                ps.setString(idx++, of72z);

                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT720 data saved successfully!'); window.location='Category7/mt720.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT720: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
