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