<%-- 
    Document   : mt754
    Created on : Aug 8, 2018
    Author     : Andhita Deara
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
                //mf20
                _010_mf20_sender_reference: "required",

                //mf21
                _020_mf21_related_reference: "required",

                //mf32a
                type_mf32_principal_amount_paid: "required",
                _030_mf32a_date: "required",
                _031_mf32a_currency: "required",
                _032_mf32a_amount: "required",
                _033_mf32b_currency: "required",
                _034_mf32b_amount: "required",
                
                //of72z
//                _110_of72z_narrative_sender_to_receiver: {
//                    required: function(element) {
//                      return ($("#_110_of72z_narrative_sender_to_receiver").val() == "" && $("#_120_of77_narrative").val() == "")
//                             || ($("#_110_of72z_narrative_sender_to_receiver").val() != "" && $("#_120_of77_narrative").val() != "");
//                    }
//                },
                
                //of77
//                _120_of77_narrative: {
//                    required: function(element) {
//                      return ($("#_120_of77_narrative").val() == "" && $("#_110_of72z_narrative_sender_to_receiver").val() == "")
//                             || ($("#_120_of77_narrative").val() != "" && $("#_110_of72z_narrative_sender_to_receiver").val() != "");
//                    }
//                },
                
                //of53a
//                type_of53_reimbursing_bank: {
//                    required: function(element) {
//                      return ($("#type_of57_account_with_bank").val() == "" && $("#type_of53_reimbursing_bank").val() == "")
//                             || ($("#type_of57_account_with_bank").val() != "" && $("#type_of53_reimbursing_bank").val() != "");
//                    }
//                },
                
                //of57a
//                type_of57_account_with_bank: {
//                    required: function(element) {
//                      return ($("#type_of53_reimbursing_bank").val() == "" && $("#type_of57_account_with_bank").val() == "")
//                             || ($("#type_of57_account_with_bank").val() != "" && $("#type_of53_reimbursing_bank").val() != "");
//                    }
//                },
                

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf20_sender_reference: {required: "mf20_sender_reference must be filled..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference must be filled..!!"},
                type_mf32_principal_amount_paid: {required: "mf32_principal_amount_paid must be filled..!!"},
                _030_mf32a_date: {required: "mf32a_date must be filled..!!"},
                _032_mf32a_amount: {required: "mf32a_amount must be filled..!!"},
                _033_mf32b_currency: {required: "mf32b_currency must be filled..!!"},
                _034_mf32b_amount: {required: "mf32b_amount must be filled..!!"},
