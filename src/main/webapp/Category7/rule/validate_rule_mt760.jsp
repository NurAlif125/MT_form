<%-- 
    Document   : validate_rule_mt760
    Created on : Oct 1, 2025, 1:05:57 PM
    Author     : mslam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(document).ready(function () {

        function updateConditionalRequirements() {
            const expiryTypeB = $('#_110_mf23b_expiry_type').val();
            if (expiryTypeB === 'FIXD') {
                $('#_120_of31e_date_of_expiry').addClass('mandatory');
            } else if (expiryTypeB === 'COND') {
                $('#_120_of31e_date_of_expiry').removeClass('mandatory');
            } else if (expiryTypeB === 'OPEN') {
                $('#_120_of31e_date_of_expiry').removeClass('mandatory');
            }

            if (expiryTypeB === 'COND') {
                $('#_130_of35g_expiry_condition_event').addClass('mandatory');
            } else {
                $('#_130_of35g_expiry_condition_event').removeClass('mandatory');
            }

            if (expiryTypeB === 'OPEN') {
                $('#_300_of23f_automatic_extension_period').val('').prop('disabled', true);
            } else {
                $('#_300_of23f_automatic_extension_period').prop('disabled', false);
            }

            const autoExtPeriod = $('#_300_of23f_automatic_extension_period').val();
            if (!autoExtPeriod || autoExtPeriod === '') {
                $('#_310_of78_automatic_extension_non_extension_notification').val('').prop('disabled', true);
                $('#_320_of26e_automatic_extension_notification_period').val('').prop('disabled', true);
                $('#_330_of31s_automatic_extension_final_expiry_date').val('').prop('disabled', true);
            } else {
                $('#_310_of78_automatic_extension_non_extension_notification').prop('disabled', false);
                $('#_320_of26e_automatic_extension_notification_period').prop('disabled', false);
                $('#_330_of31s_automatic_extension_final_expiry_date').prop('disabled', false);
            }

            const purposeMsg = $('#_030_mf22a_purpose_of_message').val();
            if (purposeMsg === 'ISSU') {
                $('#_140_of50_applicant').addClass('mandatory');
            } else {
                $('#_140_of50_applicant').removeClass('mandatory');
            }

            const formUndertaking = $('#_090_mf22d_form_of_undertaking').val();
            if (purposeMsg === 'ISSU' && formUndertaking === 'STBY') {
                $('#_270_of49_confirmation_instructions').addClass('mandatory');
            } else {
                $('#_270_of49_confirmation_instructions').removeClass('mandatory');
            }

            if (formUndertaking === 'DGAR') {
                $('#_270_of49_confirmation_instructions').val('').prop('disabled', true);
            } else {
                $('#_270_of49_confirmation_instructions').prop('disabled', false);
            }

            if (purposeMsg === 'ISCO' || purposeMsg === 'ICCO') {
                $('#seq_C_checkbox').prop('checked', true);
                $('#check_seq_c').show();
                // Fields not allowed in Sequence B
                $('#_350_of48d_transfer_indicator').val('').prop('disabled', true);
                $('#_380_of24e_delivery_of_original_undertaking').val('').prop('disabled', true);
                $('#_390_of24g_delivery_to_collection_by').val('').prop('disabled', true);
            } else {
                $('#_350_of48d_transfer_indicator').prop('disabled', false);
                $('#_380_of24e_delivery_of_original_undertaking').prop('disabled', false);
                $('#_390_of24g_delivery_to_collection_by').prop('disabled', false);
            }

            const confirmInstr = $('#_270_of49_confirmation_instructions').val();
            if (confirmInstr === 'CONFIRM' || confirmInstr === 'MAY ADD') {
                $('#_280_of58a_requested_confirmation_party').addClass('mandatory');
            } else {
                $('#_280_of58a_requested_confirmation_party').removeClass('mandatory').val('');
            }

            const standardWording = $('#_590_of22y_standard_wording_required').val();
            if (standardWording === 'STND') {
                $('#_440_of22k_type_of_undertaking').addClass('mandatory');
            } else {
                $('#_440_of22k_type_of_undertaking').removeClass('mandatory');
            }

            if (formUndertaking === 'DGAR') {
                $('#_230_of41a_available_with').val('').prop('disabled', true);
            } else {
                $('#_230_of41a_available_with').prop('disabled', false);
            }

            const expiryTypeC = $('#_450_mf23b_expiry_type').val();
            if (expiryTypeC === 'FIXD') {
                $('#_460_of31e_date_of_expiry').addClass('mandatory');
            } else if (expiryTypeC === 'COND') {
                $('#_460_of31e_date_of_expiry').removeClass('mandatory');
                $('#_470_of35G_expiry_condition_events').addClass('mandatory');
            } else {
                $('#_460_of31e_date_of_expiry').removeClass('mandatory');
                $('#_470_of35G_expiry_condition_events').removeClass('mandatory');
            }

            if (purposeMsg === 'ISSU') {
                $('#_370_of45l_underlying_transaction_details').addClass('mandatory');
            } else {
                $('#_370_of45l_underlying_transaction_details').removeClass('mandatory');
            }
        }

        let validator = $("#form_mt760").validate({
            ignore: [],
            onkeyup: false,
            onfocusout: false,
            rules: {
                _010_mf15a_new_sequence: "required",
                _020_mf27_number: "required",
                _021_mf27_total: "required",
                _030_mf22a_purpose_of_message: "required",

                _060_mf15b_new_sequence: "required",
                _070_mf20_undertaking_number: "required",
                _080_mf30_date_of_issue: "required",
                _090_mf22d_form_of_undertaking: "required",
                _100_mf40c_applicable_rules: "required",
                _110_mf23b_expiry_type: "required",
                
                _160_mf52a_issuer: "required",
                _162_mf52a_identifier_code: {
                    required: function() {
                        return $('#_160_mf52a_issuer').val() === 'a';
                    }
                },
                _164_mf52d_name_address: {
                    required: function() {
                        return $('#_160_mf52a_issuer').val() === 'd';
                    }
                },

                _170_mf59a_beneficiary: "required",
                _172_mf59a_name_address: {
                    required: function() {
                        return $('#_170_mf59a_beneficiary').val() === 'no';
                    }
                },
                _174_mf59a_identifier_code: {
                    required: function() {
                        return $('#_170_mf59a_beneficiary').val() === 'a';
                    }
                },

                _210_mf32b_currency: "required",
                _211_mf32b_amount: "required",

                _260_mf77u_undertaking_terms_and_conditions: "required",

                _400_mf15c_new_sequence: {
                    required: function() {
                        return $('#seq_C_checkbox').is(':checked');
                    }
                },
                _420_mf22d_form_of_undertaking: {
                    required: function() {
                        return $('#seq_C_checkbox').is(':checked');
                    }
                },
                _430_mf40c_applicable_rules: {
                    required: function() {
                        return $('#seq_C_checkbox').is(':checked');
                    }
                },
                _450_mf23b_expiry_type: {
                    required: function() {
                        return $('#seq_C_checkbox').is(':checked');
                    }
                },
                _480_of50_applicant: {
                    required: function() {
                        return $('#seq_C_checkbox').is(':checked');
                    }
                },
                _511_mf59_name_address: {
                    required: function() {
                        return $('#seq_C_checkbox').is(':checked');
                    }
                },
                _520_mf32b_currency: {
                    required: function() {
                        return $('#seq_C_checkbox').is(':checked');
                    }
                },
                _521_mf32b_amount: {
                    required: function() {
                        return $('#seq_C_checkbox').is(':checked');
                    }
                },
                _690_mf45l_underlying_transaction_details: {
                    required: function() {
                        return $('#seq_C_checkbox').is(':checked');
                    }
                }
            },
            messages: {
                _010_mf15a_new_sequence: {required: "MF15A New Sequence must be filled"},
                _020_mf27_number: {required: "MF27 Number must be filled"},
                _021_mf27_total: {required: "MF27 Total must be filled"},
                _030_mf22a_purpose_of_message: {required: "MF22A Purpose of Message must be filled"},
                _060_mf15b_new_sequence: {required: "MF15B New Sequence must be filled"},
                _070_mf20_undertaking_number: {required: "MF20 Undertaking Number must be filled"},
                _080_mf30_date_of_issue: {required: "MF30 Date of Issue must be filled"},
                _090_mf22d_form_of_undertaking: {required: "MF22D Form of Undertaking must be filled"},
                _100_mf40c_applicable_rules: {required: "MF40C Applicable Rules must be filled"},
                _110_mf23b_expiry_type: {required: "MF23B Expiry Type must be filled"},
                _160_mf52a_issuer: {required: "MF52a Issuer type must be selected"},
                _162_mf52a_identifier_code: {required: "MF52a Identifier Code must be filled"},
                _164_mf52d_name_address: {required: "MF52d Name and Address must be filled"},
                _170_mf59a_beneficiary: {required: "MF59a Beneficiary type must be selected"},
                _172_mf59a_name_address: {required: "MF59a Name and Address must be filled"},
                _174_mf59a_identifier_code: {required: "MF59a Identifier Code must be filled"},
                _210_mf32b_currency: {required: "MF32B Currency must be filled"},
                _211_mf32b_amount: {required: "MF32B Amount must be filled"},
                _260_mf77u_undertaking_terms_and_conditions: {required: "MF77U Undertaking Terms and Conditions must be filled"}
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                $("#tab-validate").removeAttr("hidden");
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
                
                $("#tab-validate").removeAttr("hidden");
                 
                // Switch to validation tab
                $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
                $("#view8").css("display", "block");
                $('[id^="tab-view"]').removeClass("selected");
                $('#tab-validate').addClass("selected");

                let errorContainer = document.getElementById("error-container");
                
                if (errorList.length === 0) {
                    errorContainer.innerHTML = ""; 
                    return;
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
                        let inputId = this.getAttribute("data-input-id");
                        let tabContentGroup = this.getAttribute("content-body");
                        
                        let input = document.getElementById(inputId);
                        if (input) {
                            if(tabContentGroup == "Header") {
                                $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $("#view1").css("display", "block");
                                $('[id^="tab-view"]').removeClass("selected");
                                $('#tab-view1').addClass("selected");
                            } else if (tabContentGroup == "Body") {
                                $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $("#view2").css("display", "block");
                                $('[id^="tab-view"]').removeClass("selected");
                                $('#tab-view2').addClass("selected");
                            }
                            input.focus();
                        }
                    });
                });
            }
        });

        // Event listeners for conditional field updates
        $('#_030_mf22a_purpose_of_message').change(updateConditionalRequirements);
        $('#_090_mf22d_form_of_undertaking').change(updateConditionalRequirements);
        $('#_110_mf23b_expiry_type').change(updateConditionalRequirements);
        $('#_270_of49_confirmation_instructions').change(updateConditionalRequirements);
        $('#_300_of23f_automatic_extension_period').change(updateConditionalRequirements);
        $('#_450_mf23b_expiry_type').change(updateConditionalRequirements);
        $('#_590_of22y_standard_wording_required').change(updateConditionalRequirements);
        
        updateConditionalRequirements();

        $("#btn-validate").click(function () {
            updateConditionalRequirements();
            let isValid = $("#form_mt760").valid();
            if (isValid) {
                alert("All inputs are valid!");
            }
        });

        $("#submit_mt760").click(function (e) {
            e.preventDefault();
            updateConditionalRequirements();
            let isValid = $("#form_mt760").valid();
            if (isValid && confirm('Do you want to save this MT760 data?')) {
                $("#form_mt760").submit();
            } else if (!isValid) {
                alert("There are still errors! Please fix them before saving.");
            }
        });

        // Field-specific validations
        $('#_100_mf40c_applicable_rules, #_430_mf40c_applicable_rules').change(function() {
            const val = $(this).val();
            const narrativeId = $(this).attr('id').replace('applicable_rules', 'narrative');
            if (val === 'OTHR') {
                $('#' + narrativeId).prop('disabled', false).addClass('mandatory');
            } else {
                $('#' + narrativeId).val('').prop('disabled', true).removeClass('mandatory');
            }
        });

        $('#_300_of23f_automatic_extension_period, #_620_of23f_automatic_extension_period').change(function() {
            const val = $(this).val();
            const narrativeId = $(this).attr('id').replace('automatic_extension_period', 'narrative');
            const narrative = $('#' + narrativeId);
            
            if (val === 'DAYS') {
                narrative.prop('disabled', false).addClass('mandatory');
                // Should be exactly 3 digits
                narrative.attr('pattern', '[0-9]{3}');
            } else if (val === 'ONEY') {
                narrative.val('').prop('disabled', true).removeClass('mandatory');
            } else if (val === 'OTHR') {
                narrative.prop('disabled', false).addClass('mandatory');
                narrative.removeAttr('pattern');
            } else {
                narrative.val('').prop('disabled', true).removeClass('mandatory');
            }
        });

        $('#_380_of24e_delivery_of_original_undertaking, #_700_of24e_delivery_of_local_undertaking').change(function() {
            const val = $(this).val();
            const narrativeId = $(this).attr('id').replace('delivery_of_original_undertaking', 'narrative').replace('delivery_of_local_undertaking', 'narrative');
            if (val === 'COUR' || val === 'OTHR') {
                $('#' + narrativeId).prop('disabled', false);
            } else {
                $('#' + narrativeId).val('').prop('disabled', true);
            }
        });

        $('#_390_of24g_delivery_to_collection_by, #_710_of24g_delivery_to_collection_by').change(function() {
            const val = $(this).val();
            const narrativeId = $(this).attr('id').replace('delivery_to_collection_by', 'narrative');
            if (val === 'OTHR') {
                $('#' + narrativeId).prop('disabled', false).addClass('mandatory');
            } else {
                $('#' + narrativeId).val('').prop('disabled', true).removeClass('mandatory');
            }
        });

        $('#_200_of57a_advise_through_bank').change(function() {
            if ($(this).val() !== '') {
                $('#_180_of56a_advising_bank').addClass('mandatory');
            }
        });

    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function () {
        
        $("#check_seq_c").hide();
        $("#seq_C_checkbox").click(function () {
            if ($("#seq_C_checkbox").is(":checked")) {
                $("#check_seq_c").show();
            } else {
                $("#check_seq_c").hide();
            }
        });

        $("#div_mf52a_issuer").hide();
        $("#div_mf52d_issuer").hide();
        $("#_160_mf52a_issuer").change(function () {
            if ($(this).val() == "a") {
                $("#div_mf52a_issuer").show();
                $("#div_mf52d_issuer").hide();
            } else if ($(this).val() == "d") {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").show();
            } else {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").hide();
            }
        });

        $("#div_mf59no_beneficiary").hide();
        $("#div_mf59a_beneficiary").hide();
        $("#_170_mf59a_beneficiary").change(function () {
            if ($(this).val() == "no") {
                $("#div_mf59no_beneficiary").show();
                $("#div_mf59a_beneficiary").hide();
            } else if ($(this).val() == "a") {
                $("#div_mf59no_beneficiary").hide();
                $("#div_mf59a_beneficiary").show();
            } else {
                $("#div_mf59no_beneficiary").hide();
                $("#div_mf59a_beneficiary").hide();
            }
        });

        $("#div_of56a_advising_bank").hide();
        $("#div_of56d_advising_bank").hide();
        $("#_180_of56a_advising_bank").change(function () {
            if ($(this).val() == "a") {
                $("#div_of56a_advising_bank").show();
                $("#div_of56d_advising_bank").hide();
            } else if ($(this).val() == "d") {
                $("#div_of56a_advising_bank").hide();
                $("#div_of56d_advising_bank").show();
            } else {
                $("#div_of56a_advising_bank").hide();
                $("#div_of56d_advising_bank").hide();
            }
        });

        $("#div_of57a_advise_through_bank").hide();
        $("#div_of57d_advise_through_bank").hide();
        $("#_200_of57a_advise_through_bank").change(function () {
            if ($(this).val() == "a") {
                $("#div_of57a_advise_through_bank").show();
                $("#div_of57d_advise_through_bank").hide();
            } else if ($(this).val() == "d") {
                $("#div_of57a_advise_through_bank").hide();
                $("#div_of57d_advise_through_bank").show();
            } else {
                $("#div_of57a_advise_through_bank").hide();
                $("#div_of57d_advise_through_bank").hide();
            }
        });

        $("#div_of41f_avaliable_with").hide();
        $("#div_of41g_avaliable_with").hide();
        $("#_230_of41a_available_with").change(function () {
            if ($(this).val() == "f") {
                $("#div_of41f_avaliable_with").show();
                $("#div_of41g_avaliable_with").hide();
            } else if ($(this).val() == "g") {
                $("#div_of41f_avaliable_with").hide();
                $("#div_of41g_avaliable_with").show();
            } else {
                $("#div_of41f_avaliable_with").hide();
                $("#div_of41g_avaliable_with").hide();
            }
        });

        $("#div_of58a_requested_confirmation_party").hide();
        $("#div_of58d_requested_confirmation_party").hide();
        $("#_280_of58a_requested_confirmation_party").change(function () {
            if ($(this).val() == "a") {
                $("#div_of58a_requested_confirmation_party").show();
                $("#div_of58d_requested_confirmation_party").hide();
            } else if ($(this).val() == "d") {
                $("#div_of58a_requested_confirmation_party").hide();
                $("#div_of58d_requested_confirmation_party").show();
            } else {
                $("#div_of58a_requested_confirmation_party").hide();
                $("#div_of58d_requested_confirmation_party").hide();
            }
        });

        $("#div_of52a_issuer").hide();
        $("#div_of52d_issuer").hide();
        $("#_500_of52a_issuer").change(function () {
            if ($(this).val() == "a") {
                $("#div_of52a_issuer").show();
                $("#div_of52d_issuer").hide();
            } else if ($(this).val() == "d") {
                $("#div_of52a_issuer").hide();
                $("#div_of52d_issuer").show();
            } else {
                $("#div_of52a_issuer").hide();
                $("#div_of52d_issuer").hide();
            }
        });

        $("#div_of57a_advise_through_bank").hide();
        $("#div_of57d_advise_through_bank").hide();
        $("#_540_of57a_advise_through_bank").change(function () {
            if ($(this).val() == "a") {
                $("#div_of57a_advise_through_bank").show();
                $("#div_of57d_advise_through_bank").hide();
            } else if ($(this).val() == "d") {
                $("#div_of57a_advise_through_bank").hide();
                $("#div_of57d_advise_through_bank").show();
            } else {
                $("#div_of57a_advise_through_bank").hide();
                $("#div_of57d_advise_through_bank").hide();
            }
        });

        $("#div_of41f_avaliable_with_2").hide();
        $("#div_of41g_avaliable_with_2").hide();
        $("#_550_of41a_available_with").change(function () {
            if ($(this).val() == "f") {
                $("#div_of41f_avaliable_with_2").show();
                $("#div_of41g_avaliable_with_2").hide();
            } else if ($(this).val() == "g") {
                $("#div_of41f_avaliable_with_2").hide();
                $("#div_of41g_avaliable_with_2").show();
            } else {
                $("#div_of41f_avaliable_with_2").hide();
                $("#div_of41g_avaliable_with_2").hide();
            }
        });

        if ($("#_160_mf52a_issuer").val() == "a") {
            $("#div_mf52a_issuer").show();
        } else if ($("#_160_mf52a_issuer").val() == "d") {
            $("#div_mf52d_issuer").show();
        }

        if ($("#_170_mf59a_beneficiary").val() == "no") {
            $("#div_mf59no_beneficiary").show();
        } else if ($("#_170_mf59a_beneficiary").val() == "a") {
            $("#div_mf59a_beneficiary").show();
        }

        if ($("#_400_mf15c_new_sequence").val() != "" || $("#seq_C_checkbox").is(":checked")) {
            $("#seq_C_checkbox").prop("checked", true);
            $("#check_seq_c").show();
        }

    });
</script>
