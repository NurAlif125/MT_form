<%-- 
    Document   : validate_rule_mt202
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
                _011_mf21_: "required",

                //mf32a
                _060_mf32a_date: "required",
                _061_mf32a_currency: "required",
                _062_mf32a_amount: "required",

                //of52
                _111_of52a_identifier_code: "required",
                _114_of52d_name_address: "required",

                //of53
                _121_of53a_identifier_code: "required",
                _126_of53d_name_address: "required",

                //of54
                _131_of54a_identifier_code: "required",
                _136_of54d_name_address: "required",

                //of56
                _161_of56a_identifier_code: "required",
                _165_of56d_name_address: "required",

                //of57
                _171_of57a_identifier_code: "required",
                _177_of57d_name_address: "required",

                //of58
                type_of58_: "required",
                _181_of58a_identifier_code: "required",
                _184_of58d_name_address: "required",
                
                //mf50
                type_mf50_ordering_customer: "required",
                _241_mf50a_identifier_code: "required",
                
                //mf59
                type_of59_59a_: "required",
                _291_mf59_name_address: "required",
                _293_mf59a_identifier_code: "required",

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                
                //body
                _010_mf20_sender_reference: {required: "mf20 Sender Reference must be filled..!!"},
                _011_mf21_: {required: "mf21 must be filled..!!"},
                _060_mf32a_date: {required: "mf32a_date must be filled..!!"},
                _061_mf32a_currency: {required: "mf32a_currency must be filled..!!"},
                _062_mf32a_amount: {required: "mf32a_amount must be filled..!!"},
                _111_of52a_identifier_code: {required: "of52a_identifier_code must be filled..!!"},
                _114_of52d_name_address: {required: "of52d_name_address must be filled..!!"},
                type_of58_: {required: "MF58 Beneficiary Institution must be filled..!!"},
                _181_of58a_identifier_code: {required: "of58a_identifier_code must be filled..!!"},
                _184_of58d_name_address: {required: "of58d_name_address must be filled..!!"},
                type_mf50_ordering_customer: {required: "mf50_ordering_customer must be filled..!!"},
                _241_mf50a_identifier_code: {required: "mf50a_identifier_code must be filled..!!"},
                _243_mf50f_party_identifier: {required: "mf50f_party_identifier must be filled..!!"},
                _244_mf50f_name_address: {required: "mf50f_name_address must be filled..!!"},
                _246_mf50k_name_address: {required: "mf50k_name_address must be filled..!!"},
                type_of59_59a_: {required: "MF59 Beneficiary Customer must be filed..!!"},
                _291_mf59_name_address: {required: "MF59 Name and Address must be filled..!!"},
                _293_mf59a_identifier_code: {required: "MF59A Identifier Code must be filled..!!"}
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
//                alert(error.html());
                $("#tab-validate").removeAttr("hidden");
                $("#tab-validate").css("display", "");
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
                
                $("#tab-validate").removeAttr("hidden");
                 $("#tab-validate").css("display", "");
                 
                $("#view1, #view2, #view3, #view4, #view5").css("display", "none");
                $("#view6").css("display", "block");
                $('#tab-view1').removeClass("selected").removeAttr('class');
                $('#tab-view2').removeClass("selected").removeAttr('class');
                $('#tab-view3').removeClass("selected").removeAttr('class');
                $('#tab-view4').removeClass("selected").removeAttr('class');
                $('#tab-view5').removeClass("selected").removeAttr('class');
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
                                $("#view2, #view3, #view4, #view5, #view6").css("display", "none");
                                $("#view1").css("display", "block");
                                $('#tab-view1').addClass("selected");
                                $('#tab-view2').removeClass("selected").removeAttr('class');
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                            } 
                            else if (tabContentGroup == "Body") {
                                 $("#view1, #view3, #view4, #view5, #view6").css("display", "none");
                                $('#tab-view1').removeClass("selected").removeAttr('class');
                                $("#view2").css("display", "block");
                                $('#tab-view2').addClass("selected");
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                                
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
        
//        specialrate
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
        
        //of13c
        $("#div_of13c_").hide();
        $("#_022_of13c_code").attr("disabled", true);
        $("#_020_of13c_add").click(function() {
            $("#div_of13c_").show();
            $("#_022_of13c_code").attr("disabled", false);
        });
        $("#_021_of13c_remove").click(function() {
            $("#div_of13c_").hide();
            $("#_022_of13c_code").attr("disabled", true);
        });

        //of52_a_d
        $("#div_of52a_").hide();
        $("#div_of52d_").hide();
        $("#_110_of52a_party_identifier").attr("disabled", true);
        $("#_111_of52a_identifier_code").attr("disabled", true);
        $("#_113_of52d_party_identifier").attr("disabled", true);
        $("#_114_of52d_name_address").attr("disabled", true);
        $("#type_of52_").change(function() {
            if ( $("#type_of52_").val() == "a"){
                $("#div_of52a_").show();
                $("#div_of52d_").hide();
                $("#_110_of52a_party_identifier").attr("disabled", false);
                $("#_111_of52a_identifier_code").attr("disabled", false);
                $("#_113_of52d_party_identifier").attr("disabled", true);
                $("#_114_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52_").val() == "d"){
                $("#div_of52a_").hide();
                $("#div_of52d_").show();
                $("#_110_of52a_party_identifier").attr("disabled", true);
                $("#_111_of52a_identifier_code").attr("disabled", true);
                $("#_113_of52d_party_identifier").attr("disabled", false);
                $("#_114_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a_").hide();
                $("#div_of52d_").hide();
                $("#_110_of52a_party_identifier").attr("disabled", true);
                $("#_111_of52a_identifier_code").attr("disabled", true);
                $("#_113_of52d_party_identifier").attr("disabled", true);
                $("#_114_of52d_name_address").attr("disabled", true);
            }
        });

        //of53_a_b_d
        $("#div_of53a_").hide();
        $("#div_of53b_").hide();
        $("#div_of53d_").hide();
        $("#_120_of53a_party_identifier").attr("disabled", true);
        $("#_121_of53a_identifier_code").attr("disabled", true);
        $("#_123_of53b_party_identifier").attr("disabled", true);
        $("#_124_of53b_location").attr("disabled", true);
        $("#_125_of53d_party_identifier").attr("disabled", true);
        $("#_126_of53d_name_address").attr("disabled", true);
        $("#type_of53_").change(function() {
            if ( $("#type_of53_").val() == "a"){
                $("#div_of53a_").show();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_120_of53a_party_identifier").attr("disabled", false);
                $("#_121_of53a_identifier_code").attr("disabled", false);
                $("#_123_of53b_party_identifier").attr("disabled", true);
                $("#_124_of53b_location").attr("disabled", true);
                $("#_125_of53d_party_identifier").attr("disabled", true);
                $("#_126_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_").val() == "b"){
                $("#div_of53a_").hide();
                $("#div_of53b_").show();
                $("#div_of53d_").hide();
                $("#_120_of53a_party_identifier").attr("disabled", true);
                $("#_121_of53a_identifier_code").attr("disabled", true);
                $("#_123_of53b_party_identifier").attr("disabled", false);
                $("#_124_of53b_location").attr("disabled", false);
                $("#_125_of53d_party_identifier").attr("disabled", true);
                $("#_126_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_").val() == "d"){
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").show();
                $("#_120_of53a_party_identifier").attr("disabled", true);
                $("#_121_of53a_identifier_code").attr("disabled", true);
                $("#_123_of53b_party_identifier").attr("disabled", true);
                $("#_124_of53b_location").attr("disabled", true);
                $("#_125_of53d_party_identifier").attr("disabled", false);
                $("#_126_of53d_name_address").attr("disabled", false);
            } else{
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_120_of53a_party_identifier").attr("disabled", true);
                $("#_121_of53a_identifier_code").attr("disabled", true);
                $("#_123_of53b_party_identifier").attr("disabled", true);
                $("#_124_of53b_location").attr("disabled", true);
                $("#_125_of53d_party_identifier").attr("disabled", true);
                $("#_126_of53d_name_address").attr("disabled", true);
            }
        });

        //of54_a_b_d
        $("#div_of54a_").hide();
        $("#div_of54b_").hide();
        $("#div_of54d_").hide();
        $("#_130_of54a_party_identifier").attr("disabled", true);
        $("#_131_of54a_identifier_code").attr("disabled", true);
        $("#_133_of54b_party_identifier").attr("disabled", true);
        $("#_134_of54b_location").attr("disabled", true);
        $("#_135_of54d_party_identifier").attr("disabled", true);
        $("#_136_of54d_name_address").attr("disabled", true);
        $("#type_of54_").change(function() {
            if ( $("#type_of54_").val() == "a"){
                $("#div_of54a_").show();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_130_of54a_party_identifier").attr("disabled", false);
                $("#_131_of54a_identifier_code").attr("disabled", false);
                $("#_133_of54b_party_identifier").attr("disabled", true);
                $("#_134_of54b_location").attr("disabled", true);
                $("#_135_of54d_party_identifier").attr("disabled", true);
                $("#_136_of54d_name_address").attr("disabled", true);
            } else if ( $("#type_of54_").val() == "b"){
                $("#div_of54a_").hide();
                $("#div_of54b_").show();
                $("#div_of54d_").hide();
                $("#_130_of54a_party_identifier").attr("disabled", true);
                $("#_131_of54a_identifier_code").attr("disabled", true);
                $("#_133_of54b_party_identifier").attr("disabled", false);
                $("#_134_of54b_location").attr("disabled", false);
                $("#_135_of54d_party_identifier").attr("disabled", true);
                $("#_136_of54d_name_address").attr("disabled", true);
            } else if ( $("#type_of54_").val() == "d"){
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").show();
                $("#_130_of54a_party_identifier").attr("disabled", true);
                $("#_131_of54a_identifier_code").attr("disabled", true);
                $("#_133_of54b_party_identifier").attr("disabled", true);
                $("#_134_of54b_location").attr("disabled", true);
                $("#_135_of54d_party_identifier").attr("disabled", false);
                $("#_136_of54d_name_address").attr("disabled", false);
            } else{
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_130_of54a_party_identifier").attr("disabled", true);
                $("#_131_of54a_identifier_code").attr("disabled", true);
                $("#_133_of54b_party_identifier").attr("disabled", true);
                $("#_134_of54b_location").attr("disabled", true);
                $("#_135_of54d_party_identifier").attr("disabled", true);
                $("#_136_of54d_name_address").attr("disabled", true);
            }
        });

        //of56_a_d
        $("#div_of56a_").hide();
        $("#div_of56d_").hide();
        $("#_160_of56a_party_identifier").attr("disabled", true);
        $("#_161_of56a_identifier_code").attr("disabled", true);
        $("#_164_of56d_party_identifier").attr("disabled", true);
        $("#_165_of56d_name_address").attr("disabled", true);
        $("#type_of56_").change(function() {
            if ( $("#type_of56_").val() == "a"){
                $("#div_of56a_").show();
                $("#div_of56d_").hide();
                $("#_160_of56a_party_identifier").attr("disabled", false);
                $("#_161_of56a_identifier_code").attr("disabled", false);
                $("#_164_of56d_party_identifier").attr("disabled", true);
                $("#_165_of56d_name_address").attr("disabled", true);
            } else if ( $("#type_of56_").val() == "d"){
                $("#div_of56a_").hide();
                $("#div_of56d_").show();
                $("#_160_of56a_party_identifier").attr("disabled", true);
                $("#_161_of56a_identifier_code").attr("disabled", true);
                $("#_164_of56d_party_identifier").attr("disabled", false);
                $("#_165_of56d_name_address").attr("disabled", false);
            } else{
                $("#div_of56a_").hide();
                $("#div_of56d_").hide();
                $("#_160_of56a_party_identifier").attr("disabled", true);
                $("#_161_of56a_identifier_code").attr("disabled", true);
                $("#_164_of56d_party_identifier").attr("disabled", true);
                $("#_165_of56d_name_address").attr("disabled", true);
            }
        });

        //of57_a_b_d
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_170_of57a_party_identifier").attr("disabled", true);
        $("#_171_of57a_identifier_code").attr("disabled", true);
        $("#_173_of57b_party_identifier").attr("disabled", true);
        $("#_174_of57b_location").attr("disabled", true);
        $("#_176_of57d_party_identifier").attr("disabled", true);
        $("#_177_of57d_name_address").attr("disabled", true);
        $("#type_of57_").change(function() {
            if ( $("#type_of57_").val() == "a"){
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_170_of57a_party_identifier").attr("disabled", false);
                $("#_171_of57a_identifier_code").attr("disabled", false);
                $("#_173_of57b_party_identifier").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_176_of57d_party_identifier").attr("disabled", true);
                $("#_177_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_").val() == "b"){
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_170_of57a_party_identifier").attr("disabled", true);
                $("#_171_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifier").attr("disabled", false);
                $("#_174_of57b_location").attr("disabled", false);
                $("#_176_of57d_party_identifier").attr("disabled", true);
                $("#_177_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_").val() == "d"){
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_170_of57a_party_identifier").attr("disabled", true);
                $("#_171_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifier").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_176_of57d_party_identifier").attr("disabled", false);
                $("#_177_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_170_of57a_party_identifier").attr("disabled", true);
                $("#_171_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifier").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_176_of57d_party_identifier").attr("disabled", true);
                $("#_177_of57d_name_address").attr("disabled", true);
            }
        });

        //of58_a_d
        $("#div_of58a_").hide();
        $("#div_of58d_").hide();
        $("#_180_of58a_party_identifier").attr("disabled", true);
        $("#_181_of58a_identifier_code").attr("disabled", true);
        $("#_183_of58d_party_identifier").attr("disabled", true);
        $("#_184_of58d_name_address").attr("disabled", true);
        $("#type_of58_").change(function() {
            if ( $("#type_of58_").val() == "a"){
                $("#div_of58a_").show();
                $("#div_of58d_").hide();
                $("#_180_of58a_party_identifier").attr("disabled", false);
                $("#_181_of58a_identifier_code").attr("disabled", false);
                $("#_183_of58d_party_identifier").attr("disabled", true);
                $("#_184_of58d_name_address").attr("disabled", true);
            } else if ( $("#type_of58_").val() == "d"){
                $("#div_of58a_").hide();
                $("#div_of58d_").show();
                $("#_180_of58a_party_identifier").attr("disabled", true);
                $("#_181_of58a_identifier_code").attr("disabled", true);
                $("#_183_of58d_party_identifier").attr("disabled", false);
                $("#_184_of58d_name_address").attr("disabled", false);
            } else{
                $("#div_of58a_").hide();
                $("#div_of58d_").hide();
                $("#_180_of58a_party_identifier").attr("disabled", true);
                $("#_181_of58a_identifier_code").attr("disabled", true);
                $("#_183_of58d_party_identifier").attr("disabled", true);
                $("#_184_of58d_name_address").attr("disabled", true);
            }
        });
        
//        mf50_a_f_k
        $("#div_mf50a_").hide();
        $("#div_mf50f_").hide();
        $("#div_mf50f_2").hide();
        $("#div_mf50f_3").hide();
        $("#div_mf50f_4").hide();
        $("#div_mf50k_").hide();
        $("#_240_mf50a_account").attr("disabled", true);
        $("#_241_mf50a_identifier_code").attr("disabled", true);
        $("#_243_mf50f_account").attr("disabled", true);
        $("#_244_mf50f_number").attr("disabled", true);
        $("#_245_mf50f_details").attr("disabled", true);
        $("#check_mf50f_2").attr("disabled", true);
        $("#check_mf50f_3").attr("disabled", true);
        $("#check_mf50f_4").attr("disabled", true);
        $("#_255_mf50k_account").attr("disabled", true);
        $("#_256_mf50k_name_address").attr("disabled", true);
        $("#type_mf50_ordering_customer").change(function () {
            if ($("#type_mf50_ordering_customer").val() == "a") {
                $("#div_mf50a_").show();
                $("#div_mf50f_").hide();
                $("#div_mf50f_2").hide();
                $("#div_mf50f_3").hide();
                $("#div_mf50f_4").hide();
                $("#div_mf50k_").hide();
                $("#_240_mf50a_account").attr("disabled", false);
                $("#_241_mf50a_identifier_code").attr("disabled", false);    
                $("#_243_mf50f_account").attr("disabled", true);
                $("#_244_mf50f_number").attr("disabled", true);
                $("#_245_mf50f_details").attr("disabled", true);
                $("#check_mf50f_2").attr("disabled", true);
                $("#check_mf50f_3").attr("disabled", true);
                $("#check_mf50f_4").attr("disabled", true);
                $("#_255_mf50k_account").attr("disabled", true);
                $("#_256_mf50k_name_address").attr("disabled", true);
            } else if ($("#type_mf50_ordering_customer").val() == "f") {
                $("#div_mf50a_").hide();
                $("#div_mf50f_").show();
                $("#div_mf50f_2").show();
                $("#div_mf50f_3").show();
                $("#div_mf50f_4").show();
                $("#div_mf50k_").hide();
                $("#_240_mf50a_account").attr("disabled", true);
                $("#_241_mf50a_identifier_code").attr("disabled", true);
                $("#_243_mf50f_account").attr("disabled", false);
                $("#_244_mf50f_number").attr("disabled", false);
                $("#_245_mf50f_details").attr("disabled", false);
                $("#check_mf50f_2").attr("disabled", false);
                $("#check_mf50f_3").attr("disabled", false);
                $("#check_mf50f_4").attr("disabled", false);
                $("#_255_mf50k_account").attr("disabled", true);
                $("#_256_mf50k_name_address").attr("disabled", true);
            } else if ($("#type_mf50_ordering_customer").val() == "k") {
                $("#div_mf50a_").hide();
                $("#div_mf50f_").hide();
                $("#div_mf50f_2").hide();
                $("#div_mf50f_3").hide();
                $("#div_mf50f_4").hide();
                $("#div_mf50k_").show();
                $("#_240_mf50a_account").attr("disabled", true);
                $("#_241_mf50a_identifier_code").attr("disabled", true);
                $("#_243_mf50f_account").attr("disabled", true);
                $("#_244_mf50f_number").attr("disabled", true);
                $("#_245_mf50f_details").attr("disabled", true);
                $("#check_mf50f_2").attr("disabled", true);
                $("#check_mf50f_3").attr("disabled", true);
                $("#check_mf50f_4").attr("disabled", true);
                $("#_255_mf50k_account").attr("disabled", false);
                $("#_256_mf50k_name_address").attr("disabled", false);
            } else {
                $("#div_mf50a_").hide();
                $("#div_mf50f_").hide();
                $("#div_mf50f_2").hide();
                $("#div_mf50f_3").hide();
                $("#div_mf50f_4").hide();
                $("#div_mf50k_").hide();
                $("#_240_mf50a_account").attr("disabled", true);
                $("#_241_mf50a_identifier_code").attr("disabled", true);
                $("#_243_mf50f_account").attr("disabled", true);
                $("#_244_mf50f_number").attr("disabled", true);
                $("#_245_mf50f_details").attr("disabled", true);
                $("#check_mf50f_2").attr("disabled", true);
                $("#check_mf50f_3").attr("disabled", true);
                $("#check_mf50f_4").attr("disabled", true);
                $("#_255_mf50k_account").attr("disabled", true);
                $("#_256_mf50k_name_address").attr("disabled", true);
            }
        });
        
        //mf50f_2
        $("#check_mf50f_2").hide();
        $("#_246_mf50f_number").prop("required", false);
        $("#_247_mf50f_details").prop("required", false);
        $("#name_address_checkbox_2_50").click(function () {
            if ($("#name_address_checkbox_2_50").is(":checked")) {
                $("#check_mf50f_2").show();
                $("#_246_mf50f_number").prop("required", true);
                $("#_247_mf50f_details").prop("required", true);
            } else {
                $("#check_mf50f_2").hide();
                $("#_246_mf50f_number").prop("required", false);
                $("#_247_mf50f_details").prop("required", false);
            }
        });
        
        //mf50f_3
        $("#check_mf50f_3").hide();
        $("#_248_mf50f_number").prop("required", false);
        $("#_249_mf50f_details").prop("required", false);
        $("#name_address_checkbox_3_50").click(function () {
            if ($("#name_address_checkbox_3_50").is(":checked")) {
                $("#check_mf50f_3").show();
                $("#_248_mf50f_number").prop("required", true);
                $("#_249_mf50f_details").prop("required", true);
            } else {
                $("#check_mf50f_3").hide();
                $("#_248_mf50f_number").prop("required", false);
                $("#_249_mf50f_details").prop("required", false);
            }
        });
        
        //mf50f_4
        $("#check_mf50f_4").hide();
        $("#_250_mf50f_number").prop("required", false);
        $("#_251_mf50f_details").prop("required", false);
        $("#name_address_checkbox_4_50").click(function () {
            if ($("#name_address_checkbox_4_50").is(":checked")) {
                $("#check_mf50f_4").show();
                $("#_250_mf50f_number").prop("required", true);
                $("#_251_mf50f_details").prop("required", true);
            } else {
                $("#check_mf50f_4").hide();
                $("#_250_mf50f_number").prop("required", false);
                $("#_251_mf50f_details").prop("required", false);
            }
        });
        
//        end of the line

//        of52a seq B
        $("#div_of52a_2").hide();
        $("#div_of52d_2").hide();
        $("#_260_of52a_party_identifier").attr("disabled", true);
        $("#_261_of52a_identifier_code").attr("disabled", true);
        $("#_263_of52d_party_identifier").attr("disabled", true);
        $("#_264_of52d_name_address").attr("disabled", true);
        $("#type_of52_2").change(function() {
            if ( $("#type_of52_2").val() == "a"){
                $("#div_of52a_2").show();
                $("#div_of52d_2").hide();
                $("#_260_of52a_party_identifier").attr("disabled", false);
                $("#_261_of52a_identifier_code").attr("disabled", false);
                $("#_263_of52d_party_identifier").attr("disabled", true);
                $("#_264_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52_2").val() == "d"){
                $("#div_of52a_2").hide();
                $("#div_of52d_2").show();
                $("#_260_of52a_party_identifier").attr("disabled", true);
                $("#_261_of52a_identifier_code").attr("disabled", true);
                $("#_263_of52d_party_identifier").attr("disabled", false);
                $("#_264_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a_2").hide();
                $("#div_of52d_2").hide();
                $("#_260_of52a_party_identifier").attr("disabled", true);
                $("#_261_of52a_identifier_code").attr("disabled", true);
                $("#_263_of52d_party_identifier").attr("disabled", true);
                $("#_264_of52d_name_address").attr("disabled", true);
            }
        });
        
        //056 Intermediary Institution Sequence B
        $("#div_of56a_2").hide();
	$("#div_of56c_2").hide();
        $("#div_of56d_2").hide();
        $("#_270_of56a_party_identifier").attr("disabled", true);
        $("#_271_of56a_identifier_code").attr("disabled", true);
	$("#_273_of56c_party_identifier").attr("disabled", true);
        $("#_274_of56d_party_identifier").attr("disabled", true);
        $("#_275_of56d_name_address").attr("disabled", true);
        $("#type_of56_2").change(function() {
            if ( $("#type_of56_2").val() == "a"){
                $("#div_of56a_2").show();
                $("#div_of56c_2").hide();
                $("#div_of56d_2").hide();
                $("#_270_of56a_party_identifier").attr("disabled", false);
                $("#_271_of56a_identifier_code").attr("disabled", false);
                $("#_273_of56c_party_identifier").attr("disabled", true);
                $("#_274_of56d_party_identifier").attr("disabled", true);
                $("#_275_of56d_name_address").attr("disabled", true);
            } else if ( $("#type_of56_2").val() == "c") {
                $("#div_of56a_2").hide();
                $("#div_of56c_2").show();
                $("#div_of56d_2").hide();
                $("#_270_of56a_party_identifier").attr("disabled", true);
                $("#_271_of56a_identifier_code").attr("disabled", true);
                $("#_273_of56c_party_identifier").attr("disabled", false);
                $("#_274_of56d_party_identifier").attr("disabled", true);
                $("#_275_of56d_name_address").attr("disabled", true);
            } else if ( $("#type_of56_2").val() == "d"){
                $("#div_of56a_2").hide();
                $("#div_of56c_2").hide();
                $("#div_of56d_2").show();
                $("#_270_of56a_party_identifier").attr("disabled", true);
                $("#_271_of56a_identifier_code").attr("disabled", true);
                $("#_273_of56c_party_identifier").attr("disabled", true);
                $("#_274_of56d_party_identifier").attr("disabled", false);
                $("#_275_of56d_name_address").attr("disabled", false);
            } else{
                $("#div_of56a_2").hide();
                $("#div_of56c_2").hide();
                $("#div_of56d_2").hide();
                $("#_270_of56a_party_identifier").attr("disabled", true);
                $("#_271_of56a_identifier_code").attr("disabled", true);
                $("#_273_of56c_party_identifier").attr("disabled", true);
                $("#_274_of56d_party_identifier").attr("disabled", true);
                $("#_275_of56d_name_address").attr("disabled", true);
            }
        });
        
        //of57_a_b_c_d sequence B
        $("#div_of57a_2").hide();
        $("#div_of57b_2").hide();
        $("#div_of57c_2").hide();
        $("#div_of57d_2").hide();
        $("#_280_of57a_party_identifier").attr("disabled", true);
        $("#_281_of57a_identifier_code").attr("disabled", true);
        $("#_283_of57b_party_identifier").attr("disabled", true);
        $("#_284_of57b_location").attr("disabled", true);
        $("#_285_of57c_party_identifier").attr("disabled", true);
        $("#_286_of57d_party_identifier").attr("disabled", true);
        $("#_287_of57d_name_address").attr("disabled", true);
        $("#type_of57_2").change(function () {
            if ($("#type_of57_2").val() == "a") {
                $("#div_of57a_2").show();
                $("#div_of57b_2").hide();
                $("#div_of57c_2").hide();
                $("#div_of57d_2").hide();
                $("#_280_of57a_party_identifier").attr("disabled", false);
                $("#_281_of57a_identifier_code").attr("disabled", false);
                $("#_283_of57b_party_identifier").attr("disabled", true);
                $("#_284_of57b_location").attr("disabled", true);
                $("#_285_of57c_party_identifier").attr("disabled", true);
                $("#_286_of57d_party_identifier").attr("disabled", true);
                $("#_287_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57_2").val() == "b") {
                $("#div_of57a_2").hide();
                $("#div_of57b_2").show();
                $("#div_of57c_2").hide();
                $("#div_of57d_2").hide();
                $("#_280_of57a_party_identifier").attr("disabled", true);
                $("#_281_of57a_identifier_code").attr("disabled", true);
                $("#_283_of57b_party_identifier").attr("disabled", false);
                $("#_284_of57b_location").attr("disabled", false);
                $("#_285_of57c_party_identifier").attr("disabled", true);
                $("#_286_of57d_party_identifier").attr("disabled", true);
                $("#_287_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57_2").val() == "c") {
                $("#div_of57a_2").hide();
                $("#div_of57b_2").hide();
                $("#div_of57c_2").show();
                $("#div_of57d_2").hide();
                $("#_280_of57a_party_identifier").attr("disabled", true);
                $("#_281_of57a_identifier_code").attr("disabled", true);
                $("#_283_of57b_party_identifier").attr("disabled", true);
                $("#_284_of57b_location").attr("disabled", true);
                $("#_285_of57c_party_identifier").attr("disabled", false);
                $("#_286_of57d_party_identifier").attr("disabled", true);
                $("#_287_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57_2").val() == "d") {
                $("#div_of57a_2").hide();
                $("#div_of57b_2").hide();
                $("#div_of57c_2").hide();
                $("#div_of57d_2").show();
                $("#_280_of57a_party_identifier").attr("disabled", true);
                $("#_281_of57a_identifier_code").attr("disabled", true);
                $("#_283_of57b_party_identifier").attr("disabled", true);
                $("#_284_of57b_location").attr("disabled", true);
                $("#_285_of57c_party_identifier").attr("disabled", true);
                $("#_286_of57d_party_identifier").attr("disabled", false);
                $("#_287_of57d_name_address").attr("disabled", false);
            } else {
                $("#div_of57a_2").hide();
                $("#div_of57b_2").hide();
                $("#div_of57c_2").hide();
                $("#div_of57d_2").hide();
                $("#_280_of57a_party_identifier").attr("disabled", true);
                $("#_281_of57a_identifier_code").attr("disabled", true);
                $("#_283_of57b_party_identifier").attr("disabled", true);
                $("#_284_of57b_location").attr("disabled", true);
                $("#_285_of57c_party_identifier").attr("disabled", true);
                $("#_286_of57d_party_identifier").attr("disabled", true);
                $("#_287_of57d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //59
        $("#div_mf59_").hide();
        $("#div_mf59a_").hide();
        $("#div_mf59f_").hide();
        $("#div_mf59f_2").hide();
        $("#div_mf59f_3").hide();
        $("#div_mf59f_4").hide();
        $("#_290_mf59_account").attr("disabled", true);
        $("#_291_mf59_name_address").attr("disabled", true);
        $("#_292_mf59a_account").attr("disabled", true);
        $("#_293_mf59a_identifier_code").attr("disabled", true);
        $("#_295_mf59f_account").attr("disabled", true);
        $("#_296_mf59f_number").attr("disabled", true);
        $("#_297_mf59f_details").attr("disabled", true);
        $("#check_mf59f_2").attr("disabled", true);
        $("#check_mf59f_3").attr("disabled", true);
        $("#check_mf59f_4").attr("disabled", true);
        $("#type_of59_59a_").change(function () {
            if ($("#type_of59_59a_").val() == "59") {
                $("#div_mf59_").show();
                $("#div_mf59a_").hide();
                $("#div_mf59f_").hide();
                $("#div_mf59f_2").hide();
                $("#div_mf59f_3").hide();
                $("#div_mf59f_4").hide();
                $("#_290_mf59_account").attr("disabled", false);
                $("#_291_mf59_name_address").attr("disabled", false);
                $("#_292_mf59a_account").attr("disabled", true);
                $("#_293_mf59a_identifier_code").attr("disabled", true);
                $("#_295_mf59f_account").attr("disabled", true);
                $("#_296_mf59f_number").attr("disabled", true);
                $("#_297_mf59f_details").attr("disabled", true);
                $("#check_mf59f_2").attr("disabled", true);
                $("#check_mf59f_3").attr("disabled", true);
                $("#check_mf59f_4").attr("disabled", true);
            } else if ($("#type_of59_59a_").val() == "59a") {
                $("#div_mf59_").hide();
                $("#div_mf59a_").show();
                $("#div_mf59f_").hide();
                $("#div_mf59f_2").hide();
                $("#div_mf59f_3").hide();
                $("#div_mf59f_4").hide();
                $("#_290_mf59_account").attr("disabled", true);
                $("#_291_mf59_name_address").attr("disabled", true);
                $("#_292_mf59a_account").attr("disabled", false);
                $("#_293_mf59a_identifier_code").attr("disabled", false);
                $("#_295_mf59f_account").attr("disabled", true);
                $("#_296_mf59f_number").attr("disabled", true);
                $("#_297_mf59f_details").attr("disabled", true);
                $("#check_mf59f_2").attr("disabled", true);
                $("#check_mf59f_3").attr("disabled", true);
                $("#check_mf59f_4").attr("disabled", true);
            } else if ($("#type_of59_59a_").val() == "59f") {
                $("#div_mf59_").hide();
                $("#div_mf59a_").hide();
                $("#div_mf59f_").show();
                $("#div_mf59f_2").show();
                $("#div_mf59f_3").show();
                $("#div_mf59f_4").show();
                $("#_290_mf59_account").attr("disabled", true);
                $("#_291_mf59_name_address").attr("disabled", true);
                $("#_292_mf59a_account").attr("disabled", true);
                $("#_293_mf59a_identifier_code").attr("disabled", true);
                $("#_295_mf59f_account").attr("disabled", false);
                $("#_296_mf59f_number").attr("disabled", false);
                $("#_297_mf59f_details").attr("disabled", false);
                $("#check_mf59f_2").attr("disabled", false);
                $("#check_mf59f_3").attr("disabled", false);
                $("#check_mf59f_4").attr("disabled", false);
            } else {
                $("#div_mf59_").hide();
                $("#div_mf59a_").hide();
                $("#div_mf59f_").hide();
                $("#div_mf59f_2").hide();
                $("#div_mf59f_3").hide();
                $("#div_mf59f_4").hide();
                $("#_290_mf59_account").attr("disabled", true);
                $("#_291_mf59_name_address").attr("disabled", true);
                $("#_292_mf59a_account").attr("disabled", true);
                $("#_293_mf59a_identifier_code").attr("disabled", true);
                $("#_295_mf59f_account").attr("disabled", true);
                $("#_296_mf59f_number").attr("disabled", true);
                $("#_297_mf59f_details").attr("disabled", true);
                $("#check_mf59f_2").attr("disabled", true);
                $("#check_mf59f_3").attr("disabled", true);
                $("#check_mf59f_4").attr("disabled", true);
            }
        });

        //mf59f_2
        $("#check_mf59f_2").hide();
        $("#_298_mf59f_number").prop("required", false);
        $("#_299_mf59f_details").prop("required", false);
        $("#name_address_checkbox_2").click(function () {
            if ($("#name_address_checkbox_2").is(":checked")) {
                $("#check_mf59f_2").show();
                $("#_298_mf59f_number").prop("required", true);
                $("#_299_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_2").hide();
                $("#_298_mf59f_number").prop("required", false);
                $("#_299_mf59f_details").prop("required", false);
            }
        });

        //mf59f_3
        $("#check_mf59f_3").hide();
        $("#_300_mf59f_number").prop("required", false);
        $("#_301_mf59f_details").prop("required", false);
        $("#name_address_checkbox_3").click(function () {
            if ($("#name_address_checkbox_3").is(":checked")) {
                $("#check_mf59f_3").show();
                $("#_300_mf59f_number").prop("required", true);
                $("#_301_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_3").hide();
                $("#_300_mf59f_number").prop("required", false);
                $("#_301_mf59f_details").prop("required", false);
            }
        });

        //mf59f_4
        $("#check_mf59f_4").hide();
        $("#_302_mf59f_number").prop("required", false);
        $("#_303_mf59f_details").prop("required", false);
        $("#name_address_checkbox_4").click(function () {
            if ($("#name_address_checkbox_4").is(":checked")) {
                $("#check_mf59f_4").show();
                $("#_302_mf59f_number").prop("required", true);
                $("#_303_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_4").hide();
                $("#_302_mf59f_number").prop("required", false);
                $("#_303_mf59f_details").prop("required", false);
            }
        });
        
        
        
    });
</script>

<!--skrip edit-->

<!--baris kadua-->

<!-- rule view -->
<script type="text/javascript">
    $(document).ready(function(){
        //of13c
        if ($("#_022_of13c_code").val() != ""){
            $("#div_of13c_").show();
            $("#_022_of13c_code").attr("disabled", false);
        }else{
            $("#div_of13c_").hide();
            $("#_022_of13c_code").attr("disabled", true);
        }

        //of52_a_d
        if ($("#_110_of52a_party_identifier").val() != "" || $("#_111_of52a_identifier_code").val() != ""){
            $("#type_of52_").val("a").attr("selected",true);
            $("#div_of52a_").show();
            $("#div_of52d_").hide();
            $("#_110_of52a_party_identifier").attr("disabled", false);
            $("#_111_of52a_identifier_code").attr("disabled", false);
            $("#_113_of52d_party_identifier").attr("disabled", true);
            $("#_114_of52d_name_address").attr("disabled", true);
        } else if ($("#_113_of52d_party_identifier").val() != "" || $("#_114_of52d_name_address").val() != ""){
            $("#type_of52_").val("d").attr("selected",true);
            $("#div_of52a_").hide();
            $("#div_of52d_").show();
            $("#_110_of52a_party_identifier").attr("disabled", true);
            $("#_111_of52a_identifier_code").attr("disabled", true);
            $("#_113_of52d_party_identifier").attr("disabled", false);
            $("#_114_of52d_name_address").attr("disabled", false);
        } else{
            $("#div_of52a_").hide();
            $("#div_of52d_").hide();
            $("#_110_of52a_party_identifier").attr("disabled", true);
            $("#_111_of52a_identifier_code").attr("disabled", true);
            $("#_113_of52d_party_identifier").attr("disabled", true);
            $("#_114_of52d_name_address").attr("disabled", true);
        }

        //of53_a_b_d
        if ($("#_120_of53a_party_identifier").val() != "" || $("#_121_of53a_identifier_code").val() != ""){
            $("#type_of53_").val("a").attr("selected",true);
            $("#div_of53a_").show();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", false);
            $("#_121_of53a_identifier_code").attr("disabled", false);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        } else if ($("#_123_of53b_party_identifier").val() != "" || $("#_124_of53b_location").val() != ""){
            $("#type_of53_").val("b").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").show();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", false);
            $("#_124_of53b_location").attr("disabled", false);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        } else if ($("#_125_of53d_party_identifier").val() != "" || $("#_126_of53d_name_address").val() != ""){
            $("#type_of53_").val("d").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").show();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", false);
            $("#_126_of53d_name_address").attr("disabled", false);
        } else{
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        }

        //of54_a_b_d
        if ($("#_130_of54a_party_identifier").val() != "" || $("#_131_of54a_identifier_code").val() != ""){
            $("#type_of54_").val("a").attr("selected",true);
            $("#div_of54a_").show();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_130_of54a_party_identifier").attr("disabled", false);
            $("#_131_of54a_identifier_code").attr("disabled", false);
            $("#_133_of54b_party_identifier").attr("disabled", true);
            $("#_134_of54b_location").attr("disabled", true);
            $("#_135_of54d_party_identifier").attr("disabled", true);
            $("#_136_of54d_name_address").attr("disabled", true);
        } else if ($("#_133_of54b_party_identifier").val() != "" || $("#_134_of54b_location").val() != ""){
            $("#type_of54_").val("b").attr("selected",true);
            $("#div_of54a_").hide();
            $("#div_of54b_").show();
            $("#div_of54d_").hide();
            $("#_130_of54a_party_identifier").attr("disabled", true);
            $("#_131_of54a_identifier_code").attr("disabled", true);
            $("#_133_of54b_party_identifier").attr("disabled", false);
            $("#_134_of54b_location").attr("disabled", false);
            $("#_135_of54d_party_identifier").attr("disabled", true);
            $("#_136_of54d_name_address").attr("disabled", true);
        } else if ($("#_135_of54d_party_identifier").val() != "" || $("#_136_of54d_name_address").val() != ""){
            $("#type_of54_").val("d").attr("selected",true);
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").show();
            $("#_130_of54a_party_identifier").attr("disabled", true);
            $("#_131_of54a_identifier_code").attr("disabled", true);
            $("#_133_of54b_party_identifier").attr("disabled", true);
            $("#_134_of54b_location").attr("disabled", true);
            $("#_135_of54d_party_identifier").attr("disabled", false);
            $("#_136_of54d_name_address").attr("disabled", false);
        } else{
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_130_of54a_party_identifier").attr("disabled", true);
            $("#_131_of54a_identifier_code").attr("disabled", true);
            $("#_133_of54b_party_identifier").attr("disabled", true);
            $("#_134_of54b_location").attr("disabled", true);
            $("#_135_of54d_party_identifier").attr("disabled", true);
            $("#_136_of54d_name_address").attr("disabled", true);
        }

        //of56_a_d
        if ($("#_160_of56a_party_identifier").val() != "" || $("#_161_of56a_identifier_code").val() != ""){
            $("#type_of56_").val("a").attr("selected",true);
            $("#div_of56a_").show();
            $("#div_of56d_").hide();
            $("#_160_of56a_party_identifier").attr("disabled", false);
            $("#_161_of56a_identifier_code").attr("disabled", false);
            $("#_164_of56d_party_identifier").attr("disabled", true);
            $("#_165_of56d_name_address").attr("disabled", true);
        } else if ($("#_164_of56d_party_identifier").val() != "" || $("#_165_of56d_name_address").val() != ""){
            $("#type_of56_").val("d").attr("selected",true);
            $("#div_of56a_").hide();
            $("#div_of56d_").show();
            $("#_160_of56a_party_identifier").attr("disabled", true);
            $("#_161_of56a_identifier_code").attr("disabled", true);
            $("#_164_of56d_party_identifier").attr("disabled", false);
            $("#_165_of56d_name_address").attr("disabled", false);
        } else{
            $("#div_of56a_").hide();
            $("#div_of56d_").hide();
            $("#_160_of56a_party_identifier").attr("disabled", true);
            $("#_161_of56a_identifier_code").attr("disabled", true);
            $("#_164_of56d_party_identifier").attr("disabled", true);
            $("#_165_of56d_name_address").attr("disabled", true);
        }

        //of57_a_b_d
        if ($("#_170_of57a_party_identifier").val() != "" || $("#_171_of57a_identifier_code").val() != ""){
            $("#type_of57_").val("a").attr("selected",true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_170_of57a_party_identifier").attr("disabled", false);
            $("#_171_of57a_identifier_code").attr("disabled", false);
            $("#_173_of57b_party_identifier").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_176_of57d_party_identifier").attr("disabled", true);
            $("#_177_of57d_name_address").attr("disabled", true);
        } else if ($("#_173_of57b_party_identifier").val() != "" || $("#_174_of57b_location").val() != ""){
            $("#type_of57_").val("b").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_170_of57a_party_identifier").attr("disabled", true);
            $("#_171_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifier").attr("disabled", false);
            $("#_174_of57b_location").attr("disabled", false);
            $("#_176_of57d_party_identifier").attr("disabled", true);
            $("#_177_of57d_name_address").attr("disabled", true);
        } else if ($("#_176_of57d_party_identifier").val() != "" || $("#_177_of57d_name_address").val() != ""){
            $("#type_of57_").val("d").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").show();
            $("#_170_of57a_party_identifier").attr("disabled", true);
            $("#_171_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifier").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_176_of57d_party_identifier").attr("disabled", false);
            $("#_177_of57d_name_address").attr("disabled", false);
        } else{
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_170_of57a_party_identifier").attr("disabled", true);
            $("#_171_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifier").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_176_of57d_party_identifier").attr("disabled", true);
            $("#_177_of57d_name_address").attr("disabled", true);
        }

        //of58_a_d
        if ($("#_180_of58a_party_identifier").val() != "" || $("#_181_of58a_identifier_code").val() != ""){
            $("#type_of58_").val("a").attr("selected",true);
            $("#div_of58a_").show();
            $("#div_of58d_").hide();
            $("#_180_of58a_party_identifier").attr("disabled", false);
            $("#_181_of58a_identifier_code").attr("disabled", false);
            $("#_183_of58d_party_identifier").attr("disabled", true);
            $("#_184_of58d_name_address").attr("disabled", true);
        } else if ($("#_183_of58d_party_identifier").val() != "" || $("#_184_of58d_name_address").val() != ""){
            $("#type_of58_").val("d").attr("selected",true);
            $("#div_of58a_").hide();
            $("#div_of58d_").show();
            $("#_180_of58a_party_identifier").attr("disabled", true);
            $("#_181_of58a_identifier_code").attr("disabled", true);
            $("#_183_of58d_party_identifier").attr("disabled", false);
            $("#_184_of58d_name_address").attr("disabled", false);
        } else{
            $("#div_of58a_").hide();
            $("#div_of58d_").hide();
            $("#_180_of58a_party_identifier").attr("disabled", true);
            $("#_181_of58a_identifier_code").attr("disabled", true);
            $("#_183_of58d_party_identifier").attr("disabled", true);
            $("#_184_of58d_name_address").attr("disabled", true);
        }
        
        
        //MF50 script 2
        if ($("#_240_mf50a_account").val() != "" || $("#_241_mf50a_identifier_code").val() != "") {
            $("#type_mf50_ordering_customer").val("a").attr("selected", true);
            $("#div_mf50a_").show();
            $("#div_mf50f_").hide();
            $("#div_mf50f_2").hide();
            $("#div_mf50f_3").hide();
            $("#div_mf50f_4").hide();
            $("#div_mf50k_").hide();
            $("#_240_mf50a_account").attr("disabled", false);
            $("#_241_mf50a_identifier_code").attr("disabled", false);
            $("#_243_mf50f_account").attr("disabled", true);
            $("#_244_mf50f_number").attr("disabled", true);
            $("#_245_mf50f_details").attr("disabled", true);
            $("#check_mf50f_2").attr("disabled", true);
            $("#check_mf50f_3").attr("disabled", true);
            $("#check_mf50f_4").attr("disabled", true);
            $("#_255_mf50k_account").attr("disabled", true);
            $("#_256_mf50k_name_address").attr("disabled", true);
        } else if ($("#_244_mf50f_number").val() != "" || $("#_245_mf50f_details").val() != "") {
            $("#type_mf50_ordering_customer").val("f").attr("selected", true);
            $("#div_mf50a_").hide();
            $("#div_mf50f_").show();
            $("#div_mf50f_2").show();
            $("#div_mf50f_3").show();
            $("#div_mf50f_4").show();
            $("#div_mf50k_").hide();
            $("#_240_mf50a_account").attr("disabled", true);
            $("#_241_mf50a_identifier_code").attr("disabled", true);
            $("#_243_mf50f_account").attr("disabled", false);
            $("#_244_mf50f_number").attr("disabled", false);
            $("#_245_mf50f_details").attr("disabled", false);
            $("#check_mf50f_2").attr("disabled", false);
            $("#check_mf50f_3").attr("disabled", false);
            $("#check_mf50f_4").attr("disabled", false);
            $("#_255_mf50k_account").attr("disabled", true);
            $("#_256_mf50k_name_address").attr("disabled", true);
        } else if ($("#_255_mf50k_account").val() != "" || $("#_256_mf50k_name_address").val() != "") {
            $("#type_mf50_ordering_customer").val("k").attr("selected", true);
            $("#div_mf50a_").hide();
            $("#div_mf50f_").hide();
            $("#div_mf50f_2").hide();
            $("#div_mf50f_3").hide();
            $("#div_mf50f_4").hide();
            $("#div_mf50k_").show();
            $("#_240_mf50a_account").attr("disabled", true);
            $("#_241_mf50a_identifier_code").attr("disabled", true);
            $("#_243_mf50f_account").attr("disabled", true);
            $("#_244_mf50f_number").attr("disabled", true);
            $("#_245_mf50f_details").attr("disabled", true);
            $("#check_mf50f_2").attr("disabled", true);
            $("#check_mf50f_3").attr("disabled", true);
            $("#check_mf50f_4").attr("disabled", true);
            $("#_255_mf50k_account").attr("disabled", false);
            $("#_256_mf50k_name_address").attr("disabled", false);
        } else {
            $("#div_mf50a_").hide();
            $("#div_mf50f_").hide();
            $("#div_mf50f_2").hide();
            $("#div_mf50f_3").hide();
            $("#div_mf50f_4").hide();
            $("#div_mf50k_").hide();
            $("#_240_mf50a_account").attr("disabled", true);
            $("#_241_mf50a_identifier_code").attr("disabled", true);
            $("#_243_mf50f_account").attr("disabled", true);
            $("#_244_mf50f_number").attr("disabled", true);
            $("#_245_mf50f_details").attr("disabled", true);
            $("#check_mf50f_2").attr("disabled", true);
            $("#check_mf50f_3").attr("disabled", true);
            $("#check_mf50f_4").attr("disabled", true);
            $("#_255_mf50k_account").attr("disabled", true);
            $("#_256_mf50k_name_address").attr("disabled", true);
        }
        
        //mf50f_2
        if ($("#_246_mf50f_number").val() != "" || $("#_247_mf50f_details").val() != "") {
            $("#name_address_checkbox_2_50").prop("checked", true);
            $("#check_mf50f_2").show();
            $("#_246_mf50f_number").prop("required", true);
            $("#_247_mf50f_details").prop("required", true);
        } else {
            $("#check_mf50f_2").hide();
            $("#_246_mf50f_number").prop("required", false);
            $("#_247_mf50f_details").prop("required", false);
        }
        
        //mf50f_3
        if ($("#_248_mf50f_number").val() != "" || $("#_249_mf50f_details").val() != "") {
            $("#name_address_checkbox_3_50").prop("checked", true);
            $("#check_mf50f_3").show();
            $("#_248_mf50f_number").prop("required", true);
            $("#_249_mf50f_details").prop("required", true);
        } else {
            $("#check_mf50f_3").hide();
            $("#_248_mf50f_number").prop("required", false);
            $("#_249_mf50f_details").prop("required", false);
        }
        
        //mf50f_4
        if ($("#_250_mf50f_number").val() != "" || $("#_251_mf50f_details").val() != "") {
            $("#name_address_checkbox_4_50").prop("checked", true);
            $("#check_mf50f_4").show();
            $("#_250_mf50f_number").prop("required", true);
            $("#_251_mf50f_details").prop("required", true);
        } else {
            $("#check_mf50f_4").hide();
            $("#_250_mf50f_number").prop("required", false);
            $("#_251_mf50f_details").prop("required", false);
        }
        
//        OF52 sequence B
        if ($("#_260_of52a_party_identifier").val() != "" || $("#_261_of52a_identifier_code").val() != ""){
            $("#type_of52_2").val("a").attr("selected",true);
            $("#div_of52a_2").show();
            $("#div_of52d_2").hide();
            $("#_260_of52a_party_identifier").attr("disabled", false);
            $("#_261_of52a_identifier_code").attr("disabled", false);
            $("#_263_of52d_party_identifier").attr("disabled", true);
            $("#_264_of52d_name_address").attr("disabled", true);
        } else if ($("#_263_of52d_party_identifier").val() != "" || $("#_264_of52d_name_address").val() != ""){
            $("#type_of52_2").val("d").attr("selected",true);
            $("#div_of52a_2").hide();
            $("#div_of52d_2").show();
            $("#_260_of52a_party_identifier").attr("disabled", true);
            $("#_261_of52a_identifier_code").attr("disabled", true);
            $("#_263_of52d_party_identifier").attr("disabled", false);
            $("#_264_of52d_name_address").attr("disabled", false);
        } else{
            $("#div_of52a_2").hide();
            $("#div_of52d_2").hide();
            $("#_260_of52a_party_identifier").attr("disabled", true);
            $("#_261_of52a_identifier_code").attr("disabled", true);
            $("#_263_of52d_party_identifier").attr("disabled", true);
            $("#_264_of52d_name_address").attr("disabled", true);
        }
        
        //OF56 sequence B
        if ($("#_270_of56a_party_identifier").val() != "" || $("#_271_of56a_identifier_code").val() != "") {
            $("#type_of56_2").val("a").attr("selected", true);
            $("#div_of56a_2").show();
            $("#div_of56c_2").hide();
            $("#div_of56d_2").hide();
            $("#_270_of56a_party_identifier").attr("disabled", false);
            $("#_271_of56a_identifier_code").attr("disabled", false);
            $("#_273_of56c_party_identifier").attr("disabled", true);
            $("#_274_of56d_party_identifier").attr("disabled", true);
            $("#_275_of56d_name_address").attr("disabled", true);
        } else if ($("#_273_of56c_party_identifier").val() != "") {
            $("#type_of56_2").val("c").attr("selected", true);
            $("#div_of56a_2").hide();
            $("#div_of56c_2").show();
            $("#div_of56d_2").hide();
            $("#_270_of56a_party_identifier").attr("disabled", true);
            $("#_271_of56a_identifier_code").attr("disabled", true);
            $("#_273_of56c_party_identifier").attr("disabled", false);
            $("#_274_of56d_party_identifier").attr("disabled", true);
            $("#_275_of56d_name_address").attr("disabled", true);
        } else if ($("#_274_of56d_party_identifier").val() != "" || $("#_275_of56d_name_address").val() != "") {
            $("#type_of56_2").val("d").attr("selected", true);
            $("#div_of56a_2").hide();
            $("#div_of56c_2").hide();
            $("#div_of56d_2").show();
            $("#_270_of56a_party_identifier").attr("disabled", true);
            $("#_271_of56a_identifier_code").attr("disabled", true);
            $("#_273_of56c_party_identifier").attr("disabled", true);
            $("#_274_of56d_party_identifier").attr("disabled", false);
            $("#_275_of56d_name_address").attr("disabled", false);
        } else {
            $("#div_of56a_2").hide();
            $("#div_of56c_2").hide();
            $("#div_of56d_2").hide();
            $("#_270_of56a_party_identifier").attr("disabled", true);
            $("#_271_of56a_identifier_code").attr("disabled", true);
            $("#_273_of56c_party_identifier").attr("disabled", true);
            $("#_274_of56d_party_identifier").attr("disabled", true);
            $("#_275_of56d_name_address").attr("disabled", true);
        }
        
        //end of the line
        
        //of57_a_b_c_d sequence B
        if ($("#_280_of57a_party_identifier").val() != "" || $("#_281_of57a_identifier_code").val() != "") {
            $("#type_of57_2").val("a").attr("selected", true);
            $("#div_of57a_2").show();
            $("#div_of57b_2").hide();
            $("#div_of57c_2").hide();
            $("#div_of57d_2").hide();
            $("#_280_of57a_party_identifier").attr("disabled", false);
            $("#_281_of57a_identifier_code").attr("disabled", false);
            $("#_283_of57b_party_identifier").attr("disabled", true);
            $("#_284_of57b_location").attr("disabled", true);
            $("#_285_of57c_party_identifier").attr("disabled", true);
            $("#_286_of57d_party_identifier").attr("disabled", true);
            $("#_287_of57d_name_address").attr("disabled", true);
        } else if ($("#_283_of57b_party_identifier").val() != "" || $("#_284_of57b_location").val() != "") {
            $("#type_of57_2").val("b").attr("selected", true);
            $("#div_of57a_2").hide();
            $("#div_of57b_2").show();
            $("#div_of57c_2").hide();
            $("#div_of57d_2").hide();
            $("#_280_of57a_party_identifier").attr("disabled", true);
            $("#_281_of57a_identifier_code").attr("disabled", true);
            $("#_283_of57b_party_identifier").attr("disabled", false);
            $("#_284_of57b_location").attr("disabled", false);
            $("#_285_of57c_party_identifier").attr("disabled", true);
            $("#_286_of57d_party_identifier").attr("disabled", true);
            $("#_287_of57d_name_address").attr("disabled", true);
        } else if ($("#_285_of57c_party_identifier").val() != "") {
            $("#type_of57_2").val("c").attr("selected", true);
            $("#div_of57a_2").hide();
            $("#div_of57b_2").hide();
            $("#div_of57c_2").show();
            $("#div_of57d_2").hide();
            $("#_280_of57a_party_identifier").attr("disabled", true);
            $("#_281_of57a_identifier_code").attr("disabled", true);
            $("#_283_of57b_party_identifier").attr("disabled", true);
            $("#_284_of57b_location").attr("disabled", true);
            $("#_285_of57c_party_identifier").attr("disabled", false);
            $("#_286_of57d_party_identifier").attr("disabled", true);
            $("#_287_of57d_name_address").attr("disabled", true);
        } else if ($("#_286_of57d_party_identifier").val() != "" || $("#_287_of57d_name_address").val() != "") {
            $("#type_of57_2").val("d").attr("selected", true);
            $("#div_of57a_2").hide();
            $("#div_of57b_2").hide();
            $("#div_of57c_2").hide();
            $("#div_of57d_2").show();
            $("#_280_of57a_party_identifier").attr("disabled", true);
            $("#_281_of57a_identifier_code").attr("disabled", true);
            $("#_283_of57b_party_identifier").attr("disabled", true);
            $("#_284_of57b_location").attr("disabled", true);
            $("#_285_of57c_party_identifier").attr("disabled", true);
            $("#_286_of57d_party_identifier").attr("disabled", false);
            $("#_287_of57d_name_address").attr("disabled", false);
        } else {
            $("#div_of57a_2").hide();
            $("#div_of57b_2").hide();
            $("#div_of57c_2").hide();
            $("#div_of57d_2").hide();
            $("#_280_of57a_party_identifier").attr("disabled", true);
            $("#_281_of57a_identifier_code").attr("disabled", true);
            $("#_283_of57b_party_identifier").attr("disabled", true);
            $("#_284_of57b_location").attr("disabled", true);
            $("#_285_of57c_party_identifier").attr("disabled", true);
            $("#_286_of57d_party_identifier").attr("disabled", true);
            $("#_287_of57d_name_address").attr("disabled", true);
        }
        
//        end of the line
        
//        59
        if ($("#_290_mf59_account").val() != "" || $("#_291_mf59_name_address").val() != "") {
            $("#type_of59_59a_").val("59").attr("selected", true);
            $("#div_mf59_").show();
            $("#div_mf59a_").hide();
            $("#div_mf59f_").hide();
            $("#div_mf59f_2").hide();
            $("#div_mf59f_3").hide();
            $("#div_mf59f_4").hide();
            $("#_290_mf59_account").attr("disabled", false);
            $("#_291_mf59_name_address").attr("disabled", false);
            $("#_292_mf59a_account").attr("disabled", true);
            $("#_293_mf59a_identifier_code").attr("disabled", true);
            $("#_295_mf59f_account").attr("disabled", true);
            $("#_296_mf59f_number").attr("disabled", true);
            $("#_297_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2").attr("disabled", true);
            $("#check_mf59f_3").attr("disabled", true);
            $("#check_mf59f_4").attr("disabled", true);
        } else if ($("#_292_mf59a_account").val() != "" || $("#_293_mf59a_identifier_code").val() != "") {
            $("#type_of59_59a_").val("59a").attr("selected", true);
            $("#div_mf59_").hide();
            $("#div_mf59a_").show();
            $("#div_mf59f_").hide();
            $("#div_mf59f_2").hide();
            $("#div_mf59f_3").hide();
            $("#div_mf59f_4").hide();
            $("#_290_mf59_account").attr("disabled", true);
            $("#_291_mf59_name_address").attr("disabled", true);
            $("#_292_mf59a_account").attr("disabled", false);
            $("#_293_mf59a_identifier_code").attr("disabled", false);
            $("#_295_mf59f_account").attr("disabled", true);
            $("#_296_mf59f_number").attr("disabled", true);
            $("#_297_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2").attr("disabled", true);
            $("#check_mf59f_3").attr("disabled", true);
            $("#check_mf59f_4").attr("disabled", true);
        } else if ($("#_296_mf59f_number").val() != "" || $("#_297_mf59f_details").val() != "") {
            $("#type_of59_59a_").val("59f").attr("selected", true);
            $("#div_mf59_").hide();
            $("#div_mf59a_").hide();
            $("#div_mf59f_").show();
            $("#div_mf59f_2").show();
            $("#div_mf59f_3").show();
            $("#div_mf59f_4").show();
            $("#_290_mf59_account").attr("disabled", true);
            $("#_291_mf59_name_address").attr("disabled", true);
            $("#_292_mf59a_account").attr("disabled", true);
            $("#_293_mf59a_identifier_code").attr("disabled", true);
            $("#_295_mf59f_account").attr("disabled", false);
            $("#_296_mf59f_number").attr("disabled", false);
            $("#_297_mf59f_details").attr("disabled", false);
            $("#check_mf59f_2").attr("disabled", false);
            $("#check_mf59f_3").attr("disabled", false);
            $("#check_mf59f_4").attr("disabled", false);
        } else {
            $("#div_mf59_").hide();
            $("#div_mf59a_").hide();
            $("#div_mf59f_").hide();
            $("#div_mf59f_2").hide();
            $("#div_mf59f_3").hide();
            $("#div_mf59f_4").hide();
            $("#_290_mf59_account").attr("disabled", true);
            $("#_291_mf59_name_address").attr("disabled", true);
            $("#_292_mf59a_account").attr("disabled", true);
            $("#_293_mf59a_identifier_code").attr("disabled", true);
            $("#_295_mf59f_account").attr("disabled", true);
            $("#_296_mf59f_number").attr("disabled", true);
            $("#_297_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2").attr("disabled", true);
            $("#check_mf59f_3").attr("disabled", true);
            $("#check_mf59f_4").attr("disabled", true);
        }

        //mf59f_2
        if ($("#_298_mf59f_number").val() != "" || $("#_299_mf59f_details").val() != "") {
            $("#name_address_checkbox_2").prop("checked", true);
            $("#check_mf59f_2").show();
            $("#_298_mf59f_number").prop("required", true);
            $("#_299_mf59f_details").prop("required", true);
        } else {
            $("#check_mf59f_2").hide();
            $("#_298_mf59f_number").prop("required", false);
            $("#_299_mf59f_details").prop("required", false);
        }

        //mf59f_3
        if ($("#_300_mf59f_number").val() != "" || $("#_301_mf59f_details").val() != "") {
            $("#name_address_checkbox_3").prop("checked", true);
            $("#check_mf59f_3").show();
            $("#_300_mf59f_number").prop("required", true);
            $("#_301_mf59f_details").prop("required", true);
        } else {
            $("#check_mf59f_3").hide();
            $("#_300_mf59f_number").prop("required", false);
            $("#_301_mf59f_details").prop("required", false);
        }

        //mf59f_4
        if ($("#_302_mf59f_number").val() != "" || $("#_303_mf59f_details").val() != "") {
            $("#name_address_checkbox_4").prop("checked", true);
            $("#check_mf59f_4").show();
            $("#_302_mf59f_number").prop("required", true);
            $("#_303_mf59f_details").prop("required", true);
        } else {
            $("#check_mf59f_4").hide();
            $("#_302_mf59f_number").prop("required", false);
            $("#_303_mf59f_details").prop("required", false);
        }
        
        //special rate
        if ($("#special_rate").val() != "") {
            $("#special_rate_checkbox").prop("checked", true);
            $("#check_special_rate").show();
            $("#special_rate").prop("required", true);
        } else {
            $("#check_special_rate").hide();
            $("#special_rate").prop("required", false);
        }

    });
</script>