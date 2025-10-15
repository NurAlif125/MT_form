<%-- 
    Document   : validate_rule_mt711
    Created on : Sep 3, 2025, 11:56:58 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(document).ready(function () {

        let validator = $("#form_mt711").validate({
            ignore: [],
            onkeyup: false,
            onfocusout: false,
            
            rules: {
                // ===== MANDATORY FIELDS =====
                
                // MF27: Sequence of Total (Number)
                _010_mf27_number: {
                    required: true,
                    min: 2,
                    max: 8,
                    digits: true
                },
                
                // MF27: Sequence of Total (Total)
                _011_mf27_total: {
                    required: true,
                    min: 2,
                    max: 8,
                    digits: true
                },
                
                // MF20: Sender's Reference
                _020_mf20_sender_reference: {
                    required: true,
                    maxlength: 16,
                    noSlashStartEnd: true,
                    noDoubleSlash: true
                },
                
                // MF21: Documentary Credit Number
                _030_mf21_documentary_credit_number: {
                    required: true,
                    maxlength: 16,
                    noSlashStartEnd: true,
                    noDoubleSlash: true
                },
                
                // ===== OPTIONAL FIELDS =====
                
                // OF45A: Description of Goods and/or Services
                _040_of45a_description_of_goods_and_or_services: {
                    maxlength: 6500,
                    maxLines: 100,
                    maxLineLength: 65
                },
                
                // OF46A: Documents Required
                _050_of46a_documents_required: {
                    maxlength: 6500,
                    maxLines: 100,
                    maxLineLength: 65
                },
                
                // OF47A: Additional Conditions
                _060_of47a_additional_conditions: {
                    maxlength: 6500,
                    maxLines: 100,
                    maxLineLength: 65
                },
                
                // OF49G: Special Payment Conditions for Beneficiary
                _070_of49g_special_payment_conditions_for_beneficiary: {
                    maxlength: 6500,
                    maxLines: 100,
                    maxLineLength: 65
                },
                
                // OF49H: Special Payment Conditions for Bank Only
                _080_of49h_special_payment_conditions_for_bank_only: {
                    maxlength: 6500,
                    maxLines: 100,
                    maxLineLength: 65
                }
            },
            
            messages: {
                _010_mf27_number: {
                    required: "MF27 Number must be filled",
                    min: "Number must be between 2-8 (Error T75)",
                    max: "Number must be between 2-8 (Error T75)",
                    digits: "Number must be numeric"
                },
                _011_mf27_total: {
                    required: "MF27 Total must be filled",
                    min: "Total must be between 2-8 (Error T75)",
                    max: "Total must be between 2-8 (Error T75)",
                    digits: "Total must be numeric"
                },
                _020_mf20_sender_reference: {
                    required: "MF20 Sender's Reference must be filled",
                    maxlength: "Maximum 16 characters",
                    noSlashStartEnd: "Cannot start or end with '/' (Error T26)",
                    noDoubleSlash: "Cannot contain '//' (Error T26)"
                },
                _030_mf21_documentary_credit_number: {
                    required: "MF21 Documentary Credit Number must be filled",
                    maxlength: "Maximum 16 characters",
                    noSlashStartEnd: "Cannot start or end with '/' (Error T26)",
                    noDoubleSlash: "Cannot contain '//' (Error T26)"
                },
                _040_of45a_description_of_goods_and_or_services: {
                    maxlength: "Maximum 6500 characters",
                    maxLines: "Maximum 100 lines",
                    maxLineLength: "Maximum 65 characters per line"
                },
                _050_of46a_documents_required: {
                    maxlength: "Maximum 6500 characters",
                    maxLines: "Maximum 100 lines",
                    maxLineLength: "Maximum 65 characters per line"
                },
                _060_of47a_additional_conditions: {
                    maxlength: "Maximum 6500 characters",
                    maxLines: "Maximum 100 lines",
                    maxLineLength: "Maximum 65 characters per line"
                },
                _070_of49g_special_payment_conditions_for_beneficiary: {
                    maxlength: "Maximum 6500 characters",
                    maxLines: "Maximum 100 lines",
                    maxLineLength: "Maximum 65 characters per line"
                },
                _080_of49h_special_payment_conditions_for_bank_only: {
                    maxlength: "Maximum 6500 characters",
                    maxLines: "Maximum 100 lines",
                    maxLineLength: "Maximum 65 characters per line"
                }
            },
            
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                $("#tab-validate").removeAttr("hidden");
            },
            
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
                
                if (errorList.length > 0) {
                    $("#tab-validate").removeAttr("hidden");
                    
                    // Switch to validate tab
                    $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
                    $("#view8").css("display", "block");
                    $('.tabs li').removeClass("selected");
                    $('#tab-validate').addClass("selected");
                    
                    // Build error table
                    let errorContainer = document.getElementById("error-container");
                    let tableHTML = `<table border="0" style="width:100% !important; caption-side: bottom; font-size:8pt !important; border-collapse: collapse; border:1px gray solid;">
                                        <tr style="background:#d6d6d6;">
                                        <th>Type</th>
                                        <th>Location</th>
                                        <th>Node</th>
                                        <th>Message</th></tr>`;
                    
                    errorList.forEach(errors => {
                        let inputID = errors.element.id || "";
                        let locationTab = errors.element.getAttribute("location") || "Body";
                        let inputType = errors.element.getAttribute("input_type") || errors.element.name;
                        
                        tableHTML += '<tr class="error__row" data-input-id="'+inputID+'" content-body="'+locationTab+'" onmouseover="this.style.background=\'#f6f6f6\'" onmouseout="this.style.backgroundColor=\'transparent\'" style="cursor:pointer;">';
                        tableHTML += '<td style="padding: 5px;">Error</td>';
                        tableHTML += '<td style="padding: 5px;">'+locationTab+'</td>';
                        tableHTML += '<td style="padding: 5px;">'+inputType+'</td>';
                        tableHTML += '<td style="padding: 5px;">'+errors.message+'</td></tr>';
                    });
                    
                    tableHTML += `</table>`;
                    errorContainer.innerHTML = tableHTML;
                    
                    // Add click event to error rows
                    document.querySelectorAll(".error__row").forEach(row => {
                        row.addEventListener("click", function () {
                            let inputId = this.getAttribute("data-input-id");
                            let tabContentGroup = this.getAttribute("content-body");
                            
                            let input = document.getElementById(inputId);
                            if (input) {
                                // Switch to appropriate tab
                                if (tabContentGroup === "Header") {
                                    $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                    $("#view1").css("display", "block");
                                    $('.tabs li').removeClass("selected");
                                    $('#tab-view1').addClass("selected");
                                } else if (tabContentGroup === "Body") {
                                    $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                    $("#view2").css("display", "block");
                                    $('.tabs li').removeClass("selected");
                                    $('#tab-view2').addClass("selected");
                                }
                                
                                // Focus on error field
                                input.focus();
                                input.scrollIntoView({ behavior: 'smooth', block: 'center' });
                            }
                        });
                    });
                }
            }
        });
        
        /**
         * Custom Validation Methods
         */
        
        // T26: No slash at start or end
        $.validator.addMethod("noSlashStartEnd", function(value, element) {
            if (value.trim() === "") return true;
            return !value.startsWith('/') && !value.endsWith('/');
        }, "Cannot start or end with '/'");
        
        // T26: No double slash
        $.validator.addMethod("noDoubleSlash", function(value, element) {
            if (value.trim() === "") return true;
            return !value.includes('//');
        }, "Cannot contain '//'");
        
        // Max lines validation
        $.validator.addMethod("maxLines", function(value, element, param) {
            if (value.trim() === "") return true;
            var lines = value.split('\n');
            return lines.length <= param;
        }, "Exceeds maximum number of lines");
        
        // Max line length validation
        $.validator.addMethod("maxLineLength", function(value, element, param) {
            if (value.trim() === "") return true;
            var lines = value.split('\n');
            for (var i = 0; i < lines.length; i++) {
                if (lines[i].length > param) {
                    return false;
                }
            }
            return true;
        }, "One or more lines exceed maximum character length");
        
        /**
         * Additional Real-time Validations
         */
        
        // T75: Number must be <= Total
        $('#_010_mf27_number, #_011_mf27_total').on('blur', function() {
            var number = parseInt($('#_010_mf27_number').val()) || 0;
            var total = parseInt($('#_011_mf27_total').val()) || 0;
            
            if (number > 0 && total > 0 && number > total) {
                alert('Error T75: Number (' + number + ') cannot be greater than Total (' + total + ')');
                $('#_010_mf27_number').focus();
            }
        });
        
        // Auto-uppercase for Field 20 (Sender's Reference)
        $('#_020_mf20_sender_reference').on('input', function() {
            var val = $(this).val().toUpperCase();
            // Remove invalid characters (only allow A-Z, 0-9, /, -, space, etc per SWIFT x format)
            val = val.replace(/[^A-Z0-9\/\-\s\.\,\'\(\)\:]/g, '');
            $(this).val(val);
        });
        
        // Auto-uppercase for Field 21 (Documentary Credit Number)
        $('#_030_mf21_documentary_credit_number').on('input', function() {
            var val = $(this).val().toUpperCase();
            // Remove invalid characters (only allow A-Z, 0-9, /, -, space, etc per SWIFT x format)
            val = val.replace(/[^A-Z0-9\/\-\s\.\,\'\(\)\:]/g, '');
            $(this).val(val);
        });
        
        // Prevent special characters in Field 27
        $('#_010_mf27_number, #_011_mf27_total').on('keypress', function(e) {
            var charCode = (e.which) ? e.which : e.keyCode;
            // Only allow numbers 0-9
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                e.preventDefault();
                return false;
            }
            return true;
        });
        
        // Limit input length for Field 27 (max 1 digit)
        $('#_010_mf27_number, #_011_mf27_total').on('input', function() {
            if ($(this).val().length > 1) {
                $(this).val($(this).val().substring(0, 1));
            }
        });
        
        /**
         * Real-time character and line counters for textareas
         */
        var textareaFields = [
            { id: '_040_of45a_description_of_goods_and_or_services', maxChars: 6500, maxLines: 100 },
            { id: '_050_of46a_documents_required', maxChars: 6500, maxLines: 100 },
            { id: '_060_of47a_additional_conditions', maxChars: 6500, maxLines: 100 },
            { id: '_070_of49g_special_payment_conditions_for_beneficiary', maxChars: 6500, maxLines: 100 },
            { id: '_080_of49h_special_payment_conditions_for_bank_only', maxChars: 6500, maxLines: 100 }
        ];
        
        textareaFields.forEach(function(field) {
            $('#' + field.id).on('input', function() {
                var content = $(this).val();
                var lines = content.split('\n');
                var lineCount = lines.length;
                var charCount = content.length;
                
                // Check if exceeds limits
                if (charCount > field.maxChars) {
                    alert('Field ' + field.id + ' exceeds maximum ' + field.maxChars + ' characters');
                    $(this).val(content.substring(0, field.maxChars));
                }
                
                if (lineCount > field.maxLines) {
                    alert('Field ' + field.id + ' exceeds maximum ' + field.maxLines + ' lines');
                    // Remove extra lines
                    var validLines = lines.slice(0, field.maxLines);
                    $(this).val(validLines.join('\n'));
                }
            });
        });
        
        /**
         * Validate Button Handler
         */
        $("#btn-validate").click(function () {
            let isValid = $("#form_mt711").valid();
            if (isValid) {
                alert("All inputs are valid!");
            }
        });
        
        /**
         * Submit Handler
         */
        $("#form_mt711").on('submit', function(e) {
            // Form validation will be called automatically by validateMT711() in onsubmit
            // This is just for additional checks if needed
        });
        
    });
    
    /**
     * Global Validation Function (called from form onsubmit)
     */
    function validateMT711() {
        // Trigger jQuery validation
        var isValid = $("#form_mt711").valid();
        
        if (!isValid) {
            alert('Please fix all validation errors before submitting.');
            return false;
        }
        
        // Additional custom validations
        var number = parseInt($('#_010_mf27_number').val()) || 0;
        var total = parseInt($('#_011_mf27_total').val()) || 0;
        
        // T75: Final check - Number must be <= Total
        if (number > total) {
            alert('Error T75: Number (' + number + ') cannot be greater than Total (' + total + ')');
            $('#_010_mf27_number').focus();
            return false;
        }
        
        // T75: Range check (should be handled by validator, but double-check)
        if (number < 2 || number > 8) {
            alert('Error T75: Number must be between 2-8');
            $('#_010_mf27_number').focus();
            return false;
        }
        
        if (total < 2 || total > 8) {
            alert('Error T75: Total must be between 2-8');
            $('#_011_mf27_total').focus();
            return false;
        }
        
        // T26: Field 20 validation
        var senderRef = $('#_020_mf20_sender_reference').val().trim();
        if (senderRef) {
            if (senderRef.startsWith('/') || senderRef.endsWith('/')) {
                alert('Error T26: Sender\'s Reference cannot start or end with "/"');
                $('#_020_mf20_sender_reference').focus();
                return false;
            }
            if (senderRef.includes('//')) {
                alert('Error T26: Sender\'s Reference cannot contain "//"');
                $('#_020_mf20_sender_reference').focus();
                return false;
            }
        }
        
        // T26: Field 21 validation
        var docCreditNum = $('#_030_mf21_documentary_credit_number').val().trim();
        if (docCreditNum) {
            if (docCreditNum.startsWith('/') || docCreditNum.endsWith('/')) {
                alert('Error T26: Documentary Credit Number cannot start or end with "/"');
                $('#_030_mf21_documentary_credit_number').focus();
                return false;
            }
            if (docCreditNum.includes('//')) {
                alert('Error T26: Documentary Credit Number cannot contain "//"');
                $('#_030_mf21_documentary_credit_number').focus();
                return false;
            }
        }
        
        // Usage Rule: Validate line length for all textareas (65 chars per line)
        var textareaFields = [
            { id: '_040_of45a_description_of_goods_and_or_services', name: 'OF45A' },
            { id: '_050_of46a_documents_required', name: 'OF46A' },
            { id: '_060_of47a_additional_conditions', name: 'OF47A' },
            { id: '_070_of49g_special_payment_conditions_for_beneficiary', name: 'OF49G' },
            { id: '_080_of49h_special_payment_conditions_for_bank_only', name: 'OF49H' }
        ];
        
        for (var i = 0; i < textareaFields.length; i++) {
            var field = textareaFields[i];
            var content = $('#' + field.id).val();
            
            if (content.trim() !== '') {
                var lines = content.split('\n');
                
                // Check line count (max 100 lines)
                if (lines.length > 100) {
                    alert('Field ' + field.name + ' exceeds maximum 100 lines (currently: ' + lines.length + ')');
                    $('#' + field.id).focus();
                    return false;
                }
                
                // Check each line length (max 65 characters per line)
                for (var j = 0; j < lines.length; j++) {
                    if (lines[j].length > 65) {
                        alert('Field ' + field.name + ' Line ' + (j + 1) + ' exceeds 65 characters (currently: ' + lines[j].length + ')');
                        $('#' + field.id).focus();
                        return false;
                    }
                }
                
                // Check total character count (max 6500 characters)
                if (content.length > 6500) {
                    alert('Field ' + field.name + ' exceeds maximum 6500 characters (currently: ' + content.length + ')');
                    $('#' + field.id).focus();
                    return false;
                }
            }
        }
        
        // Usage Rule: Remind about MT 711 sequence
        if (number === 2) {
            console.log('This is the first MT 711 (Number = 2)');
        } else if (number > 2) {
            console.log('This is subsequent MT 711 (Number = ' + number + ')');
        }
        
        // Usage Rule: Maximum 7 MT 711 messages can be sent (total 8 including MT 710)
        if (total > 8) {
            alert('Usage Rule Violation: Maximum 7 MT 711 messages can be sent in addition to MT 710 (Total cannot exceed 8)');
            $('#_011_mf27_total').focus();
            return false;
        }
        
        // All validations passed
        console.log('MT 711 validation passed successfully');
        return true;
    }
    
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function () {
        
        console.log('MT 711 validation rules loaded successfully');
        
        // Additional initialization if needed
        
        // Set default values for new form
        if (!$('#_010_mf27_number').val()) {
            $('#_010_mf27_number').val('2');
        }
        
        if (!$('#_011_mf27_total').val()) {
            $('#_011_mf27_total').val('2');
        }
        
    });
</script>