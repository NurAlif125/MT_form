<%-- 
    Document   : validate_rule_mt761
    Created on : Oct 1, 2025, 1:05:34 PM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {

    // ===== JQUERY VALIDATE SETUP =====
    var validator = $("#form_mt761").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            // Field 27: Sequence of Total (Mandatory)
            _010_mf27_number: {
                required: true
            },
            _011_mf27_total: {
                required: true
            },
            
            // Field 20: Undertaking Number (Mandatory)
            _020_mf20_undertaking_number: {
                required: true
            },
            
            // Field 52a: Issuer (Mandatory)
            _030_mf52a_issuer: {
                required: true
            },
            
            // Field 52a Option A: BIC Code (Conditional)
            _032_mf52a_identifier_code: {
                required: function() {
                    return $('#_030_mf52a_issuer').val() === 'a';
                }
            },
            
            // Field 52a Option D: Name and Address (Conditional)
            _034_mf52d_name_address: {
                required: function() {
                    return $('#_030_mf52a_issuer').val() === 'd';
                }
            }
        },
        messages: {
            _010_mf27_number: {
                required: "MF27 Sequence Number is mandatory"
            },
            _011_mf27_total: {
                required: "MF27 Total is mandatory"
            },
            _020_mf20_undertaking_number: {
                required: "MF20 Undertaking Number is mandatory"
            },
            _030_mf52a_issuer: {
                required: "MF52a Issuer type must be selected"
            },
            _032_mf52a_identifier_code: {
                required: "MF52a Identifier Code (BIC) is mandatory when Option A is selected"
            },
            _034_mf52d_name_address: {
                required: "MF52d Name and Address is mandatory when Option D is selected"
            }
        },
        errorPlacement: function (error, element) {
            error.insertAfter(element);
        },
        showErrors: function (errorMap, errorList) {
            this.defaultShowErrors();
            
            if (errorList.length > 0) {
                displayValidationTable(errorList);
            }
        }
    });
    
    // ===== FORM SUBMIT HANDLER =====
    $("#form_mt761").on("submit", function (e) {
        e.preventDefault();
        
        // Clear previous visual feedback
        $('input, textarea, select').removeClass('error-border valid-border');
        $('.inline-error, .inline-warning').remove();
        
        // Step 1: Run business validations
        var isValidBusiness = validateMT761Business();
        
        // Step 2: Run jQuery validation
        var isValidJQuery = $("#form_mt761").valid();
        
        // Combined result
        var isValid = isValidBusiness && isValidJQuery;
        
        if (isValid) {
            // All validations passed
            if (confirm('Do you want to save this MT761 data?')) {
                // Remove event handler to prevent loop, then submit
                $(this).off("submit");
                this.submit();
            }
        } else {
            // Show error alert
            alert("Validation errors found! Please check the errors and fix them before saving.");
        }
        
        return false;
    });
    
});


/**
 * Main Business Validation Entry Point
 */
function validateMT761Business() {
    var errors = [];
    var isValid = true;
    
    // Validate each field according to SWIFT rules
    if (!validateField27Business(errors)) {
        isValid = false;
    }
    
    if (!validateField20Business(errors)) {
        isValid = false;
    }
    
    if (!validateField52aBusiness(errors)) {
        isValid = false;
    }
    
    if (!validateRuleC19Business(errors)) {
        isValid = false;
    }
    
    // Display errors if any
    if (errors.length > 0) {
        displayValidationTable(errors);
        return false;
    }
    
    return isValid;
}

/**
 * Validate Field 27: Sequence of Total
 * Network Validated Rule: T75
 */
function validateField27Business(errors) {
    var number = $('#_010_mf27_number').val().trim();
    var total = $('#_011_mf27_total').val().trim();
    var isValid = true;
    
    // Skip if empty (will be caught by mandatory validation)
    if (number === '' || total === '') {
        return isValid;
    }
    
    var numberInt = parseInt(number);
    var totalInt = parseInt(total);
    
    // T75: Number must be in range 2-8
    if (numberInt < 2 || numberInt > 8) {
        errors.push({
            field: '_010_mf27_number',
            location: 'Body',
            node: 'MF27 Sequence Number',
            message: 'Error T75: Number must be in range 2-8 (current value: ' + numberInt + ')'
        });
        $('#_010_mf27_number').addClass('error-border');
        isValid = false;
    }
    
    // T75: Total must be in range 2-8
    if (totalInt < 2 || totalInt > 8) {
        errors.push({
            field: '_011_mf27_total',
            location: 'Body',
            node: 'MF27 Total',
            message: 'Error T75: Total must be in range 2-8 (current value: ' + totalInt + ')'
        });
        $('#_011_mf27_total').addClass('error-border');
        isValid = false;
    }
    
    // T75: Number must be <= Total
    if (numberInt > totalInt) {
        errors.push({
            field: '_010_mf27_number',
            location: 'Body',
            node: 'MF27 Number/Total',
            message: 'Error T75: Sequence Number (' + numberInt + ') must be less than or equal to Total (' + totalInt + ')'
        });
        $('#_010_mf27_number').addClass('error-border');
        $('#_011_mf27_total').addClass('error-border');
        isValid = false;
    }
    
    return isValid;
}

