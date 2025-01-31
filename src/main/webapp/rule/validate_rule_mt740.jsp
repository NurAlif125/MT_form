<%-- 
    Document   : mt740
    Created on : Aug 15, 2018
    Author     : Andhita Deara
--%>

<script type="text/javascript">
    $(document).ready(function() {
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
                //mf20
                _010_mf20_documentary_credit_number: "required",

                //mf40f
                _030_mf40f_applicable_rules: "required",
                
                //mf32b
                _070_mf32b_currency_credit_amount: "required",
                _071_mf32b_amount: "required",
                
                //mf41
                type_mf41_available_with_by: "required",
                _100_mf41a_identifier_code: "required",
                _101_mf41a_code: "required",
                _102_mf41d_name_address: "required",
                _103_mf41d_code: "required",
                
                //of42C
                _110_of42c_drafts_at: {
                    required: function(element) {
                        return ($("#type_of42_drawee").val() != "")
//                          || ($("#type_of42_drawee").val() == "" && $("#_130_of42m_mixed_payment_details").val() == "" && $("#_140_of42p_negotiation_payment_details").val() == "")
                          || ($("#type_of42_drawee").val() != "" && $("#_130_of42m_mixed_payment_details").val() != "")
                          || ($("#type_of42_drawee").val() != "" && $("#_140_of42p_negotiation_payment_details").val() != "")
                          || ($("#_130_of42m_mixed_payment_details").val() != "" && $("#_140_of42p_negotiation_payment_details").val() != "");
                    }
                },
                
                //of42
                type_of42_drawee: {
                    required: function(element) {
                        return ($("#_110_of42c_drafts_at").val() != "")
//                          || ($("#_110_of42c_drafts_at").val() == "" && $("#_130_of42m_mixed_payment_details").val() == "" && $("#_140_of42p_negotiation_payment_details").val() == "")
                          || ($("#_110_of42c_drafts_at").val() != "" && $("#_130_of42m_mixed_payment_details").val() != "")
                          || ($("#_110_of42c_drafts_at").val() != "" && $("#_140_of42p_negotiation_payment_details").val() != "")
                          || ($("#_130_of42m_mixed_payment_details").val() != "" && $("#_140_of42p_negotiation_payment_details").val() != "");
                    }
                },
                
                //of42m
                _130_of42m_mixed_payment_details: {
                    required: function(element) {
                        return ($("#_110_of42c_drafts_at").val() != "" && $("#_140_of42p_negotiation_payment_details").val() != "");
                    }
                },
                
                //of42p
                _140_of42p_negotiation_payment_details: {
                    required: function(element) {
                        return ($("#_110_of42c_drafts_at").val() != "" && $("#_130_of42m_mixed_payment_details").val() != "");
                    }
                },
                
                //of58a
//                type_of58_negotiating_bank: {
//                    required: function(element) {
//                      return ($("#type_of58_negotiating_bank").val() == "" && $("#_060_of59_account").val() == "" && $("#_061_of59_name_address").val() == "") 
//                              || ($("#type_of58_negotiating_bank").val() != "" && $("#_060_of59_account").val() != "")
//                              || ($("#type_of58_negotiating_bank").val() != "" && $("#_061_of59_name_address").val() != "");
//                    }
//                },
                
                //of59
//                beneficiary_checkbox: {
//                    required: function(element) {
//                      return ($("#type_of58_negotiating_bank").val() == "" && $("#_060_of59_account").val() == "" && $("#_061_of59_name_address").val() == "") 
//                              || ($("#type_of58_negotiating_bank").val() != "" && $("#_060_of59_account").val() != "")
//                              || ($("#type_of58_negotiating_bank").val() != "" && $("#_061_of59_name_address").val() != "");
//                    }
//                },
                

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_documentary_credit_number: {required: "mf20_documentary_credit_number harus diisi..!!"},
                _030_mf40f_applicable_rules: {required: "mf40f_applicable_rules harus diisi..!!"},
                _070_mf32b_currency_credit_amount: {required: "mf32b_currency_credit_amount harus diisi..!!"},
                _071_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                type_mf41_available_with_by: {required: "mf41_available_with_by harus diisi..!!"},
                _100_mf41a_identifier_code: {required: "mf41a_identifier_code harus diisi..!!"},
                _101_mf41a_code: {required: "mf41a_code harus diisi..!!"},
                _102_mf41d_name_address: {required: "mf41d_name_address harus diisi..!!"},
                _103_mf41d_code: {required: "mf41d_code harus diisi..!!"},
                _110_of42c_drafts_at: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
                type_of42_drawee: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
                _130_of42m_mixed_payment_details: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
                _140_of42p_negotiation_payment_details: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
//                type_of58_negotiating_bank: {required: "isi antara field of58 atau of59..!!"},
//                beneficiary_checkbox: {required: "isi antara field of58 atau of59..!!"},
                
            },
            errorPlacement: function(error,element){
                error.insertAfter(element);
                alert(error.html());
            },
            showErrors: function(errorMap, errorList){
                this.defaultShowErrors();
            }
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
        
        //OF31D_check
        $("#check_of31d").hide();
        $("#_040_of31d_date").attr("disabled", true);
        $("#_041_of31d_place").attr("disabled", true);
        $("#date_place_of_expiry_checkbox").click(function(){
            if ($("#date_place_of_expiry_checkbox").is(":checked")){
                $("#check_of31d").show();
                $("#_040_of31d_date").attr("disabled", false);
                $("#_041_of31d_place").attr("disabled", false);
            } else {
                $("#check_of31d").hide();
                $("#_040_of31d_date").attr("disabled", true);
                $("#_041_of31d_place").attr("disabled", true);
            }
        });
        
        //OF59_check
        $("#check_of59").hide();
        $("#_060_of59_account").attr("disabled", true);
        $("#_061_of59_name_address").attr("disabled", true);
        $("#beneficiary_checkbox").click(function(){
            if ($("#beneficiary_checkbox").is(":checked")){
                $("#check_of59").show();
                $("#_060_of59_account").attr("disabled", false);
                $("#_061_of59_name_address").attr("disabled", false);
            } else {
                $("#check_of59").hide();
                $("#_060_of59_account").attr("disabled", true);
                $("#_061_of59_name_address").attr("disabled", true);
            }
        });
        
        //OF39A_check
        $("#check_of39a").hide();
        $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
        $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        $("#percentage_credit_amount_checkbox").click(function(){
            if ($("#percentage_credit_amount_checkbox").is(":checked")){
                $("#check_of39a").show();
                $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
                $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
            } else {
                $("#check_of39a").hide();
                $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
            }
        });
        
        //OF58_a_d
        $("#div_of58a_").hide();
        $("#div_of58d_").hide();
        $("#_050_of58a_party_identifier").attr("disabled", true);
        $("#_051_of58a_identifier_code").attr("disabled", true);
        $("#_052_of58d_party_identifier").attr("disabled", true);
        $("#_053_of58d_name_address").attr("disabled", true);
        $("#type_of58_negotiating_bank").change(function() {
            if ( $("#type_of58_negotiating_bank").val() == "a"){
                $("#div_of58a_").show();
                $("#div_of58d_").hide();
                $("#_050_of58a_party_identifier").attr("disabled", false);
                $("#_051_of58a_identifier_code").attr("disabled", false);
                $("#_052_of58d_party_identifier").attr("disabled", true);
                $("#_053_of58d_name_address").attr("disabled", true);
            } else if ( $("#type_of58_negotiating_bank").val() == "d"){
                $("#div_of58a_").hide();
                $("#div_of58d_").show();
                $("#_050_of58a_party_identifier").attr("disabled", true);
                $("#_051_of58a_identifier_code").attr("disabled", true);
                $("#_052_of58d_party_identifier").attr("disabled", false);
                $("#_053_of58d_name_address").attr("disabled", false);
            } else{
                $("#div_of58a_").hide();
                $("#div_of58d_").hide();
                $("#_050_of58a_party_identifier").attr("disabled", true);
                $("#_051_of58a_identifier_code").attr("disabled", true);
                $("#_052_of58d_party_identifier").attr("disabled", true);
                $("#_053_of58d_name_address").attr("disabled", true);
            }
        });
        
        //MF41_a_d
        $("#div_mf41a_").hide();
        $("#div_mf41d_").hide();
        $("#_100_mf41a_identifier_code").attr("disabled", true);
        $("#_101_mf41a_code").attr("disabled", true);
        $("#_102_mf41d_name_address").attr("disabled", true);
        $("#_103_mf41d_code").attr("disabled", true);
        $("#type_mf41_available_with_by").change(function() {
            if ( $("#type_mf41_available_with_by").val() == "a"){
                $("#div_mf41a_").show();
                $("#div_mf41d_").hide();
                $("#_100_mf41a_identifier_code").attr("disabled", false);
                $("#_101_mf41a_code").attr("disabled", false);
                $("#_102_mf41d_name_address").attr("disabled", true);
                $("#_103_mf41d_code").attr("disabled", true);
            } else if ( $("#type_mf41_available_with_by").val() == "d"){
                $("#div_mf41a_").hide();
                $("#div_mf41d_").show();
                $("#_100_mf41a_identifier_code").attr("disabled", true);
                $("#_101_mf41a_code").attr("disabled", true);
                $("#_102_mf41d_name_address").attr("disabled", false);
                $("#_103_mf41d_code").attr("disabled", false);
            } else{
                $("#div_mf41a_").hide();
                $("#div_mf41d_").hide();
                $("#_100_mf41a_identifier_code").attr("disabled", true);
                $("#_101_mf41a_code").attr("disabled", true);
                $("#_102_mf41d_name_address").attr("disabled", true);
                $("#_103_mf41d_code").attr("disabled", true);
            }
        });
        
        //OF42_a_d
        $("#div_of42a_").hide();
        $("#div_of42d_").hide();
        $("#_120_of42a_party_identifier").attr("disabled", true);
        $("#_121_of42a_identifier_code").attr("disabled", true);
        $("#_122_of42d_party_identifier").attr("disabled", true);
        $("#_123_of42d_name_address").attr("disabled", true);
        $("#type_of42_drawee").change(function() {
            if ( $("#type_of42_drawee").val() == "a"){
                $("#div_of42a_").show();
                $("#div_of42d_").hide();
                $("#_120_of42a_party_identifier").attr("disabled", false);
                $("#_121_of42a_identifier_code").attr("disabled", false);
                $("#_122_of42d_party_identifier").attr("disabled", true);
                $("#_123_of42d_name_address").attr("disabled", true);
            } else if ( $("#type_of42_drawee").val() == "d"){
                $("#div_of42a_").hide();
                $("#div_of42d_").show();
                $("#_120_of42a_party_identifier").attr("disabled", true);
                $("#_121_of42a_identifier_code").attr("disabled", true);
                $("#_122_of42d_party_identifier").attr("disabled", false);
                $("#_123_of42d_name_address").attr("disabled", false);
            } else{
                $("#div_of42a_").hide();
                $("#div_of42d_").hide();
                $("#_120_of42a_party_identifier").attr("disabled", true);
                $("#_121_of42a_identifier_code").attr("disabled", true);
                $("#_122_of42d_party_identifier").attr("disabled", true);
                $("#_123_of42d_name_address").attr("disabled", true);
            }
        });
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF31D_check
        if ($("#_040_of31d_date").val() != "" || $("#_041_of31d_place").val() != ""){
            $("#date_place_of_expiry_checkbox").attr("checked", true);
            $("#check_of31d").show();
            $("#_040_of31d_date").attr("disabled", false);
            $("#_041_of31d_place").attr("disabled", false);
        } else {
            $("#check_of31d").hide();
            $("#_040_of31d_date").attr("disabled", true);
            $("#_041_of31d_place").attr("disabled", true);
        }
        
        //OF59_check
        if ($("#_060_of59_account").val() != "" || $("#_061_of59_name_address").val() != ""){
            $("#beneficiary_checkbox").attr("checked", true);
            $("#check_of59").show();
            $("#_060_of59_account").attr("disabled", false);
            $("#_061_of59_name_address").attr("disabled", false);
        } else {
            $("#check_of59").hide();
            $("#_060_of59_account").attr("disabled", true);
            $("#_061_of59_name_address").attr("disabled", true);
        }
        
        //OF39A_check
        if ($("#_080_of39a_percentage_credit_amount_tolerance1").val() != "" || $("#_081_of39a_percentage_credit_amount_tolerance2").val() != ""){
            $("#percentage_credit_amount_checkbox").attr("checked", true);
            $("#check_of39a").show();
            $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
            $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
        } else {
            $("#check_of39a").hide();
            $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
            $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        }
        
        //OF58_a_d
        if ($("#_050_of58a_party_identifier").val() != "" || $("#_051_of58a_identifier_code").val() != ""){
            $("#type_of58_negotiating_bank").val("a").attr("selected",true);
            $("#div_of58a_").show();
            $("#div_of58d_").hide();
            $("#_050_of58a_party_identifier").attr("disabled", false);
            $("#_051_of58a_identifier_code").attr("disabled", false);
            $("#_052_of58d_party_identifier").attr("disabled", true);
            $("#_053_of58d_name_address").attr("disabled", true);
        } else if ($("#_052_of58d_party_identifier").val() != "" || $("#_053_of58d_name_address").val() != ""){
            $("#type_of58_negotiating_bank").val("d").attr("selected",true);
            $("#div_of58a_").hide();
            $("#div_of58d_").show();
            $("#_050_of58a_party_identifier").attr("disabled", true);
            $("#_051_of58a_identifier_code").attr("disabled", true);
            $("#_052_of58d_party_identifier").attr("disabled", false);
            $("#_053_of58d_name_address").attr("disabled", false);
        } else{
            $("#div_of58a_").hide();
            $("#div_of58d_").hide();
            $("#_050_of58a_party_identifier").attr("disabled", true);
            $("#_051_of58a_identifier_code").attr("disabled", true);
            $("#_052_of58d_party_identifier").attr("disabled", true);
            $("#_053_of58d_name_address").attr("disabled", true);
        }
        
        //MF41_a_d
        if ($("#_100_mf41a_identifier_code").val() != "" || $("#_101_mf41a_code").val() != ""){
            $("#type_mf41_available_with_by").val("a").attr("selected",true);
            $("#div_mf41a_").show();
            $("#div_mf41d_").hide();
            $("#_100_mf41a_identifier_code").attr("disabled", false);
            $("#_101_mf41a_code").attr("disabled", false);
            $("#_102_mf41d_name_address").attr("disabled", true);
            $("#_103_mf41d_code").attr("disabled", true);
        } else if ($("#_102_mf41d_name_address").val() != "" || $("#_103_mf41d_code").val() != ""){
            $("#type_mf41_available_with_by").val("d").attr("selected",true);
            $("#div_mf41a_").hide();
            $("#div_mf41d_").show();
            $("#_100_mf41a_identifier_code").attr("disabled", true);
            $("#_101_mf41a_code").attr("disabled", true);
            $("#_102_mf41d_name_address").attr("disabled", false);
            $("#_103_mf41d_code").attr("disabled", false);
        } else{
            $("#div_mf41a_").hide();
            $("#div_mf41d_").hide();
            $("#_100_mf41a_identifier_code").attr("disabled", true);
            $("#_101_mf41a_code").attr("disabled", true);
            $("#_102_mf41d_name_address").attr("disabled", true);
            $("#_103_mf41d_code").attr("disabled", true);
        }
        
        //OF42_a_d
        if ($("#_120_of42a_party_identifier").val() != "" || $("#_121_of42a_identifier_code").val() != ""){
            $("#type_of42_drawee").val("a").attr("selected",true);
            $("#div_of42a_").show();
            $("#div_of42d_").hide();
            $("#_120_of42a_party_identifier").attr("disabled", false);
            $("#_121_of42a_identifier_code").attr("disabled", false);
            $("#_122_of42d_party_identifier").attr("disabled", true);
            $("#_123_of42d_name_address").attr("disabled", true);
        } else if ($("#_122_of42d_party_identifier").val() != "" || $("#_123_of42d_name_address").val() != ""){
            $("#type_of42_drawee").val("d").attr("selected",true);
            $("#div_of42a_").hide();
            $("#div_of42d_").show();
            $("#_120_of42a_party_identifier").attr("disabled", true);
            $("#_121_of42a_identifier_code").attr("disabled", true);
            $("#_122_of42d_party_identifier").attr("disabled", false);
            $("#_123_of42d_name_address").attr("disabled", false);
        } else{
            $("#div_of42a_").hide();
            $("#div_of42d_").hide();
            $("#_120_of42a_party_identifier").attr("disabled", true);
            $("#_121_of42a_identifier_code").attr("disabled", true);
            $("#_122_of42d_party_identifier").attr("disabled", true);
            $("#_123_of42d_name_address").attr("disabled", true);
        }
        
    });
</script>