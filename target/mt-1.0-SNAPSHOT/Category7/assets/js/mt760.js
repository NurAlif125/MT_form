/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


$(document).ready(function() {
    console.log('MT760.js - Initializing...');

    initializeMT760Form();
    
    setupTabNavigation();
    setupRealtimeValidations();
    setupCharacterCounters();
    setupFieldToggles();
    setupDatePickers();
    setupCurrencyFields();
    setupAmountFields();
    setupConditionalFields();
    setupOptionFieldToggles();
    
    console.log('MT760.js - Initialization complete');
});


function initializeMT760Form() {
    console.log('Initializing MT 760 form...');
    
    if (!$('#_020_mf27_number').val()) {
        $('#_020_mf27_number').val('1');
    }
    
    if (!$('#_021_mf27_total').val()) {
        $('#_021_mf27_total').val('1');
    }
    
    initializeFieldTooltips();
    initializeSequenceC();
    addValidationStyles();
}

function addValidationStyles() {
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
                .char-counter {
                    font-size: 10pt;
                    margin-top: 5px;
                    font-weight: normal;
                }
            `)
            .appendTo('head');
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
    });
    
    $('#_020_mf27_number, #_021_mf27_total').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_070_mf20_undertaking_number').on('blur', function() {
        validateField20Realtime();
    });
    
    $('#_070_mf20_undertaking_number').on('keypress', function(e) {
        return avoidSplChars(e);
    });
    
    $('#_080_mf30_date_of_issue').on('blur', function() {
        validateDateFormat(this, 'Date of Issue');
    });
    
    $('#_080_mf30_date_of_issue').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_120_of31e_date_of_expiry').on('blur', function() {
        validateDateFormat(this, 'Date of Expiry (Seq B)');
    });
    
    $('#_120_of31e_date_of_expiry').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_460_of31e_date_of_expiry').on('blur', function() {
        validateDateFormat(this, 'Date of Expiry (Seq C)');
    });
    
    $('#_460_of31e_date_of_expiry').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_330_of31s_automatic_extension_final_expiry_date').on('blur', function() {
        validateDateFormat(this, 'Final Expiry Date (Seq B)');
    });
    
    $('#_330_of31s_automatic_extension_final_expiry_date').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_650_of31s_automatic_extension_final_expiry_date').on('blur', function() {
        validateDateFormat(this, 'Final Expiry Date (Seq C)');
    });
    
    $('#_650_of31s_automatic_extension_final_expiry_date').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_410_of31c_requested_date_of_issue').on('blur', function() {
        validateDateFormat(this, 'Requested Date of Issue');
    });
    
    $('#_410_of31c_requested_date_of_issue').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_162_mf52a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_162_mf52a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Issuer BIC (Seq B)');
    });
    
    $('#_502_of52a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_502_of52a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Issuer BIC (Seq C)');
    });
    
    $('#_174_mf59a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_174_mf59a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Beneficiary BIC (Seq B)');
    });
    
    $('#_182_of56a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_182_of56a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Advising Bank BIC');
    });
    
    $('#_202_of57a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_202_of57a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Advise Through Bank BIC (Seq B)');
    });
    
    $('#_542_of57a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_542_of57a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Advise Through Bank BIC (Seq C)');
    });
    
    $('#_282_of58a_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_282_of58a_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Requested Confirmation Party BIC');
    });
    
    $('#_231_of41f_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_231_of41f_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Available With BIC (Seq B)');
    });
    
    $('#_551_of41f_identifier_code').on('input', function() {
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_551_of41f_identifier_code').on('blur', function() {
        validateBICRealtime(this, 'Available With BIC (Seq C)');
    });
    
    $('#_211_mf32b_amount').on('keypress', function(e) {
        return numbersonly(e, '_210_mf32b_currency');
    });
    
    $('#_211_mf32b_amount').on('blur', function() {
        cek_koma(this);
        checkZeroAmount(this.id);
        validateAmountFormat('_211_mf32b_amount', '_210_mf32b_currency');
    });
    
    $('#_521_mf32b_amount').on('keypress', function(e) {
        return numbersonly(e, '_520_mf32b_currency');
    });
    
    $('#_521_mf32b_amount').on('blur', function() {
        cek_koma(this);
        checkZeroAmount(this.id);
        validateAmountFormat('_521_mf32b_amount', '_520_mf32b_currency');
    });
    
    $('#_320_of26e_automatic_extension_notification_period').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_320_of26e_automatic_extension_notification_period').attr('maxlength', 3);
    
    $('#_640_of26e_automatic_extension_notification_period').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_640_of26e_automatic_extension_notification_period').attr('maxlength', 3);
    
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
    
    $('#_210_mf32b_currency').on('blur', function() {
        validateCurrencyCode('_210_mf32b_currency');
    });
    
    $('#_520_mf32b_currency').on('blur', function() {
        validateCurrencyCode('_520_mf32b_currency');
    });
    
    $('#_290_of44j_country_code').on('blur', function() {
        validateCountryCode('_290_of44j_country_code');
    });
    
    $('#_610_of44j_country_code').on('blur', function() {
        validateCountryCode('_610_of44j_country_code');
    });
    
    $('#_600_of40d_standard_wording_requested_language').on('blur', function() {
        validateLanguageCode('_600_of40d_standard_wording_requested_language');
    });
}

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

function validateField20Realtime() {
    var undertakingNumber = $('#_070_mf20_undertaking_number').val().trim();
    
    $('#_070_mf20_undertaking_number').removeClass('error-border valid-border');
    removeInlineError('_070_mf20_undertaking_number');
    
    if (undertakingNumber === '') {
        return;
    }
    
    var isValid = true;
    
    if (undertakingNumber.startsWith('/')) {
        $('#_070_mf20_undertaking_number').addClass('error-border');
        showInlineError('_070_mf20_undertaking_number', 'Cannot start with "/" (Error T26)');
        isValid = false;
    }
    
    if (undertakingNumber.endsWith('/')) {
        $('#_070_mf20_undertaking_number').addClass('error-border');
        showInlineError('_070_mf20_undertaking_number', 'Cannot end with "/" (Error T26)');
        isValid = false;
    }
    
    if (undertakingNumber.indexOf('//') !== -1) {
        $('#_070_mf20_undertaking_number').addClass('error-border');
        showInlineError('_070_mf20_undertaking_number', 'Cannot contain "//" (Error T26)');
        isValid = false;
    }
    
    if (isValid) {
        $('#_070_mf20_undertaking_number').addClass('valid-border');
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

function validateCurrencyCode(currencyFieldId) {
    var currency = $('#' + currencyFieldId).val().trim().toUpperCase();
    
    $('#' + currencyFieldId).removeClass('error-border valid-border');
    removeInlineError(currencyFieldId);
    
    if (currency === '') {
        return true;
    }
    
    var isValid = true;
    
    if (!/^[A-Z]{3}$/.test(currency)) {
        $('#' + currencyFieldId).addClass('error-border');
        showInlineError(currencyFieldId, 'Currency must be 3 letters (Error T52)');
        isValid = false;
    }
    
    if (isValid) {
        $('#' + currencyFieldId).addClass('valid-border');
    }
    
    return isValid;
}

function validateAmountFormat(amountFieldId, currencyFieldId) {
    var amount = $('#' + amountFieldId).val().trim();
    var currency = $('#' + currencyFieldId).val().trim().toUpperCase();
    
    $('#' + amountFieldId).removeClass('error-border valid-border');
    removeInlineError(amountFieldId);
    
    if (amount === '') {
        return true;
    }
    
    var isValid = true;
    
    if (amount.indexOf(',') === -1) {
        $('#' + amountFieldId).addClass('error-border');
        showInlineError(amountFieldId, 'Amount must contain decimal comma (Error T40)');
        isValid = false;
    } else {
        var parts = amount.split(',');
        var decimalPart = parts[1] || '';
        
        var maxDecimals = 2; 
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
        
        if (parts[0] === '' || parts[0] === '0') {
            if (parseFloat(amount.replace(',', '.')) === 0) {
                $('#' + amountFieldId).addClass('error-border');
                showInlineError(amountFieldId, 'Amount must not be zero');
                isValid = false;
            }
        }
    }
    
    if (isValid) {
        $('#' + amountFieldId).addClass('valid-border');
    }
    
    return isValid;
}

function validateCountryCode(countryFieldId) {
    var country = $('#' + countryFieldId).val().trim().toUpperCase();
    
    $('#' + countryFieldId).removeClass('error-border valid-border');
    removeInlineError(countryFieldId);
    
    if (country === '') {
        return true;
    }
    
    var isValid = true;
    
    if (!/^[A-Z]{2}$/.test(country)) {
        $('#' + countryFieldId).addClass('error-border');
        showInlineError(countryFieldId, 'Country code must be 2 letters (Error T73)');
        isValid = false;
    }
    
    if (isValid) {
        $('#' + countryFieldId).addClass('valid-border');
    }
    
    return isValid;
}

function validateLanguageCode(languageFieldId) {
    var language = $('#' + languageFieldId).val().trim().toLowerCase();
    
    $('#' + languageFieldId).removeClass('error-border valid-border');
    removeInlineError(languageFieldId);
    
    if (language === '') {
        return true;
    }
    
    var isValid = true;
    
    if (!/^[a-z]{2}$/.test(language)) {
        $('#' + languageFieldId).addClass('error-border');
        showInlineError(languageFieldId, 'Language code must be 2 lowercase letters (ISO 639)');
        isValid = false;
    }
    
    if (isValid) {
        $('#' + languageFieldId).addClass('valid-border');
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


function setupCharacterCounters() {
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
                '<div id="' + counter.counterId + '" class="char-counter" style="font-size:10pt; margin-top:5px; color:green;"></div>'
            );
        }
        
        $('#' + counter.id).on('input', function() {
            updateCharacterCounter(counter.id, counter.counterId, counter.maxLines, counter.maxChars);
        });
        
        updateCharacterCounter(counter.id, counter.counterId, counter.maxLines, counter.maxChars);
    });
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

function setupFieldToggles() {
    $('#_050_of23x_file_identification').on('change', function() {
        toggleOF23X();
    });
    
    $('#_100_mf40c_applicable_rules').on('change', function() {
        toggleMF40C_SeqB();
    });
    
    $('#_430_mf40c_applicable_rules').on('change', function() {
        toggleMF40C_SeqC();
    });
    
    $('#_300_of23f_automatic_extension_period').on('change', function() {
        toggleOF23F_SeqB();
    });
    
    $('#_620_of23f_automatic_extension_period').on('change', function() {
        toggleOF23F_SeqC();
    });
    
    $('#_380_of24e_delivery_of_original_undertaking').on('change', function() {
        toggleOF24E_SeqB();
    });
    
    $('#_390_of24g_delivery_to_collection_by').on('change', function() {
        toggleOF24G_SeqB();
    });
    
    $('#_700_of24e_delivery_of_local_undertaking').on('change', function() {
        toggleOF24E_SeqC();
    });
    
    $('#_710_of24g_delivery_to_collection_by').on('change', function() {
        toggleOF24G_SeqC();
    });
    
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

function toggleMF40C_SeqB() {
    var type = $('#_100_mf40c_applicable_rules').val();
    var narrativeField = $('#_101_mf40c_narrative');
    
    if (type === 'OTHR') {
        narrativeField.prop('disabled', false).addClass('mandatory');
    } else {
        narrativeField.val('').prop('disabled', true).removeClass('mandatory');
    }
}

function toggleMF40C_SeqC() {
    var type = $('#_430_mf40c_applicable_rules').val();
    var narrativeField = $('#_431_mf40c_narrative');
    
    if (type === 'OTHR') {
        narrativeField.prop('disabled', false).addClass('mandatory');
    } else {
        narrativeField.val('').prop('disabled', true).removeClass('mandatory');
    }
}

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

function toggleOF24E_SeqB() {
    var code = $('#_380_of24e_delivery_of_original_undertaking').val();
    var additionalInfoField = $('#_381_of24e_narrative');
    
    if (code === 'OTHR' || code === 'COUR') {
        additionalInfoField.prop('disabled', false);
    } else {
        additionalInfoField.val('').prop('disabled', true);
    }
}

function toggleOF24G_SeqB() {
    var code = $('#_390_of24g_delivery_to_collection_by').val();
    var narrativeField = $('#_391_of24g_narrative');
    
    if (code === 'OTHR') {
        narrativeField.prop('disabled', false).addClass('mandatory');
    } else {
        narrativeField.val('').prop('disabled', true).removeClass('mandatory');
    }
}

function toggleOF24E_SeqC() {
    var code = $('#_700_of24e_delivery_of_local_undertaking').val();
    var additionalInfoField = $('#_701_of24e_narrative');
    
    if (code === 'OTHR' || code === 'COUR') {
        additionalInfoField.prop('disabled', false);
    } else {
        additionalInfoField.val('').prop('disabled', true);
    }
}

function toggleOF24G_SeqC() {
    var code = $('#_710_of24g_delivery_to_collection_by').val();
    var narrativeField = $('#_711_of24g_narrative');
    
    if (code === 'OTHR') {
        narrativeField.prop('disabled', false).addClass('mandatory');
    } else {
        narrativeField.val('').prop('disabled', true).removeClass('mandatory');
    }
}


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

function yymmdd(id) {
    const el = document.getElementById(id);
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


function setupCurrencyFields() {
    var currencyFields = [
        '_210_mf32b_currency',
        '_520_mf32b_currency'
    ];
    
    currencyFields.forEach(function(fieldId) {
        $('#' + fieldId).on('input', function() {
            $(this).val($(this).val().toUpperCase().replace(/[^A-Z]/g, ''));
        });

        $('#' + fieldId).attr('maxlength', 3);
    });
    
    $('#_290_of44j_country_code, #_610_of44j_country_code').on('input', function() {
        $(this).val($(this).val().toUpperCase().replace(/[^A-Z]/g, ''));
    });
    
    $('#_290_of44j_country_code, #_610_of44j_country_code').attr('maxlength', 2);
    
    $('#_600_of40d_standard_wording_requested_language').on('input', function() {
        $(this).val($(this).val().toLowerCase().replace(/[^a-z]/g, ''));
    });
    
    $('#_600_of40d_standard_wording_requested_language').attr('maxlength', 2);
}


function setupAmountFields() {
    var amountFields = [
        '_211_mf32b_amount',
        '_521_mf32b_amount'
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


function setupConditionalFields() {
    $('#_110_mf23b_expiry_type').on('change', function() {
        applyRuleC1_SeqB();
    });
    
    $('#_110_mf23b_expiry_type').on('change', function() {
        applyRuleC2_SeqB();
    });
    
    $('#_110_mf23b_expiry_type').on('change', function() {
        applyRuleC3_SeqB();
    });
    
    $('#_030_mf22a_purpose_of_message').on('change', function() {
        applyRuleC4();
    });
    
    $('#_030_mf22a_purpose_of_message, #_090_mf22d_form_of_undertaking').on('change', function() {
        applyRuleC5();
    });
    
    $('#_030_mf22a_purpose_of_message').on('change', function() {
        applyRuleC6();
    });
    
    $('#_200_of57a_advise_through_bank, #_540_of57a_advise_through_bank').on('change', function() {
        applyRuleC7();
    });
    
    $('#_300_of23f_automatic_extension_period').on('change', function() {
        applyRuleC8_SeqB();
    });
    
    $('#_270_of49_confirmation_instructions').on('change', function() {
        applyRuleC9();
    });
    
    $('#_590_of22y_standard_wording_required').on('change', function() {
        applyRuleC10();
    });
    
    $('#_090_mf22d_form_of_undertaking, #_420_mf22d_form_of_undertaking').on('change', function() {
        applyRuleC11();
    });
    
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

function applyRuleC1_SeqB() {
    var expiryType = $('#_110_mf23b_expiry_type').val();
    var dateField = $('#_120_of31e_date_of_expiry');
    
    if (expiryType === 'FIXD') {
        dateField.addClass('mandatory').prop('disabled', false);
    } else if (expiryType === 'COND') {
        dateField.removeClass('mandatory').prop('disabled', false);
    } else if (expiryType === 'OPEN') {
        dateField.val('').removeClass('mandatory').prop('disabled', true);
    } else {
        dateField.prop('disabled', false);
    }
}

function applyRuleC1_SeqC() {
    var expiryType = $('#_450_mf23b_expiry_type').val();
    var dateField = $('#_460_of31e_date_of_expiry');
    
    if (expiryType === 'FIXD') {
        dateField.addClass('mandatory').prop('disabled', false);
    } else if (expiryType === 'COND') {
        dateField.removeClass('mandatory').prop('disabled', false);
    } else if (expiryType === 'OPEN') {
        dateField.val('').removeClass('mandatory').prop('disabled', true);
    } else {
        dateField.prop('disabled', false);
    }
}

function applyRuleC2_SeqB() {
    var expiryType = $('#_110_mf23b_expiry_type').val();
    var conditionField = $('#_130_of35g_expiry_condition_event');
    
    if (expiryType === 'COND') {
        conditionField.addClass('mandatory').prop('disabled', false);
    } else {
        conditionField.val('').removeClass('mandatory').prop('disabled', true);
    }
}

function applyRuleC2_SeqC() {
    var expiryType = $('#_450_mf23b_expiry_type').val();
    var conditionField = $('#_470_of35G_expiry_condition_events');
    
    if (expiryType === 'COND') {
        conditionField.addClass('mandatory').prop('disabled', false);
    } else {
        conditionField.val('').removeClass('mandatory').prop('disabled', true);
    }
}

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

function applyRuleC4() {
    var purpose = $('#_030_mf22a_purpose_of_message').val();
    var applicantField = $('#_140_of50_applicant');
    
    if (purpose === 'ISSU') {
        applicantField.addClass('mandatory');
    } else {
        applicantField.removeClass('mandatory');
    }
}

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

function applyRuleC6() {
    var purpose = $('#_030_mf22a_purpose_of_message').val();
    
    if (purpose === 'ISCO' || purpose === 'ICCO') {
        $('#seq_C_checkbox').prop('checked', true).prop('disabled', true);
        $('#check_seq_c').show();
        
        $('#_350_of48d_transfer_indicator').val('').prop('disabled', true);
        $('#_380_of24e_delivery_of_original_undertaking').val('').prop('disabled', true);
        $('#_381_of24e_narrative').val('').prop('disabled', true);
        $('#_390_of24g_delivery_to_collection_by').val('').prop('disabled', true);
        $('#_391_of24g_narrative').val('').prop('disabled', true);
    } else {
        $('#seq_C_checkbox').prop('disabled', false);
        
        $('#_350_of48d_transfer_indicator').prop('disabled', false);
        $('#_380_of24e_delivery_of_original_undertaking').prop('disabled', false);
        $('#_390_of24g_delivery_to_collection_by').prop('disabled', false);
    }
    
    if (purpose === 'ISSU') {
        $('#_370_of45l_underlying_transaction_details').addClass('mandatory');
    } else {
        $('#_370_of45l_underlying_transaction_details').removeClass('mandatory');
    }
}

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

function applyRuleC10() {
    var standardWording = $('#_590_of22y_standard_wording_required').val();
    var typeUndertakingField = $('#_440_of22k_type_of_undertaking');
    
    if (standardWording === 'STND') {
        typeUndertakingField.addClass('mandatory');
    } else {
        typeUndertakingField.removeClass('mandatory');
    }
}

function applyRuleC11() {
    var formUndertakingB = $('#_090_mf22d_form_of_undertaking').val();
    var formUndertakingC = $('#_420_mf22d_form_of_undertaking').val();
    
    var availableWithB = $('#_230_of41a_available_with');
    var availableWithC = $('#_550_of41a_available_with');
    
    if (formUndertakingB === 'DGAR') {
        availableWithB.val('').prop('disabled', true);
        $('#_231_of41f_identifier_code').val('').prop('disabled', true);
        $('#_232_of41g_name_address').val('').prop('disabled', true);
    } else {
        availableWithB.prop('disabled', false);
    }
    
    if (formUndertakingC === 'DGAR' || formUndertakingC === 'DEPU') {
        availableWithC.val('').prop('disabled', true);
        $('#_551_of41f_identifier_code').val('').prop('disabled', true);
        $('#_552_of41g_name_address').val('').prop('disabled', true);
    } else {
        availableWithC.prop('disabled', false);
    }
}


function setupOptionFieldToggles() {
    $('#_160_mf52a_issuer').on('change', function() {
        var selectedValue = $(this).val();
        
        if (selectedValue === 'a') {
            $('#div_mf52a_issuer').show();
            $('#div_mf52a_issuer input, #div_mf52a_issuer textarea').prop('disabled', false);
            $('#div_mf52d_issuer').hide();
            $('#div_mf52d_issuer input, #div_mf52d_issuer textarea').prop('disabled', true).val('');
        } else if (selectedValue === 'd') {
            $('#div_mf52d_issuer').show();
            $('#div_mf52d_issuer input, #div_mf52d_issuer textarea').prop('disabled', false);
            $('#div_mf52a_issuer').hide();
            $('#div_mf52a_issuer input, #div_mf52a_issuer textarea').prop('disabled', true).val('');
        } else {
            $('#div_mf52a_issuer, #div_mf52d_issuer').hide();
            $('#div_mf52a_issuer input, #div_mf52a_issuer textarea, #div_mf52d_issuer input, #div_mf52d_issuer textarea').prop('disabled', true);
        }
    });
    
    $('#_160_mf52a_issuer').trigger('change');
    
    $('#_500_of52a_issuer').on('change', function() {
        var selectedValue = $(this).val();
        
        if (selectedValue === 'a') {
            $('#div_of52a_issuer_2').show();
            $('#div_of52a_issuer_2 input, #div_of52a_issuer_2 textarea').prop('disabled', false);
            $('#div_of52d_issuer_2').hide();
            $('#div_of52d_issuer_2 input, #div_of52d_issuer_2 textarea').prop('disabled', true).val('');
        } else if (selectedValue === 'd') {
            $('#div_of52d_issuer_2').show();
            $('#div_of52d_issuer_2 input, #div_of52d_issuer_2 textarea').prop('disabled', false);
            $('#div_of52a_issuer_2').hide();
            $('#div_of52a_issuer_2 input, #div_of52a_issuer_2 textarea').prop('disabled', true).val('');
        } else {
            $('#div_of52a_issuer_2, #div_of52d_issuer_2').hide();
            $('#div_of52a_issuer_2 input, #div_of52a_issuer_2 textarea, #div_of52d_issuer_2 input, #div_of52d_issuer_2 textarea').prop('disabled', true);
        }
    });
    
    $('#_500_of52a_issuer').trigger('change');
    
    $('#_170_mf59a_beneficiary').on('change', function() {
        var selectedValue = $(this).val();
        
        if (selectedValue === 'no') {
            $('#div_mf59no_beneficiary').show();
            $('#div_mf59no_beneficiary input, #div_mf59no_beneficiary textarea').prop('disabled', false);
            $('#div_mf59a_beneficiary').hide();
            $('#div_mf59a_beneficiary input, #div_mf59a_beneficiary textarea').prop('disabled', true).val('');
        } else if (selectedValue === 'a') {
            $('#div_mf59a_beneficiary').show();
            $('#div_mf59a_beneficiary input, #div_mf59a_beneficiary textarea').prop('disabled', false);
            $('#div_mf59no_beneficiary').hide();
            $('#div_mf59no_beneficiary input, #div_mf59no_beneficiary textarea').prop('disabled', true).val('');
        } else {
            $('#div_mf59no_beneficiary, #div_mf59a_beneficiary').hide();
            $('#div_mf59no_beneficiary input, #div_mf59no_beneficiary textarea, #div_mf59a_beneficiary input, #div_mf59a_beneficiary textarea').prop('disabled', true);
        }
    });
    
    $('#_170_mf59a_beneficiary').trigger('change');
    
    $('#_180_of56a_advising_bank').on('change', function() {
        var selectedValue = $(this).val();
        
        if (selectedValue === 'a') {
            $('#div_of56a_advising_bank').show();
            $('#div_of56a_advising_bank input, #div_of56a_advising_bank textarea').prop('disabled', false);
            $('#div_of56d_advising_bank').hide();
            $('#div_of56d_advising_bank input, #div_of56d_advising_bank textarea').prop('disabled', true).val('');
        } else if (selectedValue === 'd') {
            $('#div_of56d_advising_bank').show();
            $('#div_of56d_advising_bank input, #div_of56d_advising_bank textarea').prop('disabled', false);
            $('#div_of56a_advising_bank').hide();
            $('#div_of56a_advising_bank input, #div_of56a_advising_bank textarea').prop('disabled', true).val('');
        } else {
            $('#div_of56a_advising_bank, #div_of56d_advising_bank').hide();
            $('#div_of56a_advising_bank input, #div_of56a_advising_bank textarea, #div_of56d_advising_bank input, #div_of56d_advising_bank textarea').prop('disabled', true);
        }
    });
    
    $('#_180_of56a_advising_bank').trigger('change');
    
    $('#_200_of57a_advise_through_bank').on('change', function() {
        var selectedValue = $(this).val();
        
        if (selectedValue === 'a') {
            $('#div_of57a_advise_through_bank').show();
            $('#div_of57a_advise_through_bank input, #div_of57a_advise_through_bank textarea').prop('disabled', false);
            $('#div_of57d_advise_through_bank').hide();
            $('#div_of57d_advise_through_bank input, #div_of57d_advise_through_bank textarea').prop('disabled', true).val('');
        } else if (selectedValue === 'd') {
            $('#div_of57d_advise_through_bank').show();
            $('#div_of57d_advise_through_bank input, #div_of57d_advise_through_bank textarea').prop('disabled', false);
            $('#div_of57a_advise_through_bank').hide();
            $('#div_of57a_advise_through_bank input, #div_of57a_advise_through_bank textarea').prop('disabled', true).val('');
        } else {
            $('#div_of57a_advise_through_bank, #div_of57d_advise_through_bank').hide();
            $('#div_of57a_advise_through_bank input, #div_of57a_advise_through_bank textarea, #div_of57d_advise_through_bank input, #div_of57d_advise_through_bank textarea').prop('disabled', true);
        }
    });
    
    $('#_200_of57a_advise_through_bank').trigger('change');
    
    $('#_230_of41a_available_with').on('change', function() {
        var selectedValue = $(this).val();
        
        if (selectedValue === 'f') {
            $('#div_of41f_avaliable_with').show();
            $('#div_of41f_avaliable_with input, #div_of41f_avaliable_with textarea').prop('disabled', false);
            $('#div_of41g_avaliable_with').hide();
            $('#div_of41g_avaliable_with input, #div_of41g_avaliable_with textarea').prop('disabled', true).val('');
        } else if (selectedValue === 'g') {
            $('#div_of41g_avaliable_with').show();
            $('#div_of41g_avaliable_with input, #div_of41g_avaliable_with textarea').prop('disabled', false);
            $('#div_of41f_avaliable_with').hide();
            $('#div_of41f_avaliable_with input, #div_of41f_avaliable_with textarea').prop('disabled', true).val('');
        } else {
            $('#div_of41f_avaliable_with, #div_of41g_avaliable_with').hide();
            $('#div_of41f_avaliable_with input, #div_of41f_avaliable_with textarea, #div_of41g_avaliable_with input, #div_of41g_avaliable_with textarea').prop('disabled', true);
        }
    });
    
    $('#_230_of41a_available_with').trigger('change');
    
    $('#_280_of58a_requested_confirmation_party').on('change', function() {
        var selectedValue = $(this).val();
        
        if (selectedValue === 'a') {
            $('#div_of58a_requested_confirmation_party').show();
            $('#div_of58a_requested_confirmation_party input, #div_of58a_requested_confirmation_party textarea').prop('disabled', false);
            $('#div_of58d_requested_confirmation_party').hide();
            $('#div_of58d_requested_confirmation_party input, #div_of58d_requested_confirmation_party textarea').prop('disabled', true).val('');
        } else if (selectedValue === 'd') {
            $('#div_of58d_requested_confirmation_party').show();
            $('#div_of58d_requested_confirmation_party input, #div_of58d_requested_confirmation_party textarea').prop('disabled', false);
            $('#div_of58a_requested_confirmation_party').hide();
            $('#div_of58a_requested_confirmation_party input, #div_of58a_requested_confirmation_party textarea').prop('disabled', true).val('');
        } else {
            $('#div_of58a_requested_confirmation_party, #div_of58d_requested_confirmation_party').hide();
            $('#div_of58a_requested_confirmation_party input, #div_of58a_requested_confirmation_party textarea, #div_of58d_requested_confirmation_party input, #div_of58d_requested_confirmation_party textarea').prop('disabled', true);
        }
    });
    
    $('#_280_of58a_requested_confirmation_party').trigger('change');
    
    $('#_540_of57a_advise_through_bank').on('change', function() {
        var selectedValue = $(this).val();
        
        if (selectedValue === 'a') {
            $('#div_of57a_advise_through_bank_2').show();
            $('#div_of57a_advise_through_bank_2 input, #div_of57a_advise_through_bank_2 textarea').prop('disabled', false);
            $('#div_of57d_advise_through_bank_2').hide();
            $('#div_of57d_advise_through_bank_2 input, #div_of57d_advise_through_bank_2 textarea').prop('disabled', true).val('');
        } else if (selectedValue === 'd') {
            $('#div_of57d_advise_through_bank_2').show();
            $('#div_of57d_advise_through_bank_2 input, #div_of57d_advise_through_bank_2 textarea').prop('disabled', false);
            $('#div_of57a_advise_through_bank_2').hide();
            $('#div_of57a_advise_through_bank_2 input, #div_of57a_advise_through_bank_2 textarea').prop('disabled', true).val('');
        } else {
            $('#div_of57a_advise_through_bank_2, #div_of57d_advise_through_bank_2').hide();
            $('#div_of57a_advise_through_bank_2 input, #div_of57a_advise_through_bank_2 textarea, #div_of57d_advise_through_bank_2 input, #div_of57d_advise_through_bank_2 textarea').prop('disabled', true);
        }
    });
    
    $('#_540_of57a_advise_through_bank').trigger('change');
    
    $('#_550_of41a_available_with').on('change', function() {
        var selectedValue = $(this).val();
        
        if (selectedValue === 'f') {
            $('#div_of41f_avaliable_with_2').show();
            $('#div_of41f_avaliable_with_2 input, #div_of41f_avaliable_with_2 textarea').prop('disabled', false);
            $('#div_of41g_avaliable_with_2').hide();
            $('#div_of41g_avaliable_with_2 input, #div_of41g_avaliable_with_2 textarea').prop('disabled', true).val('');
        } else if (selectedValue === 'g') {
            $('#div_of41g_avaliable_with_2').show();
            $('#div_of41g_avaliable_with_2 input, #div_of41g_avaliable_with_2 textarea').prop('disabled', false);
            $('#div_of41f_avaliable_with_2').hide();
            $('#div_of41f_avaliable_with_2 input, #div_of41f_avaliable_with_2 textarea').prop('disabled', true).val('');
        } else {
            $('#div_of41f_avaliable_with_2, #div_of41g_avaliable_with_2').hide();
            $('#div_of41f_avaliable_with_2 input, #div_of41f_avaliable_with_2 textarea, #div_of41g_avaliable_with_2 input, #div_of41g_avaliable_with_2 textarea').prop('disabled', true);
        }
    });
    
    $('#_550_of41a_available_with').trigger('change');
}


// SEQUENCE C VISIBILITY
function initializeSequenceC() {
    $('#seq_C_checkbox').on('change', function() {
        if ($(this).is(':checked')) {
            $('#check_seq_c').show();
        } else {
            $('#check_seq_c').hide();
        }
    });
    
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
        '_600_of40d_standard_wording_requested_language': 'ISO 639 language code (2 letters).',
        '_690_mf45l_underlying_transaction_details': 'Required in Sequence C. Max 50 lines × 65 chars.'
    };
    
    for (var fieldId in tooltips) {
        if ($('#' + fieldId).length) {
            $('#' + fieldId).attr('title', tooltips[fieldId]);
        }
    }
}

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


function validateMT760() {
    console.log('Validating MT760 form...');
    
    var isValid = true;
    var errors = [];
    
    $('.error-border').removeClass('error-border');
    
    $('.mandatory').each(function() {
        if (!$(this).prop('disabled') && $(this).val().trim() === '') {
            var fieldLabel = $(this).attr('input_type') || $(this).attr('id');
            errors.push(fieldLabel + ' is required');
            $(this).addClass('error-border');
            isValid = false;
        }
    });
    
    var number = $('#_020_mf27_number').val().trim();
    var total = $('#_021_mf27_total').val().trim();
    
    if (number !== '' && total !== '') {
        var numberInt = parseInt(number);
        var totalInt = parseInt(total);
        
        if (numberInt !== 1) {
            errors.push('Field 27 Number must be 1 (Error T75)');
            $('#_020_mf27_number').addClass('error-border');
            isValid = false;
        }
        
        if (totalInt < 1 || totalInt > 8) {
            errors.push('Field 27 Total must be between 1-8 (Error T75)');
            $('#_021_mf27_total').addClass('error-border');
            isValid = false;
        }
    }
    
    var undertakingNumber = $('#_070_mf20_undertaking_number').val().trim();
    if (undertakingNumber !== '') {
        if (undertakingNumber.startsWith('/') || undertakingNumber.endsWith('/') || undertakingNumber.indexOf('//') !== -1) {
            errors.push('Field 20 cannot start/end with "/" or contain "//" (Error T26)');
            $('#_070_mf20_undertaking_number').addClass('error-border');
            isValid = false;
        }
    }
    
    var dateFields = [
        {id: '_080_mf30_date_of_issue', name: 'Date of Issue'},
        {id: '_120_of31e_date_of_expiry', name: 'Date of Expiry (Seq B)'},
        {id: '_330_of31s_automatic_extension_final_expiry_date', name: 'Final Expiry Date (Seq B)'},
        {id: '_410_of31c_requested_date_of_issue', name: 'Requested Date of Issue'},
        {id: '_460_of31e_date_of_expiry', name: 'Date of Expiry (Seq C)'},
        {id: '_650_of31s_automatic_extension_final_expiry_date', name: 'Final Expiry Date (Seq C)'}
    ];
    
    dateFields.forEach(function(field) {
        var dateValue = $('#' + field.id).val().trim();
        if (dateValue !== '' && !$('#' + field.id).prop('disabled')) {
            if (!/^\d{6}$/.test(dateValue)) {
                errors.push(field.name + ' must be 6 digits (YYMMDD) (Error T50)');
                $('#' + field.id).addClass('error-border');
                isValid = false;
            } else {
                var mm = parseInt(dateValue.substr(2, 2));
                var dd = parseInt(dateValue.substr(4, 2));
                
                if (mm < 1 || mm > 12) {
                    errors.push(field.name + ' has invalid month (Error T50)');
                    $('#' + field.id).addClass('error-border');
                    isValid = false;
                }
                
                if (dd < 1 || dd > 31) {
                    errors.push(field.name + ' has invalid day (Error T50)');
                    $('#' + field.id).addClass('error-border');
                    isValid = false;
                }
            }
        }
    });
    
    var bicFields = [
        {id: '_162_mf52a_identifier_code', name: 'Issuer BIC (Seq B)'},
        {id: '_502_of52a_identifier_code', name: 'Issuer BIC (Seq C)'},
        {id: '_174_mf59a_identifier_code', name: 'Beneficiary BIC (Seq B)'},
        {id: '_182_of56a_identifier_code', name: 'Advising Bank BIC'},
        {id: '_202_of57a_identifier_code', name: 'Advise Through Bank BIC (Seq B)'},
        {id: '_542_of57a_identifier_code', name: 'Advise Through Bank BIC (Seq C)'},
        {id: '_282_of58a_identifier_code', name: 'Requested Confirmation Party BIC'},
        {id: '_231_of41f_identifier_code', name: 'Available With BIC (Seq B)'},
        {id: '_551_of41f_identifier_code', name: 'Available With BIC (Seq C)'}
    ];
    
    bicFields.forEach(function(field) {
        var bicCode = $('#' + field.id).val().trim().toUpperCase();
        if (bicCode !== '' && !$('#' + field.id).prop('disabled')) {
            if (bicCode.length !== 8 && bicCode.length !== 11) {
                errors.push(field.name + ' must be 8 or 11 characters (Error T27/T28)');
                $('#' + field.id).addClass('error-border');
                isValid = false;
            }
            
            var bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
            if (!bicPattern.test(bicCode)) {
                errors.push(field.name + ' has invalid BIC format (Error T29)');
                $('#' + field.id).addClass('error-border');
                isValid = false;
            }
        }
    });
    
    var currencyFields = [
        {id: '_210_mf32b_currency', name: 'Currency (Seq B)'},
        {id: '_520_mf32b_currency', name: 'Currency (Seq C)'}
    ];
    
    currencyFields.forEach(function(field) {
        var currency = $('#' + field.id).val().trim().toUpperCase();
        if (currency !== '' && !$('#' + field.id).prop('disabled')) {
            if (!/^[A-Z]{3}$/.test(currency)) {
                errors.push(field.name + ' must be 3 letters (Error T52)');
                $('#' + field.id).addClass('error-border');
                isValid = false;
            }
        }
    });
    
    var amountFields = [
        {id: '_211_mf32b_amount', currencyId: '_210_mf32b_currency', name: 'Amount (Seq B)'},
        {id: '_521_mf32b_amount', currencyId: '_520_mf32b_currency', name: 'Amount (Seq C)'}
    ];
    
    amountFields.forEach(function(field) {
        var amount = $('#' + field.id).val().trim();
        var currency = $('#' + field.currencyId).val().trim().toUpperCase();
        
        if (amount !== '' && !$('#' + field.id).prop('disabled')) {
            if (amount.indexOf(',') === -1) {
                errors.push(field.name + ' must contain decimal comma (Error T40)');
                $('#' + field.id).addClass('error-border');
                isValid = false;
            } else {
                var parts = amount.split(',');
                var decimalPart = parts[1] || '';
                
                var maxDecimals = 2;
                if (currency === 'JPY' || currency === 'KRW') {
                    maxDecimals = 0;
                } else if (currency === 'BHD' || currency === 'IQD' || currency === 'JOD' || 
                           currency === 'KWD' || currency === 'LYD' || currency === 'OMR' || currency === 'TND') {
                    maxDecimals = 3;
                }
                
                if (decimalPart.length > maxDecimals) {
                    errors.push(field.name + ' exceeds max ' + maxDecimals + ' decimal places for ' + currency + ' (Error C03)');
                    $('#' + field.id).addClass('error-border');
                    isValid = false;
                }
                
                if (parseFloat(amount.replace(',', '.')) === 0) {
                    errors.push(field.name + ' must not be zero');
                    $('#' + field.id).addClass('error-border');
                    isValid = false;
                }
            }
        }
    });
    
    var countryFields = [
        {id: '_290_of44j_country_code', name: 'Country Code (Seq B)'},
        {id: '_610_of44j_country_code', name: 'Country Code (Seq C)'}
    ];
    
    countryFields.forEach(function(field) {
        var country = $('#' + field.id).val().trim().toUpperCase();
        if (country !== '' && !$('#' + field.id).prop('disabled')) {
            if (!/^[A-Z]{2}$/.test(country)) {
                errors.push(field.name + ' must be 2 letters (Error T73)');
                $('#' + field.id).addClass('error-border');
                isValid = false;
            }
        }
    });
    
    var textareaFields = [
        {id: '_260_mf77u_undertaking_terms_and_conditions', name: 'MF77U', maxChars: 65},
        {id: '_580_of77l_requested_local_undertaking_terms_and_conditions', name: 'OF77L', maxChars: 65},
        {id: '_250_of45c_document_and_presentation_instructions', name: 'OF45C (Seq B)', maxChars: 65},
        {id: '_570_of45c_document_and_presentation_instructions', name: 'OF45C (Seq C)', maxChars: 65},
        {id: '_370_of45l_underlying_transaction_details', name: 'OF45L (Seq B)', maxChars: 65},
        {id: '_690_mf45l_underlying_transaction_details', name: 'MF45L (Seq C)', maxChars: 65}
    ];
    
    textareaFields.forEach(function(field) {
        var content = $('#' + field.id).val();
        if (content.trim() !== '' && !$('#' + field.id).prop('disabled')) {
            var lines = content.split('\n');
            var longLines = [];
            
            for (var i = 0; i < lines.length; i++) {
                if (lines[i].length > field.maxChars) {
                    longLines.push('Line ' + (i + 1));
                }
            }
            
            if (longLines.length > 0) {
                errors.push(field.name + ' has ' + longLines.length + ' line(s) exceeding ' + field.maxChars + ' chars: ' + longLines.join(', '));
                $('#' + field.id).addClass('error-border');
                isValid = false;
            }
        }
    });

    var expiryTypeB = $('#_110_mf23b_expiry_type').val();
    var dateExpiryB = $('#_120_of31e_date_of_expiry').val().trim();
    
    if (expiryTypeB === 'FIXD' && dateExpiryB === '') {
        errors.push('Rule C1: Field 31E (Date of Expiry) is required when 23B is FIXD (Seq B)');
        $('#_120_of31e_date_of_expiry').addClass('error-border');
        isValid = false;
    }
    
    if ($('#seq_C_checkbox').is(':checked')) {
        var expiryTypeC = $('#_450_mf23b_expiry_type').val();
        var dateExpiryC = $('#_460_of31e_date_of_expiry').val().trim();
        
        if (expiryTypeC === 'FIXD' && dateExpiryC === '') {
            errors.push('Rule C1: Field 31E (Date of Expiry) is required when 23B is FIXD (Seq C)');
            $('#_460_of31e_date_of_expiry').addClass('error-border');
            isValid = false;
        }
    }
    
    var conditionEventB = $('#_130_of35g_expiry_condition_event').val().trim();
    
    if (expiryTypeB === 'COND' && conditionEventB === '') {
        errors.push('Rule C2: Field 35G (Expiry Condition/Event) is required when 23B is COND (Seq B)');
        $('#_130_of35g_expiry_condition_event').addClass('error-border');
        isValid = false;
    }
    
    if ($('#seq_C_checkbox').is(':checked')) {
        var expiryTypeC = $('#_450_mf23b_expiry_type').val();
        var conditionEventC = $('#_470_of35G_expiry_condition_events').val().trim();
        
        if (expiryTypeC === 'COND' && conditionEventC === '') {
            errors.push('Rule C2: Field 35G (Expiry Condition/Event) is required when 23B is COND (Seq C)');
            $('#_470_of35G_expiry_condition_events').addClass('error-border');
            isValid = false;
        }
    }
    
    var purpose = $('#_030_mf22a_purpose_of_message').val();
    var applicant = $('#_140_of50_applicant').val().trim();
    
    if (purpose === 'ISSU' && applicant === '') {
        errors.push('Rule C4: Field 50 (Applicant) is required when 22A is ISSU');
        $('#_140_of50_applicant').addClass('error-border');
        isValid = false;
    }
    
    var formUndertaking = $('#_090_mf22d_form_of_undertaking').val();
    var confirmInstr = $('#_270_of49_confirmation_instructions').val().trim();
    
    if (purpose === 'ISSU' && formUndertaking === 'STBY' && confirmInstr === '') {
        errors.push('Rule C5: Field 49 (Confirmation Instructions) is required when 22A is ISSU and 22D is STBY');
        $('#_270_of49_confirmation_instructions').addClass('error-border');
        isValid = false;
    }
    
    if ((purpose === 'ISCO' || purpose === 'ICCO') && !$('#seq_C_checkbox').is(':checked')) {
        errors.push('Rule C6: Sequence C must be present when 22A is ISCO or ICCO');
        isValid = false;
    }
    
    var adviseThroughB = $('#_200_of57a_advise_through_bank').val();
    var adviseThroughC = $('#_540_of57a_advise_through_bank').val();
    var advisingBank = $('#_180_of56a_advising_bank').val();
    
    if ((adviseThroughB !== '' || adviseThroughC !== '') && advisingBank === '') {
        errors.push('Rule C7: Field 56a (Advising Bank) is required when field 57a is present');
        $('#_180_of56a_advising_bank').addClass('error-border');
        isValid = false;
    }
    
    if ((confirmInstr === 'CONFIRM' || confirmInstr === 'MAY ADD')) {
        var requestedParty = $('#_280_of58a_requested_confirmation_party').val();
        if (requestedParty === '') {
            errors.push('Rule C9: Field 58a (Requested Confirmation Party) is required when 49 is CONFIRM or MAY ADD');
            $('#_280_of58a_requested_confirmation_party').addClass('error-border');
            isValid = false;
        }
    }
    
    if ($('#seq_C_checkbox').is(':checked')) {
        var standardWording = $('#_590_of22y_standard_wording_required').val();
        var typeUndertaking = $('#_440_of22k_type_of_undertaking').val();
        
        if (standardWording === 'STND' && typeUndertaking === '') {
            errors.push('Rule C10: Field 22K (Type of Undertaking) is required when 22Y is STND');
            $('#_440_of22k_type_of_undertaking').addClass('error-border');
            isValid = false;
        }
    }
    
    if (!isValid) {
        console.error('Validation errors:', errors);
        alert('Please correct the following errors:\n\n' + errors.join('\n'));
        
        var firstError = $('.error-border').first();
        if (firstError.length) {
            $('html, body').animate({
                scrollTop: firstError.offset().top - 100
            }, 500);
        }
    }
    
    return isValid;
}

window.validateMT760 = validateMT760;

console.log('MT760.js - loaded successfully');