/**
 * Validate Field 20: Undertaking Number
 * Network Validated Rule: T26
 */
function validateField20Business(errors) {
    var undertakingNumber = $('#_020_mf20_undertaking_number').val().trim();
    var isValid = true;
    
    // Skip if empty (will be caught by mandatory validation)
    if (undertakingNumber === '') {
        return isValid;
    }
    
    // T26: Cannot start with slash
    if (undertakingNumber.startsWith('/')) {
        errors.push({
            field: '_020_mf20_undertaking_number',
            location: 'Body',
            node: 'MF20 Undertaking Number',
            message: 'Error T26: Field cannot start with slash "/"'
        });
        $('#_020_mf20_undertaking_number').addClass('error-border');
        isValid = false;
    }
    
    // T26: Cannot end with slash
    if (undertakingNumber.endsWith('/')) {
        errors.push({
            field: '_020_mf20_undertaking_number',
            location: 'Body',
            node: 'MF20 Undertaking Number',
            message: 'Error T26: Field cannot end with slash "/"'
        });
        $('#_020_mf20_undertaking_number').addClass('error-border');
        isValid = false;
    }
    
    // T26: Cannot contain consecutive slashes
    if (undertakingNumber.indexOf('//') !== -1) {
        errors.push({
            field: '_020_mf20_undertaking_number',
            location: 'Body',
            node: 'MF20 Undertaking Number',
            message: 'Error T26: Field cannot contain consecutive slashes "//"'
        });
        $('#_020_mf20_undertaking_number').addClass('error-border');
        isValid = false;
    }
    
    return isValid;
}

/**
 * Validate Field 52a: Issuer
 * Network Validated Rules: T27, T28, T29, C05
 */
function validateField52aBusiness(errors) {
    var issuerType = $('#_030_mf52a_issuer').val();
    var isValid = true;
    
    if (issuerType === 'a') {
        // Option A: BIC Code validation
        var bicCode = $('#_032_mf52a_identifier_code').val().trim().toUpperCase();
        
        if (bicCode !== '') {
            // T27/T28: BIC length must be 8 or 11
            if (bicCode.length !== 8 && bicCode.length !== 11) {
                errors.push({
                    field: '_032_mf52a_identifier_code',
                    location: 'Body',
                    node: 'MF52a Identifier Code',
                    message: 'Error T27/T28: BIC must be 8 or 11 characters (current length: ' + bicCode.length + ')'
                });
                $('#_032_mf52a_identifier_code').addClass('error-border');
                isValid = false;
            }
            
            // T29: BIC format validation
            // Format: 6 letters (institution + country) + 2 alphanumeric (location) + optional 3 alphanumeric (branch)
            var bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
            if (!bicPattern.test(bicCode)) {
                errors.push({
                    field: '_032_mf52a_identifier_code',
                    location: 'Body',
                    node: 'MF52a Identifier Code',
                    message: 'Error T29: Invalid BIC format. Must be: 6 letters + 2 alphanumeric + optional 3 alphanumeric'
                });
                $('#_032_mf52a_identifier_code').addClass('error-border');
                isValid = false;
            }
        }
        
    } else if (issuerType === 'd') {
        // Option D: Name and Address validation
        var nameAddress = $('#_034_mf52d_name_address').val().trim();
        
        if (nameAddress !== '') {
            var lines = nameAddress.split('\n');
            
            // Maximum 4 lines
            if (lines.length > 4) {
                errors.push({
                    field: '_034_mf52d_name_address',
                    location: 'Body',
                    node: 'MF52d Name and Address',
                    message: 'Error: Maximum 4 lines allowed (current: ' + lines.length + ' lines)'
                });
                $('#_034_mf52d_name_address').addClass('error-border');
                isValid = false;
            }
            
            // Maximum 35 characters per line
            for (var i = 0; i < lines.length; i++) {
                if (lines[i].length > 35) {
                    errors.push({
                        field: '_034_mf52d_name_address',
                        location: 'Body',
                        node: 'MF52d Name and Address',
                        message: 'Error: Line ' + (i + 1) + ' exceeds 35 characters (current: ' + lines[i].length + ' characters)'
                    });
                    $('#_034_mf52d_name_address').addClass('error-border');
                    isValid = false;
                    break;
                }
            }
        }
    }
    
    return isValid;
}

