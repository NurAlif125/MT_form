/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;
/**
 *
 * @author T430
 */
import com.vensys.appcm.dbase.DBDataRole;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
import java.io.IOException;
import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataRole;
import org.apache.log4j.Logger;

/**
 *
 * @author hadi
 */
public class SCDataRole extends HttpServlet {

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
        DBconnection2 dbConn2 = new DBconnection2();
        DataRole data = new DataRole();
        DBDataRole dbData = new DBDataRole(dbConn.getConnection());
        DBDataRole dbData2 = new DBDataRole(dbConn2.getConnection2());
        HttpSession session = request.getSession();
        String role_id = request.getParameter("role_id");
        String role_enable = "";
        String[] role_detail = request.getParameterValues("role_detail");
        String s_role_detail = "";
        if (role_detail != null) {
            for (int i = 0; i < role_detail.length; i++) {
//                System.out.println("role_detail=" + role_detail[i]);
                s_role_detail += role_detail[i] + ",";
            }
        }
        if (request.getParameter("role_enable") == null) {
            role_enable = "0";
        } else {
            role_enable = "1";
        }
//        String batas = request.getParameter("batas");
        data.setRole_name(request.getParameter("role_name"));
//        data.setLimit(new BigInteger(batas));
        data.setTimeout(new Integer(request.getParameter("timeout")));
        data.setRole_detail(s_role_detail);
        data.setRole_enable(Integer.parseInt(role_enable));
        data.setRole_desc(request.getParameter("role_desc"));
        String strErrMsg = "";
        boolean duplicate = dbData.cekDataDuplicateRole(data.getRole_name());

        if (role_id == null ? "null" == null : role_id.equals("null") || role_id.isEmpty()) {
            if (duplicate) {
                strErrMsg = "Role Already Exist!!";//belum beres
            } else {
                dbData2.addDataRole(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            }

//            System.out.println("addDataRole");
        } else {
            data.setRole_id(Integer.parseInt(request.getParameter("role_id")));
            if (request.getParameter("delete_role") == null) {
                dbData2.updateDataRole(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
//                System.out.println("updateDataRole");
            } else {
                dbData2.delete(data.getRole_id(), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
//                System.out.println("delete");
            }
        }
        try {
            log.info("processRequest");
        } catch (Exception ex) {
            log.error(ex.getMessage());
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
            dbConn2.closeConnection2();
        }
        session.setAttribute("message", strErrMsg);
        RequestDispatcher dispatcher = request.getRequestDispatcher("SCDataRoleList");
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
            log.error(ex.getMessage());
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
            log.error(ex.getMessage());
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

