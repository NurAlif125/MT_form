/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataGeneralSetting;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataGeneralSetting;
import org.apache.log4j.Logger;

/**
 *
 * @author HP
 */
public class SCGeneralSetting extends HttpServlet {

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
        DataGeneralSetting data = new DataGeneralSetting();
        DBDataGeneralSetting dbData = new DBDataGeneralSetting(dbConn.getConnection());
        HttpSession session = request.getSession();
        String id = request.getParameter("idgs");
        data.setHostname(request.getParameter("hostname"));
        data.setAppversion(request.getParameter("appversion"));
        data.setMT103(request.getParameter("mt103"));
        data.setMT110(request.getParameter("mt110"));
        data.setMT111(request.getParameter("mt111"));
        data.setMT191(request.getParameter("mt191"));
        data.setMT192(request.getParameter("mt192"));
        data.setMT202(request.getParameter("mt202"));
        data.setMT192(request.getParameter("mt192"));
        data.setMT196(request.getParameter("mt196"));
        data.setMT950(request.getParameter("mt950"));
        // System.out.println("id"+id);
        if (id == null || id.equals("null") || id.isEmpty()) {
            // System.out.println("masuk id null");
            data = dbData.getDataGS();
        } else {
            // System.out.println("masuk id not null");
            data.setId(Integer.parseInt(id));
            int update = dbData.updateDataGS(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            if (update > 0) {
                request.setAttribute("updateResult", "Update data success");
            } else {
                request.setAttribute("updateResult", "Update data failed");
            }
            data = dbData.getDataGS();
        }
        session.setAttribute("dataGS", data);
        try {
            log.info("processRequest");
        } catch (Exception ex) {
            log.error(ex.getMessage());
        } finally {
            dbConn.closeConnection();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("general_setting.jsp");
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
            java.util.logging.Logger.getLogger(SCGeneralSetting.class.getName()).log(Level.SEVERE, null, ex);
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
            java.util.logging.Logger.getLogger(SCGeneralSetting.class.getName()).log(Level.SEVERE, null, ex);
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
