/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mt.form.servlet.Category7;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 *
 * @author mslam
 */
@WebServlet("/MT700Servlet")
public class MT700Servlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  private Connection getConn() throws Exception {
    Class.forName("org.postgresql.Driver");
    // TODO: sesuaikan host/port/db/user/pass Anda
    return DriverManager.getConnection(
      "jdbc:postgresql://localhost:5432/mtbank", "postgres", "password");
  }

  private BigDecimal parseAmt(String s){
    if(s==null || s.isEmpty()) return null;
    // 15d uses comma as decimal: "1234,56" -> "1234.56"
    return new BigDecimal(s.replace(".", "").replace(',', '.'));
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");

    // Pull parameters (mandatory + optional). Keep names same as JSP.
    String f27 = req.getParameter("f27");
    String f40a = req.getParameter("f40a");
    String f20 = req.getParameter("f20");
    String f23 = req.getParameter("f23");
    String f31c = req.getParameter("f31c");

    String f40e_code = req.getParameter("f40e_code");
    String f40e_narrative = req.getParameter("f40e_narrative");

    String f31d_date = req.getParameter("f31d_date");
    String f31d_place = req.getParameter("f31d_place");

    String f51_opt = req.getParameter("f51_opt");
    String f51a_party_identifier = req.getParameter("f51a_party_identifier");
    String f51a_bic = req.getParameter("f51a_bic");
    String f51d_party_identifier = req.getParameter("f51d_party_identifier");
    String f51d_name_address = req.getParameter("f51d_name_address");

    String f50 = req.getParameter("f50");

    String f59_account = req.getParameter("f59_account");
    String f59_name_address = req.getParameter("f59_name_address");

    String f32b_ccy = req.getParameter("f32b_ccy");
    BigDecimal f32b_amt = parseAmt(req.getParameter("f32b_amt"));

    String f39a = req.getParameter("f39a");
    String f39c = req.getParameter("f39c");

    String f41_opt = req.getParameter("f41_opt");
    String f41_code = req.getParameter("f41_code");
    String f41a_bic = req.getParameter("f41a_bic");
    String f41d_name_address = req.getParameter("f41d_name_address");

    String f42c = req.getParameter("f42c");
    String f42_opt = req.getParameter("f42_opt");
    String f42a_bic = req.getParameter("f42a_bic");
    String f42d_name_address = req.getParameter("f42d_name_address");
    String f42m = req.getParameter("f42m");
    String f42p = req.getParameter("f42p");

    String f43p = req.getParameter("f43p");
    String f43t = req.getParameter("f43t");

    String f44a = req.getParameter("f44a");
    String f44e = req.getParameter("f44e");
    String f44f = req.getParameter("f44f");
    String f44b = req.getParameter("f44b");

    String f44c = req.getParameter("f44c");
    String f44d = req.getParameter("f44d");

    String f45a = req.getParameter("f45a");
    String f46a = req.getParameter("f46a");
    String f47a = req.getParameter("f47a");
    String f49g = req.getParameter("f49g");
    String f49h = req.getParameter("f49h");

    String f71d = req.getParameter("f71d");

    String f48_days = req.getParameter("f48_days");
    String f48_narrative = req.getParameter("f48_narrative");

    String f49 = req.getParameter("f49");

    String f58_opt = req.getParameter("f58_opt");
    String f58a_bic = req.getParameter("f58a_bic");
    String f58d_name_address = req.getParameter("f58d_name_address");

    String f53_opt = req.getParameter("f53_opt");
    String f53a_bic = req.getParameter("f53a_bic");
    String f53d_name_address = req.getParameter("f53d_name_address");

    String f78 = req.getParameter("f78");

    String f57_opt = req.getParameter("f57_opt");
    String f57a_bic = req.getParameter("f57a_bic");
    String f57b_location = req.getParameter("f57b_location");
    String f57d_name_address = req.getParameter("f57d_name_address");

    String f72z = req.getParameter("f72z");

    // Insert
    String sql = "INSERT INTO mt700 (" +
      "f27, f40a, f20, f23, f31c, f40e_code, f40e_narrative, " +
      "f31d_date, f31d_place, " +
      "f51_opt, f51a_party_identifier, f51a_bic, f51d_party_identifier, f51d_name_address, " +
      "f50, f59_account, f59_name_address, f32b_ccy, f32b_amt, " +
      "f39a, f39c, " +
      "f41_opt, f41_code, f41a_bic, f41d_name_address, " +
      "f42c, f42_opt, f42a_bic, f42d_name_address, f42m, f42p, " +
      "f43p, f43t, " +
      "f44a, f44e, f44f, f44b, f44c, f44d, " +
      "f45a, f46a, f47a, f49g, f49h, " +
      "f71d, f48_days, f48_narrative, f49, " +
      "f58_opt, f58a_bic, f58d_name_address, " +
      "f53_opt, f53a_bic, f53d_name_address, " +
      "f78, f57_opt, f57a_bic, f57b_location, f57d_name_address, f72z" +
      ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try(Connection conn = getConn(); PreparedStatement ps = conn.prepareStatement(sql)){
      int i=1;
      ps.setString(i++, f27);
      ps.setString(i++, f40a);
      ps.setString(i++, f20);
      ps.setString(i++, f23);
      ps.setString(i++, f31c);
      ps.setString(i++, f40e_code);
      ps.setString(i++, f40e_narrative);

      ps.setString(i++, f31d_date);
      ps.setString(i++, f31d_place);

      ps.setString(i++, f51_opt);
      ps.setString(i++, f51a_party_identifier);
      ps.setString(i++, f51a_bic);
      ps.setString(i++, f51d_party_identifier);
      ps.setString(i++, f51d_name_address);

      ps.setString(i++, f50);
      ps.setString(i++, f59_account);
      ps.setString(i++, f59_name_address);
      ps.setString(i++, f32b_ccy);
      ps.setBigDecimal(i++, f32b_amt);

      ps.setString(i++, f39a);
      ps.setString(i++, f39c);

      ps.setString(i++, f41_opt);
      ps.setString(i++, f41_code);
      ps.setString(i++, f41a_bic);
      ps.setString(i++, f41d_name_address);

      ps.setString(i++, f42c);
      ps.setString(i++, f42_opt);
      ps.setString(i++, f42a_bic);
      ps.setString(i++, f42d_name_address);
      ps.setString(i++, f42m);
      ps.setString(i++, f42p);

      ps.setString(i++, f43p);
      ps.setString(i++, f43t);

      ps.setString(i++, f44a);
      ps.setString(i++, f44e);
      ps.setString(i++, f44f);
      ps.setString(i++, f44b);
      ps.setString(i++, f44c);
      ps.setString(i++, f44d);

      ps.setString(i++, f45a);
      ps.setString(i++, f46a);
      ps.setString(i++, f47a);
      ps.setString(i++, f49g);
      ps.setString(i++, f49h);

      ps.setString(i++, f71d);
      ps.setString(i++, f48_days);
      ps.setString(i++, f48_narrative);
      ps.setString(i++, f49);

      ps.setString(i++, f58_opt);
      ps.setString(i++, f58a_bic);
      ps.setString(i++, f58d_name_address);

      ps.setString(i++, f53_opt);
      ps.setString(i++, f53a_bic);
      ps.setString(i++, f53d_name_address);

      ps.setString(i++, f78);
      ps.setString(i++, f57_opt);
      ps.setString(i++, f57a_bic);
      ps.setString(i++, f57b_location);
      ps.setString(i++, f57d_name_address);
      ps.setString(i++, f72z);

      ps.executeUpdate();
      resp.sendRedirect("success.jsp");
    } catch(Exception ex){
      ex.printStackTrace();
      resp.sendRedirect("error.jsp");
    }
  }
}

