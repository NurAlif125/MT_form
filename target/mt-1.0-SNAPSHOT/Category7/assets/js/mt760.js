/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

$(document).ready(function() {
    // Initialize form on page load
    initializeMT760Form();
    
    // Setup tab navigation
    setupTabNavigation();
    
    // Setup real-time validations
    setupRealtimeValidations();
    
    // Setup character counters
    setupCharacterCounters();
    
    // Setup field toggles
    setupFieldToggles();
    
    // Setup date pickers
    setupDatePickers();
    
    // Setup currency auto-uppercase
    setupCurrencyFields();
    
    // Setup amount formatting
    setupAmountFields();
    
    // Setup conditional field logic
    setupConditionalFields();
});

/**
 * Initialize MT 760 Form
 */
function initializeMT760Form() {
    console.log('Initializing MT 760 form...');
    
    // Set default Number to 1 if empty
    if (!$('#_020_mf27_number').val()) {
        $('#_020_mf27_number').val('1');
    }
    
    // Set default Total to 1 if empty
    if (!$('#_021_mf27_total').val()) {
        $('#_021_mf27_total').val('1');
    }
    
    // Initialize field tooltips
    initializeFieldTooltips();
    
    // Initialize sequence C visibility
    initializeSequenceC();
}

/**
 * Setup Tab Navigation
 */
function setupTabNavigation() {
    $('.tabs li a').click(function(e) {
        e.preventDefault();
        var rel = $(this).attr('rel');
        
        // Hide all tab contents
        $('.tabcontent').hide();
        
        // Show selected tab content
        $('#' + rel).show();
        
        // Update tab selection visual
        $('.tabs li').removeClass('selected');
        $(this).parent().addClass('selected');
    });
    
    // Show Body tab by default
    $('.tabs li:has(a[rel="view2"])').addClass('selected');
    $('#view2').show();
}

/**
 * Setup Real-time Validations
 */
function setupRealtimeValidations() {
    
    // ===== FIELD 27: Sequence of Total =====
    $('#_020_mf27_number, #_021_mf27_total').on('blur', function() {
        validateField27Realtime();
    });
    
    $('#_020_mf27_number, #_021_mf27_total').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    // ===== FIELD 20: Undertaking Number =====
    $('#_070_mf20_undertaking_number').on('blur', function() {
        validateField20Realtime();
    });
    
    $('#_070_mf20_undertaking_number').on('keypress', function(e) {
        return avoidSplChars(e);
    });
    
    // ===== FIELD 30: Date of Issue =====
    $('#_080_mf30_date_of_issue').on('blur', function() {
        validateDateFormat(this, 'Date of Issue');
    });
    
    $('#_080_mf30_date_of_issue').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    // ===== FIELD 31E: Date of Expiry (Sequence B) =====
    $('#_120_of31e_date_of_expiry').on('blur', function() {
        validateDateFormat(this, 'Date of Expiry (Seq B)');
    });
    
    $('#_120_of31e_date_of_expiry').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    // ===== FIELD 31E: Date of Expiry (Sequence C) =====
    $('#_460_of31e_date_of_expiry').on('blur', function() {
        validateDateFormat(this, 'Date of Expiry (Seq C)');
    });
    
    $('#_460_of31e_date_of_expiry').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    // ===== FIELD 31S: Final Expiry Date (Sequence B) =====
    $('#_330_of31s_automatic_extension_final_expiry_date').on('blur', function() {
        validateDateFormat(this, 'Final Expiry Date (Seq B)');
    });
    
    $('#_330_of31s_automatic_extension_final_expiry_date').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    // ===== FIELD 31S: Final Expiry Date (Sequence C) =====
    $('#_650_of31s_automatic_extension_final_expiry_date').on('blur', function() {
        validateDateFormat(this, 'Final Expiry Date (Seq C)');
    });
    
    $('#_650_of31s_automatic_extension_final_expiry_date').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    // ===== FIELD 31C: Requested Date of Issue (Sequence C) =====
    $('#_410_of31c_requested_date_of_issue').on('blur', function() {
        validateDateFormat(this, 'Requested Date of Issue');
    });
    
    $('#_410_of31c_requested_date_of_issue').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    // ===== FIELD 52a: Issuer BIC Code (Sequence B) =====
    $('#_162_mf52a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_162_mf52a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Issuer BIC (Seq B)');
    });
    
    // ===== FIELD 52a: Issuer BIC Code (Sequence C) =====
    $('#_502_of52a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_502_of52a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Issuer BIC (Seq C)');
    });
    
    // ===== FIELD 59a: Beneficiary BIC Code (Sequence B) =====
    $('#_174_mf59a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_174_mf59a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Beneficiary BIC (Seq B)');
    });
    
    // ===== FIELD 56a: Advising Bank BIC Code =====
    $('#_182_of56a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_182_of56a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Advising Bank BIC');
    });
    
    // ===== FIELD 57a: Advise Through Bank BIC Code (Sequence B) =====
    $('#_202_of57a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_202_of57a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Advise Through Bank BIC (Seq B)');
    });
    
    // ===== FIELD 57a: Advise Through Bank BIC Code (Sequence C) =====
    $('#_542_of57a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_542_of57a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Advise Through Bank BIC (Seq C)');
    });
    
    // ===== FIELD 58a: Requested Confirmation Party BIC =====
    $('#_282_of58a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_282_of58a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Requested Confirmation Party BIC');
    });
    
    // ===== FIELD 41a: Available With BIC (Sequence B) =====
    $('#_231_of41f_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_231_of41f_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Available With BIC (Seq B)');
    });
    
    // ===== FIELD 41a: Available With BIC (Sequence C) =====
    $('#_551_of41f_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_551_of41f_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Available With BIC (Seq C)');
    });
    
    // ===== FIELD 32B/33B: Amount validation (Sequence B) =====
    $('#_211_mf32b_amount').on('keypress', function(e) {
        return numbersonly(e, '_210_mf32b_currency');
    });
    
    $('#_211_mf32b_amount').on('blur', function() {
        cek_koma(this);
        checkZeroAmount(this.id);
    });
    
    // ===== FIELD 32B: Amount validation (Sequence C) =====
    $('#_521_mf32b_amount').on('keypress', function(e) {
        return numbersonly(e, '_520_mf32b_currency');
    });
    
    $('#_521_mf32b_amount').on('blur', function() {
        cek_koma(this);
        checkZeroAmount(this.id);
    });
    
    // ===== FIELD 26E: Extension Notification Period (3 digits) =====
    $('#_320_of26e_automatic_extension_notification_period').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_320_of26e_automatic_extension_notification_period').attr('maxlength', 3);
    
    $('#_640_of26e_automatic_extension_notification_period').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_640_of26e_automatic_extension_notification_period').attr('maxlength', 3);
    
    // ===== Party Identifier slash validation =====
    $('#_161_mf52a_party_identifier, #_163_mf52d_party_identifier').on('blur', function() {
        cek_slash(this);
    });
    
    $('#_171_mf59a_account, #_173_mf59a_account').on('blur', function() {
        cek_slash(this);
    });
    
    $('#_181_of56a_party_identifier, #_183_of56d_party_identifier').on('blur', function() {
        cek_slash(this);
    });
    
    $('#_201_of57a_party_identifier, #_203_of57d_party_identifier').on('blur', function() {
        cek_slash(this);
    });
    
    $('#_281_of58a_party_identifier, #_283_of58d_party_identifier').on('blur', function() {
        cek_slash(this);
    });
    
    $('#_501_of52a_party_identifier, #_503_of52d_party_identifier').on('blur', function() {
        cek_slash(this);
    });
    
    $('#_510_mf59_beneficiary').on('blur', function() {
        cek_slash(this);
    });
    
    $('#_541_of57a_party_identifier, #_543_of57d_party_identifier').on('blur', function() {
        cek_slash(this);
    });
    
    // ===== Text Area validations =====
    $('#_260_mf77u_undertaking_terms_and_conditions').on('blur', function() {
        checkLongLines('_260_mf77u_undertaking_terms_and_conditions', 'MF77U', 65);
    });
    
    $('#_580_of77l_requested_local_undertaking_terms_and_conditions').on('blur', function() {
        checkLongLines('_580_of77l_requested_local_undertaking_terms_and_conditions', 'OF77L', 65);
    });
    
    $('#_250_of45c_document_and_presentation_instructions').on('blur', function() {
        checkLongLines('_250_of45c_document_and_presentation_instructions', 'OF45C', 65);
    });
    
    $('#_570_of45c_document_and_presentation_instructions').on('blur', function() {
        checkLongLines('_570_of45c_document_and_presentation_instructions', 'OF45C (Seq C)', 65);
    });
    
    $('#_370_of45l_underlying_transaction_details').on('blur', function() {
        checkLongLines('_370_of45l_underlying_transaction_details', 'OF45L', 65);
    });
    
    $('#_690_mf45l_underlying_transaction_details').on('blur', function() {
        checkLongLines('_690_mf45l_underlying_transaction_details', 'MF45L', 65);
    });
}

