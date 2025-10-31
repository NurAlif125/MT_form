<%-- 
    Document   : validate_rule_mt940
    Created on : Mei 22, 2019
    Author     : Andhita Deara
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
                _010_mf20_transaction_reference_number: "required",
                _030_mf25_account_identification: "required",
                _040_mf28c_statement_sequence_number: "required",

                //mf25
                type_mf25_account_identification: "required",
                _030_mf25_account: "required",
                _031_mf25p_account: "required",
                
                //mf60_f_m
                type_mf60_opening_balance: "required",
                _050_mf60f_dc_mark: "required",
                _051_mf60f_date: "required",
                _052_mf60f_currency: "required",
                _053_mf60f_amount: "required",

                _054_mf60m_dc_mark: "required",
                _055_mf60m_date: "required",
                _056_mf60m_currency: "required",
                _057_mf60m_amount: "required",

                //mf62_f_m
                type_mf62_closing_balance: "required",
                _080_mf62f_dc_mark: "required",
                _081_mf62f_date: "required",
                _082_mf62f_currency: "required",
                _083_mf62f_amount: "required",

                _084_mf62m_dc_mark: "required",
                _085_mf62m_date: "required",
                _086_mf62m_currency: "required",
                _087_mf62m_amount: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_transaction_reference_number: {required: "mf20_transaction_reference_number harus diisi..!!"},
                _030_mf25_account_identification: {required: "mf25_account_identification harus diisi..!!"},
                _040_mf28c_statement_sequence_number: {required: "mf28c_statement_sequence_number harus diisi..!!"},
                type_mf60_opening_balance: {required: "mf60 harus diisi..!!"},
                _050_mf60f_dc_mark: {required: "_mf60f_dc_mark harus diisi..!!"},
                _051_mf60f_date: {required: "mf60f_date harus diisi..!!"},
                _052_mf60f_currency: {required: "mf60f_currency harus diisi..!!"},
                _053_mf60f_amount: {required: "mf60f_amount harus diisi..!!"},
                _054_mf60m_dc_mark: {required: "mf60m_dc_mark harus diisi..!!"},
                _055_mf60m_date: {required: "mf60m_date harus diisi..!!"},
                _056_mf60m_currency: {required: "mf60m_currency harus diisi..!!"},
                _057_mf60m_amount: {required: "mf60m_amount harus diisi..!!"},
                type_mf62_closing_balance: {required: "mf62 harus diisi..!!"},
                _080_mf62f_dc_mark: {required: "mf62f_dc_mark harus diisi..!!"},
                _081_mf62f_date: {required: "mf62f_date harus diisi..!!"},
                _082_mf62f_currency: {required: "mf62f_currency harus diisi..!!"},
                _083_mf62f_amount: {required: "mf62f_amount harus diisi..!!"},
                _084_mf62m_dc_mark: {required: "mf62m_dc_mark harus diisi..!!"},
                _085_mf62m_date: {required: "mf62m_date harus diisi..!!"},
                _086_mf62m_currency: {required: "mf62m_currency harus diisi..!!"},
                _087_mf62m_amount: {required: "mf62m_amount harus diisi..!!"},
                
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
    $(document).ready(function(){
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
        
        //mf25
        $("#div_mf25_first_account_identification").hide();
        $("#div_mf25p_intermediate_account_identification").hide();
        $("#_030_mf25_account").attr("disabled", true);
        $("#_031_mf25p_account").attr("disabled", true);
        $("#_032_mf25p_identifier_code").attr("disabled", true);
        $("#type_mf25_account_identification").change(function() {
            if ( $("#type_mf25_account_identification").val() == "f25"){
                $("#div_mf25_first_account_identification").show();
                $("#div_mf25p_intermediate_account_identification").hide();
                $("#_030_mf25_account").attr("disabled", false);
                $("#_031_mf25p_account").attr("disabled", true);
                $("#_032_mf25p_identifier_code").attr("disabled", true);
            } else if ( $("#type_mf25_account_identification").val() == "f25p"){
                $("#div_mf25_first_account_identification").hide();
                $("#div_mf25p_intermediate_account_identification").show();
                $("#_030_mf25_account").attr("disabled", true);
                $("#_031_mf25p_account").attr("disabled", false);
                $("#_032_mf25p_identifier_code").attr("disabled", false);
            } else{
                $("#div_mf25_first_account_identification").hide();
                $("#div_mf25p_intermediate_account_identification").hide();
                $("#_030_mf25_account").attr("disabled", true);
                $("#_031_mf25p_account").attr("disabled", true);
                $("#_032_mf25p_identifier_code").attr("disabled", true);
            }
        });
        
        //mf60_f_m
        $("#div_mf60f_first_opening_balance").hide();
        $("#div_mf60m_intermediate_opening_balance").hide();
        $("#_050_mf60f_dc_mark").attr("disabled", true);
        $("#_051_mf60f_date").attr("disabled", true);
        $("#_052_mf60f_currency").attr("disabled", true);
        $("#_053_mf60f_amount").attr("disabled", true);
        $("#_054_mf60m_dc_mark").attr("disabled", true);
        $("#_055_mf60m_date").attr("disabled", true);
        $("#_056_mf60m_currency").attr("disabled", true);
        $("#_057_mf60m_amount").attr("disabled", true);
        $("#type_mf60_opening_balance").change(function() {
            if ( $("#type_mf60_opening_balance").val() == "f"){
                $("#div_mf60f_first_opening_balance").show();
                $("#div_mf60m_intermediate_opening_balance").hide();
                $("#_050_mf60f_dc_mark").attr("disabled", false);
                $("#_051_mf60f_date").attr("disabled", false);
                $("#_052_mf60f_currency").attr("disabled", false);
                $("#_053_mf60f_amount").attr("disabled", false);
                $("#_054_mf60m_dc_mark").attr("disabled", true);
                $("#_055_mf60m_date").attr("disabled", true);
                $("#_056_mf60m_currency").attr("disabled", true);
                $("#_057_mf60m_amount").attr("disabled", true);
            } else if ( $("#type_mf60_opening_balance").val() == "m"){
                $("#div_mf60f_first_opening_balance").hide();
                $("#div_mf60m_intermediate_opening_balance").show();
                $("#_050_mf60f_dc_mark").attr("disabled", true);
                $("#_051_mf60f_date").attr("disabled", true);
                $("#_052_mf60f_currency").attr("disabled", true);
                $("#_053_mf60f_amount").attr("disabled", true);
                $("#_054_mf60m_dc_mark").attr("disabled", false);
                $("#_055_mf60m_date").attr("disabled", false);
                $("#_056_mf60m_currency").attr("disabled", false);
                $("#_057_mf60m_amount").attr("disabled", false);
            } else{
                $("#div_mf60f_first_opening_balance").hide();
                $("#div_mf60m_intermediate_opening_balance").hide();
                $("#_050_mf60f_dc_mark").attr("disabled", true);
                $("#_051_mf60f_date").attr("disabled", true);
                $("#_052_mf60f_currency").attr("disabled", true);
                $("#_053_mf60f_amount").attr("disabled", true);
                $("#_054_mf60m_dc_mark").attr("disabled", true);
                $("#_055_mf60m_date").attr("disabled", true);
                $("#_056_mf60m_currency").attr("disabled", true);
                $("#_057_mf60m_amount").attr("disabled", true);
            }
        });

        //of61
        $("#div_of61_statement_line").hide();
        $("#_062_of61_statement_line").attr("disabled", true);
        $("#_060_of61_add").click(function() {
            $("#div_of61_statement_line").show();
            $("#_062_of61_statement_line").attr("disabled", false);
        });
        $("#_061_of61_remove").click(function() {
            $("#div_of61_statement_line").hide();
            $("#_062_of61_statement_line").attr("disabled", true);
        });

        //of62_f_m
        $("#div_of62f_closing_balance").hide();
        $("#div_of62m_closing_balance").hide();
        $("#_080_mf62f_dc_mark").attr("disabled", true);
        $("#_081_mf62f_date").attr("disabled", true);
        $("#_082_mf62f_currency").attr("disabled", true);
        $("#_083_mf62f_amount").attr("disabled", true);
        $("#_084_mf62m_dc_mark").attr("disabled", true);
        $("#_085_mf62m_date").attr("disabled", true);
        $("#_086_mf62m_currency").attr("disabled", true);
        $("#_087_mf62m_amount").attr("disabled", true);
        $("#type_mf62_closing_balance").change(function() {
            if ( $("#type_mf62_closing_balance").val() == "f"){
                $("#div_of62f_closing_balance").show();
                $("#div_of62m_closing_balance").hide();
                $("#_080_mf62f_dc_mark").attr("disabled", false);
                $("#_081_mf62f_date").attr("disabled", false);
                $("#_082_mf62f_currency").attr("disabled", false);
                $("#_083_mf62f_amount").attr("disabled", false);
                $("#_084_mf62m_dc_mark").attr("disabled", true);
                $("#_085_mf62m_date").attr("disabled", true);
                $("#_086_mf62m_currency").attr("disabled", true);
                $("#_087_mf62m_amount").attr("disabled", true);
            } else if ( $("#type_mf62_closing_balance").val() == "m"){
                $("#div_of62f_closing_balance").hide();
                $("#div_of62m_closing_balance").show();
                $("#_080_mf62f_dc_mark").attr("disabled", true);
                $("#_081_mf62f_date").attr("disabled", true);
                $("#_082_mf62f_currency").attr("disabled", true);
                $("#_083_mf62f_amount").attr("disabled", true);
                $("#_084_mf62m_dc_mark").attr("disabled", false);
                $("#_085_mf62m_date").attr("disabled", false);
                $("#_086_mf62m_currency").attr("disabled", false);
                $("#_087_mf62m_amount").attr("disabled", false);
            } else{
                $("#div_of62f_closing_balance").hide();
                $("#div_of62m_closing_balance").hide();
                $("#_080_mf62f_dc_mark").attr("disabled", true);
                $("#_081_mf62f_date").attr("disabled", true);
                $("#_082_mf62f_currency").attr("disabled", true);
                $("#_083_mf62f_amount").attr("disabled", true);
                $("#_084_mf62m_dc_mark").attr("disabled", true);
                $("#_085_mf62m_date").attr("disabled", true);
                $("#_086_mf62m_currency").attr("disabled", true);
                $("#_087_mf62m_amount").attr("disabled", true);
            }
        });

        //of65
        $("#div_of65_forward_available_balance").hide();
        $("#_102_of65_dc_mark").attr("disabled", true);
        $("#_103_of65_date").attr("disabled", true);
        $("#_104_of65_currency").attr("disabled", true);
        $("#_105_of65_amount").attr("disabled", true);
        $("#_100_of65_add").click(function() {
            $("#div_of65_forward_available_balance").show();
            $("#_102_of65_dc_mark").attr("disabled", false);
            $("#_103_of65_date").attr("disabled", false);
            $("#_104_of65_currency").attr("disabled", false);
            $("#_105_of65_amount").attr("disabled", false);
        });
        $("#_101_of65_remove").click(function() {
            $("#div_of65_forward_available_balance").hide();
            $("#_102_of65_dc_mark").attr("disabled", true);
            $("#_103_of65_date").attr("disabled", true);
            $("#_104_of65_currency").attr("disabled", true);
            $("#_105_of65_amount").attr("disabled", true);
        });
        
        $("#check_of64").hide();
        $("#_090_of64_available_funds_dc_mark").prop("required", false);
        $("#_091_of64_available_funds_date").prop("required", false);
        $("#_092_of64_available_funds_currency").prop("required", false);
        $("#_093_of64_available_funds_amount").prop("required", false);
        $("#_090_of64_available_funds_dc_mark").attr("disabled", true);
        $("#_091_of64_available_funds_date").attr("disabled", true);
        $("#_092_of64_available_funds_currency").attr("disabled", true);
        $("#_093_of64_available_funds_amount").attr("disabled", true);
        $("#available_funds_checkbox").click(function (){
            if($("#available_funds_checkbox").is(":checked")){
                $("#check_of64").show();
                $("#_090_of64_available_funds_dc_mark").prop("required", true);
                $("#_091_of64_available_funds_date").prop("required", true);
                $("#_092_of64_available_funds_currency").prop("required", true);
                $("#_093_of64_available_funds_amount").prop("required", true);
                $("#_090_of64_available_funds_dc_mark").attr("disabled", false);
                $("#_091_of64_available_funds_date").attr("disabled", false);
                $("#_092_of64_available_funds_currency").attr("disabled", false);
                $("#_093_of64_available_funds_amount").attr("disabled", false);
            }else {
                $("#check_of64").hide();
                $("#_090_of64_available_funds_dc_mark").prop("required", false);
                $("#_091_of64_available_funds_date").prop("required", false);
                $("#_092_of64_available_funds_currency").prop("required", false);
                $("#_093_of64_available_funds_amount").prop("required", false);
                $("#_090_of64_available_funds_dc_mark").attr("disabled", true);
                $("#_091_of64_available_funds_date").attr("disabled", true);
                $("#_092_of64_available_funds_currency").attr("disabled", true);
                $("#_093_of64_available_funds_amount").attr("disabled", true);
            }
        });
    });
