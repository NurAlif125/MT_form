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

@WebServlet("/MT759Servlet")
public class MT759Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            /* ========== Ambil parameter dari mt759.jsp ========== */
            String f27 = request.getParameter("_010_mf27_sequence_of_total");
            String f20 = request.getParameter("_020_mf20_transaction_reference_number");
            String f21 = request.getParameter("_030_of21_related_reference_number");
            String f22d = request.getParameter("_040_mf22d_form_of_undertaking");
            String f23 = request.getParameter("_050_of23_undertaking_number");

            String opt52a = request.getParameter("_060_of52a_issuer");
            String of52aPartyId = request.getParameter("_061_of52a_party_identifier");
            String of52aIdentifier = request.getParameter("_062_of52a_identifier_code");
            String of52aNameAddr = request.getParameter("_063_of52a_name_address");

            String f23h = request.getParameter("_070_mf23h_function_of_message");
            String f45d = request.getParameter("_080_mf45d_narrative");

            String f23xCode = request.getParameter("_090_of23x_file_identification");
            String f23xFilename = request.getParameter("_091_of23x_file_name");

            /* ========== Mandatory check ========== */
            if (isEmpty(f27) || isEmpty(f20) || isEmpty(f22d)
                    || isEmpty(f23h) || isEmpty(f45d)) {
                out.println("<script>alert('Mandatory fields MT759 belum lengkap.'); window.history.back();</script>");
                return;
            }

            /* ========== Generate form_id unik ========== */
            String newId = null;
            String sqlNextId =
                    "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                            "FROM mt.mt759_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT759_" + next;
                } else {
                    newId = "MT759_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT759_1";
            }

            /* ========== Column list (sesuai DDL table mt759_message) ========== */
            String columns = "form_id, message_type, " +
                    "_010_mf27_sequence_of_total, _020_mf20_transaction_reference_number, " +
                    "_030_mf21_related_reference_number, _040_mf22d_form_of_undertaking, " +
                    "_050_of23_undertaking_number, " +
                    "_060_of52a_issuer, _061_of52a_party_identifier, _062_of52a_identifier_code, _063_of52a_name_address, " +
                    "_070_mf23h_function_of_message, _080_mf45d_narrative, " +
                    "_090_of23x_file_identification, _091_of23x_file_name";

            int paramCount = (int) Arrays.stream(columns.split(","))
                    .map(String::trim).filter(s -> !s.isEmpty()).count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt759_message(" + columns + ") VALUES (" + placeholders + ")";

            /* ========== Simpan ke database ========== */
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "759");

                ps.setString(idx++, f27);
                ps.setString(idx++, f20);
                ps.setString(idx++, f21);
                ps.setString(idx++, f22d);
                ps.setString(idx++, f23);

                ps.setString(idx++, opt52a);
                ps.setString(idx++, of52aPartyId);
                ps.setString(idx++, of52aIdentifier);
                ps.setString(idx++, of52aNameAddr);

                ps.setString(idx++, f23h);
                ps.setString(idx++, f45d);

                ps.setString(idx++, f23xCode);
                ps.setString(idx++, f23xFilename);

                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT759 data saved successfully!'); window.location='Category7/mt759.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT759: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