/**
 * Setup Character Counters
 */
function setupCharacterCounters() {
    // Create counter elements if they don't exist
    const counters = [
        {id: '_260_mf77u_undertaking_terms_and_conditions', counterId: 'counter_77u', maxLines: 150, maxChars: 9750},
        {id: '_580_of77l_requested_local_undertaking_terms_and_conditions', counterId: 'counter_77l', maxLines: 150, maxChars: 9750},
        {id: '_250_of45c_document_and_presentation_instructions', counterId: 'counter_45c_b', maxLines: 100, maxChars: 6500},
        {id: '_570_of45c_document_and_presentation_instructions', counterId: 'counter_45c_c', maxLines: 100, maxChars: 6500},
        {id: '_370_of45l_underlying_transaction_details', counterId: 'counter_45l_b', maxLines: 50, maxChars: 3250},
        {id: '_690_mf45l_underlying_transaction_details', counterId: 'counter_45l_c', maxLines: 50, maxChars: 3250}
    ];
    
    counters.forEach(function(counter) {
        if ($('#' + counter.counterId).length === 0) {
            $('#' + counter.id).after(
                '<div id="' + counter.counterId + '" style="font-size:10pt; margin-top:5px; color:green;"></div>'
            );
        }
        
        // Update counter on input
        $('#' + counter.id).on('input', function() {
            updateCharacterCounter(counter.id, counter.counterId, counter.maxLines, counter.maxChars);
        });
        
        // Initialize counter
        updateCharacterCounter(counter.id, counter.counterId, counter.maxLines, counter.maxChars);
    });
}

/**
 * Update Character Counter Display
 */
function updateCharacterCounter(textareaId, counterId, maxLines, maxChars) {
    var content = $('#' + textareaId).val();
    var lines = content.split('\n');
    var lineCount = lines.length;
    var charCount = content.length;
    
    var counterText = charCount + ' / ' + maxChars.toLocaleString() + ' characters | ' + 
                      lineCount + ' / ' + maxLines + ' lines';
    $('#' + counterId).text(counterText);
    
    // Color coding based on usage
    if (lineCount > maxLines || charCount > maxChars) {
        $('#' + counterId).css('color', 'red');
    } else if (lineCount > (maxLines * 0.8) || charCount > (maxChars * 0.8)) {
        $('#' + counterId).css('color', 'orange');
    } else {
        $('#' + counterId).css('color', 'green');
    }
}

/**
 * Setup Field Toggles
 */
function setupFieldToggles() {
    // Toggle OF23X File Identification - Usage Rules
    $('#_050_of23x_file_identification').on('change', function() {
        toggleOF23X();
    });
    
    // Toggle MF40C Applicable Rules - Narrative (Sequence B)
    $('#_100_mf40c_applicable_rules').on('change', function() {
        toggleMF40C_SeqB();
    });
    
    // Toggle MF40C Applicable Rules - Narrative (Sequence C)
    $('#_430_mf40c_applicable_rules').on('change', function() {
        toggleMF40C_SeqC();
    });
    
    // Toggle OF23F Automatic Extension Period - Details (Sequence B)
    $('#_300_of23f_automatic_extension_period').on('change', function() {
        toggleOF23F_SeqB();
    });
    
    // Toggle OF23F Automatic Extension Period - Details (Sequence C)
    $('#_620_of23f_automatic_extension_period').on('change', function() {
        toggleOF23F_SeqC();
    });
    
    // Toggle OF24E Delivery (Sequence B) - Additional Information
    $('#_380_of24e_delivery_of_original_undertaking').on('change', function() {
        toggleOF24E_SeqB();
    });
    
    // Toggle OF24G Delivery To/Collection By (Sequence B) - Narrative
    $('#_390_of24g_delivery_to_collection_by').on('change', function() {
        toggleOF24G_SeqB();
    });
    
    // Toggle OF24E Delivery (Sequence C) - Additional Information
    $('#_700_of24e_delivery_of_local_undertaking').on('change', function() {
        toggleOF24E_SeqC();
    });
    
    // Toggle OF24G Delivery To/Collection By (Sequence C) - Narrative
    $('#_710_of24g_delivery_to_collection_by').on('change', function() {
        toggleOF24G_SeqC();
    });
    
    // Initialize toggles on page load
    toggleOF23X();
    toggleMF40C_SeqB();
    toggleMF40C_SeqC();
    toggleOF23F_SeqB();
    toggleOF23F_SeqC();
    toggleOF24E_SeqB();
    toggleOF24G_SeqB();
    toggleOF24E_SeqC();
    toggleOF24G_SeqC();
}

/**
 * Toggle OF23X Usage Rules field
 */
function toggleOF23X() {
    var code = $('#_050_of23x_file_identification').val();
    var usageRulesField = $('#_051_of23x_file_name_or_reference');
    
    if (code === 'OTHR' || code === 'COUR' || code === 'EMAL' || code === 'FACT' || code === 'FAXT' || code === 'HOST' || code === 'MAIL') {
        usageRulesField.prop('disabled', false);
    } else {
        usageRulesField.prop('disabled', true);
        if (code === '') {
            usageRulesField.val('');
        }
    }
}

/**
 * Toggle MF40C Narrative (Sequence B)
 */
function toggleMF40C_SeqB() {
    var type = $('#_100_mf40c_applicable_rules').val();
    var narrativeField = $('#_101_mf40c_narrative');
    
    if (type === 'OTHR') {
        narrativeField.prop('disabled', false).addClass('mandatory');
    } else {
        narrativeField.val('').prop('disabled', true).removeClass('mandatory');
    }
}

/**
 * Toggle MF40C Narrative (Sequence C)
 */
function toggleMF40C_SeqC() {
    var type = $('#_430_mf40c_applicable_rules').val();
    var narrativeField = $('#_431_mf40c_narrative');
    
    if (type === 'OTHR') {
        narrativeField.prop('disabled', false).addClass('mandatory');
    } else {
        narrativeField.val('').prop('disabled', true).removeClass('mandatory');
    }
}

/**
 * Toggle OF23F Details (Sequence B)
 */
function toggleOF23F_SeqB() {
    var period = $('#_300_of23f_automatic_extension_period').val();
    var detailsField = $('#_301_of23f_narrative');
    
    if (period === 'DAYS') {
        detailsField.prop('disabled', false).addClass('mandatory');
        detailsField.attr('pattern', '[0-9]{3}');
        detailsField.attr('title', 'Must be exactly 3 digits');
    } else if (period === 'ONEY') {
        detailsField.val('').prop('disabled', true).removeClass('mandatory');
        detailsField.removeAttr('pattern');
    } else if (period === 'OTHR') {
        detailsField.prop('disabled', false).addClass('mandatory');
        detailsField.removeAttr('pattern');
    } else {
        detailsField.val('').prop('disabled', true).removeClass('mandatory');
        detailsField.removeAttr('pattern');
    }
}

/**
 * Toggle OF23F Details (Sequence C)
 */