/**
 * Validate Rule C19: Either field 77U or 77L must be present
 * Also validates format: 150 lines × 65 characters per line
 */
function validateRuleC19Business(errors) {
    var field77U = $('#_040_of77u_undertaking_terms_and_conditions').val().trim();
    var field77L = $('#_050_of77l_requested_local_undertaking_terms_and_conditions').val().trim();
    var isValid = true;
    
    // C19: Either field 77U or field 77L must be present
    if (field77U === '' && field77L === '') {
        errors.push({
            field: '_040_of77u_undertaking_terms_and_conditions',
            location: 'Body',
            node: 'OF77U / OF77L',
            message: 'Error C19: Either field 77U or field 77L must be present (both cannot be empty)'
        });
        $('#_040_of77u_undertaking_terms_and_conditions').addClass('error-border');
        $('#_050_of77l_requested_local_undertaking_terms_and_conditions').addClass('error-border');
        isValid = false;
    }
    
    // Validate 77U format if present
    if (field77U !== '') {
        var lines77U = field77U.split('\n');
        
        // Maximum 150 lines
        if (lines77U.length > 150) {
            errors.push({
                field: '_040_of77u_undertaking_terms_and_conditions',
                location: 'Body',
                node: 'OF77U Undertaking Terms',
                message: 'Error: Exceeds maximum 150 lines (current: ' + lines77U.length + ' lines)'
            });
            $('#_040_of77u_undertaking_terms_and_conditions').addClass('error-border');
            isValid = false;
        }
        
        // Maximum 65 characters per line
        for (var i = 0; i < lines77U.length; i++) {
            if (lines77U[i].length > 65) {
                errors.push({
                    field: '_040_of77u_undertaking_terms_and_conditions',
                    location: 'Body',
                    node: 'OF77U Undertaking Terms',
                    message: 'Error: Line ' + (i + 1) + ' exceeds 65 characters (current: ' + lines77U[i].length + ' characters)'
                });
                $('#_040_of77u_undertaking_terms_and_conditions').addClass('error-border');
                isValid = false;
                break; // Stop at first error
            }
        }
    }
    
    // Validate 77L format if present
    if (field77L !== '') {
        var lines77L = field77L.split('\n');
        
        // Maximum 150 lines
        if (lines77L.length > 150) {
            errors.push({
                field: '_050_of77l_requested_local_undertaking_terms_and_conditions',
                location: 'Body',
                node: 'OF77L Requested Local Terms',
                message: 'Error: Exceeds maximum 150 lines (current: ' + lines77L.length + ' lines)'
            });
            $('#_050_of77l_requested_local_undertaking_terms_and_conditions').addClass('error-border');
            isValid = false;
        }
        
        // Maximum 65 characters per line
        for (var i = 0; i < lines77L.length; i++) {
            if (lines77L[i].length > 65) {
                errors.push({
                    field: '_050_of77l_requested_local_undertaking_terms_and_conditions',
                    location: 'Body',
                    node: 'OF77L Requested Local Terms',
                    message: 'Error: Line ' + (i + 1) + ' exceeds 65 characters (current: ' + lines77L[i].length + ' characters)'
                });
                $('#_050_of77l_requested_local_undertaking_terms_and_conditions').addClass('error-border');
                isValid = false;
                break; // Stop at first error
            }
        }
    }
    
    return isValid;
}

/**
 * DISPLAY FUNCTIONS
 */

/**
 * Display Validation Errors in Table Format
 */
