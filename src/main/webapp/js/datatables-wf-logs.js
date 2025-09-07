
  flatpickr("#date_from", {
    enableTime: true,       
    enableSeconds: true, 
    dateFormat: "Y-m-d H:i:S",
    time_24hr: true,
    defaultDate: (function () {
      const d = new Date();
      d.setHours(0, 0, 0, 0); // jam:menit:detik:ms
      return d;
    })()
  });

  flatpickr("#date_end", {
    enableTime: true,
    enableSeconds: true,
    dateFormat: "Y-m-d H:i:S",
    time_24hr: true,
    defaultDate: (function () {
      const d = new Date();
      d.setHours(23, 59, 0, 0); // jam:menit:detik:ms
      return d;
    })()
  });
  

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
            ],
            columnDefs: [
                { orderable: false, targets: [0] }, // index kolom yang tidak ingin di-sort
                {
                    targets: 0,
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
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
    
