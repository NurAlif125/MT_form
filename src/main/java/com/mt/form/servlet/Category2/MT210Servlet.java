package com.mt.form.servlet.Category2;

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
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.*;

@WebServlet("/MT210Servlet")
public class MT210Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            /* ===== NON-REPETITIVE FIELDS ===== */
            String f20 = request.getParameter("_010_mf20_transactions_reference_number");
            String f25 = request.getParameter("_020_of25_account_identification");
            String f30 = request.getParameter("_030_mf30_value_date");

            /* ===== Mandatory check (non-repetitive) ===== */
            if (isEmpty(f20) || isEmpty(f30)) {
                out.println("<script>alert('Mandatory fields (Field 20, 30) belum lengkap.'); window.history.back();</script>");
                return;
            }

            /* ===== GET SET COUNT ===== */
            String setCountStr = request.getParameter("setCount");
            int setCount = 1;
            try {
                setCount = Integer.parseInt(setCountStr);
            } catch (Exception e) {
                setCount = 1;
            }

            // Rule C1: Max 10 sets
            if (setCount > 10) {
                out.println("<script>alert('Rule C1 Error: Maximum 10 repetitive sequences allowed.'); window.history.back();</script>");
                return;
            }

            /* ===== COLLECT REPETITIVE DATA ===== */
            List<MT210Detail> details = new ArrayList<>();
            
            for (int i = 0; i < setCount; i++) {
                String suffix = (i == 0) ? "" : "_loop" + i;
                
                MT210Detail detail = new MT210Detail();
                detail.sequenceNumber = i + 1;
                
                // Field 21 (Mandatory per sequence)
                detail.f21 = request.getParameter("_040_mf21_related_references" + suffix);
                
                // Field 32B (Mandatory per sequence)
                detail.f32bCurrency = request.getParameter("_050_mf32b_currency" + suffix);
                String amountStr = request.getParameter("_051_mf32b_amount" + suffix);
                
                // Field 50a
                detail.of50aOpt = request.getParameter("_060_of50a_ordering_customer" + suffix);
                detail.of50aNameAddr = request.getParameter("_061_of50a_name_address" + suffix);
                detail.of50cIdentifier = request.getParameter("_062_of50c_identifier_code" + suffix);
                detail.of50fPartyId = request.getParameter("_063_of50f_party_identifier" + suffix);
                detail.of50fNumber = request.getParameter("_064_of50f_number" + suffix);
                detail.of50fDetails = request.getParameter("_065_of50f_details" + suffix);
                
                // Field 52a
                detail.of52aOpt = request.getParameter("_070_of52A_ordering_institution" + suffix);
                detail.of52aPartyId = request.getParameter("_071_of52a_party_identifier" + suffix);
                detail.of52aIdentifier = request.getParameter("_072_of52a_identifier_code" + suffix);
                detail.of52dPartyId = request.getParameter("_073_of52d_party_identifier" + suffix);
                detail.of52dNameAddr = request.getParameter("_074_of52d_name_address" + suffix);
                
                // Field 56a
                detail.of56aOpt = request.getParameter("_080_of56a_intermediary" + suffix);
                detail.of56aPartyId = request.getParameter("_081_of56a_party_identifier" + suffix);
                detail.of56aIdentifier = request.getParameter("_082_of56a_identifier_code" + suffix);
                detail.of56dPartyId = request.getParameter("_083_of56d_party_identifier" + suffix);
                detail.of56dNameAddr = request.getParameter("_084_of56d_name_address" + suffix);
                
                // Validate mandatory fields per sequence
                if (isEmpty(detail.f21) || isEmpty(detail.f32bCurrency) || isEmpty(amountStr)) {
                    out.println("<script>alert('Set #" + (i+1) + " - Mandatory fields (21, 32B) belum lengkap.'); window.history.back();</script>");
                    return;
                }
                
                // Parse amount
                try {
                    String normalized = amountStr.replace(",", ".");
                    detail.f32bAmount = new BigDecimal(normalized);
                    if (detail.f32bAmount.compareTo(BigDecimal.ZERO) <= 0) {
                        out.println("<script>alert('Set #" + (i+1) + " - Amount must be > 0.'); window.history.back();</script>");
                        return;
                    }
                } catch (Exception ex) {
                    out.println("<script>alert('Set #" + (i+1) + " - Invalid amount format.'); window.history.back();</script>");
                    return;
                }
                
                // Rule C2: Either 50a OR 52a (not both)
                boolean has50a = !(isEmpty(detail.of50aNameAddr) && isEmpty(detail.of50cIdentifier) && isEmpty(detail.of50fPartyId));
                boolean has52a = !(isEmpty(detail.of52aPartyId) && isEmpty(detail.of52aIdentifier) && isEmpty(detail.of52dPartyId) && isEmpty(detail.of52dNameAddr));
                
                if (has50a && has52a) {
                    out.println("<script>alert('Set #" + (i+1) + " - Rule C2: Field 50a and 52a cannot both be present.'); window.history.back();</script>");
                    return;
                }
                if (!has50a && !has52a) {
                    out.println("<script>alert('Set #" + (i+1) + " - Rule C2: Either 50a or 52a must be present.'); window.history.back();</script>");
                    return;
                }
                
                details.add(detail);
            }
            
            // Rule C3: All currencies must be the same
            if (details.size() > 1) {
                String firstCurrency = details.get(0).f32bCurrency;
                for (MT210Detail d : details) {
                    if (!d.f32bCurrency.equalsIgnoreCase(firstCurrency)) {
                        out.println("<script>alert('Rule C3 Error: All currency codes must be the same.'); window.history.back();</script>");
                        return;
                    }
                }
            }

            /* ===== Generate form_id ===== */
            String newId = generateFormId();

            /* ===== Save to database ===== */
            Connection conn = null;
            try {
                conn = DatabaseConnection.getConnection();
                conn.setAutoCommit(false); // Start transaction
                
                // 1. Insert Header
                String sqlHeader = "INSERT INTO mt.mt210_message(" +
                        "form_id, message_type, " +
                        "_010_mf20_transactions_reference_number, " +
                        "_020_of25_account_identification, " +
                        "_030_mf30_value_date) " +
                        "VALUES (?, ?, ?, ?, ?)";
                
                try (PreparedStatement psHeader = conn.prepareStatement(sqlHeader)) {
                    psHeader.setString(1, newId);
                    psHeader.setString(2, "210");
                    psHeader.setString(3, f20);
                    psHeader.setString(4, f25);
                    psHeader.setString(5, f30);
                    psHeader.executeUpdate();
                }
                
                // 2. Insert Details (repetitive sequences)
                String sqlDetail = "INSERT INTO mt.mt210_message_detail(" +
                        "form_id, sequence_number, " +
                        "_040_mf21_related_references, " +
                        "_050_mf32b_currency, _051_mf32b_amount, " +
                        "_060_of50a_ordering_customer, _061_of50a_name_address, " +
                        "_062_of50c_identifier_code, _063_of50f_party_identifier, " +
                        "_064_of50f_number, _065_of50f_details, " +
                        "_070_of52a_ordering_institution, _071_of52a_party_identifier, " +
                        "_072_of52a_identifier_code, _073_of52d_party_identifier, " +
                        "_074_of52d_name_address, " +
                        "_080_of56a_intermediary, _081_of56a_party_identifier, " +
                        "_082_of56a_identifier_code, _083_of56d_party_identifier, " +
                        "_084_of56d_name_address) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                
                try (PreparedStatement psDetail = conn.prepareStatement(sqlDetail)) {
                    for (MT210Detail detail : details) {
                        psDetail.setString(1, newId);
                        psDetail.setInt(2, detail.sequenceNumber);
                        psDetail.setString(3, detail.f21);
                        psDetail.setString(4, detail.f32bCurrency);
                        psDetail.setBigDecimal(5, detail.f32bAmount);
                        psDetail.setString(6, detail.of50aOpt);
                        psDetail.setString(7, detail.of50aNameAddr);
                        psDetail.setString(8, detail.of50cIdentifier);
                        psDetail.setString(9, detail.of50fPartyId);
                        psDetail.setString(10, detail.of50fNumber);
                        psDetail.setString(11, detail.of50fDetails);
                        psDetail.setString(12, detail.of52aOpt);
                        psDetail.setString(13, detail.of52aPartyId);
                        psDetail.setString(14, detail.of52aIdentifier);
                        psDetail.setString(15, detail.of52dPartyId);
                        psDetail.setString(16, detail.of52dNameAddr);
                        psDetail.setString(17, detail.of56aOpt);
                        psDetail.setString(18, detail.of56aPartyId);
                        psDetail.setString(19, detail.of56aIdentifier);
                        psDetail.setString(20, detail.of56dPartyId);
                        psDetail.setString(21, detail.of56dNameAddr);
                        
                        psDetail.addBatch();
                    }
                    psDetail.executeBatch();
                }
                
                conn.commit(); // Commit transaction
                out.println("<script>alert('MT210 saved successfully! (" + setCount + " sequences)'); window.location='Category2/mt210.jsp';</script>");
                
            } catch (Exception e) {
                if (conn != null) {
                    try {
                        conn.rollback(); // Rollback on error
                    } catch (Exception ex) {
                        ex.printStackTrace(out);
                    }
                }
                e.printStackTrace(out);
                out.println("<script>alert('Error saving MT210: " + e.getMessage() + "'); window.history.back();</script>");
            } finally {
                if (conn != null) {
                    try {
                        conn.setAutoCommit(true);
                        conn.close();
                    } catch (Exception ex) {
                        ex.printStackTrace(out);
                    }
                }
            }
        }
    }

    private String generateFormId() {
        String newId = "MT210_1";
        String sqlNextId = "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)),0)+1 AS next_id " +
                "FROM mt.mt210_message";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sqlNextId)) {
            if (rs.next()) {
                int next = rs.getInt("next_id");
                newId = "MT210_" + next;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newId;
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }

    /* ===== INNER CLASS FOR DETAIL DATA ===== */
    private static class MT210Detail {
        int sequenceNumber;
        String f21;
        String f32bCurrency;
        BigDecimal f32bAmount;
        String of50aOpt, of50aNameAddr, of50cIdentifier, of50fPartyId, of50fNumber, of50fDetails;
        String of52aOpt, of52aPartyId, of52aIdentifier, of52dPartyId, of52dNameAddr;
        String of56aOpt, of56aPartyId, of56aIdentifier, of56dPartyId, of56dNameAddr;
    }
}