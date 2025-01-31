/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataNostro;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataNostro;

/**
 *
 * @author hadi
 */
public class SCDataNostro extends HttpServlet {

    DBconnection dbConn = new DBconnection();
    DBDataNostro dBDataNos = new DBDataNostro(dbConn.getConnection());
    private static final long serialVersionUID = 1L;
    Logger log = Logger.getLogger(getClass().getName());

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        DBconnection dbConn = new DBconnection();
        DataNostro data = new DataNostro();
        DBDataNostro dbData = new DBDataNostro(dbConn.getConnection());
        HttpSession session = request.getSession();
        String id_member = request.getParameter("id_member");
        String message = request.getParameter("message");
        String swift_code = request.getParameter("swift_code");
        String action = request.getParameter("action");
//        String name = request.getParameter("account");
        String strErrMsg = null;
        RequestDispatcher dispatcher = null;
        data.setSwift_code(request.getParameter("swift_code"));
        data.setName(request.getParameter("name"));
        data.setAddress(request.getParameter("address"));
        data.setIsDuplicate(request.getParameter("isDuplicate"));
//        20220519
        data.setSsl_name(request.getParameter("ssl_name"));
        data.setSsl_no(Integer.parseInt(request.getParameter("ssl_no")));
        data.setCurrency_codes(request.getParameter("currency_codes"));
        data.setAcc_no(request.getParameter("acc_no"));
        data.setCity(request.getParameter("city"));
        data.setCountry(request.getParameter("country"));
        
        List<String> duplicate = dBDataNos.cekDataDuplicateNostro(swift_code);
        System.out.println("Data Duplicate Nostro : " + duplicate.size());
        if (id_member == null ? "null" == null : id_member.equals("null") || id_member.isEmpty()) {
            if (duplicate.size() > 0) {
                strErrMsg = "Nostro Already Exist";
                session.setAttribute("errorMsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("addNostro.jsp");
                dispatcher.forward(request, response);
                log.info(strErrMsg);
                System.out.println("Data Telah Ada Sebelumnya");
            } else {
                dbData.addDataNostro(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                System.out.println("Data Telah Terinput");
                dispatcher = request.getRequestDispatcher("SCDataNostroList");
            }
//        if ((id_member == null ? "null" == null : id_member.equals("null") || id_member.isEmpty() && foundIt == true)) {
//            dbData.addDataAcc(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), (Boolean.FALSE));
        } else if (request.getParameter("delete") == null) {
            dbData.updateDataNostro(data, Integer.parseInt(id_member), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            System.out.println("updateDataNostro");
            dispatcher = request.getRequestDispatcher("SCDataNostroList");
        } else {
            dbData.delete(Integer.parseInt(id_member), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            System.out.println("delete");
            dispatcher = request.getRequestDispatcher("SCDataNostroList");
        }

        try {
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
//        RequestDispatcher dispatcher = request.getRequestDispatcher("SCDataNostroList");
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SCDataNostro.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SCDataNostro.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}