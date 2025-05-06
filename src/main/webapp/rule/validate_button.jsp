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
        })
        $('#reject').click(function () {
            var answer = confirm('Do you want to reject this MT..!!');
            if (answer) {
//                document.location.href = 'SCRejectAction?id=' + $('#id').val() + '&operator_comment=' + $('#operator_comment').val();
                document.location.href = 'SCRejectAction?id=' + $('#id').val();
                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
            }
        });
        $('#modified').click(function () {
            var answer = confirm('Do you want to modified this MT..!!');
            if (answer) {
//                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=MOD&id=' + $('#id').val() + '&messageType=' + $('#messageType').val() + '&komentar=' + $('#operator_comment').val();
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=MOD&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
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
            var answer = confirm('Do you want to authorized this MT..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=AUTH&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#generated').click(function () {
            var answer = confirm('Do you want to generate text this MT..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=TEXT&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
            }
        });
        $('#printed').click(function () {
            var answer = confirm('Do you want to print this MT..!!');
            if (answer) {
                printMTDoc('SCPrintMTDoc?id=' + $('#id').val());
            }
        });
        $('#printedmx').click(function () {
            var answer = confirm('Do you want to print this Message?');
            if (answer) {
                printMTDoc('SCPrintMXDoc?id=' + $('#id').val() + '&messageType=' + $('#messageType').val());
            }
        });
        $('#printNote').click(function () { // ditambahkan untuk print nota 20180413
            var answer = confirm('Do you want to print this MT..!!');
            if (answer) {
                printMTDoc('SCPrintNota?id=' + $('#id').val());
            }
        });
        $('#returned').click(function () {
            var answer = confirm('Do you want to return this MT..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=RETURNED&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
            }
        });
//        $('#submit_mt').click(function () {
//            var answer = confirm('Do you want to save this MT data..!!');
//            if (answer == false) {
//                parent.history.back();
////                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
//            }
////            alert('answer='+answer);
//        });
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
            parent.history.back();
            //        return false;
            //    }
        });
        $('#print_pdf').click(function () {
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
                        }
                    },
                    error: function () {
                        // ? Handle errors
                        $('#status_message').text('Error processing PDF.');
                    }
                });
            }
            // Prepare request parameters
//            var requestData = {
//                io_type: $('#io_type').val(),
//                mt_type: $('#mt_type').val(),
//                date_from: $('#date_from').val(),
//                date_end: $('#date_end').val(),
//                flag: $('#flag').val(),
//                value_date: $('#value_date').val(),
//                value_date_end: $('#value_date_end').val(),
//                cust_curr: $('#cust_curr').val()
//            };
//
//            // Send AJAX request
//            $.ajax({
//                url: 'SCPrintPDF', // URL of the servlet
//                type: 'GET', // or 'POST' if needed
//                data: requestData,
//                dataType: 'json',
//                beforeSend: function () {
//                    // ? Show a loading message before the request
//                    $('#status_message').text('Processing... Your PDF is being generated.');
//                },
//                success: function (response) {
//                    // ? Update UI without refreshing
//                    if (response.status === "Processing") {
//                        $('#status_message').html(
//                                'Your PDF is being generated. <br> <a href="' + response.download_url + '" target="_blank">Click here to download when ready</a>'
//                                );
//                    }
//                },
//                error: function () {
//                    // ? Handle errors
//                    $('#status_message').text('Error processing PDF.');
//                }
//            });
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

        $("#print_recon").click(function (event) {
            const selectedValue = $("#filter_msg").val();
            const valueDate = $('#value_date').val();
            const valueDateEnd = $('#value_date_end').val();
            const noReff = $('#no_reff').val();
            const nostroCorr = $('#nostro_corr').val();

            if (!selectedValue || selectedValue === "") {
                alert("Harap pilih salah satu dari opsi yang tersedia sebelum mencetak!");
                event.preventDefault(); // untuk cegah aksi print sebelum validasi
                event.stopImmediatePropagation();
                return false;
            }

            const answer = confirm('Print reconcile?');
            if (answer) {
                window.open('SCPrintRecon?io_type=' + $('#io_type').val() +
                        '&filter_msg=' + selectedValue +
                        '&cust_curr=' + $('#cust_curr').val() +
                        '&date_from=' + $('#date_from').val() +
                        '&date_end=' + $('#date_end').val() +
                        '&value_date=' + valueDate +
                        '&value_date_end=' + valueDateEnd +
                        '&no_reff=' + noReff);
            }
        });

