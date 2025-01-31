/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataVostro;
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
import com.vensys.appcm.model.DataVostro;

/**
 *
 * @author ovasae
 */
public class SCDataVostro extends HttpServlet {

    DBconnection dbConn = new DBconnection();
    DBDataVostro dBDataV = new DBDataVostro(dbConn.getConnection());
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
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");

        DBconnection dbConn = new DBconnection();
        DataVostro data = new DataVostro();
        DBDataVostro dbData = new DBDataVostro(dbConn.getConnection());
        HttpSession session = request.getSession();
        String vostro_id = request.getParameter("vostro_id");
        String swift_code = request.getParameter("swift_code");
        data.setSwift_code(request.getParameter("swift_code"));
        data.setName(request.getParameter("name"));
        data.setAcc_no(request.getParameter("acc_no"));
        String strErrMsg = null;
        RequestDispatcher dispatcher = null;
        List<String> duplicate = dBDataV.cekDataDuplicateVostro(swift_code);
        System.out.println("Data Duplicate : " + duplicate.size());

        if (vostro_id == null ? "null" == null : vostro_id.equals("null") || vostro_id.isEmpty()) {
            if (duplicate.size() > 0) {
                strErrMsg = "vostro Already Exist";
                session.setAttribute("errorMsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("addVostro.jsp");
                dispatcher.forward(request, response);
                log.info(strErrMsg);
                System.out.println("Data Telah Ada Sebelumnya");
            } else {
                dbData.addDataVosto(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                System.out.println("Data Telah Terinput");
                dispatcher = request.getRequestDispatcher("SCDataVostroList");
            }
//        if ((vostro_id == null ? "null" == null : vostro_id.equals("null") || vostro_id.isEmpty() && foundIt == true)) {
//            dbData.addDataAcc(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"), (Boolean.FALSE));
        } else if (request.getParameter("delete") == null) {
            dbData.updateDataVostro(data, Integer.parseInt(vostro_id), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            System.out.println("updateDataVostro");
            dispatcher = request.getRequestDispatcher("SCDataVostroList");
        } else {
            dbData.delete(Integer.parseInt(vostro_id), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            System.out.println("delete");
            dispatcher = request.getRequestDispatcher("SCDataVostroList");
        }

//        if (action == null) {
//            if (vostro_id == null ? "null" == null : vostro_id.equals("null") || vostro_id.isEmpty()) {
//                if (duplicate.size() > 0) {
//                    strErrMsg = "Vostro Already Exist";
//                    session.setAttribute("errorMsg", strErrMsg);
//                    dispatcher = request.getRequestDispatcher("addVostro.jsp");
//                    dispatcher.forward(request, response);
//                    log.info(strErrMsg);
//                    System.out.println("Data Telah Ada Sebelumnya");
//                } else {
//                    dbData.addDataVosto(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
//                    System.out.println("Data Telah Terinput");
//                }
//                dispatcher = request.getRequestDispatcher("SCDataVostroList");
//            } else {
//                dbData.updateDataVostro(data, Integer.parseInt(vostro_id), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
//                dispatcher = request.getRequestDispatcher("SCDataVostroList");
//            }
//        } else {
//            dbData.delete(Integer.parseInt(vostro_id), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
//            dispatcher = request.getRequestDispatcher("SCDataVostroList");
//            log.info("kadieu/rene delete");
//        }
        try {
            log.info("nothing to do here");
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }

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
        } catch (Exception ex) {
            Logger.getLogger(SCDataVostro.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(SCDataVostro.class.getName()).log(Level.SEVERE, null, ex);
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
