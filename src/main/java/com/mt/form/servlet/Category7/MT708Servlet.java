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
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.logging.Logger;

@WebServlet("/MT708Servlet")
public class MT708Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(MT708Servlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String mf27Number = request.getParameter("_010_mf27_number");
            String mf27Total = request.getParameter("_011_mf27_total");
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

            String mf27 = null;
            if (!isEmpty(mf27Number) && !isEmpty(mf27Total)) {
                mf27 = mf27Number + "/" + mf27Total;
            }

            if (isEmpty(mf27) || isEmpty(mf20) || isEmpty(mf21) ||
                    isEmpty(mf23) || isEmpty(mf26e) || isEmpty(mf30)) {
                out.println("<script>");
                out.println("alert('Mandatory fields not complete!\\n\\n" +
                        "Required: MF27, MF20, MF21, MF23, MF26E, MF30');");
                out.println("window.history.back();");
                out.println("</script>");
                return;
            }

            if (isEmpty(mf21)) {
                mf21 = "NONREF";
            }

            String newId = generateFormId();
            LOGGER.info("Generated form_id: " + newId);

            String sql = "INSERT INTO mt.mt708_message (" +
                    "form_id, message_type, " +
                    "_010_mf27_sequence_of_total, _020_mf20_sender_reference, _030_mf21_receiver_reference, " +
                    "_040_mf23_issuing_bank_reference, _050_mf26e_number_of_amendment, _060_mf30_date_of_amendment, " +
                    "_070_of45b_description_goods_services, _080_of46b_documents_required, _090_of47b_additional_conditions, " +
                    "_100_of49m_special_payment_beneficiary, _110_of49n_special_payment_bank, " +
                    "created_at, updated_at" +
                    ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                int idx = 1;
                ps.setString(idx++, newId);                          // form_id
                ps.setString(idx++, "708");                          // message_type
                ps.setString(idx++, mf27);                           // MF27 Sequence of Total (n/n)
                ps.setString(idx++, mf20.toUpperCase());             // MF20 Sender's Reference
                ps.setString(idx++, mf21.toUpperCase());             // MF21 Receiver's Reference
                ps.setString(idx++, mf23);                           // MF23 Issuing Bank's Reference
                ps.setString(idx++, mf26e);                          // MF26E Number of Amendment
                ps.setString(idx++, mf30);                           // MF30 Date of Amendment
                ps.setString(idx++, of45b);                          // OF45B Description of Goods
                ps.setString(idx++, of46b);                          // OF46B Documents Required
                ps.setString(idx++, of47b);                          // OF47B Additional Conditions
                ps.setString(idx++, of49m);                          // OF49M Special Payment (Beneficiary)
                ps.setString(idx++, of49n);                          // OF49N Special Payment (Bank Only)
                ps.setTimestamp(idx++, new Timestamp(System.currentTimeMillis())); // created_at
                ps.setTimestamp(idx++, new Timestamp(System.currentTimeMillis())); // updated_at

                int rowsInserted = ps.executeUpdate();

                if (rowsInserted > 0) {
                    LOGGER.info("MT708 message saved successfully: " + newId);
                    out.println("<script>");
                    out.println("alert('MT708 Amendment saved successfully!\\nForm ID: " + newId + "');");
                    out.println("window.location='Category7/mt708.jsp';");
                    out.println("</script>");
                } else {
                    throw new Exception("Failed to insert MT708 record");
                }

            } catch (Exception dbException) {
                LOGGER.severe("Database error: " + dbException.getMessage());
                dbException.printStackTrace(out);
                out.println("<script>");
                out.println("alert('Error saving MT708 Amendment:\\n" + 
                        sanitizeErrorMessage(dbException.getMessage()) + "');");
                out.println("window.history.back();");
                out.println("</script>");
            }

        } catch (Exception e) {
            LOGGER.severe("Servlet error: " + e.getMessage());
            e.printStackTrace(out);
            out.println("<script>");
            out.println("alert('Error processing request:\\n" + 
                    sanitizeErrorMessage(e.getMessage()) + "');");
            out.println("window.history.back();");
            out.println("</script>");
        } finally {
            out.close();
        }
    }

    /**
     * Generate unique Form ID with format: MT708_[sequence]
     * Queries current max sequence and increments by 1
     */
    private String generateFormId() {
        String formId = "MT708_1";
        
        String sql = "SELECT COALESCE(MAX(CAST(SUBSTRING(form_id FROM '[0-9]+$') AS INTEGER)), 0) + 1 AS next_seq " +
                     "FROM mt.mt708_message";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                int nextSeq = rs.getInt("next_seq");
                formId = "MT708_" + nextSeq;
            }
        } catch (Exception e) {
            LOGGER.warning("Error generating form_id, using default: " + e.getMessage());
        }
        
        return formId;
    }

    private boolean isEmpty(String s) {
        return (s == null || s.trim().isEmpty());
    }

    private String sanitizeErrorMessage(String message) {
        if (message == null) return "Unknown error";
        
        return message
                .replace("\"", "\\\"")
                .replace("'", "\\'")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .substring(0, Math.min(200, message.length())); // Max 200 chars
    }
}