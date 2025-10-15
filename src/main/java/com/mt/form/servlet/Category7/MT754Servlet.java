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
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet("/MT754Servlet")
public class MT754Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(MT754Servlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            /* ========== EXTRACT PARAMETERS FROM mt754.jsp ========== */
            
            // MANDATORY FIELDS (MF)
            String mf20SenderReference = getParam(request, "_010_mf20_sender_reference");
            String mf21RelatedReference = getParam(request, "_020_mf21_related_reference");
            
            // Field 32a - Principal Amount (MANDATORY with options)
            String opt32a = getParam(request, "_030_mf32a_principal_amount_paid_accepted_negotiated");
            String mf32aDate = getParam(request, "_031_mf32a_date");           // Option A only
            String mf32aCurrencyA = getParam(request, "_032_mf32a_currency");  // Option A
            String mf32aAmountA = getParam(request, "_033_mf32a_amount");      // Option A
            String mf32aCurrencyB = getParam(request, "_034_mf32a_currency");  // Option B
            String mf32aAmountB = getParam(request, "_035_mf32a_amount");      // Option B
            
            // OPTIONAL FIELDS (OF)
            
            // Field 33B - Additional Amount
            String of33bCurrency = getParam(request, "_040_of33b_currency");
            String of33bAmount = getParam(request, "_041_of33b_amount");
            
            // Field 71D - Charges Deducted
            String of71dChargesDeducted = getParam(request, "_050_of71d_charges_deducted");
            
            // Field 73A - Charges Added
            String of73aChargesAdded = getParam(request, "_060_of73a_charges_added");
            
            // Field 34a - Total Amount Claimed
            String opt34a = getParam(request, "_070_of34a_total_amount_claimed");
            String of34aDate = getParam(request, "_071_of34a_date");           // Option A (optional date)
            String of34aCurrencyA = getParam(request, "_072_of34a_currency");  // Option A
            String of34aAmountA = getParam(request, "_073_of34a_amount");      // Option A
            String of34aCurrencyB = getParam(request, "_074_of34a_currency");  // Option B
            String of34aAmountB = getParam(request, "_075_of34a_amount");      // Option B
            
            // Field 53a - Reimbursing Bank
            String opt53a = getParam(request, "_080_of53a_reimbursing_bank");
            String of53aPartyIdA = getParam(request, "_081_of53a_party_identifier");    // Option A
            String of53aIdentifierA = getParam(request, "_082_of53a_identifier_code");  // Option A
            String of53aPartyIdB = getParam(request, "_083_of53a_party_identifier");    // Option B
            String of53aLocationB = getParam(request, "_084_of53a_location");           // Option B
            String of53aPartyIdD = getParam(request, "_085_of53a_party_identifier");    // Option D
            String of53aNameAddrD = getParam(request, "_086_of53a_name_address");       // Option D
            
            // Field 57a - Account With Bank
            String opt57a = getParam(request, "_090_of57a_account_with_bank");
            String of57aPartyIdA = getParam(request, "_091_of57a_party_identifier");    // Option A
            String of57aIdentifierA = getParam(request, "_092_of57a_identifier_code");  // Option A
            String of57aPartyIdB = getParam(request, "_093_of57a_party_identifier");    // Option B
            String of57aLocationB = getParam(request, "_094_of57a_location");           // Option B
            String of57aPartyIdD = getParam(request, "_095_of57a_party_identifier");    // Option D
            String of57aNameAddrD = getParam(request, "_096_of57a_name_address");       // Option D
            
            // Field 58a - Beneficiary Bank
            String opt58a = getParam(request, "_100_of58a_beneficiary_bank");
            String of58aPartyIdA = getParam(request, "_101_of58a_party_identifier");    // Option A
            String of58aIdentifierA = getParam(request, "_102_of58a_identifier_code");  // Option A
            String of58aPartyIdD = getParam(request, "_103_of58a_party_identifier");    // Option D
            String of58aNameAddrD = getParam(request, "_104_of58a_name_address");       // Option D
            
            // Field 72Z / 77 - Narrative fields
            String of72zSenderToReceiver = getParam(request, "_110_of72z_sender_to_receiver_information");
            String of77Narrative = getParam(request, "_120_of77_narrative");

            /* ========== SERVER-SIDE VALIDATION ========== */
            
            // Validate mandatory fields
            if (isEmpty(mf20SenderReference)) {
                sendError(out, "Field 20 (Sender's Reference) is mandatory.");
                return;
            }
            
            if (isEmpty(mf21RelatedReference)) {
                sendError(out, "Field 21 (Related Reference) is mandatory.");
                return;
            }
            
            if (isEmpty(opt32a)) {
                sendError(out, "Field 32a option must be selected.");
                return;
            }
            
            // Validate Field 32a based on option
            String finalCurrency32a = null;
            String finalAmount32a = null;
            
            if ("A".equals(opt32a)) {
                if (isEmpty(mf32aDate)) {
                    sendError(out, "Field 32a Date is required for Option A.");
                    return;
                }
                if (isEmpty(mf32aCurrencyA) || isEmpty(mf32aAmountA)) {
                    sendError(out, "Field 32a Currency and Amount are required for Option A.");
                    return;
                }
                finalCurrency32a = mf32aCurrencyA;
                finalAmount32a = mf32aAmountA;
            } else if ("B".equals(opt32a)) {
                if (isEmpty(mf32aCurrencyB) || isEmpty(mf32aAmountB)) {
                    sendError(out, "Field 32a Currency and Amount are required for Option B.");
                    return;
                }
                finalCurrency32a = mf32aCurrencyB;
                finalAmount32a = mf32aAmountB;
            }
            
            // Rule C1: Either field 72Z or 77, but not both
            if (!isEmpty(of72zSenderToReceiver) && !isEmpty(of77Narrative)) {
                sendError(out, "Error C19: Either field 72Z or 77 may be present, but not both.");
                return;
            }
            
            // Rule C2: Either field 53a or 57a, but not both
            if (!isEmpty(opt53a) && !isEmpty(opt57a)) {
                sendError(out, "Error C14: Either field 53a or 57a may be present, but not both.");
                return;
            }
            
            // Rule C3: Currency in 32a and 34a must be same
            if (!isEmpty(opt34a)) {
                String finalCurrency34a = null;
                if ("A".equals(opt34a)) {
                    finalCurrency34a = of34aCurrencyA;
                } else if ("B".equals(opt34a)) {
                    finalCurrency34a = of34aCurrencyB;
                }
                
                if (finalCurrency32a != null && finalCurrency34a != null 
                        && !finalCurrency32a.equals(finalCurrency34a)) {
                    sendError(out, "Error C02: Currency code in field 32a and 34a must be the same.");
                    return;
                }
            }

            /* ========== GENERATE UNIQUE form_id ========== */
            String newFormId = generateFormId();
            LOGGER.log(Level.INFO, "Generated form_id: {0}", newFormId);

            /* ========== DATABASE INSERTION ========== */
            Connection conn = null;
            PreparedStatement ps = null;
            
            try {
                conn = DatabaseConnection.getConnection();
                conn.setAutoCommit(false); // Start transaction
                
                String sql = buildInsertSQL();
                ps = conn.prepareStatement(sql);
                
                // Set parameters
                int idx = 1;
                
                // Basic fields
                ps.setString(idx++, newFormId);
                ps.setString(idx++, "754");
                
                // Field 20 & 21
                ps.setString(idx++, mf20SenderReference);
                ps.setString(idx++, mf21RelatedReference);
                
                // Field 32a
                ps.setString(idx++, opt32a);
                setStringOrNull(ps, idx++, "A".equals(opt32a) ? mf32aDate : null);
                setStringOrNull(ps, idx++, "A".equals(opt32a) ? mf32aCurrencyA : null);
                setBigDecimalOrNull(ps, idx++, "A".equals(opt32a) ? mf32aAmountA : null);
                setStringOrNull(ps, idx++, "B".equals(opt32a) ? mf32aCurrencyB : null);
                setBigDecimalOrNull(ps, idx++, "B".equals(opt32a) ? mf32aAmountB : null);
                
                // Field 33B
                setStringOrNull(ps, idx++, of33bCurrency);
                setBigDecimalOrNull(ps, idx++, of33bAmount);
                
                // Field 71D & 73A
                setStringOrNull(ps, idx++, of71dChargesDeducted);
                setStringOrNull(ps, idx++, of73aChargesAdded);
                
                // Field 34a
                setStringOrNull(ps, idx++, opt34a);
                setStringOrNull(ps, idx++, "A".equals(opt34a) ? of34aDate : null);
                setStringOrNull(ps, idx++, "A".equals(opt34a) ? of34aCurrencyA : null);
                setBigDecimalOrNull(ps, idx++, "A".equals(opt34a) ? of34aAmountA : null);
                setStringOrNull(ps, idx++, "B".equals(opt34a) ? of34aCurrencyB : null);
                setBigDecimalOrNull(ps, idx++, "B".equals(opt34a) ? of34aAmountB : null);
                
                // Field 53a
                setStringOrNull(ps, idx++, opt53a);
                setStringOrNull(ps, idx++, "A".equals(opt53a) ? of53aPartyIdA : null);
                setStringOrNull(ps, idx++, "A".equals(opt53a) ? of53aIdentifierA : null);
                setStringOrNull(ps, idx++, "B".equals(opt53a) ? of53aPartyIdB : null);
                setStringOrNull(ps, idx++, "B".equals(opt53a) ? of53aLocationB : null);
                setStringOrNull(ps, idx++, "D".equals(opt53a) ? of53aPartyIdD : null);
                setStringOrNull(ps, idx++, "D".equals(opt53a) ? of53aNameAddrD : null);
                
                // Field 57a
                setStringOrNull(ps, idx++, opt57a);
                setStringOrNull(ps, idx++, "A".equals(opt57a) ? of57aPartyIdA : null);
                setStringOrNull(ps, idx++, "A".equals(opt57a) ? of57aIdentifierA : null);
                setStringOrNull(ps, idx++, "B".equals(opt57a) ? of57aPartyIdB : null);
                setStringOrNull(ps, idx++, "B".equals(opt57a) ? of57aLocationB : null);
                setStringOrNull(ps, idx++, "D".equals(opt57a) ? of57aPartyIdD : null);
                setStringOrNull(ps, idx++, "D".equals(opt57a) ? of57aNameAddrD : null);
                
                // Field 58a
                setStringOrNull(ps, idx++, opt58a);
                setStringOrNull(ps, idx++, "A".equals(opt58a) ? of58aPartyIdA : null);
                setStringOrNull(ps, idx++, "A".equals(opt58a) ? of58aIdentifierA : null);
                setStringOrNull(ps, idx++, "D".equals(opt58a) ? of58aPartyIdD : null);
                setStringOrNull(ps, idx++, "D".equals(opt58a) ? of58aNameAddrD : null);
                
                // Field 72Z & 77
                setStringOrNull(ps, idx++, of72zSenderToReceiver);
                setStringOrNull(ps, idx++, of77Narrative);
                
                // Execute insert
                int rowsAffected = ps.executeUpdate();
                
                if (rowsAffected > 0) {
                    conn.commit();
                    LOGGER.log(Level.INFO, "MT754 data saved successfully with form_id: {0}", newFormId);
                    sendSuccess(out, "MT754 data saved successfully! Form ID: " + newFormId);
                } else {
                    conn.rollback();
                    LOGGER.log(Level.WARNING, "No rows affected during insert");
                    sendError(out, "Failed to save MT754 data. No rows affected.");
                }
                
            } catch (Exception e) {
                if (conn != null) {
                    try {
                        conn.rollback();
                        LOGGER.log(Level.SEVERE, "Transaction rolled back due to error", e);
                    } catch (Exception rollbackEx) {
                        LOGGER.log(Level.SEVERE, "Error during rollback", rollbackEx);
                    }
                }
                LOGGER.log(Level.SEVERE, "Error saving MT754 data", e);
                sendError(out, "Error saving MT754: " + e.getMessage());
                
            } finally {
                closeResources(ps, conn);
            }
        }
    }

    /* ========== HELPER METHODS ========== */
    
    /**
     * Get parameter from request, return null if empty
     */
    private String getParam(HttpServletRequest request, String paramName) {
        String value = request.getParameter(paramName);
        return (value != null && !value.trim().isEmpty()) ? value.trim() : null;
    }
    
    /**
     * Check if string is null or empty
     */
    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }
    
    /**
     * Set string parameter or NULL in PreparedStatement
     */
    private void setStringOrNull(PreparedStatement ps, int index, String value) throws Exception {
        if (isEmpty(value)) {
            ps.setNull(index, java.sql.Types.VARCHAR);
        } else {
            ps.setString(index, value);
        }
    }
    
    /**
     * Set BigDecimal parameter or NULL in PreparedStatement
     * Converts comma-separated format (e.g., "1000,50") to decimal
     */
    private void setBigDecimalOrNull(PreparedStatement ps, int index, String value) throws Exception {
        if (isEmpty(value)) {
            ps.setNull(index, java.sql.Types.NUMERIC);
        } else {
            // Convert comma to dot for BigDecimal
            String normalized = value.replace(",", ".");
            ps.setBigDecimal(index, new BigDecimal(normalized));
        }
    }
    
    /**
     * Generate unique form_id
     */
    private String generateFormId() {
        String formId = "MT754_1";
        String sql = "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)), 0) + 1 AS next_id " +
                     "FROM mt.mt754_message";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                int nextId = rs.getInt("next_id");
                formId = "MT754_" + nextId;
            }
        } catch (Exception e) {
            LOGGER.log(Level.WARNING, "Error generating form_id, using default", e);
        }
        
        return formId;
    }
    
    /**
     * Build INSERT SQL statement with all fields
     */
    private String buildInsertSQL() {
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO mt.mt754_message (");
        sql.append("form_id, message_type, ");
        sql.append("_010_mf20_sender_reference, _020_mf21_related_reference, ");
        sql.append("_030_mf32a_principal_amount_paid_accepted_negotiated, ");
        sql.append("_031_mf32a_date, _032_mf32a_currency, _033_mf32a_amount, ");
        sql.append("_034_mf32a_currency, _035_mf32a_amount, ");
        sql.append("_040_of33b_currency, _041_of33b_amount, ");
        sql.append("_050_of71d_charges_deducted, _060_of73a_charges_added, ");
        sql.append("_070_of34a_total_amount_claimed, ");
        sql.append("_071_of34a_date, _072_of34a_currency, _073_of34a_amount, ");
        sql.append("_074_of34a_currency, _075_of34a_amount, ");
        sql.append("_080_of53a_reimbursing_bank, ");
        sql.append("_081_of53a_party_identifier, _082_of53a_identifier_code, ");
        sql.append("_083_of53a_party_identifier, _084_of53a_location, ");
        sql.append("_085_of53a_party_identifier, _086_of53a_name_address, ");
        sql.append("_090_of57a_account_with_bank, ");
        sql.append("_091_of57a_party_identifier, _092_of57a_identifier_code, ");
        sql.append("_093_of57a_party_identifier, _094_of57a_location, ");
        sql.append("_095_of57a_party_identifier, _096_of57a_name_address, ");
        sql.append("_100_of58a_beneficiary_bank, ");
        sql.append("_101_of58a_party_identifier, _102_of58a_identifier_code, ");
        sql.append("_103_of58a_party_identifier, _104_of58a_name_address, ");
        sql.append("_110_of72z_sender_to_receiver_information, _120_of77_narrative");
        sql.append(") VALUES (");
        sql.append("?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "); 
        sql.append("?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?");
        sql.append(")");
        
        return sql.toString();
    }
    

    private void closeResources(PreparedStatement ps, Connection conn) {
        if (ps != null) {
            try {
                ps.close();
            } catch (Exception e) {
                LOGGER.log(Level.WARNING, "Error closing PreparedStatement", e);
            }
        }
        if (conn != null) {
            try {
                conn.setAutoCommit(true);
                conn.close();
            } catch (Exception e) {
                LOGGER.log(Level.WARNING, "Error closing Connection", e);
            }
        }
    }
    
    /**
     * Send error message to client
     */
    private void sendError(PrintWriter out, String message) {
        out.println("<script>");
        out.println("alert('" + escapeJavaScript(message) + "');");
        out.println("window.history.back();");
        out.println("</script>");
    }
    
    /**
     * Send success message to client
     */
    private void sendSuccess(PrintWriter out, String message) {
        out.println("<script>");
        out.println("alert('" + escapeJavaScript(message) + "');");
        out.println("window.location='Category7/mt754.jsp';");
        out.println("</script>");
    }
    
    /**
     * Escape JavaScript special characters
     */
    private String escapeJavaScript(String str) {
        if (str == null) return "";
        return str.replace("\\", "\\\\")
                  .replace("'", "\\'")
                  .replace("\"", "\\\"")
                  .replace("\n", "\\n")
                  .replace("\r", "\\r");
    }
}