function toggleOF23F_SeqC() {
    var period = $('#_620_of23f_automatic_extension_period').val();
    var detailsField = $('#_621_of23f_narrative');
    
    if (period === 'DAYS') {
        detailsField.prop('disabled', false).addClass('mandatory');
        detailsField.attr('pattern', '[0-9]{3}');
        detailsField.attr('title', 'Must be exactly 3 digits');
    } else if (period === 'ONEY') {
        detailsField.val('').prop('disabled', true).removeClass('mandatory');
        detailsField.removeAttr('pattern');
    } else if (period === 'OTHR') {
        detailsField.prop('disabled', false).addClass('mandatory');
        detailsField.removeAttr('pattern');
    } else {
        detailsField.val('').prop('disabled', true).removeClass('mandatory');
        detailsField.removeAttr('pattern');
    }
}

/**
 * Toggle OF24E Additional Information (Sequence B)
 */
function toggleOF24E_SeqB() {
    var code = $('#_380_of24e_delivery_of_original_undertaking').val();
    var additionalInfoField = $('#_381_of24e_narrative');
    
    if (code === 'OTHR' || code === 'COUR') {
        additionalInfoField.prop('disabled', false);
    } else {
        additionalInfoField.val('').prop('disabled', true);
    }
}

/**
 * Toggle OF24G Narrative (Sequence B)
 */
function toggleOF24G_SeqB() {
    var code = $('#_390_of24g_delivery_to_collection_by').val();
    var narrativeField = $('#_390_of24g_narrative');
    
    if (code === 'OTHR') {
        narrativeField.prop('disabled', false).addClass('mandatory');
    } else {
        narrativeField.val('').prop('disabled', true).removeClass('mandatory');
    }
}

/**
 * Toggle OF24E Additional Information (Sequence C)
 */
function toggleOF24E_SeqC() {
    var code = $('#_700_of24e_delivery_of_local_undertaking').val();
    var additionalInfoField = $('#_701_of24e_narrative');
    
    if (code === 'OTHR' || code === 'COUR') {
        additionalInfoField.prop('disabled', false);
    } else {
        additionalInfoField.val('').prop('disabled', true);
    }
}

/**
 * Toggle OF24G Narrative (Sequence C)
 */
function toggleOF24G_SeqC() {
    var code = $('#_710_of24g_delivery_to_collection_by').val();
    var narrativeField = $('#_710_of24g_narrative');
    
    if (code === 'OTHR') {
        narrativeField.prop('disabled', false).addClass('mandatory');
    } else {
        narrativeField.val('').prop('disabled', true).removeClass('mandatory');
    }
}

/**
 * Setup Conditional Fields based on Network Validated Rules
 */
function setupConditionalFields() {
    // C1: Field 31E based on field 23B (Sequence B)
    $('#_110_mf23b_expiry_type').on('change', function() {
        applyRuleC1_SeqB();
    });
    
    // C2: Field 35G based on field 23B (Sequence B)
    $('#_110_mf23b_expiry_type').on('change', function() {
        applyRuleC2_SeqB();
    });
    
    // C3: Field 23F not allowed if 23B is OPEN (Sequence B)
    $('#_110_mf23b_expiry_type').on('change', function() {
        applyRuleC3_SeqB();
    });
    
    // C4: Field 50 based on field 22A
    $('#_030_mf22a_purpose_of_message').on('change', function() {
        applyRuleC4();
    });
    
    // C5: Field 49 based on fields 22A and 22D
    $('#_030_mf22a_purpose_of_message, #_090_mf22d_form_of_undertaking').on('change', function() {
        applyRuleC5();
    });
    
    // C6: Sequence C based on field 22A
    $('#_030_mf22a_purpose_of_message').on('change', function() {
        applyRuleC6();
    });
    
    // C7: Field 57a requires field 56a
    $('#_200_of57a_advise_through_bank, #_540_of57a_advise_through_bank').on('change', function() {
        applyRuleC7();
    });
    
    // C8: Fields 78, 26E, 31S based on field 23F (Sequence B)
    $('#_300_of23f_automatic_extension_period').on('change', function() {
        applyRuleC8_SeqB();
    });
    
    // C9: Field 58a based on field 49
    $('#_270_of49_confirmation_instructions').on('change', function() {
        applyRuleC9();
    });
    
    // C10: Field 22K based on field 22Y (Sequence C)
    $('#_590_of22y_standard_wording_required').on('change', function() {
        applyRuleC10();
    });
    
    // C11: Field 41a not allowed if 22D is DGAR
    $('#_090_mf22d_form_of_undertaking, #_420_mf22d_form_of_undertaking').on('change', function() {
        applyRuleC11();
    });
    
    // Initialize conditional fields on page load
    applyRuleC1_SeqB();
    applyRuleC2_SeqB();
    applyRuleC3_SeqB();
    applyRuleC4();
    applyRuleC5();
    applyRuleC6();
    applyRuleC7();
    applyRuleC8_SeqB();
    applyRuleC9();
    applyRuleC10();
    applyRuleC11();
    
    // Same rules for Sequence C
    $('#_450_mf23b_expiry_type').on('change', function() {
        applyRuleC1_SeqC();
        applyRuleC2_SeqC();
        applyRuleC3_SeqC();
    });
    
    $('#_620_of23f_automatic_extension_period').on('change', function() {
        applyRuleC8_SeqC();
    });
    
    applyRuleC1_SeqC();
    applyRuleC2_SeqC();
    applyRuleC3_SeqC();
    applyRuleC8_SeqC();
}

/**
 * Rule C1: Field 31E based on field 23B (Sequence B)
 */
function applyRuleC1_SeqB() {
    var expiryType = $('#_110_mf23b_expiry_type').val();
    var dateField = $('#_120_of31e_date_of_expiry');
    
    if (expiryType === 'FIXD') {
        dateField.addClass('mandatory');
    } else if (expiryType === 'COND') {
        dateField.removeClass('mandatory');
    } else if (expiryType === 'OPEN') {
        dateField.val('').removeClass('mandatory').prop('disabled', true);
    } else {
        dateField.prop('disabled', false);
    }
}

/**
 * Rule C1: Field 31E based on field 23B (Sequence C)
 */
function applyRuleC1_SeqC() {
    var expiryType = $('#_450_mf23b_expiry_type').val();
    var dateField = $('#_460_of31e_date_of_expiry');
    
    if (expiryType === 'FIXD') {
        dateField.addClass('mandatory');
    } else if (expiryType === 'COND') {
        dateField.removeClass('mandatory');
    } else if (expiryType === 'OPEN') {
        dateField.val('').removeClass('mandatory').prop('disabled', true);
    } else {
        dateField.prop('disabled', false);
    }
}

/**
 * Rule C2: Field 35G based on field 23B (Sequence B)
 */
function applyRuleC2_SeqB() {
    var expiryType = $('#_110_mf23b_expiry_type').val();
    var conditionField = $('#_130_of35g_expiry_condition_event');
    if (expiryType === 'COND') {
        conditionField.addClass('mandatory').prop('disabled', false);
    } else {
        conditionField.val('').removeClass('mandatory').prop('disabled', true);
    }
}

/**
 * Rule C2: Field 35G based on field 23B (Sequence C)
 */
function applyRuleC2_SeqC() {
    var expiryType = $('#_450_mf23b_expiry_type').val();
    var conditionField = $('#_470_of35G_expiry_condition_events');
    
    if (expiryType === 'COND') {
        conditionField.addClass('mandatory').prop('disabled', false);
    } else {
        conditionField.val('').removeClass('mandatory').prop('disabled', true);
    }
}

/**
 * Rule C3: Field 23F not allowed if 23B is OPEN (Sequence B)
 */
function applyRuleC3_SeqB() {
    var expiryType = $('#_110_mf23b_expiry_type').val();
    var autoExtField = $('#_300_of23f_automatic_extension_period');
    
    if (expiryType === 'OPEN') {
        autoExtField.val('').prop('disabled', true);
        // Also disable related fields
        $('#_301_of23f_narrative').val('').prop('disabled', true);
        $('#_310_of78_automatic_extension_non_extension_notification').val('').prop('disabled', true);
        $('#_320_of26e_automatic_extension_notification_period').val('').prop('disabled', true);
        $('#_330_of31s_automatic_extension_final_expiry_date').val('').prop('disabled', true);
    } else {
        autoExtField.prop('disabled', false);
    }
}

/**
 * Rule C3: Field 23F not allowed if 23B is OPEN (Sequence C)
 */
