/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

$(document).ready(function() {
    initializeMT701Form();
    
    setupTabNavigation();
    
    setupRealtimeValidations();
    
    setupCharacterCounters();
    
    setupFieldHelpers();
});


function initializeMT701Form() {
    console.log('Initializing MT 701 form...');
    
    if (!$('#_010_mf27_number').val()) {
        $('#_010_mf27_number').val('2');
    }

    if (!$('#_011_mf27_total').val()) {
        $('#_011_mf27_total').val('2');
    }
    
    initializeFieldTooltips();
    
    addTextareaPlaceholders();
}


function setupTabNavigation() {
    $('.tabs li a').click(function(e) {
        e.preventDefault();
        var rel = $(this).attr('rel');
        
        $('.tabcontent').hide();
        
        $('#' + rel).show();
        
        $('.tabs li').removeClass('selected');
        $(this).parent().addClass('selected');
    });

    $('.tabs li:has(a[rel="view2"])').addClass('selected');
    $('#view2').show();
}


function setupRealtimeValidations() {
    
    //FIELD 27: Sequence of Total 
    $('#_010_mf27_number, #_011_mf27_total').on('blur', function() {
        validateField27Realtime();
    });
    
    $('#_010_mf27_number, #_011_mf27_total').on('keypress', function(e) {
        return numbersonly2(e);
    });
    
    $('#_010_mf27_number, #_011_mf27_total').on('input', function() {
        if ($(this).val().length > 1) {
            $(this).val($(this).val().substring(0, 1));
        }
    });
    
    //FIELD 20: Documentary Credit Number
    $('#_020_mf20_documentary_credit_number').on('blur', function() {
        validateField20Realtime();
    });
    
    $('#_020_mf20_documentary_credit_number').on('keypress', function(e) {
        return avoidSplChars(e);
    });
    
    $('#_030_of45a_description_of_goods_and_or_services').on('blur', function() {
        checkLongLines('_030_of45a_description_of_goods_and_or_services', 'OF45A', 65);
    });
    
    $('#_040_of46a_documents_required').on('blur', function() {
        checkLongLines('_040_of46a_documents_required', 'OF46A', 65);
    });
    
    $('#_050_of47a_additional_conditions').on('blur', function() {
        checkLongLines('_050_of47a_additional_conditions', 'OF47A', 65);
    });
    
    $('#_060_of49g_special_payment_conditions_for_beneficiary').on('blur', function() {
        checkLongLines('_060_of49g_special_payment_conditions_for_beneficiary', 'OF49G', 65);
    });
    
    $('#_070_of49h_special_payment_conditions_for_bank_only').on('blur', function() {
        checkLongLines('_070_of49h_special_payment_conditions_for_bank_only', 'OF49H', 65);
    });
}

