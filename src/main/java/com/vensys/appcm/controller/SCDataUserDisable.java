/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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
import java.util.List;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;


public class SCDataUserDisable extends HttpServlet {
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
            throws ServletException, IOException {
//        set string
        HttpSession httpsession = request.getSession();
        String user_id =request.getParameter("user_id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String role = request.getParameter("role");
        String disable_permanent_date = request.getParameter("disable_permanent_date");
//        get koneksi
        DBconnection dbConn = new DBconnection();
        DataUser data = new DataUser();
        DBDataUser dbData = new DBDataUser(dbConn.getConnection());
        DBUserData dbo = new DBUserData(dbConn.getConnection());
        
        try{
            List<DataUser> disablePermanentUser = dbData.getAllDataUserDisable();
              System.out.println("data user disable : "+disablePermanentUser);
              System.out.println("eusi disablenateh aya :"+disablePermanentUser.size());
            httpsession.setAttribute("datadisable", disablePermanentUser); //kirim data ke FE (yang dalam kutip)
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        finally{ dbConn.closeConnection();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("VDatauserDisable.jsp?action=true");
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
        processRequest(request, response);
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
        processRequest(request, response);
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

