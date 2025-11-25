<%-- 
    Document   : validate_rule_mt720
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
                _010_mf27_number: "required",
                _011_mf27_total: "required",
                _020_mf40b_type: "required",
                _021_mf40b_code: "required",
//               
                _030_mf20_transferring_bank_reference: "required",
                _040_mf21_documentary_credit_number: "required",
                _050_mf31c_date_of_issue: "required",
                _060_mf40e_applicable_rules: "required",
                
                _070_mf31d_date_of_expiry: "required",
                _071_mf31d_place_of_expiry_of_expiry: "required",
                _100_mf50_name_address:"required",
                _110_mf59_account:"required",
                _120_mf32b_currency:"required",
                _121_mf32b_amount:"required",
                _350_mf49_confirmation_instructions:"required",
                
                //mf41//
                type_mf41_Available: "required",
                _151_mf41a_party_identifier: "required",
                _152_mf41a_code: "required",
                _153_mf41d_name_and_address: "required",
                _154_mf41d_code: "required",

                //of42A//
                _172_of42a_identifier_code: "required",
                _174_of42d_name_address: "required",
              
                //of42C
                _160_of42c_drafts_at: {
                    required: function(element) {
                        return ($("#type_of42_drawee").val() != "")
//                          || ($("#type_of42_drawee").val() == "" && $("#_180_of42m_mixed_payment_details").val() == "" && $("#_190_of42p_negotiation_deferred_payment_details").val() == "")
                          || ($("#type_of42_drawee").val() != "" && $("#_180_of42m_mixed_payment_details").val() != "")
                          || ($("#type_of42_drawee").val() != "" && $("#_190_of42p_negotiation_deferred_payment_details").val() != "")
                          || ($("#_180_of42m_mixed_payment_details").val() != "" && $("#_190_of42p_negotiation_deferred_payment_details").val() != "");
                    }
                },
                
                //of42
                type_of42_drawee: {
                    required: function(element) {
                        return ($("#_160_of42c_drafts_at").val() != "")
//                          || ($("#_160_of42c_drafts_at").val() == "" && $("#_180_of42m_mixed_payment_details").val() == "" && $("#_190_of42p_negotiation_deferred_payment_details").val() == "")
                          || ($("#_160_of42c_drafts_at").val() != "" && $("#_180_of42m_mixed_payment_details").val() != "")
                          || ($("#_160_of42c_drafts_at").val() != "" && $("#_190_of42p_negotiation_deferred_payment_details").val() != "")
                          || ($("#_180_of42m_mixed_payment_details").val() != "" && $("#_190_of42p_negotiation_deferred_payment_details").val() != "");
                    }
                },
                
                //of42m
                _180_of42m_mixed_payment_details: {
                    required: function(element) {
                        return ($("#_160_of42c_drafts_at").val() != "" && $("#_190_of42p_negotiation_deferred_payment_details").val() != "");
                    }
                },
                
                //of42p
                _190_of42p_negotiation_deferred_payment_details: {
                    required: function(element) {
                        return ($("#_160_of42c_drafts_at").val() != "" && $("#_180_of42m_mixed_payment_details").val() != "");
                    }
                },
                
                //of44c
//                _270_of44c_Latest_Date_of_Shipment: {
//                    required: function(element) {
//                      return ($("#_280_of44d_Shipment_Period").val() == "" && $("#_270_of44c_Latest_Date_of_Shipment").val() == "") 
//                              || ($("#_280_of44d_Shipment_Period").val() != "" && $("#_270_of44c_Latest_Date_of_Shipment").val() != "");
//                    }
//                },
                
                //of44d