function applyRuleC3_SeqC() {
    var expiryType = $('#_450_mf23b_expiry_type').val();
    var autoExtField = $('#_620_of23f_automatic_extension_period');
    
    if (expiryType === 'OPEN') {
        autoExtField.val('').prop('disabled', true);
        // Also disable related fields
        $('#_621_of23f_narrative').val('').prop('disabled', true);
        $('#_630_of78_automatic_extension_non_extenstion_notification').val('').prop('disabled', true);
        $('#_640_of26e_automatic_extension_notification_period').val('').prop('disabled', true);
        $('#_650_of31s_automatic_extension_final_expiry_date').val('').prop('disabled', true);
    } else {
        autoExtField.prop('disabled', false);
    }
}

/**
 * Rule C4: Field 50 must be present if 22A is ISSU
 */
function applyRuleC4() {
    var purpose = $('#_030_mf22a_purpose_of_message').val();
    var applicantField = $('#_140_of50_applicant');
    
    if (purpose === 'ISSU') {
        applicantField.addClass('mandatory');
    } else {
        applicantField.removeClass('mandatory');
    }
}

/**
 * Rule C5: Field 49 based on fields 22A and 22D
 */
function applyRuleC5() {
    var purpose = $('#_030_mf22a_purpose_of_message').val();
    var formUndertaking = $('#_090_mf22d_form_of_undertaking').val();
    var confirmField = $('#_270_of49_confirmation_instructions');
    
    if (purpose === 'ISSU' && formUndertaking === 'STBY') {
        confirmField.addClass('mandatory').prop('disabled', false);
    } else if (formUndertaking === 'DGAR') {
        confirmField.val('').removeClass('mandatory').prop('disabled', true);
    } else {
        confirmField.removeClass('mandatory').prop('disabled', false);
    }
}

/**
 * Rule C6: Sequence C and restricted fields based on field 22A
 */
function applyRuleC6() {
    var purpose = $('#_030_mf22a_purpose_of_message').val();
    
    if (purpose === 'ISCO' || purpose === 'ICCO') {
        // Sequence C must be present
        $('#seq_C_checkbox').prop('checked', true).prop('disabled', true);
        $('#check_seq_c').show();
        
        // Fields not allowed in Sequence B
        $('#_350_of48d_transfer_indicator').val('').prop('disabled', true);
        $('#_380_of24e_delivery_of_original_undertaking').val('').prop('disabled', true);
        $('#_381_of24e_narrative').val('').prop('disabled', true);
        $('#_390_of24g_delivery_to_collection_by').val('').prop('disabled', true);
        $('#_390_of24g_narrative').val('').prop('disabled', true);
    } else {
        // Sequence C is optional
        $('#seq_C_checkbox').prop('disabled', false);
        
        // Fields are allowed in Sequence B
        $('#_350_of48d_transfer_indicator').prop('disabled', false);
        $('#_380_of24e_delivery_of_original_undertaking').prop('disabled', false);
        $('#_390_of24g_delivery_to_collection_by').prop('disabled', false);
    }
    
    // Rule for field 45L in Sequence B
    if (purpose === 'ISSU') {
        $('#_370_of45l_underlying_transaction_details').addClass('mandatory');
    } else {
        $('#_370_of45l_underlying_transaction_details').removeClass('mandatory');
    }
}

/**
 * Rule C7: Field 57a requires field 56a
 */
function applyRuleC7() {
    var adviseThroughB = $('#_200_of57a_advise_through_bank').val();
    var adviseThroughC = $('#_540_of57a_advise_through_bank').val();
    var advisingBankField = $('#_180_of56a_advising_bank');
    
    if (adviseThroughB !== '' || adviseThroughC !== '') {
        advisingBankField.addClass('mandatory');
    } else {
        advisingBankField.removeClass('mandatory');
    }
}

/**
 * Rule C8: Fields 78, 26E, 31S based on field 23F (Sequence B)
 */
function applyRuleC8_SeqB() {
    var autoExtPeriod = $('#_300_of23f_automatic_extension_period').val();
    
    var field78 = $('#_310_of78_automatic_extension_non_extension_notification');
    var field26e = $('#_320_of26e_automatic_extension_notification_period');
    var field31s = $('#_330_of31s_automatic_extension_final_expiry_date');
    
    if (autoExtPeriod === '' || !autoExtPeriod) {
        field78.val('').prop('disabled', true);
        field26e.val('').prop('disabled', true);
        field31s.val('').prop('disabled', true);
    } else {
        field78.prop('disabled', false);
        field26e.prop('disabled', false);
        field31s.prop('disabled', false);
    }
}

/**
 * Rule C8: Fields 78, 26E, 31S based on field 23F (Sequence C)
 */
function applyRuleC8_SeqC() {
    var autoExtPeriod = $('#_620_of23f_automatic_extension_period').val();
    
    var field78 = $('#_630_of78_automatic_extension_non_extenstion_notification');
    var field26e = $('#_640_of26e_automatic_extension_notification_period');
    var field31s = $('#_650_of31s_automatic_extension_final_expiry_date');
    
    if (autoExtPeriod === '' || !autoExtPeriod) {
        field78.val('').prop('disabled', true);
        field26e.val('').prop('disabled', true);
        field31s.val('').prop('disabled', true);
    } else {
        field78.prop('disabled', false);
        field26e.prop('disabled', false);
        field31s.prop('disabled', false);
    }
}

/**
 * Rule C9: Field 58a based on field 49
 */
function applyRuleC9() {
    var confirmInstr = $('#_270_of49_confirmation_instructions').val();
    var requestedPartyField = $('#_280_of58a_requested_confirmation_party');
    
    if (confirmInstr === 'CONFIRM' || confirmInstr === 'MAY ADD') {
        requestedPartyField.addClass('mandatory').prop('disabled', false);
    } else {
        requestedPartyField.val('').removeClass('mandatory');
        if (confirmInstr === 'WITHOUT') {
            requestedPartyField.prop('disabled', true);
        }
    }
}

/**
 * Rule C10: Field 22K based on field 22Y (Sequence C)
 */
function applyRuleC10() {
    var standardWording = $('#_590_of22y_standard_wording_required').val();
    var typeUndertakingField = $('#_440_of22k_type_of_undertaking');
    
    if (standardWording === 'STND') {
        typeUndertakingField.addClass('mandatory');
    } else {
        typeUndertakingField.removeClass('mandatory');
    }
}

/**
 * Rule C11: Field 41a not allowed if 22D is DGAR
 */
function applyRuleC11() {
    var formUndertakingB = $('#_090_mf22d_form_of_undertaking').val();
    var formUndertakingC = $('#_420_mf22d_form_of_undertaking').val();
    
    var availableWithB = $('#_230_of41a_available_with');
    var availableWithC = $('#_550_of41a_available_with');
    
    // Sequence B
    if (formUndertakingB === 'DGAR') {
        availableWithB.val('').prop('disabled', true);
        $('#_231_of41f_identifier_code').val('').prop('disabled', true);
        $('#_232_of41g_name_address').val('').prop('disabled', true);
    } else {
        availableWithB.prop('disabled', false);
    }
    
    // Sequence C
    if (formUndertakingC === 'DGAR' || formUndertakingC === 'DEPU') {
        availableWithC.val('').prop('disabled', true);
        $('#_551_of41f_identifier_code').val('').prop('disabled', true);
        $('#_552_of41g_name_address').val('').prop('disabled', true);
    } else {
        availableWithC.prop('disabled', false);
    }
}

/**
 * Setup Date Pickers (YYMMDD format)
 */
function setupDatePickers() {
    var dateFields = [
        '_080_mf30_date_of_issue',
        '_120_of31e_date_of_expiry',
        '_330_of31s_automatic_extension_final_expiry_date',
        '_410_of31c_requested_date_of_issue',
        '_460_of31e_date_of_expiry',
        '_650_of31s_automatic_extension_final_expiry_date'
    ];
    
    dateFields.forEach(function(fieldId) {
        yymmdd(fieldId);
    });
}

/**
 * Setup Currency Fields (Auto-uppercase)
 */
