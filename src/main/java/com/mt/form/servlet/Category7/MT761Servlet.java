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

@WebServlet("/MT761Servlet")
public class MT761Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            /* ========== Ambil parameter dari mt761.jsp ========== */
            String f27Number = request.getParameter("_010_mf27_number");
            String f27Total  = request.getParameter("_011_mf27_total");
            String f20       = request.getParameter("_020_mf20_undertaking_number");

            String opt52a    = request.getParameter("_030_mf52a_issuer");
            String f52aParty = request.getParameter("_031_mf52a_party_identifier");
            String f52aCode  = request.getParameter("_032_mf52a_identifier_code");
            String f52dParty = request.getParameter("_033_mf52d_party_identifier");
            String f52dName  = request.getParameter("_034_mf52d_name_address");

            String f77u      = request.getParameter("_040_of77u_undertaking_terms_and_conditions");
            String f77l      = request.getParameter("_050_of77l_requested_local_undertaking_terms_and_conditions");

            /* ========== Mandatory check ========== */
            if (isEmpty(f27Number) || isEmpty(f27Total) || isEmpty(f20) || isEmpty(opt52a)) {
                out.println("<script>alert('Mandatory fields MT761 belum lengkap.'); window.history.back();</script>");
                return;
            }

            /* ========== Generate form_id unik ========== */
            String newId = null;
            String sqlNextId =
                    "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                            "FROM mt.mt761_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT761_" + next;
                } else {
                    newId = "MT761_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT761_1";
            }

            /* ========== Column list (sesuai DDL table mt761_message) ========== */
            String columns = "form_id, message_type, " +
                    "_010_mf27_number, _011_mf27_total, " +
                    "_020_mf20_undertaking_number, " +
                    "_030_mf52a_issuer, _031_mf52a_party_identifier, _032_mf52a_identifier_code, " +
                    "_033_mf52d_party_identifier, _034_mf52d_name_address, " +
                    "_040_of77u_undertaking_terms_and_conditions, " +
                    "_050_of77l_requested_local_undertaking_terms_and_conditions";

            int paramCount = (int) Arrays.stream(columns.split(","))
                    .map(String::trim).filter(s -> !s.isEmpty()).count();

            String placeholders = String.join(",", Collections.nCopies(paramCount, "?"));
            String sql = "INSERT INTO mt.mt761_message(" + columns + ") VALUES (" + placeholders + ")";

            /* ========== Simpan ke database ========== */
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "761");

                ps.setString(idx++, f27Number);
                ps.setString(idx++, f27Total);
                ps.setString(idx++, f20);

                ps.setString(idx++, opt52a);
                ps.setString(idx++, f52aParty);
                ps.setString(idx++, f52aCode);

                ps.setString(idx++, f52dParty);
                ps.setString(idx++, f52dName);

                ps.setString(idx++, f77u);
                ps.setString(idx++, f77l);

                int setCount = idx - 1;
                if (setCount != paramCount) {
                    throw new IllegalStateException("Parameter mismatch: set=" + setCount + ", expected=" + paramCount);
                }

                ps.executeUpdate();
                out.println("<script>alert('MT761 data saved successfully!'); window.location='Category7/mt761.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT761: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
