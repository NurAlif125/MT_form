/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.vensys.appcm.dbase.DBDataNostro;
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
import com.vensys.appcm.model.DataNostro;
import org.apache.log4j.Logger;

/**
 *
 * @author hadi
 */
public class SCDataNostroList extends HttpServlet {

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
        String action = request.getParameter("action");

        HttpSession httpSession = request.getSession();
        String find = request.getParameter("find");
        String swift_code = request.getParameter("f_swiftCode");
        String name = request.getParameter("f_name");
        String address = request.getParameter("f_address");

        DBconnection dbConn = new DBconnection();
        List<DataNostro> dataN = new ArrayList<DataNostro>();
        DBDataNostro db = new DBDataNostro(dbConn.getConnection());
//        System.out.println("find=" + find);
        try {
            log.info("processRequest");
            if ("json".equalsIgnoreCase(action)) {
                // Case: Return JSON for Nostro picklist
                dataN = db.getAllDataNostro(); // Method ini harus mengembalikan seluruh data Nostro
                
                response.setContentType("application/json");
                ObjectMapper mapper = new ObjectMapper();
                response.getWriter().write(mapper.writeValueAsString(dataN));
            } else {
                // Case: Forward ke JSP untuk rendering halaman
                if (find == null || find.isEmpty()) {
                    dataN = db.getAllDataNostro();
                } else {
                    dataN = db.getAllDataNostro(swift_code, name, address);
                }

                httpSession.setAttribute("dataNos", dataN);
//                request.getRequestDispatcher("VDataNostro.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            log.error(ex.getMessage(), ex);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            dbConn.closeConnection();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("VDataNostro.jsp");
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
        
            () {
        return "Short description";
        }// </editor-fold>
    }
