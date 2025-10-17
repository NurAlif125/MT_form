/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


$(document).ready(function() {
    console.log('Initializing MT 767 form...');
    initializeMT767Form();
    setupTabNavigation();
    setupRealtimeValidations();
    setupCharacterCounters();
    setupFieldToggles();
    setupDatePickers();
    setupCurrencyFields();
    setupAmountFields();
    setupDynamicFieldToggles();
    setupSequenceCLogic();
    setupAmountFormatting();
});

function initializeMT767Form() {
    if (!$('#_020_mf27_number').val()) {
        $('#_020_mf27_number').val('1');
    }
    if (!$('#_021_mf27_total').val()) {
        $('#_021_mf27_total').val('1');
    }
    
    initializeFieldTooltips();
    initializeDynamicFields();
}

function initializeDynamicFields() {
    $('#div_mf52a_issuer').hide();
    $('#div_mf52d_issuer').hide();
    $('#div_of59no_beneficiary').hide();
    $('#div_of59a_beneficiary').hide();
    $('#check_seq_c').hide();
    
    var issuerType = $('#_120_mf52a_issuer').val();
    if (issuerType === 'a') {
        $('#div_mf52a_issuer').show();
        $('#_122_mf52a_identifier_code').addClass('mandatory');
    } else if (issuerType === 'd') {
        $('#div_mf52d_issuer').show();
        $('#_124_mf52d_name_address').addClass('mandatory');
    }
    
    var beneficiaryType = $('#_190_of59a_beneficiary').val();
    if (beneficiaryType === 'no') {
        $('#div_of59no_beneficiary').show();
    } else if (beneficiaryType === 'a') {
        $('#div_of59a_beneficiary').show();
    }
    
    var purpose = $('#_040_mf22a_purpose_of_message').val();
    if (purpose === 'ISCA' || purpose === 'ICCA') {
        $('#check_seq_c').show();
    }
}

function setupTabNavigation() {
    $('.tabs li a').click(function(e) {
        e.preventDefault();
        var rel = $(this).attr('rel');
        
        $('.tabcontent').removeClass('active').hide();
        $('#' + rel).addClass('active').show();
        $('.tabs li').removeClass('selected');
        $(this).parent().addClass('selected');
    });
    
    $('.tabs li:has(a[rel="view2"])').addClass('selected');
    $('#view2').addClass('active').show();
}

function setupRealtimeValidations() {
    $('#_020_mf27_number, #_021_mf27_total').on('blur', function() {
        validateField27Realtime();
    }).on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_030_mf21_related_reference').on('blur', function() {
        validateField21Realtime();
    }).on('keypress', function(e) {
        return avoidSplChars(e);
    });
    
    $('#_090_mf20_undertaking_number').on('blur', function() {
        validateField20Realtime();
    }).on('keypress', function(e) {
        return avoidSplChars(e);
    });
    
    $('#_100_mf26e_number_of_amendment').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_110_mf30_date_of_amendment').on('blur', function() {
        validateDateFormat(this, 'Date of Amendment');
    }).on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_170_of31e_date_of_expiry').on('blur', function() {
        validateDateFormat(this, 'Date of Expiry (Seq B)');
    }).on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_270_of31e_date_of_expiry').on('blur', function() {
        validateDateFormat(this, 'Date of Expiry (Seq C)');
    }).on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_122_mf52a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    }).on('blur', function() {
        validateBICRealtime(this, 'Issuer BIC');
    });
    
    $('#_194_of59a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    }).on('blur', function() {
        validateBICRealtime(this, 'Beneficiary BIC');
    });
    
    $('#_141_of32b_amount, #_151_of33b_amount, #_241_of32b_amount, #_251_of33b_amount').on('keypress', function(e) {
        var currencyFieldId = $(this).attr('id').replace('amount', 'currency');
        return numbersonly(e, currencyFieldId);
    });
    
    $('#_141_of32b_amount').on('blur', function() {
        cek_koma(this);
        checkZeroAmount(this.id);
        updateFormattedAmount(this.id, '_140_of32b_currency');
    });
    
    $('#_151_of33b_amount').on('blur', function() {
        cek_koma(this);
        checkZeroAmount(this.id);
        updateFormattedAmount(this.id, '_150_of33b_currency');
    });
    
    $('#_241_of32b_amount').on('blur', function() {
        cek_koma(this);
        checkZeroAmount(this.id);
        updateFormattedAmount(this.id, '_240_of32b_currency');
    });
    
    $('#_251_of33b_amount').on('blur', function() {
        cek_koma(this);
        checkZeroAmount(this.id);
        updateFormattedAmount(this.id, '_250_of33b_currency');
    });
    
    $('#_121_mf52a_party_identifier, #_123_mf52d_party_identifier, #_191_of59a_account, #_193_of59a_account, #_290_of59_beneficiary').on('blur', function() {
        cek_slash(this);
    });
    
    $('#_200_of77u_other_amandments_to_undertaking').on('blur', function() {
        checkLongLines('_200_of77u_other_amandments_to_undertaking', 'OF77U', 65);
    });
    
    $('#_300_of77l_other_amandments_to_local_undertaking').on('blur', function() {
        checkLongLines('_300_of77l_other_amandments_to_local_undertaking', 'OF77L', 65);
    });
}

