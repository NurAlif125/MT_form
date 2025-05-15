/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.google.gson.Gson;
import com.vensys.appcm.dbase.DBBIC;
import com.vensys.appcm.dbase.DBconnection2;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.ArrayList;
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
import com.vensys.appcm.model.DataBIC;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;


/**
 *
 * @author HP PROBOOK 430 G8
 */
public class SCUploadBIC extends HttpServlet {
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
        DBconnection2 dbConn = new DBconnection2();
        DBBIC db = new DBBIC(dbConn.getConnection2());
        Gson gson = new Gson();
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        List<String> dataList = new ArrayList<>();
        log.info("cek masuk");
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
                String[] arrText = text.split("\n");
                log.info("cek lenght"+ arrText.length);
                for (int i = 1; i < arrText.length; i++) {
//                    log.info("for 74");
                    DataBIC dataBIC = new DataBIC();
                    String otherThanQuote = " [^\"] ";
                    String quotedString = String.format(" \" %s* \" ", otherThanQuote);
//                    log.info("quotedString : "+quotedString);
                    String regex = String.format("(?x) "
                            + // enable comments, ignore white spaces
                            ",                         "
                            + // match a comma
                            "(?=                       "
                            + // start positive look ahead
                            "  (?:                     "
                            + //   start non-capturing group 1
                            "    %s*                   "
                            + //     match 'otherThanQuote' zero or more times
                            "    %s                    "
                            + //     match 'quotedString'
                            "  )*                      "
                            + //   end group 1 and repeat it zero or more times
                            "  %s*                     "
                            + //   match 'otherThanQuote'
                            "  $                       "
                            + // match the end of the string
                            ")                         ", // stop positive look ahead
                            otherThanQuote, quotedString, otherThanQuote);
//                    log.info("regex: "+regex);
                    String[] tokens = arrText[i].split(regex, -1);
                    dataBIC.setCode_member(tokens[0]);
                    dataBIC.setCompany(tokens[7]);
                    dataBIC.setAddress(tokens[6]);
                    dataBIC.setNote(tokens[9]);
                    String json = gson.toJson(dataBIC);
                    dataList.add(json);
                }
                //db.truncateBICBulk();
                db.addBICBulk(dataList);
                //db.insertBICFromTemp();
                //db.deleteBICBulk();
                log.info("cek upload");
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("uploadbic.jsp?status=y126");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                log.error("error upload : " + e.toString());
                e.printStackTrace();
                session.setAttribute("err", e.toString());
                RequestDispatcher dispatcher = request.getRequestDispatcher("uploadbic.jsp?status=x126");
                dispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("uploadbic.jsp?status=x126");
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
            java.util.logging.Logger.getLogger(SCUploadBIC.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SCUploadBIC.class.getName()).log(Level.SEVERE, null, ex);
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
            java.util.logging.Logger.getLogger(SCUploadBIC.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(SCUploadBIC.class.getName()).log(Level.SEVERE, null, ex);
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
