<%-- 
    Document   : validate_rule_mt102
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : M Abdul Hadi
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
                //Mandatory Sequence A General Information
                _010_mf20_sender_reference: "required",
                _011_mf23_: "required",


                //Mandatory Repetitive Sequence B Transaction Details
                _040_mf21_: "required",
                _041_mf32b_currency: "required",
                _042_mf32b_amount: "required",

                //of50
                _051_of50a_identifier_code: "required",
                _053_of50f_party_identifier: "required",
                _054_of50f_name_address: "required",
                _056_of50k_name_address: "required",

                //of52
                _061_of52a_identifier_code: "required",
                _065_of52c_party_identifier: "required",

                //of57
                _071_of57a_identifier_code: "required",
                _073_of57c_party_identifier: "required",

                //mf59/59a
                type_of59_59a_seq_b: "required",
                _081_mf59_name_address: "required",
                _083_mf59a_identifier_code: "required",

                //Mandatory Sequence C Settlement Details
                _120_mf32a_date: "required",
                _121_mf32a_currency: "required",
                _122_mf32a_amount: "required",

                //of53_a_c
                _161_of53a_identifier_code: "required",
                _163_of53c_account: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sender_reference: {required: "mf20 harus diisi..!!"},
                _011_mf23_: {required: "mf23 harus diisi..!!"},
                _016_of50a_identifier_code: {required: "of50a_identifier_code harus diisi..!!"},
                _018_of50f_party_identifier: {required: "of50f_party_identifier harus diisi..!!"},
                _019_of50f_name_address: {required: "of50f_name_address harus diisi..!!"},
                _021_of50k_name_address: {required: "of50k_name_address harus diisi..!!"},
                _023_of52a_identifier_code: {required: "of52a_identifier_code harus diisi..!!"},
                _027_of52c_party_identifier: {required: "of52c_party_identifier harus diisi..!!"},
                _040_mf21_: {required: "mf21 harus diisi..!!"},
                _041_mf32b_currency: {required: "mf32b_currency harus diisi..!!"},
                _042_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                _051_of50a_identifier_code: {required: "of50a_identifier_code harus diisi..!!"},
                _053_of50f_party_identifier: {required: "of50f_party_identifier harus diisi..!!"},
                _054_of50f_name_address: {required: "of50f_name_address harus diisi..!!"},
                _056_of50k_name_address: {required: "of50k_name_address harus diisi..!!"},
                _061_of52a_identifier_code: {required: "of52a_identifier_code harus diisi..!!"},
                _065_of52c_party_identifier: {required: "of52c_party_identifier harus diisi..!!"},
                _071_of57a_identifier_code: {required: "of57a_identifier_code harus diisi..!!"},
                _073_of57c_party_identifier: {required: "of57c_party_identifier harus diisi..!!"},
                type_of59_59a_seq_b: {required: "of59_59a_seq_b harus diisi..!!"},
                _081_mf59_name_address: {required: "mf59_name_address harus diisi..!!"},
                _083_mf59a_identifier_code: {required: "mf59a_identifier_code harus diisi..!!"},
                _120_mf32a_date: {required: "mf32a_date harus diisi..!!"},
                _121_mf32a_currency: {required: "mf32a_currency harus diisi..!!"},
                _122_mf32a_amount: {required: "mf32a_amount harus diisi..!!"},
                _161_of53a_identifier_code: {required: "of53a_identifier_code harus diisi..!!"},
                _163_of53c_account: {required: "of53c_account harus diisi..!!"}
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

        //of50_a_f_k sequence b
        $("#div_of50a_seq_b").hide();
        $("#div_of50f_seq_b").hide();
        $("#div_of50k_seq_b").hide();
        $("#_050_of50a_account").attr("disabled", true);
        $("#_051_of50a_identifier_code").attr("disabled", true);
        $("#_053_of50f_party_identifier").attr("disabled", true);
        $("#_054_of50f_name_address").attr("disabled", true);
        $("#_055_of50k_account").attr("disabled", true);
        $("#_056_of50k_name_address").attr("disabled", true);
        $("#type_of50_seq_b").change(function() {
            if ( $("#type_of50_seq_b").val() == "a"){
                $("#div_of50a_seq_b").show();
                $("#_050_of50a_account").attr("disabled", false);
                $("#_051_of50a_identifier_code").attr("disabled", false);
                $("#div_of50f_seq_b").hide();
                $("#_053_of50f_party_identifier").attr("disabled", true);
                $("#_054_of50f_name_address").attr("disabled", true);
                $("#div_of50k_seq_b").hide();
                $("#_055_of50k_account").attr("disabled", true);
                $("#_056_of50k_name_address").attr("disabled", true);
            } else if ( $("#type_of50_seq_b").val() == "f"){
                $("#div_of50a_seq_b").hide();
                $("#_050_of50a_account").attr("disabled", true);
                $("#_051_of50a_identifier_code").attr("disabled", true);
                $("#div_of50f_seq_b").show();
                $("#_053_of50f_party_identifier").attr("disabled", false);
                $("#_054_of50f_name_address").attr("disabled", false);
                $("#div_of50k_seq_b").hide();
                $("#_055_of50k_account").attr("disabled", true);
                $("#_056_of50k_name_address").attr("disabled", true);
            } else if ( $("#type_of50_seq_b").val() == "k"){
                $("#div_of50a_seq_b").hide();
                $("#_050_of50a_account").attr("disabled", true);
                $("#_051_of50a_identifier_code").attr("disabled", true);
                $("#div_of50f_seq_b").hide();
                $("#_053_of50f_party_identifier").attr("disabled", true);
                $("#_054_of50f_name_address").attr("disabled", true);
                $("#div_of50k_seq_b").show();
                $("#_055_of50k_account").attr("disabled", false);
                $("#_056_of50k_name_address").attr("disabled", false);
            } else{
                $("#div_of50a_seq_b").hide();
                $("#div_of50f_seq_b").hide();
                $("#div_of50k_seq_b").hide();
                $("#_050_of50a_account").attr("disabled", true);
                $("#_051_of50a_identifier_code").attr("disabled", true);
                $("#_053_of50f_party_identifier").attr("disabled", true);
                $("#_054_of50f_name_address").attr("disabled", true);
                $("#_055_of50k_account").attr("disabled", true);
                $("#_056_of50k_name_address").attr("disabled", true);
            }
        });

        //of52_a_b_c sequence b
        $("#div_of52a_seq_b").hide();
        $("#div_of52b_seq_b").hide();
        $("#div_of52c_seq_b").hide();
        $("#_060_of52a_party_identifier").attr("disabled", true);
        $("#_061_of52a_identifier_code").attr("disabled", true);
        $("#_063_of52b_party_identifier").attr("disabled", true);
        $("#_064_of52b_location").attr("disabled", true);
        $("#_065_of52c_party_identifier").attr("disabled", true);
        $("#type_of52_seq_b").change(function() {
            if ( $("#type_of52_seq_b").val() == "a"){
                $("#div_of52a_seq_b").show();
                $("#div_of52b_seq_b").hide();
                $("#div_of52c_seq_b").hide();
                $("#_060_of52a_party_identifier").attr("disabled", false);
                $("#_061_of52a_identifier_code").attr("disabled", false);
                $("#_063_of52b_party_identifier").attr("disabled", true);
                $("#_064_of52b_location").attr("disabled", true);
                $("#_065_of52c_party_identifier").attr("disabled", true);
            } else if ( $("#type_of52_seq_b").val() == "b"){
                $("#div_of52a_seq_b").hide();
                $("#div_of52b_seq_b").show();
                $("#div_of52c_seq_b").hide();
                $("#_060_of52a_party_identifier").attr("disabled", true);
                $("#_061_of52a_identifier_code").attr("disabled", true);
                $("#_063_of52b_party_identifier").attr("disabled", false);
                $("#_064_of52b_location").attr("disabled", false);
                $("#_065_of52c_party_identifier").attr("disabled", true);
            } else if ( $("#type_of52_seq_b").val() == "c"){
                $("#div_of52a_seq_b").hide();
                $("#div_of52b_seq_b").hide();
                $("#div_of52c_seq_b").show();
                $("#_060_of52a_party_identifier").attr("disabled", true);
                $("#_061_of52a_identifier_code").attr("disabled", true);
                $("#_063_of52b_party_identifier").attr("disabled", true);
                $("#_064_of52b_location").attr("disabled", true);
                $("#_065_of52c_party_identifier").attr("disabled", false);
            } else{
                $("#div_of52a_seq_b").hide();
                $("#div_of52b_seq_b").hide();
                $("#div_of52c_seq_b").hide();
                $("#_060_of52a_party_identifier").attr("disabled", true);
                $("#_061_of52a_identifier_code").attr("disabled", true);
                $("#_063_of52b_party_identifier").attr("disabled", true);
                $("#_064_of52b_location").attr("disabled", true);
                $("#_065_of52c_party_identifier").attr("disabled", true);
            }
        });

        //of57_a_c sequence b
        $("#div_of57a_seq_b").hide();
        $("#div_of57c_seq_b").hide();
        $("#_070_of57a_party_identifier").attr("disabled", true);
        $("#_071_of57a_identifier_code").attr("disabled", true);
        $("#_073_of57c_party_identifier").attr("disabled", true);
        $("#type_of57_seq_b").change(function() {
            if ( $("#type_of57_seq_b").val() == "a"){
                $("#div_of57a_seq_b").show();
                $("#div_of57c_seq_b").hide();
                $("#_070_of57a_party_identifier").attr("disabled", false);
                $("#_071_of57a_identifier_code").attr("disabled", false);
                $("#_073_of57c_party_identifier").attr("disabled", true);
            } else if ( $("#type_of57_seq_b").val() == "c"){
                $("#div_of57a_seq_b").hide();
                $("#div_of57c_seq_b").show();
                $("#_070_of57a_party_identifier").attr("disabled", true);
                $("#_071_of57a_identifier_code").attr("disabled", true);
                $("#_073_of57c_party_identifier").attr("disabled", false);
            } else{
                $("#div_of57a_seq_b").hide();
                $("#div_of57c_seq_b").hide();
                $("#_070_of57a_party_identifier").attr("disabled", true);
                $("#_071_of57a_identifier_code").attr("disabled", true);
                $("#_073_of57c_party_identifier").attr("disabled", true);
            }
        });

        //mf59/59a sequence b
        $("#div_mf59_seq_b").hide();
        $("#div_mf59a_seq_b").hide();
        $("#_080_mf59_account").attr("disabled", true);
        $("#_081_mf59_name_address").attr("disabled", true);
        $("#_082_mf59a_account").attr("disabled", true);
        $("#_083_mf59a_identifier_code").attr("disabled", true);
        $("#type_of59_59a_seq_b").change(function() {
            if ( $("#type_of59_59a_seq_b").val() == "59"){
                $("#div_mf59_seq_b").show();
                $("#div_mf59a_seq_b").hide();
                $("#_080_mf59_account").attr("disabled", false);
                $("#_081_mf59_name_address").attr("disabled", false);
                $("#_082_mf59a_account").attr("disabled", true);
                $("#_083_mf59a_identifier_code").attr("disabled", true);
            } else if ( $("#type_of59_59a_seq_b").val() == "59a"){
                $("#div_mf59_seq_b").hide();
                $("#div_mf59a_seq_b").show();
                $("#_080_mf59_account").attr("disabled", true);
                $("#_081_mf59_name_address").attr("disabled", true);
                $("#_082_mf59a_account").attr("disabled", false);
                $("#_083_mf59a_identifier_code").attr("disabled", false);
            } else{
                $("#div_mf59_seq_b").hide();
                $("#div_mf59a_seq_b").hide();
                $("#_080_mf59_account").attr("disabled", true);
                $("#_081_mf59_name_address").attr("disabled", true);
                $("#_082_mf59a_account").attr("disabled", true);
                $("#_083_mf59a_identifier_code").attr("disabled", true);
            }
        });


        //sequence b2
        //of50_a_f_k sequence b2
        $("#div_of50a_seq_b_2").hide();
        $("#div_of50f_seq_b_2").hide();
        $("#div_of50k_seq_b_2").hide();
        $("#_110_of50a_account").attr("disabled", true);
        $("#_111_of50a_identifier_code").attr("disabled", true);
        $("#_113_of50f_party_identifier").attr("disabled", true);
        $("#_114_of50f_name_address").attr("disabled", true);
        $("#_115_of50k_account").attr("disabled", true);
        $("#_116_of50k_name_address").attr("disabled", true);
        $("#type_of50_seq_b_2").change(function() {
            if ( $("#type_of50_seq_b_2").val() == "a"){
                $("#div_of50a_seq_b_2").show();
                $("#_110_of50a_account").attr("disabled", false);
                $("#_111_of50a_identifier_code").attr("disabled", false);
                $("#div_of50f_seq_b_2").hide();
                $("#_113_of50f_party_identifier").attr("disabled", true);
                $("#_114_of50f_name_address").attr("disabled", true);
                $("#div_of50k_seq_b_2").hide();
                $("#_115_of50k_account").attr("disabled", true);
                $("#_116_of50k_name_address").attr("disabled", true);
            } else if ( $("#type_of50_seq_b_2").val() == "f"){
                $("#div_of50a_seq_b_2").hide();
                $("#_110_of50a_account").attr("disabled", true);
                $("#_111_of50a_identifier_code").attr("disabled", true);
                $("#div_of50f_seq_b_2").show();
                $("#_113_of50f_party_identifier").attr("disabled", false);
                $("#_114_of50f_name_address").attr("disabled", false);
                $("#div_of50k_seq_b_2").hide();
                $("#_115_of50k_account").attr("disabled", true);
                $("#_116_of50k_name_address").attr("disabled", true);
            } else if ( $("#type_of50_seq_b_2").val() == "k"){
                $("#div_of50a_seq_b_2").hide();
                $("#_110_of50a_account").attr("disabled", true);
                $("#_111_of50a_identifier_code").attr("disabled", true);
                $("#div_of50f_seq_b_2").hide();
                $("#_113_of50f_party_identifier").attr("disabled", true);
                $("#_114_of50f_name_address").attr("disabled", true);
                $("#div_of50k_seq_b_2").show();
                $("#_115_of50k_account").attr("disabled", false);
                $("#_116_of50k_name_address").attr("disabled", false);
            } else{
                $("#div_of50a_seq_b_2").hide();
                $("#div_of50f_seq_b_2").hide();
                $("#div_of50k_seq_b_2").hide();
                $("#_110_of50a_account").attr("disabled", true);
                $("#_111_of50a_identifier_code").attr("disabled", true);
                $("#_113_of50f_party_identifier").attr("disabled", true);
                $("#_114_of50f_name_address").attr("disabled", true);
                $("#_115_of50k_account").attr("disabled", true);
                $("#_116_of50k_name_address").attr("disabled", true);
            }
        });

        //of52_a_b_c sequence b2
        $("#div_of52a_seq_b_2").hide();
        $("#div_of52b_seq_b_2").hide();
        $("#div_of52c_seq_b_2").hide();
        $("#_120_of52a_party_identifier").attr("disabled", true);
        $("#_121_of52a_identifier_code").attr("disabled", true);
        $("#_123_of52b_party_identifier").attr("disabled", true);
        $("#_124_of52b_location").attr("disabled", true);
        $("#_125_of52c_party_identifier").attr("disabled", true);
        $("#type_of52_seq_b_2").change(function() {
            if ( $("#type_of52_seq_b_2").val() == "a"){
                $("#div_of52a_seq_b_2").show();
                $("#div_of52b_seq_b_2").hide();
                $("#div_of52c_seq_b_2").hide();
                $("#_120_of52a_party_identifier").attr("disabled", false);
                $("#_121_of52a_identifier_code").attr("disabled", false);
                $("#_123_of52b_party_identifier").attr("disabled", true);
                $("#_124_of52b_location").attr("disabled", true);
                $("#_125_of52c_party_identifier").attr("disabled", true);
            } else if ( $("#type_of52_seq_b_2").val() == "b"){
                $("#div_of52a_seq_b_2").hide();
                $("#div_of52b_seq_b_2").show();
                $("#div_of52c_seq_b_2").hide();
                $("#_120_of52a_party_identifier").attr("disabled", true);
                $("#_121_of52a_identifier_code").attr("disabled", true);
                $("#_123_of52b_party_identifier").attr("disabled", false);
                $("#_124_of52b_location").attr("disabled", false);
                $("#_125_of52c_party_identifier").attr("disabled", true);
            } else if ( $("#type_of52_seq_b_2").val() == "c"){
                $("#div_of52a_seq_b_2").hide();
                $("#div_of52b_seq_b_2").hide();
                $("#div_of52c_seq_b_2").show();
                $("#_120_of52a_party_identifier").attr("disabled", true);
                $("#_121_of52a_identifier_code").attr("disabled", true);
                $("#_123_of52b_party_identifier").attr("disabled", true);
                $("#_124_of52b_location").attr("disabled", true);
                $("#_125_of52c_party_identifier").attr("disabled", false);
            } else{
                $("#div_of52a_seq_b_2").hide();
                $("#div_of52b_seq_b_2").hide();
                $("#div_of52c_seq_b_2").hide();
                $("#_120_of52a_party_identifier").attr("disabled", true);
                $("#_121_of52a_identifier_code").attr("disabled", true);
                $("#_123_of52b_party_identifier").attr("disabled", true);
                $("#_124_of52b_location").attr("disabled", true);
                $("#_125_of52c_party_identifier").attr("disabled", true);
            }
        });

        //of57_a_c sequence b2
        $("#div_of57a_seq_b_2").hide();
        $("#div_of57c_seq_b_2").hide();
        $("#_130_of57a_party_identifier").attr("disabled", true);
        $("#_131_of57a_identifier_code").attr("disabled", true);
        $("#_133_of57c_party_identifier").attr("disabled", true);
        $("#type_of57_seq_b_2").change(function() {
            if ( $("#type_of57_seq_b_2").val() == "a"){
                $("#div_of57a_seq_b_2").show();
                $("#div_of57c_seq_b_2").hide();
                $("#_130_of57a_party_identifier").attr("disabled", false);
                $("#_131_of57a_identifier_code").attr("disabled", false);
                $("#_133_of57c_party_identifier").attr("disabled", true);
            } else if ( $("#type_of57_seq_b_2").val() == "c"){
                $("#div_of57a_seq_b_2").hide();
                $("#div_of57c_seq_b_2").show();
                $("#_130_of57a_party_identifier").attr("disabled", true);
                $("#_131_of57a_identifier_code").attr("disabled", true);
                $("#_133_of57c_party_identifier").attr("disabled", false);
            } else{
                $("#div_of57a_seq_b_2").hide();
                $("#div_of57c_seq_b_2").hide();
                $("#_130_of57a_party_identifier").attr("disabled", true);
                $("#_131_of57a_identifier_code").attr("disabled", true);
                $("#_133_of57c_party_identifier").attr("disabled", true);
            }
        });

        //mf59/59a sequence b2
        $("#div_mf59_seq_b_2").hide();
        $("#div_mf59a_seq_b_2").hide();
        $("#_140_mf59_account").attr("disabled", true);
        $("#_141_mf59_name_address").attr("disabled", true);
        $("#_142_mf59a_account").attr("disabled", true);
        $("#_143_mf59a_identifier_code").attr("disabled", true);
        $("#type_of59_59a_seq_b_2").change(function() {
            if ( $("#type_of59_59a_seq_b_2").val() == "59"){
                $("#div_mf59_seq_b_2").show();
                $("#div_mf59a_seq_b_2").hide();
                $("#_140_mf59_account").attr("disabled", false);
                $("#_141_mf59_name_address").attr("disabled", false);
                $("#_142_mf59a_account").attr("disabled", true);
                $("#_143_mf59a_identifier_code").attr("disabled", true);
            } else if ( $("#type_of59_59a_seq_b_2").val() == "59a"){
                $("#div_mf59_seq_b_2").hide();
                $("#div_mf59a_seq_b_2").show();
                $("#_140_mf59_account").attr("disabled", true);
                $("#_141_mf59_name_address").attr("disabled", true);
                $("#_142_mf59a_account").attr("disabled", false);
                $("#_143_mf59a_identifier_code").attr("disabled", false);
            } else{
                $("#div_mf59_seq_b_2").hide();
                $("#div_mf59a_seq_b_2").hide();
                $("#_140_mf59_account").attr("disabled", true);
                $("#_141_mf59_name_address").attr("disabled", true);
                $("#_142_mf59a_account").attr("disabled", true);
                $("#_143_mf59a_identifier_code").attr("disabled", true);
            }
        });
        
        //sequence b3
        //of50_a_f_k sequence b3
        $("#div_of50a_seq_b_3").hide();
        $("#div_of50f_seq_b_3").hide();
        $("#div_of50k_seq_b_3").hide();
        $("#_170_of50a_account").attr("disabled", true);
        $("#_171_of50a_identifier_code").attr("disabled", true);
        $("#_173_of50f_party_identifier").attr("disabled", true);
        $("#_174_of50f_name_address").attr("disabled", true);
        $("#_175_of50k_account").attr("disabled", true);
        $("#_176_of50k_name_address").attr("disabled", true);
        $("#type_of50_seq_b_3").change(function() {
            if ( $("#type_of50_seq_b_3").val() == "a"){
                $("#div_of50a_seq_b_3").show();
                $("#_170_of50a_account").attr("disabled", false);
                $("#_171_of50a_identifier_code").attr("disabled", false);
                $("#div_of50f_seq_b_3").hide();
                $("#_173_of50f_party_identifier").attr("disabled", true);
                $("#_174_of50f_name_address").attr("disabled", true);
                $("#div_of50k_seq_b_3").hide();
                $("#_175_of50k_account").attr("disabled", true);
                $("#_176_of50k_name_address").attr("disabled", true);
            } else if ( $("#type_of50_seq_b_3").val() == "f"){
                $("#div_of50a_seq_b_3").hide();
                $("#_170_of50a_account").attr("disabled", true);
                $("#_171_of50a_identifier_code").attr("disabled", true);
                $("#div_of50f_seq_b_3").show();
                $("#_173_of50f_party_identifier").attr("disabled", false);
                $("#_174_of50f_name_address").attr("disabled", false);
                $("#div_of50k_seq_b_3").hide();
                $("#_175_of50k_account").attr("disabled", true);
                $("#_176_of50k_name_address").attr("disabled", true);
            } else if ( $("#type_of50_seq_b_3").val() == "k"){
                $("#div_of50a_seq_b_3").hide();
                $("#_170_of50a_account").attr("disabled", true);
                $("#_171_of50a_identifier_code").attr("disabled", true);
                $("#div_of50f_seq_b_3").hide();
                $("#_173_of50f_party_identifier").attr("disabled", true);
                $("#_174_of50f_name_address").attr("disabled", true);
                $("#div_of50k_seq_b_3").show();
                $("#_175_of50k_account").attr("disabled", false);
                $("#_176_of50k_name_address").attr("disabled", false);
            } else{
                $("#div_of50a_seq_b_3").hide();
                $("#div_of50f_seq_b_3").hide();
                $("#div_of50k_seq_b_3").hide();
                $("#_170_of50a_account").attr("disabled", true);
                $("#_171_of50a_identifier_code").attr("disabled", true);
                $("#_173_of50f_party_identifier").attr("disabled", true);
                $("#_174_of50f_name_address").attr("disabled", true);
                $("#_175_of50k_account").attr("disabled", true);
                $("#_176_of50k_name_address").attr("disabled", true);
            }
        });

        //of52_a_b_c sequence b3
        $("#div_of52a_seq_b_3").hide();
        $("#div_of52b_seq_b_3").hide();
        $("#div_of52c_seq_b_3").hide();
        $("#_180_of52a_party_identifier").attr("disabled", true);
        $("#_181_of52a_identifier_code").attr("disabled", true);
        $("#_183_of52b_party_identifier").attr("disabled", true);
        $("#_184_of52b_location").attr("disabled", true);
        $("#_185_of52c_party_identifier").attr("disabled", true);
        $("#type_of52_seq_b_3").change(function() {
            if ( $("#type_of52_seq_b_3").val() == "a"){
                $("#div_of52a_seq_b_3").show();
                $("#div_of52b_seq_b_3").hide();
                $("#div_of52c_seq_b_3").hide();
                $("#_180_of52a_party_identifier").attr("disabled", false);
                $("#_181_of52a_identifier_code").attr("disabled", false);
                $("#_183_of52b_party_identifier").attr("disabled", true);
                $("#_184_of52b_location").attr("disabled", true);
                $("#_185_of52c_party_identifier").attr("disabled", true);
            } else if ( $("#type_of52_seq_b_3").val() == "b"){
                $("#div_of52a_seq_b_3").hide();
                $("#div_of52b_seq_b_3").show();
                $("#div_of52c_seq_b_3").hide();
                $("#_180_of52a_party_identifier").attr("disabled", true);
                $("#_181_of52a_identifier_code").attr("disabled", true);
                $("#_183_of52b_party_identifier").attr("disabled", false);
                $("#_184_of52b_location").attr("disabled", false);
                $("#_185_of52c_party_identifier").attr("disabled", true);
            } else if ( $("#type_of52_seq_b_3").val() == "c"){
                $("#div_of52a_seq_b_3").hide();
                $("#div_of52b_seq_b_3").hide();
                $("#div_of52c_seq_b_3").show();
                $("#_180_of52a_party_identifier").attr("disabled", true);
                $("#_181_of52a_identifier_code").attr("disabled", true);
                $("#_183_of52b_party_identifier").attr("disabled", true);
                $("#_184_of52b_location").attr("disabled", true);
                $("#_185_of52c_party_identifier").attr("disabled", false);
            } else{
                $("#div_of52a_seq_b_3").hide();
                $("#div_of52b_seq_b_3").hide();
                $("#div_of52c_seq_b_3").hide();
                $("#_180_of52a_party_identifier").attr("disabled", true);
                $("#_181_of52a_identifier_code").attr("disabled", true);
                $("#_183_of52b_party_identifier").attr("disabled", true);
                $("#_184_of52b_location").attr("disabled", true);
                $("#_185_of52c_party_identifier").attr("disabled", true);
            }
        });

        //of57_a_c sequence b3
        $("#div_of57a_seq_b_3").hide();
        $("#div_of57c_seq_b_3").hide();
        $("#_190_of57a_party_identifier").attr("disabled", true);
        $("#_191_of57a_identifier_code").attr("disabled", true);
        $("#_193_of57c_party_identifier").attr("disabled", true);
        $("#type_of57_seq_b_3").change(function() {
            if ( $("#type_of57_seq_b_3").val() == "a"){
                $("#div_of57a_seq_b_3").show();
                $("#div_of57c_seq_b_3").hide();
                $("#_190_of57a_party_identifier").attr("disabled", false);
                $("#_191_of57a_identifier_code").attr("disabled", false);
                $("#_193_of57c_party_identifier").attr("disabled", true);
            } else if ( $("#type_of57_seq_b_3").val() == "c"){
                $("#div_of57a_seq_b_3").hide();
                $("#div_of57c_seq_b_3").show();
                $("#_190_of57a_party_identifier").attr("disabled", true);
                $("#_191_of57a_identifier_code").attr("disabled", true);
                $("#_193_of57c_party_identifier").attr("disabled", false);
            } else{
                $("#div_of57a_seq_b_3").hide();
                $("#div_of57c_seq_b_3").hide();
                $("#_190_of57a_party_identifier").attr("disabled", true);
                $("#_191_of57a_identifier_code").attr("disabled", true);
                $("#_193_of57c_party_identifier").attr("disabled", true);
            }
        });

        //mf59/59a sequence b3
        $("#div_mf59_seq_b_3").hide();
        $("#div_mf59a_seq_b_3").hide();
        $("#_200_mf59_account").attr("disabled", true);
        $("#_201_mf59_name_address").attr("disabled", true);
        $("#_202_mf59a_account").attr("disabled", true);
        $("#_203_mf59a_identifier_code").attr("disabled", true);
        $("#type_of59_59a_seq_b_3").change(function() {
            if ( $("#type_of59_59a_seq_b_3").val() == "59"){
                $("#div_mf59_seq_b_3").show();
                $("#div_mf59a_seq_b_3").hide();
                $("#_200_mf59_account").attr("disabled", false);
                $("#_201_mf59_name_address").attr("disabled", false);
                $("#_202_mf59a_account").attr("disabled", true);
                $("#_203_mf59a_identifier_code").attr("disabled", true);
            } else if ( $("#type_of59_59a_seq_b_3").val() == "59a"){
                $("#div_mf59_seq_b_3").hide();
                $("#div_mf59a_seq_b_3").show();
                $("#_200_mf59_account").attr("disabled", true);
                $("#_201_mf59_name_address").attr("disabled", true);
                $("#_202_mf59a_account").attr("disabled", false);
                $("#_203_mf59a_identifier_code").attr("disabled", false);
            } else{
                $("#div_mf59_seq_b_3").hide();
                $("#div_mf59a_seq_b_3").hide();
                $("#_200_mf59_account").attr("disabled", true);
                $("#_201_mf59_name_address").attr("disabled", true);
                $("#_202_mf59a_account").attr("disabled", true);
                $("#_203_mf59a_identifier_code").attr("disabled", true);
            }
        });
        
        //Mandatory Sequence C Settlement Details
        //of53_a_c
        $("#div_of53a_seq_c").hide();
        $("#div_of53c_seq_c").hide();
        $("#_310_of53a_party_identifier").attr("disabled", true);
        $("#_311_of53a_identifier_code").attr("disabled", true);
        $("#_313_of53c_account").attr("disabled", true);
        $("#type_of53_seq_c").change(function() {
            if ( $("#type_of53_seq_c").val() == "a"){
                $("#div_of53a_seq_c").show();
                $("#div_of53c_seq_c").hide();
                $("#_310_of53a_party_identifier").attr("disabled", false);
                $("#_311_of53a_identifier_code").attr("disabled", false);
                $("#_313_of53c_account").attr("disabled", true);
            } else if ( $("#type_of53_seq_c").val() == "c"){
                $("#div_of53a_seq_c").hide();
                $("#div_of53c_seq_c").show();
                $("#_310_of53a_party_identifier").attr("disabled", true);
                $("#_311_of53a_identifier_code").attr("disabled", true);
                $("#_313_of53c_account").attr("disabled", false);
            } else{
                $("#div_of53a_seq_c").hide();
                $("#div_of53c_seq_c").hide();
                $("#_310_of53a_party_identifier").attr("disabled", true);
                $("#_311_of53a_identifier_code").attr("disabled", true);
                $("#_313_of53c_account").attr("disabled", true);
            }
        });
    });
