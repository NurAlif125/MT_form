<%-- 
    Document   : validate_rule_mt950
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
                _020_mf25_account_identification: "required",
                _030_mf28c_statement_sequence_number: "required",

                //mf60_f_m
                type_mf60_opening_balance: "required",
                _040_mf60f_dc_mark: "required",
                _041_mf60f_date: "required",
                _042_mf60f_currency: "required",
                _043_mf60f_amount: "required",

                _044_mf60m_dc_mark: "required",
                _045_mf60m_date: "required",
                _046_mf60m_currency: "required",
                _047_mf60m_amount: "required",

                //mf62_f_m
                type_mf62_closing_balance: "required",
                _061_mf62f_dc_mark: "required",
                _062_mf62f_date: "required",
                _063_mf62f_currency: "required",
                _064_mf62f_amount: "required",

                _065_mf62m_dc_mark: "required",
                _066_mf62m_date: "required",
                _067_mf62m_currency: "required",
                _068_mf62m_amount: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_transaction_reference_number: {required: "mf20_transaction_reference_number harus diisi..!!"},
                _020_mf25_account_identification: {required: "mf25_account_identification harus diisi..!!"},
                _030_mf28c_statement_sequence_number: {required: "mf28c_statement_sequence_number harus diisi..!!"},
                type_mf60_opening_balance: {required: "mf60 harus diisi..!!"},
                _040_mf60f_dc_mark: {required: "_mf60f_dc_mark harus diisi..!!"},
                _041_mf60f_date: {required: "mf60f_date harus diisi..!!"},
                _042_mf60f_currency: {required: "mf60f_currency harus diisi..!!"},
                _043_mf60f_amount: {required: "mf60f_amount harus diisi..!!"},
                _044_mf60m_dc_mark: {required: "mf60m_dc_mark harus diisi..!!"},
                _045_mf60m_date: {required: "mf60m_date harus diisi..!!"},
                _046_mf60m_currency: {required: "mf60m_currency harus diisi..!!"},
                _047_mf60m_amount: {required: "mf60m_amount harus diisi..!!"},
                type_mf62_closing_balance: {required: "mf62 harus diisi..!!"},
                _061_mf62f_dc_mark: {required: "mf62f_dc_mark harus diisi..!!"},
                _062_mf62f_date: {required: "mf62f_date harus diisi..!!"},
                _063_mf62f_currency: {required: "mf62f_currency harus diisi..!!"},
                _064_mf62f_amount: {required: "mf62f_amount harus diisi..!!"},
                _065_mf62m_dc_mark: {required: "mf62m_dc_mark harus diisi..!!"},
                _066_mf62m_date: {required: "mf62m_date harus diisi..!!"},
                _067_mf62m_currency: {required: "mf62m_currency harus diisi..!!"},
                _068_mf62m_amount: {required: "mf62m_amount harus diisi..!!"},
                
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
        
        //mf60_f_m
        $("#div_mf60f_first_opening_balance").hide();
        $("#div_mf60m_intermediate_opening_balance").hide();
        $("#_040_mf60f_dc_mark").attr("disabled", true);
        $("#_041_mf60f_date").attr("disabled", true);
        $("#_042_mf60f_currency").attr("disabled", true);
        $("#_043_mf60f_amount").attr("disabled", true);
        $("#_044_mf60m_dc_mark").attr("disabled", true);
        $("#_045_mf60m_date").attr("disabled", true);
        $("#_046_mf60m_currency").attr("disabled", true);
        $("#_047_mf60m_amount").attr("disabled", true);
        $("#type_mf60_opening_balance").change(function() {
            if ( $("#type_mf60_opening_balance").val() == "f"){
                $("#div_mf60f_first_opening_balance").show();
                $("#div_mf60m_intermediate_opening_balance").hide();
                $("#_040_mf60f_dc_mark").attr("disabled", false);
                $("#_041_mf60f_date").attr("disabled", false);
                $("#_042_mf60f_currency").attr("disabled", false);
                $("#_043_mf60f_amount").attr("disabled", false);
                $("#_044_mf60m_dc_mark").attr("disabled", true);
                $("#_045_mf60m_date").attr("disabled", true);
                $("#_046_mf60m_currency").attr("disabled", true);
                $("#_047_mf60m_amount").attr("disabled", true);
            } else if ( $("#type_mf60_opening_balance").val() == "m"){
                $("#div_mf60f_first_opening_balance").hide();
                $("#div_mf60m_intermediate_opening_balance").show();
                $("#_040_mf60f_dc_mark").attr("disabled", true);
                $("#_041_mf60f_date").attr("disabled", true);
                $("#_042_mf60f_currency").attr("disabled", true);
                $("#_043_mf60f_amount").attr("disabled", true);
                $("#_044_mf60m_dc_mark").attr("disabled", false);
                $("#_045_mf60m_date").attr("disabled", false);
                $("#_046_mf60m_currency").attr("disabled", false);
                $("#_047_mf60m_amount").attr("disabled", false);
            } else{
                $("#div_mf60f_first_opening_balance").hide();
                $("#div_mf60m_intermediate_opening_balance").hide();
                $("#_040_mf60f_dc_mark").attr("disabled", true);
                $("#_041_mf60f_date").attr("disabled", true);
                $("#_042_mf60f_currency").attr("disabled", true);
                $("#_043_mf60f_amount").attr("disabled", true);
                $("#_044_mf60m_dc_mark").attr("disabled", true);
                $("#_045_mf60m_date").attr("disabled", true);
                $("#_046_mf60m_currency").attr("disabled", true);
                $("#_047_mf60m_amount").attr("disabled", true);
            }
        });

        //of61
        $("#div_of61_statement_line").hide();
        $("#_052_of61_statement_line").attr("disabled", true);
        $("#_050_of61_add").click(function() {
            $("#div_of61_statement_line").show();
            $("#_052_of61_statement_line").attr("disabled", false);
        });
        $("#_051_of61_remove").click(function() {
            $("#div_of61_statement_line").hide();
            $("#_052_of61_statement_line").attr("disabled", true);
        });

        //of62_f_m
        $("#type_mf62_closing_balance").val("");
        $("#div_mf62f_closing_balance").hide();
        $("#div_mf62m_closing_balance").hide();
        $("#_061_mf62f_dc_mark").attr("disabled", true);
        $("#_062_mf62f_date").attr("disabled", true);
        $("#_063_mf62f_currency").attr("disabled", true);
        $("#_064_mf62f_amount").attr("disabled", true);
        $("#_065_mf62m_dc_mark").attr("disabled", true);
        $("#_066_mf62m_date").attr("disabled", true);
        $("#_067_mf62m_currency").attr("disabled", true);
        $("#_068_mf62m_amount").attr("disabled", true);
        console.log($("#type_mf62_closing_balance"))
        $("#type_mf62_closing_balance").change(function() {
            console.log("Cliked")
            if ( $("#type_mf62_closing_balance").val() == "f"){
                $("#div_mf62f_closing_balance").show();
                $("#div_mf62m_closing_balance").hide();
                $("#_061_mf62f_dc_mark").attr("disabled", false);
                $("#_062_mf62f_date").attr("disabled", false);
                $("#_063_mf62f_currency").attr("disabled", false);
                $("#_064_mf62f_amount").attr("disabled", false);
                $("#_065_mf62m_dc_mark").attr("disabled", true);
                $("#_066_mf62m_date").attr("disabled", true);
                $("#_067_mf62m_currency").attr("disabled", true);
                $("#_068_mf62m_amount").attr("disabled", true);
            } else if ( $("#type_mf62_closing_balance").val() == "m"){
                $("#div_mf62f_closing_balance").hide();
                $("#div_mf62m_closing_balance").show();
                $("#_061_mf62f_dc_mark").attr("disabled", true);
                $("#_062_mf62f_date").attr("disabled", true);
                $("#_063_mf62f_currency").attr("disabled", true);
                $("#_064_mf62f_amount").attr("disabled", true);
                $("#_065_mf62m_dc_mark").attr("disabled", false);
                $("#_066_mf62m_date").attr("disabled", false);
                $("#_067_mf62m_currency").attr("disabled", false);
                $("#_068_mf62m_amount").attr("disabled", false);
            } else{
                $("#div_mf62f_closing_balance").hide();
                $("#div_mf62m_closing_balance").hide();
                $("#_061_mf62f_dc_mark").attr("disabled", true);
                $("#_062_mf62f_date").attr("disabled", true);
                $("#_063_mf62f_currency").attr("disabled", true);
                $("#_064_mf62f_amount").attr("disabled", true);
                $("#_065_mf62m_dc_mark").attr("disabled", true);
                $("#_066_mf62m_date").attr("disabled", true);
                $("#_067_mf62m_currency").attr("disabled", true);
                $("#_068_mf62m_amount").attr("disabled", true);
            }
        });
        
        $("#check_of64").hide();
        $("#_070_of64_dc_mark").prop("required", false);
        $("#_071_of64_date").prop("required", false);
        $("#_072_of64_currency").prop("required", false);
        $("#_073_of64_amount").prop("required", false);
        $("#_070_of64_dc_mark").attr("disabled", true);
        $("#_071_of64_date").attr("disabled", true);
        $("#_072_of64_currency").attr("disabled", true);
        $("#_073_of64_amount").attr("disabled", true);
        $("#available_funds_checkbox").click(function (){
            if($("#available_funds_checkbox").is(":checked")){
                $("#check_of64").show();
                $("#_070_of64_dc_mark").prop("required", true);
                $("#_071_of64_date").prop("required", true);
                $("#_072_of64_currency").prop("required", true);
                $("#_073_of64_amount").prop("required", true);
                $("#_070_of64_dc_mark").attr("disabled", false);
                $("#_071_of64_date").attr("disabled", false);
                $("#_072_of64_currency").attr("disabled", false);
                $("#_073_of64_amount").attr("disabled", false);
            }else {
                $("#check_of64").hide();
                $("#_070_of64_dc_mark").prop("required", false);
                $("#_071_of64_date").prop("required", false);
                $("#_072_of64_currency").prop("required", false);
                $("#_073_of64_amount").prop("required", false);
                $("#_070_of64_dc_mark").attr("disabled", true);
                $("#_071_of64_date").attr("disabled", true);
                $("#_072_of64_currency").attr("disabled", true);
                $("#_073_of64_amount").attr("disabled", true);
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
        
        //mf60_f_m
        if ($("#_040_mf60f_dc_mark").val() != "" || $("#_041_mf60f_date").val() != "" || $("#_042_mf60f_currency").val() != "" || $("#_043_mf60f_amount").val() != ""){
            $("#type_mf60_opening_balance").val("f").attr("selected",true);
            $("#div_mf60f_first_opening_balance").show();
            $("#div_mf60m_intermediate_opening_balance").hide();
            $("#_040_mf60f_dc_mark").attr("disabled", false);
            $("#_041_mf60f_date").attr("disabled", false);
            $("#_042_mf60f_currency").attr("disabled", false);
            $("#_043_mf60f_amount").attr("disabled", false);
            $("#_044_mf60m_dc_mark").attr("disabled", true);
            $("#_045_mf60m_date").attr("disabled", true);
            $("#_046_mf60m_currency").attr("disabled", true);
            $("#_047_mf60m_amount").attr("disabled", true);
        } else if ($("#_044_mf60m_dc_mark").val() != "" || $("#_045_mf60m_date").val() != "" || $("#_046_mf60m_currency").val() != "" || $("#_047_mf60m_amount").val() != ""){
            $("#type_mf60_opening_balance").val("m").attr("selected",true);
            $("#div_mf60f_first_opening_balance").hide();
            $("#div_mf60m_intermediate_opening_balance").show();
            $("#_040_mf60f_dc_mark").attr("disabled", true);
            $("#_041_mf60f_date").attr("disabled", true);
            $("#_042_mf60f_currency").attr("disabled", true);
            $("#_043_mf60f_amount").attr("disabled", true);
            $("#_044_mf60m_dc_mark").attr("disabled", false);
            $("#_045_mf60m_date").attr("disabled", false);
            $("#_046_mf60m_currency").attr("disabled", false);
            $("#_047_mf60m_amount").attr("disabled", false);
        } else{
            $("#div_mf60f_first_opening_balance").hide();
            $("#div_mf60m_intermediate_opening_balance").hide();
            $("#_040_mf60f_dc_mark").attr("disabled", true);
            $("#_041_mf60f_date").attr("disabled", true);
            $("#_042_mf60f_currency").attr("disabled", true);
            $("#_043_mf60f_amount").attr("disabled", true);
            $("#_044_mf60m_dc_mark").attr("disabled", true);
            $("#_045_mf60m_date").attr("disabled", true);
            $("#_046_mf60m_currency").attr("disabled", true);
            $("#_047_mf60m_amount").attr("disabled", true);
        }
        
        //of61
        if ($("#_052_of61_statement_line").val() != ""){
            $("#div_of61_statement_line").show();
            $("#_052_of61_statement_line").attr("disabled", false);
        } else{
            $("#div_of61_statement_line").hide();
            $("#_052_of61_statement_line").attr("disabled", true);
        }
        
        //mf62_f_m
        if ($("#_061_mf62f_dc_mark").val() != "" || $("#_062_mf62f_date").val() != "" || $("#_063_mf62f_currency").val() != "" || $("#_064_mf62f_amount").val() != ""){
            //$("#type_mf62_closing_balance").val("f").attr("selected",true);
            $("#type_mf62_closing_balance").val("f");
            $("#div_mf62f_closing_balance").show();
            $("#div_mf62m_closing_balance").hide();
            $("#_061_mf62f_dc_mark").attr("disabled", false);
            $("#_062_mf62f_date").attr("disabled", false);
            $("#_063_mf62f_currency").attr("disabled", false);
            $("#_064_mf62f_amount").attr("disabled", false);
            $("#_065_mf62m_dc_mark").attr("disabled", true);
            $("#_066_mf62m_date").attr("disabled", true);
            $("#_067_mf62m_currency").attr("disabled", true);
            $("#_068_mf62m_amount").attr("disabled", true);
        } else if ($("#_065_mf62m_dc_mark").val() != "" || $("#_066_mf62m_date").val() != "" || $("#_067_mf62m_currency").val() != "" || $("#_068_mf62m_amount").val() != ""){
            //$("#type_mf62_closing_balance").val("m").attr("selected",true);
            $("#type_mf62_closing_balance").val("m");
            $("#div_mf62f_closing_balance").hide();
            $("#div_mf62m_closing_balance").show();
            $("#_061_mf62f_dc_mark").attr("disabled", true);
            $("#_062_mf62f_date").attr("disabled", true);
            $("#_063_mf62f_currency").attr("disabled", true);
            $("#_064_mf62f_amount").attr("disabled", true);
            $("#_065_mf62m_dc_mark").attr("disabled", false);
            $("#_066_mf62m_date").attr("disabled", false);
            $("#_067_mf62m_currency").attr("disabled", false);
            $("#_068_mf62m_amount").attr("disabled", false);
        } else{
            //$("#type_mf62_closing_balance").val("").attr("selected", true);
            $("#type_mf62_closing_balance").val("");
            $("#div_mf62f_closing_balance").hide();
            $("#div_mf62m_closing_balance").hide();
            $("#_061_mf62f_dc_mark").attr("disabled", true);
            $("#_062_mf62f_date").attr("disabled", true);
            $("#_063_mf62f_currency").attr("disabled", true);
            $("#_064_mf62f_amount").attr("disabled", true);
            $("#_065_mf62m_dc_mark").attr("disabled", true);
            $("#_066_mf62m_date").attr("disabled", true);
            $("#_067_mf62m_currency").attr("disabled", true);
            $("#_068_mf62m_amount").attr("disabled", true);
        }
        
    });
</script>