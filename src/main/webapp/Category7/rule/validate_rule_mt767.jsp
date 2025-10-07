<%-- 
    Document   : validate_rule_mt767
    Created on : Oct 1, 2025, 1:06:19 PM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(document).ready(function () {

        let validator = $("#form_mt767").validate({
            ignore: [],  
            onkeyup: false,
            onfocusout: false,
            rules: {
                // Mandatory Sequence A - General Information
                _020_mf27_number: "required",
                _021_mf27_total: "required",
                _030_mf21_related_reference: "required",
                _040_mf22a_purpose_of_message: "required",

                // Mandatory Sequence B - Undertaking Details
                _090_mf20_undertaking_number: "required",
                _100_mf26e_number_of_amendment: "required",
                _110_mf30_date_of_amendment: "required",
                
                // MF52a Issuer - Conditional based on type
                _120_mf52a_issuer: "required",
                _122_mf52a_identifier_code: "required",
                _124_mf52d_name_address: "required"
            },
            messages: {
                _020_mf27_number: {required: "MF27 Number must be filled"},
                _021_mf27_total: {required: "MF27 Total must be filled"},
                _030_mf21_related_reference: {required: "MF21 Related Reference must be filled"},
                _040_mf22a_purpose_of_message: {required: "MF22A Purpose of Message must be filled"},
                _090_mf20_undertaking_number: {required: "MF20 Undertaking Number must be filled"},
                _100_mf26e_number_of_amendment: {required: "MF26E Number of Amendment must be filled"},
                _110_mf30_date_of_amendment: {required: "MF30 Date of Amendment must be filled"},
                _120_mf52a_issuer: {required: "MF52a Issuer type must be selected"},
                _122_mf52a_identifier_code: {required: "MF52a Identifier Code must be filled"},
                _124_mf52d_name_address: {required: "MF52d Name and Address must be filled"}
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
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
                                    $('#tab-view2, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7, #tab-validate').removeClass("selected").removeAttr('class');
                                } 
                                else if (tabContentGroup == "Body") {
                                    $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                    $("#view2").css("display", "block");
                                    $('#tab-view2').addClass("selected");
                                    $('#tab-view1, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7, #tab-validate').removeClass("selected").removeAttr('class');
                                }
                                input.focus();
                            }
                        }
                    });
                });
            }
        });
        
        $("#btn-validate").click(function () {            
            let isValid = $("#form_mt767").valid(); 
            if (isValid) {
                alert("All inputs are valid!");
            } 
        });

        $("#submit_mt").click(function (e) {
            e.preventDefault();
            let isValid = $("#form_mt767").valid(); 
            if (isValid) {  
                $("#form_mt767").submit(); 
            } else {
                alert("There are still errors! Please fix them before saving.");
            }
        });
   
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function () {
        
        // ===== SEQUENCE C - OPTIONAL SEQUENCE TOGGLE =====
        $("#check_seq_c").hide();
        $("#check_seq_C").click(function () {
            if ($("#check_seq_C").is(":checked")) {
                $("#check_seq_c").show();
            } else {
                $("#check_seq_c").hide();
                // Clear all Sequence C fields
                clearSequenceC();
            }
        });
        
        // ===== MF52a ISSUER TYPE TOGGLE (Option A or D) =====
        $("#div_mf52a_issuer").hide();
        $("#div_mf52d_issuer").hide();
        $("#_121_mf52a_party_identifier").attr("disabled", true);
        $("#_122_mf52a_identifier_code").attr("disabled", true);
        $("#_123_mf52d_party_identifier").attr("disabled", true);
        $("#_124_mf52d_name_address").attr("disabled", true);
        
        $("#_120_mf52a_issuer").change(function () {
            if ($("#_120_mf52a_issuer").val() == "a") {
                // Option A - BIC
                $("#div_mf52a_issuer").show();
                $("#div_mf52d_issuer").hide();
                $("#_121_mf52a_party_identifier").attr("disabled", false);
                $("#_122_mf52a_identifier_code").attr("disabled", false);
                $("#_123_mf52d_party_identifier").attr("disabled", true);
                $("#_124_mf52d_name_address").attr("disabled", true);
                // Clear Option D
                $("#_123_mf52d_party_identifier").val('');
                $("#_124_mf52d_name_address").val('');
            } else if ($("#_120_mf52a_issuer").val() == "d") {
                // Option D - Name & Address
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").show();
                $("#_121_mf52a_party_identifier").attr("disabled", true);
                $("#_122_mf52a_identifier_code").attr("disabled", true);
                $("#_123_mf52d_party_identifier").attr("disabled", false);
                $("#_124_mf52d_name_address").attr("disabled", false);
                // Clear Option A
                $("#_121_mf52a_party_identifier").val('');
                $("#_122_mf52a_identifier_code").val('');
            } else {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").hide();
                $("#_121_mf52a_party_identifier").attr("disabled", true);
                $("#_122_mf52a_identifier_code").attr("disabled", true);
                $("#_123_mf52d_party_identifier").attr("disabled", true);
                $("#_124_mf52d_name_address").attr("disabled", true);
            }
        });

        // ===== OF59a BENEFICIARY TYPE TOGGLE (Sequence B) =====
        $("#div_of59no_beneficiary").hide();
        $("#div_of59a_beneficiary").hide();
        $("#_191_of59a_account").attr("disabled", true);
        $("#_192_of59a_name_address").attr("disabled", true);
        $("#_193_of59a_account").attr("disabled", true);
        $("#_194_of59a_identifier_code").attr("disabled", true);
        
        $("#_190_of59a_beneficiary").change(function () {
            if ($("#_190_of59a_beneficiary").val() == "no") {
                // No letter option - Name and Address
                $("#div_of59no_beneficiary").show();
                $("#div_of59a_beneficiary").hide();
                $("#_191_of59a_account").attr("disabled", false);
                $("#_192_of59a_name_address").attr("disabled", false);
                $("#_193_of59a_account").attr("disabled", true);
                $("#_194_of59a_identifier_code").attr("disabled", true);
                // Clear Option A
                $("#_193_of59a_account").val('');
                $("#_194_of59a_identifier_code").val('');
            } else if ($("#_190_of59a_beneficiary").val() == "a") {
                // Option A - BIC
                $("#div_of59no_beneficiary").hide();
                $("#div_of59a_beneficiary").show();
                $("#_191_of59a_account").attr("disabled", true);
                $("#_192_of59a_name_address").attr("disabled", true);
                $("#_193_of59a_account").attr("disabled", false);
                $("#_194_of59a_identifier_code").attr("disabled", false);
                // Clear No letter option
                $("#_191_of59a_account").val('');
                $("#_192_of59a_name_address").val('');
            } else {
                $("#div_of59no_beneficiary").hide();
                $("#div_of59a_beneficiary").hide();
                $("#_191_of59a_account").attr("disabled", true);
                $("#_192_of59a_name_address").attr("disabled", true);
                $("#_193_of59a_account").attr("disabled", true);
                $("#_194_of59a_identifier_code").attr("disabled", true);
            }
        });

        // ===== NETWORK VALIDATED RULES =====
        
        // Rule C1: Field 32B and 33B cannot both be present in Sequence B
        $("#_140_of32b_currency, #_141_of32b_amount, #_150_of33b_currency, #_151_of33b_amount").on('change blur', function() {
            validateRuleC1_SequenceB();
        });
        
        // Rule C1: Field 32B and 33B cannot both be present in Sequence C
        $("#_240_of32b_currency, #_241_of32b_amount, #_250_of33b_currency, #_251_of33b_amount").on('change blur', function() {
            validateRuleC1_SequenceC();
        });
        
        // Rule C2: If 23B is COND, then 35G must be present (Sequence B)
        $("#_160_of23b_expiry_type, #_180_of35g_expiry_conditions_event").on('change blur', function() {
            validateRuleC2_SequenceB();
        });
        
        // Rule C2: If 23B is COND, then 35G must be present (Sequence C)
        $("#_260_of23b_expiry_type, #_280_of35g_expiry_conditions_event").on('change blur', function() {
            validateRuleC2_SequenceC();
        });
        
        // Rule C3 & C6: Based on field 22A (Purpose of Message)
        $("#_040_mf22a_purpose_of_message").on('change', function() {
            validateRuleC3_C6();
        });
        
        // Rule C5: Field 23 only allowed if 22A is ACNA or ADVA
        $("#_040_mf22a_purpose_of_message, #_130_of23_advising_bank_reference").on('change blur', function() {
            validateRuleC5();
        });

        // ===== FUNCTION: Clear Sequence C =====
        function clearSequenceC() {
            $("#_240_of32b_currency").val('');
            $("#_241_of32b_amount").val('');
            $("#_250_of33b_currency").val('');
            $("#_251_of33b_amount").val('');
            $("#_260_of23b_expiry_type").val('');
            $("#_270_of31e_date_of_expiry").val('');
            $("#_280_of35g_expiry_conditions_event").val('');
            $("#_290_of59_beneficiary").val('');
            $("#_291_of59_name_address").val('');
            $("#_300_of77l_other_amandments_to_local_undertaking").val('');
            $("#_310_of24e_delivery_of_amendment_to_undertaking").val('');
            $("#_311_of24e_narrative").val('');
            $("#_320_of24g_delivery_to_collection_by").val('');
            $("#_320_of24g_narrative").val('');
        }

        // ===== VALIDATION FUNCTIONS =====
        
        function validateRuleC1_SequenceB() {
            var has32B = ($("#_140_of32b_currency").val() != '' || $("#_141_of32b_amount").val() != '');
            var has33B = ($("#_150_of33b_currency").val() != '' || $("#_151_of33b_amount").val() != '');
            
            if (has32B && has33B) {
                alert("Error C12: In Sequence B, field 32B and 33B cannot both be present. Please use only one.");
                $("#_140_of32b_currency, #_141_of32b_amount").css("background-color", "#ffe6e6");
                $("#_150_of33b_currency, #_151_of33b_amount").css("background-color", "#ffe6e6");
                return false;
            } else {
                $("#_140_of32b_currency, #_141_of32b_amount").css("background-color", "");
                $("#_150_of33b_currency, #_151_of33b_amount").css("background-color", "");
                return true;
            }
        }
        
        function validateRuleC1_SequenceC() {
            if (!$("#check_seq_C").is(":checked")) return true;
            
            var has32B = ($("#_240_of32b_currency").val() != '' || $("#_241_of32b_amount").val() != '');
            var has33B = ($("#_250_of33b_currency").val() != '' || $("#_251_of33b_amount").val() != '');
            
            if (has32B && has33B) {
                alert("Error C12: In Sequence C, field 32B and 33B cannot both be present. Please use only one.");
                $("#_240_of32b_currency, #_241_of32b_amount").css("background-color", "#ffe6e6");
                $("#_250_of33b_currency, #_251_of33b_amount").css("background-color", "");
                return false;
            } else {
                $("#_240_of32b_currency, #_241_of32b_amount").css("background-color", "");
                $("#_250_of33b_currency, #_251_of33b_amount").css("background-color", "");
                return true;
            }
        }
        
        function validateRuleC2_SequenceB() {
            var expiryType = $("#_160_of23b_expiry_type").val();
            var expiryCondition = $("#_180_of35g_expiry_conditions_event").val().trim();
            
            if (expiryType == "COND" && expiryCondition == '') {
                alert("Error E02: If field 23B is COND, then field 35G must be present in Sequence B.");
                $("#_180_of35g_expiry_conditions_event").css("background-color", "#ffe6e6");
                return false;
            } else if (expiryType != "COND" && expiryCondition != '') {
                alert("Error E02: Field 35G is only allowed when field 23B is COND in Sequence B.");
                $("#_180_of35g_expiry_conditions_event").css("background-color", "#ffe6e6");
                return false;
            } else {
                $("#_180_of35g_expiry_conditions_event").css("background-color", "");
                return true;
            }
        }
        
        function validateRuleC2_SequenceC() {
            if (!$("#check_seq_C").is(":checked")) return true;
            
            var expiryType = $("#_260_of23b_expiry_type").val();
            var expiryCondition = $("#_280_of35g_expiry_conditions_event").val().trim();
            
            if (expiryType == "COND" && expiryCondition == '') {
                alert("Error E02: If field 23B is COND, then field 35G must be present in Sequence C.");
                $("#_280_of35g_expiry_conditions_event").css("background-color", "#ffe6e6");
                return false;
            } else if (expiryType != "COND" && expiryCondition != '') {
                alert("Error E02: Field 35G is only allowed when field 23B is COND in Sequence C.");
                $("#_280_of35g_expiry_conditions_event").css("background-color", "#ffe6e6");
                return false;
            } else {
                $("#_280_of35g_expiry_conditions_event").css("background-color", "");
                return true;
            }
        }
        
        function validateRuleC3_C6() {
            var purpose = $("#_040_mf22a_purpose_of_message").val();
            
            // Rule C3: If 22A is ISCA or ICCA, Sequence C must be present
            if (purpose == "ISCA" || purpose == "ICCA") {
                if (!$("#check_seq_C").is(":checked")) {
                    alert("Error C19: When Purpose of Message is " + purpose + ", Sequence C must be present.");
                    $("#check_seq_C").css("outline", "2px solid red");
                    return false;
                } else {
                    $("#check_seq_C").css("outline", "");
                }
                
                // Rule C6: Fields 24E and 24G not allowed in Sequence B
                if ($("#_210_of24e_delivery_of_amendment_to_undertaking").val() != '' || 
                    $("#_220_of24g_delivery_to_collection_by").val() != '') {
                    alert("Error C19: When Purpose is " + purpose + ", fields 24E and 24G are not allowed in Sequence B.");
                    $("#_210_of24e_delivery_of_amendment_to_undertaking").css("background-color", "#ffe6e6");
                    $("#_220_of24g_delivery_to_collection_by").css("background-color", "#ffe6e6");
                    return false;
                } else {
                    $("#_210_of24e_delivery_of_amendment_to_undertaking").css("background-color", "");
                    $("#_220_of24g_delivery_to_collection_by").css("background-color", "");
                }
            } else {
                // If not ISCA/ICCA, Sequence C should not be present
                if ($("#check_seq_C").is(":checked")) {
                    alert("Error C19: Sequence C is only allowed when Purpose of Message is ISCA or ICCA.");
                    $("#check_seq_C").css("outline", "2px solid red");
                    return false;
                } else {
                    $("#check_seq_C").css("outline", "");
                }
            }
            
            return true;
        }
        
        function validateRuleC5() {
            var purpose = $("#_040_mf22a_purpose_of_message").val();
            var advisingRef = $("#_130_of23_advising_bank_reference").val().trim();
            
            if (advisingRef != '' && purpose != "ACNA" && purpose != "ADVA") {
                alert("Error C20: Field 23 (Advising Bank Reference) is only allowed when Purpose is ACNA or ADVA.");
                $("#_130_of23_advising_bank_reference").css("background-color", "#ffe6e6");
                return false;
            } else {
                $("#_130_of23_advising_bank_reference").css("background-color", "");
                return true;
            }
        }

    });
</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function () {
        
        // ===== RESTORE SAVED STATE ON PAGE LOAD =====
        
        // Check if Sequence C should be shown
        var hasSequenceCData = (
            $("#_240_of32b_currency").val() != '' || 
            $("#_241_of32b_amount").val() != '' ||
            $("#_250_of33b_currency").val() != '' ||
            $("#_251_of33b_amount").val() != '' ||
            $("#_260_of23b_expiry_type").val() != '' ||
            $("#_270_of31e_date_of_expiry").val() != '' ||
            $("#_280_of35g_expiry_conditions_event").val() != '' ||
            $("#_290_of59_beneficiary").val() != '' ||
            $("#_291_of59_name_address").val() != '' ||
            $("#_300_of77l_other_amandments_to_local_undertaking").val() != '' ||
            $("#_310_of24e_delivery_of_amendment_to_undertaking").val() != '' ||
            $("#_320_of24g_delivery_to_collection_by").val() != ''
        );
        
        if (hasSequenceCData) {
            $("#check_seq_C").prop("checked", true);
            $("#check_seq_c").show();
        } else {
            $("#check_seq_c").hide();
        }
        
        // Restore MF52a Issuer type
        if ($("#_121_mf52a_party_identifier").val() != "" || $("#_122_mf52a_identifier_code").val() != "") {
            $("#_120_mf52a_issuer").val("a").attr("selected", true);
            $("#div_mf52a_issuer").show();
            $("#div_mf52d_issuer").hide();
            $("#_121_mf52a_party_identifier").attr("disabled", false);
            $("#_122_mf52a_identifier_code").attr("disabled", false);
            $("#_123_mf52d_party_identifier").attr("disabled", true);
            $("#_124_mf52d_name_address").attr("disabled", true);
        } else if ($("#_123_mf52d_party_identifier").val() != "" || $("#_124_mf52d_name_address").val() != "") {
            $("#_120_mf52a_issuer").val("d").attr("selected", true);
            $("#div_mf52a_issuer").hide();
            $("#div_mf52d_issuer").show();
            $("#_121_mf52a_party_identifier").attr("disabled", true);
            $("#_122_mf52a_identifier_code").attr("disabled", true);
            $("#_123_mf52d_party_identifier").attr("disabled", false);
            $("#_124_mf52d_name_address").attr("disabled", false);
        } else {
            $("#div_mf52a_issuer").hide();
            $("#div_mf52d_issuer").hide();
            $("#_121_mf52a_party_identifier").attr("disabled", true);
            $("#_122_mf52a_identifier_code").attr("disabled", true);
            $("#_123_mf52d_party_identifier").attr("disabled", true);
            $("#_124_mf52d_name_address").attr("disabled", true);
        }

        // Restore OF59a Beneficiary type (Sequence B)
        if ($("#_191_of59a_account").val() != "" || $("#_192_of59a_name_address").val() != "") {
            $("#_190_of59a_beneficiary").val("no").attr("selected", true);
            $("#div_of59no_beneficiary").show();
            $("#div_of59a_beneficiary").hide();
            $("#_191_of59a_account").attr("disabled", false);
            $("#_192_of59a_name_address").attr("disabled", false);
            $("#_193_of59a_account").attr("disabled", true);
            $("#_194_of59a_identifier_code").attr("disabled", true);
        } else if ($("#_193_of59a_account").val() != "" || $("#_194_of59a_identifier_code").val() != "") {
            $("#_190_of59a_beneficiary").val("a").attr("selected", true);
            $("#div_of59no_beneficiary").hide();
            $("#div_of59a_beneficiary").show();
            $("#_191_of59a_account").attr("disabled", true);
            $("#_192_of59a_name_address").attr("disabled", true);
            $("#_193_of59a_account").attr("disabled", false);
            $("#_194_of59a_identifier_code").attr("disabled", false);
        } else {
            $("#div_of59no_beneficiary").hide();
            $("#div_of59a_beneficiary").hide();
            $("#_191_of59a_account").attr("disabled", true);
            $("#_192_of59a_name_address").attr("disabled", true);
            $("#_193_of59a_account").attr("disabled", true);
            $("#_194_of59a_identifier_code").attr("disabled", true);
        }

    });
</script>
