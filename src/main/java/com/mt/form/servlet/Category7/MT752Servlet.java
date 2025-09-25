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
            String mf20 = request.getParameter("_010_mf20_documentary_credit_number");
            String mf21 = request.getParameter("_020_mf21_presenting_banks_reference"); // fixed
            String mf23 = request.getParameter("_030_mf23_further_identification");
            String mf30 = request.getParameter("_040_mf30_date_of_advice_of_discrepancy_or_mailing");

            String of32bCurrency = request.getParameter("_050_of32b_currency");
            String of32bAmount = request.getParameter("_051_of32b_amount");

            String of71d = request.getParameter("_060_of71d_charges_deducted");

            String of33aDate = request.getParameter("_070_of33a_date");
            String of33aCurrency = request.getParameter("_071_of33a_currency");
            String of33aAmount = request.getParameter("_072_of33a_amount");

            String of53aOpt = request.getParameter("_080_of53a_senders_correspondent");
            String of53aPartyId = request.getParameter("_081_of53a_party_identifier");
            String of53aIdentifierCode = request.getParameter("_082_of53a_identifier_code"); // fixed
            String of53aLocation = request.getParameter("_083_of53a_location");
            String of53aNameAddr = request.getParameter("_084_of53a_name_address");

            String of54aOpt = request.getParameter("_090_of54a_receivers_correspondent");
            String of54aPartyId = request.getParameter("_091_of54a_party_identifier"); // added
            String of54aIdentifierCode = request.getParameter("_092_of54a_identifier_code"); // fixed
            String of54aLocation = request.getParameter("_093_of54a_location"); // fixed
            String of54aNameAddr = request.getParameter("_094_of54a_name_address"); // fixed

            String of72z = request.getParameter("_100_of72z_sender_to_receiver_information");
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
                    "_010_mf20_documentary_credit_number, _020_mf21_presenting_banks_reference, _030_mf23_further_identification, _040_mf30_date_of_advice_of_discrepancy_or_mailing, " +
                    "_050_of32b_currency, _051_of32b_amount, " +
                    "_060_of71d_charges_deducted, " +
                    "_070_of33a_date, _071_of33a_currency, _072_of33a_amount, " +
                    "_080_of53a_senders_correspondent, _081_of53a_party_identifier, _082_of53a_identifier_code, _083_of53a_location, _084_of53a_name_address, " +
                    "_090_of54a_receivers_correspondent, _091_of54a_party_identifier, _092_of54a_identifier_code, _093_of54a_location, _094_of54a_name_address, " +
                    "_100_of72z_sender_to_receiver_information, _110_of79z_narrative";

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

                ps.setString(idx++, mf20);
                ps.setString(idx++, mf21);
                ps.setString(idx++, mf23);
                ps.setString(idx++, mf30);

                ps.setString(idx++, of32bCurrency);
                if (!isEmpty(of32bAmount)) {
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(of32bAmount.replace(",", ".")));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, of71d);

                ps.setString(idx++, of33aDate);
                ps.setString(idx++, of33aCurrency);
                if (!isEmpty(of33aAmount)) {
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(of33aAmount.replace(",", ".")));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, of53aOpt);
                ps.setString(idx++, of53aPartyId);
                ps.setString(idx++, of53aIdentifierCode);
                ps.setString(idx++, of53aLocation);
                ps.setString(idx++, of53aNameAddr);

                ps.setString(idx++, of54aOpt);
                ps.setString(idx++, of54aPartyId);
                ps.setString(idx++, of54aIdentifierCode);
                ps.setString(idx++, of54aLocation);
                ps.setString(idx++, of54aNameAddr);

                ps.setString(idx++, of72z);
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
