<%--
    Document   : controllerHeaders
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<link type="text/css" href="css/paging/pagingheader.css" rel="stylesheet" />
<link rel="stylesheet" href="js/DataTables/datatables.css">
<link rel="stylesheet" href="js/DataTables/datatables.min.css">
<script src="js/DataTables/datatables.min.js"></script>
<script src="js/DataTables/datatables.js"></script>
<script src="js/jquery-3.7.1.min_cdn"></script>
<script src="js/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"></script>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<% String menu = request.getParameter("menu");%>
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


</style>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:LIST_TRANSACTIONS'}">
            <div id="judul">List of <% if (menu.equalsIgnoreCase("1")) { %>Modification
                <% } else if (menu.equalsIgnoreCase("2")) { %> Verification
                <% } else if (menu.equalsIgnoreCase("3")) { %> Authorize
                <% } else if (menu.equalsIgnoreCase("4")) { %> Text Generation
                <% } else if (menu.equalsIgnoreCase("5")) { %> NACK
                <% } else if (menu.equalsIgnoreCase("6")) { %> Incoming Wait
                <% } else if (menu.equalsIgnoreCase("7")) { %> Incoming Settle
                <% } else if (menu.equalsIgnoreCase("12")) { %> Incoming Re-Settle
                <% } else if (menu.equalsIgnoreCase("8")) { %> Incoming Investigation
                <% } else if (menu.equalsIgnoreCase("9")) { %> Incoming OK
                <% } else if (menu.equalsIgnoreCase("10")) { %> Incoming Not OK
                <% } else if (menu.equalsIgnoreCase("11")) { %> Incoming Hold
                <% } else if (menu.equalsIgnoreCase("13")) { %> ACK
                <% } else if (menu.equalsIgnoreCase("14")) { %> Incoming Retur
                <% } else if (menu.equalsIgnoreCase("15")) { %> Incoming Confirmation
                <% } else if (menu.equalsIgnoreCase("0")) { %> Duplicate
                <% } else if (menu.equalsIgnoreCase("16")) { %> Outgoing Error
                <% } else if (menu.equalsIgnoreCase("17")) { %> Incoming Big Amount
                <% } else if (menu.equalsIgnoreCase("18")) { %> Incoming Special Rate
                <% } else if (menu.equalsIgnoreCase("19")) { %> Incoming Adjustment
                <% } else if (menu.equalsIgnoreCase("20")) { %> Modify Convert
                <% } else if (menu.equalsIgnoreCase("21")) { %> Verify Convert
                <% } else if (menu.equalsIgnoreCase("22")) { %> Reject AML
                <% } else if (menu.equalsIgnoreCase("23")) { %> Incoming Convert
                <% } else if (menu.equalsIgnoreCase("24")) { %> Incoming
                <% } else if (menu.equalsIgnoreCase("25")) { %> Incoming Convert Confirmation
                <% } else if (menu.equalsIgnoreCase("26")) { %> Incoming Reject AML
                <% } else if (menu.equalsIgnoreCase("27")) { %> Incoming Reject AML Confirmation
                <% } else if (menu.equalsIgnoreCase("28")) { %> Incoming Resend to AML
                <% } else if (menu.equalsIgnoreCase("29")) { %> Incoming Resend to AML Confirmation
                <% } else if (menu.equalsIgnoreCase("30")) { %> Incoming Resend to Channel
                <% } else if (menu.equalsIgnoreCase("31")) { %> Incoming Resend to Channel Confirmation
                <% } else if (menu.equalsIgnoreCase("32")) { %> Incoming Settle
                <% } else if (menu.equalsIgnoreCase("33")) { %> Failed to Send to SAA
                <% } else if (menu.equalsIgnoreCase("34")) { %> Failed to Send to SAA Confirmation
                <% } else if (menu.equalsIgnoreCase("35")) { %> Reject AML Confirmation
                <% } else if (menu.equalsIgnoreCase("36")) { %> Failed to Send to AML
                <% } else if (menu.equalsIgnoreCase("37")) { %> Failed to Send to AML Confirmation
                <% } else if (menu.equalsIgnoreCase("38")) { %> Failed to Send to FIA
                <% } else if (menu.equalsIgnoreCase("39")) { %> Failed to Send to FIA Confirmation
                <% } %>
                Transactions 
            </div>
            <div id="rowsearch">
                <a href="List_scr.jsp" class="btnLink">Advance search</a>
                <div class="my-navigation">
                    <div class="simple-help"><a id="myBtn" style="cursor:pointer;" ><img class="img-help" src="images/help.png"/></a></div>
                </div>
            </div>
            <br/>
            <div id="content">
                <%int rowNum = 1;%>
                <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to authorize the data(s)?');">
                    <c:if test="${flagFilter == 'VER'}">
                        <c:forEach var="item" items="${role}">
                            <c:if test="${item == 'FLOW:AUTH'}">
                                <!--<input type="submit" value="Authorize">-->
                                <input type="hidden" id="flag" name="flag" value="AUTH">
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <table id="example" class="display nowrap" style="width:100%; overflow-x: scroll;">
                        <thead>
                            <tr>
                                <%--                        <c:if test="${flagFilter == 'VER'}">
                                                            <th><input type="checkbox" name="chkAll" id="chkAll"></th>
                                </c:if>--%>
                                <th>No</th>
                                <th>MT</th>
                                <!--<th>Swift GO</th>-->
                                <th>I/O</th>
                                <th>Sequence Number</th>
                                <th>Logical terminal</th>
                                <th>Correspondent</th>
                                <th>Reference</th>
                                <th>Rel. reference</th>
                                <th>Value date</th>
                                <th>Ccy</th>
                                <th>Amount</th>
                                <th>Creation date</th>
                                <th>Status</th>
                                <th>Source</th>
                                <th>Action</th>
                                <!--                        <th>Action</th>-->
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <!--                        <tbody>
                        <c:forEach items="${headers}" var="item">
                            <tr>
                            <%--c:if test="${flagFilter == 'VER'}">
                                <td><input type="checkbox" name="chkId" id="chkId" value="${item.id_headers}"></td>
                            </c:if--%>
                            <td><%=rowNum++%></td>
                            <td>${item.messageType}</td>
                            <%--
                            <td>
                                <c:choose>
                                    <c:when test = "${fn:contains(item.block3,'111:009;')}">
                                        Yes
                                    </c:when>
                                    <c:otherwise>
                                        No
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            --%>
                            <td>${item.io_type}</td>
                            <td>${item.sequenceNumber}</td>
                            <td>${item.logicalTerminal}</td>
                            <td>${item.receiverAddress}</td>
                            <td><a href="ViewDataTransaksiOutgoing?id=${item.id_headers}">${item.trans_refference}</a></td>
                            <td>${item.trans_related_refference}</td>
                            <td>${item.trans_date_value}</td>
                            <td>${item.trans_ccy}</td>
                            <%--<td style="text-align: right"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.tag32Amount}" /></td>--%>
                            <td style="text-align: right">${item.trans_amount}</td>
                            <td>${item.tanggal}</td>
                            <td>${item.flag}</td>
                            <td>${item.source}</td>
                            <td><a href="ViewDataTransaksiOutgoing?id=${item.id_headers}">view</a></td>
                        </tr>
                        </c:forEach>
                    </tbody>-->
                        <tfoot>
                            <tr id="filterRow">
                                <th></th>
                                <th><input type="text" class="column-search" placeholder_="Search MT"></th>
                                <th><input type="text" class="column-search" placeholder_="Search I/O"></th>
                                <th><input type="text" class="column-search" placeholder_="Search Seq"></th>
                                <th><input type="text" class="column-search" placeholder_="Search Logical"></th>
                                <th><input type="text" class="column-search" placeholder_="Search Corr."></th>
                                <th><input type="text" class="column-search" placeholder_="Search Ref."></th>
                                <th><input type="text" class="column-search" placeholder_="Search Rel. Ref"></th>
                                <th><input type="text" class="column-search" placeholder_="Search Date"></th>
                                <th><input type="text" class="column-search" placeholder_="Search Ccy"></th>
                                <th><input type="text" class="column-search" placeholder_="Search Amount"></th>
                                <th><input type="text" class="column-search" placeholder_="Search Creation"></th>
                                <th><input type="text" class="column-search" placeholder_="Search Status"></th>
                                <th><input type="text" class="column-search" placeholder_="Search Source"></th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>
                </form>
            </div><!--close content-->
        </c:if>
    </c:forEach>
