<%-- 
    Document   : validate_button
    Created on : Jan 31, 2013, 6:45:45 PM
    Author     : hadi
--%>

<script type="text/javascript">
    $(function () {
        // Tabs
        $('#tabs').tabs();
    });

    var currentYear = (new Date).getFullYear();
    $(document).ready(function () {
        $("#year").text((new Date).getFullYear());
    });

    function printMTDoc(a) {
        var NWin = window.open(a, 'SCPrintMTDoc', 'height=800,width=800');
        if (window.focus) {
            NWin.focus();
        }
        return false;
    }

    $(document).ready(function () {
        $('#approveAll').click(function () {
            var answer = confirm('Approve All BIC?');
            return answer;
        });
        $('#rejectAll').click(function () {
            var answer = confirm('Reject All BIC?');
            return answer;
        });
        $('#approvebic').click(function () {
            var answer = confirm('Do you want to approve this BIC?');
            return answer;
        });
        $('#rejectbic').click(function () {
            var answer = confirm('Do you want to reject this BIC?');
            return answer;
        });
        $('#reject_true').click(function () {
            console.log("click this");
            var answer = confirm('Do you want to Reject this Message..!!');
            if (answer) {
//                document.location.href = 'SCRejectAction?id=' + $('#id').val() + '&operator_comment=' + $('#operator_comment').val();
                document.location.href = 'SCRejectAction?id=' + $('#id').val();
                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
            }
        });
        $('#modified').click(function () {
            var answer = confirm('Do you want to modified this Message..!!');
            if (answer) {
//                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=MOD&id=' + $('#id').val() + '&messageType=' + $('#messageType').val() + '&komentar=' + $('#operator_comment').val();
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=MOD&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
            }
        });
        $('#resend2saa').click(function () {
            var answer = confirm('Do you want to modified this Message..!!');
            if (answer) {
//                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=MOD&id=' + $('#id').val() + '&messageType=' + $('#messageType').val() + '&komentar=' + $('#operator_comment').val();
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=WAITING-SAA-CNF&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#approve_wait_saa_resend').click(function () {
            var answer = confirm('Do you want to Approve this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=WAITING-SAA-RESEND&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reject_saa_cnf').click(function () {
            var answer = confirm('Do you want to Reject this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=UNSETTLE-OUT&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reject_wait_aml').click(function () {
            var answer = confirm('Do you want to Reject this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=AML-TERMINATE-OUT&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reject_wait_aml_out').click(function () {
            var answer = confirm('Do you want to Reject this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=WAITING-AML&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#resend2cvt_in').click(function () {
            var answer = confirm('Do you want to Resend this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=RESEND-CNF&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reject_inc_cvt').click(function () {
            var answer = confirm('Do you want to Reject this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=AML-TERMINATE-IN&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#approve_cvt_resend').click(function () {
            var answer = confirm('Do you want to Approve this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=INC-CVT-RESEND&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reject_inc_aml').click(function () {
            var answer = confirm('Do you want to Reject this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=WAITING-AML&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reject_true_acc_in').click(function () {
            console.log("click this");
            var answer = confirm('Do you want to Approve Reject this MT..!!');
            if (answer) {
                document.location.href = 'SCRejectAction?id=' + $('#id').val();
            }
        });
        $('#resend2aml_in').click(function () {
            var answer = confirm('Do you want to Resend this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=INC-AML-FAILED-CNF&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#resend2aml_out').click(function () {
            var answer = confirm('Do you want to Resend this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=AML-FAILED-CNF&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#approve_aml_resend').click(function () {
            var answer = confirm('Do you want to Approve this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=AML-RESEND&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reject_aml_failed').click(function () {
            var answer = confirm('Do you want to Reject this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=AML-FAILED&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#save_cvt_mod').click(function () {
            var answer = confirm('Do you want to Save this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=CVT-VER&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reject_cvt_mod').click(function () {
            var answer = confirm('Do you want to Reject this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=CVT-MOD&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#approve_cvt_ver_resend').click(function () {
            var answer = confirm('Do you want to Approve this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=CVT-VER-RESEND&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#approve_resend_aml_in').click(function () {
            var answer = confirm('Do you want to Resend this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=INC-AML-RESEND&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reject_inc_aml_failed').click(function () {
            var answer = confirm('Do you want to Reject this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=INC-AML-FAILED&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#resend2channel_in').click(function () {
            var answer = confirm('Do you want to Resend this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=INC-RESEND-CNF&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#approve_inc_resend').click(function () {
            var answer = confirm('Do you want to Approve this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=INC-RESEND&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reject_unsettle_inc').click(function () {
            var answer = confirm('Do you want to Reject this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=UNSETTLE-INC&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });

        $('#verified').click(function () {
            var answer = confirm('Do you want to verified this MT..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=VER&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
            }
        });
        $('#submit_mt2').click(function () {
            var answer = confirm('Do you want to save this data ?');
//            return answer // answer is a boolean
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=VER&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#authorized').click(function () {
            var answer = confirm('Do you want to authorized this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=AUTH&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#duplResend').click(function () {
            var answer = confirm('Do you want to resend this message?');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=DUPL-RESEND&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#printed').click(function () {
            var answer = confirm('Do you want to print this Message..!!');
            if (answer) {
                printMTDoc('SCPrintMTDoc?id=' + $('#id').val());
            }
        });
        $('#btn-export').click(function () {
            var answer = confirm('Do you want to export this message to txt file?');
            if (answer) {
                var finalMT1 = $('#beforeConvert').val();
                var finalMT2 = $('#afterConvert').val();
                var finalMT3 = $('#mxview2').val();
                if ((finalMT1 && finalMT1.trim() !== "") || (finalMT2 && finalMT2.trim() !== "") || (finalMT3 && finalMT3.trim() !== "")) {
                    document.location.href = 'SCExport?id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
                } else {
                    alert("MT format for this transaction is not available yet!");
                }
            }
        });
        $('#printedmx').click(function () {
            var answer = confirm('Do you want to print this Message?');
            if (answer) {
                printMTDoc('SCPrintMXDoc?id=' + $('#id').val() + '&messageType=' + $('#messageType').val());
            }
        });
        $('#releaseDupl').click(function () {
            var answer = confirm('Do you want to release this message?');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=DUPL-CNF&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#submit').click(function () {
            var answer = confirm('Do you want to save this data ?');
            return answer // answer is a boolean
        });
        $('#delete').click(function () {
            var answer = confirm('Do you want to delete this data..!!');
            return answer // answer is a boolean
        });
        $('#reset').click(function () {
            var answer = confirm('Do you want to reset all value..!!');
            return answer // answer is a boolean
        });
        $('#search').click(function () {
            //    var answer = confirm('Do you want to search with this value..!!');
            return answer // answer is a boolean
        });
        $('#back').click(function () {
            //    var answer = confirm('Do you want to back to previous page..!!');
            //    if(answer){
//            parent.history.back();
            window.history.back();

            //        return false;
            //    }
        });
        $('#print_pdf').click(function () {
            var answer = confirm('Do you want to report as PDF format..!!');
            if (answer) {
                var url = 'SCPrintPDF?' +
                        'io_type=' + encodeURIComponent($('#io_type').val()) +
                        '&mt_type=' + encodeURIComponent($('#mt_type').val()) +
                        '&date_from=' + encodeURIComponent($('#date_from').val()) +
                        '&date_end=' + encodeURIComponent($('#date_end').val()) +
                        '&flag=' + encodeURIComponent($('#flag').val()) +
                        '&value_date=' + encodeURIComponent($('#value_date').val()) +
                        '&value_date_end=' + encodeURIComponent($('#value_date_end').val()) +
                        '&cust_curr=' + encodeURIComponent($('#cust_curr').val()) +
                        '&channel=' + encodeURIComponent($('#channel').val());

                // Buka di tab baru langsung tanpa AJAX
                window.open(url, '_blank');
            }
        });

        $('#print_pdf_old').click(function () {
            var answer = confirm('Do you to report as PDF format..!!');
            if (answer) {
                var requestData = {
                    io_type: $('#io_type').val(),
                    mt_type: $('#mt_type').val(),
                    date_from: $('#date_from').val(),
                    date_end: $('#date_end').val(),
                    flag: $('#flag').val(),
                    value_date: $('#value_date').val(),
                    value_date_end: $('#value_date_end').val(),
                    cust_curr: $('#cust_curr').val(),
                    channel: $('#channel').val()
                };

                // Send AJAX request
                $.ajax({
                    url: 'SCPrintPDF', // URL of the servlet
                    type: 'GET', // or 'POST' if needed
                    data: requestData,
                    dataType: 'json',
                    beforeSend: function () {
                        // ? Show a loading message before the request
                        $('#status_message').text('Processing... Your PDF is being generated.');
                    },
                    success: function (response) {
                        // ? Update UI without refreshing
                        if (response.status === "Processing") {
                            $('#status_message').html(
                                    'Your PDF is being generated. <br> <a href="' + response.download_url + '" target="_blank">Click here to download when ready</a>'
                                    );
                            window.open(response.download_url, '_blank');
                        }
                    },
                    error: function () {
                        // ? Handle errors
                        $('#status_message').text('Error processing PDF.');
                    }
                });
            }
        });

        $('#print_pdfu').click(function () {
            window.open(
                    'SCPrintUser?status=' + $('#status').val(),
                    '_blank'
                    );
        });

        $('#print_pdfr').click(function () {
            window.open(
                    'SCPrintRole?status=' + $('#status').val(),
                    '_blank'
                    );
        });
        $('#print_xls').click(function () {
            var answer = confirm('Do you to report as XLS format..!!');
            if (answer) {
                document.location.href = 'SCPrintXLS?mt_type=' + $('#mt_type').val() + '&date_from=' + $('#date_from').val() + '&date_end=' + $('#date_end').val() + '&flag=' + $('#flag').val() + '&value_date=' + $('#value_date').val() + '&value_date_end=' + $('#value_date_end').val() + '&io_type=' + $('#io_type').val() + '&filter_msg=' + $('#filter_msg').val() + '&channel=' + $('#channel').val();
//                document.location.href = 'SCPrintXLS?mt_type=' + $('#mt_type').val() + '&date_from=' + $('#date_from').val() + '&date_end=' + $('#date_end').val() + '&flag=' + $('#flag').val() + '&value_date=' + $('#value_date').val() + '&io_type=' + $('#io_type').val();
            }
        });
        $('#print_csv').click(function () {
            var answer = confirm('Do you to report as CSV format..!!');
            if (answer) {
//                document.location.href = 'SCPrintCSV?mt_type=' + $('#mt_type').val() + '&date_from=' + $('#date_from').val() + '&date_end=' + $('#date_end').val() + '&flag=' + $('#flag').val() + '&value_date=' + $('#value_date').val() + '&io_type=' + $('#io_type').val();
                document.location.href = 'SCPrintCSV?mt_type=' + $('#mt_type').val() + '&date_from=' + $('#date_from').val() + '&date_end=' + $('#date_end').val() + '&flag=' + $('#flag').val() + '&value_date=' + $('#value_date').val() + '&value_date_end=' + $('#value_date_end').val() + '&io_type=' + $('#io_type').val() + '&filter_msg=' + $('#filter_msg').val() + '&channel=' + $('#channel').val();
            }
        });
        $('#modified_ver').click(function () {
            var answer = confirm('Do you want to Send this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=CVT-MOD&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reject_ver').click(function () {
            var answer = confirm('Do you want to reject this Message..!!');
            if (answer) {
//                document.location.href = 'SCRejectAction?id=' + $('#id').val() + '&operator_comment=' + $('#operator_comment').val();
                document.location.href = 'SCRejectAction?id=' + $('#id').val();
                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
            }
        });
        $('#incoming_settle').click(function () {//20190917 ditambah incoming settle
            var answer = confirm('Do you want to settle this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=SETTLE&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#ResendFIA').click(function () {
            var answer = confirm('Do you want to Resend this..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=FIA-FAILED-CNF&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#ApproveFIA').click(function () {
            var answer = confirm('Do you want to Resend this..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=FIA-RESEND&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reject_fia_failed').click(function () {
            var answer = confirm('Do you want to Reject this Message..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=FIA-FAILED&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#upload').click(function () {//20191231 ditambah search cover
            var answer = confirm('Do you want to upload this file ?');
            return answer
        });


    });
</script>
