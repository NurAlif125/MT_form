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

@WebServlet("/MT708Servlet")
public class MT708Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // === Ambil parameter dari mt708.jsp ===
            String mf27 = request.getParameter("_010_mf27_sequence_of_total");
            String mf20 = request.getParameter("_020_mf20_sender_reference");
            String mf21 = request.getParameter("_030_mf21_receiver_reference");
            String mf23 = request.getParameter("_040_mf23_issuing_bank_reference");
            String mf26e = request.getParameter("_050_mf26e_number_of_amendment");
            String mf30 = request.getParameter("_060_mf30_date_of_amendment");
            String of45b = request.getParameter("_070_of45b_description_of_goods_and_or_services");
            String of46b = request.getParameter("_080_of46b_documents_required");
            String of47b = request.getParameter("_090_of47b_additional_conditions");
            String of49m = request.getParameter("_100_of49m_special_payment_conditions_for_beneficiary");
            String of49n = request.getParameter("_110_of49n_special_payment_conditions_for_bank_only");

            // === Server-side mandatory check ===
            if (isEmpty(mf27) || isEmpty(mf20) || isEmpty(mf21) ||
                isEmpty(mf23) || isEmpty(mf26e) || isEmpty(mf30)) {
                out.println("<script>alert('Mandatory fields MT708 belum lengkap.'); window.history.back();</script>");
                return;
            }

            // === Generate custom form_id untuk MT708 ===
            String newId = null;
            String sqlNextId =
                "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                "FROM mt.mt708_message";
            try (Connection conn = DatabaseConnection.getConnection();
                 java.sql.Statement stmt = conn.createStatement();
                 java.sql.ResultSet rs = stmt.executeQuery(sqlNextId)) {
                if (rs.next()) {
                    int next = rs.getInt("next_id");
                    newId = "MT708_" + next;
                } else {
                    newId = "MT708_1";
                }
            } catch (Exception e) {
                e.printStackTrace(out);
                newId = "MT708_1"; 
            }

            // === Query Insert ===
            String sql = "INSERT INTO mt.mt708_message(" +
                    "form_id, message_type, " +
                    "_010_mf27_sequence_of_total, _020_mf20_sender_reference, _030_mf21_receiver_reference, _040_mf23_issuing_bank_reference, " +
                    "_050_mf26e_number_of_amendment, _060_mf30_date_of_amendment, " +
                    "_070_of45b_description_goods, _080_of46b_documents_required, _090_of47b_additional_conditions, " +
                    "_100_of49m_special_payment_beneficiary, _110_of49n_special_payment_bank" +
                    ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                int idx = 1;
                ps.setString(idx++, newId);
                ps.setString(idx++, "708");
                ps.setString(idx++, mf27);
                ps.setString(idx++, mf20);
                ps.setString(idx++, mf21);
                ps.setString(idx++, mf23);
                ps.setString(idx++, mf26e);
                ps.setString(idx++, mf30);
                ps.setString(idx++, of45b);
                ps.setString(idx++, of46b);
                ps.setString(idx++, of47b);
                ps.setString(idx++, of49m);
                ps.setString(idx++, of49n);

                ps.executeUpdate();
                out.println("<script>alert('MT700 data saved successfully!'); window.location='Category7/mt708.jsp';</script>");

            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Error simpan MT708: " + e.getMessage() + "'); window.history.back();</script>");
            }
        }
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
}
