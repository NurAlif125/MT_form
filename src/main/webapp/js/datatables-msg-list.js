

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


    $('#chkAll').click(function () {
        $('input:checkbox').prop('checked', this.checked);
    });

    $('#example tfoot tr').appendTo('#example thead');

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


function escapeHtml(text) {
    return $('<div>').text(text).html();
}


    $(document).ready(function () {

        const fullUrl = window.location.search && window.location.search !== "?" ? window.location.search : '';


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
                    return json.data;
                }
            },
            language: {
                processing: "Processing..." 
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
                {data: "createby"},
                {data: "approveby"},
                {data: "userentry"},
                {data: null} // Action
            ],
            columnDefs: [
                { orderable: false, targets: [0, 15] }, // index kolom yang tidak ingin di-sort
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
