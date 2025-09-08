package com.mt.form.servlet.Category7;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/MT700Servlet")
public class MT700Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // === Koneksi PostgreSQL ===
    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/mt_forms";
    private static final String JDBC_USER = "postgres";
    private static final String JDBC_PASS = "123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // === Paksa load driver (fix untuk No suitable driver) ===
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException e) {
                out.println("<script>alert('PostgreSQL Driver tidak ditemukan: " + e.getMessage() + "'); window.history.back();</script>");
                return;
            }

            // === Ambil parameter dari JSP ===
            String seqTotal = request.getParameter("_010_mf27_sequence_of_total");
            String formCredit = request.getParameter("_020_mf40a_form_of_credit");
            String creditNumber = request.getParameter("_030_mf20_documentary_credit_number");
            String preAdvice = request.getParameter("_040_of23_reference_to_preadvice");
            String dateIssue = request.getParameter("_050_mf31c_date_of_issue");
            String applicableRules = request.getParameter("_060_mf40e_applicable_rules");
            String narrative = request.getParameter("_061_mf40e_narrative");
            String dateExpiry = request.getParameter("_070_mf31d_date_of_expiry");
            String placeExpiry = request.getParameter("_071_mf31d_place_of_expiry");
            String applicantBankOpt = request.getParameter("_080_of51a_option");
            String applicantBankBic = request.getParameter("_081_of51a_bic");
            String applicantBankNameAddr = request.getParameter("_082_of51a_name_address");
            String applicant = request.getParameter("_090_mf50_applicant");
            String beneficiaryAcc = request.getParameter("_100_mf59_account");
            String beneficiaryNameAddr = request.getParameter("_101_mf59_name_address");
            String currency = request.getParameter("_110_mf32b_currency");
            String amount = request.getParameter("_111_mf32b_amount");
            String tolerancePlus = request.getParameter("_120_of39a_tolerance_plus");
            String toleranceMinus = request.getParameter("_121_of39a_tolerance_minus");
            String addAmounts = request.getParameter("_130_of39c_additional_amounts");
            String availOpt = request.getParameter("_140_mf41a_option");
            String availBic = request.getParameter("_141_mf41a_identifier_code");
            String availNameAddr = request.getParameter("_142_mf41d_name_and_address");
            String availBy = request.getParameter("_143_mf41a_by");
            String drafts = request.getParameter("_150_of42c_drafts");
            String draweeOpt = request.getParameter("_160_of42a_option");
            String draweeBic = request.getParameter("_161_of42a_identifier_code");
            String draweeNameAddr = request.getParameter("_162_of42d_name_and_address");
            String mixedPayment = request.getParameter("_170_of42m_mixed_payment");
            String deferredPayment = request.getParameter("_180_of42p_negotiation");
            String partialShipments = request.getParameter("_190_of43p_partial_shipments");
            String transhipment = request.getParameter("_200_of43t_transhipment");
            String placeDispatch = request.getParameter("_210_of44a_place_dispatch");
            String portLoading = request.getParameter("_220_of44e_port_loading");
            String portDischarge = request.getParameter("_230_of44f_port_discharge");
            String placeDestination = request.getParameter("_240_of44b_place_destination");
            String latestDate = request.getParameter("_250_of44c_latest_date");
            String shipmentPeriod = request.getParameter("_260_of44d_shipment_period");
            String descGoods = request.getParameter("_270_of45a_description");
            String docsRequired = request.getParameter("_280_of46a_documents");
            String addConditions = request.getParameter("_290_of47a_additional_conditions");
            String specialPayBenef = request.getParameter("_300_of49g_special_payment_beneficiary");
            String specialPayBank = request.getParameter("_310_of49h_special_payment_bank");
            String charges = request.getParameter("_320_of71d_charges");
            String periodDays = request.getParameter("_330_of48_days");
            String periodNarrative = request.getParameter("_331_of48_narrative");
            String confirmInstr = request.getParameter("_340_mf49_confirmation");
            String confPartyOpt = request.getParameter("_350_of58a_option");
            String confPartyBic = request.getParameter("_351_of58a_bic");
            String confPartyNameAddr = request.getParameter("_352_of58a_name_address");
            String reimbOpt = request.getParameter("_360_of53a_option");
            String reimbBic = request.getParameter("_361_of53a_bic");
            String reimbNameAddr = request.getParameter("_362_of53a_name_address");
            String instrToBank = request.getParameter("_370_of78_instructions");
            String adviseOpt = request.getParameter("_380_of57a_option");
            String adviseBic = request.getParameter("_381_of57a_bic");
            String adviseLoc = request.getParameter("_382_of57a_location");
            String adviseNameAddr = request.getParameter("_383_of57a_name_address");
            String senderReceiverInfo = request.getParameter("_390_of72z_information");

            // === Basic validation (server-side mandatory fields) ===
            if (isEmpty(seqTotal) || isEmpty(formCredit) || isEmpty(creditNumber) ||
                isEmpty(dateIssue) || isEmpty(applicant) || isEmpty(beneficiaryNameAddr) ||
                isEmpty(currency) || isEmpty(amount) || isEmpty(availOpt) || isEmpty(availBy) ||
                isEmpty(confirmInstr)) {
                out.println("<script>alert('Mandatory fields MT700 belum lengkap.'); window.history.back();</script>");
                return;
            }
            
            // === Generate custom ID untuk MT700 ===
            String newId = null;
            String prefix = "MT700";
            String sqlNextId = "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                               "FROM mt.mt700_message";
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {

                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = prefix + "_" + next;
                } else {
                    newId = prefix + "_1";
                }
            } catch (java.sql.SQLException e) {
                e.printStackTrace(out);
                newId = "MT700_1";
            }

            // === Query Insert (contoh sederhana) ===
            String sql = "INSERT INTO mt.mt700_message(" +
                "form_id, message_type, mf27_sequence_of_total, mf40a_form_of_credit, mf20_documentary_credit_number, " +
                "of23_reference_to_preadvice, mf31c_date_of_issue, mf40e_applicable_rules, mf40e_narrative, " +
                "mf31d_date_of_expiry, mf31d_place_of_expiry, of51a_option, of51a_bic, of51a_name_address, " +
                "mf50_applicant, mf59_account, mf59_name_address, mf32b_currency, mf32b_amount, " +
                "of39a_tolerance_plus, of39a_tolerance_minus, of39c_additional_amounts, mf41a_option, mf41a_identifier_code, " +
                "mf41d_name_and_address, mf41a_by, of42c_drafts, of42a_option, of42a_identifier_code, " +
                "of42d_name_and_address, of42m_mixed_payment, of42p_negotiation, of43p_partial_shipments, " +
                "of43t_transhipment, of44a_place_dispatch, of44e_port_loading, of44f_port_discharge, " +
                "of44b_place_destination, of44c_latest_date, of44d_shipment_period, of45a_description, " +
                "of46a_documents, of47a_additional_conditions, of49g_special_payment_beneficiary, " +
                "of49h_special_payment_bank, of71d_charges, of48_days, of48_narrative, mf49_confirmation, " +
                "of58a_option, of58a_bic, of58a_name_address, of53a_option, of53a_bic, of53a_name_address, " +
                "of78_instructions, of57a_option, of57a_bic, of57a_location, of57a_name_address, of72z_information" +
                ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";


            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "700");
                ps.setString(idx++, seqTotal);
                ps.setString(idx++, formCredit);
                ps.setString(idx++, creditNumber);
                ps.setString(idx++, preAdvice);
                ps.setString(idx++, dateIssue);
                ps.setString(idx++, applicableRules);
                ps.setString(idx++, narrative);
                ps.setString(idx++, dateExpiry);
                ps.setString(idx++, placeExpiry);
                ps.setString(idx++, applicantBankOpt);
                ps.setString(idx++, applicantBankBic);
                ps.setString(idx++, applicantBankNameAddr);
                ps.setString(idx++, applicant);
                ps.setString(idx++, beneficiaryAcc);
                ps.setString(idx++, beneficiaryNameAddr);
                ps.setString(idx++, currency);
                ps.setString(idx++, amount);
                ps.setString(idx++, tolerancePlus);
                ps.setString(idx++, toleranceMinus);
                ps.setString(idx++, addAmounts);
                ps.setString(idx++, availOpt);
                ps.setString(idx++, availBic);
                ps.setString(idx++, availNameAddr);
                ps.setString(idx++, availBy);
                ps.setString(idx++, drafts);
                ps.setString(idx++, draweeOpt);
                ps.setString(idx++, draweeBic);
                ps.setString(idx++, draweeNameAddr);
                ps.setString(idx++, mixedPayment);
                ps.setString(idx++, deferredPayment);
                ps.setString(idx++, partialShipments);
                ps.setString(idx++, transhipment);
                ps.setString(idx++, placeDispatch);
                ps.setString(idx++, portLoading);
                ps.setString(idx++, portDischarge);
                ps.setString(idx++, placeDestination);
                ps.setString(idx++, latestDate);
                ps.setString(idx++, shipmentPeriod);
                ps.setString(idx++, descGoods);
                ps.setString(idx++, docsRequired);
                ps.setString(idx++, addConditions);
                ps.setString(idx++, specialPayBenef);
                ps.setString(idx++, specialPayBank);
                ps.setString(idx++, charges);
                ps.setString(idx++, periodDays);
                ps.setString(idx++, periodNarrative);
                ps.setString(idx++, confirmInstr);
                ps.setString(idx++, confPartyOpt);
                ps.setString(idx++, confPartyBic);
                ps.setString(idx++, confPartyNameAddr);
                ps.setString(idx++, reimbOpt);
                ps.setString(idx++, reimbBic);
                ps.setString(idx++, reimbNameAddr);
                ps.setString(idx++, instrToBank);
                ps.setString(idx++, adviseOpt);
                ps.setString(idx++, adviseBic);
                ps.setString(idx++, adviseLoc);
                ps.setString(idx++, adviseNameAddr);
                ps.setString(idx++, senderReceiverInfo);

                ps.executeUpdate();
                out.println("<script>alert('MT700 data saved successfully!'); window.location='mt700.jsp';</script>");
                
                response.sendRedirect("Category7/viewForm.jsp?id=");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT700: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