//                _280_of44d_Shipment_Period: {
//                    required: function(element) {
//                      return ($("#_270_of44c_Latest_Date_of_Shipment").val() == "" && $("#_280_of44d_Shipment_Period").val() == "") 
//                              || ($("#_270_of44c_Latest_Date_of_Shipment").val() != "" && $("#_280_of44d_Shipment_Period").val() != "");
//                    }
//                },
                
                //of52
                type_of52_issuing_bank: {
                    required: function(element) {
                      return ($("#_090_of50b_non_bank_issuer_of_the_original_documentary_credit").val() == "" && $("#type_of52_issuing_bank").val() == "")
                             || ($("#_090_of50b_non_bank_issuer_of_the_original_documentary_credit").val() != "" && $("#type_of52_issuing_bank").val() != "");
                    }
                },
                
                //of50b
                _090_of50b_non_bank_issuer_of_the_original_documentary_credit: {
                    required: function(element) {
                      return ($("#type_of52_issuing_bank").val() == "" && $("#_090_of50b_non_bank_issuer_of_the_original_documentary_credit").val() == "")
                             || ($("#type_of52_issuing_bank").val() != "" && $("#_090_of50b_non_bank_issuer_of_the_original_documentary_credit").val() != "");
                    }
                },
       
               
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf27_number:{required: "mf27 number must be filled..!!"},
                _011_mf27_total: {required: "mf27 total must be filled..!!"},
                _020_mf40b_type:{required:"mf40b type must be filled..!!"},
                _021_mf40b_code:{required:"mf40b code must be filled..!! "},
                _030_mf20_transferring_bank_reference:{required:"mf20 transfering bank references must be filled..!!"},
                _040_mf21_documentary_credit_number:{required: "mf21 documentary credit number must be filled..!!"},
                _050_mf31c_date_of_issue:{required: "mf31c date and issue must be filled..!!"},
                _060_mf40e_applicable_rules:{required:"mf40e applicable rules must be filled..!!"},
                _070_mf31d_date_of_expiry: {required:"mf31d date must be filled..!!"},
                _071_mf31d_place_of_expiry: {required:"mf31d place must be filled..!!"},
                _100_mf50_name_address:{required:"mf50 first beneficiary must be filled...!"},
                _111_mf59_name_address:{required:"mf59 name address must be filled..!!"},
                _120_mf32b_currency:{required:"mf32b currency code must be filled..!!"},
                _121_mf32b_amount:{required:"mf32b amount must be filled..!!"},
                _350_mf49_confirmation_instructions:{required:"mf49 confirmation instruction must be filled..!!"},
                type_mf41_Available: {required: "mf41a availabe must be filled..!!"},
                _151_mf41a_party_identifier: {required: "mf41a party identifire must be filled..!!"},
                _152_mf41a_code: {required: "mf41a code must be identifire..!!"},
                _153_mf41d_name_and_address: {required: "mf41a name and address must be filled..!!"},
                _154_mf41d_code: {required: "mf41a code must be filled..!!"},
                _172_of42a_identifier_code: {required:"of42a identifire code must be filled..!!"},
                _174_of42d_name_address: {required:"of42d name address must be filled..!!"},
                _160_of42c_drafts_at: {required: "fill in both fields of42c and of42 or fill in the of42m field only or of42p only..!!"},
                type_of42_drawee: {required: "fill in both fields of42c and of42 or fill in the of42m field only or of42p only..!!"},
                _180_of42m_mixed_payment_details: {required: "fill in both fields of42c and of42 or fill in the of42m field only or of42p only..!!"},
                _190_of42p_negotiation_deferred_payment_details: {required: "fill in both fields of42c and of42 or fill in the of42m field only or of42p only..!!"},
