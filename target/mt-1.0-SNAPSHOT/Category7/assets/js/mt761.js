/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


$(document).ready(function() {
    // Initialize form on page load
    initializeMT761Form();
    
    // Setup tab navigation
    setupTabNavigation();
    
    // Setup real-time validations
    setupRealtimeValidations();
    
    // Setup field visibility toggles
    setupFieldVisibility();
    
    // Setup character counters
    setupCharacterCounters();
});

/**
 * Initialize MT 761 Form
 */
function initializeMT761Form() {
    console.log('Initializing MT 761 form...');
    
    // Set default Sequence Number to 2 if empty (first MT 761)
    if (!$('#_010_mf27_number').val()) {
        $('#_010_mf27_number').val('2');
    }
    
    // Set default Total to 2 if empty
    if (!$('#_011_mf27_total').val()) {
        $('#_011_mf27_total').val('2');
    }
    
    // Initialize field tooltips
    initializeFieldTooltips();
    
    // Check saved issuer type and show appropriate fields
    checkSavedIssuerType();
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
    $('#_010_mf27_number, #_011_mf27_total').on('blur', function() {
        validateField27Realtime();
    });
    
    // Only allow numbers 0-9
    $('#_010_mf27_number, #_011_mf27_total').on('keypress', function(e) {
        return numbersonly(e);
    });
    
    // ===== FIELD 20: Undertaking Number =====
    $('#_020_mf20_undertaking_number').on('blur', function() {
        validateField20Realtime();
    });
    
    // Prevent invalid characters
    $('#_020_mf20_undertaking_number').on('keypress', function(e) {
        return avoidSplChars(e);
    });
    
    // ===== FIELD 52a: BIC Code =====
    $('#_032_mf52a_identifier_code').on('input', function() {
        // Auto uppercase
        $(this).val($(this).val().toUpperCase());
    });
    
    $('#_032_mf52a_identifier_code').on('blur', function() {
        validateBICRealtime();
    });
    
    // ===== FIELD 52d: Name and Address =====
    $('#_034_mf52d_name_address').on('blur', function() {
        validateNameAddressRealtime();
    });
    
    // ===== FIELD 77U/77L: Line length checking =====
    $('#_040_of77u_undertaking_terms_and_conditions').on('blur', function() {
        checkLongLines('_040_of77u_undertaking_terms_and_conditions', 'OF77U', 65);
    });
    
    $('#_050_of77l_requested_local_undertaking_terms_and_conditions').on('blur', function() {
        checkLongLines('_050_of77l_requested_local_undertaking_terms_and_conditions', 'OF77L', 65);
    });
}

/**
 * Setup Field Visibility (Issuer Type Toggle)
 */
function setupFieldVisibility() {
    $('#_030_mf52a_issuer').change(function() {
        var selectedType = $(this).val();
        
        if (selectedType === 'a') {
            // Show Option A fields (BIC)
            $('#div_mf52a_issuer').show();
            $('#div_mf52d_issuer').hide();
            
            // Set mandatory status
            $('#_032_mf52a_identifier_code').addClass('mandatory');
            $('#_034_mf52d_name_address').removeClass('mandatory');
            
            // Clear Option D fields
            $('#_033_mf52d_party_identifier').val('');
            $('#_034_mf52d_name_address').val('');
            
        } else if (selectedType === 'd') {
            // Show Option D fields (Name & Address)
            $('#div_mf52a_issuer').hide();
            $('#div_mf52d_issuer').show();
            
            // Set mandatory status
            $('#_032_mf52a_identifier_code').removeClass('mandatory');
            $('#_034_mf52d_name_address').addClass('mandatory');
            
            // Clear Option A fields
            $('#_031_mf52a_party_identifier').val('');
            $('#_032_mf52a_identifier_code').val('');
            
        } else {
            // No option selected - hide both
            $('#div_mf52a_issuer').hide();
            $('#div_mf52d_issuer').hide();
            
            // Remove mandatory status from both
            $('#_032_mf52a_identifier_code').removeClass('mandatory');
            $('#_034_mf52d_name_address').removeClass('mandatory');
        }
    });
    
    // Hide both divs initially
    $('#div_mf52a_issuer').hide();
    $('#div_mf52d_issuer').hide();
}

/**
 * Check Saved Issuer Type on Page Load
 */
function checkSavedIssuerType() {
    // Check which field has value to determine saved type
    if ($('#_032_mf52a_identifier_code').val().trim() !== '') {
        $('#_030_mf52a_issuer').val('a').trigger('change');
    } else if ($('#_034_mf52d_name_address').val().trim() !== '') {
        $('#_030_mf52a_issuer').val('d').trigger('change');
    }
}

/**
 * Setup Character Counters for 77U and 77L
 */
