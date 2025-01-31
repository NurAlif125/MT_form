<%-- 
    Document   : AjaxSCBC
    Created on : Jul 5, 2022, 10:02:02 AM
    Author     : Muhammad Farras Ma'ruf
--%>
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

// set offsetpage based on page numbers
int offsetPage = request.getParameter("offset") == null ? 0 : Integer.parseInt(request.getParameter("offset"));

// create connection
DBconnection dbConn = new DBconnection();
DBBIC db = new DBBIC(dbConn.getConnection());

// get data from data base by provided paremeters
List<String[]> bic = db.getPagesBicAjax((offsetPage * maxData), maxData);

// convert datas to json
String jsonResult = new Gson().toJson(bic);

// show the json
out.print("{\"data\" : " + jsonResult + "}"); 
%>