function setupCurrencyFields() {
    var currencyFields = [
        '_210_mf32b_currency',
        '_520_mf32b_currency'
    ];
    
    currencyFields.forEach(function(fieldId) {
        $('#' + fieldId).on('input', function() {
            $(this).val($(this).val().toUpperCase().replace(/[^A-Z]/g, ''));
        });
        
        // Limit to 3 characters
        $('#' + fieldId).attr('maxlength', 3);
    });
}

/**
 * Setup Amount Fields (Formatting)
 */
function setupAmountFields() {
    var amountFields = [
        '_211_mf32b_amount',
        '_521_mf32b_amount'
    ];
    
    amountFields.forEach(function(fieldId) {
        var el = document.getElementById(fieldId);
        if (el) {
            // Format during input - allow only numbers and comma
            el.addEventListener('input', function() {
                formatAmountInput(this);
            });
            
            // Format on blur - ensure proper decimal format
            el.addEventListener('blur', function() {
                formatAmountBlur(this);
            });
        }
    });
}

/**
 * Initialize Sequence C Visibility
 */
function initializeSequenceC() {
    $('#seq_C_checkbox').on('change', function() {
        if ($(this).is(':checked')) {
            $('#check_seq_c').show();
        } else {
            $('#check_seq_c').hide();
        }
    });
    
    // Check if Sequence C should be visible on load
    var purpose = $('#_030_mf22a_purpose_of_message').val();
    if (purpose === 'ISCO' || purpose === 'ICCO') {
        $('#seq_C_checkbox').prop('checked', true);
        $('#check_seq_c').show();
    } else if ($('#_400_mf15c_new_sequence').val() !== '') {
        $('#seq_C_checkbox').prop('checked', true);
        $('#check_seq_c').show();
    } else {
        $('#check_seq_c').hide();
    }
}

/**
 * Validate Field 27 Real-time (T75)
 */
function validateField27Realtime() {
    var number = $('#_020_mf27_number').val().trim();
    var total = $('#_021_mf27_total').val().trim();
    
    // Clear previous feedback
    $('#_020_mf27_number').removeClass('error-border valid-border');
    $('#_021_mf27_total').removeClass('error-border valid-border');
    removeInlineError('_020_mf27_number');
    removeInlineError('_021_mf27_total');
    
    if (number === '' || total === '') {
        return;
    }
    
    var numberInt = parseInt(number);
    var totalInt = parseInt(total);
    var isValid = true;
    
    // T75: Number must be 1
    if (numberInt !== 1) {
        $('#_020_mf27_number').addClass('error-border');
        showInlineError('_020_mf27_number', 'Number must be 1 (Error T75)');
        isValid = false;
    }
    
    // T75: Total must be 1-8
    if (totalInt < 1 || totalInt > 8) {
        $('#_021_mf27_total').addClass('error-border');
        showInlineError('_021_mf27_total', 'Total must be between 1-8 (Error T75)');
        isValid = false;
    }
    
    // Show success if all valid
    if (isValid) {
        $('#_020_mf27_number').addClass('valid-border');
        $('#_021_mf27_total').addClass('valid-border');
    }
}

/**
 * Validate Field 20 Real-time (T26)
 */
function validateField20Realtime() {
    var undertakingNumber = $('#_070_mf20_undertaking_number').val().trim();
    
    // Clear previous feedback
    $('#_070_mf20_undertaking_number').removeClass('error-border valid-border');
    removeInlineError('_070_mf20_undertaking_number');
    
    if (undertakingNumber === '') {
        return;
    }
    
    var isValid = true;
    
    // T26: Cannot start with slash
    if (undertakingNumber.startsWith('/')) {
        $('#_070_mf20_undertaking_number').addClass('error-border');
        showInlineError('_070_mf20_undertaking_number', 'Cannot start with "/" (Error T26)');
        isValid = false;
    }
    
    // T26: Cannot end with slash
    if (undertakingNumber.endsWith('/')) {
        $('#_070_mf20_undertaking_number').addClass('error-border');
        showInlineError('_070_mf20_undertaking_number', 'Cannot end with "/" (Error T26)');
        isValid = false;
    }
    
    // T26: Cannot contain consecutive slashes
    if (undertakingNumber.indexOf('//') !== -1) {
        $('#_070_mf20_undertaking_number').addClass('error-border');
        showInlineError('_070_mf20_undertaking_number', 'Cannot contain "//" (Error T26)');
        isValid = false;
    }
    
    // Show success if valid
    if (isValid) {
        $('#_070_mf20_undertaking_number').addClass('valid-border');
    }
}

/**
 * Validate Date Format (T50 - YYMMDD)
 */
function validateDateFormat(obj, fieldName) {
    var dateValue = $(obj).val().trim();
    
    // Clear previous feedback
    $(obj).removeClass('error-border valid-border');
    removeInlineError(obj.id);
    
    if (dateValue === '') {
        return true;
    }
    
    var isValid = true;
    
    // Must be exactly 6 digits
    if (!/^\d{6}$/.test(dateValue)) {
        $(obj).addClass('error-border');
        showInlineError(obj.id, fieldName + ' must be 6 digits (YYMMDD) (Error T50)');
        isValid = false;
    } else {
        // Validate date components
        var yy = parseInt(dateValue.substr(0, 2));
        var mm = parseInt(dateValue.substr(2, 2));
        var dd = parseInt(dateValue.substr(4, 2));
        
        if (mm < 1 || mm > 12) {
            $(obj).addClass('error-border');
            showInlineError(obj.id, 'Invalid month (01-12) (Error T50)');
            isValid = false;
        }
        
        if (dd < 1 || dd > 31) {
            $(obj).addClass('error-border');
            showInlineError(obj.id, 'Invalid day (01-31) (Error T50)');
            isValid = false;
        }
    }
    
    // Show success if valid
    if (isValid) {
        $(obj).addClass('valid-border');
    }
    
    return isValid;
}

/**
 * Validate BIC Code Real-time (T27, T28, T29, T45, C05)
 */
function validateBICRealtime(obj, fieldName) {
    var bicCode = $(obj).val().trim().toUpperCase();
    
    // Clear previous feedback
    $(obj).removeClass('error-border valid-border');
    removeInlineError(obj.id);
    
    if (bicCode === '') {
        return true;
    }
    
    var isValid = true;
    
    // T27/T28: BIC must be 8 or 11 characters
    if (bicCode.length !== 8 && bicCode.length !== 11) {
        $(obj).addClass('error-border');
        showInlineError(obj.id, fieldName + ' must be 8 or 11 characters (Error T27/T28)');
        isValid = false;
    }
    
    // T29: BIC format validation
    var bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
    if (!bicPattern.test(bicCode)) {
        $(obj).addClass('error-border');
        showInlineError(obj.id, 'Invalid BIC format: 6 letters + 2 alphanumeric + optional 3 alphanumeric (Error T29)');
        isValid = false;
    }
    
    // Show success if valid
    if (isValid) {
        $(obj).addClass('valid-border');
    }
    
    return isValid;
}

/**
 * Check Long Lines in Text Areas
 */
function checkLongLines(textareaId, fieldName, maxCharsPerLine) {
    var content = $('#' + textareaId).val();
    
    if (content.trim() === '') {
        removeInlineError(textareaId);
        return true;
    }
    
    var lines = content.split('\n');
    var longLines = [];
    
    for (var i = 0; i < lines.length; i++) {
        if (lines[i].length > maxCharsPerLine) {
            longLines.push('Line ' + (i + 1) + ': ' + lines[i].length + ' chars');
        }
    }
    
    if (longLines.length > 0) {
        var message = longLines.length + ' line(s) exceed ' + maxCharsPerLine + ' chars';
        showInlineWarning(textareaId, message);
        console.warn(fieldName + ' - ' + longLines.join(', '));
        return false;
    } else {
        removeInlineError(textareaId);
        return true;
    }
}

/**
 * Show Inline Error Message
 */
function showInlineError(fieldId, message) {
    removeInlineError(fieldId);
    $('#' + fieldId).after('<span class="inline-error" id="err_' + fieldId + '" style="color:red; font-size:9pt; margin-left:10px;">' + message + '</span>');
}

/**
 * Show Inline Warning Message
 */
function showInlineWarning(fieldId, message) {
    removeInlineError(fieldId);
    $('#' + fieldId).after('<span class="inline-warning" id="err_' + fieldId + '" style="color:orange; font-size:9pt; margin-left:10px;">' + message + '</span>');
}