function setupCharacterCounters() {
    // Create counter elements if they don't exist
    if ($('#counter_77u').length === 0) {
        $('#_040_of77u_undertaking_terms_and_conditions').after(
            '<div id="counter_77u" style="font-size:10pt; margin-top:5px; color:green;"></div>'
        );
    }
    
    if ($('#counter_77l').length === 0) {
        $('#_050_of77l_requested_local_undertaking_terms_and_conditions').after(
            '<div id="counter_77l" style="font-size:10pt; margin-top:5px; color:green;"></div>'
        );
    }
    
    // Update counters on input
    $('#_040_of77u_undertaking_terms_and_conditions').on('input', function() {
        updateCharacterCounter('_040_of77u_undertaking_terms_and_conditions', 'counter_77u', 150, 9750);
    });
    
    $('#_050_of77l_requested_local_undertaking_terms_and_conditions').on('input', function() {
        updateCharacterCounter('_050_of77l_requested_local_undertaking_terms_and_conditions', 'counter_77l', 150, 9750);
    });
    
    // Initialize counters on page load
    updateCharacterCounter('_040_of77u_undertaking_terms_and_conditions', 'counter_77u', 150, 9750);
    updateCharacterCounter('_050_of77l_requested_local_undertaking_terms_and_conditions', 'counter_77l', 150, 9750);
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
    
    // T75: Range must be 2-8
    if (numberInt < 2 || numberInt > 8) {
        $('#_010_mf27_number').addClass('error-border');
        showInlineError('_010_mf27_number', 'Must be between 2-8');
        isValid = false;
    }
    
    if (totalInt < 2 || totalInt > 8) {
        $('#_011_mf27_total').addClass('error-border');
        showInlineError('_011_mf27_total', 'Must be between 2-8');
        isValid = false;
    }
    
    // T75: Number must be <= Total
    if (numberInt > totalInt) {
        $('#_010_mf27_number').addClass('error-border');
        $('#_011_mf27_total').addClass('error-border');
        showInlineError('_010_mf27_number', 'Sequence must be ≤ Total');
        isValid = false;
    }
    
    // Show success if all valid
    if (isValid) {
        $('#_010_mf27_number').addClass('valid-border');
        $('#_011_mf27_total').addClass('valid-border');
    }
}

/**
 * Validate Field 20 Real-time (T26)
 */
function validateField20Realtime() {
    var undertakingNumber = $('#_020_mf20_undertaking_number').val().trim();
    
    // Clear previous feedback
    $('#_020_mf20_undertaking_number').removeClass('error-border valid-border');
    removeInlineError('_020_mf20_undertaking_number');
    
    if (undertakingNumber === '') {
        return;
    }
    
    var isValid = true;
    
    // T26: Cannot start with slash
    if (undertakingNumber.startsWith('/')) {
        $('#_020_mf20_undertaking_number').addClass('error-border');
        showInlineError('_020_mf20_undertaking_number', 'Cannot start with "/"');
        isValid = false;
    }
    
    // T26: Cannot end with slash
    if (undertakingNumber.endsWith('/')) {
        $('#_020_mf20_undertaking_number').addClass('error-border');
        showInlineError('_020_mf20_undertaking_number', 'Cannot end with "/"');
        isValid = false;
    }
    
    // T26: Cannot contain consecutive slashes
    if (undertakingNumber.indexOf('//') !== -1) {
        $('#_020_mf20_undertaking_number').addClass('error-border');
        showInlineError('_020_mf20_undertaking_number', 'Cannot contain "//"');
        isValid = false;
    }
    
    // Show success if valid
    if (isValid) {
        $('#_020_mf20_undertaking_number').addClass('valid-border');
    }
}

/**
 * Validate BIC Code Real-time (T27, T28, T29)
 */
function validateBICRealtime() {
    var bicCode = $('#_032_mf52a_identifier_code').val().trim().toUpperCase();
    
    // Clear previous feedback
    $('#_032_mf52a_identifier_code').removeClass('error-border valid-border');
    removeInlineError('_032_mf52a_identifier_code');
    
    if (bicCode === '') {
        return;
    }
    
    var isValid = true;
    
    // T27/T28: BIC must be 8 or 11 characters
    if (bicCode.length !== 8 && bicCode.length !== 11) {
        $('#_032_mf52a_identifier_code').addClass('error-border');
        showInlineError('_032_mf52a_identifier_code', 'BIC must be 8 or 11 characters');
        isValid = false;
    }
    
    // T29: BIC format validation
    var bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
    if (!bicPattern.test(bicCode)) {
        $('#_032_mf52a_identifier_code').addClass('error-border');
        showInlineError('_032_mf52a_identifier_code', 'Invalid BIC format (6 letters + 2 alphanumeric + optional 3 alphanumeric)');
        isValid = false;
    }
    
    // Show success if valid
    if (isValid) {
        $('#_032_mf52a_identifier_code').addClass('valid-border');
    }
}

/**
 * Validate Name and Address Real-time
 */