</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        if ($("#special_rate").val() != "") {
            $("#special_rate_checkbox").prop("checked", true);
            $("#check_special_rate").show();
            $("#special_rate").prop("required", true);
        } else {
            $("#check_special_rate").hide();
            $("#special_rate").prop("required", false);
        }
        
        //mf25
        if ($("#_030_mf25_account").val() != ""){
            $("#type_mf25_account_identification").val("f25").attr("selected",true);
            $("#div_mf25_first_account_identification").show();
            $("#div_mf25p_intermediate_account_identification").hide();
            $("#_030_mf25_account").attr("disabled", false);
            $("#_031_mf25p_account").attr("disabled", true);
            $("#_032_mf25p_identifier_code").attr("disabled", true);
        } else if ($("#_031_mf25p_account").val() != "" || $("#_032_mf25p_identifier_code").val() != ""){
            $("#type_mf25_account_identification").val("f25p").attr("selected",true);
            $("#div_mf25_first_account_identification").hide();
            $("#div_mf25p_intermediate_account_identification").show();
            $("#_030_mf25_account").attr("disabled", true);
            $("#_031_mf25p_account").attr("disabled", false);
            $("#_032_mf25p_identifier_code").attr("disabled", false);
        } else{
            $("#type_mf25_account_identification").val("");
            $("#div_mf25_first_account_identification").hide();
            $("#div_mf25p_intermediate_account_identification").hide();
            $("#_030_mf25_account").attr("disabled", true);
            $("#_031_mf25p_account").attr("disabled", true);
            $("#_032_mf25p_identifier_code").attr("disabled", true);
        }
        
        //mf60_f_m
        if ($("#_050_mf60f_dc_mark").val() != "" || $("#_051_mf60f_date").val() != "" || $("#_052_mf60f_currency").val() != "" || $("#_053_mf60f_amount").val() != ""){
            $("#type_mf60_opening_balance").val("f").attr("selected",true);
            $("#div_mf60f_first_opening_balance").show();
            $("#div_mf60m_intermediate_opening_balance").hide();
            $("#_050_mf60f_dc_mark").attr("disabled", false);
            $("#_051_mf60f_date").attr("disabled", false);
            $("#_052_mf60f_currency").attr("disabled", false);
            $("#_053_mf60f_amount").attr("disabled", false);
            $("#_054_mf60m_dc_mark").attr("disabled", true);
            $("#_055_mf60m_date").attr("disabled", true);
            $("#_056_mf60m_currency").attr("disabled", true);
            $("#_057_mf60m_amount").attr("disabled", true);
        } else if ($("#_054_mf60m_dc_mark").val() != "" || $("#_055_mf60m_date").val() != "" || $("#_056_mf60m_currency").val() != "" || $("#_057_mf60m_amount").val() != ""){
            $("#type_mf60_opening_balance").val("m").attr("selected",true);
            $("#div_mf60f_first_opening_balance").hide();
            $("#div_mf60m_intermediate_opening_balance").show();
            $("#_050_mf60f_dc_mark").attr("disabled", true);
            $("#_051_mf60f_date").attr("disabled", true);
            $("#_052_mf60f_currency").attr("disabled", true);
            $("#_053_mf60f_amount").attr("disabled", true);
            $("#_054_mf60m_dc_mark").attr("disabled", false);
            $("#_055_mf60m_date").attr("disabled", false);
            $("#_056_mf60m_currency").attr("disabled", false);
            $("#_057_mf60m_amount").attr("disabled", false);
        } else{
            $("#div_mf60f_first_opening_balance").hide();
            $("#div_mf60m_intermediate_opening_balance").hide();
            $("#_050_mf60f_dc_mark").attr("disabled", true);
            $("#_051_mf60f_date").attr("disabled", true);
            $("#_052_mf60f_currency").attr("disabled", true);
            $("#_053_mf60f_amount").attr("disabled", true);
            $("#_054_mf60m_dc_mark").attr("disabled", true);
            $("#_055_mf60m_date").attr("disabled", true);
            $("#_056_mf60m_currency").attr("disabled", true);
            $("#_057_mf60m_amount").attr("disabled", true);
        }

        //of61
        if ($("#_062_of61_statement_line").val() != ""){
            $("#div_of61_statement_line").show();
            $("#_062_of61_statement_line").attr("disabled", false);
        } else{
            $("#div_of61_statement_line").hide();
            $("#_062_of61_statement_line").attr("disabled", true);
        }
        
        //mf62_f_m
        if ($("#_080_mf62f_dc_mark").val() != "" || $("#_081_mf62f_date").val() != "" || $("#_082_mf62f_currency").val() != "" || $("#_083_mf62f_amount").val() != ""){
            $("#type_mf62_closing_balance").val("f").attr("selected",true);
            $("#div_of62f_closing_balance").show();
            $("#div_of62m_closing_balance").hide();
            $("#_080_mf62f_dc_mark").attr("disabled", false);
            $("#_081_mf62f_date").attr("disabled", false);
            $("#_082_mf62f_currency").attr("disabled", false);
            $("#_083_mf62f_amount").attr("disabled", false);
            $("#_084_mf62m_dc_mark").attr("disabled", true);
            $("#_085_mf62m_date").attr("disabled", true);
            $("#_086_mf62m_currency").attr("disabled", true);
            $("#_087_mf62m_amount").attr("disabled", true);
        } else if ($("#_084_mf62m_dc_mark").val() != "" || $("#_085_mf62m_date").val() != "" || $("#_086_mf62m_currency").val() != "" || $("#_087_mf62m_amount").val() != ""){
            $("#type_mf62_closing_balance").val("m").attr("selected",true);
            $("#div_of62f_closing_balance").hide();
            $("#div_of62m_closing_balance").show();
            $("#_080_mf62f_dc_mark").attr("disabled", true);
            $("#_081_mf62f_date").attr("disabled", true);
            $("#_082_mf62f_currency").attr("disabled", true);
            $("#_083_mf62f_amount").attr("disabled", true);
            $("#_084_mf62m_dc_mark").attr("disabled", false);
            $("#_085_mf62m_date").attr("disabled", false);
            $("#_086_mf62m_currency").attr("disabled", false);
            $("#_087_mf62m_amount").attr("disabled", false);
        } else{
            $("#div_of62f_closing_balance").hide();
            $("#div_of62m_closing_balance").hide();
            $("#_080_mf62f_dc_mark").attr("disabled", true);
            $("#_081_mf62f_date").attr("disabled", true);
            $("#_082_mf62f_currency").attr("disabled", true);
            $("#_083_mf62f_amount").attr("disabled", true);
            $("#_084_mf62m_dc_mark").attr("disabled", true);
            $("#_085_mf62m_date").attr("disabled", true);
            $("#_086_mf62m_currency").attr("disabled", true);
            $("#_087_mf62m_amount").attr("disabled", true);
        }
        
        //of65
        if ($("#_102_of65_dc_mark").val() != "" || $("#_103_of65_date").val() != "" || $("#_104_of65_currency").val() != "" || $("#_105_of65_amount").val() != ""){
            $("#div_of65_forward_available_balance").show();
            $("#_102_of65_dc_mark").attr("disabled", false);
            $("#_103_of65_date").attr("disabled", false);
            $("#_104_of65_currency").attr("disabled", false);
            $("#_105_of65_amount").attr("disabled", false);
        } else{
            $("#div_of65_forward_available_balance").hide();
            $("#_102_of65_dc_mark").attr("disabled", true);
            $("#_103_of65_date").attr("disabled", true);
            $("#_104_of65_currency").attr("disabled", true);
            $("#_105_of65_amount").attr("disabled", true);
        }
    });
</script>