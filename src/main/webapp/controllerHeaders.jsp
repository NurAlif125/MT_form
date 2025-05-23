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
                    <div class="simple-help"><a id="myBtn" ><img class="img-help" src="images/help.png"/></a></div>
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

                        <tbody>
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
                        </tbody>
                        <tfoot>
                            <tr id="filterRow">
                                <th></th>
                                <th><input type="text" class="column-search" placeholder="Search MT"></th>
                                <th><input type="text" class="column-search" placeholder="Search I/O"></th>
                                <th><input type="text" class="column-search" placeholder="Search Seq"></th>
                                <th><input type="text" class="column-search" placeholder="Search Logical"></th>
                                <th><input type="text" class="column-search" placeholder="Search Corr."></th>
                                <th><input type="text" class="column-search" placeholder="Search Ref."></th>
                                <th><input type="text" class="column-search" placeholder="Search Rel. Ref"></th>
                                <th><input type="text" class="column-search" placeholder="Search Date"></th>
                                <th><input type="text" class="column-search" placeholder="Search Ccy"></th>
                                <th><input type="text" class="column-search" placeholder="Search Amount"></th>
                                <th><input type="text" class="column-search" placeholder="Search Creation"></th>
                                <th><input type="text" class="column-search" placeholder="Search Status"></th>
                                <th><input type="text" class="column-search" placeholder="Search Source"></th>
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
        <div class="modal-content">
            <table class="modal-table" style="border:1px solid black">
                <tr>
                    <th colspan="6">INCOMING</th>
                </tr>
                <tr>
                    <td>Nomor</td>
                    <td>Status</td>
                    <td>Cover Dana</td>
                    <td>Rekening</td>
                    <td>Nama</td>
                    <td>Keterangan</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>INC</td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td>Tidak dikirim ke Core</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>INC-NOK</td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/wrong.png" style="height:13px"/></td>
                    <td><img class="img-check" src="images/wrong.png" style="height:13px"/></td>
                    <td>Tidak dikirim ke Core (Belum ada Cover Dana)</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>INC-OK</td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td>Rekening & nama benar (Belum ada Cover Dana)</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>INC-WAIT</td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/wrong.png" style="height:13px"/></td>
                    <td><img class="img-check" src="images/wrong.png" style="height:13px"/></td>
                    <td>INC-NOK yang memiliki Cover Dana, Perlu approval user</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>INC-STL</td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td>Berhasil dikirim ke Core</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>INC-RSTL</td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td>Berhasil dikirim ke Core (Kirim ulang)</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>INC-INV</td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/wrong.png" style="height:13px"/></td>
                    <td>Approval User (Investigasi atau Retur)</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>INC-HOLD</td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td>Belum dapat informasi rekening dari TWS</td>
                </tr>
                <tr>
                    <td>9</td>
                    <td>INC-RTR</td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/wrong.png" style="height:13px"/></td>
                    <td><img class="img-check" src="images/wrong.png" style="height:13px"/></td>
                    <td>Retur</td>
                </tr>
                <!--                <tr>
                                    <td>10</td>
                                    <td>INC-NSTP</td>
                                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                                    <td>Nominal lebih dari batas STP</td>
                                </tr>
                                <tr>
                                    <td>11</td>
                                    <td>INC-CRDT</td>
                                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                                    <td>Transaksi berhasil dijurnal di core</td>
                                </tr>-->
            </table>
            <br/>
            <table class="modal-table" style="border:1px solid black">
                <tr>
                    <th colspan="8">OUTGOING</th>
                </tr>
                <tr>
                    <td>Nomor</td>
                    <td>Status</td>
                    <td>Modifikasi</td>
                    <td>Verifikasi</td>
                    <td>Otorisasi</td>
                    <td>Berhasil</td>
                    <td>Gagal</td>
                    <td>Keterangan</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>MOD</td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td>Menunggu Verifikasi dan masih dapat diedit</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>VER</td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td>Menunggu Otorisasi</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>AUTH</td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td>Manunggu konfirmasi ACK/NACK</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>ACK</td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td>Berhasil divalidasi oleh SWIFT</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>NACK</td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td><img class="img-check" src="images/minus.png" style="height:15px"/></td>
                    <td><img class="img-check" src="images/yes.png" style="height:20px"/></td>
                    <td>Gagal validasi oleh SWIFT</td>
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
    new DataTable('#example', {
        initComplete: function () {
            this.api()
                    .columns()
                    .every(function () {
                        let column = this;
                        let title = column.footer().textContent;
                        let columnIndex = column.index();
                        let table = $('#example').DataTable();
                        let columnCount = table.columns().count();

                        let input = document.createElement('input');
                        input.placeholder = title;

                        if (columnIndex === 0 || columnIndex === columnCount - 1) {
                            
                        } else {
                            column.footer().replaceChildren(input);
                        }

                        input.addEventListener('keyup', () => {
                            if (column.search() !== this.value) {
                                column.search(input.value).draw();
                            }
                        });
                    });
        }
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