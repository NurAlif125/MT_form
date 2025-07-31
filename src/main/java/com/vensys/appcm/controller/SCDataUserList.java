/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataUser;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataUser;
import org.apache.log4j.Logger;

/**
 *
 * @author hadi
 */
public class SCDataUserList extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Logger log = Logger.getLogger(getClass().getName());

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession httpSession = request.getSession();
        String find = request.getParameter("find");
        String user_id = request.getParameter("s_user_id");
        String name = request.getParameter("s_name");
        String description = request.getParameter("s_description");
        
        if ((user_id != null && !user_id.matches("[a-zA-Z0-9_]+")) || (name != null && !name.matches("[a-zA-Z0-9_]+")) || (description != null && !description.matches("[a-zA-Z0-9_]+"))) {
            log.warn("Blocked suspicious _s_user_id, _s_name, _s_description input: " + user_id + name + description);
            response.sendError(400);
            return;
        }
        
        DBconnection dbConn = new DBconnection();
        List<DataUser> dataUser = new ArrayList<DataUser>();
        DBDataUser db = new DBDataUser(dbConn.getConnection());
//        System.out.println("find=" + find);
        try {
            log.info("processRequest");
            if (find == null || find.isEmpty()) {
                dataUser = db.getAllDataUser();
//                System.out.println("if");
            } else {
                dataUser = db.getAllDataUser(user_id, name, description);
//                System.out.println("else");
            }

            httpSession.setAttribute("dataUser", dataUser);
        } catch (Exception ex) {
            log.error(ex.getMessage());
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("VDataUser.jsp");
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
