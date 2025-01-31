/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataBICGO;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataBICSwiftGo;

/**
 *
 * @author ovasae
 */
public class SCDataBICGo extends HttpServlet {

    DBconnection dbConn = new DBconnection();
    DBDataBICGO dBDataBICGo = new DBDataBICGO(dbConn.getConnection());
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
            throws ServletException, IOException, Exception {
        DBconnection dbConn = new DBconnection();
        DataBICSwiftGo data = new DataBICSwiftGo();
        DBDataBICGO dbData = new DBDataBICGO(dbConn.getConnection());
        HttpSession session = request.getSession();

        String swift_id = request.getParameter("id");
        String bic = (request.getParameter("bic"));

        data.setSwift_code(request.getParameter("swift_code"));
        data.setCompany(request.getParameter("company"));
        data.setUpdateBy(session.getAttribute("user_id").toString());
        data.setUpdateDate(request.getParameter("updatedate"));
        
        String strErrMsg = null;
        RequestDispatcher dispatcher = null;

        List<String> duplicate = dBDataBICGo.cekDataDuplicateBICGo(bic);
        System.out.println("Data Duplicate : " + duplicate.size());

        if (swift_id == null ? "null" == null : swift_id.equals("null") || swift_id.isEmpty()) {
            if (duplicate.size() > 0) {
                strErrMsg = "BIC Already Exist";
                session.setAttribute("errorMsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("addSwiftGo.jsp");
                dispatcher.forward(request, response);
                log.info(strErrMsg);
                System.out.println("Data Telah Ada Sebelumnya");
            } else {
                dbData.addBicGo(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                System.out.println("Data Telah Terinput");
                dispatcher = request.getRequestDispatcher("SCDataBICGoList");
            }
        } else if (request.getParameter("delete") == null) {
            dbData.updateBicGo(data, Integer.parseInt(swift_id), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            dispatcher = request.getRequestDispatcher("SCDataBICGoList");
        } else {
            dbData.delete(Integer.parseInt(swift_id), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            dispatcher = request.getRequestDispatcher("SCDataBICGoList");
        }
        
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
            Logger.getLogger(SCDataBICGo.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SCDataBICGo.class.getName()).log(Level.SEVERE, null, ex);
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
