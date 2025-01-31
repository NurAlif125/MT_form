<%-- 
    Document   : mt752
    Created on : Jul 23, 2018
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
                _010_mf20_sender_reference: "required",

                //mf21
                _020_mf21_presenting_bank_reference: "required",

                //mf32b
                _030_mf32b_total_amount_claimed_currency: "required",
                _031_mf32b_amount: "required",

                //mf33a
                _040_mf33a_amount_reimbursed_date: "required",
                _041_mf33a_currency: "required",
                _042_mf33a_amount: "required"

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sender_reference: {required: "mf20_sender_reference harus diisi..!!"},
                _020_mf21_presenting_bank_reference: {required: "mf21_presenting_bank_reference harus diisi..!!"},
                _030_mf32b_total_amount_claimed_currency: {required: "mf32b_total_amount_claimed_currency harus diisi..!!"},
                _031_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                _040_mf33a_amount_reimbursed_date: {required: "mf33a_amount_reimbursed_date harus diisi..!!"},
                _041_mf33a_currency: {required: "mf33a_currency harus diisi..!!"},
                _042_mf33a_amount: {required: "mf33a_amount harus diisi..!!"}
                
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

        //OF53_a_b_d
        $("#div_of53a_").hide();
        $("#div_of53b_").hide();
        $("#div_of53d_").hide();
        $("#_050_of53a_party_identifier").attr("disabled", true);
        $("#_051_of53a_identifier_code").attr("disabled", true);
        $("#_052_of53b_party_identifier").attr("disabled", true);
        $("#_053_of53b_location").attr("disabled", true);
        $("#_054_of53d_party_identifier").attr("disabled", true);
        $("#_055_of53d_name_address").attr("disabled", true);
        $("#type_of53_sender_correspondent").change(function() {
            if ( $("#type_of53_sender_correspondent").val() == "a"){
                $("#div_of53a_").show();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_050_of53a_party_identifier").attr("disabled", false);
                $("#_051_of53a_identifier_code").attr("disabled", false);
                $("#_052_of53b_party_identifier").attr("disabled", true);
                $("#_053_of53b_location").attr("disabled", true);
                $("#_054_of53d_party_identifier").attr("disabled", true);
                $("#_055_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_sender_correspondent").val() == "b"){
                $("#div_of53a_").hide();
                $("#div_of53b_").show();
                $("#div_of53d_").hide();
                $("#_050_of53a_party_identifier").attr("disabled", true);
                $("#_051_of53a_identifier_code").attr("disabled", true);
                $("#_052_of53b_party_identifier").attr("disabled", false);
                $("#_053_of53b_location").attr("disabled", false);
                $("#_054_of53d_party_identifier").attr("disabled", true);
                $("#_055_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_sender_correspondent").val() == "d"){
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").show();
                $("#_050_of53a_party_identifier").attr("disabled", true);
                $("#_051_of53a_identifier_code").attr("disabled", true);
                $("#_052_of53b_party_identifier").attr("disabled", true);
                $("#_053_of53b_location").attr("disabled", true);
                $("#_054_of53d_party_identifier").attr("disabled", false);
                $("#_055_of53d_name_address").attr("disabled", false);
            } else{
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_050_of53a_party_identifier").attr("disabled", true);
                $("#_051_of53a_identifier_code").attr("disabled", true);
                $("#_052_of53b_party_identifier").attr("disabled", true);
                $("#_053_of53b_location").attr("disabled", true);
                $("#_054_of53d_party_identifier").attr("disabled", true);
                $("#_055_of53d_name_address").attr("disabled", true);
            }
        });
        
        //OF54_a_b_d
        $("#div_of54a_").hide();
        $("#div_of54b_").hide();
        $("#div_of54d_").hide();
        $("#_060_of54a_party_identifier").attr("disabled", true);
        $("#_061_of54a_identifier_code").attr("disabled", true);
        $("#_062_of54b_party_identifier").attr("disabled", true);
        $("#_063_of54b_location").attr("disabled", true);
        $("#_064_of54d_party_identifier").attr("disabled", true);
        $("#_065_of54d_name_address").attr("disabled", true);
        $("#type_of54_receiver_correspondent").change(function() {
            if ( $("#type_of54_receiver_correspondent").val() == "a"){
                $("#div_of54a_").show();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_060_of54a_party_identifier").attr("disabled", false);
                $("#_061_of54a_identifier_code").attr("disabled", false);
                $("#_062_of54b_party_identifier").attr("disabled", true);
                $("#_063_of54b_location").attr("disabled", true);
                $("#_064_of54d_party_identifier").attr("disabled", true);
                $("#_065_of54d_name_address").attr("disabled", true);
            } else if ( $("#type_of54_receiver_correspondent").val() == "b"){
                $("#div_of54a_").hide();
                $("#div_of54b_").show();
                $("#div_of54d_").hide();
                $("#_060_of54a_party_identifier").attr("disabled", true);
                $("#_061_of54a_identifier_code").attr("disabled", true);
                $("#_062_of54b_party_identifier").attr("disabled", false);
                $("#_063_of54b_location").attr("disabled", false);
                $("#_064_of54d_party_identifier").attr("disabled", true);
                $("#_065_of54d_name_address").attr("disabled", true);
            } else if ( $("#type_of54_receiver_correspondent").val() == "d"){
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").show();
                $("#_060_of54a_party_identifier").attr("disabled", true);
                $("#_061_of54a_identifier_code").attr("disabled", true);
                $("#_062_of54b_party_identifier").attr("disabled", true);
                $("#_063_of54b_location").attr("disabled", true);
                $("#_064_of54d_party_identifier").attr("disabled", false);
                $("#_065_of54d_name_address").attr("disabled", false);
            } else{
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_060_of54a_party_identifier").attr("disabled", true);
                $("#_061_of54a_identifier_code").attr("disabled", true);
                $("#_062_of54b_party_identifier").attr("disabled", true);
                $("#_063_of54b_location").attr("disabled", true);
                $("#_064_of54d_party_identifier").attr("disabled", true);
                $("#_065_of54d_name_address").attr("disabled", true);
            }
        });

    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF53_a_b_d
        if ($("#_050_of53a_party_identifier").val() != "" || $("#_051_of53a_identifier_code").val() != ""){
            $("#type_of53_sender_correspondent").val("a").attr("selected",true);
            $("#div_of53a_").show();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_050_of53a_party_identifier").attr("disabled", false);
            $("#_051_of53a_identifier_code").attr("disabled", false);
            $("#_052_of53b_party_identifier").attr("disabled", true);
            $("#_053_of53b_location").attr("disabled", true);
            $("#_054_of53d_party_identifier").attr("disabled", true);
            $("#_055_of53d_name_address").attr("disabled", true);
        } else if ($("#_052_of53b_party_identifier").val() != "" || $("#_053_of53b_location").val() != ""){
            $("#type_of53_sender_correspondent").val("b").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").show();
            $("#div_of53d_").hide();
            $("#_050_of53a_party_identifier").attr("disabled", true);
            $("#_051_of53a_identifier_code").attr("disabled", true);
            $("#_052_of53b_party_identifier").attr("disabled", false);
            $("#_053_of53b_location").attr("disabled", false);
            $("#_054_of53d_party_identifier").attr("disabled", true);
            $("#_055_of53d_name_address").attr("disabled", true);
        } else if ($("#_054_of53d_party_identifier").val() != "" || $("#_055_of53d_name_address").val() != ""){
            $("#type_of53_sender_correspondent").val("d").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").show();
            $("#_050_of53a_party_identifier").attr("disabled", true);
            $("#_051_of53a_identifier_code").attr("disabled", true);
            $("#_052_of53b_party_identifier").attr("disabled", true);
            $("#_053_of53b_location").attr("disabled", true);
            $("#_054_of53d_party_identifier").attr("disabled", false);
            $("#_055_of53d_name_address").attr("disabled", false);
        } else{
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_050_of53a_party_identifier").attr("disabled", true);
            $("#_051_of53a_identifier_code").attr("disabled", true);
            $("#_052_of53b_party_identifier").attr("disabled", true);
            $("#_053_of53b_location").attr("disabled", true);
            $("#_054_of53d_party_identifier").attr("disabled", true);
            $("#_055_of53d_name_address").attr("disabled", true);
        }
        
        //OF54_a_b_d
        if ($("#_060_of54a_party_identifier").val() != "" || $("#_061_of54a_identifier_code").val() != ""){
            $("#type_of54_receiver_correspondent").val("a").attr("selected",true);
            $("#div_of54a_").show();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_060_of54a_party_identifier").attr("disabled", false);
            $("#_061_of54a_identifier_code").attr("disabled", false);
            $("#_062_of54b_party_identifier").attr("disabled", true);
            $("#_063_of54b_location").attr("disabled", true);
            $("#_064_of54d_party_identifier").attr("disabled", true);
            $("#_065_of54d_name_address").attr("disabled", true);
        } else if ($("#_062_of54b_party_identifier").val() != "" || $("#_063_of54b_location").val() != ""){
            $("#type_of54_receiver_correspondent").val("b").attr("selected",true);
            $("#div_of54a_").hide();
            $("#div_of54b_").show();
            $("#div_of54d_").hide();
            $("#_060_of54a_party_identifier").attr("disabled", true);
            $("#_061_of54a_identifier_code").attr("disabled", true);
            $("#_062_of54b_party_identifier").attr("disabled", false);
            $("#_063_of54b_location").attr("disabled", false);
            $("#_064_of54d_party_identifier").attr("disabled", true);
            $("#_065_of54d_name_address").attr("disabled", true);
        } else if ($("#_064_of54d_party_identifier").val() != "" || $("#_065_of54d_name_address").val() != ""){
            $("#type_of54_receiver_correspondent").val("d").attr("selected",true);
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").show();
            $("#_060_of54a_party_identifier").attr("disabled", true);
            $("#_061_of54a_identifier_code").attr("disabled", true);
            $("#_062_of54b_party_identifier").attr("disabled", true);
            $("#_063_of54b_location").attr("disabled", true);
            $("#_064_of54d_party_identifier").attr("disabled", false);
            $("#_065_of54d_name_address").attr("disabled", false);
        } else{
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_060_of54a_party_identifier").attr("disabled", true);
            $("#_061_of54a_identifier_code").attr("disabled", true);
            $("#_062_of54b_party_identifier").attr("disabled", true);
            $("#_063_of54b_location").attr("disabled", true);
            $("#_064_of54d_party_identifier").attr("disabled", true);
            $("#_065_of54d_name_address").attr("disabled", true);
        }

    });
</script>