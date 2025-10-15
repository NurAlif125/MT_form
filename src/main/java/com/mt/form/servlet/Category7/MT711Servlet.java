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
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/MT711Servlet")
public class MT711Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // === Database Configuration ===
    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/mt_forms";
    private static final String JDBC_USER = "postgres";
    private static final String JDBC_PASS = "123";
    
    // === Constants ===
    private static final String MESSAGE_TYPE = "711";
    private static final String FORM_ID_PREFIX = "MT711_";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            
            // === Load PostgreSQL Driver ===
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException e) {
                out.println("<script>alert('PostgreSQL Driver not found: " + e.getMessage() + "'); window.history.back();</script>");
                return;
            }

            // === Extract Parameters from mt711.jsp ===
            
            // MANDATORY FIELDS
            String mf27Number = request.getParameter("_010_mf27_number");
            String mf27Total = request.getParameter("_011_mf27_total");
            String mf20SenderReference = request.getParameter("_020_mf20_sender_reference");
            String mf21DocumentaryCreditNumber = request.getParameter("_030_mf21_documentary_credit_number");
            
            // OPTIONAL FIELDS
            String of45aDescriptionOfGoods = request.getParameter("_040_of45a_description_of_goods_and_or_services");
            String of46aDocumentsRequired = request.getParameter("_050_of46a_documents_required");
            String of47aAdditionalConditions = request.getParameter("_060_of47a_additional_conditions");
            String of49gSpecialPaymentBeneficiary = request.getParameter("_070_of49g_special_payment_conditions_for_beneficiary");
            String of49hSpecialPaymentBank = request.getParameter("_080_of49h_special_payment_conditions_for_bank_only");

            // === Mandatory Field Validation ===
            if (isEmpty(mf27Number)) {
                out.println("<script>alert('Error: MF27 Number is mandatory!'); window.history.back();</script>");
                return;
            }
            
            if (isEmpty(mf27Total)) {
                out.println("<script>alert('Error: MF27 Total is mandatory!'); window.history.back();</script>");
                return;
            }
            
            if (isEmpty(mf20SenderReference)) {
                out.println("<script>alert('Error: MF20 Sender\\'s Reference is mandatory!'); window.history.back();</script>");
                return;
            }
            
            if (isEmpty(mf21DocumentaryCreditNumber)) {
                out.println("<script>alert('Error: MF21 Documentary Credit Number is mandatory!'); window.history.back();</script>");
                return;
            }

            // === Business Rule Validation ===
            
            // Validate Field 27: Number and Total range (2-8)
            try {
                int number = Integer.parseInt(mf27Number.trim());
                int total = Integer.parseInt(mf27Total.trim());
                
                if (number < 2 || number > 8) {
                    out.println("<script>alert('Error T75: Number must be between 2-8!'); window.history.back();</script>");
                    return;
                }
                
                if (total < 2 || total > 8) {
                    out.println("<script>alert('Error T75: Total must be between 2-8!'); window.history.back();</script>");
                    return;
                }
                
                if (number > total) {
                    out.println("<script>alert('Error T75: Number cannot be greater than Total!'); window.history.back();</script>");
                    return;
                }
            } catch (NumberFormatException e) {
                out.println("<script>alert('Error: MF27 Number and Total must be numeric!'); window.history.back();</script>");
                return;
            }
            
            // Validate Field 20: T26 - No start/end slash, no double slash
            if (!mf20SenderReference.trim().isEmpty()) {
                if (mf20SenderReference.startsWith("/") || mf20SenderReference.endsWith("/")) {
                    out.println("<script>alert('Error T26: Sender\\'s Reference cannot start or end with \"/\"!'); window.history.back();</script>");
                    return;
                }
                if (mf20SenderReference.contains("//")) {
                    out.println("<script>alert('Error T26: Sender\\'s Reference cannot contain \"//\"!'); window.history.back();</script>");
                    return;
                }
            }
            
            // Validate Field 21: T26 - No start/end slash, no double slash
            if (!mf21DocumentaryCreditNumber.trim().isEmpty()) {
                if (mf21DocumentaryCreditNumber.startsWith("/") || mf21DocumentaryCreditNumber.endsWith("/")) {
                    out.println("<script>alert('Error T26: Documentary Credit Number cannot start or end with \"/\"!'); window.history.back();</script>");
                    return;
                }
                if (mf21DocumentaryCreditNumber.contains("//")) {
                    out.println("<script>alert('Error T26: Documentary Credit Number cannot contain \"//\"!'); window.history.back();</script>");
                    return;
                }
            }
            
            // Validate textarea fields: max 6500 chars, 100 lines, 65 chars per line
            if (!validateTextareaField(of45aDescriptionOfGoods, "OF45A Description of Goods", out)) return;
            if (!validateTextareaField(of46aDocumentsRequired, "OF46A Documents Required", out)) return;
            if (!validateTextareaField(of47aAdditionalConditions, "OF47A Additional Conditions", out)) return;
            if (!validateTextareaField(of49gSpecialPaymentBeneficiary, "OF49G Special Payment (Beneficiary)", out)) return;
            if (!validateTextareaField(of49hSpecialPaymentBank, "OF49H Special Payment (Bank)", out)) return;

            // === Combine Field 27 Number/Total into single string format (n/n) ===
            String mf27SequenceOfTotal = mf27Number.trim() + "/" + mf27Total.trim();

            // === Generate Custom form_id (MT711_1, MT711_2, ...) ===
            String newFormId = generateNextFormId();

            // === Insert into Database ===
            String sql = "INSERT INTO mt.mt711_message(" +
                    "form_id, message_type, " +
                    "mf27_sequence_of_total, " +
                    "mf20_sender_reference, " +
                    "mf21_documentary_credit_number, " +
                    "of45a_description, " +
                    "of46a_documents, " +
                    "of47a_additional_conditions, " +
                    "of49g_special_payment_beneficiary, " +
                    "of49h_special_payment_bank" +
                    ") VALUES (?,?,?,?,?,?,?,?,?,?)";

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newFormId);
                ps.setString(idx++, MESSAGE_TYPE);
                ps.setString(idx++, mf27SequenceOfTotal);
                ps.setString(idx++, mf20SenderReference);
                ps.setString(idx++, mf21DocumentaryCreditNumber);
                ps.setString(idx++, of45aDescriptionOfGoods);
                ps.setString(idx++, of46aDocumentsRequired);
                ps.setString(idx++, of47aAdditionalConditions);
                ps.setString(idx++, of49gSpecialPaymentBeneficiary);
                ps.setString(idx++, of49hSpecialPaymentBank);

                int rowsAffected = ps.executeUpdate();
                
                if (rowsAffected > 0) {
                    out.println("<script>alert('MT711 data saved successfully! Form ID: " + newFormId + "'); window.location='Category7/mt711.jsp';</script>");
                } else {
                    out.println("<script>alert('Error: Failed to save MT711 data!'); window.history.back();</script>");
                }

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script>alert('Database Error: " + escapeJavaScript(e.getMessage()) + "'); window.history.back();</script>");
            }
        }
    }

    /**
     * Generate next sequential form_id (MT711_1, MT711_2, ...)
     */
    private String generateNextFormId() {
        String newFormId = FORM_ID_PREFIX + "1"; // Default fallback
        
        String sql = "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)), 0) + 1 AS next_id " +
                     "FROM mt.mt711_message " +
                     "WHERE form_id LIKE '" + FORM_ID_PREFIX + "%'";
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                int nextId = rs.getInt("next_id");
                newFormId = FORM_ID_PREFIX + nextId;
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Return default if error occurs
        }
        
        return newFormId;
    }

    /**
     * Validate textarea field constraints
     * - Max 6500 characters
     * - Max 100 lines
     * - Max 65 characters per line
     */
    private boolean validateTextareaField(String value, String fieldName, PrintWriter out) {
        if (value == null || value.trim().isEmpty()) {
            return true; // Optional fields can be empty
        }
        
        // Check total character count
        if (value.length() > 6500) {
            out.println("<script>alert('Error: " + fieldName + " exceeds maximum 6500 characters!'); window.history.back();</script>");
            return false;
        }
        
        // Check line count and line length
        String[] lines = value.split("\n");
        
        if (lines.length > 100) {
            out.println("<script>alert('Error: " + fieldName + " exceeds maximum 100 lines!'); window.history.back();</script>");
            return false;
        }
        
        for (int i = 0; i < lines.length; i++) {
            if (lines[i].length() > 65) {
                out.println("<script>alert('Error: " + fieldName + " Line " + (i + 1) + " exceeds 65 characters!'); window.history.back();</script>");
                return false;
            }
        }
        
        return true;
    }

    /**
     * Check if string is null or empty
     */
    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }

    /**
     * Escape special characters for JavaScript alert
     */
    private String escapeJavaScript(String str) {
        if (str == null) return "";
        return str.replace("'", "\\'")
                  .replace("\"", "\\\"")
                  .replace("\n", "\\n")
                  .replace("\r", "\\r");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<script>alert('MT711Servlet only accepts POST requests!'); window.location='Category7/mt711.jsp';</script>");
        }
    }
}