</script>

<!-- rule view -->
<script type="text/javascript">
    $(document).ready(function(){
         //of50_a_f_k sequence b
        if ($("#_050_of50a_account").val() != "" || $("#_051_of50a_identifier_code").val() != ""){
            $("#type_of50_seq_b").val("a").attr("selected",true);
            $("#div_of50a_seq_b").show();
            $("#_050_of50a_account").attr("disabled", false);
            $("#_051_of50a_identifier_code").attr("disabled", false);
            $("#div_of50f_seq_b").hide();
            $("#_053_of50f_party_identifier").attr("disabled", true);
            $("#_054_of50f_name_address").attr("disabled", true);
            $("#div_of50k_seq_b").hide();
            $("#_055_of50k_account").attr("disabled", true);
            $("#_056_of50k_name_address").attr("disabled", true);
        } else if ($("#_053_of50f_party_identifier").val() != "" || $("#_054_of50f_name_address").val() != ""){
            $("#type_of50_seq_b").val("f").attr("selected",true);
            $("#div_of50a_seq_b").hide();
            $("#_050_of50a_account").attr("disabled", true);
            $("#_051_of50a_identifier_code").attr("disabled", true);
            $("#div_of50f_seq_b").show();
            $("#_053_of50f_party_identifier").attr("disabled", false);
            $("#_054_of50f_name_address").attr("disabled", false);
            $("#div_of50k_seq_b").hide();
            $("#_055_of50k_account").attr("disabled", true);
            $("#_056_of50k_name_address").attr("disabled", true);
        } else if ($("#_055_of50k_account").val() != "" || $("#_056_of50k_name_address").val() != ""){
            $("#type_of50_seq_b").val("k").attr("selected",true);
            $("#div_of50a_seq_b").hide();
            $("#_050_of50a_account").attr("disabled", true);
            $("#_051_of50a_identifier_code").attr("disabled", true);
            $("#div_of50f_seq_b").hide();
            $("#_053_of50f_party_identifier").attr("disabled", true);
            $("#_054_of50f_name_address").attr("disabled", true);
            $("#div_of50k_seq_b").show();
            $("#_055_of50k_account").attr("disabled", false);
            $("#_056_of50k_name_address").attr("disabled", false);
        } else{
            $("#div_of50a_seq_b").hide();
            $("#div_of50f_seq_b").hide();
            $("#div_of50k_seq_b").hide();
            $("#_050_of50a_account").attr("disabled", true);
            $("#_051_of50a_identifier_code").attr("disabled", true);
            $("#_053_of50f_party_identifier").attr("disabled", true);
            $("#_054_of50f_name_address").attr("disabled", true);
            $("#_055_of50k_account").attr("disabled", true);
            $("#_056_of50k_name_address").attr("disabled", true);
        }

        //of52_a_b_c sequence b
        if ($("#_060_of52a_party_identifier").val() != "" || $("#_061_of52a_identifier_code").val() != ""){
            $("#type_of52_seq_b").val("a").attr("selected",true);
            $("#div_of52a_seq_b").show();
            $("#div_of52b_seq_b").hide();
            $("#div_of52c_seq_b").hide();
            $("#_060_of52a_party_identifier").attr("disabled", false);
            $("#_061_of52a_identifier_code").attr("disabled", false);
            $("#_063_of52b_party_identifier").attr("disabled", true);
            $("#_064_of52b_location").attr("disabled", true);
            $("#_065_of52c_party_identifier").attr("disabled", true);
        } else if ($("#_063_of52b_party_identifier").val() != "" || $("#_064_of52b_location").val() != ""){
            $("#type_of52_seq_b").val("b").attr("selected",true);
            $("#div_of52a_seq_b").hide();
            $("#div_of52b_seq_b").show();
            $("#div_of52c_seq_b").hide();
            $("#_060_of52a_party_identifier").attr("disabled", true);
            $("#_061_of52a_identifier_code").attr("disabled", true);
            $("#_063_of52b_party_identifier").attr("disabled", false);
            $("#_064_of52b_location").attr("disabled", false);
            $("#_065_of52c_party_identifier").attr("disabled", true);
        } else if ($("#_065_of52c_party_identifier").val() != ""){
            $("#type_of52_seq_b").val("c").attr("selected",true);
            $("#div_of52a_seq_b").hide();
            $("#div_of52b_seq_b").hide();
            $("#div_of52c_seq_b").show();
            $("#_060_of52a_party_identifier").attr("disabled", true);
            $("#_061_of52a_identifier_code").attr("disabled", true);
            $("#_063_of52b_party_identifier").attr("disabled", true);
            $("#_064_of52b_location").attr("disabled", true);
            $("#_065_of52c_party_identifier").attr("disabled", false);
        } else{
            $("#div_of52a_seq_b").hide();
            $("#div_of52b_seq_b").hide();
            $("#div_of52c_seq_b").hide();
            $("#_060_of52a_party_identifier").attr("disabled", true);
            $("#_061_of52a_identifier_code").attr("disabled", true);
            $("#_063_of52b_party_identifier").attr("disabled", true);
            $("#_064_of52b_location").attr("disabled", true);
            $("#_065_of52c_party_identifier").attr("disabled", true);
        }

        //of57_a_c sequence b
        if ($("#_070_of57a_party_identifier").val() != "" || $("#_071_of57a_identifier_code").val() != ""){
            $("#type_of57_seq_b").val("a").attr("selected",true);
            $("#div_of57a_seq_b").show();
            $("#div_of57c_seq_b").hide();
            $("#_070_of57a_party_identifier").attr("disabled", false);
            $("#_071_of57a_identifier_code").attr("disabled", false);
            $("#_073_of57c_party_identifier").attr("disabled", true);
        } else if ($("#_073_of57c_party_identifier").val() != ""){
            $("#type_of57_seq_b").val("c").attr("selected",true);
            $("#div_of57a_seq_b").hide();
            $("#div_of57c_seq_b").show();
            $("#_070_of57a_party_identifier").attr("disabled", true);
            $("#_071_of57a_identifier_code").attr("disabled", true);
            $("#_073_of57c_party_identifier").attr("disabled", false);
        } else{
            $("#div_of57a_seq_b").hide();
            $("#div_of57c_seq_b").hide();
            $("#_070_of57a_party_identifier").attr("disabled", true);
            $("#_071_of57a_identifier_code").attr("disabled", true);
            $("#_073_of57c_party_identifier").attr("disabled", true);
        }

        //mf59/59a sequence b
        if ($("#_080_mf59_account").val() != "" || $("#_081_mf59_name_address").val() != ""){
            $("#type_of59_59a_seq_b").val("59").attr("selected",true);
            $("#div_mf59_seq_b").show();
            $("#div_mf59a_seq_b").hide();
            $("#_080_mf59_account").attr("disabled", false);
            $("#_081_mf59_name_address").attr("disabled", false);
            $("#_082_mf59a_account").attr("disabled", true);
            $("#_083_mf59a_identifier_code").attr("disabled", true);
        } else if ($("#_082_mf59a_account").val() != "" || $("#_083_mf59a_identifier_code").val() != ""){
            $("#type_of59_59a_seq_b").val("59a").attr("selected",true);
            $("#div_mf59_seq_b").hide();
            $("#div_mf59a_seq_b").show();
            $("#_080_mf59_account").attr("disabled", true);
            $("#_081_mf59_name_address").attr("disabled", true);
            $("#_082_mf59a_account").attr("disabled", false);
            $("#_083_mf59a_identifier_code").attr("disabled", false);
        } else{
            $("#div_mf59_seq_b").hide();
            $("#div_mf59a_seq_b").hide();
            $("#_080_mf59_account").attr("disabled", true);
            $("#_081_mf59_name_address").attr("disabled", true);
            $("#_082_mf59a_account").attr("disabled", true);
            $("#_083_mf59a_identifier_code").attr("disabled", true);
        }

 //of50_a_f_k sequence b2
        if ($("#_110_of50a_account").val() != "" || $("#_111_of50a_identifier_code").val() != ""){
            $("#type_of50_seq_b_2").val("a").attr("selected",true);
            $("#div_of50a_seq_b_2").show();
            $("#_110_of50a_account").attr("disabled", false);
            $("#_111_of50a_identifier_code").attr("disabled", false);
            $("#div_of50f_seq_b_2").hide();
            $("#_113_of50f_party_identifier").attr("disabled", true);
            $("#_114_of50f_name_address").attr("disabled", true);
            $("#div_of50k_seq_b_2").hide();
            $("#_115_of50k_account").attr("disabled", true);
            $("#_116_of50k_name_address").attr("disabled", true);
        } else if ($("#_113_of50f_party_identifier").val() != "" || $("#_114_of50f_name_address").val() != ""){
            $("#type_of50_seq_b_2").val("f").attr("selected",true);
            $("#div_of50a_seq_b_2").hide();
            $("#_110_of50a_account").attr("disabled", true);
            $("#_111_of50a_identifier_code").attr("disabled", true);
            $("#div_of50f_seq_b_2").show();
            $("#_113_of50f_party_identifier").attr("disabled", false);
            $("#_114_of50f_name_address").attr("disabled", false);
            $("#div_of50k_seq_b_2").hide();
            $("#_115_of50k_account").attr("disabled", true);
            $("#_116_of50k_name_address").attr("disabled", true);
        } else if ($("#_115_of50k_account").val() != "" || $("#_116_of50k_name_address").val() != ""){
            $("#type_of50_seq_b_2").val("k").attr("selected",true);
            $("#div_of50a_seq_b_2").hide();
            $("#_110_of50a_account").attr("disabled", true);
            $("#_111_of50a_identifier_code").attr("disabled", true);
            $("#div_of50f_seq_b_2").hide();
            $("#_113_of50f_party_identifier").attr("disabled", true);
            $("#_114_of50f_name_address").attr("disabled", true);
            $("#div_of50k_seq_b_2").show();
            $("#_115_of50k_account").attr("disabled", false);
            $("#_116_of50k_name_address").attr("disabled", false);
        } else{
            $("#div_of50a_seq_b_2").hide();
            $("#div_of50f_seq_b_2").hide();
            $("#div_of50k_seq_b_2").hide();
            $("#_110_of50a_account").attr("disabled", true);
            $("#_111_of50a_identifier_code").attr("disabled", true);
            $("#_113_of50f_party_identifier").attr("disabled", true);
            $("#_114_of50f_name_address").attr("disabled", true);
            $("#_115_of50k_account").attr("disabled", true);
            $("#_116_of50k_name_address").attr("disabled", true);
        }

        //of52_a_b_c sequence b2
        if ($("#_120_of52a_party_identifier").val() != "" || $("#_121_of52a_identifier_code").val() != ""){
            $("#type_of52_seq_b_2").val("a").attr("selected",true);
            $("#div_of52a_seq_b_2").show();
            $("#div_of52b_seq_b_2").hide();
            $("#div_of52c_seq_b_2").hide();
            $("#_120_of52a_party_identifier").attr("disabled", false);
            $("#_121_of52a_identifier_code").attr("disabled", false);
            $("#_123_of52b_party_identifier").attr("disabled", true);
            $("#_124_of52b_location").attr("disabled", true);
            $("#_125_of52c_party_identifier").attr("disabled", true);
        } else if ($("#_123_of52b_party_identifier").val() != "" || $("#_124_of52b_location").val() != ""){
            $("#type_of52_seq_b_2").val("b").attr("selected",true);
            $("#div_of52a_seq_b_2").hide();
            $("#div_of52b_seq_b_2").show();
            $("#div_of52c_seq_b_2").hide();
            $("#_120_of52a_party_identifier").attr("disabled", true);
            $("#_121_of52a_identifier_code").attr("disabled", true);
            $("#_123_of52b_party_identifier").attr("disabled", false);
            $("#_124_of52b_location").attr("disabled", false);
            $("#_125_of52c_party_identifier").attr("disabled", true);
        } else if ($("#_125_of52c_party_identifier").val() != ""){
            $("#type_of52_seq_b_2").val("c").attr("selected",true);
            $("#div_of52a_seq_b_2").hide();
            $("#div_of52b_seq_b_2").hide();
            $("#div_of52c_seq_b_2").show();
            $("#_120_of52a_party_identifier").attr("disabled", true);
            $("#_121_of52a_identifier_code").attr("disabled", true);
            $("#_123_of52b_party_identifier").attr("disabled", true);
            $("#_124_of52b_location").attr("disabled", true);
            $("#_125_of52c_party_identifier").attr("disabled", false);
        } else{
            $("#div_of52a_seq_b_2").hide();
            $("#div_of52b_seq_b_2").hide();
            $("#div_of52c_seq_b_2").hide();
            $("#_120_of52a_party_identifier").attr("disabled", true);
            $("#_121_of52a_identifier_code").attr("disabled", true);
            $("#_123_of52b_party_identifier").attr("disabled", true);
            $("#_124_of52b_location").attr("disabled", true);
            $("#_125_of52c_party_identifier").attr("disabled", true);
        }

        //of57_a_c sequence b2
        if ($("#_130_of57a_party_identifier").val() != "" || $("#_131_of57a_identifier_code").val() != ""){
            $("#type_of57_seq_b_2").val("a").attr("selected",true);
            $("#div_of57a_seq_b_2").show();
            $("#div_of57c_seq_b_2").hide();
            $("#_130_of57a_party_identifier").attr("disabled", false);
            $("#_131_of57a_identifier_code").attr("disabled", false);
            $("#_133_of57c_party_identifier").attr("disabled", true);
        } else if ($("#_133_of57c_party_identifier").val() != ""){
            $("#type_of57_seq_b_2").val("c").attr("selected",true);
            $("#div_of57a_seq_b_2").hide();
            $("#div_of57c_seq_b_2").show();
            $("#_130_of57a_party_identifier").attr("disabled", true);
            $("#_131_of57a_identifier_code").attr("disabled", true);
            $("#_133_of57c_party_identifier").attr("disabled", false);
        } else{
            $("#div_of57a_seq_b_2").hide();
            $("#div_of57c_seq_b_2").hide();
            $("#_130_of57a_party_identifier").attr("disabled", true);
            $("#_131_of57a_identifier_code").attr("disabled", true);
            $("#_133_of57c_party_identifier").attr("disabled", true);
        }

        //mf59/59a sequence b2
        if ($("#_140_mf59_account").val() != "" || $("#_141_mf59_name_address").val() != ""){
            $("#type_of59_59a_seq_b_2").val("59").attr("selected",true);
            $("#div_mf59_seq_b_2").show();
            $("#div_mf59a_seq_b_2").hide();
            $("#_140_mf59_account").attr("disabled", false);
            $("#_141_mf59_name_address").attr("disabled", false);
            $("#_142_mf59a_account").attr("disabled", true);
            $("#_143_mf59a_identifier_code").attr("disabled", true);
        } else if ($("#_142_mf59a_account").val() != "" || $("#_143_mf59a_identifier_code").val() != ""){
            $("#type_of59_59a_seq_b_2").val("59a").attr("selected",true);
            $("#div_mf59_seq_b_2").hide();
            $("#div_mf59a_seq_b_2").show();
            $("#_140_mf59_account").attr("disabled", true);
            $("#_141_mf59_name_address").attr("disabled", true);
            $("#_142_mf59a_account").attr("disabled", false);
            $("#_143_mf59a_identifier_code").attr("disabled", false);
        } else{
            $("#div_mf59_seq_b_2").hide();
            $("#div_mf59a_seq_b_2").hide();
            $("#_140_mf59_account").attr("disabled", true);
            $("#_141_mf59_name_address").attr("disabled", true);
            $("#_142_mf59a_account").attr("disabled", true);
            $("#_143_mf59a_identifier_code").attr("disabled", true);
        }

 //of50_a_f_k sequence b3
        if ($("#_170_of50a_account").val() != "" || $("#_171_of50a_identifier_code").val() != ""){
            $("#type_of50_seq_b_3").val("a").attr("selected",true);
            $("#div_of50a_seq_b_3").show();
            $("#_170_of50a_account").attr("disabled", false);
            $("#_171_of50a_identifier_code").attr("disabled", false);
            $("#div_of50f_seq_b_3").hide();
            $("#_173_of50f_party_identifier").attr("disabled", true);
            $("#_174_of50f_name_address").attr("disabled", true);
            $("#div_of50k_seq_b_3").hide();
            $("#_175_of50k_account").attr("disabled", true);
            $("#_176_of50k_name_address").attr("disabled", true);
        } else if ($("#_173_of50f_party_identifier").val() != "" || $("#_174_of50f_name_address").val() != ""){
            $("#type_of50_seq_b_3").val("f").attr("selected",true);
            $("#div_of50a_seq_b_3").hide();
            $("#_170_of50a_account").attr("disabled", true);
            $("#_171_of50a_identifier_code").attr("disabled", true);
            $("#div_of50f_seq_b_3").show();
            $("#_173_of50f_party_identifier").attr("disabled", false);
            $("#_174_of50f_name_address").attr("disabled", false);
            $("#div_of50k_seq_b_3").hide();
            $("#_175_of50k_account").attr("disabled", true);
            $("#_176_of50k_name_address").attr("disabled", true);
        } else if ($("#_175_of50k_account").val() != "" || $("#_176_of50k_name_address").val() != ""){
            $("#type_of50_seq_b_3").val("k").attr("selected",true);
            $("#div_of50a_seq_b_3").hide();
            $("#_170_of50a_account").attr("disabled", true);
            $("#_171_of50a_identifier_code").attr("disabled", true);
            $("#div_of50f_seq_b_3").hide();
            $("#_173_of50f_party_identifier").attr("disabled", true);
            $("#_174_of50f_name_address").attr("disabled", true);
            $("#div_of50k_seq_b_3").show();
            $("#_175_of50k_account").attr("disabled", false);
            $("#_176_of50k_name_address").attr("disabled", false);
        } else{
            $("#div_of50a_seq_b_3").hide();
            $("#div_of50f_seq_b_3").hide();
            $("#div_of50k_seq_b_3").hide();
            $("#_170_of50a_account").attr("disabled", true);
            $("#_171_of50a_identifier_code").attr("disabled", true);
            $("#_173_of50f_party_identifier").attr("disabled", true);
            $("#_174_of50f_name_address").attr("disabled", true);
            $("#_175_of50k_account").attr("disabled", true);
            $("#_176_of50k_name_address").attr("disabled", true);
        }

        //of52_a_b_c sequence b3
        if ($("#_180_of52a_party_identifier").val() != "" || $("#_181_of52a_identifier_code").val() != ""){
            $("#type_of52_seq_b_3").val("a").attr("selected",true);
            $("#div_of52a_seq_b_3").show();
            $("#div_of52b_seq_b_3").hide();
            $("#div_of52c_seq_b_3").hide();
            $("#_180_of52a_party_identifier").attr("disabled", false);
            $("#_181_of52a_identifier_code").attr("disabled", false);
            $("#_183_of52b_party_identifier").attr("disabled", true);
            $("#_184_of52b_location").attr("disabled", true);
            $("#_185_of52c_party_identifier").attr("disabled", true);
        } else if ($("#_183_of52b_party_identifier").val() != "" || $("#_184_of52b_location").val() != ""){
            $("#type_of52_seq_b_3").val("b").attr("selected",true);
            $("#div_of52a_seq_b_3").hide();
            $("#div_of52b_seq_b_3").show();
            $("#div_of52c_seq_b_3").hide();
            $("#_180_of52a_party_identifier").attr("disabled", true);
            $("#_181_of52a_identifier_code").attr("disabled", true);
            $("#_183_of52b_party_identifier").attr("disabled", false);
            $("#_184_of52b_location").attr("disabled", false);
            $("#_185_of52c_party_identifier").attr("disabled", true);
        } else if ($("#_185_of52c_party_identifier").val() != ""){
            $("#type_of52_seq_b_3").val("c").attr("selected",true);
            $("#div_of52a_seq_b_3").hide();
            $("#div_of52b_seq_b_3").hide();
            $("#div_of52c_seq_b_3").show();
            $("#_180_of52a_party_identifier").attr("disabled", true);
            $("#_181_of52a_identifier_code").attr("disabled", true);
            $("#_183_of52b_party_identifier").attr("disabled", true);
            $("#_184_of52b_location").attr("disabled", true);
            $("#_185_of52c_party_identifier").attr("disabled", false);
        } else{
            $("#div_of52a_seq_b_3").hide();
            $("#div_of52b_seq_b_3").hide();
            $("#div_of52c_seq_b_3").hide();
            $("#_180_of52a_party_identifier").attr("disabled", true);
            $("#_181_of52a_identifier_code").attr("disabled", true);
            $("#_183_of52b_party_identifier").attr("disabled", true);
            $("#_184_of52b_location").attr("disabled", true);
            $("#_185_of52c_party_identifier").attr("disabled", true);
        }

        //of57_a_c sequence b3
        if ($("#_190_of57a_party_identifier").val() != "" || $("#_191_of57a_identifier_code").val() != ""){
            $("#type_of57_seq_b_3").val("a").attr("selected",true);
            $("#div_of57a_seq_b_3").show();
            $("#div_of57c_seq_b_3").hide();
            $("#_190_of57a_party_identifier").attr("disabled", false);
            $("#_191_of57a_identifier_code").attr("disabled", false);
            $("#_193_of57c_party_identifier").attr("disabled", true);
        } else if ($("#_193_of57c_party_identifier").val() != ""){
            $("#type_of57_seq_b_3").val("c").attr("selected",true);
            $("#div_of57a_seq_b_3").hide();
            $("#div_of57c_seq_b_3").show();
            $("#_190_of57a_party_identifier").attr("disabled", true);
            $("#_191_of57a_identifier_code").attr("disabled", true);
            $("#_193_of57c_party_identifier").attr("disabled", false);
        } else{
            $("#div_of57a_seq_b_3").hide();
            $("#div_of57c_seq_b_3").hide();
            $("#_190_of57a_party_identifier").attr("disabled", true);
            $("#_191_of57a_identifier_code").attr("disabled", true);
            $("#_193_of57c_party_identifier").attr("disabled", true);
        }

        //mf59/59a sequence b3
        if ($("#_200_mf59_account").val() != "" || $("#_201_mf59_name_address").val() != ""){
            $("#type_of59_59a_seq_b_3").val("59").attr("selected",true);
            $("#div_mf59_seq_b_3").show();
            $("#div_mf59a_seq_b_3").hide();
            $("#_200_mf59_account").attr("disabled", false);
            $("#_201_mf59_name_address").attr("disabled", false);
            $("#_202_mf59a_account").attr("disabled", true);
            $("#_203_mf59a_identifier_code").attr("disabled", true);
        } else if ($("#_202_mf59a_account").val() != "" || $("#_203_mf59a_identifier_code").val() != ""){
            $("#type_of59_59a_seq_b_3").val("59a").attr("selected",true);
            $("#div_mf59_seq_b_3").hide();
            $("#div_mf59a_seq_b_3").show();
            $("#_200_mf59_account").attr("disabled", true);
            $("#_201_mf59_name_address").attr("disabled", true);
            $("#_202_mf59a_account").attr("disabled", false);
            $("#_203_mf59a_identifier_code").attr("disabled", false);
        } else{
            $("#div_mf59_seq_b_3").hide();
            $("#div_mf59a_seq_b_3").hide();
            $("#_200_mf59_account").attr("disabled", true);
            $("#_201_mf59_name_address").attr("disabled", true);
            $("#_202_mf59a_account").attr("disabled", true);
            $("#_203_mf59a_identifier_code").attr("disabled", true);
        }

        //Mandatory Sequence C Settlement Details
        //of53_a_c
        if ($("#_310_of53a_party_identifier").val() != "" || $("#_311_of53a_identifier_code").val() != ""){
            $("#type_of53_seq_c").val("a").attr("selected",true);
            $("#div_of53a_seq_c").show();
            $("#div_of53c_seq_c").hide();
            $("#_310_of53a_party_identifier").attr("disabled", false);
            $("#_311_of53a_identifier_code").attr("disabled", false);
            $("#_313_of53c_account").attr("disabled", true);
        } else if ($("#_313_of53c_account").val() != ""){
            $("#type_of53_seq_c").val("c").attr("selected",true);
            $("#div_of53a_seq_c").hide();
            $("#div_of53c_seq_c").show();
            $("#_310_of53a_party_identifier").attr("disabled", true);
            $("#_311_of53a_identifier_code").attr("disabled", true);
            $("#_313_of53c_account").attr("disabled", false);
        } else{
            $("#div_of53a_seq_c").hide();
            $("#div_of53c_seq_c").hide();
            $("#_310_of53a_party_identifier").attr("disabled", true);
            $("#_311_of53a_identifier_code").attr("disabled", true);
            $("#_313_of53c_account").attr("disabled", true);
        }

    });
</script>
