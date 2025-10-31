
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page import="com.vensys.appcm.dbase.DBFIA"%>
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
<%@page import="com.vensys.appcm.model.DataFIA"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>

<%
// Maximum total data that avail to show
final int maxData = 5000;

// set offsetpage based on page numbers
int offsetPage = request.getParameter("offset") == null ? 0 : Integer.parseInt(request.getParameter("offset"));

// create connection
DBconnection dbConn = new DBconnection();
DBFIA db = new DBFIA(dbConn.getConnection());

// get data from data base by provided paremeters
List<String[]> fia = db.getPagesFIAPathAjax((offsetPage * maxData), maxData);

// Escape semua data untuk mencegah XSS
for (int i = 0; i < fia.size(); i++) {
    for (int j = 0; j < fia.get(i).length; j++) {
        fia.get(i)[j] = StringEscapeUtils.escapeHtml4(fia.get(i)[j]);
    }
}


// convert datas to json
String jsonResult = new Gson().toJson(fia);

// show the json
out.print("{\"data\" : " + jsonResult + "}"); 

%>
