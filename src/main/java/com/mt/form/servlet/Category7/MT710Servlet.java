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
import java.sql.Statement;
import java.sql.ResultSet;

@WebServlet("/MT710Servlet")
public class MT710Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // ========== GET PARAMETERS FROM mt710.jsp ==========
            
            // Field 27: Sequence of Total
            String mf27Number = request.getParameter("_010_mf27_number");
            String mf27Total = request.getParameter("_011_mf27_total");
            
            // Field 40B: Form of Documentary Credit
            String mf40bType = request.getParameter("_020_mf40b_form_of_documentary_credit_type");
            String mf40bCode = request.getParameter("_021_mf40b_code");
            
            // Field 20: Sender's Reference
            String mf20SenderRef = request.getParameter("_030_mf20_sender_reference");
            
            // Field 21: Documentary Credit Number
            String mf21DocCreditNum = request.getParameter("_040_mf21_documentary_credit_number");
            
            // Field 23: Reference to Pre-Advice (Optional)
            String of23PreAdvice = request.getParameter("_050_of23_reference_to_preadvice");
            
            // Field 31C: Date of Issue
            String mf31cDateIssue = request.getParameter("_060_mf31c_date_of_issue");
            
            // Field 40E: Applicable Rules
            String mf40eRules = request.getParameter("_070_mf40e_applicable_rules");
            String mf40eNarrative = request.getParameter("_071_mf40e_narrative");
            
            // Field 31D: Date and Place of Expiry
            String mf31dDateExpiry = request.getParameter("_080_mf31d_date_of_expiry");
            String mf31dPlaceExpiry = request.getParameter("_081_mf31d_place_of_expiry");
            
            // Field 52a: Issuing Bank (Option A or D)
            String of52aOption = request.getParameter("_090_of52a_issuing_bank");
            String of52aPartyIdA = request.getParameter("_091_of52a_party_identifier");
            String of52aBicA = request.getParameter("_092_of52a_identifier_code");
            String of52aPartyIdD = request.getParameter("_093_of52a_party_identifier");
            String of52aNameD = request.getParameter("_094_of52a_name_address");
            
            // Field 50B: Non-Bank Issuer
            String of50bNonBank = request.getParameter("_100_of50b_non_bank_issuer");
            
            // Field 51a: Applicant Bank (Option A or D)
            String of51aOption = request.getParameter("_110_of51a_applicant_bank");
            String of51aPartyIdA = request.getParameter("_111_of51a_party_identifier");
            String of51aBicA = request.getParameter("_112_of51a_bic");
            String of51aPartyIdD = request.getParameter("_113_of51a_party_identifier");
            String of51aNameD = request.getParameter("_114_of51a_name_address");
            
            // Field 50: Applicant
            String mf50Applicant = request.getParameter("_120_mf50_applicant");
            
            // Field 59: Beneficiary
            String mf59Account = request.getParameter("_130_mf59_account");
            String mf59Name = request.getParameter("_131_mf59_name_address");
            
            // Field 32B: Currency Code, Amount
            String mf32bCurrency = request.getParameter("_140_mf32b_currency");
            String mf32bAmount = request.getParameter("_141_mf32b_amount");
            
            // Field 39A: Percentage Credit Amount Tolerance
            String of39aTolerancePlus = request.getParameter("_150_of39a_tolerance_plus");
            String of39aToleranceMinus = request.getParameter("_151_of39a_tolerance_minus");
            
            // Field 39C: Additional Amounts Covered
            String of39cAdditionalAmounts = request.getParameter("_160_of39c_additional_amounts_covered");
            
            // Field 41a: Available With ... By ...
            String mf41aOption = request.getParameter("_170_mf41a_available_with_by");
            String mf41aBic = request.getParameter("_171_mf41a_identifier_code");
            String mf41aName = request.getParameter("_172_mf41d_name_and_address");
            String mf41aBy = request.getParameter("_173_mf41a_by");
            
            // Field 42C: Drafts at ...
            String of42cDrafts = request.getParameter("_180_of42c_drafts_at");
            
            // Field 42a: Drawee
            String of42aOption = request.getParameter("_190_of42a_drawee");
            String of42aPartyIdA = request.getParameter("_191_of42a_party_identifier");
            String of42aBicA = request.getParameter("_192_of42a_identifier_code");
            String of42aPartyIdD = request.getParameter("_193_of42a_party_identifier");
            String of42aNameD = request.getParameter("_194_of42d_name_and_address");
            
            // Field 42M: Mixed Payment Details
            String of42mMixedPayment = request.getParameter("_200_of42m_mixed_payment_details");
            
            // Field 42P: Negotiation/Deferred Payment Details
            String of42pNegotiation = request.getParameter("_210_of42p_negotiation");
            
            // Field 43P: Partial Shipments
            String of43pPartialShipments = request.getParameter("_220_of43p_partial_shipments");
            
            // Field 43T: Transhipment
            String of43tTranshipment = request.getParameter("_230_of43t_transhipment");
            
            // Field 44A: Place of Taking in Charge
            String of44aPlaceTaking = request.getParameter("_240_of44a_place_taking_in_charge_dispatch_from_place_of_receipt");
            
            // Field 44E: Port of Loading
            String of44ePortLoading = request.getParameter("_250_of44e_port_of_loading_airport_of_departure");
            
            // Field 44F: Port of Discharge
            String of44fPortDischarge = request.getParameter("_260_of44f_port_of_discharge_airport_of_destination");
            
            // Field 44B: Place of Final Destination
            String of44bFinalDestination = request.getParameter("_270_of44b_place_of_final_destination_for_transportation_to_place_of_delivery");
            
            // Field 44C: Latest Date of Shipment
            String of44cLatestDate = request.getParameter("_280_of44c_latest_date_of_shipment");
            
            // Field 44D: Shipment Period
            String of44dShipmentPeriod = request.getParameter("_290_of44d_shipment_period");
            
            // Field 45A: Description of Goods
            String of45aDescription = request.getParameter("_300_of45a_description_of_goods_and_or_services");
            
            // Field 46A: Documents Required
            String of46aDocuments = request.getParameter("_310_of46a_documents_required");
            
            // Field 47A: Additional Conditions
            String of47aConditions = request.getParameter("_320_of47a_additional_conditions");
            
            // Field 49G: Special Payment Conditions for Beneficiary
            String of49gPaymentBeneficiary = request.getParameter("_330_of49g_special_payment_conditions_for_beneficiary");
            
            // Field 49H: Special Payment Conditions for Bank Only
            String of49hPaymentBank = request.getParameter("_340_of49h_special_payment_conditions_for_bank_only");
            
            // Field 71D: Charges
            String of71dCharges = request.getParameter("_350_of71d_charges");
            
            // Field 48: Period for Presentation
            String of48Days = request.getParameter("_360_of48_days");
            String of48Narrative = request.getParameter("_361_of48_narrative");
            
            // Field 49: Confirmation Instructions
            String mf49Confirmation = request.getParameter("_370_mf49_confirmation_instructions");
            
            // Field 58a: Requested Confirmation Party
            String of58aOption = request.getParameter("_380_of58a_requested_confirmation_party");
            String of58aPartyIdA = request.getParameter("_381_of58a_party_identifier");
            String of58aBicA = request.getParameter("_382_of58a_bic");
            String of58aPartyIdD = request.getParameter("_383_of58a_party_identifier");
            String of58aNameD = request.getParameter("_384_of58a_name_address");
            
            // Field 53a: Reimbursing Bank
            String of53aOption = request.getParameter("_390_of53a_reimbursing_bank");
            String of53aPartyIdA = request.getParameter("_391_of53a_party_identifier");
            String of53aBicA = request.getParameter("_392_of53a_bic");
            String of53aPartyIdD = request.getParameter("_393_of53a_party_identifier");
            String of53aNameD = request.getParameter("_394_of53a_name_address");
            
            // Field 78: Instructions to Paying Bank
            String of78Instructions = request.getParameter("_400_of78_instructions_to_the_paying_accepting_negotiating_bank");
            
            // Field 78D: Instructions from Intermediary Bank
            String of78dInstructions = request.getParameter("_410_of78d_instructions_from_intermediary_bank");
            
            // Field 57a: Advise Through Bank
            String of57aOption = request.getParameter("_420_of57a_advise_through_bank");
            String of57aPartyIdA = request.getParameter("_421_of57a_party_identifier");
            String of57aBicA = request.getParameter("_422_of57a_bic");
            String of57aPartyIdB = request.getParameter("_423_of57a_party_identifier");
            String of57aLocationB = request.getParameter("_424_of57a_location");
            String of57aPartyIdD = request.getParameter("_425_of57a_party_identifier");
            String of57aNameD = request.getParameter("_426_of57a_name_address");
            
            // Field 72Z: Sender to Receiver Information
            String of72zInformation = request.getParameter("_430_of72z_information");

            // ========== SERVER-SIDE MANDATORY FIELD VALIDATION ==========
            if (isEmpty(mf27Number) || isEmpty(mf27Total) ||
                isEmpty(mf40bType) || isEmpty(mf40bCode) ||
                isEmpty(mf20SenderRef) || isEmpty(mf21DocCreditNum) ||
                isEmpty(mf31cDateIssue) || isEmpty(mf40eRules) ||
                isEmpty(mf31dDateExpiry) || isEmpty(mf31dPlaceExpiry) ||
                isEmpty(mf50Applicant) || isEmpty(mf59Name) ||
                isEmpty(mf32bCurrency) || isEmpty(mf32bAmount) ||
                isEmpty(mf41aOption) || isEmpty(mf41aBy) ||
                isEmpty(mf49Confirmation)) {
                
                out.println("<script>alert('Error: Mandatory fields are incomplete. Please fill all required fields marked with *'); window.history.back();</script>");
                return;
            }

            // ========== GENERATE CUSTOM FORM_ID ==========
            String newFormId = generateFormId();
            if (newFormId == null) {
                out.println("<script>alert('Error: Failed to generate Form ID'); window.history.back();</script>");
                return;
            }

            // ========== PREPARE SQL INSERT STATEMENT ==========
            // FIXED: 77 kolom field + 2 kolom dasar = 79 kolom total (sesuai DDL)
            String sql = "INSERT INTO mt.mt710_message(" +
                    "form_id, message_type, " +
                    "_010_mf27_number, _011_mf27_total, " +
                    "_020_mf40b_form_of_documentary_credit_type, _021_mf40b_code, " +
                    "_030_mf20_sender_reference, _040_mf21_documentary_credit_number, " +
                    "_050_of23_reference_to_preadvice, " +
                    "_060_mf31c_date_of_issue, _070_mf40e_applicable_rules, _071_mf40e_narrative, " +
                    "_080_mf31d_date_of_expiry, _081_mf31d_place_of_expiry, " +
                    "_090_of52a_issuing_bank, _091_of52a_party_identifier, _092_of52a_identifier_code, " +
                    "_093_of52a_party_identifier_d, _094_of52a_name_address, " +
                    "_100_of50b_non_bank_issuer, " +
                    "_110_of51a_applicant_bank, _111_of51a_party_identifier, _112_of51a_bic, " +
                    "_113_of51a_party_identifier_d, _114_of51a_name_address, " +
                    "_120_mf50_applicant, " +
                    "_130_mf59_account, _131_mf59_name_address, " +
                    "_140_mf32b_currency, _141_mf32b_amount, " +
                    "_150_of39a_tolerance_plus, _151_of39a_tolerance_minus, " +
                    "_160_of39c_additional_amounts_covered, " +
                    "_170_mf41a_available_with_by, _171_mf41a_identifier_code, " +
                    "_172_mf41d_name_and_address, _173_mf41a_by, " +
                    "_180_of42c_drafts_at, " +
                    "_190_of42a_drawee, _191_of42a_party_identifier, _192_of42a_identifier_code, " +
                    "_193_of42a_party_identifier_d, _194_of42d_name_and_address, " +
                    "_200_of42m_mixed_payment_details, _210_of42p_negotiation, " +
                    "_220_of43p_partial_shipments, _230_of43t_transhipment, " +
                    "_240_of44a_place_taking_in_charge, _250_of44e_port_of_loading, " +
                    "_260_of44f_port_of_discharge, _270_of44b_final_destination, " +
                    "_280_of44c_latest_date_of_shipment, _290_of44d_shipment_period, " +
                    "_300_of45a_description_of_goods, _310_of46a_documents_required, " +
                    "_320_of47a_additional_conditions, " +
                    "_330_of49g_special_payment_conditions_beneficiary, " +
                    "_340_of49h_special_payment_conditions_bank, " +
                    "_350_of71d_charges, _360_of48_days, _361_of48_narrative, " +
                    "_370_mf49_confirmation_instructions, " +
                    "_380_of58a_requested_confirmation_party, _381_of58a_party_identifier, _382_of58a_bic, " +
                    "_383_of58a_party_identifier_d, _384_of58a_name_address, " +
                    "_390_of53a_reimbursing_bank, _391_of53a_party_identifier, _392_of53a_bic, " +
                    "_393_of53a_party_identifier_d, _394_of53a_name_address, " +
                    "_400_of78_instructions_to_paying_bank, _410_of78d_instructions_from_intermediary, " +
                    "_420_of57a_advise_through_bank, _421_of57a_party_identifier, _422_of57a_bic, " +
                    "_423_of57a_party_identifier_b, _424_of57a_location, " +
                    "_425_of57a_party_identifier_d, _426_of57a_name_address, " +
                    "_430_of72z_sender_to_receiver_information" +
                    ") VALUES (" +
                    "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?" +
                    ")";

            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                
                // Basic fields (2 kolom)
                ps.setString(idx++, newFormId);           // 1
                ps.setString(idx++, "710");               // 2
                
                // Field 27 (2 kolom)
                ps.setString(idx++, mf27Number);          // 3
                ps.setString(idx++, mf27Total);           // 4
                
                // Field 40B (2 kolom)
                ps.setString(idx++, mf40bType);           // 5
                ps.setString(idx++, mf40bCode);           // 6
                
                // Field 20, 21, 23 (3 kolom)
                ps.setString(idx++, mf20SenderRef);       // 7
                ps.setString(idx++, mf21DocCreditNum);    // 8
                ps.setString(idx++, of23PreAdvice);       // 9
                
                // Field 31C, 40E (4 kolom)
                ps.setString(idx++, mf31cDateIssue);      // 10
                ps.setString(idx++, mf40eRules);          // 11
                ps.setString(idx++, mf40eNarrative);      // 12
                
                // Field 31D (2 kolom)
                ps.setString(idx++, mf31dDateExpiry);     // 13
                ps.setString(idx++, mf31dPlaceExpiry);    // 14
                
                // Field 52a (5 kolom)
                ps.setString(idx++, of52aOption);         // 15
                ps.setString(idx++, of52aPartyIdA);       // 16
                ps.setString(idx++, of52aBicA);           // 17
                ps.setString(idx++, of52aPartyIdD);       // 18
                ps.setString(idx++, of52aNameD);          // 19
                
                // Field 50B (1 kolom)
                ps.setString(idx++, of50bNonBank);        // 20
                
                // Field 51a (5 kolom)
                ps.setString(idx++, of51aOption);         // 21
                ps.setString(idx++, of51aPartyIdA);       // 22
                ps.setString(idx++, of51aBicA);           // 23
                ps.setString(idx++, of51aPartyIdD);       // 24
                ps.setString(idx++, of51aNameD);          // 25
                
                // Field 50 (1 kolom)
                ps.setString(idx++, mf50Applicant);       // 26
                
                // Field 59 (2 kolom)
                ps.setString(idx++, mf59Account);         // 27
                ps.setString(idx++, mf59Name);            // 28
                
                // Field 32B (2 kolom - currency + amount)
                ps.setString(idx++, mf32bCurrency);       // 29
                
                // Amount - convert to numeric
                if (!isEmpty(mf32bAmount)) {
                    try {
                        String normalizedAmount = mf32bAmount.trim().replace(",", ".");
                        ps.setBigDecimal(idx++, new java.math.BigDecimal(normalizedAmount));  // 30
                    } catch (NumberFormatException e) {
                        ps.setNull(idx++, java.sql.Types.NUMERIC);
                    }
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }
                
                // Field 39A (2 kolom - tolerance)
                if (!isEmpty(of39aTolerancePlus)) {
                    try {
                        ps.setInt(idx++, Integer.parseInt(of39aTolerancePlus.trim()));  // 31
                    } catch (NumberFormatException e) {
                        ps.setNull(idx++, java.sql.Types.INTEGER);
                    }
                } else {
                    ps.setNull(idx++, java.sql.Types.INTEGER);
                }
                
                if (!isEmpty(of39aToleranceMinus)) {
                    try {
                        ps.setInt(idx++, Integer.parseInt(of39aToleranceMinus.trim()));  // 32
                    } catch (NumberFormatException e) {
                        ps.setNull(idx++, java.sql.Types.INTEGER);
                    }
                } else {
                    ps.setNull(idx++, java.sql.Types.INTEGER);
                }
                
                // Field 39C (1 kolom)
                ps.setString(idx++, of39cAdditionalAmounts);  // 33
                
                // Field 41a (4 kolom)
                ps.setString(idx++, mf41aOption);         // 34
                ps.setString(idx++, mf41aBic);            // 35
                ps.setString(idx++, mf41aName);           // 36
                ps.setString(idx++, mf41aBy);             // 37
                
                // Field 42C (1 kolom)
                ps.setString(idx++, of42cDrafts);         // 38
                
                // Field 42a (5 kolom)
                ps.setString(idx++, of42aOption);         // 39
                ps.setString(idx++, of42aPartyIdA);       // 40
                ps.setString(idx++, of42aBicA);           // 41
                ps.setString(idx++, of42aPartyIdD);       // 42
                ps.setString(idx++, of42aNameD);          // 43
                
                // Field 42M, 42P (2 kolom)
                ps.setString(idx++, of42mMixedPayment);   // 44
                ps.setString(idx++, of42pNegotiation);    // 45
                
                // Field 43P, 43T (2 kolom)
                ps.setString(idx++, of43pPartialShipments);  // 46
                ps.setString(idx++, of43tTranshipment);   // 47
                
                // Field 44A, 44E, 44F, 44B (4 kolom)
                ps.setString(idx++, of44aPlaceTaking);    // 48
                ps.setString(idx++, of44ePortLoading);    // 49
                ps.setString(idx++, of44fPortDischarge);  // 50
                ps.setString(idx++, of44bFinalDestination);  // 51
                
                // Field 44C, 44D (2 kolom)
                ps.setString(idx++, of44cLatestDate);     // 52
                ps.setString(idx++, of44dShipmentPeriod); // 53
                
                // Field 45A, 46A, 47A (3 kolom)
                ps.setString(idx++, of45aDescription);    // 54
                ps.setString(idx++, of46aDocuments);      // 55
                ps.setString(idx++, of47aConditions);     // 56
                
                // Field 49G, 49H (2 kolom)
                ps.setString(idx++, of49gPaymentBeneficiary);  // 57
                ps.setString(idx++, of49hPaymentBank);    // 58
                
                // Field 71D, 48 (3 kolom)
                ps.setString(idx++, of71dCharges);        // 59
                ps.setString(idx++, of48Days);            // 60
                ps.setString(idx++, of48Narrative);       // 61
                
                // Field 49 (1 kolom)
                ps.setString(idx++, mf49Confirmation);    // 62
                
                // Field 58a (5 kolom)
                ps.setString(idx++, of58aOption);         // 63
                ps.setString(idx++, of58aPartyIdA);       // 64
                ps.setString(idx++, of58aBicA);           // 65
                ps.setString(idx++, of58aPartyIdD);       // 66
                ps.setString(idx++, of58aNameD);          // 67
                
                // Field 53a (5 kolom)
                ps.setString(idx++, of53aOption);         // 68
                ps.setString(idx++, of53aPartyIdA);       // 69
                ps.setString(idx++, of53aBicA);           // 70
                ps.setString(idx++, of53aPartyIdD);       // 71
                ps.setString(idx++, of53aNameD);          // 72
                
                // Field 78, 78D (2 kolom)
                ps.setString(idx++, of78Instructions);    // 73
                ps.setString(idx++, of78dInstructions);   // 74
                
                // Field 57a (7 kolom)
                ps.setString(idx++, of57aOption);         // 75
                ps.setString(idx++, of57aPartyIdA);       // 76
                ps.setString(idx++, of57aBicA);           // 77
                ps.setString(idx++, of57aPartyIdB);       // 78
                ps.setString(idx++, of57aLocationB);      // 79
                ps.setString(idx++, of57aPartyIdD);       // 80
                ps.setString(idx++, of57aNameD);          // 81
                
                // Field 72Z (1 kolom)
                ps.setString(idx++, of72zInformation);    // 82
                
                // TOTAL: 82 parameters untuk 79 kolom (termasuk audit fields yang auto-generate)
                // Note: created_at, updated_at, created_by, updated_by tidak di-insert karena ada DEFAULT

                // Execute insert
                int rowsAffected = ps.executeUpdate();
                
                if (rowsAffected > 0) {
                    out.println("<script>alert('MT710 data saved successfully! Form ID: " + newFormId + "'); window.location='Category7/mt710.jsp';</script>");
                } else {
                    out.println("<script>alert('Error: No rows affected'); window.history.back();</script>");
                }

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error saving MT710: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    /**
     * Generate unique Form ID for MT710
     * Format: MT710_1, MT710_2, etc.
     */
    private String generateFormId() {
        String newId = null;
        String sqlNextId = "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)), 0) + 1 AS next_id " +
                          "FROM mt.mt710_message";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sqlNextId)) {
            
            if (rs.next()) {
                int next = rs.getInt("next_id");
                newId = "MT710_" + next;
            } else {
                newId = "MT710_1";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "MT710_1"; // Fallback
        }
        
        return newId;
    }

    /**
     * Check if string is null or empty
     */
    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Category7/mt710.jsp");
    }
}