function validateNameAddressRealtime() {
    var nameAddress = $('#_034_mf52d_name_address').val().trim();
    
    // Clear previous feedback
    $('#_034_mf52d_name_address').removeClass('error-border valid-border');
    removeInlineError('_034_mf52d_name_address');
    
    if (nameAddress === '') {
        return;
    }
    
    var lines = nameAddress.split('\n');
    var isValid = true;
    
    // Max 4 lines
    if (lines.length > 4) {
        $('#_034_mf52d_name_address').addClass('error-border');
        showInlineError('_034_mf52d_name_address', 'Maximum 4 lines allowed (currently: ' + lines.length + ')');
        isValid = false;
    }
    
    // Max 35 characters per line
    for (var i = 0; i < lines.length; i++) {
        if (lines[i].length > 35) {
            $('#_034_mf52d_name_address').addClass('error-border');
            showInlineError('_034_mf52d_name_address', 'Line ' + (i + 1) + ' exceeds 35 characters (' + lines[i].length + ')');
            isValid = false;
            break;
        }
    }
    
    // Show success if valid
    if (isValid) {
        $('#_034_mf52d_name_address').addClass('valid-border');
    }
}

/**
 * Check Long Lines in Text Areas
 */
function checkLongLines(textareaId, fieldName, maxCharsPerLine) {
    var content = $('#' + textareaId).val();
    
    if (content.trim() === '') {
        removeInlineError(textareaId);
        return;
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
    } else {
        removeInlineError(textareaId);
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
        '_010_mf27_number': 'Sequence number of this MT 761 (range: 2-8). Start with 2 for first MT 761.',
        '_011_mf27_total': 'Total number of MT 761 messages (range: 2-8). Must be greater than or equal to Sequence Number.',
        '_020_mf20_undertaking_number': 'Must match field 20 in related MT 760. Cannot start/end with "/" or contain "//".',
        '_030_mf52a_issuer': 'Select issuer type: Option A (BIC Code) or Option D (Name & Address).',
        '_031_mf52a_party_identifier': 'Optional. Format: /[account] or //[code]/[account]',
        '_032_mf52a_identifier_code': '8 or 11 character BIC code (e.g., MEGAIDJAXXXX). Must be a registered financial institution.',
        '_033_mf52d_party_identifier': 'Optional. Format: /[account]',
        '_034_mf52d_name_address': 'Maximum 4 lines, 35 characters per line.',
        '_040_of77u_undertaking_terms_and_conditions': 'Undertaking terms and conditions. Max 150 lines × 65 chars per line. Either field 77U or 77L must be present.',
        '_050_of77l_requested_local_undertaking_terms_and_conditions': 'Requested local undertaking terms. Max 150 lines × 65 chars per line. Only for counter-undertaking (ISCO/ICCO in MT 760).'
    };
    
    for (var fieldId in tooltips) {
        if ($('#' + fieldId).length) {
            $('#' + fieldId).attr('title', tooltips[fieldId]);
        }
    }
}

/**
 * Helper: Only Allow Numbers
 */
function numbersonly(e) {
    var charCode = e.which ? e.which : e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

/**
 * Helper: Avoid Special Characters (SWIFT allowed chars only)
 */
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

/**
 * Helper: Check Party Identifier Slash Format
 */
function cek_slash(obj) {
    var value = $(obj).val().trim();
    
    if (value === '') {
        $('#err_' + obj.id).remove();
        $(obj).removeClass('error-border');
        return true;
    }
    
    // Party Identifier should start with /
    if (!value.startsWith('/')) {
        showInlineWarning(obj.id, 'Party Identifier should start with "/"');
        return false;
    } else {
        removeInlineError(obj.id);
        $(obj).removeClass('error-border');
        return true;
    }
}

/**
 * Clear All Form Fields
 */
function clearMT761Form() {
    if (confirm('Are you sure you want to clear all fields?')) {
        $('#form_mt761')[0].reset();
        $('#div_mf52a_issuer').hide();
        $('#div_mf52d_issuer').hide();
        $('.inline-error').remove();
        $('.inline-warning').remove();
        $('input, textarea, select').removeClass('error-border valid-border');
        
        // Reset to defaults
        $('#_010_mf27_number').val('2');
        $('#_011_mf27_total').val('2');
        
        // Update counters
        updateCharacterCounter('_040_of77u_undertaking_terms_and_conditions', 'counter_77u', 150, 9750);
        updateCharacterCounter('_050_of77l_requested_local_undertaking_terms_and_conditions', 'counter_77l', 150, 9750);
    }
}

/**
 * Print Form
 */
function printMT761Form() {
    window.print();
}

/**
 * Export Form Data as JSON
 */
function exportMT761Data() {
    var formData = $('#form_mt761').serializeArray();
    var jsonData = {
        messageType: '761',
        exportDate: new Date().toISOString(),
        fields: {}
    };
    
    $.each(formData, function(i, field) {
        if (field.value) {
            jsonData.fields[field.name] = field.value;
        }
    });
    
    console.log('MT761 Form Data:', jsonData);
    
    // Download as JSON file
    var dataStr = JSON.stringify(jsonData, null, 2);
    var dataBlob = new Blob([dataStr], {type: 'application/json'});
    var url = URL.createObjectURL(dataBlob);
    var link = document.createElement('a');
    link.href = url;
    link.download = 'mt761_' + new Date().getTime() + '.json';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
    
    alert('MT761 data exported successfully!');
}