function setupFieldToggles() {
    $('#_070_of23x_file_identification').on('change', function() {
        toggleOF23X();
    });
    toggleOF23X();

    $('#_210_of24e_delivery_of_amendment_to_undertaking').on('change', function() {
        toggleOF24E_SeqB();
    });
    toggleOF24E_SeqB();
    
    $('#_220_of24g_delivery_to_collection_by').on('change', function() {
        toggleOF24G_SeqB();
    });
    toggleOF24G_SeqB();
    
    $('#_310_of24e_delivery_of_amendment_to_undertaking').on('change', function() {
        toggleOF24E_SeqC();
    });
    toggleOF24E_SeqC();
    
    $('#_320_of24g_delivery_to_collection_by').on('change', function() {
        toggleOF24G_SeqC();
    });
    toggleOF24G_SeqC();
}

function setupDynamicFieldToggles() {
    $('#_120_mf52a_issuer').on('change', function() {
        toggle52aIssuer();
    });
    
    $('#_190_of59a_beneficiary').on('change', function() {
        toggle59aBeneficiary();
    });
}

function setupSequenceCLogic() {
    $('#_040_mf22a_purpose_of_message').on('change', function() {
        toggleSequenceC();
    });
    
    $('#check_seq_C').on('change', function() {
        if ($(this).is(':checked')) {
            $('#check_seq_c').slideDown(300);
        } else {
            $('#check_seq_c').slideUp(300);
        }
    });
}

function setupAmountFormatting() {
    var amountFields = [
        {id: '_141_of32b_amount', displayId: 'display_141'},
        {id: '_151_of33b_amount', displayId: 'display_151'},
        {id: '_241_of32b_amount', displayId: 'display_241'},
        {id: '_251_of33b_amount', displayId: 'display_251'}
    ];
    
    amountFields.forEach(function(field) {
        if ($('#' + field.displayId).length === 0) {
            $('#' + field.id).after(
                '<span id="' + field.displayId + '" style="margin-left:50px; color:red; font-size:10pt;"></span>'
            );
        }
    });
}

function toggle52aIssuer() {
    var issuerType = $('#_120_mf52a_issuer').val();
    
    $('#div_mf52a_issuer').hide();
    $('#div_mf52d_issuer').hide();

    $('#_121_mf52a_party_identifier').val('');
    $('#_122_mf52a_identifier_code').val('').removeClass('mandatory');
    $('#_123_mf52d_party_identifier').val('');
    $('#_124_mf52d_name_address').val('').removeClass('mandatory');
    
    if (issuerType === 'a') {
        $('#div_mf52a_issuer').show();
        $('#_122_mf52a_identifier_code').addClass('mandatory');
    } else if (issuerType === 'd') {
        $('#div_mf52d_issuer').show();
        $('#_124_mf52d_name_address').addClass('mandatory');
    }
}

