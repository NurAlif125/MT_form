/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataAccPenagih;
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
import com.vensys.appcm.model.DataAccPenagih;

/**
 *
 * @author hadi
 */
public class SCDataAccPenagihan extends HttpServlet {

    DBconnection dbConn = new DBconnection();
    DBDataAccPenagih dBDataPenagihan = new DBDataAccPenagih(dbConn.getConnection());
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
        DataAccPenagih data = new DataAccPenagih();
        DBDataAccPenagih dbData = new DBDataAccPenagih(dbConn.getConnection());
//        List<DataAccPenagih> cekDuplicate = new ArrayList<DataAccPenagih>();
        HttpSession session = request.getSession();
        String id_account = request.getParameter("id_account");
        String message = request.getParameter("message");
        String swift_code = request.getParameter("swift_code");
        String account = request.getParameter("account");
        String strErrMsg = null;
        RequestDispatcher dispatcher = null;
        data.setCurrency(request.getParameter("currency"));
        data.setSwift_code(request.getParameter("swift_code"));
        data.setAccount(request.getParameter("account"));
        data.setIsDuplicate(request.getParameter("isDuplicate"));
        List<String> duplicate = dBDataPenagihan.cekDataDuplicateAccPenagih2(swift_code, account);
        System.out.println("Data Duplicate : " + duplicate.size());
        if (id_account == null ? "null" == null : id_account.equals("null") || id_account.isEmpty()) {
            if (duplicate.size() > 0) {
                strErrMsg = "Account Penagih Already Exist";
                session.setAttribute("errorMsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("addAccPenagih.jsp");
                dispatcher.forward(request, response);
                log.info(strErrMsg);
                System.out.println("Data Telah Ada Sebelumnya");
            } else {
                dbData.addDataAcc(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                System.out.println("Data Telah Terinput");
                dispatcher = request.getRequestDispatcher("SCDataAccPenagihanList");
            }
//        if ((id_account == null ? "null" == null : id_account.equals("null") || id_account.isEmpty() && foundIt == true)) {
//            dbData.addDataAcc(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), (Boolean.FALSE));
        } else if (request.getParameter("delete") == null) {
            dbData.updateDataAcc(data, Integer.parseInt(id_account), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            System.out.println("updateDataAccountPenagihan");
            dispatcher = request.getRequestDispatcher("SCDataAccPenagihanList");
        } else {
            dbData.delete(Integer.parseInt(id_account), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            System.out.println("delete");
            dispatcher = request.getRequestDispatcher("SCDataAccPenagihanList");
        }

        try {
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
//        RequestDispatcher dispatcher = request.getRequestDispatcher("SCDataAccPenagihanList");
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
            Logger.getLogger(SCDataAccPenagihan.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SCDataAccPenagihan.class.getName()).log(Level.SEVERE, null, ex);
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
