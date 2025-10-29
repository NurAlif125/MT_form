<%-- 
    Document   : VExcluteDuplicate
    Created on : 9 Oct 2025, 18.38.53
    Author     : isal
--%>

<%@ include file="header.jsp" %>
<link type="text/css" href="css/paging/pagingheader.css" rel="stylesheet" />
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<link rel="stylesheet" href="css/datatables-custom.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<!--<script src="js/jquery-3.7.1.min_cdn"></script>-->
<script src="js/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="css/datatables-custom-wf-logs.css">
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<% int rowNum = 1;%>
<c:forEach var="item" items="${role}">
    <c:if test="${item == 'ROLE:EXCDUPL'}">
    <div id="isi">
        <div id="judul"><center>List of Exclute Duplicate</center></div>
        <div id="rowsearch">
            <c:forEach var="item" items="${role}">
                <c:if test="${item == 'ADM:MAKER'}">
                    <a id="myBtn" href="VExcluteDuplicate.jsp" class="simple-help srb2">Add Exclude Duplicate</a>
                </c:if>
            </c:forEach>
           <div class="my-navigation"> </div>
        </div>
         <br/>
          <c:if test="${not empty sessionScope.message}">
                    <div id="message">
                        <span class="style1">
                            <div align="center">
                                <c:out value="${sessionScope.message}" />
                            </div>
                        </span>
                    </div>
                    <c:remove var="message" scope="session" />
                </c:if>
            <div id="content">
                <table id="example" class="display nowrap" style="width:100%; overflow-x: scroll;">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>I/O Type</th>
                            <th>Message Type</th>
                            <th>Enable/Disable</th>
                            <th>View</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${dataExcDupplicate}" var="item">
                            <tr>
                                <td><%=rowNum++%></td>
                                <td>${item.ioType}</td>
                                <td>${item.msgType}</td>
                                <td>${item.isEnable}</td>
                                <td><a href="VExcluteDuplicate?id=${item.id}" class="btnView" data-id="${item.id}" style="cursor:pointer;">view</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                        <tfoot></tfoot>
                </table>
            </div>                   
        </div>
    </c:if>
</c:forEach>


<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            "scrollX": true,
            "columnDefs": [
                {
                    className: "dt-head-left", 
                    targets: "_all"
                }, 
                {
                    orderable: false, targets: [0, 4] 
                }
            ] 
        });
    });

   $('#example thead input').on('click keydown keyup', function(e) {
        e.stopPropagation();
    });

    $('#example tfoot tr').appendTo('#example thead');
</script>

<script type="text/javascript">

//    // Get the modal
//    var modal = document.getElementById("myModal");
//    // Get the button that opens the modal
//    var btn = document.getElementById("myBtn");
//    // Get the <span> element that closes the modal
//    var span = document.getElementsByClassName("close")[0];
//
//    // When the user clicks the button, open the modal 
//    btn.onclick = function () {
//        modal.style.display = "block";
//    }
//
//    // When the user clicks on <span> (x), close the modal
//    span.onclick = function () {
//        modal.style.display = "none";
//    }
//    
//    document.getElementById("closeAdd").onclick = function() {
//        modal.style.display = "none";
//    }
//    
//    document.getElementById("editBackAdd").onclick = function() {
//        modal.style.display = "none";
//    }
//    
//    // When the user clicks anywhere outside of the modal, close it
//    window.onclick = function (event) {
//        if (event.target == modal) {
//            modal.style.display = "none";
//        } 
//    }
//
//
//    document.addEventListener("DOMContentLoaded", function() {
//        var modalEdit = document.getElementById("myModalEdit");
//        var tableBody = document.querySelector("#example tbody"); // tbody tabel kamu
//        var spanEdit = document.getElementById("closeEdit");
//
//        // Event delegation: tangkap klik di tombol view
//        tableBody.addEventListener("click", function(e) {
//            if(e.target && e.target.classList.contains("btnView")) {
//                var id = e.target.getAttribute("data-id");
//                modalEdit.style.display = 'block';
//
//                fetch('ActionExcDuplicate?id=' + id)
//                    .then(response => response.json())
//                    .then(data => {
//                        console.log(data);
//                        document.getElementById('id_data_edit').value = data.id || '';
//                        document.getElementById('inp_io_type').value = data.ioType || '';
//                        document.getElementById('inp_msg_type').value = data.msgType || '';
//
//                        if(data.isEnable == 1){
//                            document.getElementById('status_enable').checked = true;
//                        } else {
//                            document.getElementById('status_disable').checked = true;
//                        }
//                    })
//                    .catch(err => console.error(err));
//            }
//        });
//
//        // Close modal
//        spanEdit.onclick = function () {
//            modalEdit.style.display = "none";
//        };
//        
//        document.getElementById("closeEditForm").onclick = function() {
//            modalEdit.style.display = "none";
//        }
//
//        document.getElementById("editBack").onclick = function() {
//            modalEdit.style.display = "none";
//        };
//
//        var modalAdd = document.getElementById("myModal");
//        window.onclick = function (event) {
//            if (event.target == modalEdit) {
//                modalEdit.style.display = "none";
//            } else if (event.target == modalAdd) {
//                modalAdd.style.display = "none";
//            }
//        }
//    });

    

    
    



</script>