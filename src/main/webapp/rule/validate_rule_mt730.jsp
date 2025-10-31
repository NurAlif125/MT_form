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
                _020_mf21_receiver_reference: "required",
                _040_mf30_date_of_message_being_acknowledged: "required",
                
                //of25
//                _030_of25_account_identification: {
//                    required: function(element) {
//                      return ($("#_030_of25_account_identification").val() == "" && $("#type_of57_request_confirmation_party").val() == "")
//                             || ($("#_030_of25_account_identification").val() != "" && $("#type_of57_request_confirmation_party").val() != "");
//                    }
//                },
                
                //of32
                type_of32a_amount_of_charges: {
                    required: function(element) {
                      return $("#type_of57_request_confirmation_party").val() != "" && $("#type_of32a_amount_of_charges").val() == "d";
                    }
                },
                
            },
     messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf20_sender_reference: {required: "sender reference must be filled..!!"},
                _020_mf21_receiver_reference: {required: "receiver_reference must be filled..!!"},
                _040_mf30_date_of_message_being_acknowledged: {required: "date of message being acknowledge must be filled..!!"},
//                _030_of25_account_identification: {required: "isi salah satu antara of25 atau of57..!!"},
                type_of32a_amount_of_charges: {required: "empty of57 if of32 = D..!!"},
             
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
                if (confirm("Do you want to save the message?")) {
                    $("#form1").submit(); 
                }
            } else {
                alert("There are still errors! Please fix them before saving.");
            }
        });
        
        $.validator.addMethod("regex", function(value, element, param) {
            //this.optional(element) lewati validasi jika kosong dan param.test(value) check regex
            return this.optional(element) || param.test(value); 
//            Jika tidak ada pesan khusus dalam messages tampilkan "Format tidak valid"
        }, "Invalid format");
    
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
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
        $("#div_mf32b_").hide();
        $("#div_mf32d_").hide();
        $("#_051_of32b_currency").attr("disabled", true);
        $("#_052_of32b_amount").attr("disabled", true);
        $("#_053_of32d_date").attr("disabled", true);
        $("#_054_of32d_currency").attr("disabled", true);
        $("#_055_of32d_amount").attr("disabled", true);
        $("#type_of32a_amount_of_charges").change(function() {
            if ( $("#type_of32a_amount_of_charges").val() == "b"){
                $("#div_mf32b_").show();
                $("#div_mf32d_").hide();
                $("#_051_of32b_currency").attr("disabled", false);
                $("#_052_of32b_amount").attr("disabled", false);
                $("#_053_of32d_date").attr("disabled", true);
                $("#_054_of32d_currency").attr("disabled", true);
                $("#_055_of32d_amount").attr("disabled", true);
            } else if ( $("#type_of32a_amount_of_charges").val() == "d"){
                $("#div_mf32b_").hide();
                $("#div_mf32d_").show();
                 $("#_051_of32b_currency").attr("disabled", true);
                $("#_052_of32b_amount").attr("disabled", true);
                $("#_053_of32d_date").attr("disabled", false);
                $("#_054_of32d_currency").attr("disabled", false);
                $("#_055_of32d_amount").attr("disabled", false);
            } else{
                $("#div_mf32b_").hide();
                $("#div_mf32d_").hide();
                $("#_051_of32b_currency").attr("disabled", true);
                $("#_052_of32b_amount").attr("disabled", true);
                $("#_053_of32d_date").attr("disabled", true);
                $("#_054_of32d_currency").attr("disabled", true);
                $("#_055_of32d_amount").attr("disabled", true);
            }
        });

        //of57a_d
        $("#div_of57a").hide();
        $("#div_of57d").hide();
        $("#_061_of57a_party_identifier").attr("disabled", true);
        $("#_062_of57a_identifier_code").attr("disabled", true);
        $("#_063_of57d_party_identifier").attr("disabled", true);
        $("#_064_of57d_name_and_address").attr("disabled", true);
        $("#type_of57_request_confirmation_party").change(function() {
            if ( $("#type_of57_request_confirmation_party").val() == "a"){
                $("#div_of57a").show();
                $("#div_of57d").hide();
                $("#_061_of57a_party_identifier").attr("disabled", false);
                $("#_062_of57a_identifier_code").attr("disabled", false);
                $("#_063_of57d_party_identifier").attr("disabled", true);
                $("#_064_of57d_name_and_address").attr("disabled", true);
            } else if ( $("#type_of57_request_confirmation_party").val() == "d"){
                $("#div_of57a").hide();
                $("#div_of57d").show();
                $("#_061_of57a_party_identifier").attr("disabled", true);
                $("#_062_of57a_identifier_code").attr("disabled", true);
                $("#_063_of57d_party_identifier").attr("disabled", false);
                $("#_064_of57d_name_and_address").attr("disabled", false);
            } else{
                $("#div_of57a").hide();
                $("#div_of57d").hide();
                $("#_061_of57a_party_identifier").attr("disabled", true);
                $("#_062_of57a_identifier_code").attr("disabled", true);
                $("#_063_of57d_party_identifier").attr("disabled", true);
                $("#_064_of57d_name_and_address").attr("disabled", true);
            }
        });
     
    });
