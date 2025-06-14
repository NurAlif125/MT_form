package com.vensys.appcm.controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.vensys.appcm.dbase.DBDataTemplateMT;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.HeaderTemplate;
import com.vensys.appcm.model.TagTemplateDB;

/**
 *
 * @author rahma
 */
public class VDataTemplateMT extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String iscreate = request.getParameter("create");
        String mt = request.getParameter("mt");
        Map<String, Object> additionalData = new HashMap<>();
        HttpSession httpSession = request.getSession();
        DBconnection dbConn = new DBconnection();
        HeaderTemplate templateById = new HeaderTemplate();
        List<HeaderTemplate> relation = new ArrayList<HeaderTemplate>();
        List<TagTemplateDB> tags = new ArrayList<TagTemplateDB>();
        DBDataTemplateMT bBHeadersTemplate = new DBDataTemplateMT(dbConn.getConnection());
        String ltedit = request.getParameter("ltedit");
        String prefix = "";
        String id = "";
        String messagetype = "";
        try {
            if (iscreate != null) {
                if (iscreate.equals("true")) {
                    templateById = bBHeadersTemplate.getHeaderTemplateByMTName(mt);
                    id = String.valueOf(templateById.getId_Templates());
                    messagetype = templateById.getMessageType();
                    if (id.equals("0")) {
                        request.getSession().setAttribute("Template", "create");
                    } else {
                        request.getSession().setAttribute("Template", "edit");
                        request.getSession().setAttribute("idlt", id);
                    }
                }
            } else {
                templateById = bBHeadersTemplate.getHeaderTemplateById(request.getParameter("idlt"));
                id = request.getParameter("idlt");
                messagetype = templateById.getMessageType();
                if (id.equals("0")) {
                    request.getSession().setAttribute("Template", "create");
                } else {
                    request.getSession().setAttribute("Template", "edit");
                }
            }

            // System.out.println("id: " + request.getParameter("idlt"));
            httpSession.setAttribute("messageType", templateById.getMessageType());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        try {
            if (iscreate != null) {
                if (iscreate.equals("true")) {
                    tags = bBHeadersTemplate.getAllTagTemplateById(id);
                }
            } else {
                tags = bBHeadersTemplate.getAllTagTemplateById(request.getParameter("idlt"));

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        dbConn.closeConnection();
        request.setAttribute("headerById", templateById);
        request.setAttribute("tags", tags);
        if (messagetype == null || messagetype.equals("null") || messagetype.isEmpty()) {
            request.setAttribute("message_type", templateById.getMessageType());
        } else {
            request.setAttribute("message_type", templateById.getMessageType().trim());
        }

        if (ltedit != null) {
            request.getSession().setAttribute("ltStatus", "true");
            request.getSession().setAttribute("flagStatus", "LTEM");
            RequestDispatcher view = request.getRequestDispatcher("mt" + templateById.getMessageType() + ".jsp?ltedit=true");
            view.forward(request, response);
        } else {
            RequestDispatcher view = request.getRequestDispatcher("/ControllerHeaderTemplate");
            view.forward(request, response);
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