function displayValidationTable(errorList) {
    // Create validate tab if it doesn't exist
    if ($('#view8').length === 0) {
        $('.tabs').append('<li id="tab-validate"><a href="#" rel="view8">Validate</a></li>');
        $('.form-body').append('<div id="view8" class="tabcontent"><h3>Validation Results</h3><div id="error-container"></div></div>');
    }
    
    // Show validate tab
    showValidateTab();
    
    var errorContainer = document.getElementById("error-container");
    var tableHTML = '<table border="1" style="width:100%; font-size:9pt; border-collapse:collapse; margin-top:10px;">';
    tableHTML += '<thead><tr style="background-color:#d6d6d6; font-weight:bold;">';
    tableHTML += '<th style="padding:8px; width:10%;">Type</th>';
    tableHTML += '<th style="padding:8px; width:15%;">Location</th>';
    tableHTML += '<th style="padding:8px; width:25%;">Field</th>';
    tableHTML += '<th style="padding:8px; width:50%;">Message</th>';
    tableHTML += '</tr></thead><tbody>';
    
    // Process error list (can be from jQuery Validate or Business Rules)
    errorList.forEach(function(error) {
        var inputID = error.field || error.element?.id || '';
        var locationTab = error.location || error.element?.getAttribute("location") || 'Body';
        var inputType = error.node || error.element?.getAttribute("input_type") || inputID;
        var errorMessage = error.message || '';
        
        tableHTML += '<tr class="error__row" data-input-id="' + inputID + '" style="cursor:pointer; background-color:#ffe6e6;">';
        tableHTML += '<td style="padding:6px; color:red; font-weight:bold;">Error</td>';
        tableHTML += '<td style="padding:6px;">' + locationTab + '</td>';
        tableHTML += '<td style="padding:6px;">' + inputType + '</td>';
        tableHTML += '<td style="padding:6px;">' + errorMessage + '</td>';
        tableHTML += '</tr>';
    });
    
    tableHTML += '</tbody></table>';
    
    // Summary
    var summaryHTML = '<div style="margin:15px 0; padding:10px; background-color:#fff3cd; border:1px solid #ffc107; border-radius:4px;">';
    summaryHTML += '<strong>Validation Summary:</strong> Found ' + errorList.length + ' error(s). ';
    summaryHTML += 'Click on any row to jump to the field.';
    summaryHTML += '</div>';
    
    errorContainer.innerHTML = summaryHTML + tableHTML;
    
    // Add click handlers to jump to fields
    document.querySelectorAll(".error__row").forEach(function(row) {
        row.addEventListener("click", function() {
            var inputId = this.getAttribute("data-input-id");
            var input = document.getElementById(inputId);
            
            if (input) {
                // Switch to Body tab
                showBodyTab();
                
                // Focus and scroll to field
                input.focus();
                input.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        });
    });
}

/**
 * Show Body Tab
 */
function showBodyTab() {
    $('.tabcontent').hide();
    $('#view2').show();
    $('.tabs li').removeClass('selected');
    $('.tabs li:has(a[rel="view2"])').addClass('selected');
}

/**
 * Show Validate Tab
 */
function showValidateTab() {
    $('.tabcontent').hide();
    $('#view8').show();
    $('.tabs li').removeClass('selected');
    $('#tab-validate').addClass('selected');
}

/**
 * HELPER FUNCTIONS
 */

/**
 * Manual Validation Trigger (for Validate button)
 */
function validateForm() {
    // Clear previous errors
    $('input, textarea, select').removeClass('error-border valid-border');
    $('.inline-error, .inline-warning').remove();
    
    // Run business validations
    var isValidBusiness = validateMT761Business();
    
    // Run jQuery validations
    var isValidJQuery = $("#form_mt761").valid();
    
    // Combined result
    var isValid = isValidBusiness && isValidJQuery;
    
    if (isValid) {
        alert("✓ All validations passed! Form is ready to submit.");
        
        // Mark all fields as valid
        $('input.mandatory:visible, textarea.mandatory:visible, select.mandatory:visible').each(function() {
            if ($(this).val().trim() !== '') {
                $(this).addClass('valid-border');
            }
        });
    } else {
        alert("✗ Validation errors found! Please check the Validate tab for details.");
    }
    
    return isValid;
}

/**
 * Avoid Special Characters (SWIFT Character Set)
 */
function avoidSplChars(e) {
    e = e || window.event;
    // SWIFT character set: a-z A-Z 0-9 space . , ' ( ) - / :
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
 * Check Party Identifier Slash Format
 */
function cek_slash(obj) {
    var value = $(obj).val().trim();
    
    if (value === '') {
        $('#warn_' + obj.id).remove();
        $(obj).removeClass('error-border');
        return true;
    }
    
    // Party Identifier format: /[account] or //[code]/[account]
    if (!value.startsWith('/')) {
        if ($('#warn_' + obj.id).length === 0) {
            $(obj).after('<span class="inline-warning" id="warn_' + obj.id + '" style="color:orange; font-size:9pt; margin-left:10px;">Party Identifier should start with "/"</span>');
        }
        $(obj).addClass('error-border');
        return false;
    } else {
        $('#warn_' + obj.id).remove();
        $(obj).removeClass('error-border');
        return true;
    }
}

</script>