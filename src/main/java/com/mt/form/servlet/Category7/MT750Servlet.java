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
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/MT750Servlet")
public class MT750Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            
            // ========== Retrieve Parameters from mt750.jsp ==========
            
            // Mandatory Fields
            String mf20SenderReference = request.getParameter("_010_mf20_sender_reference");
            String mf21RelatedReference = request.getParameter("_020_mf21_related_reference");
            
            String mf32bCurrency = request.getParameter("_030_mf32b_currency");
            String mf32bAmount = request.getParameter("_031_mf32b_amount");
            
            String mf77jDiscrepancies = request.getParameter("_100_mf77j_discrepancies");
            
            // Optional Fields
            String of33bCurrency = request.getParameter("_040_of33b_currency");
            String of33bAmount = request.getParameter("_041_of33b_amount");
            
            String of71dChargesDeducted = request.getParameter("_050_of71d_charges_to_be_deducted");
            String of73aChargesAdded = request.getParameter("_060_of73a_charges_to_be_added");
            
            String of34bCurrency = request.getParameter("_070_of34b_currency");
            String of34bAmount = request.getParameter("_071_of34b_amount");
            
            // Field 57a - Account With Bank (3 Options: A, B, D)
            String of57aAccountWithBank = request.getParameter("_080_of57a_account_with_bank");
            
            // Option A fields
            String of57aPartyIdentifierA = request.getParameter("_081_of57a_party_identifier");
            String of57aIdentifierCode = request.getParameter("_082_of57a_identifier_code");
            
            // Option B fields
            String of57aPartyIdentifierB = request.getParameter("_083_of57a_party_identifier");
            String of57aLocation = request.getParameter("_084_of57a_location");
            
            // Option D fields
            String of57aPartyIdentifierD = request.getParameter("_085_of57a_party_identifier");
            String of57aNameAddress = request.getParameter("_086_of57a_name_address");
            
            String of72zSenderToReceiverInfo = request.getParameter("_090_of72z_sender_to_receiver_information");
            
            // ========== Server-side Mandatory Validation ==========
            if (isEmpty(mf20SenderReference) || isEmpty(mf21RelatedReference) || 
                isEmpty(mf32bCurrency) || isEmpty(mf32bAmount) || isEmpty(mf77jDiscrepancies)) {
                out.println("<script>alert('Mandatory fields are incomplete. Please fill all required fields.'); window.history.back();</script>");
                return;
            }
            
            // ========== Network Rule C1 Validation ==========
            // If any of 33B, 71D, or 73A is present, then 34B must also be present
            boolean has33B = !isEmpty(of33bCurrency) || !isEmpty(of33bAmount);
            boolean has71D = !isEmpty(of71dChargesDeducted);
            boolean has73A = !isEmpty(of73aChargesAdded);
            boolean has34B = !isEmpty(of34bCurrency) && !isEmpty(of34bAmount);
            
            if ((has33B || has71D || has73A) && !has34B) {
                out.println("<script>alert('Rule C1 (Error C13): If fields 33B, 71D, or 73A are present, field 34B must also be present.'); window.history.back();</script>");
                return;
            }
            
            // ========== Network Rule C2 Validation ==========
            // Currency in 32B and 34B must be the same
            if (!isEmpty(of34bCurrency) && !mf32bCurrency.equals(of34bCurrency)) {
                out.println("<script>alert('Rule C2 (Error C02): Currency in field 34B must be the same as field 32B.'); window.history.back();</script>");
                return;
            }
            
            // ========== Field 57a Conditional Validation ==========
            if (!isEmpty(of57aAccountWithBank)) {
                if ("A".equals(of57aAccountWithBank) && isEmpty(of57aIdentifierCode)) {
                    out.println("<script>alert('Field 57a Option A requires Identifier Code (BIC).'); window.history.back();</script>");
                    return;
                }
                if ("B".equals(of57aAccountWithBank) && isEmpty(of57aLocation)) {
                    out.println("<script>alert('Field 57a Option B requires Location.'); window.history.back();</script>");
                    return;
                }
                if ("D".equals(of57aAccountWithBank) && isEmpty(of57aNameAddress)) {
                    out.println("<script>alert('Field 57a Option D requires Name & Address.'); window.history.back();</script>");
                    return;
                }
            }
            
            // ========== Generate Unique form_id ==========
            String newFormId = generateNextFormId();
            
            // ========== Prepare SQL Insert Statement ==========
            String sql = "INSERT INTO mt.mt750_message(" +
                    "form_id, message_type, " +
                    "_010_mf20_sender_reference, _020_mf21_related_reference, " +
                    "_030_mf32b_currency, _031_mf32b_amount, " +
                    "_040_of33b_currency, _041_of33b_amount, " +
                    "_050_of71d_charges_to_be_deducted, _060_of73a_charges_to_be_added, " +
                    "_070_of34b_currency, _071_of34b_amount, " +
                    "_080_of57a_account_with_bank, " +
                    "_081_of57a_party_identifier, _082_of57a_identifier_code, " +
                    "_083_of57a_party_identifier, _084_of57a_location, " +
                    "_085_of57a_party_identifier, _086_of57a_name_address, " +
                    "_090_of72z_sender_to_receiver_information, " +
                    "_100_mf77j_discrepancies" +
                    ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            // ========== Execute Insert ==========
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                
                int idx = 1;
                
                // form_id and message_type
                ps.setString(idx++, newFormId);
                ps.setString(idx++, "750");
                
                // Mandatory Fields
                ps.setString(idx++, mf20SenderReference);
                ps.setString(idx++, mf21RelatedReference);
                
                ps.setString(idx++, mf32bCurrency);
                ps.setBigDecimal(idx++, parseBigDecimal(mf32bAmount));
                
                // Optional Field 33B
                ps.setString(idx++, of33bCurrency);
                ps.setBigDecimal(idx++, parseBigDecimal(of33bAmount));
                
                // Optional Fields 71D, 73A
                ps.setString(idx++, of71dChargesDeducted);
                ps.setString(idx++, of73aChargesAdded);
                
                // Optional Field 34B
                ps.setString(idx++, of34bCurrency);
                ps.setBigDecimal(idx++, parseBigDecimal(of34bAmount));
                
                // Field 57a - Account With Bank
                ps.setString(idx++, of57aAccountWithBank);
                
                // Option A fields
                ps.setString(idx++, of57aPartyIdentifierA);
                ps.setString(idx++, of57aIdentifierCode);
                
                // Option B fields
                ps.setString(idx++, of57aPartyIdentifierB);
                ps.setString(idx++, of57aLocation);
                
                // Option D fields
                ps.setString(idx++, of57aPartyIdentifierD);
                ps.setString(idx++, of57aNameAddress);
                
                // Optional Field 72Z
                ps.setString(idx++, of72zSenderToReceiverInfo);
                
                // Mandatory Field 77J
                ps.setString(idx++, mf77jDiscrepancies);
                
                // Execute update
                int rowsInserted = ps.executeUpdate();
                
                if (rowsInserted > 0) {
                    out.println("<script>alert('MT750 data saved successfully! Form ID: " + newFormId + "'); window.location='" + request.getContextPath() + "/Category7/mt750.jsp';</script>");
                } else {
                    out.println("<script>alert('Failed to save MT750 data.'); window.history.back();</script>");
                }
                
            } catch (Exception e) {
                e.printStackTrace(out);
                out.println("<script>alert('Database error: " + escapeJavaScript(e.getMessage()) + "'); window.history.back();</script>");
            }
        }
    }
    
    /**
     * Generate next form_id with pattern MT750_X
     */
    private String generateNextFormId() {
        String sqlNextId = "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)), 0) + 1 AS next_id " +
                          "FROM mt.mt750_message";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sqlNextId)) {
            
            if (rs.next()) {
                int nextId = rs.getInt("next_id");
                return "MT750_" + nextId;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Fallback
        return "MT750_1";
    }
    
    /**
     * Parse amount string to BigDecimal
     * Handles comma as decimal separator (SWIFT format: 123,45 -> 123.45)
     */
    private BigDecimal parseBigDecimal(String amount) {
        if (isEmpty(amount)) {
            return null;
        }
        try {
            // Replace comma with dot for BigDecimal parsing
            String normalized = amount.replace(",", ".");
            return new BigDecimal(normalized);
        } catch (NumberFormatException e) {
            return null;
        }
    }
    
    /**
     * Check if string is null or empty
     */
    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
    
    /**
     * Escape JavaScript special characters for alert messages
     */
    private String escapeJavaScript(String s) {
        if (s == null) return "";
        return s.replace("\\", "\\\\")
                .replace("'", "\\'")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r");
    }
}