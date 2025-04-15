/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.google.gson.Gson;
import com.prowidesoftware.swift.model.mx.AbstractMX;
import com.prowidesoftware.swift.model.mx.MxPacs00800108;
import com.prowidesoftware.swift.model.mx.MxPacs00900108;
import com.vensys.appcm.rulePacs.rulePacs008;
import com.vensys.appcm.rulePacs.rulePacs008_2024;
import com.vensys.appcm.rulePacs.rulePacs009;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author rafli
 */
@WebServlet(name = "SCValidateMX", urlPatterns = {"/SCValidateMX"})
public class SCValidateMX extends HttpServlet {

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
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        String dataXml = request.getParameter("dataXML");
        String logicalTerminal = request.getParameter("sender");
        String receiverAddress = request.getParameter("receiver");
        AbstractMX abstractMX = AbstractMX.parse(dataXml);
        if (abstractMX.getMxId().id().toLowerCase().contains("pacs.008")) {
            MxPacs00800108 dataMXpacs008 = (MxPacs00800108) abstractMX;
            rulePacs008_2024 rulepacs008 = new rulePacs008_2024 (dataMXpacs008);
            rulepacs008.runRules(logicalTerminal, receiverAddress);
            String errorRulePacs008 = rulepacs008.getErrorRule();
            System.out.println(errorRulePacs008);
            out.print(errorRulePacs008);
            System.out.println(gson.toJson(errorRulePacs008));
        } else if (abstractMX.getMxId().id().toLowerCase().contains("pacs.009")) {
            if (abstractMX.getMxId().getBusinessService().toString().contains("cov")) {
                MxPacs00900108 dataMXpacs009 = (MxPacs00900108) abstractMX;
            } else if (abstractMX.getMxId().getBusinessService().toString().contains("adv")) {
                MxPacs00900108 dataMXpacs009 = (MxPacs00900108) abstractMX;
            } else {
                MxPacs00900108 dataMXpacs009 = (MxPacs00900108) abstractMX;
                rulePacs009 rulepacs009 = new rulePacs009 (dataMXpacs009);
                rulepacs009.runRules();
                String errorRulePacs009 = rulepacs009.getErrorRule();
                System.out.println(errorRulePacs009);
                out.print(errorRulePacs009);
                System.out.println(gson.toJson(errorRulePacs009));
            }
        }
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
