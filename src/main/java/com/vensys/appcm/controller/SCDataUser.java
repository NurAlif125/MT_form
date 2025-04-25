/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataUser;
import com.vensys.appcm.dbase.DBUserData;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
import com.vensys.appcm.ldap.LDAPCon;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataUser;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author hadi
 */
public class SCDataUser extends HttpServlet {

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
            throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
        log.info("processRequest-1");
        DBconnection dbConn = new DBconnection();
        DBconnection2 dbConn2 = new DBconnection2();
        DataUser data = new DataUser();
        LDAPCon ldapCon = new LDAPCon();
        DBDataUser dbData = new DBDataUser(dbConn.getConnection());
        DBDataUser dbData2 = new DBDataUser(dbConn2.getConnection2());
        DBUserData dbo = new DBUserData(dbConn.getConnection());
        HttpSession session = request.getSession();
        String user_id = request.getParameter("user_id");
        String enable = "";
        String role = "";
        String role_id = "";
        String auto_disable = request.getParameter("auto_disable");
//        String idPass="";
        boolean isValidUser = false;
        String message = "";
        
        if(request.getParameter("subrole") == null) {
            role_id = "0";
        } else {
            role_id = request.getParameter("subrole");
        }

        if (request.getParameter("role") == null) {
            role = "0";
        } else {
            role = request.getParameter("role");
        }
        if (request.getParameter("enable") == null) {
            enable = "0";
        } else {
            enable = "1";
        }
        data.setUser_id(request.getParameter("username"));
        data.setName(request.getParameter("name"));
        data.setPassword(new ConvertToMD5().convert(request.getParameter("password")));
//        data.setStatus_new(Integer.parseInt(request.getParameter("status_new")));
//        data.setUser_mt_routing(Integer.parseInt(request.getParameter("user_mt_routing")));
        data.setDescription(request.getParameter("description"));
        data.setRole(Integer.parseInt(role));
        data.setSub_role(Integer.parseInt(role_id));
        data.setEnable(Integer.parseInt(enable));
//        data.setAuto_disable(Integer.parseInt(auto_disable));
//        data.setIdpassword(Integer.parseInt(idPass));
//        System.out.println("user_id=" + user_id);
//        if (user_id == null || user_id.isEmpty()) {
//        if (user_id == null ? "null" == null : user_id.equals("null") || user_id.isEmpty()) {
//            dbData.addDataUser(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
////            System.out.println("addDataUser");
//        }

        String user_session = (String) session.getAttribute("user_id");
        String pass_session = (String) session.getAttribute("password");
        String isValidLogonLdap = "";
        isValidLogonLdap = ldapCon.cekUserAdd(request.getParameter("username"), user_session, pass_session);
        
        if (user_id == null ? "null" == null : user_id.equals("null") || user_id.isEmpty()) {
            try {
                isValidUser = dbo.authenticateUser(data.getUser_id());
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            
            String foundUser = "";
            if (isValidLogonLdap.equalsIgnoreCase("not connect")) {
                message = "Error Connection LDAP!";
            } else if (isValidLogonLdap.equalsIgnoreCase("user not found")) {
                message = "Failed, username not registered please contact Administrator";
            } else if(isValidLogonLdap.equalsIgnoreCase("success")) {
                message = "Succesfully Created User";
                foundUser = "Found User LDAP";
            }
            
            if (foundUser.equalsIgnoreCase("Found User LDAP")) {
                if (isValidUser) {//validasi untuk user
                    message = "Failed, username is already registered in CM";
                } else {
                    dbData2.addDataUser(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                }
            }
//            System.out.println("addDataUser");
        } else {
            if (request.getParameter("delete_user") == null) {
                dbData2.updateDataUser(data, user_id, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
//                System.out.println("updateDataUser");
            } else {
                System.out.println("DISABLE PERMANENT USER");
               // dbData2.delete(user_id, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
//                System.out.println("delete");
                dbData.disablePermanent(user_id, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                        
            }
        }
        try {
            log.info("processRequest-2");
        } catch (Exception ex) {
            log.error(ex.getMessage());
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
        session.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("SCDataUserList");
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
            try {
                processRequest(request, response);
            } catch (SQLException ex) {
                log.error(ex.getMessage());
            }
        } catch (NoSuchAlgorithmException ex) {
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
            try {
                processRequest(request, response);
            } catch (SQLException ex) {
                log.error(ex.getMessage());
            }
        } catch (NoSuchAlgorithmException ex) {
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