function toggle59aBeneficiary() {
    var beneficiaryType = $('#_190_of59a_beneficiary').val();
    
    $('#div_of59no_beneficiary').hide();
    $('#div_of59a_beneficiary').hide();
    
    $('#_191_of59a_account').val('');
    $('#_192_of59a_name_address').val('');
    $('#_193_of59a_account').val('');
    $('#_194_of59a_identifier_code').val('');
    
    if (beneficiaryType === 'no') {
        $('#div_of59no_beneficiary').show();
    } else if (beneficiaryType === 'a') {
        $('#div_of59a_beneficiary').show();
    }
}

function toggleSequenceC() {
    var purpose = $('#_040_mf22a_purpose_of_message').val();
    
    if (purpose === 'ISCA' || purpose === 'ICCA') {
        $('#check_seq_c').parent().show();
        $('#check_seq_C').prop('checked', true);
        $('#check_seq_c').show();
    } else {
        $('#check_seq_c').parent().show();
        $('#check_seq_C').prop('checked', false);
        $('#check_seq_c').hide();
        clearSequenceCFields();
    }
}

function clearSequenceCFields() {
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

function toggleOF23X() {
    var code = $('#_070_of23x_file_identification').val();
    var fileNameField = $('#_071_of23x_file_name_or_reference');
    
    if (code === 'OTHR' || code === 'COUR') {
        fileNameField.closest('.form-row').show();
        fileNameField.prop('disabled', false);
    } else {
        fileNameField.closest('.form-row').hide();
        fileNameField.prop('disabled', true);
        if (code !== '') {
            fileNameField.val('');
        }
    }
}

function toggleOF24E_SeqB() {
    var code = $('#_210_of24e_delivery_of_amendment_to_undertaking').val();
    var additionalInfoField = $('#_211_of24e_narrative');
    
    if (code === 'OTHR' || code === 'COUR') {
        additionalInfoField.closest('.form-row').show();
        additionalInfoField.prop('disabled', false);
    } else {
        additionalInfoField.closest('.form-row').hide();
        additionalInfoField.prop('disabled', true);
        if (code !== '') {
            additionalInfoField.val('');
        }
    }
}

function toggleOF24G_SeqB() {
    var code = $('#_220_of24g_delivery_to_collection_by').val();
    var narrativeField = $('#_221_of24g_narrative'); // ✅ FIXED ID
    
    if (code === 'OTHR') {
        narrativeField.closest('.form-row').show();
        narrativeField.prop('disabled', false);
    } else {
        narrativeField.closest('.form-row').hide();
        narrativeField.prop('disabled', true);
        if (code !== '') {
            narrativeField.val('');
        }
    }
}

function toggleOF24E_SeqC() {
    var code = $('#_310_of24e_delivery_of_amendment_to_undertaking').val();
    var additionalInfoField = $('#_311_of24e_narrative');
    
    if (code === 'OTHR' || code === 'COUR') {
        additionalInfoField.closest('.form-row').show();
        additionalInfoField.prop('disabled', false);
    } else {
        additionalInfoField.closest('.form-row').hide();
        additionalInfoField.prop('disabled', true);
        if (code !== '') {
            additionalInfoField.val('');
        }
    }
}

function toggleOF24G_SeqC() {
    var code = $('#_320_of24g_delivery_to_collection_by').val();
    var narrativeField = $('#_321_of24g_narrative'); 
    
    if (code === 'OTHR') {
        narrativeField.closest('.form-row').show();
        narrativeField.prop('disabled', false);
    } else {
        narrativeField.closest('.form-row').hide();
        narrativeField.prop('disabled', true);
        if (code !== '') {
            narrativeField.val('');
        }
    }
}

function setupDatePickers() {
    var dateFields = [
        '_110_mf30_date_of_amendment',
        '_170_of31e_date_of_expiry',
        '_270_of31e_date_of_expiry'
    ];
    
    dateFields.forEach(function(fieldId) {
        yymmdd(fieldId);
    });
}

function setupCurrencyFields() {
    var currencyFields = [
        '_140_of32b_currency',
        '_150_of33b_currency',
        '_240_of32b_currency',
        '_250_of33b_currency'
    ];
    
    currencyFields.forEach(function(fieldId) {
        $('#' + fieldId).on('input', function() {
            $(this).val($(this).val().toUpperCase().replace(/[^A-Z]/g, ''));
        }).attr('maxlength', 3);
    });
}

function setupAmountFields() {
    var amountFields = [
        '_141_of32b_amount',
        '_151_of33b_amount',
        '_241_of32b_amount',
        '_251_of33b_amount'
    ];
    
    amountFields.forEach(function(fieldId) {
        var el = document.getElementById(fieldId);
        if (el) {
            el.addEventListener('input', function() {
                formatAmountInput(this);
            });
            el.addEventListener('blur', function() {
                formatAmountBlur(this);
            });
        }
    });
}

function setupCharacterCounters() {
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
    
    $('#_200_of77u_other_amandments_to_undertaking').on('input', function() {
        updateCharacterCounter('_200_of77u_other_amandments_to_undertaking', 'counter_77u', 150, 9750);
    });
    
    $('#_300_of77l_other_amandments_to_local_undertaking').on('input', function() {
        updateCharacterCounter('_300_of77l_other_amandments_to_local_undertaking', 'counter_77l', 150, 9750);
    });
    
    updateCharacterCounter('_200_of77u_other_amandments_to_undertaking', 'counter_77u', 150, 9750);
    updateCharacterCounter('_300_of77l_other_amandments_to_local_undertaking', 'counter_77l', 150, 9750);
}

function updateCharacterCounter(textareaId, counterId, maxLines, maxChars) {
    var content = $('#' + textareaId).val();
    var lines = content.split('\n');
    var lineCount = lines.length;
    var charCount = content.length;
    
    var counterText = charCount + ' / ' + maxChars.toLocaleString() + ' characters | ' + 
                      lineCount + ' / ' + maxLines + ' lines';
    $('#' + counterId).text(counterText);
    
    if (lineCount > maxLines || charCount > maxChars) {
        $('#' + counterId).css('color', 'red');
    } else if (lineCount > (maxLines * 0.8) || charCount > (maxChars * 0.8)) {
        $('#' + counterId).css('color', 'orange');
    } else {
        $('#' + counterId).css('color', 'green');
    }
}

function updateFormattedAmount(amountFieldId, currencyFieldId) {
    var amountValue = $('#' + amountFieldId).val();
    var currencyValue = $('#' + currencyFieldId).val();
    var displayId = 'display_' + amountFieldId.split('_')[1];
    
    if (!amountValue || amountValue.trim() === '') {
        $('#' + displayId).text('');
        return;
    }
    
    var numericValue = parseFloat(amountValue.replace(',', '.'));
    
    if (isNaN(numericValue)) {
        $('#' + displayId).text('');
        return;
    }
    
    var formatted = formatCurrency(numericValue, currencyValue);
    $('#' + displayId).html('<font color="red" size="2">' + formatted + '</font>');
}

function formatCurrency(amount, currency) {
    var parts = amount.toFixed(2).split('.');
    var integerPart = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    return (currency ? currency + ' ' : '') + integerPart + ',' + parts[1];
}

// VALIDATION FUNCTIONS
function validateField27Realtime() {
    var number = $('#_020_mf27_number').val().trim();
    var total = $('#_021_mf27_total').val().trim();
    
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
    
    if (numberInt !== 1) {
        $('#_020_mf27_number').addClass('error-border');
        showInlineError('_020_mf27_number', 'Number must be 1 (Error T75)');
        isValid = false;
    }
    
    if (totalInt < 1 || totalInt > 8) {
        $('#_021_mf27_total').addClass('error-border');
        showInlineError('_021_mf27_total', 'Total must be between 1-8 (Error T75)');
        isValid = false;
    }
    
    if (isValid) {
        $('#_020_mf27_number').addClass('valid-border');
        $('#_021_mf27_total').addClass('valid-border');
    }
}

function validateField21Realtime() {
    var relatedRef = $('#_030_mf21_related_reference').val().trim();
    
    $('#_030_mf21_related_reference').removeClass('error-border valid-border');
    removeInlineError('_030_mf21_related_reference');
    
    if (relatedRef === '') {
        return;
    }
    
    var isValid = true;
    
    if (relatedRef.startsWith('/')) {
        $('#_030_mf21_related_reference').addClass('error-border');
        showInlineError('_030_mf21_related_reference', 'Cannot start with "/" (Error T26)');
        isValid = false;
    }
    
    if (relatedRef.endsWith('/')) {
        $('#_030_mf21_related_reference').addClass('error-border');
        showInlineError('_030_mf21_related_reference', 'Cannot end with "/" (Error T26)');
        isValid = false;
    }
    
    if (relatedRef.indexOf('//') !== -1) {
        $('#_030_mf21_related_reference').addClass('error-border');
        showInlineError('_030_mf21_related_reference', 'Cannot contain "//" (Error T26)');
        isValid = false;
    }
    
    if (isValid) {
        $('#_030_mf21_related_reference').addClass('valid-border');
    }
}

function validateField20Realtime() {
    var undertakingNumber = $('#_090_mf20_undertaking_number').val().trim();
    
    $('#_090_mf20_undertaking_number').removeClass('error-border valid-border');
    removeInlineError('_090_mf20_undertaking_number');
    
    if (undertakingNumber === '') {
        return;
    }
    
    var isValid = true;
    
    if (undertakingNumber.startsWith('/')) {
        $('#_090_mf20_undertaking_number').addClass('error-border');
        showInlineError('_090_mf20_undertaking_number', 'Cannot start with "/" (Error T26)');
        isValid = false;
    }
    
    if (undertakingNumber.endsWith('/')) {
        $('#_090_mf20_undertaking_number').addClass('error-border');
        showInlineError('_090_mf20_undertaking_number', 'Cannot end with "/" (Error T26)');
        isValid = false;
    }
    
    if (undertakingNumber.indexOf('//') !== -1) {
        $('#_090_mf20_undertaking_number').addClass('error-border');
        showInlineError('_090_mf20_undertaking_number', 'Cannot contain "//" (Error T26)');
        isValid = false;
    }
    
    if (isValid) {
        $('#_090_mf20_undertaking_number').addClass('valid-border');
    }
}

function validateDateFormat(obj, fieldName) {
    var dateValue = $(obj).val().trim();
    
    $(obj).removeClass('error-border valid-border');
    removeInlineError(obj.id);
    
    if (dateValue === '') {
        return true;
    }
    
    var isValid = true;
    
    if (!/^\d{6}$/.test(dateValue)) {
        $(obj).addClass('error-border');
        showInlineError(obj.id, fieldName + ' must be 6 digits (YYMMDD) (Error T50)');
        isValid = false;
    } else {
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
        
        if (isValid && mm === 2 && dd > 29) {
            $(obj).addClass('error-border');
            showInlineError(obj.id, 'February cannot have more than 29 days (Error T50)');
            isValid = false;
        }
        
        if (isValid && [4, 6, 9, 11].indexOf(mm) !== -1 && dd > 30) {
            $(obj).addClass('error-border');
            showInlineError(obj.id, 'This month cannot have more than 30 days (Error T50)');
            isValid = false;
        }
    }
    
    if (isValid) {
        $(obj).addClass('valid-border');
    }
    
    return isValid;
}

function validateBICRealtime(obj, fieldName) {
    var bicCode = $(obj).val().trim().toUpperCase();
    
    $(obj).removeClass('error-border valid-border');
    removeInlineError(obj.id);
    
    if (bicCode === '') {
        return true;
    }
    
    var isValid = true;
    
    if (bicCode.length !== 8 && bicCode.length !== 11) {
        $(obj).addClass('error-border');
        showInlineError(obj.id, fieldName + ' must be 8 or 11 characters (Error T27/T28)');
        isValid = false;
    }
    
    var bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
    if (!bicPattern.test(bicCode)) {
        $(obj).addClass('error-border');
        showInlineError(obj.id, 'Invalid BIC format: 6 letters + 2 alphanumeric + optional 3 alphanumeric (Error T29)');
        isValid = false;
    }
    
    if (isValid) {
        $(obj).addClass('valid-border');
    }
    
    return isValid;
}

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

function showInlineError(fieldId, message) {
    removeInlineError(fieldId);
    $('#' + fieldId).after('<span class="inline-error" id="err_' + fieldId + '" style="color:red; font-size:9pt; margin-left:10px;">' + message + '</span>');
}

function showInlineWarning(fieldId, message) {
    removeInlineError(fieldId);
    $('#' + fieldId).after('<span class="inline-warning" id="err_' + fieldId + '" style="color:orange; font-size:9pt; margin-left:10px;">' + message + '</span>');
}

function removeInlineError(fieldId) {
    $('#err_' + fieldId).remove();
}

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

// UTILITY FUNCTIONS
function textonly(e) {
    var code;
    if (!e) var e = window.event;
    if (e.keyCode) code = e.keyCode;
    else if (e.which) code = e.which;
    var character = String.fromCharCode(code);
    var AllowRegex = /^[\ba-zA-Z\s-]$/;
    if (AllowRegex.test(character)) return true;
    return false;
}

function numbersonly(e, obj) {
    var charCode = (e.which) ? e.which : event.keyCode;
    
    if (document.getElementById(obj)) {
        if (document.getElementById(obj).value.toUpperCase() === "JPY") {
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
        } else {
            if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode !== 44) {
                return false;
            }
        }
    } else {
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
    }
    return true;
}

