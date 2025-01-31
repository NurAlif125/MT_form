<%-- 
    Document   : validate_rule_mt202
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
                _010_mf20_sender_reference: "required",
                _020_mf21_receiver_reference: "required",
                _040_mf30_date_of_message_being_acknowledge: "required",
                
                //of25
//                _030_of25_account_identification: {
//                    required: function(element) {
//                      return ($("#_030_of25_account_identification").val() == "" && $("#type_of57_request_confirmation_party").val() == "")
//                             || ($("#_030_of25_account_identification").val() != "" && $("#type_of57_request_confirmation_party").val() != "");
//                    }
//                },
                
                //of32
                type_of32a_amount_of_charges: {
                    required: function(element) {
                      return $("#type_of57_request_confirmation_party").val() != "" && $("#type_of32a_amount_of_charges").val() == "d";
                    }
                },
                
            },
     messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sender_reference: {required: "sender reference harus diisi..!!"},
                _020_mf21_receiver_reference: {required: "receiver_reference harus diisi..!!"},
                _040_mf30_date_of_message_being_acknowledge: {required: "date of message being acknowledge harus diisi..!!"},
//                _030_of25_account_identification: {required: "isi salah satu antara of25 atau of57..!!"},
                type_of32a_amount_of_charges: {required: "kosongkan of57 jika of32 = D..!!"},
             
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
        //of13c
        $("#div_of13c_").hide();
        $("#_022_of13c_code").attr("disabled", true);
        $("#_020_of13c_add").click(function() {
            $("#div_of13c_").show();
            $("#_022_of13c_code").attr("disabled", false);
        });
        $("#_021_of13c_remove").click(function() {
            $("#div_of13c_").hide();
            $("#_022_of13c_code").attr("disabled", true);
        });

        //of52_a_d
        $("#div_mf32b_").hide();
        $("#div_mf32d_").hide();
        $("#_051_of32b_currency").attr("disabled", true);
        $("#_052_of32b_amount").attr("disabled", true);
        $("#_053_of32d_date").attr("disabled", true);
        $("#_054_of32d_currency").attr("disabled", true);
        $("#_055_of32d_amount").attr("disabled", true);
        $("#type_of32a_amount_of_charges").change(function() {
            if ( $("#type_of32a_amount_of_charges").val() == "b"){
                $("#div_mf32b_").show();
                $("#div_mf32d_").hide();
                $("#_051_of32b_currency").attr("disabled", false);
                $("#_052_of32b_amount").attr("disabled", false);
                $("#_053_of32d_date").attr("disabled", true);
                $("#_054_of32d_currency").attr("disabled", true);
                $("#_055_of32d_amount").attr("disabled", true);
            } else if ( $("#type_of32a_amount_of_charges").val() == "d"){
                $("#div_mf32b_").hide();
                $("#div_mf32d_").show();
                 $("#_051_of32b_currency").attr("disabled", true);
                $("#_052_of32b_amount").attr("disabled", true);
                $("#_053_of32d_date").attr("disabled", false);
                $("#_054_of32d_currency").attr("disabled", false);
                $("#_055_of32d_amount").attr("disabled", false);
            } else{
                $("#div_mf32b_").hide();
                $("#div_mf32d_").hide();
                $("#_051_of32b_currency").attr("disabled", true);
                $("#_052_of32b_amount").attr("disabled", true);
                $("#_053_of32d_date").attr("disabled", true);
                $("#_054_of32d_currency").attr("disabled", true);
                $("#_055_of32d_amount").attr("disabled", true);
            }
        });

        //of57a_d
        $("#div_of57a").hide();
        $("#div_of57d").hide();
        $("#_061_of57a_party_identifier").attr("disabled", true);
        $("#_062_of57a_identifier_code").attr("disabled", true);
        $("#_063_of57d_party_identifier").attr("disabled", true);
        $("#_064_of57d_name_and_address").attr("disabled", true);
        $("#type_of57_request_confirmation_party").change(function() {
            if ( $("#type_of57_request_confirmation_party").val() == "a"){
                $("#div_of57a").show();
                $("#div_of57d").hide();
                $("#_061_of57a_party_identifier").attr("disabled", false);
                $("#_062_of57a_identifier_code").attr("disabled", false);
                $("#_063_of57d_party_identifier").attr("disabled", true);
                $("#_064_of57d_name_and_address").attr("disabled", true);
            } else if ( $("#type_of57_request_confirmation_party").val() == "d"){
                $("#div_of57a").hide();
                $("#div_of57d").show();
                $("#_061_of57a_party_identifier").attr("disabled", true);
                $("#_062_of57a_identifier_code").attr("disabled", true);
                $("#_063_of57d_party_identifier").attr("disabled", false);
                $("#_064_of57d_name_and_address").attr("disabled", false);
            } else{
                $("#div_of57a").hide();
                $("#div_of57d").hide();
                $("#_061_of57a_party_identifier").attr("disabled", true);
                $("#_062_of57a_identifier_code").attr("disabled", true);
                $("#_063_of57d_party_identifier").attr("disabled", true);
                $("#_064_of57d_name_and_address").attr("disabled", true);
            }
        });
     
    });