</div>
<!-- The Modal -->
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-wrapper">
        <div class="modal-head">
            <span class="close">&times;</span>
        </div>
        <div class="modal-content" style="height: 60vh !important; width:780px !important; overflow-y: auto;">
            <table class="modal-table" style="border:1px solid black">
                <tr>
                    <th colspan="6" style="background: #20696d;color: #ffffff;">INCOMING</th>
                </tr>
                <tr style="font-weight:bold;">
                    <td>No</td>
                    <td>Status</td>
                    <td>Menu</td>
                    <td>Kondisi</td>
                    <td>Keterangan</td>
                    <td>Alur</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>INC-CVT</td>
                    <td>Incoming Convert</td>
                    <td>Flag transaksi incoming gagal konversi</td>
                    <td>FIA gagal konversi transaksi Incoming</td>
                    <td>INC-CVT &#10141; RESEND-CNF</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>RESEND-CNF</td>
                    <td>Incoming Convert Confirmation</td>
                    <td>Flag transaksi incoming yang dikirim kembali dan perlu approval checker</td>
                    <td>User maker mengirim kembali incoming ke FIA untuk di konversi. Pada status ini sebelum dilempar ke FIA user checker harus approve terlebih dahulu</td>
                    <td>Approve : INC-CVT-RESEND<br>Reject : INC-CVT</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>INC-AML</td>
                    <td>Incoming Reject AML</td>
                    <td>Flag transaksi incoming yang sudah dilempar ke AML</td>
                    <td>Transaksi incoming yang sudah dilempar ke AML</td>
                    <td>INC-AML &#10141; AML-TERMINATE-IN</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>AML-TERMINATE-IN</td>
                    <td>Incoming Reject AML Confirmation</td>
                    <td>Flag transaksi incoming yang direject oleh user maker dan butuh konfirmasi oleh user checker</td>
                    <td>Transaksi incoming yang direject oleh user maker dan butuh konfirmasi oleh user checker apakah transaksi di tersebut di reject atau tidak. Jika tidak maka status transaksi akan dikembalikan pada status sebelumnya</td>
                    <td>Approve : REJECT<br>Reject : INC-AML</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>INC-AML-FAILED</td>
                    <td>Incoming Resend to AML</td>
                    <td>Flag transaksi incoming yang gagal kirim ke AML</td>
                    <td>Transaksi incoming yang dikirim kembali ke AML oleh maker</td>
                    <td>INC-AML-FAILED &#10141; INC-AML-FAILED-CNF</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>INC-AML-FAILED-CNF</td>
                    <td>Incoming Resend to AML Confirmation</td>
                    <td>Flag transaksi incoming yang dikirim kembali oleh maker dan perlu konfirmasi checker</td>
                    <td>Transaksi incoming yang dikirim kembali oleh maker harus disapprove oleh checker</td>
                    <td>Approve : INC-AML-RESEND<br>Reject : INC-AML-FAILED</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>UNSETTLE-INC</td>
                    <td>Incoming Resend to Channel</td>
                    <td>Flag transaksi incoming yang dikirim kembali ke Channel</td>
                    <td>Transaksi incoming yang gagal kekirim ke Channel dan akan dikirim kembali</td>
                    <td>UNSETTLE-INC &#10141; INC-RESEND-CNF</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>INC-RESEND-CNF</td>
                    <td>Incoming Resend to Channel Confirmation</td>
                    <td>Flag transaksi incoming yang dikirim kembali oleh maker dan perlu konfirmasi checker</td>
                    <td>Transaksi incoming yang dikirim kembali oleh maker harus disapprove oleh checker</td>
                    <td>Approve : INC-RESEND<br>Reject : UNSETTLE-INC</td>
                </tr>
                <tr>
                    <td>9</td>
                    <td>SETTLE</td>
                    <td>Incoming SETTLE</td>
                    <td>Transaksi incoming yang berhasil kekirim ke Channel</td>
                    <td>Transaksi Incoming berhasil dikirim ke Channel</td>
                    <td>SETTLE</td>
                </tr>
            </table>
            <br>
            <table class="modal-table" style="border:1px solid black">
                <tr>
                    <th colspan="6" style="background: #20696d;color: #ffffff;">OUTGOING</th>
                </tr>
                <tr style="font-weight:bold;">
                    <td>No</td>
                    <td>Status</td>
                    <td>Menu</td>
                    <td>Kondisi</td>
                    <td>Keterangan</td>
                    <td>Alur</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>FIA-FAILED</td>
                    <td>Failed to Send to FIA</td>
                    <td>Transaksi outgoing yang dikirim kembali ke FIA oleh maker</td>
                    <td>Flag transaksi outgoing yang gagal kirim ke FIA</td>
                    <td>FIA-FAILED &#10141; FIA-FAILED-CNF</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>FIA-FAILED-CNF</td>
                    <td>Failed to Send to FIA Confirmation</td>
                    <td>Transaksi outgoing yang dikirim kembali oleh maker harus disapprove oleh checker</td>
                    <td>Flag transaksi outgoing yang dikirim kembali oleh maker dan perlu konfirmasi checker</td>
                    <td>Approve : FIA-FAILED-RESEND<br>Reject : FIA-FAILED</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>WAITING-AML</td>
                    <td>Reject AML</td>
                    <td>Transaksi Outgoing yang sudah dilempar ke AML dan menunggu jawaban jika tidak ada jawaban user dapat melakukan reject.</td>
                    <td>Flag Transaksi Outgoing sedang menunggu jawaban dari AML</td>
                    <td>WAITING-AML &#10141; AML-TERMINATE-OUT</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>AML-TERMINATE-OUT</td>
                    <td>Reject AML Confirmation</td>
                    <td>Transaksi Incoming atau Outgoing yang belum mendapatkan jawaban dari AML dan diterminal oleh user</td>
                    <td>Flag transaksi outgoing yang direject oleh user maker dan butuh konfirmasi oleh user checker</td>
                    <td>Approve : REJECT<br>Reject : WAITING-AML</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>AML-FAILED</td>
                    <td>Failed to Send to AML</td>
                    <td>Transaksi outgoing yang dikirim kembali ke AML oleh maker</td>
                    <td>Flag transaksi outgoing yang gagal kirim ke AML</td>
                    <td>AML-FAILED &#10141; AML-FAILED-CNF</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>AML-FAILED-CNF</td>
                    <td>Failed to Send to AML Confirmation</td>
                    <td>Transaksi outgoing yang dikirim kembali oleh maker harus disapprove oleh checker</td>
                    <td>Flag transaksi outgoing yang dikirim kembali oleh maker dan perlu konfirmasi checker</td>
                    <td>Approve : ML-RESEND<br>Reject : AML-FAILED</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>UNSETTLE-OUT</td>
                    <td>Failed to Send to SAA</td>
                    <td>Transaksi outgoing yang gagal kekirim ke SAA dan akan dikirim kembali</td>
                    <td>Flag transaksi outgoing yang dikirim kembali ke SAA</td>
                    <td>UNSETTLE-OUT &#10141; WAITING-SAA-CNF</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>WAITING-SAA-CNF</td>
                    <td>Failed to Send to SAA Confirmation</td>
                    <td>Transaksi outgoing yang dikirim kembali oleh maker harus disapprove oleh checker</td>
                    <td>Flag transaksi outgoing yang dikirim kembali oleh maker dan perlu konfirmasi checker</td>
                    <td>Approve : WAITING-SAA-RESEND<br>Reject : UNSETTLE-OUT</td>
                </tr>
                <tr>
                    <td>9</td>
                    <td>CVT-MOD</td>
                    <td>Modify Convert</td>
                    <td>Transaksi outgoing yang dapat dimodifikasi oleh user maker karena outgoing gagal dikonversi</td>
                    <td>Flag transaksi outgoing yang gagal konversi</td>
                    <td>CVT-MOD &#10141; CVT-VER</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>CVT-VER</td>
                    <td>Verify Convert</td>
                    <td>Transaksi yang sedang dalam tahap verifikasi pada tingkat user checker dan dapat dikirimkan kembali ke fia untuk proses konversi (Transaksi sudah tidak dapat dimodifikasi)</td>
                    <td>Flag transaksi outgoing yang gagal konversi dalam tahap verifikasi</td>
                    <td>Approve : CVT-VER-RESEND<br>Reject : CVT-MOD</td>
                </tr>
                <tr>
                    <td>11</td>
                    <td>ACK</td>
                    <td>Acknowledge (ACK)</td>
                    <td>ACK Response message sama dengan outgoing message</td>
                    <td>Acknowledge (Transaksi Outgoing sudah mendapatkan balikan dari SAA dengan status ACK)</td>
                    <td>ACK</td>
                </tr>
                <tr>
                    <td>12</td>
                    <td>NACK</td>
                    <td>No Acknowledge (NACK)</td>
                    <td>NACK Response message sama dengan Outgoing Message</td>
                    <td>No Acknowledge (Transaksi Outgoing sudah mendapatkan balikan dari SAA dengan status NACK)</td>
                    <td>NACK</td>
                </tr>
            </table>
            <br>
            <table class="modal-table" style="border:1px solid black">
                <tr>
                    <th colspan="3" style="background: #20696d;color: #ffffff;">FLAG SEMENTARA</th>
                </tr>
                <tr style="font-weight:bold;">
                    <td>No</td>
                    <td>Status</td>
                    <td>Keterangan</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>OUT</td>
                    <td>Flag awal transaksi outgoing yang ditarik dari channel oleh FIA</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>INC</td>
                    <td>Flag awal transaksi  incoming dari SAA ke fia</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>AML-CLEAN</td>
                    <td>Response AML yang cocok dengan transaksi incoming atau outgoing dengan flag INC-AML atau WAITING-AML</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>INC-RESEND</td>
                    <td>Status transaksi incoming yang dikirim ulang karena gagal terkirim ke channel</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>WAITING-SAA</td>
                    <td>Transaksi outgoing yang sudah terkirim ke SAA dan sedang menunggu jawaban ACK/NACK</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>CVT-VER-RESEND</td>
                    <td>Flag sementara untuk memerintah fia mengirimkan kembali transaksi outgoing karena gagal konversi ke SAA</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>INC-AML-RESEND</td>
                    <td>Flag sementara untuk memerintah fia mengirimkan kembali transaksi incoming gagal kirim ke AML</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>INC-CVT-RESEND</td>
                    <td>Flag sementara untuk memerintah fia mengirimkan kembali transaksi incoming karena gagal konversi ke Channel</td>
                </tr>
                <tr>
                    <td>9</td>
                    <td>WAITING-SAA-RESEND</td>
                    <td>Flag sementara untuk memerintah fia mengirimkan kembali transaksi gagal kirim ke SAA</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>AML-RESEND</td>
                    <td>Flag sementara untuk memerintah fia mengirimkan kembali transaksi outgong gagal kirim ke AML</td>
                </tr>
                <tr>
                    <td>11</td>
                    <td>FIA-RESEND</td>
                    <td>Flag sementara untuk memerintah fia mengirimkan kembali transaksi gagal kirim ke FIA</td>
                </tr>
            </table>
        </div>
    </div>