function numbersonly2(e) {
    var charCode = (e.which) ? e.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function cek_koma(obj) {
    var value = obj.value.trim();
    
    if (value === '') return;
    
    var hasComma = false;
    for (var i = 0; i < value.length; i++) {
        if (value.substr(i, 1) === ",") {
            hasComma = true;
            break;
        }
    }
    
    if (!hasComma) {
        obj.value = value + ",00";
    } else {
        var parts = value.split(',');
        if (parts.length === 2) {
            var decimalPart = parts[1].padEnd(2, '0').substring(0, 2);
            obj.value = parts[0] + ',' + decimalPart;
        }
    }
}

function cek_slash(obj) {
    var value = obj.value.trim();
    
    if (value === '') return;
    
    var hasSlash = false;
    for (var i = 0; i < value.length; i++) {
        if (value.substr(i, 1) === "/") {
            hasSlash = true;
            break;
        }
    }
    
    if (!hasSlash && value.length > 0) {
        obj.value = "/" + value;
    }
}

function avoidSplChars(e) {
    e = e || window.event;
    var bad = /[^\sa-z\d\.\,\'\(\)\-\/\:]/i;
    var key = String.fromCharCode(e.keyCode || e.which);
    
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
    if (!amountInput) return;
    
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

function q(id) { 
    return document.getElementById(id); 
}

function show(id, on) { 
    on = on !== undefined ? on : true;
    const el = q(id); 
    if (el) el.style.display = on ? "block" : "none"; 
}

function val(id) { 
    const el = q(id); 
    return el ? (el.value || "").trim() : ""; 
}

function isEmpty(v) { 
    return !v || v.trim() === ""; 
}

function formatAmountInput(el) { 
    el.value = el.value.replace(/[^0-9,]/g, ''); 
}

function formatAmountBlur(el) {
    let v = el.value.trim();
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

function yymmdd(id) {
    const el = q(id);
    if (!el) return;
    
    if (typeof jQuery === "undefined" || !jQuery.fn || !jQuery.fn.datepicker) {
        console.warn('jQuery UI datepicker not available');
        return;
    }
    
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
            const yy = parseInt(cur.slice(0, 2), 10);
            const mm = parseInt(cur.slice(2, 4), 10);
            const dd = parseInt(cur.slice(4, 6), 10);
            
            const thisYear = new Date().getFullYear();
            const thisCentury = Math.floor(thisYear / 100) * 100;
            let fullYear = thisCentury + yy;
            
            if (fullYear - thisYear > 10) fullYear -= 100;
            
            try { 
                $(el).datepicker('setDate', new Date(fullYear, mm - 1, dd)); 
            } catch(e) {
                console.warn('Error setting datepicker date:', e);
            }
        }
    });
}