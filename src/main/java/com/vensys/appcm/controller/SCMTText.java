/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.controller;

/**
 *
 * @author RIZKY
 */
import com.vensys.appcm.dbase.DBMTText;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.vensys.appcm.model.DataMTText;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author hadi
 */
public class SCMTText extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    Logger log = LogManager.getLogger(getClass().getName());

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DBconnection dbConn = new DBconnection();
        DataMTText textById = new DataMTText();
        DBMTText db = new DBMTText(dbConn.getConnection());
        try {
            textById = db.getMtTextById(Integer.parseInt(request.getParameter("id_headers")));
            String before = textById.getModify_mt();
            String after = textById.getFinal_mt();
            // System.out.println("woi");
            boolean areEqual = true;
            int lineNum = 1;
            while (before != null || after != null){
                if(before == null || after == null){
                    areEqual = false;
                    break;
                }
                else if(! before.equalsIgnoreCase(after)){
                    areEqual = false;
                    break;
                }
                lineNum++;
            }
            if(areEqual){
                // System.out.println("Two files have same content.");
                log.info("Two files have same content.");
            }
            else{
                // System.out.println("Two files have different content. They differ at line "+lineNum);
                // System.out.println("File1 has "+before+" and File2 has "+after+" at line "+lineNum);
                 log.info("Two files have different content. They differ at line "+lineNum);
                log.info("File1 has "+before+" and File2 has "+after+" at line "+lineNum);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            dbConn.closeConnection();
        }
        request.setAttribute("textById", textById);
        RequestDispatcher view = request.getRequestDispatcher("logTrx_mt.jsp");
        view.forward(request, response);
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
