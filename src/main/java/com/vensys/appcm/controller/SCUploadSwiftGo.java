/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataBICGO;
import com.vensys.appcm.dbase.DBconnection;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Level;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.DataBICSwiftGo;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

/**
 *
 * @author ovasae
 */
public class SCUploadSwiftGo extends HttpServlet {

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
            throws ServletException, IOException, FileUploadException, SQLException {
        HttpSession session = request.getSession();
        DBconnection dbConn = new DBconnection();
        DBDataBICGO db = new DBDataBICGO(dbConn.getConnection());
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        List<DataBICSwiftGo> dataList = new ArrayList<>();
        if (isMultipart) {
            try {
//                log.info("try 61");
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = upload.parseRequest(request);
                Iterator iter = items.iterator();
                FileItem item = (FileItem) iter.next();
                InputStream mytxt = item.getInputStream();
                String text = null;
                try (Scanner scanner = new Scanner(mytxt, StandardCharsets.UTF_8.name())) {
                    text = scanner.useDelimiter("\\A").next();
                }
                String[] arrText = text.split("\r\n");
                for (int i = 1; i < arrText.length; i++) {
//                    log.info("for 74");
                    DataBICSwiftGo dataSwiftgo = new DataBICSwiftGo();
                    String[] tokens = arrText[i].split("\\t");
                    dataSwiftgo.setModification_flag(tokens[0]);
                    dataSwiftgo.setSwift_code(tokens[6]);
                    dataSwiftgo.setCompany(tokens[8]);
                    dataSwiftgo.setUpdateBy(session.getAttribute("user_id").toString());
                    dataList.add(dataSwiftgo);
                }

                db.truncateSwiftGoBulk();
                db.addSwiftGoBulk(dataList);
                db.insertSwiftGoFromTemp();
                db.deleteSwiftGoBulk();
//                db.updateSwiftGoBulk();
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("upload_swift_go.jsp?status=y126");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                log.error("error upload : " + e.toString());
                e.printStackTrace();
                session.setAttribute("err", e.toString());
                RequestDispatcher dispatcher = request.getRequestDispatcher("upload_swift_go.jsp?status=x126");
                dispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("upload_swift_go.jsp?status=x126");
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
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            java.util.logging.Logger.getLogger(SCUploadSwiftGo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SCUploadSwiftGo.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (FileUploadException ex) {
            java.util.logging.Logger.getLogger(SCUploadSwiftGo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SCUploadSwiftGo.class.getName()).log(Level.SEVERE, null, ex);
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