//                _110_of72z_narrative_sender_to_receiver: {required: "isi salah satu antara of72z atau of77..!!"},
//                _120_of77_narrative: {required: "isi salah satu antara of72z atau of77..!!"},
//                type_of53_reimbursing_bank: {required: "isi salah satu antara of53 atau of57..!!"},
//                type_of57_account_with_bank: {required: "isi salah satu antara of53 atau of57..!!"},
                
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
        
        //OF33B_check
        $("#check_of33b").hide();
        $("#_040_of33b_currency_additional_amount").attr("disabled", true);
        $("#_041_of33b_amount").attr("disabled", true);
        $("#additional_amount_checkbox").click(function(){
            if ($("#additional_amount_checkbox").is(":checked")){
                $("#check_of33b").show();
                $("#_040_of33b_currency_additional_amount").attr("disabled", false);
                $("#_041_of33b_amount").attr("disabled", false);
            } else {
                $("#check_of33b").hide();
                $("#_040_of33b_currency_additional_amount").attr("disabled", true);
                $("#_041_of33b_amount").attr("disabled", true);
            }
        });

        //MF32_a_b
        $("#div_mf32a_").hide();
        $("#div_mf32b_").hide();
        $("#_030_mf32a_date").attr("disabled", true);
        $("#_031_mf32a_currency").attr("disabled", true);
        $("#_032_mf32a_amount").attr("disabled", true);
        $("#_033_mf32b_currency").attr("disabled", true);
        $("#_034_mf32b_amount").attr("disabled", true);
        $("#type_mf32_principal_amount_paid").change(function() {
            if ( $("#type_mf32_principal_amount_paid").val() == "a"){
                $("#div_mf32a_").show();
                $("#div_mf32b_").hide();
                $("#_030_mf32a_date").attr("disabled", false);
                $("#_031_mf32a_currency").attr("disabled", false);
                $("#_032_mf32a_amount").attr("disabled", false);
                $("#_033_mf32b_currency").attr("disabled", true);
                $("#_034_mf32b_amount").attr("disabled", true);
            } else if ( $("#type_mf32_principal_amount_paid").val() == "b"){
                $("#div_mf32a_").hide();
                $("#div_mf32b_").show();
                $("#_030_mf32a_date").attr("disabled", true);
                $("#_031_mf32a_currency").attr("disabled", true);
                $("#_032_mf32a_amount").attr("disabled", true);
                $("#_033_mf32b_currency").attr("disabled", false);
                $("#_034_mf32b_amount").attr("disabled", false);
            } else{
                $("#div_mf32a_").hide();
                $("#div_mf32b_").hide();
                $("#_030_mf32a_date").attr("disabled", true);
                $("#_031_mf32a_currency").attr("disabled", true);
                $("#_032_mf32a_amount").attr("disabled", true);
                $("#_033_mf32b_currency").attr("disabled", true);
                $("#_034_mf32b_amount").attr("disabled", true);
            }
        });
        
        //OF34_a_b
        $("#div_of34a_").hide();
        $("#div_of34b_").hide();
        $("#_070_of34a_date").attr("disabled", true);
        $("#_071_of34a_currency").attr("disabled", true);
        $("#_072_of34a_amount").attr("disabled", true);
        $("#_073_of34b_currency").attr("disabled", true);
        $("#_074_of34b_amount").attr("disabled", true);
        $("#type_of34_total_amount_claimed").change(function() {
            if ( $("#type_of34_total_amount_claimed").val() == "a"){
                $("#div_of34a_").show();
                $("#div_of34b_").hide();
                $("#_070_of34a_date").attr("disabled", false);
                $("#_071_of34a_currency").attr("disabled", false);
                $("#_072_of34a_amount").attr("disabled", false);
                $("#_073_of34b_currency").attr("disabled", true);
                $("#_074_of34b_amount").attr("disabled", true);
            } else if ( $("#type_of34_total_amount_claimed").val() == "b"){
                $("#div_of34a_").hide();
                $("#div_of34b_").show();
                $("#_070_of34a_date").attr("disabled", true);
                $("#_071_of34a_currency").attr("disabled", true);
                $("#_072_of34a_amount").attr("disabled", true);
                $("#_073_of34b_currency").attr("disabled", false);
                $("#_074_of34b_amount").attr("disabled", false);
            } else{
                $("#div_of34a_").hide();
                $("#div_of34b_").hide();
                $("#_070_of34a_date").attr("disabled", true);
                $("#_071_of34a_currency").attr("disabled", true);
                $("#_072_of34a_amount").attr("disabled", true);
                $("#_073_of34b_currency").attr("disabled", true);
                $("#_074_of34b_amount").attr("disabled", true);
            }
        });
        
        //OF53_a_b_d
        $("#div_of53a_").hide();
        $("#div_of53b_").hide();
        $("#div_of53d_").hide();
        $("#_080_of53a_party_identifier").attr("disabled", true);
        $("#_081_of53a_identifier_code").attr("disabled", true);
        $("#_082_of53b_party_identifier").attr("disabled", true);
        $("#_083_of53b_location").attr("disabled", true);
        $("#_084_of53d_party_identifier").attr("disabled", true);
        $("#_085_of53d_name_address").attr("disabled", true);
        $("#type_of53_reimbursing_bank").change(function() {
            if ( $("#type_of53_reimbursing_bank").val() == "a"){
                $("#div_of53a_").show();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_080_of53a_party_identifier").attr("disabled", false);
                $("#_081_of53a_identifier_code").attr("disabled", false);
                $("#_082_of53b_party_identifier").attr("disabled", true);
                $("#_083_of53b_location").attr("disabled", true);
                $("#_084_of53d_party_identifier").attr("disabled", true);
                $("#_085_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_reimbursing_bank").val() == "b"){
                $("#div_of53a_").hide();
                $("#div_of53b_").show();
                $("#div_of53d_").hide();
                $("#_080_of53a_party_identifier").attr("disabled", true);
                $("#_081_of53a_identifier_code").attr("disabled", true);
                $("#_082_of53b_party_identifier").attr("disabled", false);
                $("#_083_of53b_location").attr("disabled", false);
                $("#_084_of53d_party_identifier").attr("disabled", true);
                $("#_085_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_reimbursing_bank").val() == "d"){
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").show();
                $("#_080_of53a_party_identifier").attr("disabled", true);
                $("#_081_of53a_identifier_code").attr("disabled", true);
                $("#_082_of53b_party_identifier").attr("disabled", true);
                $("#_083_of53b_location").attr("disabled", true);
                $("#_084_of53d_party_identifier").attr("disabled", false);
                $("#_085_of53d_name_address").attr("disabled", false);
            } else{
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_080_of53a_party_identifier").attr("disabled", true);
                $("#_081_of53a_identifier_code").attr("disabled", true);
                $("#_082_of53b_party_identifier").attr("disabled", true);
                $("#_083_of53b_location").attr("disabled", true);
                $("#_084_of53d_party_identifier").attr("disabled", true);
                $("#_085_of53d_name_address").attr("disabled", true);
            }
        });
        
        //OF57_a_b_d
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_090_of57a_party_identifier").attr("disabled", true);
        $("#_091_of57a_identifier_code").attr("disabled", true);
        $("#_092_of57b_party_identifier").attr("disabled", true);
        $("#_093_of57b_location").attr("disabled", true);
        $("#_094_of57d_party_identifier").attr("disabled", true);
        $("#_095_of57d_name_address").attr("disabled", true);
        $("#type_of57_account_with_bank").change(function() {
            if ( $("#type_of57_account_with_bank").val() == "a"){
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_090_of57a_party_identifier").attr("disabled", false);
                $("#_091_of57a_identifier_code").attr("disabled", false);
                $("#_092_of57b_party_identifier").attr("disabled", true);
                $("#_093_of57b_location").attr("disabled", true);
                $("#_094_of57d_party_identifier").attr("disabled", true);
                $("#_095_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_account_with_bank").val() == "b"){
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_090_of57a_party_identifier").attr("disabled", true);
                $("#_091_of57a_identifier_code").attr("disabled", true);
                $("#_092_of57b_party_identifier").attr("disabled", false);
                $("#_093_of57b_location").attr("disabled", false);
                $("#_094_of57d_party_identifier").attr("disabled", true);
                $("#_095_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_account_with_bank").val() == "d"){
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_090_of57a_party_identifier").attr("disabled", true);
                $("#_091_of57a_identifier_code").attr("disabled", true);
                $("#_092_of57b_party_identifier").attr("disabled", true);
                $("#_093_of57b_location").attr("disabled", true);
                $("#_094_of57d_party_identifier").attr("disabled", false);
                $("#_095_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_090_of57a_party_identifier").attr("disabled", true);
                $("#_091_of57a_identifier_code").attr("disabled", true);
                $("#_092_of57b_party_identifier").attr("disabled", true);
                $("#_093_of57b_location").attr("disabled", true);
                $("#_094_of57d_party_identifier").attr("disabled", true);
                $("#_095_of57d_name_address").attr("disabled", true);
            }
        });
        
        //OF58_a_d
        $("#div_of58a_").hide();
        $("#div_of58d_").hide();
        $("#_100_of58a_party_identifier").attr("disabled", true);
        $("#_101_of58a_identifier_code").attr("disabled", true);
        $("#_102_of58d_party_identifier").attr("disabled", true);
        $("#_103_of58d_name_address").attr("disabled", true);
        $("#type_of58_beneficiary_bank").change(function() {
            if ( $("#type_of58_beneficiary_bank").val() == "a"){
                $("#div_of58a_").show();
                $("#div_of58d_").hide();
                $("#_100_of58a_party_identifier").attr("disabled", false);
                $("#_101_of58a_identifier_code").attr("disabled", false);
                $("#_102_of58d_party_identifier").attr("disabled", true);
                $("#_103_of58d_name_address").attr("disabled", true);
            } else if ( $("#type_of58_beneficiary_bank").val() == "d"){
                $("#div_of58a_").hide();
                $("#div_of58d_").show();
                $("#_100_of58a_party_identifier").attr("disabled", true);
                $("#_101_of58a_identifier_code").attr("disabled", true);
                $("#_102_of58d_party_identifier").attr("disabled", false);
                $("#_103_of58d_name_address").attr("disabled", false);
            } else{
                $("#div_of58a_").hide();
                $("#div_of58d_").hide();
                $("#_100_of58a_party_identifier").attr("disabled", true);
                $("#_101_of58a_identifier_code").attr("disabled", true);
                $("#_102_of58d_party_identifier").attr("disabled", true);
                $("#_103_of58d_name_address").attr("disabled", true);
            }
        });

    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF33B_check
        if ($("#_040_of33b_currency_additional_amount").val() != "" || $("#_041_of33b_amount").val() != ""){
            $("#additional_amount_checkbox").attr("checked", true);
            $("#check_of33b").show();
            $("#_040_of33b_currency_additional_amount").attr("disabled", false);
            $("#_041_of33b_amount").attr("disabled", false);
        } else {
            $("#check_of33b").hide();
            $("#_040_of33b_currency_additional_amount").attr("disabled", true);
            $("#_041_of33b_amount").attr("disabled", true);
        }
        
        //MF32_a_b
        if ($("#_030_mf32a_date").val() != "" || $("#_031_mf32a_currency").val() != "" || $("#_032_mf32a_amount").val() != ""){
            $("#type_mf32_principal_amount_paid").val("a").attr("selected",true);
            $("#div_mf32a_").show();
            $("#div_mf32b_").hide();
            $("#_030_mf32a_date").attr("disabled", false);
            $("#_031_mf32a_currency").attr("disabled", false);
            $("#_032_mf32a_amount").attr("disabled", false);
            $("#_033_mf32b_currency").attr("disabled", true);
            $("#_034_mf32b_amount").attr("disabled", true);
        } else if ($("#_033_mf32b_currency").val() != "" || $("#_034_mf32b_amount").val() != ""){
            $("#type_mf32_principal_amount_paid").val("b").attr("selected",true);
            $("#div_mf32a_").hide();
            $("#div_mf32b_").show();
            $("#_030_mf32a_date").attr("disabled", true);
            $("#_031_mf32a_currency").attr("disabled", true);
            $("#_032_mf32a_amount").attr("disabled", true);
            $("#_033_mf32b_currency").attr("disabled", false);
            $("#_034_mf32b_amount").attr("disabled", false);
        } else{
            $("#div_mf32a_").hide();
            $("#div_mf32b_").hide();
            $("#_030_mf32a_date").attr("disabled", true);
            $("#_031_mf32a_currency").attr("disabled", true);
            $("#_032_mf32a_amount").attr("disabled", true);
            $("#_033_mf32b_currency").attr("disabled", true);
            $("#_034_mf32b_amount").attr("disabled", true);
        }
        
        //OF34_a_b
        if ($("#_070_of34a_date").val() != "" || $("#_071_of34a_currency").val() != "" || $("#_072_of34a_amount").val() != ""){
            $("#type_of34_total_amount_claimed").val("a").attr("selected",true);
            $("#div_of34a_").show();
            $("#div_of34b_").hide();
            $("#_070_of34a_date").attr("disabled", false);
            $("#_071_of34a_currency").attr("disabled", false);
            $("#_072_of34a_amount").attr("disabled", false);
            $("#_073_of34b_currency").attr("disabled", true);
            $("#_074_of34b_amount").attr("disabled", true);
        } else if ($("#_073_of34b_currency").val() != "" || $("#_074_of34b_amount").val() != ""){
            $("#type_of34_total_amount_claimed").val("b").attr("selected",true);
            $("#div_of34a_").hide();
            $("#div_of34b_").show();
            $("#_070_of34a_date").attr("disabled", true);
            $("#_071_of34a_currency").attr("disabled", true);
            $("#_072_of34a_amount").attr("disabled", true);
            $("#_073_of34b_currency").attr("disabled", false);
            $("#_074_of34b_amount").attr("disabled", false);
        } else{
            $("#div_of34a_").hide();
            $("#div_of34b_").hide();
            $("#_070_of34a_date").attr("disabled", true);
            $("#_071_of34a_currency").attr("disabled", true);
            $("#_072_of34a_amount").attr("disabled", true);
            $("#_073_of34b_currency").attr("disabled", true);
            $("#_074_of34b_amount").attr("disabled", true);
        }
        
        //OF53_a_b_d
        if ($("#_080_of53a_party_identifier").val() != "" || $("#_081_of53a_identifier_code").val() != ""){
            $("#type_of53_reimbursing_bank").val("a").attr("selected",true);
            $("#div_of53a_").show();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_080_of53a_party_identifier").attr("disabled", false);
            $("#_081_of53a_identifier_code").attr("disabled", false);
            $("#_082_of53b_party_identifier").attr("disabled", true);
            $("#_083_of53b_location").attr("disabled", true);
            $("#_084_of53d_party_identifier").attr("disabled", true);
            $("#_085_of53d_name_address").attr("disabled", true);
        } else if ($("#_082_of53b_party_identifier").val() != "" || $("#_083_of53b_location").val() != ""){
            $("#type_of53_reimbursing_bank").val("b").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").show();
            $("#div_of53d_").hide();
            $("#_080_of53a_party_identifier").attr("disabled", true);
            $("#_081_of53a_identifier_code").attr("disabled", true);
            $("#_082_of53b_party_identifier").attr("disabled", false);
            $("#_083_of53b_location").attr("disabled", false);
            $("#_084_of53d_party_identifier").attr("disabled", true);
            $("#_085_of53d_name_address").attr("disabled", true);
        } else if ($("#_084_of53d_party_identifier").val() != "" || $("#_085_of53d_name_address").val() != ""){
            $("#type_of53_reimbursing_bank").val("d").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").show();
            $("#_080_of53a_party_identifier").attr("disabled", true);
            $("#_081_of53a_identifier_code").attr("disabled", true);
            $("#_082_of53b_party_identifier").attr("disabled", true);
            $("#_083_of53b_location").attr("disabled", true);
            $("#_084_of53d_party_identifier").attr("disabled", false);
            $("#_085_of53d_name_address").attr("disabled", false);
        } else{
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_080_of53a_party_identifier").attr("disabled", true);
            $("#_081_of53a_identifier_code").attr("disabled", true);
            $("#_082_of53b_party_identifier").attr("disabled", true);
            $("#_083_of53b_location").attr("disabled", true);
            $("#_084_of53d_party_identifier").attr("disabled", true);
            $("#_085_of53d_name_address").attr("disabled", true);
        }
        
        //OF57_a_b_d
        if ($("#_090_of57a_party_identifier").val() != "" || $("#_091_of57a_identifier_code").val() != ""){
            $("#type_of57_account_with_bank").val("a").attr("selected",true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_090_of57a_party_identifier").attr("disabled", false);
            $("#_091_of57a_identifier_code").attr("disabled", false);
            $("#_092_of57b_party_identifier").attr("disabled", true);
            $("#_093_of57b_location").attr("disabled", true);
            $("#_094_of57d_party_identifier").attr("disabled", true);
            $("#_095_of57d_name_address").attr("disabled", true);
        } else if ($("#_092_of57b_party_identifier").val() != "" || $("#_093_of57b_location").val() != ""){
            $("#type_of57_account_with_bank").val("b").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_090_of57a_party_identifier").attr("disabled", true);
            $("#_091_of57a_identifier_code").attr("disabled", true);
            $("#_092_of57b_party_identifier").attr("disabled", false);
            $("#_093_of57b_location").attr("disabled", false);
            $("#_094_of57d_party_identifier").attr("disabled", true);
            $("#_095_of57d_name_address").attr("disabled", true);
        } else if ($("#_094_of57d_party_identifier").val() != "" || $("#_095_of57d_name_address").val() != ""){
            $("#type_of57_account_with_bank").val("d").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").show();
            $("#_090_of57a_party_identifier").attr("disabled", true);
            $("#_091_of57a_identifier_code").attr("disabled", true);
            $("#_092_of57b_party_identifier").attr("disabled", true);
            $("#_093_of57b_location").attr("disabled", true);
            $("#_094_of57d_party_identifier").attr("disabled", false);
            $("#_095_of57d_name_address").attr("disabled", false);
        } else{
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_090_of57a_party_identifier").attr("disabled", true);
            $("#_091_of57a_identifier_code").attr("disabled", true);
            $("#_092_of57b_party_identifier").attr("disabled", true);
            $("#_093_of57b_location").attr("disabled", true);
            $("#_094_of57d_party_identifier").attr("disabled", true);
            $("#_095_of57d_name_address").attr("disabled", true);
        }
        
        //OF58_a_d
        if ($("#_100_of58a_party_identifier").val() != "" || $("#_101_of58a_identifier_code").val() != ""){
            $("#type_of58_beneficiary_bank").val("a").attr("selected",true);
            $("#div_of58a_").show();
            $("#div_of58d_").hide();
            $("#_100_of58a_party_identifier").attr("disabled", false);
            $("#_101_of58a_identifier_code").attr("disabled", false);
            $("#_102_of58d_party_identifier").attr("disabled", true);
            $("#_103_of58d_name_address").attr("disabled", true);
        } else if ($("#_102_of58d_party_identifier").val() != "" || $("#_103_of58d_name_address").val() != ""){
            $("#type_of58_beneficiary_bank").val("d").attr("selected",true);
            $("#div_of58a_").hide();
            $("#div_of58d_").show();
            $("#_100_of58a_party_identifier").attr("disabled", true);
            $("#_101_of58a_identifier_code").attr("disabled", true);
            $("#_102_of58d_party_identifier").attr("disabled", false);
            $("#_103_of58d_name_address").attr("disabled", false);
        } else{
            $("#div_of58a_").hide();
            $("#div_of58d_").hide();
            $("#_100_of58a_party_identifier").attr("disabled", true);
            $("#_101_of58a_identifier_code").attr("disabled", true);
            $("#_102_of58d_party_identifier").attr("disabled", true);
            $("#_103_of58d_name_address").attr("disabled", true);
        }
        
    });
</script>