</script>

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
        if ($("#_051_of32b_currency").val() != "" || $("#_052_of32b_amount").val() != ""){
            $("#type_of32a_amount_of_charges").val("b").attr("selected",true);
            $("#div_mf32b_").show();
            $("#div_mf32d_").hide();
            $("#_051_of32b_currency").attr("disabled", false);
            $("#_052_of32b_amount").attr("disabled", false);
            $("#_053_of32d_date").attr("disabled", true);
            $("#_054_of32d_currency").attr("disabled", true);
            $("#_055_of32d_amount").attr("disabled", true);
        } else if ($("#_053_of32d_date").val() != "" || $("#_054_of32d_currency").val() != "" || $("#_055_of32d_amount").val() != "" ){
            $("#type_of32a_amount_of_charges").val("d").attr("selected",true);
            $("#div_mf32b_").hide();
            $("#div_mf32d_").show();
            $("#_051_of32b_currency").attr("disabled", true);
            $("#_052_of32b_amount").attr("disabled", true);
            $("#_053_of32d_date").attr("disabled", false);
            $("#_054_of32d_currency").attr("disabled", false);
            $("#_055_of32d_amount").attr("disabled", false);
        } else{
            $("#div_mf32b_").hide();
            $("#div_mf32d_").hide();
            $("#_051_of32b_currency").attr("disabled", true);
            $("#_052_of32b_amount").attr("disabled", true);
            $("#_053_of32d_date").attr("disabled", true);
            $("#_054_of32d_currency").attr("disabled", true);
            $("#_055_of32d_amount").attr("disabled", true);
        }

      

        //of58_a_d
        if ($("#_061_of57a_party_identifier").val() != "" || $("#_062_of57a_identifier_code").val() != ""){
            $("#type_of57_request_confirmation_party").val("a").attr("selected",true);
            $("#div_of57a").show();
            $("#div_of57d").hide();
            $("#_061_of57a_party_identifier").attr("disabled", false);
            $("#_062_of57a_identifier_code").attr("disabled", false);
            $("#_063_of57d_party_identifier").attr("disabled", true);
            $("#_064_of57d_name_and_address").attr("disabled", true);
        } else if ($("#_063_of57d_party_identifier").val() != "" || $("#_064_of57d_name_and_address").val() != ""){
            $("#type_of57_request_confirmation_party").val("d").attr("selected",true);
            $("#div_of57a").hide();
            $("#div_of57d").show();
            $("#_061_of57a_party_identifier").attr("disabled", true);
            $("#_062_of57a_identifier_code").attr("disabled", true);
            $("#_063_of57d_party_identifier").attr("disabled", false);
            $("#_064_of57d_name_and_address").attr("disabled", false);
        } else{
            $("#div_of57a").hide();
            $("#div_of57d").hide();
            $("#_061_of57a_party_identifier").attr("disabled", true);
            $("#_062_of57a_identifier_code").attr("disabled", true);
            $("#_063_of57d_party_identifier").attr("disabled", true);
            $("#_064_of57d_name_and_address").attr("disabled", true);
        }

    });
</script>
