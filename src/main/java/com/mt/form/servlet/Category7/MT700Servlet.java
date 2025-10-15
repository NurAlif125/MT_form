package com.mt.form.servlet.Category7;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/MT700Servlet")
public class MT700Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters
    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/mt_forms";
    private static final String JDBC_USER = "postgres";
    private static final String JDBC_PASS = "123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // Load PostgreSQL driver
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException e) {
                out.println("<script>alert('PostgreSQL Driver not found: " + e.getMessage() + "'); window.history.back();</script>");
                return;
            }

            // Get all parameters from mt700.jsp
            String messageType = request.getParameter("messageType");
            
            // MF27 - Sequence of Total
            String mf27Number = request.getParameter("_010_mf27_number");
            String mf27Total = request.getParameter("_011_mf27_total");
            
            // MF40A - Form of Documentary Credit
            String mf40aFormOfCredit = request.getParameter("_020_mf40a_form_of_credit");
            
            // MF20 - Documentary Credit Number
            String mf20CreditNumber = request.getParameter("_030_mf20_documentary_credit_number");
            
            // OF23 - Reference to Pre-Advice
            String of23PreAdvice = request.getParameter("_040_of23_reference_to_preadvice");
            
            // MF31C - Date of Issue
            String mf31cDateOfIssue = request.getParameter("_050_mf31c_date_of_issue");
            
            // MF40E - Applicable Rules
            String mf40eApplicableRules = request.getParameter("_060_mf40e_applicable_rules");
            String mf40eNarrative = request.getParameter("_061_mf40e_narrative");
            
            // MF31D - Date and Place of Expiry
            String mf31dDateOfExpiry = request.getParameter("_070_mf31d_date_of_expiry");
            String mf31dPlaceOfExpiry = request.getParameter("_071_mf31d_place_of_expiry");
            
            // OF51a - Applicant Bank
            String of51aApplicantBank = request.getParameter("_080_of51a_applicant_bank");
            String of51aPartyIdentifierA = request.getParameter("_081_of51a_party_identifier");
            String of51aIdentifierCode = request.getParameter("_082_of51a_identifier_code");
            String of51aPartyIdentifierD = request.getParameter("_083_of51a_party_identifier");
            String of51aNameAddress = request.getParameter("_084_of51a_name_address");
            
            // MF50 - Applicant
            String mf50Applicant = request.getParameter("_090_mf50_applicant");
            
            // MF59 - Beneficiary
            String mf59Account = request.getParameter("_100_mf59_account");
            String mf59NameAddress = request.getParameter("_101_mf59_name_address");
            
            // MF32B - Currency Code, Amount
            String mf32bCurrency = request.getParameter("_110_mf32b_currency");
            String mf32bAmount = request.getParameter("_111_mf32b_amount");
            
            // OF39A - Percentage Credit Amount Tolerance
            String of39aTolerancePlus = request.getParameter("_120_of39a_tolerance_plus");
            String of39aToleranceMinus = request.getParameter("_121_of39a_tolerance_minus");
            
            // OF39C - Additional Amounts Covered
            String of39cAdditionalAmounts = request.getParameter("_130_of39c_additional_amounts_covered");
            
            // MF41a - Available With ... By ...
            String mf41aAvailableWithBy = request.getParameter("_140_mf41a_available_with_by");
            String mf41aIdentifierCode = request.getParameter("_141_mf41a_identifier_code");
            String mf41dNameAndAddress = request.getParameter("_142_mf41d_name_and_address");
            String mf41aBy = request.getParameter("_143_mf41a_by");
            
            // OF42C - Drafts at ...
            String of42cDraftsAt = request.getParameter("_150_of42c_drafts_at");
            
            // OF42a - Drawee
            String of42aDrawee = request.getParameter("_160_of42a_drawee");
            String of42aPartyIdentifierA = request.getParameter("_161_of42a_party_identifier");
            String of42aIdentifierCode = request.getParameter("_162_of42a_identifier_code");
            String of42aPartyIdentifierD = request.getParameter("_163_of42a_party_identifier");
            String of42aNameAndAddress = request.getParameter("_164_of42a_name_and_address");
            
            // OF42M - Mixed Payment Details
            String of42mMixedPayment = request.getParameter("_170_of42m_mixed_payment_details");
            
            // OF42P - Negotiation/Deferred Payment Details
            String of42pNegotiationDeferred = request.getParameter("_180_of42p_negotiation_deferred_payment_details");
            
            // OF43P - Partial Shipments
            String of43pPartialShipments = request.getParameter("_190_of43p_partial_shipments");
            
            // OF43T - Transhipment
            String of43tTranshipment = request.getParameter("_200_of43t_transhipment");
            
            // OF44A - Place of Taking in Charge/Dispatch from/Place of Receipt
            String of44aPlaceDispatch = request.getParameter("_210_of44a_place_taking_in_charge_dispatch_from_place_of_receipt");
            
            // OF44E - Port of Loading/Airport of Departure
            String of44ePortLoading = request.getParameter("_220_of44e_port_of_loading_airport_of_departure");
            
            // OF44F - Port of Discharge/Airport of Destination
            String of44fPortDischarge = request.getParameter("_230_of44f_port_of_discharge_airport_of_destination");
            
            // OF44B - Place of Final Destination/Place of Delivery
            String of44bPlaceDestination = request.getParameter("_240_of44b_place_of_final_destination_for_transportation_to_place_of_delivery");
            
            // OF44C - Latest Date of Shipment
            String of44cLatestDate = request.getParameter("_250_of44c_latest_date_of_shipment");
            
            // OF44D - Shipment Period
            String of44dShipmentPeriod = request.getParameter("_260_of44d_shipment_period");
            
            // OF45A - Description of Goods and/or Services
            String of45aDescGoods = request.getParameter("_270_of45a_description_of_goods_and_or_services");
            
            // OF46A - Documents Required
            String of46aDocsRequired = request.getParameter("_280_of46a_documents_required");
            
            // OF47A - Additional Conditions
            String of47aAddConditions = request.getParameter("_290_of47a_additional_conditions");
            
            // OF49G - Special Payment Conditions for Beneficiary
            String of49gSpecialPayBenef = request.getParameter("_300_of49g_special_payment_conditions_for_beneficiary");
            
            // OF49H - Special Payment Conditions for Bank Only
            String of49hSpecialPayBank = request.getParameter("_310_of49h_special_payment_conditions_for_bank_only");
            
            // OF71D - Charges
            String of71dCharges = request.getParameter("_320_of71d_charges");
            
            // OF48 - Period for Presentation in Days
            String of48Days = request.getParameter("_330_of48_days");
            String of48Narrative = request.getParameter("_331_of48_narrative");
            
            // MF49 - Confirmation Instructions
            String mf49ConfirmInstr = request.getParameter("_340_mf49_confirmation_instructions");
            
            // OF58a - Requested Confirmation Party
            String of58aConfParty = request.getParameter("_350_of58a_requested_confirmation_party");
            String of58aPartyIdentifierA = request.getParameter("_351_of58a_party_identifier");
            String of58aIdentifierCode = request.getParameter("_352_of58a_identifier_code");
            String of58aPartyIdentifierD = request.getParameter("_353_of58a_party_identifier");
            String of58aNameAddress = request.getParameter("_354_of58a_name_address");
            
            // OF53a - Reimbursing Bank
            String of53aReimbBank = request.getParameter("_360_of53a_reimbursing_bank");
            String of53aPartyIdentifierA = request.getParameter("_361_of53a_party_identifier");
            String of53aIdentifierCode = request.getParameter("_362_of53a_identifier_code");
            String of53aPartyIdentifierD = request.getParameter("_363_of53a_party_identifier");
            String of53aNameAddress = request.getParameter("_364_of53a_name_address");
            
            // OF78 - Instructions to the Paying/Accepting/Negotiating Bank
            String of78Instructions = request.getParameter("_370_of78_instructions_to_the_paying_accepting_negotiating_bank");
            
            // OF57a - 'Advise Through' Bank
            String of57aAdviseBank = request.getParameter("_380_of57a_advise_through_bank");
            String of57aPartyIdentifierA = request.getParameter("_381_of57a_party_identifier");
            String of57aIdentifierCode = request.getParameter("_382_of57a_identifier_code");
            String of57aPartyIdentifierB = request.getParameter("_383_of57a_party_identifier");
            String of57aLocation = request.getParameter("_384_of57a_location");
            String of57aPartyIdentifierD = request.getParameter("_385_of57a_party_identifier");
            String of57aNameAddress = request.getParameter("_386_of57a_name_address");
            
            // OF72Z - Sender to Receiver Information
            String of72zSenderReceiverInfo = request.getParameter("_390_of72z_sender_to_receiver_information");

            // Server-side validation for mandatory fields
            if (isEmpty(mf27Number) || isEmpty(mf27Total) || isEmpty(mf40aFormOfCredit) || 
                isEmpty(mf20CreditNumber) || isEmpty(mf31cDateOfIssue) || isEmpty(mf40eApplicableRules) ||
                isEmpty(mf31dDateOfExpiry) || isEmpty(mf31dPlaceOfExpiry) || isEmpty(mf50Applicant) || 
                isEmpty(mf59NameAddress) || isEmpty(mf32bCurrency) || isEmpty(mf32bAmount) ||
                isEmpty(mf41aAvailableWithBy) || isEmpty(mf49ConfirmInstr)) {
                out.println("<script>alert('Mandatory fields for MT700 are incomplete!'); window.history.back();</script>");
                return;
            }

            // Generate new form_id
            String newId = generateNewId();

            // Prepare SQL insert statement
            String sql = "INSERT INTO mt.mt700_message(" +
                "form_id, message_type, " +
                "mf27_number, mf27_total, " +
                "mf40a_form_of_credit, " +
                "mf20_documentary_credit_number, " +
                "of23_reference_to_preadvice, " +
                "mf31c_date_of_issue, " +
                "mf40e_applicable_rules, mf40e_narrative, " +
                "mf31d_date_of_expiry, mf31d_place_of_expiry, " +
                "of51a_applicant_bank, of51a_party_identifier_a, of51a_identifier_code, " +
                "of51a_party_identifier_d, of51a_name_address, " +
                "mf50_applicant, " +
                "mf59_account, mf59_name_address, " +
                "mf32b_currency, mf32b_amount, " +
                "of39a_tolerance_plus, of39a_tolerance_minus, " +
                "of39c_additional_amounts_covered, " +
                "mf41a_available_with_by, mf41a_identifier_code, mf41d_name_and_address, mf41a_by, " +
                "of42c_drafts_at, " +
                "of42a_drawee, of42a_party_identifier_a, of42a_identifier_code, " +
                "of42a_party_identifier_d, of42a_name_and_address, " +
                "of42m_mixed_payment_details, " +
                "of42p_negotiation_deferred_payment_details, " +
                "of43p_partial_shipments, " +
                "of43t_transhipment, " +
                "of44a_place_dispatch, " +
                "of44e_port_loading, " +
                "of44f_port_discharge, " +
                "of44b_place_destination, " +
                "of44c_latest_date, " +
                "of44d_shipment_period, " +
                "of45a_description_goods, " +
                "of46a_documents_required, " +
                "of47a_additional_conditions, " +
                "of49g_special_payment_beneficiary, " +
                "of49h_special_payment_bank, " +
                "of71d_charges, " +
                "of48_days, of48_narrative, " +
                "mf49_confirmation_instructions, " +
                "of58a_requested_confirmation_party, of58a_party_identifier_a, of58a_identifier_code, " +
                "of58a_party_identifier_d, of58a_name_address, " +
                "of53a_reimbursing_bank, of53a_party_identifier_a, of53a_identifier_code, " +
                "of53a_party_identifier_d, of53a_name_address, " +
                "of78_instructions, " +
                "of57a_advise_through_bank, of57a_party_identifier_a, of57a_identifier_code, " +
                "of57a_party_identifier_b, of57a_location, of57a_party_identifier_d, of57a_name_address, " +
                "of72z_sender_to_receiver_information, " +
                "created_date" +
                ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP)";

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, messageType);
                
                // MF27
                ps.setString(idx++, mf27Number);
                ps.setString(idx++, mf27Total);
                
                // MF40A
                ps.setString(idx++, mf40aFormOfCredit);
                
                // MF20
                ps.setString(idx++, mf20CreditNumber);
                
                // OF23
                ps.setString(idx++, of23PreAdvice);
                
                // MF31C
                ps.setString(idx++, mf31cDateOfIssue);
                
                // MF40E
                ps.setString(idx++, mf40eApplicableRules);
                ps.setString(idx++, mf40eNarrative);
                
                // MF31D
                ps.setString(idx++, mf31dDateOfExpiry);
                ps.setString(idx++, mf31dPlaceOfExpiry);
                
                // OF51a
                ps.setString(idx++, of51aApplicantBank);
                ps.setString(idx++, of51aPartyIdentifierA);
                ps.setString(idx++, of51aIdentifierCode);
                ps.setString(idx++, of51aPartyIdentifierD);
                ps.setString(idx++, of51aNameAddress);
                
                // MF50
                ps.setString(idx++, mf50Applicant);
                
                // MF59
                ps.setString(idx++, mf59Account);
                ps.setString(idx++, mf59NameAddress);
                
                // MF32B
                ps.setString(idx++, mf32bCurrency);
                ps.setString(idx++, mf32bAmount);
                
                // OF39A
                ps.setString(idx++, of39aTolerancePlus);
                ps.setString(idx++, of39aToleranceMinus);
                
                // OF39C
                ps.setString(idx++, of39cAdditionalAmounts);
                
                // MF41a
                ps.setString(idx++, mf41aAvailableWithBy);
                ps.setString(idx++, mf41aIdentifierCode);
                ps.setString(idx++, mf41dNameAndAddress);
                ps.setString(idx++, mf41aBy);
                
                // OF42C
                ps.setString(idx++, of42cDraftsAt);
                
                // OF42a
                ps.setString(idx++, of42aDrawee);
                ps.setString(idx++, of42aPartyIdentifierA);
                ps.setString(idx++, of42aIdentifierCode);
                ps.setString(idx++, of42aPartyIdentifierD);
                ps.setString(idx++, of42aNameAndAddress);
                
                // OF42M
                ps.setString(idx++, of42mMixedPayment);
                
                // OF42P
                ps.setString(idx++, of42pNegotiationDeferred);
                
                // OF43P
                ps.setString(idx++, of43pPartialShipments);
                
                // OF43T
                ps.setString(idx++, of43tTranshipment);
                
                // OF44A
                ps.setString(idx++, of44aPlaceDispatch);
                
                // OF44E
                ps.setString(idx++, of44ePortLoading);
                
                // OF44F
                ps.setString(idx++, of44fPortDischarge);
                
                // OF44B
                ps.setString(idx++, of44bPlaceDestination);
                
                // OF44C
                ps.setString(idx++, of44cLatestDate);
                
                // OF44D
                ps.setString(idx++, of44dShipmentPeriod);
                
                // OF45A
                ps.setString(idx++, of45aDescGoods);
                
                // OF46A
                ps.setString(idx++, of46aDocsRequired);
                
                // OF47A
                ps.setString(idx++, of47aAddConditions);
                
                // OF49G
                ps.setString(idx++, of49gSpecialPayBenef);
                
                // OF49H
                ps.setString(idx++, of49hSpecialPayBank);
                
                // OF71D
                ps.setString(idx++, of71dCharges);
                
                // OF48
                ps.setString(idx++, of48Days);
                ps.setString(idx++, of48Narrative);
                
                // MF49
                ps.setString(idx++, mf49ConfirmInstr);
                
                // OF58a
                ps.setString(idx++, of58aConfParty);
                ps.setString(idx++, of58aPartyIdentifierA);
                ps.setString(idx++, of58aIdentifierCode);
                ps.setString(idx++, of58aPartyIdentifierD);
                ps.setString(idx++, of58aNameAddress);
                
                // OF53a
                ps.setString(idx++, of53aReimbBank);
                ps.setString(idx++, of53aPartyIdentifierA);
                ps.setString(idx++, of53aIdentifierCode);
                ps.setString(idx++, of53aPartyIdentifierD);
                ps.setString(idx++, of53aNameAddress);
                
                // OF78
                ps.setString(idx++, of78Instructions);
                
                // OF57a
                ps.setString(idx++, of57aAdviseBank);
                ps.setString(idx++, of57aPartyIdentifierA);
                ps.setString(idx++, of57aIdentifierCode);
                ps.setString(idx++, of57aPartyIdentifierB);
                ps.setString(idx++, of57aLocation);
                ps.setString(idx++, of57aPartyIdentifierD);
                ps.setString(idx++, of57aNameAddress);
                
                // OF72Z
                ps.setString(idx++, of72zSenderReceiverInfo);

                // Execute insert
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<script>alert('MT700 data saved successfully with ID: " + newId + "'); window.location='" + request.getContextPath() + "/Category7/mt700.jsp';</script>");
                } else {
                    out.println("<script>alert('Failed to save MT700 data!'); window.history.back();</script>");
                }

            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<script>alert('Database error: " + e.getMessage().replace("'", "\\'") + "'); window.history.back();</script>");
            }
        }
    }

    /**
     * Helper method to check if string is null or empty
     */
    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }

    /**
     * Generate new form_id with format MT700_XXX
     */
    private String generateNewId() {
        String newId = "MT700_1";
        String prefix = "MT700";
        String sqlNextId = "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                          "FROM mt.mt700_message WHERE form_id LIKE 'MT700_%'";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sqlNextId)) {
            
            if (rs.next()) {
                int next = rs.getInt("next_id");
                newId = prefix + "_" + next;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // If error, return default ID
        }

        return newId;
    }
}