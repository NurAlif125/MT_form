/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBconnection;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author LENOVO
 */
public class SCUploadConfirmationtoFile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Logger log = LogManager.getLogger(getClass().getName());

    DBconnection dbConn = new DBconnection();
    Properties prop = new Properties();
    InputStream inputStream = SCUploadConfirmationtoFile.class.getClassLoader().getResourceAsStream("/db.properties");

    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 10;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        prop.load(inputStream);
        String dirImportInward = prop.getProperty("dirExcel");
        String binImportInward = prop.getProperty("dirTemp");

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
        String uploadFolder = dirImportInward;
        log.info("uploadFolder: " + uploadFolder);
        String readUploadFolder = binImportInward;

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        log.info("upload: " + upload);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            // Parse the request
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
//                log.info("context before: " + item.getString());
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    log.info("fileName: " + fileName);
                    String filePath = uploadFolder + File.separator + fileName;
                    log.info("filePath: " + filePath);

                    try {
                        //stored in bin
                        File uploadedReadFile = new File(readUploadFolder + File.separator + fileName);
                        item.write(uploadedReadFile);

                        uploadedReadFile.renameTo(new File(filePath));
                        uploadedReadFile.delete();

                        // displays done.jsp page after upload finished
                        //20201105 ditambah status
                        RequestDispatcher dispatcher = request.getRequestDispatcher("upload_confirmation.jsp?status=y126");
                        dispatcher.forward(request, response);
                    } catch (IOException ex) {
                        ex.printStackTrace();
                        log.error("readFileContent():" + ex.toString());
                        // displays done.jsp page after upload finished
                        //20201105 ditambah status
                        RequestDispatcher dispatcher = request.getRequestDispatcher("upload_confirmation.jsp?status=x126");
                        dispatcher.forward(request, response);
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
