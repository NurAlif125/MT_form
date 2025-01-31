/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBNegaraSuspect;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataNegaraSuspect;

/**
 *
 * @author Vensys-Dev
 */
public class SCNegaraSuspect extends HttpServlet {

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
        DataNegaraSuspect data = new DataNegaraSuspect();
        DBNegaraSuspect dbData = new DBNegaraSuspect(dbConn.getConnection());
        HttpSession session = request.getSession();
        String id_negara = request.getParameter("id_negara");
        String kode_negara = request.getParameter("kode_negara");
        String nama_negara = request.getParameter("nama_negara");
        String action = request.getParameter("action");
        data.setKode_negara(request.getParameter("kode_negara"));
        data.setNama_negara(request.getParameter("nama_negara"));
        String strErrMsg = null;
        RequestDispatcher dispatcher = null;
        List<String> duplicate = dbData.cekDataDuplicateCountry(kode_negara, nama_negara);
        System.out.println("Data Duplicate : " + duplicate.size());
        if (action == null) {
            if (duplicate.size() > 0) {
                strErrMsg = "Country Suspect Already Exist";
                session.setAttribute("errorMsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("addnegara.jsp");
                dispatcher.forward(request, response);
                log.info(strErrMsg);
                System.out.println("Data Telah Ada Sebelumnya");
            } else if (id_negara == null ? "null" == null : id_negara.equals("null") || id_negara.isEmpty()) {
                dbData.addNegaraSuspect(data);
                System.out.println("Data Telah Terinput");
                dispatcher = request.getRequestDispatcher("SCNegaraSuspectList");
//            System.out.println("addBic");
            } else {
                dbData.updateNegaraSuspect(data, Integer.parseInt(id_negara));
                dispatcher = request.getRequestDispatcher("SCNegaraSuspectList");
//            System.out.println("updateBic");
            }
        } else {
            dbData.delete(Integer.parseInt(id_negara));
            dispatcher = request.getRequestDispatcher("SCNegaraSuspectList");
        }

        try {
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
//        RequestDispatcher dispatcher = request.getRequestDispatcher("SCNegaraSuspectList");
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
            Logger.getLogger(SCNegaraSuspect.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SCNegaraSuspect.class.getName()).log(Level.SEVERE, null, ex);
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

