/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBconnection;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Scanner;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

/**
 *
 * @author HP
 */
public class SCUploadStmt extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Logger log = Logger.getLogger(getClass().getName());

    DBconnection dbConn = new DBconnection();
    Properties prop = new Properties();
    InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");

    private static final String DATA_DIRECTORY = "data";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;

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
        prop.load(inputStream);
        String dirUploadStmt = prop.getProperty("dirUploadStmt");
        String sender = prop.getProperty("sender_logical_terminal");
//        String binUploadStmt = prop.getProperty("binUploadStmt");

        // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            return;
        }

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String uploadFolder = dirUploadStmt;
        // System.out.println("uploadFolder: " + uploadFolder);

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
//        System.out.println("upload: " + upload);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            // Parse the request
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    log.info("fileName: " + fileName);

                    try {
                        InputStream myMT = item.getInputStream();
                        String text;
                        try (Scanner scanner = new Scanner(myMT, StandardCharsets.UTF_8.name())) {
                            text = scanner.useDelimiter("\\A").next();
                        }
                        if (!text.contains("{1:F01")) {
                            text = "{1:F01" + sender + "0000000000}{2:I950BIMBMYKLXXXXN}{4:\r\n" + text + "-}";
                        }
                        FileWriter fstream = null;
                        fstream = new FileWriter(uploadFolder + File.separator + fileName);
                        BufferedWriter out = new BufferedWriter(fstream);
                        out.write(text);
                        out.close();
//                        File uploadedReadFile = new File(uploadFolder + File.separator + fileName);
//                        item.write(uploadedReadFile);
                        getServletContext().getRequestDispatcher("/upload_stmt.jsp?status=y126").forward(request, response);
                    } catch (IOException ex) {
                        ex.printStackTrace();
                        this.log.error("uploadStmt():" + ex.toString());
                        getServletContext().getRequestDispatcher("/upload_stmt.jsp?status=x126").forward(request, response);
                    }

                }
            }

        } catch (FileUploadException ex) {
            throw new ServletException(ex);
        } catch (Exception ex) {
            throw new ServletException(ex);
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