function setupCharacterCounters() {
    var textareaFields = [
        { id: '_030_of45a_description_of_goods_and_or_services', counterId: 'counter_45a', maxLines: 100, maxChars: 6500 },
        { id: '_040_of46a_documents_required', counterId: 'counter_46a', maxLines: 100, maxChars: 6500 },
        { id: '_050_of47a_additional_conditions', counterId: 'counter_47a', maxLines: 100, maxChars: 6500 },
        { id: '_060_of49g_special_payment_conditions_for_beneficiary', counterId: 'counter_49g', maxLines: 100, maxChars: 6500 },
        { id: '_070_of49h_special_payment_conditions_for_bank_only', counterId: 'counter_49h', maxLines: 100, maxChars: 6500 }
    ];
    
    textareaFields.forEach(function(field) {
        if ($('#' + field.counterId).length === 0) {
            $('#' + field.id).after(
                '<div id="' + field.counterId + '" style="font-size:10pt; margin-top:5px; color:green;"></div>'
            );
        }
        
        $('#' + field.id).on('input', function() {
            updateCharacterCounter(field.id, field.counterId, field.maxLines, field.maxChars);
        });
        
        updateCharacterCounter(field.id, field.counterId, field.maxLines, field.maxChars);
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


function setupFieldHelpers() {
    $('input[type="text"], textarea').on('focus', function() {
        $(this).css('border-color', '#4CAF50');
    });
    
    $('input[type="text"], textarea').on('blur', function() {
        $(this).css('border-color', '');
    });

    $('input[type="text"]').on('blur', function() {
        $(this).val($(this).val().trim());
    });
}


function validateField27Realtime() {
    var number = $('#_010_mf27_number').val().trim();
    var total = $('#_011_mf27_total').val().trim();
    
    // Clear previous feedback
    $('#_010_mf27_number').removeClass('error-border valid-border');
    $('#_011_mf27_total').removeClass('error-border valid-border');
    removeInlineError('_010_mf27_number');
    removeInlineError('_011_mf27_total');
    
    if (number === '' || total === '') {
        return;
    }
    
    var numberInt = parseInt(number);
    var totalInt = parseInt(total);
    var isValid = true;
    
    if (numberInt < 2 || numberInt > 8) {
        $('#_010_mf27_number').addClass('error-border');
        showInlineError('_010_mf27_number', 'Number must be 2-8 (Error T75). MT 701 starts at 2.');
        isValid = false;
    }
    
    if (totalInt < 2 || totalInt > 8) {
        $('#_011_mf27_total').addClass('error-border');
        showInlineError('_011_mf27_total', 'Total must be 2-8 (Error T75)');
        isValid = false;
    }
    
    if (numberInt > totalInt) {
        $('#_010_mf27_number').addClass('error-border');
        showInlineError('_010_mf27_number', 'Number must be ≤ Total (Error T75)');
        isValid = false;
    }

    if (isValid && numberInt === 2) {
        showInlineInfo('_010_mf27_number', 'First MT 701 (Number = 2)');
    } else if (isValid && numberInt > 2) {
        showInlineInfo('_010_mf27_number', 'Subsequent MT 701 (Number = ' + numberInt + ')');
    }

    if (isValid) {
        $('#_010_mf27_number').addClass('valid-border');
        $('#_011_mf27_total').addClass('valid-border');
    }
}

function validateField20Realtime() {
    var docCreditNumber = $('#_020_mf20_documentary_credit_number').val().trim();
    
    $('#_020_mf20_documentary_credit_number').removeClass('error-border valid-border');
    removeInlineError('_020_mf20_documentary_credit_number');
    
    if (docCreditNumber === '') {
        return;
    }
    
    var isValid = true;
    
    if (docCreditNumber.startsWith('/')) {
        $('#_020_mf20_documentary_credit_number').addClass('error-border');
        showInlineError('_020_mf20_documentary_credit_number', 'Cannot start with "/" (Error T26)');
        isValid = false;
    }

    if (docCreditNumber.endsWith('/')) {
        $('#_020_mf20_documentary_credit_number').addClass('error-border');
        showInlineError('_020_mf20_documentary_credit_number', 'Cannot end with "/" (Error T26)');
        isValid = false;
    }

    if (docCreditNumber.indexOf('//') !== -1) {
        $('#_020_mf20_documentary_credit_number').addClass('error-border');
        showInlineError('_020_mf20_documentary_credit_number', 'Cannot contain "//" (Error T26)');
        isValid = false;
    }
    
    if (isValid) {
        $('#_020_mf20_documentary_credit_number').addClass('valid-border');
        showInlineInfo('_020_mf20_documentary_credit_number', 'Must match field 20 in related MT 700');
    }
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
    $('#' + fieldId).after(
        '<span class="inline-error" id="err_' + fieldId + '" style="color:red; font-size:9pt; margin-left:10px;">' + 
        message + 
        '</span>'
    );
}


function showInlineWarning(fieldId, message) {
    removeInlineError(fieldId);
    $('#' + fieldId).after(
        '<span class="inline-warning" id="err_' + fieldId + '" style="color:orange; font-size:9pt; margin-left:10px;">' + 
        message + 
        '</span>'
    );
}

function showInlineInfo(fieldId, message) {
    $('#info_' + fieldId).remove();
    $('#' + fieldId).after(
        '<span class="inline-info" id="info_' + fieldId + '" style="color:blue; font-size:9pt; margin-left:10px; font-style:italic;">' + 
        message + 
        '</span>'
    );
}

function removeInlineError(fieldId) {
    $('#err_' + fieldId).remove();
    $('#info_' + fieldId).remove();
}


function initializeFieldTooltips() {
    var tooltips = {
        '_010_mf27_number': 'Sequence number (2-8). For MT 701, Number starts at 2 and increments for each subsequent MT 701. Up to 7 MT 701 messages can be sent.',
        '_011_mf27_total': 'Total number of messages in the series (2-8). Includes the MT 700 and all MT 701 messages.',
        '_020_mf20_documentary_credit_number': 'Documentary credit number (max 16 characters). Must match field 20 in the related MT 700. Cannot start/end with "/" or contain "//".',
        '_030_of45a_description_of_goods_and_or_services': 'Max 100 lines × 65 characters per line. Terms like FOB, CIF should be specified here. Each item should begin on a new line, preceded by "+" or numbered.',
        '_040_of46a_documents_required': 'Max 100 lines × 65 characters per line. Specify documents required. For eUCP credits, format of electronic records must be specified. Each item on new line with "+" or numbered.',
        '_050_of47a_additional_conditions': 'Max 100 lines × 65 characters per line. Further conditions of documentary credit. For eUCP credits, electronic address for presentation must be specified. Each item on new line with "+" or numbered.',
        '_060_of49g_special_payment_conditions_for_beneficiary': 'Max 100 lines × 65 characters per line. Special payment conditions for beneficiary (e.g., post-financing request/conditions).',
        '_070_of49h_special_payment_conditions_for_bank_only': 'Max 100 lines × 65 characters per line. Special payment conditions for bank only, without disclosure to beneficiary. Content must specify to which bank it is addressed.'
    };
    
    for (var fieldId in tooltips) {
        if ($('#' + fieldId).length) {
            $('#' + fieldId).attr('title', tooltips[fieldId]);
        }
    }
}


function hasValue(fieldId) {
    var value = $('#' + fieldId).val();
    return value && value.trim() !== '';
}


function getFieldValue(fieldId) {
    return $('#' + fieldId).val().trim();
}


function setFieldValue(fieldId, value) {
    $('#' + fieldId).val(value);
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

function numbersonly2(e) {
    var charCode = (e.which) ? e.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
    {
        return false;
    }
    return true;
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

function q(id) { 
    return document.getElementById(id); 
}

function show(id, on = true) { 
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

