<%-- 
    Document   : validate_rule_mt111
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : M Abdul Hadi
--%>

<script type="text/javascript">
//console.log("validate_rule_mt111.jsp loaded");
    $(document).ready(function () {
        let validator = $("#form1").validate({
            ignore: [],  
            onkeyup: false,          // Nonaktifkan validasi saat mengetik
            onfocusout: false,       // Nonaktifkan validasi saat pindah input
//            onclick: false,          // Nonaktifkan validasi saat klik
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
                _020_mf21_chequenumber: "required",
                //_020_mf21_chequenumber: "required",
                _030_mf30_date: "required",

                //mf32a
                //_060_mf32a_date: "required",
                _061_mf32a_currency: "required",
                _062_mf32a_amount: "required",

                //32
                type_mf32_: "required",
                _040_mf32a_date: "required",
                _041_mf32a_currency: "required",
                _042_mf32a_amount: "required",
                _043_mf32b_currency: "required",
                _044_mf32b_amount: "required",

                

                //mf50
                type_mf50_ordering_customer: "required",
                _091_mf50a_identifier_code: "required",
                _093_mf50f_party_identifier: "required",
                _094_mf50f_name_address: "required",
                _106_mf50k_name_address: "required",

                //of52
                _051_of52a_identifier_code: "required",
                _114_of52d_name_address: "required",

                //of53
                _121_of53a_identifier_code: "required",
                _126_of53d_name_address: "required",

                //of54
                _131_of54a_identifier_code: "required",
                _136_of54d_name_address: "required",

                //of55
                _141_of55a_identifier_code: "required",
                _146_of55d_name_address: "required",

                //of56
                _161_of56a_identifier_code: "required",
                _163_of56c_party_identifier: "required",
                _165_of56d_name_address: "required",

                //of57
                _171_of57a_identifier_code: "required",
                _175_of57c_party_identifier: "required",
                _177_of57d_name_address: "required",

                //mf59/59a
                type_of59_59a_: "required",
                _181_mf59_name_address: "required",
                _183_mf59a_identifier_code: "required",
                _186_mf59f_name_address: "required",

                //of71a
                _210_of71a_details_charges: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sender_reference: {required: "mf20 harus diisi..!!"},
                _030_mf23b_bank_code: {required: "mf23b_bank_code harus diisi..!!"},
                _020_mf21_chequenumber: {required: "mf21_chequenumber harus diisi..!!"},
                _030_mf30_date: {required: "mf30_date harus diisi..!!"},
                type_mf32_: {required: "type_mf32 harus dipilih..!!"},
                _040_mf32a_date: {required: "mf32a_date harus diisi..!!"},
                _041_mf32a_currency: {required: "mf32a_currency harus diisi..!!"},
                _042_mf32a_amount: {required: "mf32a_amount harus diisi..!!"},
                _050_mf32a_value_date: {required: "mf32a_value_date harus diisi..!!"},
                _043_mf32b_currency: {required: "mf32b_currency harus diisi..!!"},
                _044_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                type_mf50_ordering_customer: {required: "mf50_ordering_customer harus diisi..!!"},
                _091_mf50a_identifier_code: {required: "mf50a_identifier_code harus diisi..!!"},
                _093_mf50f_party_identifier: {required: "mf50f_party_identifier harus diisi..!!"},
                _094_mf50f_name_address: {required: "mf50f_name_address harus diisi..!!"},
                _106_mf50k_name_address: {required: "mf50k_name_address harus diisi..!!"},
                _051_of52a_identifier_code: {required: "of52a_identifier_code harus diisi..!!"},
                _114_of52d_name_address: {required: "of52d_name_address harus diisi..!!"},
                _121_of53a_identifier_code: {required: "of53a_identifier_code harus diisi..!!"},
                _126_of53d_name_address: {required: "of53d_name_address harus diisi..!!"},
                _131_of54a_identifier_code: {required: "of54a_identifier_code harus diisi..!!"},
                _136_of54d_name_address: {required: "of54d_name_address harus diisi..!!"},
                _141_of55a_identifier_code: {required: "of55a_identifier_code harus diisi..!!"},
                _146_of55d_name_address: {required: "of55d_name_address harus diisi..!!"},
                _161_of56a_identifier_code: {required: "of56a_identifier_code harus diisi..!!"},
                _163_of56c_party_identifier: {required: "of56c_party_identifier harus diisi..!!"},
                _165_of56d_name_address: {required: "of56d_name_address harus diisi..!!"},
                _171_of57a_identifier_code: {required: "of57a_identifier_code harus diisi..!!"},
                _175_of57c_party_identifier: {required: "of57c_party_identifier harus diisi..!!"},
                _177_of57d_name_address: {required: "of57d_name_address harus diisi..!!"},
                type_of59_59a_: {required: "of59_59a harus diisi..!!"},
                _181_mf59_name_address: {required: "mf59_name_address harus diisi..!!"},
                _183_mf59a_identifier_code: {required: "mf59a_identifier_code harus diisi..!!"},
                _186_mf59f_name_address: {required: "mf59_name_address harus diisi..!!"},
                _210_of71a_details_charges: {required: "of71a_details_charges harus diisi..!!"}
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                //alert(error.html());
                $("#tab-validate").removeAttr("hidden");
            },
            showErrors: function (errorMap, errorList) {
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
            }
        });
        
        $("#btn-validate").click(function () {
            let isValid = $("#form1").valid(); 
            if (isValid) {
                alert("All inputs are valid!");
            } 
        });

        $("#submit_mt").click(function (e) {
            e.preventDefault();
            let isValid = $("#form1").valid(); 
            if (isValid) {  
                $("#form1").submit(); 
            } else {
                alert("There are still errors! Please fix them before saving.");
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
        $("#mf32a_group").hide();
        $("#mf32b_group").hide();
        $("#_040_mf32a_date").attr("disabled", true);
        $("#_030_mf30_date, #_040_mf32a_date").datepicker({
            dateFormat: "ymmdd"
        });
        $("#_041_mf32a_currency").attr("disabled", true);
        $("#_042_mf32a_amount").attr("disabled", true);
        $("#_043_mf32b_currency").attr("disabled", true);
        $("#_044_mf32b_amount").attr("disabled", true);
        console.log($("#type_mf32_"))
        $("#type_mf32_").change(function () {
            console.log("Cliked")
            if ($("#type_mf32_").val() == "32a") {
                console.log($("#_040_mf32a_date"));
                $("#mf32a_group").show();
                $("#mf32b_group").hide();
                $("#_040_mf32a_date").attr("disabled", false);
                $("#_041_mf32a_currency").attr("disabled", false);
                $("#_042_mf32a_amount").attr("disabled", false);
                $("#_043_mf32b_currency").attr("disabled", true);
                $("#_044_mf32b_amount").attr("disabled", true);
            } else if ($("#type_mf32_").val() == "32b") {
                $("#mf32b_group").show();
                $("#mf32a_group").hide();
                $("#_040_mf32a_date").attr("disabled", true);
                $("#_041_mf32a_currency").attr("disabled", true);
                $("#_042_mf32a_amount").attr("disabled", true);
                $("#_043_mf32b_currency").attr("disabled", false);
                $("#_044_mf32b_amount").attr("disabled", false);
            } else {
                $("#mf32a_group").hide();
                $("#mf32b_group").hide();
                $("#_040_mf32a_date").attr("disabled", true);
                $("#_041_mf32a_currency").attr("disabled", true);
                $("#_042_mf32a_amount").attr("disabled", true);
                $("#_043_mf32b_currency").attr("disabled", true);
                $("#_044_mf32b_amount").attr("disabled", true);
            }
        })

        $("#div_of52a_seq_b").hide();
        $("#div_of52b_seq_b").hide();
        $("#div_of52b_seq_b").hide();
        $("#_050_of52a_party_identifier").attr("disabled", true);
        $("#_051_of52a_identifier_code").attr("disabled", true);
        $("#_052_of52b_party_identifier").attr("disabled", true);
        $("#_053_of52b_location").attr("disabled", true);
        $("#_054_of52d_party_identifier").attr("disabled", true);
        $("#_055_of52d_address").attr("disabled", true);

        $("#type_of52_52a_").change(function () {
            if ($("#type_of52_52a_").val() == "52a") {
                $("#div_of52a_seq_b").show();
                $("#div_of52b_seq_b").hide();
                $("#div_of52d_seq_b").hide();
                $("#_050_of52a_party_identifier").attr("disabled", false);
                $("#_051_of52a_identifier_code").attr("disabled", false);
                $("#_052_of52b_party_identifier").attr("disabled", true);
                $("#_053_of52b_location").attr("disabled", true);
                $("#_054_of52d_party_identifier").attr("disabled", true);
                $("#_055_of52d_address").attr("disabled", true);
            } else if ($("#type_of52_52a_").val() == "52b") {
                $("#div_of52b_seq_b").show();
                $("#div_of52a_seq_b").hide();
                $("#div_of52d_seq_b").hide();
                $("#_050_of52a_party_identifier").attr("disabled", true);
                $("#_051_of52a_identifier_code").attr("disabled", true);
                $("#_052_of52b_party_identifier").attr("disabled", false);
                $("#_053_of52b_location").attr("disabled", false);
                $("#_054_of52d_party_identifier").attr("disabled", true);
                $("#_055_of52d_address").attr("disabled", true);
            } else if ($("#type_of52_52a_").val() == "52d") {
                $("#div_of52d_seq_b").show();
                $("#div_of52a_seq_b").hide();
                $("#div_of52b_seq_b").hide();
                $("#_050_of52a_party_identifier").attr("disabled", true);
                $("#_051_of52a_identifier_code").attr("disabled", true);
                $("#_052_of52b_party_identifier").attr("disabled", true);
                $("#_053_of52b_location").attr("disabled", true);
                $("#_054_of52d_party_identifier").attr("disabled", false);
                $("#_055_of52d_address").attr("disabled", false);
            } else {
                $("#div_of52a_seq_b").hide();
                $("#div_of52b_seq_b").hide();
                $("#div_of52d_seq_b").hide();
                $("#_050_of52a_party_identifier").attr("disabled", true);
                $("#_051_of52a_identifier_code").attr("disabled", true);
                $("#_052_of52b_party_identifier").attr("disabled", true);
                $("#_053_of52b_location").attr("disabled", true);
                $("#_054_of52d_party_identifier").attr("disabled", true);
                $("#_055_of52d_address").attr("disabled", true);
            }
        })

        $("#check_of59").hide();
        $("#_060_of59_account").prop("required", false);
        $("#_061_of59_name_address").prop("required", false);
        $("#_060_of59_account").attr("disabled", true);
        $("#_061_of59_name_address").attr("disabled", true);
        $("#beneficiary_checkbox").click(function (){
            if($("#beneficiary_checkbox").is(":checked")){
                $("#check_of59").show();
                $("#_060_of59_account").prop("required", true);
                $("#_061_of59_name_address").prop("required", true);
                $("#_060_of59_account").attr("disabled", false);
                $("#_061_of59_name_address").attr("disabled", false);
            }else {
                $("#check_of59").hide();
                $("#_060_of59_account").prop("required", false);
                $("#_061_of59_name_address").prop("required", false);
                $("#_060_of59_account").attr("disabled", true);
                $("#_061_of59_name_address").attr("disabled", true);
            }
        })

        if($("#_040_mf32a_date").val() != "" ||$("#_041_mf32a_currency").val() != "" || $("#_042_mf32a_amount").val() != "") {
            $("#type_mf32_").val("32a").attr("selected", true);
             $("#mf32a_group").show();
                $("#mf32b_group").hide();
                $("#_040_mf32a_date").attr("disabled", false);
                $("#_041_mf32a_currency").attr("disabled", false);
                $("#_042_mf32a_amount").attr("disabled", false);
                $("#_043_mf32b_currency").attr("disabled", true);
                $("#_044_mf32b_amount").attr("disabled", true);


        } else if($("#_043_mf32b_currency").val() != "" || $("#_044_mf32b_amount").val() != "") {
            $("#type_mf32_").val("32b").attr("selected", true);
            $("#mf32b_group").show();
                $("#mf32a_group").hide();
                $("#_040_mf32a_date").attr("disabled", true);
                $("#_041_mf32a_currency").attr("disabled", true);
                $("#_042_mf32a_amount").attr("disabled", true);
                $("#_043_mf32b_currency").attr("disabled", false);
                $("#_044_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_").val("").attr("selected", true);
            $("#mf32a_group").hide();
            $("#mf32b_group").hide();
            $("#_040_mf32a_date").attr("disabled", true);
            $("#_041_mf32a_currency").attr("disabled", true);
            $("#_042_mf32a_amount").attr("disabled", true);
            $("#_043_mf32b_currency").attr("disabled", true);
            $("#_044_mf32b_amount").attr("disabled", true);
        }


        if($("#_050_of52a_party_identifier").val() != "" || $("#_051_of52a_identifier_code").val() != "") {
            $("#type_of52_52a_").val("52a").attr("selected", true);
            $("#div_of52a_seq_b").show();
            $("#div_of52b_seq_b").hide();
            $("#div_of52d_seq_b").hide();
            $("#_050_of52a_party_identifier").attr("disabled", false);
            $("#_051_of52a_identifier_code").attr("disabled", false);
            $("#_052_of52b_party_identifier").attr("disabled", true);
            $("#_053_of52b_location").attr("disabled", true);
            $("#_054_of52d_party_identifier").attr("disabled", true);
            $("#_055_of52d_address").attr("disabled", true);
        } else if($("#_052_of52b_party_identifier").val() != "" || $("#_053_of52b_location").val() != "") {
            $("#type_of52_52a_").val("52b").attr("selected", true);
            $("#div_of52b_seq_b").show();
            $("#div_of52a_seq_b").hide();
            $("#div_of52d_seq_b").hide();
            $("#_050_of52a_party_identifier").attr("disabled", true);
            $("#_051_of52a_identifier_code").attr("disabled", true);
            $("#_052_of52b_party_identifier").attr("disabled", false);
            $("#_053_of52b_location").attr("disabled", false);
            $("#_054_of52d_party_identifier").attr("disabled", true);
            $("#_055_of52d_address").attr("disabled", true);
        } else if($("#_054_of52d_party_identifier").val() != "" || $("#_055_of52d_address").val() != "") {
            $("#type_of52_52a_").val("52d").attr("selected", true);
            $("#div_of52d_seq_b").show();
            $("#div_of52a_seq_b").hide();
            $("#div_of52b_seq_b").hide();
            $("#_050_of52a_party_identifier").attr("disabled", true);
            $("#_051_of52a_identifier_code").attr("disabled", true);
            $("#_052_of52b_party_identifier").attr("disabled", true);
            $("#_053_of52b_location").attr("disabled", true);
            $("#_054_of52d_party_identifier").attr("disabled", false);
            $("#_055_of52d_address").attr("disabled", false);
        }
        else {
            $("#type_of52_52a_").val("").attr("selected", true);
            $("#div_of52a_seq_b").hide();
            $("#div_of52b_seq_b").hide();
            $("#div_of52d_seq_b").hide();
            $("#_050_of52a_party_identifier").attr("disabled", true);
            $("#_051_of52a_identifier_code").attr("disabled", true);
            $("#_052_of52b_party_identifier").attr("disabled", true);
            $("#_053_of52b_location").attr("disabled", true);
            $("#_054_of52d_party_identifier").attr("disabled", true);
            $("#_055_of52d_address").attr("disabled", true);
        } 

        if($("#_060_of59_account").val() != "" || $("#_061_of59_name_address").val() != "") {
            $("#beneficiary_checkbox").prop("checked", true);
            $("#check_of59").show();
            $("#_060_of59_account").prop("required", true);
            $("#_061_of59_name_address").prop("required", true);
            $("#_061_of59_name_address").attr("disabled", false);
            $("#_060_of59_account").attr("disabled", false); 
        } else {
            $("#beneficiary_checkbox").prop("checked", false);
            $("#check_of59").hide();
            $("#_060_of59_account").prop("required", false);
            $("#_061_of59_name_address").prop("required", false);
            $("#_061_of59_name_address").attr("disabled", true);
            $("#_060_of59_account").attr("disabled", true); 
        }    
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />