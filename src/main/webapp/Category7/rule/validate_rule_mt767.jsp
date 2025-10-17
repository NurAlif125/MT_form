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
                _020_mf27_number: "required",
                _021_mf27_total: "required",
                _030_mf21_related_reference: "required",
                _040_mf22a_purpose_of_message: "required",
                
                _090_mf20_undertaking_number: "required",
                _100_mf26e_number_of_amendment: "required",
                _110_mf30_date_of_amendment: "required",
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
                $('#tab-view1, #tab-view2, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7').removeClass("selected").removeAttr('class');
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
            if (isValid && validateMT767()) {
                alert("All inputs are valid!");
            } 
        });

        $("#submit_mt").click(function (e) {
            e.preventDefault();
            let isValid = $("#form_mt767").valid(); 
            if (isValid && validateMT767()) {  
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
        
        $("#check_seq_c").hide();
        $("#check_seq_C").click(function () {
            if ($("#check_seq_C").is(":checked")) {
                $("#check_seq_c").show();
            } else {
                $("#check_seq_c").hide();
                clearSequenceC();
            }
        });
        
        $("#div_mf52a_issuer").hide();
        $("#div_mf52d_issuer").hide();
        $("#_121_mf52a_party_identifier").attr("disabled", true);
        $("#_122_mf52a_identifier_code").attr("disabled", true);
        $("#_123_mf52d_party_identifier").attr("disabled", true);
        $("#_124_mf52d_name_address").attr("disabled", true);
        
        $("#_120_mf52a_issuer").change(function () {
            if ($("#_120_mf52a_issuer").val() == "a") {
                $("#div_mf52a_issuer").show();
                $("#div_mf52d_issuer").hide();
                $("#_121_mf52a_party_identifier").attr("disabled", false);
                $("#_122_mf52a_identifier_code").attr("disabled", false);
                $("#_123_mf52d_party_identifier").attr("disabled", true);
                $("#_124_mf52d_name_address").attr("disabled", true);
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

        $("#div_of59no_beneficiary").hide();
        $("#div_of59a_beneficiary").hide();
        $("#_191_of59a_account").attr("disabled", true);
        $("#_192_of59a_name_address").attr("disabled", true);
        $("#_193_of59a_account").attr("disabled", true);
        $("#_194_of59a_identifier_code").attr("disabled", true);
        
        $("#_190_of59a_beneficiary").change(function () {
            if ($("#_190_of59a_beneficiary").val() == "no") {
                $("#div_of59no_beneficiary").show();
                $("#div_of59a_beneficiary").hide();
                $("#_191_of59a_account").attr("disabled", false);
                $("#_192_of59a_name_address").attr("disabled", false);
                $("#_193_of59a_account").attr("disabled", true);
                $("#_194_of59a_identifier_code").attr("disabled", true);
                $("#_193_of59a_account").val('');
                $("#_194_of59a_identifier_code").val('');
            } else if ($("#_190_of59a_beneficiary").val() == "a") {
                $("#div_of59no_beneficiary").hide();
                $("#div_of59a_beneficiary").show();
                $("#_191_of59a_account").attr("disabled", true);
                $("#_192_of59a_name_address").attr("disabled", true);
                $("#_193_of59a_account").attr("disabled", false);
                $("#_194_of59a_identifier_code").attr("disabled", false);
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

        function clearSequenceC() {
            $('#_240_of32b_currency').val('');
            $('#_241_of32b_amount').val('');
            $('#_250_of33b_currency').val('');
            $('#_251_of33b_amount').val('');
            $('#_260_of23b_expiry_type').val('');
            $('#_270_of31e_date_of_expiry').val('');
            $('#_280_of35g_expiry_conditions_event').val('');
            $('#_290_of59_beneficiary').val('');
            $('#_291_of59_name_address').val('');
            $('#_300_of77l_other_amandments_to_local_undertaking').val('');
            $('#_310_of24e_delivery_of_amendment_to_undertaking').val('');
            $('#_311_of24e_narrative').val('');
            $('#_320_of24g_delivery_to_collection_by').val('');
            $('#_321_of24g_narrative').val('');
        }

        window.validateMT767 = function() {
            console.log('Starting MT 767 comprehensive validation...');
            
            $('.error-border').removeClass('error-border');
            $('.inline-error').remove();
            
            if (!validateMandatoryFields()) {
                console.log('Validation failed: Mandatory fields');
                return false;
            }
            
            if (!validateRuleC1()) {
                console.log('Validation failed: Rule C1');
                return false;
            }
            
            if (!validateRuleC2()) {
                console.log('Validation failed: Rule C2');
                return false;
            }
            
            if (!validateRuleC3()) {
                console.log('Validation failed: Rule C3');
                return false;
            }
            
            if (!validateRuleC4()) {
                console.log('Validation failed: Rule C4');
                return false;
            }
            
            if (!validateRuleC5()) {
                console.log('Validation failed: Rule C5');
                return false;
            }
            
            if (!validateRuleC6()) {
                console.log('Validation failed: Rule C6');
                return false;
            }
            
            if (!validateFieldFormats()) {
                console.log('Validation failed: Field formats');
                return false;
            }
            
            if (!validateConditionalFields()) {
                console.log('Validation failed: Conditional fields');
                return false;
            }
            
            console.log('MT 767 validation passed successfully!');
            return true;
        }

        function validateMandatoryFields() {
            var errors = [];
            
            var mf27_number = val('_020_mf27_number');
            var mf27_total = val('_021_mf27_total');
            var mf21_related_ref = val('_030_mf21_related_reference');
            var mf22a_purpose = val('_040_mf22a_purpose_of_message');
            
            if (isEmpty(mf27_number)) {
                errors.push('Field 27 (Number) is mandatory');
                $('#_020_mf27_number').addClass('error-border');
            }
            
            if (isEmpty(mf27_total)) {
                errors.push('Field 27 (Total) is mandatory');
                $('#_021_mf27_total').addClass('error-border');
            }
            
            if (isEmpty(mf21_related_ref)) {
                errors.push('Field 21 (Related Reference) is mandatory');
                $('#_030_mf21_related_reference').addClass('error-border');
            }
            
            if (isEmpty(mf22a_purpose)) {
                errors.push('Field 22A (Purpose of Message) is mandatory');
                $('#_040_mf22a_purpose_of_message').addClass('error-border');
            }
            
            var mf20_undertaking = val('_090_mf20_undertaking_number');
            var mf26e_amendment = val('_100_mf26e_number_of_amendment');
            var mf30_date = val('_110_mf30_date_of_amendment');
            var mf52a_issuer_type = val('_120_mf52a_issuer');
            
            if (isEmpty(mf20_undertaking)) {
                errors.push('Field 20 (Undertaking Number) is mandatory');
                $('#_090_mf20_undertaking_number').addClass('error-border');
            }
            
            if (isEmpty(mf26e_amendment)) {
                errors.push('Field 26E (Number of Amendment) is mandatory');
                $('#_100_mf26e_number_of_amendment').addClass('error-border');
            }
            
            if (isEmpty(mf30_date)) {
                errors.push('Field 30 (Date of Amendment) is mandatory');
                $('#_110_mf30_date_of_amendment').addClass('error-border');
            }
            
            if (isEmpty(mf52a_issuer_type)) {
                errors.push('Field 52a (Issuer) is mandatory');
                $('#_120_mf52a_issuer').addClass('error-border');
            } else {
                if (mf52a_issuer_type === 'a') {
                    var mf52a_bic = val('_122_mf52a_identifier_code');
                    if (isEmpty(mf52a_bic)) {
                        errors.push('Field 52a (Identifier Code) is mandatory when Option A is selected');
                        $('#_122_mf52a_identifier_code').addClass('error-border');
                    }
                } else if (mf52a_issuer_type === 'd') {
                    var mf52d_name = val('_124_mf52d_name_address');
                    if (isEmpty(mf52d_name)) {
                        errors.push('Field 52a (Name and Address) is mandatory when Option D is selected');
                        $('#_124_mf52d_name_address').addClass('error-border');
                    }
                }
            }
            
            if (errors.length > 0) {
                alert('Mandatory Field Validation Failed:\n\n' + errors.join('\n'));
                return false;
            }
            
            return true;
        }

        function validateRuleC1() {
            var amt32b_curr_B = val('_140_of32b_currency');
            var amt32b_amt_B = val('_141_of32b_amount');
            var amt33b_curr_B = val('_150_of33b_currency');
            var amt33b_amt_B = val('_151_of33b_amount');
            
            var has32B_B = !isEmpty(amt32b_curr_B) || !isEmpty(amt32b_amt_B);
            var has33B_B = !isEmpty(amt33b_curr_B) || !isEmpty(amt33b_amt_B);
            
            if (has32B_B && has33B_B) {
                alert('Error C12 (Rule C1): In Sequence B, either field 32B or field 33B may be present, but not both.\n\n' +
                      'You cannot have both Increase and Decrease of Undertaking Amount at the same time.');
                $('#_140_of32b_currency, #_141_of32b_amount').addClass('error-border');
                $('#_150_of33b_currency, #_151_of33b_amount').addClass('error-border');
                return false;
            }
            
            if (has32B_B) {
                if (isEmpty(amt32b_curr_B) || isEmpty(amt32b_amt_B)) {
                    alert('Error: Field 32B in Sequence B requires both Currency and Amount.');
                    if (isEmpty(amt32b_curr_B)) $('#_140_of32b_currency').addClass('error-border');
                    if (isEmpty(amt32b_amt_B)) $('#_141_of32b_amount').addClass('error-border');
                    return false;
                }
            }
            
            if (has33B_B) {
                if (isEmpty(amt33b_curr_B) || isEmpty(amt33b_amt_B)) {
                    alert('Error: Field 33B in Sequence B requires both Currency and Amount.');
                    if (isEmpty(amt33b_curr_B)) $('#_150_of33b_currency').addClass('error-border');
                    if (isEmpty(amt33b_amt_B)) $('#_151_of33b_amount').addClass('error-border');
                    return false;
                }
            }
            
            if ($('#check_seq_c').is(':visible')) {
                var amt32b_curr_C = val('_240_of32b_currency');
                var amt32b_amt_C = val('_241_of32b_amount');
                var amt33b_curr_C = val('_250_of33b_currency');
                var amt33b_amt_C = val('_251_of33b_amount');
                
                var has32B_C = !isEmpty(amt32b_curr_C) || !isEmpty(amt32b_amt_C);
                var has33B_C = !isEmpty(amt33b_curr_C) || !isEmpty(amt33b_amt_C);
                
                if (has32B_C && has33B_C) {
                    alert('Error C12 (Rule C1): In Sequence C, either field 32B or field 33B may be present, but not both.\n\n' +
                          'You cannot have both Increase and Decrease of Local Undertaking Amount at the same time.');
                    $('#_240_of32b_currency, #_241_of32b_amount').addClass('error-border');
                    $('#_250_of33b_currency, #_251_of33b_amount').addClass('error-border');
                    return false;
                }
                
                if (has32B_C) {
                    if (isEmpty(amt32b_curr_C) || isEmpty(amt32b_amt_C)) {
                        alert('Error: Field 32B in Sequence C requires both Currency and Amount.');
                        if (isEmpty(amt32b_curr_C)) $('#_240_of32b_currency').addClass('error-border');
                        if (isEmpty(amt32b_amt_C)) $('#_241_of32b_amount').addClass('error-border');
                        return false;
                    }
                }
                
                if (has33B_C) {
                    if (isEmpty(amt33b_curr_C) || isEmpty(amt33b_amt_C)) {
                        alert('Error: Field 33B in Sequence C requires both Currency and Amount.');
                        if (isEmpty(amt33b_curr_C)) $('#_250_of33b_currency').addClass('error-border');
                        if (isEmpty(amt33b_amt_C)) $('#_251_of33b_amount').addClass('error-border');
                        return false;
                    }
                }
            }
            
            return true;
        }

        function validateRuleC2() {
            var expType_B = val('_160_of23b_expiry_type');
            var expCond_B = val('_180_of35g_expiry_conditions_event');
            
            if (!isEmpty(expType_B)) {
                if (expType_B === 'COND' && isEmpty(expCond_B)) {
                    alert('Error E02 (Rule C2): In Sequence B, when field 23B is COND, field 35G (Expiry Condition/Event) must be present.');
                    $('#_180_of35g_expiry_conditions_event').addClass('error-border');
                    return false;
                }
                
                if (expType_B !== 'COND' && !isEmpty(expCond_B)) {
                    alert('Error E02 (Rule C2): In Sequence B, field 35G is only allowed when field 23B is COND.\n\n' +
                          'Current 23B value: ' + expType_B + '\n' +
                          'Please remove the content from field 35G or change 23B to COND.');
                    $('#_180_of35g_expiry_conditions_event').addClass('error-border');
                    return false;
                }
            }
            
            if ($('#check_seq_c').is(':visible')) {
                var expType_C = val('_260_of23b_expiry_type');
                var expCond_C = val('_280_of35g_expiry_conditions_event');
                
                if (!isEmpty(expType_C)) {
                    if (expType_C === 'COND' && isEmpty(expCond_C)) {
                        alert('Error E02 (Rule C2): In Sequence C, when field 23B is COND, field 35G (Expiry Condition/Event) must be present.');
                        $('#_280_of35g_expiry_conditions_event').addClass('error-border');
                        return false;
                    }
                    
                    if (expType_C !== 'COND' && !isEmpty(expCond_C)) {
                        alert('Error E02 (Rule C2): In Sequence C, field 35G is only allowed when field 23B is COND.\n\n' +
                              'Current 23B value: ' + expType_C + '\n' +
                              'Please remove the content from field 35G or change 23B to COND.');
                        $('#_280_of35g_expiry_conditions_event').addClass('error-border');
                        return false;
                    }
                }
            }
            
            return true;
        }

        function validateRuleC3() {
            var purpose = val('_040_mf22a_purpose_of_message');
            var seqC_hasData = checkSequenceCHasData();
            
            if (purpose === 'ISCA' || purpose === 'ICCA') {
                if (!seqC_hasData) {
                    alert('Error C19 (Rule C3): When Purpose of Message (22A) is ISCA or ICCA, Sequence C (Local Undertaking Details) must be present.\n\n' +
                          'Please fill in at least one field in Sequence C.');
                    $('#_040_mf22a_purpose_of_message').addClass('error-border');
                    return false;
                }
            } else {
                if (seqC_hasData) {
                    alert('Error C19 (Rule C3): Sequence C (Local Undertaking Details) is only allowed when Purpose of Message (22A) is ISCA or ICCA.\n\n' +
                          'Current Purpose: ' + purpose + '\n' +
                          'Please clear all fields in Sequence C or change the Purpose to ISCA/ICCA.');
                    $('#_040_mf22a_purpose_of_message').addClass('error-border');
                    return false;
                }
            }
            
            return true;
        }

        function validateRuleC4() {
            if ($('#check_seq_c').is(':visible')) {
                var purpose = val('_040_mf22a_purpose_of_message');
                if (purpose === 'ISCA' || purpose === 'ICCA') {
                    var seqC_hasData = checkSequenceCHasData();
                    if (!seqC_hasData) {
                        alert('Error C98 (Rule C4): Sequence C is present but empty.\n\n' +
                              'When Sequence C is present, at least one field must be filled.');
                        return false;
                    }
                }
            }
            
            return true;
        }

        function validateRuleC5() {
            var purpose = val('_040_mf22a_purpose_of_message');
            var advisingBankRef = val('_130_of23_advising_bank_reference');
            
            if (!isEmpty(advisingBankRef)) {
                if (purpose !== 'ACNA' && purpose !== 'ADVA') {
                    alert('Error C20 (Rule C5): Field 23 (Advising Bank Reference) is only allowed when Purpose of Message (22A) is ACNA or ADVA.\n\n' +
                          'Current Purpose: ' + purpose + '\n' +
                          'Please remove the Advising Bank Reference or change the Purpose to ACNA/ADVA.');
                    $('#_130_of23_advising_bank_reference').addClass('error-border');
                    $('#_040_mf22a_purpose_of_message').addClass('error-border');
                    return false;
                }
            }
            
            return true;
        }

        function validateRuleC6() {
            var purpose = val('_040_mf22a_purpose_of_message');
            var field24E_B = val('_210_of24e_delivery_of_amendment_to_undertaking');
            var field24G_B = val('_220_of24g_delivery_to_collection_by');
            
            if (purpose === 'ISCA' || purpose === 'ICCA') {
                if (!isEmpty(field24E_B) || !isEmpty(field24G_B)) {
                    alert('Error C19 (Rule C6): When Purpose of Message (22A) is ISCA or ICCA, fields 24E and 24G are not allowed in Sequence B.\n\n' +
                          'Please clear the following fields:\n' +
                          '- Field 24E: Delivery of Amendment To Undertaking\n' +
                          '- Field 24G: Delivery To/Collection By');
                    if (!isEmpty(field24E_B)) $('#_210_of24e_delivery_of_amendment_to_undertaking').addClass('error-border');
                    if (!isEmpty(field24G_B)) $('#_220_of24g_delivery_to_collection_by').addClass('error-border');
                    $('#_040_mf22a_purpose_of_message').addClass('error-border');
                    return false;
                }
            }
            
            return true;
        }

        function checkSequenceCHasData() {
            var fields = [
                '_240_of32b_currency', '_241_of32b_amount',
                '_250_of33b_currency', '_251_of33b_amount',
                '_260_of23b_expiry_type', '_270_of31e_date_of_expiry',
                '_280_of35g_expiry_conditions_event',
                '_290_of59_beneficiary', '_291_of59_name_address',
                '_300_of77l_other_amandments_to_local_undertaking',
                '_310_of24e_delivery_of_amendment_to_undertaking', '_311_of24e_narrative',
                '_320_of24g_delivery_to_collection_by', '_321_of24g_narrative'
            ];
            
            for (var i = 0; i < fields.length; i++) {
                if (!isEmpty(val(fields[i]))) {
                    return true;
                }
            }
            
            return false;
        }

        function validateFieldFormats() {
            var number = val('_020_mf27_number');
            var total = val('_021_mf27_total');
            
            if (parseInt(number) !== 1) {
                alert('Error T75: Field 27 Number must be 1.');
                $('#_020_mf27_number').addClass('error-border');
                return false;
            }
            
            var totalInt = parseInt(total);
            if (totalInt < 1 || totalInt > 8) {
                alert('Error T75: Field 27 Total must be between 1 and 8.');
                $('#_021_mf27_total').addClass('error-border');
                return false;
            }
            
            var relatedRef = val('_030_mf21_related_reference');
            if (!isEmpty(relatedRef)) {
                if (relatedRef.startsWith('/') || relatedRef.endsWith('/') || relatedRef.indexOf('//') !== -1) {
                    alert('Error T26: Field 21 (Related Reference) must not start or end with "/" and must not contain "//".');
                    $('#_030_mf21_related_reference').addClass('error-border');
                    return false;
                }
            }
            
            var undertakingNumber = val('_090_mf20_undertaking_number');
            if (!isEmpty(undertakingNumber)) {
                if (undertakingNumber.startsWith('/') || undertakingNumber.endsWith('/') || undertakingNumber.indexOf('//') !== -1) {
                    alert('Error T26: Field 20 (Undertaking Number) must not start or end with "/" and must not contain "//".');
                    $('#_090_mf20_undertaking_number').addClass('error-border');
                    return false;
                }
            }
            
            var dateFields = [
                { id: '_110_mf30_date_of_amendment', name: 'Date of Amendment' },
                { id: '_170_of31e_date_of_expiry', name: 'Date of Expiry (Seq B)' },
                { id: '_270_of31e_date_of_expiry', name: 'Date of Expiry (Seq C)' }
            ];
            
            for (var i = 0; i < dateFields.length; i++) {
                var dateValue = val(dateFields[i].id);
                if (!isEmpty(dateValue)) {
                    if (!/^\d{6}$/.test(dateValue)) {
                        alert('Error T50: ' + dateFields[i].name + ' must be in YYMMDD format (6 digits).');
                        $('#' + dateFields[i].id).addClass('error-border');
                        return false;
                    }
                    
                    var mm = parseInt(dateValue.substr(2, 2));
                    var dd = parseInt(dateValue.substr(4, 2));
                    
                    if (mm < 1 || mm > 12) {
                        alert('Error T50: ' + dateFields[i].name + ' has invalid month (must be 01-12).');
                        $('#' + dateFields[i].id).addClass('error-border');
                        return false;
                    }
                    
                    if (dd < 1 || dd > 31) {
                        alert('Error T50: ' + dateFields[i].name + ' has invalid day (must be 01-31).');
                        $('#' + dateFields[i].id).addClass('error-border');
                        return false;
                    }
                    
                    if (mm === 2 && dd > 29) {
                        alert('Error T50: ' + dateFields[i].name + ' - February cannot have more than 29 days.');
                        $('#' + dateFields[i].id).addClass('error-border');
                        return false;
                    }
                    
                    if ([4, 6, 9, 11].indexOf(mm) !== -1 && dd > 30) {
                        alert('Error T50: ' + dateFields[i].name + ' - This month cannot have more than 30 days.');
                        $('#' + dateFields[i].id).addClass('error-border');
                        return false;
                    }
                }
            }
            
            var issuerType = val('_120_mf52a_issuer');
            if (issuerType === 'a') {
                var issuerBIC = val('_122_mf52a_identifier_code');
                if (!isEmpty(issuerBIC)) {
                    if (!validateBICFormat(issuerBIC)) {
                        alert('Error T27/T28/T29: Field 52a (Issuer BIC) has invalid format.\n\n' +
                              'BIC must be 8 or 11 characters: 6 letters + 2 alphanumeric + optional 3 alphanumeric.');
                        $('#_122_mf52a_identifier_code').addClass('error-border');
                        return false;
                    }
                }
            }
            
            var beneficiaryType = val('_190_of59a_beneficiary');
            if (beneficiaryType === 'a') {
                var beneficiaryBIC = val('_194_of59a_identifier_code');
                if (!isEmpty(beneficiaryBIC)) {
                    if (!validateBICFormat(beneficiaryBIC)) {
                        alert('Error T27/T28/T29: Field 59a (Beneficiary BIC) has invalid format.\n\n' +
                              'BIC must be 8 or 11 characters: 6 letters + 2 alphanumeric + optional 3 alphanumeric.');
                        $('#_194_of59a_identifier_code').addClass('error-border');
                        return false;
                    }
                }
            }
            
            var currencyFields = [
                { id: '_140_of32b_currency', name: 'Field 32B Currency (Seq B)' },
                { id: '_150_of33b_currency', name: 'Field 33B Currency (Seq B)' },
                { id: '_240_of32b_currency', name: 'Field 32B Currency (Seq C)' },
                { id: '_250_of33b_currency', name: 'Field 33B Currency (Seq C)' }
            ];
            
            for (var i = 0; i < currencyFields.length; i++) {
                var currValue = val(currencyFields[i].id);
                if (!isEmpty(currValue)) {
                    if (!/^[A-Z]{3}$/.test(currValue)) {
                        alert('Error T52: ' + currencyFields[i].name + ' must be a valid 3-letter ISO 4217 currency code.');
                        $('#' + currencyFields[i].id).addClass('error-border');
                        return false;
                    }
                }
            }
            
            var amountFields = [
                { id: '_141_of32b_amount', name: 'Field 32B Amount (Seq B)' },
                { id: '_151_of33b_amount', name: 'Field 33B Amount (Seq B)' },
                { id: '_241_of32b_amount', name: 'Field 32B Amount (Seq C)' },
                { id: '_251_of33b_amount', name: 'Field 33B Amount (Seq C)' }
            ];
            
            for (var i = 0; i < amountFields.length; i++) {
                var amtValue = val(amountFields[i].id);
                if (!isEmpty(amtValue)) {
                    if (amtValue.indexOf(',') === -1) {
                        alert('Error T40/T43: ' + amountFields[i].name + ' must contain a comma "," as decimal separator.');
                        $('#' + amountFields[i].id).addClass('error-border');
                        return false;
                    }
                    
                    var numValue = parseFloat(amtValue.replace(',', '.'));
                    if (numValue === 0) {
                        alert('Error: ' + amountFields[i].name + ' must not be zero.');
                        $('#' + amountFields[i].id).addClass('error-border');
                        return false;
                    }
                }
            }
            
            var field77U = val('_200_of77u_other_amandments_to_undertaking');
            if (!isEmpty(field77U)) {
                if (field77U.length > 9750) {
                    alert('Error: Field 77U exceeds maximum length of 9750 characters.\n\nCurrent: ' + field77U.length + ' characters');
                    $('#_200_of77u_other_amandments_to_undertaking').addClass('error-border');
                    return false;
                }
                
                var lines77U = field77U.split('\n');
                if (lines77U.length > 150) {
                    alert('Error: Field 77U exceeds maximum of 150 lines.\n\nCurrent: ' + lines77U.length + ' lines');
                    $('#_200_of77u_other_amandments_to_undertaking').addClass('error-border');
                    return false;
                }
                
                for (var i = 0; i < lines77U.length; i++) {
                    if (lines77U[i].length > 65) {
                        alert('Error: Field 77U Line ' + (i + 1) + ' exceeds 65 characters.\n\nLine has ' + lines77U[i].length + ' characters.');
                        $('#_200_of77u_other_amandments_to_undertaking').addClass('error-border');
                        return false;
                    }
                }
            }
            
            var field77L = val('_300_of77l_other_amandments_to_local_undertaking');
            if (!isEmpty(field77L)) {
                if (field77L.length > 9750) {
                    alert('Error: Field 77L exceeds maximum length of 9750 characters.\n\nCurrent: ' + field77L.length + ' characters');
                    $('#_300_of77l_other_amandments_to_local_undertaking').addClass('error-border');
                    return false;
                }
                
                var lines77L = field77L.split('\n');
                if (lines77L.length > 150) {
                    alert('Error: Field 77L exceeds maximum of 150 lines.\n\nCurrent: ' + lines77L.length + ' lines');
                    $('#_300_of77l_other_amandments_to_local_undertaking').addClass('error-border');
                    return false;
                }
                
                for (var i = 0; i < lines77L.length; i++) {
                    if (lines77L[i].length > 65) {
                        alert('Error: Field 77L Line ' + (i + 1) + ' exceeds 65 characters.\n\nLine has ' + lines77L[i].length + ' characters.');
                        $('#_300_of77l_other_amandments_to_local_undertaking').addClass('error-border');
                        return false;
                    }
                }
            }
            
            return true;
        }

        function validateConditionalFields() {
            var fileIdCode = val('_070_of23x_file_identification');
            var fileIdRef = val('_071_of23x_file_name_or_reference');
            
            if (!isEmpty(fileIdCode)) {
                if (fileIdCode === 'COUR' || fileIdCode === 'OTHR') {
                    if (!isEmpty(fileIdRef) && fileIdRef.length > 65) {
                        alert('Error: Field 23X File Name/Reference exceeds 65 characters.');
                        $('#_071_of23x_file_name_or_reference').addClass('error-border');
                        return false;
                    }
                } else {
                    if (!isEmpty(fileIdRef)) {
                        alert('Error D97: Field 23X File Name/Reference is only allowed when Code is COUR or OTHR.');
                        $('#_071_of23x_file_name_or_reference').addClass('error-border');
                        return false;
                    }
                }
            }
            
            var del24E_B = val('_210_of24e_delivery_of_amendment_to_undertaking');
            var del24E_add_B = val('_211_of24e_narrative');
            
            if (!isEmpty(del24E_B)) {
                if (del24E_B === 'COUR' || del24E_B === 'OTHR') {
                    if (!isEmpty(del24E_add_B) && del24E_add_B.length > 35) {
                        alert('Error: Field 24E Additional Information (Seq B) exceeds 35 characters.');
                        $('#_211_of24e_narrative').addClass('error-border');
                        return false;
                    }
                } else {
                    if (!isEmpty(del24E_add_B)) {
                        alert('Error D97: Field 24E Additional Information (Seq B) is only allowed when Code is COUR or OTHR.');
                        $('#_211_of24e_narrative').addClass('error-border');
                        return false;
                    }
                }
            }
            
            var del24G_B = val('_220_of24g_delivery_to_collection_by');
            var del24G_narr_B = val('_221_of24g_narrative');
            
            if (!isEmpty(del24G_B)) {
                if (del24G_B === 'OTHR') {
                    if (isEmpty(del24G_narr_B)) {
                        alert('Error D97: When Field 24G Code (Seq B) is OTHR, Name and Address must be specified in Narrative.');
                        $('#_221_of24g_narrative').addClass('error-border');
                        return false;
                    }
                } else if (del24G_B === 'BENE') {
                    if (!isEmpty(del24G_narr_B)) {
                        alert('Error: Field 24G Narrative (Seq B) should only be used when Code is OTHR.');
                        $('#_221_of24g_narrative').addClass('error-border');
                        return false;
                    }
                }
            }
            
            if ($('#check_seq_c').is(':visible')) {
                var del24E_C = val('_310_of24e_delivery_of_amendment_to_undertaking');
                var del24E_add_C = val('_311_of24e_narrative');
                
                if (!isEmpty(del24E_C)) {
                    if (del24E_C === 'COUR' || del24E_C === 'OTHR') {
                        if (!isEmpty(del24E_add_C) && del24E_add_C.length > 35) {
                            alert('Error: Field 24E Additional Information (Seq C) exceeds 35 characters.');
                            $('#_311_of24e_narrative').addClass('error-border');
                            return false;
                        }
                    } else {
                        if (!isEmpty(del24E_add_C)) {
                            alert('Error D97: Field 24E Additional Information (Seq C) is only allowed when Code is COUR or OTHR.');
                            $('#_311_of24e_narrative').addClass('error-border');
                            return false;
                        }
                    }
                }
                
                var del24G_C = val('_320_of24g_delivery_to_collection_by');
                var del24G_narr_C = val('_321_of24g_narrative');
                
                if (!isEmpty(del24G_C)) {
                    if (del24G_C === 'OTHR') {
                        if (isEmpty(del24G_narr_C)) {
                            alert('Error D97: When Field 24G Code (Seq C) is OTHR, Name and Address must be specified in Narrative.');
                            $('#_321_of24g_narrative').addClass('error-border');
                            return false;
                        }
                    } else if (del24G_C === 'BENE') {
                        if (!isEmpty(del24G_narr_C)) {
                            alert('Error: Field 24G Narrative (Seq C) should only be used when Code is OTHR.');
                            $('#_321_of24g_narrative').addClass('error-border');
                            return false;
                        }
                    }
                }
            }
            
            return true;
        }

        function validateBICFormat(bicCode) {
            if (!bicCode) return true;
            
            bicCode = bicCode.trim().toUpperCase();
            
            if (bicCode.length !== 8 && bicCode.length !== 11) {
                return false;
            }
            
            var bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
            return bicPattern.test(bicCode);
        }

        function val(id) { 
            var el = document.getElementById(id); 
            return el ? (el.value || "").trim() : ""; 
        }

        function isEmpty(v) { 
            return !v || v.trim() === ""; 
        }

    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        
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

        var hasSeqCData = false;
        var seqCFields = [
            '_240_of32b_currency', '_241_of32b_amount',
            '_250_of33b_currency', '_251_of33b_amount',
            '_260_of23b_expiry_type', '_270_of31e_date_of_expiry',
            '_280_of35g_expiry_conditions_event',
            '_290_of59_beneficiary', '_291_of59_name_address',
            '_300_of77l_other_amandments_to_local_undertaking',
            '_310_of24e_delivery_of_amendment_to_undertaking', '_311_of24e_narrative',
            '_320_of24g_delivery_to_collection_by', '_321_of24g_narrative'
        ];
        
        for (var i = 0; i < seqCFields.length; i++) {
            if ($("#" + seqCFields[i]).val() != "") {
                hasSeqCData = true;
                break;
            }
        }
        
        if (hasSeqCData) {
            $("#check_seq_C").prop("checked", true);
            $("#check_seq_c").show();
        } else {
            $("#check_seq_C").prop("checked", false);
            $("#check_seq_c").hide();
        }

    });
</script>