<%-- 
    Document   : validate_rule_mt761
    Created on : Oct 1, 2025, 1:05:34 PM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function () {

    // JQUERY VALIDATION SETUP   
    let validator = $("#form_mt761").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            _010_mf27_number: {
                required: true,
                digits: true,
                min: 2,
                max: 8
            },
            _011_mf27_total: {
                required: true,
                digits: true,
                min: 2,
                max: 8
            },
            
            _020_mf20_undertaking_number: {
                required: true,
                maxlength: 16
            },
            
            _030_mf52a_issuer: {
                required: true
            },
            
            _032_mf52a_identifier_code: {
                required: function() {
                    return $('#_030_mf52a_issuer').val() === 'a';
                },
                minlength: 8,
                maxlength: 11
            },
            
            _034_mf52d_name_address: {
                required: function() {
                    return $('#_030_mf52a_issuer').val() === 'd';
                },
                maxlength: 140
            }
        },
        messages: {
            _010_mf27_number: {
                required: "MF27 Sequence Number is mandatory",
                digits: "Must contain only digits",
                min: "Must be at least 2",
                max: "Must not exceed 8"
            },
            _011_mf27_total: {
                required: "MF27 Total is mandatory",
                digits: "Must contain only digits",
                min: "Must be at least 2",
                max: "Must not exceed 8"
            },
            _020_mf20_undertaking_number: {
                required: "MF20 Undertaking Number is mandatory",
                maxlength: "Maximum 16 characters allowed"
            },
            _030_mf52a_issuer: {
                required: "MF52a Issuer type must be selected"
            },
            _032_mf52a_identifier_code: {
                required: "MF52a Identifier Code (BIC) is mandatory when Option A is selected",
                minlength: "BIC must be 8 or 11 characters",
                maxlength: "BIC must be 8 or 11 characters"
            },
            _034_mf52d_name_address: {
                required: "MF52d Name and Address is mandatory when Option D is selected",
                maxlength: "Maximum 140 characters (4 lines × 35 characters)"
            }
        },
        errorPlacement: function (error, element) {
            error.insertAfter(element);
        },
        showErrors: function (errorMap, errorList) {
            this.defaultShowErrors();
            
            if (errorList.length > 0) {
                showValidateTab();
                displayValidationTable(errorList);
            }
        }
    });

    // FORM SUBMIT HANDLER
    $("#form_mt761").on("submit", function (e) {
        e.preventDefault();
        
        $('input, textarea, select').removeClass('error-border valid-border warning-border');
        $('.inline-error, .inline-warning').remove();
        
        let businessErrors = [];
        let isValidBusiness = validateMT761Business(businessErrors); 
        let isValidJQuery = $("#form_mt761").valid();
        let isValid = isValidBusiness && isValidJQuery;
        
        if (isValid) {
            if (confirm('Do you want to save this MT761 data?')) {
                $(this).off("submit");
                this.submit();
            }
        } else {
            if (businessErrors.length > 0) {
                showValidateTab();
                displayValidationTable(businessErrors);
            }
            alert("Validation errors found! Please check the Validate tab and fix them before saving.");
        }
        
        return false;
    });
    
    // MANUAL VALIDATE BUTTON (Optional)
    $("#btn-validate").click(function () {
        $('input, textarea, select').removeClass('error-border valid-border warning-border');
        $('.inline-error, .inline-warning').remove();
        
        let businessErrors = [];
        let isValidBusiness = validateMT761Business(businessErrors);
        let isValidJQuery = $("#form_mt761").valid();
        let isValid = isValidBusiness && isValidJQuery;
        
        if (isValid) {
            alert("✓ All validations passed! Form is ready to submit.");
            
            $('input.mandatory:visible, textarea.mandatory:visible, select.mandatory:visible').each(function() {
                if ($(this).val().trim() !== '') {
                    $(this).addClass('valid-border');
                }
            });
        } else {
            if (businessErrors.length > 0) {
                showValidateTab();
                displayValidationTable(businessErrors);
            }
            alert("✗ Validation errors found! Please check the Validate tab.");
        }
    });

    // BUSINESS VALIDATION FUNCTIONS
    function validateMT761Business(errors) {
        console.log('Running MT761 business validations...');
        
        let isValid = true;
        
        if (!validateField27Business(errors)) {
            isValid = false;
        }
        
        if (!validateField20Business(errors)) {
            isValid = false;
        }
        
        if (!validateField52aBusiness(errors)) {
            isValid = false;
        }
        
        if (!validatePartyIdentifiersBusiness(errors)) {
            isValid = false;
        }
        
        if (!validateRuleC1Business(errors)) {
            isValid = false;
        }
        
        if (!validateField77LineLengthBusiness(errors)) {
            isValid = false;
        }
        
        console.log('Business validation result:', isValid);
        return isValid;
    }
    
    // Field 27: Sequence of Total (T75)
    function validateField27Business(errors) {
        let number = $('#_010_mf27_number').val().trim();
        let total = $('#_011_mf27_total').val().trim();
        let isValid = true;
        
        if (number === '' || total === '') {
            return isValid;
        }
        
        let numberInt = parseInt(number);
        let totalInt = parseInt(total);
        
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
        
        if (numberInt > totalInt) {
            errors.push({
                field: '_010_mf27_number',
                location: 'Body',
                node: 'MF27 Number/Total',
                message: 'Error T75: Sequence Number (' + numberInt + ') must be ≤ Total (' + totalInt + ')'
            });
            $('#_010_mf27_number').addClass('error-border');
            $('#_011_mf27_total').addClass('error-border');
            isValid = false;
        }
        
        return isValid;
    }
    
    // Field 20: Undertaking Number (T26)
    function validateField20Business(errors) {
        let undertakingNumber = $('#_020_mf20_undertaking_number').val().trim();
        let isValid = true;
        
        if (undertakingNumber === '') {
            return isValid;
        }
        
        if (undertakingNumber.startsWith('/')) {
            errors.push({
                field: '_020_mf20_undertaking_number',
                location: 'Body',
                node: 'MF20 Undertaking Number',
                message: 'Error T26: Field cannot start with "/" (current: "' + undertakingNumber.substring(0, 10) + '...")'
            });
            $('#_020_mf20_undertaking_number').addClass('error-border');
            isValid = false;
        }
        
        if (undertakingNumber.endsWith('/')) {
            errors.push({
                field: '_020_mf20_undertaking_number',
                location: 'Body',
                node: 'MF20 Undertaking Number',
                message: 'Error T26: Field cannot end with "/"'
            });
            $('#_020_mf20_undertaking_number').addClass('error-border');
            isValid = false;
        }
        
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
    
    // Field 52a: Issuer (T27, T28, T29, C05) 
    function validateField52aBusiness(errors) {
        let issuerType = $('#_030_mf52a_issuer').val();
        let isValid = true;
        
        if (issuerType === 'a') {
            let bicCode = $('#_032_mf52a_identifier_code').val().trim().toUpperCase();
            
            if (bicCode !== '') {
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
                
                let bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
                if (!bicPattern.test(bicCode)) {
                    errors.push({
                        field: '_032_mf52a_identifier_code',
                        location: 'Body',
                        node: 'MF52a Identifier Code',
                        message: 'Error T29: Invalid BIC format. Must be: 6 letters + 2 alphanumeric + optional 3 alphanumeric (current: "' + bicCode + '")'
                    });
                    $('#_032_mf52a_identifier_code').addClass('error-border');
                    isValid = false;
                }
            }
            
        } else if (issuerType === 'd') {
            let nameAddress = $('#_034_mf52d_name_address').val().trim();
            
            if (nameAddress !== '') {
                let lines = nameAddress.split('\n');
                
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
                
                for (let i = 0; i < lines.length; i++) {
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
    
    // Party Identifiers: Slash Format Validation   
    function validatePartyIdentifiersBusiness(errors) {
        let isValid = true;
        
        let partyIdFields = [
            { id: '_031_mf52a_party_identifier', name: 'MF52a Party Identifier (Option A)' },
            { id: '_033_mf52d_party_identifier', name: 'MF52d Party Identifier (Option D)' }
        ];
        
        partyIdFields.forEach(function(config) {
            let value = $('#' + config.id).val().trim();
            
            if (value !== '' && !value.startsWith('/')) {
                errors.push({
                    field: config.id,
                    location: 'Body',
                    node: config.name,
                    message: 'Warning: Party Identifier should start with "/" (current: "' + value.substring(0, 10) + '...")'
                });
                $('#' + config.id).addClass('warning-border');
            }
            
            if (value.length > 35) {
                errors.push({
                    field: config.id,
                    location: 'Body',
                    node: config.name,
                    message: 'Error: Exceeds maximum 35 characters (current: ' + value.length + ' characters)'
                });
                $('#' + config.id).addClass('error-border');
                isValid = false;
            }
        });
        
        return isValid;
    }
    
    // Rule C1 (Error C19): Either 77U or 77L must be present
    function validateRuleC1Business(errors) {
        let field77U = $('#_040_of77u_undertaking_terms_and_conditions').val().trim();
        let field77L = $('#_050_of77l_requested_local_undertaking_terms_and_conditions').val().trim();
        let isValid = true;
        
        if (field77U === '' && field77L === '') {
            errors.push({
                field: '_040_of77u_undertaking_terms_and_conditions',
                location: 'Body',
                node: 'OF77U / OF77L',
                message: 'Error C19 (Rule C1): Either field 77U (Undertaking Terms) or field 77L (Requested Local Undertaking Terms) must be present. Both may be present, but at least one is required.'
            });
            $('#_040_of77u_undertaking_terms_and_conditions').addClass('error-border');
            $('#_050_of77l_requested_local_undertaking_terms_and_conditions').addClass('error-border');
            isValid = false;
        }
        
        return isValid;
    }
    
    // Field 77U/77L: Line Length and Total Lines Validation 
    function validateField77LineLengthBusiness(errors) {
        let isValid = true;
        
        let field77U = $('#_040_of77u_undertaking_terms_and_conditions').val();
        if (field77U.trim() !== '') {
            let lines77U = field77U.split('\n');
            
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
            
            for (let i = 0; i < lines77U.length; i++) {
                if (lines77U[i].length > 65) {
                    errors.push({
                        field: '_040_of77u_undertaking_terms_and_conditions',
                        location: 'Body',
                        node: 'OF77U Undertaking Terms',
                        message: 'Error: Line ' + (i + 1) + ' exceeds 65 characters (current: ' + lines77U[i].length + ' characters)'
                    });
                    $('#_040_of77u_undertaking_terms_and_conditions').addClass('error-border');
                    isValid = false;
                    break; 
                }
            }
        }
        
        let field77L = $('#_050_of77l_requested_local_undertaking_terms_and_conditions').val();
        if (field77L.trim() !== '') {
            let lines77L = field77L.split('\n');
            
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
            
            for (let i = 0; i < lines77L.length; i++) {
                if (lines77L[i].length > 65) {
                    errors.push({
                        field: '_050_of77l_requested_local_undertaking_terms_and_conditions',
                        location: 'Body',
                        node: 'OF77L Requested Local Terms',
                        message: 'Error: Line ' + (i + 1) + ' exceeds 65 characters (current: ' + lines77L[i].length + ' characters)'
                    });
                    $('#_050_of77l_requested_local_undertaking_terms_and_conditions').addClass('error-border');
                    isValid = false;
                    break;
                }
            }
        }
        
        return isValid;
    }

    // ERROR DISPLAY FUNCTIONS   
    function displayValidationTable(errorList) {
        if ($('#view8').length === 0) {
            $('.tabs').append('<li id="tab-validate"><a href="#" rel="view8">Validate</a></li>');
            $('.form-body').append('<div id="view8" class="tabcontent"><h3>Validation Results</h3><div id="error-container"></div></div>');
        }
        
        let errorContainer = document.getElementById("error-container");
        
        if (errorList.length === 0) {
            errorContainer.innerHTML = '<div class="validation-summary"><strong>✓ All validations passed!</strong> Form is ready to submit.</div>';
            return;
        }
        
        let tableHTML = '<table border="1">';
        tableHTML += '<thead><tr>';
        tableHTML += '<th style="width:10%;">Type</th>';
        tableHTML += '<th style="width:15%;">Location</th>';
        tableHTML += '<th style="width:25%;">Field</th>';
        tableHTML += '<th style="width:50%;">Message</th>';
        tableHTML += '</tr></thead><tbody>';
        
        errorList.forEach(function(error) {
            let inputID = error.field || error.element?.id || '';
            let locationTab = error.location || error.element?.getAttribute("location") || 'Body';
            let inputType = error.node || error.element?.getAttribute("input_type") || inputID;
            let errorMessage = error.message || '';
            
            let errorType = errorMessage.toLowerCase().includes('warning') ? 'Warning' : 'Error';
            let rowClass = errorType === 'Warning' ? 'warning__row' : 'error__row';
            
            tableHTML += '<tr class="' + rowClass + '" data-input-id="' + inputID + '" data-location="' + locationTab + '">';
            tableHTML += '<td style="padding:6px; font-weight:bold; color:' + (errorType === 'Warning' ? '#ffc107' : '#dc3545') + ';">' + errorType + '</td>';
            tableHTML += '<td style="padding:6px;">' + locationTab + '</td>';
            tableHTML += '<td style="padding:6px;">' + inputType + '</td>';
            tableHTML += '<td style="padding:6px;">' + errorMessage + '</td>';
            tableHTML += '</tr>';
        });
        
        tableHTML += '</tbody></table>';
        
        let summaryHTML = '<div class="validation-summary">';
        summaryHTML += '<strong>Validation Summary:</strong> Found ' + errorList.length + ' issue(s). ';
        summaryHTML += 'Click on any row to jump to the field.';
        summaryHTML += '</div>';
        
        errorContainer.innerHTML = summaryHTML + tableHTML;
        
        document.querySelectorAll(".error__row, .warning__row").forEach(function(row) {
            row.addEventListener("click", function() {
                let inputId = this.getAttribute("data-input-id");
                let locationTab = this.getAttribute("data-location");
                let input = document.getElementById(inputId);
                
                if (input) {
                    if (locationTab === 'Body') {
                        showBodyTab();
                    }
                    
                    input.focus();
                    input.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            });
        });
    }
    
    function showBodyTab() {
        $('.tabcontent').hide();
        $('#view2').show();
        $('.tabs li').removeClass('selected');
        $('.tabs li:has(a[rel="view2"])').addClass('selected');
    }
    
    function showValidateTab() {
        $('#tab-validate').addClass('show');
        $('.tabcontent').hide();
        $('#view8').show();
        $('.tabs li').removeClass('selected');
        $('#tab-validate').addClass('selected');
    }

});
</script>