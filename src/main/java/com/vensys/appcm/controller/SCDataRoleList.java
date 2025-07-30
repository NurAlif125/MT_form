package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBDataRole;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.DataRole;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SCDataRoleList extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Logger log = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession httpSession = request.getSession();
        String find = request.getParameter("find");
        String role_name = request.getParameter("_s_role_name");

        if (role_name != null && !role_name.matches("^[a-zA-Z0-9_\\- ]{1,50}$")) {
            log.warn("Blocked suspicious _s_role_name input: " + role_name);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameter");
            return;
        }

        DBconnection dbConn = new DBconnection();
        List<DataRole> dataRole = new ArrayList<>();

        try {
            log.info("Processing SCDataRoleList...");

            DBDataRole db = new DBDataRole(dbConn.getConnection());

            if (find == null || find.isEmpty()) {
                dataRole = db.getAllDataRole();
            } else {
                dataRole = db.getAllDataRole(role_name);
            }

            httpSession.setAttribute("dataRole", dataRole);

        } catch (Exception ex) {
            log.error("Exception: " + ex.getMessage(), ex);
        } finally {
            dbConn.closeConnection();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("VDataRole.jsp");
        dispatcher.forward(request, response);
    }
}