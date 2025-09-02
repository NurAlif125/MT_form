$(document).ready(function () {
    $('#example').DataTable({
        "scrollX": true,
//            "columnDefs": [
//                {
//                    "className": "dt-head-left", "targets": "_all"
//                },
//                {
//                    orderable: false, targets: [0, 8]
//                }
//            ]
    });
});

function escapeHtml(text) {
    return $('<div>').text(text).html();
}


$(document).ready(function () {
//console.log("Document is ready");
    const fullUrl = window.location.search && window.location.search !== "?" ? window.location.search : '';
//        console.log(fullUrl);

    if ($.fn.DataTable.isDataTable('#example')) {
        $('#example').DataTable().clear().destroy(); // destroy kalau sudah ada
    }

    var table = $('#example').DataTable({
        processing: true,
        serverSide: true,
        ajax: {
            url: "SCDuplicateCnfList" + fullUrl,
            type: "GET",
            xhrFields: {
                withCredentials: true
            },
            data: function (d) {
                d.io_type = $('#io_type_filter').val();
//                    d.flag = $('#flag_filter').val();
//                    d.channel = $('#channel_filter').val();
                d.quicksearch = $('#example_filter input[type="search"]').val();
            },
            dataSrc: function (json) {
//                console.log("Received JSON:", json);
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
            {data: "logicalTerminal"},
            {data: "receiverAddress"},
            {data: "trans_reference"},
            {data: "tanggal"},
            {data: "flag"},
            {data: null} // Action
        ],
        columnDefs: [
            {
                "className": "dt-head-left", "targets": "_all"
            },
            {orderable: false, targets: [0, 8]}, // index kolom yang tidak ingin di-sort
            {
                targets: 0,
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            {
                targets: 5,
                render: function (data, type, row, meta) {
                    return '<a href="ViewDataTransaksiOutgoing?id=' + encodeURIComponent(row.id_headers) + '">' + escapeHtml(row.trans_reference) + '</a>';
                }
            },
            {
                targets: 8,
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

            $('#example_filter input[type="search"]').each(function () {
                var colIdx = $(this).parent().index();
                $(this).on('keyup change', debounce(function () {
                    var val = this.value;
//                    console.log(' Search column '+colIdx+' = '+val+'');
                    api.column(colIdx).search(val).draw();
                }, 800));
            });

            $('#example_filter input[type="search"]').on('click', function (e) {
                e.stopPropagation();
            });

        }
    });


    $('#select-page').on('change', function () {
        // Reload data
        console.log("page changed");
        $("#example").DataTable().ajax.reload();
    });
});