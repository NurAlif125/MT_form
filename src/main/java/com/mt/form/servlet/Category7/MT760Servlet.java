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
 * Servlet untuk menyimpan data form MT760
 * MT760 - Issue of a Demand Guarantee/Standby Guarantee/Standby Letter of Credit
 * 
 * FINAL VERSION - Fully validated and consistent with mt760.jsp
 * 
 * Author: mslam
 * Date: Oct 2025
 * Last Updated: Jan 2025
 */
@WebServlet("/MT760Servlet")
public class MT760Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            /* ======================================================
             *  SEQUENCE A - GENERAL INFORMATION
             * ====================================================== */
            String f27Number = request.getParameter("_020_mf27_number");
            String f27Total = request.getParameter("_021_mf27_total");
            String f22aPurpose = request.getParameter("_030_mf22a_purpose_of_message");
            String f72zSenderInfo = request.getParameter("_040_of72Z_sender_receiver_information");
            String f23xFileId = request.getParameter("_050_of23x_file_identification");
            String f23xFileName = request.getParameter("_051_of23x_file_name_or_reference");

            /* ======================================================
             *  SEQUENCE B - UNDERTAKING DETAILS
             * ====================================================== */
            String f20UndertakingNum = request.getParameter("_070_mf20_undertaking_number");
            String f30DateIssue = request.getParameter("_080_mf30_date_of_issue");
            String f22dFormUndertaking = request.getParameter("_090_mf22d_form_of_undertaking");
            
            // Field 40C - Applicable Rules
            String f40cRules = request.getParameter("_100_mf40c_applicable_rules");
            String f40cNarrative = request.getParameter("_101_mf40c_narrative");
            
            // Field 23B - Expiry Type
            String f23bExpiryType = request.getParameter("_110_mf23b_expiry_type");
            String f31eDateExpiry = request.getParameter("_120_of31e_date_of_expiry");
            String f35gExpiryCondition = request.getParameter("_130_of35g_expiry_condition_event");
            
            // Field 50 - Applicant
            String f50Applicant = request.getParameter("_140_of50_applicant");
            
            // Field 51 - Obligor
            String f51Obligor = request.getParameter("_150_of51_obligor_instructing_party");
            
            // Field 52a - Issuer
            String f52aIssuerOpt = request.getParameter("_160_mf52a_issuer");
            String f52aPartyId = request.getParameter("_161_mf52a_party_identifier");
            String f52aIdCode = request.getParameter("_162_mf52a_identifier_code");
            String f52dPartyId = request.getParameter("_163_mf52d_party_identifier");
            String f52dNameAddr = request.getParameter("_164_mf52d_name_address");
            
            // Field 59a - Beneficiary
            String f59aBenefOpt = request.getParameter("_170_mf59a_beneficiary");
            String f59aAccount = request.getParameter("_171_mf59a_account");
            String f59aNameAddr = request.getParameter("_172_mf59a_name_address");
            String f59aAccount2 = request.getParameter("_173_mf59a_account");
            String f59aIdCode = request.getParameter("_174_mf59a_identifier_code");
            
            // Field 56a - Advising Bank
            String f56aAdvisingOpt = request.getParameter("_180_of56a_advising_bank");
            String f56aPartyId = request.getParameter("_181_of56a_party_identifier");
            String f56aIdCode = request.getParameter("_182_of56a_identifier_code");
            String f56dPartyId = request.getParameter("_183_of56d_party_identifier");
            String f56dNameAddr = request.getParameter("_184_of56d_name_address");
            
            // Field 23 - Advising Bank Reference
            String f23AdvisingRef = request.getParameter("_190_of23_advising_bank_reference");
            
            // Field 57a - Advise Through Bank
            String f57aAdviseThroughOpt = request.getParameter("_200_of57a_advise_through_bank");
            String f57aPartyId = request.getParameter("_201_of57a_party_identifier");
            String f57aIdCode = request.getParameter("_202_of57a_identifier_code");
            String f57dPartyId = request.getParameter("_203_of57d_party_identifier");
            String f57dNameAddr = request.getParameter("_204_of57d_name_address");
            
            // Field 32B - Undertaking Amount
            String f32bCurrency = request.getParameter("_210_mf32b_currency");
            String f32bAmount = request.getParameter("_211_mf32b_amount");
            
            // Field 39F - Supplementary Info About Amount
            String f39fSuppInfo = request.getParameter("_220_of39f_supplementary_information_about_amount");
            
            // Field 41a - Available With
            String f41aAvailableOpt = request.getParameter("_230_of41a_available_with");
            String f41fIdCode = request.getParameter("_231_of41f_identifier_code");
            String f41gNameAddr = request.getParameter("_232_of41g_name_address");
            
            // Field 71D - Charges
            String f71dCharges = request.getParameter("_240_of71D_charges");
            
            // Field 45C - Document and Presentation Instructions
            String f45cDocInstr = request.getParameter("_250_of45c_document_and_presentation_instructions");
            
            // Field 77U - Undertaking Terms and Conditions
            String f77uTerms = request.getParameter("_260_mf77u_undertaking_terms_and_conditions");
            
            // Field 49 - Confirmation Instructions
            String f49ConfirmInstr = request.getParameter("_270_of49_confirmation_instructions");
            
            // Field 58a - Requested Confirmation Party
            String f58aReqConfOpt = request.getParameter("_280_of58a_requested_confirmation_party");
            String f58aPartyId = request.getParameter("_281_of58a_party_identifier");
            String f58aIdCode = request.getParameter("_282_of58a_identifier_code");
            String f58dPartyId = request.getParameter("_283_of58d_party_identifier");
            String f58dNameAddr = request.getParameter("_284_of58d_name_address");
            
            // Field 44J - Governing Law/Jurisdiction
            String f44jCountryCode = request.getParameter("_290_of44j_country_code");
            String f44jNarrative = request.getParameter("_291_of44j_narrative");
            
            // Field 23F - Automatic Extension Period
            String f23fAutoExtPeriod = request.getParameter("_300_of23f_automatic_extension_period");
            String f23fNarrative = request.getParameter("_301_of23f_narrative");
            
            // Field 78 - Automatic Extension Non-Extension Notification
            String f78AutoExtNotif = request.getParameter("_310_of78_automatic_extension_non_extension_notification");
            
            // Field 26E - Automatic Extension Notification Period
            String f26eAutoExtNotifPeriod = request.getParameter("_320_of26e_automatic_extension_notification_period");
            
            // Field 31S - Automatic Extension Final Expiry Date
            String f31sAutoExtFinalDate = request.getParameter("_330_of31s_automatic_extension_final_expiry_date");
            
            // Field 48B - Demand Indicator
            String f48bDemandInd = request.getParameter("_340_of48b_demand_indicator");
            
            // Field 48D - Transfer Indicator
            String f48dTransferInd = request.getParameter("_350_of48d_transfer_indicator");
            
            // Field 39E - Transfer Conditions
            String f39eTransferCond = request.getParameter("_360_of39e_transfer_conditions");
            
            // Field 45L - Underlying Transaction Details
            String f45lUnderlyingTrans = request.getParameter("_370_of45l_underlying_transaction_details");
            
            // Field 24E - Delivery of Original Undertaking
            String f24eDeliveryOrig = request.getParameter("_380_of24e_delivery_of_original_undertaking");
            String f24eNarrative = request.getParameter("_381_of24e_narrative");
            
            // Field 24G - Delivery To/Collection By (SEQUENCE B)
            String f24gDeliveryTo = request.getParameter("_390_of24g_delivery_to_collection_by");
            String f24gNarrative = request.getParameter("_391_of24g_narrative");

            /* ======================================================
             *  SEQUENCE C - LOCAL UNDERTAKING DETAILS (OPTIONAL)
             * ====================================================== */
            String seqCChecked = request.getParameter("seq_C_checkbox");
            boolean isSeqCPresent = "on".equals(seqCChecked);
            
            // Field 31C - Requested Date of Issue
            String f31cReqDateIssue = request.getParameter("_410_of31c_requested_date_of_issue");
            
            // Field 22D - Form of Undertaking (Seq C)
            String f22dFormUndertakingC = request.getParameter("_420_mf22d_form_of_undertaking");
            
            // Field 40C - Applicable Rules (Seq C)
            String f40cRulesC = request.getParameter("_430_mf40c_applicable_rules");
            String f40cNarrativeC = request.getParameter("_431_mf40c_narrative");
            
            // Field 22K - Type of Undertaking
            String f22kTypeUndertaking = request.getParameter("_440_of22k_type_of_undertaking");
            String f22kNarrative = request.getParameter("_441_of22k_type_narrative");
            
            // Field 23B - Expiry Type (Seq C)
            String f23bExpiryTypeC = request.getParameter("_450_mf23b_expiry_type");
            String f31eDateExpiryC = request.getParameter("_460_of31e_date_of_expiry");
            String f35gExpiryConditionC = request.getParameter("_470_of35G_expiry_condition_events");
            
            // Field 50 - Applicant (Seq C)
            String f50ApplicantC = request.getParameter("_480_of50_applicant");
            
            // Field 51 - Obligor (Seq C)
            String f51ObligorC = request.getParameter("_490_of51_obligor_instructing_party");
            
            // Field 52a - Issuer (Seq C)
            String f52aIssuerOptC = request.getParameter("_500_of52a_issuer");
            String f52aPartyIdC = request.getParameter("_501_of52a_party_identifier");
            String f52aIdCodeC = request.getParameter("_502_of52a_identifier_code");
            String f52dPartyIdC = request.getParameter("_503_of52d_party_identifier");
            String f52dNameAddrC = request.getParameter("_504_of52d_name_address");
            
            // Field 59 - Beneficiary (Seq C)
            String f59BenefAccountC = request.getParameter("_510_mf59_beneficiary");
            String f59BenefNameAddrC = request.getParameter("_511_mf59_name_address");
            
            // Field 32B - Undertaking Amount (Seq C)
            String f32bCurrencyC = request.getParameter("_520_mf32b_currency");
            String f32bAmountC = request.getParameter("_521_mf32b_amount");
            
            // Field 39F - Supplementary Info (Seq C)
            String f39fSuppInfoC = request.getParameter("_530_of39f_supplementary_information_about_amount");
            
            // Field 57a - Advise Through Bank (Seq C)
            String f57aAdviseThroughOptC = request.getParameter("_540_of57a_advise_through_bank");
            String f57aPartyIdC = request.getParameter("_541_of57a_party_identifier");
            String f57aIdCodeC = request.getParameter("_542_of57a_identifier_code");
            String f57dPartyIdC = request.getParameter("_543_of57d_party_identifier");
            String f57dNameAddrC = request.getParameter("_544_of57d_name_address");
            
            // Field 41a - Available With (Seq C)
            String f41aAvailableOptC = request.getParameter("_550_of41a_available_with");
            String f41fIdCodeC = request.getParameter("_551_of41f_identifier_code");
            String f41gNameAddrC = request.getParameter("_552_of41g_name_address");
            
            // Field 71D - Charges (Seq C)
            String f71dChargesC = request.getParameter("_560_of71D_charges");
            
            // Field 45C - Document Instructions (Seq C)
            String f45cDocInstrC = request.getParameter("_570_of45c_document_and_presentation_instructions");
            
            // Field 77L - Requested Local Undertaking Terms
            String f77lReqLocalTerms = request.getParameter("_580_of77l_requested_local_undertaking_terms_and_conditions");
            
            // Field 22Y - Standard Wording Required
            String f22yStandardWording = request.getParameter("_590_of22y_standard_wording_required");
            
            // Field 40D - Standard Wording Language
            // CRITICAL: Database column name is "_600_of40d_standard_wording_requested_language" (WITHOUT 'd' in 'reqested')
            String f40dStandardLang = request.getParameter("_600_of40d_standard_wording_requested_language");
            
            // Field 44J - Governing Law (Seq C)
            String f44jCountryCodeC = request.getParameter("_610_of44j_country_code");
            String f44jNarrativeC = request.getParameter("_611_of44j_narrative");
            
            // Field 23F - Auto Extension (Seq C)
            String f23fAutoExtPeriodC = request.getParameter("_620_of23f_automatic_extension_period");
            String f23fNarrativeC = request.getParameter("_621_of23f_narrative");
            
            // Field 78 - Auto Extension Notification (Seq C)
            String f78AutoExtNotifC = request.getParameter("_630_of78_automatic_extension_non_extenstion_notification");
            
            // Field 26E - Auto Extension Period (Seq C)
            String f26eAutoExtNotifPeriodC = request.getParameter("_640_of26e_automatic_extension_notification_period");
            
            // Field 31S - Final Expiry Date (Seq C)
            String f31sAutoExtFinalDateC = request.getParameter("_650_of31s_automatic_extension_final_expiry_date");
            
            // Field 48B - Demand Indicator (Seq C)
            String f48bDemandIndC = request.getParameter("_660_of48b_demand_indicator");
            
            // Field 48D - Transfer Indicator (Seq C)
            String f48dTransferIndC = request.getParameter("_670_of48d_transfer_indicator");
            
            // Field 39E - Transfer Conditions (Seq C)
            String f39eTransferCondC = request.getParameter("_680_of39e_transfer_conditions");
            
            // Field 45L - Underlying Transaction (Seq C)
            String f45lUnderlyingTransC = request.getParameter("_690_mf45l_underlying_transaction_details");
            
            // Field 24E - Delivery (Seq C)
            String f24eDeliveryLocalC = request.getParameter("_700_of24e_delivery_of_local_undertaking");
            String f24eNarrativeC = request.getParameter("_701_of24e_narrative");
            
            // Field 24G - Delivery To (SEQUENCE C)
            String f24gDeliveryToC = request.getParameter("_710_of24g_delivery_to_collection_by");
            String f24gNarrativeC = request.getParameter("_711_of24g_narrative");

            /* ======================================================
             *  VALIDASI MANDATORY FIELDS
             * ====================================================== */
            if (isEmpty(f27Number) || isEmpty(f27Total) || isEmpty(f22aPurpose) ||
                isEmpty(f20UndertakingNum) || isEmpty(f30DateIssue) || isEmpty(f22dFormUndertaking) ||
                isEmpty(f40cRules) || isEmpty(f23bExpiryType) || isEmpty(f52aIssuerOpt) ||
                isEmpty(f59aBenefOpt) || isEmpty(f32bCurrency) || isEmpty(f32bAmount) ||
                isEmpty(f77uTerms)) {
                out.println("<script>alert('Mandatory fields MT760 belum lengkap.'); window.history.back();</script>");
                return;
            }

            // Validasi Field 27 (T75)
            if (!validateField27(f27Number, f27Total)) {
                out.println("<script>alert('Field 27 error: Number must be 1, Total must be 1-8 (Error T75)'); window.history.back();</script>");
                return;
            }

            // Validasi Field 20 (T26)
            if (!validateField20(f20UndertakingNum)) {
                out.println("<script>alert('Field 20 error: Cannot start/end with / or contain // (Error T26)'); window.history.back();</script>");
                return;
            }

            // Validasi dates
            if (!isEmpty(f30DateIssue) && !isValidDateFormat(f30DateIssue)) {
                out.println("<script>alert('Field 30 Date of Issue invalid format (Error T50)'); window.history.back();</script>");
                return;
            }

            // Validasi conditional mandatory fields based on Network Validated Rules
            
            // Rule C1: Field 31E based on field 23B
            if ("FIXD".equals(f23bExpiryType) && isEmpty(f31eDateExpiry)) {
                out.println("<script>alert('Rule C1: Field 31E required when 23B is FIXD'); window.history.back();</script>");
                return;
            }

            // Rule C2: Field 35G based on field 23B
            if ("COND".equals(f23bExpiryType) && isEmpty(f35gExpiryCondition)) {
                out.println("<script>alert('Rule C2: Field 35G required when 23B is COND'); window.history.back();</script>");
                return;
            }

            // Rule C4: Field 50 must be present if 22A is ISSU
            if ("ISSU".equals(f22aPurpose) && isEmpty(f50Applicant)) {
                out.println("<script>alert('Rule C4: Field 50 (Applicant) required when 22A is ISSU'); window.history.back();</script>");
                return;
            }

            // Rule C5: Field 49 based on 22A and 22D
            if ("ISSU".equals(f22aPurpose) && "STBY".equals(f22dFormUndertaking) && isEmpty(f49ConfirmInstr)) {
                out.println("<script>alert('Rule C5: Field 49 required when 22A is ISSU and 22D is STBY'); window.history.back();</script>");
                return;
            }

            // Validate field 40C narrative requirement
            if ("OTHR".equals(f40cRules) && isEmpty(f40cNarrative)) {
                out.println("<script>alert('Field 40C Narrative required when Applicable Rules is OTHR'); window.history.back();</script>");
                return;
            }

            // Validasi BIC codes
            if (!isEmpty(f52aIdCode) && !isValidBIC(f52aIdCode)) {
                out.println("<script>alert('Field 52a: Invalid BIC format (Error T27/T28/T29)'); window.history.back();</script>");
                return;
            }

            if (!isEmpty(f59aIdCode) && !isValidBIC(f59aIdCode)) {
                out.println("<script>alert('Field 59a: Invalid BIC format'); window.history.back();</script>");
                return;
            }

            // Validasi currency codes
            if (!isValidCurrency(f32bCurrency)) {
                out.println("<script>alert('Field 32B: Invalid currency code (Error T52)'); window.history.back();</script>");
                return;
            }

            // Validasi amount format
            if (!isValidAmount(f32bAmount)) {
                out.println("<script>alert('Field 32B: Invalid amount format (Error T40)'); window.history.back();</script>");
                return;
            }

            // Validasi Sequence C if checked
            if (isSeqCPresent) {
                if (isEmpty(f22dFormUndertakingC) || isEmpty(f40cRulesC) || isEmpty(f23bExpiryTypeC) ||
                    isEmpty(f50ApplicantC) || isEmpty(f59BenefNameAddrC) || isEmpty(f32bCurrencyC) ||
                    isEmpty(f32bAmountC) || isEmpty(f45lUnderlyingTransC)) {
                    out.println("<script>alert('Mandatory fields in Sequence C belum lengkap.'); window.history.back();</script>");
                    return;
                }

                // Rule C1 for Sequence C
                if ("FIXD".equals(f23bExpiryTypeC) && isEmpty(f31eDateExpiryC)) {
                    out.println("<script>alert('Rule C1: Field 31E required in Seq C when 23B is FIXD'); window.history.back();</script>");
                    return;
                }

                // Rule C2 for Sequence C
                if ("COND".equals(f23bExpiryTypeC) && isEmpty(f35gExpiryConditionC)) {
                    out.println("<script>alert('Rule C2: Field 35G required in Seq C when 23B is COND'); window.history.back();</script>");
                    return;
                }

                // Validate field 40C narrative for Seq C
                if ("OTHR".equals(f40cRulesC) && isEmpty(f40cNarrativeC)) {
                    out.println("<script>alert('Field 40C Narrative required in Seq C when Applicable Rules is OTHR'); window.history.back();</script>");
                    return;
                }

                // Validate currency for Seq C
                if (!isValidCurrency(f32bCurrencyC)) {
                    out.println("<script>alert('Field 32B (Seq C): Invalid currency code'); window.history.back();</script>");
                    return;
                }

                // Validate amount for Seq C
                if (!isValidAmount(f32bAmountC)) {
                    out.println("<script>alert('Field 32B (Seq C): Invalid amount format'); window.history.back();</script>");
                    return;
                }

                // Rule C10: Field 22K required if 22Y is STND
                if ("STND".equals(f22yStandardWording) && isEmpty(f22kTypeUndertaking)) {
                    out.println("<script>alert('Rule C10: Field 22K required when 22Y is STND'); window.history.back();</script>");
                    return;
                }
            }

            // Rule C6: Sequence C must be present if 22A is ISCO or ICCO
            if (("ISCO".equals(f22aPurpose) || "ICCO".equals(f22aPurpose)) && !isSeqCPresent) {
                out.println("<script>alert('Rule C6: Sequence C must be present when 22A is ISCO or ICCO'); window.history.back();</script>");
                return;
            }

            // Rule C7: Field 56a must be present if field 57a is present
            if ((!isEmpty(f57aAdviseThroughOpt) || !isEmpty(f57aAdviseThroughOptC)) && isEmpty(f56aAdvisingOpt)) {
                out.println("<script>alert('Rule C7: Field 56a required when field 57a is present'); window.history.back();</script>");
                return;
            }

            // Rule C9: Field 58a based on field 49
            if (("CONFIRM".equals(f49ConfirmInstr) || "MAY ADD".equals(f49ConfirmInstr)) && isEmpty(f58aReqConfOpt)) {
                out.println("<script>alert('Rule C9: Field 58a required when 49 is CONFIRM or MAY ADD'); window.history.back();</script>");
                return;
            }

            /* ======================================================
             *  GENERATE form_id UNIK
             * ====================================================== */
            String newId;
            String sqlNextId =
                    "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                    "FROM mt.mt760_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    newId = "MT760_" + rs.getInt("next_id");
                } else {
                    newId = "MT760_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT760_1";
            }

            /* ======================================================
             *  SIMPAN KE DATABASE
             * ====================================================== */
            String columns = "form_id, message_type, " +
                    // Sequence A
                    "_020_mf27_number, _021_mf27_total, _030_mf22a_purpose_of_message, " +
                    "_040_of72Z_sender_receiver_information, _050_of23x_file_identification, _051_of23x_file_name_or_reference, " +
                    // Sequence B
                    "_070_mf20_undertaking_number, _080_mf30_date_of_issue, _090_mf22d_form_of_undertaking, " +
                    "_100_mf40c_applicable_rules, _101_mf40c_narrative, " +
                    "_110_mf23b_expiry_type, _120_of31e_date_of_expiry, _130_of35g_expiry_condition_event, " +
                    "_140_of50_applicant, _150_of51_obligor_instructing_party, " +
                    "_160_mf52a_issuer, _161_mf52a_party_identifier, _162_mf52a_identifier_code, " +
                    "_163_mf52d_party_identifier, _164_mf52d_name_address, " +
                    "_170_mf59a_beneficiary, _171_mf59a_account, _172_mf59a_name_address, " +
                    "_173_mf59a_account, _174_mf59a_identifier_code, " +
                    "_180_of56a_advising_bank, _181_of56a_party_identifier, _182_of56a_identifier_code, " +
                    "_183_of56d_party_identifier, _184_of56d_name_address, " +
                    "_190_of23_advising_bank_reference, " +
                    "_200_of57a_advise_through_bank, _201_of57a_party_identifier, _202_of57a_identifier_code, " +
                    "_203_of57d_party_identifier, _204_of57d_name_address, " +
                    "_210_mf32b_currency, _211_mf32b_amount, " +
                    "_220_of39f_supplementary_information_about_amount, " +
                    "_230_of41a_available_with, _231_of41f_identifier_code, _232_of41g_name_address, " +
                    "_240_of71D_charges, _250_of45c_document_and_presentation_instructions, " +
                    "_260_mf77u_undertaking_terms_and_conditions, " +
                    "_270_of49_confirmation_instructions, " +
                    "_280_of58a_requested_confirmation_party, _281_of58a_party_identifier, _282_of58a_identifier_code, " +
                    "_283_of58d_party_identifier, _284_of58d_name_address, " +
                    "_290_of44j_country_code, _291_of44j_narrative, " +
                    "_300_of23f_automatic_extension_period, _301_of23f_narrative, " +
                    "_310_of78_automatic_extension_non_extension_notification, " +
                    "_320_of26e_automatic_extension_notification_period, " +
                    "_330_of31s_automatic_extension_final_expiry_date, " +
                    "_340_of48b_demand_indicator, _350_of48d_transfer_indicator, " +
                    "_360_of39e_transfer_conditions, _370_of45l_underlying_transaction_details, " +
                    "_380_of24e_delivery_of_original_undertaking, _381_of24e_narrative, " +
                    "_390_of24g_delivery_to_collection_by, _391_of24g_narrative, " +
                    // Sequence C
                    "_410_of31c_requested_date_of_issue, _420_mf22d_form_of_undertaking, " +
                    "_430_mf40c_applicable_rules, _431_mf40c_narrative, " +
                    "_440_of22k_type_of_undertaking, _441_of22k_type_narrative, " +
                    "_450_mf23b_expiry_type, _460_of31e_date_of_expiry, _470_of35G_expiry_condition_events, " +
                    "_480_of50_applicant, _490_of51_obligor_instructing_party, " +
                    "_500_of52a_issuer, _501_of52a_party_identifier, _502_of52a_identifier_code, " +
                    "_503_of52d_party_identifier, _504_of52d_name_address, " +
                    "_510_mf59_beneficiary, _511_mf59_name_address, " +
                    "_520_mf32b_currency, _521_mf32b_amount, " +
                    "_530_of39f_supplementary_information_about_amount, " +
                    "_540_of57a_advise_through_bank, _541_of57a_party_identifier, _542_of57a_identifier_code, " +
                    "_543_of57d_party_identifier, _544_of57d_name_address, " +
                    "_550_of41a_available_with, _551_of41f_identifier_code, _552_of41g_name_address, " +
                    "_560_of71D_charges, _570_of45c_document_and_presentation_instructions, " +
                    "_580_of77l_requested_local_undertaking_terms_and_conditions, " +
                    "_590_of22y_standard_wording_required, _600_of40d_standard_wording_requested_language, " +
                    "_610_of44j_country_code, _611_of44j_narrative, " +
                    "_620_of23f_automatic_extension_period, _621_of23f_narrative, " +
                    "_630_of78_automatic_extension_non_extenstion_notification, " +
                    "_640_of26e_automatic_extension_notification_period, " +
                    "_650_of31s_automatic_extension_final_expiry_date, " +
                    "_660_of48b_demand_indicator, _670_of48d_transfer_indicator, " +
                    "_680_of39e_transfer_conditions, _690_mf45l_underlying_transaction_details, " +
                    "_700_of24e_delivery_of_local_undertaking, _701_of24e_narrative, " +
                    "_710_of24g_delivery_to_collection_by, _711_of24g_narrative";

            int paramCount = (int) Arrays.stream(columns.split(",")).map(String::trim).filter(s -> !s.isEmpty()).count();
            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));

            String sql = "INSERT INTO mt.mt760_message(" + columns + ") VALUES (" + placeholders + ")";

            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "760");

                // Sequence A
                ps.setString(idx++, f27Number);
                ps.setString(idx++, f27Total);
                ps.setString(idx++, f22aPurpose);
                ps.setString(idx++, emptyToNull(f72zSenderInfo));
                ps.setString(idx++, emptyToNull(f23xFileId));
                ps.setString(idx++, emptyToNull(f23xFileName));

                // Sequence B
                ps.setString(idx++, f20UndertakingNum);
                ps.setString(idx++, f30DateIssue);
                ps.setString(idx++, f22dFormUndertaking);
                ps.setString(idx++, f40cRules);
                ps.setString(idx++, emptyToNull(f40cNarrative));
                ps.setString(idx++, f23bExpiryType);
                ps.setString(idx++, emptyToNull(f31eDateExpiry));
                ps.setString(idx++, emptyToNull(f35gExpiryCondition));
                ps.setString(idx++, emptyToNull(f50Applicant));
                ps.setString(idx++, emptyToNull(f51Obligor));
                
                // Field 52a
                ps.setString(idx++, emptyToNull(f52aIssuerOpt));
                ps.setString(idx++, emptyToNull(f52aPartyId));
                ps.setString(idx++, emptyToNull(f52aIdCode));
                ps.setString(idx++, emptyToNull(f52dPartyId));
                ps.setString(idx++, emptyToNull(f52dNameAddr));
                
                // Field 59a
                ps.setString(idx++, emptyToNull(f59aBenefOpt));
                ps.setString(idx++, emptyToNull(f59aAccount));
                ps.setString(idx++, emptyToNull(f59aNameAddr));
                ps.setString(idx++, emptyToNull(f59aAccount2));
                ps.setString(idx++, emptyToNull(f59aIdCode));
                
                // Field 56a
                ps.setString(idx++, emptyToNull(f56aAdvisingOpt));
                ps.setString(idx++, emptyToNull(f56aPartyId));
                ps.setString(idx++, emptyToNull(f56aIdCode));
                ps.setString(idx++, emptyToNull(f56dPartyId));
                ps.setString(idx++, emptyToNull(f56dNameAddr));
                
                ps.setString(idx++, emptyToNull(f23AdvisingRef));
                
                // Field 57a
                ps.setString(idx++, emptyToNull(f57aAdviseThroughOpt));
                ps.setString(idx++, emptyToNull(f57aPartyId));
                ps.setString(idx++, emptyToNull(f57aIdCode));
                ps.setString(idx++, emptyToNull(f57dPartyId));
                ps.setString(idx++, emptyToNull(f57dNameAddr));
                
                // Field 32B
                ps.setString(idx++, f32bCurrency);
                setBigDecimalOrNull(ps, idx++, f32bAmount);
                
                ps.setString(idx++, emptyToNull(f39fSuppInfo));
                
                // Field 41a
                ps.setString(idx++, emptyToNull(f41aAvailableOpt));
                ps.setString(idx++, emptyToNull(f41fIdCode));
                ps.setString(idx++, emptyToNull(f41gNameAddr));
                
                ps.setString(idx++, emptyToNull(f71dCharges));
                ps.setString(idx++, emptyToNull(f45cDocInstr));
                ps.setString(idx++, f77uTerms);
                ps.setString(idx++, emptyToNull(f49ConfirmInstr));
                
                // Field 58a
                ps.setString(idx++, emptyToNull(f58aReqConfOpt));
                ps.setString(idx++, emptyToNull(f58aPartyId));
                ps.setString(idx++, emptyToNull(f58aIdCode));
                ps.setString(idx++, emptyToNull(f58dPartyId));
                ps.setString(idx++, emptyToNull(f58dNameAddr));
                
                // Field 44J
                ps.setString(idx++, emptyToNull(f44jCountryCode));
                ps.setString(idx++, emptyToNull(f44jNarrative));
                
                // Field 23F
                ps.setString(idx++, emptyToNull(f23fAutoExtPeriod));
                ps.setString(idx++, emptyToNull(f23fNarrative));
                
                ps.setString(idx++, emptyToNull(f78AutoExtNotif));
                ps.setString(idx++, emptyToNull(f26eAutoExtNotifPeriod));
                ps.setString(idx++, emptyToNull(f31sAutoExtFinalDate));
                ps.setString(idx++, emptyToNull(f48bDemandInd));
                ps.setString(idx++, emptyToNull(f48dTransferInd));
                ps.setString(idx++, emptyToNull(f39eTransferCond));
                ps.setString(idx++, emptyToNull(f45lUnderlyingTrans));
                
                // Field 24E
                ps.setString(idx++, emptyToNull(f24eDeliveryOrig));
                ps.setString(idx++, emptyToNull(f24eNarrative));
                
                // Field 24G (Sequence B)
                ps.setString(idx++, emptyToNull(f24gDeliveryTo));
                ps.setString(idx++, emptyToNull(f24gNarrative));

                // Sequence C
                ps.setString(idx++, emptyToNull(f31cReqDateIssue));
                ps.setString(idx++, emptyToNull(f22dFormUndertakingC));
                ps.setString(idx++, emptyToNull(f40cRulesC));
                ps.setString(idx++, emptyToNull(f40cNarrativeC));
                
                // Field 22K
                ps.setString(idx++, emptyToNull(f22kTypeUndertaking));
                ps.setString(idx++, emptyToNull(f22kNarrative));
                
                ps.setString(idx++, emptyToNull(f23bExpiryTypeC));
                ps.setString(idx++, emptyToNull(f31eDateExpiryC));
                ps.setString(idx++, emptyToNull(f35gExpiryConditionC));
                ps.setString(idx++, emptyToNull(f50ApplicantC));
                ps.setString(idx++, emptyToNull(f51ObligorC));
                
                // Field 52a (Seq C)
                ps.setString(idx++, emptyToNull(f52aIssuerOptC));
                ps.setString(idx++, emptyToNull(f52aPartyIdC));
                ps.setString(idx++, emptyToNull(f52aIdCodeC));
                ps.setString(idx++, emptyToNull(f52dPartyIdC));
                ps.setString(idx++, emptyToNull(f52dNameAddrC));
                
                // Field 59 (Seq C)
                ps.setString(idx++, emptyToNull(f59BenefAccountC));
                ps.setString(idx++, emptyToNull(f59BenefNameAddrC));
                
                // Field 32B (Seq C)
                ps.setString(idx++, emptyToNull(f32bCurrencyC));
                setBigDecimalOrNull(ps, idx++, f32bAmountC);
                
                ps.setString(idx++, emptyToNull(f39fSuppInfoC));
                
                // Field 57a (Seq C)
                ps.setString(idx++, emptyToNull(f57aAdviseThroughOptC));
                ps.setString(idx++, emptyToNull(f57aPartyIdC));
                ps.setString(idx++, emptyToNull(f57aIdCodeC));
                ps.setString(idx++, emptyToNull(f57dPartyIdC));
                ps.setString(idx++, emptyToNull(f57dNameAddrC));
                
                // Field 41a (Seq C)
                ps.setString(idx++, emptyToNull(f41aAvailableOptC));
                ps.setString(idx++, emptyToNull(f41fIdCodeC));
                ps.setString(idx++, emptyToNull(f41gNameAddrC));
                
                ps.setString(idx++, emptyToNull(f71dChargesC));
                ps.setString(idx++, emptyToNull(f45cDocInstrC));
                ps.setString(idx++, emptyToNull(f77lReqLocalTerms));
                ps.setString(idx++, emptyToNull(f22yStandardWording));
                ps.setString(idx++, emptyToNull(f40dStandardLang));
                
                // Field 44J (Seq C)
                ps.setString(idx++, emptyToNull(f44jCountryCodeC));
                ps.setString(idx++, emptyToNull(f44jNarrativeC));
                
                // Field 23F (Seq C)
                ps.setString(idx++, emptyToNull(f23fAutoExtPeriodC));
                ps.setString(idx++, emptyToNull(f23fNarrativeC));
                
                ps.setString(idx++, emptyToNull(f78AutoExtNotifC));
                ps.setString(idx++, emptyToNull(f26eAutoExtNotifPeriodC));
                ps.setString(idx++, emptyToNull(f31sAutoExtFinalDateC));
                ps.setString(idx++, emptyToNull(f48bDemandIndC));
                ps.setString(idx++, emptyToNull(f48dTransferIndC));
                ps.setString(idx++, emptyToNull(f39eTransferCondC));
                ps.setString(idx++, emptyToNull(f45lUnderlyingTransC));
                
                // Field 24E (Seq C)
                ps.setString(idx++, emptyToNull(f24eDeliveryLocalC));
                ps.setString(idx++, emptyToNull(f24eNarrativeC));
                
                // Field 24G (Seq C)
                ps.setString(idx++, emptyToNull(f24gDeliveryToC));
                ps.setString(idx++, emptyToNull(f24gNarrativeC));

                ps.executeUpdate();
                out.println("<script>alert('MT760 data saved successfully! Form ID: " + newId + "'); window.location='Category7/mt760.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error saving MT760: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Category7/mt760.jsp");
    }

    /* ======================================================
     *  UTILITY FUNCTIONS
     * ====================================================== */
    
    /**
     * Check if string is null or empty
     */
    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
    
    /**
     * Convert empty string to null for database insertion
     */
    private String emptyToNull(String s) {
        return (s == null || s.trim().isEmpty()) ? null : s.trim();
    }

    /**
     * Set BigDecimal value or NULL in PreparedStatement
     * Handles comma as decimal separator
     */
    private void setBigDecimalOrNull(PreparedStatement ps, int idx, String val) throws java.sql.SQLException {
        if (val != null && !val.trim().isEmpty()) {
            try {
                // Replace comma with dot for decimal separator
                String cleanValue = val.replace(",", ".");
                ps.setBigDecimal(idx, new BigDecimal(cleanValue));
            } catch (NumberFormatException e) {
                ps.setNull(idx, java.sql.Types.NUMERIC);
            }
        } else {
            ps.setNull(idx, java.sql.Types.NUMERIC);
        }
    }

    /**
     * Validate date format (YYMMDD)
     */
    private boolean isValidDateFormat(String date) {
        if (date == null || date.length() != 6) {
            return false;
        }
        try {
            int yy = Integer.parseInt(date.substring(0, 2));
            int mm = Integer.parseInt(date.substring(2, 4));
            int dd = Integer.parseInt(date.substring(4, 6));
            return (mm >= 1 && mm <= 12) && (dd >= 1 && dd <= 31);
        } catch (NumberFormatException e) {
            return false;
        }
    }

    /**
     * Validate BIC code format (8 or 11 characters)
     */
    private boolean isValidBIC(String bic) {
        if (bic == null) {
            return false;
        }
        String trimmedBic = bic.trim().toUpperCase();
        if (trimmedBic.length() != 8 && trimmedBic.length() != 11) {
            return false;
        }
        // BIC format: 6 letters + 2 alphanumeric + optional 3 alphanumeric
        return trimmedBic.matches("^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$");
    }

    /**
     * Validate currency code (ISO 4217 - 3 letters)
     */
    private boolean isValidCurrency(String currency) {
        if (currency == null) {
            return false;
        }
        return currency.trim().matches("^[A-Z]{3}$");
    }

    /**
     * Validate country code (ISO 3166-1 alpha-2 - 2 letters)
     */
    private boolean isValidCountryCode(String countryCode) {
        if (countryCode == null) {
            return false;
        }
        return countryCode.trim().matches("^[A-Z]{2}$");
    }

    /**
     * Validate amount format
     * Must contain comma as decimal separator
     */
    private boolean isValidAmount(String amount) {
        if (amount == null || amount.trim().isEmpty()) {
            return false;
        }
        // Must contain comma
        if (!amount.contains(",")) {
            return false;
        }
        // Check if numeric after replacing comma with dot
        try {
            new BigDecimal(amount.replace(",", "."));
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    /**
     * Validate field 27 (Sequence of Total)
     * Number must be 1, Total must be 1-8
     */
    private boolean validateField27(String number, String total) {
        try {
            int num = Integer.parseInt(number);
            int tot = Integer.parseInt(total);
            return (num == 1) && (tot >= 1 && tot <= 8);
        } catch (NumberFormatException e) {
            return false;
        }
    }

    /**
     * Validate field 20 (Undertaking Number)
     * Cannot start/end with "/" or contain "//"
     */
    private boolean validateField20(String undertakingNumber) {
        if (undertakingNumber == null || undertakingNumber.isEmpty()) {
            return false;
        }
        if (undertakingNumber.startsWith("/") || undertakingNumber.endsWith("/")) {
            return false;
        }
        return !undertakingNumber.contains("//");
    }
}