/**
 * Remove Inline Error/Warning
 */
function removeInlineError(fieldId) {
    $('#err_' + fieldId).remove();
}

/**
 * Initialize Field Tooltips
 */
function initializeFieldTooltips() {
    var tooltips = {
        '_020_mf27_number': 'Sequence number: must be 1 (range: 1-8).',
        '_021_mf27_total': 'Total number of messages (range: 1-8).',
        '_030_mf22a_purpose_of_message': 'Purpose: ACNF, ADVI, ICCO, ISCO, or ISSU.',
        '_040_of72Z_sender_receiver_information': 'Max 6 lines × 35 characters. Additional information for receiver.',
        '_050_of23x_file_identification': 'Type of delivery channel (COUR, EMAL, FACT, FAXT, HOST, MAIL, OTHR).',
        '_070_mf20_undertaking_number': 'Unique undertaking identifier assigned by issuer. Cannot start/end with "/" or contain "//".',
        '_080_mf30_date_of_issue': 'Date in YYMMDD format (e.g., 251006 for Oct 6, 2025).',
        '_090_mf22d_form_of_undertaking': 'Form: DGAR (Demand Guarantee) or STBY (Standby Letter of Credit).',
        '_100_mf40c_applicable_rules': 'Rules: ISPR, NONE, OTHR, UCPR, or URDG. If OTHR, narrative required.',
        '_110_mf23b_expiry_type': 'COND requires field 35G. FIXD requires field 31E. OPEN does not allow 23F.',
        '_120_of31e_date_of_expiry': 'Date in YYMMDD format. Required if 23B is FIXD.',
        '_130_of35g_expiry_condition_event': 'Required when 23B is COND. Max 12 lines × 65 chars.',
        '_140_of50_applicant': 'Required when 22A is ISSU. Max 4 lines × 35 chars.',
        '_150_of51_obligor_instructing_party': 'Party obligated to reimburse issuer. Max 4 lines × 35 chars.',
        '_160_mf52a_issuer': 'Select issuer type: Option A (BIC) or Option D (Name & Address).',
        '_162_mf52a_identifier_code': '8 or 11 character BIC code. Must be a registered financial institution (Error C05).',
        '_164_mf52d_name_address': 'Maximum 4 lines × 35 characters.',
        '_170_mf59a_beneficiary': 'No letter option (Name & Address) or Option A (BIC).',
        '_180_of56a_advising_bank': 'Required if field 57a is present (Rule C7).',
        '_190_of23_advising_bank_reference': 'Reference assigned by advising bank. Max 16 chars.',
        '_200_of57a_advise_through_bank': 'Additional bank requested to advise undertaking.',
        '_210_mf32b_currency': 'ISO 4217 currency code (3 letters, e.g., USD).',
        '_211_mf32b_amount': 'Amount with mandatory comma for decimals (e.g., 10000,00).',
        '_220_of39f_supplementary_information_about_amount': 'Max 12 lines × 65 chars. Codes: ADAM, INFO, INTR, MUCU, TOLR.',
        '_230_of41a_available_with': 'Not allowed if 22D is DGAR (Rule C11).',
        '_240_of71D_charges': 'Max 6 lines × 35 chars. Information about charges.',
        '_250_of45c_document_and_presentation_instructions': 'Max 100 lines × 65 chars. Presentation instructions and required documents.',
        '_260_mf77u_undertaking_terms_and_conditions': 'Max 150 lines × 65 chars. Terms and conditions not in other fields.',
        '_270_of49_confirmation_instructions': 'Required if 22A is ISSU and 22D is STBY (Rule C5). Not allowed if 22D is DGAR.',
        '_280_of58a_requested_confirmation_party': 'Required if field 49 is CONFIRM or MAY ADD (Rule C9).',
        '_290_of44j_country_code': 'ISO 3166-1 country code (2 letters).',
        '_300_of23f_automatic_extension_period': 'Not allowed if 23B is OPEN (Rule C3). DAYS/ONEY/OTHR.',
        '_310_of78_automatic_extension_non_extension_notification': 'Required if field 23F present (Rule C8). Max 12 lines × 65 chars.',
        '_320_of26e_automatic_extension_notification_period': 'Required if field 23F present (Rule C8). Min days before expiry (3 digits).',
        '_330_of31s_automatic_extension_final_expiry_date': 'Required if field 23F present (Rule C8). Date in YYMMDD format.',
        '_340_of48b_demand_indicator': 'NMLT, NMPT, or NPRT. Specifies partial/multiple demands.',
        '_350_of48d_transfer_indicator': 'Not allowed if 22A is ISCO/ICCO (Rule C6). TRAN = transferable.',
        '_360_of39e_transfer_conditions': 'Max 12 lines × 65 chars. Transfer conditions if more details needed.',
        '_370_of45l_underlying_transaction_details': 'Required if 22A is ISSU (Rule C6). Max 50 lines × 65 chars.',
        '_380_of24e_delivery_of_original_undertaking': 'Not allowed if 22A is ISCO/ICCO (Rule C6).',
        '_390_of24g_delivery_to_collection_by': 'Not allowed if 22A is ISCO/ICCO (Rule C6).',
        '_400_mf15c_new_sequence': 'Start of Sequence C. Only if 22A is ISCO/ICCO (Rule C6).',
        '_420_mf22d_form_of_undertaking': 'Form: DEPU, DGAR, or STBY.',
        '_430_mf40c_applicable_rules': 'Rules: ISPR, NONE, OTHR, UCPR, or URDG.',
        '_440_of22k_type_of_undertaking': 'Required if field 22Y is STND (Rule C10).',
        '_450_mf23b_expiry_type': 'COND requires field 35G. FIXD requires field 31E. OPEN does not allow 23F.',
        '_480_of50_applicant': 'Required in Sequence C. Max 4 lines × 35 chars.',
        '_510_mf59_beneficiary': 'Account and Name & Address required.',
        '_520_mf32b_currency': 'ISO 4217 currency code (3 letters).',
        '_521_mf32b_amount': 'Amount with mandatory comma for decimals.',
        '_590_of22y_standard_wording_required': 'STND = Standard wording required.',
        '_600_of40d_standard_wording_reqested_language': 'ISO 639 language code (2 letters).',
        '_690_mf45l_underlying_transaction_details': 'Required in Sequence C. Max 50 lines × 65 chars.'
    };
    
    for (var fieldId in tooltips) {
        if ($('#' + fieldId).length) {
            $('#' + fieldId).attr('title', tooltips[fieldId]);
        }
    }
}

/**
 * Helper Functions
 */
function textonly(e) {
    var code;
    if (!e)
        var e = window.event;
    if (e.keyCode)
        code = e.keyCode;
    else if (e.which)
        code = e.which;
    var character = String.fromCharCode(code);

    var AllowRegex = /^[\ba-zA-Z\s-]$/;
    if (AllowRegex.test(character))
        return true;
    return false;
}

function numbersonly(e, obj) {
    var charCode = (e.which) ? e.which : event.keyCode;
    if (document.getElementById(obj)) {
        if (document.getElementById(obj).value.toUpperCase() == "JPY") {
            if (charCode > 31 && (charCode < 48 || charCode > 57))
            {
                return false;
            }
        } else {
            if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 44)
            {
                return false;
            }
        }
    } else {
        if (charCode > 31 && (charCode < 48 || charCode > 57))
        {
            return false;
        }
    }
    return true;
}

function numbersonly2(e) {
    var charCode = (e.which)
    ? e.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
    {
        return false;
    }
    return true;
}

function cek_koma(obj) {
    var koma = false;
    for (i = 0; i < obj.value.length; i++) {
        if (obj.value.substr(i, 1) == ",") {
            koma = true;
        }
    }
    if (koma == false)
    {
        if (obj.value.length > 0) {
            obj.value = obj.value + ",";
        }
    }
}

function cek_slash(obj) {
    var slash = false;
    for (i = 0; i < obj.value.length; i++) {
        if (obj.value.substr(i, 1) == "/") {
            slash = true;
        }
    }
    if (slash == false)
    {
        if (obj.value.length > 1) {
            obj.value = "/" + obj.value;
        }
    }
}