//        $('#print_pdf_out').click(function () {
//            var answer = confirm('Do you to report as PDF format..!!');
//            if (answer) {
//                printMTDoc('SCPrintPDF?status=Outgoing&io_type=I&mt_type=' + $('#mt_type').val() + '&date_from=' + $('#date_from').val() + '&date_end=' + $('#date_end').val() + '&flag=' + $('#flag').val());
//            }
//        });
//        $('#print_pdf_in').click(function () {
//            var answer = confirm('Do you to report as PDF format..!!');
//            if (answer) {
//                printMTDoc('SCPrintPDF?status=Incoming&io_type=O&mt_type=' + $('#mt_type').val() + '&date_from=' + $('#date_from').val() + '&date_end=' + $('#date_end').val() + '&flag=' + $('#flag').val());
//            }
//        });
        $('#print_xls').click(function () {
            var answer = confirm('Do you to report as XLS format..!!');
            if (answer) {
                document.location.href = 'SCPrintXLS?mt_type=' + $('#mt_type').val() + '&date_from=' + $('#date_from').val() + '&date_end=' + $('#date_end').val() + '&flag=' + $('#flag').val() + '&value_date=' + $('#value_date').val() + '&value_date_end=' + $('#value_date_end').val() + '&io_type=' + $('#io_type').val() + '&filter_msg=' + $('#filter_msg').val() + '&channel=' + $('#channel').val();
//                document.location.href = 'SCPrintXLS?mt_type=' + $('#mt_type').val() + '&date_from=' + $('#date_from').val() + '&date_end=' + $('#date_end').val() + '&flag=' + $('#flag').val() + '&value_date=' + $('#value_date').val() + '&io_type=' + $('#io_type').val();
            }
        });
        $('#print_rtf').click(function () {
            var answer = confirm('Do you to report as RTF format..!!');
            if (answer) {
                document.location.href = 'SCPrintRTF';
            }
        });
        $('#print_csv').click(function () {
            var answer = confirm('Do you to report as CSV format..!!');
            if (answer) {
//                document.location.href = 'SCPrintCSV?mt_type=' + $('#mt_type').val() + '&date_from=' + $('#date_from').val() + '&date_end=' + $('#date_end').val() + '&flag=' + $('#flag').val() + '&value_date=' + $('#value_date').val() + '&io_type=' + $('#io_type').val();
                document.location.href = 'SCPrintCSV?mt_type=' + $('#mt_type').val() + '&date_from=' + $('#date_from').val() + '&date_end=' + $('#date_end').val() + '&flag=' + $('#flag').val() + '&value_date=' + $('#value_date').val() + '&value_date_end=' + $('#value_date_end').val() + '&io_type=' + $('#io_type').val() + '&filter_msg=' + $('#filter_msg').val() + '&channel=' + $('#channel').val();
            }
        });
        // penambahan button force INC-OK 16 Sept 2015
        $('#INC-OK').click(function () {
            var answer = confirm('Do you want to Generate to Incoming OK this MT..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=INC-OK&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
            }
        });

        $('#backup').click(function () {
            var answer = confirm('Do you want to backup the data?');
            if (answer) {
                document.location.href = 'SCBackup?action=1&do=yes&date_from=' + $('#date_from').val() + '&date_end=' + $('#date_end').val();
            }
        });
        // penambahan button resend ACK 17 April 2018
        $('#RACK').click(function () {
            var answer = confirm('Do you want to resend ACK for this MT ?');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=RACK&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });

        // penambahan button resend INC-OK 17 April 2018
        $('#INC-ROK').click(function () {
            var answer = confirm('Do you want to resend Incoming for this MT ?');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=INC-ROK&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });

        $('#saveRate').click(function () {
            var specialRate = $('#special_rate').val();
            var specialRateMulti = $('#special_rate_multi').val();
            var curr1 = $('#curr1').val();
            var curr2 = $('#curr2').val();
            var answer;
            console.log("special rate : " + specialRate);
            if (specialRate === '') {
                answer = confirm('Are you sure to not give special rate for this transaction ?');
            } else if (specialRate === undefined) {
                answer = confirm('Are you sure to not give special rate for this transaction ?');
            } else {
                console.log(specialRate + specialRateMulti);
                if (specialRateMulti === '') {
                    answer = confirm('Do you want to give special rate ' + specialRate + ' for this transaction ?');
                } else {
                    answer = confirm('Do you want to give special rate ' + curr1 + ' = ' + specialRateMulti + ' and ' + curr2 + ' = ' + specialRate + ' for this transaction ?');
                }
            }
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=INC-SPRT&special_rate=' + specialRate + '&id=' + $('#id').val() + '&messageType=' + $('#messageType').val() + '&branch_101=' + $('#branch_101').val() + '&special_rate_multi=' + $('#special_rate_multi').val();
            }
        });
        //20220120
        $('#saveAcc').click(function () {
            var custAcc = $('#acc_adj').val();
            var answer;
            var custName = $('#nm_adj').val();
            var type = '59';
            if (custAcc === '') {
                custAcc = $('#acc_adj_f').val();
                custName = $('#nm_adj_f').val();
                type = '59F';
            }
            console.log("kadieuu saveacc Acc" + custAcc);
            console.log("kadieuu saveacc Name" + custName);
            answer = confirm('Are you sure want to change \nreceiver account to ' + custAcc + '\nreceiver name to ' + custName + ' ?');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=INC-ADJ&custAcc=' + custAcc + '&custName=' + custName + '&id=' + $('#id').val() + '&type=' + type + '&messageType=' + $('#messageType').val();
            }
        });
        $('#approveADJ').click(function () {
            var custAcc = $('#acc_adj').val();
            var custName = $('#nm_adj').val();
            var type = '59';
            if (custAcc === '') {
                custAcc = $('#acc_adj_f').val();
                custName = $('#nm_adj_f').val();
                type = '59F';
            }
            var answer = confirm('Do you want to approve the account changes of this transactions ?');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=APPROVEADJ&custAcc=' + custAcc + '&custName=' + custName + '&id=' + $('#id').val() + '&type=' + type + '&messageType=' + $('#messageType').val();
            }
        });
        $('#rejectADJ').click(function () {
            var answer = confirm('Do you want to reject the account changes of this transactions ?');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=REJECTADJ&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        //20220120
        //20221130 updated
        $('#acceptSPRT').click(function () {
            var specialRate = $('#special_rate').val();
            var specialRateMulti = $('#special_rate_multi').val();
            var curr1 = $('#curr1').val();
            var curr2 = $('#curr2').val();
            var answer;
            if (specialRate === '') {
                answer = confirm('Do you want to accept special rate ' + specialRate + ' for this transaction ?');
            } else if (specialRate === undefined) {
                answer = confirm('Do you want to accept special rate ' + specialRate + ' for this transaction ?');
            } else {
                if (specialRateMulti === '') {
                    answer = confirm('Do you want to accept special rate ' + specialRate + ' for this transaction ?');
                } else {
                    answer = confirm('Do you want to accept special rate ' + curr1 + ' = ' + specialRateMulti + ' and ' + curr2 + ' = ' + specialRate + ' for this transaction ?');
                }
            }
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=INC-SPOK&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });

        $('#rejectSPRT').click(function () {
//            var specialRate = $('#special_rate').val();
            var answer = confirm('Do you want to reject special rate for this transaction ?');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=INC-NSTP&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });

        // 17 April 2018 penambahan untuk memindahkan joutnal history
        $('#DELHIS').click(function () {
            var answer = confirm('Do you want to delete journal history for this MT ?');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiOutgoing?flag=DELHIS&id=' + $('#id').val() + '&messageType=' + $('#messageType').val() + '&fM=' + $('#_121_of53a_identifier_code').val() + '&ref=' + $('#_010_mf20_sender_reference').val() + '&nominal=' + $('#_062_mf32a_amount').val() + '&rek=' + $('#_180_mf59_account').val();
            }
        });

        $('#verifyACC').click(function () {
            var answer = confirm('Do you want to Adjustment Name this Account?');
            if (answer) {
                //20190923 ditambah n 59f
                var accname = $('#_181_mf59_name_address').val() + $('#_186_mf59f_name_address').val();
                accname = accname.replace(/(\r\n|\n|\r)/gm, " ");
//                alert(accname);
//                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=VERACC&id=' + $('#id').val() + '&messageType=' + $('#messageType').val() + '&acct=' + $('#_180_mf59_account').val() + $('#_185_mf59f_account').val() + '&accnbr=' + $('#_180_mf59_account').val() + '&accname=' + $('#_181_mf59_name_address').val() + $('#_186_mf59f_name_address').val();
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=VERACC&id=' + $('#id').val() + '&messageType=' + $('#messageType').val() + '&acct=' + $('#_180_mf59_account').val() + $('#_185_mf59f_account').val() + '&accnbr=' + $('#_180_mf59_account').val() + '&accname=' + accname;
            }
        });
        $('#investigate').click(function () {
            var answer199 = confirm('Do you want to investigate this MT as 199?');
            // var answer999 = confirm('Do you want to investigate this MT as 999?');
            if (answer199) {
//                document.location.href = 'SCInvestigation?id=' + $('#id').val() + '&reff=' + $('#_010_mf20_sender_reference').val();
                document.location.href = 'SCDataTransaksi199?flag=INC-INV&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#sendTEXT').click(function () {
            var answer = confirm('Do you want to Send this MT..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=SENDTEXT&id=' + $('#id').val() + '&messageType=' + $('#messageType').val() + '&acct=' + $('#_180_mf59_account').val() + '&accnbr=' + $('#_180_mf59_account').val();
            }
        });
        $('#incWait').click(function () {
            var answer = confirm('Do you want to Send this MT..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=INC-WAIT&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#reSendTEXT').click(function () {//20190412 ditambah resend inc-ok
            var answer = confirm('Do you want to resend this MT..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=RESENDTEXT&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#incoming_settle').click(function () {//20190917 ditambah incoming settle
            var answer = confirm('Do you want to settle this MT..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=SETTLE&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
        $('#incoming_ok').click(function () {//20190917 ditambah incoming settle
            var answer = confirm('Do you want to receive this MT..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=INC-OK&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
            }
        });
//        $('#getConfirm').click(function () {//20190813 ditambah get confirmation
//            var answer = confirm('Do you want to send confirmation of this MT..!!');
//            if (answer) {
//                document.location.href = 'SCDataTransaksi199?flag=INC-STL&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
//            }
//        });
        $('#retur').click(function () {
            var answer = confirm('Do you want to retur this MT..!!');
            if (answer) {
                document.location.href = 'SCDataTransaksi199?flag=INC-WAIT&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
            }
        });
        $('#returinv').click(function () {
            var answer = confirm('Do you want to retur this MT..!!');
            if (answer) {
                document.location.href = 'SCDataTransaksi199?flag=INC-RTR&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
            }
        });
//        20201205
        $('#retur299').click(function () {
            var answer = confirm('Do you want to retur this MT..!!');
            if (answer) {
                document.location.href = 'SCDataTransaksi299?flag=INC-RTR&id=' + $('#id').val() + '&messageType=' + $('#messageType').val();
                //printMTDoc('SCPrintMTDoc?id='+$('#id').val());
            }
        });
        $('#search_cover').click(function () {//20191231 ditambah search cover
            var answer = confirm('Do you want to search cover for this MT..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=INC&id=' + $('#id').val() + '&ref=' + $('#_010_mf20_sender_reference').val();
            }
        });


        $('#push_release').click(function () {//2024-12-16, farras ditambah untuk push release
            var answer = confirm('Do you want to for push release this transaction..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=INC-STL&id=' + $('#id').val();
            }
        });

        $('#recheck').click(function () {//2024-12-16, farras ditambah untuk push release
            var answer = confirm('Do you want to recheck this transaction..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=INC-RECHECK&id=' + $('#id').val();
            }
        });
        $('#approve_settle').click(function () {
            var answer = confirm('Do you want to settle this transaction..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=INC-STL&id=' + $('#id').val();
            }
        });
        $('#manual_settle').click(function () {
            var answer = confirm('Do you want to settle this transaction..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=INC-STLHOLD-CNF&id=' + $('#id').val();
            }
        });
        $('#reject_settle').click(function () {
            var answer = confirm('Do you want to hold this transaction..!!');
            if (answer) {
                document.location.href = 'ServletControllerDataTransaksiIncoming?flag=INC-STLHOLD&id=' + $('#id').val();
            }
        });

        $('#upload').click(function () {//20191231 ditambah search cover
            var answer = confirm('Do you want to upload this file ?');
            return answer
        });


    });
</script>
