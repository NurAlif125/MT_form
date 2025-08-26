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
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mslam
 */
@WebServlet(name="MT110Servlet", urlPatterns={"/Category1/MT110Servlet"})
public class MT110Servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String senderRef = nvl(req.getParameter("_020_sender_ref"));
        String t53 = req.getParameter("_053_type");
        String t54 = req.getParameter("_054_type");
        String text72 = trimToNull(req.getParameter("_072_text"));

        if (senderRef.isBlank()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Field 20 is mandatory");
            return;
        }
        if (senderRef.startsWith("/") || senderRef.endsWith("/") || senderRef.contains("//")) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Field 20 format invalid");
            return;
        }

        String senderCorr = build53(req, t53);
        String receiverCorr = build54(req, t54);

        int setCount = parseIntSafe(req.getParameter("setCount"), 1);
        if (setCount < 1 || setCount > 10) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Repetitive sequence must be 1..10 (C1)");
            return;
        }

        List<SetRow> rows = new ArrayList<>();
        String commonCurrency = null;

        for (int i = 0; i < setCount; i++) {
            SetRow r = new SetRow();

            r.chequeNumber = nvl(req.getParameter("s"+i+"_021_cheque"));
            r.dateOfIssue = parseIsoDate(req.getParameter("s"+i+"_030_date")); // yyyy-MM-dd
            r.amountOption = nvl(req.getParameter("s"+i+"_032_type"));

            if (!r.amountOption.equals("A") && !r.amountOption.equals("B")) {
                resp.sendError(400, "Set #"+(i+1)+": 32a type must be A or B");
                return;
            }

            if ("A".equals(r.amountOption)) {
                r.valueDate = parseIsoDate(req.getParameter("s"+i+"_032A_date"));
                r.currency = nvl(req.getParameter("s"+i+"_032A_ccy")).toUpperCase();
                r.amountStr = nvl(req.getParameter("s"+i+"_032A_amt"));
            } else {
                r.currency = nvl(req.getParameter("s"+i+"_032B_ccy")).toUpperCase();
                r.amountStr = nvl(req.getParameter("s"+i+"_032B_amt"));
            }

            // 50a
            r.payerType = nvl(req.getParameter("s"+i+"_050_type"));
            if ("A".equals(r.payerType)) {
                r.payerAccount = trimToNull(req.getParameter("s"+i+"_050A_acct"));
                r.payerBic = trimToNull(req.getParameter("s"+i+"_050A_bic"));
            } else if ("F".equals(r.payerType)) {
                r.payerParty = trimToNull(req.getParameter("s"+i+"_050F_party"));
                r.payerL1 = trimToNull(req.getParameter("s"+i+"_050F_l1"));
                r.payerL2 = trimToNull(req.getParameter("s"+i+"_050F_l2"));
                r.payerL3 = trimToNull(req.getParameter("s"+i+"_050F_l3"));
            } else if ("K".equals(r.payerType)) {
                r.payerAccount = trimToNull(req.getParameter("s"+i+"_050K_acct"));
                r.payerNameAddr = trimToNull(req.getParameter("s"+i+"_050K_nameaddr"));
            }

            // 52a
            r.drawerType = nvl(req.getParameter("s"+i+"_052_type"));
            if ("A".equals(r.drawerType)) {
                r.drawerParty = trimToNull(req.getParameter("s"+i+"_052A_party"));
                r.drawerBic = trimToNull(req.getParameter("s"+i+"_052A_bic"));
            } else if ("B".equals(r.drawerType)) {
                r.drawerParty = trimToNull(req.getParameter("s"+i+"_052B_party"));
                r.drawerLocation = trimToNull(req.getParameter("s"+i+"_052B_location"));
            } else if ("D".equals(r.drawerType)) {
                r.drawerParty = trimToNull(req.getParameter("s"+i+"_052D_party"));
                r.drawerNameAddr = trimToNull(req.getParameter("s"+i+"_052D_nameaddr"));
            }

            // 59a
            r.payeeType = nvl(req.getParameter("s"+i+"_059_type"));
            if ("N".equals(r.payeeType)) {
                r.payeeNameAddr = nvl(req.getParameter("s"+i+"_059N_nameaddr"));
            } else if ("F".equals(r.payeeType)) {
                r.payeeL1 = nvl(req.getParameter("s"+i+"_059F_l1"));
                r.payeeL2 = trimToNull(req.getParameter("s"+i+"_059F_l2"));
                r.payeeL3 = trimToNull(req.getParameter("s"+i+"_059F_l3"));
            }

            // --- Validation ---
            if (r.chequeNumber.isBlank() || r.dateOfIssue==null
                    || r.currency.isBlank() || r.amountStr.isBlank() || r.payeeType.isBlank()) {
                resp.sendError(400, "Set #"+(i+1)+": fields 21,30,32a,59a are mandatory");
                return;
            }
            if ("A".equals(r.amountOption) && r.valueDate==null) {
                resp.sendError(400, "Set #"+(i+1)+": 32A requires Date");
                return;
            }

            // Amount normalize
            r.amountStr = r.amountStr.replace(".", "").replace(",", ".");
            try {
                r.amount = new BigDecimal(r.amountStr).setScale(2, RoundingMode.HALF_UP);
            } catch (NumberFormatException ex) {
                resp.sendError(400, "Set #"+(i+1)+": amount invalid");
                return;
            }

            if (commonCurrency == null) commonCurrency = r.currency;
            else if (!commonCurrency.equalsIgnoreCase(r.currency)) {
                resp.sendError(400, "All 32a currency must be the same across sets (C2)");
                return;
            }

            rows.add(r);
        }

        // ---------- Save ----------
        try (Connection cn = DatabaseConnection.getConnection()) {
            cn.setAutoCommit(false);

            long nextId = getNextId(cn);
            String formCode = "MT110_" + nextId;

            String insParent =
                "INSERT INTO mt.mt110_message (id, sender_ref, sender_correspondent, receiver_correspondent, currency, sender_to_receiver) " +
                "VALUES (?,?,?,?,?,?)";

            try (PreparedStatement ps = cn.prepareStatement(insParent)) {
                ps.setString(1, formCode);
                ps.setString(2, senderRef);
                ps.setString(3, senderCorr);
                ps.setString(4, receiverCorr);
                ps.setString(5, commonCurrency);
                ps.setString(6, text72);
                ps.executeUpdate();
            }

            String insChild =
                "INSERT INTO mt.mt110_items (mt110_id, seq_no, cheque_number, date_of_issue, amount_option, value_date, currency, amount, " +
                " payer_type, payer_account, payer_bic, payer_party, payer_l1, payer_l2, payer_l3, payer_nameaddr, " +
                " drawer_type, drawer_party, drawer_bic, drawer_location, drawer_nameaddr, " +
                " payee_type, payee_nameaddr, payee_l1, payee_l2, payee_l3) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            try (PreparedStatement pc = cn.prepareStatement(insChild)) {
                int seq = 1;
                for (SetRow r : rows) {
                    pc.setString(1, formCode);   // gunakan formCode string
                    pc.setInt(2, seq++);
                    pc.setString(3, r.chequeNumber);
                    pc.setDate(4, Date.valueOf(r.dateOfIssue));
                    pc.setString(5, r.amountOption);
                    if ("A".equals(r.amountOption)) {
                        pc.setDate(6, Date.valueOf(r.valueDate));
                    } else {
                        pc.setNull(6, Types.DATE);
                    }
                    pc.setString(7, r.currency);
                    pc.setBigDecimal(8, r.amount);

                    pc.setString(9, r.payerType);
                    pc.setString(10, r.payerAccount);
                    pc.setString(11, r.payerBic);
                    pc.setString(12, r.payerParty);
                    pc.setString(13, r.payerL1);
                    pc.setString(14, r.payerL2);
                    pc.setString(15, r.payerL3);
                    pc.setString(16, r.payerNameAddr);

                    pc.setString(17, r.drawerType);
                    pc.setString(18, r.drawerParty);
                    pc.setString(19, r.drawerBic);
                    pc.setString(20, r.drawerLocation);
                    pc.setString(21, r.drawerNameAddr);

                    pc.setString(22, r.payeeType);
                    pc.setString(23, r.payeeNameAddr);
                    pc.setString(24, r.payeeL1);
                    pc.setString(25, r.payeeL2);
                    pc.setString(26, r.payeeL3);

                    pc.addBatch();
                }
                pc.executeBatch();
            }

            cn.commit();
            resp.sendRedirect("listForms.jsp");

        } catch (SQLException e) {
            throw new ServletException("Database error while saving MT110", e);
        }
    }

    private static String nvl(String s){ return s==null? "": s.trim(); }
    private static String trimToNull(String s){
        if (s==null) return null;
        s = s.trim();
        return s.isEmpty()? null: s;
    }
    private static int parseIntSafe(String s, int def){
        try{ return Integer.parseInt(s); }catch(Exception e){ return def; }
    }
    private static LocalDate parseIsoDate(String s){
        if (s==null || s.isBlank()) return null;
        try {
            return LocalDate.parse(s); // yyyy-MM-dd
        } catch (DateTimeParseException e){
            return null;
        }
    }
    private static String build53(HttpServletRequest req, String t){
        if (t==null || t.isBlank()) return null;
        switch (t){
            case "A": return safeJoin(req.getParameter("_053A_party"), req.getParameter("_053A_bic"));
            case "B": return safeJoin(req.getParameter("_053B_party"), req.getParameter("_053B_location"));
            case "D": return safeJoin(req.getParameter("_053D_party"), req.getParameter("_053D_nameaddr"));
            default: return null;
        }
    }
    private static String build54(HttpServletRequest req, String t){
        if (t==null || t.isBlank()) return null;
        switch (t){
            case "A": return safeJoin(req.getParameter("_054A_party"), req.getParameter("_054A_bic"));
            case "B": return safeJoin(req.getParameter("_054B_party"), req.getParameter("_054B_location"));
            case "D": return safeJoin(req.getParameter("_054D_party"), req.getParameter("_054D_nameaddr"));
            default: return null;
        }
    }
    private static String safeJoin(String a, String b){
        String s1 = nvl(a), s2 = nvl(b);
        if (s1.isEmpty() && s2.isEmpty()) return null;
        return (s1 + " | " + s2).replaceAll("\\s+\\|\\s+$","").trim();
    }
    private static long getNextId(Connection cn) throws SQLException {
        try (Statement st = cn.createStatement()) {
            ResultSet rs = st.executeQuery(
                "SELECT COALESCE(MAX(CAST(substring(id from '[0-9]+$') AS int)),0)+1 " +
                "FROM mt.mt110_message"
            );
            rs.next();
            return rs.getLong(1);
        }
    }

    static class SetRow {
        String chequeNumber;
        LocalDate dateOfIssue;
        String amountOption;
        LocalDate valueDate;
        String currency;
        String amountStr;
        BigDecimal amount;

        String payerType;
        String payerAccount;
        String payerBic;
        String payerParty;
        String payerL1;
        String payerL2;
        String payerL3;
        String payerNameAddr;

        String drawerType;
        String drawerParty;
        String drawerBic;
        String drawerLocation;
        String drawerNameAddr;

        String payeeType;
        String payeeNameAddr;
        String payeeL1;
        String payeeL2;
        String payeeL3;
    }
}