function avoidSplChars(e) {
    e = e || window.event;
    var bad = /[^\sa-z\d\.\,\'\(\)\-\/\:]/i,
        key = String.fromCharCode(e.keyCode || e.which);

    if (e.which !== 0 && e.charCode !== 0 && bad.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}

var hasShownAlert = false;
function checkZeroAmount(inputID) {
    const amountInput = document.getElementById(inputID);
    const value = amountInput.value.trim().replace(',', '.'); 

    if (value !== "" && parseFloat(value) === 0) {
        if (!hasShownAlert) {
            hasShownAlert = true;
            alert("Amount must not be 0 (zero)");
            setTimeout(() => {
                amountInput.focus();
                hasShownAlert = false;
            }, 100);
        }
    }
}

/* ===== Utilities ===== */
function q(id) { return document.getElementById(id); }
function show(id, on = true) { const el = q(id); if (el) el.style.display = on ? "block" : "none"; }
function val(id) { const el = q(id); return el ? (el.value || "").trim() : ""; }
function isEmpty(v) { return !v || v.trim() === ""; }

/* ===== Format Helpers ===== */
function formatAmountInput(el) { 
    el.value = el.value.replace(/[^0-9,]/g, ''); 
}

function formatAmountBlur(el) {
    let v = el.value;
    if (!v) return;
    if (v.indexOf(",") === -1) { 
        v = v + ",00"; 
    } else {
        let parts = v.split(",");
        let intPart = String(parseInt(parts[0] || "0", 10));
        let decPart = (parts[1] || "").padEnd(2, "0").substring(0, 2);
        v = intPart + "," + decPart;
    }
    el.value = v;
}

/* ===== Datepicker (YYMMDD) ===== */
function yymmdd(id) {
    const el = q(id);
    if (!el) return;
    if (typeof jQuery === "undefined" || !jQuery.fn || !jQuery.fn.datepicker) return;

    jQuery(function($) {
        $("#" + id).datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+10",
            showAnim: "fadeIn",
            dateFormat: 'yymmdd',
            onSelect: function() {
                const d = $(this).datepicker('getDate');
                if (d) {
                    const yy = String(d.getFullYear()).slice(-2);
                    const mm = String(d.getMonth() + 1).padStart(2, '0');
                    const dd = String(d.getDate()).padStart(2, '0');
                    this.value = yy + mm + dd;
                }
            }
        });

        const cur = el.value && el.value.trim();
        if (cur && /^\d{6}$/.test(cur)) {
            const yy = parseInt(cur.slice(0,2), 10);
            const mm = parseInt(cur.slice(2,4), 10);
            const dd = parseInt(cur.slice(4,6), 10);
            const thisYear = new Date().getFullYear();
            const thisCentury = Math.floor(thisYear / 100) * 100;
            let fullYear = thisCentury + yy;
            if (fullYear - thisYear > 10) fullYear -= 100;
            try { 
                $(el).datepicker('setDate', new Date(fullYear, mm - 1, dd)); 
            } catch(e) {
                console.warn('Date parsing error:', e);
            }
        }
    });
}

/**
 * Setup Option Field Toggles (52a, 59a, 56a, 57a, 58a, 41a)
 */
$(document).ready(function() {
    // ===== MF52a Issuer (Sequence B) =====
    $('#_160_mf52a_issuer').on('change', function() {
        toggleOptionField('_160_mf52a_issuer', {
            'a': ['div_mf52a_issuer'],
            'd': ['div_mf52d_issuer']
        });
    });
    
    // Initialize on load
    toggleOptionField('_160_mf52a_issuer', {
        'a': ['div_mf52a_issuer'],
        'd': ['div_mf52d_issuer']
    });
    
    // ===== OF52a Issuer (Sequence C) =====
    $('#_500_of52a_issuer').on('change', function() {
        toggleOptionField('_500_of52a_issuer', {
            'a': ['div_of52a_issuer'],
            'd': ['div_of52d_issuer']
        });
    });
    
    toggleOptionField('_500_of52a_issuer', {
        'a': ['div_of52a_issuer'],
        'd': ['div_of52d_issuer']
    });
    
    // ===== MF59a Beneficiary (Sequence B) =====
    $('#_170_mf59a_beneficiary').on('change', function() {
        toggleOptionField('_170_mf59a_beneficiary', {
            'no': ['div_mf59no_beneficiary'],
            'a': ['div_mf59a_beneficiary']
        });
    });
    
    toggleOptionField('_170_mf59a_beneficiary', {
        'no': ['div_mf59no_beneficiary'],
        'a': ['div_mf59a_beneficiary']
    });
    
    // ===== OF56a Advising Bank =====
    $('#_180_of56a_advising_bank').on('change', function() {
        toggleOptionField('_180_of56a_advising_bank', {
            'a': ['div_of56a_advising_bank'],
            'd': ['div_of56d_advising_bank']
        });
    });
    
    toggleOptionField('_180_of56a_advising_bank', {
        'a': ['div_of56a_advising_bank'],
        'd': ['div_of56d_advising_bank']
    });
    
    // ===== OF57a Advise Through Bank (Sequence B) =====
    $('#_200_of57a_advise_through_bank').on('change', function() {
        toggleOptionField('_200_of57a_advise_through_bank', {
            'a': ['div_of57a_advise_through_bank'],
            'd': ['div_of57d_advise_through_bank']
        });
    });
    
    toggleOptionField('_200_of57a_advise_through_bank', {
        'a': ['div_of57a_advise_through_bank'],
        'd': ['div_of57d_advise_through_bank']
    });
    
    // ===== OF41a Available With (Sequence B) =====
    $('#_230_of41a_available_with').on('change', function() {
        toggleOptionField('_230_of41a_available_with', {
            'f': ['div_of41f_avaliable_with'],
            'g': ['div_of41g_avaliable_with']
        });
    });
    
    toggleOptionField('_230_of41a_available_with', {
        'f': ['div_of41f_avaliable_with'],
        'g': ['div_of41g_avaliable_with']
    });
    
    // ===== OF58a Requested Confirmation Party =====
    $('#_280_of58a_requested_confirmation_party').on('change', function() {
        toggleOptionField('_280_of58a_requested_confirmation_party', {
            'a': ['div_of58a_requested_confirmation_party'],
            'd': ['div_of58d_requested_confirmation_party']
        });
    });
    
    toggleOptionField('_280_of58a_requested_confirmation_party', {
        'a': ['div_of58a_requested_confirmation_party'],
        'd': ['div_of58d_requested_confirmation_party']
    });
    
    // ===== OF57a Advise Through Bank (Sequence C) =====
    $('#_540_of57a_advise_through_bank').on('change', function() {
        toggleOptionField('_540_of57a_advise_through_bank', {
            'a': ['div_of57a_advise_through_bank'],
            'd': ['div_of57d_advise_through_bank']
        });
    });
    
    toggleOptionField('_540_of57a_advise_through_bank', {
        'a': ['div_of57a_advise_through_bank'],
        'd': ['div_of57d_advise_through_bank']
    });
    
    // ===== OF41a Available With (Sequence C) =====
    $('#_550_of41a_available_with').on('change', function() {
        toggleOptionField('_550_of41a_available_with', {
            'f': ['div_of41f_avaliable_with_2'],
            'g': ['div_of41g_avaliable_with_2']
        });
    });
    
    toggleOptionField('_550_of41a_available_with', {
        'f': ['div_of41f_avaliable_with_2'],
        'g': ['div_of41g_avaliable_with_2']
    });
});

/**
 * Generic Toggle Function for Option Fields
 */
function toggleOptionField(selectId, optionMap) {
    var selectedValue = $('#' + selectId).val();
    
    // Hide all divs first
    Object.keys(optionMap).forEach(function(key) {
        optionMap[key].forEach(function(divId) {
            $('#' + divId).hide();
            // Disable fields within hidden divs
            $('#' + divId + ' input, #' + divId + ' textarea, #' + divId + ' select').prop('disabled', true);
        });
    });
    
    // Show divs for selected option
    if (optionMap[selectedValue]) {
        optionMap[selectedValue].forEach(function(divId) {
            $('#' + divId).show();
            // Enable fields within shown divs
            $('#' + divId + ' input, #' + divId + ' textarea, #' + divId + ' select').prop('disabled', false);
        });
    }
}

