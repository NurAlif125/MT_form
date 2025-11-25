<%-- 
    Document   : validate_rule_mt543(Seq A)
    Created on : Nov 7, 2025, 10:30:24 AM
    Author     : Administrator
--%>

<script type="text/javascript">
    $(document).ready(function() {
        let validator = $("#form1").validate({
            ignore: [],  
            onkeyup: false,
            onfocusout: false,
            rules: {
                //header
                //unit: "required",
                sender_logical_terminal: "required",
                //sender_type: "required",
                //sender_type_institution: "required",

                //receiver_type: "required",
                receiver_institution: "required",

                priority: "required",
                //monitoring: "required",
  
                //========================================
                // SEQUENCE A: GENERAL INFORMATION
                //========================================
                
                // Field 2: MF20C - Sender's Message Reference
                _021_mf20c_reference_a: "required",
                
                // Field 3: MF23G - Function of the Message
                _030_mf23g_function_of_the_message_a: "required",
                
                // Field 4: OF98A - Preparation Date/Time (Optional, no validation needed)
                
                // Field 5: OF99A - Number Count
                // C3: If TOSE is present, then SETT must be present
                _051_of99b_number_a: {
                    required: function(element) {
                        // Check if TOSE qualifier exists in any OF99B field
                        let toseExists = false;
                        $("[id^='_050_of99b_qualifier_a']").each(function() {
                            if ($(this).val() === ":TOSE//") {
                                toseExists = true;
                                return false;
                            }
                        });
                        
                        // If this is SETT field and TOSE exists, make it required
                        let currentQualifier = $(element).closest('.form-row').parent().find("[id^='_050_of99b_qualifier_a']").val();
                        return toseExists && currentQualifier === ":SETT//";
                    }
                },
                
                _053_of99c_number_a: {
                    required: function(element) {
                        // Check if TOSE qualifier exists in any OF99C field
                        let toseExists = false;
                        $("[id^='_052_of99c_qualifier_a']").each(function() {
                            if ($(this).val() === ":TOSE//") {
                                toseExists = true;
                                return false;
                            }
                        });
                        
                        // If this is SETT field and TOSE exists, make it required
                        let currentQualifier = $(element).closest('.form-row').parent().find("[id^='_052_of99c_qualifier_a']").val();
                        return toseExists && currentQualifier === ":SETT//";
                    }
                },
                
                //========================================
                // SUBSEQUENCE A1: LINKAGES
                //========================================
                _091_mf20c_reference_a1: "required",
                _093_mf20n_reference_a1: "required",
                _095_mf20u_reference_a1: "required",
                // Field 9: MF20A - Reference (Mandatory in A1)
                // Dynamic validation will be added via jQuery for dynamically added fields
                
                // C8: If Function is CANC, then A1 must be present and one occurrence must have PREV
                // This will be validated in custom validation
                
                //========================================
                // DYNAMIC FIELD VALIDATION
                //========================================
                // Dynamic fields in containers and templates will be validated separately
                
                //body - Sequence B Trade Details - Mandatory Fields
                
                // Field 15: MF98A Date/Time (Mandatory, 1-3 occurrences)
//                type_mf98_b: "required",
                _150_mf98a_qualifier_b: {
                    required: function(element) {
                        return $("#type_mf98_b").val() == "a";
                    }
                },
                _1501_mf98a_date_b: {
                    required: function(element) {
                        return $("#type_mf98_b").val() == "a";
                    }
                },
                
                // MF98B
                _1502_mf98b_qualifier_b: {
                    required: function(element) {
                        return $("#type_mf98_b").val() == "b";
                    }
                },
                _1505_mf98b_date_code_b: {
                    required: function(element) {
                        return $("#type_mf98_b").val() == "b";
                    }
                },
                
                // MF98C
                _1506_mf98c_qualifier_b: {
                    required: function(element) {
                        return $("#type_mf98_b").val() == "c";
                    }
                },
                _1507_mf98c_date_b: {
                    required: function(element) {
                        return $("#type_mf98_b").val() == "c";
                    }
                },
                _1508_mf98c_time_b: {
                    required: function(element) {
                        return $("#type_mf98_b").val() == "c";
                    }
                },
                
                // MF98E
                _15010_mf98e_date_b: {
                    required: function(element) {
                        return $("#type_mf98_b").val() == "e";
                    }
                },
                _15011_mf98e_time_b: {
                    required: function(element) {
                        return $("#type_mf98_b").val() == "e";
                    }
                },

                // Field 18: MF35B Identification of the Financial Instrument (Mandatory)
                _1801_mf35b_identification_of_security_b: "required",

                // Field 16: OF90A Deal Price (Optional but has conditional requirements)
                _1601_of90a_percentage_type_code_b: {
                    required: function(element) {
                        return $("#type_of90_b").val() == "a";
                    }
                },
                _1603_of90a_price_b: {
                    required: function(element) {
                        return $("#type_of90_b").val() == "a";
                    }
                },
                
                // OF90B
                _1605_of90b_amount_type_code_b: {
                    required: function(element) {
                        return $("#type_of90_b").val() == "b";
                    }
                },
                _1606_of90b_currency_b: {
                    required: function(element) {
                        return $("#type_of90_b").val() == "b";
                    }
                },
                _1607_of90b_price_b: {
                    required: function(element) {
                        return $("#type_of90_b").val() == "b";
                    }
                },

                // Field 17: OF99A Number of Days Accrued (Optional)
                _1702_of99a_number_b: {
                    required: function(element) {
                        return $("#check_of99a_b").is(":checked");
                    }
                },

                // Subsequence B1 - Optional fields with conditional requirements
                
                // Field 20: OF94B Place of Listing
                _2003_of94b_place_code_b1: {
                    required: function(element) {
                        return $("#check_of94b_b1").is(":checked");
                    }
                },
                _2005_of94b_narrative_b1: {
                    required: function(element) {
                        return $("#check_of94b_b1").is(":checked");
                    }
                },

                // Field 21: OF22F Indicator (Repetitive)
                _210_of22f_qualifier_b1: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none' 
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2103_of22f_indicator_b1: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },

                // Field 22: OF12A Type of Financial Instrument
                _2203_of12a_instrument_code_b1: {
                    required: function(element) {
                        return $("#type_of12_b1").val() == "a" 
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2204_of12b_qualifier_b1: {
                    required: function(element) {
                        return $("#type_of12_b1").val() == "b"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2207_of12b_instrument_type_code_b1: {
                    required: function(element) {
                        return $("#type_of12_b1").val() == "b"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2209_of12c_cfi_code_b1: {
                    required: function(element) {
                        return $("#type_of12_b1").val() == "c"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },

                // Field 24: OF98A Date/Time (Repetitive)
                _240_of98a_qualifier_b1: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2401_of98a_date_b1: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },

                // Field 25: OF92A Rate (Repetitive)
                _250_of92a_qualifier_b1: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2502_of92a_rate_b1: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },

                // Field 26: OF13A Number Identification
                _2601_of13a_number_id_b1: {
                    required: function(element) {
                        return $("#type_of13_b1").val() == "a"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2602_of13b_qualifier_b1: {
                    required: function(element) {
                        return $("#type_of13_b1").val() == "b"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2605_of13b_number_b1: {
                    required: function(element) {
                        return $("#type_of13_b1").val() == "b"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },

                // Field 27: OF17B Flag (Repetitive)
                _270_of17b_qualifier_b1: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2701_of17b_flag_b1: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },

                // Field 28: OF90A Price (Repetitive in B1)
                _280_of90a_qualifier_b1: {
                    required: function(element) {
                        return $("#type_of90_b1").val() == "a"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2801_of90a_percentage_type_code_b1: {
                    required: function(element) {
                        return $("#type_of90_b1").val() == "a"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2803_of90a_price_b1: {
                    required: function(element) {
                        return $("#type_of90_b1").val() == "a"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2804_of90b_qualifier_b1: {
                    required: function(element) {
                        return $("#type_of90_b1").val() == "b"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2805_of90b_amount_type_code_b1: {
                    required: function(element) {
                        return $("#type_of90_b1").val() == "b"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2806_of90b_currency_b1: {
                    required: function(element) {
                        return $("#type_of90_b1").val() == "b"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2807_of90b_price_b1: {
                    required: function(element) {
                        return $("#type_of90_b1").val() == "b"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },

                // Field 29: OF36A Quantity of Financial Instrument
                _290_of36b_qualifier_b1: {
                    required: function(element) {
                        return $("#type_of36_b1").val() == "b"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2901_of36b_quantity_type_code_b1: {
                    required: function(element) {
                        return $("#type_of36_b1").val() == "b"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2902_of36b_quantity_b1: {
                    required: function(element) {
                        return $("#type_of36_b1").val() == "b"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2903_of36d_qualifier_b1: {
                    required: function(element) {
                        return $("#type_of36_b1").val() == "d"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _2905_of36d_quantity_b1: {
                    required: function(element) {
                        return $("#type_of36_b1").val() == "d"
                            && $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },

                // Field 30: OF35B Identification of the Financial Instrument (Repetitive)
                _3001_of35b_identification_of_security_b1: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },

                // Field 33: OF22F Indicator (Repetitive in main B)
                _330_of22f_qualifier_b: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _3303_of22f_indicator_b: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },

                // Field 35: OF25D Status Code (Repetitive)
                _350_of25d_qualifier_b: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _3503_of25d_status_code_b: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },

                // Field 36: OF70E Narrative (Repetitive)
                _360_of70e_qualifier_b: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                _3601_of70e_narrative_b: {
                    required: function(element) {
                        return $(element).closest('.template_container').css('display') !== 'none'
                            && !$(element).closest('.template_container').attr('id');
                    }
                },
                
                //========================================
                // SEQUENCE C: FINANCIAL INSTRUMENT/ACCOUNT
                //========================================

                // Field 39: MF36A - Quantity of Financial Instrument to be Settled (MANDATORY)
                // Validasi untuk setiap container yang ditambahkan
                type_mf36_c:"required",
                type_mf36_c: {
                    required: function(element) {
                        // Cek apakah element ini ada di container utama atau container item
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) {
                            // Ini adalah field di container utama (bukan di template)
                            return true;
                        }
                        // Jika di dalam container item, cek apakah sudah tidak disabled
                        return !$(element).is(':disabled');
                    }
                },

                // MF36B - Option B: Quantity
                _3901_mf36b_quantity_type_code_c: {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_mf36_c"]');
                        return typeField.val() === "b" && !typeField.is(':disabled');
                    }
                },
                "_3902_mf36b_quantity_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_mf36_c"]');
                        return typeField.val() === "b" && !typeField.is(':disabled');
                    }
                },

                // MF36D - Option D: Quantity of Digital Tokens
                "_3905_mf36d_quantity_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_mf36_c"]');
                        return typeField.val() === "d" && !typeField.is(':disabled');
                    }
                },

                // Field 40: OF70D - Denomination Choice (Optional, no checkbox)
                "_4001_of70d_narrative_c": {
                    required: false
                },

                // Field 41: OF13B - Certificate Number (Optional, repeatable)
                "_4103_of13b_number_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        return !$(element).is(':disabled');
                    }
                },

                // Field 42: OF95A - Party (Optional, repeatable)
                // Option L: Legal Entity Identifier
                "_4201_of95l_legal_entity_identifier_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_of95_c"]');
                        return typeField.val() === "l" && !typeField.is(':disabled');
                    }
                },

                // Option P: Identifier Code
                "_4203_of95p_identifier_code_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_of95_c"]');
                        return typeField.val() === "p" && !typeField.is(':disabled');
                    }
                },

                // Option R: Proprietary Code
                "_4205_of95r_data_source_scheme_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_of95_c"]');
                        return typeField.val() === "r" && !typeField.is(':disabled');
                    }
                },
                "_4207_of95r_proprietary_code_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_of95_c"]');
                        return typeField.val() === "r" && !typeField.is(':disabled');
                    }
                },

                // Field 43: MF97A - Account (MANDATORY)
                // Validasi untuk setiap container yang ditambahkan
                "type_mf97_c": {
                    required: function(element) {
                        // Cek apakah element ini ada di container utama atau container item
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) {
                            // Ini adalah field di container utama (bukan di template)
                            return true;
                        }
                        // Jika di dalam container item, cek apakah sudah tidak disabled
                        return !$(element).is(':disabled');
                    }
                },

                // MF97A - Option A: Account Number
                "_430_mf97a_qualifier_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_mf97_c"]');
                        return typeField.val() === "a" && !typeField.is(':disabled');
                    }
                },
                "_4301_mf97a_account_number_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_mf97_c"]');
                        return typeField.val() === "a" && !typeField.is(':disabled');
                    }
                },

                // MF97B - Option B: Data Source Scheme - Account Type Code - Account Number
                "_4305_mf97b_account_type_code_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_mf97_c"]');
                        return typeField.val() === "b" && !typeField.is(':disabled');
                    }
                },
                "_4307_mf97b_account_number_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_mf97_c"]');
                        return typeField.val() === "b" && !typeField.is(':disabled');
                    }
                },

                // MF97D - Option D: Data Source Scheme - Identification of Blockchain or Wallet
                "_43011_mf97d_blockchain_wallet_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_mf97_c"]');
                        return typeField.val() === "d" && !typeField.is(':disabled');
                    }
                },

                // MF97E - Option E: International Bank Account Number
                "_43013_mf97e_account_number_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_mf97_c"]');
                        return typeField.val() === "e" && !typeField.is(':disabled');
                    }
                },

                // Field 44: OF94A - Place of Safekeeping (Optional, repeatable)
                // Option B: Place Code
                "_4403_of94b_place_code_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_of94_c"]');
                        return typeField.val() === "b" && !typeField.is(':disabled');
                    }
                },

                // Option C: Country Code
                "_4407_of94c_country_code_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_of94_c"]');
                        return typeField.val() === "c" && !typeField.is(':disabled');
                    }
                },

                // Option F: Place Code and Identifier Code
                "_4409_of94f_place_code_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_of94_c"]');
                        return typeField.val() === "f" && !typeField.is(':disabled');
                    }
                },
                "_44010_of94f_identifier_code_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_of94_c"]');
                        return typeField.val() === "f" && !typeField.is(':disabled');
                    }
                },

                // Option L: Legal Entity Identifier
                "_44012_of94l_legal_entity_identifier_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_of94_c"]');
                        return typeField.val() === "l" && !typeField.is(':disabled');
                    }
                },

                // Option T: Digital Ledger Identifier
                "_44014_of94t_digital_ledger_identifier_c": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let typeField = container.find('[id^="type_of94_c"]');
                        return typeField.val() === "t" && !typeField.is(':disabled');
                    }
                },

                //========================================
                // SUBSEQUENCE C1: QUANTITY BREAKDOWN
                //========================================

                // Field 46: OF13B - Lot Number (Optional with checkbox)
                "_4603_of13b_number_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of13b_c1"]');
                        return checkbox.is(":checked") && !$(element).is(':disabled');
                    }
                },

                // Field 47: OF36A - Quantity of Financial Instrument In The Lot (Optional with checkbox)
                "_4701_of36b_quantity_type_code_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of36a_c1"]');
                        let typeField = container.find('[id^="type_of36_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "b" && !$(element).is(':disabled');
                    }
                },
                "_4702_of36b_quantity_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of36a_c1"]');
                        let typeField = container.find('[id^="type_of36_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "b" && !$(element).is(':disabled');
                    }
                },
                "_4705_of36d_quantity_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of36a_c1"]');
                        let typeField = container.find('[id^="type_of36_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "d" && !$(element).is(':disabled');
                    }
                },

                // Field 48: OF98A - Lot Date/Time (Optional with checkbox)
                "_4801_of98a_date_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of98a_c1"]');
                        let typeField = container.find('[id^="type_of98_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "a" && !$(element).is(':disabled');
                    }
                },
                "_4803_of98c_date_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of98a_c1"]');
                        let typeField = container.find('[id^="type_of98_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "c" && !$(element).is(':disabled');
                    }
                },
                "_4804_of98c_time_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of98a_c1"]');
                        let typeField = container.find('[id^="type_of98_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "c" && !$(element).is(':disabled');
                    }
                },
                "_4806_of98e_date_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of98a_c1"]');
                        let typeField = container.find('[id^="type_of98_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "e" && !$(element).is(':disabled');
                    }
                },
                "_4807_of98e_time_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of98a_c1"]');
                        let typeField = container.find('[id^="type_of98_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "e" && !$(element).is(':disabled');
                    }
                },

                // Field 49: OF90A - Book/Lot Price (Optional with checkbox)
                "_4901_of90a_percentage_type_code_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of90a_c1"]');
                        let typeField = container.find('[id^="type_of90_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "a" && !$(element).is(':disabled');
                    }
                },
                "_4903_of90a_price_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of90a_c1"]');
                        let typeField = container.find('[id^="type_of90_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "a" && !$(element).is(':disabled');
                    }
                },
                "_4905_of90b_amount_type_code_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of90a_c1"]');
                        let typeField = container.find('[id^="type_of90_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "b" && !$(element).is(':disabled');
                    }
                },
                "_4906_of90b_currency_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of90a_c1"]');
                        let typeField = container.find('[id^="type_of90_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "b" && !$(element).is(':disabled');
                    }
                },
                "_4907_of90b_price_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of90a_c1"]');
                        let typeField = container.find('[id^="type_of90_c1"]');
                        return checkbox.is(":checked") && typeField.val() === "b" && !$(element).is(':disabled');
                    }
                },

                // Field 50: OF22F - Type of Price Indicator (Optional with checkbox)
                "_5003_of22f_indicator_c1": {
                    required: function(element) {
                        let container = $(element).closest('.template_container, [id^="container_item_"]');
                        if (container.length === 0) return false;
                        let checkbox = container.find('[id^="check_of22f_c1"]');
                        return checkbox.is(":checked") && !$(element).is(':disabled');
                    }
                },
                
                //========================================
                // SEQUENCE D: TWO LEG TRANSACTION DETAILS
                //========================================
                
                
                // Field 60: OF70C - Second Leg Narrative (Optional)
                // When present, narrative field must be filled
                _6001_of70c_d_narrative: {
                    required: function(element) {
                        return $("#check_d").is(":checked");
                    }
                },
                
                
                //========================================
                // SEQUENCE E: SETTLEMENT DETAILS
                //========================================
                
                _6303_mf22f_e_indicator: "required",
                
                //========================================
                // SUBSEQUENCE E1
                //========================================
                type_mf95_e1: "required",
                
                //========================================
                // SUBSEQUENCE E2
                //========================================
                type_mf95_e2: "required",
                
                //========================================
                // SUBSEQUENCE E3
                //========================================
                _780_mf19a_e3_qualifier : "required",
                
                //========================================
                // SUBSEQUENCE E4: DIGITAL NETWORK FEE (Optional)
                //========================================
                
                
                // Field 83: MF35B - Identification of Financial Instrument
                _8301_mf35b_e4_identification_of_security: {
                    required: function(element) {
                        return $("#check_e4").is(":checked");
                    },
                    minlength: 12,
                    maxlength: 12
                },
                
                // Field 84: MF36D - Quantity of Digital Asset
                _8402_mf36d_e4_quantity_of_digital_tokens: {
                    required: function(element) {
                        return $("#check_e4").is(":checked");
                    }
                },
                
                // Field 85: MF16S - End of Block E4
                _850_mf16s_e4_end_of_block: {
                    required: function(element) {
                        return $("#check_e4").is(":checked");
                    }
                },
                
                //========================================
                // SEQUENCE F: OTHER PARTIES
                //========================================
                type_mf95_f: "required",
            },
            
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                //========================================
                // SEQUENCE A MESSAGES
                //========================================
                _021_mf20c_reference_a: {
                    required: "MF20C Sender's Message Reference must be filled..!!"
                },
                _030_mf23g_function_of_the_message_a: {
                    required: "MF23G Function of the Message must be filled..!!"
                },
                _051_of99b_number_a: {
                    required: "OF99B SETT (Current Settlement Instruction Number) must be filled when TOSE is present..!!"
                },
                _053_of99c_number_a: {
                    required: "OF99C SETT (Current Settlement Instruction Number) must be filled when TOSE is present..!!"
                },

                _091_mf20c_reference_a1: {
                    required: "MF20a Reference must be filled..!!"
                },
                _093_mf20n_reference_a1: {
                    required: "MF20a Reference must be filled..!!"
                },
                _095_mf20u_reference_a1: {
                    required: "MF20a Reference must be filled..!!"
                },
                
                //========================================
                // SEQUENCE B MESSAGES
                //========================================
                // MF98A messages
                // type_mf98_b: {required: "MF98A Date/Time must be filled..!!"},
                _150_mf98a_qualifier_b: {required: "MF98A Qualifier must be selected!"},
                _1501_mf98a_date_b: {required: "MF98A Date must be filled (format: YYYYMMDD)!"},
                _1502_mf98b_qualifier_b: {required: "MF98B Qualifier must be selected!"},
                _1505_mf98b_date_code_b: {required: "MF98B Date Code must be filled!"},
                _1506_mf98c_qualifier_b: {required: "MF98C Qualifier must be selected!"},
                _1507_mf98c_date_b: {required: "MF98C Date must be filled (format: YYYYMMDD)!"},
                _1508_mf98c_time_b: {required: "MF98C Time must be filled (format: HHMMSS)!"},
                _15010_mf98e_date_b: {required: "MF98E Date must be filled (format: YYYYMMDD)!"},
                _15011_mf98e_time_b: {required: "MF98E Time must be filled (format: HHMMSS)!"},
                
                // MF35B messages
                _1801_mf35b_identification_of_security_b: {required: "Identification of Security must be filled (12 characters ISIN)!"},
                
                // OF90A messages
                _1601_of90a_percentage_type_code_b: {required: "Percentage Type Code must be selected!"},
                _1603_of90a_price_b: {required: "Price must be filled!"},
                _1605_of90b_amount_type_code_b: {required: "Amount Type Code must be selected!"},
                _1606_of90b_currency_b: {required: "Currency Code must be filled (3 letters)!"},
                _1607_of90b_price_b: {required: "Price must be filled!"},
                
                // OF99A messages
                _1702_of99a_number_b: {required: "Number of Days must be filled!"},
                
                // Subsequence B1 messages
                _2003_of94b_place_code_b1: {required: "Place Code must be filled (4 characters)!"},
                _2005_of94b_narrative_b1: {required: "Narrative must be filled!"},
                _210_of22f_qualifier_b1: {required: "Qualifier must be selected!"},
                _2103_of22f_indicator_b1: {required: "Indicator must be filled (4 characters)!"},
                _2203_of12a_instrument_code_b1: {required: "Instrument Code must be filled!"},
                _2204_of12b_qualifier_b1: {required: "Qualifier must be selected!"},
                _2207_of12b_instrument_type_code_b1: {required: "Instrument Type Code must be filled!"},
                _2209_of12c_cfi_code_b1: {required: "CFI Code must be filled (6 characters)!"},
                _240_of98a_qualifier_b1: {required: "Qualifier must be selected!"},
                _2401_of98a_date_b1: {required: "Date must be filled (format: YYYYMMDD)!"},
                _250_of92a_qualifier_b1: {required: "Qualifier must be selected!"},
                _2502_of92a_rate_b1: {required: "Rate must be filled!"},
                _2601_of13a_number_id_b1: {required: "Number ID must be filled!"},
                _2602_of13b_qualifier_b1: {required: "Qualifier must be selected!"},
                _2605_of13b_number_b1: {required: "Number must be filled!"},
                _270_of17b_qualifier_b1: {required: "Qualifier must be selected!"},
                _2701_of17b_flag_b1: {required: "Flag must be selected!"},
                _280_of90a_qualifier_b1: {required: "Qualifier must be selected!"},
                _2801_of90a_percentage_type_code_b1: {required: "Percentage Type Code must be selected!"},
                _2803_of90a_price_b1: {required: "Price must be filled!"},
                _2804_of90b_qualifier_b1: {required: "Qualifier must be selected!"},
                _2805_of90b_amount_type_code_b1: {required: "Amount Type Code must be selected!"},
                _2806_of90b_currency_b1: {required: "Currency Code must be filled!"},
                _2807_of90b_price_b1: {required: "Price must be filled!"},
                _290_of36b_qualifier_b1: {required: "Qualifier must be selected!"},
                _2901_of36b_quantity_type_code_b1: {required: "Quantity Type Code must be selected!"},
                _2902_of36b_quantity_b1: {required: "Quantity must be filled!"},
                _2903_of36d_qualifier_b1: {required: "Qualifier must be selected!"},
                _2905_of36d_quantity_b1: {required: "Quantity of Digital Tokens must be filled!"},
                _3001_of35b_identification_of_security_b1: {required: "Identification of Security must be filled!"},
                _330_of22f_qualifier_b: {required: "Qualifier must be selected!"},
                _3303_of22f_indicator_b: {required: "Indicator must be filled!"},
                _350_of25d_qualifier_b: {required: "Qualifier must be selected!"},
                _3503_of25d_status_code_b: {required: "Status Code must be filled!"},
                _360_of70e_qualifier_b: {required: "Qualifier must be selected!"},
                _3601_of70e_narrative_b: {required: "Narrative must be filled!"},
                
                //========================================
                // SEQUENCE C MESSAGES
                //========================================

                // MF36A - Quantity of Financial Instrument to be Settled
                type_mf36_c: {required: "MF36A Quantity of Financial Instrument to be Settle must be filled..!!"},
                _3901_mf36b_quantity_type_code_c: {
                    required: "MF36B Quantity Type Code must be selected when Option B is chosen!"
                },
                _3902_mf36b_quantity_c: {
                    required: "MF36B Quantity must be filled when Option B is chosen!"
                },
                _3905_mf36d_quantity_c: {
                    required: "MF36D Quantity of Digital Tokens must be filled when Option D is chosen!"
                },

                // OF70D - Denomination Choice
                _4001_of70d_narrative_c: {
                    required: "OF70D Narrative must be filled!"
                },

                // OF13B - Certificate Number
                _4103_of13b_number_c: {
                    required: "OF13B Number must be filled!"
                },

                // OF95A - Party
                _4201_of95l_legal_entity_identifier_c: {
                    required: "OF95L Legal Entity Identifier must be filled when Option L is chosen!"
                },
                _4203_of95p_identifier_code_c: {
                    required: "OF95P Identifier Code must be filled when Option P is chosen!"
                },
                _4205_of95r_data_source_scheme_c: {
                    required: "OF95R Data Source Scheme must be filled when Option R is chosen!"
                },
                _4207_of95r_proprietary_code_c: {
                    required: "OF95R Proprietary Code must be filled when Option R is chosen!"
                },

                // MF97A - Account
                type_mf97_c: {
                    required: "MF97A Account Type must be selected! This is a mandatory field."
                },
                _430_mf97a_qualifier_c: {
                    required: "MF97A Qualifier must be selected when Option A is chosen!"
                },
                _4301_mf97a_account_number_c: {
                    required: "MF97A Account Number must be filled when Option A is chosen!"
                },
                _4305_mf97b_account_type_code_c: {
                    required: "MF97B Account Type Code must be filled when Option B is chosen!"
                },
                _4307_mf97b_account_number_c: {
                    required: "MF97B Account Number must be filled when Option B is chosen!"
                },
                _43011_mf97d_blockchain_wallet_c: {
                    required: "MF97D Blockchain or Wallet Identification must be filled when Option D is chosen!"
                },
                _43013_mf97e_account_number_c: {
                    required: "MF97E International Bank Account Number must be filled when Option E is chosen!"
                },

                // OF94A - Place of Safekeeping
                _4403_of94b_place_code_c: {
                    required: "OF94B Place Code must be filled when Option B is chosen!"
                },
                _4407_of94c_country_code_c: {
                    required: "OF94C Country Code must be filled when Option C is chosen!"
                },
                _4409_of94f_place_code_c: {
                    required: "OF94F Place Code must be selected when Option F is chosen!"
                },
                _44010_of94f_identifier_code_c: {
                    required: "OF94F Identifier Code must be filled when Option F is chosen!"
                },
                _44012_of94l_legal_entity_identifier_c: {
                    required: "OF94L Legal Entity Identifier must be filled when Option L is chosen!"
                },
                _44014_of94t_digital_ledger_identifier_c: {
                    required: "OF94T Digital Ledger Identifier must be filled when Option T is chosen!"
                },

                // SUBSEQUENCE C1 MESSAGES

                // OF13B - Lot Number
                _4603_of13b_number_c1: {
                    required: "OF13B Number must be filled when Lot Number is selected!"
                },

                // OF36A - Quantity in the Lot
                _4701_of36b_quantity_type_code_c1: {
                    required: "OF36B Quantity Type Code must be selected when Option B is chosen!"
                },
                _4702_of36b_quantity_c1: {
                    required: "OF36B Quantity must be filled when Option B is chosen!"
                },
                _4705_of36d_quantity_c1: {
                    required: "OF36D Quantity of Digital Tokens must be filled when Option D is chosen!"
                },

                // OF98A - Lot Date/Time
                _4801_of98a_date_c1: {
                    required: "OF98A Date must be filled when Option A is chosen!"
                },
                _4803_of98c_date_c1: {
                    required: "OF98C Date must be filled when Option C is chosen!"
                },
                _4804_of98c_time_c1: {
                    required: "OF98C Time must be filled when Option C is chosen!"
                },
                _4806_of98e_date_c1: {
                    required: "OF98E Date must be filled when Option E is chosen!"
                },
                _4807_of98e_time_c1: {
                    required: "OF98E Time must be filled when Option E is chosen!"
                },

                // OF90A - Book/Lot Price
                _4901_of90a_percentage_type_code_c1: {
                    required: "OF90A Percentage Type Code must be selected when Option A is chosen!"
                },
                _4903_of90a_price_c1: {
                    required: "OF90A Price must be filled when Option A is chosen!"
                },
                _4905_of90b_amount_type_code_c1: {
                    required: "OF90B Amount Type Code must be selected when Option B is chosen!"
                },
                _4906_of90b_currency_c1: {
                    required: "OF90B Currency must be filled when Option B is chosen!"
                },
                _4907_of90b_price_c1: {
                    required: "OF90B Price must be filled when Option B is chosen!"
                },

                // OF22F - Type of Price Indicator
                _5003_of22f_indicator_c1: {
                    required: "OF22F Indicator must be filled when Type of Price Indicator is selected!"
                },
                
                //========================================
                // SEQUENCE D MESSAGES
                //========================================
                _6001_of70c_d_narrative: {
                    required: "OF70C Second Leg Narrative must be filled when Sequence D is active..!!"
                },
                
                //========================================
                // SEQUENCE E MESSAGES
                //========================================
                _6303_mf22f_e_indicator: {required:"mf22f Indicator must be filled...!"},            
                
                // Subsequence E1
//                type_mf95_e1: {required:"mf95a Party must be filled...!"},
                
                // SUBSEQUENCE E2
//                type_mf95_e2: {required:"mf95a Party must be filled...!"},
                
                // SUBSEQUENCE E3
                _780_mf19a_e3_qualifier: {required:"mf19a Amount must be filled...!"},
                
                // Subsequence E4
                
                _8301_mf35b_e4_identification_of_security: {
                    required: "MF35B Identification of Security is mandatory when Digital Network Fee is present!",
                    minlength: "ISIN must be exactly 12 characters!",
                    maxlength: "ISIN must be exactly 12 characters!"
                },
                
                _8402_mf36d_e4_quantity_of_digital_tokens: {
                    required: "MF36D Quantity of Digital Tokens is mandatory when Digital Network Fee is present!"
                },
                
                _850_mf16s_e4_end_of_block: {
                    required: "MF16S End of Block NTWKFEE is required when Digital Network Fee is present!"
                },
                
                //========================================
                // SEQUENCE F MESSAGES
                //========================================
                type_mf95_f: {required:"mf95a Party must be filled...!"},
            },
            
            errorPlacement: function (error, element) {
                error.insertAfter(element);
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
        
        //========================================
        // CUSTOM VALIDATION METHODS (SEQ A)
        //========================================
        
        // Custom method for regex validation
        $.validator.addMethod("regex", function(value, element, param) {
            return this.optional(element) || param.test(value); 
        }, "Invalid format");
        
        //========================================
        // C3: RULE - TOSE and SETT validation for OF99A
        //========================================
        $.validator.addMethod("validateTOSESETT", function(value, element) {
            // Check if any TOSE qualifier exists (both OF99B and OF99C)
            let toseExists = false;
            
            // Check OF99B qualifiers
            $("[id^='_050_of99b_qualifier_a']").each(function() {
                if ($(this).val() === ":TOSE//") {
                    toseExists = true;
                    return false;
                }
            });
            
            // Check OF99C qualifiers if not found in OF99B
            if (!toseExists) {
                $("[id^='_052_of99c_qualifier_a']").each(function() {
                    if ($(this).val() === ":TOSE//") {
                        toseExists = true;
                        return false;
                    }
                });
            }
            
            // If TOSE exists, at least one SETT must exist
            if (toseExists) {
                let settExists = false;
                
                // Check OF99B for SETT
                $("[id^='_050_of99b_qualifier_a']").each(function() {
                    if ($(this).val() === ":SETT//") {
                        let numberField = $(this).closest('.form-row').parent().find("[id^='_051_of99b_number_a']");
                        if (numberField.val() && numberField.val().trim() !== "") {
                            settExists = true;
                            return false;
                        }
                    }
                });
                
                // Check OF99C for SETT if not found in OF99B
                if (!settExists) {
                    $("[id^='_052_of99c_qualifier_a']").each(function() {
                        if ($(this).val() === ":SETT//") {
                            let numberField = $(this).closest('.form-row').parent().find("[id^='_053_of99c_number_a']");
                            if (numberField.val() && numberField.val().trim() !== "") {
                                settExists = true;
                                return false;
                            }
                        }
                    });
                }
                
                return settExists;
            }
            
            return true;
        }, "C3 Rule: If TOSE (Total of Linked Settlement Instructions) is present, then SETT (Current Settlement Instruction Number) must be present!");
        
        //========================================
        // C8: RULE - CANC function requires PREV in A1
        //========================================
        $.validator.addMethod("validateCANCFunction", function(value, element) {
            let functionValue = $("#_030_mf23g_function_of_the_message_a").val();
            
            if (functionValue === "CANC") {
                // Check if at least one A1 subsequence exists
                let a1Count = parseInt($("#cur_occ_a1").text()) || 0;
                if (a1Count === 0) {
                    return false;
                }
                
                // Check if at least one PREV reference exists in A1
                let prevExists = false;
                
                // Check all MF20C qualifiers in A1 for PREV
                $("[id^='_090_mf20c_qualifier_a1']").each(function() {
                    if ($(this).val() === ":PREV//") {
                        // Verify that the corresponding reference field has value
                        let refField = $(this).closest('.form-row').parent().find("[id^='_091_mf20c_reference_a1']");
                        if (refField.length > 0 && refField.val() && refField.val().trim() !== "") {
                            prevExists = true;
                            return false;
                        }
                    }
                });
                
                if (!prevExists) {
                    return false;
                }
                
                // Additionally verify that A1 subsequence is actually present
                let a1Exists = $("[id^='_060_mf16r_start_of_block_a1']").length > 0;
                return a1Exists;
            }
            
            return true;
        }, "C8 Rule: When Function is CANC, at least one Linkage (Subsequence A1) with field 20C :PREV// (Previous Message Reference) must be present!");
        
        //========================================
        // Apply custom validations
        //========================================
        
        // Apply C3 rule to function field (it will trigger on any OF99A change)
        $("#_030_mf23g_function_of_the_message_a").rules("add", {
            validateTOSESETT: true
        });
        
        // Apply C8 rule to function field
        $("#_030_mf23g_function_of_the_message_a").rules("add", {
            validateCANCFunction: true
        });
        
        //========================================
        // DYNAMIC FIELD VALIDATION FOR OF99A
        //========================================
        // When OF99A fields are added dynamically, we need to add validation
        $(document).on('DOMNodeInserted', function(e) {
            // Add validation for dynamically added OF99B fields
            $("[id^='_051_of99b_number_a']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let currentQualifier = $(element).closest('.form-row').parent().find("[id^='_050_of99b_qualifier_a']").val();
                            return currentQualifier === ":SETT//";
                        },
                        messages: {
                            required: "Field 99B :SETT// Number is required!"
                        }
                    });
                }
            });
            
            // Add validation for dynamically added OF99C fields
            $("[id^='_053_of99c_number_a']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let currentQualifier = $(element).closest('.form-row').parent().find("[id^='_052_of99c_qualifier_a']").val();
                            return currentQualifier === ":SETT//";
                        },
                        messages: {
                            required: "Field 99C :SETT// Number is required!"
                        }
                    });
                }
            });
        });
        
        //========================================
        // DYNAMIC FIELD VALIDATION FOR A1 SUBSEQUENCE
        //========================================
        // When A1 fields are added dynamically, add validation rules
        $(document).on('DOMNodeInserted', function(e) {
            // Validate MF20A Reference in A1 (MANDATORY field)
            $("[id^='_091_mf20c_reference_a1']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let typeField = $(element).closest('.form-row').parent().find("[id^='type_mf20_a1']");
                            return typeField.val() === "c";
                        },
                        messages: {
                            required: "Field 20C Reference is mandatory when Option C is selected!"
                        }
                    });
                }
            });
            
            $("[id^='_093_mf20n_reference_a1']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let typeField = $(element).closest('.form-row').parent().find("[id^='type_mf20_a1']");
                            return typeField.val() === "n";
                        },
                        messages: {
                            required: "Field 20N Reference is mandatory when Option N is selected!"
                        }
                    });
                }
            });
            
            $("[id^='_095_mf20u_reference_a1']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let typeField = $(element).closest('.form-row').parent().find("[id^='type_mf20_a1']");
                            return typeField.val() === "u";
                        },
                        messages: {
                            required: "Field 20U UTI Reference is mandatory when Option U is selected!"
                        }
                    });
                }
            });
            
            // Validate MF20A Type selector
            $("[id^='type_mf20_a1']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        messages: {
                            required: "Field 20a Reference Type must be selected in Subsequence A1!"
                        }
                    });
                }
            });
        });
        
        //========================================
        // CUSTOM VALIDATION METHODS (SEQ C)
        //========================================
        
        // C14: MF36A Quantity cannot appear more than twice
        $.validator.addMethod("validateMF36AQuantity", function(value, element) {
            let settCount = 0;
            let famtExists = false;
            let amorExists = false;
            
            // Count all MF36B SETT occurrences
            $("[id^='_3901_mf36b_quantity_type_code_c']").each(function() {
                if ($(this).val() && !$(this).is(':disabled')) {
                    settCount++;
                    if ($(this).val() === "/FAMT/") famtExists = true;
                    if ($(this).val() === "/AMOR/") amorExists = true;
                }
            });
            
            // If count > 2, invalid
            if (settCount > 2) return false;
            
            // If count = 2, must have both FAMT and AMOR
            if (settCount === 2) {
                return famtExists && amorExists;
            }
            
            return true;
        }, "C14 Rule: Field 36B::SETT cannot appear more than twice. When repeated, one occurrence must have Quantity Type Code FAMT and the other must have AMOR!");
        
        // C17: If ALTE is present, then ACOW must be present
        $.validator.addMethod("validateC17Rule", function(value, element) {
            let alteExists = false;
            let acowExists = false;
            
            // Check if ALTE (OF95L) exists
            $("[id^='_4201_of95l_legal_entity_identifier_c']").each(function() {
                if ($(this).val() && $(this).val().trim() !== "" && !$(this).is(':disabled')) {
                    alteExists = true;
                    return false;
                }
            });
            
            // Check if ACOW (OF95P or OF95R) exists
            $("[id^='_4203_of95p_identifier_code_c']").each(function() {
                if ($(this).val() && $(this).val().trim() !== "" && !$(this).is(':disabled')) {
                    acowExists = true;
                    return false;
                }
            });
            
            if (!acowExists) {
                $("[id^='_4207_of95r_proprietary_code_c']").each(function() {
                    if ($(this).val() && $(this).val().trim() !== "" && !$(this).is(':disabled')) {
                        acowExists = true;
                        return false;
                    }
                });
            }
            
            // If ALTE exists, ACOW must exist
            if (alteExists && !acowExists) {
                return false;
            }
            
            return true;
        }, "C17 Rule: If field 95L::ALTE is present in sequence C, then field 95a::ACOW must be present!");
        
        // C18: OF94A Place field validation
        $.validator.addMethod("validateC18Rule", function(value, element) {
            let safeCount = 0;
            let safeL_Count = 0;
            
            // Count OF94 SAFE occurrences
            $("[id^='type_of94_c']").each(function() {
                if ($(this).val() && !$(this).is(':disabled')) {
                    safeCount++;
                    if ($(this).val() === "l") {
                        safeL_Count++;
                    }
                }
            });
            
            // Cannot appear more than twice
            if (safeCount > 2) return false;
            
            // When repeated, one must be option L
            if (safeCount === 2 && safeL_Count !== 1) {
                return false;
            }
            
            return true;
        }, "C18 Rule: Field 94a::SAFE must not be present more than twice. When repeated, one and only one occurrence must be with format option L (94L::SAFE)!");
        
        //========================================
        // NETWORK VALIDATED RULES
        //========================================
        
        // Date validation (YYYYMMDD)
        $.validator.addMethod("validDate", function(value, element) {
            if (!value || value.trim() === "") return true;
            
            if (!/^\d{8}$/.test(value)) return false;
            
            let year = parseInt(value.substr(0, 4));
            let month = parseInt(value.substr(4, 2));
            let day = parseInt(value.substr(6, 2));
            
            if (year < 1900 || year > 2100) return false;
            if (month < 1 || month > 12) return false;
            if (day < 1 || day > 31) return false;
            
            let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            
            if ((year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0)) {
                daysInMonth[1] = 29;
            }
            
            if (day > daysInMonth[month - 1]) return false;
            
            return true;
        }, "Invalid date format. Must be YYYYMMDD (e.g., 20251119)");
        
        // Time validation (HHMMSS)
        $.validator.addMethod("validTime", function(value, element) {
            if (!value || value.trim() === "") return true;
            
            if (!/^\d{6}$/.test(value)) return false;
            
            let hours = parseInt(value.substr(0, 2));
            let minutes = parseInt(value.substr(2, 2));
            let seconds = parseInt(value.substr(4, 2));
            
            if (hours < 0 || hours > 23) return false;
            if (minutes < 0 || minutes > 59) return false;
            if (seconds < 0 || seconds > 59) return false;
            
            return true;
        }, "Invalid time format. Must be HHMMSS (e.g., 123548)");
        
        // Currency validation (3 letters)
        $.validator.addMethod("validCurrency", function(value, element) {
            if (!value || value.trim() === "") return true;
            
            if (!/^[A-Z]{3}$/.test(value)) return false;
            
            return true;
        }, "Invalid currency code. Must be 3 uppercase letters (e.g., USD, EUR, IDR)");
        
        // Decimal validation for quantities and prices
        $.validator.addMethod("validDecimal", function(value, element) {
            if (!value || value.trim() === "") return true;
            
            if (!/^\d+,\d+$/.test(value)) return false;
            
            let parts = value.split(',');
            if (parts[0].length < 1) return false;
            
            return true;
        }, "Invalid decimal format. Must have at least one digit before decimal comma (e.g., 1000,50)");
        
        // BIC validation (Identifier Code)
        $.validator.addMethod("validBIC", function(value, element) {
            if (!value || value.trim() === "") return true;
            
            if (!/^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(value)) return false;
            
            return true;
        }, "Invalid BIC code format. Must be 8 or 11 characters (e.g., BANKIDJA or BANKIDJAXXX)");
        
        // LEI validation (Legal Entity Identifier)
        $.validator.addMethod("validLEI", function(value, element) {
            if (!value || value.trim() === "") return true;
            
            if (!/^[A-Z0-9]{18}\d{2}$/.test(value)) return false;
            
            return true;
        }, "Invalid Legal Entity Identifier format. Must be 18 alphanumeric characters followed by 2 digits");
        
        // Country Code validation (2 letters)
        $.validator.addMethod("validCountryCode", function(value, element) {
            if (!value || value.trim() === "") return true;
            
            if (!/^[A-Z]{2}$/.test(value)) return false;
            
            return true;
        }, "Invalid country code. Must be 2 uppercase letters (e.g., ID, US, GB)");
        
        // Digital Ledger Identifier validation (9 characters)
        $.validator.addMethod("validDigitalLedger", function(value, element) {
            if (!value || value.trim() === "") return true;
            
            if (!/^[\x21-\x7E]{9}$/.test(value)) return false;
            
            return true;
        }, "Invalid Digital Ledger Identifier. Must be 9 characters");
        
        //========================================
        // APPLY CUSTOM VALIDATIONS
        //========================================
        
        // Apply C14 rule to MF36B quantity type code
        $("[id^='_3901_mf36b_quantity_type_code_c']").each(function() {
            $(this).rules("add", {
                validateMF36AQuantity: true
            });
        });
        
        // Apply C17 rule
        $("#_4201_of95l_legal_entity_identifier_c, #_4203_of95p_identifier_code_c, #_4207_of95r_proprietary_code_c").rules("add", {
            validateC17Rule: true
        });
        
        // Apply C18 rule
        $("[id^='type_of94_c']").each(function() {
            $(this).rules("add", {
                validateC18Rule: true
            });
        });
        
        //========================================
        // APPLY NETWORK VALIDATED RULES
        //========================================
        
        // Date fields
        $("[id^='_4801_of98a_date_c1'], [id^='_4803_of98c_date_c1'], [id^='_4806_of98e_date_c1']").each(function() {
            $(this).rules("add", {
                validDate: true
            });
        });
        
        // Time fields
        $("[id^='_4804_of98c_time_c1'], [id^='_4807_of98e_time_c1']").each(function() {
            $(this).rules("add", {
                validTime: true
            });
        });
        
        // Currency fields
        $("[id^='_4906_of90b_currency_c1']").each(function() {
            $(this).rules("add", {
                validCurrency: true
            });
        });
        
        // Decimal fields (quantities and prices)
        $("[id^='_3902_mf36b_quantity_c'], [id^='_3905_mf36d_quantity_c']").each(function() {
            $(this).rules("add", {
                validDecimal: true
            });
        });
        
        $("[id^='_4702_of36b_quantity_c1'], [id^='_4705_of36d_quantity_c1']").each(function() {
            $(this).rules("add", {
                validDecimal: true
            });
        });
        
        $("[id^='_4903_of90a_price_c1'], [id^='_4907_of90b_price_c1']").each(function() {
            $(this).rules("add", {
                validDecimal: true
            });
        });
        
        // BIC fields
        $("[id^='_4203_of95p_identifier_code_c'], [id^='_44010_of94f_identifier_code_c']").each(function() {
            $(this).rules("add", {
                validBIC: true
            });
        });
        
        // LEI fields
        $("[id^='_4201_of95l_legal_entity_identifier_c'], [id^='_44012_of94l_legal_entity_identifier_c']").each(function() {
            $(this).rules("add", {
                validLEI: true
            });
        });
        
        // Country Code fields
        $("[id^='_4407_of94c_country_code_c']").each(function() {
            $(this).rules("add", {
                validCountryCode: true
            });
        });
        
        // Digital Ledger Identifier fields
        $("[id^='_44014_of94t_digital_ledger_identifier_c']").each(function() {
            $(this).rules("add", {
                validDigitalLedger: true
            });
        });
        
        //========================================
        // DYNAMIC FIELD VALIDATION
        //========================================
        
        // When MF36A fields are added dynamically
        $(document).on('DOMNodeInserted', function(e) {
            // Validate MF36B fields
            $("[id^='_3901_mf36b_quantity_type_code_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_mf36_c"]');
                            return typeField.val() === "b" && !typeField.is(':disabled');
                        },
                        validateMF36AQuantity: true,
                        messages: {
                            required: "MF36B Quantity Type Code must be selected when Option B is chosen!"
                        }
                    });
                }
            });
            
            $("[id^='_3902_mf36b_quantity_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_mf36_c"]');
                            return typeField.val() === "b" && !typeField.is(':disabled');
                        },
                        validDecimal: true,
                        messages: {
                            required: "MF36B Quantity must be filled when Option B is chosen!"
                        }
                    });
                }
            });
            
            $("[id^='_3905_mf36d_quantity_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_mf36_c"]');
                            return typeField.val() === "d" && !typeField.is(':disabled');
                        },
                        validDecimal: true,
                        messages: {
                            required: "MF36D Quantity of Digital Tokens must be filled when Option D is chosen!"
                        }
                    });
                }
            });
            
            // Validate MF97A fields
            $("[id^='_4301_mf97a_account_number_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_mf97_c"]');
                            return typeField.val() === "a" && !typeField.is(':disabled');
                        },
                        messages: {
                            required: "MF97A Account Number must be filled when Option A is chosen!"
                        }
                    });
                }
            });
            
            // Validate OF95A fields
            $("[id^='_4201_of95l_legal_entity_identifier_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_of95_c"]');
                            return typeField.val() === "l" && !typeField.is(':disabled');
                        },
                        validLEI: true,
                        validateC17Rule: true,
                        messages: {
                            required: "OF95L Legal Entity Identifier must be filled when Option L is chosen!"
                        }
                    });
                }
            });
            
            $("[id^='_4203_of95p_identifier_code_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_of95_c"]');
                            return typeField.val() === "p" && !typeField.is(':disabled');
                        },
                        validBIC: true,
                        validateC17Rule: true,
                        messages: {
                            required: "OF95P Identifier Code must be filled when Option P is chosen!"
                        }
                    });
                }
            });
            
            $("[id^='_4205_of95r_data_source_scheme_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_of95_c"]');
                            return typeField.val() === "r" && !typeField.is(':disabled');
                        },
                        messages: {
                            required: "OF95R Data Source Scheme must be filled when Option R is chosen!"
                        }
                    });
                }
            });
            
            $("[id^='_4207_of95r_proprietary_code_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_of95_c"]');
                            return typeField.val() === "r" && !typeField.is(':disabled');
                        },
                        validateC17Rule: true,
                        messages: {
                            required: "OF95R Proprietary Code must be filled when Option R is chosen!"
                        }
                    });
                }
            });
            
            // Validate OF94A fields
            $("[id^='_4403_of94b_place_code_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_of94_c"]');
                            return typeField.val() === "b" && !typeField.is(':disabled');
                        },
                        messages: {
                            required: "OF94B Place Code must be filled when Option B is chosen!"
                        }
                    });
                }
            });
            
            $("[id^='_4407_of94c_country_code_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_of94_c"]');
                            return typeField.val() === "c" && !typeField.is(':disabled');
                        },
                        validCountryCode: true,
                        messages: {
                            required: "OF94C Country Code must be filled when Option C is chosen!"
                        }
                    });
                }
            });
            
            $("[id^='_4409_of94f_place_code_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_of94_c"]');
                            return typeField.val() === "f" && !typeField.is(':disabled');
                        },
                        messages: {
                            required: "OF94F Place Code must be selected when Option F is chosen!"
                        }
                    });
                }
            });
            
            $("[id^='_44010_of94f_identifier_code_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_of94_c"]');
                            return typeField.val() === "f" && !typeField.is(':disabled');
                        },
                        validBIC: true,
                        messages: {
                            required: "OF94F Identifier Code must be filled when Option F is chosen!"
                        }
                    });
                }
            });
            
            $("[id^='_44012_of94l_legal_entity_identifier_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_of94_c"]');
                            return typeField.val() === "l" && !typeField.is(':disabled');
                        },
                        validLEI: true,
                        messages: {
                            required: "OF94L Legal Entity Identifier must be filled when Option L is chosen!"
                        }
                    });
                }
            });
            
            $("[id^='_44014_of94t_digital_ledger_identifier_c']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container, [id^="container_item_"]');
                            if (container.length === 0) return false;
                            let typeField = container.find('[id^="type_of94_c"]');
                            return typeField.val() === "t" && !typeField.is(':disabled');
                        },
                        validDigitalLedger: true,
                        messages: {
                            required: "OF94T Digital Ledger Identifier must be filled when Option T is chosen!"
                        }
                    });
                }
            });
        });
        
        //========================================
        // CUSTOM VALIDATION METHODS (SEQ D)
        //========================================
        
        // Network Validated Rule: Date format validation (YYYYMMDD)
        $.validator.addMethod("validDate", function(value, element) {
            if (this.optional(element)) {
                return true;
            }
            // Check if value is 8 digits
            if (!/^\d{8}$/.test(value)) {
                return false;
            }
            // Parse year, month, day
            let year = parseInt(value.substring(0, 4));
            let month = parseInt(value.substring(4, 6));
            let day = parseInt(value.substring(6, 8));
            
            // Validate ranges
            if (month < 1 || month > 12) return false;
            if (day < 1 || day > 31) return false;
            
            // Check days in month
            let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            
            // Check for leap year
            if (year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0)) {
                daysInMonth[1] = 29;
            }
            
            if (day > daysInMonth[month - 1]) return false;
            
            return true;
        }, "Date must be valid and in format YYYYMMDD");
        
        // Network Validated Rule: Time format validation (HHMMSS)
        $.validator.addMethod("validTime", function(value, element) {
            if (this.optional(element)) {
                return true;
            }
            // Check if value is 6 digits
            if (!/^\d{6}$/.test(value)) {
                return false;
            }
            // Parse hours, minutes, seconds
            let hours = parseInt(value.substring(0, 2));
            let minutes = parseInt(value.substring(2, 4));
            let seconds = parseInt(value.substring(4, 6));
            
            // Validate ranges
            if (hours < 0 || hours > 23) return false;
            if (minutes < 0 || minutes > 59) return false;
            if (seconds < 0 || seconds > 59) return false;
            
            return true;
        }, "Time must be valid and in format HHMMSS");
        
        // Network Validated Rule: Amount validation
        $.validator.addMethod("validAmount", function(value, element) {
            if (this.optional(element)) {
                return true;
            }
            // Must have at least one digit in integer part
            // Must have decimal comma
            // Format: up to 15 digits total with mandatory comma
            if (!/^\d{1,12},\d{1,2}$/.test(value)) {
                return false;
            }
            return true;
        }, "Amount must have at least one digit, a mandatory decimal comma, and proper format");
        
        // Network Validated Rule: Rate validation
        $.validator.addMethod("validRate", function(value, element) {
            if (this.optional(element)) {
                return true;
            }
            // Must have at least one digit in integer part
            // Must have decimal comma
            if (!/^\d{1,12},\d{1,2}$/.test(value)) {
                return false;
            }
            return true;
        }, "Rate must have at least one digit, a mandatory decimal comma, and proper format");
        
        // Validation for Sign field (when Rate/Amount is zero, Sign must not be present)
        $.validator.addMethod("signNotAllowedIfZero", function(value, element) {
            let rateField = $(element).closest('.form-row').parent().find('[id*="_rate"], [id*="_amount"]');
            if (rateField.length > 0) {
                let rateValue = rateField.val();
                if (rateValue) {
                    // Remove comma and check if zero
                    let numValue = parseFloat(rateValue.replace(',', '.'));
                    if (numValue === 0 && value) {
                        return false;
                    }
                }
            }
            return true;
        }, "Sign must not be present when Rate/Amount is zero");
        
        //========================================
        // DYNAMIC FIELD VALIDATION
        //========================================
        
        // Function to add validation to dynamically created OF98A fields
        function addOF98AValidation(container, suffix) {
            // Date validation for Option A
            container.find('[id$="_5401_of98a_date_' + suffix + '"]').each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let typeField = $(element).closest('.form-row').parent().find('[id$="type_of98_' + suffix + '"]');
                            return typeField.val() === "a";
                        },
                        validDate: true,
                        messages: {
                            required: "OF98A Date is mandatory when Option A is selected!",
                            validDate: "Date must be valid (YYYYMMDD format)"
                        }
                    });
                }
            });
            
            // Date and Time validation for Option C
            container.find('[id$="_5407_of98c_date_' + suffix + '"]').each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let typeField = $(element).closest('.form-row').parent().find('[id$="type_of98_' + suffix + '"]');
                            return typeField.val() === "c";
                        },
                        validDate: true,
                        messages: {
                            required: "OF98C Date is mandatory when Option C is selected!",
                            validDate: "Date must be valid (YYYYMMDD format)"
                        }
                    });
                }
            });
            
            container.find('[id$="_5408_of98c_time_' + suffix + '"]').each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let typeField = $(element).closest('.form-row').parent().find('[id$="type_of98_' + suffix + '"]');
                            return typeField.val() === "c";
                        },
                        validTime: true,
                        messages: {
                            required: "OF98C Time is mandatory when Option C is selected!",
                            validTime: "Time must be valid (HHMMSS format)"
                        }
                    });
                }
            });
        }
        
        // Function to add validation to dynamically created OF22F fields
        function addOF22FValidation(container, suffix) {
            container.find('[id$="_5503_of22f_d_indicator"]').each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        messages: {
                            required: "OF22F Indicator is mandatory!"
                        }
                    });
                }
            });
        }
        
        // Function to add validation to dynamically created OF92A fields
        function addOF92AValidation(container, suffix) {
            // Option A: Rate validation
            container.find('[id$="_5702_of92a_d_rate"]').each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let typeField = $(element).closest('.form-row').parent().find('[id$="type_of92_' + suffix + '"]');
                            return typeField.val() === "a";
                        },
                        validRate: true,
                        messages: {
                            required: "OF92A Rate is mandatory when Option A is selected!",
                            validRate: "Rate must have proper format with decimal comma"
                        }
                    });
                }
            });
            
            // Option A: Sign validation
            container.find('[id$="_5701_of92a_d_sign"]').each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        signNotAllowedIfZero: true
                    });
                }
            });
            
            // Option C: Rate Name validation
            container.find('[id$="_5706_of92c_d_rate_name"]').each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let typeField = $(element).closest('.form-row').parent().find('[id$="type_of92_' + suffix + '"]');
                            return typeField.val() === "c";
                        },
                        messages: {
                            required: "OF92C Rate Name is mandatory when Option C is selected!"
                        }
                    });
                }
            });
        }
        
        // Function to add validation to dynamically created OF99B fields
        function addOF99BValidation(container, suffix) {
            container.find('[id$="_5801_of99b_d_number"]').each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        messages: {
                            required: "OF99B Number is mandatory!"
                        }
                    });
                }
            });
        }
        
        // Function to add validation to dynamically created OF19A fields
        function addOF19AValidation(container, suffix) {
            // Currency Code validation
            container.find('[id$="_5902_of19a_currency_code_d"]').each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        minlength: 3,
                        maxlength: 3,
                        messages: {
                            required: "OF19A Currency Code is mandatory!",
                            minlength: "Currency Code must be exactly 3 characters",
                            maxlength: "Currency Code must be exactly 3 characters"
                        }
                    });
                }
            });
            
            // Amount validation
            container.find('[id$="_5903_of19a_amount_d"]').each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        validAmount: true,
                        messages: {
                            required: "OF19A Amount is mandatory!",
                            validAmount: "Amount must have proper format with decimal comma"
                        }
                    });
                }
            });
            
            // Sign validation
            container.find('[id$="_5901_of19a_sign_d"]').each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        signNotAllowedIfZero: true
                    });
                }
            });
        }
        
        //========================================
        // MONITOR DYNAMIC FIELD CREATION
        //========================================
        $(document).on('DOMNodeInserted', function(e) {
            // Add validation for OF98A fields
            $('[id*="template_of98a_d"]').each(function() {
                let suffix = "d";
                addOF98AValidation($(this), suffix);
            });
            
            // Add validation for OF22F fields
            $('[id*="template_of22f_d"]').each(function() {
                let suffix = "d";
                addOF22FValidation($(this), suffix);
            });
            
            // Add validation for OF92A fields
            $('[id*="template_of92a_d"]').each(function() {
                let suffix = "d";
                addOF92AValidation($(this), suffix);
            });
            
            // Add validation for OF99B fields
            $('[id*="template_of99b_d"]').each(function() {
                let suffix = "d";
                addOF99BValidation($(this), suffix);
            });
            
            // Add validation for OF19A fields
            $('[id*="template_of19a_d"]').each(function() {
                let suffix = "d";
                addOF19AValidation($(this), suffix);
            });
        });
        
        //========================================
        // CUSTOM VALIDATION METHODS (SEQ E)
        //========================================
        
        // C1: Amount fields cannot appear in more than one occurrence of E3
        $.validator.addMethod("validateUniqueAmountQualifiers", function(value, element) {
            let qualifierCounts = {};
            
            // Count all amount qualifiers across all E3 occurrences
            $("[id*='_mf19a_e3_'][id*='_qualifier']").each(function() {
                if (!$(this).prop("disabled")) {
                    let qualifier = $(this).val();
                    if (qualifier) {
                        qualifierCounts[qualifier] = (qualifierCounts[qualifier] || 0) + 1;
                    }
                }
            });
            
            // Check if any qualifier appears more than once
            for (let qualifier in qualifierCounts) {
                if (qualifierCounts[qualifier] > 1) {
                    return false;
                }
            }
            
            return true;
        }, "C1 Rule (E87): Amount qualifiers cannot appear in more than one occurrence of Subsequence E3!");
        
        // C2: One occurrence of E3 must contain :19A::SETT (Settlement Amount)
        $.validator.addMethod("validateSettlementAmount", function(value, element) {
            let settExists = false;
            
            $("[id*='_mf19a_e3_'][id*='_qualifier']").each(function() {
                if (!$(this).prop("disabled") && $(this).val() === ":SETT//") {
                    settExists = true;
                    return false;
                }
            });
            
            return settExists;
        }, "C2 Rule (E92): At least one occurrence of Subsequence E3 must contain Settlement Amount (:19A::SETT)!");
        
        // C4: Exchange Rate and Resulting Amount validation
        $.validator.addMethod("validateExchangeRate", function(value, element) {
            let isValid = true;
            
            // Check each E3 occurrence
            $("[id^='container_item_e3_']").each(function() {
                let container = $(this);
                let exchangeRate = container.find("[id*='_of92b_e3_'][id*='first_currency_code']").val();
                let resultingAmount = false;
                
                // Check if this E3 has RESU amount
                container.find("[id*='_mf19a_e3_'][id*='_qualifier']").each(function() {
                    if ($(this).val() === ":RESU//") {
                        resultingAmount = true;
                        return false;
                    }
                });
                
                // If exchange rate exists, RESU must exist
                if (exchangeRate && !resultingAmount) {
                    isValid = false;
                    return false;
                }
                
                // If RESU exists, exchange rate must exist
                if (resultingAmount && !exchangeRate) {
                    isValid = false;
                    return false;
                }
            });
            
            return isValid;
        }, "C4 Rule (E62): If Exchange Rate (:92B::EXCH) is present, Resulting Amount (:19A::RESU) must be present in the same E3 occurrence, and vice versa!");
        
        // C5: Party fields cannot appear more than once in message
        $.validator.addMethod("validateUniqueParties", function(value, element) {
            let partyCounts = {};
            
            // Count all party qualifiers in E1
            $("[id*='_mf95'][id*='_e1_'][id*='qualifier'], [id*='_mf95'][id*='_e1_'][id*='prefix']").each(function() {
                if (!$(this).prop("disabled")) {
                    let qualifier = $(this).val();
                    if (qualifier) {
                        let key = "E1_" + qualifier;
                        partyCounts[key] = (partyCounts[key] || 0) + 1;
                    }
                }
            });
            
            // Count all party qualifiers in E2
            $("[id*='_mf95'][id*='_e2_'][id*='qualifier'], [id*='_mf95'][id*='_e2_'][id*='prefix']").each(function() {
                if (!$(this).prop("disabled")) {
                    let qualifier = $(this).val();
                    if (qualifier) {
                        let key = "E2_" + qualifier;
                        partyCounts[key] = (partyCounts[key] || 0) + 1;
                    }
                }
            });
            
            // Check if any party appears more than once
            for (let party in partyCounts) {
                if (partyCounts[party] > 1) {
                    return false;
                }
            }
            
            return true;
        }, "C5 Rule (E84): Party fields cannot appear more than once in the message!");
        
        // C6: If DBNM is NOT present, REAG and PSET must be present
        $.validator.addMethod("validateDBNMRule", function(value, element) {
            let dbnmExists = false;
            
            // Check if DBNM exists in MF22F
            $("[id*='_mf22f_e_'][id*='qualifier']").each(function() {
                if (!$(this).prop("disabled") && $(this).val() === ":DBNM/") {
                    dbnmExists = true;
                    return false;
                }
            });
            
            if (!dbnmExists) {
                let reagExists = false;
                let psetExists = false;
                
                // Check for REAG in E1
                $("[id*='_mf95'][id*='_e1_'][id*='qualifier']").each(function() {
                    if (!$(this).prop("disabled") && $(this).val() === ":REAG//") {
                        reagExists = true;
                        return false;
                    }
                });
                
                // Check for PSET in E1
                $("[id*='_mf95'][id*='_e1_'][id*='qualifier']").each(function() {
                    if (!$(this).prop("disabled") && $(this).val() === ":PSET//") {
                        psetExists = true;
                        return false;
                    }
                });
                
                return reagExists && psetExists;
            }
            
            return true;
        }, "C6 Rule (E93): If :22F::DBNM is NOT present, then Receiving Agent (:REAG) and Place of Settlement (:PSET) must be present in Settlement Parties!");
        
        // C7: Deliverers and Receivers chain validation
        $.validator.addMethod("validateDeliveryChain", function(value, element) {
            let deliverers = {
                'DEI2': false,
                'DEI1': false,
                'DECU': false,
                'SELL': false
            };
            
            let receivers = {
                'REI2': false,
                'REI1': false,
                'RECU': false,
                'BUYR': false
            };
            
            // Check all party qualifiers in E1
            $("[id*='_mf95'][id*='_e1_'][id*='qualifier']").each(function() {
                if (!$(this).prop("disabled")) {
                    let qualifier = $(this).val();
                    if (qualifier) {
                        let party = qualifier.replace(/:/g,"").replace(/\//g,"");
                        if (deliverers.hasOwnProperty(party)) {
                            deliverers[party] = true;
                        }
                        if (receivers.hasOwnProperty(party)) {
                            receivers[party] = true;
                        }
                    }
                }
            });
            
            // Validate deliverers chain
            if (deliverers.DEI2 && !deliverers.DEI1) return false;
            if (deliverers.DEI1 && !deliverers.DECU) return false;
            if (deliverers.DECU && !deliverers.SELL) return false;
            
            // Validate receivers chain
            if (receivers.REI2 && !receivers.REI1) return false;
            if (receivers.REI1 && !receivers.RECU) return false;
            if (receivers.RECU && !receivers.BUYR) return false;
            
            return true;
        }, "C7 Rule (E86): Settlement party chain is incomplete. If a party intermediary is present, all preceding parties in the chain must also be present!");
        
        // C9: If PSET is present in E1, Account field is not allowed
        $.validator.addMethod("validatePSETAccount", function(value, element) {
            let isValid = true;
            
            $("[id^='container_item_e1_']").each(function() {
                let container = $(this);
                let psetExists = false;
                
                // Check if PSET exists in this E1
                container.find("[id*='_mf95'][id*='_e1_'][id*='qualifier']").each(function() {
                    if (!$(this).prop("disabled") && $(this).val() === ":PSET//") {
                        psetExists = true;
                        return false;
                    }
                });
                
                // If PSET exists, check if account field has value
                if (psetExists) {
                    let accountValue = container.find("[id*='_of97'][id*='_e1_'][id*='account']").val();
                    if (accountValue && accountValue.trim() !== "") {
                        isValid = false;
                        return false;
                    }
                }
            });
            
            return isValid;
        }, "C9 Rule (E52): If Place of Settlement (:95a::PSET) is present in E1, Account field (:97a::) is not allowed in the same occurrence!");
        
        // C11: If DBNM is present, BUYR must be present
        $.validator.addMethod("validateDBNMBuyer", function(value, element) {
            let dbnmExists = false;
            
            $("[id*='_mf22f_e_'][id*='qualifier']").each(function() {
                if (!$(this).prop("disabled") && $(this).val() === ":DBNM/") {
                    dbnmExists = true;
                    return false;
                }
            });
            
            if (dbnmExists) {
                let buyerExists = false;
                
                $("[id*='_mf95'][id*='_e1_'][id*='qualifier']").each(function() {
                    if (!$(this).prop("disabled") && $(this).val() === ":BUYR//") {
                        buyerExists = true;
                        return false;
                    }
                });
                
                return buyerExists;
            }
            
            return true;
        }, "C11 Rule (E70): If :22F::DBNM is present, Buyer (:95a::BUYR) must be specified in Settlement Parties!");
        
        // C15: Value Date validation for cash/securities split settlement
        $.validator.addMethod("validateValueDate", function(value, element) {
            let isValid = true;
            
            $("[id^='container_item_e3_']").each(function() {
                let container = $(this);
                let valueDate = container.find("[id*='_of98'][id*='_e3_'][id*='date']").val();
                
                if (valueDate && valueDate.trim() !== "") {
                    // Check if STCO//SPST exists
                    let spstExists = false;
                    $("[id*='_mf22f_e_'][id*='qualifier']").each(function() {
                        if (!$(this).prop("disabled") && $(this).val() === ":STCO/") {
                            let indicatorField = $(this).closest('.form-row').parent().find("[id*='_mf22f_e_'][id*='indicator']");
                            if (indicatorField.val() === "SPST") {
                                spstExists = true;
                                return false;
                            }
                        }
                    });
                    
                    if (!spstExists) {
                        isValid = false;
                        return false;
                    }
                    
                    // Check if SETT exists in this E3
                    let settExists = false;
                    container.find("[id*='_mf19a_e3_'][id*='qualifier']").each(function() {
                        if (!$(this).prop("disabled") && $(this).val() === ":SETT//") {
                            settExists = true;
                            return false;
                        }
                    });
                    
                    if (!settExists) {
                        isValid = false;
                        return false;
                    }
                }
            });
            
            return isValid;
        }, "C15 Rule (C28): Value Date (:98a::VALU) can only be provided for cash/securities split settlement. Both :22F::STCO//SPST and :19A::SETT must be present!");
        
        // C20: Network Fee validation
        $.validator.addMethod("validateNetworkFee", function(value, element) {
            let ntwkAmountExists = false;
            
            // Check if :19A::NTWK exists in E3
            $("[id*='_mf19a_e3_'][id*='qualifier']").each(function() {
                if (!$(this).prop("disabled") && $(this).val() === ":NTWK//") {
                    ntwkAmountExists = true;
                    return false;
                }
            });
            
            if (ntwkAmountExists) {
                // Check if E4 is present
                let e4Present = $("#check_e4").is(":checked");
                return !e4Present;
            }
            
            return true;
        }, "C20 Rule (E73): If :19A::NTWK is present in E3, Subsequence E4 (Digital Network Fee) must NOT be present!");
        
        //========================================
        // Apply custom validations to trigger field
        //========================================
        
        // Apply validations to a common field that's always present
        $("#_620_mf16r_e_start_of_block").rules("add", {
            validateUniqueAmountQualifiers: true,
            validateSettlementAmount: true,
            validateExchangeRate: true,
            validateUniqueParties: true,
            validateDBNMRule: true,
            validateDeliveryChain: true,
            validatePSETAccount: true,
            validateDBNMBuyer: true,
            validateValueDate: true,
            validateNetworkFee: true
        });
        
        //========================================
        // DYNAMIC FIELD VALIDATION
        //========================================
        
        // Function to add validation rules dynamically
        function addDynamicValidation() {
            // MF22F Qualifier validation (MANDATORY)
            $("[id*='_mf22f_e_'][id*='qualifier']").each(function() {
                if (!$(this).hasClass('validation-added') && !$(this).prop("disabled")) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        messages: {
                            required: "MF22F Qualifier is mandatory!"
                        }
                    });
                }
            });
            
            // MF22F Indicator validation (MANDATORY)
            $("[id*='_mf22f_e_'][id*='indicator']").each(function() {
                if (!$(this).hasClass('validation-added') && !$(this).prop("disabled")) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        messages: {
                            required: "MF22F Indicator is mandatory!"
                        }
                    });
                }
            });
            
            // E1 - MF95A Party Type validation
            $("[id*='type_mf95_e1']").each(function() {
                if (!$(this).hasClass('validation-added') && !$(this).prop("disabled")) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        messages: {
                            required: "MF95A Party Type must be selected in Settlement Parties!"
                        }
                    });
                }
            });
            
            // E1 - Party fields based on type (Country Code)
            $("[id*='_mf95c_e1_'][id*='country_code']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('[id^="container_item_mf95a_e1_"]');
                            let typeField = container.find("[id*='type_mf95_e1']");
                            return typeField.val() === "c" && !$(element).prop("disabled");
                        },
                        minlength: 2,
                        maxlength: 2,
                        messages: {
                            required: "Country Code is mandatory when Option C is selected!",
                            minlength: "Country Code must be exactly 2 characters!",
                            maxlength: "Country Code must be exactly 2 characters!"
                        }
                    });
                }
            });
            
            // E1 - Legal Entity Identifier
            $("[id*='_mf95l_e1_'][id*='legal_entity_identifier']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('[id^="container_item_mf95a_e1_"]');
                            let typeField = container.find("[id*='type_mf95_e1']");
                            return typeField.val() === "l" && !$(element).prop("disabled");
                        },
                        minlength: 18,
                        maxlength: 20,
                        messages: {
                            required: "Legal Entity Identifier is mandatory when Option L is selected!",
                            minlength: "Legal Entity Identifier must be 18-20 characters!",
                            maxlength: "Legal Entity Identifier must be 18-20 characters!"
                        }
                    });
                }
            });
            
            // E2 - MF95A Party Type validation
            $("[id*='type_mf95_e2']").each(function() {
                if (!$(this).hasClass('validation-added') && !$(this).prop("disabled")) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        messages: {
                            required: "MF95A Party Type must be selected in Cash Parties!"
                        }
                    });
                }
            });
            
            // E3 - OF17B Flag Qualifier validation
            $("[id*='_of17b_e3_'][id*='qualifier']").each(function() {
                if (!$(this).hasClass('validation-added') && !$(this).prop("disabled")) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        messages: {
                            required: "OF17B Flag Qualifier is mandatory!"
                        }
                    });
                }
            });
            
            // E3 - OF17B Flag validation
            $("[id*='_of17b_e3_'][id*='_flag']").each(function() {
                if (!$(this).hasClass('validation-added') && !$(this).prop("disabled")) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        messages: {
                            required: "OF17B Flag is mandatory!"
                        }
                    });
                }
            });
            
            // E3 - MF19A Amount Qualifier validation
            $("[id*='_mf19a_e3_'][id*='qualifier']").each(function() {
                if (!$(this).hasClass('validation-added') && !$(this).prop("disabled")) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        messages: {
                            required: "Amount Qualifier is mandatory!"
                        }
                    });
                }
            });
            
            // E3 - MF19A Currency Code validation
            $("[id*='_mf19a_e3_'][id*='currency_code']").each(function() {
                if (!$(this).hasClass('validation-added') && !$(this).prop("disabled")) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        minlength: 3,
                        maxlength: 3,
                        messages: {
                            required: "Currency Code is mandatory!",
                            minlength: "Currency Code must be exactly 3 characters!",
                            maxlength: "Currency Code must be exactly 3 characters!"
                        }
                    });
                }
            });
            
            // E3 - MF19A Amount validation
            $("[id*='_mf19a_e3_'][id*='_amount']").each(function() {
                if (!$(this).hasClass('validation-added') && !$(this).prop("disabled")) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        messages: {
                            required: "Amount is mandatory!"
                        }
                    });
                }
            });
        }
        
        // Call on document ready
        addDynamicValidation();
        
        // Call whenever DOM changes (new fields added)
        $(document).on('DOMNodeInserted', function(e) {
            setTimeout(function() {
                addDynamicValidation();
            }, 100);
        });
        
        //========================================
        // CUSTOM VALIDATION METHODS (SEQ F)
        //========================================
        
        // Custom method for BIC validation (11 characters alphanumeric)
        $.validator.addMethod("validBIC", function(value, element) {
            if (!value) return true;
            return /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/i.test(value);
        }, "Invalid BIC format. Must be 8 or 11 alphanumeric characters (e.g., ABCDUS33XXX)");
        
        // Custom method for Country Code validation (2 alpha characters)
        $.validator.addMethod("validCountryCode", function(value, element) {
            if (!value) return true;
            return /^[A-Z]{2}$/i.test(value);
        }, "Invalid Country Code. Must be 2 alphabetic characters (e.g., US, GB, JP)");
        
        // Custom method for LEI validation (18 alphanumeric + 2 numeric)
        $.validator.addMethod("validLEI", function(value, element) {
            if (!value) return true;
            return /^[A-Z0-9]{18}[0-9]{2}$/i.test(value);
        }, "Invalid Legal Entity Identifier. Must be 18 alphanumeric + 2 numeric characters");
        
        // Custom method to prevent slash at start/end and double slashes
        $.validator.addMethod("noInvalidSlashes", function(value, element) {
            if (!value) return true;
            if (value.startsWith('/') || value.endsWith('/') || value.includes('//')) {
                return false;
            }
            return true;
        }, "Field must not start/end with '/' or contain '//'");
        
        // Custom method for alphanumeric uppercase
        $.validator.addMethod("alphanumericUppercase", function(value, element) {
            if (!value) return true;
            return /^[A-Z0-9]+$/i.test(value);
        }, "Only alphanumeric characters allowed");
        
        //========================================
        // C5: RULE - Party fields cannot appear more than once
        //========================================
        $.validator.addMethod("validateUniquePartyF", function(value, element) {
            let partyQualifiers = [];
            let duplicates = [];
            
            $("[id^='type_mf95_f']").each(function() {
                let container = $(this).closest('.template_seq_div_rep');
                let typeValue = $(this).val();
                
                if (typeValue) {
                    let qualifier = '';
                    
                    if (typeValue === 'c') {
                        qualifier = 'INVE';
                    } else if (typeValue === 'l') {
                        qualifier = 'ALTE';
                    } else if (typeValue === 'p') {
                        qualifier = container.find("[id^='_8804_mf95p_f_qualifier']").val();
                        qualifier = qualifier.replace(/:/g, '').replace(/\//g, '');
                    } else if (typeValue === 'q') {
                        qualifier = container.find("[id^='_8806_mf95q_f_qualifier']").val();
                        qualifier = qualifier.replace(/:/g, '').replace(/\//g, '');
                    } else if (typeValue === 'r') {
                        qualifier = container.find("[id^='_8808_mf95r_f_qualifier']").val();
                        qualifier = qualifier.replace(/:/g, '').replace(/\//g, '');
                    } else if (typeValue === 's') {
                        qualifier = 'ALTE';
                    }
                    
                    if (qualifier) {
                        let restrictedQualifiers = ['EXCH', 'MEOR', 'MERE', 'TRRE', 'VEND', 'QFIN', 'TRAG', 'BRKR'];
                        
                        if (restrictedQualifiers.includes(qualifier)) {
                            if (partyQualifiers.includes(qualifier)) {
                                duplicates.push(qualifier);
                            } else {
                                partyQualifiers.push(qualifier);
                            }
                        }
                    }
                }
            });
            
            return duplicates.length === 0;
        }, "C5 Rule: The following party qualifiers can only appear once in the message: EXCH, MEOR, MERE, TRRE, VEND, QFIN, TRAG, BRKR");
        
        //========================================
        // C16: RULE - EXCH or TRRE cannot have Account field
        //========================================
        $.validator.addMethod("validateC16Rule", function(value, element) {
            let container = $(element).closest('.template_container');
            let partyType = container.find("[id^='type_mf95_f']").val();
            
            if (!partyType) return true;
            
            let qualifier = '';
            if (partyType === 'p') {
                qualifier = container.find("[id^='_8804_mf95p_f_qualifier']").val();
            } else if (partyType === 'q') {
                qualifier = container.find("[id^='_8806_mf95q_f_qualifier']").val();
            } else if (partyType === 'r') {
                qualifier = container.find("[id^='_8808_mf95r_f_qualifier']").val();
            }
            
            qualifier = qualifier.replace(/:/g, '').replace(/\//g, '');
            
            if (qualifier === 'EXCH' || qualifier === 'TRRE') {
                let accountType = container.find("[id^='type_of97_f']").val();
                if (accountType && accountType !== '') {
                    return false;
                }
            }
            
            return true;
        }, "C16 Rule: If Party is Stock Exchange (EXCH) or Trade Regulator (TRRE), Account field (97a) is not allowed in the same sequence");
        
        //========================================
        // C18: RULE - ALTE field validation
        //========================================
        $.validator.addMethod("validateC18RuleF", function(value, element) {
            let alteCount = 0;
            let alteLCount = 0;
            
            $("[id^='type_mf95_f']").each(function() {
                let typeValue = $(this).val();
                
                if (typeValue === 'l' || typeValue === 's') {
                    alteCount++;
                    if (typeValue === 'l') {
                        alteLCount++;
                    }
                }
            });
            
            if (alteCount > 2) {
                return false;
            }
            
            if (alteCount === 2 && alteLCount !== 1) {
                return false;
            }
            
            return true;
        }, "C18 Rule: Field 95a::ALTE must not appear more than twice. When repeated, one occurrence must be with format option L");
        
        //========================================
        // C19: RULE - ALTE with option L cannot have MEOR or MERE
        //========================================
        $.validator.addMethod("validateC19RuleF", function(value, element) {
            let container = $(element).closest('.template_container');
            let typeValue = container.find("[id^='type_mf95_f']").val();
            
            if (typeValue === 'l') {
                let hasMEOR = false;
                let hasMERE = false;
                
                container.closest('.template_container').find("[id^='type_mf95_f']").each(function() {
                    let checkType = $(this).val();
                    let checkContainer = $(this).closest('.template_seq_div_rep');
                    
                    if (checkType === 'p' || checkType === 'q' || checkType === 'r') {
                        let qualifier = '';
                        if (checkType === 'p') {
                            qualifier = checkContainer.find("[id^='_8804_mf95p_f_qualifier']").val();
                        } else if (checkType === 'q') {
                            qualifier = checkContainer.find("[id^='_8806_mf95q_f_qualifier']").val();
                        } else if (checkType === 'r') {
                            qualifier = checkContainer.find("[id^='_8808_mf95r_f_qualifier']").val();
                        }
                        
                        qualifier = qualifier.replace(/:/g, '').replace(/\//g, '');
                        
                        if (qualifier === 'MEOR') hasMEOR = true;
                        if (qualifier === 'MERE') hasMERE = true;
                    }
                });
                
                if (hasMEOR || hasMERE) {
                    return false;
                }
            }
            
            return true;
        }, "C19 Rule: If field 95a::ALTE is present with format option L, then field 95a::MEOR and 95a::MERE must not be present in the same occurrence");
        
        //========================================
        // Apply custom validations
        //========================================
        
        $(document).on('change', "[id^='type_mf95_f']", function() {
            $(this).rules("add", {
                validateUniquePartyF: true,
                validateC18RuleF: true,
                validateC19RuleF: true
            });
        });
        
        //========================================
        // DYNAMIC FIELD VALIDATION FOR SEQUENCE F
        //========================================
        
        $(document).on('DOMNodeInserted', function(e) {
            
            // MF95A Type selector - MANDATORY
            $("[id^='type_mf95_f']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: true,
                        validateUniquePartyF: true,
                        validateC18RuleF: true,
                        validateC19RuleF: true,
                        messages: {
                            required: "MF95A Party Type must be selected!"
                        }
                    });
                }
            });
            
            // Option C: Country Code
            $("[id^='_8801_mf95c_f_country_code']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_mf95_f']");
                            return typeSelect.val() === 'c';
                        },
                        validCountryCode: true,
                        messages: {
                            required: "MF95C Country Code is mandatory when Option C is selected!",
                            validCountryCode: "Invalid Country Code format (must be 2 alphabetic characters)"
                        }
                    });
                }
            });
            
            // Option L: Legal Entity Identifier
            $("[id^='_8803_mf95l_f_legal_entity_identifier']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_mf95_f']");
                            return typeSelect.val() === 'l';
                        },
                        validLEI: true,
                        messages: {
                            required: "MF95L Legal Entity Identifier is mandatory when Option L is selected!",
                            validLEI: "Invalid LEI format (must be 18 alphanumeric + 2 numeric characters)"
                        }
                    });
                }
            });
            
            // Option P: Qualifier
            $("[id^='_8804_mf95p_f_qualifier']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_mf95_f']");
                            return typeSelect.val() === 'p';
                        },
                        messages: {
                            required: "MF95P Qualifier must be selected when Option P is selected!"
                        }
                    });
                }
            });
            
            // Option P: Identifier Code
            $("[id^='_8805_mf95p_f_identifier_code']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_mf95_f']");
                            return typeSelect.val() === 'p';
                        },
                        validBIC: true,
                        validateC16Rule: true,
                        messages: {
                            required: "MF95P Identifier Code is mandatory when Option P is selected!",
                            validBIC: "Invalid BIC format (must be 8 or 11 alphanumeric characters)"
                        }
                    });
                }
            });
            
            // Option Q: Qualifier
            $("[id^='_8806_mf95q_f_qualifier']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_mf95_f']");
                            return typeSelect.val() === 'q';
                        },
                        messages: {
                            required: "MF95Q Qualifier must be selected when Option Q is selected!"
                        }
                    });
                }
            });
            
            // Option Q: Name and Address
            $("[id^='_8807_mf95q_f_name_and_address']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_mf95_f']");
                            return typeSelect.val() === 'q';
                        },
                        noInvalidSlashes: true,
                        messages: {
                            required: "MF95Q Name and Address is mandatory when Option Q is selected!",
                            noInvalidSlashes: "Name and Address must not start/end with '/' or contain '//'"
                        }
                    });
                }
            });
            
            // Option R: Qualifier
            $("[id^='_8808_mf95r_f_qualifier']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_mf95_f']");
                            return typeSelect.val() === 'r';
                        },
                        messages: {
                            required: "MF95R Qualifier must be selected when Option R is selected!"
                        }
                    });
                }
            });
            
            // Option R: Data Source Scheme
            $("[id^='_8809_mf95r_f_data_source_scheme']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_mf95_f']");
                            return typeSelect.val() === 'r';
                        },
                        alphanumericUppercase: true,
                        messages: {
                            required: "MF95R Data Source Scheme is mandatory when Option R is selected!",
                            alphanumericUppercase: "Data Source Scheme must be alphanumeric uppercase only"
                        }
                    });
                }
            });
            
            // Option R: Proprietary Code
            $("[id^='_88011_mf95r_f_proprietary_code']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_mf95_f']");
                            return typeSelect.val() === 'r';
                        },
                        noInvalidSlashes: true,
                        messages: {
                            required: "MF95R Proprietary Code is mandatory when Option R is selected!",
                            noInvalidSlashes: "Proprietary Code must not start/end with '/' or contain '//'"
                        }
                    });
                }
            });
            
            // Option S: Type of ID
            $("[id^='_88015_mf95s_f_type_of_id']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_mf95_f']");
                            return typeSelect.val() === 's';
                        },
                        alphanumericUppercase: true,
                        messages: {
                            required: "MF95S Type of ID is mandatory when Option S is selected!",
                            alphanumericUppercase: "Type of ID must be alphanumeric uppercase only"
                        }
                    });
                }
            });
            
            // Option S: Country Code
            $("[id^='_88017_mf95s_f_country_code']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_mf95_f']");
                            return typeSelect.val() === 's';
                        },
                        validCountryCode: true,
                        messages: {
                            required: "MF95S Country Code is mandatory when Option S is selected!",
                            validCountryCode: "Invalid Country Code format (must be 2 alphabetic characters)"
                        }
                    });
                }
            });
            
            // Option S: Alternate ID
            $("[id^='_88019_mf95s_f_alternate_id']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_mf95_f']");
                            return typeSelect.val() === 's';
                        },
                        noInvalidSlashes: true,
                        messages: {
                            required: "MF95S Alternate ID is mandatory when Option S is selected!",
                            noInvalidSlashes: "Alternate ID must not start/end with '/' or contain '//'"
                        }
                    });
                }
            });
            
            // Option S: Data Source Scheme - Optional
            $("[id^='_88013_mf95s_f_data_source_scheme']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        alphanumericUppercase: true,
                        messages: {
                            alphanumericUppercase: "Data Source Scheme must be alphanumeric uppercase only"
                        }
                    });
                }
            });
            
            //========================================
            // OF97A - Account (Optional, with C16 rule)
            //========================================
            
            // OF97A Type selector
            $("[id^='type_of97_f']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        validateC16Rule: true,
                        messages: {
                            validateC16Rule: "Account field is not allowed when Party is EXCH or TRRE"
                        }
                    });
                }
            });
            
            // Option A: Account Number
            $("[id^='_8901_of97a_f_account_number']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container');
                            let typeSelect = container.find("[id^='type_of97_f']");
                            return typeSelect.val() === 'a';
                        },
                        noInvalidSlashes: true,
                        messages: {
                            required: "OF97A Account Number is mandatory when Option A is selected!",
                            noInvalidSlashes: "Account Number must not start/end with '/' or contain '//'"
                        }
                    });
                }
            });
            
            // Option D: Data Source Scheme - Optional
            $("[id^='_8903_of97d_f_data_source_scheme']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        alphanumericUppercase: true,
                        messages: {
                            alphanumericUppercase: "Data Source Scheme must be alphanumeric uppercase only"
                        }
                    });
                }
            });
            
            // Option D: Identification of Blockchain or Wallet
            $("[id^='_8905_of97d_f_blockchain_wallet']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container');
                            let typeSelect = container.find("[id^='type_of97_f']");
                            return typeSelect.val() === 'd';
                        },
                        noInvalidSlashes: true,
                        messages: {
                            required: "OF97D Blockchain/Wallet Identification is mandatory when Option D is selected!",
                            noInvalidSlashes: "Blockchain/Wallet ID must not start/end with '/' or contain '//'"
                        }
                    });
                }
            });
            
            //========================================
            // OF70A - Narrative (Optional Repetitive)
            //========================================
            
            // OF70A Type selector
            $("[id^='type_of70_f']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    // Type selector is optional, no validation needed unless selected
                }
            });
            
            // Option C: Narrative
            $("[id^='_9001_of70c_f_narrative']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_of70_f']");
                            return typeSelect.val() === 'c';
                        },
                        noInvalidSlashes: true,
                        messages: {
                            required: "OF70C Narrative is mandatory when Option C is selected!",
                            noInvalidSlashes: "Narrative must not start/end with '/' or contain '//'"
                        }
                    });
                }
            });
            
            // Option D: Narrative
            $("[id^='_9003_of70d_f_narrative']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_of70_f']");
                            return typeSelect.val() === 'd';
                        },
                        noInvalidSlashes: true,
                        messages: {
                            required: "OF70D Narrative is mandatory when Option D is selected!",
                            noInvalidSlashes: "Narrative must not start/end with '/' or contain '//'"
                        }
                    });
                }
            });
            
            // Option E: Narrative
            $("[id^='_9005_of70e_f_narrative']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_seq_div_rep');
                            let typeSelect = container.find("[id^='type_of70_f']");
                            return typeSelect.val() === 'e';
                        },
                        noInvalidSlashes: true,
                        messages: {
                            required: "OF70E Narrative is mandatory when Option E is selected!",
                            noInvalidSlashes: "Narrative must not start/end with '/' or contain '//'"
                        }
                    });
                }
            });
            
            //========================================
            // OF20C - Processing Reference (Optional)
            //========================================
            
            // Reference field - MANDATORY when checkbox is checked
            $("[id^='_9101_of20c_f_reference']").each(function() {
                if (!$(this).hasClass('validation-added')) {
                    $(this).addClass('validation-added');
                    $(this).rules("add", {
                        required: function(element) {
                            let container = $(element).closest('.template_container');
                            let checkbox = container.find("[id^='check_of20c_f']");
                            return checkbox.is(':checked');
                        },
                        noInvalidSlashes: true,
                        messages: {
                            required: "OF20C Reference is mandatory when Processing Reference is enabled!",
                            noInvalidSlashes: "Reference must not start/end with '/' or contain '//'"
                        }
                    });
                }
            });
        });
        
        //========================================
        // BUTTON ACTIONS
        //========================================
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
                alert("There are validation errors! Please fix them before saving.");
            }
        });
    });
</script>

<!--SEQUENCE A-->
<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
        
        //========================================
        // MF23G - Subfunction (Optional - no checkbox)
        //========================================
        // Subfunction langsung tersedia, tidak perlu di-hide
        // User bisa langsung pilih jika dibutuhkan
        
        //========================================
        // OF98A - Preparation Date/Time
        //========================================
        $("#div_of98a_a, #div_of98c_a, #div_of98e_a").hide();
        $("#div_opt_of98e_decimals_a, #div_opt_of98e_utc_indicator_a").hide();
        
        // Disable all fields initially
        $("#_040_of98a_qualifier_a, #_041_of98a_date_a").attr("disabled", true);
        $("#_042_of98c_qualifier_a, #_043_of98c_date_a, #_044_of98c_time_a").attr("disabled", true);
        $("#_045_of98e_qualifier_a, #_046_of98e_date_a, #_047_of98e_time_a").attr("disabled", true);
        $("#_048_of98e_comma_a, #_049_of98e_decimals_a").attr("disabled", true);
        $("#_0410_of98e_slash_a, #_0411_of98e_utc_indicator_a").attr("disabled", true);
        $("#check_of98e_decimals_a, #check_of98e_utc_indicator_a").attr("disabled", true);
        
        // Enable type selector untuk OF98A
        $("#type_of98_a").attr("disabled", false);
        
        $("#type_of98_a").change(function() {
            $("#div_of98a_a, #div_of98c_a, #div_of98e_a").hide();
            $("#div_opt_of98e_decimals_a, #div_opt_of98e_utc_indicator_a").hide();
            
            if ($(this).val() == "a") {
                $("#div_of98a_a").show();
                $("#_040_of98a_qualifier_a, #_041_of98a_date_a").attr("disabled", false);
                $("#_042_of98c_qualifier_a, #_043_of98c_date_a, #_044_of98c_time_a").attr("disabled", true).val("");
                $("#_045_of98e_qualifier_a, #_046_of98e_date_a, #_047_of98e_time_a").attr("disabled", true).val("");
                $("#_048_of98e_comma_a, #_049_of98e_decimals_a").attr("disabled", true).val("");
                $("#_0410_of98e_slash_a, #_0411_of98e_utc_indicator_a").attr("disabled", true).val("");
                $("#check_of98e_decimals_a, #check_of98e_utc_indicator_a").attr("disabled", true).prop("checked", false);
            } else if ($(this).val() == "c") {
                $("#div_of98c_a").show();
                $("#_040_of98a_qualifier_a, #_041_of98a_date_a").attr("disabled", true).val("");
                $("#_042_of98c_qualifier_a, #_043_of98c_date_a, #_044_of98c_time_a").attr("disabled", false);
                $("#_045_of98e_qualifier_a, #_046_of98e_date_a, #_047_of98e_time_a").attr("disabled", true).val("");
                $("#_048_of98e_comma_a, #_049_of98e_decimals_a").attr("disabled", true).val("");
                $("#_0410_of98e_slash_a, #_0411_of98e_utc_indicator_a").attr("disabled", true).val("");
                $("#check_of98e_decimals_a, #check_of98e_utc_indicator_a").attr("disabled", true).prop("checked", false);
            } else if ($(this).val() == "e") {
                $("#div_of98e_a").show();
                $("#_040_of98a_qualifier_a, #_041_of98a_date_a").attr("disabled", true).val("");
                $("#_042_of98c_qualifier_a, #_043_of98c_date_a, #_044_of98c_time_a").attr("disabled", true).val("");
                $("#_045_of98e_qualifier_a, #_046_of98e_date_a, #_047_of98e_time_a").attr("disabled", false);
                $("#check_of98e_decimals_a, #check_of98e_utc_indicator_a").attr("disabled", false);
            } else {
                $("#_040_of98a_qualifier_a, #_041_of98a_date_a").attr("disabled", true).val("");
                $("#_042_of98c_qualifier_a, #_043_of98c_date_a, #_044_of98c_time_a").attr("disabled", true).val("");
                $("#_045_of98e_qualifier_a, #_046_of98e_date_a, #_047_of98e_time_a").attr("disabled", true).val("");
                $("#_048_of98e_comma_a, #_049_of98e_decimals_a").attr("disabled", true).val("");
                $("#_0410_of98e_slash_a, #_0411_of98e_utc_indicator_a").attr("disabled", true).val("");
                $("#check_of98e_decimals_a, #check_of98e_utc_indicator_a").attr("disabled", true).prop("checked", false);
            }
        });
        
        // OF98E Decimals checkbox
        $("#check_of98e_decimals_a").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of98e_decimals_a").show();
                $("#_048_of98e_comma_a, #_049_of98e_decimals_a").attr("disabled", false);
            } else {
                $("#div_opt_of98e_decimals_a").hide();
                $("#_048_of98e_comma_a, #_049_of98e_decimals_a").attr("disabled", true).val("");
            }
        });
        
        // OF98E UTC Indicator checkbox
        $("#check_of98e_utc_indicator_a").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of98e_utc_indicator_a").show();
                $("#_0410_of98e_slash_a, #_0411_of98e_utc_indicator_a").attr("disabled", false);
            } else {
                $("#div_opt_of98e_utc_indicator_a").hide();
                $("#_0410_of98e_slash_a, #_0411_of98e_utc_indicator_a").attr("disabled", true).val("");
            }
        });
        
    });
</script>

<!-- Rule view mode -->
<script language="javascript">
    $(document).ready(function() {
        
        //========================================
        // MF23G - Subfunction - View Mode
        //========================================
        if ($("#_031_mf23g_subfunction_a").val() != "") {
            $("#_031_mf23g_subfunction_a").attr("disabled", false);
        }
        
        //========================================
        // OF98A - View Mode
        //========================================
        if ($("#_041_of98a_date_a").val() != "") {
            $("#type_of98_a").val("a").attr("disabled", false);
            $("#div_of98a_a").show();
            $("#_040_of98a_qualifier_a, #_041_of98a_date_a").attr("disabled", false);
        } else if ($("#_043_of98c_date_a").val() != "" || $("#_044_of98c_time_a").val() != "") {
            $("#type_of98_a").val("c").attr("disabled", false);
            $("#div_of98c_a").show();
            $("#_042_of98c_qualifier_a, #_043_of98c_date_a, #_044_of98c_time_a").attr("disabled", false);
        } else if ($("#_046_of98e_date_a").val() != "" || $("#_047_of98e_time_a").val() != "") {
            $("#type_of98_a").val("e").attr("disabled", false);
            $("#div_of98e_a").show();
            $("#_045_of98e_qualifier_a, #_046_of98e_date_a, #_047_of98e_time_a").attr("disabled", false);
            $("#check_of98e_decimals_a, #check_of98e_utc_indicator_a").attr("disabled", false);
            
            if ($("#_049_of98e_decimals_a").val() != "") {
                $("#check_of98e_decimals_a").prop("checked", true);
                $("#div_opt_of98e_decimals_a").show();
                $("#_048_of98e_comma_a, #_049_of98e_decimals_a").attr("disabled", false);
            }
            
            if ($("#_0411_of98e_utc_indicator_a").val() != "") {
                $("#check_of98e_utc_indicator_a").prop("checked", true);
                $("#div_opt_of98e_utc_indicator_a").show();
                $("#_0410_of98e_slash_a, #_0411_of98e_utc_indicator_a").attr("disabled", false);
            }
        }
        
    });
</script>

<!-- Handle repetitive fields -->
<script type="text/javascript">
    // Toggle OF99A options
    function toggleOF99AOptions(container, countSuffix) {
        let typeSelect = container.find('[id$="type_of99_' + countSuffix + '"]');
        let divB = container.find('[id$="div_of99b_' + countSuffix + '"]');
        let divC = container.find('[id$="div_of99c_' + countSuffix + '"]');
        
        divB.hide();
        divC.hide();
        
        container.find('[id^="_050_of99b_"], [id^="_051_of99b_"]').attr("disabled", true);
        container.find('[id^="_052_of99c_"], [id^="_053_of99c_"]').attr("disabled", true);
        
        typeSelect.change(function() {
            if ($(this).val() == "b") {
                divB.show();
                divC.hide();
                container.find('[id^="_050_of99b_"], [id^="_051_of99b_"]').attr("disabled", false);
                container.find('[id^="_052_of99c_"], [id^="_053_of99c_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "c") {
                divB.hide();
                divC.show();
                container.find('[id^="_050_of99b_"], [id^="_051_of99b_"]').attr("disabled", true).val("");
                container.find('[id^="_052_of99c_"], [id^="_053_of99c_"]').attr("disabled", false);
            } else {
                divB.hide();
                divC.hide();
                container.find('[id^="_050_of99b_"], [id^="_051_of99b_"]').attr("disabled", true).val("");
                container.find('[id^="_052_of99c_"], [id^="_053_of99c_"]').attr("disabled", true).val("");
            }
        });
    }
    
    // Toggle A1 subsequence fields
    function toggleA1Fields(container, countSuffix) {
        
        // OF22F - Has checkbox in mt543.jsp
        let checkOF22F = container.find('[id$="check_of22f_' + countSuffix + '"]');
        let divOF22F = container.find('[id$="div_opt_of22f_' + countSuffix + '"]');
        let divDSS_OF22F = container.find('[id$="div_opt_of22f_data_source_scheme_' + countSuffix + '"]');
        
        divOF22F.hide();
        divDSS_OF22F.show(); // Data Source Scheme selalu tampil di dalam div_opt_of22f
        container.find('[id^="_070_of22f_"], [id^="_071_of22f_"], [id^="_072_of22f_"], [id^="_073_of22f_"]').attr("disabled", true);
        
        checkOF22F.click(function(){
            if ($(this).is(":checked")) {
                divOF22F.show();
                container.find('[id^="_070_of22f_"], [id^="_072_of22f_"], [id^="_073_of22f_"]').attr("disabled", false);
                container.find('[id^="_071_of22f_"]').attr("disabled", false); // Data Source Scheme
            } else {
                divOF22F.hide();
                container.find('[id^="_070_of22f_"], [id^="_071_of22f_"], [id^="_072_of22f_"], [id^="_073_of22f_"]').attr("disabled", true).val("");
            }
        });
        
        // OF13A - Type selector langsung tanpa checkbox
        let typeOF13 = container.find('[id$="type_of13_' + countSuffix + '"]');
        let divOF13A_A = container.find('[id$="div_of13a_' + countSuffix + '"]');
        let divOF13B_A = container.find('[id$="div_of13b_' + countSuffix + '"]');
        let divDSS_OF13B = container.find('[id$="div_opt_of13b_data_source_scheme_' + countSuffix + '"]');
        let divNum_OF13B = container.find('[id$="div_opt_of13b_number_' + countSuffix + '"]');
        
        divOF13A_A.hide();
        divOF13B_A.hide();
        divDSS_OF13B.show(); // Selalu tampil
        divNum_OF13B.show(); // Selalu tampil
        
        typeOF13.attr("disabled", false); // Enable langsung
        container.find('[id^="_080_of13a_"], [id^="_081_of13a_"]').attr("disabled", true);
        container.find('[id^="_082_of13b_"], [id^="_083_of13b_"], [id^="_084_of13b_"], [id^="_085_of13b_"]').attr("disabled", true);
        
        typeOF13.change(function() {
            if ($(this).val() == "a") {
                divOF13A_A.show();
                divOF13B_A.hide();
                container.find('[id^="_080_of13a_"], [id^="_081_of13a_"]').attr("disabled", false);
                container.find('[id^="_082_of13b_"], [id^="_083_of13b_"], [id^="_084_of13b_"], [id^="_085_of13b_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "b") {
                divOF13A_A.hide();
                divOF13B_A.show();
                container.find('[id^="_080_of13a_"], [id^="_081_of13a_"]').attr("disabled", true).val("");
                container.find('[id^="_082_of13b_"], [id^="_083_of13b_"], [id^="_084_of13b_"], [id^="_085_of13b_"]').attr("disabled", false);
            } else {
                divOF13A_A.hide();
                divOF13B_A.hide();
                container.find('[id^="_080_of13a_"], [id^="_081_of13a_"]').attr("disabled", true).val("");
                container.find('[id^="_082_of13b_"], [id^="_083_of13b_"], [id^="_084_of13b_"], [id^="_085_of13b_"]').attr("disabled", true).val("");
            }
        });
        
        // MF20A Reference (Mandatory)
        let typeMF20 = container.find('[id$="type_mf20_' + countSuffix + '"]');
        let divMF20C = container.find('[id$="div_mf20c_' + countSuffix + '"]');
        let divMF20N = container.find('[id$="div_mf20n_' + countSuffix + '"]');
        let divMF20U = container.find('[id$="div_mf20u_' + countSuffix + '"]');
        
        divMF20C.hide();
        divMF20N.hide();
        divMF20U.hide();
        
        container.find('[id^="_090_mf20c_"], [id^="_091_mf20c_"]').attr("disabled", true);
        container.find('[id^="_092_mf20n_"], [id^="_093_mf20n_"]').attr("disabled", true);
        container.find('[id^="_094_mf20u_"], [id^="_095_mf20u_"]').attr("disabled", true);
        
        typeMF20.change(function() {
            if ($(this).val() == "c") {
                divMF20C.show();
                divMF20N.hide();
                divMF20U.hide();
                container.find('[id^="_090_mf20c_"], [id^="_091_mf20c_"]').attr("disabled", false);
                container.find('[id^="_092_mf20n_"], [id^="_093_mf20n_"]').attr("disabled", true).val("");
                container.find('[id^="_094_mf20u_"], [id^="_095_mf20u_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "n") {
                divMF20C.hide();
                divMF20N.show();
                divMF20U.hide();
                container.find('[id^="_090_mf20c_"], [id^="_091_mf20c_"]').attr("disabled", true).val("");
                container.find('[id^="_092_mf20n_"], [id^="_093_mf20n_"]').attr("disabled", false);
                container.find('[id^="_094_mf20u_"], [id^="_095_mf20u_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "u") {
                divMF20C.hide();
                divMF20N.hide();
                divMF20U.show();
                container.find('[id^="_090_mf20c_"], [id^="_091_mf20c_"]').attr("disabled", true).val("");
                container.find('[id^="_092_mf20n_"], [id^="_093_mf20n_"]').attr("disabled", true).val("");
                container.find('[id^="_094_mf20u_"], [id^="_095_mf20u_"]').attr("disabled", false);
            } else {
                divMF20C.hide();
                divMF20N.hide();
                divMF20U.hide();
                container.find('[id^="_090_mf20c_"], [id^="_091_mf20c_"]').attr("disabled", true).val("");
                container.find('[id^="_092_mf20n_"], [id^="_093_mf20n_"]').attr("disabled", true).val("");
                container.find('[id^="_094_mf20u_"], [id^="_095_mf20u_"]').attr("disabled", true).val("");
            }
        });
        
        // OF36A Quantity (Optional)
        let typeOF36 = container.find('[id$="type_of36_' + countSuffix + '"]');
        let divOF36B = container.find('[id$="div_of36b_' + countSuffix + '"]');
        let divOF36D = container.find('[id$="div_of36d_' + countSuffix + '"]');
        
        divOF36B.hide();
        divOF36D.hide();
        
        container.find('[id^="_100_of36b_"], [id^="_101_of36b_"], [id^="_102_of36b_"]').attr("disabled", true);
        container.find('[id^="_103_of36d_"], [id^="_104_of36d_"], [id^="_105_of36d_"]').attr("disabled", true);
        
        typeOF36.change(function() {
            if ($(this).val() == "b") {
                divOF36B.show();
                divOF36D.hide();
                container.find('[id^="_100_of36b_"], [id^="_101_of36b_"], [id^="_102_of36b_"]').attr("disabled", false);
                container.find('[id^="_103_of36d_"], [id^="_104_of36d_"], [id^="_105_of36d_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "d") {
                divOF36B.hide();
                divOF36D.show();
                container.find('[id^="_100_of36b_"], [id^="_101_of36b_"], [id^="_102_of36b_"]').attr("disabled", true).val("");
                container.find('[id^="_103_of36d_"], [id^="_104_of36d_"], [id^="_105_of36d_"]').attr("disabled", false);
            } else {
                divOF36B.hide();
                divOF36D.hide();
                container.find('[id^="_100_of36b_"], [id^="_101_of36b_"], [id^="_102_of36b_"]').attr("disabled", true).val("");
                container.find('[id^="_103_of36d_"], [id^="_104_of36d_"], [id^="_105_of36d_"]').attr("disabled", true).val("");
            }
        });
    }
</script>

<!-- Add Container (OF99A) -->
<script type="text/javascript">
    function addContainer(button) {
        let dataId = $(button).data("id");
        let currentCount = parseInt($(button).data("count"));
        let maxOcc = parseInt($("#max_occ_" + dataId).text());
        
        if (currentCount >= maxOcc) {
            alert("Maximum occurrence reached: " + maxOcc);
            return;
        }
        
        currentCount++;
        $(button).data("count", currentCount);
        $("#cur_occ_" + dataId).text(currentCount);
        
        let template = $("#template_" + dataId).clone();
        template.attr("id", "container_item_" + dataId + "_" + currentCount);
        template.removeAttr("style");
        
        template.find("[id]").each(function() {
            let oldId = $(this).attr("id");
            let newId = oldId.replace(/_a$/, "_a_" + currentCount);
            $(this).attr("id", newId);
        });
        
        template.find("[name]").each(function() {
            let oldName = $(this).attr("name");
            let newName = oldName.replace(/_a$/, "_a_" + currentCount);
            $(this).attr("name", newName);
        });
        
        template.find('[id$="label_count_' + dataId + '"]').text("Count: " + currentCount);
        
        template.find(".remove-btn").attr("disabled", false).click(function() {
            template.remove();
            currentCount--;
            $(button).data("count", currentCount);
            $("#cur_occ_" + dataId).text(currentCount);
        });
        
        template.find('[id$="type_of99_a_' + currentCount + '"]').attr("disabled", false);
        
        template.insertBefore("#container_" + dataId);
        
        if (dataId === "of99a_a") {
            toggleOF99AOptions(template, "a_" + currentCount);
        }
    }
</script>

<!-- Add Template Container (A1 Subsequence) -->
<script type="text/javascript">
    function addTemplateContainer(button) {
        let dataId = $(button).data("id");
        let currentCount = parseInt($(button).data("count"));
        let maxOcc = $("#max_occ_" + dataId).text();
        
        if (maxOcc !== "unbounded") {
            let maxOccNum = parseInt(maxOcc);
            if (currentCount >= maxOccNum) {
                alert("Maximum occurrence reached: " + maxOccNum);
                return;
            }
        }
        
        currentCount++;
        $(button).data("count", currentCount);
        $("#cur_occ_" + dataId).text(currentCount);
        
        let template = $("#template_" + dataId).clone();
        template.attr("id", "container_item_" + dataId + "_" + currentCount);
        template.removeAttr("style");
        
        template.find("[id]").each(function() {
            let oldId = $(this).attr("id");
            let newId = oldId.replace(/_a1$/, "_a1_" + currentCount);
            $(this).attr("id", newId);
        });
        
        template.find("[name]").each(function() {
            let oldName = $(this).attr("name");
            let newName = oldName.replace(/_a1$/, "_a1_" + currentCount);
            $(this).attr("name", newName);
        });
        
        template.find('[id$="label_count_' + dataId + '"]').text("Count: " + currentCount);
        
        template.find(".remove-btn").attr("disabled", false).click(function() {
            template.remove();
            currentCount--;
            $(button).data("count", currentCount);
            $("#cur_occ_" + dataId).text(currentCount);
        });
        
        // Enable checkbox dan type selectors
        template.find('[id$="check_of22f_a1_' + currentCount + '"]').attr("disabled", false);
        template.find('[id$="type_of13_a1_' + currentCount + '"]').attr("disabled", false);
        template.find('[id$="type_mf20_a1_' + currentCount + '"]').attr("disabled", false);
        template.find('[id$="type_of36_a1_' + currentCount + '"]').attr("disabled", false);
        
        template.insertBefore("#container_" + dataId);
        
        if (dataId === "a1") {
            toggleA1Fields(template, "a1_" + currentCount);
        }
    }
</script>

<!-- View mode untuk data existing -->
<script type="text/javascript">
    $(document).ready(function() {
        
        //========================================
        // View Mode untuk A1 subsequence
        //========================================
        // Check jika ada data OF22F yang sudah terisi
        $("[id^='check_of22f_a1']").each(function() {
            let checkboxId = $(this).attr("id");
            let container = $(this).closest('.template_container');
            
            // Check if indicator field has value
            let indicatorField = container.find("[id$='_073_of22f_indicator_a1']");
            if (indicatorField.val() && indicatorField.val().trim() !== "") {
                $(this).prop("checked", true).trigger("click");
            }
        });
        
        // Check jika ada data OF13A yang sudah terisi
        $("[id^='type_of13_a1']").each(function() {
            let typeValue = $(this).val();
            if (typeValue) {
                $(this).trigger("change");
            }
        });
        
        // Check jika ada data MF20A yang sudah terisi
        $("[id^='type_mf20_a1']").each(function() {
            let typeValue = $(this).val();
            if (typeValue) {
                $(this).trigger("change");
            }
        });
        
        // Check jika ada data OF36A yang sudah terisi
        $("[id^='type_of36_a1']").each(function() {
            let typeValue = $(this).val();
            if (typeValue) {
                $(this).trigger("change");
            }
        });
        
    });
</script>

<!--SEQUENCE B-->
<script type="text/javascript">
    $(document).ready(function(){
        
        //========================================
        // FORCE ENABLE ALL TYPE SELECTORS FIRST
        //========================================
        $("#type_of94_b").removeAttr("disabled").prop("disabled", false);
        $("#type_mf98_b").removeAttr("disabled").prop("disabled", false);
        $("#type_of90_b").removeAttr("disabled").prop("disabled", false);
        $("#type_of12_b1").removeAttr("disabled").prop("disabled", false);
        $("#type_of13_b1").removeAttr("disabled").prop("disabled", false);
        $("#type_of90_b1").removeAttr("disabled").prop("disabled", false);
        $("#type_of36_b1").removeAttr("disabled").prop("disabled", false);
        
        //========================================
        // POINT 1: FIELD 14: OF94A PLACE - INITIALIZATION (FIXED)
        //========================================
        // Hide all option divs initially
        $("#div_of94b_b").hide();
        $("#div_of94h_b").hide();
        $("#div_of94l_b").hide();
        
        // Disable all fields initially
        $("#_140_of94b_qualifier_b, #_141_of94b_data_source_scheme_b, #_142_of94b_slash_b, #_143_of94b_place_code_b, #_144_of94b_slash2_b, #_145_of94b_narrative_b").attr("disabled", true);
        $("#_146_of94b_qualifier_b, #_147_of94h_qualifier_b, #_148_of94h_identifier_code_b").attr("disabled", true);
        $("#_149_of94l_qualifier_b, #_14010_of94l_legal_entity_identifier_b").attr("disabled", true);
        
        $("#type_of94_b").on("change", function() {
            // Hide all divs first
            $("#div_of94b_b").hide();
            $("#div_of94h_b").hide();
            $("#div_of94l_b").hide();
            
            // Disable all fields
            $("#_140_of94b_qualifier_b, #_141_of94b_data_source_scheme_b, #_142_of94b_slash_b, #_143_of94b_place_code_b, #_144_of94b_slash2_b, #_145_of94b_narrative_b").attr("disabled", true);
            $("#_146_of94b_qualifier_b, #_147_of94h_qualifier_b, #_148_of94h_identifier_code_b").attr("disabled", true);
            $("#_149_of94l_qualifier_b, #_14010_of94l_legal_entity_identifier_b").attr("disabled", true);
            
            var selectedType = $(this).val();
            
            if (selectedType == "b") {
                $("#div_of94b_b").show();
                $("#_140_of94b_qualifier_b, #_142_of94b_slash_b, #_143_of94b_place_code_b").removeAttr("disabled");
            } else if (selectedType == "h") {
                $("#div_of94h_b").show();
                $("#_146_of94b_qualifier_b, #_147_of94h_qualifier_b, #_148_of94h_identifier_code_b").removeAttr("disabled");
            } else if (selectedType == "l") {
                $("#div_of94l_b").show();
                $("#_149_of94l_qualifier_b, #_14010_of94l_legal_entity_identifier_b").removeAttr("disabled");
            }
        });
        
        // OF94B Data Source Scheme checkbox
        $("#div_opt_of94b_data_source_scheme_b").hide();
        $("#_141_of94b_data_source_scheme_b").attr("disabled", true);
        $("#check_of94b_data_source_scheme_b").on("click", function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of94b_data_source_scheme_b").show();
                $("#_141_of94b_data_source_scheme_b").removeAttr("disabled");
            } else {
                $("#div_opt_of94b_data_source_scheme_b").hide();
                $("#_141_of94b_data_source_scheme_b").attr("disabled", true).val("");
            }
        });
        
        // OF94B Narrative checkbox
        $("#div_opt_of94b_narrative_b").hide();
        $("#_144_of94b_slash2_b, #_145_of94b_narrative_b").attr("disabled", true);
        $("#check_of94b_narrative_b").on("click", function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of94b_narrative_b").show();
                $("#_144_of94b_slash2_b, #_145_of94b_narrative_b").removeAttr("disabled");
            } else {
                $("#div_opt_of94b_narrative_b").hide();
                $("#_144_of94b_slash2_b, #_145_of94b_narrative_b").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // POINT 2: FIELD 15: MF98A DATE/TIME - INITIALIZATION (FIXED)
        //========================================
        // Hide all option divs initially
        $("#div_mf98a_b").hide();
        $("#div_mf98b_b").hide();
        $("#div_mf98c_b").hide();
        $("#div_mf98e_b").hide();
        
        // Disable all fields initially
        $("#_150_mf98a_qualifier_b, #_1501_mf98a_date_b").attr("disabled", true);
        $("#_1502_mf98b_qualifier_b, #_1503_mf98b_data_source_scheme_b, #_1504_mf98b_slash_b, #_1505_mf98b_date_code_b").attr("disabled", true);
        $("#_1506_mf98c_qualifier_b, #_1507_mf98c_date_b, #_1508_mf98c_time_b").attr("disabled", true);
        $("#_1509_mf98e_qualifier_b, #_15010_mf98e_date_b, #_15011_mf98e_time_b, #_15012_mf98e_comma_b, #_15013_mf98e_decimals_b, #_15014_mf98e_slash_b, #_15015_mf98e_utc_indicator_b").attr("disabled", true);
        
        // Enable type selector - THIS IS THE KEY FIX
        $("#type_mf98_b").removeAttr("disabled");
        
        $("#type_mf98_b").on("change", function() {
            // Hide all divs first
            $("#div_mf98a_b").hide();
            $("#div_mf98b_b").hide();
            $("#div_mf98c_b").hide();
            $("#div_mf98e_b").hide();
            
            // Disable all fields
            $("#_150_mf98a_qualifier_b, #_1501_mf98a_date_b").attr("disabled", true);
            $("#_1502_mf98b_qualifier_b, #_1503_mf98b_data_source_scheme_b, #_1504_mf98b_slash_b, #_1505_mf98b_date_code_b").attr("disabled", true);
            $("#_1506_mf98c_qualifier_b, #_1507_mf98c_date_b, #_1508_mf98c_time_b").attr("disabled", true);
            $("#_1509_mf98e_qualifier_b, #_15010_mf98e_date_b, #_15011_mf98e_time_b, #_15012_mf98e_comma_b, #_15013_mf98e_decimals_b, #_15014_mf98e_slash_b, #_15015_mf98e_utc_indicator_b").attr("disabled", true);
            
            var selectedType = $(this).val();
            
            if (selectedType == "a") {
                $("#div_mf98a_b").show();
                $("#_150_mf98a_qualifier_b, #_1501_mf98a_date_b").removeAttr("disabled");
            } else if (selectedType == "b") {
                $("#div_mf98b_b").show();
                $("#_1502_mf98b_qualifier_b, #_1504_mf98b_slash_b, #_1505_mf98b_date_code_b").removeAttr("disabled");
            } else if (selectedType == "c") {
                $("#div_mf98c_b").show();
                $("#_1506_mf98c_qualifier_b, #_1507_mf98c_date_b, #_1508_mf98c_time_b").removeAttr("disabled");
            } else if (selectedType == "e") {
                $("#div_mf98e_b").show();
                $("#_1509_mf98e_qualifier_b, #_15010_mf98e_date_b, #_15011_mf98e_time_b").removeAttr("disabled");
            }
        });
        
        // MF98B Data Source Scheme checkbox
        $("#div_opt_mf98b_data_source_scheme_b").hide();
        $("#_1503_mf98b_data_source_scheme_b").attr("disabled", true);
        $("#check_mf98b_data_source_scheme_b").on("click", function(){
            if ($(this).is(":checked")) {
                $("#div_opt_mf98b_data_source_scheme_b").show();
                $("#_1503_mf98b_data_source_scheme_b").removeAttr("disabled");
            } else {
                $("#div_opt_mf98b_data_source_scheme_b").hide();
                $("#_1503_mf98b_data_source_scheme_b").attr("disabled", true).val("");
            }
        });
        
        // MF98E Decimals checkbox
        $("#div_opt_mf98e_decimals_b").hide();
        $("#_15012_mf98e_comma_b, #_15013_mf98e_decimals_b").attr("disabled", true);
        $("#check_mf98e_decimals_b").on("click", function(){
            if ($(this).is(":checked")) {
                $("#div_opt_mf98e_decimals_b").show();
                $("#_15012_mf98e_comma_b, #_15013_mf98e_decimals_b").removeAttr("disabled");
            } else {
                $("#div_opt_mf98e_decimals_b").hide();
                $("#_15012_mf98e_comma_b, #_15013_mf98e_decimals_b").attr("disabled", true).val("");
            }
        });
        
        // MF98E UTC Indicator checkbox
        $("#div_opt_mf98e_utc_indicator_b").hide();
        $("#_15014_mf98e_slash_b, #_15015_mf98e_utc_indicator_b").attr("disabled", true);
        $("#check_mf98e_utc_indicator_b").on("click", function(){
            if ($(this).is(":checked")) {
                $("#div_opt_mf98e_utc_indicator_b").show();
                $("#_15014_mf98e_slash_b, #_15015_mf98e_utc_indicator_b").removeAttr("disabled");
            } else {
                $("#div_opt_mf98e_utc_indicator_b").hide();
                $("#_15014_mf98e_slash_b, #_15015_mf98e_utc_indicator_b").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // POINT 3 & 7: FIELD 16: OF90A DEAL PRICE (FIXED)
        //========================================
        // Hide all option divs initially
        $("#div_of90a_b").hide();
        $("#div_of90b_b").hide();
        
        // Disable all fields initially EXCEPT type selector
        $("#_160_of90a_qualifier_b, #_1601_of90a_percentage_type_code_b, #_1602_of90a_sign_b, #_1603_of90a_price_b").attr("disabled", true);
        $("#_1604_of90b_qualifier_b, #_1605_of90b_amount_type_code_b, #_1606_of90b_currency_b, #_1607_of90b_price_b").attr("disabled", true);
        
        // Enable type selector - THIS IS THE KEY FIX
        $("#type_of90_b").removeAttr("disabled");
        
        $("#type_of90_b").on("change", function() {
            // Hide all divs first
            $("#div_of90a_b").hide();
            $("#div_of90b_b").hide();
            
            // Disable all fields
            $("#_160_of90a_qualifier_b, #_1601_of90a_percentage_type_code_b, #_1602_of90a_sign_b, #_1603_of90a_price_b").attr("disabled", true);
            $("#_1604_of90b_qualifier_b, #_1605_of90b_amount_type_code_b, #_1606_of90b_currency_b, #_1607_of90b_price_b").attr("disabled", true);
            
            var selectedType = $(this).val();
            
            if (selectedType == "a") {
                $("#div_of90a_b").show();
                // Qualifier remains disabled as per requirement
                $("#_1601_of90a_percentage_type_code_b, #_1603_of90a_price_b").removeAttr("disabled");
                // Sign remains disabled until checkbox is checked
            } else if (selectedType == "b") {
                $("#div_of90b_b").show();
                // Qualifier remains disabled as per requirement
                $("#_1605_of90b_amount_type_code_b, #_1606_of90b_currency_b, #_1607_of90b_price_b").removeAttr("disabled");
            }
        });
        
        // POINT 3: OF90A Sign checkbox - FIXED
        $("#div_opt_of90a_sign_b").hide();
        $("#_1602_of90a_sign_b").attr("disabled", true);
        $("#check_of90a_sign_b").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of90a_sign_b").show();
                $("#_1602_of90a_sign_b").removeAttr("disabled");
            } else {
                $("#div_opt_of90a_sign_b").hide();
                $("#_1602_of90a_sign_b").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // POINT 4: FIELD 17: OF99A NUMBER OF DAYS ACCRUED (FIXED)
        //========================================
        $("#div_opt_of99a_b").hide();
        $("#_170_of99a_qualifier_b, #_1701_of99a_sign_b, #_1702_of99a_number_b").attr("disabled", true);
        $("#check_of99a_b").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of99a_b").show();
                $("#_170_of99a_qualifier_b, #_1701_of99a_sign_b, #_1702_of99a_number_b").removeAttr("disabled");
            } else {
                $("#div_opt_of99a_b").hide();
                $("#_170_of99a_qualifier_b, #_1701_of99a_sign_b, #_1702_of99a_number_b").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // POINT 9: FIELD 18: MF35B DESCRIPTION OF SECURITY (FIXED)
        //========================================
        $("#div_opt_mf35b_description_of_security_b").hide();
        $("#_1802_mf35b_description_of_security_b").attr("disabled", true);
        
        $("#check_mf35b_description_of_security_b").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_mf35b_description_of_security_b").show();
                $("#_1802_mf35b_description_of_security_b").removeAttr("disabled");
            } else {
                $("#div_opt_mf35b_description_of_security_b").hide();
                $("#_1802_mf35b_description_of_security_b").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // SUBSEQUENCE B1 FIELDS
        //========================================
        
        // POINT 5: Field 20: OF94B Place of Listing (FIXED)
        $("#div_opt_of94b_b1").hide();
        $("#_200_of94b_qualifier_b1, #_2001_of94b_data_source_scheme_b1, #_2002_of94b_slash_b1, #_2003_of94b_place_code_b1, #_2004_of94b_slash2_b1, #_2005_of94b_narrative_b1").attr("disabled", true);
        
        $("#check_of94b_b1").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of94b_b1").show();
                $("#_200_of94b_qualifier_b1, #_2002_of94b_slash_b1, #_2003_of94b_place_code_b1, #_2004_of94b_slash2_b1, #_2005_of94b_narrative_b1").removeAttr("disabled");
            } else {
                $("#div_opt_of94b_b1").hide();
                $("#_200_of94b_qualifier_b1, #_2001_of94b_data_source_scheme_b1, #_2002_of94b_slash_b1, #_2003_of94b_place_code_b1, #_2004_of94b_slash2_b1, #_2005_of94b_narrative_b1").attr("disabled", true).val("");
            }
        });
        
        // POINT 5: OF94B Data Source Scheme (B1) - FIXED
        $("#div_opt_of94b_data_source_scheme_b1").hide();
        $("#_2001_of94b_data_source_scheme_b1").attr("disabled", true);
        $("#check_of94b_data_source_scheme_b1").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of94b_data_source_scheme_b1").show();
                $("#_2001_of94b_data_source_scheme_b1").removeAttr("disabled");
            } else {
                $("#div_opt_of94b_data_source_scheme_b1").hide();
                $("#_2001_of94b_data_source_scheme_b1").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // POINT 6 & 4: FIELD 22: OF12A TYPE OF FINANCIAL INSTRUMENT (B1) (FIXED)
        //========================================
        $("#div_of12a_b1, #div_of12b_b1, #div_of12c_b1").hide();
        $("#_2201_of12a_data_source_scheme_b1, #_2203_of12a_instrument_code_b1").attr("disabled", true);
        $("#_2204_of12b_qualifier_b1, #_2205_of12b_data_source_scheme_b1, #_2207_of12b_instrument_type_code_b1").attr("disabled", true);
        $("#_2209_of12c_cfi_code_b1").attr("disabled", true);
        
        // Enable type selector - THIS IS THE KEY FIX
        $("#type_of12_b1").removeAttr("disabled");
        
        $("#type_of12_b1").change(function() {
            $("#div_of12a_b1, #div_of12b_b1, #div_of12c_b1").hide();
            $("#_2201_of12a_data_source_scheme_b1, #_2203_of12a_instrument_code_b1").attr("disabled", true);
            $("#_2204_of12b_qualifier_b1, #_2205_of12b_data_source_scheme_b1, #_2207_of12b_instrument_type_code_b1").attr("disabled", true);
            $("#_2209_of12c_cfi_code_b1").attr("disabled", true);
            
            if ($(this).val() == "a") {
                $("#div_of12a_b1").show();
                $("#_2203_of12a_instrument_code_b1").removeAttr("disabled");
            } else if ($(this).val() == "b") {
                $("#div_of12b_b1").show();
                $("#_2204_of12b_qualifier_b1, #_2207_of12b_instrument_type_code_b1").removeAttr("disabled");
            } else if ($(this).val() == "c") {
                $("#div_of12c_b1").show();
                $("#_2209_of12c_cfi_code_b1").removeAttr("disabled");
            }
        });
        
        // POINT 6: OF12A Data Source Scheme (B1) - FIXED
        $("#div_opt_of12a_data_source_scheme_b1").hide();
        $("#_2201_of12a_data_source_scheme_b1").attr("disabled", true);
        $("#check_of12a_data_source_scheme_b1").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of12a_data_source_scheme_b1").show();
                $("#_2201_of12a_data_source_scheme_b1").removeAttr("disabled");
            } else {
                $("#div_opt_of12a_data_source_scheme_b1").hide();
                $("#_2201_of12a_data_source_scheme_b1").attr("disabled", true).val("");
            }
        });
        
        // OF12B Data Source Scheme (B1)
        $("#div_opt_of12b_data_source_scheme_b1").hide();
        $("#_2205_of12b_data_source_scheme_b1").attr("disabled", true);
        $("#check_of12b_data_source_scheme_b1").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of12b_data_source_scheme_b1").show();
                $("#_2205_of12b_data_source_scheme_b1").removeAttr("disabled");
            } else {
                $("#div_opt_of12b_data_source_scheme_b1").hide();
                $("#_2205_of12b_data_source_scheme_b1").attr("disabled", true).val("");
            }
        });
        
        // Field 23: OF11A Currency of Denomination (B1)
        // Already enabled by default in JSP
        
        //========================================
        // POINT 8: FIELD 25: OF92A RATE - SIGN CHECKBOX (B1) (FIXED)
        //========================================
        $("#div_opt_of92a_sign_b1").hide();
        $("#_2501_of92a_sign_b1").attr("disabled", true);
        
        $("#check_of92a_sign_b1").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of92a_sign_b1").show();
                $("#_2501_of92a_sign_b1").removeAttr("disabled");
            } else {
                $("#div_opt_of92a_sign_b1").hide();
                $("#_2501_of92a_sign_b1").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // POINT 9: FIELD 26: OF13A NUMBER IDENTIFICATION (B1) (FIXED)
        //========================================
        $("#div_of13a_b1, #div_of13b_b1").hide();
        $("#_2601_of13a_number_id_b1").attr("disabled", true);
        $("#_2602_of13b_qualifier_b1, #_2603_of13b_data_source_scheme_b1, #_2605_of13b_number_b1").attr("disabled", true);
        
        // Enable type selector - THIS IS THE KEY FIX
        $("#type_of13_b1").removeAttr("disabled");
        
        $("#type_of13_b1").change(function() {
            $("#div_of13a_b1, #div_of13b_b1").hide();
            $("#_2601_of13a_number_id_b1").attr("disabled", true);
            $("#_2602_of13b_qualifier_b1, #_2603_of13b_data_source_scheme_b1, #_2605_of13b_number_b1").attr("disabled", true);
            
            if ($(this).val() == "a") {
                $("#div_of13a_b1").show();
                $("#_2601_of13a_number_id_b1").removeAttr("disabled");
            } else if ($(this).val() == "b") {
                $("#div_of13b_b1").show();
                $("#_2602_of13b_qualifier_b1, #_2605_of13b_number_b1").removeAttr("disabled");
            }
        });
        
        // OF13B Data Source Scheme (B1)
        $("#div_opt_of13b_data_source_scheme_b1").hide();
        $("#_2603_of13b_data_source_scheme_b1").attr("disabled", true);
        $("#check_of13b_data_source_scheme_b1").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of13b_data_source_scheme_b1").show();
                $("#_2603_of13b_data_source_scheme_b1").removeAttr("disabled");
            } else {
                $("#div_opt_of13b_data_source_scheme_b1").hide();
                $("#_2603_of13b_data_source_scheme_b1").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // POINT 10: FIELD 28: OF90A PRICE (B1) (FIXED)
        //========================================
        $("#div_of90a_b1, #div_of90b_b1").hide();
        $("#_280_of90a_qualifier_b1, #_2801_of90a_percentage_type_code_b1, #_2802_of90a_sign_b1, #_2803_of90a_price_b1").attr("disabled", true);
        $("#_2804_of90b_qualifier_b1, #_2805_of90b_amount_type_code_b1, #_2806_of90b_currency_b1, #_2807_of90b_price_b1").attr("disabled", true);
        
        // Enable type selector - THIS IS THE KEY FIX
        $("#type_of90_b1").removeAttr("disabled");
        
        $("#type_of90_b1").change(function() {
            $("#div_of90a_b1, #div_of90b_b1").hide();
            $("#_280_of90a_qualifier_b1, #_2801_of90a_percentage_type_code_b1, #_2802_of90a_sign_b1, #_2803_of90a_price_b1").attr("disabled", true);
            $("#_2804_of90b_qualifier_b1, #_2805_of90b_amount_type_code_b1, #_2806_of90b_currency_b1, #_2807_of90b_price_b1").attr("disabled", true);
            
            if ($(this).val() == "a") {
                $("#div_of90a_b1").show();
                $("#_280_of90a_qualifier_b1, #_2801_of90a_percentage_type_code_b1, #_2803_of90a_price_b1").removeAttr("disabled");
                // Sign remains disabled until checkbox is checked
            } else if ($(this).val() == "b") {
                $("#div_of90b_b1").show();
                $("#_2804_of90b_qualifier_b1, #_2805_of90b_amount_type_code_b1, #_2806_of90b_currency_b1, #_2807_of90b_price_b1").removeAttr("disabled");
            }
        });
        
        // OF90A Sign checkbox (B1)
        $("#div_opt_of90a_sign_b1").hide();
        $("#_2802_of90a_sign_b1").attr("disabled", true);
        $("#check_of90a_sign_b1").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of90a_sign_b1").show();
                $("#_2802_of90a_sign_b1").removeAttr("disabled");
            } else {
                $("#div_opt_of90a_sign_b1").hide();
                $("#_2802_of90a_sign_b1").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // POINT 11: FIELD 29: OF36A QUANTITY (B1) (FIXED)
        //========================================
        $("#div_of36b_b1, #div_of36d_b1").hide();
        $("#_290_of36b_qualifier_b1, #_2901_of36b_quantity_type_code_b1, #_2902_of36b_quantity_b1").attr("disabled", true);
        $("#_2903_of36d_qualifier_b1, #_2905_of36d_quantity_b1").attr("disabled", true);
        
        // Enable type selector - THIS IS THE KEY FIX
        $("#type_of36_b1").removeAttr("disabled");
        
        $("#type_of36_b1").change(function() {
            $("#div_of36b_b1, #div_of36d_b1").hide();
            $("#_290_of36b_qualifier_b1, #_2901_of36b_quantity_type_code_b1, #_2902_of36b_quantity_b1").attr("disabled", true);
            $("#_2903_of36d_qualifier_b1, #_2905_of36d_quantity_b1").attr("disabled", true);
            
            if ($(this).val() == "b") {
                $("#div_of36b_b1").show();
                $("#_290_of36b_qualifier_b1, #_2901_of36b_quantity_type_code_b1, #_2902_of36b_quantity_b1").removeAttr("disabled");
            } else if ($(this).val() == "d") {
                $("#div_of36d_b1").show();
                $("#_2903_of36d_qualifier_b1, #_2905_of36d_quantity_b1").removeAttr("disabled");
            }
        });
        
        //========================================
        // POINT 12: FIELD 30: OF35B DESCRIPTION OF SECURITY (B1) (FIXED)
        //========================================
        $("#div_opt_of35b_description_of_security_b1").hide();
        $("#_3002_of35b_description_of_security_b1").attr("disabled", true);
        
        $("#check_of35b_description_of_security_b1").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of35b_description_of_security_b1").show();
                $("#_3002_of35b_description_of_security_b1").removeAttr("disabled");
            } else {
                $("#div_opt_of35b_description_of_security_b1").hide();
                $("#_3002_of35b_description_of_security_b1").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // POINT 13: FIELD 31: OF70E FINANCIAL INSTRUMENT ATTRIBUTE NARRATIVE (FIXED)
        //========================================
        // Enable the narrative field
        $("#_3101_of70e_narrative_b1").removeAttr("disabled");
        
        //========================================
        // POINT 14: FIELD 33: OF22F INDICATOR - DATA SOURCE SCHEME (MAIN B) (FIXED)
        //========================================
        $("#div_opt_of22f_data_source_scheme_b").hide();
        $("#_3301_of22f_data_source_scheme_b").attr("disabled", true);
        
        $("#check_of22f_data_source_scheme_b").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of22f_data_source_scheme_b").show();
                $("#_3301_of22f_data_source_scheme_b").removeAttr("disabled");
            } else {
                $("#div_opt_of22f_data_source_scheme_b").hide();
                $("#_3301_of22f_data_source_scheme_b").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // POINT 15: FIELD 34: OF11A CURRENCY TO BUY (FIXED)
        //========================================
        // Enable the currency code field
        $("#_3401_of11a_currency_code_b").removeAttr("disabled");
        
        //========================================
        // POINT 14: FIELD 35: OF25D STATUS CODE - DATA SOURCE SCHEME (FIXED)
        //========================================
        $("#div_opt_of25d_data_source_scheme_b").hide();
        $("#_3501_of25d_data_source_scheme_b").attr("disabled", true);
        
        $("#check_of25d_data_source_scheme_b").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of25d_data_source_scheme_b").show();
                $("#_3501_of25d_data_source_scheme_b").removeAttr("disabled");
            } else {
                $("#div_opt_of25d_data_source_scheme_b").hide();
                $("#_3501_of25d_data_source_scheme_b").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // POINT 6: FIELD 21: OF22F INDICATOR - DATA SOURCE SCHEME (B1) (FIXED)
        //========================================
        $("#div_opt_of22f_data_source_scheme_b1").hide();
        $("#_2101_of22f_data_source_scheme_b1").attr("disabled", true);
        
        $("#check_of22f_data_source_scheme_b1").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_of22f_data_source_scheme_b1").show();
                $("#_2101_of22f_data_source_scheme_b1").removeAttr("disabled");
            } else {
                $("#div_opt_of22f_data_source_scheme_b1").hide();
                $("#_2101_of22f_data_source_scheme_b1").attr("disabled", true).val("");
            }
        });
        
    });
</script>

<!-- VIEW MODE INITIALIZATION -->
<script language="javascript">
    $(document).ready(function() {
        
        //========================================
        // VIEW MODE FOR FIELD 14: OF94A PLACE
        //========================================
        if ($("#_141_of94b_data_source_scheme_b").val() != "" || 
            $("#_143_of94b_place_code_b").val() != "" || 
            $("#_145_of94b_narrative_b").val() != "") {
            $("#type_of94_b").val("b").attr("selected", true).removeAttr("disabled");
            $("#div_of94b_b").show();
            $("#_140_of94b_qualifier_b, #_143_of94b_place_code_b").removeAttr("disabled");
            
            if ($("#_141_of94b_data_source_scheme_b").val() != "") {
                $("#check_of94b_data_source_scheme_b").attr("checked", true);
                $("#div_opt_of94b_data_source_scheme_b").show();
                $("#_141_of94b_data_source_scheme_b").removeAttr("disabled");
            }
            
            if ($("#_145_of94b_narrative_b").val() != "") {
                $("#check_of94b_narrative_b").attr("checked", true);
                $("#div_opt_of94b_narrative_b").show();
                $("#_144_of94b_slash2_b, #_145_of94b_narrative_b").removeAttr("disabled");
            }
        } else if ($("#_148_of94h_identifier_code_b").val() != "") {
            $("#type_of94_b").val("h").attr("selected", true).removeAttr("disabled");
            $("#div_of94h_b").show();
            $("#_146_of94b_qualifier_b, #_148_of94h_identifier_code_b").removeAttr("disabled");
        } else if ($("#_14010_of94l_legal_entity_identifier_b").val() != "") {
            $("#type_of94_b").val("l").attr("selected", true).removeAttr("disabled");
            $("#div_of94l_b").show();
            $("#_149_of94l_qualifier_b, #_14010_of94l_legal_entity_identifier_b").removeAttr("disabled");
        }
        
        //========================================
        // VIEW MODE FOR FIELD 15: MF98A DATE/TIME
        //========================================
        if ($("#_1501_mf98a_date_b").val() != "") {
            $("#type_mf98_b").val("a").attr("selected", true).removeAttr("disabled");
            $("#div_mf98a_b").show();
            $("#_150_mf98a_qualifier_b, #_1501_mf98a_date_b").removeAttr("disabled");
        } else if ($("#_1505_mf98b_date_code_b").val() != "") {
            $("#type_mf98_b").val("b").attr("selected", true).removeAttr("disabled");
            $("#div_mf98b_b").show();
            $("#_1502_mf98b_qualifier_b, #_1505_mf98b_date_code_b").removeAttr("disabled");
            
            if ($("#_1503_mf98b_data_source_scheme_b").val() != "") {
                $("#check_mf98b_data_source_scheme_b").attr("checked", true);
                $("#div_opt_mf98b_data_source_scheme_b").show();
                $("#_1503_mf98b_data_source_scheme_b").removeAttr("disabled");
            }
        } else if ($("#_1507_mf98c_date_b").val() != "" || $("#_1508_mf98c_time_b").val() != "") {
            $("#type_mf98_b").val("c").attr("selected", true).removeAttr("disabled");
            $("#div_mf98c_b").show();
            $("#_1506_mf98c_qualifier_b, #_1507_mf98c_date_b, #_1508_mf98c_time_b").removeAttr("disabled");
        } else if ($("#_15010_mf98e_date_b").val() != "" || $("#_15011_mf98e_time_b").val() != "") {
            $("#type_mf98_b").val("e").attr("selected", true).removeAttr("disabled");
            $("#div_mf98e_b").show();
            $("#_15010_mf98e_date_b, #_15011_mf98e_time_b").removeAttr("disabled");
            
            if ($("#_15013_mf98e_decimals_b").val() != "") {
                $("#check_mf98e_decimals_b").attr("checked", true);
                $("#div_opt_mf98e_decimals_b").show();
                $("#_15012_mf98e_comma_b, #_15013_mf98e_decimals_b").removeAttr("disabled");
            }
            
            if ($("#_15015_mf98e_utc_indicator_b").val() != "") {
                $("#check_mf98e_utc_indicator_b").attr("checked", true);
                $("#div_opt_mf98e_utc_indicator_b").show();
                $("#_15014_mf98e_slash_b, #_15015_mf98e_utc_indicator_b").removeAttr("disabled");
            }
        }
        
        //========================================
        // VIEW MODE FOR FIELD 16: OF90A DEAL PRICE
        //========================================
        if ($("#_1603_of90a_price_b").val() != "") {
            $("#type_of90_b").val("a").attr("selected", true).removeAttr("disabled");
            $("#div_of90a_b").show();
            $("#_1601_of90a_percentage_type_code_b, #_1603_of90a_price_b").removeAttr("disabled");
            
            if ($("#_1602_of90a_sign_b").val() != "") {
                $("#check_of90a_sign_b").attr("checked", true);
                $("#div_opt_of90a_sign_b").show();
                $("#_1602_of90a_sign_b").removeAttr("disabled");
            }
        } else if ($("#_1607_of90b_price_b").val() != "") {
            $("#type_of90_b").val("b").attr("selected", true).removeAttr("disabled");
            $("#div_of90b_b").show();
            $("#_1605_of90b_amount_type_code_b, #_1606_of90b_currency_b, #_1607_of90b_price_b").removeAttr("disabled");
        }
        
        //========================================
        // VIEW MODE FOR FIELD 17: OF99A
        //========================================
        if ($("#_1702_of99a_number_b").val() != "") {
            $("#check_of99a_b").attr("checked", true);
            $("#div_opt_of99a_b").show();
            $("#_170_of99a_qualifier_b, #_1701_of99a_sign_b, #_1702_of99a_number_b").removeAttr("disabled");
        }
        
        //========================================
        // VIEW MODE FOR FIELD 18: MF35B
        //========================================
        if ($("#_1802_mf35b_description_of_security_b").val() != "") {
            $("#check_mf35b_description_of_security_b").attr("checked", true);
            $("#div_opt_mf35b_description_of_security_b").show();
            $("#_1802_mf35b_description_of_security_b").removeAttr("disabled");
        }
        
        //========================================
        // VIEW MODE FOR SUBSEQUENCE B1
        //========================================
        
        // Field 20: OF94B Place of Listing (B1)
        if ($("#_2003_of94b_place_code_b1").val() != "" || $("#_2005_of94b_narrative_b1").val() != "") {
            $("#check_of94b_b1").attr("checked", true);
            $("#div_opt_of94b_b1").show();
            $("#_200_of94b_qualifier_b1, #_2002_of94b_slash_b1, #_2003_of94b_place_code_b1, #_2004_of94b_slash2_b1, #_2005_of94b_narrative_b1").removeAttr("disabled");
            
            if ($("#_2001_of94b_data_source_scheme_b1").val() != "") {
                $("#check_of94b_data_source_scheme_b1").attr("checked", true);
                $("#div_opt_of94b_data_source_scheme_b1").show();
                $("#_2001_of94b_data_source_scheme_b1").removeAttr("disabled");
            }
        }
        
        // Field 22: OF12A (B1)
        if ($("#_2203_of12a_instrument_code_b1").val() != "") {
            $("#type_of12_b1").val("a").attr("selected", true).removeAttr("disabled");
            $("#div_of12a_b1").show();
            $("#_2203_of12a_instrument_code_b1").removeAttr("disabled");
            
            if ($("#_2201_of12a_data_source_scheme_b1").val() != "") {
                $("#check_of12a_data_source_scheme_b1").attr("checked", true);
                $("#div_opt_of12a_data_source_scheme_b1").show();
                $("#_2201_of12a_data_source_scheme_b1").removeAttr("disabled");
            }
        } else if ($("#_2207_of12b_instrument_type_code_b1").val() != "") {
            $("#type_of12_b1").val("b").attr("selected", true).removeAttr("disabled");
            $("#div_of12b_b1").show();
            $("#_2204_of12b_qualifier_b1, #_2207_of12b_instrument_type_code_b1").removeAttr("disabled");
            
            if ($("#_2205_of12b_data_source_scheme_b1").val() != "") {
                $("#check_of12b_data_source_scheme_b1").attr("checked", true);
                $("#div_opt_of12b_data_source_scheme_b1").show();
                $("#_2205_of12b_data_source_scheme_b1").removeAttr("disabled");
            }
        } else if ($("#_2209_of12c_cfi_code_b1").val() != "") {
            $("#type_of12_b1").val("c").attr("selected", true).removeAttr("disabled");
            $("#div_of12c_b1").show();
            $("#_2209_of12c_cfi_code_b1").removeAttr("disabled");
        }
        
        // Field 26: OF13A (B1)
        if ($("#_2601_of13a_number_id_b1").val() != "") {
            $("#type_of13_b1").val("a").attr("selected", true).removeAttr("disabled");
            $("#div_of13a_b1").show();
            $("#_2601_of13a_number_id_b1").removeAttr("disabled");
        } else if ($("#_2605_of13b_number_b1").val() != "") {
            $("#type_of13_b1").val("b").attr("selected", true).removeAttr("disabled");
            $("#div_of13b_b1").show();
            $("#_2602_of13b_qualifier_b1, #_2605_of13b_number_b1").removeAttr("disabled");
            
            if ($("#_2603_of13b_data_source_scheme_b1").val() != "") {
                $("#check_of13b_data_source_scheme_b1").attr("checked", true);
                $("#div_opt_of13b_data_source_scheme_b1").show();
                $("#_2603_of13b_data_source_scheme_b1").removeAttr("disabled");
            }
        }
        
        // Field 28: OF90A Price (B1)
        if ($("#_2803_of90a_price_b1").val() != "") {
            $("#type_of90_b1").val("a").attr("selected", true).removeAttr("disabled");
            $("#div_of90a_b1").show();
            $("#_280_of90a_qualifier_b1, #_2801_of90a_percentage_type_code_b1, #_2803_of90a_price_b1").removeAttr("disabled");
            
            if ($("#_2802_of90a_sign_b1").val() != "") {
                $("#check_of90a_sign_b1").attr("checked", true);
                $("#div_opt_of90a_sign_b1").show();
                $("#_2802_of90a_sign_b1").removeAttr("disabled");
            }
        } else if ($("#_2807_of90b_price_b1").val() != "") {
            $("#type_of90_b1").val("b").attr("selected", true).removeAttr("disabled");
            $("#div_of90b_b1").show();
            $("#_2804_of90b_qualifier_b1, #_2805_of90b_amount_type_code_b1, #_2806_of90b_currency_b1, #_2807_of90b_price_b1").removeAttr("disabled");
        }
        
        // Field 29: OF36A Quantity (B1)
        if ($("#_2902_of36b_quantity_b1").val() != "") {
            $("#type_of36_b1").val("b").attr("selected", true).removeAttr("disabled");
            $("#div_of36b_b1").show();
            $("#_290_of36b_qualifier_b1, #_2901_of36b_quantity_type_code_b1, #_2902_of36b_quantity_b1").removeAttr("disabled");
        } else if ($("#_2905_of36d_quantity_b1").val() != "") {
            $("#type_of36_b1").val("d").attr("selected", true).removeAttr("disabled");
            $("#div_of36d_b1").show();
            $("#_2903_of36d_qualifier_b1, #_2905_of36d_quantity_b1").removeAttr("disabled");
        }
        
        // Field 30: OF35B Description (B1)
        if ($("#_3002_of35b_description_of_security_b1").val() != "") {
            $("#check_of35b_description_of_security_b1").attr("checked", true);
            $("#div_opt_of35b_description_of_security_b1").show();
            $("#_3002_of35b_description_of_security_b1").removeAttr("disabled");
        }
        
        // Field 33: OF22F Data Source Scheme (main B)
        if ($("#_3301_of22f_data_source_scheme_b").val() != "") {
            $("#check_of22f_data_source_scheme_b").attr("checked", true);
            $("#div_opt_of22f_data_source_scheme_b").show();
            $("#_3301_of22f_data_source_scheme_b").removeAttr("disabled");
        }
        
        // Field 35: OF25D Data Source Scheme
        if ($("#_3501_of25d_data_source_scheme_b").val() != "") {
            $("#check_of25d_data_source_scheme_b").attr("checked", true);
            $("#div_opt_of25d_data_source_scheme_b").show();
            $("#_3501_of25d_data_source_scheme_b").removeAttr("disabled");
        }
        
        // Field 21: OF22F Data Source Scheme (B1)
        if ($("#_2101_of22f_data_source_scheme_b1").val() != "") {
            $("#check_of22f_data_source_scheme_b1").attr("checked", true);
            $("#div_opt_of22f_data_source_scheme_b1").show();
            $("#_2101_of22f_data_source_scheme_b1").removeAttr("disabled");
        }
        
    });
</script>

<!-- HANDLE REPETITIVE FIELDS WITH ADD BUTTON -->
<script type="text/javascript">
    //========================================
    // TOGGLE FUNCTIONS FOR REPETITIVE FIELDS
    //========================================
    
    // Toggle OF94A options in dynamically added containers
    function toggleOF94AOptions(container, countSuffix) {
        let typeSelect = container.find('[id$="type_of94_' + countSuffix + '"]');
        let divB = container.find('[id$="div_of94b_' + countSuffix + '"]');
        let divH = container.find('[id$="div_of94h_' + countSuffix + '"]');
        let divL = container.find('[id$="div_of94l_' + countSuffix + '"]');
        
        divB.hide();
        divH.hide();
        divL.hide();
        
        container.find('[id^="_140_"], [id^="_141_"], [id^="_143_"], [id^="_144_"], [id^="_145_"]').attr("disabled", true);
        container.find('[id^="_146_"], [id^="_148_"]').attr("disabled", true);
        container.find('[id^="_149_"], [id^="_14010_"]').attr("disabled", true);
        
        typeSelect.attr("disabled", false);
        
        typeSelect.change(function() {
            divB.hide();
            divH.hide();
            divL.hide();
            container.find('[id^="_140_"], [id^="_141_"], [id^="_143_"], [id^="_144_"], [id^="_145_"]').attr("disabled", true);
            container.find('[id^="_146_"], [id^="_148_"]').attr("disabled", true);
            container.find('[id^="_149_"], [id^="_14010_"]').attr("disabled", true);
            
            if ($(this).val() == "b") {
                divB.show();
                container.find('[id^="_140_"], [id^="_143_"]').attr("disabled", false);
                
                // Setup data source scheme checkbox
                let checkDSS = container.find('[id$="check_of94b_data_source_scheme_' + countSuffix + '"]');
                let divDSS = container.find('[id$="div_opt_of94b_data_source_scheme_' + countSuffix + '"]');
                divDSS.hide();
                container.find('[id^="_141_"]').attr("disabled", true);
                
                checkDSS.click(function(){
                    if ($(this).is(":checked")) {
                        divDSS.show();
                        container.find('[id^="_141_"]').attr("disabled", false);
                    } else {
                        divDSS.hide();
                        container.find('[id^="_141_"]').attr("disabled", true).val("");
                    }
                });
                
                // Setup narrative checkbox
                let checkNarr = container.find('[id$="check_of94b_narrative_' + countSuffix + '"]');
                let divNarr = container.find('[id$="div_opt_of94b_narrative_' + countSuffix + '"]');
                divNarr.hide();
                container.find('[id^="_144_"], [id^="_145_"]').attr("disabled", true);
                
                checkNarr.click(function(){
                    if ($(this).is(":checked")) {
                        divNarr.show();
                        container.find('[id^="_144_"], [id^="_145_"]').attr("disabled", false);
                    } else {
                        divNarr.hide();
                        container.find('[id^="_144_"], [id^="_145_"]').attr("disabled", true).val("");
                    }
                });
                
            } else if ($(this).val() == "h") {
                divH.show();
                container.find('[id^="_146_"], [id^="_148_"]').attr("disabled", false);
            } else if ($(this).val() == "l") {
                divL.show();
                container.find('[id^="_149_"], [id^="_14010_"]').attr("disabled", false);
            }
        });
    }
    
    // Toggle MF98A options in dynamically added containers
    function toggleMF98AOptions(container, countSuffix) {
        let typeSelect = container.find('[id$="type_mf98_' + countSuffix + '"]');
        let divA = container.find('[id$="div_mf98a_' + countSuffix + '"]');
        let divB = container.find('[id$="div_mf98b_' + countSuffix + '"]');
        let divC = container.find('[id$="div_mf98c_' + countSuffix + '"]');
        let divE = container.find('[id$="div_mf98e_' + countSuffix + '"]');
        
        divA.hide();
        divB.hide();
        divC.hide();
        divE.hide();
        
        container.find('[id^="_150_"], [id^="_1501_"]').attr("disabled", true);
        container.find('[id^="_1502_"], [id^="_1503_"], [id^="_1505_"]').attr("disabled", true);
        container.find('[id^="_1506_"], [id^="_1507_"], [id^="_1508_"]').attr("disabled", true);
        container.find('[id^="_15010_"], [id^="_15011_"], [id^="_15012_"], [id^="_15013_"], [id^="_15014_"], [id^="_15015_"]').attr("disabled", true);
        
        typeSelect.attr("disabled", false);
        
        typeSelect.change(function() {
            divA.hide();
            divB.hide();
            divC.hide();
            divE.hide();
            container.find('[id^="_150_"], [id^="_1501_"]').attr("disabled", true).val("");
            container.find('[id^="_1502_"], [id^="_1503_"], [id^="_1505_"]').attr("disabled", true).val("");
            container.find('[id^="_1506_"], [id^="_1507_"], [id^="_1508_"]').attr("disabled", true).val("");
            container.find('[id^="_15010_"], [id^="_15011_"], [id^="_15012_"], [id^="_15013_"], [id^="_15014_"], [id^="_15015_"]').attr("disabled", true).val("");
            
            if ($(this).val() == "a") {
                divA.show();
                container.find('[id^="_150_"], [id^="_1501_"]').attr("disabled", false);
            } else if ($(this).val() == "b") {
                divB.show();
                container.find('[id^="_1502_"], [id^="_1505_"]').attr("disabled", false);
                
                // Setup data source scheme checkbox
                let checkDSS = container.find('[id$="check_mf98b_data_source_scheme_' + countSuffix + '"]');
                let divDSS = container.find('[id$="div_opt_mf98b_data_source_scheme_' + countSuffix + '"]');
                divDSS.hide();
                container.find('[id^="_1503_"]').attr("disabled", true);
                
                checkDSS.click(function(){
                    if ($(this).is(":checked")) {
                        divDSS.show();
                        container.find('[id^="_1503_"]').attr("disabled", false);
                    } else {
                        divDSS.hide();
                        container.find('[id^="_1503_"]').attr("disabled", true).val("");
                    }
                });
                
            } else if ($(this).val() == "c") {
                divC.show();
                container.find('[id^="_1506_"], [id^="_1507_"], [id^="_1508_"]').attr("disabled", false);
            } else if ($(this).val() == "e") {
                divE.show();
                container.find('[id^="_15010_"], [id^="_15011_"]').attr("disabled", false);
                
                // Setup decimals checkbox
                let checkDec = container.find('[id$="check_mf98e_decimals_' + countSuffix + '"]');
                let divDec = container.find('[id$="div_opt_mf98e_decimals_' + countSuffix + '"]');
                divDec.hide();
                container.find('[id^="_15012_"], [id^="_15013_"]').attr("disabled", true);
                
                checkDec.click(function(){
                    if ($(this).is(":checked")) {
                        divDec.show();
                        container.find('[id^="_15012_"], [id^="_15013_"]').attr("disabled", false);
                    } else {
                        divDec.hide();
                        container.find('[id^="_15012_"], [id^="_15013_"]').attr("disabled", true).val("");
                    }
                });
                
                // Setup UTC indicator checkbox
                let checkUTC = container.find('[id$="check_mf98e_utc_indicator_' + countSuffix + '"]');
                let divUTC = container.find('[id$="div_opt_mf98e_utc_indicator_' + countSuffix + '"]');
                divUTC.hide();
                container.find('[id^="_15014_"], [id^="_15015_"]').attr("disabled", true);
                
                checkUTC.click(function(){
                    if ($(this).is(":checked")) {
                        divUTC.show();
                        container.find('[id^="_15014_"], [id^="_15015_"]').attr("disabled", false);
                    } else {
                        divUTC.hide();
                        container.find('[id^="_15014_"], [id^="_15015_"]').attr("disabled", true).val("");
                    }
                });
            }
        });
    }
    
    // Toggle OF22F options (B1)
    function toggleOF22FOptions_B1(container, countSuffix) {
        container.find('[id^="_210_"], [id^="_2103_"]').attr("disabled", false);
        
        // Setup data source scheme checkbox
        let checkDSS = container.find('[id$="check_of22f_data_source_scheme_' + countSuffix + '"]');
        let divDSS = container.find('[id$="div_opt_of22f_data_source_scheme_' + countSuffix + '"]');
        divDSS.hide();
        container.find('[id^="_2101_"]').attr("disabled", true);
        
        checkDSS.click(function(){
            if ($(this).is(":checked")) {
                divDSS.show();
                container.find('[id^="_2101_"]').attr("disabled", false);
            } else {
                divDSS.hide();
                container.find('[id^="_2101_"]').attr("disabled", true).val("");
            }
        });
    }
    
    // Toggle OF12A options (B1)
    function toggleOF12AOptions_B1(container, countSuffix) {
        let typeSelect = container.find('[id$="type_of12_' + countSuffix + '"]');
        let divA = container.find('[id$="div_of12a_' + countSuffix + '"]');
        let divB = container.find('[id$="div_of12b_' + countSuffix + '"]');
        let divC = container.find('[id$="div_of12c_' + countSuffix + '"]');
        
        divA.hide();
        divB.hide();
        divC.hide();
        
        container.find('[id^="_220_"], [id^="_2201_"], [id^="_2203_"]').attr("disabled", true);
        container.find('[id^="_2204_"], [id^="_2205_"], [id^="_2207_"]').attr("disabled", true);
        container.find('[id^="_2208_"], [id^="_2209_"]').attr("disabled", true);
        
        typeSelect.attr("disabled", false);
        
        typeSelect.change(function() {
            divA.hide();
            divB.hide();
            divC.hide();
            container.find('[id^="_220_"], [id^="_2201_"], [id^="_2203_"]').attr("disabled", true).val("");
            container.find('[id^="_2204_"], [id^="_2205_"], [id^="_2207_"]').attr("disabled", true).val("");
            container.find('[id^="_2208_"], [id^="_2209_"]').attr("disabled", true).val("");
            
            if ($(this).val() == "a") {
                divA.show();
                container.find('[id^="_2203_"]').attr("disabled", false);
                
                // Setup data source scheme checkbox
                let checkDSS = container.find('[id$="check_of12a_data_source_scheme_' + countSuffix + '"]');
                let divDSS = container.find('[id$="div_opt_of12a_data_source_scheme_' + countSuffix + '"]');
                divDSS.hide();
                container.find('[id^="_2201_"]').attr("disabled", true);
                
                checkDSS.click(function(){
                    if ($(this).is(":checked")) {
                        divDSS.show();
                        container.find('[id^="_2201_"]').attr("disabled", false);
                    } else {
                        divDSS.hide();
                        container.find('[id^="_2201_"]').attr("disabled", true).val("");
                    }
                });
                
            } else if ($(this).val() == "b") {
                divB.show();
                container.find('[id^="_2204_"], [id^="_2207_"]').attr("disabled", false);
                
                // Setup data source scheme checkbox
                let checkDSS = container.find('[id$="check_of12b_data_source_scheme_' + countSuffix + '"]');
                let divDSS = container.find('[id$="div_opt_of12b_data_source_scheme_' + countSuffix + '"]');
                divDSS.hide();
                container.find('[id^="_2205_"]').attr("disabled", true);
                
                checkDSS.click(function(){
                    if ($(this).is(":checked")) {
                        divDSS.show();
                        container.find('[id^="_2205_"]').attr("disabled", false);
                    } else {
                        divDSS.hide();
                        container.find('[id^="_2205_"]').attr("disabled", true).val("");
                    }
                });
                
            } else if ($(this).val() == "c") {
                divC.show();
                container.find('[id^="_2209_"]').attr("disabled", false);
            }
        });
    }
    
    // Toggle OF98A options (B1)
    function toggleOF98AOptions_B1(container, countSuffix) {
        container.find('[id^="_240_"], [id^="_2401_"]').attr("disabled", false);
    }
    
    // Toggle OF92A options (B1)
    function toggleOF92AOptions_B1(container, countSuffix) {
        container.find('[id^="_250_"], [id^="_2502_"]').attr("disabled", false);
        
        // Setup sign checkbox
        let checkSign = container.find('[id$="check_of92a_sign_' + countSuffix + '"]');
        let divSign = container.find('[id$="div_opt_of92a_sign_' + countSuffix + '"]');
        divSign.hide();
        container.find('[id^="_2501_"]').attr("disabled", true);
        
        checkSign.click(function(){
            if ($(this).is(":checked")) {
                divSign.show();
                container.find('[id^="_2501_"]').attr("disabled", false);
            } else {
                divSign.hide();
                container.find('[id^="_2501_"]').attr("disabled", true).val("");
            }
        });
    }
    
    // Toggle OF13A options (B1)
    function toggleOF13AOptions_B1(container, countSuffix) {
        let typeSelect = container.find('[id$="type_of13_' + countSuffix + '"]');
        let divA = container.find('[id$="div_of13a_' + countSuffix + '"]');
        let divB = container.find('[id$="div_of13b_' + countSuffix + '"]');
        
        divA.hide();
        divB.hide();
        
        container.find('[id^="_260_"], [id^="_2601_"]').attr("disabled", true);
        container.find('[id^="_2602_"], [id^="_2603_"], [id^="_2605_"]').attr("disabled", true);
        
        typeSelect.attr("disabled", false);
        
        typeSelect.change(function() {
            divA.hide();
            divB.hide();
            container.find('[id^="_260_"], [id^="_2601_"]').attr("disabled", true).val("");
            container.find('[id^="_2602_"], [id^="_2603_"], [id^="_2605_"]').attr("disabled", true).val("");
            
            if ($(this).val() == "a") {
                divA.show();
                container.find('[id^="_2601_"]').attr("disabled", false);
            } else if ($(this).val() == "b") {
                divB.show();
                container.find('[id^="_2602_"], [id^="_2605_"]').attr("disabled", false);
                
                // Setup data source scheme checkbox
                let checkDSS = container.find('[id$="check_of13b_data_source_scheme_' + countSuffix + '"]');
                let divDSS = container.find('[id$="div_opt_of13b_data_source_scheme_' + countSuffix + '"]');
                divDSS.hide();
                container.find('[id^="_2603_"]').attr("disabled", true);
                
                checkDSS.click(function(){
                    if ($(this).is(":checked")) {
                        divDSS.show();
                        container.find('[id^="_2603_"]').attr("disabled", false);
                    } else {
                        divDSS.hide();
                        container.find('[id^="_2603_"]').attr("disabled", true).val("");
                    }
                });
            }
        });
    }
    
    // Toggle OF17B options (B1)
    function toggleOF17BOptions_B1(container, countSuffix) {
        container.find('[id^="_270_"], [id^="_2701_"]').attr("disabled", false);
    }
    
    // Toggle OF90A options (B1)
    function toggleOF90AOptions_B1(container, countSuffix) {
        let typeSelect = container.find('[id$="type_of90_' + countSuffix + '"]');
        let divA = container.find('[id$="div_of90a_' + countSuffix + '"]');
        let divB = container.find('[id$="div_of90b_' + countSuffix + '"]');
        
        divA.hide();
        divB.hide();
        
        container.find('[id^="_280_"], [id^="_2801_"], [id^="_2802_"], [id^="_2803_"]').attr("disabled", true);
        container.find('[id^="_2804_"], [id^="_2805_"], [id^="_2806_"], [id^="_2807_"]').attr("disabled", true);
        
        typeSelect.attr("disabled", false);
        
        typeSelect.change(function() {
            divA.hide();
            divB.hide();
            container.find('[id^="_280_"], [id^="_2801_"], [id^="_2802_"], [id^="_2803_"]').attr("disabled", true).val("");
            container.find('[id^="_2804_"], [id^="_2805_"], [id^="_2806_"], [id^="_2807_"]').attr("disabled", true).val("");
            
            if ($(this).val() == "a") {
                divA.show();
                container.find('[id^="_280_"], [id^="_2801_"], [id^="_2803_"]').attr("disabled", false);
                
                // Setup sign checkbox
                let checkSign = container.find('[id$="check_of90a_sign_' + countSuffix + '"]');
                let divSign = container.find('[id$="div_opt_of90a_sign_' + countSuffix + '"]');
                divSign.hide();
                container.find('[id^="_2802_"]').attr("disabled", true);
                
                checkSign.click(function(){
                    if ($(this).is(":checked")) {
                        divSign.show();
                        container.find('[id^="_2802_"]').attr("disabled", false);
                    } else {
                        divSign.hide();
                        container.find('[id^="_2802_"]').attr("disabled", true).val("");
                    }
                });
                
            } else if ($(this).val() == "b") {
                divB.show();
                container.find('[id^="_2804_"], [id^="_2805_"], [id^="_2806_"], [id^="_2807_"]').attr("disabled", false);
            }
        });
    }
    
    // Toggle OF36A options (B1)
    function toggleOF36AOptions_B1(container, countSuffix) {
        let typeSelect = container.find('[id$="type_of36_' + countSuffix + '"]');
        let divB = container.find('[id$="div_of36b_' + countSuffix + '"]');
        let divD = container.find('[id$="div_of36d_' + countSuffix + '"]');
        
        divB.hide();
        divD.hide();
        
        container.find('[id^="_290_"], [id^="_2901_"], [id^="_2902_"]').attr("disabled", true);
        container.find('[id^="_2903_"], [id^="_2905_"]').attr("disabled", true);
        
        typeSelect.attr("disabled", false);
        
        typeSelect.change(function() {
            divB.hide();
            divD.hide();
            container.find('[id^="_290_"], [id^="_2901_"], [id^="_2902_"]').attr("disabled", true).val("");
            container.find('[id^="_2903_"], [id^="_2905_"]').attr("disabled", true).val("");
            
            if ($(this).val() == "b") {
                divB.show();
                container.find('[id^="_290_"], [id^="_2901_"], [id^="_2902_"]').attr("disabled", false);
            } else if ($(this).val() == "d") {
                divD.show();
                container.find('[id^="_2903_"], [id^="_2905_"]').attr("disabled", false);
            }
        });
    }
    
    // Toggle OF35B options (B1)
    function toggleOF35BOptions_B1(container, countSuffix) {
        container.find('[id^="_3001_"]').attr("disabled", false);
        
        // Setup description checkbox
        let checkDesc = container.find('[id$="check_of35b_description_of_security_' + countSuffix + '"]');
        let divDesc = container.find('[id$="div_opt_of35b_description_of_security_' + countSuffix + '"]');
        divDesc.hide();
        container.find('[id^="_3002_"]').attr("disabled", true);
        
        checkDesc.click(function(){
            if ($(this).is(":checked")) {
                divDesc.show();
                container.find('[id^="_3002_"]').attr("disabled", false);
            } else {
                divDesc.hide();
                container.find('[id^="_3002_"]').attr("disabled", true).val("");
            }
        });
    }
    
    // Toggle OF22F options (main B)
    function toggleOF22FOptions_B(container, countSuffix) {
        container.find('[id^="_330_"], [id^="_3303_"]').attr("disabled", false);
        
        // Setup data source scheme checkbox
        let checkDSS = container.find('[id$="check_of22f_data_source_scheme_' + countSuffix + '"]');
        let divDSS = container.find('[id$="div_opt_of22f_data_source_scheme_' + countSuffix + '"]');
        divDSS.hide();
        container.find('[id^="_3301_"]').attr("disabled", true);
        
        checkDSS.click(function(){
            if ($(this).is(":checked")) {
                divDSS.show();
                container.find('[id^="_3301_"]').attr("disabled", false);
            } else {
                divDSS.hide();
                container.find('[id^="_3301_"]').attr("disabled", true).val("");
            }
        });
    }
    
    // Toggle OF25D options
    function toggleOF25DOptions(container, countSuffix) {
        container.find('[id^="_350_"], [id^="_3503_"]').attr("disabled", false);
        
        // Setup data source scheme checkbox
        let checkDSS = container.find('[id$="check_of25d_data_source_scheme_' + countSuffix + '"]');
        let divDSS = container.find('[id$="div_opt_of25d_data_source_scheme_' + countSuffix + '"]');
        divDSS.hide();
        container.find('[id^="_3501_"]').attr("disabled", true);
        
        checkDSS.click(function(){
            if ($(this).is(":checked")) {
                divDSS.show();
                container.find('[id^="_3501_"]').attr("disabled", false);
            } else {
                divDSS.hide();
                container.find('[id^="_3501_"]').attr("disabled", true).val("");
            }
        });
    }
    
    // Toggle OF70E options
    function toggleOF70EOptions(container, countSuffix) {
        container.find('[id^="_360_"], [id^="_3601_"]').attr("disabled", false);
    }
</script>

<!-- ADD CONTAINER FUNCTION FOR REPETITIVE FIELDS -->
<script type="text/javascript">
    function addContainer(button) {
        let dataId = $(button).data("id");
        let currentCount = parseInt($(button).data("count"));
        let maxOcc = parseInt($("#max_occ_" + dataId).text());
        
        if (currentCount >= maxOcc) {
            alert("Maximum occurrence reached: " + maxOcc);
            return;
        }
        
        currentCount++;
        $(button).data("count", currentCount);
        $("#cur_occ_" + dataId).text(currentCount);
        
        let template = $("#template_" + dataId).clone();
        template.attr("id", "container_item_" + dataId + "_" + currentCount);
        template.removeAttr("style");
        
        // Update IDs and names
        template.find("[id]").each(function() {
            let oldId = $(this).attr("id");
            let newId = oldId.replace(new RegExp("_" + dataId.split('_')[0] + "$"), "_" + dataId.split('_')[0] + "_" + currentCount);
            $(this).attr("id", newId);
        });
        
        template.find("[name]").each(function() {
            let oldName = $(this).attr("name");
            let newName = oldName.replace(new RegExp("_" + dataId.split('_')[0] + "$"), "_" + dataId.split('_')[0] + "_" + currentCount);
            $(this).attr("name", newName);
        });
        
        template.find('[id$="label_count_' + dataId + '"]').text("Count: " + currentCount);
        
        template.find(".remove-btn").attr("disabled", false).click(function() {
            template.remove();
            currentCount--;
            $(button).data("count", currentCount);
            $("#cur_occ_" + dataId).text(currentCount);
        });
        
        template.insertBefore("#container_" + dataId);
        
        // Initialize toggle functions based on field type
        let suffix = dataId.split('_')[0] + "_" + currentCount;
        
        if (dataId === "of94a_b") {
            toggleOF94AOptions(template, suffix);
        } else if (dataId === "mf98a_b") {
            toggleMF98AOptions(template, suffix);
        } else if (dataId === "of22f_b1") {
            toggleOF22FOptions_B1(template, suffix);
        } else if (dataId === "of12a_b1") {
            toggleOF12AOptions_B1(template, suffix);
        } else if (dataId === "of98a_b1") {
            toggleOF98AOptions_B1(template, suffix);
        } else if (dataId === "of92a_b1") {
            toggleOF92AOptions_B1(template, suffix);
        } else if (dataId === "of13a_b1") {
            toggleOF13AOptions_B1(template, suffix);
        } else if (dataId === "of17b_b1") {
            toggleOF17BOptions_B1(template, suffix);
        } else if (dataId === "of90a_b1") {
            toggleOF90AOptions_B1(template, suffix);
        } else if (dataId === "of36a_b1") {
            toggleOF36AOptions_B1(template, suffix);
        } else if (dataId === "of35b_b1") {
            toggleOF35BOptions_B1(template, suffix);
        } else if (dataId === "of22f_b") {
            toggleOF22FOptions_B(template, suffix);
        } else if (dataId === "of25d_b") {
            toggleOF25DOptions(template, suffix);
        } else if (dataId === "of70e_b") {
            toggleOF70EOptions(template, suffix);
        }
        
        // Re-apply dynamic validation
        if (typeof addDynamicValidation === 'function') {
            addDynamicValidation();
        }
    }
</script>

<!-- VIEW MODE FOR REPETITIVE FIELDS -->
<script type="text/javascript">
    $(document).ready(function() {
        
        //========================================
        // CHECK EXISTING DATA FOR REPETITIVE FIELDS
        //========================================
        
        // Check OF94A fields that already exist
        $("[id^='type_of94_b']").each(function() {
            if ($(this).attr('id') !== 'type_of94_b' && $(this).val()) {
                $(this).trigger('change');
            }
        });
        
        // Check MF98A fields that already exist
        $("[id^='type_mf98_b']").each(function() {
            if ($(this).attr('id') !== 'type_mf98_b' && $(this).val()) {
                $(this).trigger('change');
            }
        });
        
        // Check OF22F (B1) fields that already exist
        $("[id^='check_of22f_b1']").each(function() {
            let container = $(this).closest('.template_container');
            let indicatorField = container.find("[id$='_2103_of22f_indicator_b1']");
            if (indicatorField.val() && indicatorField.val().trim() !== "") {
                $(this).prop("checked", true).trigger("click");
            }
        });
        
        // Check OF12A (B1) fields that already exist
        $("[id^='type_of12_b1']").each(function() {
            if ($(this).val()) {
                $(this).trigger('change');
            }
        });
        
        // Check OF98A (B1) fields that already exist
        $("[id^='_240_of98a_qualifier_b1']").each(function() {
            if ($(this).val()) {
                let container = $(this).closest('.template_container');
                container.find("[id^='_240_'], [id^='_2401_']").attr("disabled", false);
            }
        });
        
        // Check OF92A (B1) fields that already exist
        $("[id^='_250_of92a_qualifier_b1']").each(function() {
            if ($(this).val()) {
                let container = $(this).closest('.template_container');
                container.find("[id^='_250_'], [id^='_2502_']").attr("disabled", false);
                
                let signField = container.find("[id$='_2501_of92a_sign_b1']");
                if (signField.val() && signField.val().trim() !== "") {
                    let checkSign = container.find("[id$='check_of92a_sign_b1']");
                    checkSign.prop("checked", true);
                    container.find("[id$='div_opt_of92a_sign_b1']").show();
                    signField.attr("disabled", false);
                }
            }
        });
        
        // Check OF13A (B1) fields that already exist
        $("[id^='type_of13_b1']").each(function() {
            if ($(this).val()) {
                $(this).trigger('change');
            }
        });
        
        // Check OF17B (B1) fields that already exist
        $("[id^='_270_of17b_qualifier_b1']").each(function() {
            if ($(this).val()) {
                let container = $(this).closest('.template_container');
                container.find("[id^='_270_'], [id^='_2701_']").attr("disabled", false);
            }
        });
        
        // Check OF90A (B1) fields that already exist
        $("[id^='type_of90_b1']").each(function() {
            if ($(this).val()) {
                $(this).trigger('change');
            }
        });
        
        // Check OF36A (B1) fields that already exist
        $("[id^='type_of36_b1']").each(function() {
            if ($(this).val()) {
                $(this).trigger('change');
            }
        });
        
        // Check OF35B (B1) fields that already exist
        $("[id^='_3001_of35b_identification_of_security_b1']").each(function() {
            if ($(this).val()) {
                let container = $(this).closest('.template_container');
                $(this).attr("disabled", false);
                
                let descField = container.find("[id$='_3002_of35b_description_of_security_b1']");
                if (descField.val() && descField.val().trim() !== "") {
                    let checkDesc = container.find("[id$='check_of35b_description_of_security_b1']");
                    checkDesc.prop("checked", true);
                    container.find("[id$='div_opt_of35b_description_of_security_b1']").show();
                    descField.attr("disabled", false);
                }
            }
        });
        
        // Check OF22F (main B) fields that already exist
        $("[id^='_330_of22f_qualifier_b']").each(function() {
            if ($(this).val()) {
                let container = $(this).closest('.template_container');
                container.find("[id^='_330_'], [id^='_3303_']").attr("disabled", false);
                
                let dssField = container.find("[id$='_3301_of22f_data_source_scheme_b']");
                if (dssField.val() && dssField.val().trim() !== "") {
                    let checkDSS = container.find("[id$='check_of22f_data_source_scheme_b']");
                    checkDSS.prop("checked", true);
                    container.find("[id$='div_opt_of22f_data_source_scheme_b']").show();
                    dssField.attr("disabled", false);
                }
            }
        });
        
        // Check OF25D fields that already exist
        $("[id^='_350_of25d_qualifier_b']").each(function() {
            if ($(this).val()) {
                let container = $(this).closest('.template_container');
                container.find("[id^='_350_'], [id^='_3503_']").attr("disabled", false);
                
                let dssField = container.find("[id$='_3501_of25d_data_source_scheme_b']");
                if (dssField.val() && dssField.val().trim() !== "") {
                    let checkDSS = container.find("[id$='check_of25d_data_source_scheme_b']");
                    checkDSS.prop("checked", true);
                    container.find("[id$='div_opt_of25d_data_source_scheme_b']").show();
                    dssField.attr("disabled", false);
                }
            }
        });
        
        // Check OF70E fields that already exist
        $("[id^='_360_of70e_qualifier_b']").each(function() {
            if ($(this).val()) {
                let container = $(this).closest('.template_container');
                container.find("[id^='_360_'], [id^='_3601_']").attr("disabled", false);
            }
        });
        
    });
</script>

<!-- HANDLE CHECKBOX CHANGES FOR DATA SOURCE SCHEME IN REPETITIVE FIELDS -->
<script type="text/javascript">
    $(document).on('change', '[id^="check_of94b_data_source_scheme_"]', function() {
        let container = $(this).closest('.template_container');
        let suffix = $(this).attr('id').replace('check_of94b_data_source_scheme_', '');
        let divDSS = container.find('[id$="div_opt_of94b_data_source_scheme_' + suffix + '"]');
        let fieldDSS = container.find('[id$="_of94b_data_source_scheme_' + suffix + '"]');
        
        if ($(this).is(":checked")) {
            divDSS.show();
            fieldDSS.attr("disabled", false);
        } else {
            divDSS.hide();
            fieldDSS.attr("disabled", true).val("");
        }
    });
    
    $(document).on('change', '[id^="check_of94b_narrative_"]', function() {
        let container = $(this).closest('.template_container');
        let suffix = $(this).attr('id').replace('check_of94b_narrative_', '');
        let divNarr = container.find('[id$="div_opt_of94b_narrative_' + suffix + '"]');
        let fields = container.find('[id$="_of94b_slash2_' + suffix + '"], [id$="_of94b_narrative_' + suffix + '"]');
        
        if ($(this).is(":checked")) {
            divNarr.show();
            fields.attr("disabled", false);
        } else {
            divNarr.hide();
            fields.attr("disabled", true).val("");
        }
    });
    
    $(document).on('change', '[id^="check_mf98b_data_source_scheme_"]', function() {
        let container = $(this).closest('.template_container');
        let suffix = $(this).attr('id').replace('check_mf98b_data_source_scheme_', '');
        let divDSS = container.find('[id$="div_opt_mf98b_data_source_scheme_' + suffix + '"]');
        let fieldDSS = container.find('[id$="_mf98b_data_source_scheme_' + suffix + '"]');
        
        if ($(this).is(":checked")) {
            divDSS.show();
            fieldDSS.attr("disabled", false);
        } else {
            divDSS.hide();
            fieldDSS.attr("disabled", true).val("");
        }
    });
    
    $(document).on('change', '[id^="check_mf98e_decimals_"]', function() {
        let container = $(this).closest('.template_container');
        let suffix = $(this).attr('id').replace('check_mf98e_decimals_', '');
        let divDec = container.find('[id$="div_opt_mf98e_decimals_' + suffix + '"]');
        let fields = container.find('[id$="_mf98e_comma_' + suffix + '"], [id$="_mf98e_decimals_' + suffix + '"]');
        
        if ($(this).is(":checked")) {
            divDec.show();
            fields.attr("disabled", false);
        } else {
            divDec.hide();
            fields.attr("disabled", true).val("");
        }
    });
    
    $(document).on('change', '[id^="check_mf98e_utc_indicator_"]', function() {
        let container = $(this).closest('.template_container');
        let suffix = $(this).attr('id').replace('check_mf98e_utc_indicator_', '');
        let divUTC = container.find('[id$="div_opt_mf98e_utc_indicator_' + suffix + '"]');
        let fields = container.find('[id$="_mf98e_slash_' + suffix + '"], [id$="_mf98e_utc_indicator_' + suffix + '"]');
        
        if ($(this).is(":checked")) {
            divUTC.show();
            fields.attr("disabled", false);
        } else {
            divUTC.hide();
            fields.attr("disabled", true).val("");
        }
    });
</script>

<!--SEQUENCE C-->
<script type="text/javascript">
    $(document).ready(function(){
        
        //========================================
        // INITIAL SETUP - SHOW/HIDE FIELDS
        //========================================
        
        // MF36A - Quantity of Financial Instrument to be Settled
        $("#div_mf36b_c, #div_mf36d_c").hide();
        
        // OF70D - Denomination Choice (No checkbox, always visible)
        $("#div_opt_of70d_c").show();
        $("#_400_of70d_qualifier_c").attr("disabled", false);
        $("#_4001_of70d_narrative_c").attr("disabled", false);
        
        // MF97A - Account
        $("#div_mf97a_c, #div_mf97b_c, #div_mf97d_c, #div_mf97e_c").hide();
        $("#div_opt_mf97b_data_source_scheme_c, #div_opt_mf97d_data_source_scheme_c").hide();
        
        //========================================
        // EVENT HANDLERS FOR SEQUENCE C
        //========================================
        
        // MF36A Type Change Handler
        $(document).on('change', '[id^="type_mf36_c"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            let suffix = "";
            if (container.attr('id')) {
                let match = container.attr('id').match(/_(\d+)$/);
                suffix = match ? "_" + match[1] : "";
            }
            
            if ($(this).val() == "b") {
                container.find('#div_mf36b_c' + suffix).show();
                container.find('#div_mf36d_c' + suffix).hide();
                container.find('[id^="_390_mf36b_qualifier_c"]').attr("disabled", false);
                container.find('[id^="_3901_mf36b_quantity_type_code_c"]').attr("disabled", false);
                container.find('[id^="_3902_mf36b_quantity_c"]').attr("disabled", false);
                container.find('[id^="_3903_mf36d_qualifier_c"]').attr("disabled", true).val("");
                container.find('[id^="_3904_mf36d_quantity_type_code_c"]').attr("disabled", true).val("");
                container.find('[id^="_3905_mf36d_quantity_c"]').attr("disabled", true).val("");
            } else if ($(this).val() == "d") {
                container.find('#div_mf36b_c' + suffix).hide();
                container.find('#div_mf36d_c' + suffix).show();
                container.find('[id^="_390_mf36b_qualifier_c"]').attr("disabled", true).val("");
                container.find('[id^="_3901_mf36b_quantity_type_code_c"]').attr("disabled", true).val("");
                container.find('[id^="_3902_mf36b_quantity_c"]').attr("disabled", true).val("");
                container.find('[id^="_3903_mf36d_qualifier_c"]').attr("disabled", false);
                container.find('[id^="_3904_mf36d_quantity_type_code_c"]').attr("disabled", false);
                container.find('[id^="_3905_mf36d_quantity_c"]').attr("disabled", false);
            } else {
                container.find('#div_mf36b_c' + suffix + ', #div_mf36d_c' + suffix).hide();
                container.find('[id^="_390_mf36b_"]').attr("disabled", true).val("");
                container.find('[id^="_3901_mf36b_"]').attr("disabled", true).val("");
                container.find('[id^="_3902_mf36b_"]').attr("disabled", true).val("");
                container.find('[id^="_3903_mf36d_"]').attr("disabled", true).val("");
                container.find('[id^="_3904_mf36d_"]').attr("disabled", true).val("");
                container.find('[id^="_3905_mf36d_"]').attr("disabled", true).val("");
            }
        });
        
        // OF95A Type Change Handler (Party)
        $(document).on('change', '[id^="type_of95_c"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            let suffix = "";
            if (container.attr('id')) {
                let match = container.attr('id').match(/_(\d+)$/);
                suffix = match ? "_" + match[1] : "";
            }
            
            if ($(this).val() == "l") {
                container.find('#div_of95l_c' + suffix).show();
                container.find('#div_of95p_c' + suffix + ', #div_of95r_c' + suffix).hide();
                container.find('[id^="_420_of95l_"]').attr("disabled", false);
                container.find('[id^="_4201_of95l_"]').attr("disabled", false);
                container.find('[id^="_4202_of95p_"]').attr("disabled", true).val("");
                container.find('[id^="_4203_of95p_"]').attr("disabled", true).val("");
                container.find('[id^="_4204_of95r_"]').attr("disabled", true).val("");
                container.find('[id^="_4205_of95r_"]').attr("disabled", true).val("");
                container.find('[id^="_4206_of95r_"]').attr("disabled", true).val("");
                container.find('[id^="_4207_of95r_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "p") {
                container.find('#div_of95l_c' + suffix + ', #div_of95r_c' + suffix).hide();
                container.find('#div_of95p_c' + suffix).show();
                container.find('[id^="_420_of95l_"]').attr("disabled", true).val("");
                container.find('[id^="_4201_of95l_"]').attr("disabled", true).val("");
                container.find('[id^="_4202_of95p_"]').attr("disabled", false);
                container.find('[id^="_4203_of95p_"]').attr("disabled", false);
                container.find('[id^="_4204_of95r_"]').attr("disabled", true).val("");
                container.find('[id^="_4205_of95r_"]').attr("disabled", true).val("");
                container.find('[id^="_4206_of95r_"]').attr("disabled", true).val("");
                container.find('[id^="_4207_of95r_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "r") {
                container.find('#div_of95l_c' + suffix + ', #div_of95p_c' + suffix).hide();
                container.find('#div_of95r_c' + suffix).show();
                container.find('[id^="_420_of95l_"]').attr("disabled", true).val("");
                container.find('[id^="_4201_of95l_"]').attr("disabled", true).val("");
                container.find('[id^="_4202_of95p_"]').attr("disabled", true).val("");
                container.find('[id^="_4203_of95p_"]').attr("disabled", true).val("");
                container.find('[id^="_4204_of95r_"]').attr("disabled", false);
                container.find('[id^="_4205_of95r_"]').attr("disabled", false);
                container.find('[id^="_4206_of95r_"]').attr("disabled", false);
                container.find('[id^="_4207_of95r_"]').attr("disabled", false);
            } else {
                container.find('#div_of95l_c' + suffix + ', #div_of95p_c' + suffix + ', #div_of95r_c' + suffix).hide();
                container.find('[id^="_420_of95l_"]').attr("disabled", true).val("");
                container.find('[id^="_4201_of95l_"]').attr("disabled", true).val("");
                container.find('[id^="_4202_of95p_"]').attr("disabled", true).val("");
                container.find('[id^="_4203_of95p_"]').attr("disabled", true).val("");
                container.find('[id^="_4204_of95r_"]').attr("disabled", true).val("");
                container.find('[id^="_4205_of95r_"]').attr("disabled", true).val("");
                container.find('[id^="_4206_of95r_"]').attr("disabled", true).val("");
                container.find('[id^="_4207_of95r_"]').attr("disabled", true).val("");
            }
        });
        
        // MF97A Type Change Handler (Account)
        $(document).on('change', '[id^="type_mf97_c"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            let suffix = "";
            if (container.attr('id')) {
                let match = container.attr('id').match(/_(\d+)$/);
                suffix = match ? "_" + match[1] : "";
            }
            
            if ($(this).val() == "a") {
                container.find('#div_mf97a_c' + suffix).show();
                container.find('#div_mf97b_c' + suffix + ', #div_mf97d_c' + suffix + ', #div_mf97e_c' + suffix).hide();
                container.find('[id^="_430_mf97a_"]').attr("disabled", false);
                container.find('[id^="_4301_mf97a_"]').attr("disabled", false);
                container.find('[id^="_4302_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4303_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4304_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4305_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4306_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4307_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4308_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_4309_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_43010_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_43011_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_43012_mf97e_"]').attr("disabled", true).val("");
                container.find('[id^="_43013_mf97e_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "b") {
                container.find('#div_mf97a_c' + suffix + ', #div_mf97d_c' + suffix + ', #div_mf97e_c' + suffix).hide();
                container.find('#div_mf97b_c' + suffix).show();
                container.find('[id^="div_opt_mf97b_data_source_scheme_c"]').show();
                container.find('[id^="_430_mf97a_"]').attr("disabled", true).val("");
                container.find('[id^="_4301_mf97a_"]').attr("disabled", true).val("");
                container.find('[id^="_4302_mf97b_"]').attr("disabled", false);
                container.find('[id^="_4303_mf97b_"]').attr("disabled", false);
                container.find('[id^="_4304_mf97b_"]').attr("disabled", false);
                container.find('[id^="_4305_mf97b_"]').attr("disabled", false);
                container.find('[id^="_4306_mf97b_"]').attr("disabled", false);
                container.find('[id^="_4307_mf97b_"]').attr("disabled", false);
                container.find('[id^="_4308_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_4309_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_43010_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_43011_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_43012_mf97e_"]').attr("disabled", true).val("");
                container.find('[id^="_43013_mf97e_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "d") {
                container.find('#div_mf97a_c' + suffix + ', #div_mf97b_c' + suffix + ', #div_mf97e_c' + suffix).hide();
                container.find('#div_mf97d_c' + suffix).show();
                container.find('[id^="div_opt_mf97d_data_source_scheme_c"]').show();
                container.find('[id^="_430_mf97a_"]').attr("disabled", true).val("");
                container.find('[id^="_4301_mf97a_"]').attr("disabled", true).val("");
                container.find('[id^="_4302_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4303_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4304_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4305_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4306_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4307_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4308_mf97d_"]').attr("disabled", false);
                container.find('[id^="_4309_mf97d_"]').attr("disabled", false);
                container.find('[id^="_43010_mf97d_"]').attr("disabled", false);
                container.find('[id^="_43011_mf97d_"]').attr("disabled", false);
                container.find('[id^="_43012_mf97e_"]').attr("disabled", true).val("");
                container.find('[id^="_43013_mf97e_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "e") {
                container.find('#div_mf97a_c' + suffix + ', #div_mf97b_c' + suffix + ', #div_mf97d_c' + suffix).hide();
                container.find('#div_mf97e_c' + suffix).show();
                container.find('[id^="_430_mf97a_"]').attr("disabled", true).val("");
                container.find('[id^="_4301_mf97a_"]').attr("disabled", true).val("");
                container.find('[id^="_4302_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4303_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4304_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4305_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4306_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4307_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4308_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_4309_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_43010_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_43011_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_43012_mf97e_"]').attr("disabled", false);
                container.find('[id^="_43013_mf97e_"]').attr("disabled", false);
            } else {
                container.find('#div_mf97a_c' + suffix + ', #div_mf97b_c' + suffix + ', #div_mf97d_c' + suffix + ', #div_mf97e_c' + suffix).hide();
                container.find('[id^="_430_mf97a_"]').attr("disabled", true).val("");
                container.find('[id^="_4301_mf97a_"]').attr("disabled", true).val("");
                container.find('[id^="_4302_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4303_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4304_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4305_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4306_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4307_mf97b_"]').attr("disabled", true).val("");
                container.find('[id^="_4308_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_4309_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_43010_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_43011_mf97d_"]').attr("disabled", true).val("");
                container.find('[id^="_43012_mf97e_"]').attr("disabled", true).val("");
                container.find('[id^="_43013_mf97e_"]').attr("disabled", true).val("");
            }
        });
        
        // MF97D Data Source Scheme Checkbox
        $(document).on('change', '[id^="check_mf97d_data_source_scheme_c"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            
            if ($(this).is(":checked")) {
                container.find('[id^="div_opt_mf97d_data_source_scheme_c"]').show();
                container.find('[id^="_4309_mf97d_data_source_scheme_c"]').attr("disabled", false);
            } else {
                container.find('[id^="div_opt_mf97d_data_source_scheme_c"]').hide();
                container.find('[id^="_4309_mf97d_data_source_scheme_c"]').attr("disabled", true).val("");
            }
        });
        
        // OF94A Type Change Handler (Place of Safekeeping)
        $(document).on('change', '[id^="type_of94_c"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            let suffix = "";
            if (container.attr('id')) {
                let match = container.attr('id').match(/_(\d+)$/);
                suffix = match ? "_" + match[1] : "";
            }
            
            if ($(this).val() == "b") {
                container.find('#div_of94b_c' + suffix).show();
                container.find('#div_of94c_c' + suffix + ', #div_of94f_c' + suffix + ', #div_of94l_c' + suffix + ', #div_of94t_c' + suffix).hide();
                container.find('[id^="div_opt_of94b_data_source_scheme_c"]').show();
                container.find('[id^="div_opt_of94b_narrative_c"]').show();
                container.find('[id^="_440_of94b_"]').attr("disabled", false);
                container.find('[id^="_4401_of94b_"]').attr("disabled", false);
                container.find('[id^="_4402_of94b_"]').attr("disabled", false);
                container.find('[id^="_4403_of94b_"]').attr("disabled", false);
                container.find('[id^="_4404_of94b_"]').attr("disabled", false);
                container.find('[id^="_4405_of94b_"]').attr("disabled", false);
                container.find('[id^="_4406_of94c_"]').attr("disabled", true).val("");
                container.find('[id^="_4407_of94c_"]').attr("disabled", true).val("");
                container.find('[id^="_4408_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_4409_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_44010_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_44011_of94l_"]').attr("disabled", true).val("");
                container.find('[id^="_44012_of94l_"]').attr("disabled", true).val("");
                container.find('[id^="_44013_of94t_"]').attr("disabled", true).val("");
                container.find('[id^="_44014_of94t_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "c") {
                container.find('#div_of94b_c' + suffix + ', #div_of94f_c' + suffix + ', #div_of94l_c' + suffix + ', #div_of94t_c' + suffix).hide();
                container.find('#div_of94c_c' + suffix).show();
                container.find('[id^="_440_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4401_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4402_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4403_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4404_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4405_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4406_of94c_"]').attr("disabled", false);
                container.find('[id^="_4407_of94c_"]').attr("disabled", false);
                container.find('[id^="_4408_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_4409_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_44010_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_44011_of94l_"]').attr("disabled", true).val("");
                container.find('[id^="_44012_of94l_"]').attr("disabled", true).val("");
                container.find('[id^="_44013_of94t_"]').attr("disabled", true).val("");
                container.find('[id^="_44014_of94t_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "f") {
                container.find('#div_of94b_c' + suffix + ', #div_of94c_c' + suffix + ', #div_of94l_c' + suffix + ', #div_of94t_c' + suffix).hide();
                container.find('#div_of94f_c' + suffix).show();
                container.find('[id^="_440_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4401_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4402_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4403_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4404_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4405_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4406_of94c_"]').attr("disabled", true).val("");
                container.find('[id^="_4407_of94c_"]').attr("disabled", true).val("");
                container.find('[id^="_4408_of94f_"]').attr("disabled", false);
                container.find('[id^="_4409_of94f_"]').attr("disabled", false);
                container.find('[id^="_44010_of94f_"]').attr("disabled", false);
                container.find('[id^="_44011_of94l_"]').attr("disabled", true).val("");
                container.find('[id^="_44012_of94l_"]').attr("disabled", true).val("");
                container.find('[id^="_44013_of94t_"]').attr("disabled", true).val("");
                container.find('[id^="_44014_of94t_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "l") {
                container.find('#div_of94b_c' + suffix + ', #div_of94c_c' + suffix + ', #div_of94f_c' + suffix + ', #div_of94t_c' + suffix).hide();
                container.find('#div_of94l_c' + suffix).show();
                container.find('[id^="_440_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4401_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4402_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4403_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4404_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4405_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4406_of94c_"]').attr("disabled", true).val("");
                container.find('[id^="_4407_of94c_"]').attr("disabled", true).val("");
                container.find('[id^="_4408_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_4409_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_44010_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_44011_of94l_"]').attr("disabled", false);
                container.find('[id^="_44012_of94l_"]').attr("disabled", false);
                container.find('[id^="_44013_of94t_"]').attr("disabled", true).val("");
                container.find('[id^="_44014_of94t_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "t") {
                container.find('#div_of94b_c' + suffix + ', #div_of94c_c' + suffix + ', #div_of94f_c' + suffix + ', #div_of94l_c' + suffix).hide();
                container.find('#div_of94t_c' + suffix).show();
                container.find('[id^="_440_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4401_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4402_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4403_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4404_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4405_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4406_of94c_"]').attr("disabled", true).val("");
                container.find('[id^="_4407_of94c_"]').attr("disabled", true).val("");
                container.find('[id^="_4408_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_4409_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_44010_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_44011_of94l_"]').attr("disabled", true).val("");
                container.find('[id^="_44012_of94l_"]').attr("disabled", true).val("");
                container.find('[id^="_44013_of94t_"]').attr("disabled", false);
                container.find('[id^="_44014_of94t_"]').attr("disabled", false);
            } else {
                container.find('#div_of94b_c' + suffix + ', #div_of94c_c' + suffix + ', #div_of94f_c' + suffix + ', #div_of94l_c' + suffix + ', #div_of94t_c' + suffix).hide();
                container.find('[id^="_440_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4401_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4402_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4403_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4404_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4405_of94b_"]').attr("disabled", true).val("");
                container.find('[id^="_4406_of94c_"]').attr("disabled", true).val("");
                container.find('[id^="_4407_of94c_"]').attr("disabled", true).val("");
                container.find('[id^="_4408_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_4409_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_44010_of94f_"]').attr("disabled", true).val("");
                container.find('[id^="_44011_of94l_"]').attr("disabled", true).val("");
                container.find('[id^="_44012_of94l_"]').attr("disabled", true).val("");
                container.find('[id^="_44013_of94t_"]').attr("disabled", true).val("");
                container.find('[id^="_44014_of94t_"]').attr("disabled", true).val("");
            }
        });
        
        // OF94B Data Source Scheme Checkbox
        $(document).on('change', '[id^="check_of94b_data_source_scheme_c"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            
            if ($(this).is(":checked")) {
                container.find('[id^="div_opt_of94b_data_source_scheme_c"]').show();
                container.find('[id^="_4401_of94b_data_source_scheme_c"]').attr("disabled", false);
            } else {
                container.find('[id^="div_opt_of94b_data_source_scheme_c"]').hide();
                container.find('[id^="_4401_of94b_data_source_scheme_c"]').attr("disabled", true).val("");
            }
        });
        
        //========================================
        // SUBSEQUENCE C1 EVENT HANDLERS
        //========================================
        
        // OF13B - Lot Number Checkbox (C1)
        $(document).on('change', '[id^="check_of13b_c1"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            
            if ($(this).is(":checked")) {
                container.find('[id^="div_opt_of13b_c1"]').show();
                container.find('[id^="_460_of13b_qualifier_c1"]').attr("disabled", false);
                container.find('[id^="div_opt_of13b_data_source_scheme_c1"]').show();
                container.find('[id^="_4601_of13b_data_source_scheme_c1"]').attr("disabled", false);
                container.find('[id^="_4602_of13b_slash_c1"]').attr("disabled", false);
                container.find('[id^="_4603_of13b_number_c1"]').attr("disabled", false);
            } else {
                container.find('[id^="div_opt_of13b_c1"]').hide();
                container.find('[id^="_460_of13b_"]').attr("disabled", true).val("");
                container.find('[id^="_4601_of13b_"]').attr("disabled", true).val("");
                container.find('[id^="_4602_of13b_"]').attr("disabled", true).val("");
                container.find('[id^="_4603_of13b_"]').attr("disabled", true).val("");
            }
        });
        
        // OF36A - Quantity in the Lot Checkbox (C1)
        $(document).on('change', '[id^="check_of36a_c1"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            
            if ($(this).is(":checked")) {
                container.find('[id^="div_opt_of36a_c1"]').show();
                container.find('[id^="type_of36_c1"]').attr("disabled", false);
            } else {
                container.find('[id^="div_opt_of36a_c1"]').hide();
                container.find('[id^="div_of36b_c1"]').hide();
                container.find('[id^="div_of36d_c1"]').hide();
                container.find('[id^="type_of36_c1"]').attr("disabled", true).val("");
                container.find('[id^="_470_of36b_"]').attr("disabled", true).val("");
                container.find('[id^="_4701_of36b_"]').attr("disabled", true).val("");
                container.find('[id^="_4702_of36b_"]').attr("disabled", true).val("");
                container.find('[id^="_4703_of36d_"]').attr("disabled", true).val("");
                container.find('[id^="_4704_of36d_"]').attr("disabled", true).val("");
                container.find('[id^="_4705_of36d_"]').attr("disabled", true).val("");
            }
        });
        
        // OF36A Type Change Handler (C1)
        $(document).on('change', '[id^="type_of36_c1"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            let suffix = "";
            if (container.attr('id')) {
                let match = container.attr('id').match(/_(\d+)$/);
                suffix = match ? "_" + match[1] : "";
            }
            
            if ($(this).val() == "b") {
                container.find('#div_of36b_c1' + suffix).show();
                container.find('#div_of36d_c1' + suffix).hide();
                container.find('[id^="_470_of36b_"]').attr("disabled", false);
                container.find('[id^="_4701_of36b_"]').attr("disabled", false);
                container.find('[id^="_4702_of36b_"]').attr("disabled", false);
                container.find('[id^="_4703_of36d_"]').attr("disabled", true).val("");
                container.find('[id^="_4704_of36d_"]').attr("disabled", true).val("");
                container.find('[id^="_4705_of36d_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "d") {
                container.find('#div_of36b_c1' + suffix).hide();
                container.find('#div_of36d_c1' + suffix).show();
                container.find('[id^="_470_of36b_"]').attr("disabled", true).val("");
                container.find('[id^="_4701_of36b_"]').attr("disabled", true).val("");
                container.find('[id^="_4702_of36b_"]').attr("disabled", true).val("");
                container.find('[id^="_4703_of36d_"]').attr("disabled", false);
                container.find('[id^="_4704_of36d_"]').attr("disabled", false);
                container.find('[id^="_4705_of36d_"]').attr("disabled", false);
            } else {
                container.find('#div_of36b_c1' + suffix + ', #div_of36d_c1' + suffix).hide();
                container.find('[id^="_470_of36b_"]').attr("disabled", true).val("");
                container.find('[id^="_4701_of36b_"]').attr("disabled", true).val("");
                container.find('[id^="_4702_of36b_"]').attr("disabled", true).val("");
                container.find('[id^="_4703_of36d_"]').attr("disabled", true).val("");
                container.find('[id^="_4704_of36d_"]').attr("disabled", true).val("");
                container.find('[id^="_4705_of36d_"]').attr("disabled", true).val("");
            }
        });
        
        // OF98A - Lot Date/Time Checkbox (C1)
        $(document).on('change', '[id^="check_of98a_c1"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            
            if ($(this).is(":checked")) {
                container.find('[id^="div_opt_of98a_c1"]').show();
                container.find('[id^="type_of98_c1"]').attr("disabled", false);
            } else {
                container.find('[id^="div_opt_of98a_c1"]').hide();
                container.find('[id^="div_of98a_c1"]').hide();
                container.find('[id^="div_of98c_c1"]').hide();
                container.find('[id^="div_of98e_c1"]').hide();
                container.find('[id^="div_opt_of98e_decimals_c1"]').hide();
                container.find('[id^="div_opt_of98e_utc_indicator_c1"]').hide();
                container.find('[id^="type_of98_c1"]').attr("disabled", true).val("");
                container.find('[id^="_480_of98a_"]').attr("disabled", true).val("");
                container.find('[id^="_4801_of98a_"]').attr("disabled", true).val("");
                container.find('[id^="_4802_of98c_"]').attr("disabled", true).val("");
                container.find('[id^="_4803_of98c_"]').attr("disabled", true).val("");
                container.find('[id^="_4804_of98c_"]').attr("disabled", true).val("");
                container.find('[id^="_4805_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4806_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4807_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4808_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4809_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_48010_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_48011_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="check_of98e_decimals_c1"]').prop("checked", false);
                container.find('[id^="check_of98e_utc_indicator_c1"]').prop("checked", false);
            }
        });
        
        // OF98A Type Change Handler (C1)
        $(document).on('change', '[id^="type_of98_c1"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            let suffix = "";
            if (container.attr('id')) {
                let match = container.attr('id').match(/_(\d+)$/);
                suffix = match ? "_" + match[1] : "";
            }
            
            if ($(this).val() == "a") {
                container.find('#div_of98a_c1' + suffix).show();
                container.find('#div_of98c_c1' + suffix + ', #div_of98e_c1' + suffix).hide();
                container.find('[id^="div_opt_of98e_decimals_c1"]').hide();
                container.find('[id^="div_opt_of98e_utc_indicator_c1"]').hide();
                container.find('[id^="_480_of98a_"]').attr("disabled", false);
                container.find('[id^="_4801_of98a_"]').attr("disabled", false);
                container.find('[id^="_4802_of98c_"]').attr("disabled", true).val("");
                container.find('[id^="_4803_of98c_"]').attr("disabled", true).val("");
                container.find('[id^="_4804_of98c_"]').attr("disabled", true).val("");
                container.find('[id^="_4805_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4806_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4807_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4808_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4809_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_48010_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_48011_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="check_of98e_decimals_c1"]').attr("disabled", true).prop("checked", false);
                container.find('[id^="check_of98e_utc_indicator_c1"]').attr("disabled", true).prop("checked", false);
            } else if ($(this).val() == "c") {
                container.find('#div_of98a_c1' + suffix + ', #div_of98e_c1' + suffix).hide();
                container.find('#div_of98c_c1' + suffix).show();
                container.find('[id^="div_opt_of98e_decimals_c1"]').hide();
                container.find('[id^="div_opt_of98e_utc_indicator_c1"]').hide();
                container.find('[id^="_480_of98a_"]').attr("disabled", true).val("");
                container.find('[id^="_4801_of98a_"]').attr("disabled", true).val("");
                container.find('[id^="_4802_of98c_"]').attr("disabled", false);
                container.find('[id^="_4803_of98c_"]').attr("disabled", false);
                container.find('[id^="_4804_of98c_"]').attr("disabled", false);
                container.find('[id^="_4805_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4806_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4807_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4808_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4809_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_48010_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_48011_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="check_of98e_decimals_c1"]').attr("disabled", true).prop("checked", false);
                container.find('[id^="check_of98e_utc_indicator_c1"]').attr("disabled", true).prop("checked", false);
            } else if ($(this).val() == "e") {
                container.find('#div_of98a_c1' + suffix + ', #div_of98c_c1' + suffix).hide();
                container.find('#div_of98e_c1' + suffix).show();
                container.find('[id^="_480_of98a_"]').attr("disabled", true).val("");
                container.find('[id^="_4801_of98a_"]').attr("disabled", true).val("");
                container.find('[id^="_4802_of98c_"]').attr("disabled", true).val("");
                container.find('[id^="_4803_of98c_"]').attr("disabled", true).val("");
                container.find('[id^="_4804_of98c_"]').attr("disabled", true).val("");
                container.find('[id^="_4805_of98e_"]').attr("disabled", false);
                container.find('[id^="_4806_of98e_"]').attr("disabled", false);
                container.find('[id^="_4807_of98e_"]').attr("disabled", false);
                container.find('[id^="check_of98e_decimals_c1"]').attr("disabled", false);
                container.find('[id^="check_of98e_utc_indicator_c1"]').attr("disabled", false);
            } else {
                container.find('#div_of98a_c1' + suffix + ', #div_of98c_c1' + suffix + ', #div_of98e_c1' + suffix).hide();
                container.find('[id^="div_opt_of98e_decimals_c1"]').hide();
                container.find('[id^="div_opt_of98e_utc_indicator_c1"]').hide();
                container.find('[id^="_480_of98a_"]').attr("disabled", true).val("");
                container.find('[id^="_4801_of98a_"]').attr("disabled", true).val("");
                container.find('[id^="_4802_of98c_"]').attr("disabled", true).val("");
                container.find('[id^="_4803_of98c_"]').attr("disabled", true).val("");
                container.find('[id^="_4804_of98c_"]').attr("disabled", true).val("");
                container.find('[id^="_4805_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4806_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4807_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4808_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_4809_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_48010_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="_48011_of98e_"]').attr("disabled", true).val("");
                container.find('[id^="check_of98e_decimals_c1"]').attr("disabled", true).prop("checked", false);
                container.find('[id^="check_of98e_utc_indicator_c1"]').attr("disabled", true).prop("checked", false);
            }
        });
        
        // OF98E Decimals Checkbox (C1)
        $(document).on('change', '[id^="check_of98e_decimals_c1"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            
            if ($(this).is(":checked")) {
                container.find('[id^="div_opt_of98e_decimals_c1"]').show();
                container.find('[id^="_4808_of98e_comma_c1"]').attr("disabled", false);
                container.find('[id^="_4809_of98e_decimals_c1"]').attr("disabled", false);
            } else {
                container.find('[id^="div_opt_of98e_decimals_c1"]').hide();
                container.find('[id^="_4808_of98e_comma_c1"]').attr("disabled", true).val("");
                container.find('[id^="_4809_of98e_decimals_c1"]').attr("disabled", true).val("");
            }
        });
        
        // OF98E UTC Indicator Checkbox (C1)
        $(document).on('change', '[id^="check_of98e_utc_indicator_c1"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            
            if ($(this).is(":checked")) {
                container.find('[id^="div_opt_of98e_utc_indicator_c1"]').show();
                container.find('[id^="_48010_of98e_slash_c1"]').attr("disabled", false);
                container.find('[id^="_48011_of98e_utc_indicator_c1"]').attr("disabled", false);
            } else {
                container.find('[id^="div_opt_of98e_utc_indicator_c1"]').hide();
                container.find('[id^="_48010_of98e_slash_c1"]').attr("disabled", true).val("");
                container.find('[id^="_48011_of98e_utc_indicator_c1"]').attr("disabled", true).val("");
            }
        });
        
        // OF90A - Book/Lot Price Checkbox (C1)
        $(document).on('change', '[id^="check_of90a_c1"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            
            if ($(this).is(":checked")) {
                container.find('[id^="div_opt_of90a_c1"]').show();
                container.find('[id^="type_of90_c1"]').attr("disabled", false);
            } else {
                container.find('[id^="div_opt_of90a_c1"]').hide();
                container.find('[id^="div_of90a_c1"]').hide();
                container.find('[id^="div_of90b_c1"]').hide();
                container.find('[id^="div_opt_of90a_sign_c1"]').hide();
                container.find('[id^="type_of90_c1"]').attr("disabled", true).val("");
                container.find('[id^="_490_of90a_"]').attr("disabled", true).val("");
                container.find('[id^="_4901_of90a_"]').attr("disabled", true).val("");
                container.find('[id^="_4902_of90a_"]').attr("disabled", true).val("");
                container.find('[id^="_4903_of90a_"]').attr("disabled", true).val("");
                container.find('[id^="_4904_of90b_"]').attr("disabled", true).val("");
                container.find('[id^="_4905_of90b_"]').attr("disabled", true).val("");
                container.find('[id^="_4906_of90b_"]').attr("disabled", true).val("");
                container.find('[id^="_4907_of90b_"]').attr("disabled", true).val("");
                container.find('[id^="check_of90a_sign_c1"]').prop("checked", false);
            }
        });
        
        // OF90A Type Change Handler (C1)
        $(document).on('change', '[id^="type_of90_c1"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            let suffix = "";
            if (container.attr('id')) {
                let match = container.attr('id').match(/_(\d+)$/);
                suffix = match ? "_" + match[1] : "";
            }
            
            if ($(this).val() == "a") {
                container.find('#div_of90a_c1' + suffix).show();
                container.find('#div_of90b_c1' + suffix).hide();
                container.find('[id^="div_opt_of90a_sign_c1"]').show();
                container.find('[id^="_490_of90a_"]').attr("disabled", false);
                container.find('[id^="_4901_of90a_"]').attr("disabled", false);
                container.find('[id^="_4903_of90a_"]').attr("disabled", false);
                container.find('[id^="check_of90a_sign_c1"]').attr("disabled", false);
                container.find('[id^="_4904_of90b_"]').attr("disabled", true).val("");
                container.find('[id^="_4905_of90b_"]').attr("disabled", true).val("");
                container.find('[id^="_4906_of90b_"]').attr("disabled", true).val("");
                container.find('[id^="_4907_of90b_"]').attr("disabled", true).val("");
            } else if ($(this).val() == "b") {
                container.find('#div_of90a_c1' + suffix).hide();
                container.find('#div_of90b_c1' + suffix).show();
                container.find('[id^="div_opt_of90a_sign_c1"]').hide();
                container.find('[id^="_490_of90a_"]').attr("disabled", true).val("");
                container.find('[id^="_4901_of90a_"]').attr("disabled", true).val("");
                container.find('[id^="_4902_of90a_"]').attr("disabled", true).val("");
                container.find('[id^="_4903_of90a_"]').attr("disabled", true).val("");
                container.find('[id^="check_of90a_sign_c1"]').attr("disabled", true).prop("checked", false);
                container.find('[id^="_4904_of90b_"]').attr("disabled", false);
                container.find('[id^="_4905_of90b_"]').attr("disabled", false);
                container.find('[id^="_4906_of90b_"]').attr("disabled", false);
                container.find('[id^="_4907_of90b_"]').attr("disabled", false);
            } else {
                container.find('#div_of90a_c1' + suffix + ', #div_of90b_c1' + suffix).hide();
                container.find('[id^="div_opt_of90a_sign_c1"]').hide();
                container.find('[id^="_490_of90a_"]').attr("disabled", true).val("");
                container.find('[id^="_4901_of90a_"]').attr("disabled", true).val("");
                container.find('[id^="_4902_of90a_"]').attr("disabled", true).val("");
                container.find('[id^="_4903_of90a_"]').attr("disabled", true).val("");
                container.find('[id^="check_of90a_sign_c1"]').attr("disabled", true).prop("checked", false);
                container.find('[id^="_4904_of90b_"]').attr("disabled", true).val("");
                container.find('[id^="_4905_of90b_"]').attr("disabled", true).val("");
                container.find('[id^="_4906_of90b_"]').attr("disabled", true).val("");
                container.find('[id^="_4907_of90b_"]').attr("disabled", true).val("");
            }
        });
        
        // OF90A Sign Checkbox (C1)
        $(document).on('change', '[id^="check_of90a_sign_c1"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            
            if ($(this).is(":checked")) {
                container.find('[id^="div_opt_of90a_sign_c1"]').show();
                container.find('[id^="_4902_of90a_sign_c1"]').attr("disabled", false);
            } else {
                container.find('[id^="div_opt_of90a_sign_c1"]').hide();
                container.find('[id^="_4902_of90a_sign_c1"]').attr("disabled", true).val("");
            }
        });
        
        // OF22F - Type of Price Indicator Checkbox (C1)
        $(document).on('change', '[id^="check_of22f_c1"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            
            if ($(this).is(":checked")) {
                container.find('[id^="div_opt_of22f_c1"]').show();
                container.find('[id^="_500_of22f_qualifier_c1"]').attr("disabled", false);
                container.find('[id^="_5002_of22f_slash_c1"]').attr("disabled", false);
                container.find('[id^="_5003_of22f_indicator_c1"]').attr("disabled", false);
                container.find('[id^="check_of22f_data_source_scheme_c1"]').attr("disabled", false);
            } else {
                container.find('[id^="div_opt_of22f_c1"]').hide();
                container.find('[id^="div_opt_of22f_data_source_scheme_c1"]').hide();
                container.find('[id^="_500_of22f_"]').attr("disabled", true).val("");
                container.find('[id^="_5001_of22f_"]').attr("disabled", true).val("");
                container.find('[id^="_5002_of22f_"]').attr("disabled", true).val("");
                container.find('[id^="_5003_of22f_"]').attr("disabled", true).val("");
                container.find('[id^="check_of22f_data_source_scheme_c1"]').attr("disabled", true).prop("checked", false);
            }
        });
        
        // OF22F Data Source Scheme Checkbox (C1)
        $(document).on('change', '[id^="check_of22f_data_source_scheme_c1"]', function() {
            let container = $(this).closest('.template_container, [id^="container_item_"]');
            
            if ($(this).is(":checked")) {
                container.find('[id^="div_opt_of22f_data_source_scheme_c1"]').show();
                container.find('[id^="_5001_of22f_data_source_scheme_c1"]').attr("disabled", false);
            } else {
                container.find('[id^="div_opt_of22f_data_source_scheme_c1"]').hide();
                container.find('[id^="_5001_of22f_data_source_scheme_c1"]').attr("disabled", true).val("");
            }
        });
        
    });
</script>

<!-- VIEW MODE INITIALIZATION -->
<script language="javascript">
    $(document).ready(function() {
        
        //========================================
        // MF36A - View Mode
        //========================================
        if ($("#_3902_mf36b_quantity_c").val() != "") {
            $("#type_mf36_c").val("b").attr("disabled", false);
            $("#div_mf36b_c").show();
            $("#_390_mf36b_qualifier_c, #_3901_mf36b_quantity_type_code_c, #_3902_mf36b_quantity_c").attr("disabled", false);
        } else if ($("#_3905_mf36d_quantity_c").val() != "") {
            $("#type_mf36_c").val("d").attr("disabled", false);
            $("#div_mf36d_c").show();
            $("#_3903_mf36d_qualifier_c, #_3904_mf36d_quantity_type_code_c, #_3905_mf36d_quantity_c").attr("disabled", false);
        }
        
        //========================================
        // OF70D - View Mode (Always visible, no checkbox)
        //========================================
        // Already enabled in initial setup
        
        //========================================
        // OF13B - Certificate Number View Mode
        //========================================
        if ($("#_4103_of13b_number_c").val() != "") {
            $("#div_opt_of13b_c").show();
            $("#_410_of13b_qualifier_c, _4102_of13b_slash_c, #_4103_of13b_number_c").attr("disabled", false);
            if ($("#_4101_of13b_data_source_scheme_c").val() != "") {
                $("#div_opt_of13b_data_source_scheme_c").show();
                $("#_4101_of13b_data_source_scheme_c").attr("disabled", false);
            }
        }
        
        //========================================
        // OF95A - Party View Mode
        //========================================
        if ($("#_4201_of95l_legal_entity_identifier_c").val() != "") {
            $("#type_of95_c").val("l").attr("disabled", false);
            $("#div_of95l_c").show();
            $("#_420_of95l_qualifier_c, #_4201_of95l_legal_entity_identifier_c").attr("disabled", false);
        } else if ($("#_4203_of95p_identifier_code_c").val() != "") {
            $("#type_of95_c").val("p").attr("disabled", false);
            $("#div_of95p_c").show();
            $("#_4202_of95p_qualifier_c, #_4203_of95p_identifier_code_c").attr("disabled", false);
        } else if ($("#_4207_of95r_proprietary_code_c").val() != "") {
            $("#type_of95_c").val("r").attr("disabled", false);
            $("#div_of95r_c").show();
            $("#_4204_of95r_qualifier_c, #_4205_of95r_data_source_scheme_c").attr("disabled", false);
            $("#_4206_of95r_slash_c, #_4207_of95r_proprietary_code_c").attr("disabled", false);
        }
        
        //========================================
        // MF97A - View Mode
        //========================================
        if ($("#_4301_mf97a_account_number_c").val() != "") {
            $("#type_mf97_c").val("a").attr("disabled", false);
            $("#div_mf97a_c").show();
            $("#_430_mf97a_qualifier_c, #_4301_mf97a_account_number_c").attr("disabled", false);
        } else if ($("#_4307_mf97b_account_number_c").val() != "") {
            $("#type_mf97_c").val("b").attr("disabled", false);
            $("#div_mf97b_c").show();
            $("#_4302_mf97b_qualifier_c, #_4305_mf97b_account_type_code_c").attr("disabled", false);
            $("#_4304_mf97b_slash_c, #_4306_mf97b_slash2_c, #_4307_mf97b_account_number_c").attr("disabled", false);
            
            if ($("#_4303_mf97b_data_source_scheme_c").val() != "") {
                $("#div_opt_mf97b_data_source_scheme_c").show();
                $("#_4303_mf97b_data_source_scheme_c").attr("disabled", false);
            }
        } else if ($("#_43011_mf97d_blockchain_wallet_c").val() != "") {
            $("#type_mf97_c").val("d").attr("disabled", false);
            $("#div_mf97d_c").show();
            $("#_4308_mf97d_qualifier_c, #_43010_mf97d_slash_c, #_43011_mf97d_blockchain_wallet_c").attr("disabled", false);
            
            if ($("#_4309_mf97d_data_source_scheme_c").val() != "") {
                $("#check_mf97d_data_source_scheme_c").prop("checked", true);
                $("#div_opt_mf97d_data_source_scheme_c").show();
                $("#_4309_mf97d_data_source_scheme_c").attr("disabled", false);
            }
        } else if ($("#_43013_mf97e_account_number_c").val() != "") {
            $("#type_mf97_c").val("e").attr("disabled", false);
            $("#div_mf97e_c").show();
            $("#_43012_mf97e_qualifier_c, #_43013_mf97e_account_number_c").attr("disabled", false);
        }
        
        //========================================
        // OF94A - Place of Safekeeping View Mode
        //========================================
        if ($("#_4403_of94b_place_code_c").val() != "") {
            $("#type_of94_c").val("b").attr("disabled", false);
            $("#div_of94b_c").show();
            $("#_440_of94b_qualifier_c, #_4402_of94b_slash_c, #_4403_of94b_place_code_c").attr("disabled", false);
            
            if ($("#_4401_of94b_data_source_scheme_c").val() != "") {
                $("#check_of94b_data_source_scheme_c").prop("checked", true);
                $("#div_opt_of94b_data_source_scheme_c").show();
                $("#_4401_of94b_data_source_scheme_c").attr("disabled", false);
            }
            
            if ($("#_4405_of94b_narrative_c").val() != "") {
                $("#div_opt_of94b_narrative_c").show();
                $("#_4404_of94b_slash2_c, #_4405_of94b_narrative_c").attr("disabled", false);
            }
        } else if ($("#_4407_of94c_country_code_c").val() != "") {
            $("#type_of94_c").val("c").attr("disabled", false);
            $("#div_of94c_c").show();
            $("#_4406_of94c_qualifier_c, #_4407_of94c_country_code_c").attr("disabled", false);
        } else if ($("#_44010_of94f_identifier_code_c").val() != "") {
            $("#type_of94_c").val("f").attr("disabled", false);
            $("#div_of94f_c").show();
            $("#_4408_of94f_qualifier_c, #_4409_of94f_place_code_c, #_44010_of94f_identifier_code_c").attr("disabled", false);
        } else if ($("#_44012_of94l_legal_entity_identifier_c").val() != "") {
            $("#type_of94_c").val("l").attr("disabled", false);
            $("#div_of94l_c").show();
            $("#_44011_of94l_qualifier_c, #_44012_of94l_legal_entity_identifier_c").attr("disabled", false);
        } else if ($("#_44014_of94t_digital_ledger_identifier_c").val() != "") {
            $("#type_of94_c").val("t").attr("disabled", false);
            $("#div_of94t_c").show();
            $("#_44013_of94t_qualifier_c, #_44014_of94t_digital_ledger_identifier_c").attr("disabled", false);
        }
        
    });
</script>

<!-- ADD CONTAINER FUNCTIONS -->
<script type="text/javascript">
    // Function to add repetitive containers (MF36A, OF13B, OF95A, MF97A, OF94A)
    function addContainer(button) {
        let dataId = $(button).data("id");
        let currentCount = parseInt($(button).data("count"));
        let maxOcc = $("#max_occ_" + dataId).text();
        
        if (maxOcc !== "-" && maxOcc !== "unbounded") {
            let maxOccNum = parseInt(maxOcc);
            if (currentCount >= maxOccNum) {
                alert("Maximum occurrence reached: " + maxOccNum);
                return;
            }
        }
        
        currentCount++;
        $(button).data("count", currentCount);
        $("#cur_occ_" + dataId).text(currentCount);
        
        let template = $("#template_" + dataId).clone();
        template.attr("id", "container_item_" + dataId + "_" + currentCount);
        template.removeClass("template_container");
        template.css("display", "block");
        
        // Update all IDs and names with suffix
        template.find("[id]").each(function() {
            let oldId = $(this).attr("id");
            let newId = oldId + "_" + currentCount;
            $(this).attr("id", newId);
        });
        
        template.find("[name]").each(function() {
            let oldName = $(this).attr("name");
            let newName = oldName + "_" + currentCount;
            $(this).attr("name", newName);
        });
        
        // Update label count
        template.find('[id*="label_count_"]').text("Count: " + currentCount);
        
        // Enable and setup remove button
        template.find(".remove-btn").attr("disabled", false).click(function() {
            template.remove();
            currentCount--;
            $(button).data("count", currentCount);
            $("#cur_occ_" + dataId).text(currentCount);
        });
        
        // Enable type selectors
        template.find('select[id^="type_"]').attr("disabled", false);
        
        // For OF13B (Certificate Number) - enable fields directly (no checkbox in Seq C)
        if (dataId === "of13b_c") {
            template.find('[id^="div_opt_of13b_c"]').show();
            template.find('[id^="_410_of13b_qualifier_c"]').attr("disabled", false);
            template.find('[id^="div_opt_of13b_data_source_scheme_c"]').show();
            template.find('[id^="_4101_of13b_data_source_scheme_c"]').attr("disabled", false);
            template.find('[id^="_4102_of13b_slash_c"]').attr("disabled", false);
            template.find('[id^="_4103_of13b_number_c"]').attr("disabled", false);
        }
        
        // Insert before container
        template.insertBefore("#container_" + dataId);
        
        // Apply validation rules dynamically
        applyDynamicValidation(template, dataId, currentCount);
    }
    
    // Function to add C1 template containers
    function addTemplateContainer(button) {
        let dataId = $(button).data("id");
        let currentCount = parseInt($(button).data("count"));
        let maxOcc = $("#max_occ_" + dataId).text();
        
        if (maxOcc !== "-" && maxOcc !== "unbounded") {
            let maxOccNum = parseInt(maxOcc);
            if (currentCount >= maxOccNum) {
                alert("Maximum occurrence reached: " + maxOccNum);
                return;
            }
        }
        
        currentCount++;
        $(button).data("count", currentCount);
        $("#cur_occ_" + dataId).text(currentCount);
        
        let template = $("#template_" + dataId).clone();
        template.attr("id", "container_item_" + dataId + "_" + currentCount);
        template.removeClass("template_container");
        template.css("display", "block");
        
        // Update all IDs and names with suffix
        template.find("[id]").each(function() {
            let oldId = $(this).attr("id");
            let newId = oldId + "_" + currentCount;
            $(this).attr("id", newId);
        });
        
        template.find("[name]").each(function() {
            let oldName = $(this).attr("name");
            let newName = oldName + "_" + currentCount;
            $(this).attr("name", newName);
        });
        
        // Update label count
        template.find('[id*="label_count_"]').text("Count: " + currentCount);
        
        // Enable and setup remove button
        template.find(".remove-btn").attr("disabled", false).click(function() {
            template.remove();
            currentCount--;
            $(button).data("count", currentCount);
            $("#cur_occ_" + dataId).text(currentCount);
        });
        
        // Enable checkboxes for C1 fields
        template.find('input[type="checkbox"].checkbox_div').attr("disabled", false);
        template.find('input[type="checkbox"].template_selection').attr("disabled", true);
        
        
        // Insert before container
        template.insertBefore("#container_" + dataId);
        
        // Apply validation rules dynamically
        applyDynamicValidation(template, dataId, currentCount);
    }
    
    // Function to apply dynamic validation
    function applyDynamicValidation(container, dataId, count) {
        let suffix = "_" + count;
        
        // Add validation rules based on field type
        if (dataId.includes("mf36a")) {
            // MF36A validation rules
            container.find('[id^="type_mf36_c"]').rules("add", {
                required: true,
                messages: {
                    required: "MF36A Type must be selected! This is a mandatory field."
                }
            });
            
            container.find('[id^="_3901_mf36b_quantity_type_code_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_mf36_c"]');
                    return typeField.val() === "b" && !typeField.is(':disabled');
                },
                messages: {
                    required: "MF36B Quantity Type Code must be selected when Option B is chosen!"
                }
            });
            
            container.find('[id^="_3902_mf36b_quantity_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_mf36_c"]');
                    return typeField.val() === "b" && !typeField.is(':disabled');
                },
                validDecimal: true,
                messages: {
                    required: "MF36B Quantity must be filled when Option B is chosen!"
                }
            });
            
            container.find('[id^="_3905_mf36d_quantity_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_mf36_c"]');
                    return typeField.val() === "d" && !typeField.is(':disabled');
                },
                validDecimal: true,
                messages: {
                    required: "MF36D Quantity of Digital Tokens must be filled when Option D is chosen!"
                }
            });
        }
        
        if (dataId.includes("of13b_c")) {
            // OF13B - Certificate Number validation rules
            container.find('[id^="_4103_of13b_number_c"]').rules("add", {
                required: function(element) {
                    return !$(element).is(':disabled');
                },
                messages: {
                    required: "OF13B Number must be filled!"
                }
            });
        }
        
        if (dataId.includes("of95a")) {
            // OF95A validation rules
            container.find('[id^="type_of95_c"]').rules("add", {
                required: false
            });
            
            container.find('[id^="_4201_of95l_legal_entity_identifier_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_of95_c"]');
                    return typeField.val() === "l" && !typeField.is(':disabled');
                },
                validLEI: true,
                validateC17Rule: true,
                messages: {
                    required: "OF95L Legal Entity Identifier must be filled when Option L is chosen!"
                }
            });
            
            container.find('[id^="_4203_of95p_identifier_code_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_of95_c"]');
                    return typeField.val() === "p" && !typeField.is(':disabled');
                },
                validBIC: true,
                validateC17Rule: true,
                messages: {
                    required: "OF95P Identifier Code must be filled when Option P is chosen!"
                }
            });
            
            container.find('[id^="_4205_of95r_data_source_scheme_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_of95_c"]');
                    return typeField.val() === "r" && !typeField.is(':disabled');
                },
                messages: {
                    required: "OF95R Data Source Scheme must be filled when Option R is chosen!"
                }
            });
            
            container.find('[id^="_4207_of95r_proprietary_code_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_of95_c"]');
                    return typeField.val() === "r" && !typeField.is(':disabled');
                },
                validateC17Rule: true,
                messages: {
                    required: "OF95R Proprietary Code must be filled when Option R is chosen!"
                }
            });
        }
        
        if (dataId.includes("mf97a")) {
            // MF97A validation rules
            container.find('[id^="type_mf97_c"]').rules("add", {
                required: true,
                messages: {
                    required: "MF97A Account Type must be selected! This is a mandatory field."
                }
            });
        }
        
        if (dataId.includes("of94a")) {
            // OF94A validation rules
            container.find('[id^="type_of94_c"]').rules("add", {
                required: false,
                validateC18Rule: true
            });
            
            container.find('[id^="_4403_of94b_place_code_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_of94_c"]');
                    return typeField.val() === "b" && !typeField.is(':disabled');
                },
                messages: {
                    required: "OF94B Place Code must be filled when Option B is chosen!"
                }
            });
            
            container.find('[id^="_4407_of94c_country_code_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_of94_c"]');
                    return typeField.val() === "c" && !typeField.is(':disabled');
                },
                validCountryCode: true,
                messages: {
                    required: "OF94C Country Code must be filled when Option C is chosen!"
                }
            });
            
            container.find('[id^="_4409_of94f_place_code_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_of94_c"]');
                    return typeField.val() === "f" && !typeField.is(':disabled');
                },
                messages: {
                    required: "OF94F Place Code must be selected when Option F is chosen!"
                }
            });
            
            container.find('[id^="_44010_of94f_identifier_code_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_of94_c"]');
                    return typeField.val() === "f" && !typeField.is(':disabled');
                },
                validBIC: true,
                messages: {
                    required: "OF94F Identifier Code must be filled when Option F is chosen!"
                }
            });
            
            container.find('[id^="_44012_of94l_legal_entity_identifier_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_of94_c"]');
                    return typeField.val() === "l" && !typeField.is(':disabled');
                },
                validLEI: true,
                messages: {
                    required: "OF94L Legal Entity Identifier must be filled when Option L is chosen!"
                }
            });
            
            container.find('[id^="_44014_of94t_digital_ledger_identifier_c"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let typeField = cont.find('[id^="type_of94_c"]');
                    return typeField.val() === "t" && !typeField.is(':disabled');
                },
                validDigitalLedger: true,
                messages: {
                    required: "OF94T Digital Ledger Identifier must be filled when Option T is chosen!"
                }
            });
        }
        
        if (dataId.includes("c1")) {
            // C1 subsequence validation rules
            container.find('[id^="_4603_of13b_number_c1"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let checkbox = cont.find('[id^="check_of13b_c1"]');
                    return checkbox.is(":checked") && !$(element).is(':disabled');
                },
                messages: {
                    required: "OF13B Number must be filled when Lot Number is selected!"
                }
            });
            
            // OF36A validation for C1
            container.find('[id^="_4701_of36b_quantity_type_code_c1"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let checkbox = cont.find('[id^="check_of36a_c1"]');
                    let typeField = cont.find('[id^="type_of36_c1"]');
                    return checkbox.is(":checked") && typeField.val() === "b" && !$(element).is(':disabled');
                },
                messages: {
                    required: "OF36B Quantity Type Code must be selected when Option B is chosen!"
                }
            });
            
            container.find('[id^="_4702_of36b_quantity_c1"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let checkbox = cont.find('[id^="check_of36a_c1"]');
                    let typeField = cont.find('[id^="type_of36_c1"]');
                    return checkbox.is(":checked") && typeField.val() === "b" && !$(element).is(':disabled');
                },
                validDecimal: true,
                messages: {
                    required: "OF36B Quantity must be filled when Option B is chosen!"
                }
            });
            
            container.find('[id^="_4705_of36d_quantity_c1"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let checkbox = cont.find('[id^="check_of36a_c1"]');
                    let typeField = cont.find('[id^="type_of36_c1"]');
                    return checkbox.is(":checked") && typeField.val() === "d" && !$(element).is(':disabled');
                },
                validDecimal: true,
                messages: {
                    required: "OF36D Quantity of Digital Tokens must be filled when Option D is chosen!"
                }
            });
            
            // OF98A validation for C1
            container.find('[id^="_4801_of98a_date_c1"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let checkbox = cont.find('[id^="check_of98a_c1"]');
                    let typeField = cont.find('[id^="type_of98_c1"]');
                    return checkbox.is(":checked") && typeField.val() === "a" && !$(element).is(':disabled');
                },
                validDate: true,
                messages: {
                    required: "OF98A Date must be filled when Option A is chosen!"
                }
            });
            
            // OF90A validation for C1
            container.find('[id^="_4901_of90a_percentage_type_code_c1"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let checkbox = cont.find('[id^="check_of90a_c1"]');
                    let typeField = cont.find('[id^="type_of90_c1"]');
                    return checkbox.is(":checked") && typeField.val() === "a" && !$(element).is(':disabled');
                },
                messages: {
                    required: "OF90A Percentage Type Code must be selected when Option A is chosen!"
                }
            });
            
            // OF22F validation for C1
            container.find('[id^="_5003_of22f_indicator_c1"]').rules("add", {
                required: function(element) {
                    let cont = $(element).closest('.template_container, [id^="container_item_"]');
                    let checkbox = cont.find('[id^="check_of22f_c1"]');
                    return checkbox.is(":checked") && !$(element).is(':disabled');
                },
                messages: {
                    required: "OF22F Indicator must be filled when Type of Price Indicator is selected!"
                }
            });
        }
    }
</script>

<!--SEQUENCE D-->
<script type="text/javascript">
    $(document).ready(function(){
        
        //========================================
        // SEQUENCE D - FIELD VISIBILITY CONTROLS
        //========================================
        
        // Main Sequence D checkbox control
        // PERBAIKAN #1: Hide div_opt_d saat page load
        $("#div_opt_d").hide();
        
        // Disable all Sequence D fields initially
        $("#_6001_of70c_d_narrative").attr("disabled", true);
        
        // Disable all Add buttons in Sequence D
        $("#container_of98a_d .cust-btn").attr("disabled", true);
        $("#container_of22f_d .cust-btn").attr("disabled", true);
        $("#container_of20c_d .cust-btn").attr("disabled", true);
        $("#container_of92a_d .cust-btn").attr("disabled", true);
        $("#container_of99b_d .cust-btn").attr("disabled", true);
        $("#container_of19a_d .cust-btn").attr("disabled", true);
        
        $("#check_d").click(function(){
            if ($(this).is(":checked")) {
                $("#div_opt_d").show();
                // Enable mandatory fields in Sequence D
                $("#_6001_of70c_d_narrative").attr("disabled", false);
                
                // Enable all Add buttons in Sequence D
                $("#container_of98a_d .cust-btn").attr("disabled", false);
                $("#container_of22f_d .cust-btn").attr("disabled", false);
                $("#container_of20c_d .cust-btn").attr("disabled", false);
                $("#container_of92a_d .cust-btn").attr("disabled", false);
                $("#container_of99b_d .cust-btn").attr("disabled", false);
                $("#container_of19a_d .cust-btn").attr("disabled", false);
            } else {
                $("#div_opt_d").hide();
                // Disable all fields in Sequence D
                $("#_6001_of70c_d_narrative").attr("disabled", true).val("");
                
                // Disable all Add buttons in Sequence D
                $("#container_of98a_d .cust-btn").attr("disabled", true);
                $("#container_of22f_d .cust-btn").attr("disabled", true);
                $("#container_of20c_d .cust-btn").attr("disabled", true);
                $("#container_of92a_d .cust-btn").attr("disabled", true);
                $("#container_of99b_d .cust-btn").attr("disabled", true);
                $("#container_of19a_d .cust-btn").attr("disabled", true);
                
                // Reset all dynamic containers
                $("[id^='container_item_of98a_d_']").remove();
                $("[id^='container_item_of22f_d_']").remove();
                $("[id^='container_item_of20c_d_']").remove();
                $("[id^='container_item_of92a_d_']").remove();
                $("[id^='container_item_of99b_d_']").remove();
                $("[id^='container_item_of19a_d_']").remove();
                
                // Reset counters
                $("[id^='cur_occ_of'][id$='_d']").text("0");
                $("#container_of98a_d .cust-btn").data("count", 0);
                $("#container_of22f_d .cust-btn").data("count", 0);
                $("#container_of20c_d .cust-btn").data("count", 0);
                $("#container_of92a_d .cust-btn").data("count", 0);
                $("#container_of99b_d .cust-btn").data("count", 0);
                $("#container_of19a_d .cust-btn").data("count", 0);
            }
        });
        
        //========================================
        // OF98A - Date/Time Type Selection
        //========================================
        function setupOF98AFields(container, suffix) {
            let typeSelect = container.find('[id$="type_of98_' + suffix + '"]');
            let divA = container.find('[id$="div_of98a_' + suffix + '"]');
            let divB = container.find('[id$="div_of98b_' + suffix + '"]');
            let divC = container.find('[id$="div_of98c_' + suffix + '"]');
            
            divA.hide();
            divB.hide();
            divC.hide();
            
            // Disable all fields initially
            container.find('[id*="_of98a_"]').attr("disabled", true);
            container.find('[id*="_of98b_"]').attr("disabled", true);
            container.find('[id*="_of98c_"]').attr("disabled", true);
            
            typeSelect.attr("disabled", false);
            
            typeSelect.change(function() {
                divA.hide();
                divB.hide();
                divC.hide();
                
                if ($(this).val() === "a") {
                    divA.show();
                    container.find('[id*="_of98a_"]').attr("disabled", false);
                    container.find('[id*="_of98b_"]').attr("disabled", true).val("");
                    container.find('[id*="_of98c_"]').attr("disabled", true).val("");
                } else if ($(this).val() === "b") {
                    divB.show();
                    container.find('[id*="_of98a_"]').attr("disabled", true).val("");
                    container.find('[id*="_of98b_"]').attr("disabled", false);
                    container.find('[id*="_of98c_"]').attr("disabled", true).val("");
                    
                    // Handle optional Data Source Scheme checkbox
                    let checkDSS = container.find('[id*="check_of98b_data_source_scheme"]');
                    let divDSS = container.find('[id*="div_opt_of98b_data_source_scheme"]');
                    divDSS.hide();
                    
                    checkDSS.click(function() {
                        if ($(this).is(":checked")) {
                            divDSS.show();
                            container.find('[id*="_5403_of98b_data_source_scheme"]').attr("disabled", false);
                        } else {
                            divDSS.hide();
                            container.find('[id*="_5403_of98b_data_source_scheme"]').attr("disabled", true).val("");
                        }
                    });
                } else if ($(this).val() === "c") {
                    divC.show();
                    container.find('[id*="_of98a_"]').attr("disabled", true).val("");
                    container.find('[id*="_of98b_"]').attr("disabled", true).val("");
                    container.find('[id*="_of98c_"]').attr("disabled", false);
                } else {
                    container.find('[id*="_of98a_"]').attr("disabled", true).val("");
                    container.find('[id*="_of98b_"]').attr("disabled", true).val("");
                    container.find('[id*="_of98c_"]').attr("disabled", true).val("");
                }
            });
        }
        
        //========================================
        // OF22F - Indicator with Optional Data Source Scheme
        //========================================
        function setupOF22FFields(container, suffix) {
            let divDSS = container.find('[id*="div_opt_of22f_data_source_scheme"]');
            let checkDSS = container.find('[id*="check_of22f_data_source_scheme"]');
            
            divDSS.hide();
            
            checkDSS.click(function() {
                if ($(this).is(":checked")) {
                    divDSS.show();
                    container.find('[id*="_5501_of22f_d_data_source_scheme"]').attr("disabled", false);
                } else {
                    divDSS.hide();
                    container.find('[id*="_5501_of22f_d_data_source_scheme"]').attr("disabled", true).val("");
                }
            });
        }
        
        //========================================
        // OF20C - Reference with Optional Reference field
        //========================================
        function setupOF20CFields(container, suffix) {
            let checkRef = container.find('[id*="check_of20c_reference"]');
            let divRef = container.find('[id*="div_opt_of20c_reference"]');
            
            divRef.hide();
            
            checkRef.click(function() {
                if ($(this).is(":checked")) {
                    divRef.show();
                    container.find('[id*="_5601_of20c_d_reference"]').attr("disabled", false);
                } else {
                    divRef.hide();
                    container.find('[id*="_5601_of20c_d_reference"]').attr("disabled", true).val("");
                }
            });
        }
        
        //========================================
        // OF92A - Rate Type Selection
        //========================================
        function setupOF92AFields(container, suffix) {
            let typeSelect = container.find('[id$="type_of92_' + suffix + '"]');
            let divA = container.find('[id$="div_of92a_' + suffix + '"]');
            let divC = container.find('[id$="div_of92c_' + suffix + '"]');
            
            divA.hide();
            divC.hide();
            
            container.find('[id*="_of92a_"]').attr("disabled", true);
            container.find('[id*="_of92c_"]').attr("disabled", true);
            
            typeSelect.attr("disabled", false);
            
            typeSelect.change(function() {
                divA.hide();
                divC.hide();
                
                if ($(this).val() === "a") {
                    divA.show();
                    container.find('[id*="_570_of92a_"], [id*="_5702_of92a_"]').attr("disabled", false);
                    container.find('[id*="_of92c_"]').attr("disabled", true).val("");
                    
                    // Handle optional Sign checkbox
                    let checkSign = container.find('[id*="check_of92a_sign"]');
                    let divSign = container.find('[id*="div_opt_of92a_sign"]');
                    divSign.hide();
                    
                    checkSign.click(function() {
                        if ($(this).is(":checked")) {
                            divSign.show();
                            container.find('[id*="_5701_of92a_d_sign"]').attr("disabled", false);
                        } else {
                            divSign.hide();
                            container.find('[id*="_5701_of92a_d_sign"]').attr("disabled", true).val("");
                        }
                    });
                } else if ($(this).val() === "c") {
                    divC.show();
                    container.find('[id*="_of92a_"]').attr("disabled", true).val("");
                    container.find('[id*="_5703_of92c_"], [id*="_5704_of92c_"], [id*="_5706_of92c_"]').attr("disabled", false);
                } else {
                    container.find('[id*="_of92a_"]').attr("disabled", true).val("");
                    container.find('[id*="_of92c_"]').attr("disabled", true).val("");
                }
            });
        }
        
        //========================================
        // OF19A - Amount with Optional Sign
        //========================================
        function setupOF19AFields(container, suffix) {
            let checkSign = container.find('[id*="check_of19a_sign"]');
            let divSign = container.find('[id*="div_opt_of19a_sign"]');
            
            divSign.hide();
            
            checkSign.click(function() {
                if ($(this).is(":checked")) {
                    divSign.show();
                    container.find('[id*="_5901_of19a_sign"]').attr("disabled", false);
                } else {
                    divSign.hide();
                    container.find('[id*="_5901_of19a_sign"]').attr("disabled", true).val("");
                }
            });
        }
        
        //========================================
        // APPLY SETUP TO EXISTING AND NEW CONTAINERS
        //========================================
        $(document).on('DOMNodeInserted', function(e) {
            $('[id*="container_item_of98a_d"]').each(function() {
                if (!$(this).hasClass('setup-complete')) {
                    $(this).addClass('setup-complete');
                    setupOF98AFields($(this), "d");
                }
            });
            
            $('[id*="container_item_of22f_d"]').each(function() {
                if (!$(this).hasClass('setup-complete')) {
                    $(this).addClass('setup-complete');
                    setupOF22FFields($(this), "d");
                }
            });
            
            $('[id*="container_item_of20c_d"]').each(function() {
                if (!$(this).hasClass('setup-complete')) {
                    $(this).addClass('setup-complete');
                    setupOF20CFields($(this), "d");
                }
            });
            
            $('[id*="container_item_of92a_d"]').each(function() {
                if (!$(this).hasClass('setup-complete')) {
                    $(this).addClass('setup-complete');
                    setupOF92AFields($(this), "d");
                }
            });
            
            $('[id*="container_item_of19a_d"]').each(function() {
                if (!$(this).hasClass('setup-complete')) {
                    $(this).addClass('setup-complete');
                    setupOF19AFields($(this), "d");
                }
            });
        });
        
    });
</script>

<!-- Rule view mode for existing data -->
<script language="javascript">
    $(document).ready(function() {
        
        //========================================
        // VIEW MODE - SEQUENCE D
        // PERBAIKAN #1: Only show Sequence D if data exists
        //========================================
        
        let hasSequenceDData = false;
        
        // Check if any Sequence D field has data
        if ($("#_530_mf16r_d_start_of_block").val() != "" || 
            $("#_6001_of70c_d_narrative").val() != "") {
            hasSequenceDData = true;
        }
        
        // Check if any repetitive field has data
        if (!hasSequenceDData) {
            // Check OF98A
            $('[id^="_5401_of98a_date_d"]').each(function() {
                if ($(this).val() != "") {
                    hasSequenceDData = true;
                    return false;
                }
            });
        }
        
        if (!hasSequenceDData) {
            // Check OF22F
            $('[id^="_5503_of22f_d_indicator"]').each(function() {
                if ($(this).val() != "") {
                    hasSequenceDData = true;
                    return false;
                }
            });
        }
        
        if (!hasSequenceDData) {
            // Check OF20C
            $('[id^="_560_of20c_d_qualifier"]').each(function() {
                if ($(this).val() != "") {
                    hasSequenceDData = true;
                    return false;
                }
            });
        }
        
        if (!hasSequenceDData) {
            // Check OF92A
            $('[id^="_5702_of92a_d_rate"]').each(function() {
                if ($(this).val() != "") {
                    hasSequenceDData = true;
                    return false;
                }
            });
        }
        
        if (!hasSequenceDData) {
            // Check OF99B
            $('[id^="_5801_of99b_d_number"]').each(function() {
                if ($(this).val() != "") {
                    hasSequenceDData = true;
                    return false;
                }
            });
        }
        
        if (!hasSequenceDData) {
            // Check OF19A
            $('[id^="_5903_of19a_amount_d"]').each(function() {
                if ($(this).val() != "") {
                    hasSequenceDData = true;
                    return false;
                }
            });
        }
        
        // Only enable Sequence D if data exists
        if (hasSequenceDData) {
            $("#check_d").prop("checked", true).trigger("click");
            
            // Now setup view mode for existing data
            setupViewModeForSequenceD();
        }
        
        function setupViewModeForSequenceD() {
            //========================================
            // VIEW MODE - OF98A Date/Time
            //========================================
            $('[id*="template_of98a_d"]').each(function() {
                let container = $(this);
                
                // Check Option A
                if (container.find('[id*="_5401_of98a_date_d"]').val() != "") {
                    container.find('[id*="type_of98_d"]').val("a").trigger("change");
                }
                // Check Option B
                else if (container.find('[id*="_5405_of98b_date_code_d"]').val() != "") {
                    container.find('[id*="type_of98_d"]').val("b").trigger("change");
                    
                    // Check if Data Source Scheme has value
                    if (container.find('[id*="_5403_of98b_data_source_scheme_d"]').val() != "") {
                        container.find('[id*="check_of98b_data_source_scheme"]').prop("checked", true).trigger("click");
                    }
                }
                // Check Option C
                else if (container.find('[id*="_5407_of98c_date_d"]').val() != "" || 
                         container.find('[id*="_5408_of98c_time_d"]').val() != "") {
                    container.find('[id*="type_of98_d"]').val("c").trigger("change");
                }
            });
            
            //========================================
            // VIEW MODE - OF22F Indicator
            //========================================
            $('[id*="template_of22f_d"]').each(function() {
                let container = $(this);
                
                // Check if Data Source Scheme has value
                if (container.find('[id*="_5501_of22f_d_data_source_scheme"]').val() != "") {
                    container.find('[id*="check_of22f_data_source_scheme"]').prop("checked", true).trigger("click");
                }
            });
            
            //========================================
            // VIEW MODE - OF20C Reference
            //========================================
            $('[id*="template_of20c_d"]').each(function() {
                let container = $(this);
                
                // Check if Reference has value
                if (container.find('[id*="_5601_of20c_d_reference"]').val() != "") {
                    container.find('[id*="check_of20c_reference"]').prop("checked", true).trigger("click");
                }
            });
            
            //========================================
            // VIEW MODE - OF92A Rate
            //========================================
            $('[id*="template_of92a_d"]').each(function() {
                let container = $(this);
                
                // Check Option A
                if (container.find('[id*="_5702_of92a_d_rate"]').val() != "") {
                    container.find('[id*="type_of92_d"]').val("a").trigger("change");
                    
                    // Check if Sign has value
                    if (container.find('[id*="_5701_of92a_d_sign"]').val() != "") {
                        container.find('[id*="check_of92a_sign"]').prop("checked", true).trigger("click");
                    }
                }
                // Check Option C
                else if (container.find('[id*="_5706_of92c_d_rate_name"]').val() != "") {
                    container.find('[id*="type_of92_d"]').val("c").trigger("change");
                }
            });
            
            //========================================
            // VIEW MODE - OF19A Amount
            //========================================
            $('[id*="template_of19a_d"]').each(function() {
                let container = $(this);
                
                // Check if Sign has value
                if (container.find('[id*="_5901_of19a_sign_d"]').val() != "") {
                    container.find('[id*="check_of19a_sign"]').prop("checked", true).trigger("click");
                }
            });
        }
        
    });
</script>

<!-- Handle repetitive field containers -->
<script type="text/javascript">
    
    //========================================
    // OVERRIDE addContainer FUNCTION FOR SEQUENCE D
    // PERBAIKAN #2: Fungsi ini akan dipanggil dari onclick="addContainer(this)" di mt543.jsp
    //========================================
    
    // Simpan fungsi addContainer original jika ada
    if (typeof window.addContainerOriginal === 'undefined' && typeof window.addContainer !== 'undefined') {
        window.addContainerOriginal = window.addContainer;
    }
    
    // Override fungsi addContainer untuk handle Sequence D
    window.addContainer = function(button) {
        let dataId = $(button).data("id");
        
        // Check if this is Sequence D field
        if (dataId && dataId.endsWith("_d")) {
            return addContainerSeqD(button);
        }
        
        // Call original function for non-Sequence D fields
        if (typeof window.addContainerOriginal === 'function') {
            return window.addContainerOriginal(button);
        }
    };
    
    function addContainerSeqD(button) {
        let dataId = $(button).data("id");
        let currentCount = parseInt($(button).data("count")) || 0;
        let maxOcc = parseInt($("#max_occ_" + dataId).text());
        
        if (currentCount >= maxOcc) {
            alert("Maximum occurrence reached: " + maxOcc);
            return;
        }
        
        currentCount++;
        $(button).data("count", currentCount);
        $("#cur_occ_" + dataId).text(currentCount);
        
        // Clone template
        let template = $("#template_" + dataId).clone();
        template.attr("id", "container_item_" + dataId + "_" + currentCount);
        template.css("display", "block");
        template.removeClass("template_container");
        template.addClass("active_container");
        
        // Update all IDs in cloned template
        template.find("[id]").each(function() {
            let oldId = $(this).attr("id");
            if (oldId) {
                let newId = oldId;
                // Replace suffix _d with _d_count
                if (oldId.includes("_d")) {
                    newId = oldId.replace(/_d([^_]*)$/, "_d_" + currentCount + "$1");
                }
                $(this).attr("id", newId);
            }
        });
        
        // Update all names in cloned template
        template.find("[name]").each(function() {
            let oldName = $(this).attr("name");
            if (oldName) {
                let newName = oldName;
                // Replace suffix _d with _d_count
                if (oldName.includes("_d")) {
                    newName = oldName.replace(/_d([^_]*)$/, "_d_" + currentCount + "$1");
                }
                $(this).attr("name", newName);
            }
        });
        
        // Update count label
        template.find('[id*="label_count_' + dataId + '"]').text("Count: " + currentCount);
        
        // Enable and setup remove button
        let removeBtn = template.find(".remove-btn");
        removeBtn.attr("disabled", false);
        removeBtn.removeClass("template_selection");
        removeBtn.off('click').on('click', function() {
            if (confirm("Remove this field?")) {
                template.remove();
                currentCount--;
                $(button).data("count", currentCount);
                $("#cur_occ_" + dataId).text(currentCount);
            }
        });
        
        // Remove template_selection class from all fields
        template.find(".template_selection").removeClass("template_selection");
        
        // Enable all input fields in template
        template.find("input, select, textarea").each(function() {
            // Only enable if not part of hidden optional div
            if (!$(this).closest('[id*="div_opt"]').length || $(this).closest('[id*="div_opt"]').is(':visible')) {
                // Keep disabled initially, will be enabled by field setup
            }
        });
        
        // Enable type selectors where applicable
        if (dataId === "of98a_d" || dataId === "of92a_d") {
            template.find('[id*="type_"]').attr("disabled", false);
        }
        
        // Enable checkboxes for optional fields
        template.find('input[type="checkbox"]').attr("disabled", false);
        
        // Enable mandatory fields
        template.find('.mandatory').attr("disabled", false);
        
        // Insert before the add button container
        template.insertBefore("#container_" + dataId);
        
        // Apply field setup based on field type
        let suffix = "d_" + currentCount;
        if (dataId === "of98a_d") {
            setupOF98AFields(template, suffix);
        } else if (dataId === "of22f_d") {
            setupOF22FFields(template, suffix);
            // Enable mandatory fields for OF22F
            template.find('[id*="_550_of22f_"]').attr("disabled", false);
            template.find('[id*="_5503_of22f_"]').attr("disabled", false);
        } else if (dataId === "of20c_d") {
            setupOF20CFields(template, suffix);
            // Enable mandatory qualifier field
            template.find('[id*="_560_of20c_"]').attr("disabled", false);
        } else if (dataId === "of92a_d") {
            setupOF92AFields(template, suffix);
        } else if (dataId === "of99b_d") {
            // Enable mandatory fields for OF99B
            template.find('[id*="_580_of99b_"]').attr("disabled", false);
            template.find('[id*="_5801_of99b_"]').attr("disabled", false);
        } else if (dataId === "of19a_d") {
            setupOF19AFields(template, suffix);
            // Enable mandatory fields for OF19A
            template.find('[id*="_590_of19a_"]').attr("disabled", false);
            template.find('[id*="_5902_of19a_"]').attr("disabled", false);
            template.find('[id*="_5903_of19a_"]').attr("disabled", false);
        }
        
        return template;
    }
    
    //========================================
    // FIELD SETUP FUNCTIONS (for dynamic containers)
    //========================================
    function setupOF98AFields(container, suffix) {
        let typeSelect = container.find('[id$="type_of98_' + suffix + '"]');
        let divA = container.find('[id$="div_of98a_' + suffix + '"]');
        let divB = container.find('[id$="div_of98b_' + suffix + '"]');
        let divC = container.find('[id$="div_of98c_' + suffix + '"]');
        
        divA.hide();
        divB.hide();
        divC.hide();
        
        container.find('[id*="_of98a_"]').attr("disabled", true);
        container.find('[id*="_of98b_"]').attr("disabled", true);
        container.find('[id*="_of98c_"]').attr("disabled", true);
        
        typeSelect.attr("disabled", false);
        
        typeSelect.change(function() {
            divA.hide();
            divB.hide();
            divC.hide();
            
            if ($(this).val() === "a") {
                divA.show();
                container.find('[id*="_540_of98a_"], [id*="_5401_of98a_"]').attr("disabled", false);
                container.find('[id*="_of98b_"]').attr("disabled", true).val("");
                container.find('[id*="_of98c_"]').attr("disabled", true).val("");
            } else if ($(this).val() === "b") {
                divB.show();
                container.find('[id*="_of98a_"]').attr("disabled", true).val("");
                container.find('[id*="_5402_of98b_"], [id*="_5404_of98b_"], [id*="_5405_of98b_"]').attr("disabled", false);
                container.find('[id*="_of98c_"]').attr("disabled", true).val("");
                
                let checkDSS = container.find('[id*="check_of98b_data_source_scheme"]');
                let divDSS = container.find('[id*="div_opt_of98b_data_source_scheme"]');
                divDSS.hide();
                container.find('[id*="_5403_of98b_data_source_scheme"]').attr("disabled", true);
                
                checkDSS.unbind('click').click(function() {
                    if ($(this).is(":checked")) {
                        divDSS.show();
                        container.find('[id*="_5403_of98b_data_source_scheme"]').attr("disabled", false);
                    } else {
                        divDSS.hide();
                        container.find('[id*="_5403_of98b_data_source_scheme"]').attr("disabled", true).val("");
                    }
                });
            } else if ($(this).val() === "c") {
                divC.show();
                container.find('[id*="_of98a_"]').attr("disabled", true).val("");
                container.find('[id*="_of98b_"]').attr("disabled", true).val("");
                container.find('[id*="_5406_of98c_"], [id*="_5407_of98c_"], [id*="_5408_of98c_"]').attr("disabled", false);
            } else {
                container.find('[id*="_of98a_"]').attr("disabled", true).val("");
                container.find('[id*="_of98b_"]').attr("disabled", true).val("");
                container.find('[id*="_of98c_"]').attr("disabled", true).val("");
            }
        });
    }
    
    function setupOF22FFields(container, suffix) {
        let divDSS = container.find('[id*="div_opt_of22f_data_source_scheme"]');
        let checkDSS = container.find('[id*="check_of22f_data_source_scheme"]');
        
        divDSS.hide();
        container.find('[id*="_5501_of22f_"]').attr("disabled", true);
        
        checkDSS.unbind('click').click(function() {
            if ($(this).is(":checked")) {
                divDSS.show();
                container.find('[id*="_5501_of22f_"]').attr("disabled", false);
            } else {
                divDSS.hide();
                container.find('[id*="_5501_of22f_"]').attr("disabled", true).val("");
            }
        });
    }
    
    function setupOF20CFields(container, suffix) {
        let checkRef = container.find('[id*="check_of20c_reference"]');
        let divRef = container.find('[id*="div_opt_of20c_reference"]');
        
        divRef.hide();
        container.find('[id*="_5601_of20c_"]').attr("disabled", true);
        
        checkRef.unbind('click').click(function() {
            if ($(this).is(":checked")) {
                divRef.show();
                container.find('[id*="_5601_of20c_"]').attr("disabled", false);
            } else {
                divRef.hide();
                container.find('[id*="_5601_of20c_"]').attr("disabled", true).val("");
            }
        });
    }
    
    function setupOF92AFields(container, suffix) {
        let typeSelect = container.find('[id$="type_of92_' + suffix + '"]');
        let divA = container.find('[id$="div_of92a_' + suffix + '"]');
        let divC = container.find('[id$="div_of92c_' + suffix + '"]');
        
        divA.hide();
        divC.hide();
        
        container.find('[id*="_of92a_"]').attr("disabled", true);
        container.find('[id*="_of92c_"]').attr("disabled", true);
        
        typeSelect.attr("disabled", false);
        
        typeSelect.change(function() {
            divA.hide();
            divC.hide();
            
            if ($(this).val() === "a") {
                divA.show();
                container.find('[id*="_570_of92a_"], [id*="_5702_of92a_"]').attr("disabled", false);
                container.find('[id*="_of92c_"]').attr("disabled", true).val("");
                
                let checkSign = container.find('[id*="check_of92a_sign"]');
                let divSign = container.find('[id*="div_opt_of92a_sign"]');
                divSign.hide();
                container.find('[id*="_5701_of92a_"]').attr("disabled", true);
                
                checkSign.unbind('click').click(function() {
                    if ($(this).is(":checked")) {
                        divSign.show();
                        container.find('[id*="_5701_of92a_"]').attr("disabled", false);
                    } else {
                        divSign.hide();
                        container.find('[id*="_5701_of92a_"]').attr("disabled", true).val("");
                    }
                });
            } else if ($(this).val() === "c") {
                divC.show();
                container.find('[id*="_of92a_"]').attr("disabled", true).val("");
                container.find('[id*="_5703_of92c_"], [id*="_5704_of92c_"], [id*="_5705_of92c_"], [id*="_5706_of92c_"]').attr("disabled", false);
            } else {
                container.find('[id*="_of92a_"]').attr("disabled", true).val("");
                container.find('[id*="_of92c_"]').attr("disabled", true).val("");
            }
        });
    }
    
    function setupOF19AFields(container, suffix) {
        let checkSign = container.find('[id*="check_of19a_sign"]');
        let divSign = container.find('[id*="div_opt_of19a_sign"]');
        
        divSign.hide();
        container.find('[id*="_5901_of19a_"]').attr("disabled", true);
        
        checkSign.unbind('click').click(function() {
            if ($(this).is(":checked")) {
                divSign.show();
                container.find('[id*="_5901_of19a_"]').attr("disabled", false);
            } else {
                divSign.hide();
                container.find('[id*="_5901_of19a_"]').attr("disabled", true).val("");
            }
        });
    }
    
</script>

<!--SEQUENCE E-->
<script language="javascript">
    $(document).ready(function() {
        
        //========================================
        // TOGGLE FUNCTIONS FOR E1 - Settlement Parties
        //========================================
        
        // MF95A Party Type Selector for E1
        window.toggleMF95Options_E1 = function(container) {
            let typeSelect = container.find('[id*="type_mf95_e1"]');
            let divC = container.find('[id*="div_mf95c_e1"]');
            let divD = container.find('[id*="div_mf95d_e1"]');
            let divL = container.find('[id*="div_mf95l_e1"]');
            let divP = container.find('[id*="div_mf95p_e1"]');
            let divQ = container.find('[id*="div_mf95q_e1"]');
            let divR = container.find('[id*="div_mf95r_e1"]');
            let divS = container.find('[id*="div_mf95s_e1"]');
            
            // Hide all initially
            divC.hide();
            divD.hide();
            divL.hide();
            divP.hide();
            divQ.hide();
            divR.hide();
            divS.hide();
            
            // Disable all fields initially
            container.find('[id*="_mf95c_e1_"]').attr("disabled", true);
            container.find('[id*="_mf95d_e1_"]').attr("disabled", true);
            container.find('[id*="_mf95l_e1_"]').attr("disabled", true);
            container.find('[id*="_mf95p_e1_"]').attr("disabled", true);
            container.find('[id*="_mf95q_e1_"]').attr("disabled", true);
            container.find('[id*="_mf95r_e1_"]').attr("disabled", true);
            container.find('[id*="_mf95s_e1_"]').attr("disabled", true);
            container.find('[id*="check_mf95s_data_source_scheme_e1"]').attr("disabled", true);
            
            typeSelect.off('change').on('change', function() {
                divC.hide();
                divD.hide();
                divL.hide();
                divP.hide();
                divQ.hide();
                divR.hide();
                divS.hide();
                
                let selectedType = $(this).val();
                
                if (selectedType == "c") {
                    divC.show();
                    container.find('[id*="_mf95c_e1_"]').attr("disabled", false);
                    container.find('[id*="_mf95d_e1_"], [id*="_mf95l_e1_"], [id*="_mf95p_e1_"], [id*="_mf95q_e1_"], [id*="_mf95r_e1_"], [id*="_mf95s_e1_"]').attr("disabled", true).val("");
                } else if (selectedType == "d") {
                    divD.show();
                    container.find('[id*="_mf95d_e1_"]').attr("disabled", false);
                    container.find('[id*="_mf95c_e1_"], [id*="_mf95l_e1_"], [id*="_mf95p_e1_"], [id*="_mf95q_e1_"], [id*="_mf95r_e1_"], [id*="_mf95s_e1_"]').attr("disabled", true).val("");
                } else if (selectedType == "l") {
                    divL.show();
                    container.find('[id*="_mf95l_e1_"]').attr("disabled", false);
                    container.find('[id*="_mf95c_e1_"], [id*="_mf95d_e1_"], [id*="_mf95p_e1_"], [id*="_mf95q_e1_"], [id*="_mf95r_e1_"], [id*="_mf95s_e1_"]').attr("disabled", true).val("");
                } else if (selectedType == "p") {
                    divP.show();
                    container.find('[id*="_mf95p_e1_"]').attr("disabled", false);
                    container.find('[id*="_mf95c_e1_"], [id*="_mf95d_e1_"], [id*="_mf95l_e1_"], [id*="_mf95q_e1_"], [id*="_mf95r_e1_"], [id*="_mf95s_e1_"]').attr("disabled", true).val("");
                } else if (selectedType == "q") {
                    divQ.show();
                    container.find('[id*="_mf95q_e1_"]').attr("disabled", false);
                    container.find('[id*="_mf95c_e1_"], [id*="_mf95d_e1_"], [id*="_mf95l_e1_"], [id*="_mf95p_e1_"], [id*="_mf95r_e1_"], [id*="_mf95s_e1_"]').attr("disabled", true).val("");
                } else if (selectedType == "r") {
                    divR.show();
                    container.find('[id*="_mf95r_e1_"]').attr("disabled", false);
                    container.find('[id*="_mf95c_e1_"], [id*="_mf95d_e1_"], [id*="_mf95l_e1_"], [id*="_mf95p_e1_"], [id*="_mf95q_e1_"], [id*="_mf95s_e1_"]').attr("disabled", true).val("");
                } else if (selectedType == "s") {
                    divS.show();
                    container.find('[id*="_mf95s_e1_"]').not('[id*="data_source_scheme"]').attr("disabled", false);
                    container.find('[id*="check_mf95s_data_source_scheme_e1"]').attr("disabled", false);
                    container.find('[id*="_mf95c_e1_"], [id*="_mf95d_e1_"], [id*="_mf95l_e1_"], [id*="_mf95p_e1_"], [id*="_mf95q_e1_"], [id*="_mf95r_e1_"]').attr("disabled", true).val("");
                } else {
                    container.find('[id*="_mf95c_e1_"], [id*="_mf95d_e1_"], [id*="_mf95l_e1_"], [id*="_mf95p_e1_"], [id*="_mf95q_e1_"], [id*="_mf95r_e1_"], [id*="_mf95s_e1_"]').attr("disabled", true).val("");
                }
            });
            
            // MF95S Data Source Scheme checkbox for E1
            let checkDSS = container.find('[id*="check_mf95s_data_source_scheme_e1"]');
            let divDSS = container.find('[id*="div_opt_mf95s_data_source_scheme_e1"]');
            
            divDSS.hide();
            container.find('[id*="_mf95s_e1_data_source_scheme"]').attr("disabled", true);
            
            checkDSS.off('click').on('click', function(){
                if ($(this).is(":checked")) {
                    divDSS.show();
                    container.find('[id*="_mf95s_e1_data_source_scheme"]').attr("disabled", false);
                } else {
                    divDSS.hide();
                    container.find('[id*="_mf95s_e1_data_source_scheme"]').attr("disabled", true).val("");
                }
            });
        };
        
        // OF97A Account Type Selector in E1
        window.toggleOF97Options_E1 = function(container) {
            let checkOF97 = container.find('[id*="check_of97a_e1"]');
            let divOpt = container.find('[id*="div_opt_of97a_e1"]');
            let typeSelect = container.find('[id*="type_of97_e1"]');
            let divA = container.find('[id*="div_of97a_e1"]');
            let divB = container.find('[id*="div_of97b_e1"]');
            let divD = container.find('[id*="div_of97d_e1"]');
            
            divOpt.hide();
            divA.hide();
            divB.hide();
            divD.hide();
            
            container.find('[id*="_of97a_e1_"]').attr("disabled", true);
            container.find('[id*="_of97b_e1_"]').attr("disabled", true);
            container.find('[id*="_of97d_e1_"]').attr("disabled", true);
            
            checkOF97.off('click').on('click', function(){
                if ($(this).is(":checked")) {
                    divOpt.show();
                    typeSelect.attr("disabled", false);
                } else {
                    divOpt.hide();
                    divA.hide();
                    divB.hide();
                    divD.hide();
                    typeSelect.attr("disabled", true).val("");
                    container.find('[id*="_of97a_e1_"], [id*="_of97b_e1_"], [id*="_of97d_e1_"]').attr("disabled", true).val("");
                }
            });
            
            typeSelect.off('change').on('change', function() {
                divA.hide();
                divB.hide();
                divD.hide();
                
                if ($(this).val() == "a") {
                    divA.show();
                    container.find('[id*="_of97a_e1_"]').attr("disabled", false);
                    container.find('[id*="_of97b_e1_"], [id*="_of97d_e1_"]').attr("disabled", true).val("");
                } else if ($(this).val() == "b") {
                    divB.show();
                    container.find('[id*="_of97b_e1_"]').attr("disabled", false);
                    container.find('[id*="_of97a_e1_"], [id*="_of97d_e1_"]').attr("disabled", true).val("");
                } else if ($(this).val() == "d") {
                    divD.show();
                    container.find('[id*="_of97d_e1_"]').attr("disabled", false);
                    container.find('[id*="_of97a_e1_"], [id*="_of97b_e1_"]').attr("disabled", true).val("");
                } else {
                    container.find('[id*="_of97a_e1_"], [id*="_of97b_e1_"], [id*="_of97d_e1_"]').attr("disabled", true).val("");
                }
            });
        };
        
        // OF98A Processing Date/Time in E1
        window.toggleOF98Options_E1 = function(container) {
            let checkOF98 = container.find('[id*="check_of98a_e1"]');
            let divOpt = container.find('[id*="div_opt_of98a_e1"]');
            let typeSelect = container.find('[id*="type_of98_e1"]');
            let divA = container.find('[id*="div_of98a_e1"]');
            let divC = container.find('[id*="div_of98c_e1"]');
            
            divOpt.hide();
            divA.hide();
            divC.hide();
            
            container.find('[id*="_of98a_e1_"]').attr("disabled", true);
            container.find('[id*="_of98c_e1_"]').attr("disabled", true);
            
            checkOF98.off('click').on('click', function(){
                if ($(this).is(":checked")) {
                    divOpt.show();
                    typeSelect.attr("disabled", false);
                } else {
                    divOpt.hide();
                    divA.hide();
                    divC.hide();
                    typeSelect.attr("disabled", true).val("");
                    container.find('[id*="_of98a_e1_"], [id*="_of98c_e1_"]').attr("disabled", true).val("");
                }
            });
            
            typeSelect.off('change').on('change', function() {
                divA.hide();
                divC.hide();
                
                if ($(this).val() == "a") {
                    divA.show();
                    container.find('[id*="_of98a_e1_"]').attr("disabled", false);
                    container.find('[id*="_of98c_e1_"]').attr("disabled", true).val("");
                } else if ($(this).val() == "c") {
                    divC.show();
                    container.find('[id*="_of98c_e1_"]').attr("disabled", false);
                    container.find('[id*="_of98a_e1_"]').attr("disabled", true).val("");
                } else {
                    container.find('[id*="_of98a_e1_"], [id*="_of98c_e1_"]').attr("disabled", true).val("");
                }
            });
        };
        
        // OF20C Processing Reference in E1
        window.toggleOF20Options_E1 = function(container) {
            let checkOF20 = container.find('[id*="check_of20c_e1"]');
            let divOpt = container.find('[id*="div_opt_of20c_e1"]');
            
            divOpt.hide();
            container.find('[id*="_of20c_e1_"]').attr("disabled", true);
            
            checkOF20.off('click').on('click', function(){
                if ($(this).is(":checked")) {
                    divOpt.show();
                    container.find('[id*="_of20c_e1_"]').attr("disabled", false);
                } else {
                    divOpt.hide();
                    container.find('[id*="_of20c_e1_"]').attr("disabled", true).val("");
                }
            });
        };
        
        // OF70A Narrative Type Selector in E1
        window.toggleOF70Options_E1 = function(container) {
            let typeSelect = container.find('[id*="type_of70_e1"]');
            let divC = container.find('[id*="div_of70c_e1"]');
            let divD = container.find('[id*="div_of70d_e1"]');
            let divE = container.find('[id*="div_of70e_e1"]');
            
            divC.hide();
            divD.hide();
            divE.hide();
            
            container.find('[id*="_of70c_e1_"]').attr("disabled", true);
            container.find('[id*="_of70d_e1_"]').attr("disabled", true);
            container.find('[id*="_of70e_e1_"]').attr("disabled", true);
            
            typeSelect.off('change').on('change', function() {
                divC.hide();
                divD.hide();
                divE.hide();
                
                if ($(this).val() == "c") {
                    divC.show();
                    container.find('[id*="_of70c_e1_"]').attr("disabled", false);
                    container.find('[id*="_of70d_e1_"], [id*="_of70e_e1_"]').attr("disabled", true).val("");
                } else if ($(this).val() == "d") {
                    divD.show();
                    container.find('[id*="_of70d_e1_"]').attr("disabled", false);
                    container.find('[id*="_of70c_e1_"], [id*="_of70e_e1_"]').attr("disabled", true).val("");
                } else if ($(this).val() == "e") {
                    divE.show();
                    container.find('[id*="_of70e_e1_"]').attr("disabled", false);
                    container.find('[id*="_of70c_e1_"], [id*="_of70d_e1_"]').attr("disabled", true).val("");
                } else {
                    container.find('[id*="_of70c_e1_"], [id*="_of70d_e1_"], [id*="_of70e_e1_"]').attr("disabled", true).val("");
                }
            });
        };
        
        //========================================
        // TOGGLE FUNCTIONS FOR E2 - Cash Parties
        //========================================
        
        window.toggleMF95Options_E2 = function(container) {
            let typeSelect = container.find('[id*="type_mf95_e2"]');
            let divL = container.find('[id*="div_mf95l_e2"]');
            let divP = container.find('[id*="div_mf95p_e2"]');
            let divQ = container.find('[id*="div_mf95q_e2"]');
            let divR = container.find('[id*="div_mf95r_e2"]');
            let divS = container.find('[id*="div_mf95s_e2"]');
            
            divL.hide();
            divP.hide();
            divQ.hide();
            divR.hide();
            divS.hide();
            
            container.find('[id*="_mf95l_e2_"], [id*="_mf95p_e2_"], [id*="_mf95q_e2_"], [id*="_mf95r_e2_"], [id*="_mf95s_e2_"]').attr("disabled", true);
            
            typeSelect.off('change').on('change', function() {
                divL.hide();
                divP.hide();
                divQ.hide();
                divR.hide();
                divS.hide();
                
                let selectedType = $(this).val();
                
                if (selectedType == "l") {
                    divL.show();
                    container.find('[id*="_mf95l_e2_"]').attr("disabled", false);
                    container.find('[id*="_mf95p_e2_"], [id*="_mf95q_e2_"], [id*="_mf95r_e2_"], [id*="_mf95s_e2_"]').attr("disabled", true).val("");
                } else if (selectedType == "p") {
                    divP.show();
                    container.find('[id*="_mf95p_e2_"]').attr("disabled", false);
                    container.find('[id*="_mf95l_e2_"], [id*="_mf95q_e2_"], [id*="_mf95r_e2_"], [id*="_mf95s_e2_"]').attr("disabled", true).val("");
                } else if (selectedType == "q") {
                    divQ.show();
                    container.find('[id*="_mf95q_e2_"]').attr("disabled", false);
                    container.find('[id*="_mf95l_e2_"], [id*="_mf95p_e2_"], [id*="_mf95r_e2_"], [id*="_mf95s_e2_"]').attr("disabled", true).val("");
                } else if (selectedType == "r") {
                    divR.show();
                    container.find('[id*="_mf95r_e2_"]').attr("disabled", false);
                    container.find('[id*="_mf95l_e2_"], [id*="_mf95p_e2_"], [id*="_mf95q_e2_"], [id*="_mf95s_e2_"]').attr("disabled", true).val("");
                } else if (selectedType == "s") {
                    divS.show();
                    container.find('[id*="_mf95s_e2_"]').not('[id*="data_source_scheme"]').attr("disabled", false);
                    container.find('[id*="check_mf95s_data_source_scheme_e2"]').attr("disabled", false);
                    container.find('[id*="_mf95l_e2_"], [id*="_mf95p_e2_"], [id*="_mf95q_e2_"], [id*="_mf95r_e2_"]').attr("disabled", true).val("");
                } else {
                    container.find('[id*="_mf95l_e2_"], [id*="_mf95p_e2_"], [id*="_mf95q_e2_"], [id*="_mf95r_e2_"], [id*="_mf95s_e2_"]').attr("disabled", true).val("");
                }
            });
            
            // MF95S Data Source Scheme checkbox for E2
            let checkDSS = container.find('[id*="check_mf95s_data_source_scheme_e2"]');
            let divDSS = container.find('[id*="div_opt_mf95s_data_source_scheme_e2"]');
            
            divDSS.hide();
            container.find('[id*="_mf95s_e2_data_source_scheme"]').attr("disabled", true);
            
            checkDSS.off('click').on('click', function(){
                if ($(this).is(":checked")) {
                    divDSS.show();
                    container.find('[id*="_mf95s_e2_data_source_scheme"]').attr("disabled", false);
                } else {
                    divDSS.hide();
                    container.find('[id*="_mf95s_e2_data_source_scheme"]').attr("disabled", true).val("");
                }
            });
        };
        
        // OF97A Account in E2
        window.toggleOF97Options_E2 = function(container) {
            let typeSelect = container.find('[id*="type_of97_e2"]');
            let divA = container.find('[id*="div_of97a_e2"]');
            let divD = container.find('[id*="div_of97d_e2"]');
            let divE = container.find('[id*="div_of97e_e2"]');
            
            divA.hide();
            divD.hide();
            divE.hide();
            
            container.find('[id*="_of97a_e2_"], [id*="_of97d_e2_"], [id*="_of97e_e2_"]').attr("disabled", true);
            
            typeSelect.off('change').on('change', function() {
                divA.hide();
                divD.hide();
                divE.hide();
                
                if ($(this).val() == "a") {
                    divA.show();
                    container.find('[id*="_of97a_e2_"]').attr("disabled", false);
                    container.find('[id*="_of97d_e2_"], [id*="_of97e_e2_"]').attr("disabled", true).val("");
                } else if ($(this).val() == "d") {
                    divD.show();
                    container.find('[id*="_of97d_e2_"]').attr("disabled", false);
                    container.find('[id*="_of97a_e2_"], [id*="_of97e_e2_"]').attr("disabled", true).val("");
                } else if ($(this).val() == "e") {
                    divE.show();
                    container.find('[id*="_of97e_e2_"]').attr("disabled", false);
                    container.find('[id*="_of97a_e2_"], [id*="_of97d_e2_"]').attr("disabled", true).val("");
                } else {
                    container.find('[id*="_of97a_e2_"], [id*="_of97d_e2_"], [id*="_of97e_e2_"]').attr("disabled", true).val("");
                }
            });
        };
        
        // OF70A Narrative Type Selector in E2
        window.toggleOF70Options_E2 = function(container) {
            let typeSelect = container.find('[id*="type_of70_e2"]');
            let divC = container.find('[id*="div_of70c_e2"]');
            let divE = container.find('[id*="div_of70e_e2"]');
            
            divC.hide();
            divE.hide();
            
            container.find('[id*="_of70c_e2_"], [id*="_of70e_e2_"]').attr("disabled", true);
            
            typeSelect.off('change').on('change', function() {
                divC.hide();
                divE.hide();
                
                if ($(this).val() == "c") {
                    divC.show();
                    container.find('[id*="_of70c_e2_"]').attr("disabled", false);
                    container.find('[id*="_of70e_e2_"]').attr("disabled", true).val("");
                } else if ($(this).val() == "e") {
                    divE.show();
                    container.find('[id*="_of70e_e2_"]').attr("disabled", false);
                    container.find('[id*="_of70c_e2_"]').attr("disabled", true).val("");
                } else {
                    container.find('[id*="_of70c_e2_"], [id*="_of70e_e2_"]').attr("disabled", true).val("");
                }
            });
        };
        
        //========================================
        // TOGGLE FUNCTIONS FOR E3 - Amounts
        //========================================
        
        window.toggleE3Options = function(container) {
            // MF19A Sign checkbox
            let checkSign = container.find('[id*="check_mf19a_sign_e3"]');
            let divSign = container.find('[id*="div_opt_mf19a_sign_e3"]');
            
            divSign.hide();
            container.find('[id*="_mf19a_e3_sign"]').attr("disabled", true);
            
            checkSign.off('click').on('click', function(){
                if ($(this).is(":checked")) {
                    divSign.show();
                    container.find('[id*="_mf19a_e3_sign"]').attr("disabled", false);
                } else {
                    divSign.hide();
                    container.find('[id*="_mf19a_e3_sign"]').attr("disabled", true).val("");
                }
            });
            
            // OF98A Value Date/Time Type Selector
            let typeOF98 = container.find('[id*="type_of98_e3"]');
            let divOF98A = container.find('[id*="div_of98a_e3"]');
            let divOF98C = container.find('[id*="div_of98c_e3"]');
            
            divOF98A.hide();
            divOF98C.hide();
            
            container.find('[id*="_of98a_e3_"], [id*="_of98c_e3_"]').attr("disabled", true);
            
            typeOF98.off('change').on('change', function() {
                divOF98A.hide();
                divOF98C.hide();
                
                if ($(this).val() == "a") {
                    divOF98A.show();
                    container.find('[id*="_of98a_e3_"]').attr("disabled", false);
                    container.find('[id*="_of98c_e3_"]').attr("disabled", true).val("");
                } else if ($(this).val() == "c") {
                    divOF98C.show();
                    container.find('[id*="_of98c_e3_"]').attr("disabled", false);
                    container.find('[id*="_of98a_e3_"]').attr("disabled", true).val("");
                } else {
                    container.find('[id*="_of98a_e3_"], [id*="_of98c_e3_"]').attr("disabled", true).val("");
                }
            });
            
            // OF92B Exchange Rate checkbox - FIXED
            let checkExch = container.find('[id*="check_of92b_e3"]');
            let divExch = container.find('[id*="div_opt_of92b_e3"]');
            
            divExch.hide();
            container.find('[id*="_of92b_e3_"]').attr("disabled", true);
            
            checkExch.off('click').on('click', function(){
                if ($(this).is(":checked")) {
                    divExch.show();
                    container.find('[id*="_of92b_e3_qualifier"]').attr("disabled", false);
                    container.find('[id*="_of92b_e3_first_currency_code"]').attr("disabled", false);
                    container.find('[id*="_of92b_e3_slash"]').attr("disabled", false);
                    container.find('[id*="_of92b_e3_second_currency_code"]').attr("disabled", false);
                    container.find('[id*="_of92b_e3_slash2"]').attr("disabled", false);
                    container.find('[id*="_of92b_e3_rate"]').attr("disabled", false);
                } else {
                    divExch.hide();
                    container.find('[id*="_of92b_e3_"]').attr("disabled", true).val("");
                }
            });
        };
        
        //========================================
        // E4 - Digital Network Fee
        //========================================
        // Initial state: Hide E4 and disable all fields EXCEPT MF16R and MF16S which stay disabled but visible
        $("#div_opt_e4").hide();
        $("#_820_mf16r_e4_start_of_block").attr("disabled", true);
        $("#_830_mf35b_e4_isin_prefix").attr("disabled", true);
        $("#_8301_mf35b_e4_identification_of_security").attr("disabled", true);
        $("#_8302_mf35b_e4_description_of_security").attr("disabled", true);
        $("#_840_mf36d_e4_qualifier").attr("disabled", true);
        $("#_8401_mf36d_e4_quantity_type_code").attr("disabled", true);
        $("#_8402_mf36d_e4_quantity_of_digital_tokens").attr("disabled", true);
        $("#_850_mf16s_e4_end_of_block").attr("disabled", true);
        $("#check_mf35b_description_of_security_e4").attr("disabled", true);
        $("#div_opt_mf35b_description_of_security_e4").hide();
        
        $("#check_e4").off('click').on('click', function(){
            if ($(this).is(":checked")) {
                $("#div_opt_e4").show();
                // MF16R and MF16S remain disabled (readonly display) but are visible
                $("#_820_mf16r_e4_start_of_block").attr("disabled", true);
                $("#_830_mf35b_e4_isin_prefix").attr("disabled", false);
                $("#_8301_mf35b_e4_identification_of_security").attr("disabled", false);
                $("#_840_mf36d_e4_qualifier").attr("disabled", true);
                $("#_8401_mf36d_e4_quantity_type_code").attr("disabled", true);
                $("#_8402_mf36d_e4_quantity_of_digital_tokens").attr("disabled", false);
                $("#_850_mf16s_e4_end_of_block").attr("disabled", true);
                $("#check_mf35b_description_of_security_e4").attr("disabled", false);
            } else {
                $("#div_opt_e4").hide();
                $("#_820_mf16r_e4_start_of_block").attr("disabled", true).val("NTWKFEE");
                $("#_830_mf35b_e4_isin_prefix").attr("disabled", true).val("ISIN ");
                $("#_8301_mf35b_e4_identification_of_security").attr("disabled", true).val("");
                $("#_8302_mf35b_e4_description_of_security").attr("disabled", true).val("");
                $("#_840_mf36d_e4_qualifier").attr("disabled", true).val(":NTWK/");
                $("#_8401_mf36d_e4_quantity_type_code").attr("disabled", true).val("/DITU/");
                $("#_8402_mf36d_e4_quantity_of_digital_tokens").attr("disabled", true).val("");
                $("#_850_mf16s_e4_end_of_block").attr("disabled", true).val("NTWKFEE");
                $("#check_mf35b_description_of_security_e4").attr("disabled", true).prop("checked", false);
                $("#div_opt_mf35b_description_of_security_e4").hide();
            }
        });
        
        // MF35B Description of Security checkbox
        $("#check_mf35b_description_of_security_e4").off('click').on('click', function(){
            if ($(this).is(":checked")) {
                $("#div_opt_mf35b_description_of_security_e4").show();
                $("#_8302_mf35b_e4_description_of_security").attr("disabled", false);
            } else {
                $("#div_opt_mf35b_description_of_security_e4").hide();
                $("#_8302_mf35b_e4_description_of_security").attr("disabled", true).val("");
            }
        });
        
    });
</script>

<!-- Rule view mode -->
<script language="javascript">
    $(document).ready(function() {
        
        //========================================
        // E4 - View Mode
        //========================================
        if ($("#_8301_mf35b_e4_identification_of_security").val() != "" || $("#_8402_mf36d_e4_quantity_of_digital_tokens").val() != "") {
            $("#check_e4").prop("checked", true).trigger("click");
            
            if ($("#_8302_mf35b_e4_description_of_security").val() != "") {
                $("#check_mf35b_description_of_security_e4").prop("checked", true).trigger("click");
            }
        }
        
        //========================================
        // E1 - Settlement Parties View Mode
        //========================================
        $("[id*='check_of97a_e1']").each(function() {
            let container = $(this).closest('[id^="container_item_"]');
            let accountField = container.find("[id*='_of97'][id*='_e1_'][id*='account']");
            
            if (accountField.length > 0 && accountField.val() && accountField.val().trim() !== "") {
                $(this).prop("checked", true).trigger("click");
                
                let typeValue = container.find("[id*='type_of97_e1']").val();
                if (typeValue) {
                    container.find("[id*='type_of97_e1']").trigger("change");
                }
            }
        });
        
        $("[id*='check_of98a_e1']").each(function() {
            let container = $(this).closest('[id^="container_item_"]');
            let dateField = container.find("[id*='_of98'][id*='_e1_'][id*='date']");
            
            if (dateField.length > 0 && dateField.val() && dateField.val().trim() !== "") {
                $(this).prop("checked", true).trigger("click");
                
                let typeValue = container.find("[id*='type_of98_e1']").val();
                if (typeValue) {
                    container.find("[id*='type_of98_e1']").trigger("change");
                }
            }
        });
        
        $("[id*='check_of20c_e1']").each(function() {
            let container = $(this).closest('[id^="container_item_"]');
            let refField = container.find("[id*='_of20c_e1_reference']");
            
            if (refField.length > 0 && refField.val() && refField.val().trim() !== "") {
                $(this).prop("checked", true).trigger("click");
            }
        });
        
        //========================================
        // E3 - Amounts View Mode
        //========================================
        $("[id*='check_mf19a_sign_e3']").each(function() {
            let container = $(this).closest('[id^="container_item_"]');
            let signField = container.find("[id*='_mf19a_e3_sign']");
            
            if (signField.length > 0 && signField.val() && signField.val().trim() !== "") {
                $(this).prop("checked", true).trigger("click");
            }
        });
        
        $("[id*='type_of98_e3']").each(function() {
            let typeValue = $(this).val();
            if (typeValue) {
                $(this).trigger("change");
            }
        });
        
        $("[id*='check_of92b_e3']").each(function() {
            let container = $(this).closest('[id^="container_item_"]');
            let exchField = container.find("[id*='_of92b_e3_'][id*='currency_code']").first();
            
            if (exchField.length > 0 && exchField.val() && exchField.val().trim() !== "") {
                $(this).prop("checked", true).trigger("click");
            }
        });
        
    });
</script>

<!-- Handle repetitive subsequences and fields -->
<script type="text/javascript">
    // Add MF22F Container (Repetitive in Sequence E)
    window.addContainer = function(button) {
        let dataId = $(button).data("id");
        let currentCount = parseInt($(button).data("count"));
        let maxOcc = $("#max_occ_" + dataId).text();
        
        if (maxOcc !== "-" && maxOcc !== "unbounded") {
            let maxOccNum = parseInt(maxOcc);
            if (currentCount >= maxOccNum) {
                alert("Maximum occurrence reached: " + maxOccNum);
                return;
            }
        }
        
        currentCount++;
        $(button).data("count", currentCount);
        $("#cur_occ_" + dataId).text(currentCount);
        
        let template = $("#template_" + dataId).clone();
        template.attr("id", "container_item_" + dataId + "_" + currentCount);
        template.removeAttr("style");
        template.css("display", "block");
        
        // Update IDs and names to make them unique
        template.find("[id]").each(function() {
            let oldId = $(this).attr("id");
            let newId = oldId + "_" + currentCount;
            $(this).attr("id", newId);
        });
        
        template.find("[name]").each(function() {
            let oldName = $(this).attr("name");
            let newName = oldName + "_" + currentCount;
            $(this).attr("name", newName);
        });
        
        template.find('[id*="label_count_' + dataId + '"]').text("Count: " + currentCount);
        
        template.find(".remove-btn").attr("disabled", false).off('click').on('click', function() {
            if (confirm("Are you sure you want to remove this field?")) {
                template.remove();
                currentCount--;
                $(button).data("count", currentCount);
                $("#cur_occ_" + dataId).text(currentCount);
            }
        });
        
        // Enable fields in the new container
        template.find("select, input:not([type='hidden']), textarea").attr("disabled", false);
        
        // For MF22F, enable checkbox for Data Source Scheme
        if (dataId === "mf22f_e") {
            let checkDSS = template.find('[id*="check_mf22f_data_source_scheme"]');
            let divDSS = template.find('[id*="div_opt_mf22f_data_source_scheme"]');
            
            divDSS.hide();
            template.find('[id*="_mf22f_e_data_source_scheme"]').attr("disabled", true);
            
            checkDSS.off('click').on('click', function(){
                if ($(this).is(":checked")) {
                    divDSS.show();
                    template.find('[id*="_mf22f_e_data_source_scheme"]').attr("disabled", false);
                } else {
                    divDSS.hide();
                    template.find('[id*="_mf22f_e_data_source_scheme"]').attr("disabled", true).val("");
                }
            });
        }
        
        template.insertBefore("#container_" + dataId);
    };
    
    // Add Template Container (E1, E2, E3 - Main Subsequences)
    window.addTemplateContainer = function(button) {
        let dataId = $(button).data("id");
        let currentCount = parseInt($(button).data("count"));
        let maxOcc = $("#max_occ_" + dataId).text();
        
        if (maxOcc !== "0" && maxOcc !== "-" && maxOcc !== "unbounded") {
            let maxOccNum = parseInt(maxOcc);
            if (currentCount >= maxOccNum) {
                alert("Maximum occurrence reached: " + maxOccNum);
                return;
            }
        }
        
        currentCount++;
        $(button).data("count", currentCount);
        $("#cur_occ_" + dataId).text(currentCount);
        
        let template = $("#template_" + dataId).clone();
        template.attr("id", "container_item_" + dataId + "_" + currentCount);
        template.removeAttr("style");
        template.css("display", "block");
        
        // Update IDs and names
        template.find("[id]").each(function() {
            let oldId = $(this).attr("id");
            let newId = oldId.replace(new RegExp("(" + dataId + ")(_|$)"), "$1_" + currentCount + "$2");
            $(this).attr("id", newId);
        });
        
        template.find("[name]").each(function() {
            let oldName = $(this).attr("name");
            let newName = oldName.replace(new RegExp("(" + dataId + ")(_|$)"), "$1_" + currentCount + "$2");
            $(this).attr("name", newName);
        });
        
        template.find("[data-id]").each(function() {
            let oldDataId = $(this).data("id");
            if (oldDataId.includes(dataId)) {
                let newDataId = oldDataId.replace(new RegExp(dataId + "$"), dataId + "_" + currentCount);
                $(this).attr("data-id", newDataId);
                $(this).data("id", newDataId);
            }
        });
        
        template.find('[id*="label_count_' + dataId + '"]').first().text("Count: " + currentCount);
        
        template.find(".remove-btn").first().attr("disabled", false).off('click').on('click', function() {
            if (confirm("Are you sure you want to remove this entire section?")) {
                template.remove();
                currentCount--;
                $(button).data("count", currentCount);
                $("#cur_occ_" + dataId).text(currentCount);
            }
        });
        
        // Enable necessary fields
        if (dataId === "e1") {
            template.find('[id*="_640_mf16r_e1_start_of_block"], [id*="_700_mf16s_e1_end_of_block"]').attr("disabled", false);
            template.find('.cust-btn').attr("disabled", false);
            toggleOF97Options_E1(template);
            toggleOF98Options_E1(template);
            toggleOF20Options_E1(template);
            template.find('[id*="check_of97a_e1"], [id*="check_of98a_e1"], [id*="check_of20c_e1"]').attr("disabled", false);
        } else if (dataId === "e2") {
            template.find('[id*="_710_mf16r_e2_start_of_block"], [id*="_750_mf16s_e2_end_of_block"]').attr("disabled", false);
            template.find('.cust-btn').attr("disabled", false);
        } else if (dataId === "e3") {
            template.find('[id*="_760_mf16r_e3_start_of_block"], [id*="_810_mf16s_e3_end_of_block"]').attr("disabled", false);
            template.find('[id*="type_of98_e3"]').attr("disabled", false);
            template.find('.cust-btn').attr("disabled", false);
            toggleE3Options(template);
            template.find('[id*="check_mf19a_sign_e3"], [id*="check_of92b_e3"]').attr("disabled", false);
        }
        
        template.insertBefore("#container_" + dataId);
    };
    
    // Add Sequence Repetitive Container (for nested repetitive fields)
    window.addSeqRepContainer = function(button) {
        let dataId = $(button).data("id");
        let currentCount = parseInt($(button).data("count"));
        let maxOcc = $("#max_occ_" + dataId).text();
        
        if (maxOcc !== "-" && maxOcc !== "unbounded") {
            let maxOccNum = parseInt(maxOcc);
            if (currentCount >= maxOccNum) {
                alert("Maximum occurrence reached: " + maxOccNum);
                return;
            }
        }
        
        currentCount++;
        $(button).data("count", currentCount);
        $("#cur_occ_" + dataId).text(currentCount);
        
        let template = $("#template_" + dataId).clone();
        template.attr("id", "container_item_" + dataId + "_" + currentCount);
        template.removeAttr("style");
        template.css("display", "block");
        
        // Update IDs and names
        template.find("[id]").each(function() {
            let oldId = $(this).attr("id");
            let newId = oldId + "_" + currentCount;
            $(this).attr("id", newId);
        });
        
        template.find("[name]").each(function() {
            let oldName = $(this).attr("name");
            let newName = oldName + "_" + currentCount;
            $(this).attr("name", newName);
        });
        
        template.find('[id*="label_count_' + dataId + '"]').first().text("Count: " + currentCount);
        
        template.find(".remove-btn").first().attr("disabled", false).off('click').on('click', function() {
            if (confirm("Are you sure you want to remove this field?")) {
                template.remove();
                currentCount--;
                $(button).data("count", currentCount);
                $("#cur_occ_" + dataId).text(currentCount);
            }
        });
        
        // Enable type selector and checkboxes
        template.find("select[id*='type_']").attr("disabled", false);
        template.find("input[type='checkbox']").attr("disabled", false);
        
        template.insertBefore("#container_" + dataId);
        
        // Apply toggle functions
        if (dataId.includes("mf95a_e1")) {
            toggleMF95Options_E1(template);
        } else if (dataId.includes("mf95a_e2")) {
            toggleMF95Options_E2(template);
        } else if (dataId.includes("of97a_e2")) {
            toggleOF97Options_E2(template);
        } else if (dataId.includes("of70a_e1")) {
            toggleOF70Options_E1(template);
        } else if (dataId.includes("of70a_e2")) {
            toggleOF70Options_E2(template);
        } else if (dataId.includes("of17b_e3")) {
            // Enable OF17B fields when added
            template.find("select, input").attr("disabled", false);
        } else if (dataId.includes("mf19a_e3")) {
            // Enable MF19A fields when added
            template.find("select, input, textarea").attr("disabled", false);
            // Setup sign checkbox
            let checkSign = template.find('[id*="check_mf19a_sign"]');
            let divSign = template.find('[id*="div_opt_mf19a_sign"]');
            divSign.hide();
            template.find('[id*="_mf19a_e3_sign"]').attr("disabled", true);
            checkSign.off('click').on('click', function(){
                if ($(this).is(":checked")) {
                    divSign.show();
                    template.find('[id*="_mf19a_e3_sign"]').attr("disabled", false);
                } else {
                    divSign.hide();
                    template.find('[id*="_mf19a_e3_sign"]').attr("disabled", true).val("");
                }
            });
        }
    };
</script>

<!--SEQUENCE F-->
<script type="text/javascript">
    $(document).ready(function(){
        
        //========================================
        // SEQUENCE F - MF95A Party Options Toggle
        //========================================
        
        // Hide all option divs initially and disable fields
        $("#div_mf95c_f, #div_mf95l_f, #div_mf95p_f, #div_mf95q_f, #div_mf95r_f, #div_mf95s_f").hide();
        $("#div_opt_mf95s_data_source_scheme_f").hide();
        
        $("[id^='_8801_mf95c_f'], [id^='_8803_mf95l_f'], [id^='_8804_mf95p_f'], [id^='_8805_mf95p_f']").attr("disabled", true);
        $("[id^='_8806_mf95q_f'], [id^='_8807_mf95q_f']").attr("disabled", true);
        $("[id^='_8808_mf95r_f'], [id^='_8809_mf95r_f'], [id^='_88010_mf95r_f'], [id^='_88011_mf95r_f']").attr("disabled", true);
        $("[id^='_88012_mf95s_f'], [id^='_88013_mf95s_f'], [id^='_88014_mf95s_f'], [id^='_88015_mf95s_f']").attr("disabled", true);
        $("[id^='_88016_mf95s_f'], [id^='_88017_mf95s_f'], [id^='_88018_mf95s_f'], [id^='_88019_mf95s_f']").attr("disabled", true);
        $("[id^='check_mf95s_data_source_scheme_f']").attr("disabled", true);
        
        // MF95A type change handler
        $(document).on('change', "[id^='type_mf95_f']", function() {
            let container = $(this).closest('.template_seq_div_rep');
            let selectedType = $(this).val();
            
            // Hide all divs first
            container.find("[id^='div_mf95']").hide();
            
            // Disable all fields
            container.find("[id^='_8801_mf95c_f'], [id^='_8803_mf95l_f'], [id^='_8804_mf95p_f'], [id^='_8805_mf95p_f']").attr("disabled", true).val("");
            container.find("[id^='_8806_mf95q_f'], [id^='_8807_mf95q_f']").attr("disabled", true).val("");
            container.find("[id^='_8808_mf95r_f'], [id^='_8809_mf95r_f'], [id^='_88010_mf95r_f'], [id^='_88011_mf95r_f']").attr("disabled", true).val("");
            container.find("[id^='_88012_mf95s_f'], [id^='_88013_mf95s_f'], [id^='_88014_mf95s_f'], [id^='_88015_mf95s_f']").attr("disabled", true).val("");
            container.find("[id^='_88016_mf95s_f'], [id^='_88017_mf95s_f'], [id^='_88018_mf95s_f'], [id^='_88019_mf95s_f']").attr("disabled", true).val("");
            container.find("[id^='check_mf95s_data_source_scheme_f']").attr("disabled", true).prop("checked", false);
            
            if (selectedType === 'c') {
                container.find("[id^='div_mf95c_f']").show();
                container.find("[id^='_8801_mf95c_f']").attr("disabled", false);
            } else if (selectedType === 'l') {
                container.find("[id^='div_mf95l_f']").show();
                container.find("[id^='_8803_mf95l_f']").attr("disabled", false);
            } else if (selectedType === 'p') {
                container.find("[id^='div_mf95p_f']").show();
                container.find("[id^='_8804_mf95p_f'], [id^='_8805_mf95p_f']").attr("disabled", false);
            } else if (selectedType === 'q') {
                container.find("[id^='div_mf95q_f']").show();
                container.find("[id^='_8806_mf95q_f'], [id^='_8807_mf95q_f']").attr("disabled", false);
            } else if (selectedType === 'r') {
                container.find("[id^='div_mf95r_f']").show();
                container.find("[id^='_8808_mf95r_f'], [id^='_8809_mf95r_f'], [id^='_88010_mf95r_f'], [id^='_88011_mf95r_f']").attr("disabled", false);
            } else if (selectedType === 's') {
                container.find("[id^='div_mf95s_f']").show();
                container.find("[id^='_88012_mf95s_f'], [id^='_88014_mf95s_f'], [id^='_88015_mf95s_f']").attr("disabled", false);
                container.find("[id^='_88016_mf95s_f'], [id^='_88017_mf95s_f'], [id^='_88018_mf95s_f'], [id^='_88019_mf95s_f']").attr("disabled", false);
                container.find("[id^='check_mf95s_data_source_scheme_f']").attr("disabled", false);
            }
        });
        
        // MF95S Data Source Scheme checkbox handler
        $(document).on('click', "[id^='check_mf95s_data_source_scheme_f']", function() {
            let container = $(this).closest('.template_seq_div_rep');
            
            if ($(this).is(':checked')) {
                container.find("[id^='div_opt_mf95s_data_source_scheme_f']").show();
                container.find("[id^='_88013_mf95s_f']").attr("disabled", false);
            } else {
                container.find("[id^='div_opt_mf95s_data_source_scheme_f']").hide();
                container.find("[id^='_88013_mf95s_f']").attr("disabled", true).val("");
            }
        });
        
        //========================================
        // OF97A - Account Options Toggle
        //========================================
        $("#div_of97a_f, #div_of97d_f").hide();
        $("#div_opt_of97d_data_source_scheme_f").show();
        
        $("[id^='_8901_of97a_f']").attr("disabled", true);
        $("[id^='_8903_of97d_f'], [id^='_8905_of97d_f']").attr("disabled", true);
        
        $(document).on('change', "[id^='type_of97_f']", function() {
            let container = $(this).closest('.template_container');
            let selectedType = $(this).val();
            
            container.find("[id^='div_of97']").hide();
            container.find("[id^='_8901_of97a_f']").attr("disabled", true).val("");
            container.find("[id^='_8903_of97d_f'], [id^='_8905_of97d_f']").attr("disabled", true).val("");
            
            if (selectedType === 'a') {
                container.find("[id^='div_of97a_f']").show();
                container.find("[id^='_8901_of97a_f']").attr("disabled", false);
            } else if (selectedType === 'd') {
                container.find("[id^='div_of97d_f']").show();
                container.find("[id^='_8903_of97d_f'], [id^='_8905_of97d_f']").attr("disabled", false);
            }
        });
        
        //========================================
        // OF70A - Narrative Options Toggle
        //========================================
        $("#div_of70c_f, #div_of70d_f, #div_of70e_f").hide();
        
        $("[id^='_9001_of70c_f']").attr("disabled", true);
        $("[id^='_9003_of70d_f']").attr("disabled", true);
        $("[id^='_9005_of70e_f']").attr("disabled", true);
        
        $(document).on('change', "[id^='type_of70_f']", function() {
            let container = $(this).closest('.template_seq_div_rep');
            let selectedType = $(this).val();
            
            container.find("[id^='div_of70']").hide();
            container.find("[id^='_9001_of70c_f']").attr("disabled", true).val("");
            container.find("[id^='_9003_of70d_f']").attr("disabled", true).val("");
            container.find("[id^='_9005_of70e_f']").attr("disabled", true).val("");
            
            if (selectedType === 'c') {
                container.find("[id^='div_of70c_f']").show();
                container.find("[id^='_9001_of70c_f']").attr("disabled", false);
            } else if (selectedType === 'd') {
                container.find("[id^='div_of70d_f']").show();
                container.find("[id^='_9003_of70d_f']").attr("disabled", false);
            } else if (selectedType === 'e') {
                container.find("[id^='div_of70e_f']").show();
                container.find("[id^='_9005_of70e_f']").attr("disabled", false);
            }
        });
        
        //========================================
        // OF20C - Processing Reference Checkbox
        //========================================
        $("#div_opt_of20c_f").hide();
        $("[id^='_9101_of20c_f']").attr("disabled", true);
        
        $(document).on('click', "[id^='check_of20c_f']", function() {
            let container = $(this).closest('.template_container');
            
            if ($(this).is(':checked')) {
                container.find("[id^='div_opt_of20c_f']").show();
                container.find("[id^='_9101_of20c_f']").attr("disabled", false);
            } else {
                container.find("[id^='div_opt_of20c_f']").hide();
                container.find("[id^='_9101_of20c_f']").attr("disabled", true).val("");
            }
        });
        
    });
</script>

<script type="text/javascript">
    //========================================
    // ADD SEQUENCE REPETITIVE CONTAINER (MF95A, OF70A)
    //========================================
    function addSeqRepContainer(button) {
        let dataId = $(button).data("id");
        let currentCount = parseInt($(button).data("count"));
        let maxOcc = $("#max_occ_" + dataId).text();
        
        // Check max occurrence
        if (maxOcc !== "-" && maxOcc !== "unbounded") {
            let maxOccNum = parseInt(maxOcc);
            if (currentCount >= maxOccNum) {
                alert("Maximum occurrence reached: " + maxOccNum);
                return;
            }
        }
        
        currentCount++;
        $(button).data("count", currentCount);
        $("#cur_occ_" + dataId).text(currentCount);
        
        // Clone template
        let template = $("#template_" + dataId).clone();
        template.attr("id", "container_item_" + dataId + "_" + currentCount);
        template.removeAttr("style");
        template.css("display", "block");
        
        // Update all IDs and names with counter suffix
        template.find("[id]").each(function() {
            let oldId = $(this).attr("id");
            let newId = oldId.replace(new RegExp("_" + dataId + "$"), "_" + dataId + "_" + currentCount);
            $(this).attr("id", newId);
        });
        
        template.find("[name]").each(function() {
            let oldName = $(this).attr("name");
            let newName = oldName.replace(new RegExp("_" + dataId + "$"), "_" + dataId + "_" + currentCount);
            $(this).attr("name", newName);
        });
        
        // Update label count
        template.find('[id$="label_count_' + dataId + '"]').text("Count: " + currentCount);
        
        // Enable remove button
        template.find(".remove-btn").attr("disabled", false).click(function() {
            template.remove();
            currentCount--;
            $(button).data("count", currentCount);
            $("#cur_occ_" + dataId).text(currentCount);
        });
        
        // Enable type selector based on field type
        if (dataId.indexOf("mf95a_f") !== -1) {
            template.find('[id^="type_mf95_f"]').attr("disabled", false);
        } else if (dataId.indexOf("of70a_f") !== -1) {
            template.find('[id^="type_of70_f"]').attr("disabled", false);
        }
        
        // Insert before container
        template.insertBefore("#container_" + dataId);
        
        // Initialize toggle functions for the new container
        if (dataId.indexOf("mf95a_f") !== -1) {
            initializeMF95AToggles(template, dataId + "_" + currentCount);
        } else if (dataId.indexOf("of70a_f") !== -1) {
            initializeOF70AToggles(template, dataId + "_" + currentCount);
        }
    }
    
    //========================================
    // ADD TEMPLATE CONTAINER (Sequence F)
    //========================================
    function addTemplateContainer(button) {
        let dataId = $(button).data("id");
        let currentCount = parseInt($(button).data("count"));
        let maxOcc = $("#max_occ_" + dataId).text();
        
        // Check max occurrence
        if (maxOcc !== "-" && maxOcc !== "unbounded") {
            let maxOccNum = parseInt(maxOcc);
            if (currentCount >= maxOccNum) {
                alert("Maximum occurrence reached: " + maxOccNum);
                return;
            }
        }
        
        currentCount++;
        $(button).data("count", currentCount);
        $("#cur_occ_" + dataId).text(currentCount);
        
        // Clone template
        let template = $("#template_" + dataId).clone();
        template.attr("id", "container_item_" + dataId + "_" + currentCount);
        template.removeAttr("style");
        template.css("display", "block");
        
        // Update all IDs and names with counter suffix
        template.find("[id]").each(function() {
            let oldId = $(this).attr("id");
            // Replace the suffix properly
            if (oldId.includes("_" + dataId)) {
                let newId = oldId.replace(new RegExp("_" + dataId + "(?!_)"), "_" + dataId + "_" + currentCount);
                $(this).attr("id", newId);
            }
        });
        
        template.find("[name]").each(function() {
            let oldName = $(this).attr("name");
            // Replace the suffix properly
            if (oldName.includes("_" + dataId)) {
                let newName = oldName.replace(new RegExp("_" + dataId + "(?!_)"), "_" + dataId + "_" + currentCount);
                $(this).attr("name", newName);
            }
        });
        
        // Update label count
        template.find('[id*="label_count_' + dataId + '"]').text("Count: " + currentCount);
        
        // Enable remove button
        template.find(".remove-btn").attr("disabled", false).click(function() {
            template.remove();
            currentCount--;
            $(button).data("count", currentCount);
            $("#cur_occ_" + dataId).text(currentCount);
        });
        
        // Enable buttons and checkboxes in the new container
        template.find(".cust-btn").attr("disabled", false);
        template.find('[id^="check_of20c_f"]').attr("disabled", false);
        template.find('[id^="type_of97_f"]').attr("disabled", false);
        
        // Insert before container
        template.insertBefore("#container_" + dataId);
        
        // Initialize all toggles for this Sequence F occurrence
        initializeSequenceFToggles(template, dataId + "_" + currentCount);
    }
    
    //========================================
    // INITIALIZE MF95A TOGGLES
    //========================================
    function initializeMF95AToggles(container, suffix) {
        let typeSelect = container.find('[id*="type_mf95_f"]').first();
        
        // Hide all option divs
        container.find("[id^='div_mf95']").hide();
        
        // Disable all fields
        container.find("input, select, textarea").attr("disabled", true);
        typeSelect.attr("disabled", false);
        container.find(".remove-btn").attr("disabled", false);
        
        // Change handler
        typeSelect.off('change').on('change', function() {
            let selectedType = $(this).val();
            
            // Hide all and disable all first
            container.find("[id^='div_mf95']").hide();
            container.find("input, select, textarea").not(typeSelect).attr("disabled", true);
            
            if (selectedType === 'c') {
                container.find("[id*='div_mf95c_f']").show();
                container.find("[id*='_8801_mf95c_f_country_code']").attr("disabled", false);
            } else if (selectedType === 'l') {
                container.find("[id*='div_mf95l_f']").show();
                container.find("[id*='_8803_mf95l_f_legal_entity_identifier']").attr("disabled", false);
            } else if (selectedType === 'p') {
                container.find("[id*='div_mf95p_f']").show();
                container.find("[id*='_8804_mf95p_f_qualifier']").attr("disabled", false);
                container.find("[id*='_8805_mf95p_f_identifier_code']").attr("disabled", false);
            } else if (selectedType === 'q') {
                container.find("[id*='div_mf95q_f']").show();
                container.find("[id*='_8806_mf95q_f_qualifier']").attr("disabled", false);
                container.find("[id*='_8807_mf95q_f_name_and_address']").attr("disabled", false);
            } else if (selectedType === 'r') {
                container.find("[id*='div_mf95r_f']").show();
                container.find("[id*='_8808_mf95r_f_qualifier']").attr("disabled", false);
                container.find("[id*='_8809_mf95r_f_data_source_scheme']").attr("disabled", false);
                container.find("[id*='_88010_mf95r_f_slash']").attr("disabled", false);
                container.find("[id*='_88011_mf95r_f_proprietary_code']").attr("disabled", false);
            } else if (selectedType === 's') {
                container.find("[id*='div_mf95s_f']").show();
                container.find("[id*='check_mf95s_data_source_scheme']").attr("disabled", false);
                container.find("[id*='_88015_mf95s_f_type_of_id']").attr("disabled", false);
                container.find("[id*='_88017_mf95s_f_country_code']").attr("disabled", false);
                container.find("[id*='_88019_mf95s_f_alternate_id']").attr("disabled", false);
                
                // Checkbox handler for Data Source Scheme
                container.find("[id*='check_mf95s_data_source_scheme']").off('click').on('click', function() {
                    if ($(this).is(':checked')) {
                        container.find("[id*='div_opt_mf95s_data_source_scheme']").show();
                        container.find("[id*='_88013_mf95s_f_data_source_scheme']").attr("disabled", false);
                    } else {
                        container.find("[id*='div_opt_mf95s_data_source_scheme']").hide();
                        container.find("[id*='_88013_mf95s_f_data_source_scheme']").attr("disabled", true).val("");
                    }
                });
            }
            
            // Keep remove button enabled
            container.find(".remove-btn").attr("disabled", false);
        });
    }
    
    //========================================
    // INITIALIZE OF70A TOGGLES
    //========================================
    function initializeOF70AToggles(container, suffix) {
        let typeSelect = container.find('[id*="type_of70_f"]').first();
        
        // Hide all option divs
        container.find("[id^='div_of70']").hide();
        
        // Disable all fields except type selector
        container.find("input, select, textarea").attr("disabled", true);
        typeSelect.attr("disabled", false);
        container.find(".remove-btn").attr("disabled", false);
        
        // Change handler
        typeSelect.off('change').on('change', function() {
            let selectedType = $(this).val();
            
            // Hide all and disable all
            container.find("[id^='div_of70']").hide();
            container.find("textarea").attr("disabled", true);
            
            if (selectedType === 'c') {
                container.find("[id*='div_of70c_f']").show();
                container.find("[id*='_9001_of70c_f_narrative']").attr("disabled", false);
            } else if (selectedType === 'd') {
                container.find("[id*='div_of70d_f']").show();
                container.find("[id*='_9003_of70d_f_narrative']").attr("disabled", false);
            } else if (selectedType === 'e') {
                container.find("[id*='div_of70e_f']").show();
                container.find("[id*='_9005_of70e_f_narrative']").attr("disabled", false);
            }
            
            // Keep buttons enabled
            container.find(".remove-btn").attr("disabled", false);
        });
    }
    
    //========================================
    // INITIALIZE SEQUENCE F TOGGLES
    //========================================
    function initializeSequenceFToggles(container, suffix) {
        // Initialize OF97A toggle
        let typeOF97 = container.find('[id*="type_of97_f"]').first();
        container.find("[id^='div_of97']").hide();
        container.find("[id*='_8901_of97a_f'], [id*='_8903_of97d_f'], [id*='_8905_of97d_f']").attr("disabled", true);
        
        typeOF97.off('change').on('change', function() {
            let selectedType = $(this).val();
            container.find("[id^='div_of97']").hide();
            container.find("[id*='_8901_of97a_f'], [id*='_8903_of97d_f'], [id*='_8905_of97d_f']").attr("disabled", true).val("");
            
            if (selectedType === 'a') {
                container.find("[id*='div_of97a_f']").show();
                container.find("[id*='_8901_of97a_f_account_number']").attr("disabled", false);
            } else if (selectedType === 'd') {
                container.find("[id*='div_of97d_f']").show();
                container.find("[id*='_8903_of97d_f_data_source_scheme']").attr("disabled", false);
                container.find("[id*='_8905_of97d_f_blockchain_wallet']").attr("disabled", false);
            }
        });
        
        // Initialize OF20C checkbox
        let checkOF20C = container.find('[id*="check_of20c_f"]').first();
        container.find("[id*='div_opt_of20c_f']").hide();
        container.find("[id*='_9101_of20c_f_reference']").attr("disabled", true);
        
        checkOF20C.off('click').on('click', function() {
            if ($(this).is(':checked')) {
                container.find("[id*='div_opt_of20c_f']").show();
                container.find("[id*='_9101_of20c_f_reference']").attr("disabled", false);
            } else {
                container.find("[id*='div_opt_of20c_f']").hide();
                container.find("[id*='_9101_of20c_f_reference']").attr("disabled", true).val("");
            }
        });
        
        // Enable "Add Field MF95A" button
        container.find('[data-id*="mf95a_f"]').attr("disabled", false);
        
        // Enable "Add Field OF70A" button  
        container.find('[data-id*="of70a_f"]').attr("disabled", false);
    }
</script>

<!-- Rule view mode for existing data -->
<script language="javascript">
    $(document).ready(function() {
        
        //========================================
        // View Mode for Sequence F - Check existing data
        //========================================
        
        // Check MF95A options that have data
        $("[id^='type_mf95_f']").each(function() {
            let container = $(this).closest('.template_seq_div_rep');
            
            // Check which option has data
            if (container.find("[id^='_8801_mf95c_f']").val()) {
                $(this).val('c').trigger('change');
            } else if (container.find("[id^='_8803_mf95l_f']").val()) {
                $(this).val('l').trigger('change');
            } else if (container.find("[id^='_8805_mf95p_f']").val()) {
                $(this).val('p').trigger('change');
            } else if (container.find("[id^='_8807_mf95q_f']").val()) {
                $(this).val('q').trigger('change');
            } else if (container.find("[id^='_88011_mf95r_f']").val()) {
                $(this).val('r').trigger('change');
            } else if (container.find("[id^='_88019_mf95s_f']").val()) {
                $(this).val('s').trigger('change');
                
                // Check if data source scheme has value
                if (container.find("[id^='_88013_mf95s_f']").val()) {
                    container.find("[id^='check_mf95s_data_source_scheme_f']").prop('checked', true).trigger('click');
                }
            }
        });
        
        // Check OF97A options that have data
        $("[id^='type_of97_f']").each(function() {
            let container = $(this).closest('.template_container');
            
            if (container.find("[id^='_8901_of97a_f']").val()) {
                $(this).val('a').trigger('change');
            } else if (container.find("[id^='_8905_of97d_f']").val()) {
                $(this).val('d').trigger('change');
            }
        });
        
        // Check OF70A options that have data
        $("[id^='type_of70_f']").each(function() {
            let container = $(this).closest('.template_seq_div_rep');
            
            if (container.find("[id^='_9001_of70c_f']").val()) {
                $(this).val('c').trigger('change');
            } else if (container.find("[id^='_9003_of70d_f']").val()) {
                $(this).val('d').trigger('change');
            } else if (container.find("[id^='_9005_of70e_f']").val()) {
                $(this).val('e').trigger('change');
            }
        });
        
        // Check OF20C checkbox if data exists
        $("[id^='check_of20c_f']").each(function() {
            let container = $(this).closest('.template_container');
            
            if (container.find("[id^='_9101_of20c_f']").val()) {
                $(this).prop('checked', true).trigger('click');
            }
        });
        
    });
</script>