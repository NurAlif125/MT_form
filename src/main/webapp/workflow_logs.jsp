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

<style>
    #filterRow th {
        padding: 8px;
        text-align: center;
        background-color: #f8f9fa; /* Light grey background */
    }

    #filterRow input {
        width: 100%;
        box-sizing: border-box;
        padding: 5px;
    }
    
    /* Tambah jarak ke kanan teks header */
    table.dataTable thead th.sorting,
    table.dataTable thead th.sorting_asc,
    table.dataTable thead th.sorting_desc {
      padding-right: 20px !important; /* atur sesuai kebutuhan */
    }

    /* Tambah jarak pada ikon sort */
    table.dataTable thead th.sorting:after,
    table.dataTable thead th.sorting_asc:after,
    table.dataTable thead th.sorting_desc:after {
      right: 4px !important; /* geser ikon sort ke kanan */
    }
    
    #example th:nth-child(9),
    #example td:nth-child(9) {
        width: 250px !important;
        max-width: 250px !important;
        word-wrap: break-word;
        white-space: normal;
    }
    
    .datetime-picker {
      padding: 5px !important;
      border: 1px solid #ccc !important;
      border-radius: 1mm !important;
      outline: none !important;
      transition: all 0.2s ease-in-out !important;
      width: 170px !important;
      font-size: 12px !important;
    }
    .datetime-picker:focus {
      border-color: #007bff;
      box-shadow: 0 0 6px rgba(0, 123, 255, 0.4);
    }


</style>

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
                    <input id="date_from" name="date_from" readonly="true" type="text" class="datetime-picker flatpickr-input" pattern=".*(\+|-)((0[0-9])|(1[0-4])):[0-5][0-9]" />
                </div>
                <div class="form-row"><span class="labelL">Date End</span>
                    <input id="date_end" name="date_end"  readonly="true" type="text" class="datetime-picker flatpickr-input" pattern=".*(\+|-)((0[0-9])|(1[0-4])):[0-5][0-9]" />
                </div>
                <div class="form-row">
                    <input type="submit" name="search" id="search" value="Search" />
                </div>
            </form>
        </div>
    </div>
</div>

<script>
  flatpickr("#date_from", {
    enableTime: true,       
    enableSeconds: true, 
    dateFormat: "Y-m-d H:i:S",
    time_24hr: true,
    defaultDate: new Date()
  });
  
  flatpickr("#date_end", {
    enableTime: true,       
    enableSeconds: true, 
    dateFormat: "Y-m-d H:i:S",
    time_24hr: true,
    defaultDate: new Date()
  });
</script>


<script>
    $(document).ready(function () {
        $('#example').DataTable({
            "scrollX": true,
            "columnDefs": [
                {
                    "className": "dt-head-left", "targets": "_all"
                }
            ]
        });
    });
</script>
<script type="text/javascript">
    $('#chkAll').click(function () {
        $('input:checkbox').prop('checked', this.checked);
    });

    $('#example tfoot tr').appendTo('#example thead');
</script>
<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal 
    btn.onclick = function () {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>


<script>

//window.addEventListener("pageshow", function (event) {
//    if (event.persisted || window.performance && performance.navigation.type === 2) {
//        location.reload(); // Reload seluruh halaman
//    }
//});

function escapeHtml(text) {
    return $('<div>').text(text).html();
}


    $(document).ready(function () {

        const fullUrl = window.location.search && window.location.search !== "?" ? window.location.search : '';
        console.log(fullUrl);

        if ($.fn.DataTable.isDataTable('#example')) {
            $('#example').DataTable().clear().destroy(); // destroy kalau sudah ada
        }

        var table = $('#example').DataTable({
            processing: true,
            serverSide: true,
            autoWidth: false,
            ajax: {
                url: "WorkflowLogsListServlet"+ fullUrl,
                type: "GET",
                xhrFields: {
                    withCredentials: true
                },
                data: function (d) {
                    d.quicksearch = $('#example_filter input[type="search"]').val();
                },
                dataSrc: function (json) {
                console.log("Received JSON:", json);
                    return json.data;
                }
            },
            language: {
                processing: "Processing..." 
            },
            columns: [
                {data: null}, // No
                {data: "date_time"},
                {data: "component_name"},
                {data: "message_type"},
                {data: "file_name_original"},
                {data: "file_name"},
                {data: "refference"},
                {data: "status"},
                {data: "description"},
                {data: "source"}
//                {data: null} // Action
            ],
            columnDefs: [
                { orderable: false, targets: [0] }, // index kolom yang tidak ingin di-sort
                {
                    targets: 0,
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                }
                 
//                {
//                    targets: 4,
//                    render: function (data, type, row, meta) {
//                        return '<b>'+escapeHtml(row.file_name_original)+'</b>';
//                    }
//                },
//                {
//                    targets: -1,
//                    render: function (data, type, row, meta) {
//                        return '<a href="#?id=' + encodeURIComponent(row.date_time) + '">view</a>';
//                    }
//                }
            ]
            , initComplete: function () {
                const api = this.api();

                function debounce(func, delay) {
                    var timeout;
                    return function () {
                        const context = this;
                        const args = arguments;
                        clearTimeout(timeout);
                        timeout = setTimeout(() => func.apply(context, args), delay);
                    };
                }

                $('#example thead input').each(function () {
                    var colIdx = $(this).parent().index();
                    $(this).on('keyup change', debounce(function () {
                        var val = this.value;
//                    console.log(' Search column '+colIdx+' = '+val+'');
                        api.column(colIdx).search(val).draw();
                    }, 800));
                });
                
                $('#example_filter input[type="search"]').off()
                    .on('input', debounce(function () {
                        table.ajax.reload();
                }, 800));
                
                $('#example thead input').on('click', function (e) {
                    e.stopPropagation(); 
                });
                
                //ctrl+a
                $('#example thead input').on('keydown', function (e) {
                    if ((e.ctrlKey || e.metaKey) && e.key === 'a') {
                        e.preventDefault();
                        this.select();
                    }
                });
            }
        });
        

        $('#select-page').on('change', function () {
            // Reload data
            console.log("page changed");
            $("#example").DataTable().ajax.reload();
        });    
    });
    
</script>
