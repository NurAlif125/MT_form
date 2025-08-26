/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mt.form.servlet.Category1;

import com.mt.form.util.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 *
 * @author mslam
 */
@WebServlet(name = "MT111Servlet", urlPatterns = {"/Category1/MT111Servlet"})
public class MT111Servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ===== Ambil field wajib =====
        String senderRef = request.getParameter("_010_mf20_sender_reference");
        String chequeNumber = request.getParameter("_020_mf21_chequenumber");
        String dateOfIssueStr = request.getParameter("_030_mf30_date");

        // ===== Amount Option (32A/32B) =====
        String amountOption = request.getParameter("type_mf32_"); // "32a" atau "32b"
        String valueDateStr = null;
        String currency = null;
        String amountStr = null;

        if ("32a".equals(amountOption)) {
            valueDateStr = request.getParameter("_040_mf32a_date");
            currency = request.getParameter("_041_mf32a_currency");
            amountStr = request.getParameter("_042_mf32a_amount");
            amountOption = "A";
        } else if ("32b".equals(amountOption)) {
            currency = request.getParameter("_043_mf32b_currency");
            amountStr = request.getParameter("_044_mf32b_amount");
            amountOption = "B";
        }

        // ===== OF52 Drawer Bank =====
        String typeOf52 = request.getParameter("type_of52_52a_");
        String drawerBankBic = null;
        if ("52a".equals(typeOf52)) {
            drawerBankBic = request.getParameter("_051_of52a_identifier_code");
        } else if ("52b".equals(typeOf52)) {
            drawerBankBic = request.getParameter("_053_of52b_location");
        } else if ("52d".equals(typeOf52)) {
            drawerBankBic = request.getParameter("_055_of52d_address");
        }

        // ===== Beneficiary (59) =====
        String payeeName = request.getParameter("_060_of59_account");
        String payeeAddr1 = request.getParameter("_061_of59_name_address");

        // ===== Queries (75) =====
        String queries = request.getParameter("_070_of75_queries");

        // ===== Validasi =====
        if (senderRef == null || senderRef.isBlank() ||
            chequeNumber == null || chequeNumber.isBlank() ||
            dateOfIssueStr == null || dateOfIssueStr.isBlank() ||
            amountOption == null || amountOption.isBlank() ||
            currency == null || currency.isBlank() ||
            amountStr == null || amountStr.isBlank()) {

            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Field wajib tidak boleh kosong");
            return;
        }

        // ===== Normalisasi Amount =====
        BigDecimal amount;
        try {
            String cleaned = amountStr.replace(",", "").trim();
            amount = new BigDecimal(cleaned).setScale(2, RoundingMode.HALF_UP);
        } catch (NumberFormatException e) {
            throw new ServletException("Format amount tidak valid: " + amountStr, e);
        }

        // ===== Generate PK formCode =====
        String formCode;
        try (Connection cn = DatabaseConnection.getConnection();
             Statement st = cn.createStatement()) {

            ResultSet rs = st.executeQuery(
                "SELECT COALESCE(MAX(CAST(substring(id from '[0-9]+$') AS int)),0)+1 " +
                "FROM mt.mt111_message"
            );
            rs.next();
            long nextId = rs.getLong(1);
            formCode = "MT111_" + nextId;
        } catch (SQLException e) {
            throw new ServletException("Gagal generate ID MT111", e);
        }

        // ===== Insert DB =====
        String sql = "INSERT INTO mt.mt111_message " +
                "(id, sender_ref, cheque_number, date_of_issue, amount_option, value_date, currency, amount, " +
                "drawer_bank_bic, payee_name, payee_addr1, queries_text) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, formCode);
            ps.setString(2, senderRef.trim());
            ps.setString(3, chequeNumber.trim());

            ps.setDate(4, Date.valueOf(convertToSqlDate(dateOfIssueStr)));
            ps.setString(5, amountOption);

            if ("A".equals(amountOption) && valueDateStr != null && !valueDateStr.isBlank()) {
                ps.setDate(6, Date.valueOf(convertToSqlDate(valueDateStr)));
            } else {
                ps.setNull(6, java.sql.Types.DATE);
            }

            ps.setString(7, currency.toUpperCase());
            ps.setBigDecimal(8, amount);
            ps.setString(9, drawerBankBic);
            ps.setString(10, payeeName);
            ps.setString(11, payeeAddr1);
            ps.setString(12, queries);

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new ServletException("Database error while saving MT111", e);
        }

        response.sendRedirect("listForms.jsp");
    }

    /** Konversi dari yymmdd → yyyy-MM-dd */
    private String convertToSqlDate(String yymmdd) {
        if (yymmdd == null || yymmdd.length() != 6) {
            throw new IllegalArgumentException("Format tanggal tidak valid: " + yymmdd);
        }
        String yy = yymmdd.substring(0, 2);
        String mm = yymmdd.substring(2, 4);
        String dd = yymmdd.substring(4, 6);

        int year = Integer.parseInt(yy);
        if (year < 50) year += 2000; else year += 1900;
        return String.format("%04d-%02d-%02d", year, Integer.parseInt(mm), Integer.parseInt(dd));
    }
}
    

