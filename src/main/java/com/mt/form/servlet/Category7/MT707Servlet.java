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

@WebServlet("/MT707Servlet")
public class MT707Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // === Ambil parameter satu per satu dari JSP ===
            String mf27 = request.getParameter("_010_mf27_sequence_of_total");
            String mf20 = request.getParameter("_020_mf20_sender_reference");
            String mf21 = request.getParameter("_030_mf21_receiver_reference");
            String mf23 = request.getParameter("_040_mf23_issuing_bank_reference");

            String of52aOpt = request.getParameter("_050_of52a_option");
            String of52aBic = request.getParameter("_051_of52a_identifier_code");
            String of52aName = request.getParameter("_052_of52a_name_address");

            String of50b = request.getParameter("_060_of50b_non_bank_issuer");

            String mf31c = request.getParameter("_070_mf31c_date_of_issue");
            String mf26e = request.getParameter("_080_mf26e_number_of_amendment");
            String mf30 = request.getParameter("_090_mf30_date_of_amendment");
            String mf22a = request.getParameter("_100_mf22a_purpose_of_message");

            String of23s = request.getParameter("_110_of23s_cancellation_request");
            String of40a = request.getParameter("_120_of40a_form_of_credit");
            String of40e = request.getParameter("_130_of40e_applicable_rules");
            String of40eNarr = request.getParameter("_131_of40e_narrative");

            String of31dDate = request.getParameter("_140_of31d_date_of_expiry");
            String of31dPlace = request.getParameter("_141_of31d_place_of_expiry");

            String of50 = request.getParameter("_150_of50_changed_applicant_details");
            String of59Acc = request.getParameter("_160_of59_account");
            String of59Name = request.getParameter("_161_of59_name_address");

            String of32bCcy = request.getParameter("_170_of32b_currency");
            String of32bAmt = request.getParameter("_171_of32b_amount");
            String of33bCcy = request.getParameter("_180_of33b_currency");
            String of33bAmt = request.getParameter("_181_of33b_amount");

            String of39aPlus = request.getParameter("_190_of39a_plus");
            String of39aMinus = request.getParameter("_191_of39a_minus");
            String of39c = request.getParameter("_200_of39c_additional_amounts");

            String of41aOpt = request.getParameter("_210_of41a_option");
            String of41aBic = request.getParameter("_211_of41a_identifier_code");
            String of41aName = request.getParameter("_212_of41a_name_address");
            String of41aBy = request.getParameter("_213_of41a_code");

            String of42c = request.getParameter("_220_of42c_drafts");

            String of42aOpt = request.getParameter("_230_of42a_option");
            String of42aParty = request.getParameter("_231_of42a_party_identifier");
            String of42aBic = request.getParameter("_232_of42a_identifier_code");
            String of42aName = request.getParameter("_233_of42a_name_address");

            String of42m = request.getParameter("_240_of42m_mixed_payment");
            String of42p = request.getParameter("_250_of42p_negotiation_details");

            String of43p = request.getParameter("_260_of43p_partial_shipments");
            String of43t = request.getParameter("_270_of43t_transhipment");

            String of44a = request.getParameter("_280_of44a_place_dispatch");
            String of44e = request.getParameter("_290_of44e_port_loading");
            String of44f = request.getParameter("_300_of44f_port_discharge");
            String of44b = request.getParameter("_310_of44b_final_destination");

            String of44c = request.getParameter("_320_of44c_latest_date");
            String of44d = request.getParameter("_330_of44d_shipment_period");

            String of45b = request.getParameter("_340_of45b_description_goods");
            String of46b = request.getParameter("_350_of46b_documents_required");
            String of47b = request.getParameter("_360_of47b_additional_conditions");

            String of49m = request.getParameter("_370_of49m_special_payment_beneficiary");
            String of49n = request.getParameter("_380_of49n_special_payment_bank");

            String of71d = request.getParameter("_390_of71d_charges");
            String of71nCode = request.getParameter("_400_of71n_charge_code");
            String of71nNarr = request.getParameter("_401_of71n_narrative");

            String of48Days = request.getParameter("_410_of48_days");
            String of48Narr = request.getParameter("_411_of48_narrative");

            String of49 = request.getParameter("_420_of49_confirmation_instructions");

            String of58aOpt = request.getParameter("_430_of58a_option");
            String of58aBic = request.getParameter("_431_of58a_identifier_code");
            String of58aName = request.getParameter("_432_of58a_name_address");

            String of53aOpt = request.getParameter("_440_of53a_option");
            String of53aBic = request.getParameter("_441_of53a_identifier_code");
            String of53aName = request.getParameter("_442_of53a_name_address");

            String of78 = request.getParameter("_450_of78_instructions");

            String of57aOpt = request.getParameter("_460_of57a_option");
            String of57aBic = request.getParameter("_461_of57a_identifier_code");
            String of57aLoc = request.getParameter("_462_of57a_location");
            String of57aName = request.getParameter("_463_of57a_name_address");

            String of72z = request.getParameter("_470_of72z_sender_to_receiver");

            // === Server-side mandatory check ===
            if (isEmpty(mf27) || isEmpty(mf20) || isEmpty(mf21) ||
                isEmpty(mf23) || isEmpty(mf31c) || isEmpty(mf26e) ||
                isEmpty(mf30) || isEmpty(mf22a)) {
                out.println("<script>alert('Mandatory fields MT707 belum lengkap.'); window.history.back();</script>");
                return;
            }

            // === Query Insert ===
            String sql = "INSERT INTO mt.mt707_message(" +
                    "message_type, _010_mf27_sequence_of_total, _020_mf20_sender_reference, _030_mf21_receiver_reference, _040_mf23_issuing_bank_reference, " +
                    "_050_of52a_option, _051_of52a_identifier_code, _052_of52a_name_address, _060_of50b_non_bank_issuer, " +
                    "_070_mf31c_date_of_issue, _080_mf26e_number_of_amendment, _090_mf30_date_of_amendment, _100_mf22a_purpose_of_message, " +
                    "_110_of23s_cancellation_request, _120_of40a_form_of_credit, _130_of40e_applicable_rules, _131_of40e_narrative, " +
                    "_140_of31d_date_of_expiry, _141_of31d_place_of_expiry, _150_of50_changed_applicant_details, _160_of59_account, _161_of59_name_address, " +
                    "_170_of32b_currency, _171_of32b_amount, _180_of33b_currency, _181_of33b_amount, _190_of39a_plus, _191_of39a_minus, _200_of39c_additional_amounts, " +
                    "_210_of41a_option, _211_of41a_identifier_code, _212_of41a_name_address, _213_of41a_code, _220_of42c_drafts, " +
                    "_230_of42a_option, _231_of42a_party_identifier, _232_of42a_identifier_code, _233_of42a_name_address, " +
                    "_240_of42m_mixed_payment, _250_of42p_negotiation_details, _260_of43p_partial_shipments, _270_of43t_transhipment, " +
                    "_280_of44a_place_dispatch, _290_of44e_port_loading, _300_of44f_port_discharge, _310_of44b_final_destination, " +
                    "_320_of44c_latest_date, _330_of44d_shipment_period, _340_of45b_description_goods, _350_of46b_documents_required, _360_of47b_additional_conditions, " +
                    "_370_of49m_special_payment_beneficiary, _380_of49n_special_payment_bank, _390_of71d_charges, _400_of71n_charge_code, _401_of71n_narrative, " +
                    "_410_of48_days, _411_of48_narrative, _420_of49_confirmation_instructions, _430_of58a_option, _431_of58a_identifier_code, _432_of58a_name_address, " +
                    "_440_of53a_option, _441_of53a_identifier_code, _442_of53a_name_address, _450_of78_instructions, _460_of57a_option, _461_of57a_identifier_code, " +
                    "_462_of57a_location, _463_of57a_name_address, _470_of72z_sender_to_receiver" +
                    ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                int idx = 1;
                ps.setString(idx++, "707");
                ps.setString(idx++, mf27);
                ps.setString(idx++, mf20);
                ps.setString(idx++, mf21);
                ps.setString(idx++, mf23);
                ps.setString(idx++, of52aOpt);
                ps.setString(idx++, of52aBic);
                ps.setString(idx++, of52aName);
                ps.setString(idx++, of50b);
                ps.setString(idx++, mf31c);
                ps.setString(idx++, mf26e);
                ps.setString(idx++, mf30);
                ps.setString(idx++, mf22a);
                ps.setString(idx++, of23s);
                ps.setString(idx++, of40a);
                ps.setString(idx++, of40e);
                ps.setString(idx++, of40eNarr);
                ps.setString(idx++, of31dDate);
                ps.setString(idx++, of31dPlace);
                ps.setString(idx++, of50);
                ps.setString(idx++, of59Acc);
                ps.setString(idx++, of59Name);
                ps.setString(idx++, of32bCcy);
                ps.setString(idx++, of32bAmt);
                ps.setString(idx++, of33bCcy);
                ps.setString(idx++, of33bAmt);
                ps.setString(idx++, of39aPlus);
                ps.setString(idx++, of39aMinus);
                ps.setString(idx++, of39c);
                ps.setString(idx++, of41aOpt);
                ps.setString(idx++, of41aBic);
                ps.setString(idx++, of41aName);
                ps.setString(idx++, of41aBy);
                ps.setString(idx++, of42c);
                ps.setString(idx++, of42aOpt);
                ps.setString(idx++, of42aParty);
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
                ps.setString(idx++, of45b);
                ps.setString(idx++, of46b);
                ps.setString(idx++, of47b);
                ps.setString(idx++, of49m);
                ps.setString(idx++, of49n);
                ps.setString(idx++, of71d);
                ps.setString(idx++, of71nCode);
                ps.setString(idx++, of71nNarr);
                ps.setString(idx++, of48Days);
                ps.setString(idx++, of48Narr);
                ps.setString(idx++, of49);
                ps.setString(idx++, of58aOpt);
                ps.setString(idx++, of58aBic);
                ps.setString(idx++, of58aName);
                ps.setString(idx++, of53aOpt);
                ps.setString(idx++, of53aBic);
                ps.setString(idx++, of53aName);
                ps.setString(idx++, of78);
                ps.setString(idx++, of57aOpt);
                ps.setString(idx++, of57aBic);
                ps.setString(idx++, of57aLoc);
                ps.setString(idx++, of57aName);
                ps.setString(idx++, of72z);

                ps.executeUpdate();
                out.println("<script>alert('MT707 data saved successfully!'); window.location='mt707.jsp';</script>");
            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT707: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
