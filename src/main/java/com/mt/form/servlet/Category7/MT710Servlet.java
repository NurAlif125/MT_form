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

@WebServlet("/MT710Servlet")
public class MT710Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // === Ambil parameter dari form mt710.jsp ===
            String mf27 = request.getParameter("_010_mf27_sequence_of_total");
            String mf40b = request.getParameter("_020_mf40b_form_of_credit");
            String mf20 = request.getParameter("_030_mf20_sender_reference");
            String mf21 = request.getParameter("_040_mf21_documentary_credit_number");

            String mf31c = request.getParameter("_060_mf31c_date_of_issue");
            String mf40e = request.getParameter("_070_mf40e_applicable_rules");
            String mf40eNarr = request.getParameter("_071_mf40e_narrative");
            String mf31dDate = request.getParameter("_080_mf31d_date_of_expiry");
            String mf31dPlace = request.getParameter("_081_mf31d_place_of_expiry");

            String of52aOpt = request.getParameter("_090_of52a_option");
            String of52aBic = request.getParameter("_091_of52a_bic");
            String of52aName = request.getParameter("_092_of52a_name_address");

            String of50b = request.getParameter("_100_of50b_non_bank_issuer");
            String of51aOpt = request.getParameter("_110_of51a_option");
            String of51aBic = request.getParameter("_112_of51a_bic");
            String of51aName = request.getParameter("_113_of51a_name_address");

            String mf50 = request.getParameter("_120_mf50_applicant");
            String of59Acc = request.getParameter("_130_of59_account");
            String mf59Name = request.getParameter("_131_mf59_name_address");

            String mf32bCcy = request.getParameter("_140_mf32b_currency");
            String mf32bAmt = request.getParameter("_141_mf32b_amount");
            String of39aPlus = request.getParameter("_150_of39a_plus");
            String of39aMinus = request.getParameter("_151_of39a_minus");

            String of39b = request.getParameter("_160_of39b_maximum_credit_amount");

            String mf41aOpt = request.getParameter("_170_mf41a_option");
            String mf41aBic = request.getParameter("_172_mf41a_bic");
            String mf41aName = request.getParameter("_174_mf41a_name_address");
            String mf41aBy = request.getParameter("_173_mf41a_by");

            String of42c = request.getParameter("_180_of42c_drafts");
            String of42aOpt = request.getParameter("_190_of42a_option");
            String of42aBic = request.getParameter("_192_of42a_bic");
            String of42aName = request.getParameter("_193_of42a_name_address");

            String of42m = request.getParameter("_200_of42m_mixed_payment");
            String of42p = request.getParameter("_210_of42p_deferred_payment");

            String of43p = request.getParameter("_220_of43p_partial_shipments");
            String of43t = request.getParameter("_230_of43t_transhipment");

            String of44a = request.getParameter("_240_of44a_place_dispatch");
            String of44e = request.getParameter("_250_of44e_port_loading");
            String of44f = request.getParameter("_260_of44f_port_discharge");
            String of44b = request.getParameter("_270_of44b_final_destination");

            String of44c = request.getParameter("_280_of44c_latest_date");
            String of44d = request.getParameter("_290_of44d_shipment_period");

            String of45a = request.getParameter("_300_of45a_description");
            String of46a = request.getParameter("_310_of46a_documents");
            String of47a = request.getParameter("_320_of47a_conditions");

            String of71b = request.getParameter("_330_of71b_charges");
            String of48 = request.getParameter("_340_of48_period_presentation");
            String of49 = request.getParameter("_370_mf49_confirmation");

            String of53aOpt = request.getParameter("_390_of53a_option");
            String of53aBic = request.getParameter("_392_of53a_bic");
            String of53aName = request.getParameter("_393_of53a_name_address");

            String of78 = request.getParameter("_400_of78_instructions");
            String of78d = request.getParameter("_410_of78d_instructions_from_intermediary");

            String of57aOpt = request.getParameter("_420_of57a_option");
            String of57aBic = request.getParameter("_422_of57a_bic");
            String of57aName = request.getParameter("_423_of57a_name_address");

            String of72z = request.getParameter("_430_of72z_information");

            // === Server-side mandatory check ===
            if (isEmpty(mf27) || isEmpty(mf40b) || isEmpty(mf20) || isEmpty(mf21) ||
                isEmpty(mf31c) || isEmpty(mf40e) || isEmpty(mf31dDate) || isEmpty(mf31dPlace) ||
                isEmpty(mf50) || isEmpty(mf59Name) || isEmpty(mf32bCcy) || isEmpty(mf32bAmt) ||
                isEmpty(mf41aOpt) || isEmpty(mf41aBy) || isEmpty(of49)) {
                out.println("<script>alert('Mandatory fields MT710 belum lengkap.'); window.history.back();</script>");
                return;
            }

            // === Generate custom form_id untuk MT710 ===
            String newId = null;
            String sqlNextId =
                "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                "FROM mt.mt710_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT710_" + next;
                } else {
                    newId = "MT710_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT710_1";
            }

            // === Column list (SINKRON DDL) ===
            String columns = "form_id, message_type, " +
                    "_010_mf27_sequence_of_total, _020_mf40b_form_of_credit, _030_mf20_sender_reference, _040_mf21_documentary_credit_number, " +
                    "_060_mf31c_date_of_issue, _070_mf40e_applicable_rules, _071_mf40e_narrative, _080_mf31d_date_of_expiry, _081_mf31d_place_of_expiry, " +
                    "_090_of52a_option, _091_of52a_bic, _092_of52a_name_address, _100_of50b_non_bank_issuer, " +
                    "_110_of51a_option, _112_of51a_bic, _113_of51a_name_address, _120_mf50_applicant, _130_of59_account, _131_mf59_name_address, " +
                    "_140_mf32b_currency, _141_mf32b_amount, _150_of39a_plus, _151_of39a_minus, _160_of39b_maximum_credit_amount, " +
                    "_170_mf41a_option, _172_mf41a_bic, _174_mf41a_name_address, _173_mf41a_by, " +
                    "_180_of42c_drafts, _190_of42a_option, _192_of42a_bic, _193_of42a_name_address, " +
                    "_200_of42m_mixed_payment, _210_of42p_deferred_payment, _220_of43p_partial_shipments, _230_of43t_transhipment, " +
                    "_240_of44a_place_dispatch, _250_of44e_port_loading, _260_of44f_port_discharge, _270_of44b_final_destination, " +
                    "_280_of44c_latest_date, _290_of44d_shipment_period, " +
                    "_300_of45a_description, _310_of46a_documents, _320_of47a_conditions, " +
                    "_330_of71b_charges, _340_of48_period_presentation, _370_mf49_confirmation, " +
                    "_390_of53a_option, _392_of53a_bic, _393_of53a_name_address, " +
                    "_400_of78_instructions, _410_of78d_instructions_from_intermediary, " +
                    "_420_of57a_option, _422_of57a_bic, _423_of57a_name_address, _430_of72z_information";

            int paramCount = (int) Arrays.stream(columns.split(","))
                                         .map(String::trim)
                                         .filter(s -> !s.isEmpty())
                                         .count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt710_message(" + columns + ") VALUES (" + placeholders + ")";

            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "710");
                ps.setString(idx++, mf27);
                ps.setString(idx++, mf40b);
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
                ps.setString(idx++, of51aOpt);
                ps.setString(idx++, of51aBic);
                ps.setString(idx++, of51aName);
                ps.setString(idx++, mf50);
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

                // Percent tolerances (int)
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

                ps.setString(idx++, of39b);
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
                ps.setString(idx++, of71b);
                ps.setString(idx++, of48);
                ps.setString(idx++, of49);
                ps.setString(idx++, of53aOpt);
                ps.setString(idx++, of53aBic);
                ps.setString(idx++, of53aName);
                ps.setString(idx++, of78);
                ps.setString(idx++, of78d);
                ps.setString(idx++, of57aOpt);
                ps.setString(idx++, of57aBic);
                ps.setString(idx++, of57aName);
                ps.setString(idx++, of72z);

                // Debug check
                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT710 data saved successfully!'); window.location='mt710.jsp';</script>");
                response.sendRedirect("Category7/mt710.jsp");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT710: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
