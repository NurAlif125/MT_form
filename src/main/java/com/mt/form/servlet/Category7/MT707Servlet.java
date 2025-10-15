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
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * MT707Servlet - Amendment to a Documentary Credit
 * Handles form submission from mt707.jsp and saves data to mt.mt707_message table
 * 
 * @author mslam
 * @version 1.0
 */
@WebServlet("/MT707Servlet")
public class MT707Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // ========== MANDATORY FIELDS - HEADER ==========
            // Field 27: Sequence of Total
            String mf27Number = request.getParameter("_010_mf27_number");
            String mf27Total = request.getParameter("_011_mf27_total");
            String mf27 = (mf27Number != null && mf27Total != null) 
                ? mf27Number + "/" + mf27Total : null;

            // Field 20: Sender's Reference
            String mf20 = request.getParameter("_020_mf20_sender_reference");

            // Field 21: Receiver's Reference
            String mf21 = request.getParameter("_030_mf21_receiver_reference");

            // Field 23: Issuing Bank's Reference
            String mf23 = request.getParameter("_040_mf23_issuing_bank_reference");

            // Field 31C: Date of Issue
            String mf31c = request.getParameter("_070_mf31c_date_of_issue");

            // Field 26E: Number of Amendment
            String mf26e = request.getParameter("_080_mf26e_number_of_amendment");

            // Field 30: Date of Amendment
            String mf30 = request.getParameter("_090_mf30_date_of_amendment");

            // Field 22A: Purpose of Message
            String mf22a = request.getParameter("_100_mf22a_purpose_of_message");

            // ========== CONDITIONAL FIELDS - ISSUING BANK OR NON-BANK ISSUER ==========
            // Field 52a: Issuing Bank (Option A or D)
            String of52aOption = request.getParameter("_050_of52a_issuing_bank");
            String of52aPartyIdA = request.getParameter("_051_of52a_party_identifier");
            String of52aBic = request.getParameter("_052_of52a_identifier_code");
            String of52aPartyIdD = request.getParameter("_053_of52a_party_identifier");
            String of52aNameAddr = request.getParameter("_054_of52a_name_address");

            // Field 50B: Non-Bank Issuer
            String of50b = request.getParameter("_060_of50b_non_bank_issuer");

            // ========== OPTIONAL FIELDS - BODY ==========
            // Field 23S: Cancellation Request
            String of23s = request.getParameter("_110_of23s_cancellation_request");

            // Field 40A: Form of Documentary Credit
            String of40a = request.getParameter("_120_of40a_form_of_documentary_credit");

            // Field 40E: Applicable Rules
            String of40e = request.getParameter("_130_of40e_applicable_rules");
            String of40eNarr = request.getParameter("_131_of40e_narrative");

            // Field 31D: Date and Place of Expiry
            String of31dDate = request.getParameter("_140_of31d_date_of_expiry");
            String of31dPlace = request.getParameter("_141_of31d_place_of_expiry");

            // Field 50: Changed Applicant Details
            String of50 = request.getParameter("_150_of50_changed_applicant_details");

            // Field 59: Beneficiary
            String of59Acc = request.getParameter("_160_of59_account");
            String of59Name = request.getParameter("_161_of59_name_address");

            // Field 32B: Increase of Documentary Credit Amount
            String of32bCcy = request.getParameter("_170_of32b_currency");
            String of32bAmt = request.getParameter("_171_of32b_amount");

            // Field 33B: Decrease of Documentary Credit Amount
            String of33bCcy = request.getParameter("_180_of33b_currency");
            String of33bAmt = request.getParameter("_181_of33b_amount");

            // Field 39A: Percentage Credit Amount Tolerance
            String of39aPlus = request.getParameter("_190_of39a_plus");
            String of39aMinus = request.getParameter("_191_of39a_minus");

            // Field 39C: Additional Amounts Covered
            String of39c = request.getParameter("_200_of39c_additional_amounts_covered");

            // Field 41a: Available With ... By ... (Option A or D)
            String of41aOption = request.getParameter("_210_of41a_available_with_by");
            String of41aBic = request.getParameter("_211_of41a_identifier_code");
            String of41aNameAddr = request.getParameter("_212_of41a_name_address");
            String of41aCode = request.getParameter("_213_of41a_code");

            // Field 42C: Drafts at ...
            String of42c = request.getParameter("_220_of42c_drafts_at");

            // Field 42a: Drawee (Option A or D)
            String of42aOption = request.getParameter("_230_of42a_drawee");
            String of42aPartyIdA = request.getParameter("_231_of42a_party_identifier");
            String of42aBic = request.getParameter("_232_of42a_identifier_code");
            String of42aPartyIdD = request.getParameter("_233_of42a_party_identifier");
            String of42aNameAddr = request.getParameter("_234_of42a_name_address");

            // Field 42M: Mixed Payment Details
            String of42m = request.getParameter("_240_of42m_mixed_payment_details");

            // Field 42P: Negotiation/Deferred Payment Details
            String of42p = request.getParameter("_250_of42p_negotiation_deferred_payment_details");

            // Field 43P: Partial Shipments
            String of43p = request.getParameter("_260_of43p_partial_shipments");

            // Field 43T: Transhipment
            String of43t = request.getParameter("_270_of43t_transhipment");

            // Field 44A: Place of Taking in Charge/Dispatch from/Place of Receipt
            String of44a = request.getParameter("_280_of44a_place_taking_in_charge_dispatch_from_place_of_receipt");

            // Field 44E: Port of Loading/Airport of Departure
            String of44e = request.getParameter("_290_of44e_port_of_loading_airport_of_departure");

            // Field 44F: Port of Discharge/Airport of Destination
            String of44f = request.getParameter("_300_of44f_port_of_discharge_airport_of_destination");

            // Field 44B: Place of Final Destination/For Transportation to/Place of Delivery
            String of44b = request.getParameter("_310_of44b_place_of_final_destination_for_transportation_to_place_of_delivery");

            // Field 44C: Latest Date of Shipment
            String of44c = request.getParameter("_320_of44c_latest_date_of_shipment");

            // Field 44D: Shipment Period
            String of44d = request.getParameter("_330_of44d_shipment_period");

            // Field 45B: Description of Goods and/or Services
            String of45b = request.getParameter("_340_of45b_description_of_goods_and_or_services");

            // Field 46B: Documents Required
            String of46b = request.getParameter("_350_of46b_documents_required");

            // Field 47B: Additional Conditions
            String of47b = request.getParameter("_360_of47b_additional_conditions");

            // Field 49M: Special Payment Conditions for Beneficiary
            String of49m = request.getParameter("_370_of49m_special_payment_conditions_for_beneficiary");

            // Field 49N: Special Payment Conditions for Bank Only
            String of49n = request.getParameter("_380_of49n_special_payment_conditions_for_bank_only");

            // Field 71D: Charges
            String of71d = request.getParameter("_390_of71d_charges");

            // Field 71N: Amendment Charge Payable By
            String of71nCode = request.getParameter("_400_of71n_charge_code");
            String of71nNarr = request.getParameter("_401_of71n_narrative");

            // Field 48: Period for Presentation in Days
            String of48Days = request.getParameter("_410_of48_days");
            String of48Narr = request.getParameter("_411_of48_narrative");

            // Field 49: Confirmation Instructions
            String of49 = request.getParameter("_420_of49_confirmation_instructions");

            // Field 58a: Requested Confirmation Party (Option A or D)
            String of58aOption = request.getParameter("_430_of58a_requested_confirmation_party");
            String of58aPartyIdA = request.getParameter("_431_of58a_party_identifier");
            String of58aBic = request.getParameter("_432_of58a_identifier_code");
            String of58aPartyIdD = request.getParameter("_433_of58a_party_identifier");
            String of58aNameAddr = request.getParameter("_434_of58a_name_address");

            // Field 53a: Reimbursing Bank (Option A or D)
            String of53aOption = request.getParameter("_440_of53a_reimbursing_bank");
            String of53aPartyIdA = request.getParameter("_441_of53a_party_identifier");
            String of53aBic = request.getParameter("_442_of53a_identifier_code");
            String of53aPartyIdD = request.getParameter("_443_of53a_party_identifier");
            String of53aNameAddr = request.getParameter("_444_of53a_name_address");

            // Field 78: Instructions to the Paying/Accepting/Negotiating Bank
            String of78 = request.getParameter("_450_of78_instructions_to_the_paying_accepting_negotiating_bank");

            // Field 57a: 'Advise Through' Bank (Option A, B, or D)
            String of57aOption = request.getParameter("_460_of57a_advise_through_bank");
            String of57aPartyIdA = request.getParameter("_461_of57a_party_identifier");
            String of57aBic = request.getParameter("_462_of57a_identifier_code");
            String of57aPartyIdB = request.getParameter("_463_of57a_party_identifier");
            String of57aLocation = request.getParameter("_464_of57a_location");
            String of57aPartyIdD = request.getParameter("_465_of57a_party_identifier");
            String of57aNameAddr = request.getParameter("_466_of57a_name_address");

            // Field 72Z: Sender to Receiver Information
            String of72z = request.getParameter("_470_of72z_sender_to_receiver_information");

            // ========== SERVER-SIDE MANDATORY VALIDATION ==========
            if (isEmpty(mf27) || isEmpty(mf20) || isEmpty(mf21) ||
                isEmpty(mf23) || isEmpty(mf31c) || isEmpty(mf26e) ||
                isEmpty(mf30) || isEmpty(mf22a)) {
                out.println("<script>alert('Mandatory fields are incomplete. Please fill all required fields.'); window.history.back();</script>");
                return;
            }

            // ========== GENERATE CUSTOM FORM_ID FOR MT707 ==========
            String newId = generateFormId();

            // ========== PREPARE SQL INSERT STATEMENT ==========
            String sql = "INSERT INTO mt.mt707_message(" +
                    "form_id, message_type, " +
                    "_010_mf27_sequence_of_total, _020_mf20_sender_reference, _030_mf21_receiver_reference, " +
                    "_040_mf23_issuing_bank_reference, " +
                    "_050_of52a_option, _051_of52a_identifier_code, _052_of52a_name_address, " +
                    "_060_of50b_non_bank_issuer, " +
                    "_070_mf31c_date_of_issue, _080_mf26e_number_of_amendment, _090_mf30_date_of_amendment, " +
                    "_100_mf22a_purpose_of_message, " +
                    "_110_of23s_cancellation_request, _120_of40a_form_of_credit, " +
                    "_130_of40e_applicable_rules, _131_of40e_narrative, " +
                    "_140_of31d_date_of_expiry, _141_of31d_place_of_expiry, " +
                    "_150_of50_changed_applicant_details, " +
                    "_160_of59_account, _161_of59_name_address, " +
                    "_170_of32b_currency, _171_of32b_amount, " +
                    "_180_of33b_currency, _181_of33b_amount, " +
                    "_190_of39a_plus, _191_of39a_minus, " +
                    "_200_of39c_additional_amounts, " +
                    "_210_of41a_option, _211_of41a_identifier_code, _212_of41a_name_address, _213_of41a_code, " +
                    "_220_of42c_drafts, " +
                    "_230_of42a_option, _231_of42a_party_identifier, _232_of42a_identifier_code, _233_of42a_name_address, " +
                    "_240_of42m_mixed_payment, _250_of42p_negotiation_details, " +
                    "_260_of43p_partial_shipments, _270_of43t_transhipment, " +
                    "_280_of44a_place_dispatch, _290_of44e_port_loading, " +
                    "_300_of44f_port_discharge, _310_of44b_final_destination, " +
                    "_320_of44c_latest_date, _330_of44d_shipment_period, " +
                    "_340_of45b_description_goods, _350_of46b_documents_required, _360_of47b_additional_conditions, " +
                    "_370_of49m_special_payment_beneficiary, _380_of49n_special_payment_bank, " +
                    "_390_of71d_charges, _400_of71n_charge_code, _401_of71n_narrative, " +
                    "_410_of48_days, _411_of48_narrative, " +
                    "_420_of49_confirmation_instructions, " +
                    "_430_of58a_option, _431_of58a_identifier_code, _432_of58a_name_address, " +
                    "_440_of53a_option, _441_of53a_identifier_code, _442_of53a_name_address, " +
                    "_450_of78_instructions, " +
                    "_460_of57a_option, _461_of57a_identifier_code, _462_of57a_location, _463_of57a_name_address, " +
                    "_470_of72z_sender_to_receiver" +
                    ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                
                // Basic Info
                ps.setString(idx++, newId);                          // form_id
                ps.setString(idx++, "707");                          // message_type

                // Mandatory Fields
                ps.setString(idx++, mf27);                           // _010_mf27_sequence_of_total
                ps.setString(idx++, mf20);                           // _020_mf20_sender_reference
                ps.setString(idx++, mf21);                           // _030_mf21_receiver_reference
                ps.setString(idx++, mf23);                           // _040_mf23_issuing_bank_reference

                // Field 52a: Issuing Bank (Conditional based on option)
                ps.setString(idx++, of52aOption);                    // _050_of52a_option
                String of52aIdentifier = ("A".equals(of52aOption)) ? of52aBic : null;
                ps.setString(idx++, of52aIdentifier);                // _051_of52a_identifier_code
                String of52aName = ("D".equals(of52aOption)) ? of52aNameAddr : null;
                ps.setString(idx++, of52aName);                      // _052_of52a_name_address

                // Field 50B: Non-Bank Issuer
                ps.setString(idx++, of50b);                          // _060_of50b_non_bank_issuer

                // Mandatory Date Fields
                ps.setString(idx++, mf31c);                          // _070_mf31c_date_of_issue
                ps.setString(idx++, mf26e);                          // _080_mf26e_number_of_amendment
                ps.setString(idx++, mf30);                           // _090_mf30_date_of_amendment
                ps.setString(idx++, mf22a);                          // _100_mf22a_purpose_of_message

                // Optional Fields
                ps.setString(idx++, of23s);                          // _110_of23s_cancellation_request
                ps.setString(idx++, of40a);                          // _120_of40a_form_of_credit
                ps.setString(idx++, of40e);                          // _130_of40e_applicable_rules
                ps.setString(idx++, of40eNarr);                      // _131_of40e_narrative
                ps.setString(idx++, of31dDate);                      // _140_of31d_date_of_expiry
                ps.setString(idx++, of31dPlace);                     // _141_of31d_place_of_expiry
                ps.setString(idx++, of50);                           // _150_of50_changed_applicant_details
                ps.setString(idx++, of59Acc);                        // _160_of59_account
                ps.setString(idx++, of59Name);                       // _161_of59_name_address
                ps.setString(idx++, of32bCcy);  // _170_of32b_currency
                if (of32bAmt == null || of32bAmt.trim().isEmpty()) {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                } else {
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(of32bAmt.trim()));
                }
                
                ps.setString(idx++, of33bCcy);  // _180_of33b_currency
                if (of33bAmt == null || of33bAmt.trim().isEmpty()) {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                } else {
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(of33bAmt.trim()));
                }
                
                ps.setString(idx++, of39aPlus);                      // _190_of39a_plus
                ps.setString(idx++, of39aMinus);                     // _191_of39a_minus
                ps.setString(idx++, of39c);                          // _200_of39c_additional_amounts

                // Field 41a: Available With ... By ...
                ps.setString(idx++, of41aOption);                    // _210_of41a_option
                String of41aIdentifier = ("A".equals(of41aOption)) ? of41aBic : null;
                ps.setString(idx++, of41aIdentifier);                // _211_of41a_identifier_code
                String of41aName = ("D".equals(of41aOption)) ? of41aNameAddr : null;
                ps.setString(idx++, of41aName);                      // _212_of41a_name_address
                ps.setString(idx++, of41aCode);                      // _213_of41a_code

                ps.setString(idx++, of42c);                          // _220_of42c_drafts

                // Field 42a: Drawee
                ps.setString(idx++, of42aOption);                    // _230_of42a_option
                String of42aPartyId = ("A".equals(of42aOption)) ? of42aPartyIdA : 
                                     ("D".equals(of42aOption)) ? of42aPartyIdD : null;
                ps.setString(idx++, of42aPartyId);                   // _231_of42a_party_identifier
                String of42aIdentifier = ("A".equals(of42aOption)) ? of42aBic : null;
                ps.setString(idx++, of42aIdentifier);                // _232_of42a_identifier_code
                String of42aName = ("D".equals(of42aOption)) ? of42aNameAddr : null;
                ps.setString(idx++, of42aName);                      // _233_of42a_name_address

                ps.setString(idx++, of42m);                          // _240_of42m_mixed_payment
                ps.setString(idx++, of42p);                          // _250_of42p_negotiation_details
                ps.setString(idx++, of43p);                          // _260_of43p_partial_shipments
                ps.setString(idx++, of43t);                          // _270_of43t_transhipment
                ps.setString(idx++, of44a);                          // _280_of44a_place_dispatch
                ps.setString(idx++, of44e);                          // _290_of44e_port_loading
                ps.setString(idx++, of44f);                          // _300_of44f_port_discharge
                ps.setString(idx++, of44b);                          // _310_of44b_final_destination
                ps.setString(idx++, of44c);                          // _320_of44c_latest_date
                ps.setString(idx++, of44d);                          // _330_of44d_shipment_period
                ps.setString(idx++, of45b);                          // _340_of45b_description_goods
                ps.setString(idx++, of46b);                          // _350_of46b_documents_required
                ps.setString(idx++, of47b);                          // _360_of47b_additional_conditions
                ps.setString(idx++, of49m);                          // _370_of49m_special_payment_beneficiary
                ps.setString(idx++, of49n);                          // _380_of49n_special_payment_bank
                ps.setString(idx++, of71d);                          // _390_of71d_charges
                ps.setString(idx++, of71nCode);                      // _400_of71n_charge_code
                ps.setString(idx++, of71nNarr);                      // _401_of71n_narrative
                ps.setString(idx++, of48Days);                       // _410_of48_days
                ps.setString(idx++, of48Narr);                       // _411_of48_narrative
                ps.setString(idx++, of49);                           // _420_of49_confirmation_instructions

                // Field 58a: Requested Confirmation Party
                ps.setString(idx++, of58aOption);                    // _430_of58a_option
                String of58aIdentifier = ("A".equals(of58aOption)) ? of58aBic : null;
                ps.setString(idx++, of58aIdentifier);                // _431_of58a_identifier_code
                String of58aName = ("D".equals(of58aOption)) ? of58aNameAddr : null;
                ps.setString(idx++, of58aName);                      // _432_of58a_name_address

                // Field 53a: Reimbursing Bank
                ps.setString(idx++, of53aOption);                    // _440_of53a_option
                String of53aIdentifier = ("A".equals(of53aOption)) ? of53aBic : null;
                ps.setString(idx++, of53aIdentifier);                // _441_of53a_identifier_code
                String of53aName = ("D".equals(of53aOption)) ? of53aNameAddr : null;
                ps.setString(idx++, of53aName);                      // _442_of53a_name_address

                ps.setString(idx++, of78);                           // _450_of78_instructions

                // Field 57a: 'Advise Through' Bank
                ps.setString(idx++, of57aOption);                    // _460_of57a_option
                String of57aIdentifier = ("A".equals(of57aOption)) ? of57aBic : null;
                ps.setString(idx++, of57aIdentifier);                // _461_of57a_identifier_code
                String of57aLoc = ("B".equals(of57aOption)) ? of57aLocation : null;
                ps.setString(idx++, of57aLoc);                       // _462_of57a_location
                String of57aName = ("D".equals(of57aOption)) ? of57aNameAddr : null;
                ps.setString(idx++, of57aName);                      // _463_of57a_name_address

                ps.setString(idx++, of72z);                          // _470_of72z_sender_to_receiver

                // Execute insert
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<script>alert('MT707 data saved successfully! Form ID: " + newId + "'); window.location='Category7/mt707.jsp';</script>");
                } else {
                    out.println("<script>alert('Failed to save MT707 data.'); window.history.back();</script>");
                }

            } catch (Exception e) {
                e.printStackTrace(out);
                String errorMsg = e.getMessage().replace("'", "\\'");
                out.println("<script>alert('Error saving MT707: " + errorMsg + "'); window.history.back();</script>");
            }
        }
    }

    /**
     * Generate unique form_id for MT707
     * Format: MT707_[sequential_number]
     * 
     * @return Generated form_id
     */
    private String generateFormId() {
        String newId = "MT707_1";
        String sqlNextId = 
            "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM 7) AS INTEGER)), 0) + 1 AS next_id " +
            "FROM mt.mt707_message " +
            "WHERE form_id ~ '^MT707_[0-9]+$'";

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sqlNextId)) {
            
            if (rs.next()) {
                int next = rs.getInt("next_id");
                newId = "MT707_" + next;
            }
        } catch (Exception e) {
            e.printStackTrace();
            // If error occurs, use default MT707_1
        }

        return newId;
    }

    /**
     * Check if string is null or empty
     * 
     * @param s String to check
     * @return true if string is null or empty
     */
    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><body>");
            out.println("<h2>MT707 Servlet</h2>");
            out.println("<p>This servlet handles POST requests only.</p>");
            out.println("<p><a href='Category7/mt707.jsp'>Go to MT707 Form</a></p>");
            out.println("</body></html>");
        }
    }
}