</script>

<!-- rule view -->
<script type="text/javascript">
    $(document).ready(function(){
        //of13c
        if ($("#_022_of13c_code").val() != ""){
            $("#div_of13c_").show();
            $("#_022_of13c_code").attr("disabled", false);
        }else{
            $("#div_of13c_").hide();
            $("#_022_of13c_code").attr("disabled", true);
        }

        //of52_a_d
        if ($("#_051_of32b_currency").val() != "" || $("#_052_of32b_amount").val() != ""){
            $("#type_of32a_amount_of_charges").val("b").attr("selected",true);
            $("#div_mf32b_").show();
            $("#div_mf32d_").hide();
            $("#_051_of32b_currency").attr("disabled", false);
            $("#_052_of32b_amount").attr("disabled", false);
            $("#_053_of32d_date").attr("disabled", true);
            $("#_054_of32d_currency").attr("disabled", true);
            $("#_055_of32d_amount").attr("disabled", true);
        } else if ($("#_053_of32d_date").val() != "" || $("#_054_of32d_currency").val() != "" || $("#_055_of32d_amount").val() != "" ){
            $("#type_of32a_amount_of_charges").val("d").attr("selected",true);
            $("#div_mf32b_").hide();
            $("#div_mf32d_").show();
            $("#_051_of32b_currency").attr("disabled", true);
            $("#_052_of32b_amount").attr("disabled", true);
            $("#_053_of32d_date").attr("disabled", false);
            $("#_054_of32d_currency").attr("disabled", false);
            $("#_055_of32d_amount").attr("disabled", false);
        } else{
            $("#div_mf32b_").hide();
            $("#div_mf32d_").hide();
            $("#_051_of32b_currency").attr("disabled", true);
            $("#_052_of32b_amount").attr("disabled", true);
            $("#_053_of32d_date").attr("disabled", true);
            $("#_054_of32d_currency").attr("disabled", true);
            $("#_055_of32d_amount").attr("disabled", true);
        }

      

        //of58_a_d
        if ($("#_061_of57a_party_identifier").val() != "" || $("#_062_of57a_identifier_code").val() != ""){
            $("#type_of57_request_confirmation_party").val("a").attr("selected",true);
            $("#div_of57a").show();
            $("#div_of57d").hide();
            $("#_061_of57a_party_identifier").attr("disabled", false);
            $("#_062_of57a_identifier_code").attr("disabled", false);
            $("#_063_of57d_party_identifier").attr("disabled", true);
            $("#_064_of57d_name_and_address").attr("disabled", true);
        } else if ($("#_063_of57d_party_identifier").val() != "" || $("#_064_of57d_name_and_address").val() != ""){
            $("#type_of57_request_confirmation_party").val("d").attr("selected",true);
            $("#div_of57a").hide();
            $("#div_of57d").show();
            $("#_061_of57a_party_identifier").attr("disabled", true);
            $("#_062_of57a_identifier_code").attr("disabled", true);
            $("#_063_of57d_party_identifier").attr("disabled", false);
            $("#_064_of57d_name_and_address").attr("disabled", false);
        } else{
            $("#div_of57a").hide();
            $("#div_of57d").hide();
            $("#_061_of57a_party_identifier").attr("disabled", true);
            $("#_062_of57a_identifier_code").attr("disabled", true);
            $("#_063_of57d_party_identifier").attr("disabled", true);
            $("#_064_of57d_name_and_address").attr("disabled", true);
        }

    });
</script>
