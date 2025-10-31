<%-- 
    Document   : workflow_logs
    Created on : 27 Aug 2025, 13.08.35
    Author     : isal
--%>

<%@ include file="header.jsp" %>
<link type="text/css" href="css/paging/pagingheader.css" rel="stylesheet" />
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<script src="js/jquery-3.7.1.min_cdn"></script>
<script src="js/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"></script>
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<script src="js/flatpickr.js"></script>
<link rel="stylesheet" href="css/flatpickr.css">
<link rel="stylesheet" href="css/datatables-custom-wf-logs.css">
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
    String formattedDate = sdf.format(new java.util.Date());
    pageContext.setAttribute("tgl_today", formattedDate);
%>
<c:set var="tgl_today" value="${tgl_today}" />


<div id="isi">
     <div id="judul">List of Workflow Logs</div>
     
    <div id="rowsearch">
       <div id="myBtn" class="btnLink simple-help">Search</div>
       <div class="my-navigation">
           <!--<div class="simple-help"><a id="myBtn" style="cursor:pointer;" ><img class="img-help" src="images/help.png"/></a></div>-->
       </div>
    </div>
     <br/>
    <div id="content">
        <table id="example" class="display nowrap" style="width:100%; overflow-x: scroll;">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Date Time</th>
                    <th>Component Name</th>
                    <th>Message Type</th>
                    <th>File Name Original</th>
                    <th>File Name</th>
                    <th>Refference</th>
                    <th>Status</th>
                    <th>Description</th>
                    <th>Source</th>
                    <!--<th>Action</th>-->
                </tr>
            </thead>
            <tbody></tbody>
                <tfoot>
                    <tr id="filterRow">
                        <th></th>
                        <th><input type="text" class="column-search" placeholder_="Search Date Time"></th>
                        <th><input type="text" class="column-search" placeholder_="Search Component Name"></th>
                        <th><input type="text" class="column-search" placeholder_="Search Message Type"></th>
                        <th><input type="text" class="column-search" placeholder_="Search File Name Original"></th>
                        <th><input type="text" class="column-search" placeholder_="Search File Name"></th>
                        <th><input type="text" class="column-search" placeholder_="Search Refference"></th>
                        <th><input type="text" class="column-search" placeholder_="Search Status"></th>
                        <th><input type="text" class="column-search" placeholder_="Search Description"></th>
                        <th><input type="text" class="column-search" placeholder_="Search Source"></th>
                        <!--<th></th>-->
                    </tr>
                </tfoot>
            </table>
        </div>
</div>


<!-- The Modal -->
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-wrapper">
        <div class="modal-head">
            <span class="close">&times;</span>
        </div>
        <div class="modal-content" style="height: 60vh !important; width:780px !important; overflow-y: auto;">
            <h3 style="text-align:center;">Search Workflow Logs</h3>
            <form method="get" action="SCWorkflowLogs" style="padding:20px;">
                <input type="hidden" name="find" value="yes">
                <div class="form-row"><span class="labelL">Date From</span>
                    <input id="date_from" name="date_from" readonly="true" autocomplete="off" type="text" class="datetime-picker flatpickr-input" pattern=".*(\+|-)((0[0-9])|(1[0-4])):[0-5][0-9]" />
                </div>
                <div class="form-row"><span class="labelL">Date End</span>
                    <input id="date_end" name="date_end"  readonly="true" autocomplete="off" type="text" class="datetime-picker flatpickr-input" pattern=".*(\+|-)((0[0-9])|(1[0-4])):[0-5][0-9]" />
                </div>
                <div class="form-row"><span class="labelL">No Refference</span>
                    <input id="no_refference" name="no_refference" autocomplete="off" type="text" />
                </div>
                <div class="form-row">
                    <input type="submit" name="search" id="search" value="Search" />
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/datatables-wf-logs.js"></script>
