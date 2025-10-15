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
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet("/MT701Servlet")
public class MT701Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(MT701Servlet.class.getName());

    // === Database Configuration ===
    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/mt_forms";
    private static final String JDBC_USER = "postgres";
    private static final String JDBC_PASS = "123";
    
    // === Constants ===
    private static final String MESSAGE_TYPE = "701";
    private static final String FORM_ID_PREFIX = "MT701";

    /**
     * Handles POST requests for saving MT 701 data
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            
            // === Load PostgreSQL Driver ===
            try {
                Class.forName("org.postgresql.Driver");
                LOGGER.info("PostgreSQL Driver loaded successfully");
            } catch (ClassNotFoundException e) {
                LOGGER.log(Level.SEVERE, "PostgreSQL Driver not found", e);
                out.println("<script>alert('PostgreSQL Driver not found: " + 
                           escapeJavaScript(e.getMessage()) + 
                           "'); window.history.back();</script>");
                return;
            }

            // === Extract Parameters from mt701.jsp ===
            MT701Data data = extractMT701Data(request);

            // === Server-side Validation ===
            String validationError = validateMT701Data(data);
            if (validationError != null) {
                LOGGER.warning("Validation failed: " + validationError);
                out.println("<script>alert('" + escapeJavaScript(validationError) + 
                           "'); window.history.back();</script>");
                return;
            }

            // === Generate Unique Form ID ===
            String formId = generateFormId();
            if (formId == null) {
                LOGGER.severe("Failed to generate form ID");
                out.println("<script>alert('Error generating form ID'); window.history.back();</script>");
                return;
            }
            
            data.formId = formId;
            LOGGER.info("Generated Form ID: " + formId);

            // === Save to Database ===
            boolean success = saveMT701Data(data);
            
            if (success) {
                LOGGER.info("MT 701 data saved successfully. Form ID: " + formId);
                out.println("<script>alert('MT 701 data saved successfully!\\nForm ID: " + 
                           formId + "'); window.location='Category7/mt701.jsp';</script>");
            } else {
                LOGGER.severe("Failed to save MT 701 data");
                out.println("<script>alert('Error saving MT 701 data. Please try again.'); " +
                           "window.history.back();</script>");
            }

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error in MT701Servlet", e);
            throw new ServletException("Error processing MT 701 request", e);
        }
    }

    /**
     * Extracts MT 701 data from request parameters
     * Parameter names must match exactly with mt701.jsp field IDs
     */
    private MT701Data extractMT701Data(HttpServletRequest request) {
        MT701Data data = new MT701Data();
        
        // === MANDATORY FIELDS ===
        
        // MF27: Sequence of Total (split into Number and Total)
        data.mf27Number = getParameter(request, "_010_mf27_number");
        data.mf27Total = getParameter(request, "_011_mf27_total");
        
        // MF20: Documentary Credit Number
        data.mf20DocumentaryCreditNumber = getParameter(request, "_020_mf20_documentary_credit_number");
        
        // === OPTIONAL FIELDS ===
        
        // OF45A: Description of Goods and/or Services
        data.of45aDescriptionOfGoodsAndOrServices = getParameter(request, "_030_of45a_description_of_goods_and_or_services");
        
        // OF46A: Documents Required
        data.of46aDocumentsRequired = getParameter(request, "_040_of46a_documents_required");
        
        // OF47A: Additional Conditions
        data.of47aAdditionalConditions = getParameter(request, "_050_of47a_additional_conditions");
        
        // OF49G: Special Payment Conditions for Beneficiary
        data.of49gSpecialPaymentConditionsForBeneficiary = getParameter(request, "_060_of49g_special_payment_conditions_for_beneficiary");
        
        // OF49H: Special Payment Conditions for Bank Only
        data.of49hSpecialPaymentConditionsForBankOnly = getParameter(request, "_070_of49h_special_payment_conditions_for_bank_only");
        
        return data;
    }

    /**
     * Validates MT 701 data according to SWIFT standards
     * 
     * Validation Rules:
     * - Field 27: Number and Total must be 2-8, Number <= Total (T75)
     * - Field 20: Max 16 chars, cannot start/end with '/', no '//' (T26)
     * - Narrative fields: Max 6500 chars, 100 lines, 65 chars per line
     */
    private String validateMT701Data(MT701Data data) {
        
        // === Mandatory Field Checks ===
        if (isEmpty(data.mf27Number)) {
            return "MF27 Number is required";
        }
        
        if (isEmpty(data.mf27Total)) {
            return "MF27 Total is required";
        }
        
        if (isEmpty(data.mf20DocumentaryCreditNumber)) {
            return "MF20 Documentary Credit Number is required";
        }
        
        // === Field 27 Validation (T75) ===
        try {
            int number = Integer.parseInt(data.mf27Number);
            int total = Integer.parseInt(data.mf27Total);
            
            if (number < 2 || number > 8) {
                return "MF27 Number must be between 2-8 (Error T75)";
            }
            
            if (total < 2 || total > 8) {
                return "MF27 Total must be between 2-8 (Error T75)";
            }
            
            if (number > total) {
                return "MF27 Number cannot be greater than Total (Error T75)";
            }
            
        } catch (NumberFormatException e) {
            return "MF27 Number and Total must be numeric";
        }
        
        // === Field 20 Validation (T26) ===
        String creditNum = data.mf20DocumentaryCreditNumber;
        
        if (creditNum.length() > 16) {
            return "MF20 Documentary Credit Number maximum 16 characters";
        }
        
        if (creditNum.startsWith("/")) {
            return "MF20 cannot start with '/' (Error T26)";
        }
        
        if (creditNum.endsWith("/")) {
            return "MF20 cannot end with '/' (Error T26)";
        }
        
        if (creditNum.contains("//")) {
            return "MF20 cannot contain '//' (Error T26)";
        }
        
        // === Optional Field Validations ===
        String[] narrativeFields = {
            data.of45aDescriptionOfGoodsAndOrServices,
            data.of46aDocumentsRequired,
            data.of47aAdditionalConditions,
            data.of49gSpecialPaymentConditionsForBeneficiary,
            data.of49hSpecialPaymentConditionsForBankOnly
        };
        
        String[] fieldNames = {
            "OF45A Description of Goods",
            "OF46A Documents Required",
            "OF47A Additional Conditions",
            "OF49G Special Payment (Beneficiary)",
            "OF49H Special Payment (Bank)"
        };
        
        for (int i = 0; i < narrativeFields.length; i++) {
            String field = narrativeFields[i];
            if (!isEmpty(field)) {
                // Check max length (6500 chars)
                if (field.length() > 6500) {
                    return fieldNames[i] + " exceeds 6500 characters";
                }
                
                // Check max lines (100 lines)
                String[] lines = field.split("\n");
                if (lines.length > 100) {
                    return fieldNames[i] + " exceeds 100 lines";
                }
                
                // Check max chars per line (65 chars)
                for (int j = 0; j < lines.length; j++) {
                    if (lines[j].length() > 65) {
                        return fieldNames[i] + " line " + (j + 1) + " exceeds 65 characters";
                    }
                }
            }
        }
        
        // All validations passed
        return null;
    }

    /**
     * Generates unique Form ID for MT 701
     * Format: MT701_1, MT701_2, MT701_3, etc.
     */
    private String generateFormId() {
        String sql = "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)), 0) + 1 AS next_id " +
                     "FROM mt.mt701_message";
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                int nextId = rs.getInt("next_id");
                return FORM_ID_PREFIX + "_" + nextId;
            }
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error generating form ID", e);
        }
        
        // Fallback to MT701_1 if query fails
        return FORM_ID_PREFIX + "_1";
    }

    /**
     * Saves MT 701 data to database
     * Table: mt.mt701_message
     */
    private boolean saveMT701Data(MT701Data data) {
        
        String sql = "INSERT INTO mt.mt701_message (" +
                "form_id, " +
                "message_type, " +
                "mf27_number, " +
                "mf27_total, " +
                "mf20_documentary_credit_number, " +
                "of45a_description_of_goods_and_or_services, " +
                "of46a_documents_required, " +
                "of47a_additional_conditions, " +
                "of49g_special_payment_conditions_for_beneficiary, " +
                "of49h_special_payment_conditions_for_bank_only, " +
                "created_at, " +
                "updated_at" +
                ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            Timestamp now = new Timestamp(System.currentTimeMillis());
            
            int idx = 1;
            ps.setString(idx++, data.formId);
            ps.setString(idx++, MESSAGE_TYPE);
            ps.setString(idx++, data.mf27Number);
            ps.setString(idx++, data.mf27Total);
            ps.setString(idx++, data.mf20DocumentaryCreditNumber);
            ps.setString(idx++, nullIfEmpty(data.of45aDescriptionOfGoodsAndOrServices));
            ps.setString(idx++, nullIfEmpty(data.of46aDocumentsRequired));
            ps.setString(idx++, nullIfEmpty(data.of47aAdditionalConditions));
            ps.setString(idx++, nullIfEmpty(data.of49gSpecialPaymentConditionsForBeneficiary));
            ps.setString(idx++, nullIfEmpty(data.of49hSpecialPaymentConditionsForBankOnly));
            ps.setTimestamp(idx++, now);
            ps.setTimestamp(idx++, now);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error saving MT 701 data to database", e);
            return false;
        }
    }

    // === Helper Methods ===

    /**
     * Gets request parameter and trims whitespace
     */
    private String getParameter(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        return (value != null) ? value.trim() : null;
    }

    /**
     * Checks if string is null or empty
     */
    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }

    /**
     * Returns null if string is empty, otherwise returns the string
     * Useful for optional database fields
     */
    private String nullIfEmpty(String s) {
        return isEmpty(s) ? null : s;
    }

    /**
     * Escapes JavaScript special characters in strings for safe alert messages
     */
    private String escapeJavaScript(String s) {
        if (s == null) return "";
        return s.replace("\\", "\\\\")
                .replace("'", "\\'")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r");
    }

    /**
     * Data Transfer Object for MT 701 fields
     */
    private static class MT701Data {
        String formId;
        
        // Mandatory Fields
        String mf27Number;
        String mf27Total;
        String mf20DocumentaryCreditNumber;
        
        // Optional Fields
        String of45aDescriptionOfGoodsAndOrServices;
        String of46aDocumentsRequired;
        String of47aAdditionalConditions;
        String of49gSpecialPaymentConditionsForBeneficiary;
        String of49hSpecialPaymentConditionsForBankOnly;
    }
}
