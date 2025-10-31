<%-- 
    Document   : validate_rule_mtn92
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : M Abdul Hadi
--%>

<script type="text/javascript">
    $(document).ready(function() {
        let validator = $("#form1").validate({
            ignore: [],  
            onkeyup: false,          // Nonaktifkan validasi saat mengetik
            onfocusout: false, 
            rules: {
                //header
                //unit: "required",
                sender_logical_terminal: "required",
                //sender_type: "required",
                //sender_type_institution: "required",

                //receiver_type: "required",
                receiver_institution: "required",

                priority: "required",
                //monitoring: "required",

                //body
                _010_mf20_sender_reference: "required",
                _011_mf21_related_reference: "required",
                _012_mf11s_mt_number: "required",
                _013_mf11s_date: "required",
                //_014_mf11s_session_number: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_transaction_reference_number: {required: "mf20 harus diisi..!!"},
                _011_mf21_related_reference: {required: "mf21 harus diisi..!!"},
                _012_mf11s_mt_number: {required: "mf11s_mt harus diisi..!!"},
                _013_mf11s_date: {required: "mf11s_date harus diisi..!!"},
                //_014_mf11s_session_number: {required: "mf11s_session_number harus diisi..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                _030_mf32b_currency: {required: "mf32b_currency harus diisi..!!"},
                _031_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                _041_of52a_identifier_code: {required: "of52a_identifier_code harus diisi..!!"},
                _044_of52d_name_address: {required: "of52d_name_address harus diisi..!!"},
                _051_of57a_identifier_code: {required: "of57a_identifier_code harus diisi..!!"},
                _057_of57d_name_address: {required: "of57d_name_address harus diisi..!!"},
                _060_mf71b_details_charges: {required: "mf71b_details_charges harus diisi..!!"}
            },
            errorPlacement: function(error,element){
                error.insertAfter(element);
//                alert(error.html());
                $("#tab-validate").removeAttr("hidden");
            },
            showErrors: function(errorMap, errorList){
                this.defaultShowErrors();
                
                $("#tab-validate").removeAttr("hidden");
                 
                $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
                $("#view8").css("display", "block");
                $('#tab-view1').removeClass("selected").removeAttr('class');
                $('#tab-view2').removeClass("selected").removeAttr('class');
                $('#tab-view3').removeClass("selected").removeAttr('class');
                $('#tab-view4').removeClass("selected").removeAttr('class');
                $('#tab-view5').removeClass("selected").removeAttr('class');
                $('#tab-view6').removeClass("selected").removeAttr('class');
                $('#tab-view7').removeClass("selected").removeAttr('class');
                $('#tab-validate').addClass("selected");

                let errorContainer = document.getElementById("error-container");
                
                if (errorList.length === 0) {
                    errorContainer.innerHTML = ""; 
//                    return;
                } 
                
                let tableHTML = `<table border="0" style="width:100% !important; caption-side: bottom; font-size:8pt !important;border-collapse: collapse; border:1px gray solid;">
                                    <tr style="background:#d6d6d6;">
                                    <th>Type</th>
                                    <th>Location</th>
                                    <th>Node</th>
                                    <th>Message</th></tr>`;

                    
                errorList.forEach(errors => {
                    let inputID = errors.element.id || "";
                    let locationTab = errors.element.getAttribute("location") || "";
                    let inputType = errors.element.getAttribute("input_type") || "";

                    tableHTML += '<tr class="error__row" data-input-id="'+inputID+'" content-body="'+locationTab+'" onmouseover="this.style.background=\'#f6f6f6\'" onmouseout="this.style.backgroundColor=\'transparent\'" style="cursor:pointer;">';
                    tableHTML += '<td style="padding: 5px;">Error</td>';
                    tableHTML += '<td style="padding: 5px;">'+locationTab+'</td>';
                    tableHTML += '<td style="padding: 5px;">'+inputType+'</td>';
                    tableHTML += '<td style="padding: 5px;">'+errors.message+'</td></tr>';
                });

                tableHTML += `</table>`;
                errorContainer.innerHTML = tableHTML; 
                
                document.querySelectorAll(".error__row").forEach(row => {
                    row.addEventListener("click", function () {
                        let targetRow = event.target.closest(".error__row"); 
                        let inputId = this.getAttribute("data-input-id");
                        let tabContentGroup = this.getAttribute("content-body");
                        
                    if (targetRow) {
                        let input = document.getElementById(inputId);
                        if (input) {
                            if(tabContentGroup == "Header") {
                                $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $("#view1").css("display", "block");
                                $('#tab-view1').addClass("selected");
                                $('#tab-view2').removeClass("selected").removeAttr('class');
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-view7').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                            } 
                            else if (tabContentGroup == "Body") {
                                 $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $('#tab-view1').removeClass("selected").removeAttr('class');
                                $('#tab-view2').addClass("selected");
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-view7').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                                $("#view2").css("display", "block");
                            }
                            
                            input.focus();
                        } else {
                            console.log("nothing input element")
                        }
                    }
                    });
                });
            },
        });
        
         $("#btn-validate").click(function () {
            let isValid = $("#form1").valid(); 
            if (isValid) {
                alert("Semua input valid!");
            } 
        });

        $("#submit_mt").click(function (e) {
            e.preventDefault();
            let isValid = $("#form1").valid(); 
            if (isValid) {  
                $("#form1").submit(); 
            } else {
                alert("Masih ada error! Harap perbaiki sebelum menyimpan.");
            }
        });
        
        $.validator.addMethod("regex", function(value, element, param) {
            //this.optional(element) lewati validasi jika kosong dan param.test(value) check regex
            return this.optional(element) || param.test(value); 
//            Jika tidak ada pesan khusus dalam messages tampilkan "Format tidak valid"
        }, "Format tidak valid");
        
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />
<script type="text/javascript">
    $(document).ready(function () {
        $("#check_special_rate").hide();
        $("#special_rate").prop("required", false);
        $("#special_rate_checkbox").click(function () {
            if ($("#special_rate_checkbox").is(":checked")) {
                $("#check_special_rate").show();
                $("#special_rate").prop("required", false);
            } else {
                $("#check_special_rate").hide();
                $("#special_rate").prop("required", false);
            }
        });
        
        //MF11S_check
        $("#check_mf11s").hide();
        $("#_012_mf11s_mt_number").attr("disabled", false);
        $("#_013_mf11s_date").attr("disabled", false);
        $("#_014_mf11s_session_number").attr("disabled", false);
        $("#session_number_isn_checkbox").click(function(){
            if ($("#session_number_isn_checkbox").is(":checked")){
                $("#check_mf11s").show();
                $("#_032_mf11s_session_number").attr("disabled", false);
                $("#_033_mf11s_isn").attr("disabled", false);
            } else {
                $("#check_mf11s").hide();
                $("#_032_mf11s_session_number").attr("disabled", true);
                $("#_033_mf11s_isn").attr("disabled", true);
            }
        });
    });
</script>

<%--link rel="stylesheet" type="text/css" href="css/validate.css" />
<script type="text/javascript"--%>
<!-- rule view -->
<script language="javascript">
    $(document).ready(function () {
        if ($("#special_rate").val() != "") {
            $("#special_rate_checkbox").prop("checked", true);
            $("#check_special_rate").show();
            $("#special_rate").prop("required", true);
        } else {
            $("#check_special_rate").hide();
            $("#special_rate").prop("required", false);
        }
        //$("#check_special_rate").hide();
        //$("#special_rate").prop("required", false);
        //$("#special_rate_checkbox").click(function () {
        //    if ($("#special_rate_checkbox").is(":checked")) {
        //        $("#check_special_rate").show();
        //        $("#special_rate").prop("required", false);
        //    } else {
        //        $("#check_special_rate").hide();
        //        $("#special_rate").prop("required", false);
        //    }
        //});
        
//        $("#_013_mf11s_date").datepicker({
//            dateFormat: "ymmdd"
//        });  
        
        //MF11S_check
        if ($("#_032_mf11s_session_number").val() != "" || $("#_033_mf11s_isn").val() != ""){
            $("#session_number_isn_checkbox").attr("checked", true);
            $("#check_mf11s").show();
            $("#_032_mf11s_session_number").attr("disabled", false);
            $("#_033_mf11s_isn").attr("disabled", false);
        } else {
            $("#check_mf11s").hide();
            $("#_032_mf11s_session_number").attr("disabled", true);
            $("#_033_mf11s_isn").attr("disabled", true);
        }
    });
</script>