/**
 * Validate ISO Currency Code (T52)
 */
function validateCurrencyCode(currencyFieldId) {
    var currency = $('#' + currencyFieldId).val().trim().toUpperCase();
    
    // Clear previous feedback
    $('#' + currencyFieldId).removeClass('error-border valid-border');
    removeInlineError(currencyFieldId);
    
    if (currency === '') {
        return true;
    }
    
    var isValid = true;
    
    // Must be exactly 3 letters
    if (!/^[A-Z]{3}$/.test(currency)) {
        $('#' + currencyFieldId).addClass('error-border');
        showInlineError(currencyFieldId, 'Currency must be 3 letters (Error T52)');
        isValid = false;
    }
    
    // Show success if valid
    if (isValid) {
        $('#' + currencyFieldId).addClass('valid-border');
    }
    
    return isValid;
}

/**
 * Validate Amount Format (T40, T43, C03)
 */
function validateAmountFormat(amountFieldId, currencyFieldId) {
    var amount = $('#' + amountFieldId).val().trim();
    var currency = $('#' + currencyFieldId).val().trim().toUpperCase();
    
    // Clear previous feedback
    $('#' + amountFieldId).removeClass('error-border valid-border');
    removeInlineError(amountFieldId);
    
    if (amount === '') {
        return true;
    }
    
    var isValid = true;
    
    // T40: Must contain comma
    if (amount.indexOf(',') === -1) {
        $('#' + amountFieldId).addClass('error-border');
        showInlineError(amountFieldId, 'Amount must contain decimal comma (Error T40)');
        isValid = false;
    } else {
        // T43: Validate decimal places based on currency
        var parts = amount.split(',');
        var decimalPart = parts[1] || '';
        
        // C03: Check max decimal places for currency
        var maxDecimals = 2; // Default
        if (currency === 'JPY' || currency === 'KRW') {
            maxDecimals = 0;
        } else if (currency === 'BHD' || currency === 'IQD' || currency === 'JOD' || 
                   currency === 'KWD' || currency === 'LYD' || currency === 'OMR' || currency === 'TND') {
            maxDecimals = 3;
        }
        
        if (decimalPart.length > maxDecimals) {
            $('#' + amountFieldId).addClass('error-border');
            showInlineError(amountFieldId, 'Max ' + maxDecimals + ' decimal places for ' + currency + ' (Error C03)');
            isValid = false;
        }
        
        // T40: Integer part must have at least one digit
        if (parts[0] === '' || parts[0] === '0') {
            if (parseFloat(amount.replace(',', '.')) === 0) {
                $('#' + amountFieldId).addClass('error-border');
                showInlineError(amountFieldId, 'Amount must not be zero');
                isValid = false;
            }
        }
    }
    
    // Show success if valid
    if (isValid) {
        $('#' + amountFieldId).addClass('valid-border');
    }
    
    return isValid;
}

/**
 * Setup Currency and Amount Validation
 */
$(document).ready(function() {
    // Sequence B - Field 32B
    $('#_210_mf32b_currency').on('blur', function() {
        validateCurrencyCode('_210_mf32b_currency');
    });
    
    $('#_211_mf32b_amount').on('blur', function() {
        validateAmountFormat('_211_mf32b_amount', '_210_mf32b_currency');
    });
    
    // Sequence C - Field 32B
    $('#_520_mf32b_currency').on('blur', function() {
        validateCurrencyCode('_520_mf32b_currency');
    });
    
    $('#_521_mf32b_amount').on('blur', function() {
        validateAmountFormat('_521_mf32b_amount', '_520_mf32b_currency');
    });
});

/**
 * Validate Country Code (T73)
 */
function validateCountryCode(countryFieldId) {
    var country = $('#' + countryFieldId).val().trim().toUpperCase();
    
    // Clear previous feedback
    $('#' + countryFieldId).removeClass('error-border valid-border');
    removeInlineError(countryFieldId);
    
    if (country === '') {
        return true;
    }
    
    var isValid = true;
    
    // Must be exactly 2 letters
    if (!/^[A-Z]{2}$/.test(country)) {
        $('#' + countryFieldId).addClass('error-border');
        showInlineError(countryFieldId, 'Country code must be 2 letters (Error T73)');
        isValid = false;
    }
    
    // Show success if valid
    if (isValid) {
        $('#' + countryFieldId).addClass('valid-border');
    }
    
    return isValid;
}

/**
 * Setup Country Code Validation
 */
$(document).ready(function() {
    $('#_290_of44j_country_code').on('input', function() {
        $(this).val($(this).val().toUpperCase().replace(/[^A-Z]/g, ''));
    });
    
    $('#_290_of44j_country_code').on('blur', function() {
        validateCountryCode('_290_of44j_country_code');
    });
    
    $('#_610_of44h_country_code').on('input', function() {
        $(this).val($(this).val().toUpperCase().replace(/[^A-Z]/g, ''));
    });
    
    $('#_610_of44h_country_code').on('blur', function() {
        validateCountryCode('_610_of44h_country_code');
    });
    
    // Limit to 2 characters
    $('#_290_of44j_country_code, #_610_of44h_country_code').attr('maxlength', 2);
});

/**
 * Validate Language Code (OF40D)
 */
function validateLanguageCode(languageFieldId) {
    var language = $('#' + languageFieldId).val().trim().toLowerCase();
    
    // Clear previous feedback
    $('#' + languageFieldId).removeClass('error-border valid-border');
    removeInlineError(languageFieldId);
    
    if (language === '') {
        return true;
    }
    
    var isValid = true;
    
    // Must be exactly 2 lowercase letters
    if (!/^[a-z]{2}$/.test(language)) {
        $('#' + languageFieldId).addClass('error-border');
        showInlineError(languageFieldId, 'Language code must be 2 lowercase letters (ISO 639)');
        isValid = false;
    }
    
    // Show success if valid
    if (isValid) {
        $('#' + languageFieldId).addClass('valid-border');
    }
    
    return isValid;
}

/**
 * Setup Language Code Validation
 */
$(document).ready(function() {
    $('#_600_of40d_standard_wording_reqested_language').on('input', function() {
        $(this).val($(this).val().toLowerCase().replace(/[^a-z]/g, ''));
    });
    
    $('#_600_of40d_standard_wording_reqested_language').on('blur', function() {
        validateLanguageCode('_600_of40d_standard_wording_reqested_language');
    });
    
    // Limit to 2 characters
    $('#_600_of40d_standard_wording_reqested_language').attr('maxlength', 2);
});

/**
 * Add visual feedback styles
 */
$(document).ready(function() {
    // Add CSS for error and valid borders if not already present
    if (!$('#mt760-validation-styles').length) {
        $('<style id="mt760-validation-styles">')
            .text(`
                .error-border {
                    border: 2px solid #dc3545 !important;
                    background-color: #fff5f5 !important;
                }
                .valid-border {
                    border: 2px solid #28a745 !important;
                    background-color: #f0fff4 !important;
                }
                .inline-error, .inline-warning {
                    display: inline-block;
                    font-weight: bold;
                    animation: fadeIn 0.3s;
                }
                @keyframes fadeIn {
                    from { opacity: 0; }
                    to { opacity: 1; }
                }
            `)
            .appendTo('head');
    }
});

/**
 * Form submission validation wrapper
 */
function validateMT760() {
    console.log('Validating MT760 form...');
    
    var isValid = true;
    var errors = [];
    
    // Validate all required fields have values
    $('.mandatory').each(function() {
        if (!$(this).prop('disabled') && $(this).val().trim() === '') {
            errors.push($(this).attr('input_type') || $(this).attr('id') + ' is required');
            $(this).addClass('error-border');
            isValid = false;
        }
    });
    
    // If validation fails, show errors
    if (!isValid) {
        console.error('Validation errors:', errors);
        alert('Please fill in all required fields:\n\n' + errors.join('\n'));
    }
    
    return isValid;
}

// Export validation function for form onsubmit
window.validateMT760 = validateMT760;

console.log('MT760.js loaded successfully');