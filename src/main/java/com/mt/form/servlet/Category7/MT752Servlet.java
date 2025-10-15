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

@WebServlet("/MT752Servlet")
public class MT752Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            /* ========== Ambil parameter dari mt752.jsp ========== */
            
            // Mandatory Fields
            String mf20 = request.getParameter("_010_mf20_documentary_credit_number");
            String mf21 = request.getParameter("_020_mf21_presenting_banks_reference");
            String mf23 = request.getParameter("_030_mf23_further_identification");
            String mf30 = request.getParameter("_040_mf30_date_of_advice_of_discrepancy_or_mailing");

            // Field 32B - Total Amount Advised
            String of32bCurrency = request.getParameter("_050_of32b_currency");
            String of32bAmount = request.getParameter("_051_of32b_amount");

            // Field 71D - Charges Deducted
            String of71d = request.getParameter("_060_of71d_charges_deducted");

            // Field 33a - Net Amount (Option A atau B)
            String of33aOption = request.getParameter("_070_of33a_net_amount");
            String of33aDateA = request.getParameter("_071_of33a_date");       // Option A
            String of33aCurrencyA = request.getParameter("_072_of33a_currency"); // Option A
            String of33aAmountA = request.getParameter("_073_of33a_amount");   // Option A
            String of33aCurrencyB = request.getParameter("_074_of33a_currency"); // Option B
            String of33aAmountB = request.getParameter("_075_of33a_amount");   // Option B

            // Field 53a - Sender's Correspondent (Option A, B, atau D)
            String of53aOption = request.getParameter("_080_of53a_senders_correspondent");
            String of53aPartyIdA = request.getParameter("_081_of53a_party_identifier");
            String of53aIdentifierCode = request.getParameter("_082_of53a_identifier_code");
            String of53aPartyIdB = request.getParameter("_083_of53a_party_identifier");
            String of53aLocation = request.getParameter("_084_of53a_location");
            String of53aPartyIdD = request.getParameter("_085_of53a_party_identifier");
            String of53aNameAddress = request.getParameter("_086_of53a_name_address");

            // Field 54a - Receiver's Correspondent (Option A, B, atau D)
            String of54aOption = request.getParameter("_090_of54a_receivers_correspondent");
            String of54aPartyIdA = request.getParameter("_091_of54a_party_identifier");
            String of54aIdentifierCode = request.getParameter("_092_of54a_identifier_code");
            String of54aPartyIdB = request.getParameter("_093_of54a_party_identifier");
            String of54aLocation = request.getParameter("_094_of54a_location");
            String of54aPartyIdD = request.getParameter("_095_of54a_party_identifier");
            String of54aNameAddress = request.getParameter("_096_of54a_name_address");

            // Field 72Z - Sender to Receiver Information
            String of72z = request.getParameter("_100_of72z_sender_to_receiver_information");

            // Field 79Z - Narrative
            String of79z = request.getParameter("_110_of79z_narrative");

            /* ========== Mandatory check ========== */
            if (isEmpty(mf20) || isEmpty(mf21) || isEmpty(mf23) || isEmpty(mf30)) {
                out.println("<script>alert('Mandatory fields MT752 belum lengkap.'); window.history.back();</script>");
                return;
            }

            /* ========== Generate form_id unik ========== */
            String newId = null;
            String sqlNextId =
                    "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                            "FROM mt.mt752_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT752_" + next;
                } else {
                    newId = "MT752_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT752_1";
            }

            /* ========== Column list (sesuai DDL table mt752_message) ========== */
            String columns = "form_id, message_type, " +
                    "_010_mf20_documentary_credit_number, " +
                    "_020_mf21_presenting_banks_reference, " +
                    "_030_mf23_further_identification, " +
                    "_040_mf30_date_of_advice_of_discrepancy_or_mailing, " +
                    "_050_of32b_currency, " +
                    "_051_of32b_amount, " +
                    "_060_of71d_charges_deducted, " +
                    "_070_of33a_net_amount, " +
                    "_071_of33a_date, " +
                    "_072_of33a_currency, " +
                    "_073_of33a_amount, " +
                    "_074_of33a_currency, " +
                    "_075_of33a_amount, " +
                    "_080_of53a_senders_correspondent, " +
                    "_081_of53a_party_identifier, " +
                    "_082_of53a_identifier_code, " +
                    "_083_of53a_party_identifier, " +
                    "_084_of53a_location, " +
                    "_085_of53a_party_identifier, " +
                    "_086_of53a_name_address, " +
                    "_090_of54a_receivers_correspondent, " +
                    "_091_of54a_party_identifier, " +
                    "_092_of54a_identifier_code, " +
                    "_093_of54a_party_identifier, " +
                    "_094_of54a_location, " +
                    "_095_of54a_party_identifier, " +
                    "_096_of54a_name_address, " +
                    "_100_of72z_sender_to_receiver_information, " +
                    "_110_of79z_narrative";

            int paramCount = (int) Arrays.stream(columns.split(","))
                    .map(String::trim).filter(s -> !s.isEmpty()).count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt752_message(" + columns + ") VALUES (" + placeholders + ")";

            /* ========== Simpan ke database ========== */
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "752");

                // Mandatory fields
                ps.setString(idx++, mf20);
                ps.setString(idx++, mf21);
                ps.setString(idx++, mf23);
                ps.setString(idx++, mf30);

                // Field 32B
                ps.setString(idx++, of32bCurrency);
                if (!isEmpty(of32bAmount)) {
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(of32bAmount.replace(",", ".")));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                // Field 71D
                ps.setString(idx++, of71d);

                // Field 33a - Net Amount
                ps.setString(idx++, of33aOption);
                
                // Field 33a Option A
                ps.setString(idx++, of33aDateA);
                ps.setString(idx++, of33aCurrencyA);
                if (!isEmpty(of33aAmountA)) {
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(of33aAmountA.replace(",", ".")));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }
                
                // Field 33a Option B
                ps.setString(idx++, of33aCurrencyB);
                if (!isEmpty(of33aAmountB)) {
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(of33aAmountB.replace(",", ".")));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                // Field 53a - Sender's Correspondent
                ps.setString(idx++, of53aOption);
                ps.setString(idx++, of53aPartyIdA);
                ps.setString(idx++, of53aIdentifierCode);
                ps.setString(idx++, of53aPartyIdB);
                ps.setString(idx++, of53aLocation);
                ps.setString(idx++, of53aPartyIdD);
                ps.setString(idx++, of53aNameAddress);

                // Field 54a - Receiver's Correspondent
                ps.setString(idx++, of54aOption);
                ps.setString(idx++, of54aPartyIdA);
                ps.setString(idx++, of54aIdentifierCode);
                ps.setString(idx++, of54aPartyIdB);
                ps.setString(idx++, of54aLocation);
                ps.setString(idx++, of54aPartyIdD);
                ps.setString(idx++, of54aNameAddress);

                // Field 72Z
                ps.setString(idx++, of72z);

                // Field 79Z
                ps.setString(idx++, of79z);

                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT752 data saved successfully!'); window.location='Category7/mt752.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT752: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}