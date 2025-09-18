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

@WebServlet("/MT747Servlet")
public class MT747Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            /* ========== Ambil parameter dari mt747.jsp ========== */
            String mf20 = request.getParameter("_010_mf20_documentary_credit_number");
            String of21 = request.getParameter("_020_of21_reimbursing_bank_reference");
            String mf30 = request.getParameter("_030_mf30_date_of_the_original_authorisation_to_reimburse");
            String of31e = request.getParameter("_040_of31e_new_date_of_expiry");

            String of32bCurrency = request.getParameter("_050_of32b_currency");
            String of32bAmount = request.getParameter("_051_of32b_amount");

            String of33bCurrency = request.getParameter("_060_of33b_currency");
            String of33bAmount = request.getParameter("_061_of33b_amount");

            String of34bCurrency = request.getParameter("_070_of34b_currency");
            String of34bAmount = request.getParameter("_071_of34b_amount");

            String of39aPlus = request.getParameter("_080_of39a_plus");
            String of39aMinus = request.getParameter("_081_of39a_minus");

            String of39c = request.getParameter("_090_of39c_additional_amounts_covered");

            String of72z = request.getParameter("_100_of72z_sender_to_receiver_information");
            String of77 = request.getParameter("_110_of77_narrative");

            /* ========== Mandatory server-side check ========== */
            if (isEmpty(mf20) || isEmpty(mf30)) {
                out.println("<script>alert('Mandatory fields MT747 belum lengkap.'); window.history.back();</script>");
                return;
            }

            /* ========== Generate form_id unik untuk MT747 ========== */
            String newId = null;
            String sqlNextId =
                    "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                    "FROM mt.mt747_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT747_" + next;
                } else {
                    newId = "MT747_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT747_1";
            }

            /* ========== Column list (harus sesuai DDL table mt747_message) ========== */
            String columns = "form_id, message_type, " +
                    "_010_mf20_documentary_credit_number, _020_of21_reimbursing_bank_reference, " +
                    "_030_mf30_date_of_the_original_authorisation_to_reimburse, _040_of31e_new_date_of_expiry, " +
                    "_050_of32b_currency, _051_of32b_amount, " +
                    "_060_of33b_currency, _061_of33b_amount, " +
                    "_070_of34b_currency, _071_of34b_amount, " +
                    "_080_of39a_plus, _081_of39a_minus, " +
                    "_090_of39c_additional_amounts_covered, " +
                    "_100_of72z_sender_to_receiver_information, _110_of77_narrative";

            int paramCount = (int) Arrays.stream(columns.split(","))
                    .map(String::trim).filter(s -> !s.isEmpty()).count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt747_message(" + columns + ") VALUES (" + placeholders + ")";

            /* ========== Simpan ke database ========== */
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "747");

                ps.setString(idx++, mf20);
                ps.setString(idx++, of21);
                ps.setString(idx++, mf30);
                ps.setString(idx++, of31e);

                ps.setString(idx++, of32bCurrency);
                if (!isEmpty(of32bAmount)) {
                    String norm = of32bAmount.trim().replace(",", "").replace(" ", "");
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(norm));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, of33bCurrency);
                if (!isEmpty(of33bAmount)) {
                    String norm = of33bAmount.trim().replace(",", "").replace(" ", "");
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(norm));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                ps.setString(idx++, of34bCurrency);
                if (!isEmpty(of34bAmount)) {
                    String norm = of34bAmount.trim().replace(",", "").replace(" ", "");
                    ps.setBigDecimal(idx++, new java.math.BigDecimal(norm));
                } else {
                    ps.setNull(idx++, java.sql.Types.NUMERIC);
                }

                if (!isEmpty(of39aPlus)) {
                    ps.setInt(idx++, Integer.parseInt(of39aPlus));
                } else {
                    ps.setNull(idx++, java.sql.Types.INTEGER);
                }

                if (!isEmpty(of39aMinus)) {
                    ps.setInt(idx++, Integer.parseInt(of39aMinus));
                } else {
                    ps.setNull(idx++, java.sql.Types.INTEGER);
                }

                ps.setString(idx++, of39c);
                ps.setString(idx++, of72z);
                ps.setString(idx++, of77);

                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT700 data saved successfully!'); window.location='Category7/mt747.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT747: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