</div>
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
//    new DataTable('#example', {
//        initComplete: function () {
//            this.api()
//                    .columns()
//                    .every(function () {
//                        let column = this;
//                        let title = column.footer().textContent;
//                        let columnIndex = column.index();
//                        let table = $('#example').DataTable();
//                        let columnCount = table.columns().count();
//
//                        let input = document.createElement('input');
//                        input.placeholder = title;
//
//                        if (columnIndex === 0 || columnIndex === columnCount - 1) {
//                            
//                        } else {
//                            column.footer().replaceChildren(input);
//                        }
//
//                        input.addEventListener('keyup', () => {
//                            if (column.search() !== this.value) {
//                                column.search(input.value).draw();
//                            }
//                        });
//                    });
//        }
//    });

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
//console.log("Document is ready");
        const fullUrl = window.location.search && window.location.search !== "?" ? window.location.search : '';
//    console.log(fullUrl);

//    console.log("Table initialized");
//
//$('#example').on('error.dt', function(e, settings, techNote, message) {
//    console.log('DataTables error:', message);
//});

        if ($.fn.DataTable.isDataTable('#example')) {
            $('#example').DataTable().clear().destroy(); // destroy kalau sudah ada
        }

        var table = $('#example').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: "headerData" + fullUrl,
                type: "GET",
                xhrFields: {
                    withCredentials: true
                },
                data: function (d) {
                    d.io_type = $('#io_type_filter').val();
                    d.flag = $('#flag_filter').val();
                    d.channel = $('#channel_filter').val();
                    d.quicksearch = $('#example_filter input[type="search"]').val();
                },
                dataSrc: function (json) {
//                console.log("Received JSON:", json);
                    return json.data;
                }
            },
            columns: [
                {data: null}, // No
                {data: "messageType"},
                {data: "io_type"},
                {data: "sequenceNumber"},
                {data: "logicalTerminal"},
                {data: "receiverAddress"},
                {data: "trans_reference"},
                {data: "trans_related_reference"},
                {data: "trans_date_value"},
                {data: "trans_ccy"},
                {data: "trans_amount"},
                {data: "tanggal"},
                {data: "flag"},
                {data: "source"},
                {data: null} // Action
            ],
            columnDefs: [
                { orderable: false, targets: [0, 14] }, // index kolom yang tidak ingin di-sort
                {
                    targets: 0,
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                {
                    targets: 6,
                    render: function (data, type, row, meta) {
                        return '<a href="ViewDataTransaksiOutgoing?id=' + encodeURIComponent(row.id_headers) + '">' + escapeHtml(row.trans_reference) + '</a>';
                    }
                },
                {
                    targets: -1,
                    render: function (data, type, row, meta) {
                        return '<a href="ViewDataTransaksiOutgoing?id=' + encodeURIComponent(row.id_headers) + '">view</a>';
                    }
                }
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



