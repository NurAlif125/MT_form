package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataCOT;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataCOT;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Servlet implementation class SCCutOfTime
 */
public class SCCutOfTime extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Logger log = LogManager.getLogger(getClass().getName());
    DBconnection dbConn = new DBconnection();
    DBDataCOT dbDataCot = new DBDataCOT(dbConn.getConnection());

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
        DataCOT data = new DataCOT();
        DBDataCOT dbData = new DBDataCOT(dbConn.getConnection());
        HttpSession session = request.getSession();

//        RequestDispatcher dispatcher = null;
        String id_sandi = request.getParameter("id_sandi");
        String sandiCOT = request.getParameter("sandi");
        String waktuStr = request.getParameter("waktu");
        String waktuEndStr = request.getParameter("waktu_end");
        String deskripsi = request.getParameter("deskripsi");
        String updateDateStr = request.getParameter("update_date");
//        String update_by = request.getParameter("update_by");
        String update_by = session.getAttribute("user_id").toString();
        String action = request.getParameter("action");
        String strErrMsg = null;

        RequestDispatcher dispatcher = null;

        // Convert strings to java.sql.Time
        Time waktu = (waktuStr != null && !waktuStr.isEmpty()) ? Time.valueOf(waktuStr) : null;
        Time waktuEnd = (waktuEndStr != null && !waktuEndStr.isEmpty()) ? Time.valueOf(waktuEndStr) : null;

        data.setSandi(request.getParameter("sandi"));
        data.setDeskripsi(request.getParameter("deskripsi"));
        data.setWaktu(waktu);
        data.setDeskripsi(deskripsi);
        data.setWaktu_end(waktuEnd);
        data.setUpdateDate(updateDateStr);
        data.setUpdate_by(update_by);
        if (id_sandi == null || id_sandi == "") {
        } else {
            data.setId_sandi(Integer.parseInt(id_sandi));
        }

        List<String> dupe = dbDataCot.cekDataDuplicateCOT(sandiCOT);
        System.out.println("Nilai sandiCOT: " + sandiCOT); // Debugging line

        if (id_sandi == null ? "null" == null : id_sandi.equals("null") || id_sandi.isEmpty()) {
            if (dupe.size() > 0) {
                strErrMsg = "data COT already exist";
                session.setAttribute("errorMsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("addCutOf.jsp");
//                dispatcher.forward(request, response);
                log.info(strErrMsg);
                System.out.println("Data telah ada");
            } else {
                dbDataCot.insertDataCOT(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                System.out.println("Data berhasil di input");
                dispatcher = request.getRequestDispatcher("SCDataCutOffList");
            }
        } else if (request.getParameter("delete") == null) {
            dbDataCot.updateDataCOT(data, Integer.parseInt(id_sandi), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            System.out.println("cot updated");
            dispatcher = request.getRequestDispatcher("SCDataCutOffList");
        } else {
            dbDataCot.removeDataCOT(Integer.parseInt(id_sandi), (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            System.out.println("data deleted");
            dispatcher = request.getRequestDispatcher("SCDataCutOffList");
        }

        try {

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }

        // RequestDispatcher dispatcher = request.getRequestDispatcher("SCDataCutOffList");
         dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
            log.error("Error in doGet: " + ex.getMessage());
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
            log.error("Error in doPost: " + ex.getMessage());
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
