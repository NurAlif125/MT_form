<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
 <link href="fontawesome/css/all.css" rel="stylesheet">

<div id="isi">
    <% int totalDatas = ((Integer) session.getAttribute("numOfBic"));%>
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'FIACONF:LIST'}">
            <div id="judul">List of configuration
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'ADM:MAKER'}">
                        <a href="VFIA" class="srb2">Add config</a>
                        <!-- <a href="uploadbic.jsp" class="srb4">Upload config</a>    -->
                    </c:if>
                </c:forEach>
            </div>
            <div id="content">
                <!--For showing total pages-->
                <select hidden id="select-page">
                    <%
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
                            <th>Source</th>
                            <th>Message Type</th>
                            <th>Need Chekc AML</th>
                            <th>Need Converted</th>
                            <th>Source To</th>
                            <th>Enabled</th>
                        </tr>
                    </thead>                    
                  
                </table>
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
                'url' : 'AjaxFIA.jsp',
                'data' : function (data){
                    data.offset = $('#select-page').val();
                }
            },
            "columnDefs": [
                {
                    "targets": 1,
                    "render": function(data, type, row) {
                        return '<span style="cursor: pointer;color: #28787C; font-weight: bold;">'+data+'</span>';
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
            window.location.href = `VFIA?id=`+data[0];
        });
    });
</script>