//                _270_of44c_Latest_Date_of_Shipment: {required: "isi antara field of44c atau of44d..!!"},
//                _280_of44d_Shipment_Period: {required: "isi antara field of44c atau of44d..!!"},
                type_of52_issuing_bank: {required: "fill in either of52 or of50b..!!"},
                _090_of50b_non_bank_issuer_of_the_original_documentary_credit: {required: "fill in either of52 or of50b..!!"},
                
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
        //OF39A_check
        $("#check_of39a").hide();
        $("#_130_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
        $("#_131_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        $("#percentage_credit_amount_checkbox").click(function(){
            if ($("#percentage_credit_amount_checkbox").is(":checked")){
                $("#check_of39a").show();
                $("#_130_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
                $("#_131_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
            } else {
                $("#check_of39a").hide();
                $("#_130_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                $("#_131_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
            }
        });
                            
        $("#check_of48").hide();
        $("#_340_of48_days").attr("disabled", true);
        $("#_341_of48_narrative").attr("disabled", true);
        $("#period_for_presentation_in_days_checkbox").click(function(){
                    if ($("#period_for_presentation_in_days_checkbox").is(":checked")) {
                        $("#check_of48").show();
                        $("#_340_of48_days").attr("disabled", false);
                        $("#_341_of48_narrative").attr("disabled", false);
                    } else {
                        $("#check_of48").hide();
                        $("#_340_of48_days").attr("disabled", true);
                        $("#_341_of48_narrative").attr("disabled", true);
                    }
                });
        //of52a//
        $("#div_of52a").hide();
        $("#div_of52d").hide();
        $("#_081_of52a_party_identifier").attr("disabled", true);
        $("#_082_of52a_identifier_code").attr("disabled", true);
        $("#_083_of52d_party_identifier").attr("disabled", true);
        $("#_084_of52d_name_address").attr("disabled", true);
        $("#type_of52_issuing_bank").change(function() {
            if ( $("#type_of52_issuing_bank").val() == "a"){
                $("#div_of52a").show();
                $("#div_of52d").hide();
                $("#_081_of52a_party_identifier").attr("disabled", false);
                $("#_082_of52a_identifier_code").attr("disabled", false);
                $("#_083_of52d_party_identifier").attr("disabled", true);
                 $("#_084_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52_issuing_bank").val() == "d"){
                $("#div_of52a").hide();
                $("#div_of52d").show();
                $("#_081_of52a_party_identifier").attr("disabled", true);
                $("#_082_of52a_identifier_code").attr("disabled", true);
                $("#_083_of52d_party_identifier").attr("disabled", false);
                $("#_084_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a").hide();
                $("#div_of52d").hide();
                $("#_081_of52a_party_identifier").attr("disabled", true);
                $("#_082_of52a_identifier_code").attr("disabled", true);
                $("#_083_of52d_party_identifier").attr("disabled", true);
                $("#_084_of52d_name_address").attr("disabled", true);
            }
        });
        
        //MF41_a_d
        $("#div_mf41a_").hide();
        $("#div_mf41d_").hide();
        $("#_151_mf41a_party_identifier").attr("disabled", true);
        $("#_152_mf41a_code").attr("disabled", true);
        $("#_153_mf41d_name_and_address").attr("disabled", true);
        $("#_154_mf41d_code").attr("disabled", true);
        $("#type_mf41_available_with_by").change(function() {
            if ( $("#type_mf41_available_with_by").val() == "a"){
                $("#div_mf41a_").show();
                $("#div_mf41d_").hide();
                $("#_151_mf41a_party_identifier").attr("disabled", false);
                $("#_152_mf41a_code").attr("disabled", false);
                $("#_153_mf41d_name_and_address").attr("disabled", true);
                $("#_154_mf41d_code").attr("disabled", true);
            } else if ( $("#type_mf41_available_with_by").val() == "d"){
                $("#div_mf41a_").hide();
                $("#div_mf41d_").show();
                $("#_151_mf41a_party_identifier").attr("disabled", true);
                $("#_152_mf41a_code").attr("disabled", true);
                $("#_153_mf41d_name_and_address").attr("disabled", false);
                $("#_154_mf41d_code").attr("disabled", false);
            } else{
                $("#div_mf41a_").hide();
                $("#div_mf41d_").hide();
                $("#_151_mf41a_party_identifier").attr("disabled", true);
                $("#_152_mf41a_code").attr("disabled", true);
                $("#_153_mf41d_name_and_address").attr("disabled", true);
                $("#_154_mf41d_code").attr("disabled", true);
            }
        });

        //OF42_a_d
        $("#div_of42a_").hide();
        $("#div_of42d_").hide();
        $("#_171_of42a_party_identifier").attr("disabled", true);
        $("#_172_of42a_identifier_code").attr("disabled", true);
        $("#_173_of42d_party_identifier").attr("disabled", true);
        $("#_174_of42d_name_address").attr("disabled", true);
        $("#type_of42_drawee").change(function() {
            if ( $("#type_of42_drawee").val() == "a"){
                $("#div_of42a_").show();
                $("#div_of42d_").hide();
                $("#_171_of42a_party_identifier").attr("disabled", false);
                $("#_172_of42a_identifier_code").attr("disabled", false);
                $("#_173_of42d_party_identifier").attr("disabled", true);
                $("#_174_of42d_name_address").attr("disabled", true);
            } else if ( $("#type_of42_drawee").val() == "d"){
                $("#div_of42a_").hide();
                $("#div_of42d_").show();
                $("#_171_of42a_party_identifier").attr("disabled", true);
                $("#_172_of42a_identifier_code").attr("disabled", true);
                $("#_173_of42d_party_identifier").attr("disabled", false);
                $("#_174_of42d_name_address").attr("disabled", false);
            } else{
                $("#div_of42a_").hide();
                $("#div_of42d_").hide();
                $("#_171_of42a_party_identifier").attr("disabled", true);
                $("#_172_of42a_identifier_code").attr("disabled", true);
                $("#_173_of42d_party_identifier").attr("disabled", true);
                $("#_174_of42d_name_address").attr("disabled", true);
            }
        });
        
        //OF58_a_d
        $("#div_of58a_").hide();
        $("#div_of58d_").hide();
        $("#_361_of58a_party_identifier").attr("disabled", true);
        $("#_362_of58a_identifier_code").attr("disabled", true);
        $("#_363_of58d_party_identifier").attr("disabled", true);
        $("#_364_of58d_name_address").attr("disabled", true);
        $("#type_of58_Requested_Confirmation_Party").change(function() {
            if ( $("#type_of58_Requested_Confirmation_Party").val() == "a"){
                $("#div_of58a_").show();
                $("#div_of58d_").hide();
                $("#_361_of58a_party_identifier").attr("disabled", false);
                $("#_362_of58a_identifier_code").attr("disabled", false);
                $("#_363_of58d_party_identifier").attr("disabled", true);
                $("#_364_of58d_name_address").attr("disabled", true);
            } else if ( $("#type_of58_Requested_Confirmation_Party").val() == "d"){
                $("#div_of58a_").hide();
                $("#div_of58d_").show();
                $("#_361_of58a_party_identifier").attr("disabled", true);
                $("#_362_of58a_identifier_code").attr("disabled", true);
                $("#_363_of58d_party_identifier").attr("disabled", false);
                $("#_364_of58d_name_address").attr("disabled", false);
            } else{
                $("#div_of58a_").hide();
                $("#div_of58d_").hide();
                $("#_361_of58a_party_identifier").attr("disabled", true);
                $("#_362_of58a_identifier_code").attr("disabled", true);
                $("#_363_of58d_party_identifier").attr("disabled", true);
                $("#_364_of58d_name_address").attr("disabled", true);
            }
        });
        
        //OF57A//
        $("#div_of57a").hide();
        $("#div_of57b").hide();
        $("#div_of57d").hide();
        $("#_391_of57a_party_identifire").attr("disabled", true);
        $("#_392_of57a_identifier_code").attr("disabled", true);
        $("#_393_of57b_party_identifire").attr("disabled", true);
        $("#_394_of57b_location").attr("disabled", true);
        $("#_395_of57d_party_identifire").attr("disabled", true);
        $("#_396_of57d_name_address").attr("disabled", true);
        $("#type_of57_advise_through_bank").change(function() {
            if ( $("#type_of57_advise_through_bank").val() == "A"){
                $("#div_of57a").show();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_391_of57a_party_identifire").attr("disabled", false);
                $("#_392_of57a_identifier_code").attr("disabled", false);
                $("#_393_of57b_party_identifire").attr("disabled", true);
                $("#_394_of57b_location").attr("disabled", true);
                $("#_395_of57d_party_identifire").attr("disabled", true);
                $("#_396_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_advise_through_bank").val() == "B"){
                $("#div_of57a").hide();
                $("#div_of57b").show();
                $("#div_of57d").hide();
                $("#_391_of57a_party_identifire").attr("disabled", true);
                $("#_392_of57a_identifier_code").attr("disabled", true);
                $("#_393_of57b_party_identifire").attr("disabled", false);
                $("#_394_of57b_location").attr("disabled", false);
                $("#_395_of57d_party_identifire").attr("disabled", true);
                $("#_396_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_advise_through_bank").val() == "D"){
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").show();
                $("#_391_of57a_party_identifire").attr("disabled", true);
                $("#_392_of57a_identifier_code").attr("disabled", true);
                $("#_393_of57b_party_identifire").attr("disabled", true);
                $("#_394_of57b_location").attr("disabled", true);
                $("#_395_of57d_party_identifire").attr("disabled", false);
                $("#_396_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_391_of57a_party_identifire").attr("disabled", true);
                $("#_392_of57a_identifier_code").attr("disabled", true);
                $("#_393_of57b_party_identifire").attr("disabled", true);
                $("#_394_of57b_location").attr("disabled", true);
                $("#_395_of57d_party_identifire").attr("disabled", true);
                $("#_396_of57d_name_address").attr("disabled", true);
            }
        });

      
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        //OF39A_check
        if ($("#_130_of39a_percentage_credit_amount_tolerance1").val() != "" || $("#_131_of39a_percentage_credit_amount_tolerance2").val() != ""){
            $("#percentage_credit_amount_checkbox").attr("checked", true);
            $("#check_of39a").show();
            $("#_130_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
            $("#_131_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
        } else {
            $("#check_of39a").hide();
            $("#_130_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
            $("#_131_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        }
        
        //OF48_check
        if ($("#_340_of48_days").val() != "" || $("#_341_of48_narrative").val() != ""){
            $("#period_for_presentation_in_days_checkbox").attr("checked", true);
            $("#check_of48").show();
            $("#_340_of48_days").attr("disabled", false);
            $("#_341_of48_narrative").attr("disabled", false);
        } else {
            $("#check_of48").hide();
            $("#_340_of48_days").attr("disabled", true);
            $("#_341_of48_narrative").attr("disabled", true);
        }
        //mf52a a_b
           if ($("#_081_of52a_party_identifier").val() != "" || $("#_082_of52a_identifier_code").val() != ""){
              $("#type_of52_issuing_bank").val("a").attr("selected",true);
                $("#div_of52a").show();
                $("#div_of52d").hide();
                $("#_081_of52a_party_identifier").attr("disabled", false);
                $("#_082_of52a_identifier_code").attr("disabled", false);
                $("#_083_of52d_party_identifier").attr("disabled", true);
                $("#_084_of52d_name_address").attr("disabled", true);
          } else if ($("#_083_of52d_party_identifier").val() != "" || $("#_084_of52d_name_address").val() != ""){
                $("#type_of52_issuing_bank").val("d").attr("selected",true);
                $("#div_of52a").hide();
                $("#div_of52d").show();
                $("#_081_of52a_party_identifier").attr("disabled", true);
                $("#_082_of52a_identifier_code").attr("disabled", true);
                $("#_083_of52d_party_identifier").attr("disabled", false);
                $("#_084_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a").hide();
                $("#div_of52d").hide();
                $("#_081_of52a_party_identifier").attr("disabled", true);
                $("#_082_of52a_identifier_code").attr("disabled", true);
                $("#_083_of52d_party_identifier").attr("disabled", true);
                $("#_084_of52d_name_address").attr("disabled", true);
            }
            
            //OF42_a_d
        if ($("#_171_of42a_party_identifier").val() != "" || $("#_172_of42a_identifier_code").val() != ""){
            $("#type_of42_drawee").val("a").attr("selected",true);
            $("#div_of42a_").show();
            $("#div_of42d_").hide();
            $("#_171_of42a_party_identifier").attr("disabled", false);
            $("#_172_of42a_identifier_code").attr("disabled", false);
            $("#_173_of42d_party_identifier").attr("disabled", true);
            $("#_174_of42d_name_address").attr("disabled", true);
        } else if ($("#_173_of42d_party_identifier").val() != "" || $("#_174_of42d_name_address").val() != ""){
            $("#type_of42_drawee").val("d").attr("selected",true);
            $("#div_of42a_").hide();
            $("#div_of42d_").show();
            $("#_171_of42a_party_identifier").attr("disabled", true);
            $("#_172_of42a_identifier_code").attr("disabled", true);
            $("#_173_of42d_party_identifier").attr("disabled", false);
            $("#_174_of42d_name_address").attr("disabled", false);
        } else{
            $("#div_of42a_").hide();
            $("#div_of42d_").hide();
            $("#_171_of42a_party_identifier").attr("disabled", true);
            $("#_172_of42a_identifier_code").attr("disabled", true);
            $("#_173_of42d_party_identifier").attr("disabled", true);
            $("#_174_of42d_name_address").attr("disabled", true);
        }
            
            //OF58_a_d
        if ($("#_361_of58a_party_identifier").val() != "" || $("#_362_of58a_identifier_code").val() != ""){
            $("#type_of58_Requested_Confirmation_Party").val("a").attr("selected",true);
            $("#div_of58a_").show();
            $("#div_of58d_").hide();
            $("#_361_of58a_party_identifier").attr("disabled", false);
            $("#_362_of58a_identifier_code").attr("disabled", false);
            $("#_363_of58d_party_identifier").attr("disabled", true);
            $("#_364_of58d_name_address").attr("disabled", true);
        } else if ($("#_363_of58d_party_identifier").val() != "" || $("#_364_of58d_name_address").val() != ""){
            $("#type_of58_Requested_Confirmation_Party").val("d").attr("selected",true);
            $("#div_of58a_").hide();
            $("#div_of58d_").show();
            $("#_361_of58a_party_identifier").attr("disabled", true);
            $("#_362_of58a_identifier_code").attr("disabled", true);
            $("#_363_of58d_party_identifier").attr("disabled", false);
            $("#_364_of58d_name_address").attr("disabled", false);
        } else{
            $("#div_of58a_").hide();
            $("#div_of58d_").hide();
            $("#_361_of58a_party_identifier").attr("disabled", true);
            $("#_362_of58a_identifier_code").attr("disabled", true);
            $("#_363_of58d_party_identifier").attr("disabled", true);
            $("#_364_of58d_name_address").attr("disabled", true);
        }
        
        //of57 a_b_d
            if ($("#_391_of57a_party_identifire").val() != "" || $("#_392_of57a_identifier_code").val() != ""){
                $("#type_of57_advise_through_bank").val("A").attr("selected",true);
                $("#div_of57a").show();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_391_of57a_party_identifire").attr("disabled", false);
                $("#_392_of57a_identifier_code").attr("disabled", false);
                $("#_393_of57b_party_identifire").attr("disabled", true);
                $("#_394_of57b_location").attr("disabled", true);
                $("#_395_of57d_party_identifire").attr("disabled", true);
                $("#_396_of57d_name_address").attr("disabled", true);
           } else if ($("#_393_of57b_party_identifire").val() != "" || $("#_394_of57b_location").val() != ""){
                $("#type_of57_advise_through_bank").val("B").attr("selected",true);
                $("#div_of57a").hide();
                $("#div_of57b").show();
                $("#div_of57d").hide();
                $("#_391_of57a_party_identifire").attr("disabled", true);
                $("#_392_of57a_identifier_code").attr("disabled", true);
                $("#_393_of57b_party_identifire").attr("disabled", false);
                $("#_394_of57b_location").attr("disabled", false);
                $("#_395_of57d_party_identifire").attr("disabled", true);
                $("#_396_of57d_name_address").attr("disabled", true);
           } else if ($("#_395_of57d_party_identifire").val() != "" || $("#_396_of57d_name_address").val() != ""){
                $("#type_of57_advise_through_bank").val("D").attr("selected",true);
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").show();
                $("#_391_of57a_party_identifire").attr("disabled", true);
                $("#_392_of57a_identifier_code").attr("disabled", true);
                $("#_393_of57b_party_identifire").attr("disabled", true);
                $("#_394_of57b_location").attr("disabled", true);
                $("#_395_of57d_party_identifire").attr("disabled", false);
                $("#_396_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_391_of57a_party_identifire").attr("disabled", true);
                $("#_392_of57a_identifier_code").attr("disabled", true);
                $("#_393_of57b_party_identifire").attr("disabled", true);
                $("#_394_of57b_location").attr("disabled", true);
                $("#_395_of57d_party_identifire").attr("disabled", true);
                $("#_396_of57d_name_address").attr("disabled", true);
            }
            
            //MF41_a_d
        if ($("#_151_mf41a_party_identifier").val() != "" || $("#_152_mf41a_code").val() != ""){
            $("#type_mf41_available_with_by").val("a").attr("selected",true);
            $("#div_mf41a_").show();
            $("#div_mf41d_").hide();
            $("#_151_mf41a_party_identifier").attr("disabled", false);
            $("#_152_mf41a_code").attr("disabled", false);
            $("#_153_mf41d_name_and_address").attr("disabled", true);
            $("#_154_mf41d_code").attr("disabled", true);
        } else if ($("#_153_mf41d_name_and_address").val() != "" || $("#_154_mf41d_code").val() != ""){
            $("#type_mf41_available_with_by").val("d").attr("selected",true);
            $("#div_mf41a_").hide();
            $("#div_mf41d_").show();
            $("#_151_mf41a_party_identifier").attr("disabled", true);
            $("#_152_mf41a_code").attr("disabled", true);
            $("#_153_mf41d_name_and_address").attr("disabled", false);
            $("#_154_mf41d_code").attr("disabled", false);
        } else{
            $("#div_mf41a_").hide();
            $("#div_mf41d_").hide();
            $("#_151_mf41a_party_identifier").attr("disabled", true);
            $("#_152_mf41a_code").attr("disabled", true);
            $("#_153_mf41d_name_and_address").attr("disabled", true);
            $("#_154_mf41d_code").attr("disabled", true);
        }
            
        //of71f
        if ($("#_212_of71f_currency").val() != "" || $("#_213_of71f_amount").val() != ""){
            $("#div_of71f_sender_charges").show();
            $("#_212_of71f_currency").attr("disabled", false);
            $("#_213_of71f_amount").attr("disabled", false);
        }else{
            $("#div_of71f_sender_charges").hide();
            $("#_212_of71f_currency").attr("disabled", true);
            $("#_213_of71f_amount").attr("disabled", true);
        }

    });
</script>