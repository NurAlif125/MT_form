<%-- 
    Document   : validate_rule_mt210
    Created on : Oct 3, 2025, 9:35:40 AM
    Author     : mslam
--%>

<script type="text/javascript">
    $(document).ready(function() {
        let validator = $("#form1").validate({
            ignore: [],  
            onkeyup: false,          // Nonaktifkan validasi saat mengetik
            onfocusout: false,       // Nonaktifkan validasi saat pindah input
//            onclick: false,          // Nonaktifkan validasi saat klik
            rules: {
                //header
                sender_logical_terminal: "required",
                receiver_institution: "required",
                priority: "required",

                //body - non-repetitive fields
                _010_mf20_transactions_reference_number: "required",
                _030_mf30_value_date: "required",

                //repetitive fields - first set
                _040_mf21_related_references: "required",
                _050_mf32b_currency: "required",
                _051_mf32b_amount: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf20_transactions_reference_number:{required: "mf20 transactions reference number must be filled..!!"},
                _030_mf30_value_date: {required: "mf30 value date must be filled..!!"},
                _040_mf21_related_references:{required:"mf21 related references must be filled..!!"},
                _050_mf32b_currency:{required:"mf32b currency must be filled..!! "},
                _051_mf32b_amount:{required:"mf32b amount must be filled..!!"},
                
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                //alert(error.html());
                $("#tab-validate").removeAttr("hidden");
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
                $("#tab-validate").removeAttr("hidden");
                 
                $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
                $("#view8").css("display", "block");
                $('#tab-view1').removeClass("selected").removeAttr('class');
                $('#tab-view2').removeClass("selected").removeAttr('class');
                $('#tab-view3').removeClass("selected").removeAttr('class');
                $('#tab-view4').removeClass("selected").removeAttr('class');
                $('#tab-view5').removeClass("selected").removeAttr('class');
                $('#tab-view6').removeClass("selected").removeAttr('class');
                $('#tab-view7').removeClass("selected").removeAttr('class');
                $('#tab-validate').addClass("selected");

                let errorContainer = document.getElementById("error-container");
                
                if (errorList.length === 0) {
                    errorContainer.innerHTML = ""; 
//                    return;
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
                        let targetRow = event.target.closest(".error__row"); 
                        let inputId = this.getAttribute("data-input-id");
                        let tabContentGroup = this.getAttribute("content-body");
                        
                    if (targetRow) {
                        let input = document.getElementById(inputId);
                        if (input) {
                            if(tabContentGroup == "Header") {
                                $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $("#view1").css("display", "block");
                                $('#tab-view1').addClass("selected");
                                $('#tab-view2').removeClass("selected").removeAttr('class');
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-view7').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                            } 
                            else if (tabContentGroup == "Body") {
                                 $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $('#tab-view1').removeClass("selected").removeAttr('class');
                                $('#tab-view2').addClass("selected");
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-view7').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                                $("#view2").css("display", "block");
                                
                            }
                            
                            input.focus();
                        } else {
                            console.log("nothing input element")
                        }
                    }
                    });
                });
            }
        });
        
        $("#btn-validate").click(function () {
            let isValid = $("#form1").valid(); 
            if (isValid) {
                alert("All inputs are valid!");
            } 
        });

        $("#submit_mt").click(function (e) {
            e.preventDefault();
            let isValid = $("#form1").valid(); 
            if (isValid) {  
                if (confirm("Do you want to save the message?")) {
                    $("#form1").submit(); 
                }
            } else {
                alert("There are still errors! Please fix them before saving.");
            }
        });
        
        $.validator.addMethod("regex", function(value, element, param) {
            //this.optional(element) lewati validasi jika kosong dan param.test(value) check regex
            return this.optional(element) || param.test(value); 
//            Jika tidak ada pesan khusus dalam messages tampilkan "Format tidak valid"
        }, "Invalid format");
    
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
        //of50_a_c_f - Ordering Customer
        $("#div_of50_ordering_customer").hide();
        $("#div_of50c_ordering_customer").hide();
        $("#div_of50f_ordering_customer").hide();
        $("#_061_of50a_name_address").attr("disabled", true);
        $("#_062_of50c_identifier_code").attr("disabled", true);
        $("#_063_of50f_party_identifier").attr("disabled", true);
        $("#_064_of50f_number").attr("disabled", true);
        $("#_065_of50f_details").attr("disabled", true);
        
        $("#_060_of50a_ordering_customer").change(function() {
            if ($("#_060_of50a_ordering_customer").val() == "a"){
                $("#div_of50_ordering_customer").show();
                $("#div_of50c_ordering_customer").hide();
                $("#div_of50f_ordering_customer").hide();
                $("#_061_of50a_name_address").attr("disabled", false);
                $("#_062_of50c_identifier_code").attr("disabled", true);
                $("#_063_of50f_party_identifier").attr("disabled", true);
                $("#_064_of50f_number").attr("disabled", true);
                $("#_065_of50f_details").attr("disabled", true);
            } else if ($("#_060_of50a_ordering_customer").val() == "c"){
                $("#div_of50_ordering_customer").hide();
                $("#div_of50c_ordering_customer").show();
                $("#div_of50f_ordering_customer").hide();
                $("#_061_of50a_name_address").attr("disabled", true);
                $("#_062_of50c_identifier_code").attr("disabled", false);
                $("#_063_of50f_party_identifier").attr("disabled", true);
                $("#_064_of50f_number").attr("disabled", true);
                $("#_065_of50f_details").attr("disabled", true);
            } else if ($("#_060_of50a_ordering_customer").val() == "f"){
                $("#div_of50_ordering_customer").hide();
                $("#div_of50c_ordering_customer").hide();
                $("#div_of50f_ordering_customer").show();
                $("#_061_of50a_name_address").attr("disabled", true);
                $("#_062_of50c_identifier_code").attr("disabled", true);
                $("#_063_of50f_party_identifier").attr("disabled", false);
                $("#_064_of50f_number").attr("disabled", false);
                $("#_065_of50f_details").attr("disabled", false);
            } else {
                $("#div_of50_ordering_customer").hide();
                $("#div_of50c_ordering_customer").hide();
                $("#div_of50f_ordering_customer").hide();
                $("#_061_of50a_name_address").attr("disabled", true);
                $("#_062_of50c_identifier_code").attr("disabled", true);
                $("#_063_of50f_party_identifier").attr("disabled", true);
                $("#_064_of50f_number").attr("disabled", true);
                $("#_065_of50f_details").attr("disabled", true);
            }
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        //of52_a_d - Ordering Institution
        $("#div_of52a_ordering_institution").hide();
        $("#div_of52d_ordering_institution").hide();
        $("#_071_of52a_party_identifier").attr("disabled", true);
        $("#_072_of52a_identifier_code").attr("disabled", true);
        $("#_073_of52d_party_identifier").attr("disabled", true);
        $("#_074_of52d_name_address").attr("disabled", true);
        
        $("#_070_of52A_ordering_institution").change(function() {
            if ($("#_070_of52A_ordering_institution").val() == "a"){
                $("#div_of52a_ordering_institution").show();
                $("#div_of52d_ordering_institution").hide();
                $("#_071_of52a_party_identifier").attr("disabled", false);
                $("#_072_of52a_identifier_code").attr("disabled", false);
                $("#_073_of52d_party_identifier").attr("disabled", true);
                $("#_074_of52d_name_address").attr("disabled", true);
            } else if ($("#_070_of52A_ordering_institution").val() == "d"){
                $("#div_of52a_ordering_institution").hide();
                $("#div_of52d_ordering_institution").show();
                $("#_071_of52a_party_identifier").attr("disabled", true);
                $("#_072_of52a_identifier_code").attr("disabled", true);
                $("#_073_of52d_party_identifier").attr("disabled", false);
                $("#_074_of52d_name_address").attr("disabled", false);
            } else {
                $("#div_of52a_ordering_institution").hide();
                $("#div_of52d_ordering_institution").hide();
                $("#_071_of52a_party_identifier").attr("disabled", true);
                $("#_072_of52a_identifier_code").attr("disabled", true);
                $("#_073_of52d_party_identifier").attr("disabled", true);
                $("#_074_of52d_name_address").attr("disabled", true);
            }
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        //of56_a_d - Intermediary
        $("#div_of56a_intermediary").hide();
        $("#div_of56d_intermediary").hide();
        $("#_081_of56a_party_identifier").attr("disabled", true);
        $("#_082_of56a_identifier_code").attr("disabled", true);
        $("#_083_of56d_party_identifier").attr("disabled", true);
        $("#_084_of56d_name_address").attr("disabled", true);
        
        $("#_080_of56a_intermediary").change(function() {
            if ($("#_080_of56a_intermediary").val() == "a"){
                $("#div_of56a_intermediary").show();
                $("#div_of56d_intermediary").hide();
                $("#_081_of56a_party_identifier").attr("disabled", false);
                $("#_082_of56a_identifier_code").attr("disabled", false);
                $("#_083_of56d_party_identifier").attr("disabled", true);
                $("#_084_of56d_name_address").attr("disabled", true);
            } else if ($("#_080_of56a_intermediary").val() == "d"){
                $("#div_of56a_intermediary").hide();
                $("#div_of56d_intermediary").show();
                $("#_081_of56a_party_identifier").attr("disabled", true);
                $("#_082_of56a_identifier_code").attr("disabled", true);
                $("#_083_of56d_party_identifier").attr("disabled", false);
                $("#_084_of56d_name_address").attr("disabled", false);
            } else {
                $("#div_of56a_intermediary").hide();
                $("#div_of56d_intermediary").hide();
                $("#_081_of56a_party_identifier").attr("disabled", true);
                $("#_082_of56a_identifier_code").attr("disabled", true);
                $("#_083_of56d_party_identifier").attr("disabled", true);
                $("#_084_of56d_name_address").attr("disabled", true);
            }
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        let loopCounter = 1;
        const MAX_LOOPS = 10; // MT210 allows maximum 10 repetitions

        // Store base ID mappings
        let baseIdMap = {};
        let highestIdNumber = 0;

        // Find highest ID number in original form
        $('#loop-set').find('[id^="_"]').each(function() {
            let id = $(this).attr('id');
            let baseIdMatch = id.match(/^_(\d+)_(.+)$/);
            if (baseIdMatch) {
                let numPart = parseInt(baseIdMatch[1]);
                let namePart = baseIdMatch[2];
                baseIdMap[namePart] = numPart;
                if (numPart > highestIdNumber) {
                    highestIdNumber = numPart;
                }
            }
        });

        // Initialize event handlers for first form set
        initializeDropdowns($('#loop-set'));

        // Add button click handler
        $('#addSet').click(function(e) {
            e.preventDefault();

            if (loopCounter >= MAX_LOOPS) {
                alert('Maximum limit of ' + MAX_LOOPS + ' entries reached.');
                return;
            }

            loopCounter++;

            // Clone the loop set
            let $newSet = $('#loop-set').clone(true);
            $newSet.attr('id', 'loop-set-' + loopCounter);

            // Update loop header
            $newSet.find('.loop-header').text('Set #' + (loopCounter + 1));

            // Calculate ID offset
            let idOffset = highestIdNumber * loopCounter;

            // Update dropdown IDs
            $newSet.find('select[id^="_"]').each(function() {
                let oldId = $(this).attr('id');
                let idMatch = oldId.match(/^_(\d+)_(.+)$/);
                if (idMatch) {
                    let numPart = parseInt(idMatch[1]);
                    let namePart = idMatch[2];
                    let newNum = numPart + idOffset;
                    let newId = '_' + newNum + '_' + namePart;
                    $(this).attr('id', newId);
                    $(this).attr('name', newId);
                }
            });

            // Update div IDs
            $newSet.find('div[id^="div_"]').each(function() {
                let oldId = $(this).attr('id');
                if (oldId && oldId !== 'loop-container') {
                    let newId = oldId + '_' + loopCounter;
                    $(this).attr('id', newId);
                }
            });

            // Update field IDs with incrementing numeric part
            $newSet.find('input, textarea').each(function() {
                let oldId = $(this).attr('id');
                if (!oldId || !oldId.startsWith('_')) return;

                let idMatch = oldId.match(/^_(\d+)_(.+)$/);
                if (idMatch) {
                    let numPart = parseInt(idMatch[1]);
                    let namePart = idMatch[2];
                    let newNum = numPart + idOffset;
                    let newId = '_' + newNum + '_' + namePart;
                    $(this).attr('id', newId);
                    $(this).attr('name', newId);
                }
            });

            // Clear values
            $newSet.find('input[type="text"], textarea').val('');
            $newSet.find('select').val('');
            $newSet.find('input, textarea, select').prop('disabled', false);

            // Hide all conditional divs initially
            $newSet.find('div[id*="div_of50"]').hide();
            $newSet.find('div[id*="div_of52"]').hide();
            $newSet.find('div[id*="div_of56"]').hide();

            // Append to container
            $newSet.appendTo('#loop-container');

            // Reinitialize event handlers
            initializeDropdowns($newSet);

            // Add visual separator
            $newSet.prepend('<div class="set-separator" style="border-top: 2px dashed #ccc; margin: 15px 0; padding-top: 15px;"></div>');

            // Disable add button if max reached
            if (loopCounter >= MAX_LOOPS) {
                $('#addSet').prop('disabled', true).css('opacity', '0.5');
            }
        });

        // Remove last set handler
        $('#removeSet').on('click', function(e) {
            e.preventDefault();
            if (loopCounter > 1) {
                $('#loop-set-' + loopCounter).remove();
                loopCounter--;

                if (loopCounter < MAX_LOOPS) {
                    $('#addSet').prop('disabled', false).css('opacity', '1');
                }
            }
        });
    });

    // Function to initialize dropdown change events
    function initializeDropdowns($container) {
        // Handle OF50 dropdown (Ordering Customer)
        $container.find('select[id*="_of50a_ordering_customer"]').on('change', function() {
            let selectedValue = $(this).val();
            let containerId = $(this).attr('id').replace('_060_of50a_ordering_customer', '');
            let formRow = $(this).closest('.form-row');

            formRow.find('div[id*="div_of50"]').hide();
            formRow.find('input, textarea').attr('disabled', true);

            if (selectedValue === 'a') {
                formRow.find('div[id*="div_of50_ordering_customer"]').show();
                formRow.find('textarea[id*="of50a_name_address"]').attr('disabled', false);
            } else if (selectedValue === 'c') {
                formRow.find('div[id*="div_of50c_ordering_customer"]').show();
                formRow.find('input[id*="of50c_identifier_code"]').attr('disabled', false);
            } else if (selectedValue === 'f') {
                formRow.find('div[id*="div_of50f_ordering_customer"]').show();
                formRow.find('input[id*="of50f_party_identifier"]').attr('disabled', false);
                formRow.find('select[id*="of50f_number"]').attr('disabled', false);
                formRow.find('input[id*="of50f_details"]').attr('disabled', false);
            }
        });

        // Handle OF52A dropdown (Ordering Institution)
        $container.find('select[id*="_of52A_ordering_institution"]').on('change', function() {
            let selectedValue = $(this).val();
            let formRow = $(this).closest('.form-row');

            formRow.find('div[id*="div_of52"]').hide();
            formRow.find('input, textarea').attr('disabled', true);

            if (selectedValue === 'a') {
                formRow.find('div[id*="div_of52a_ordering_institution"]').show();
                formRow.find('input[id*="of52a_party_identifier"]').attr('disabled', false);
                formRow.find('input[id*="of52a_identifier_code"]').attr('disabled', false);
            } else if (selectedValue === 'd') {
                formRow.find('div[id*="div_of52d_ordering_institution"]').show();
                formRow.find('input[id*="of52d_party_identifier"]').attr('disabled', false);
                formRow.find('textarea[id*="of52d_name_address"]').attr('disabled', false);
            }
        });

        // Handle OF56A dropdown (Intermediary)
        $container.find('select[id*="_of56a_intermediary"]').on('change', function() {
            let selectedValue = $(this).val();
            let formRow = $(this).closest('.form-row');

            formRow.find('div[id*="div_of56"]').hide();
            formRow.find('input, textarea').attr('disabled', true);

            if (selectedValue === 'a') {
                formRow.find('div[id*="div_of56a_intermediary"]').show();
                formRow.find('input[id*="of56a_party_identifier"]').attr('disabled', false);
                formRow.find('input[id*="of56a_identifier_code"]').attr('disabled', false);
            } else if (selectedValue === 'd') {
                formRow.find('div[id*="div_of56d_intermediary"]').show();
                formRow.find('input[id*="of56d_party_identifier"]').attr('disabled', false);
                formRow.find('textarea[id*="of56d_name_address"]').attr('disabled', false);
            }
        });

        // Trigger change events to set correct initial state
        $container.find('select[id*="_of50a_ordering_customer"]').trigger('change');
        $container.find('select[id*="_of52A_ordering_institution"]').trigger('change');
        $container.find('select[id*="_of56a_intermediary"]').trigger('change');
    }
</script>
<!-- rule view -->
<script type="text/javascript">
    $(document).ready(function(){
        //of50_a_c_f - Initialize on view mode
        if ($("#_061_of50a_name_address").val() != ""){
            $("#_060_of50a_ordering_customer").val("a").attr("selected", true);
            $("#div_of50_ordering_customer").show();
            $("#div_of50c_ordering_customer").hide();
            $("#div_of50f_ordering_customer").hide();
            $("#_061_of50a_name_address").attr("disabled", false);
            $("#_062_of50c_identifier_code").attr("disabled", true);
            $("#_063_of50f_party_identifier").attr("disabled", true);
            $("#_064_of50f_number").attr("disabled", true);
            $("#_065_of50f_details").attr("disabled", true);
        } else if ($("#_062_of50c_identifier_code").val() != ""){
            $("#_060_of50a_ordering_customer").val("c").attr("selected", true);
            $("#div_of50_ordering_customer").hide();
            $("#div_of50c_ordering_customer").show();
            $("#div_of50f_ordering_customer").hide();
            $("#_061_of50a_name_address").attr("disabled", true);
            $("#_062_of50c_identifier_code").attr("disabled", false);
            $("#_063_of50f_party_identifier").attr("disabled", true);
            $("#_064_of50f_number").attr("disabled", true);
            $("#_065_of50f_details").attr("disabled", true);
        } else if ($("#_063_of50f_party_identifier").val() != "" || 
                   $("#_064_of50f_number").val() != "" || 
                   $("#_065_of50f_details").val() != ""){
            $("#_060_of50a_ordering_customer").val("f").attr("selected", true);
            $("#div_of50_ordering_customer").hide();
            $("#div_of50c_ordering_customer").hide();
            $("#div_of50f_ordering_customer").show();
            $("#_061_of50a_name_address").attr("disabled", true);
            $("#_062_of50c_identifier_code").attr("disabled", true);
            $("#_063_of50f_party_identifier").attr("disabled", false);
            $("#_064_of50f_number").attr("disabled", false);
            $("#_065_of50f_details").attr("disabled", false);
        } else {
            $("#div_of50_ordering_customer").hide();
            $("#div_of50c_ordering_customer").hide();
            $("#div_of50f_ordering_customer").hide();
            $("#_061_of50a_name_address").attr("disabled", true);
            $("#_062_of50c_identifier_code").attr("disabled", true);
            $("#_063_of50f_party_identifier").attr("disabled", true);
            $("#_064_of50f_number").attr("disabled", true);
            $("#_065_of50f_details").attr("disabled", true);
        }
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        //of52_a_d - Initialize on view mode
        if ($("#_071_of52a_party_identifier").val() != "" || 
            $("#_072_of52a_identifier_code").val() != ""){
            $("#_070_of52A_ordering_institution").val("a").attr("selected", true);
            $("#div_of52a_ordering_institution").show();
            $("#div_of52d_ordering_institution").hide();
            $("#_071_of52a_party_identifier").attr("disabled", false);
            $("#_072_of52a_identifier_code").attr("disabled", false);
            $("#_073_of52d_party_identifier").attr("disabled", true);
            $("#_074_of52d_name_address").attr("disabled", true);
        } else if ($("#_073_of52d_party_identifier").val() != "" || 
                   $("#_074_of52d_name_address").val() != ""){
            $("#_070_of52A_ordering_institution").val("d").attr("selected", true);
            $("#div_of52a_ordering_institution").hide();
            $("#div_of52d_ordering_institution").show();
            $("#_071_of52a_party_identifier").attr("disabled", true);
            $("#_072_of52a_identifier_code").attr("disabled", true);
            $("#_073_of52d_party_identifier").attr("disabled", false);
            $("#_074_of52d_name_address").attr("disabled", false);
        } else {
            $("#div_of52a_ordering_institution").hide();
            $("#div_of52d_ordering_institution").hide();
            $("#_071_of52a_party_identifier").attr("disabled", true);
            $("#_072_of52a_identifier_code").attr("disabled", true);
            $("#_073_of52d_party_identifier").attr("disabled", true);
            $("#_074_of52d_name_address").attr("disabled", true);
        }

        //of56_a_d - Initialize on view mode
        if ($("#_081_of56a_party_identifier").val() != "" || 
            $("#_082_of56a_identifier_code").val() != ""){
            $("#_080_of56a_intermediary").val("a").attr("selected", true);
            $("#div_of56a_intermediary").show();
            $("#div_of56d_intermediary").hide();
            $("#_081_of56a_party_identifier").attr("disabled", false);
            $("#_082_of56a_identifier_code").attr("disabled", false);
            $("#_083_of56d_party_identifier").attr("disabled", true);
            $("#_084_of56d_name_address").attr("disabled", true);
        } else if ($("#_083_of56d_party_identifier").val() != "" || 
                   $("#_084_of56d_name_address").val() != ""){
            $("#_080_of56a_intermediary").val("d").attr("selected", true);
            $("#div_of56a_intermediary").hide();
            $("#div_of56d_intermediary").show();
            $("#_081_of56a_party_identifier").attr("disabled", true);
            $("#_082_of56a_identifier_code").attr("disabled", true);
            $("#_083_of56d_party_identifier").attr("disabled", false);
            $("#_084_of56d_name_address").attr("disabled", false);
        } else {
            $("#div_of56a_intermediary").hide();
            $("#div_of56d_intermediary").hide();
            $("#_081_of56a_party_identifier").attr("disabled", true);
            $("#_082_of56a_identifier_code").attr("disabled", true);
            $("#_083_of56d_party_identifier").attr("disabled", true);
            $("#_084_of56d_name_address").attr("disabled", true);
        }
    });
</script>

<script type="text/javascript">
    $(document).ready(function() {
        // Check for existing data and populate loops
        checkForExistingLoopData();
    });
    
    function checkForExistingLoopData() {
        const idHeaders = $('#id').val();
        if (!idHeaders) return;
        
        $.ajax({
            url: 'SCMf21List',
            type: 'GET',
            data: {id: idHeaders},
            dataType: 'json',
            success: function(data) {
                // Count MF21 tags to determine number of loops
                const mf21Tags = data.filter(tag => tag.tagName.includes("_mf21_"));
                
                // Trigger clicks for additional loops (first loop already exists)
                const loopsToAdd = mf21Tags.length > 1 ? mf21Tags.length - 1 : 0;
                for (let i = 0; i < loopsToAdd; i++) {
                    $("#addSet").trigger("click");
                }
                
                // Wait for DOM updates then fill data
                setTimeout(() => {
                    fillInputs(data);
                }, 500);
            },
            error: function(xhr, status, error) {
                console.error("Failed to fetch data:", error);
            }
        });
    }
    
    function fillInputs(data) {
        data.forEach(tag => {
            const input = document.getElementById(tag.tagName) || 
                         document.querySelector(`[name="${tag.tagName}"]`);
            if (input) {
                if (input.tagName === 'SELECT') {
                    input.value = tag.detail;
                    $(input).trigger('change'); // Trigger change event for dropdowns
                } else {
                    input.value = tag.detail;
                }
            }
        });
    }
</script>