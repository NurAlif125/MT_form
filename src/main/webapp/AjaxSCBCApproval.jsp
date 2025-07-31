<%-- 
    Document   : AjaxSCBCApproval
    Created on : May 4, 2025, 3:53:32 PM
    Author     : rafli
--%>

<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page import="com.vensys.appcm.dbase.DBBIC"%>
<%@page import="com.vensys.appcm.dbase.DBconnection"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="jakarta.servlet.RequestDispatcher"%>
<%@page import="jakarta.servlet.ServletException"%>
<%@page import="jakarta.servlet.http.HttpServlet"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="com.vensys.appcm.model.DataBIC"%>
<%@page import="com.google.gson.Gson"%>

<%
// Maximum total data that avail to show
    final int maxData = 5000;
    int offsetPage;
// set offsetpage based on page numbers
    if (request.getParameter("öffset") == null) {
        offsetPage = 0;
    } else {
        offsetPage = Integer.parseInt(request.getParameter("offset"));
    }

// create connection
    DBconnection dbConn = new DBconnection();
    DBBIC db = new DBBIC(dbConn.getConnection());

// get data from data base by provided paremeters
    List<String[]> bic = db.getPagesBicAjaxApproval((offsetPage * maxData), maxData);
    for (int i = 0; i < bic.size(); i++) {
        for (int j = 0; j < bic.get(i).length; j++) {
            bic.get(i)[j] = StringEscapeUtils.escapeHtml4(bic.get(i)[j]);
        }
    }

// convert datas to json
    String jsonResult = new Gson().toJson(bic);

// show the json
    out.print("{\"data\" : " + jsonResult + "}");
%>