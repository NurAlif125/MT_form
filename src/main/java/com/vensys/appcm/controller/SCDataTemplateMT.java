/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataTemplateMT;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.Enumeration;
import java.util.StringTokenizer;
import java.util.logging.Level;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.HeaderTemplate;
import com.vensys.appcm.model.TagTemplateDB;
import org.apache.log4j.Logger;

/**
 *
 * @author rahma
 */
public class SCDataTemplateMT extends HttpServlet {

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
        // System.out.println("Request URL: " + request.getRequestURL());
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            // System.out.println(paramName + ": " + request.getParameter(paramName));
        }
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        HttpSession session = request.getSession();
        String edittemplate = (String) request.getSession().getAttribute("Template");
        Boolean iscreate = (Boolean) request.getSession().getAttribute("iscreate");
        String id = request.getParameter("idlt");
        String queryString = request.getQueryString();

        if (edittemplate != null) {
            if (edittemplate.equals("edit")) {
                if (id == null) {
                    id = (String) request.getSession().getAttribute("idlt");
                }
            }
        }

        String isDelete = request.getParameter("isdelete");
        String messageType = request.getParameter("messageType");
        String mt = request.getParameter("mt");
        // System.out.println("sender1: " + request.getParameter("sender_logical_terminal"));
        String sender = request.getParameter("sender_logical_terminal");
        String lastInsertedID = "";
        int cek = 0;
        DBconnection dbConn = new DBconnection();
        DBconnection2 dbConn2 = new DBconnection2();
        HeaderTemplate headertemplate = new HeaderTemplate();
        HeaderTemplate data = new HeaderTemplate();
        DBDataTemplateMT dBDataTemplateMT = new DBDataTemplateMT(dbConn.getConnection());
        DBDataTemplateMT dBDataTemplateMT2 = new DBDataTemplateMT(dbConn2.getConnection2());
        data.setName(request.getParameter("Template_Name"));

        if (mt != null) {
            if (mt.equals("202COV")) {
                messageType = mt;
            }
        }

        data.setLogicalTerminal(sender);
        data.setReceiverAddress(request.getParameter("receiver_institution"));
        data.setMessageType(messageType);
        data.setUpdateBy((String) session.getAttribute("user_id"));

        if (id == null || id.equals("null") || id.isEmpty()) {
            lastInsertedID = dBDataTemplateMT2.addDataTemplateMT(data, (String) session.getAttribute("user_id"), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            // System.out.println(lastInsertedID);
        } else if (isDelete != null) {
            if (isDelete.equals("true")) {
                try {
                    dBDataTemplateMT2.deleteDataTemplateMT(data, (String) session.getAttribute("user_id"), Integer.parseInt(id), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
                } catch (Exception ex) {
                    java.util.logging.Logger.getLogger(SCDataTemplateMT.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        } else {
            try {
                dBDataTemplateMT2.updateDataTemplateMT(data, (String) session.getAttribute("user_id"), Integer.parseInt(id), (String) session.getAttribute("ip_access"), (String) session.getAttribute("comp_name"));
            } catch (Exception ex) {
                java.util.logging.Logger.getLogger(SCDataTemplateMT.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        //data body
        TagTemplateDB tag = new TagTemplateDB();
        Enumeration names = request.getParameterNames();
        String tags;

        if (id == null || id.equals("null") || id.isEmpty() || isDelete != null) {

        } else {
            dBDataTemplateMT2.cleanDataTagTemplate(Integer.parseInt(id));
        }

        if (id == null || id.equals("null") || id.isEmpty()) {
            while (names.hasMoreElements()) {
                tags = names.nextElement().toString();
                if (tags.startsWith("_")) {
                    StringTokenizer st = new StringTokenizer(tags, "_");
                    int i = 0;
                    String arr[] = new String[st.countTokens()];
                    while (st.hasMoreElements()) {
                        arr[i] = st.nextToken().trim();
                        i++;
                    }
                    tag.setUrutan(Integer.parseInt(arr[0]));    //urutan
                    tag.setTag(arr[1].substring(2));    //tag
                    tag.setDetail(request.getParameter(tags));  //detail
                    tag.setTagName(tags);   //tagName
                    if (id == null || id.equals("null") || id.isEmpty()) {
                        if (tag.getTag().startsWith("15")) {
                            dBDataTemplateMT2.addDataTagTemplate(tag.getUrutan(), tag.getTag(), tag.getDetail(), tag.getTagName(), Integer.parseInt(lastInsertedID));
                        } else {
                            if (!tag.getDetail().isEmpty()) {
                                dBDataTemplateMT2.addDataTagTemplate(tag.getUrutan(), tag.getTag(), tag.getDetail(), tag.getTagName(), Integer.parseInt(lastInsertedID));
                            }
                        }
                    } else {
                        if (tag.getTag().startsWith("15")) {
                            cek = dBDataTemplateMT.cekDataTagsTemplate(id, tags);
                            if (cek == 0) {
                                dBDataTemplateMT2.addDataTagsBeforeNoTagsTemplate(tag.getUrutan(), id, tag.getTag(), tag.getDetail(), tag.getTagName());
                            }
                        } else {
                            if (!tag.getDetail().isEmpty()) {
                                dBDataTemplateMT2.addDataTagTemplate(tag.getUrutan(), tag.getTag(), tag.getDetail(), tag.getTagName(), Integer.parseInt(id));
                            }
                        }
                    }
                }
            }
        } else if (isDelete != null) {

        } else {
            while (names.hasMoreElements()) {
                tags = names.nextElement().toString();
                if (tags.startsWith("_")) {
                    StringTokenizer st = new StringTokenizer(tags, "_");
                    int i = 0;
                    String arr[] = new String[st.countTokens()];
                    while (st.hasMoreElements()) {
                        arr[i] = st.nextToken().trim();
                        i++;
                    }
                    tag.setUrutan(Integer.parseInt(arr[0]));    //urutan
                    tag.setTag(arr[1].substring(2));    //tag
                    tag.setDetail(request.getParameter(tags));  //detail
                    tag.setTagName(tags);   //tagName

                    cek = dBDataTemplateMT.cekDataTagsTemplate(id, tags);
                    if (cek == 0) {
                        dBDataTemplateMT2.addDataTagsBeforeNoTagsTemplate(tag.getUrutan(), id, tag.getTag(), tag.getDetail(), tag.getTagName());
                    } else {
                        dBDataTemplateMT2.updateDataTag(tag.getUrutan(), tag.getTag(), tag.getDetail(), tag.getTagName(), Integer.parseInt(id));
                    }
                }
            }
        }
        dbConn.closeConnection();
        dbConn2.closeConnection2();
        if (id == null || id.equals("null") || id.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/mt" + messageType + ".jsp?create=true");
        } else if (id != null) {
            request.getSession().setAttribute("flagStatus", "");
            request.getSession().setAttribute("idlt", null);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/ControllerHeaderTemplate");
            dispatcher.forward(request, response);
        } else if (isDelete != null) {
            if (isDelete.equals("true")) {
                request.getSession().setAttribute("flagStatus", "");
                request.getSession().setAttribute("idlt", null);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/ControllerHeaderTemplate");
                dispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/ServletControllerHome");
            dispatcher.forward(request, response);
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