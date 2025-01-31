<script type="text/javascript">
    $(document).ready(function () {
        $("#form1").validate({
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

                //body
                //seq a
                _0020_mf20_sender_reference: "required",
                _0040_mf22a_type_of_operation: "required",
                _0060_mf22c_common_reference: "required",
                _0071_mf23a_settlement_method: "required",
                _0080_mf21n_contract_number_party_a: "required",
                _0100_mf30t_trade_date: "required",
                _0110_mf30v_effective_date: "required",
                _0120_mf30p_termination_date: "required",
                _0140_of32b_currency: "required",
                _0141_of32b_amount: "required",
                _0150_mf33b_currency: "required",
                _0151_mf33b_amount: "required",
                type_mf82_: "required",
                _0161_mf82a_identifier_code: "required",
                _0163_mf82d_name_and_address: "required",
                type_mf87_: "required",
                _0171_mf87a_identifier_code: "required",
                _0173_mf87d_name_and_address: "required",
                _0181_of83a_identifier_code: "required",
                _0183_of83d_name_and_address: "required",
                _0184_of83j_party_identification: "required",
                _0200_mf77h_type: "required",
                _0220_mf14c_year_of_definitions: "required",
                _0230_of72_code: "required",
                
                //seq b
                _0261_of37m_rate: "required",
                //sub seq b1
                _0280_mf18a_number_of_repetitions : "required",
                _0330_mf14a_business_day_convention : "required",
                _0340_mf18a_number_of_repetitions : "required",
                _0350_mf22b_financial_centre : "required",
                
                //seq c
                _0370_mf14f_floating_rate_option : "required",
                _0381_of37v_rate : "required",
                _0391_of37g_rate : "required",
                //sub seq c1
                _0410_mf14j_reset_date_specification: "required",
                _0420_of14g_frequency : "required",
                _0421_of14g_method : "required",
                _0430_mf38e_number : "required",
                _0431_mf38e_period : "required",
                _0440_mf18a_number_of_repetitions : "required",
                _0450_mf30f_payment_date : "required",
                _0460_mf17f_period_end_date_adjustment_indicator : "required",
                _0470_mf14d_day_count_convention : "required",
                _0490_mf18a_number_of_repetitions : "required",
                _0500_mf22b_financial_centre : "required",
                _0511_of37r_rate : "required",
                //sub seq c2
                _0520_mf22d_compounding_type : "required",
                _0530_mf18a_number_of_repetitions : "required",
                _0540_mf30x_compounding_date : "required",
                //sub seq c3
                _0550_of38g_number_from : "required",
                _0551_of38g_period_from : "required",
                _0552_of38g_number_to : "required",
                _0553_of38g_period_to : "required",
                _0560_of38h_number_from : "required",
                _0561_of38h_period_from : "required",
                _0562_of38h_number_to : "required",
                _0563_of38h_period_to : "required",
                
                //seq d
                _0581_of53a_identifier_code : "required",
                _0583_of53d_name_and_address : "required",
                _0591_of56a_identifier_code : "required",
                _0593_of56d_name_and_address : "required",
                _0601_of86a_identifier_code : "required",
                _0603_of86d_name_and_address : "required",
                type_mf57_account_with_institution : "required",
                _0611_mf57a_identifier_code : "required",
                _0613_mf57d_name_and_address : "required",
                
                //seq e
                _0631_of37m_rate : "required",
                //sub seq e
                _0650_mf18a_number_of_repetitions : "required",
                _0700_mf14a_business_day_convention : "required",
                _0710_mf18a_number_of_repetitions : "required",
                _0720_mf22b_financial_centre : "required",
                
                //seq f
                _0740_mf14f_floating_rate_option : "required",
                _0751_of37v_rate : "required",
                _0761_of37g_rate : "required",
                //sub seq f1
                _0780_mf14j_reset_date_specification : "required",
                _0790_of14g_frequency : "required",
                _0791_of14g_method : "required",
                _0801_mf38e_period : "required",
                _0810_mf18a_number_of_repetitions : "required",
                _0820_mf30f_payment_date : "required",
                _0830_mf17f_period_end_date_adjustment_indicator : "required",
                _0840_mf14d_day_count_fraction : "required",
                _0850_mf14a_business_day_convention : "required",
                _0860_mf18a_number_of_repetitions : "required",
                _0870_mf22b_financial_centre : "required",
                _0881_of37r_rate : "required",
                //sub seq f2
                _0890_mf22d_compounding_type : "required",
                _0900_mf18a_number_of_repetitions : "required",
                _0910_mf30x_compounding_date : "required",
                //sub seq f3
                _0920_of38g_number_from : "required",
                _0921_of38g_period_from : "required",
                _0922_of38g_number_to : "required",
                _0923_of38g_period_to : "required",
                _0930_of38h_number_from : "required",
                _0931_of38h_period_from : "required",
                _0932_of38h_number_to : "required",
                _0933_of38h_period_to : "required",
                
                //seq g
                _0952_of53d_party_identifier : "required",
                _0953_of53d_name_and_address : "required",
                _0961_of56a_identifier_code : "required",
                _0963_of56d_name_and_address : "required",
                _0971_of86a_identifier_code : "required",
                _0973_of86d_name_and_address : "required",
                type_mf57_account_with_institution_g : "required",
                _0981_mf57a_identifier_code : "required",
                _0983_mf57d_name_and_address : "required",
                
                
                //template
                template_name: "required"

            },
            messages:{
                sender_logical_terminal: {required: "sender_logical_terminal is required !"},
                receiver_institution: {required: "receiver_institution is required !"},
                priority: {required: "priority is required !"},
                //seq a
                _0020_mf20_sender_reference: {required: "0020_mf20_sender_reference is required !"},
                _0040_mf22a_type_of_operation: {required: "0040_mf22a_type_of_operation is required !"},
                _0060_mf22c_common_reference: {required: "0060_mf22c_common_reference is required !"},
                _0071_mf23a_settlement_method: {required: "0071_mf23a_settlement_method is required !"},
                _0080_mf21n_contract_number_party_a: {required: "0080_mf21n_contract_number_party_a is required !"},
                _0100_mf30t_trade_date: {required: "0100_mf30t_trade_date is required !"},
                _0110_mf30v_effective_date: {required: "0110_mf30v_effective_date is required !"},
                _0120_mf30p_termination_date: {required: "0120_mf30p_termination_date is required !"},
                _0140_of32b_currency: {required: "0140_of32b_currency is required !"},
                _0141_of32b_amount: {required: "0141_of32b_amount is required !"},
                _0150_mf33b_currency: {required: "0150_mf33b_currency is required !"},
                _0151_mf33b_amount: {required: "0151_mf33b_amount is required !"},
                type_mf82_: {required: "type_mf82 is required !"},
                _0161_mf82a_identifier_code: {required: "0161_mf82a_identifier_code is required !"},
                _0163_mf82d_name_and_address: {required: "0163_mf82d_name_and_address is required !"},
                type_mf87_: {required: "type_mf87 is required !"},
                _0171_mf87a_identifier_code: {required: "0171_mf87a_identifier_code is required !"},
                _0173_mf87d_name_and_address: {required: "0173_mf87d_name_and_address is required !"},
                _0181_of83a_identifier_code: {required: "0181_of83a_identifier_code is required !"},
                _0183_of83d_name_and_address: {required: "0183_of83d_name_and_address is required !"},
                _0184_of83j_party_identification: {required: "0184_of83j_party_identification is required !"},
                _0200_mf77h_type: {required: "0200_mf77h_type is required !"},
                _0220_mf14c_year_of_definitions: {required: "0220_mf14c_year_of_definitions is required !"},
                _0230_of72_code: {required: "0230_of72_code is required !"},
                
                //seq b
                _0261_of37m_rate: {required: "of37m_rat is required !"},
                //sub seq b1
                _0280_mf18a_number_of_repetitions : {required: "mf18a_number_of_repetitions is required !"},
                _0330_mf14a_business_day_convention : {required: "mf14a_business_day_convention is required !"},
                _0340_mf18a_number_of_repetitions : {required: "mf18a_number_of_repetitions is required !"},
                _0350_mf22b_financial_centre : {required: "mf22b_financial_centre is required !"},
                
                //seq c
                _0370_mf14f_floating_rate_option : {required: "mf14f_floating_rate_option is required !"},
                _0381_of37v_rate : {required: "of37v_rate is required !"},
                _0391_of37g_rate : {required: "of37g_rate is required !"},
                //sub seq c1
                _0410_mf14j_reset_date_specification: {required: "mf14j_reset_date_specificatio is required !"},
                _0420_of14g_frequency : {required: "of14g_frequency is required !"},
                _0421_of14g_method : {required: "of14g_method is required !"},
                _0430_mf38e_number : {required: "mf38e_number is required !"},
                _0431_mf38e_period : {required: "mf38e_period is required !"},
                _0440_mf18a_number_of_repetitions : {required: "mf18a_number_of_repetitions is required !"},
                _0450_mf30f_payment_date : {required: "mf30f_payment_date is required !"},
                _0460_mf17f_period_end_date_adjustment_indicator : {required: "mf17f_period_end_date_adjustment_indicator is required !"},
                _0470_mf14d_day_count_convention : {required: "mf14d_day_count_convention is required !"},
                _0490_mf18a_number_of_repetitions : {required: "mf18a_number_of_repetitions is required !"},
                _0500_mf22b_financial_centre : {required: "mf22b_financial_centre is required !"},
                _0511_of37r_rate : {required: "of37r_rate is required !"},
                //sub seq c2
                _0520_mf22d_compounding_type : {required: "mf22d_compounding_type is required !"},
                _0530_mf18a_number_of_repetitions : {required: "mf18a_number_of_repetitions is required !"},
                _0540_mf30x_compounding_date : {required: "mf30x_compounding_date is required !"},
                //sub seq c3
                _0550_of38g_number_from : {required: "of38g_number_from is required !"},
                _0551_of38g_period_from : {required: "of38g_period_from is required !"},
                _0552_of38g_number_to : {required: "of38g_number_to is required !"},
                _0553_of38g_period_to : {required: "of38g_period_to is required !"},
                _0560_of38h_number_from : {required: "of38h_number_from is required !"},
                _0561_of38h_period_from : {required: "of38h_period_from is required !"},
                _0562_of38h_number_to : {required: "of38h_number_to is required !"},
                _0563_of38h_period_to : {required: "of38h_period_to is required !"},
                
                //seq d
                _0581_of53a_identifier_code : {required: "of53a_identifier_code is required !"},
                _0583_of53d_name_and_address : {required: "of53d_name_and_address is required !"},
                _0591_of56a_identifier_code : {required: "of56a_identifier_code is required !"},
                _0593_of56d_name_and_address : {required: "of56d_name_and_address is required !"},
                _0601_of86a_identifier_code : {required: "of86a_identifier_code is required !"},
                _0603_of86d_name_and_address : {required: "of86d_name_and_address is required !"},
                type_mf57_account_with_institution : {required: "type_mf57_account_with_institution is required !"},
                _0611_mf57a_identifier_code : {required: "mf57a_identifier_code is required !"},
                _0613_mf57d_name_and_address : {required: "mf57d_name_and_address is required !"},
                
                //seq e
                _0631_of37m_rate : {required: "of37m_rate is required !"},
                //sub seq e
                _0650_mf18a_number_of_repetitions : {required: "mf18a_number_of_repetitions is required !"},
                _0700_mf14a_business_day_convention : {required: "mf14a_business_day_convention is required !"},
                _0710_mf18a_number_of_repetitions : {required: "mf18a_number_of_repetitions is required !"},
                _0720_mf22b_financial_centre : {required: "mf22b_financial_centre is required !"},
                
                //seq f
                _0740_mf14f_floating_rate_option : {required: "mf14f_floating_rate_option is required !"},
                _0751_of37v_rate : {required: "of37v_rate is required !"},
                _0761_of37g_rate : {required: "of37g_rate is required !"},
                //sub seq f1
                _0780_mf14j_reset_date_specification : {required: "mf14j_reset_date_specification is required !"},
                _0790_of14g_frequency : {required: "of14g_frequency is required !"},
                _0791_of14g_method : {required: "of14g_method is required !"},
                _0801_mf38e_period : {required: "mf38e_period is required !"},
                _0810_mf18a_number_of_repetitions : {required: "mf18a_number_of_repetitions is required !"},
                _0820_mf30f_payment_date : {required: "mf30f_payment_date is required !"},
                _0830_mf17f_period_end_date_adjustment_indicator : {required: "mf17f_period_end_date_adjustment_indicator is required !"},
                _0840_mf14d_day_count_fraction : {required: "mf14d_day_count_fraction is required !"},
                _0850_mf14a_business_day_convention : {required: "mf14a_business_day_convention is required !"},
                _0860_mf18a_number_of_repetitions : {required: "mf18a_number_of_repetitions is required !"},
                _0870_mf22b_financial_centre : {required: "mf22b_financial_centre is required !"},
                _0881_of37r_rate : {required: "of37r_rate is required !"},
                //sub seq f2
                _0890_mf22d_compounding_type : {required: "mf22d_compounding_type is required !"},
                _0900_mf18a_number_of_repetitions : {required: "mf18a_number_of_repetitions is required !"},
                _0910_mf30x_compounding_date : {required: "mf30x_compounding_date is required !"},
                //sub seq f3
                _0920_of38g_number_from : {required: "of38g_number_from is required !"},
                _0921_of38g_period_from : {required: "of38g_period_from is required !"},
                _0922_of38g_number_to : {required: "of38g_number_to is required !"},
                _0923_of38g_period_to : {required: "of38g_period_to is required !"},
                _0930_of38h_number_from : {required: "of38h_number_from is required !"},
                _0931_of38h_period_from : {required: "of38h_period_from is required !"},
                _0932_of38h_number_to : {required: "of38h_number_to is required !"},
                _0933_of38h_period_to : {required: "of38h_period_to is required !"},
                
                //seq g
                _0952_of53d_party_identifier : {required: "of53d_party_identifier is required !"},
                _0953_of53d_name_and_address : {required: "of53d_name_and_address is required !"},
                _0961_of56a_identifier_code : {required: "of56a_identifier_code is required !"},
                _0963_of56d_name_and_address : {required: "of56d_name_and_address is required !"},
                _0971_of86a_identifier_code : {required: "of86a_identifier_code is required !"},
                _0973_of86d_name_and_address : {required: "of86d_name_and_address is required !"},
                type_mf57_account_with_institution_g : {required: "type_mf57_account_with_institution_g is required !"},
                _0981_mf57a_identifier_code : {required: "mf57a_identifier_code is required !"},
                _0983_mf57d_name_and_address : {required: "mf57d_name_and_address is required !"},
                
                template_name: {required: "Template Name harus diisi..!!"}
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                alert(error.html());
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
            }
        });
    });
    
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function () {
        
        //template
        $("#check_template").hide();
        $("#template_name").attr("disabled", true);
        $("#flag_template_checkbox").click(function () {
            if ($("#flag_template_checkbox").is(":checked")) {
                $("#check_template").show();
                $("#template_name").attr("disabled", false);
            } else {
                $("#check_template").hide();
                $("#template_name").attr("disabled", true);
            }
        });
        
        //Mandatory Sequence A General Information
        //OF32B
        $("#check_of32b").hide();
        $("#_0140_of32b_currency").attr("disabled", true);
        $("#_0141_of32b_amount").attr("disabled", true);
        $("#party_b_currency_national_amount_checkbox").click(function(){
            if ($("#party_b_currency_national_amount_checkbox").is(":checked")){
                $("#check_of32b").show();
                $("#_0140_of32b_currency").attr("disabled", false);
                $("#_0141_of32b_amount").attr("disabled", false);
            } else {
                $("#check_of32b").hide();
                $("#_0140_of32b_currency").attr("disabled", true);
                $("#_0141_of32b_amount").attr("disabled", true);
            }
        });
        //end of the line
        //MF82_a_d
        $("#div_mf82_a").hide();
        $("#div_mf82_d").hide();
        $("#_0160_mf82a_party_identifier").attr("disabled", true);
        $("#_0161_mf82a_identifier_code").attr("disabled", true);
        $("#_0162_mf82d_party_identifier").attr("disabled", true);
        $("#_0163_mf82d_name_and_address").attr("disabled", true);
        $("#type_mf82_").change(function () {
            if ($("#type_mf82_").val() == "a") {
                $("#div_mf82_a").show();
                $("#div_mf82_d").hide();
                $("#_0160_mf82a_party_identifier").attr("disabled", false);
                $("#_0161_mf82a_identifier_code").attr("disabled", false);
                $("#_0162_mf82d_party_identifier").attr("disabled", true);
                $("#_0163_mf82d_name_and_address").attr("disabled", true);
            } else if ($("#type_mf82_").val() == "d") {
                $("#div_mf82_a").hide();
                $("#div_mf82_d").show();
                $("#_0160_mf82a_party_identifier").attr("disabled", true);
                $("#_0161_mf82a_identifier_code").attr("disabled", true);
                $("#_0162_mf82d_party_identifier").attr("disabled", false);
                $("#_0163_mf82d_name_and_address").attr("disabled", false);
            } else {
                $("#div_mf82_a").hide();
                $("#div_mf82_d").hide();
                $("#_0160_mf82a_party_identifier").attr("disabled", true);
                $("#_0161_mf82a_identifier_code").attr("disabled", true);
                $("#_0162_mf82d_party_identifier").attr("disabled", true);
                $("#_0163_mf82d_name_and_address").attr("disabled", true);
            }
        });
        //end of the line
        //MF87_a_d
        $("#div_mf87_a").hide();
        $("#div_mf87_d").hide();
        $("#_0170_mf87a_party_identifier").attr("disabled", true);
        $("#_0171_mf87a_identifier_code").attr("disabled", true);
        $("#_0172_mf87d_party_identifier").attr("disabled", true);
        $("#_0173_mf87d_name_and_address").attr("disabled", true);
        $("#type_mf87_").change(function () {
            if ($("#type_mf87_").val() == "a") {
                $("#div_mf87_a").show();
                $("#div_mf87_d").hide();
                $("#_0170_mf87a_party_identifier").attr("disabled", false);
                $("#_0171_mf87a_identifier_code").attr("disabled", false);
                $("#_0172_mf87d_party_identifier").attr("disabled", true);
                $("#_0173_mf87d_name_and_address").attr("disabled", true);
            } else if ($("#type_mf87_").val() == "d") {
                $("#div_mf87_a").hide();
                $("#div_mf87_d").show();
                $("#_0170_mf87a_party_identifier").attr("disabled", true);
                $("#_0171_mf87a_identifier_code").attr("disabled", true);
                $("#_0172_mf87d_party_identifier").attr("disabled", false);
                $("#_0173_mf87d_name_and_address").attr("disabled", false);
            } else {
                $("#div_mf87_a").hide();
                $("#div_mf87_d").hide();
                $("#_0170_mf87a_party_identifier").attr("disabled", true);
                $("#_0171_mf87a_identifier_code").attr("disabled", true);
                $("#_0172_mf87d_party_identifier").attr("disabled", true);
                $("#_0173_mf87d_name_and_address").attr("disabled", true);
            }
        });
        //end of the line
        //OF83_a_d_j
        $("#div_of83_a").hide();
        $("#div_of83_d").hide();
        $("#div_of83_j").hide();
        $("#_0180_of83a_party_identifier").attr("disabled", true);
        $("#_0181_of83a_identifier_code").attr("disabled", true);
        $("#_0182_of83d_party_identifier").attr("disabled", true);
        $("#_0183_of83d_name_and_address").attr("disabled", true);
        $("#_0184_of83j_party_identification").attr("disabled", true);
        $("#type_of83_").change(function () {
            if ($("#type_of83_").val() == "a") {
                $("#div_of83_a").show();
                $("#div_of83_d").hide();
                $("#div_of83_j").hide();
                $("#_0180_of83a_party_identifier").attr("disabled", false);
                $("#_0181_of83a_identifier_code").attr("disabled", false);
                $("#_0182_of83d_party_identifier").attr("disabled", true);
                $("#_0183_of83d_name_and_address").attr("disabled", true);
                $("#_0184_of83j_party_identification").attr("disabled", true);
            } else if ($("#type_of83_").val() == "d") {
                $("#div_of83_a").hide();
                $("#div_of83_d").show();
                $("#div_of83_j").hide();
                $("#_0180_of83a_party_identifier").attr("disabled", true);
                $("#_0181_of83a_identifier_code").attr("disabled", true);
                $("#_0182_of83d_party_identifier").attr("disabled", false);
                $("#_0183_of83d_name_and_address").attr("disabled", false);
                $("#_0184_of83j_party_identification").attr("disabled", true);
            } else if ($("#type_of83_").val() == "j") {
                $("#div_of83_a").hide();
                $("#div_of83_d").hide();
                $("#div_of83_j").show();
                $("#_0180_of83a_party_identifier").attr("disabled", true);
                $("#_0181_of83a_identifier_code").attr("disabled", true);
                $("#_0182_of83d_party_identifier").attr("disabled", true);
                $("#_0183_of83d_name_and_address").attr("disabled", true);
                $("#_0184_of83j_party_identification").attr("disabled", false);
            } else {
                $("#div_of83_a").hide();
                $("#div_of83_d").hide();
                $("#div_of83_j").hide();
                $("#_0180_of83a_party_identifier").attr("disabled", true);
                $("#_0181_of83a_identifier_code").attr("disabled", true);
                $("#_0182_of83d_party_identifier").attr("disabled", true);
                $("#_0183_of83d_name_and_address").attr("disabled", true);
                $("#_0184_of83j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //OF72
        $("#check_of72").hide();
        $("#_0230_of72_code").attr("disabled", true);
        $("#_0231_of72_narrative").attr("disabled", true);
        $("#sender_to_receiver_information_checkbox").click(function(){
            if ($("#sender_to_receiver_information_checkbox").is(":checked")){
                $("#check_of72").show();
                $("#_0230_of72_code").attr("disabled", false);
                $("#_0231_of72_narrative").attr("disabled", false);
            } else {
                $("#check_of72").hide();
                $("#_0230_of72_code").attr("disabled", true);
                $("#_0231_of72_narrative").attr("disabled", true);
            }
        });
        //end of the line
        
        //Optional Sequence B Fixed Interest Payable by Party B
        //SEQ B
        $("#check_seq_b").hide();
        $("#_0260_of37m_sign").attr("disabled", true);
        $("#_0261_of37m_rate").attr("disabled", true);
        $("#_0270_of37n_details_of_interest_rate").attr("disabled", true);
        $("#seq_b_checkbox").click(function () {
            if ($("#seq_b_checkbox").is(":checked")) {
                $("#check_seq_b").show();
                $("#sub_seq_b1_checkbox").attr("disabled", false);
                $("#_0260_of37m_sign").attr("disabled", false);
                $("#_0261_of37m_rate").attr("disabled", false);
                $("#_0270_of37n_details_of_interest_rate").attr("disabled", false);
            } else {
                $("#check_seq_b").hide();
                $("#sub_seq_b1_checkbox").attr("disabled", true);
                $("#_0260_of37m_sign").attr("disabled", true);
                $("#_0261_of37m_rate").attr("disabled", true);
                $("#_0270_of37n_details_of_interest_rate").attr("disabled", true);
            }
        });
        //end of the line
        //OF37M
        $("#check_of37m").hide();
        $("#_0260_of37m_sign").attr("disabled", true);
        $("#_0261_of37m_rate").attr("disabled", true);
        $("#fixed_rate_checkbox").click(function(){
            if ($("#fixed_rate_checkbox").is(":checked")){
                $("#check_of37m").show();
                $("#_0260_of37m_sign").attr("disabled", false);
                $("#_0261_of37m_rate").attr("disabled", false);
            } else {
                $("#check_of37m").hide();
                $("#_0260_of37m_sign").attr("disabled", true);
                $("#_0261_of37m_rate").attr("disabled", true);
            }
        });
        //end of the line
        
        //Optional Subsequence B1 Interest Details 
        //SUB SEQ B1
        $("#check_sub_seq_b1").hide();
        $("#_0280_mf18a_number_of_repetitions").attr("disabled", true);
        $("#_0310_of17f_period_end_date_adjustment_indicator").attr("disabled", true);
        $("#_0320_of14d_day_count_fraction").attr("disabled", true);
        $("#_0330_mf14a_business_day_convention").attr("disabled", true);
        $("#_0340_mf18a_number_of_repetitions").attr("disabled", true);
        $("#_0350_mf22b_financial_centre").attr("disabled", true);
        $("#sub_seq_b1_checkbox").click(function () {
            if ($("#sub_seq_b1_checkbox").is(":checked")) {
                $("#check_sub_seq_b1").show();
                $("#_0280_mf18a_number_of_repetitions").attr("disabled", false);
                $("#_0310_of17f_period_end_date_adjustment_indicator").attr("disabled", false);
                $("#_0320_of14d_day_count_fraction").attr("disabled", false);
                $("#_0330_mf14a_business_day_convention").attr("disabled", false);
                $("#_0340_mf18a_number_of_repetitions").attr("disabled", false);
                $("#_0350_mf22b_financial_centre").attr("disabled", false);
            } else {
                $("#check_sub_seq_b1").hide();
                $("#_0280_mf18a_number_of_repetitions").attr("disabled", true);
                $("#_0310_of17f_period_end_date_adjustment_indicator").attr("disabled", true);
                $("#_0320_of14d_day_count_fraction").attr("disabled", true);
                $("#_0330_mf14a_business_day_convention").attr("disabled", true);
                $("#_0340_mf18a_number_of_repetitions").attr("disabled", true);
                $("#_0350_mf22b_financial_centre").attr("disabled", true);
            }
        });
        //end of the line
        
        //Optional Sequence C Floating Interest Payable by Party B
        //SEQ C
        $("#check_seq_c").hide();
        $("#_0370_mf14f_floating_rate_option").attr("disabled", true);
        $("#_0380_of37v_sign").attr("disabled", true);
        $("#_0381_of37v_rate").attr("disabled", true);
        $("#_0390_of37g_sign").attr("disabled", true);
        $("#_0391_of37g_rate").attr("disabled", true);
        $("#_0400_of37n_details_of_interest_rate").attr("disabled", true);
        $("#seq_c_checkbox").click(function () {
            if ($("#seq_c_checkbox").is(":checked")) {
                $("#check_seq_c").show();
                $("#_0370_mf14f_floating_rate_option").attr("disabled", false);
                $("#_0380_of37v_sign").attr("disabled", false);
                $("#_0381_of37v_rate").attr("disabled", false);
                $("#_0390_of37g_sign").attr("disabled", false);
                $("#_0391_of37g_rate").attr("disabled", false);
                $("#_0400_of37n_details_of_interest_rate").attr("disabled", false);
            } else {
                $("#check_seq_c").hide();
                $("#_0370_mf14f_floating_rate_option").attr("disabled", true);
                $("#_0380_of37v_sign").attr("disabled", true);
                $("#_0381_of37v_rate").attr("disabled", true);
                $("#_0390_of37g_sign").attr("disabled", true);
                $("#_0391_of37g_rate").attr("disabled", true);
                $("#_0400_of37n_details_of_interest_rate").attr("disabled", true);
            }
        });
        //end of the line
        //OF37V
        $("#check_of37v").hide();
        $("#_0380_of37v_sign").attr("disabled", true);
        $("#_0381_of37v_rate").attr("disabled", true);
        $("#cap_rate_checkbox").click(function(){
            if ($("#cap_rate_checkbox").is(":checked")){
                $("#check_of37v").show();
                $("#_0380_of37v_sign").attr("disabled", false);
                $("#_0381_of37v_rate").attr("disabled", false);
            } else {
                $("#check_of37v").hide();
                $("#_0380_of37v_sign").attr("disabled", true);
                $("#_0381_of37v_rate").attr("disabled", true);
            }
        });
        //end of the line
        //OF37G
        $("#check_of37g").hide();
        $("#_0390_of37g_sign").attr("disabled", true);
        $("#_0391_of37g_rate").attr("disabled", true);
        $("#floor_rate_checkbox").click(function(){
            if ($("#floor_rate_checkbox").is(":checked")){
                $("#check_of37g").show();
                $("#_0390_of37g_sign").attr("disabled", false);
                $("#_0391_of37g_rate").attr("disabled", false);
            } else {
                $("#check_of37g").hide();
                $("#_0390_of37g_sign").attr("disabled", true);
                $("#_0391_of37g_rate").attr("disabled", true);
            }
        });
        //end of the line
        
        //Optional Subsequence C1 Interest Details
        //SUB SEQ C1
        $("#check_sub_seq_c1").hide();
        $("#_0410_mf14j_reset_date_specification").attr("disabled", true);
        $("#_0420_of14g_frequency").attr("disabled", true);
        $("#_0421_of14g_method").attr("disabled", true);
        $("#_0430_mf38e_number").attr("disabled", true);
        $("#_0431_mf38e_period").attr("disabled", true);
        $("#_0440_mf18a_number_of_repetitions").attr("disabled", true);
        $("#_0450_mf30f_payment_date").attr("disabled", true);
        $("#_0460_mf17f_period_end_date_adjustment_indicator").attr("disabled", true);
        $("#_0470_mf14d_day_count_convention").attr("disabled", true);
        $("#_0480_mf14a_business_day_convention").attr("disabled", true);
        $("#_0490_mf18a_number_of_repetitions").attr("disabled", true);
        $("#_0500_mf22b_financial_centre").attr("disabled", true);
        $("#_0510_of37r_sign").attr("disabled", true);
        $("#_0511_of37r_rate").attr("disabled", true);
        $("#sub_seq_c1_checkbox").click(function () {
            if ($("#sub_seq_c1_checkbox").is(":checked")) {
                $("#check_sub_seq_c1").show();
                $("#_0410_mf14j_reset_date_specification").attr("disabled", false);
                $("#_0420_of14g_frequency").attr("disabled", false);
                $("#_0421_of14g_method").attr("disabled", false);
                $("#_0430_mf38e_number").attr("disabled", false);
                $("#_0431_mf38e_period").attr("disabled", false);
                $("#_0440_mf18a_number_of_repetitions").attr("disabled", false);
                $("#_0450_mf30f_payment_date").attr("disabled", false);
                $("#_0460_mf17f_period_end_date_adjustment_indicator").attr("disabled", false);
                $("#_0470_mf14d_day_count_convention").attr("disabled", false);
                $("#_0480_mf14a_business_day_convention").attr("disabled", false);
                $("#_0490_mf18a_number_of_repetitions").attr("disabled", false);
                $("#_0500_mf22b_financial_centre").attr("disabled", false);
                $("#_0510_of37r_sign").attr("disabled", false);
                $("#_0511_of37r_rate").attr("disabled", false);
            } else {
                $("#check_sub_seq_c1").hide();
                $("#_0410_mf14j_reset_date_specification").attr("disabled", true);
                $("#_0420_of14g_frequency").attr("disabled", true);
                $("#_0421_of14g_method").attr("disabled", true);
                $("#_0430_mf38e_number").attr("disabled", true);
                $("#_0431_mf38e_period").attr("disabled", true);
                $("#_0440_mf18a_number_of_repetitions").attr("disabled", true);
                $("#_0450_mf30f_payment_date").attr("disabled", true);
                $("#_0460_mf17f_period_end_date_adjustment_indicator").attr("disabled", true);
                $("#_0470_mf14d_day_count_convention").attr("disabled", true);
                $("#_0480_mf14a_business_day_convention").attr("disabled", true);
                $("#_0490_mf18a_number_of_repetitions").attr("disabled", true);
                $("#_0500_mf22b_financial_centre").attr("disabled", true);
                $("#_0510_of37r_sign").attr("disabled", true);
                $("#_0511_of37r_rate").attr("disabled", true);
            }
        });
        //end of the line
        //OF14G
        $("#check_of14g").hide();
        $("#_0420_of14g_frequency").attr("disabled", true);
        $("#_0421_of14g_method").attr("disabled", true);
        $("#averaging_frequency_method_checkbox").click(function () {
            if ($("#averaging_frequency_method_checkbox").is(":checked")) {
                $("#check_of14g").show();
                $("#_0420_of14g_frequency").attr("disabled", false);
                $("#_0421_of14g_method").attr("disabled", false);
            } else {
                $("#check_of14g").hide();
                $("#_0420_of14g_frequency").attr("disabled", true);
                $("#_0421_of14g_method").attr("disabled", true);
            }
        });
        //end of the line
        //OF37R
        $("#check_of37r").hide();
        $("#_0510_of37r_sign").attr("disabled", true);
        $("#_0511_of37r_rate").attr("disabled", true);
        $("#spread_checkbox").click(function () {
            if ($("#spread_checkbox").is(":checked")) {
                $("#check_of37r").show();
                $("#_0510_of37r_sign").attr("disabled", false);
                $("#_0511_of37r_rate").attr("disabled", false);
            } else {
                $("#check_of37r").hide();
                $("#_0510_of37r_sign").attr("disabled", true);
                $("#_0511_of37r_rate").attr("disabled", true);
            }
        });
        //end of the line
        
        //Optional Subsequence C2 Compounding Details
        //SUB SEQ C2
        $("#check_sub_seq_c2").hide();
        $("#_0520_mf22d_compounding_type").attr("disabled", true);
        $("#_0530_mf18a_number_of_repetitions").attr("disabled", true);
        $("#_0540_mf30x_compounding_date").attr("disabled", true);
        $("#sub_seq_c2_checkbox").click(function () {
            if ($("#sub_seq_c2_checkbox").is(":checked")) {
                $("#check_sub_seq_c2").show();
                $("#_0520_mf22d_compounding_type").attr("disabled", false);
                $("#_0530_mf18a_number_of_repetitions").attr("disabled", false);
                $("#_0540_mf30x_compounding_date").attr("disabled", false);
            } else {
                $("#check_sub_seq_c2").hide();
                $("#_0520_mf22d_compounding_type").attr("disabled", true);
                $("#_0530_mf18a_number_of_repetitions").attr("disabled", true);
                $("#_0540_mf30x_compounding_date").attr("disabled", true);
            }
        });
        //end of the line
        
        //Optional Subsequence C3 Interpolation for Stub Periods
        //SUB SEQ C3
        $("#check_sub_seq_c3").hide();
        $("#_0550_of38g_number_from").attr("disabled", true);
        $("#_0551_of38g_period_from").attr("disabled", true);
        $("#_0552_of38g_number_to").attr("disabled", true);
        $("#_0553_of38g_period_to").attr("disabled", true);
        $("#_0560_of38h_number_from").attr("disabled", true);
        $("#_0561_of38h_period_from").attr("disabled", true);
        $("#_0562_of38h_number_to").attr("disabled", true);
        $("#_0563_of38h_period_to").attr("disabled", true);
        $("#sub_seq_c3_checkbox").click(function () {
            if ($("#sub_seq_c3_checkbox").is(":checked")) {
                $("#check_sub_seq_c3").show();
                $("#_0550_of38g_number_from").attr("disabled", false);
                $("#_0551_of38g_period_from").attr("disabled", false);
                $("#_0552_of38g_number_to").attr("disabled", false);
                $("#_0553_of38g_period_to").attr("disabled", false);
                $("#_0560_of38h_number_from").attr("disabled", false);
                $("#_0561_of38h_period_from").attr("disabled", false);
                $("#_0562_of38h_number_to").attr("disabled", false);
                $("#_0563_of38h_period_to").attr("disabled", false);
            } else {
                $("#check_sub_seq_c3").hide();
                $("#_0550_of38g_number_from").attr("disabled", true);
                $("#_0551_of38g_period_from").attr("disabled", true);
                $("#_0552_of38g_number_to").attr("disabled", true);
                $("#_0553_of38g_period_to").attr("disabled", true);
                $("#_0560_of38h_number_from").attr("disabled", true);
                $("#_0561_of38h_period_from").attr("disabled", true);
                $("#_0562_of38h_number_to").attr("disabled", true);
                $("#_0563_of38h_period_to").attr("disabled", true);
            }
        });
        //end of the line
        //OF38G
        $("#check_of38g").hide();
        $("#_0550_of38g_number_from").attr("disabled", true);
        $("#_0551_of38g_period_from").attr("disabled", true);
        $("#_0552_of38g_number_to").attr("disabled", true);
        $("#_0553_of38g_period_to").attr("disabled", true);
        $("#of38g_checkbox").click(function () {
            if ($("#of38g_checkbox").is(":checked")) {
                $("#check_of38g").show();
                $("#_0550_of38g_number_from").attr("disabled", false);
                $("#_0551_of38g_period_from").attr("disabled", false);
                $("#_0552_of38g_number_to").attr("disabled", false);
                $("#_0553_of38g_period_to").attr("disabled", false);
            } else {
                $("#check_of38g").hide();
                $("#_0550_of38g_number_from").attr("disabled", true);
                $("#_0551_of38g_period_from").attr("disabled", true);
                $("#_0552_of38g_number_to").attr("disabled", true);
                $("#_0553_of38g_period_to").attr("disabled", true);
            }
        });
        //end of the line
        //OF38H
        $("#check_of38h").hide();
        $("#_0560_of38h_number_from").attr("disabled", true);
        $("#_0561_of38h_period_from").attr("disabled", true);
        $("#_0562_of38h_number_to").attr("disabled", true);
        $("#_0563_of38h_period_to").attr("disabled", true);
        $("#of38h_checkbox").click(function () {
            if ($("#of38h_checkbox").is(":checked")) {
                $("#check_of38h").show();
                $("#_0560_of38h_number_from").attr("disabled", false);
                $("#_0561_of38h_period_from").attr("disabled", false);
                $("#_0562_of38h_number_to").attr("disabled", false);
                $("#_0563_of38h_period_to").attr("disabled", false);
            } else {
                $("#check_of38h").hide();
                $("#_0560_of38h_number_from").attr("disabled", true);
                $("#_0561_of38h_period_from").attr("disabled", true);
                $("#_0562_of38h_number_to").attr("disabled", true);
                $("#_0563_of38h_period_to").attr("disabled", true);
            }
        });
        //end of the line
        
        //Mandatory Sequence D Payment Instructions for Interest Payable by Party B
        //SEQ D
        //OF53_a_d
        $("#div_of53a_").hide();
        $("#div_of53d_").hide();
        $("#_0580_of53a_party_identifier").attr("disabled", true);
        $("#_0581_of53a_identifier_code").attr("disabled", true);
        $("#_0582_of53d_party_identifier").attr("disabled", true);
        $("#_0583_of53d_name_and_address").attr("disabled", true);
        $("#type_of53_").change(function() {
            if ( $("#type_of53_").val() == "a"){
                $("#div_of53a_").show();
                $("#div_of53d_").hide();
                $("#_0580_of53a_party_identifier").attr("disabled", false);
                $("#_0581_of53a_identifier_code").attr("disabled", false);
                $("#_0582_of53d_party_identifier").attr("disabled", true);
                $("#_0583_of53d_name_and_address").attr("disabled", true);
            } else if ( $("#type_of53_").val() == "d"){
                $("#div_of53a_").hide();
                $("#div_of53d_").show();
                $("#_0580_of53a_party_identifier").attr("disabled", true);
                $("#_0581_of53a_identifier_code").attr("disabled", true);
                $("#_0582_of53d_party_identifier").attr("disabled", false);
                $("#_0583_of53d_name_and_address").attr("disabled", false);
            } else{
                $("#div_of53a_").hide();
                $("#div_of53d_").hide();
                $("#_0580_of53a_party_identifier").attr("disabled", true);
                $("#_0581_of53a_identifier_code").attr("disabled", true);
                $("#_0582_of53d_party_identifier").attr("disabled", true);
                $("#_0583_of53d_name_and_address").attr("disabled", true);
            }
        });
        //end of the line
        //OF56_a_d
        $("#div_of56a").hide();
        $("#div_of56d").hide();
        $("#_0590_of56a_party_identifier").attr("disabled", true);
        $("#_0591_of56a_identifier_code").attr("disabled", true);
        $("#_0592_of56d_party_identifier").attr("disabled", true);
        $("#_0593_of56d_name_and_address").attr("disabled", true);
        $("#type_of56").change(function() {
            if ( $("#type_of56").val() == "a"){
                $("#div_of56a").show();
                $("#div_of56d").hide();
                $("#_0590_of56a_party_identifier").attr("disabled", false);
                $("#_0591_of56a_identifier_code").attr("disabled", false);
                $("#_0592_of56d_party_identifier").attr("disabled", true);
                $("#_0593_of56d_name_and_address").attr("disabled", true);
            } else if ( $("#type_of56").val() == "d"){
                $("#div_of56a").hide();
                $("#div_of56d").show();
                $("#_0590_of56a_party_identifier").attr("disabled", true);
                $("#_0591_of56a_identifier_code").attr("disabled", true);
                $("#_0592_of56d_party_identifier").attr("disabled", false);
                $("#_0593_of56d_name_and_address").attr("disabled", false);
            } else{
                $("#div_of56a").hide();
                $("#div_of56d").hide();
                $("#_0590_of56a_party_identifier").attr("disabled", true);
                $("#_0591_of56a_identifier_code").attr("disabled", true);
                $("#_0592_of56d_party_identifier").attr("disabled", true);
                $("#_0593_of56d_name_and_address").attr("disabled", true);
            }
        });
        //end of the line
        //OF86_a_d
        $("#div_of86a_").hide();
        $("#div_of86d_").hide();
        $("#_0600_of86a_party_identifier").attr("disabled", true);
        $("#_0601_of86a_identifier_code").attr("disabled", true);
        $("#_0602_of86d_party_identifier").attr("disabled", true);
        $("#_0603_of86d_name_and_address").attr("disabled", true);
        $("#type_of86_").change(function() {
            if ( $("#type_of86_").val() == "a"){
                $("#div_of86a_").show();
                $("#div_of86d_").hide();
                $("#_0600_of86a_party_identifier").attr("disabled", false);
                $("#_0601_of86a_identifier_code").attr("disabled", false);
                $("#_0602_of86d_party_identifier").attr("disabled", true);
                $("#_0603_of86d_name_and_address").attr("disabled", true);
            } else if ( $("#type_of86_").val() == "d"){
                $("#div_of86a_").hide();
                $("#div_of86d_").show();
                $("#_0600_of86a_party_identifier").attr("disabled", true);
                $("#_0601_of86a_identifier_code").attr("disabled", true);
                $("#_0602_of86d_party_identifier").attr("disabled", false);
                $("#_0603_of86d_name_and_address").attr("disabled", false);
            } else{
                $("#div_of86a_").hide();
                $("#div_of86d_").hide();
                $("#_0600_of86a_party_identifier").attr("disabled", true);
                $("#_0601_of86a_identifier_code").attr("disabled", true);
                $("#_0602_of86d_party_identifier").attr("disabled", true);
                $("#_0603_of86d_name_and_address").attr("disabled", true);
            }
        });
        //end of the line
        //MF57_a_d
        $("#div_mf57a_").hide();
        $("#div_mf57d_").hide();
        $("#_0610_mf57a_party_identifier").attr("disabled", true);
        $("#_0611_mf57a_identifier_code").attr("disabled", true);
        $("#_0612_mf57d_party_identifier").attr("disabled", true);
        $("#_0613_mf57d_name_and_address").attr("disabled", true);
        $("#type_mf57_account_with_institution").change(function() {
            if ( $("#type_mf57_account_with_institution").val() == "a"){
                $("#div_mf57a_").show();
                $("#div_mf57d_").hide();
                $("#_0610_mf57a_party_identifier").attr("disabled", false);
                $("#_0611_mf57a_identifier_code").attr("disabled", false);
                $("#_0612_mf57d_party_identifier").attr("disabled", true);
                $("#_0613_mf57d_name_and_address").attr("disabled", true);
            } else if ( $("#type_mf57_account_with_institution").val() == "d"){
                $("#div_mf57a_").hide();
                $("#div_mf57d_").show();
                $("#_0610_mf57a_party_identifier").attr("disabled", true);
                $("#_0611_mf57a_identifier_code").attr("disabled", true);
                $("#_0612_mf57d_party_identifier").attr("disabled", false);
                $("#_0613_mf57d_name_and_address").attr("disabled", false);
            } else{
                $("#div_mf57a_").hide();
                $("#div_mf57d_").hide();
                $("#_0610_mf57a_party_identifier").attr("disabled", true);
                $("#_0611_mf57a_identifier_code").attr("disabled", true);
                $("#_0612_mf57d_party_identifier").attr("disabled", true);
                $("#_0613_mf57d_name_and_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //Optional Sequence E Fixed Interest Payable by Party A
        //SEQ E
        $("#check_seq_e").hide();
        $("#_0630_of37m_sign").attr("disabled", true);
        $("#_0631_of37m_rate").attr("disabled", true);
        $("#_0640_of37n_details_of_interest_rate").attr("disabled", true);
        $("#seq_e_checkbox").click(function () {
            if ($("#seq_e_checkbox").is(":checked")) {
                $("#check_seq_e").show();
                $("#_0630_of37m_sign").attr("disabled", false);
                $("#_0631_of37m_rate").attr("disabled", false);
                $("#_0640_of37n_details_of_interest_rate").attr("disabled", false);
            } else {
                $("#check_seq_e").hide();
                $("#_0630_of37m_sign").attr("disabled", true);
                $("#_0631_of37m_rate").attr("disabled", true);
                $("#_0640_of37n_details_of_interest_rate").attr("disabled", true);
            }
        });
        //end of the line
        //OF37M
        $("#check_of37m_e").hide();
        $("#_0630_of37m_sign").attr("disabled", true);
        $("#_0631_of37m_rate").attr("disabled", true);
        $("#fixed_rate_checkbox_e").click(function(){
            if ($("#fixed_rate_checkbox_e").is(":checked")){
                $("#check_of37m_e").show();
                $("#_0630_of37m_sign").attr("disabled", false);
                $("#_0631_of37m_rate").attr("disabled", false);
            } else {
                $("#check_of37m_e").hide();
                $("#_0630_of37m_sign").attr("disabled", true);
                $("#_0631_of37m_rate").attr("disabled", true);
            }
        });
        //end of the line
        
        //Optional Subsequence E1 Interest Details
        //SUB SEQ E1
        $("#check_sub_seq_e1").hide();
        $("#_0650_mf18a_number_of_repetitions").attr("disabled", true);
        $("#_0680_of17f_period_end_date_adjustment_indicator").attr("disabled", true);
        $("#_0690_of14d_day_count_fraction").attr("disabled", true);
        $("#_0700_mf14a_business_day_convention").attr("disabled", true);
        $("#_0710_mf18a_number_of_repetitions").attr("disabled", true);
        $("#_0720_mf22b_financial_centre").attr("disabled", true);
        $("#sub_seq_e1_checkbox").click(function () {
            if ($("#sub_seq_e1_checkbox").is(":checked")) {
                $("#check_sub_seq_e1").show();
                $("#_0650_mf18a_number_of_repetitions").attr("disabled", false);
                $("#_0680_of17f_period_end_date_adjustment_indicator").attr("disabled", false);
                $("#_0690_of14d_day_count_fraction").attr("disabled", false);
                $("#_0700_mf14a_business_day_convention").attr("disabled", false);
                $("#_0710_mf18a_number_of_repetitions").attr("disabled", false);
                $("#_0720_mf22b_financial_centre").attr("disabled", false);
            } else {
                $("#check_sub_seq_e1").hide();
                $("#_0650_mf18a_number_of_repetitions").attr("disabled", true);
                $("#_0680_of17f_period_end_date_adjustment_indicator").attr("disabled", true);
                $("#_0690_of14d_day_count_fraction").attr("disabled", true);
                $("#_0700_mf14a_business_day_convention").attr("disabled", true);
                $("#_0710_mf18a_number_of_repetitions").attr("disabled", true);
                $("#_0720_mf22b_financial_centre").attr("disabled", true);
            }
        });
        //end of the line
        
        
        //Optional Sequence F Floating Interest Payable by Party A
        //SEQ F
        $("#check_seq_f").hide();
        $("#_0740_mf14f_floating_rate_option").attr("disabled", true);
        $("#_0750_of37v_sign").attr("disabled", true);
        $("#_0751_of37v_rate").attr("disabled", true);
        $("#_0760_of37g_sign").attr("disabled", true);
        $("#_0761_of37g_rate").attr("disabled", true);
        $("#_0770_of37n_details_of_interest_rate").attr("disabled", true);
        $("#seq_f_checkbox").click(function () {
            if ($("#seq_f_checkbox").is(":checked")) {
                $("#check_seq_f").show();
                $("#_0740_mf14f_floating_rate_option").attr("disabled", false);
                $("#_0750_of37v_sign").attr("disabled", false);
                $("#_0751_of37v_rate").attr("disabled", false);
                $("#_0760_of37g_sign").attr("disabled", false);
                $("#_0761_of37g_rate").attr("disabled", false);
                $("#_0770_of37n_details_of_interest_rate").attr("disabled", false);
            } else {
                $("#check_seq_f").hide();
                $("#_0740_mf14f_floating_rate_option").attr("disabled", true);
                $("#_0750_of37v_sign").attr("disabled", true);
                $("#_0751_of37v_rate").attr("disabled", true);
                $("#_0760_of37g_sign").attr("disabled", true);
                $("#_0761_of37g_rate").attr("disabled", true);
                $("#_0770_of37n_details_of_interest_rate").attr("disabled", true);
            }
        });
        //end of the line
        //OF37V
        $("#check_of37v_f").hide();
        $("#_0750_of37v_sign").attr("disabled", true);
        $("#_0751_of37v_rate").attr("disabled", true);
        $("#cap_rate_checkbox_f").click(function(){
            if ($("#cap_rate_checkbox_f").is(":checked")){
                $("#check_of37v_f").show();
                $("#_0750_of37v_sign").attr("disabled", false);
                $("#_0751_of37v_rate").attr("disabled", false);
            } else {
                $("#check_of37v_f").hide();
                $("#_0750_of37v_sign").attr("disabled", true);
                $("#_0751_of37v_rate").attr("disabled", true);
            }
        });
        //end of the line
        //OF37G
        $("#check_of37g_f").hide();
        $("#_0760_of37g_sign").attr("disabled", true);
        $("#_0761_of37g_rate").attr("disabled", true);
        $("#floor_rate_checkbox_f").click(function(){
            if ($("#floor_rate_checkbox_f").is(":checked")){
                $("#check_of37g_f").show();
                $("#_0760_of37g_sign").attr("disabled", false);
                $("#_0761_of37g_rate").attr("disabled", false);
            } else {
                $("#check_of37g_f").hide();
                $("#_0760_of37g_sign").attr("disabled", true);
                $("#_0761_of37g_rate").attr("disabled", true);
            }
        });
        //end of the line
        
        //Optional Subsequence F1 Interest Details
        //SUB SEQ F1
        $("#check_sub_seq_f1").hide();
        $("#_0780_mf14j_reset_date_specification").attr("disabled", true);
        $("#_0790_of14g_frequency").attr("disabled", true);
        $("#_0791_of14g_method").attr("disabled", true);
        $("#_0800_mf38e_number").attr("disabled", true);
        $("#_0801_mf38e_period").attr("disabled", true);
        $("#_0810_mf18a_number_of_repetitions").attr("disabled", true);
        $("#_0820_mf30f_payment_date").attr("disabled", true);
        $("#_0830_mf17f_period_end_date_adjustment_indicator").attr("disabled", true);
        $("#_0840_mf14d_day_count_convention").attr("disabled", true);
        $("#_0850_mf14a_business_day_convention").attr("disabled", true);
        $("#_0860_mf18a_number_of_repetitions").attr("disabled", true);
        $("#_0870_mf22b_financial_centre").attr("disabled", true);
        $("#_0880_of37r_sign").attr("disabled", true);
        $("#_0881_of37r_rate").attr("disabled", true);
        $("#sub_seq_f1_checkbox").click(function () {
            if ($("#sub_seq_f1_checkbox").is(":checked")) {
                $("#check_sub_seq_f1").show();
                $("#_0780_mf14j_reset_date_specification").attr("disabled", false);
                $("#_0790_of14g_frequency").attr("disabled", false);
                $("#_0791_of14g_method").attr("disabled", false);
                $("#_0800_mf38e_number").attr("disabled", false);
                $("#_0801_mf38e_period").attr("disabled", false);
                $("#_0810_mf18a_number_of_repetitions").attr("disabled", false);
                $("#_0820_mf30f_payment_date").attr("disabled", false);
                $("#_0830_mf17f_period_end_date_adjustment_indicator").attr("disabled", false);
                $("#_0840_mf14d_day_count_convention").attr("disabled", false);
                $("#_0850_mf14a_business_day_convention").attr("disabled", false);
                $("#_0860_mf18a_number_of_repetitions").attr("disabled", false);
                $("#_0870_mf22b_financial_centre").attr("disabled", false);
                $("#_0880_of37r_sign").attr("disabled", false);
                $("#_0881_of37r_rate").attr("disabled", false);
            } else {
                $("#check_sub_seq_f1").hide();
                $("#_0780_mf14j_reset_date_specification").attr("disabled", true);
                $("#_0790_of14g_frequency").attr("disabled", true);
                $("#_0791_of14g_method").attr("disabled", true);
                $("#_0800_mf38e_number").attr("disabled", true);
                $("#_0801_mf38e_period").attr("disabled", true);
                $("#_0810_mf18a_number_of_repetitions").attr("disabled", true);
                $("#_0820_mf30f_payment_date").attr("disabled", true);
                $("#_0830_mf17f_period_end_date_adjustment_indicator").attr("disabled", true);
                $("#_0840_mf14d_day_count_convention").attr("disabled", true);
                $("#_0850_mf14a_business_day_convention").attr("disabled", true);
                $("#_0860_mf18a_number_of_repetitions").attr("disabled", true);
                $("#_0870_mf22b_financial_centre").attr("disabled", true);
                $("#_0880_of37r_sign").attr("disabled", true);
                $("#_0881_of37r_rate").attr("disabled", true);
            }
        });
        //end of the line
        //OF14G
        $("#check_of14g_f").hide();
        $("#_0790_of14g_frequency").attr("disabled", true);
        $("#_0791_of14g_method").attr("disabled", true);
        $("#averaging_frequency_method_checkbox_f").click(function () {
            if ($("#averaging_frequency_method_checkbox_f").is(":checked")) {
                $("#check_of14g_f").show();
                $("#_0790_of14g_frequency").attr("disabled", false);
                $("#_0791_of14g_method").attr("disabled", false);
            } else {
                $("#check_of14g_f").hide();
                $("#_0790_of14g_frequency").attr("disabled", true);
                $("#_0791_of14g_method").attr("disabled", true);
            }
        });
        //end of the line
        //OF37R
        $("#check_of37r_f").hide();
        $("#_0880_of37r_sign").attr("disabled", true);
        $("#_0881_of37r_rate").attr("disabled", true);
        $("#spread_checkbox_f").click(function () {
            if ($("#spread_checkbox_f").is(":checked")) {
                $("#check_of37r_f").show();
                $("#_0880_of37r_sign").attr("disabled", false);
                $("#_0881_of37r_rate").attr("disabled", false);
            } else {
                $("#check_of37r_f").hide();
                $("#_0880_of37r_sign").attr("disabled", true);
                $("#_0881_of37r_rate").attr("disabled", true);
            }
        });
        //end of the line
        
        //Optional Subsequence F2 Compounding Details
        //SUB SEQ F2
        $("#check_sub_seq_f2").hide();
        $("#_0890_mf22d_compounding_type").attr("disabled", true);
        $("#_0900_mf18a_number_of_repetitions").attr("disabled", true);
        $("#_0910_mf30x_compounding_date").attr("disabled", true);
        $("#sub_seq_f2_checkbox").click(function () {
            if ($("#sub_seq_f2_checkbox").is(":checked")) {
                $("#check_sub_seq_f2").show();
                $("#_0890_mf22d_compounding_type").attr("disabled", false);
                $("#_0900_mf18a_number_of_repetitions").attr("disabled", false);
                $("#_0910_mf30x_compounding_date").attr("disabled", false);
            } else {
                $("#check_sub_seq_f2").hide();
                $("#_0890_mf22d_compounding_type").attr("disabled", true);
                $("#_0900_mf18a_number_of_repetitions").attr("disabled", true);
                $("#_0910_mf30x_compounding_date").attr("disabled", true);
            }
        });
        //end of the line
        
        //Optional Subsequence F3 Interpolation for Stub Periods
        //SUB SEQ F3
        $("#check_sub_seq_f3").hide();
        $("#_0920_of38g_number_from").attr("disabled", true);
        $("#_0921_of38g_period_from").attr("disabled", true);
        $("#_0922_of38g_number_to").attr("disabled", true);
        $("#_0923_of38g_period_to").attr("disabled", true);
        $("#_0930_of38h_number_from").attr("disabled", true);
        $("#_0931_of38h_period_from").attr("disabled", true);
        $("#_0932_of38h_number_to").attr("disabled", true);
        $("#_0933_of38h_period_to").attr("disabled", true);
        $("#sub_seq_f3_checkbox").click(function () {
            if ($("#sub_seq_f3_checkbox").is(":checked")) {
                $("#check_sub_seq_f3").show();
                $("#_0920_of38g_number_from").attr("disabled", false);
                $("#_0921_of38g_period_from").attr("disabled", false);
                $("#_0922_of38g_number_to").attr("disabled", false);
                $("#_0923_of38g_period_to").attr("disabled", false);
                $("#_0930_of38h_number_from").attr("disabled", false);
                $("#_0931_of38h_period_from").attr("disabled", false);
                $("#_0932_of38h_number_to").attr("disabled", false);
                $("#_0933_of38h_period_to").attr("disabled", false);
            } else {
                $("#check_sub_seq_f3").hide();
                $("#_0920_of38g_number_from").attr("disabled", true);
                $("#_0921_of38g_period_from").attr("disabled", true);
                $("#_0922_of38g_number_to").attr("disabled", true);
                $("#_0923_of38g_period_to").attr("disabled", true);
                $("#_0930_of38h_number_from").attr("disabled", true);
                $("#_0931_of38h_period_from").attr("disabled", true);
                $("#_0932_of38h_number_to").attr("disabled", true);
                $("#_0933_of38h_period_to").attr("disabled", true);
            }
        });
        //end of the line
        //OF38G
        $("#check_of38g_f").hide();
        $("#_0920_of38g_number_from").attr("disabled", true);
        $("#_0921_of38g_period_from").attr("disabled", true);
        $("#_0922_of38g_number_to").attr("disabled", true);
        $("#_0923_of38g_period_to").attr("disabled", true);
        $("#of38g_checkbox_f").click(function () {
            if ($("#of38g_checkbox_f").is(":checked")) {
                $("#check_of38g_f").show();
                $("#_0920_of38g_number_from").attr("disabled", false);
                $("#_0921_of38g_period_from").attr("disabled", false);
                $("#_0922_of38g_number_to").attr("disabled", false);
                $("#_0923_of38g_period_to").attr("disabled", false);
            } else {
                $("#check_of38g_f").hide();
                $("#_0920_of38g_number_from").attr("disabled", true);
                $("#_0921_of38g_period_from").attr("disabled", true);
                $("#_0922_of38g_number_to").attr("disabled", true);
                $("#_0923_of38g_period_to").attr("disabled", true);
            }
        });
        //end of the line
        //OF38H
        $("#check_of38h_f").hide();
        $("#_0930_of38h_number_from").attr("disabled", true);
        $("#_0931_of38h_period_from").attr("disabled", true);
        $("#_0932_of38h_number_to").attr("disabled", true);
        $("#_0933_of38h_period_to").attr("disabled", true);
        $("#of38h_checkbox_f").click(function () {
            if ($("#of38h_checkbox_f").is(":checked")) {
                $("#check_of38h_f").show();
                $("#_0930_of38h_number_from").attr("disabled", false);
                $("#_0931_of38h_period_from").attr("disabled", false);
                $("#_0932_of38h_number_to").attr("disabled", false);
                $("#_0933_of38h_period_to").attr("disabled", false);
            } else {
                $("#check_of38h_f").hide();
                $("#_0930_of38h_number_from").attr("disabled", true);
                $("#_0931_of38h_period_from").attr("disabled", true);
                $("#_0932_of38h_number_to").attr("disabled", true);
                $("#_0933_of38h_period_to").attr("disabled", true);
            }
        });
        //end of the line
        
        //Mandatory Sequence G Payment Instructions for Interest Payable by Party A
        //SEQ G
        //OF53_a_d
        $("#div_of53a_g").hide();
        $("#div_of53d_g").hide();
        $("#_0950_of53a_party_identifier").attr("disabled", true);
        $("#_0951_of53a_identifier_code").attr("disabled", true);
        $("#_0952_of53d_party_identifier").attr("disabled", true);
        $("#_0953_of53d_name_and_address").attr("disabled", true);
        $("#type_of53_g").change(function() {
            if ( $("#type_of53_g").val() == "a"){
                $("#div_of53a_g").show();
                $("#div_of53d_g").hide();
                $("#_0950_of53a_party_identifier").attr("disabled", false);
                $("#_0951_of53a_identifier_code").attr("disabled", false);
                $("#_0952_of53d_party_identifier").attr("disabled", true);
                $("#_0953_of53d_name_and_address").attr("disabled", true);
            } else if ( $("#type_of53_g").val() == "d"){
                $("#div_of53a_g").hide();
                $("#div_of53d_g").show();
                $("#_0950_of53a_party_identifier").attr("disabled", true);
                $("#_0951_of53a_identifier_code").attr("disabled", true);
                $("#_0952_of53d_party_identifier").attr("disabled", false);
                $("#_0953_of53d_name_and_address").attr("disabled", false);
            } else{
                $("#div_of53a_g").hide();
                $("#div_of53d_g").hide();
                $("#_0950_of53a_party_identifier").attr("disabled", true);
                $("#_0951_of53a_identifier_code").attr("disabled", true);
                $("#_0952_of53d_party_identifier").attr("disabled", true);
                $("#_0953_of53d_name_and_address").attr("disabled", true);
            }
        });
        //end of the line
        //OF56_a_d
        $("#div_of56a_g").hide();
        $("#div_of56d_g").hide();
        $("#_0960_of56a_party_identifier").attr("disabled", true);
        $("#_0961_of56a_identifier_code").attr("disabled", true);
        $("#_0962_of56d_party_identifier").attr("disabled", true);
        $("#_0963_of56d_name_and_address").attr("disabled", true);
        $("#type_of56_g").change(function() {
            if ( $("#type_of56_g").val() == "a"){
                $("#div_of56a_g").show();
                $("#div_of56d_g").hide();
                $("#_0960_of56a_party_identifier").attr("disabled", false);
                $("#_0961_of56a_identifier_code").attr("disabled", false);
                $("#_0962_of56d_party_identifier").attr("disabled", true);
                $("#_0963_of56d_name_and_address").attr("disabled", true);
            } else if ( $("#type_of56_g").val() == "d"){
                $("#div_of56a_g").hide();
                $("#div_of56d_g").show();
                $("#_0960_of56a_party_identifier").attr("disabled", true);
                $("#_0961_of56a_identifier_code").attr("disabled", true);
                $("#_0962_of56d_party_identifier").attr("disabled", false);
                $("#_0963_of56d_name_and_address").attr("disabled", false);
            } else{
                $("#div_of56a_g").hide();
                $("#div_of56d_g").hide();
                $("#_0960_of56a_party_identifier").attr("disabled", true);
                $("#_0961_of56a_identifier_code").attr("disabled", true);
                $("#_0962_of56d_party_identifier").attr("disabled", true);
                $("#_0963_of56d_name_and_address").attr("disabled", true);
            }
        });
        //end of the line
        //OF86_a_d
        $("#div_of86a_g").hide();
        $("#div_of86d_g").hide();
        $("#_0970_of86a_party_identifier").attr("disabled", true);
        $("#_0971_of86a_identifier_code").attr("disabled", true);
        $("#_0972_of86d_party_identifier").attr("disabled", true);
        $("#_0973_of86d_name_and_address").attr("disabled", true);
        $("#type_of86_g").change(function() {
            if ( $("#type_of86_g").val() == "a"){
                $("#div_of86a_g").show();
                $("#div_of86d_g").hide();
                $("#_0970_of86a_party_identifier").attr("disabled", false);
                $("#_0971_of86a_identifier_code").attr("disabled", false);
                $("#_0972_of86d_party_identifier").attr("disabled", true);
                $("#_0973_of86d_name_and_address").attr("disabled", true);
            } else if ( $("#type_of86_g").val() == "d"){
                $("#div_of86a_g").hide();
                $("#div_of86d_g").show();
                $("#_0970_of86a_party_identifier").attr("disabled", true);
                $("#_0971_of86a_identifier_code").attr("disabled", true);
                $("#_0972_of86d_party_identifier").attr("disabled", false);
                $("#_0973_of86d_name_and_address").attr("disabled", false);
            } else{
                $("#div_of86a_g").hide();
                $("#div_of86d_g").hide();
                $("#_0970_of86a_party_identifier").attr("disabled", true);
                $("#_0971_of86a_identifier_code").attr("disabled", true);
                $("#_0972_of86d_party_identifier").attr("disabled", true);
                $("#_0973_of86d_name_and_address").attr("disabled", true);
            }
        });
        //end of the line
        //MF57_a_d
        $("#div_mf57a_g").hide();
        $("#div_mf57d_g").hide();
        $("#_0980_mf57a_party_identifier").attr("disabled", true);
        $("#_0981_mf57a_identifier_code").attr("disabled", true);
        $("#_0982_mf57d_party_identifier").attr("disabled", true);
        $("#_0983_mf57d_name_and_address").attr("disabled", true);
        $("#type_mf57_account_with_institution_g").change(function() {
            if ( $("#type_mf57_account_with_institution_g").val() == "a"){
                $("#div_mf57a_g").show();
                $("#div_mf57d_g").hide();
                $("#_0980_mf57a_party_identifier").attr("disabled", false);
                $("#_0981_mf57a_identifier_code").attr("disabled", false);
                $("#_0982_mf57d_party_identifier").attr("disabled", true);
                $("#_0983_mf57d_name_and_address").attr("disabled", true);
            } else if ( $("#type_mf57_account_with_institution_g").val() == "d"){
                $("#div_mf57a_g").hide();
                $("#div_mf57d_g").show();
                $("#_0980_mf57a_party_identifier").attr("disabled", true);
                $("#_0981_mf57a_identifier_code").attr("disabled", true);
                $("#_0982_mf57d_party_identifier").attr("disabled", false);
                $("#_0983_mf57d_name_and_address").attr("disabled", false);
            } else{
                $("#div_mf57a_g").hide();
                $("#div_mf57d_g").hide();
                $("#_0980_mf57a_party_identifier").attr("disabled", true);
                $("#_0981_mf57a_identifier_code").attr("disabled", true);
                $("#_0982_mf57d_party_identifier").attr("disabled", true);
                $("#_0983_mf57d_name_and_address").attr("disabled", true);
            }
        });
        //end of the line
        
    });
</script>

<!--rule view-->
<script language="javascript">
    $(document).ready(function () {

        //Mandatory Sequence A General Information
        //OF32B view
        if ($("#_0140_of32b_currency").val() != "" || $("#_0141_of32b_amount").val() != ""){
            $("#party_b_currency_national_amount_checkbox").attr("checked", true);
            $("#check_of32b").show();
            $("#_0140_of32b_currency").attr("disabled", false);
            $("#_0141_of32b_amount").attr("disabled", false);
        } else {
            $("#check_of32b").hide();
            $("#_0140_of32b_currency").attr("disabled", true);
            $("#_0141_of32b_amount").attr("disabled", true);
        }
        //end of the line
        //mf82_a_d view
        if ($("#_0160_mf82a_party_identifier").val() != "" || $("#_0161_mf82a_identifier_code").val() != "") {
            $("#type_mf82_").val("a").attr("selected", true);
            $("#div_mf82_a").show();
            $("#div_mf82_d").hide();
            $("#_0160_mf82a_party_identifier").attr("disabled", false);
            $("#_0161_mf82a_identifier_code").attr("disabled", false);
            $("#_0162_mf82d_party_identifier").attr("disabled", true);
            $("#_0163_mf82d_name_and_address").attr("disabled", true);
        } else if ($("#_0162_mf82d_party_identifier").val() != "" || $("#_0163_mf82d_name_and_address").val() != "") {
            $("#type_mf82_").val("d").attr("selected", true);
            $("#div_mf82_a").hide();
            $("#div_mf82_d").show();
            $("#_0160_mf82a_party_identifier").attr("disabled", true);
            $("#_0161_mf82a_identifier_code").attr("disabled", true);
            $("#_0162_mf82d_party_identifier").attr("disabled", false);
            $("#_0163_mf82d_name_and_address").attr("disabled", false);
        } else {
            $("#div_mf82_a").hide();
            $("#div_mf82_d").hide();
            $("#_0160_mf82a_party_identifier").attr("disabled", true);
            $("#_0161_mf82a_identifier_code").attr("disabled", true);
            $("#_0162_mf82d_party_identifier").attr("disabled", true);
            $("#_0163_mf82d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //mf87_a_d view
        if ($("#_0170_mf87a_party_identifier").val() != "" || $("#_0171_mf87a_identifier_code").val() != "") {
            $("#type_mf87_").val("a").attr("selected", true);
            $("#div_mf87_a").show();
            $("#div_mf87_d").hide();
            $("#_0170_mf87a_party_identifier").attr("disabled", false);
            $("#_0171_mf87a_identifier_code").attr("disabled", false);
            $("#_0172_mf87d_party_identifier").attr("disabled", true);
            $("#_0173_mf87d_name_and_address").attr("disabled", true);
        } else if ($("#_0172_mf87d_party_identifier").val() != "" || $("#_0173_mf87d_name_and_address").val() != "") {
            $("#type_mf87_").val("d").attr("selected", true);
            $("#div_mf87_a").hide();
            $("#div_mf87_d").show();
            $("#_0170_mf87a_party_identifier").attr("disabled", true);
            $("#_0171_mf87a_identifier_code").attr("disabled", true);
            $("#_0172_mf87d_party_identifier").attr("disabled", false);
            $("#_0173_mf87d_name_and_address").attr("disabled", false);
        } else {
            $("#div_mf87_a").hide();
            $("#div_mf87_d").hide();
            $("#_0170_mf87a_party_identifier").attr("disabled", true);
            $("#_0171_mf87a_identifier_code").attr("disabled", true);
            $("#_0172_mf87d_party_identifier").attr("disabled", true);
            $("#_0173_mf87d_name_and_address").attr("disabled", true);
        }
        //end of the line
        // OF83_a_d_j view
        if ($("#_0180_of83a_party_identifier").val() != "" || $("#_0181_of83a_identifier_code").val() != "") {
            $("#type_of83_").val("a").attr("selected", true);
            $("#div_of83_a").show();
            $("#div_of83_d").hide();
            $("#div_of83_j").hide();
            $("#_0180_of83a_party_identifier").attr("disabled", false);
            $("#_0181_of83a_identifier_code").attr("disabled", false);
            $("#_0182_of83d_party_identifier").attr("disabled", true);
            $("#_0183_of83d_name_and_address").attr("disabled", true);
            $("#_0184_of83j_party_identification").attr("disabled", true);
        } else if ($("#_0182_of83d_party_identifier").val() != "" || $("#_0183_of83d_name_and_address").val() != "") {
            $("#type_of83_").val("d").attr("selected", true);
            $("#div_of83_a").hide();
            $("#div_of83_d").show();
            $("#div_of83_j").hide();
            $("#_0180_of83a_party_identifier").attr("disabled", true);
            $("#_0181_of83a_identifier_code").attr("disabled", true);
            $("#_0182_of83d_party_identifier").attr("disabled", false);
            $("#_0183_of83d_name_and_address").attr("disabled", false);
            $("#_0184_of83j_party_identification").attr("disabled", true);
        } else if ($("#_0184_of83j_party_identification").val() != "") {
            $("#type_of83_").val("j").attr("selected", true);
            $("#div_of83_a").hide();
            $("#div_of83_d").hide();
            $("#div_of83_j").show();
            $("#_0180_of83a_party_identifier").attr("disabled", true);
            $("#_0181_of83a_identifier_code").attr("disabled", true);
            $("#_0182_of83d_party_identifier").attr("disabled", true);
            $("#_0183_of83d_name_and_address").attr("disabled", true);
            $("#_0184_of83j_party_identification").attr("disabled", false);
        } else {
            $("#div_of83_a").hide();
            $("#div_of83_d").hide();
            $("#div_of83_j").hide();
            $("#_0180_of83a_party_identifier").attr("disabled", true);
            $("#_0181_of83a_identifier_code").attr("disabled", true);
            $("#_0182_of83d_party_identifier").attr("disabled", true);
            $("#_0183_of83d_name_and_address").attr("disabled", true);
            $("#_0184_of83j_party_identification").attr("disabled", true);
        }
        //end of the line
        //OF72 view
        if ($("#_0230_of72_code").val() != "" || $("#_0231_of72_narrative").val() != ""){
            $("#sender_to_receiver_information_checkbox").attr("checked", true);
            $("#check_of72").show();
            $("#_0230_of72_code").attr("disabled", false);
            $("#_0231_of72_narrative").attr("disabled", false);
        } else {
            $("#check_of72").hide();
            $("#_0230_of72_code").attr("disabled", true);
            $("#_0231_of72_narrative").attr("disabled", true);
        }
        //end of the line
        
        //Optional Sequence B Fixed Interest Payable by Party B
        //SEQ B view
        if ($("#_0260_of37m_sign").val() != "" || $("#_0261_of37m_rate").val() != "" || $("#_0270_of37n_details_of_interest_rate").val() != ""){
            $("#seq_b_checkbox").attr("checked", true);
            $("#check_seq_b").show();
            $("#_0260_of37m_sign").attr("disabled", false);
            $("#_0261_of37m_rate").attr("disabled", false);
            $("#_0270_of37n_details_of_interest_rate").attr("disabled", false);
        } else {
            $("#check_seq_b").hide();
            $("#_0260_of37m_sign").attr("disabled", true);
            $("#_0261_of37m_rate").attr("disabled", true);
            $("#_0270_of37n_details_of_interest_rate").attr("disabled", true);
        }
        //end of the line
        //OF37M view
        if ($("#_0260_of37m_sign").val() != "" || $("#_0261_of37m_rate").val() != ""){
            $("#fixed_rate_checkbox").attr("checked", true);
            $("#check_of37m").show();
            $("#_0260_of37m_sign").attr("disabled", false);
            $("#_0261_of37m_rate").attr("disabled", false);
        } else {
            $("#check_of37m").hide();
            $("#_0260_of37m_sign").attr("disabled", true);
            $("#_0261_of37m_rate").attr("disabled", true);
        }
        //end of the line
        
        //Optional Subsequence B1 Interest Details 
        //SUB SEQ B1 view
        if ($("#_0280_mf18a_number_of_repetitions").val() != "" || $("#_0310_of17f_period_end_date_adjustment_indicator").val() != "" || $("#_0320_of14d_day_count_fraction").val() != "" || $("#_0330_mf14a_business_day_convention").val() != "" || $("#_0340_mf18a_number_of_repetitions").val() != ""  || $("#_0350_mf22b_financial_centre").val() != ""){
            $("#sub_seq_b1_checkbox").attr("checked", true);
            $("#check_sub_seq_b1").show();
            $("#_0280_mf18a_number_of_repetitions").attr("disabled", false);
            $("#_0310_of17f_period_end_date_adjustment_indicator").attr("disabled", false);
            $("#_0320_of14d_day_count_fraction").attr("disabled", false);
            $("#_0330_mf14a_business_day_convention").attr("disabled", false);
            $("#_0340_mf18a_number_of_repetitions").attr("disabled", false);
            $("#_0350_mf22b_financial_centre").attr("disabled", false);
        } else {
            $("#check_sub_seq_b1").hide();
            $("#_0280_mf18a_number_of_repetitions").attr("disabled", true);
            $("#_0310_of17f_period_end_date_adjustment_indicator").attr("disabled", true);
            $("#_0320_of14d_day_count_fraction").attr("disabled", true);
            $("#_0330_mf14a_business_day_convention").attr("disabled", true);
            $("#_0340_mf18a_number_of_repetitions").attr("disabled", true);
            $("#_0350_mf22b_financial_centre").attr("disabled", true);
        }
        
        //Optional Sequence C Floating Interest Payable by Party B
        //SEQ C view
        if ($("#_0370_mf14f_floating_rate_option").val() != "" || $("#_0380_of37v_sign").val() != "" || $("#_0381_of37v_rate").val() != "" || $("#_0390_of37g_sign").val() != "" || $("#_0391_of37g_rate").val() != "" || $("#_0400_of37n_details_of_interest_rate").val() != ""){
            $("#seq_c_checkbox").attr("checked", true);
            $("#check_seq_c").show();
            $("#_0370_mf14f_floating_rate_option").attr("disabled", false);
            $("#_0380_of37v_sign").attr("disabled", false);
            $("#_0381_of37v_rate").attr("disabled", false);
            $("#_0390_of37g_sign").attr("disabled", false);
            $("#_0391_of37g_rate").attr("disabled", false);
            $("#_0400_of37n_details_of_interest_rate").attr("disabled", false);
        } else {
            $("#check_seq_c").hide();
            $("#_0370_mf14f_floating_rate_option").attr("disabled", true);
            $("#_0380_of37v_sign").attr("disabled", true);
            $("#_0381_of37v_rate").attr("disabled", true);
            $("#_0390_of37g_sign").attr("disabled", true);
            $("#_0391_of37g_rate").attr("disabled", true);
            $("#_0400_of37n_details_of_interest_rate").attr("disabled", true);
        }
        //OF37V view
        if ($("#_0380_of37v_sign").val() != "" || $("#_0381_of37v_rate").val() != ""){
            $("#cap_rate_checkbox").attr("checked", true);
            $("#check_of37v").show();
            $("#_0380_of37v_sign").attr("disabled", false);
            $("#_0381_of37v_rate").attr("disabled", false);
        } else {
            $("#check_of37v").hide();
            $("#_0380_of37v_sign").attr("disabled", true);
            $("#_0381_of37v_rate").attr("disabled", true);
        }
        //end of the line
        //OF37G view
        if ($("#_0390_of37g_sign").val() != "" || $("#_0391_of37g_rate").val() != ""){
            $("#floor_rate_checkbox").attr("checked", true);
            $("#check_of37g").show();
            $("#_0390_of37g_sign").attr("disabled", false);
            $("#_0391_of37g_rate").attr("disabled", false);
        } else {
            $("#check_of37g").hide();
            $("#_0390_of37g_sign").attr("disabled", true);
            $("#_0391_of37g_rate").attr("disabled", true);
        }
        //end of the line
        
        //Optional Subsequence C1 Interest Details 
        //SUB SEQ C1 view 
        if ($("#_0410_mf14j_reset_date_specification").val() != "" || $("#_0420_of14g_frequency").val() != "" || $("#_0421_of14g_method").val() != "" || $("#_0430_mf38e_number").val() != "" || $("#_0431_mf38e_period").val() != "" || $("#_0440_mf18a_number_of_repetitions").val() != "" || $("#_0450_mf30f_payment_date").val() != "" || $("#_0460_mf17f_period_end_date_adjustment_indicator").val() != "" || $("#_0470_mf14d_day_count_convention").val() != "" || $("#_0480_mf14a_business_day_convention").val() != "" || $("#_0490_mf18a_number_of_repetitions").val() != "" || $("#_0500_mf22b_financial_centre").val() != "" || $("#_0510_of37r_sign").val() != "" || $("#_0511_of37r_rate").val() != "" ){
            $("#sub_seq_c1_checkbox").attr("checked", true);
            $("#check_sub_seq_c1").show();
            $("#_0410_mf14j_reset_date_specification").attr("disabled", false);
            $("#_0420_of14g_frequency").attr("disabled", false);
            $("#_0421_of14g_method").attr("disabled", false);
            $("#_0430_mf38e_number").attr("disabled", false);
            $("#_0431_mf38e_period").attr("disabled", false);
            $("#_0440_mf18a_number_of_repetitions").attr("disabled", false);
            $("#_0450_mf30f_payment_date").attr("disabled", false);
            $("#_0460_mf17f_period_end_date_adjustment_indicator").attr("disabled", false);
            $("#_0470_mf14d_day_count_convention").attr("disabled", false);
            $("#_0480_mf14a_business_day_convention").attr("disabled", false);
            $("#_0490_mf18a_number_of_repetitions").attr("disabled", false);
            $("#_0500_mf22b_financial_centre").attr("disabled", false);
            $("#_0510_of37r_sign").attr("disabled", false);
            $("#_0511_of37r_rate").attr("disabled", false);
        } else {
            $("#check_sub_seq_c1").hide();
            $("#_0410_mf14j_reset_date_specification").attr("disabled", true);
            $("#_0420_of14g_frequency").attr("disabled", true);
            $("#_0421_of14g_method").attr("disabled", true);
            $("#_0430_mf38e_number").attr("disabled", true);
            $("#_0431_mf38e_period").attr("disabled", true);
            $("#_0440_mf18a_number_of_repetitions").attr("disabled", true);
            $("#_0450_mf30f_payment_date").attr("disabled", true);
            $("#_0460_mf17f_period_end_date_adjustment_indicator").attr("disabled", true);
            $("#_0470_mf14d_day_count_convention").attr("disabled", true);
            $("#_0480_mf14a_business_day_convention").attr("disabled", true);
            $("#_0490_mf18a_number_of_repetitions").attr("disabled", true);
            $("#_0500_mf22b_financial_centre").attr("disabled", true);
            $("#_0510_of37r_sign").attr("disabled", true);
            $("#_0511_of37r_rate").attr("disabled", true);
        }
        //end of the line
        //OF14G view
        if ($("#_0420_of14g_frequency").val() != "" || $("#_0421_of14g_method").val() != "" ){
            $("#averaging_frequency_method_checkbox").attr("checked", true);
            $("#check_of14g").show();
            $("#_0420_of14g_frequency").attr("disabled", false);
            $("#_0421_of14g_method").attr("disabled", false);
        } else {
            $("#check_of14g").hide();
            $("#_0420_of14g_frequency").attr("disabled", true);
            $("#_0421_of14g_method").attr("disabled", true);
        }
        //end of the line
        //OF37R view
        if ($("#_0510_of37r_sign").val() != "" || $("#_0511_of37r_rate").val() != "" ){
            $("#spread_checkbox").attr("checked", true);
            $("#check_of37r").show();
            $("#_0510_of37r_sign").attr("disabled", false);
            $("#_0511_of37r_rate").attr("disabled", false);
        } else {
            $("#check_of37r").hide();
            $("#_0510_of37r_sign").attr("disabled", true);
            $("#_0511_of37r_rate").attr("disabled", true);
        }
        //end of the line
        
        //Optional Subsequence C2 Compounding Details
        //SUB SEQ C2 view
        if ($("#_0520_mf22d_compounding_type").val() != "" || $("#_0530_mf18a_number_of_repetitions").val() != "" || $("#_0540_mf30x_compounding_date").val() != ""){
            $("#sub_seq_c2_checkbox").attr("checked", true);
            $("#check_sub_seq_c2").show();
            $("#_0520_mf22d_compounding_type").attr("disabled", false);
            $("#_0530_mf18a_number_of_repetitions").attr("disabled", false);
            $("#_0540_mf30x_compounding_date").attr("disabled", false);
        } else {
            $("#check_sub_seq_c2").hide();
            $("#_0520_mf22d_compounding_type").attr("disabled", true);
            $("#_0530_mf18a_number_of_repetitions").attr("disabled", true);
            $("#_0540_mf30x_compounding_date").attr("disabled", true);
        }
        //end of the line
        
        //Optional Subsequence C3 Interpolation for Stub Periods
        //SUB SEQ C3 view
        if ($("#_0550_of38g_number_from").val() != "" || $("#_0551_of38g_period_from").val() != "" || $("#_0552_of38g_number_to").val() != "" || $("#_0553_of38g_period_to").val() != ""  || $("#_0560_of38h_number_from").val() != "" || $("#_0561_of38h_period_from").val() != "" || $("#_0562_of38h_number_to").val() != "" || $("#_0563_of38h_period_to").val() != "" ){
            $("#sub_seq_c3_checkbox").attr("checked", true);
            $("#check_sub_seq_c3").show();
            $("#_0550_of38g_number_from").attr("disabled", false);
            $("#_0551_of38g_period_from").attr("disabled", false);
            $("#_0552_of38g_number_to").attr("disabled", false);
            $("#_0553_of38g_period_to").attr("disabled", false);
            $("#_0560_of38h_number_from").attr("disabled", false);
            $("#_0561_of38h_period_from").attr("disabled", false);
            $("#_0562_of38h_number_to").attr("disabled", false);
            $("#_0563_of38h_period_to").attr("disabled", false);
        } else {
            $("#check_sub_seq_c3").hide();
            $("#_0550_of38g_number_from").attr("disabled", true);
            $("#_0551_of38g_period_from").attr("disabled", true);
            $("#_0552_of38g_number_to").attr("disabled", true);
            $("#_0553_of38g_period_to").attr("disabled", true);
            $("#_0560_of38h_number_from").attr("disabled", true);
            $("#_0561_of38h_period_from").attr("disabled", true);
            $("#_0562_of38h_number_to").attr("disabled", true);
            $("#_0563_of38h_period_to").attr("disabled", true);
        }
        //end of the line
        //OF38G view
        if ($("#_0550_of38g_number_from").val() != "" || $("#_0551_of38g_period_from").val() != "" || $("#_0552_of38g_number_to").val() != "" || $("#_0553_of38g_period_to").val() != ""){
            $("#of38g_checkbox").attr("checked", true);
            $("#check_of38g").show();
            $("#_0550_of38g_number_from").attr("disabled", false);
            $("#_0551_of38g_period_from").attr("disabled", false);
            $("#_0552_of38g_number_to").attr("disabled", false);
            $("#_0553_of38g_period_to").attr("disabled", false);
        } else {
            $("#check_of38g").hide();
            $("#_0550_of38g_number_from").attr("disabled", true);
            $("#_0551_of38g_period_from").attr("disabled", true);
            $("#_0552_of38g_number_to").attr("disabled", true);
            $("#_0553_of38g_period_to").attr("disabled", true);
        }
        //end of the line
        //OF38H view
        if ($("#_0560_of38h_number_from").val() != "" || $("#_0561_of38h_period_from").val() != "" || $("#_0562_of38h_number_to").val() != "" || $("#_0563_of38h_period_to").val() != "" ){
            $("#of38h_checkbox").attr("checked", true);
            $("#check_of38h").show();
            $("#_0560_of38h_number_from").attr("disabled", false);
            $("#_0561_of38h_period_from").attr("disabled", false);
            $("#_0562_of38h_number_to").attr("disabled", false);
            $("#_0563_of38h_period_to").attr("disabled", false);
        } else {
            $("#check_of38h").hide();
            $("#_0560_of38h_number_from").attr("disabled", true);
            $("#_0561_of38h_period_from").attr("disabled", true);
            $("#_0562_of38h_number_to").attr("disabled", true);
            $("#_0563_of38h_period_to").attr("disabled", true);
        }
        //end of the line
        
        //Mandatory Sequence D Payment Instructions for Interest Payable by Party B
        //SEQ D view
        if ($("#_0580_of53a_party_identifier").val() != "" || $("#_0581_of53a_identifier_code").val() != "" || $("#_0582_of53d_party_identifier").val() != "" || $("#_0583_of53d_name_and_address").val() != "" || $("#_0590_of56a_party_identifier").val() != "" || $("#_0591_of56a_identifier_code").val() != "" || $("#_0592_of56d_party_identifier").val() != "" || $("#_0593_of56d_name_and_address").val() != "" || $("#_0600_of86a_party_identifier").val() != "" || $("#_0601_of86a_identifier_code").val() != "" || $("#_0602_of86d_party_identifier").val() != "" || $("#_0603_of86d_name_and_address").val() != "" || $("#_0610_mf57a_party_identifier").val() != "" || $("#_0611_mf57a_identifier_code").val() != "" || $("#_0612_mf57d_party_identifier").val() != "" || $("#_0613_mf57d_name_and_address").val() != ""){
            $("#seq_d_checkbox").attr("checked", true);
            $("#check_seq_d").show();
            $("#_0580_of53a_party_identifier").attr("disabled", false);
            $("#_0581_of53a_identifier_code").attr("disabled", false);
            $("#_0582_of53d_party_identifier").attr("disabled", false);
            $("#_0583_of53d_name_and_address").attr("disabled", false);
            $("#_0590_of56a_party_identifier").attr("disabled", false);
            $("#_0591_of56a_identifier_code").attr("disabled", false);
            $("#_0592_of56d_party_identifier").attr("disabled", false);
            $("#_0593_of56d_name_and_address").attr("disabled", false);
            $("#_0600_of86a_party_identifier").attr("disabled", false);
            $("#_0601_of86a_identifier_code").attr("disabled", false);
            $("#_0602_of86d_party_identifier").attr("disabled", false);
            $("#_0603_of86d_name_and_address").attr("disabled", false);
            $("#_0610_mf57a_party_identifier").attr("disabled", false);
            $("#_0611_mf57a_identifier_code").attr("disabled", false);
            $("#_0612_mf57d_party_identifier").attr("disabled", false);
            $("#_0613_mf57d_name_and_address").attr("disabled", false);
        } else {
            $("#check_seq_d").hide();
            $("#_0580_of53a_party_identifier").attr("disabled", true);
            $("#_0581_of53a_identifier_code").attr("disabled", true);
            $("#_0582_of53d_party_identifier").attr("disabled", true);
            $("#_0583_of53d_name_and_address").attr("disabled", true);
            $("#_0590_of56a_party_identifier").attr("disabled", true);
            $("#_0591_of56a_identifier_code").attr("disabled", true);
            $("#_0592_of56d_party_identifier").attr("disabled", true);
            $("#_0593_of56d_name_and_address").attr("disabled", true);
            $("#_0600_of86a_party_identifier").attr("disabled", true);
            $("#_0601_of86a_identifier_code").attr("disabled", true);
            $("#_0602_of86d_party_identifier").attr("disabled", true);
            $("#_0603_of86d_name_and_address").attr("disabled", true);
            $("#_0610_mf57a_party_identifier").attr("disabled", true);
            $("#_0611_mf57a_identifier_code").attr("disabled", true);
            $("#_0612_mf57d_party_identifier").attr("disabled", true);
            $("#_0613_mf57d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //OF53_a_d view
        if ($("#_0580_of53a_party_identifier").val() != "" || $("#_0581_of53a_identifier_code").val() != "") {
            $("#type_of53_").val("a").attr("selected", true);
            $("#div_of53a_").show();
            $("#div_of53d_").hide();
            $("#_0580_of53a_party_identifier").attr("disabled", false);
            $("#_0581_of53a_identifier_code").attr("disabled", false);
            $("#_0582_of53d_party_identifier").attr("disabled", true);
            $("#_0583_of53d_name_and_address").attr("disabled", true);
        } else if ($("#_0582_of53d_party_identifier").val() != "" || $("#_0583_of53d_name_and_address").val() != "") {
            $("#type_of53_").val("d").attr("selected", true);
            $("#div_of53a_").hide();
            $("#div_of53d_").show();
            $("#_0580_of53a_party_identifier").attr("disabled", true);
            $("#_0581_of53a_identifier_code").attr("disabled", true);
            $("#_0582_of53d_party_identifier").attr("disabled", false);
            $("#_0583_of53d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of53a_").hide();
            $("#div_of53d_").hide();
            $("#_0580_of53a_party_identifier").attr("disabled", true);
            $("#_0581_of53a_identifier_code").attr("disabled", true);
            $("#_0582_of53d_party_identifier").attr("disabled", true);
            $("#_0583_of53d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //OF56_a_d view
        if ($("#_0590_of56a_party_identifier").val() != "" || $("#_0591_of56a_identifier_code").val() != "") {
            $("#type_of56").val("a").attr("selected", true);
            $("#div_of56a").show();
            $("#div_of56d").hide();
            $("#_0590_of56a_party_identifier").attr("disabled", false);
            $("#_0591_of56a_identifier_code").attr("disabled", false);
            $("#_0592_of56d_party_identifier").attr("disabled", true);
            $("#_0593_of56d_name_and_address").attr("disabled", true);
        } else if ($("#_0592_of56d_party_identifier").val() != "" || $("#_0593_of56d_name_and_address").val() != "") {
            $("#type_of56").val("d").attr("selected", true);
            $("#div_of56a").hide();
            $("#div_of56d").show();
            $("#_0590_of56a_party_identifier").attr("disabled", true);
            $("#_0591_of56a_identifier_code").attr("disabled", true);
            $("#_0592_of56d_party_identifier").attr("disabled", false);
            $("#_0593_of56d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of56a").hide();
            $("#div_of56d").hide();
            $("#_0590_of56a_party_identifier").attr("disabled", true);
            $("#_0591_of56a_identifier_code").attr("disabled", true);
            $("#_0592_of56d_party_identifier").attr("disabled", true);
            $("#_0593_of56d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //OF86_a_d view
        if ($("#_0600_of86a_party_identifier").val() != "" || $("#_0601_of86a_identifier_code").val() != "") {
            $("#type_of86_").val("a").attr("selected", true);
            $("#div_of86a_").show();
            $("#div_of86d_").hide();
            $("#_0600_of86a_party_identifier").attr("disabled", false);
            $("#_0601_of86a_identifier_code").attr("disabled", false);
            $("#_0602_of86d_party_identifier").attr("disabled", true);
            $("#_0603_of86d_name_and_address").attr("disabled", true);
        } else if ($("#_0602_of86d_party_identifier").val() != "" || $("#_0603_of86d_name_and_address").val() != "") {
            $("#type_of86_").val("d").attr("selected", true);
            $("#div_of86a_").hide();
            $("#div_of86d_").show();
            $("#_0600_of86a_party_identifier").attr("disabled", true);
            $("#_0601_of86a_identifier_code").attr("disabled", true);
            $("#_0602_of86d_party_identifier").attr("disabled", false);
            $("#_0603_of86d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of86a_").hide();
            $("#div_of86d_").hide();
            $("#_0600_of86a_party_identifier").attr("disabled", true);
            $("#_0601_of86a_identifier_code").attr("disabled", true);
            $("#_0602_of86d_party_identifier").attr("disabled", true);
            $("#_0603_of86d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //MF57_a_d view
        if ($("#_0610_mf57a_party_identifier").val() != "" || $("#_0611_mf57a_identifier_code").val() != "") {
            $("#type_mf57_account_with_institution").val("a").attr("selected", true);
            $("#div_mf57a_").show();
            $("#div_mf57d_").hide();
            $("#_0610_mf57a_party_identifier").attr("disabled", false);
            $("#_0611_mf57a_identifier_code").attr("disabled", false);
            $("#_0612_mf57d_party_identifier").attr("disabled", true);
            $("#_0613_mf57d_name_and_address").attr("disabled", true);
        } else if ($("#_0612_mf57d_party_identifier").val() != "" || $("#_0613_mf57d_name_and_address").val() != "") {
            $("#type_mf57_account_with_institution").val("d").attr("selected", true);
            $("#div_mf57a_").hide();
            $("#div_mf57d_").show();
            $("#_0610_mf57a_party_identifier").attr("disabled", true);
            $("#_0611_mf57a_identifier_code").attr("disabled", true);
            $("#_0612_mf57d_party_identifier").attr("disabled", false);
            $("#_0613_mf57d_name_and_address").attr("disabled", false);
        } else {
            $("#div_mf57a_").hide();
            $("#div_mf57d_").hide();
            $("#_0610_mf57a_party_identifier").attr("disabled", true);
            $("#_0611_mf57a_identifier_code").attr("disabled", true);
            $("#_0612_mf57d_party_identifier").attr("disabled", true);
            $("#_0613_mf57d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //Optional Sequence E Fixed Interest Payable by Party A
        //SEQ E view
        if ($("#_0630_of37m_sign").val() != "" || $("#_0631_of37m_rate").val() != "" || $("#_0640_of37n_details_of_interest_rate").val() != "" ){
            $("#seq_e_checkbox").attr("checked", true);
            $("#check_seq_e").show();
            $("#_0630_of37m_sign").attr("disabled", false);
            $("#_0631_of37m_rate").attr("disabled", false);
            $("#_0640_of37n_details_of_interest_rate").attr("disabled", false);
        } else {
            $("#check_seq_e").hide();
            $("#_0630_of37m_sign").attr("disabled", true);
            $("#_0631_of37m_rate").attr("disabled", true);
            $("#_0640_of37n_details_of_interest_rate").attr("disabled", true);
        }
        //OF37M view
        if ($("#_0630_of37m_sign").val() != "" || $("#_0631_of37m_rate").val() != ""){
            $("#fixed_rate_checkbox_e").attr("checked", true);
            $("#check_of37m_e").show();
            $("#_0630_of37m_sign").attr("disabled", false);
            $("#_0631_of37m_rate").attr("disabled", false);
        } else {
            $("#check_of37m_e").hide();
            $("#_0630_of37m_sign").attr("disabled", true);
            $("#_0630_of37m_rate").attr("disabled", true);
        }
        //end of the line
        
        //Optional Subsequence E1 Interest Details
        //SUB SEQ E1 view
        if ($("#_0650_mf18a_number_of_repetitions").val() != "" || $("#_0680_of17f_period_end_date_adjustment_indicator").val() != "" || $("#_0690_of14d_day_count_fraction").val() != "" || $("#_0700_mf14a_business_day_convention").val() != "" || $("#_0710_mf18a_number_of_repetitions").val() != "" || $("#_0720_mf22b_financial_centre").val() != ""){
            $("#sub_seq_e1_checkbox").attr("checked", true);
            $("#check_sub_seq_e1").show();
            $("#_0650_mf18a_number_of_repetitions").attr("disabled", false);
            $("#_0680_of17f_period_end_date_adjustment_indicator").attr("disabled", false);
            $("#_0690_of14d_day_count_fraction").attr("disabled", false);
            $("#_0700_mf14a_business_day_convention").attr("disabled", false);
            $("#_0710_mf18a_number_of_repetitions").attr("disabled", false);
            $("#_0720_mf22b_financial_centre").attr("disabled", false);
        } else {
            $("#check_sub_seq_e1").hide();
            $("#_0650_mf18a_number_of_repetitions").attr("disabled", true);
            $("#_0680_of17f_period_end_date_adjustment_indicator").attr("disabled", true);
            $("#_0690_of14d_day_count_fraction").attr("disabled", true);
            $("#_0700_mf14a_business_day_convention").attr("disabled", true);
            $("#_0710_mf18a_number_of_repetitions").attr("disabled", true);
            $("#_0720_mf22b_financial_centre").attr("disabled", true);
        }
        //end of the line
        
        //Optional Sequence F Floating Interest Payable by Party A
        //SEQ F view
        if ($("#_0740_mf14f_floating_rate_option").val() != "" || $("#_0750_of37v_sign").val() != "" || $("#_0751_of37v_rate").val() != "" || $("#_0760_of37g_sign").val() != "" || $("#_0761_of37g_rate").val() != "" || $("#_0770_of37n_details_of_interest_rate").val() != ""){
            $("#seq_f_checkbox").attr("checked", true);
            $("#check_seq_f").show();
            $("#_0740_mf14f_floating_rate_option").attr("disabled", false);
            $("#_0750_of37v_sign").attr("disabled", false);
            $("#_0751_of37v_rate").attr("disabled", false);
            $("#_0760_of37g_sign").attr("disabled", false);
            $("#_0761_of37g_rate").attr("disabled", false);
            $("#_0770_of37n_details_of_interest_rate").attr("disabled", false);
        } else {
            $("#check_seq_f").hide();
            $("#_0740_mf14f_floating_rate_option").attr("disabled", true);
            $("#_0750_of37v_sign").attr("disabled", true);
            $("#_0751_of37v_rate").attr("disabled", true);
            $("#_0760_of37g_sign").attr("disabled", true);
            $("#_0761_of37g_rate").attr("disabled", true);
            $("#_0770_of37n_details_of_interest_rate").attr("disabled", true);
        }
        //OF37V view
        if ($("#_0750_of37v_sign").val() != "" || $("#_0751_of37v_rate").val() != ""){
            $("#cap_rate_checkbox_f").attr("checked", true);
            $("#check_of37v_f").show();
            $("#_0750_of37v_sign").attr("disabled", false);
            $("#_0751_of37v_rate").attr("disabled", false);
        } else {
            $("#check_of37v_f").hide();
            $("#_0750_of37v_sign").attr("disabled", true);
            $("#_0751_of37v_rate").attr("disabled", true);
        }
        //end of the line
        //OF37G view
        if ($("#_0760_of37g_sign").val() != "" || $("#_0761_of37g_rate").val() != ""){
            $("#floor_rate_checkbox_f").attr("checked", true);
            $("#check_of37g_f").show();
            $("#_0760_of37g_sign").attr("disabled", false);
            $("#_0761_of37g_rate").attr("disabled", false);
        } else {
            $("#check_of37g_f").hide();
            $("#_0760_of37g_sign").attr("disabled", true);
            $("#_0761_of37g_rate").attr("disabled", true);
        }
        //end of the line
        
        //Optional Subsequence F1 Interest Details 
        //SUB SEQ F1 view 
        if ($("#_0780_mf14j_reset_date_specification").val() != "" || $("#_0790_of14g_frequency").val() != "" || $("#_0791_of14g_method").val() != "" || $("#_0800_mf38e_number").val() != "" || $("#_0801_mf38e_period").val() != "" || $("#_0810_mf18a_number_of_repetitions").val() != "" || $("#_0820_mf30f_payment_date").val() != "" || $("#_0830_mf17f_period_end_date_adjustment_indicator").val() != "" || $("#_0840_mf14d_day_count_convention").val() != "" || $("#_0850_mf14a_business_day_convention").val() != "" || $("#_0860_mf18a_number_of_repetitions").val() != "" || $("#_0870_mf22b_financial_centre").val() != "" || $("#_0880_of37r_sign").val() != "" || $("#_0881_of37r_rate").val() != "" ){
            $("#sub_seq_f1_checkbox").attr("checked", true);
            $("#check_sub_seq_f1").show();
            $("#_0780_mf14j_reset_date_specification").attr("disabled", false);
            $("#_0790_of14g_frequency").attr("disabled", false);
            $("#_0791_of14g_method").attr("disabled", false);
            $("#_0800_mf38e_number").attr("disabled", false);
            $("#_0801_mf38e_period").attr("disabled", false);
            $("#_0810_mf18a_number_of_repetitions").attr("disabled", false);
            $("#_0820_mf30f_payment_date").attr("disabled", false);
            $("#_0830_mf17f_period_end_date_adjustment_indicator").attr("disabled", false);
            $("#_0840_mf14d_day_count_convention").attr("disabled", false);
            $("#_0850_mf14a_business_day_convention").attr("disabled", false);
            $("#_0860_mf18a_number_of_repetitions").attr("disabled", false);
            $("#_0870_mf22b_financial_centre").attr("disabled", false);
            $("#_0880_of37r_sign").attr("disabled", false);
            $("#_0881_of37r_rate").attr("disabled", false);
        } else {
            $("#check_sub_seq_f1").hide();
            $("#_0780_mf14j_reset_date_specification").attr("disabled", true);
            $("#_0790_of14g_frequency").attr("disabled", true);
            $("#_0791_of14g_method").attr("disabled", true);
            $("#_0800_mf38e_number").attr("disabled", true);
            $("#_0801_mf38e_period").attr("disabled", true);
            $("#_0810_mf18a_number_of_repetitions").attr("disabled", true);
            $("#_0820_mf30f_payment_date").attr("disabled", true);
            $("#_0830_mf17f_period_end_date_adjustment_indicator").attr("disabled", true);
            $("#_0840_mf14d_day_count_convention").attr("disabled", true);
            $("#_0850_mf14a_business_day_convention").attr("disabled", true);
            $("#_0860_mf18a_number_of_repetitions").attr("disabled", true);
            $("#_0870_mf22b_financial_centre").attr("disabled", true);
            $("#_0880_of37r_sign").attr("disabled", true);
            $("#_0881_of37r_rate").attr("disabled", true);
        }
        //end of the line
        //OF14G view
        if ($("#_0790_of14g_frequency").val() != "" || $("#_0791_of14g_method").val() != "" ){
            $("#averaging_frequency_method_checkbox_f").attr("checked", true);
            $("#check_of14g_f").show();
            $("#_0790_of14g_frequency").attr("disabled", false);
            $("#_0791_of14g_method").attr("disabled", false);
        } else {
            $("#check_of14g_f").hide();
            $("#_0790_of14g_frequency").attr("disabled", true);
            $("#_0791_of14g_method").attr("disabled", true);
        }
        //end of the line
        //OF37R view
        if ($("#_0880_of37r_sign").val() != "" || $("#_0881_of37r_rate").val() != "" ){
            $("#spread_checkbox_f").attr("checked", true);
            $("#check_of37r_f").show();
            $("#_0880_of37r_sign").attr("disabled", false);
            $("#_0881_of37r_rate").attr("disabled", false);
        } else {
            $("#check_of37r_f").hide();
            $("#_0880_of37r_sign").attr("disabled", true);
            $("#_0881_of37r_rate").attr("disabled", true);
        }
        //end of the line
        
        //Optional Subsequence F2 Compounding Details
        //SUB SEQ F2 view
        if ($("#_0890_mf22d_compounding_type").val() != "" || $("#_0900_mf18a_number_of_repetitions").val() != "" || $("#_0910_mf30x_compounding_date").val() != ""){
            $("#sub_seq_f2_checkbox").attr("checked", true);
            $("#check_sub_seq_f2").show();
            $("#_0890_mf22d_compounding_type").attr("disabled", false);
            $("#_0900_mf18a_number_of_repetitions").attr("disabled", false);
            $("#_0910_mf30x_compounding_date").attr("disabled", false);
        } else {
            $("#check_sub_seq_f2").hide();
            $("#_0890_mf22d_compounding_type").attr("disabled", true);
            $("#_0900_mf18a_number_of_repetitions").attr("disabled", true);
            $("#_0910_mf30x_compounding_date").attr("disabled", true);
        }
        //end of the line
        
        //Optional Subsequence F3 Interpolation for Stub Periods
        //SUB SEQ F3 view
        if ($("#_0920_of38g_number_from").val() != "" || $("#_0921_of38g_period_from").val() != "" || $("#_0922_of38g_number_to").val() != "" || $("#_0923_of38g_period_to").val() != ""  || $("#_0930_of38h_number_from").val() != "" || $("#_0931_of38h_period_from").val() != "" || $("#_0932_of38h_number_to").val() != "" || $("#_0933_of38h_period_to").val() != "" ){
            $("#sub_seq_f3_checkbox").attr("checked", true);
            $("#check_sub_seq_f3").show();
            $("#_0920_of38g_number_from").attr("disabled", false);
            $("#_0921_of38g_period_from").attr("disabled", false);
            $("#_0922_of38g_number_to").attr("disabled", false);
            $("#_0923_of38g_period_to").attr("disabled", false);
            $("#_0930_of38h_number_from").attr("disabled", false);
            $("#_0931_of38h_period_from").attr("disabled", false);
            $("#_0932_of38h_number_to").attr("disabled", false);
            $("#_0933_of38h_period_to").attr("disabled", false);
        } else {
            $("#check_sub_seq_f3").hide();
            $("#_0920_of38g_number_from").attr("disabled", true);
            $("#_0921_of38g_period_from").attr("disabled", true);
            $("#_0922_of38g_number_to").attr("disabled", true);
            $("#_0923_of38g_period_to").attr("disabled", true);
            $("#_0930_of38h_number_from").attr("disabled", true);
            $("#_0931_of38h_period_from").attr("disabled", true);
            $("#_0932_of38h_number_to").attr("disabled", true);
            $("#_0933_of38h_period_to").attr("disabled", true);
        }
        //end of the line
        //OF38G view
        if ($("#_0920_of38g_number_from").val() != "" || $("#_0921_of38g_period_from").val() != "" || $("#_0922_of38g_number_to").val() != "" || $("#_0923_of38g_period_to").val() != ""){
            $("#of38g_checkbox_f").attr("checked", true);
            $("#check_of38g_f").show();
            $("#_0920_of38g_number_from").attr("disabled", false);
            $("#_0921_of38g_period_from").attr("disabled", false);
            $("#_0922_of38g_number_to").attr("disabled", false);
            $("#_0923_of38g_period_to").attr("disabled", false);
        } else {
            $("#check_of38g_f").hide();
            $("#_0920_of38g_number_from").attr("disabled", true);
            $("#_0921_of38g_period_from").attr("disabled", true);
            $("#_0922_of38g_number_to").attr("disabled", true);
            $("#_0923_of38g_period_to").attr("disabled", true);
        }
        //end of the line
        //OF38H view
        if ($("#_0930_of38h_number_from").val() != "" || $("#_0931_of38h_period_from").val() != "" || $("#_0932_of38h_number_to").val() != "" || $("#_0933_of38h_period_to").val() != "" ){
            $("#of38h_checkbox_f").attr("checked", true);
            $("#check_of38h_f").show();
            $("#_0930_of38h_number_from").attr("disabled", false);
            $("#_0931_of38h_period_from").attr("disabled", false);
            $("#_0932_of38h_number_to").attr("disabled", false);
            $("#_0933_of38h_period_to").attr("disabled", false);
        } else {
            $("#check_of38h_f").hide();
            $("#_0930_of38h_number_from").attr("disabled", true);
            $("#_0931_of38h_period_from").attr("disabled", true);
            $("#_0932_of38h_number_to").attr("disabled", true);
            $("#_0933_of38h_period_to").attr("disabled", true);
        }
        //end of the line
        
        //Mandatory Sequence G Payment Instructions for Interest Payable by Party A
        //SEQ G view
        if ($("#_0950_of53a_party_identifier").val() != "" || $("#_0951_of53a_identifier_code").val() != "" || $("#_0952_of53d_party_identifier").val() != "" || $("#_0953_of53d_name_and_address").val() != "" || $("#_0960_of56a_party_identifier").val() != "" || $("#_0961_of56a_identifier_code").val() != "" || $("#_0962_of56d_party_identifier").val() != "" || $("#_0963_of56d_name_and_address").val() != "" || $("#_0970_of86a_party_identifier").val() != "" || $("#_0971_of86a_identifier_code").val() != "" || $("#_0972_of86d_party_identifier").val() != "" || $("#_0973_of86d_name_and_address").val() != "" || $("#_0980_mf57a_party_identifier").val() != "" || $("#_0981_mf57a_identifier_code").val() != "" || $("#_0982_mf57d_party_identifier").val() != "" || $("#_0983_mf57d_name_and_address").val() != ""){
            $("#seq_g_checkbox").attr("checked", true);
            $("#check_seq_g").show();
            $("#_0950_of53a_party_identifier").attr("disabled", false);
            $("#_0951_of53a_identifier_code").attr("disabled", false);
            $("#_0952_of53d_party_identifier").attr("disabled", false);
            $("#_0953_of53d_name_and_address").attr("disabled", false);
            $("#_0960_of56a_party_identifier").attr("disabled", false);
            $("#_0961_of56a_identifier_code").attr("disabled", false);
            $("#_0962_of56d_party_identifier").attr("disabled", false);
            $("#_0963_of56d_name_and_address").attr("disabled", false);
            $("#_0970_of86a_party_identifier").attr("disabled", false);
            $("#_0971_of86a_identifier_code").attr("disabled", false);
            $("#_0972_of86d_party_identifier").attr("disabled", false);
            $("#_0973_of86d_name_and_address").attr("disabled", false);
            $("#_0980_mf57a_party_identifier").attr("disabled", false);
            $("#_0981_mf57a_identifier_code").attr("disabled", false);
            $("#_0982_mf57d_party_identifier").attr("disabled", false);
            $("#_0983_mf57d_name_and_address").attr("disabled", false);
        } else {
            $("#check_seq_g").hide();
            $("#_0950_of53a_party_identifier").attr("disabled", true);
            $("#_0951_of53a_identifier_code").attr("disabled", true);
            $("#_0952_of53d_party_identifier").attr("disabled", true);
            $("#_0953_of53d_name_and_address").attr("disabled", true);
            $("#_0960_of56a_party_identifier").attr("disabled", true);
            $("#_0961_of56a_identifier_code").attr("disabled", true);
            $("#_0962_of56d_party_identifier").attr("disabled", true);
            $("#_0963_of56d_name_and_address").attr("disabled", true);
            $("#_0970_of86a_party_identifier").attr("disabled", true);
            $("#_0971_of86a_identifier_code").attr("disabled", true);
            $("#_0972_of86d_party_identifier").attr("disabled", true);
            $("#_0973_of86d_name_and_address").attr("disabled", true);
            $("#_0980_mf57a_party_identifier").attr("disabled", true);
            $("#_0981_mf57a_identifier_code").attr("disabled", true);
            $("#_0982_mf57d_party_identifier").attr("disabled", true);
            $("#_0983_mf57d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //OF53_a_d view
        if ($("#_0950_of53a_party_identifier").val() != "" || $("#_0951_of53a_identifier_code").val() != "") {
            $("#type_of53_g").val("a").attr("selected", true);
            $("#div_of53a_g").show();
            $("#div_of53d_g").hide();
            $("#_0950_of53a_party_identifier").attr("disabled", false);
            $("#_0951_of53a_identifier_code").attr("disabled", false);
            $("#_0952_of53d_party_identifier").attr("disabled", true);
            $("#_0953_of53d_name_and_address").attr("disabled", true);
        } else if ($("#_0582_of53d_party_identifier").val() != "" || $("#_0583_of53d_name_and_address").val() != "") {
            $("#type_of53_g").val("d").attr("selected", true);
            $("#div_of53a_g").hide();
            $("#div_of53d_g").show();
            $("#_0950_of53a_party_identifier").attr("disabled", true);
            $("#_0951_of53a_identifier_code").attr("disabled", true);
            $("#_0952_of53d_party_identifier").attr("disabled", false);
            $("#_0953_of53d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of53a_g").hide();
            $("#div_of53d_g").hide();
            $("#_0950_of53a_party_identifier").attr("disabled", true);
            $("#_0951_of53a_identifier_code").attr("disabled", true);
            $("#_0952_of53d_party_identifier").attr("disabled", true);
            $("#_0953_of53d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //OF56_a_d view
        if ($("#_0960_of56a_party_identifier").val() != "" || $("#_0961_of56a_identifier_code").val() != "") {
            $("#type_of56_g").val("a").attr("selected", true);
            $("#div_of56a_g").show();
            $("#div_of56d_g").hide();
            $("#_0960_of56a_party_identifier").attr("disabled", false);
            $("#_0961_of56a_identifier_code").attr("disabled", false);
            $("#_0962_of56d_party_identifier").attr("disabled", true);
            $("#_0963_of56d_name_and_address").attr("disabled", true);
        } else if ($("#_0962_of56d_party_identifier").val() != "" || $("#_0963_of56d_name_and_address").val() != "") {
            $("#type_of56_g").val("d").attr("selected", true);
            $("#div_of56a_g").hide();
            $("#div_of56d_g").show();
            $("#_0960_of56a_party_identifier").attr("disabled", true);
            $("#_0961_of56a_identifier_code").attr("disabled", true);
            $("#_0962_of56d_party_identifier").attr("disabled", false);
            $("#_0963_of56d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of56a_g").hide();
            $("#div_of56d_g").hide();
            $("#_0960_of56a_party_identifier").attr("disabled", true);
            $("#_0961_of56a_identifier_code").attr("disabled", true);
            $("#_0962_of56d_party_identifier").attr("disabled", true);
            $("#_0963_of56d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //OF86_a_d view
        if ($("#_0970_of86a_party_identifier").val() != "" || $("#_0971_of86a_identifier_code").val() != "") {
            $("#type_of86_g").val("a").attr("selected", true);
            $("#div_of86a_g").show();
            $("#div_of86d_g").hide();
            $("#_0970_of86a_party_identifier").attr("disabled", false);
            $("#_0971_of86a_identifier_code").attr("disabled", false);
            $("#_0972_of86d_party_identifier").attr("disabled", true);
            $("#_0973_of86d_name_and_address").attr("disabled", true);
        } else if ($("#_0972_of86d_party_identifier").val() != "" || $("#_0973_of86d_name_and_address").val() != "") {
            $("#type_of86_g").val("d").attr("selected", true);
            $("#div_of86a_g").hide();
            $("#div_of86d_g").show();
            $("#_0970_of86a_party_identifier").attr("disabled", true);
            $("#_0971_of86a_identifier_code").attr("disabled", true);
            $("#_0972_of86d_party_identifier").attr("disabled", false);
            $("#_0973_of86d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of86a_g").hide();
            $("#div_of86d_g").hide();
            $("#_0970_of86a_party_identifier").attr("disabled", true);
            $("#_0971_of86a_identifier_code").attr("disabled", true);
            $("#_0972_of86d_party_identifier").attr("disabled", true);
            $("#_0973_of86d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //MF57_a_d view
        if ($("#_0980_mf57a_party_identifier").val() != "" || $("#_0981_mf57a_identifier_code").val() != "") {
            $("#type_mf57_gaccount_with_institution_g").val("a").attr("selected", true);
            $("#div_mf57a_g").show();
            $("#div_mf57d_g").hide();
            $("#_0980_mf57a_party_identifier").attr("disabled", false);
            $("#_0981_mf57a_identifier_code").attr("disabled", false);
            $("#_0982_mf57d_party_identifier").attr("disabled", true);
            $("#_0983_mf57d_name_and_address").attr("disabled", true);
        } else if ($("#_0982_mf57d_party_identifier").val() != "" || $("#_0983_mf57d_name_and_address").val() != "") {
            $("#type_mf57_gaccount_with_institution_g").val("d").attr("selected", true);
            $("#div_mf57a_g").hide();
            $("#div_mf57d_g").show();
            $("#_0980_mf57a_party_identifier").attr("disabled", true);
            $("#_0981_mf57a_identifier_code").attr("disabled", true);
            $("#_0982_mf57d_party_identifier").attr("disabled", false);
            $("#_0983_mf57d_name_and_address").attr("disabled", false);
        } else {
            $("#div_mf57a_g").hide();
            $("#div_mf57d_g").hide();
            $("#_0980_mf57a_party_identifier").attr("disabled", true);
            $("#_0981_mf57a_identifier_code").attr("disabled", true);
            $("#_0982_mf57d_party_identifier").attr("disabled", true);
            $("#_0983_mf57d_name_and_address").attr("disabled", true);
        }
        //end of the line
        
        //Mandatory Sequence G Payment Instructions for Interest Payable by Party A
        //SEQ G view
        if ($("#_0950_of53a_party_identifier").val() != "" || $("#_0951_of53a_identifier_code").val() != "" || $("#_0952_of53d_party_identifier").val() != "" || $("#_0953_of53d_name_and_address").val() != "" || $("#_0960_of56a_party_identifier").val() != "" || $("#_0961_of56a_identifier_code").val() != "" || $("#_0962_of56d_party_identifier").val() != "" || $("#_0963_of56d_name_and_address").val() != "" || $("#_0970_of86a_party_identifier").val() != "" || $("#_0971_of86a_identifier_code").val() != "" || $("#_0972_of86d_party_identifier").val() != "" || $("#_0973_of86d_name_and_address").val() != "" || $("#_0980_mf57a_party_identifier").val() != "" || $("#_0981_mf57a_identifier_code").val() != "" || $("#_0982_mf57d_party_identifier").val() != "" || $("#_0983_mf57d_name_and_address").val() != ""){
            $("#seq_g_checkbox").attr("checked", true);
            $("#check_seq_g").show();
            $("#_0950_of53a_party_identifier").attr("disabled", false);
            $("#_0951_of53a_identifier_code").attr("disabled", false);
            $("#_0952_of53d_party_identifier").attr("disabled", false);
            $("#_0953_of53d_name_and_address").attr("disabled", false);
            $("#_0960_of56a_party_identifier").attr("disabled", false);
            $("#_0961_of56a_identifier_code").attr("disabled", false);
            $("#_0962_of56d_party_identifier").attr("disabled", false);
            $("#_0963_of56d_name_and_address").attr("disabled", false);
            $("#_0970_of86a_party_identifier").attr("disabled", false);
            $("#_0971_of86a_identifier_code").attr("disabled", false);
            $("#_0972_of86d_party_identifier").attr("disabled", false);
            $("#_0973_of86d_name_and_address").attr("disabled", false);
            $("#_0980_mf57a_party_identifier").attr("disabled", false);
            $("#_0981_mf57a_identifier_code").attr("disabled", false);
            $("#_0982_mf57d_party_identifier").attr("disabled", false);
            $("#_0983_mf57d_name_and_address").attr("disabled", false);
        } else {
            $("#check_seq_g").hide();
            $("#_0950_of53a_party_identifier").attr("disabled", true);
            $("#_0951_of53a_identifier_code").attr("disabled", true);
            $("#_0952_of53d_party_identifier").attr("disabled", true);
            $("#_0953_of53d_name_and_address").attr("disabled", true);
            $("#_0960_of56a_party_identifier").attr("disabled", true);
            $("#_0961_of56a_identifier_code").attr("disabled", true);
            $("#_0962_of56d_party_identifier").attr("disabled", true);
            $("#_0963_of56d_name_and_address").attr("disabled", true);
            $("#_0970_of86a_party_identifier").attr("disabled", true);
            $("#_0971_of86a_identifier_code").attr("disabled", true);
            $("#_0972_of86d_party_identifier").attr("disabled", true);
            $("#_0973_of86d_name_and_address").attr("disabled", true);
            $("#_0980_mf57a_party_identifier").attr("disabled", true);
            $("#_0981_mf57a_identifier_code").attr("disabled", true);
            $("#_0982_mf57d_party_identifier").attr("disabled", true);
            $("#_0983_mf57d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //OF53_a_d view
        if ($("#_0950_of53a_party_identifier").val() != "" || $("#_0951_of53a_identifier_code").val() != "") {
            $("#type_of53_g").val("a").attr("selected", true);
            $("#div_of53a_g").show();
            $("#div_of53d_g").hide();
            $("#_0950_of53a_party_identifier").attr("disabled", false);
            $("#_0951_of53a_identifier_code").attr("disabled", false);
            $("#_0952_of53d_party_identifier").attr("disabled", true);
            $("#_0953_of53d_name_and_address").attr("disabled", true);
        } else if ($("#_0582_of53d_party_identifier").val() != "" || $("#_0583_of53d_name_and_address").val() != "") {
            $("#type_of53_g").val("d").attr("selected", true);
            $("#div_of53a_g").hide();
            $("#div_of53d_g").show();
            $("#_0950_of53a_party_identifier").attr("disabled", true);
            $("#_0951_of53a_identifier_code").attr("disabled", true);
            $("#_0952_of53d_party_identifier").attr("disabled", false);
            $("#_0953_of53d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of53a_g").hide();
            $("#div_of53d_g").hide();
            $("#_0950_of53a_party_identifier").attr("disabled", true);
            $("#_0951_of53a_identifier_code").attr("disabled", true);
            $("#_0952_of53d_party_identifier").attr("disabled", true);
            $("#_0953_of53d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //OF56_a_d view
        if ($("#_0960_of56a_party_identifier").val() != "" || $("#_0961_of56a_identifier_code").val() != "") {
            $("#type_of56_g").val("a").attr("selected", true);
            $("#div_of56a_g").show();
            $("#div_of56d_g").hide();
            $("#_0960_of56a_party_identifier").attr("disabled", false);
            $("#_0961_of56a_identifier_code").attr("disabled", false);
            $("#_0962_of56d_party_identifier").attr("disabled", true);
            $("#_0963_of56d_name_and_address").attr("disabled", true);
        } else if ($("#_0962_of56d_party_identifier").val() != "" || $("#_0963_of56d_name_and_address").val() != "") {
            $("#type_of56_g").val("d").attr("selected", true);
            $("#div_of56a_g").hide();
            $("#div_of56d_g").show();
            $("#_0960_of56a_party_identifier").attr("disabled", true);
            $("#_0961_of56a_identifier_code").attr("disabled", true);
            $("#_0962_of56d_party_identifier").attr("disabled", false);
            $("#_0963_of56d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of56a_g").hide();
            $("#div_of56d_g").hide();
            $("#_0960_of56a_party_identifier").attr("disabled", true);
            $("#_0961_of56a_identifier_code").attr("disabled", true);
            $("#_0962_of56d_party_identifier").attr("disabled", true);
            $("#_0963_of56d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //OF86_a_d view
        if ($("#_0970_of86a_party_identifier").val() != "" || $("#_0971_of86a_identifier_code").val() != "") {
            $("#type_of86_g").val("a").attr("selected", true);
            $("#div_of86a_g").show();
            $("#div_of86d_g").hide();
            $("#_0970_of86a_party_identifier").attr("disabled", false);
            $("#_0971_of86a_identifier_code").attr("disabled", false);
            $("#_0972_of86d_party_identifier").attr("disabled", true);
            $("#_0973_of86d_name_and_address").attr("disabled", true);
        } else if ($("#_0972_of86d_party_identifier").val() != "" || $("#_0973_of86d_name_and_address").val() != "") {
            $("#type_of86_g").val("d").attr("selected", true);
            $("#div_of86a_g").hide();
            $("#div_of86d_g").show();
            $("#_0970_of86a_party_identifier").attr("disabled", true);
            $("#_0971_of86a_identifier_code").attr("disabled", true);
            $("#_0972_of86d_party_identifier").attr("disabled", false);
            $("#_0973_of86d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of86a_g").hide();
            $("#div_of86d_g").hide();
            $("#_0970_of86a_party_identifier").attr("disabled", true);
            $("#_0971_of86a_identifier_code").attr("disabled", true);
            $("#_0972_of86d_party_identifier").attr("disabled", true);
            $("#_0973_of86d_name_and_address").attr("disabled", true);
        }
        //end of the line
        //MF57_a_d view
        if ($("#_0980_mf57a_party_identifier").val() != "" || $("#_0981_mf57a_identifier_code").val() != "") {
            $("#type_mf57_gaccount_with_institution_g").val("a").attr("selected", true);
            $("#div_mf57a_g").show();
            $("#div_mf57d_g").hide();
            $("#_0980_mf57a_party_identifier").attr("disabled", false);
            $("#_0981_mf57a_identifier_code").attr("disabled", false);
            $("#_0982_mf57d_party_identifier").attr("disabled", true);
            $("#_0983_mf57d_name_and_address").attr("disabled", true);
        } else if ($("#_0982_mf57d_party_identifier").val() != "" || $("#_0983_mf57d_name_and_address").val() != "") {
            $("#type_mf57_gaccount_with_institution_g").val("d").attr("selected", true);
            $("#div_mf57a_g").hide();
            $("#div_mf57d_g").show();
            $("#_0980_mf57a_party_identifier").attr("disabled", true);
            $("#_0981_mf57a_identifier_code").attr("disabled", true);
            $("#_0982_mf57d_party_identifier").attr("disabled", false);
            $("#_0983_mf57d_name_and_address").attr("disabled", false);
        } else {
            $("#div_mf57a_g").hide();
            $("#div_mf57d_g").hide();
            $("#_0980_mf57a_party_identifier").attr("disabled", true);
            $("#_0981_mf57a_identifier_code").attr("disabled", true);
            $("#_0982_mf57d_party_identifier").attr("disabled", true);
            $("#_0983_mf57d_name_and_address").attr("disabled", true);
        }
        //end of the line
        
    });
</script>