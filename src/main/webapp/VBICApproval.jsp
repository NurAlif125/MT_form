<%-- 
    Document   : VBICApproval
    Created on : May 4, 2025, 3:40:41 PM
    Author     : rafli
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
 <link href="fontawesome/css/all.css" rel="stylesheet">

<div id="isi">
    <% int totalDatas = ((Integer) session.getAttribute("numOfBic"));%>
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MEMBER_CODE:APPROVAL'}">
            <div id="judul">Waiting Approval BIC
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'MEMBER_CODE:LIST'}">
                        <a href="SCBICList" class="srb3">BIC List</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="content">
                <!--For showing total pages-->
                <select hidden id="select-page">
                    <%
                        // total data devide by 25k to decide how much total page that we 
                        // have to provide
                        for (int i = 0 ; i<= (int) Math.ceil(totalDatas/5000d)-1; i++){
                            if (i == 0){
                    %>
                                <option selected value='<%=i%>'>Page - <%=i+1%></option>
                    <%
                            }
                            else {
                    %>
                                <option value='<%=i%>'>Page - <%=i+1%></option>
                    <%
                            }
                        }
                    %>
                </select>
                <!--For showing total pages-->
                
                <%int rowNum = 1;%>
                <table id="example" class="display placeholder-glow" style="width:100%; height:100%;">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>BIC</th>
                            <th>Company</th>
                            <th>Address</th>
                            <th>Note</th>
                        </tr>
                    </thead>                    
                  
                </table>
                <div class="btn--group">
                    <a id="approveAll" name="approveAll" href="SCApproveBIC" class="srb">Approve All</a>
                    <a id="rejectAll" name="rejectAll" href="SCRejectBIC" class="srb">Reject All</a>
                </div>
            </div><!--close content-->
        </c:if>
    </c:forEach>
</div>
<script  type="text/javascript" >

    $(document).ready(function () {       
        var dt = $('#example').DataTable({
            "paging": true,
            "scrollX": true,
            "responsive": true,
            "scrollY": '50vh',
            "scrollCollapse": true,
            "ajax": {
                'type' : 'POST',
                'url' : 'AjaxSCBCApproval.jsp',
                'data' : function (data){
                    data.offset = $('#select-page').val();
                }
            },
            "columnDefs": [
                {
                    "targets": 1,  // Kolom kedua (BIC)
                    "render": function(data, type, row) {
                        return '<span style="color: #28787C; font-weight: bold; cursor:pointer; text-decoration:underline;">'+data+'</span>';
                    }
                },
                {
                    "className": "dt-head-left",
                    "targets": "_all",
                    "defaultContent": "-",
                    "orderable" : false
                }
            ]
        });
        
        // Handle event when select box value changes
        $('#select-page').on('change', function(){
           // Reload data
           console.log ("page changed");
           $("#example").DataTable().ajax.reload();
        });
        
        
        $('#example').on('click', 'tbody tr', function() {
            // get current row data on clicked row
            var data = dt.row(this).data();
            
            // move to VBIC by get parameter id_member
            window.location.href = `VBICApproval?id_member=`+data[0];
        });
    });
</script>
<script async type="text/javascript" src="ajax/ScbicList.js"></script>