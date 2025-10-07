/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

/* 
 * mt767.js
 */

$(document).ready(function() {
    // Initialize form on page load
    initializeMT767Form();
    
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
});

/**
 * Initialize MT 767 Form
 */
function initializeMT767Form() {
    console.log('Initializing MT 767 form...');
    
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
    
    // Only allow numbers 0-9
    $('#_020_mf27_number, #_021_mf27_total').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    // ===== FIELD 21: Related Reference =====
    $('#_030_mf21_related_reference').on('blur', function() {
        validateField21Realtime();
    });
    
    $('#_030_mf21_related_reference').on('keypress', function(e) {
        return avoidSplChars(e);
    });
    
    // ===== FIELD 20: Undertaking Number =====
    $('#_090_mf20_undertaking_number').on('blur', function() {
        validateField20Realtime();
    });
    
    $('#_090_mf20_undertaking_number').on('keypress', function(e) {
        return avoidSplChars(e);
    });
    
    // ===== FIELD 26E: Number of Amendment =====
    $('#_100_mf26e_number_of_amendment').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    // ===== FIELD 30: Date of Amendment =====
    $('#_110_mf30_date_of_amendment').on('blur', function() {
        validateDateFormat(this, 'Date of Amendment');
    });
    
    $('#_110_mf30_date_of_amendment').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    // ===== FIELD 31E: Date of Expiry (Sequence B) =====
    $('#_170_of31e_date_of_expiry').on('blur', function() {
        validateDateFormat(this, 'Date of Expiry (Seq B)');
    });
    
    $('#_170_of31e_date_of_expiry').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    // ===== FIELD 31E: Date of Expiry (Sequence C) =====
    $('#_270_of31e_date_of_expiry').on('blur', function() {
        validateDateFormat(this, 'Date of Expiry (Seq C)');
    });
    
    $('#_270_of31e_date_of_expiry').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    // ===== FIELD 52a: BIC Code =====
    $('#_122_mf52a_identifier_code').on('input', function() {
        // Auto uppercase
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_122_mf52a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Issuer BIC');
    });
    
    // ===== FIELD 59a: BIC Code =====
    $('#_194_of59a_identifier_code').on('input', function() {
        // Auto uppercase
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_194_of59a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Beneficiary BIC');
    });
    
    // ===== FIELD 32B/33B: Amount validation =====
    $('#_141_of32b_amount, #_151_of33b_amount, #_241_of32b_amount, #_251_of33b_amount').on('keypress', function(e) {
        var currencyField = $(this).attr('id').replace('amount', 'currency');
        return numbersonly(e, currencyField);
    });
    
    $('#_141_of32b_amount').on('blur', function() {
        cek_koma(this);
        checkZeroAmount(this.id);
    });
    
    $('#_151_of33b_amount').on('blur', function() {
        cek_koma(this);
        checkZeroAmount(this.id);
    });
    
    $('#_241_of32b_amount').on('blur', function() {
        cek_koma(this);
        checkZeroAmount(this.id);
    });
    
    $('#_251_of33b_amount').on('blur', function() {
        cek_koma(this);
        checkZeroAmount(this.id);
    });
    
    // ===== Party Identifier slash validation =====
    $('#_121_mf52a_party_identifier, #_123_mf52d_party_identifier, #_191_of59a_account, #_193_of59a_account, #_290_of59_beneficiary').on('blur', function() {
        cek_slash(this);
    });
    
    // ===== Text Area validations =====
    $('#_200_of77u_other_amandments_to_undertaking').on('blur', function() {
        checkLongLines('_200_of77u_other_amandments_to_undertaking', 'OF77U', 65);
    });
    
    $('#_300_of77l_other_amandments_to_local_undertaking').on('blur', function() {
        checkLongLines('_300_of77l_other_amandments_to_local_undertaking', 'OF77L', 65);
    });
}

/**
 * Setup Field Toggles
 */
function setupFieldToggles() {
    // Toggle OF23X File Identification - Usage Rules
    $('#_070_of23x_file_identification').on('change', function() {
        toggleOF23X();
    });
    
    // Toggle OF24E Delivery (Sequence B) - Additional Information
    $('#_210_of24e_delivery_of_amendment_to_undertaking').on('change', function() {
        toggleOF24E_SeqB();
    });
    
    // Toggle OF24G Delivery To/Collection By (Sequence B) - Narrative
    $('#_220_of24g_delivery_to_collection_by').on('change', function() {
        toggleOF24G_SeqB();
    });
    
    // Toggle OF24E Delivery (Sequence C) - Additional Information
    $('#_310_of24e_delivery_of_amendment_to_undertaking').on('change', function() {
        toggleOF24E_SeqC();
    });
    
    // Toggle OF24G Delivery To/Collection By (Sequence C) - Narrative
    $('#_320_of24g_delivery_to_collection_by').on('change', function() {
        toggleOF24G_SeqC();
    });
    
    // Initialize toggles on page load
    toggleOF23X();
    toggleOF24E_SeqB();
    toggleOF24G_SeqB();
    toggleOF24E_SeqC();
    toggleOF24G_SeqC();
}

/**
 * Toggle OF23X Usage Rules field
 */
function toggleOF23X() {
    var code = $('#_070_of23x_file_identification').val();
    var usageRulesField = $('#_071_of23x_file_name_or_reference');
    
    if (code === 'OTHR' || code === 'COUR') {
        usageRulesField.closest('.form-row').show();
        usageRulesField.attr('disabled', false);
    } else {
        usageRulesField.closest('.form-row').hide();
        usageRulesField.attr('disabled', true);
        if (code !== '') {
            usageRulesField.val('');
        }
    }
}

/**
 * Toggle OF24E Additional Information (Sequence B)
 */
function toggleOF24E_SeqB() {
    var code = $('#_210_of24e_delivery_of_amendment_to_undertaking').val();
    var additionalInfoField = $('#_211_of24e_narrative');
    
    if (code === 'OTHR' || code === 'COUR') {
        additionalInfoField.closest('.form-row').show();
        additionalInfoField.attr('disabled', false);
    } else {
        additionalInfoField.closest('.form-row').hide();
        additionalInfoField.attr('disabled', true);
        if (code !== '') {
            additionalInfoField.val('');
        }
    }
}

/**
 * Toggle OF24G Narrative (Sequence B)
 */
function toggleOF24G_SeqB() {
    var code = $('#_220_of24g_delivery_to_collection_by').val();
    var narrativeField = $('#_220_of24g_narrative');
    
    if (code === 'OTHR') {
        narrativeField.closest('.form-row').show();
        narrativeField.attr('disabled', false);
    } else {
        narrativeField.closest('.form-row').hide();
        narrativeField.attr('disabled', true);
        if (code !== '') {
            narrativeField.val('');
        }
    }
}

/**
 * Toggle OF24E Additional Information (Sequence C)
 */
function toggleOF24E_SeqC() {
    var code = $('#_310_of24e_delivery_of_amendment_to_undertaking').val();
    var additionalInfoField = $('#_311_of24e_narrative');
    
    if (code === 'OTHR' || code === 'COUR') {
        additionalInfoField.closest('.form-row').show();
        additionalInfoField.attr('disabled', false);
    } else {
        additionalInfoField.closest('.form-row').hide();
        additionalInfoField.attr('disabled', true);
        if (code !== '') {
            additionalInfoField.val('');
        }
    }
}

/**
 * Toggle OF24G Narrative (Sequence C)
 */
function toggleOF24G_SeqC() {
    var code = $('#_320_of24g_delivery_to_collection_by').val();
    var narrativeField = $('#_320_of24g_narrative');
    
    if (code === 'OTHR') {
        narrativeField.closest('.form-row').show();
        narrativeField.attr('disabled', false);
    } else {
        narrativeField.closest('.form-row').hide();
        narrativeField.attr('disabled', true);
        if (code !== '') {
            narrativeField.val('');
        }
    }
}

/**
 * Setup Date Pickers (YYMMDD format)
 */
function setupDatePickers() {
    // Date fields to apply datepicker
    var dateFields = [
        '_110_mf30_date_of_amendment',
        '_170_of31e_date_of_expiry',
        '_270_of31e_date_of_expiry'
    ];
    
    dateFields.forEach(function(fieldId) {
        yymmdd(fieldId);
    });
}

/**
 * Setup Currency Fields (Auto-uppercase)
 */
function setupCurrencyFields() {
    // Currency fields
    var currencyFields = [
        '_140_of32b_currency',
        '_150_of33b_currency',
        '_240_of32b_currency',
        '_250_of33b_currency'
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
    // Amount fields
    var amountFields = [
        '_141_of32b_amount',
        '_151_of33b_amount',
        '_241_of32b_amount',
        '_251_of33b_amount'
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
function setupCharacterCounters() {
    // Create counter elements if they don't exist
    if ($('#counter_77u').length === 0) {
        $('#_200_of77u_other_amandments_to_undertaking').after(
            '<div id="counter_77u" style="font-size:10pt; margin-top:5px; color:green;"></div>'
        );
    }
    
    if ($('#counter_77l').length === 0) {
        $('#_300_of77l_other_amandments_to_local_undertaking').after(
            '<div id="counter_77l" style="font-size:10pt; margin-top:5px; color:green;"></div>'
        );
    }
    
    // Update counters on input
    $('#_200_of77u_other_amandments_to_undertaking').on('input', function() {
        updateCharacterCounter('_200_of77u_other_amandments_to_undertaking', 'counter_77u', 150, 9750);
    });
    
    $('#_300_of77l_other_amandments_to_local_undertaking').on('input', function() {
        updateCharacterCounter('_300_of77l_other_amandments_to_local_undertaking', 'counter_77l', 150, 9750);
    });
    
    // Initialize counters on page load
    updateCharacterCounter('_200_of77u_other_amandments_to_undertaking', 'counter_77u', 150, 9750);
    updateCharacterCounter('_300_of77l_other_amandments_to_local_undertaking', 'counter_77l', 150, 9750);
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
 * Validate Field 21 Real-time (T26)
 */
function validateField21Realtime() {
    var relatedRef = $('#_030_mf21_related_reference').val().trim();
    
    // Clear previous feedback
    $('#_030_mf21_related_reference').removeClass('error-border valid-border');
    removeInlineError('_030_mf21_related_reference');
    
    if (relatedRef === '') {
        return;
    }
    
    var isValid = true;
    
    // T26: Cannot start with slash
    if (relatedRef.startsWith('/')) {
        $('#_030_mf21_related_reference').addClass('error-border');
        showInlineError('_030_mf21_related_reference', 'Cannot start with "/" (Error T26)');
        isValid = false;
    }
    
    // T26: Cannot end with slash
    if (relatedRef.endsWith('/')) {
        $('#_030_mf21_related_reference').addClass('error-border');
        showInlineError('_030_mf21_related_reference', 'Cannot end with "/" (Error T26)');
        isValid = false;
    }
    
    // T26: Cannot contain consecutive slashes
    if (relatedRef.indexOf('//') !== -1) {
        $('#_030_mf21_related_reference').addClass('error-border');
        showInlineError('_030_mf21_related_reference', 'Cannot contain "//" (Error T26)');
        isValid = false;
    }
    
    // Show success if valid
    if (isValid) {
        $('#_030_mf21_related_reference').addClass('valid-border');
    }
}

/**
 * Validate Field 20 Real-time (T26)
 */
function validateField20Realtime() {
    var undertakingNumber = $('#_090_mf20_undertaking_number').val().trim();
    
    // Clear previous feedback
    $('#_090_mf20_undertaking_number').removeClass('error-border valid-border');
    removeInlineError('_090_mf20_undertaking_number');
    
    if (undertakingNumber === '') {
        return;
    }
    
    var isValid = true;
    
    // T26: Cannot start with slash
    if (undertakingNumber.startsWith('/')) {
        $('#_090_mf20_undertaking_number').addClass('error-border');
        showInlineError('_090_mf20_undertaking_number', 'Cannot start with "/" (Error T26)');
        isValid = false;
    }
    
    // T26: Cannot end with slash
    if (undertakingNumber.endsWith('/')) {
        $('#_090_mf20_undertaking_number').addClass('error-border');
        showInlineError('_090_mf20_undertaking_number', 'Cannot end with "/" (Error T26)');
        isValid = false;
    }
    
    // T26: Cannot contain consecutive slashes
    if (undertakingNumber.indexOf('//') !== -1) {
        $('#_090_mf20_undertaking_number').addClass('error-border');
        showInlineError('_090_mf20_undertaking_number', 'Cannot contain "//" (Error T26)');
        isValid = false;
    }
    
    // Show success if valid
    if (isValid) {
        $('#_090_mf20_undertaking_number').addClass('valid-border');
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
 * Validate BIC Code Real-time (T27, T28, T29)
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
        '_020_mf27_number': 'Sequence number: must be 1 (range: 1-8). For MT 767, Number is always 1.',
        '_021_mf27_total': 'Total number of messages (range: 1-8).',
        '_030_mf21_related_reference': 'Related reference from MT 768 acknowledgement or meaningful reference. Cannot start/end with "/" or contain "//".',
        '_040_mf22a_purpose_of_message': 'Purpose: ACNA, ADVA, ICCA, ISCA, or ISUA.',
        '_090_mf20_undertaking_number': 'Must match field 20 in original MT 760/767. Cannot start/end with "/" or contain "//".',
        '_100_mf26e_number_of_amendment': 'Sequence number identifying this amendment (max 3 digits).',
        '_110_mf30_date_of_amendment': 'Date in YYMMDD format (e.g., 251006 for Oct 6, 2025).',
        '_120_mf52a_issuer': 'Select issuer type: Option A (BIC) or Option D (Name & Address).',
        '_122_mf52a_identifier_code': '8 or 11 character BIC code. Must be a registered financial institution.',
        '_124_mf52d_name_address': 'Maximum 4 lines, 35 characters per line.',
        '_130_of23_advising_bank_reference': 'Only allowed when Purpose is ACNA or ADVA (Rule C5).',
        '_140_of32b_currency': 'ISO 4217 currency code (3 letters, e.g., USD).',
        '_141_of32b_amount': 'Amount with mandatory comma for decimals (e.g., 10000,00).',
        '_150_of33b_currency': 'ISO 4217 currency code. Cannot use both 32B and 33B (Rule C1).',
        '_160_of23b_expiry_type': 'COND requires field 35G. FIXD or OPEN does not allow 35G (Rule C2).',
        '_170_of31e_date_of_expiry': 'Date in YYMMDD format.',
        '_180_of35g_expiry_conditions_event': 'Required when 23B is COND (Rule C2). Max 12 lines × 65 chars.',
        '_190_of59a_beneficiary': 'No letter option (Name & Address) or Option A (BIC).',
        '_200_of77u_other_amandments_to_undertaking': 'Max 150 lines × 65 chars per line.',
        '_210_of24e_delivery_of_amendment_to_undertaking': 'Not allowed when Purpose is ISCA/ICCA (Rule C6).',
        '_220_of24g_delivery_to_collection_by': 'Not allowed when Purpose is ISCA/ICCA (Rule C6).',
        '_300_of77l_other_amandments_to_local_undertaking': 'Max 150 lines × 65 chars per line. Only for counter-undertaking.'
    };
    
    for (var fieldId in tooltips) {
        if ($('#' + fieldId).length) {
            $('#' + fieldId).attr('title', tooltips[fieldId]);
        }
    }
}

/**
 * Helper Functions from mt103.js
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
    var charCode = (e.which) ? e.which : event.keyCode;
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
function formatAmountInput(el) { el.value = el.value.replace(/[^0-9,]/g, ''); }
function formatAmountBlur(el) {
  let v = el.value;
  if (!v) return;
  if (v.indexOf(",") === -1) { v = v + ",00"; }
  else {
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
      try { $(el).datepicker('setDate', new Date(fullYear, mm - 1, dd)); } catch(e){}
    }
  });
}