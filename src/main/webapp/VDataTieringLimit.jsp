<%-- 
    Document   : VDataTieringLimit
    Created on : 5 Oct 2025, 13.56.21
    Author     : rafli
--%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'TIERING_LIMIT:LIST'}">
            <div id="judul">Tiering Limit Level</div>
            <form id="form1" name="form1" method="get" action="SCTieringLimit">
                <div id="tabs-1" class="formBody">
                    <div class="form-row"><span class="labelL">Level</span>
                        <select name="level" id="level">
                            <option value="">--No level Selected--</option>
                            <option value="1" <c:if test="${not empty sessionScope.slevel && sessionScope.slevel =='1'}">selected="true"</c:if> >Level 1</option>
                            <option value="2" <c:if test="${not empty sessionScope.slevel && sessionScope.slevel =='2'}">selected="true"</c:if> >Level 2</option>
                            <option value="3" <c:if test="${not empty sessionScope.slevel && sessionScope.slevel =='3'}">selected="true"</c:if> >Level 3</option>
                            <option value="4" <c:if test="${not empty sessionScope.slevel && sessionScope.slevel =='4'}">selected="true"</c:if> >Level 4</option>
                            <option value="5" <c:if test="${not empty sessionScope.slevel && sessionScope.slevel =='5'}">selected="true"</c:if> >Level 5</option>
                        </select>
                    </div>
                    <div class="form-row"><span class="labelL">Channel</span>
                        <select name="source" id="source">
                            <option value="">--No Source Selected--</option>
                            <option value="Trade Ops" <c:if test="${not empty sessionScope.schannel && sessionScope.schannel == 'Trade Ops'}">selected="true"</c:if> >Trade Ops</option>
                            <option value="Treasury Ops" <c:if test="${not empty sessionScope.schannel && sessionScope.schannel == 'Treasury Ops'}">selected="true"</c:if> >Treasury Ops</option>
                            <option value="Remittance Ops" <c:if test="${not empty sessionScope.schannel && sessionScope.schannel == 'Remittance Ops'}">selected="true"</c:if> >Remittance Ops</option>
                            <option value="Custody Ops" <c:if test="${not empty sessionScope.schannel && sessionScope.schannel == 'Custody Ops'}">selected="true"</c:if> >Custody Ops</option>
                        </select>
                    </div>
                </div>
                <div class="form-row-action">
                    <input type="button" name="back" id="back" value="Back" />
                </div>
            </form>
        </c:if>
    </c:forEach><br><br>
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'TIERING_LIMIT:LIST'}">
            <div id="judul">List of Limit
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'ADM:MAKER'}">
                        <a href="#" id="addLimit" class="srb2">Add Limit</a>
                    </c:if>
                </c:forEach>
                <c:if test="${not empty sessionScope.alertTieringLimit}">
                    <div id="message">
                        <span class="style1">
                            <div align="center">
                                <c:out value="${sessionScope.alertTieringLimit}" />
                            </div>
                        </span>
                    </div>
                <c:remove var="alertTieringLimit" scope="session" />
            </c:if>
            </div>
            
            <script type="text/javascript">
                var addLimitLink = document.getElementById("addLimit");
                var levelSelect = document.getElementById("level");
                var sourceSelect = document.getElementById("source");

                function buildLink() {
                    if (!sourceSelect.value) {
                        return "#"; 
                    }
                    var level = encodeURIComponent(levelSelect.value);
                    var source = encodeURIComponent(sourceSelect.value);
                    return "VDataLimitDetail?level=" + level + "&source=" + source;
                }

                addLimitLink.onclick = function(e) {
                    if (!levelSelect.value) {
                        e.preventDefault();           
                        alert("level must be selected!"); 
                        sourceSelect.focus();
                        return false;
                    }
                    if (!sourceSelect.value) {
                        e.preventDefault();           
                        alert("channel must be selected!"); 
                        sourceSelect.focus();
                        return false;
                    } 
                    
                    if (levelSelect.value && sourceSelect.value) {
                        addLimitLink.href = buildLink();
                    }
                };

                
                levelSelect.onchange = function() { addLimitLink.href = buildLink(); };
                sourceSelect.onchange = function() { addLimitLink.href = buildLink(); };

                
                addLimitLink.href = buildLink();
                </script>
            
            <div id="content">
                <%int rowNum = 1;%>
                <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Currency</th>
                            <th>Min. Limit</th>
                            <th>Max. Limit</th>
                            <th>Enable/Disable</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </c:if>
    </c:forEach>
<c:if test="${not empty sessionScope.slevel}"><c:remove var="slevel" scope="session" /></c:if>
<c:if test="${not empty sessionScope.schannel}"><c:remove var="schannel" scope="session" /></c:if>
</div>
<script>
    $(document).ready(function () {
        var table = $('#example').DataTable({
            "scrollX": true,
            "columnDefs": [
                {
                    "className": "dt-head-left", "targets": "_all"
                }
            ]
        });
</script>

<script>
   $(document).ready(function () {
       
        sessionStorage.removeItem('level');
        sessionStorage.removeItem('source');
       
        if (sessionStorage.getItem('level')) {
            $('#level').val(sessionStorage.getItem('level'));
        }
        if (sessionStorage.getItem('source')) {
            $('#source').val(sessionStorage.getItem('source'));
        }

        if ($.fn.DataTable.isDataTable('#example')) {
            $('#example').DataTable().clear().destroy();
        }

        var table = $('#example').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: "SCDataTieringLimit",
                type: "GET",
                data: function(d) {
                    d.level = $('#level').val() || '';
                    d.source = $('#source').val() || '';
                    d.quicksearch = $('#example_filter input[type="search"]').val() || '';
                },
                dataSrc: function(json) {
                    return json.data;
                }
            },
            columns: [
                { data: null },
                { data: "currency" },
                { data: "min_limit" },
                { data: "max_limit" },
                { data: "is_enable" },
                { data: null }
            ],
            columnDefs: [
                { orderable: false, targets: [0, 5] },
                {
                    targets: 0,
                    render: function(data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                {
                    targets: 1,
                    render: function(data, type, row, meta) {
                        return '<a href="VDataLimitDetail?id=' + row.id + '&ccy='+row.currency+'">'+row.currency+'</a>';
                    }
                },
                {
                    targets: 5,
                    render: function(data, type, row, meta) {
                        return '<a href="VDataLimitDetail?id=' + row.id + '&ccy='+row.currency+'">view</a>';
                    }
                }
            ],
            initComplete: function () {
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

                // Search per kolom
                $('#example thead input').each(function () {
                    var colIdx = $(this).parent().index();
                    $(this).on('keyup change', debounce(function () {
                        var val = this.value;
                        api.column(colIdx).search(val).draw();
                    }, 800));
                });

                // Quick search global
                $('#example_filter input[type="search"]').off()
                    .on('input', debounce(function () {
                        table.ajax.reload();
                    }, 800));

                // Stop propagation klik input
                $('#example thead input').on('click', function (e) {
                    e.stopPropagation();
                });

                // Ctrl+A untuk select semua input
                $('#example thead input').on('keydown', function (e) {
                    if ((e.ctrlKey || e.metaKey) && e.key === 'a') {
                        e.preventDefault();
                        this.select();
                    }
                });
            }
        });
        
        // reload tabel setiap kali select level/source berubah
        $('#level, #source').on('change', function() {
            sessionStorage.setItem('level', $('#level').val());
            sessionStorage.setItem('source', $('#source').val());
            table.ajax.reload();
        });
    });



</script>
